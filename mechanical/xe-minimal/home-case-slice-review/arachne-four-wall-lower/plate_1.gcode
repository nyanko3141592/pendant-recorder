; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 15m 46s; total estimated time: 16m 5s
; total layer number: 99
; total filament length [mm] : 549.96
; total filament volume [cm^3] : 1322.82
; total filament weight [g] : 1.64
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
G1 X78.566 Y76.866 F42000
M204 S6000
G1 Z.4
G1 Z.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.499999
G1 F3000
M204 S500
G1 X101.432 Y76.867 E1.14758
G1 X101.432 Y103.132 E1.31816
G1 X78.566 Y103.134 E1.14758
M73 P2 R15
G1 X78.566 Y82.475 E1.03681
G1 X78.709 Y82.614 E.01003
G1 X79.221 Y82.944 E.03058
G1 X79.416 Y83.021 E.0105
G1 X80.016 Y83.126 E.03058
G1 X80.568 Y83.074 E.02781
G1 X81.199 Y82.799 E.03455
G1 X81.441 Y82.61 E.01542
G1 X81.827 Y82.143 E.03041
G1 X82.031 Y81.723 E.02344
G1 X82.134 Y81.194 E.02704
G1 X82.109 Y80.76 E.0218
G1 X81.972 Y80.249 E.02655
G1 X81.786 Y79.929 E.01857
G1 X81.374 Y79.458 E.03143
G1 X80.796 Y79.14 E.03311
G1 X80.277 Y79.007 E.02687
G1 X79.816 Y79.014 E.02314
G1 X79.329 Y79.148 E.02534
G1 X78.707 Y79.518 E.03631
G1 X78.566 Y79.655 E.0099
G1 X78.566 Y76.926 E.13698
M204 S6000
G1 X78.225 Y76.509 F42000
G1 F3000
M204 S500
G1 X78.455 Y76.426 E.01228
G1 X101.523 Y76.427 E1.15768
G1 X101.669 Y76.446 E.00743
G1 X101.817 Y76.556 E.00923
G1 X101.872 Y76.775 E.01135
G1 X101.872 Y103.225 E1.32739
G3 X101.756 Y103.51 I-.39 J.008 E.01591
G1 X101.559 Y103.572 E.01037
G1 X78.49 Y103.574 E1.15772
G3 X78.21 Y103.477 I-.011 J-.42 E.01524
G1 X78.126 Y103.265 E.01141
G1 X78.12 Y81.68 E1.08326
; LINE_WIDTH: 0.487189
G1 X78.097 Y80.96 E.03511
; LINE_WIDTH: 0.471159
G1 X78.112 Y80.705 E.01198
; LINE_WIDTH: 0.499999
G1 X78.126 Y80.45 E.01283
G1 X78.126 Y76.79 E.18365
G3 X78.185 Y76.554 I.326 J-.044 E.01252
M204 S6000
G1 X77.87 Y76.231 F42000
G1 F3000
M204 S500
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
G1 X77.763 Y103.603 E.01693
G1 X77.686 Y103.279 E.0167
G1 X77.686 Y76.79 E1.32935
G1 X77.712 Y76.528 E.01324
G1 X77.842 Y76.284 E.01387
M204 S6000
G1 X77.492 Y76.019 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X77.545 Y75.929 E.00525
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
G1 X77.563 Y104.09 E.01884
G1 X77.36 Y103.792 E.01808
G1 X77.246 Y103.292 E.02573
G1 X77.246 Y76.714 E1.33386
G1 X77.332 Y76.292 E.02164
G1 X77.461 Y76.071 E.01285
; WIPE_START
G1 X77.545 Y75.929 E-.06253
G1 X77.806 Y75.714 E-.12848
G1 X78.183 Y75.569 E-.15359
G1 X78.412 Y75.546 E-.08726
G1 X79.275 Y75.546 E-.32814
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X78.75 Y81.983 Z.68 F42000
G1 Z.28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X78.618 Y81.791 E.01171
G1 X78.491 Y81.356 E.02274
; LINE_WIDTH: 0.451899
G1 X78.479 Y80.96 E.01771
; LINE_WIDTH: 0.471159
G1 X78.508 Y80.746 E.0101
; LINE_WIDTH: 0.499999
G3 X78.618 Y80.339 I.805 J0 E.02142
G1 X78.864 Y79.979 E.02187
G1 X79.014 Y79.832 E.01055
G1 X79.459 Y79.569 E.02594
G1 X79.885 Y79.449 E.02222
G1 X80.244 Y79.446 E.01803
G1 X80.615 Y79.541 E.0192
G1 X81.096 Y79.799 E.02739
G1 X81.435 Y80.195 E.02619
G1 X81.568 Y80.423 E.01327
G1 X81.699 Y81.012 E.03025
G1 X81.637 Y81.488 E.02411
G1 X81.507 Y81.827 E.0182
G1 X81.195 Y82.233 E.02572
G1 X80.965 Y82.427 E.01508
G1 X80.459 Y82.648 E.02769
G1 X80.005 Y82.687 E.02287
G1 X79.577 Y82.611 E.02184
G1 X79.382 Y82.535 E.0105
M73 P3 R15
G1 X79.016 Y82.299 E.02184
G1 X78.865 Y82.152 E.01059
G1 X78.784 Y82.033 E.00721
M204 S6000
G1 X79.142 Y81.763 F42000
G1 F3000
M204 S500
G1 X79.024 Y81.62 E.00932
G1 X78.9 Y81.284 E.01795
G1 X78.89 Y80.96 E.01628
G1 X79.024 Y80.51 E.02355
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
G1 X79.18 Y81.81 E.0113
M204 S6000
G1 X79.47 Y81.494 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X79.429 Y81.449 E.00307
G1 X79.33 Y81.17 E.01485
G1 X79.348 Y80.875 E.01486
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
G1 X79.511 Y81.538 E.00883
; WIPE_START
G1 X79.429 Y81.449 E-.04605
G1 X79.33 Y81.17 E-.11241
G1 X79.348 Y80.875 E-.11254
G1 X79.478 Y80.609 E-.11247
G1 X79.718 Y80.409 E-.11839
G1 X80.074 Y80.316 E-.13991
G1 X80.253 Y80.342 E-.06878
G1 X80.367 Y80.404 E-.04945
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

G1 X101.256 Y77.944
G1 Z.28
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.505629
G1 F5771.487
M204 S500
G1 X100.553 Y77.241 E.05055
G1 X99.923 Y77.241 E.03203
G1 X101.058 Y78.376 E.08162
G1 X101.058 Y79.006 E.03203
G1 X99.293 Y77.241 E.12691
G1 X98.663 Y77.241 E.03203
G1 X101.058 Y79.636 E.17221
G1 X101.058 Y80.266 E.03203
G1 X98.033 Y77.241 E.2175
G1 X97.403 Y77.241 E.03203
G1 X101.058 Y80.897 E.26279
G1 X101.058 Y81.527 E.03203
G1 X96.772 Y77.241 E.30809
G1 X96.142 Y77.241 E.03203
G1 X101.058 Y82.157 E.35338
G1 X101.058 Y82.787 E.03203
G1 X95.512 Y77.241 E.39868
G1 X94.882 Y77.241 E.03203
G1 X101.058 Y83.417 E.44397
G1 X101.058 Y84.047 E.03203
G1 X94.252 Y77.241 E.48926
G1 X93.622 Y77.24 E.03203
G1 X101.058 Y84.677 E.53456
G1 X101.058 Y85.307 E.03203
G1 X92.992 Y77.24 E.57985
G1 X92.362 Y77.24 E.03203
G1 X101.058 Y85.937 E.62515
G1 X101.058 Y86.567 E.03203
G1 X91.732 Y77.24 E.67044
G1 X91.101 Y77.24 E.03203
G1 X101.058 Y87.197 E.71573
G1 X101.058 Y87.828 E.03203
G1 X90.471 Y77.24 E.76103
G1 X89.841 Y77.24 E.03203
G1 X101.058 Y88.458 E.80632
G1 X101.058 Y89.088 E.03203
G1 X89.211 Y77.24 E.85161
G1 X88.581 Y77.24 E.03203
G1 X101.058 Y89.718 E.89691
G1 X101.059 Y90.348 E.03203
G1 X87.951 Y77.24 E.9422
G1 X87.321 Y77.24 E.03203
G1 X101.059 Y90.978 E.9875
G1 X101.059 Y91.608 E.03203
G1 X86.691 Y77.24 E1.03279
G1 X86.061 Y77.24 E.03203
G1 X101.059 Y92.238 E1.07809
G1 X101.059 Y92.868 E.03203
G1 X85.43 Y77.24 E1.12338
G1 X84.8 Y77.24 E.03203
G1 X101.059 Y93.498 E1.16867
G1 X101.059 Y94.128 E.03203
G1 X84.17 Y77.24 E1.21397
G1 X83.54 Y77.24 E.03203
G1 X101.059 Y94.759 E1.25926
G1 X101.059 Y95.389 E.03203
G1 X82.91 Y77.24 E1.30455
M73 P4 R15
G1 X82.28 Y77.24 E.03203
G1 X101.059 Y96.019 E1.34985
G1 X101.059 Y96.649 E.03203
G1 X81.65 Y77.24 E1.39514
G1 X81.02 Y77.24 E.03203
G1 X101.059 Y97.279 E1.44044
G1 X101.059 Y97.909 E.03203
G1 X80.389 Y77.24 E1.48573
G1 X79.759 Y77.24 E.03203
G1 X101.059 Y98.539 E1.53102
G1 X101.059 Y99.169 E.03203
G1 X82.451 Y80.561 E1.33756
G2 X82.09 Y79.711 I-2.045 J.367 E.04735
G2 X81.611 Y79.166 I-2.519 J1.733 E.03695
G2 X80.596 Y78.706 I-1.513 J1.987 E.05712
G1 X79.129 Y77.24 E.10541
G1 X78.94 Y77.24 E.00963
G1 X78.94 Y77.681 E.0224
G1 X79.893 Y78.634 E.06853
G1 X79.755 Y78.645 E.00704
G1 X79.377 Y78.748 E.01992
G1 X78.94 Y78.311 E.03142
G1 X78.94 Y78.941 E.03203
G1 X79.091 Y79.092 E.01088
; WIPE_START
G1 X78.94 Y78.941 E-.08131
G1 X78.94 Y78.311 E-.23943
G1 X79.377 Y78.748 E-.2349
G1 X79.755 Y78.645 E-.14895
G1 X79.893 Y78.634 E-.05261
G1 X79.888 Y78.629 E-.00279
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X82.312 Y81.053 Z.68 F42000
G1 Z.28
G1 E.8 F1800
G1 F5771.487
M204 S500
G1 X101.059 Y99.799 E1.3475
G1 X101.059 Y100.429 E.03203
G1 X82.401 Y81.772 E1.34116
G1 X82.389 Y81.831 E.00308
G3 X82.217 Y82.218 I-1.346 J-.368 E.0216
G1 X101.059 Y101.059 E1.35438
G1 X101.059 Y101.689 E.03203
G1 X81.95 Y82.58 E1.37359
G1 X81.655 Y82.916 E.0227
G1 X101.059 Y102.32 E1.39474
G1 X101.059 Y102.759 E.02231
G1 X100.867 Y102.759 E.00971
G1 X81.285 Y83.176 E1.4076
G3 X80.844 Y83.366 I-1.002 J-1.727 E.02444
G1 X100.237 Y102.759 E1.394
G1 X99.607 Y102.759 E.03202
G1 X80.331 Y83.483 E1.38559
G3 X79.657 Y83.438 I-.227 J-1.699 E.03458
G1 X98.977 Y102.759 E1.38878
G1 X98.347 Y102.759 E.03202
G1 X78.94 Y83.351 E1.39504
G1 X78.94 Y83.981 E.03203
G1 X97.717 Y102.759 E1.34975
G1 X97.087 Y102.759 E.03202
G1 X78.94 Y84.612 E1.30446
G1 X78.94 Y85.242 E.03203
G1 X96.457 Y102.759 E1.25917
M73 P5 R15
G1 X95.827 Y102.759 E.03202
G1 X78.94 Y85.872 E1.21389
G1 X78.94 Y86.502 E.03203
G1 X95.197 Y102.759 E1.1686
G1 X94.567 Y102.759 E.03202
G1 X78.94 Y87.132 E1.12331
G1 X78.94 Y87.762 E.03203
G1 X93.937 Y102.759 E1.07802
G1 X93.307 Y102.759 E.03202
G1 X78.94 Y88.392 E1.03273
G1 X78.94 Y89.022 E.03203
G1 X92.677 Y102.759 E.98744
G1 X92.047 Y102.759 E.03202
G1 X78.94 Y89.652 E.94215
G1 X78.94 Y90.282 E.03203
G1 X91.417 Y102.759 E.89686
G1 X90.787 Y102.759 E.03202
G1 X78.94 Y90.912 E.85158
G1 X78.94 Y91.543 E.03203
G1 X90.157 Y102.759 E.80629
G1 X89.527 Y102.759 E.03202
G1 X78.94 Y92.173 E.761
G1 X78.94 Y92.803 E.03203
G1 X88.897 Y102.759 E.71571
G1 X88.267 Y102.759 E.03202
G1 X78.94 Y93.433 E.67042
G1 X78.94 Y94.063 E.03203
G1 X87.636 Y102.76 E.62513
G1 X87.006 Y102.76 E.03202
G1 X78.94 Y94.693 E.57984
G1 X78.94 Y95.323 E.03203
G1 X86.376 Y102.76 E.53455
G1 X85.746 Y102.76 E.03202
G1 X78.94 Y95.953 E.48927
G1 X78.94 Y96.583 E.03203
G1 X85.116 Y102.76 E.44398
G1 X84.486 Y102.76 E.03202
G1 X78.94 Y97.213 E.39869
G1 X78.94 Y97.843 E.03203
G1 X83.856 Y102.76 E.3534
G1 X83.226 Y102.76 E.03202
G1 X78.94 Y98.473 E.30811
G1 X78.94 Y99.104 E.03203
G1 X82.596 Y102.76 E.26282
G1 X81.966 Y102.76 E.03202
G1 X78.94 Y99.734 E.21753
G1 X78.94 Y100.364 E.03203
G1 X81.336 Y102.76 E.17224
G1 X80.706 Y102.76 E.03202
G1 X78.94 Y100.994 E.12696
G1 X78.94 Y101.624 E.03203
G1 X80.076 Y102.76 E.08167
G1 X79.446 Y102.76 E.03202
G1 X78.742 Y102.056 E.05061
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F5771.487
G1 X79.446 Y102.76 E-.37836
G1 X80.076 Y102.76 E-.23941
G1 X79.811 Y102.495 E-.14223
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
G3 Z.68 I1.215 J-.064 P1  F42000
G1 X78.451 Y76.702 Z.68
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F18000
M204 S6000
G1 X101.534 Y76.703 E.32566
G1 X101.597 Y76.75 E.0011
G1 X101.598 Y102.75 E.36681
M73 P6 R15
G3 X101.59 Y103.277 I-2.403 J.225 E.00745
G1 X101.506 Y103.298 E.00122
G1 X78.424 Y103.29 E.32564
G1 X78.402 Y103.225 E.00098
G1 X78.403 Y82.107 E.29794
G1 X78.613 Y82.415 E.00526
G1 X78.757 Y82.555 E.00284
G1 X79.251 Y82.874 E.00829
G1 X79.814 Y83.041 E.00829
G1 X80.404 Y83.016 E.00832
G1 X80.901 Y82.876 E.00729
G1 X81.44 Y82.513 E.00917
G1 X81.766 Y82.099 E.00743
G1 X81.959 Y81.695 E.00632
G1 X82.058 Y81.189 E.00727
G1 X82.034 Y80.771 E.00591
G1 X81.914 Y80.309 E.00674
G2 X81.47 Y79.646 I-2.244 J1.024 E.0113
G1 X81.062 Y79.344 E.00717
G1 X80.514 Y79.129 E.0083
G1 X80.315 Y79.094 E.00284
G1 X79.809 Y79.093 E.00715
G1 X79.357 Y79.219 E.00662
G1 X78.757 Y79.575 E.00983
G1 X78.613 Y79.716 E.00284
G1 X78.403 Y80.023 E.00525
G1 X78.403 Y76.774 E.04585
G1 X78.418 Y76.752 E.00037
M204 S10000
G1 X78.065 Y76.477 F42000
G1 F18000
M204 S6000
G1 X78.15 Y76.363 E.002
G1 X78.426 Y76.269 E.00412
G1 X101.534 Y76.27 E.32601
G1 X101.711 Y76.293 E.00252
G1 X101.934 Y76.443 E.00378
G1 X102.029 Y76.686 E.00368
G1 X102.031 Y103.2 E.37407
G1 X101.973 Y103.484 E.00409
G1 X101.831 Y103.653 E.00311
G1 X101.533 Y103.731 E.00434
G1 X78.497 Y103.731 E.32499
G1 X78.184 Y103.66 E.00453
G1 X78.013 Y103.468 E.00364
G1 X77.969 Y103.247 E.00318
G1 X77.97 Y82.503 E.29265
; LINE_WIDTH: 0.465548
G1 X77.978 Y81.702 E.01171
; LINE_WIDTH: 0.508138
G2 X77.985 Y80.696 I-6.041 J-.544 E.01612
; LINE_WIDTH: 0.479068
G1 X77.97 Y80.428 E.00404
; LINE_WIDTH: 0.449998
G1 X77.971 Y76.781 E.05145
G1 X78.005 Y76.559 E.00318
G1 X78.03 Y76.525 E.00059
M204 S10000
G1 X77.734 Y76.2 F42000
G1 F18000
M204 S6000
G1 X77.8 Y76.1 E.0017
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
G1 X77.862 Y103.956 E.00538
G1 X77.62 Y103.66 E.00539
G1 X77.536 Y103.269 E.00564
G1 X77.538 Y77.269 E.36681
G3 X77.593 Y76.411 I2.907 J-.243 E.01216
G1 X77.7 Y76.25 E.00273
M204 S250
G1 X77.366 Y75.949 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2700
M204 S5000
G1 X77.372 Y75.938 E.00017
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
G1 X77.452 Y104.159 E.00493
G1 X77.39 Y104.067 E.00146
G1 F3150
G3 X77.188 Y103.68 I4.044 J-2.362 E.00575
G1 F2700
G1 X77.118 Y103.29 E.0052
G1 X77.12 Y77.29 E.34139
G3 X77.195 Y76.269 I3.515 J-.254 E.01349
G1 X77.338 Y76.002 E.00398
; WIPE_START
M204 S6000
G1 X77.372 Y75.938 E-.02763
G1 X77.638 Y75.672 E-.14266
G1 X77.971 Y75.494 E-.14369
G1 X78.406 Y75.418 E-.16755
G1 X79.138 Y75.418 E-.27848
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.799 Y81.914 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.465548
G1 F18000
M204 S6000
G1 X78.595 Y81.578 E.00576
; LINE_WIDTH: 0.491863
G1 X78.548 Y81.465 E.00188
; LINE_WIDTH: 0.518178
G1 F17963.713
G1 X78.502 Y81.353 E.00198
G1 X78.49 Y80.964 E.00636
; LINE_WIDTH: 0.508128
G1 F18000
G1 X78.585 Y80.667 E.00499
; LINE_WIDTH: 0.479063
G1 X78.68 Y80.37 E.0047
; LINE_WIDTH: 0.449998
G1 X78.915 Y80.025 E.00588
G1 X79.059 Y79.885 E.00284
G1 X79.484 Y79.632 E.00697
G3 X80.439 Y79.555 I.593 J1.395 E.01375
G1 X80.827 Y79.708 E.00588
G1 X81.166 Y79.954 E.00591
G1 X81.408 Y80.274 E.00567
G1 X81.57 Y80.659 E.00589
G1 X81.627 Y81.153 E.00702
G1 X81.516 Y81.653 E.00723
G1 X81.247 Y82.087 E.0072
G1 X80.996 Y82.313 E.00476
G1 X80.562 Y82.545 E.00695
G1 X80.086 Y82.613 E.00678
G1 X79.863 Y82.611 E.00315
G1 X79.409 Y82.471 E.0067
G1 X79.059 Y82.245 E.00587
G1 X78.915 Y82.105 E.00284
; LINE_WIDTH: 0.465548
G1 X78.831 Y81.966 E.00238
M204 S10000
G1 X79.154 Y81.681 F42000
; LINE_WIDTH: 0.449998
G1 F18000
M204 S6000
G1 X79.001 Y81.406 E.00444
G3 X78.952 Y80.964 I1.069 J-.341 E.00632
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
G1 X79.183 Y81.733 E.00099
M204 S250
G1 X79.511 Y81.481 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.464 Y81.43 E.00092
G1 X79.37 Y81.166 E.00368
G1 X79.37 Y80.964 E.00265
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
G1 X79.552 Y81.526 E.00197
; WIPE_START
M204 S6000
G1 X79.464 Y81.43 E-.04934
G1 X79.37 Y81.166 E-.10653
G1 X79.37 Y80.964 E-.07656
G1 X79.509 Y80.634 E-.13605
G1 X79.735 Y80.445 E-.11187
G1 X80.092 Y80.358 E-.13987
G1 X80.365 Y80.422 E-.10649
G1 X80.436 Y80.474 E-.03329
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

G1 X82.173 Y81.528
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421578
G1 F18000
M204 S6000
G1 X86.646 Y77.055 E.08338
G1 X86.074 Y77.055 E.00754
G1 X82.386 Y80.744 E.06876
G1 X82.271 Y80.286 E.00622
G1 X85.502 Y77.055 E.06023
G1 X84.931 Y77.055 E.00754
G1 X82.091 Y79.894 E.05293
G2 X81.85 Y79.564 I-1.111 J.557 E.00542
G1 X84.359 Y77.055 E.04676
G1 X83.787 Y77.055 E.00754
G1 X81.568 Y79.273 E.04136
G2 X81.233 Y79.037 I-1.653 J1.987 E.00542
G1 X83.215 Y77.055 E.03695
G1 X82.643 Y77.055 E.00754
G1 X80.822 Y78.876 E.03394
G2 X80.37 Y78.756 I-.459 J.821 E.00623
G1 X82.071 Y77.055 E.03172
G1 X81.499 Y77.055 E.00754
G1 X79.815 Y78.739 E.03139
G1 X79.239 Y78.885 E.00784
G1 X78.889 Y79.093 E.00536
G1 X80.927 Y77.055 E.038
G1 X80.356 Y77.055 E.00754
G1 X78.756 Y78.654 E.02981
G1 X78.756 Y78.082 E.00754
G1 X79.784 Y77.055 E.01915
G1 X79.212 Y77.055 E.00754
G1 X78.575 Y77.691 E.01187
; WIPE_START
G1 X79.212 Y77.055 E-.34221
G1 X79.784 Y77.055 E-.21731
G1 X79.411 Y77.428 E-.20048
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.575 Y83.411 Z.76 F42000
G1 Z.36
G1 E.8 F1800
G1 F18000
M204 S6000
G1 X78.914 Y83.072 E.00633
G2 X79.289 Y83.268 I.675 J-.831 E.00562
G1 X78.756 Y83.802 E.00994
G1 X78.756 Y84.374 E.00754
G1 X79.744 Y83.386 E.01842
G2 X80.323 Y83.379 I.247 J-3.567 E.00764
G1 X78.756 Y84.946 E.02921
G1 X78.756 Y85.518 E.00754
G1 X87.218 Y77.055 E.15775
G1 X87.79 Y77.055 E.00754
G1 X78.756 Y86.089 E.16842
G1 X78.756 Y86.661 E.00754
G1 X88.362 Y77.055 E.17908
G1 X88.934 Y77.055 E.00754
G1 X78.756 Y87.233 E.18974
G1 X78.756 Y87.805 E.00754
G1 X89.506 Y77.055 E.2004
G1 X90.078 Y77.055 E.00754
G1 X78.756 Y88.377 E.21106
G1 X78.755 Y88.949 E.00754
G1 X90.649 Y77.055 E.22172
G1 X91.221 Y77.055 E.00754
G1 X78.755 Y89.521 E.23239
G1 X78.755 Y90.093 E.00754
G1 X91.793 Y77.055 E.24305
G1 X92.365 Y77.055 E.00754
G1 X78.755 Y90.665 E.25371
G1 X78.755 Y91.237 E.00754
G1 X92.937 Y77.056 E.26437
G1 X93.509 Y77.056 E.00754
G1 X78.755 Y91.809 E.27503
G1 X78.755 Y92.381 E.00754
G1 X94.081 Y77.056 E.28569
G1 X94.653 Y77.056 E.00754
G1 X78.755 Y92.953 E.29635
M73 P6 R14
G1 X78.755 Y93.525 E.00754
G1 X95.224 Y77.056 E.30702
G1 X95.796 Y77.056 E.00754
G1 X78.755 Y94.097 E.31768
G1 X78.755 Y94.669 E.00754
G1 X96.368 Y77.056 E.32834
G1 X96.94 Y77.056 E.00754
G1 X78.755 Y95.241 E.339
G1 X78.755 Y95.813 E.00754
G1 X97.512 Y77.056 E.34966
G1 X98.084 Y77.056 E.00754
G1 X78.755 Y96.385 E.36032
G1 X78.755 Y96.957 E.00754
G1 X98.656 Y77.056 E.37099
G1 X99.228 Y77.056 E.00754
G1 X78.755 Y97.529 E.38165
G1 X78.755 Y98.101 E.00754
G1 X99.8 Y77.056 E.39231
G1 X100.371 Y77.056 E.00754
G1 X78.755 Y98.673 E.40297
G1 X78.755 Y99.245 E.00754
G1 X100.943 Y77.056 E.41363
G1 X101.244 Y77.056 E.00396
G1 X101.244 Y77.328 E.00358
M73 P7 R14
G1 X78.755 Y99.817 E.41923
G1 X78.755 Y100.388 E.00754
G1 X101.244 Y77.899 E.41924
G1 X101.244 Y78.471 E.00754
G1 X78.755 Y100.96 E.41924
G1 X78.755 Y101.532 E.00754
G1 X101.244 Y79.043 E.41924
G1 X101.244 Y79.615 E.00754
G1 X78.755 Y102.104 E.41924
G1 X78.755 Y102.676 E.00754
G1 X101.244 Y80.187 E.41924
G1 X101.244 Y80.759 E.00754
G1 X79.057 Y102.946 E.4136
G1 X79.629 Y102.946 E.00754
G1 X101.244 Y81.331 E.40294
G1 X101.244 Y81.903 E.00754
G1 X80.201 Y102.946 E.39228
G1 X80.773 Y102.946 E.00754
G1 X101.244 Y82.474 E.38162
G1 X101.244 Y83.046 E.00754
G1 X81.345 Y102.946 E.37095
G1 X81.917 Y102.946 E.00754
G1 X101.244 Y83.618 E.36029
G1 X101.244 Y84.19 E.00754
G1 X82.489 Y102.946 E.34963
G1 X83.061 Y102.946 E.00754
G1 X101.244 Y84.762 E.33897
G1 X101.244 Y85.334 E.00754
G1 X83.633 Y102.946 E.32831
G1 X84.205 Y102.946 E.00754
G1 X101.244 Y85.906 E.31765
G1 X101.244 Y86.478 E.00754
G1 X84.777 Y102.946 E.30699
G1 X85.348 Y102.946 E.00754
G1 X101.244 Y87.05 E.29633
G1 X101.244 Y87.621 E.00754
G1 X85.92 Y102.946 E.28567
G1 X86.492 Y102.946 E.00754
G1 X101.244 Y88.193 E.27501
G1 X101.245 Y88.765 E.00754
G1 X87.064 Y102.946 E.26435
G1 X87.636 Y102.946 E.00754
G1 X101.245 Y89.337 E.25368
G1 X101.245 Y89.909 E.00754
G1 X88.208 Y102.946 E.24302
G1 X88.78 Y102.946 E.00754
G1 X101.245 Y90.481 E.23236
G1 X101.245 Y91.053 E.00754
G1 X89.352 Y102.946 E.2217
G1 X89.924 Y102.946 E.00754
G1 X101.245 Y91.625 E.21104
G1 X101.245 Y92.197 E.00754
G1 X90.496 Y102.945 E.20038
G1 X91.068 Y102.945 E.00754
G1 X101.245 Y92.768 E.18972
G1 X101.245 Y93.34 E.00754
G1 X91.64 Y102.945 E.17906
G1 X92.212 Y102.945 E.00754
G1 X101.245 Y93.912 E.1684
G1 X101.245 Y94.484 E.00754
G1 X92.783 Y102.945 E.15774
G1 X93.355 Y102.945 E.00754
G1 X101.245 Y95.056 E.14708
G1 X101.245 Y95.628 E.00754
G1 X93.927 Y102.945 E.13641
G1 X94.499 Y102.945 E.00754
G1 X101.245 Y96.2 E.12575
G1 X101.245 Y96.772 E.00754
G1 X95.071 Y102.945 E.11509
G1 X95.643 Y102.945 E.00754
G1 X101.245 Y97.343 E.10443
G1 X101.245 Y97.915 E.00754
G1 X96.215 Y102.945 E.09377
G1 X96.787 Y102.945 E.00754
G1 X101.245 Y98.487 E.08311
G1 X101.245 Y99.059 E.00754
G1 X97.359 Y102.945 E.07245
G1 X97.931 Y102.945 E.00754
G1 X101.245 Y99.631 E.06179
G1 X101.245 Y100.203 E.00754
G1 X98.503 Y102.945 E.05113
G1 X99.075 Y102.945 E.00754
G1 X101.245 Y100.775 E.04047
G1 X101.245 Y101.347 E.00754
G1 X99.647 Y102.945 E.02981
G1 X100.218 Y102.945 E.00754
G1 X101.245 Y101.919 E.01914
G1 X101.245 Y102.49 E.00754
G1 X100.609 Y103.127 E.01186
; CHANGE_LAYER
; Z_HEIGHT: 0.44
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X101.245 Y102.49 E-.34198
G1 X101.245 Y101.919 E-.21731
G1 X100.872 Y102.292 E-.20071
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/99
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.76 I.914 J-.803 P1  F42000
G1 X78.402 Y76.723 Z.76
G1 Z.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14884
M204 S6000
G1 X78.492 Y76.693 E.00133
G1 X101.518 Y76.695 E.32486
G1 X101.605 Y76.735 E.00134
G1 X101.606 Y102.735 E.36681
G3 X101.598 Y103.277 I-2.413 J.234 E.00767
G1 X101.508 Y103.307 E.00133
G1 X78.423 Y103.298 E.32569
G1 X78.393 Y103.208 E.00133
G1 X78.394 Y82.084 E.29802
G1 X78.667 Y82.465 E.00662
G1 X78.855 Y82.631 E.00354
G1 X79.507 Y82.965 E.01033
G1 X80.12 Y83.058 E.00875
G2 X80.838 Y82.904 I-.173 J-2.562 E.0104
G1 X81.309 Y82.617 E.00778
G1 X81.592 Y82.352 E.00547
G1 X81.882 Y81.892 E.00767
G1 X82.007 Y81.517 E.00557
G1 X82.051 Y80.872 E.00913
G1 X81.937 Y80.387 E.00702
G1 X81.726 Y79.955 E.00679
G1 X81.383 Y79.575 E.00722
G1 X80.889 Y79.256 E.0083
G1 X80.415 Y79.102 E.00703
G1 X79.974 Y79.091 E.00622
G1 X79.305 Y79.225 E.00963
G2 X78.695 Y79.641 I1.01 J2.132 E.01045
G1 X78.393 Y80.05 E.00717
G1 X78.393 Y76.798 E.04588
G1 X78.395 Y76.782 E.00022
M204 S10000
G1 X78.02 Y76.497 F42000
G1 F14884
M204 S6000
G1 X78.18 Y76.333 E.00323
G1 X78.465 Y76.261 E.00415
G1 X101.518 Y76.262 E.32524
G1 X101.744 Y76.297 E.00322
G1 X101.924 Y76.417 E.00305
G1 X102.038 Y76.68 E.00404
G1 X102.039 Y103.202 E.37417
G1 X101.98 Y103.503 E.00433
G1 X101.82 Y103.667 E.00323
G1 X101.535 Y103.739 E.00415
G1 X78.498 Y103.739 E.325
G1 X78.197 Y103.68 E.00433
G1 X78.033 Y103.52 E.00323
G1 X77.961 Y103.235 E.00415
G1 X77.961 Y82.588 E.29128
; LINE_WIDTH: 0.466538
G1 X77.969 Y81.704 E.01296
; LINE_WIDTH: 0.512958
G1 X77.992 Y80.964 E.01196
G1 X77.976 Y80.695 E.00436
; LINE_WIDTH: 0.481478
G1 X77.961 Y80.426 E.00408
; LINE_WIDTH: 0.449998
G1 X77.961 Y76.798 E.05118
G1 X78.008 Y76.556 E.00349
M204 S10000
G1 X77.693 Y76.223 F42000
G1 F14884
M204 S6000
G1 X77.836 Y76.056 E.00309
G1 X78.074 Y75.908 E.00396
G1 X78.439 Y75.828 E.00526
G1 X101.518 Y75.83 E.32561
G1 X101.892 Y75.885 E.00532
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
G1 X77.756 Y103.864 E.00436
G1 X77.608 Y103.626 E.00396
G1 X77.528 Y103.261 E.00526
G1 X77.528 Y77.261 E.36681
G3 X77.635 Y76.291 I2.349 J-.232 E.01387
G1 X77.654 Y76.268 E.00042
M204 S250
G1 X77.382 Y75.941 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X77.444 Y75.837 E.00159
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
G1 X77.537 Y104.256 E.00602
G1 X77.295 Y103.962 E.005
G1 X77.15 Y103.611 E.00499
G1 X77.11 Y103.287 E.00428
G1 X77.11 Y77.287 E.34139
G3 X77.21 Y76.231 I2.863 J-.261 E.014
G1 X77.352 Y75.993 E.00364
; WIPE_START
M204 S6000
G1 X77.444 Y75.837 E-.06881
G1 X77.738 Y75.595 E-.1446
G1 X78.089 Y75.45 E-.14453
G1 X78.413 Y75.41 E-.1239
G1 X79.145 Y75.41 E-.27816
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.805 Y81.934 Z.84 F42000
G1 Z.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14884
M204 S6000
G1 X78.68 Y81.76 E.00302
; LINE_WIDTH: 0.486518
G1 X78.59 Y81.557 E.0034
; LINE_WIDTH: 0.523038
G1 X78.499 Y81.354 E.00367
G1 X78.488 Y80.964 E.00643
; LINE_WIDTH: 0.512958
G1 X78.584 Y80.667 E.00505
; LINE_WIDTH: 0.481478
G1 X78.68 Y80.37 E.00473
; LINE_WIDTH: 0.449998
G1 X78.974 Y79.973 E.00697
G1 X79.467 Y79.626 E.00851
G1 X80.028 Y79.52 E.00805
G1 X80.34 Y79.528 E.00441
G1 X80.731 Y79.659 E.00581
G1 X81.081 Y79.885 E.00588
G1 X81.366 Y80.195 E.00594
G1 X81.595 Y80.735 E.00828
G1 X81.618 Y81.043 E.00435
G1 X81.556 Y81.539 E.00705
G1 X81.341 Y81.96 E.00668
G1 X81.119 Y82.217 E.00479
G1 X80.675 Y82.503 E.00745
G1 X80.109 Y82.625 E.00817
G1 X79.848 Y82.599 E.0037
G1 X79.604 Y82.543 E.00354
G1 X79.142 Y82.306 E.00732
G1 X78.954 Y82.14 E.00354
G1 X78.84 Y81.983 E.00274
M204 S10000
G1 X79.148 Y81.688 F42000
G1 F14884
M204 S6000
G1 X79.079 Y81.592 E.00166
G1 X78.962 Y81.273 E.0048
G1 X78.952 Y80.964 E.00436
G1 X79.079 Y80.538 E.00627
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
G3 X79.24 Y81.816 I.138 J-1.137 E.01141
G1 X79.183 Y81.736 E.00138
M204 S250
G1 X79.482 Y81.447 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.464 Y81.43 E.00033
G1 X79.37 Y81.166 E.00368
G1 X79.386 Y80.886 E.00368
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
G1 X79.524 Y81.49 E.00334
; WIPE_START
M204 S6000
G1 X79.464 Y81.43 E-.03225
G1 X79.37 Y81.166 E-.10655
G1 X79.386 Y80.886 E-.10645
G1 X79.52 Y80.624 E-.11179
G1 X79.785 Y80.415 E-.12845
G1 X80.193 Y80.366 E-.15605
G1 X80.479 Y80.49 E-.11847
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

G1 X81.367 Y79.365
G1 Z.44
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421828
G1 F14884
M204 S6000
G1 X79.048 Y77.046 E.04325
G1 X78.746 Y77.046 E.00398
G1 X78.746 Y77.317 E.00357
M73 P8 R14
G1 X80.155 Y78.726 E.02628
G1 X79.635 Y78.778 E.0069
G1 X78.746 Y77.889 E.01657
G1 X78.746 Y78.462 E.00755
G1 X79.179 Y78.894 E.00807
G1 X78.82 Y79.107 E.00551
G1 X78.565 Y78.853 E.00475
M204 S10000
G1 X101.433 Y77.685 F42000
G1 F14884
M204 S6000
G1 X100.796 Y77.048 E.01188
G1 X100.224 Y77.048 E.00755
G1 X101.252 Y78.076 E.01918
G1 X101.252 Y78.649 E.00755
G1 X99.651 Y77.048 E.02985
G1 X99.079 Y77.048 E.00755
G1 X101.252 Y79.221 E.04053
G1 X101.252 Y79.793 E.00755
G1 X98.507 Y77.048 E.05121
G1 X97.935 Y77.048 E.00755
G1 X101.252 Y80.365 E.06188
G1 X101.252 Y80.938 E.00755
G1 X97.362 Y77.048 E.07256
G1 X96.79 Y77.048 E.00755
G1 X101.252 Y81.51 E.08324
G1 X101.252 Y82.082 E.00755
G1 X96.218 Y77.048 E.09391
G1 X95.645 Y77.048 E.00755
G1 X101.252 Y82.655 E.10459
G1 X101.252 Y83.227 E.00755
G1 X95.073 Y77.048 E.11527
G1 X94.501 Y77.048 E.00755
G1 X101.252 Y83.799 E.12594
G1 X101.252 Y84.372 E.00755
G1 X93.928 Y77.048 E.13662
G1 X93.356 Y77.048 E.00755
G1 X101.252 Y84.944 E.14729
G1 X101.252 Y85.516 E.00755
G1 X92.784 Y77.048 E.15797
G1 X92.211 Y77.047 E.00755
G1 X101.252 Y86.089 E.16865
G1 X101.252 Y86.661 E.00755
G1 X91.639 Y77.047 E.17932
G1 X91.067 Y77.047 E.00755
G1 X101.253 Y87.233 E.19
G1 X101.253 Y87.806 E.00755
G1 X90.494 Y77.047 E.20068
G1 X89.922 Y77.047 E.00755
G1 X101.253 Y88.378 E.21135
G1 X101.253 Y88.95 E.00755
G1 X89.35 Y77.047 E.22203
G1 X88.777 Y77.047 E.00755
G1 X101.253 Y89.522 E.23271
G1 X101.253 Y90.095 E.00755
G1 X88.205 Y77.047 E.24338
G1 X87.633 Y77.047 E.00755
G1 X101.253 Y90.667 E.25406
G1 X101.253 Y91.239 E.00755
G1 X87.06 Y77.047 E.26473
G1 X86.488 Y77.047 E.00755
G1 X101.253 Y91.812 E.27541
G1 X101.253 Y92.384 E.00755
G1 X85.916 Y77.047 E.28609
G1 X85.343 Y77.047 E.00755
G1 X101.253 Y92.956 E.29676
G1 X101.253 Y93.529 E.00755
G1 X84.771 Y77.047 E.30744
G1 X84.199 Y77.047 E.00755
G1 X101.253 Y94.101 E.31812
G1 X101.253 Y94.673 E.00755
G1 X83.627 Y77.047 E.32879
G1 X83.054 Y77.047 E.00755
G1 X101.253 Y95.246 E.33947
G1 X101.253 Y95.818 E.00755
G1 X82.482 Y77.047 E.35015
G1 X81.91 Y77.047 E.00755
G1 X101.253 Y96.39 E.36082
G1 X101.253 Y96.963 E.00755
G1 X81.337 Y77.047 E.3715
G1 X80.765 Y77.047 E.00755
G1 X101.253 Y97.535 E.38217
G1 X101.253 Y98.107 E.00755
G1 X80.193 Y77.047 E.39285
G1 X79.62 Y77.046 E.00755
G1 X101.253 Y98.68 E.40353
G1 X101.253 Y99.252 E.00755
G1 X82.25 Y80.248 E.35447
G3 X82.402 Y80.973 I-1.627 J.72 E.00984
G1 X101.253 Y99.824 E.35163
G1 X101.253 Y100.396 E.00755
G1 X82.361 Y81.505 E.3524
G3 X82.236 Y81.952 I-1.505 J-.18 E.00615
G1 X101.253 Y100.969 E.35473
G1 X101.253 Y101.541 E.00755
G1 X82.034 Y82.322 E.35851
G3 X81.795 Y82.655 I-1.273 J-.661 E.00543
G1 X101.254 Y102.113 E.36297
G1 X101.254 Y102.686 E.00755
G1 X81.485 Y82.917 E.36875
G1 X81.144 Y83.148 E.00544
G1 X100.949 Y102.954 E.36944
G1 X100.377 Y102.954 E.00755
G1 X80.724 Y83.301 E.36659
G3 X80.248 Y83.397 I-.563 J-1.57 E.00643
G1 X99.805 Y102.954 E.3648
G1 X99.232 Y102.954 E.00755
G1 X79.635 Y83.356 E.36555
G1 X79.412 Y83.305 E.00302
G1 X78.746 Y82.964 E.00986
G1 X78.746 Y83.04 E.001
G1 X98.66 Y102.954 E.37146
G1 X98.088 Y102.954 E.00755
G1 X78.746 Y83.612 E.36078
G1 X78.746 Y84.184 E.00755
G1 X97.516 Y102.954 E.35011
G1 X96.943 Y102.954 E.00755
G1 X78.746 Y84.757 E.33943
G1 X78.746 Y85.329 E.00755
G1 X96.371 Y102.954 E.32876
G1 X95.799 Y102.954 E.00755
G1 X78.746 Y85.901 E.31808
G1 X78.746 Y86.474 E.00755
G1 X95.226 Y102.954 E.30741
G1 X94.654 Y102.954 E.00755
G1 X78.746 Y87.046 E.29673
G1 X78.746 Y87.618 E.00755
G1 X94.082 Y102.954 E.28606
G1 X93.51 Y102.954 E.00755
G1 X78.746 Y88.19 E.27538
G1 X78.746 Y88.763 E.00755
G1 X92.937 Y102.954 E.26471
G1 X92.365 Y102.954 E.00755
G1 X78.746 Y89.335 E.25403
G1 X78.746 Y89.907 E.00755
G1 X91.793 Y102.954 E.24336
G1 X91.221 Y102.954 E.00755
G1 X78.746 Y90.48 E.23268
G1 X78.746 Y91.052 E.00755
G1 X90.648 Y102.954 E.22201
G1 X90.076 Y102.954 E.00755
G1 X78.746 Y91.624 E.21133
G1 X78.746 Y92.196 E.00755
G1 X89.504 Y102.954 E.20066
G1 X88.931 Y102.954 E.00755
G1 X78.746 Y92.769 E.18998
G1 X78.746 Y93.341 E.00755
G1 X88.359 Y102.954 E.17931
G1 X87.787 Y102.954 E.00755
G1 X78.746 Y93.913 E.16863
G1 X78.746 Y94.485 E.00755
G1 X87.215 Y102.954 E.15796
G1 X86.642 Y102.954 E.00755
G1 X78.746 Y95.058 E.14728
G1 X78.746 Y95.63 E.00755
G1 X86.07 Y102.954 E.13661
G1 X85.498 Y102.954 E.00755
G1 X78.746 Y96.202 E.12594
G1 X78.746 Y96.775 E.00755
G1 X84.925 Y102.954 E.11526
M73 P9 R14
G1 X84.353 Y102.954 E.00755
G1 X78.746 Y97.347 E.10459
G1 X78.746 Y97.919 E.00755
G1 X83.781 Y102.954 E.09391
G1 X83.209 Y102.954 E.00755
G1 X78.746 Y98.491 E.08324
G1 X78.746 Y99.064 E.00755
G1 X82.636 Y102.954 E.07256
G1 X82.064 Y102.954 E.00755
G1 X78.746 Y99.636 E.06189
G1 X78.746 Y100.208 E.00755
G1 X81.492 Y102.954 E.05121
G1 X80.92 Y102.954 E.00755
G1 X78.746 Y100.78 E.04054
G1 X78.746 Y101.353 E.00755
G1 X80.347 Y102.954 E.02986
G1 X79.775 Y102.954 E.00755
G1 X78.746 Y101.925 E.01919
G1 X78.746 Y102.497 E.00755
G1 X79.384 Y103.135 E.01189
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X78.746 Y102.497 E-.34265
G1 X78.746 Y101.925 E-.21747
G1 X79.118 Y102.297 E-.19988
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/99
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.84 I1.216 J-.034 P1  F42000
G1 X78.402 Y76.723 Z.84
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14894
M204 S6000
G1 X78.491 Y76.693 E.00133
G1 X101.482 Y76.694 E.32435
G1 X101.605 Y76.735 E.00183
G1 X101.605 Y103.219 E.37364
G1 X101.592 Y103.292 E.00106
G1 X101.536 Y103.307 E.00081
G1 X78.482 Y103.305 E.32525
G1 X78.41 Y103.292 E.00103
G1 X78.393 Y103.227 E.00095
G1 X78.393 Y82.127 E.29768
G1 X78.488 Y82.265 E.00236
G1 X78.972 Y82.715 E.00932
G1 X79.563 Y82.993 E.00922
G1 X79.894 Y83.039 E.00472
G1 X80.464 Y83.019 E.00805
G1 X80.709 Y82.95 E.00358
G2 X81.446 Y82.507 I-1.011 J-2.521 E.01219
G1 X81.766 Y82.098 E.00732
G1 X81.96 Y81.694 E.00633
G1 X82.058 Y81.189 E.00726
G1 X82.034 Y80.771 E.0059
G1 X81.915 Y80.309 E.00673
G1 X81.766 Y80.031 E.00445
G1 X81.446 Y79.623 E.00732
G1 X80.952 Y79.29 E.00841
G1 X80.243 Y79.083 E.01041
G1 X79.806 Y79.093 E.00616
G1 X79.356 Y79.219 E.00659
G1 X78.757 Y79.575 E.00983
G1 X78.613 Y79.715 E.00284
G1 X78.393 Y80.055 E.00571
G1 X78.402 Y76.783 E.04617
M204 S10000
G1 X78.032 Y76.489 F42000
G1 F14894
M204 S6000
G1 X78.167 Y76.338 E.00286
G1 X78.465 Y76.261 E.00434
G1 X101.482 Y76.261 E.32472
G1 X101.724 Y76.291 E.00345
G1 X101.931 Y76.429 E.0035
G1 X102.038 Y76.68 E.00385
G1 X102.038 Y103.219 E.37441
G1 X102 Y103.457 E.0034
G1 X101.829 Y103.662 E.00376
G1 X101.561 Y103.739 E.00394
G1 X78.482 Y103.738 E.3256
G1 X78.208 Y103.682 E.00394
G1 X78.034 Y103.522 E.00334
G1 X77.961 Y103.248 E.004
G1 X77.961 Y82.092 E.29847
; LINE_WIDTH: 0.483293
G1 X77.977 Y81.652 E.00668
; LINE_WIDTH: 0.516588
G2 X77.977 Y80.879 I-4.394 J-.386 E.0126
; LINE_WIDTH: 0.483293
G1 X77.961 Y80.546 E.00507
; LINE_WIDTH: 0.449998
G1 X77.961 Y76.798 E.05288
G1 X78.009 Y76.542 E.00367
M204 S10000
G1 X77.759 Y76.136 F42000
G1 F14894
M204 S6000
G1 X77.793 Y76.082 E.0009
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
G1 X77.821 Y103.931 E.00471
G1 X77.616 Y103.671 E.00467
G1 X77.528 Y103.269 E.0058
G1 X77.528 Y77.269 E.36681
G3 X77.594 Y76.398 I2.675 J-.236 E.01238
G1 X77.727 Y76.187 E.00352
M204 S250
G1 X77.397 Y75.914 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X77.491 Y75.787 E.00207
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
G1 X77.403 Y104.115 E.00503
G1 X77.189 Y103.71 E.00602
G1 X77.11 Y103.29 E.00561
G1 X77.11 Y77.29 E.34139
G3 X77.132 Y76.535 I4.542 J-.246 E.00992
G1 X77.263 Y76.095 E.00604
G1 X77.361 Y75.962 E.00217
; WIPE_START
M204 S6000
G1 X77.491 Y75.787 E-.08257
G1 X77.735 Y75.597 E-.11769
G1 X78.089 Y75.45 E-.14576
G1 X78.413 Y75.41 E-.12377
G1 X79.176 Y75.41 E-.29021
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.978 Y82.144 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14894
M204 S6000
G1 X78.845 Y82.021 E.00255
; LINE_WIDTH: 0.493988
G1 X78.683 Y81.736 E.00509
; LINE_WIDTH: 0.537978
G1 X78.522 Y81.451 E.00556
G1 X78.482 Y81.014 E.00745
; LINE_WIDTH: 0.509188
G1 X78.572 Y80.716 E.00499
; LINE_WIDTH: 0.479593
G1 X78.661 Y80.418 E.00469
; LINE_WIDTH: 0.449998
G1 X78.915 Y80.025 E.00661
G1 X79.06 Y79.884 E.00284
G1 X79.484 Y79.632 E.00696
G1 X79.879 Y79.52 E.0058
G1 X80.34 Y79.532 E.0065
G1 X80.735 Y79.665 E.00588
G1 X81.149 Y79.937 E.00699
G1 X81.408 Y80.275 E.00601
G1 X81.57 Y80.659 E.00589
G1 X81.627 Y81.153 E.007
G1 X81.516 Y81.652 E.00722
G1 X81.246 Y82.087 E.00722
G1 X81.02 Y82.297 E.00436
G1 X80.555 Y82.545 E.00742
G1 X80.157 Y82.613 E.00571
G1 X79.67 Y82.574 E.00688
G1 X79.405 Y82.465 E.00404
G1 X79.188 Y82.34 E.00353
G1 X79.022 Y82.185 E.00321
M204 S10000
G1 X79.265 Y81.835 F42000
G1 F14894
M204 S6000
G1 X79.203 Y81.778 E.00119
G1 X78.991 Y81.369 E.00649
G1 X78.945 Y81.014 E.00505
G1 X79.068 Y80.566 E.00656
G3 X79.612 Y80.046 I1.006 J.506 E.01082
G1 X80.057 Y79.937 E.00647
G1 X80.286 Y79.961 E.00324
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
G3 X79.405 Y81.965 I.476 J-1.073 E.00354
G1 X79.309 Y81.876 E.00185
M204 S250
G1 X79.543 Y81.533 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.402 Y81.292 E.00367
G1 X79.375 Y80.946 E.00456
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
G1 X79.59 Y81.57 E.00379
; WIPE_START
M204 S6000
G1 X79.402 Y81.292 E-.12739
G1 X79.375 Y80.946 E-.13206
G1 X79.509 Y80.634 E-.12894
G1 X79.735 Y80.445 E-.11171
G1 X80.083 Y80.357 E-.13643
G1 X80.309 Y80.401 E-.08775
G1 X80.388 Y80.453 E-.03572
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

G1 X82.176 Y81.512
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421848
G1 F14894
M204 S6000
G1 X86.642 Y77.046 E.08331
G1 X86.07 Y77.046 E.00755
G1 X82.378 Y80.739 E.06887
G2 X82.271 Y80.273 I-1.763 J.157 E.00632
G1 X85.497 Y77.046 E.06018
G1 X84.925 Y77.046 E.00755
G1 X82.086 Y79.885 E.05295
G2 X81.848 Y79.552 I-1.857 J1.078 E.00542
G1 X84.353 Y77.046 E.04673
G1 X83.78 Y77.046 E.00755
G1 X81.559 Y79.268 E.04145
G2 X81.218 Y79.036 I-1.156 J1.333 E.00545
G1 X83.208 Y77.046 E.03712
G1 X82.636 Y77.046 E.00755
G1 X80.808 Y78.874 E.03409
G1 X80.449 Y78.753 E.005
G1 X80.364 Y78.746 E.00112
G1 X82.064 Y77.046 E.0317
G1 X81.491 Y77.046 E.00755
G1 X79.797 Y78.74 E.0316
G1 X79.239 Y78.885 E.00761
G1 X78.848 Y79.117 E.00599
G1 X80.919 Y77.046 E.03863
G1 X80.347 Y77.046 E.00755
G1 X78.746 Y78.647 E.02985
G1 X78.746 Y78.074 E.00755
G1 X79.774 Y77.046 E.01918
G1 X79.202 Y77.046 E.00755
G1 X78.565 Y77.683 E.01188
; WIPE_START
G1 F18000
G1 X79.202 Y77.046 E-.3423
G1 X79.774 Y77.046 E-.21748
G1 X79.402 Y77.419 E-.20022
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.565 Y83.406 Z.92 F42000
G1 Z.52
G1 E.8 F1800
G1 F14894
M204 S6000
G1 X78.894 Y83.077 E.00614
G2 X79.285 Y83.259 I.854 J-1.333 E.0057
G1 X78.746 Y83.797 E.01005
G1 X78.746 Y84.37 E.00755
G1 X79.743 Y83.373 E.0186
G2 X80.303 Y83.385 I.333 J-2.407 E.00741
G1 X78.746 Y84.942 E.02904
G1 X78.746 Y85.514 E.00755
G1 X87.214 Y77.046 E.15796
G1 X87.787 Y77.046 E.00755
G1 X78.746 Y86.087 E.16864
G1 X78.746 Y86.659 E.00755
G1 X88.359 Y77.046 E.17931
G1 X88.931 Y77.046 E.00755
G1 X78.746 Y87.231 E.18999
G1 X78.746 Y87.804 E.00755
G1 X89.504 Y77.046 E.20067
G1 X90.076 Y77.046 E.00755
G1 X78.746 Y88.376 E.21134
G1 X78.746 Y88.948 E.00755
G1 X90.648 Y77.046 E.22202
G1 X91.22 Y77.046 E.00755
G1 X78.746 Y89.52 E.23269
G1 X78.746 Y90.093 E.00755
G1 X91.793 Y77.046 E.24337
G1 X92.365 Y77.046 E.00755
G1 X78.746 Y90.665 E.25405
G1 X78.746 Y91.237 E.00755
G1 X92.937 Y77.046 E.26472
G1 X93.51 Y77.046 E.00755
G1 X78.746 Y91.81 E.2754
G1 X78.746 Y92.382 E.00755
G1 X94.082 Y77.046 E.28607
G1 X94.654 Y77.046 E.00755
G1 X78.746 Y92.954 E.29675
G1 X78.746 Y93.527 E.00755
G1 X95.227 Y77.046 E.30742
G1 X95.799 Y77.046 E.00755
G1 X78.746 Y94.099 E.3181
G1 X78.746 Y94.671 E.00755
G1 X96.371 Y77.046 E.32878
G1 X96.943 Y77.046 E.00755
G1 X78.746 Y95.243 E.33945
G1 X78.746 Y95.816 E.00755
G1 X97.516 Y77.046 E.35013
G1 X98.088 Y77.046 E.00755
G1 X78.746 Y96.388 E.3608
G1 X78.746 Y96.96 E.00755
G1 X98.66 Y77.046 E.37148
G1 X99.233 Y77.046 E.00755
G1 X78.746 Y97.533 E.38216
G1 X78.746 Y98.105 E.00755
G1 X99.805 Y77.046 E.39283
G1 X100.377 Y77.046 E.00755
G1 X78.746 Y98.677 E.40351
G1 X78.746 Y99.25 E.00755
G1 X100.95 Y77.046 E.41418
G1 X101.252 Y77.046 E.00399
G1 X101.252 Y77.317 E.00356
G1 X78.746 Y99.822 E.41982
G1 X78.746 Y100.394 E.00755
G1 X101.252 Y77.889 E.41982
M73 P10 R14
G1 X101.252 Y78.461 E.00755
G1 X78.746 Y100.967 E.41982
G1 X78.746 Y101.539 E.00755
G1 X101.252 Y79.033 E.41982
G1 X101.252 Y79.606 E.00755
G1 X78.746 Y102.111 E.41982
G1 X78.746 Y102.683 E.00755
G1 X101.252 Y80.178 E.41982
G1 X101.252 Y80.75 E.00755
G1 X79.05 Y102.952 E.41415
G1 X79.623 Y102.952 E.00755
G1 X101.252 Y81.323 E.40348
G1 X101.252 Y81.895 E.00755
G1 X80.195 Y102.952 E.3928
G1 X80.767 Y102.952 E.00755
G1 X101.252 Y82.467 E.38213
G1 X101.252 Y83.04 E.00755
G1 X81.339 Y102.952 E.37145
G1 X81.912 Y102.952 E.00755
G1 X101.252 Y83.612 E.36078
G1 X101.252 Y84.184 E.00755
G1 X82.484 Y102.952 E.3501
G1 X83.056 Y102.952 E.00755
G1 X101.252 Y84.756 E.33943
G1 X101.252 Y85.329 E.00755
G1 X83.628 Y102.952 E.32875
G1 X84.201 Y102.952 E.00755
G1 X101.252 Y85.901 E.31808
G1 X101.252 Y86.473 E.00755
G1 X84.773 Y102.952 E.3074
G1 X85.345 Y102.952 E.00755
G1 X101.252 Y87.046 E.29673
G1 X101.252 Y87.618 E.00755
G1 X85.917 Y102.952 E.28605
G1 X86.49 Y102.952 E.00755
G1 X101.252 Y88.19 E.27538
G1 X101.252 Y88.763 E.00755
G1 X87.062 Y102.952 E.2647
G1 X87.634 Y102.953 E.00755
G1 X101.252 Y89.335 E.25403
G1 X101.252 Y89.907 E.00755
G1 X88.206 Y102.953 E.24335
G1 X88.779 Y102.953 E.00755
G1 X101.252 Y90.48 E.23268
G1 X101.252 Y91.052 E.00755
G1 X89.351 Y102.953 E.222
G1 X89.923 Y102.953 E.00755
G1 X101.252 Y91.624 E.21133
G1 X101.252 Y92.196 E.00755
G1 X90.495 Y102.953 E.20065
G1 X91.068 Y102.953 E.00755
G1 X101.252 Y92.769 E.18998
G1 X101.252 Y93.341 E.00755
G1 X91.64 Y102.953 E.1793
G1 X92.212 Y102.953 E.00755
G1 X101.252 Y93.913 E.16863
G1 X101.252 Y94.486 E.00755
G1 X92.784 Y102.953 E.15795
G1 X93.357 Y102.953 E.00755
G1 X101.252 Y95.058 E.14728
G1 X101.252 Y95.63 E.00755
G1 X93.929 Y102.953 E.1366
G1 X94.501 Y102.953 E.00755
G1 X101.252 Y96.203 E.12593
G1 X101.252 Y96.775 E.00755
G1 X95.074 Y102.953 E.11525
G1 X95.646 Y102.953 E.00755
G1 X101.252 Y97.347 E.10458
G1 X101.252 Y97.919 E.00755
G1 X96.218 Y102.953 E.0939
G1 X96.79 Y102.953 E.00755
G1 X101.252 Y98.492 E.08323
G1 X101.252 Y99.064 E.00755
G1 X97.363 Y102.953 E.07255
G1 X97.935 Y102.953 E.00755
G1 X101.252 Y99.636 E.06187
G1 X101.252 Y100.209 E.00755
G1 X98.507 Y102.953 E.0512
G1 X99.079 Y102.953 E.00755
G1 X101.252 Y100.781 E.04052
G1 X101.252 Y101.353 E.00755
G1 X99.652 Y102.953 E.02985
G1 X100.224 Y102.954 E.00755
G1 X101.252 Y101.926 E.01917
G1 X101.252 Y102.498 E.00755
G1 X100.615 Y103.135 E.01188
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X101.252 Y102.498 E-.34228
G1 X101.252 Y101.926 E-.21747
G1 X100.879 Y102.298 E-.20025
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/99
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.92 I.914 J-.803 P1  F42000
G1 X78.402 Y76.723 Z.92
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14884
M204 S6000
G1 X78.491 Y76.693 E.00133
G1 X101.483 Y76.694 E.32436
G3 X101.605 Y76.749 I.025 J.108 E.00203
G1 X101.606 Y102.749 E.36681
G3 X101.598 Y103.277 I-2.335 J.227 E.00747
G1 X101.509 Y103.307 E.00133
G1 X78.482 Y103.305 E.32486
G1 X78.41 Y103.292 E.00103
G1 X78.393 Y103.227 E.00095
G1 X78.393 Y82.098 E.29808
G1 X78.768 Y82.556 E.00835
G1 X78.988 Y82.723 E.00389
G1 X79.627 Y83.001 E.00983
G1 X80.15 Y83.057 E.00742
G2 X81.013 Y82.819 I-.163 J-2.279 E.01271
G1 X81.398 Y82.548 E.00664
G1 X81.692 Y82.214 E.00629
G1 X81.936 Y81.744 E.00746
G1 X82.043 Y81.343 E.00586
G1 X82.029 Y80.694 E.00916
G2 X81.383 Y79.575 I-2.086 J.458 E.01852
G1 X80.888 Y79.255 E.0083
G1 X80.415 Y79.102 E.00702
G1 X80.159 Y79.079 E.00363
G1 X79.676 Y79.128 E.00684
G1 X78.994 Y79.396 E.01034
G1 X78.83 Y79.514 E.00284
G1 X78.393 Y80.008 E.00931
G1 X78.402 Y76.783 E.04551
M204 S10000
G1 X78.034 Y76.487 F42000
G1 F14884
M204 S6000
G1 X78.168 Y76.338 E.00283
G1 X78.465 Y76.261 E.00433
G1 X101.483 Y76.261 E.32474
G1 X101.724 Y76.29 E.00343
G1 X101.94 Y76.437 E.00369
G1 X102.038 Y76.684 E.00375
G1 X102.039 Y103.202 E.37411
G1 X101.985 Y103.491 E.00415
G1 X101.833 Y103.661 E.00323
G1 X101.535 Y103.739 E.00434
G1 X78.482 Y103.738 E.32524
G1 X78.208 Y103.683 E.00394
G1 X78.033 Y103.521 E.00335
G1 X77.961 Y103.248 E.00399
G1 X77.961 Y82.742 E.28929
; LINE_WIDTH: 0.453478
G1 X77.962 Y81.8 E.0134
; LINE_WIDTH: 0.484638
G1 X77.978 Y81.37 E.00656
; LINE_WIDTH: 0.515798
G2 X77.977 Y80.6 I-4.541 J-.38 E.01253
; LINE_WIDTH: 0.482898
G1 X77.961 Y80.26 E.00516
; LINE_WIDTH: 0.449998
G1 X77.961 Y76.798 E.04884
G1 X78.009 Y76.54 E.00371
M204 S10000
G1 X77.76 Y76.133 F42000
G1 F14884
M204 S6000
G1 X77.793 Y76.082 E.00086
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
G1 X77.821 Y103.93 E.00472
G1 X77.616 Y103.671 E.00467
G1 X77.528 Y103.269 E.0058
G1 X77.528 Y77.269 E.36681
G3 X77.594 Y76.397 I2.674 J-.236 E.01239
G1 X77.728 Y76.184 E.00355
M204 S250
G1 X77.399 Y75.911 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X77.491 Y75.788 E.00202
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
G1 X77.402 Y104.114 E.00505
G1 X77.189 Y103.71 E.006
G1 X77.11 Y103.29 E.00562
G1 X77.11 Y77.29 E.34139
G3 X77.132 Y76.534 I4.525 J-.246 E.00994
G1 X77.263 Y76.094 E.00603
G1 X77.363 Y75.959 E.0022
; WIPE_START
M204 S6000
G1 X77.491 Y75.788 E-.08124
G1 X77.736 Y75.596 E-.11805
G1 X78.089 Y75.45 E-.1455
G1 X78.413 Y75.41 E-.12373
G1 X79.18 Y75.41 E-.29148
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.901 Y82.054 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14884
M204 S6000
G1 X78.717 Y81.829 E.0041
; LINE_WIDTH: 0.487973
G1 X78.61 Y81.604 E.00382
; LINE_WIDTH: 0.525948
G1 X78.504 Y81.379 E.00412
G1 X78.492 Y80.939 E.0073
; LINE_WIDTH: 0.515798
G1 X78.573 Y80.688 E.00429
; LINE_WIDTH: 0.482898
G1 X78.653 Y80.436 E.00401
; LINE_WIDTH: 0.449998
G1 X78.773 Y80.216 E.00354
G1 X79.083 Y79.865 E.00661
G1 X79.247 Y79.747 E.00284
G1 X79.73 Y79.557 E.00733
G1 X80.291 Y79.52 E.00794
G1 X80.73 Y79.658 E.00649
G1 X81.08 Y79.885 E.00588
G1 X81.366 Y80.195 E.00595
G1 X81.538 Y80.555 E.00564
G1 X81.621 Y80.964 E.00589
G1 X81.594 Y81.4 E.00616
G1 X81.379 Y81.89 E.00755
G1 X81.17 Y82.171 E.00495
G1 X80.799 Y82.443 E.00648
G1 X80.317 Y82.599 E.00716
G1 X79.9 Y82.61 E.00588
G1 X79.702 Y82.575 E.00284
G1 X79.25 Y82.377 E.00696
G1 X79.03 Y82.211 E.00389
G1 X78.939 Y82.1 E.00202
M204 S10000
G1 X79.226 Y81.787 F42000
G1 F14884
M204 S6000
G1 X79.107 Y81.641 E.00267
G1 X78.967 Y81.298 E.00522
G1 X78.958 Y80.939 E.00506
G3 X79.499 Y80.099 I1.123 J.128 E.01461
G1 X79.869 Y79.976 E.00549
G1 X80.265 Y79.954 E.0056
G1 X80.572 Y80.061 E.00458
G1 X80.923 Y80.335 E.00627
G3 X81.177 Y80.852 I-.916 J.773 E.0082
G1 X81.172 Y81.304 E.00638
G1 X80.942 Y81.777 E.00742
G1 X80.585 Y82.067 E.00649
G3 X79.777 Y82.148 I-.524 J-1.149 E.01167
G3 X79.296 Y81.861 I.427 J-1.26 E.00797
G1 X79.268 Y81.831 E.00058
M204 S250
G1 X79.541 Y81.529 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.379 Y81.226 E.00451
G1 X79.4 Y80.843 E.00503
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
G1 X79.589 Y81.564 E.00411
; WIPE_START
M204 S6000
G1 X79.379 Y81.226 E-.15128
G1 X79.4 Y80.843 E-.14561
G1 X79.579 Y80.556 E-.12875
G1 X79.836 Y80.402 E-.11362
G1 X80.232 Y80.377 E-.15091
G1 X80.399 Y80.453 E-.06984
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

G1 X81.371 Y79.368
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421828
G1 F14884
M204 S6000
G1 X79.05 Y77.046 E.04331
G1 X78.746 Y77.046 E.004
G1 X78.746 Y77.315 E.00355
G1 X80.157 Y78.726 E.02631
G1 X79.636 Y78.777 E.0069
G1 X78.746 Y77.888 E.0166
G1 X78.746 Y78.46 E.00755
M73 P11 R14
G1 X79.221 Y78.935 E.00886
G1 X78.81 Y79.096 E.00582
G1 X78.565 Y78.851 E.00457
M204 S10000
G1 X101.433 Y77.683 F42000
G1 F14884
M204 S6000
G1 X100.796 Y77.046 E.01188
G1 X100.224 Y77.046 E.00755
G1 X101.252 Y78.074 E.01918
G1 X101.252 Y78.647 E.00755
G1 X99.652 Y77.046 E.02985
G1 X99.079 Y77.046 E.00755
G1 X101.252 Y79.219 E.04053
G1 X101.252 Y79.791 E.00755
G1 X98.507 Y77.046 E.0512
G1 X97.935 Y77.046 E.00755
G1 X101.252 Y80.364 E.06188
G1 X101.252 Y80.936 E.00755
G1 X97.363 Y77.046 E.07255
G1 X96.79 Y77.046 E.00755
G1 X101.252 Y81.508 E.08323
G1 X101.252 Y82.081 E.00755
G1 X96.218 Y77.046 E.09391
G1 X95.646 Y77.046 E.00755
G1 X101.252 Y82.653 E.10458
G1 X101.252 Y83.225 E.00755
G1 X95.073 Y77.046 E.11526
G1 X94.501 Y77.046 E.00755
G1 X101.252 Y83.798 E.12593
G1 X101.252 Y84.37 E.00755
G1 X93.929 Y77.046 E.13661
G1 X93.357 Y77.046 E.00755
G1 X101.252 Y84.942 E.14728
G1 X101.252 Y85.515 E.00755
G1 X92.784 Y77.046 E.15796
G1 X92.212 Y77.046 E.00755
G1 X101.252 Y86.087 E.16863
G1 X101.252 Y86.659 E.00755
G1 X91.64 Y77.046 E.17931
G1 X91.067 Y77.046 E.00755
G1 X101.253 Y87.231 E.18998
G1 X101.253 Y87.804 E.00755
G1 X90.495 Y77.046 E.20066
G1 X89.923 Y77.046 E.00755
G1 X101.253 Y88.376 E.21134
G1 X101.253 Y88.948 E.00755
G1 X89.351 Y77.046 E.22201
G1 X88.778 Y77.046 E.00755
G1 X101.253 Y89.521 E.23269
G1 X101.253 Y90.093 E.00755
G1 X88.206 Y77.046 E.24336
G1 X87.634 Y77.046 E.00755
G1 X101.253 Y90.665 E.25404
G1 X101.253 Y91.238 E.00755
G1 X87.062 Y77.046 E.26471
G1 X86.489 Y77.046 E.00755
G1 X101.253 Y91.81 E.27539
G1 X101.253 Y92.382 E.00755
G1 X85.917 Y77.046 E.28607
G1 X85.345 Y77.046 E.00755
G1 X101.253 Y92.955 E.29674
G1 X101.253 Y93.527 E.00755
G1 X84.772 Y77.046 E.30742
G1 X84.2 Y77.046 E.00755
G1 X101.253 Y94.099 E.31809
G1 X101.253 Y94.672 E.00755
G1 X83.628 Y77.046 E.32877
G1 X83.056 Y77.046 E.00755
G1 X101.253 Y95.244 E.33944
G1 X101.253 Y95.816 E.00755
G1 X82.483 Y77.046 E.35012
G1 X81.911 Y77.046 E.00755
G1 X101.253 Y96.389 E.36079
G1 X101.253 Y96.961 E.00755
G1 X81.339 Y77.046 E.37147
G1 X80.766 Y77.046 E.00755
G1 X101.253 Y97.533 E.38215
G1 X101.253 Y98.105 E.00755
G1 X80.194 Y77.046 E.39282
G1 X79.622 Y77.046 E.00755
G1 X101.253 Y98.678 E.4035
G1 X101.253 Y99.25 E.00755
G1 X82.267 Y80.264 E.35416
G3 X82.406 Y80.975 I-2.301 J.82 E.0096
G1 X101.253 Y99.822 E.35156
G1 X101.253 Y100.395 E.00755
G1 X82.367 Y81.508 E.3523
G3 X82.23 Y81.943 I-1.287 J-.165 E.00605
G1 X101.253 Y100.967 E.35485
G1 X101.254 Y101.539 E.00755
G1 X82.035 Y82.32 E.3585
G3 X81.792 Y82.651 I-1.383 J-.76 E.00542
G1 X101.254 Y102.112 E.36301
G1 X101.254 Y102.684 E.00755
G1 X81.486 Y82.917 E.36873
G1 X81.145 Y83.147 E.00544
G1 X100.951 Y102.954 E.36945
G1 X100.379 Y102.954 E.00755
G1 X80.725 Y83.3 E.3666
G3 X80.251 Y83.398 I-.595 J-1.68 E.00641
G1 X99.806 Y102.953 E.36477
G1 X99.234 Y102.953 E.00755
G1 X79.643 Y83.362 E.36544
G1 X79.55 Y83.346 E.00124
G1 X78.786 Y83.013 E.01099
G1 X78.746 Y82.981 E.00068
G1 X78.746 Y83.038 E.00076
G1 X98.662 Y102.953 E.37148
G1 X98.089 Y102.953 E.00755
G1 X78.746 Y83.61 E.36081
G1 X78.746 Y84.183 E.00755
G1 X97.517 Y102.953 E.35013
G1 X96.945 Y102.953 E.00755
G1 X78.746 Y84.755 E.33946
G1 X78.746 Y85.327 E.00755
G1 X96.372 Y102.953 E.32878
G1 X95.8 Y102.953 E.00755
G1 X78.746 Y85.9 E.31811
G1 X78.746 Y86.472 E.00755
G1 X95.228 Y102.953 E.30743
G1 X94.655 Y102.953 E.00755
G1 X78.746 Y87.044 E.29676
G1 X78.746 Y87.616 E.00755
G1 X94.083 Y102.953 E.28608
G1 X93.511 Y102.953 E.00755
G1 X78.746 Y88.189 E.2754
G1 X78.746 Y88.761 E.00755
G1 X92.938 Y102.953 E.26473
G1 X92.366 Y102.953 E.00755
G1 X78.746 Y89.333 E.25405
G1 X78.746 Y89.905 E.00755
G1 X91.794 Y102.953 E.24338
G1 X91.221 Y102.953 E.00755
G1 X78.746 Y90.478 E.2327
G1 X78.746 Y91.05 E.00755
G1 X90.649 Y102.953 E.22203
G1 X90.077 Y102.953 E.00755
G1 X78.746 Y91.622 E.21135
G1 X78.746 Y92.195 E.00755
G1 X89.504 Y102.953 E.20067
G1 X88.932 Y102.953 E.00755
G1 X78.746 Y92.767 E.19
G1 X78.746 Y93.339 E.00755
G1 X88.36 Y102.953 E.17932
G1 X87.788 Y102.953 E.00755
G1 X78.746 Y93.911 E.16865
G1 X78.746 Y94.484 E.00755
G1 X87.215 Y102.953 E.15797
G1 X86.643 Y102.952 E.00755
G1 X78.746 Y95.056 E.1473
G1 X78.746 Y95.628 E.00755
G1 X86.071 Y102.952 E.13662
G1 X85.498 Y102.952 E.00755
G1 X78.746 Y96.2 E.12594
G1 X78.746 Y96.773 E.00755
G1 X84.926 Y102.952 E.11527
G1 X84.354 Y102.952 E.00755
G1 X78.746 Y97.345 E.10459
M73 P12 R14
G1 X78.746 Y97.917 E.00755
G1 X83.781 Y102.952 E.09392
G1 X83.209 Y102.952 E.00755
G1 X78.746 Y98.49 E.08324
G1 X78.746 Y99.062 E.00755
G1 X82.637 Y102.952 E.07257
G1 X82.064 Y102.952 E.00755
G1 X78.746 Y99.634 E.06189
G1 X78.746 Y100.206 E.00755
G1 X81.492 Y102.952 E.05122
G1 X80.92 Y102.952 E.00755
G1 X78.746 Y100.779 E.04054
G1 X78.746 Y101.351 E.00755
G1 X80.347 Y102.952 E.02986
G1 X79.775 Y102.952 E.00755
G1 X78.746 Y101.923 E.01919
G1 X78.746 Y102.496 E.00755
G1 X79.384 Y103.133 E.01189
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X78.746 Y102.496 E-.34267
G1 X78.746 Y101.923 E-.21746
G1 X79.118 Y102.295 E-.19987
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/99
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1 I1.216 J-.034 P1  F42000
G1 X78.402 Y76.725 Z1
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14892
M204 S6000
G1 X78.491 Y76.693 E.00134
G1 X101.483 Y76.694 E.32437
G1 X101.605 Y76.735 E.00181
G1 X101.605 Y103.22 E.37366
G3 X101.55 Y103.307 I-.082 J.008 E.00156
G1 X78.422 Y103.298 E.32628
G1 X78.393 Y103.209 E.00132
G1 X78.393 Y82.114 E.2976
G1 X78.448 Y82.203 E.00147
G1 X78.909 Y82.677 E.00933
G1 X79.079 Y82.786 E.00284
G1 X79.626 Y83.001 E.0083
G1 X80.15 Y83.057 E.00743
G2 X80.838 Y82.904 I-.224 J-2.64 E.00998
G1 X81.309 Y82.617 E.00778
G1 X81.592 Y82.352 E.00547
G1 X81.882 Y81.892 E.00767
G1 X82.007 Y81.517 E.00557
G1 X82.051 Y80.872 E.00912
G1 X81.937 Y80.388 E.00701
G1 X81.726 Y79.955 E.00679
G1 X81.383 Y79.575 E.00723
G1 X80.889 Y79.256 E.0083
G1 X80.415 Y79.102 E.00703
G1 X80.158 Y79.079 E.00363
G1 X79.676 Y79.128 E.00683
G1 X78.994 Y79.396 E.01034
G1 X78.83 Y79.513 E.00285
G1 X78.393 Y80.021 E.00945
G1 X78.402 Y76.785 E.04566
M204 S10000
G1 X78.038 Y76.483 F42000
G1 F14892
M204 S6000
G1 X78.166 Y76.339 E.00272
G1 X78.465 Y76.261 E.00436
G1 X101.483 Y76.261 E.32474
G1 X101.724 Y76.29 E.00342
G1 X101.931 Y76.429 E.00351
G1 X102.038 Y76.68 E.00386
G1 X102.037 Y103.22 E.37443
G1 X102.003 Y103.444 E.0032
G1 X101.854 Y103.644 E.00351
G1 X101.574 Y103.739 E.00418
G1 X78.498 Y103.739 E.32555
G1 X78.196 Y103.68 E.00435
G1 X78.033 Y103.52 E.00322
G1 X77.961 Y103.235 E.00415
G1 X77.961 Y81.967 E.30005
; LINE_WIDTH: 0.481488
G1 X77.976 Y81.466 E.0076
; LINE_WIDTH: 0.512978
G2 X77.976 Y80.642 I-5.115 J-.412 E.01332
; LINE_WIDTH: 0.481488
G1 X77.961 Y80.321 E.00487
; LINE_WIDTH: 0.449998
G1 X77.961 Y76.798 E.0497
G1 X78.01 Y76.534 E.00379
M204 S10000
G1 X77.762 Y76.13 F42000
G1 F14892
M204 S6000
G1 X77.793 Y76.082 E.00081
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
G1 X77.755 Y103.863 E.00436
G1 X77.609 Y103.626 E.00393
G1 X77.528 Y103.262 E.00527
G1 X77.528 Y77.262 E.36681
G3 X77.594 Y76.397 I2.649 J-.232 E.01229
G1 X77.73 Y76.181 E.00359
M204 S250
G1 X77.401 Y75.908 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X77.491 Y75.787 E.00197
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
G1 X77.536 Y104.255 E.00602
G1 X77.296 Y103.962 E.00497
G1 X77.15 Y103.611 E.005
G1 X77.11 Y103.287 E.00428
G1 X77.11 Y77.287 E.34139
G3 X77.132 Y76.533 I4.501 J-.245 E.00992
G1 X77.264 Y76.093 E.00603
G1 X77.366 Y75.956 E.00224
; WIPE_START
M204 S6000
G1 X77.491 Y75.787 E-.07984
G1 X77.734 Y75.598 E-.11709
G1 X78.092 Y75.449 E-.14724
G1 X78.413 Y75.41 E-.12303
G1 X79.183 Y75.41 E-.29281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.948 Y82.112 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14892
M204 S6000
G1 X78.817 Y81.978 E.00265
; LINE_WIDTH: 0.489668
G1 X78.663 Y81.69 E.00502
; LINE_WIDTH: 0.529338
G1 X78.509 Y81.403 E.00544
G1 X78.488 Y80.964 E.00734
; LINE_WIDTH: 0.512978
G1 X78.562 Y80.724 E.00406
; LINE_WIDTH: 0.481488
G1 X78.635 Y80.484 E.0038
; LINE_WIDTH: 0.449998
G1 X78.761 Y80.239 E.00388
G1 X79.083 Y79.865 E.00696
G1 X79.247 Y79.747 E.00285
G1 X79.73 Y79.557 E.00732
G1 X80.291 Y79.52 E.00793
G1 X80.73 Y79.658 E.0065
G1 X81.081 Y79.885 E.00588
G1 X81.366 Y80.195 E.00595
G1 X81.595 Y80.736 E.00828
G1 X81.618 Y81.043 E.00434
G1 X81.557 Y81.538 E.00704
G1 X81.341 Y81.959 E.00668
G1 X81.119 Y82.217 E.0048
G1 X80.675 Y82.503 E.00745
G1 X80.13 Y82.624 E.00788
G1 X79.701 Y82.575 E.00609
G1 X79.313 Y82.422 E.00588
G1 X79.144 Y82.313 E.00284
G1 X78.99 Y82.155 E.00311
M204 S10000
G1 X79.25 Y81.817 F42000
G1 F14892
M204 S6000
G1 X79.186 Y81.752 E.00129
G1 X78.974 Y81.322 E.00677
G1 X78.952 Y80.964 E.00506
G3 X79.784 Y79.987 I1.137 J.125 E.01922
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
G3 X79.379 Y81.949 I.491 J-.946 E.00285
G1 X79.292 Y81.86 E.00175
M204 S250
G1 X79.542 Y81.532 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.383 Y81.225 E.00455
G1 X79.392 Y80.872 E.00463
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
G1 X79.589 Y81.569 E.00304
; WIPE_START
M204 S6000
G1 X79.383 Y81.225 E-.1525
G1 X79.392 Y80.872 E-.13409
G1 X79.58 Y80.556 E-.13974
G1 X79.836 Y80.401 E-.11364
G1 X80.232 Y80.377 E-.15075
G1 X80.397 Y80.453 E-.06927
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

G1 X82.179 Y81.509
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421848
G1 F14892
M204 S6000
G1 X86.642 Y77.046 E.08325
G1 X86.07 Y77.046 E.00755
G1 X82.386 Y80.73 E.06871
G2 X82.27 Y80.274 I-1.402 J.114 E.00624
G1 X85.497 Y77.046 E.0602
G1 X84.925 Y77.046 E.00755
G1 X82.084 Y79.887 E.053
G2 X81.848 Y79.551 I-.817 J.323 E.00547
G1 X84.353 Y77.046 E.04673
G1 X83.78 Y77.046 E.00755
G1 X81.555 Y79.271 E.0415
G1 X81.208 Y79.047 E.00546
G1 X83.208 Y77.046 E.03731
G1 X82.636 Y77.046 E.00755
G1 X80.829 Y78.853 E.0337
G2 X80.366 Y78.744 I-.961 J3.039 E.00628
G1 X82.063 Y77.046 E.03166
G1 X81.491 Y77.046 E.00755
G1 X79.774 Y78.764 E.03204
G1 X79.617 Y78.779 E.00208
G1 X78.908 Y79.058 E.01005
G1 X80.919 Y77.046 E.03752
G1 X80.347 Y77.046 E.00755
G1 X78.746 Y78.647 E.02985
G1 X78.746 Y78.074 E.00755
G1 X79.774 Y77.046 E.01917
G1 X79.202 Y77.046 E.00755
G1 X78.565 Y77.683 E.01188
; WIPE_START
G1 F18000
G1 X79.202 Y77.046 E-.34225
G1 X79.774 Y77.046 E-.21747
G1 X79.402 Y77.419 E-.20028
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.565 Y83.406 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
G1 F14892
M204 S6000
G1 X78.888 Y83.083 E.00603
G1 X79.297 Y83.246 E.00581
G1 X78.746 Y83.797 E.01028
G1 X78.746 Y84.37 E.00755
G1 X79.737 Y83.379 E.01848
G2 X80.165 Y83.41 I.356 J-1.918 E.00566
G1 X80.296 Y83.392 E.00175
G1 X78.746 Y84.942 E.02891
G1 X78.746 Y85.514 E.00755
G1 X87.214 Y77.046 E.15796
G1 X87.787 Y77.046 E.00755
G1 X78.746 Y86.087 E.16864
G1 X78.746 Y86.659 E.00755
G1 X88.359 Y77.046 E.17931
G1 X88.931 Y77.046 E.00755
G1 X78.746 Y87.231 E.18999
G1 X78.746 Y87.803 E.00755
G1 X89.503 Y77.046 E.20066
G1 X90.076 Y77.046 E.00755
G1 X78.746 Y88.376 E.21134
G1 X78.746 Y88.948 E.00755
G1 X90.648 Y77.046 E.22202
G1 X91.22 Y77.046 E.00755
G1 X78.746 Y89.52 E.23269
G1 X78.746 Y90.093 E.00755
G1 X91.793 Y77.046 E.24337
G1 X92.365 Y77.046 E.00755
G1 X78.746 Y90.665 E.25404
G1 X78.746 Y91.237 E.00755
G1 X92.937 Y77.046 E.26472
G1 X93.51 Y77.046 E.00755
G1 X78.746 Y91.81 E.27539
G1 X78.746 Y92.382 E.00755
G1 X94.082 Y77.046 E.28607
G1 X94.654 Y77.046 E.00755
G1 X78.746 Y92.954 E.29675
G1 X78.746 Y93.526 E.00755
G1 X95.226 Y77.046 E.30742
G1 X95.799 Y77.046 E.00755
G1 X78.746 Y94.099 E.3181
G1 X78.746 Y94.671 E.00755
G1 X96.371 Y77.046 E.32877
G1 X96.943 Y77.046 E.00755
G1 X78.746 Y95.243 E.33945
G1 X78.746 Y95.816 E.00755
G1 X97.516 Y77.046 E.35013
G1 X98.088 Y77.046 E.00755
G1 X78.746 Y96.388 E.3608
G1 X78.746 Y96.96 E.00755
G1 X98.66 Y77.046 E.37148
G1 X99.233 Y77.046 E.00755
G1 X78.746 Y97.533 E.38215
G1 X78.746 Y98.105 E.00755
G1 X99.805 Y77.046 E.39283
G1 X100.377 Y77.046 E.00755
G1 X78.746 Y98.677 E.4035
G1 X78.746 Y99.25 E.00755
G1 X100.949 Y77.046 E.41418
G1 X101.252 Y77.046 E.00399
G1 X101.252 Y77.316 E.00356
G1 X78.746 Y99.822 E.41982
G1 X78.746 Y100.394 E.00755
G1 X101.252 Y77.889 E.41982
G1 X101.252 Y78.461 E.00755
G1 X78.746 Y100.966 E.41982
M73 P13 R14
G1 X78.746 Y101.539 E.00755
G1 X101.252 Y79.033 E.41982
G1 X101.252 Y79.606 E.00755
G1 X78.746 Y102.111 E.41982
M73 P13 R13
G1 X78.746 Y102.683 E.00755
G1 X101.252 Y80.178 E.41982
G1 X101.252 Y80.75 E.00755
G1 X79.048 Y102.954 E.41419
G1 X79.621 Y102.954 E.00755
G1 X101.252 Y81.323 E.40351
G1 X101.252 Y81.895 E.00755
G1 X80.193 Y102.954 E.39283
G1 X80.765 Y102.954 E.00755
G1 X101.252 Y82.467 E.38216
G1 X101.252 Y83.039 E.00755
G1 X81.338 Y102.954 E.37148
G1 X81.91 Y102.954 E.00755
G1 X101.252 Y83.612 E.36081
G1 X101.252 Y84.184 E.00755
G1 X82.482 Y102.954 E.35013
G1 X83.055 Y102.954 E.00755
G1 X101.252 Y84.756 E.33945
G1 X101.252 Y85.329 E.00755
G1 X83.627 Y102.954 E.32878
G1 X84.199 Y102.954 E.00755
G1 X101.252 Y85.901 E.3181
G1 X101.252 Y86.473 E.00755
G1 X84.771 Y102.954 E.30743
G1 X85.344 Y102.954 E.00755
G1 X101.252 Y87.046 E.29675
G1 X101.252 Y87.618 E.00755
G1 X85.916 Y102.954 E.28608
G1 X86.488 Y102.954 E.00755
G1 X101.252 Y88.19 E.2754
G1 X101.252 Y88.763 E.00755
G1 X87.061 Y102.954 E.26472
G1 X87.633 Y102.954 E.00755
G1 X101.252 Y89.335 E.25405
G1 X101.252 Y89.907 E.00755
G1 X88.205 Y102.954 E.24337
G1 X88.778 Y102.954 E.00755
G1 X101.252 Y90.479 E.2327
G1 X101.252 Y91.052 E.00755
G1 X89.35 Y102.954 E.22202
G1 X89.922 Y102.954 E.00755
G1 X101.252 Y91.624 E.21134
G1 X101.252 Y92.196 E.00755
G1 X90.494 Y102.954 E.20067
G1 X91.067 Y102.954 E.00755
G1 X101.252 Y92.769 E.18999
G1 X101.252 Y93.341 E.00755
G1 X91.639 Y102.954 E.17932
G1 X92.211 Y102.954 E.00755
G1 X101.252 Y93.913 E.16864
G1 X101.252 Y94.486 E.00755
G1 X92.784 Y102.954 E.15796
G1 X93.356 Y102.954 E.00755
G1 X101.252 Y95.058 E.14729
G1 X101.252 Y95.63 E.00755
G1 X93.928 Y102.954 E.13661
G1 X94.501 Y102.954 E.00755
G1 X101.252 Y96.203 E.12594
G1 X101.252 Y96.775 E.00755
G1 X95.073 Y102.954 E.11526
G1 X95.645 Y102.954 E.00755
G1 X101.252 Y97.347 E.10458
G1 X101.252 Y97.919 E.00755
G1 X96.218 Y102.954 E.09391
G1 X96.79 Y102.954 E.00755
G1 X101.252 Y98.492 E.08323
G1 X101.252 Y99.064 E.00755
G1 X97.362 Y102.954 E.07256
G1 X97.934 Y102.954 E.00755
G1 X101.252 Y99.636 E.06188
G1 X101.252 Y100.209 E.00755
G1 X98.507 Y102.954 E.0512
G1 X99.079 Y102.954 E.00755
G1 X101.252 Y100.781 E.04053
G1 X101.252 Y101.353 E.00755
G1 X99.651 Y102.954 E.02985
G1 X100.224 Y102.954 E.00755
G1 X101.252 Y101.926 E.01918
G1 X101.252 Y102.498 E.00755
G1 X100.615 Y103.135 E.01188
; CHANGE_LAYER
; Z_HEIGHT: 0.76
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X101.252 Y102.498 E-.34231
G1 X101.252 Y101.926 E-.21748
G1 X100.879 Y102.298 E-.20021
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/99
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.08 I.849 J-.872 P1  F42000
G1 X79.585 Y81.573 Z1.08
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.404 Y81.302 E.00428
G1 X79.368 Y81.01 E.00387
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
G1 X79.634 Y81.606 E.00396
; WIPE_START
M204 S6000
G1 X79.404 Y81.302 E-.14477
G1 X79.368 Y81.01 E-.112
G1 X79.497 Y80.653 E-.14419
G1 X79.761 Y80.431 E-.13121
G1 X80.072 Y80.356 E-.12172
G1 X80.241 Y80.381 E-.06483
G1 X80.337 Y80.432 E-.04128
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.9 Y83 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.357168
G1 F18000
M204 S6000
G1 X84.9 Y84 E.01108
; WIPE_START
G1 X84.9 Y83 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.9 Y90.632 Z1.16 F42000
G1 X84.9 Y97 Z1.16
G1 Z.76
G1 E.8 F1800
G1 F18000
M204 S6000
G1 X84.9 Y96 E.01108
; WIPE_START
G1 X84.9 Y97 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.344 Y89.808 Z1.16 F42000
G1 X77.404 Y75.905 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X77.491 Y75.787 E.00193
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
G1 X77.686 Y104.372 E.00408
G1 X77.403 Y104.115 E.00503
G1 X77.189 Y103.709 E.00603
G1 X77.11 Y103.29 E.0056
G1 X77.11 Y77.29 E.34139
G3 X77.132 Y76.535 I4.544 J-.246 E.00993
G1 X77.263 Y76.095 E.00603
G1 X77.368 Y75.953 E.00232
; WIPE_START
M204 S6000
G1 X77.491 Y75.787 E-.07859
G1 X77.736 Y75.596 E-.1179
G1 X78.09 Y75.45 E-.14556
G1 X78.413 Y75.41 E-.12366
G1 X79.187 Y75.41 E-.29429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.818 Y75.551 Z1.16 F42000
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

G1 X101.941 Y76.02
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
M204 S2000
G1 X102.667 Y76.746 E.01348
G1 X102.667 Y77.316
G1 X101.371 Y76.02 E.02406
G1 X100.801 Y76.02
G1 X102.667 Y77.885 E.03463
G1 X102.667 Y78.455
G1 X100.232 Y76.02 E.04521
G1 X99.662 Y76.02
G1 X102.667 Y79.025 E.05579
G1 X102.667 Y79.594
G1 X99.092 Y76.02 E.06637
G1 X98.523 Y76.02
G1 X102.667 Y80.164 E.07695
G1 X102.667 Y80.734
G1 X97.953 Y76.02 E.08753
G1 X97.383 Y76.02
G1 X102.667 Y81.303 E.09811
G1 X102.667 Y81.873
G1 X96.814 Y76.02 E.10868
G1 X96.244 Y76.02
G1 X102.667 Y82.443 E.11926
G1 X102.667 Y83.013
G1 X95.674 Y76.02 E.12984
G1 X95.105 Y76.02
G1 X102.667 Y83.582 E.14042
G1 X102.667 Y84.152
G1 X94.535 Y76.02 E.151
M73 P14 R13
G1 X93.965 Y76.02
G1 X102.667 Y84.722 E.16158
G1 X102.667 Y85.291
G1 X93.396 Y76.02 E.17216
G1 X92.826 Y76.02
G1 X102.667 Y85.861 E.18273
G1 X102.667 Y86.431
G1 X92.256 Y76.02 E.19331
G1 X91.686 Y76.02
G1 X102.667 Y87 E.20389
G1 X102.667 Y87.57
G1 X91.117 Y76.02 E.21447
G1 X90.547 Y76.02
G1 X102.667 Y88.14 E.22505
G1 X102.667 Y88.709
G1 X89.977 Y76.02 E.23563
G1 X89.408 Y76.02
G1 X102.667 Y89.279 E.24621
G1 X102.667 Y89.849
G1 X88.838 Y76.02 E.25678
G1 X88.268 Y76.02
G1 X102.667 Y90.418 E.26736
G1 X102.667 Y90.988
G1 X87.699 Y76.02 E.27794
G1 X87.129 Y76.02
G1 X102.667 Y91.558 E.28852
G1 X102.667 Y92.128
G1 X86.559 Y76.02 E.2991
G1 X85.601 Y75.632
G1 X102.667 Y92.697 E.31689
G1 X102.667 Y93.267
G1 X85.031 Y75.632 E.32747
G1 X84.462 Y75.632
G1 X102.667 Y93.837 E.33805
G1 X102.667 Y94.406
G1 X83.892 Y75.632 E.34863
G1 X83.322 Y75.632
G1 X102.667 Y94.976 E.35921
G1 X102.667 Y95.546
G1 X82.753 Y75.632 E.36978
G1 X82.183 Y75.632
G1 X102.667 Y96.115 E.38036
G1 X102.667 Y96.685
G1 X81.613 Y75.632 E.39094
G1 X81.044 Y75.632
G1 X102.667 Y97.255 E.40152
G1 X102.667 Y97.824
G1 X80.474 Y75.632 E.4121
G1 X79.904 Y75.632
G1 X102.667 Y98.394 E.42268
G1 X102.667 Y98.964
G1 X79.334 Y75.632 E.43326
G1 X78.765 Y75.632
G1 X102.667 Y99.533 E.44383
G1 X102.667 Y100.103
G1 X78.22 Y75.657 E.45394
G1 X77.812 Y75.818
G1 X84.924 Y82.93 E.13206
G1 X84.83 Y83.406
G1 X77.53 Y76.106 E.13555
G1 X77.359 Y76.504
G1 X84.83 Y83.975 E.13873
; WIPE_START
M204 S6000
G1 X83.416 Y82.561 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.593 Y80.309 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X77.332 Y77.047 E.06057
G1 X77.332 Y77.616
G1 X79.88 Y80.165 E.04733
G1 X79.493 Y80.348
G1 X77.332 Y78.186 E.04014
G1 X77.332 Y78.756
G1 X79.24 Y80.664 E.03544
G1 X79.145 Y81.139
G1 X77.332 Y79.326 E.03367
; WIPE_START
M204 S6000
G1 X78.746 Y80.74 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.97 Y82.976 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X102.667 Y100.673 E.32861
G1 X102.667 Y101.243
G1 X84.97 Y83.546 E.32861
G1 X84.925 Y84.07
G1 X102.667 Y101.812 E.32945
G1 X102.667 Y102.382
G1 X80.826 Y80.541 E.40556
G1 X80.971 Y81.256
G1 X102.667 Y102.952 E.40287
G1 X102.635 Y103.49
G1 X80.786 Y81.641 E.40571
G1 X80.468 Y81.893
G1 X102.476 Y103.9 E.40866
G1 X101.986 Y103.98
G1 X79.995 Y81.989 E.40836
; WIPE_START
M204 S6000
G1 X81.409 Y83.403 E-.76
; WIPE_END
M73 P15 R13
G1 E-.04 F1800
M204 S10000
G1 X77.332 Y79.895 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X101.416 Y103.98 E.44723
G1 X100.847 Y103.98
G1 X77.332 Y80.465 E.43665
G1 X77.332 Y81.035
G1 X100.277 Y103.98 E.42607
G1 X99.707 Y103.98
G1 X77.332 Y81.604 E.41549
G1 X77.332 Y82.174
G1 X99.137 Y103.98 E.40491
G1 X98.568 Y103.98
G1 X77.332 Y82.744 E.39434
G1 X77.332 Y83.313
G1 X97.998 Y103.98 E.38376
G1 X97.428 Y103.98
G1 X77.332 Y83.883 E.37318
G1 X77.332 Y84.453
G1 X96.859 Y103.98 E.3626
G1 X96.289 Y103.98
G1 X77.332 Y85.022 E.35202
G1 X77.332 Y85.592
G1 X95.719 Y103.98 E.34144
G1 X95.15 Y103.98
G1 X77.332 Y86.162 E.33086
G1 X77.332 Y86.731
G1 X94.58 Y103.98 E.32029
G1 X94.01 Y103.98
G1 X77.332 Y87.301 E.30971
G1 X77.332 Y87.871
G1 X93.441 Y103.98 E.29913
G1 X92.871 Y103.98
G1 X84.97 Y96.079 E.14671
G1 X84.97 Y96.649
G1 X92.301 Y103.98 E.13613
; WIPE_START
M204 S6000
G1 X90.887 Y102.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.738 Y96.932 Z1.16 F42000
G1 X84.83 Y95.939 Z1.16
G1 Z.76
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X77.332 Y88.441 E.13924
G1 X77.332 Y89.01
G1 X84.83 Y96.509 E.13924
; WIPE_START
M204 S6000
G1 X83.416 Y95.094 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.76 Y89.969 Z1.16 F42000
G1 X77.332 Y89.58 Z1.16
G1 Z.76
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X91.732 Y103.98 E.26739
G1 X91.162 Y103.98
G1 X77.332 Y90.15 E.25681
G1 X77.332 Y90.719
G1 X90.592 Y103.98 E.24624
G1 X90.022 Y103.98
G1 X77.332 Y91.289 E.23566
G1 X77.332 Y91.859
G1 X89.453 Y103.98 E.22508
G1 X88.883 Y103.98
G1 X77.332 Y92.428 E.2145
G1 X77.332 Y92.998
G1 X88.313 Y103.98 E.20392
G1 X87.744 Y103.98
G1 X77.332 Y93.568 E.19334
G1 X77.332 Y94.137
G1 X87.174 Y103.98 E.18276
G1 X86.604 Y103.98
G1 X77.332 Y94.707 E.17219
G1 X77.332 Y95.277
G1 X86.23 Y104.175 E.16523
G1 X85.852 Y104.367
G1 X77.332 Y95.846 E.15822
G1 X77.332 Y96.416
G1 X85.283 Y104.367 E.14764
G1 X84.713 Y104.367
G1 X77.332 Y96.986 E.13706
G1 X77.332 Y97.556
G1 X84.143 Y104.367 E.12648
G1 X83.573 Y104.367
G1 X77.332 Y98.125 E.11591
G1 X77.332 Y98.695
G1 X83.004 Y104.367 E.10533
G1 X82.434 Y104.367
G1 X77.332 Y99.265 E.09475
G1 X77.332 Y99.834
G1 X81.864 Y104.367 E.08417
G1 X81.294 Y104.367
G1 X77.332 Y100.404 E.07359
G1 X77.332 Y100.974
G1 X80.725 Y104.367 E.06301
G1 X80.155 Y104.367
G1 X77.332 Y101.543 E.05243
G1 X77.332 Y102.113
G1 X79.585 Y104.367 E.04185
G1 X79.016 Y104.367
G1 X77.332 Y102.683 E.03127
G1 X77.332 Y103.252
G1 X78.446 Y104.367 E.02069
; WIPE_START
M204 S6000
G1 X77.332 Y103.252 E-.59881
G1 X77.332 Y102.828 E-.1612
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.02 Y95.227 Z1.16 F42000
G1 X79.261 Y81.512 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0795082
G1 F18000
M204 S6000
G1 X79.21 Y81.438 E.00018
; LINE_WIDTH: 0.118662
G3 X79.068 Y81.215 I1.889 J-1.36 E.00087
; WIPE_START
G1 X79.21 Y81.438 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.919 Y82.064 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.131995
G1 F18000
M204 S6000
G3 X79.724 Y81.942 I1.978 J-3.366 E.00086
; LINE_WIDTH: 0.0805586
G1 X79.616 Y81.865 E.00027
; WIPE_START
G1 X79.724 Y81.942 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.815 Y80.553 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.175396
G1 F18000
M204 S6000
G1 X80.82 Y80.43 E.00063
; LINE_WIDTH: 0.220269
G2 X80.754 Y80.331 I-.163 J.037 E.00081
G1 X80.736 Y80.311 E.00018
; LINE_WIDTH: 0.19686
G1 X80.704 Y80.308 E.00019
; LINE_WIDTH: 0.159165
G1 X80.647 Y80.31 E.00026
; LINE_WIDTH: 0.132348
G1 X80.59 Y80.312 E.00021
; WIPE_START
G1 X80.647 Y80.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.089 Y82.811 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.0828633
G1 F18000
M204 S6000
M73 P16 R13
G1 X84.962 Y82.937 E.00038
M204 S10000
G1 X85.083 Y83.375 F42000
; LINE_WIDTH: 0.0729261
G1 F18000
M204 S6000
G1 X85.017 Y83.499 E.00026
M204 S10000
G1 X84.85 Y83.473 F42000
; LINE_WIDTH: 0.0793819
G1 F18000
M204 S6000
G2 X84.719 Y83.58 I.009 J.144 E.00037
; WIPE_START
G1 X84.772 Y83.502 E-.40305
G1 X84.85 Y83.473 E-.35695
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.997 Y91.104 Z1.16 F42000
G1 X85.089 Y95.914 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.0941973
G1 F18000
M204 S6000
G1 X84.769 Y96.046 E.00087
G2 X84.721 Y96.115 I.059 J.092 E.00021
M204 S10000
G1 X84.963 Y96.086 F42000
; LINE_WIDTH: 0.143577
G1 F18000
M204 S6000
G1 X85.017 Y95.937 E.00065
G1 X84.972 Y95.889 E.00027
G1 X84.838 Y95.93 E.00058
M204 S10000
G1 X84.85 Y96.717 F42000
; LINE_WIDTH: 0.0904669
G1 F18000
M204 S6000
G3 X84.735 Y96.651 I.027 J-.179 E.00032
G1 X84.766 Y96.572 E.0002
; WIPE_START
G1 X84.735 Y96.651 E-.29528
G1 X84.85 Y96.717 E-.46472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.773 Y102.416 Z1.16 F42000
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
G1 X82.921 Y98.45 Z1.16 F42000
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
G3 Z1.16 I.012 J-1.217 P1  F42000
G1 X77.377 Y75.93 Z1.16
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.402918
G1 F2097
M204 S5000
G1 X77.397 Y75.894 E.00052
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
G1 X77.564 Y104.274 E.00599
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
G1 X77.348 Y75.983 E.00417
; WIPE_START
G1 F12000
M204 S6000
G1 X77.397 Y75.894 E-.03847
G1 X77.698 Y75.618 E-.15511
G1 X78.064 Y75.457 E-.15199
G1 X78.412 Y75.405 E-.13394
G1 X79.15 Y75.405 E-.28049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.874 Y81.4 Z1.24 F42000
G1 X101.49 Y103.76 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2097
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.862 Y104.023 Z1.24 F42000
G1 X86.402 Y104.174 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2097
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
G1 F2097
M204 S6000
G1 X86.402 Y75.825 E.20462
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.969 Y79.932 Z1.24 F42000
G1 X79.529 Y81.49 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.385708
G1 F2097
M204 S5000
G1 X79.521 Y81.484 E.00012
G1 X79.402 Y81.238 E.00328
; LINE_WIDTH: 0.398068
G1 X79.402 Y80.877 E.00448
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
; LINE_WIDTH: 0.396148
G1 X80.768 Y81.065 E.00386
G1 X80.723 Y81.3 E.00295
; LINE_WIDTH: 0.394668
G1 X80.562 Y81.559 E.00375
G1 X80.273 Y81.725 E.0041
; LINE_WIDTH: 0.391608
G1 X79.986 Y81.75 E.00352
; LINE_WIDTH: 0.385708
G1 X79.727 Y81.664 E.00328
G1 X79.574 Y81.53 E.00244
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.484 E-.02669
G1 X79.402 Y81.238 E-.10391
G1 X79.402 Y80.877 E-.13705
G1 X79.535 Y80.62 E-.11002
G1 X79.721 Y80.464 E-.09199
G1 X79.979 Y80.377 E-.10355
G1 X80.288 Y80.409 E-.11822
G1 X80.445 Y80.497 E-.06858
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2097
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z1.24 F42000
G1 X85.146 Y97.246 Z1.24
G1 Z.84
G1 E.8 F1800
G1 F2097
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
M73 P17 R13
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
G1 X101.49 Y103.76 F42000
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2095
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.749 Y97.832 Z1.32 F42000
G1 X77.376 Y75.925 Z1.32
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.406448
G1 F2095
M204 S5000
G1 X77.383 Y75.914 E.00017
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
G1 X102.27 Y75.601 E.00532
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
G1 X77.348 Y75.978 E.00499
; WIPE_START
G1 F12000
M204 S6000
G1 X77.383 Y75.914 E-.02779
G1 X77.716 Y75.611 E-.17124
G1 X78.129 Y75.438 E-.17024
G1 X78.41 Y75.405 E-.10731
G1 X79.156 Y75.405 E-.28343
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.787 Y75.551 Z1.32 F42000
G1 X101.099 Y75.825 Z1.32
G1 Z.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444308
G1 F2095
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
G1 F2095
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
G1 X94.114 Y98.395 Z1.32 F42000
G1 X79.603 Y81.569 Z1.32
G1 Z.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.398068
G1 F2095
M204 S5000
G1 X79.421 Y81.314 E.00388
G1 X79.386 Y80.973 E.00425
; LINE_WIDTH: 0.388088
G1 X79.499 Y80.676 E.00385
; LINE_WIDTH: 0.389408
G1 X79.741 Y80.459 E.00394
; LINE_WIDTH: 0.410808
G1 X80.088 Y80.375 E.00457
G1 X80.355 Y80.433 E.00352
; LINE_WIDTH: 0.405288
G1 X80.578 Y80.593 E.00347
; LINE_WIDTH: 0.405608
G1 X80.723 Y80.83 E.00351
G1 X80.75 Y80.932 E.00134
; LINE_WIDTH: 0.389448
G1 X80.734 Y81.253 E.0039
G1 X80.601 Y81.508 E.00348
; LINE_WIDTH: 0.388228
G1 X80.387 Y81.679 E.00331
G1 X80.124 Y81.754 E.00331
G1 X79.852 Y81.721 E.00331
G1 X79.649 Y81.605 E.00283
; WIPE_START
G1 F12000
M204 S6000
G1 X79.421 Y81.314 E-.14037
G1 X79.386 Y80.973 E-.13013
G1 X79.499 Y80.676 E-.12098
G1 X79.741 Y80.459 E-.1235
G1 X80.088 Y80.375 E-.13548
G1 X80.355 Y80.433 E-.10419
G1 X80.367 Y80.441 E-.00536
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z1.32 F42000
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2095
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z1.32 F42000
G1 X85.146 Y97.246 Z1.32
G1 Z.92
G1 E.8 F1800
G1 F2095
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
G1 X77.378 Y75.921 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.406438
G1 F2070
M204 S5000
G1 X77.382 Y75.914 E.0001
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
M73 P18 R13
G1 X100.402 Y75.41 E.07878
G2 X101.575 Y75.404 I.348 J-43.14 E.01541
; LINE_WIDTH: 0.407348
G1 X101.947 Y75.457 E.00478
; LINE_WIDTH: 0.414828
G1 X102.29 Y75.614 E.00489
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
G1 X77.35 Y75.974 E.00504
; WIPE_START
G1 F12000
M204 S6000
G1 X77.382 Y75.914 E-.02584
G1 X77.716 Y75.611 E-.17139
G1 X78.129 Y75.438 E-.17036
G1 X78.41 Y75.405 E-.10731
G1 X79.16 Y75.405 E-.2851
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.882 Y81.401 Z1.4 F42000
G1 X101.49 Y103.76 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2070
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
M204 S10000
G1 X101.099 Y104.175 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2070
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
G1 F2070
M204 S6000
G1 X86.402 Y75.825 E.20462
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.985 Y79.958 Z1.4 F42000
G1 X79.554 Y81.524 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.405248
G1 F2070
M204 S5000
G1 X79.418 Y81.302 E.00329
G1 X79.377 Y81.031 E.00347
G1 X79.445 Y80.764 E.00348
; LINE_WIDTH: 0.414748
G1 X79.614 Y80.549 E.00354
G1 X79.837 Y80.412 E.00339
; LINE_WIDTH: 0.399768
G1 X80.199 Y80.386 E.00453
; LINE_WIDTH: 0.385668
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
G1 X79.598 Y81.563 E.0029
; WIPE_START
G1 F12000
M204 S6000
G1 X79.418 Y81.302 E-.1205
G1 X79.377 Y81.031 E-.10429
G1 X79.445 Y80.764 E-.10456
G1 X79.614 Y80.549 E-.10394
G1 X79.837 Y80.412 E-.09942
G1 X80.199 Y80.386 E-.13795
G1 X80.411 Y80.487 E-.08933
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2070
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z1.4 F42000
G1 X85.146 Y97.246 Z1.4
G1 Z1
G1 E.8 F1800
G1 F2070
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
G1 X77.386 Y75.92 F42000
G1 Z1.08
G1 E.8 F1800
; LINE_WIDTH: 0.408208
G1 F2070
M204 S5000
G1 X77.414 Y75.873 E.00071
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
G1 X102.292 Y75.613 E.00569
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
M73 P19 R13
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
G1 X77.355 Y75.972 E.0043
; WIPE_START
G1 F12000
M204 S6000
G1 X77.414 Y75.873 E-.04383
G1 X77.745 Y75.595 E-.16422
G1 X78.16 Y75.434 E-.16916
G1 X78.408 Y75.405 E-.09474
G1 X79.166 Y75.405 E-.28804
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.887 Y81.402 Z1.48 F42000
G1 X101.49 Y103.76 Z1.48
G1 Z1.08
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2070
M204 S5000
M73 P19 R12
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
M204 S10000
G1 X101.099 Y104.175 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2070
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
G1 F2070
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
G1 X81.993 Y79.969 Z1.48 F42000
G1 X79.565 Y81.539 Z1.48
G1 Z1.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.398108
G1 F2070
M204 S5000
G1 X79.403 Y81.247 E.00415
; LINE_WIDTH: 0.391208
G1 X79.386 Y80.964 E.00345
; LINE_WIDTH: 0.388668
G1 X79.486 Y80.694 E.00348
; LINE_WIDTH: 0.387628
G1 X79.742 Y80.46 E.0042
; LINE_WIDTH: 0.390668
G1 X80.016 Y80.374 E.00349
G1 X80.288 Y80.409 E.00334
; LINE_WIDTH: 0.398108
G1 X80.571 Y80.584 E.00413
; LINE_WIDTH: 0.408268
G1 X80.72 Y80.828 E.00365
G1 X80.737 Y80.883 E.00073
; LINE_WIDTH: 0.391208
G1 X80.746 Y81.211 E.004
; LINE_WIDTH: 0.387628
G1 X80.608 Y81.496 E.00382
G1 X80.387 Y81.678 E.00346
; LINE_WIDTH: 0.390868
G1 X80.124 Y81.756 E.00333
G1 X79.852 Y81.721 E.00334
; LINE_WIDTH: 0.398108
G1 X79.613 Y81.574 E.00348
; WIPE_START
G1 F12000
M204 S6000
G1 X79.403 Y81.247 E-.14764
G1 X79.386 Y80.964 E-.10766
G1 X79.486 Y80.694 E-.10931
G1 X79.742 Y80.46 E-.13204
G1 X80.016 Y80.374 E-.10906
G1 X80.288 Y80.409 E-.10431
G1 X80.4 Y80.478 E-.05
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z1.48 F42000
G1 Z1.08
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2070
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z1.48 F42000
G1 X85.146 Y97.246 Z1.48
G1 Z1.08
G1 E.8 F1800
G1 F2070
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
G1 X77.382 Y75.914 F42000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.405378
G1 F2070
M204 S5000
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
G1 X102.29 Y75.614 E.00489
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
M73 P20 R12
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
G1 X77.354 Y75.967 E.00515
; WIPE_START
G1 F12000
M204 S6000
G1 X77.716 Y75.611 E-.19318
G1 X78.129 Y75.438 E-.17015
G1 X78.41 Y75.405 E-.10731
G1 X79.171 Y75.405 E-.28936
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.892 Y81.403 Z1.56 F42000
G1 X101.49 Y103.76 Z1.56
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2070
M204 S5000
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
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.49 Y76.24 E.20326
G1 X101.498 Y75.939 E.00395
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
G1 X101.492 Y103.82 E.00316
M204 S10000
G1 X101.099 Y104.175 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2070
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
G1 F2070
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
G1 X81.986 Y79.959 Z1.56 F42000
G1 X79.555 Y81.526 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.405248
G1 F2070
M204 S5000
G1 X79.418 Y81.302 E.00332
G1 X79.386 Y80.964 E.0043
; LINE_WIDTH: 0.388628
G1 X79.486 Y80.694 E.00348
; LINE_WIDTH: 0.387608
G1 X79.742 Y80.46 E.00419
; LINE_WIDTH: 0.390588
G1 X80.016 Y80.375 E.00349
G1 X80.288 Y80.409 E.00334
; LINE_WIDTH: 0.388308
G1 X80.526 Y80.545 E.00331
; LINE_WIDTH: 0.398368
G1 X80.725 Y80.827 E.00428
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
G1 X79.6 Y81.565 E.00287
; WIPE_START
G1 F12000
M204 S6000
G1 X79.418 Y81.302 E-.12135
G1 X79.386 Y80.964 E-.12906
G1 X79.486 Y80.694 E-.10931
G1 X79.742 Y80.46 E-.13199
G1 X80.016 Y80.375 E-.10906
G1 X80.288 Y80.409 E-.10431
G1 X80.414 Y80.481 E-.05492
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2070
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z1.56 F42000
G1 X85.146 Y97.246 Z1.56
G1 Z1.16
G1 E.8 F1800
G1 F2070
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
G1 X101.49 Y103.76 F42000
G1 Z1.24
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2093
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
G1 X101.49 Y76.24 E.20326
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
M73 P21 R12
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
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.752 Y97.83 Z1.64 F42000
G1 X77.388 Y75.911 Z1.64
G1 Z1.24
G1 E.8 F1800
; LINE_WIDTH: 0.403948
G1 F2093
M204 S5000
G1 X77.39 Y75.908 E.00005
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
G1 X102.207 Y75.569 E.005
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
G1 X77.359 Y75.964 E.00464
; WIPE_START
G1 F12000
M204 S6000
G1 X77.39 Y75.908 E-.02432
G1 X77.697 Y75.619 E-.1604
G1 X77.998 Y75.476 E-.12654
G1 X78.415 Y75.405 E-.16051
G1 X79.173 Y75.405 E-.28823
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.804 Y75.551 Z1.64 F42000
G1 X101.099 Y75.825 Z1.64
G1 Z1.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444188
G1 F2093
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
G1 F2093
M204 S6000
G1 X86.402 Y104.175 E.20464
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.625 Y97.066 Z1.64 F42000
G1 X79.555 Y81.526 Z1.64
G1 Z1.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.405268
G1 F2093
M204 S5000
G1 X79.418 Y81.302 E.00331
G1 X79.386 Y80.964 E.0043
; LINE_WIDTH: 0.388648
G1 X79.486 Y80.694 E.00348
; LINE_WIDTH: 0.387588
G1 X79.742 Y80.46 E.00419
; LINE_WIDTH: 0.390508
G1 X80.016 Y80.375 E.00349
G1 X80.288 Y80.409 E.00334
; LINE_WIDTH: 0.388328
G1 X80.526 Y80.545 E.00331
; LINE_WIDTH: 0.398428
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
G1 X79.6 Y81.564 E.00288
; WIPE_START
G1 F12000
M204 S6000
G1 X79.418 Y81.302 E-.12103
G1 X79.386 Y80.964 E-.12914
G1 X79.486 Y80.694 E-.10933
G1 X79.742 Y80.46 E-.13195
G1 X80.016 Y80.375 E-.10902
G1 X80.288 Y80.409 E-.10425
G1 X80.414 Y80.481 E-.05527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z1.64 F42000
G1 Z1.24
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2093
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z1.64 F42000
G1 X85.146 Y97.246 Z1.64
G1 Z1.24
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
G1 X77.395 Y75.908 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.406448
G1 F2065
M204 S5000
G1 X77.415 Y75.871 E.00053
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
G1 X102.292 Y75.613 E.00569
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
G1 X77.365 Y75.96 E.00494
; WIPE_START
M73 P22 R12
G1 F12000
M204 S6000
G1 X77.415 Y75.871 E-.03865
G1 X77.746 Y75.594 E-.16399
G1 X78.129 Y75.438 E-.15723
G1 X78.41 Y75.405 E-.10731
G1 X79.18 Y75.405 E-.29281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.9 Y81.403 Z1.72 F42000
G1 X101.49 Y103.76 Z1.72
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2065
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
M204 S10000
G1 X101.099 Y104.175 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2065
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
G1 E.8 F1800
; LINE_WIDTH: 0.444168
G1 F2065
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
G1 X81.992 Y79.968 Z1.72 F42000
G1 X79.565 Y81.537 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.396248
G1 F2065
M204 S5000
G1 X79.404 Y81.246 E.00411
; LINE_WIDTH: 0.388028
G1 X79.387 Y80.964 E.00342
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
G1 X80.709 Y80.796 E.00348
G1 X80.763 Y81.065 E.00348
G1 X80.753 Y81.166 E.00129
; LINE_WIDTH: 0.385928
G1 X80.643 Y81.451 E.00367
; LINE_WIDTH: 0.389508
G1 X80.399 Y81.671 E.00399
; LINE_WIDTH: 0.394188
G1 X80.125 Y81.757 E.00354
G1 X79.852 Y81.723 E.00338
; LINE_WIDTH: 0.396248
G1 X79.612 Y81.573 E.00349
; WIPE_START
G1 F12000
M204 S6000
G1 X79.404 Y81.246 E-.14702
G1 X79.387 Y80.964 E-.10744
G1 X79.527 Y80.632 E-.13704
G1 X79.72 Y80.465 E-.09726
G1 X79.947 Y80.395 E-.0899
G1 X80.025 Y80.39 E-.03005
G1 X80.328 Y80.422 E-.11553
G1 X80.407 Y80.473 E-.03575
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2065
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z1.72 F42000
G1 X85.146 Y97.246 Z1.72
G1 Z1.32
G1 E.8 F1800
G1 F2065
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
G1 X101.49 Y103.76 F42000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2095
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.753 Y97.829 Z1.8 F42000
G1 X77.391 Y75.906 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.408248
G1 F2095
M204 S5000
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
M73 P23 R12
G1 X101.882 Y75.445 E.00388
; LINE_WIDTH: 0.410758
G1 X102.292 Y75.613 E.00568
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
G1 X77.362 Y75.959 E.00468
; WIPE_START
G1 F12000
M204 S6000
G1 X77.698 Y75.619 E-.18168
G1 X77.998 Y75.476 E-.12647
G1 X78.415 Y75.405 E-.16051
G1 X79.181 Y75.405 E-.29135
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.812 Y75.551 Z1.8 F42000
G1 X101.099 Y75.825 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444158
G1 F2095
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
G1 F2095
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
G1 X94.113 Y98.396 Z1.8 F42000
G1 X79.551 Y81.519 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.405248
G1 F2095
M204 S5000
G1 X79.418 Y81.302 E.00321
G1 X79.377 Y81.03 E.00348
G1 X79.479 Y80.706 E.00429
; LINE_WIDTH: 0.388668
G1 X79.676 Y80.496 E.00349
; LINE_WIDTH: 0.392008
G1 X80.002 Y80.377 E.00424
G1 X80.259 Y80.401 E.00316
; LINE_WIDTH: 0.385548
G1 X80.514 Y80.534 E.00345
; LINE_WIDTH: 0.396148
G1 X80.726 Y80.826 E.00446
; LINE_WIDTH: 0.404028
G1 X80.763 Y81.1 E.00348
G1 X80.696 Y81.366 E.00347
; LINE_WIDTH: 0.402988
G1 X80.528 Y81.588 E.00349
; LINE_WIDTH: 0.405888
G1 X80.326 Y81.71 E.003
G1 X80.053 Y81.758 E.00351
; LINE_WIDTH: 0.405248
G1 X79.785 Y81.697 E.00348
G1 X79.594 Y81.56 E.00298
; WIPE_START
G1 F12000
M204 S6000
G1 X79.418 Y81.302 E-.11831
G1 X79.377 Y81.03 E-.10444
G1 X79.479 Y80.706 E-.129
G1 X79.676 Y80.496 E-.10946
G1 X80.002 Y80.377 E-.13196
G1 X80.259 Y80.401 E-.09819
G1 X80.419 Y80.485 E-.06862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2095
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z1.8 F42000
G1 X85.146 Y97.246 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F2095
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
G1 X101.49 Y103.76 F42000
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2102
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.753 Y97.829 Z1.88 F42000
G1 X77.39 Y75.906 Z1.88
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.408238
G1 F2102
M204 S5000
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
G1 X102.29 Y75.615 E.00489
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
M73 P24 R12
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
G1 X77.361 Y75.959 E.00468
; WIPE_START
G1 F12000
M204 S6000
G1 X77.697 Y75.619 E-.18161
G1 X78.064 Y75.457 E-.15219
G1 X78.412 Y75.405 E-.13393
G1 X79.181 Y75.405 E-.29227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.812 Y75.551 Z1.88 F42000
G1 X101.099 Y75.825 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444158
G1 F2102
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
G1 F2102
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
G1 X94.113 Y98.396 Z1.88 F42000
G1 X79.525 Y81.487 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2102
M204 S5000
G1 X79.521 Y81.483 E.00006
G1 X79.402 Y81.237 E.00328
G1 X79.391 Y80.937 E.0036
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
; LINE_WIDTH: 0.398408
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.38 E.00447
; LINE_WIDTH: 0.389228
G1 X80.502 Y81.603 E.00348
; LINE_WIDTH: 0.389368
G1 X80.26 Y81.731 E.00332
G1 X79.987 Y81.75 E.00332
; LINE_WIDTH: 0.384968
G1 X79.727 Y81.663 E.00328
G1 X79.57 Y81.526 E.0025
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.02484
G1 X79.402 Y81.237 E-.1039
G1 X79.391 Y80.937 E-.11418
G1 X79.53 Y80.633 E-.1269
G1 X79.749 Y80.446 E-.10952
G1 X79.979 Y80.376 E-.09115
G1 X80.289 Y80.404 E-.11834
G1 X80.452 Y80.497 E-.07117
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2102
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z1.88 F42000
G1 X85.146 Y97.246 Z1.88
G1 Z1.48
G1 E.8 F1800
G1 F2102
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
G1 X101.49 Y103.76 F42000
G1 Z1.56
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2103
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.754 Y97.828 Z1.96 F42000
G1 X77.394 Y75.903 Z1.96
G1 Z1.56
G1 E.8 F1800
; LINE_WIDTH: 0.408238
G1 F2103
M204 S5000
G1 X77.698 Y75.619 E.0053
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
G1 X102.207 Y75.569 E.005
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
M73 P25 R12
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
G1 X77.364 Y75.955 E.00474
; WIPE_START
G1 F12000
M204 S6000
G1 X77.698 Y75.619 E-.17999
G1 X78.064 Y75.457 E-.15205
G1 X78.412 Y75.405 E-.13397
G1 X79.186 Y75.405 E-.294
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.817 Y75.551 Z1.96 F42000
G1 X101.099 Y75.825 Z1.96
G1 Z1.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444158
G1 F2103
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
G1 X94.113 Y98.396 Z1.96 F42000
G1 X79.525 Y81.486 Z1.96
G1 Z1.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2103
M204 S5000
G1 X79.521 Y81.483 E.00006
G1 X79.402 Y81.237 E.00328
G1 X79.388 Y80.964 E.00328
G1 X79.48 Y80.707 E.00328
G1 X79.687 Y80.489 E.0036
; LINE_WIDTH: 0.392868
G1 X80.002 Y80.377 E.00409
; LINE_WIDTH: 0.399228
G1 X80.289 Y80.403 E.00359
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398188
G1 X80.696 Y80.76 E.00342
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.38 E.00447
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00349
G1 X80.259 Y81.729 E.00333
; LINE_WIDTH: 0.384968
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.57 Y81.526 E.0025
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.02459
G1 X79.402 Y81.237 E-.10392
G1 X79.388 Y80.964 E-.10382
G1 X79.48 Y80.707 E-.10385
G1 X79.687 Y80.489 E-.11424
G1 X80.002 Y80.377 E-.12698
G1 X80.289 Y80.403 E-.1095
G1 X80.456 Y80.499 E-.0731
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z1.96 F42000
G1 Z1.56
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2103
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z1.96 F42000
G1 X85.146 Y97.246 Z1.96
G1 Z1.56
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
G1 X101.49 Y103.76 F42000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2099
M204 S5000
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
M73 P25 R11
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.755 Y97.828 Z2.04 F42000
G1 X77.398 Y75.899 Z2.04
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.408238
G1 F2099
M204 S5000
G1 X77.697 Y75.619 E.00523
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
G1 X102.147 Y75.539 E.00482
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
M73 P26 R11
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
G1 X77.367 Y75.949 E.0048
; WIPE_START
G1 F12000
M204 S6000
G1 X77.697 Y75.619 E-.1778
G1 X78.064 Y75.457 E-.15217
G1 X78.413 Y75.405 E-.1341
G1 X79.192 Y75.405 E-.29593
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.823 Y75.551 Z2.04 F42000
G1 X101.099 Y75.825 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444118
G1 F2099
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
G1 F2099
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.621 Y97.067 Z2.04 F42000
G1 X79.524 Y81.485 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384988
G1 F2099
M204 S5000
G1 X79.521 Y81.483 E.00004
G1 X79.402 Y81.237 E.00328
G1 X79.391 Y80.937 E.0036
; LINE_WIDTH: 0.392868
G1 X79.53 Y80.633 E.00409
; LINE_WIDTH: 0.396088
G1 X79.783 Y80.429 E.00402
G1 X80.154 Y80.378 E.00462
; LINE_WIDTH: 0.394028
G1 X80.493 Y80.518 E.00451
; LINE_WIDTH: 0.403988
G1 X80.695 Y80.764 E.00401
; LINE_WIDTH: 0.410848
G1 X80.76 Y81.031 E.00352
G1 X80.757 Y81.122 E.00118
; LINE_WIDTH: 0.388008
G1 X80.677 Y81.393 E.00341
; LINE_WIDTH: 0.389388
G1 X80.503 Y81.605 E.00332
G1 X80.259 Y81.729 E.00333
; LINE_WIDTH: 0.384988
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.664 E.00327
G1 X79.569 Y81.525 E.00252
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.024
G1 X79.402 Y81.237 E-.10395
G1 X79.391 Y80.937 E-.11416
G1 X79.53 Y80.633 E-.12698
G1 X79.783 Y80.429 E-.12359
G1 X80.154 Y80.378 E-.14226
G1 X80.458 Y80.504 E-.12506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2099
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z2.04 F42000
G1 X85.146 Y97.246 Z2.04
G1 Z1.64
G1 E.8 F1800
G1 F2099
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
G1 X101.49 Y103.76 F42000
G1 Z1.72
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2100
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.756 Y97.827 Z2.12 F42000
G1 X77.402 Y75.895 Z2.12
G1 Z1.72
G1 E.8 F1800
; LINE_WIDTH: 0.408228
G1 F2100
M204 S5000
G1 X77.698 Y75.619 E.00515
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
G1 X102.207 Y75.569 E.005
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
M73 P27 R11
G1 X77.104 Y77.288 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.725 E.00718
G1 X77.182 Y76.283 E.00572
; LINE_WIDTH: 0.403618
G1 X77.369 Y75.944 E.00488
; WIPE_START
G1 F12000
M204 S6000
G1 X77.698 Y75.619 E-.17568
G1 X78.064 Y75.457 E-.15221
G1 X78.412 Y75.405 E-.13385
G1 X79.197 Y75.405 E-.29826
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.828 Y75.551 Z2.12 F42000
G1 X101.099 Y75.825 Z2.12
G1 Z1.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444138
G1 F2100
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
G1 F2100
M204 S6000
G1 X86.402 Y104.175 E.20464
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.621 Y97.067 Z2.12 F42000
G1 X79.523 Y81.485 Z2.12
G1 Z1.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384988
G1 F2100
M204 S5000
G1 X79.521 Y81.483 E.00003
G1 X79.402 Y81.237 E.00328
G1 X79.391 Y80.937 E.0036
; LINE_WIDTH: 0.392868
G1 X79.53 Y80.633 E.00409
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.392388
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398228
G1 X80.512 Y81.593 E.0045
; LINE_WIDTH: 0.387528
G1 X80.259 Y81.728 E.00346
; LINE_WIDTH: 0.384988
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.664 E.00327
G1 X79.568 Y81.524 E.00254
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.02365
G1 X79.402 Y81.237 E-.10383
G1 X79.391 Y80.937 E-.11417
G1 X79.53 Y80.633 E-.12699
G1 X79.751 Y80.449 E-.10943
G1 X80.016 Y80.374 E-.10444
G1 X80.289 Y80.403 E-.10454
G1 X80.456 Y80.499 E-.07296
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z2.12 F42000
G1 Z1.72
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2100
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z2.12 F42000
G1 X85.146 Y97.246 Z2.12
G1 Z1.72
G1 E.8 F1800
G1 F2100
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
G1 X101.49 Y103.76 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2102
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.757 Y97.826 Z2.2 F42000
G1 X77.406 Y75.891 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.405138
G1 F2102
M204 S5000
G1 X77.704 Y75.62 E.00509
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
G1 X102.292 Y75.613 E.00568
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
G1 X77.372 Y75.939 E.00494
; WIPE_START
G1 F12000
M204 S6000
G1 X77.704 Y75.62 E-.17514
G1 X78.063 Y75.456 E-.15009
G1 X78.412 Y75.405 E-.134
G1 X79.204 Y75.405 E-.30077
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.835 Y75.551 Z2.2 F42000
G1 X101.099 Y75.825 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444118
G1 F2102
M204 S6000
G1 X94.402 Y75.825 E.0932
; LINE_WIDTH: 0.444228
G1 X86.402 Y75.825 E.11136
; WIPE_START
G1 F18000
M73 P28 R11
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.865 Y83.439 Z2.2 F42000
G1 X86.402 Y104.174 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.443218
G1 F2102
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
G1 X94.113 Y98.396 Z2.2 F42000
G1 X79.522 Y81.484 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384948
G1 F2102
M204 S5000
G1 X79.521 Y81.483 E.00001
G1 X79.402 Y81.237 E.00328
G1 X79.391 Y80.937 E.0036
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
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398208
G1 X80.514 Y81.595 E.00451
; LINE_WIDTH: 0.392408
G1 X80.259 Y81.729 E.00352
; LINE_WIDTH: 0.384948
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.664 E.00327
G1 X79.567 Y81.523 E.00255
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.02325
G1 X79.402 Y81.237 E-.1039
G1 X79.391 Y80.937 E-.11419
G1 X79.53 Y80.633 E-.12694
G1 X79.751 Y80.449 E-.10938
G1 X80.016 Y80.374 E-.10446
G1 X80.289 Y80.403 E-.10446
G1 X80.456 Y80.5 E-.07342
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2102
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z2.2 F42000
G1 X85.146 Y97.246 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F2102
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
G1 X101.49 Y103.76 F42000
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2099
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.758 Y97.825 Z2.28 F42000
G1 X77.411 Y75.887 Z2.28
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.408238
G1 F2099
M204 S5000
G1 X77.698 Y75.619 E.00501
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
G1 X102.207 Y75.569 E.005
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
G1 X77.375 Y75.934 E.00506
; WIPE_START
G1 F12000
M204 S6000
G1 X77.698 Y75.619 E-.1715
G1 X77.998 Y75.476 E-.12637
G1 X78.415 Y75.405 E-.16056
G1 X79.208 Y75.405 E-.30157
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.839 Y75.552 Z2.28 F42000
G1 X101.099 Y75.825 Z2.28
G1 Z1.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444108
G1 F2099
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
G1 F2099
M204 S6000
G1 X86.402 Y104.175 E.20464
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
M73 P29 R11
G1 E-.04 F1800
M204 S10000
G1 X85.621 Y97.067 Z2.28 F42000
G1 X79.521 Y81.483 Z2.28
G1 Z1.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384948
G1 F2099
M204 S5000
G1 X79.521 Y81.483 E0
G1 X79.402 Y81.237 E.00328
G1 X79.391 Y80.937 E.0036
; LINE_WIDTH: 0.392848
G1 X79.53 Y80.633 E.00409
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00402
G1 X80.154 Y80.378 E.00463
; LINE_WIDTH: 0.389428
G1 X80.464 Y80.498 E.00403
; LINE_WIDTH: 0.397948
G1 X80.69 Y80.752 E.00423
; LINE_WIDTH: 0.398428
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
G1 X79.567 Y81.523 E.00256
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.02287
G1 X79.402 Y81.237 E-.10384
G1 X79.391 Y80.937 E-.11423
G1 X79.53 Y80.633 E-.12695
G1 X79.783 Y80.429 E-.12356
G1 X80.154 Y80.378 E-.14232
G1 X80.464 Y80.498 E-.1262
G1 X80.464 Y80.498 E-.00003
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z2.28 F42000
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2099
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z2.28 F42000
G1 X85.146 Y97.246 Z2.28
G1 Z1.88
G1 E.8 F1800
G1 F2099
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
G1 X101.49 Y103.76 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2094
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.759 Y97.824 Z2.36 F42000
G1 X77.416 Y75.883 Z2.36
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.408378
G1 F2094
M204 S5000
G1 X77.698 Y75.618 E.00494
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
G1 X102.207 Y75.569 E.005
; LINE_WIDTH: 0.404238
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
G1 X77.379 Y75.929 E.0051
; WIPE_START
G1 F12000
M204 S6000
G1 X77.698 Y75.618 E-.16943
G1 X78.064 Y75.457 E-.1518
G1 X78.412 Y75.405 E-.13392
G1 X79.215 Y75.405 E-.30485
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.846 Y75.552 Z2.36 F42000
G1 X101.099 Y75.825 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444088
G1 F2094
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
G1 F2094
M204 S6000
G1 X86.402 Y104.175 E.20464
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.617 Y97.069 Z2.36 F42000
G1 X79.486 Y81.426 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392888
M73 P30 R11
G1 F2094
M204 S5000
G1 X79.471 Y81.41 E.00027
G1 X79.38 Y81.137 E.00353
; LINE_WIDTH: 0.392368
G1 X79.407 Y80.863 E.00336
G1 X79.537 Y80.621 E.00336
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398208
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00349
G1 X80.259 Y81.729 E.00333
; LINE_WIDTH: 0.384988
G1 X79.986 Y81.75 E.00328
G1 X79.703 Y81.651 E.0036
; LINE_WIDTH: 0.392888
G1 X79.528 Y81.469 E.00309
; WIPE_START
G1 F12000
M204 S6000
G1 X79.471 Y81.41 E-.03111
G1 X79.38 Y81.137 E-.10941
G1 X79.407 Y80.863 E-.10436
G1 X79.537 Y80.621 E-.10448
G1 X79.751 Y80.449 E-.10443
G1 X80.016 Y80.374 E-.10445
G1 X80.289 Y80.403 E-.10449
G1 X80.511 Y80.531 E-.09728
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2094
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z2.36 F42000
G1 X85.146 Y97.246 Z2.36
G1 Z1.96
G1 E.8 F1800
G1 F2094
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
G1 X101.49 Y103.76 F42000
G1 Z2.04
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2102
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.76 Y97.824 Z2.44 F42000
G1 X77.42 Y75.879 Z2.44
G1 Z2.04
G1 E.8 F1800
; LINE_WIDTH: 0.408228
G1 F2102
M204 S5000
G1 X77.697 Y75.619 E.00485
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
G1 X102.29 Y75.614 E.00489
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
G1 X77.381 Y75.924 E.00522
; WIPE_START
G1 F12000
M204 S6000
G1 X77.697 Y75.619 E-.16698
G1 X78.012 Y75.472 E-.13187
G1 X78.414 Y75.405 E-.155
G1 X79.22 Y75.405 E-.30615
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.851 Y75.552 Z2.44 F42000
G1 X101.099 Y75.825 Z2.44
G1 Z2.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444008
G1 F2102
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
G1 F2102
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
G1 X94.113 Y98.396 Z2.44 F42000
G1 X79.521 Y81.482 Z2.44
G1 Z2.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384988
G1 F2102
M204 S5000
G1 X79.402 Y81.237 E.00326
G1 X79.391 Y80.937 E.0036
; LINE_WIDTH: 0.392848
G1 X79.53 Y80.633 E.00409
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.392348
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399228
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
G1 X80.767 Y81.03 E.00347
; LINE_WIDTH: 0.397468
G1 X80.684 Y81.38 E.00445
; LINE_WIDTH: 0.389608
G1 X80.503 Y81.605 E.0035
; LINE_WIDTH: 0.389388
G1 X80.259 Y81.729 E.00333
; LINE_WIDTH: 0.384988
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.664 E.00328
G1 X79.566 Y81.522 E.00257
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.12483
G1 X79.391 Y80.937 E-.11417
G1 X79.53 Y80.633 E-.12694
G1 X79.751 Y80.449 E-.10946
G1 X80.016 Y80.374 E-.10444
G1 X80.289 Y80.403 E-.10447
G1 X80.462 Y80.503 E-.07569
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z2.44 F42000
G1 Z2.04
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2102
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z2.44 F42000
G1 X85.146 Y97.246 Z2.44
G1 Z2.04
M73 P31 R11
G1 E.8 F1800
G1 F2102
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
G1 X101.49 Y103.76 F42000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2102
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.761 Y97.822 Z2.52 F42000
G1 X77.424 Y75.867 Z2.52
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.408228
G1 F2102
M204 S5000
G1 X77.426 Y75.864 E.00004
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
G1 X102.29 Y75.615 E.00489
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
M73 P31 R10
G1 X77.106 Y76.7 E.03298
; LINE_WIDTH: 0.408228
G1 X77.182 Y76.262 E.00567
G1 X77.393 Y75.918 E.00514
; WIPE_START
G1 F12000
M204 S6000
G1 X77.426 Y75.864 E-.02399
G1 X77.756 Y75.585 E-.16426
G1 X78.159 Y75.434 E-.16385
G1 X78.408 Y75.405 E-.0951
G1 X79.231 Y75.405 E-.31281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.862 Y75.552 Z2.52 F42000
G1 X101.099 Y75.825 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443988
G1 F2102
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
G1 F2102
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
G1 X94.113 Y98.396 Z2.52 F42000
G1 X79.519 Y81.482 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.388208
G1 F2102
M204 S5000
G1 X79.4 Y81.238 E.00329
G1 X79.386 Y80.964 E.00331
G1 X79.479 Y80.707 E.00331
; LINE_WIDTH: 0.404488
G1 X79.723 Y80.464 E.00435
G1 X79.981 Y80.376 E.00344
; LINE_WIDTH: 0.402448
G1 X80.289 Y80.404 E.00388
; LINE_WIDTH: 0.398168
G1 X80.528 Y80.541 E.00342
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398388
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
G1 X79.563 Y81.522 E.00262
; WIPE_START
G1 F12000
M204 S6000
G1 X79.4 Y81.238 E-.12459
G1 X79.386 Y80.964 E-.10416
G1 X79.479 Y80.707 E-.10395
G1 X79.723 Y80.464 E-.13086
G1 X79.981 Y80.376 E-.10353
G1 X80.289 Y80.404 E-.1175
G1 X80.461 Y80.503 E-.07542
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2102
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z2.52 F42000
G1 X85.146 Y97.246 Z2.52
G1 Z2.12
G1 E.8 F1800
G1 F2102
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
G1 X101.49 Y103.76 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2100
M204 S5000
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
M73 P32 R10
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.762 Y97.821 Z2.6 F42000
G1 X77.428 Y75.863 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.408208
G1 F2100
M204 S5000
G1 X77.429 Y75.862 E.00002
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
G1 X102.27 Y75.601 E.00531
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
G1 X77.194 Y76.238 E.00599
G1 X77.396 Y75.914 E.00487
; WIPE_START
G1 F12000
M204 S6000
G1 X77.429 Y75.862 E-.02329
G1 X77.758 Y75.583 E-.16382
G1 X78.159 Y75.434 E-.16276
G1 X78.408 Y75.405 E-.09521
G1 X79.237 Y75.405 E-.31492
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.868 Y75.552 Z2.6 F42000
G1 X101.099 Y75.825 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443988
G1 F2100
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
G1 X91.522 Y82.791 Z2.6 F42000
G1 X101.099 Y104.175 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2100
M204 S6000
G1 X86.402 Y104.175 E.20464
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.62 Y97.068 Z2.6 F42000
G1 X79.519 Y81.482 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.388208
G1 F2100
M204 S5000
G1 X79.401 Y81.238 E.00328
; LINE_WIDTH: 0.404468
G1 X79.398 Y80.894 E.00435
G1 X79.516 Y80.645 E.00347
; LINE_WIDTH: 0.402708
G1 X79.723 Y80.463 E.00346
G1 X79.981 Y80.376 E.00343
; LINE_WIDTH: 0.402448
G1 X80.289 Y80.404 E.00388
; LINE_WIDTH: 0.398208
G1 X80.529 Y80.541 E.00343
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398408
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.392748
G1 X80.505 Y81.606 E.00352
G1 X80.26 Y81.731 E.00336
; LINE_WIDTH: 0.390868
G1 X79.986 Y81.751 E.00335
; LINE_WIDTH: 0.388208
G1 X79.726 Y81.665 E.00332
G1 X79.563 Y81.522 E.00262
; WIPE_START
G1 F12000
M204 S6000
G1 X79.401 Y81.238 E-.12445
G1 X79.398 Y80.894 E-.13082
G1 X79.516 Y80.645 E-.10456
G1 X79.723 Y80.463 E-.10459
G1 X79.981 Y80.376 E-.10363
G1 X80.289 Y80.404 E-.11742
G1 X80.459 Y80.501 E-.07453
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2100
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z2.6 F42000
G1 X85.146 Y97.246 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F2100
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
G1 X77.433 Y75.868 F42000
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.405378
G1 F2092
M204 S5000
G1 X77.716 Y75.611 E.00483
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
M73 P33 R10
G1 X102.207 Y75.569 E.005
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
G1 X77.389 Y75.908 E.00012
; WIPE_START
G1 F12000
M204 S6000
G1 X77.716 Y75.611 E-.16787
G1 X78.129 Y75.438 E-.17028
G1 X78.41 Y75.405 E-.10731
G1 X79.238 Y75.405 E-.31454
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.95 Y81.409 Z2.68 F42000
G1 X101.49 Y103.76 Z2.68
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2092
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.862 Y104.023 Z2.68 F42000
G1 X86.402 Y104.174 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2092
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
G1 F2092
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
G1 X81.963 Y79.924 Z2.68 F42000
G1 X79.519 Y81.479 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384988
G1 F2092
M204 S5000
G1 X79.402 Y81.237 E.00322
G1 X79.388 Y80.964 E.00328
G1 X79.48 Y80.707 E.00328
G1 X79.687 Y80.489 E.0036
; LINE_WIDTH: 0.392848
G1 X80.002 Y80.377 E.00409
; LINE_WIDTH: 0.399268
G1 X80.289 Y80.403 E.00359
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398208
G1 X80.696 Y80.76 E.00342
; LINE_WIDTH: 0.413068
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
G1 X79.563 Y81.52 E.00261
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.1236
G1 X79.388 Y80.964 E-.10394
G1 X79.48 Y80.707 E-.10386
G1 X79.687 Y80.489 E-.11418
G1 X80.002 Y80.377 E-.12696
G1 X80.289 Y80.403 E-.1096
G1 X80.467 Y80.505 E-.07788
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2092
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z2.68 F42000
G1 X85.146 Y97.246 Z2.68
G1 Z2.28
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
G1 X77.435 Y75.856 F42000
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.403908
G1 F2092
M204 S5000
G1 X77.756 Y75.585 E.0053
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
G1 X102.207 Y75.569 E.00501
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
M73 P34 R10
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
G1 X77.401 Y75.905 E.00534
; WIPE_START
G1 F12000
M204 S6000
G1 X77.756 Y75.585 E-.18159
G1 X78.161 Y75.435 E-.16408
G1 X78.407 Y75.405 E-.09451
G1 X79.249 Y75.405 E-.31982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.96 Y81.411 Z2.76 F42000
G1 X101.49 Y103.76 Z2.76
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2092
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.862 Y104.023 Z2.76 F42000
G1 X86.402 Y104.174 Z2.76
G1 Z2.36
G1 E.8 F1800
; FEATURE: Inner wall
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
G1 X99.636 Y96.561 Z2.76 F42000
G1 X101.099 Y75.825 Z2.76
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.443958
G1 F2092
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
G1 X81.963 Y79.923 Z2.76 F42000
G1 X79.518 Y81.479 Z2.76
G1 Z2.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.388208
G1 F2092
M204 S5000
G1 X79.401 Y81.238 E.00325
G1 X79.386 Y80.964 E.00332
; LINE_WIDTH: 0.404508
G1 X79.517 Y80.646 E.00434
G1 X79.772 Y80.439 E.00415
; LINE_WIDTH: 0.387628
G1 X80.136 Y80.382 E.00444
; LINE_WIDTH: 0.384928
G1 X80.413 Y80.467 E.00348
; LINE_WIDTH: 0.388928
G1 X80.653 Y80.696 E.00402
; LINE_WIDTH: 0.398368
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
G1 X79.561 Y81.52 E.00265
; WIPE_START
G1 F12000
M204 S6000
G1 X79.401 Y81.238 E-.12345
G1 X79.386 Y80.964 E-.10423
G1 X79.517 Y80.646 E-.13068
G1 X79.772 Y80.439 E-.12503
G1 X80.136 Y80.382 E-.13969
G1 X80.413 Y80.467 E-.11024
G1 X80.464 Y80.515 E-.02669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z2.76 F42000
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2092
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z2.76 F42000
G1 X85.146 Y97.246 Z2.76
G1 Z2.36
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
G1 X101.49 Y103.76 F42000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2100
M204 S5000
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
G1 X101.49 Y76.24 E.20326
G1 X101.498 Y75.939 E.00395
G1 X101.687 Y75.802 E.00307
; LINE_WIDTH: 0.403178
M73 P35 R10
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
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.765 Y97.82 Z2.84 F42000
G1 X77.442 Y75.857 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.408258
G1 F2100
M204 S5000
G1 X77.698 Y75.619 E.00446
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
G1 X102.291 Y75.614 E.00487
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
G1 X77.398 Y75.898 E.00012
; WIPE_START
G1 F12000
M204 S6000
G1 X77.698 Y75.619 E-.15562
G1 X78.081 Y75.452 E-.15882
G1 X78.412 Y75.405 E-.12694
G1 X79.25 Y75.405 E-.31862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.881 Y75.552 Z2.84 F42000
G1 X101.099 Y75.825 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443918
G1 F2100
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
G1 F2100
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.616 Y97.069 Z2.84 F42000
G1 X79.484 Y81.426 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.398068
G1 F2100
M204 S5000
G1 X79.469 Y81.412 E.00026
; LINE_WIDTH: 0.398228
G1 X79.377 Y81.137 E.00359
; LINE_WIDTH: 0.402268
G1 X79.398 Y80.887 E.00316
; LINE_WIDTH: 0.402828
G1 X79.516 Y80.646 E.00337
G1 X79.723 Y80.463 E.00347
; LINE_WIDTH: 0.402708
G1 X79.979 Y80.377 E.00339
; LINE_WIDTH: 0.402248
G1 X80.288 Y80.409 E.0039
; LINE_WIDTH: 0.392368
G1 X80.527 Y80.543 E.00335
G1 X80.694 Y80.762 E.00336
; LINE_WIDTH: 0.397148
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
G1 X79.527 Y81.468 E.00347
; WIPE_START
G1 F12000
M204 S6000
G1 X79.469 Y81.412 E-.03062
G1 X79.377 Y81.137 E-.10989
G1 X79.398 Y80.887 E-.09555
G1 X79.516 Y80.646 E-.10189
G1 X79.723 Y80.463 E-.10484
G1 X79.979 Y80.377 E-.10265
G1 X80.288 Y80.409 E-.11819
G1 X80.509 Y80.533 E-.09638
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2100
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z2.84 F42000
G1 X85.146 Y97.246 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F2100
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
G1 X77.447 Y75.843 F42000
G1 Z2.52
G1 E.8 F1800
; LINE_WIDTH: 0.412668
G1 F2070
M204 S5000
G1 X77.457 Y75.829 E.00023
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
G1 X102.207 Y75.569 E.005
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
M73 P36 R10
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
G1 X77.41 Y75.891 E.00278
; WIPE_START
G1 F12000
M204 S6000
G1 X77.457 Y75.829 E-.02944
G1 X77.745 Y75.595 E-.14099
G1 X78.129 Y75.438 E-.15769
G1 X78.41 Y75.405 E-.10731
G1 X79.264 Y75.405 E-.32457
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.973 Y81.412 Z2.92 F42000
G1 X101.49 Y103.76 Z2.92
G1 Z2.52
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2070
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
M204 S10000
G1 X101.099 Y104.175 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2070
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
G1 F2070
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
G1 X81.963 Y79.922 Z2.92 F42000
G1 X79.519 Y81.477 Z2.92
G1 Z2.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384948
G1 F2070
M204 S5000
G1 X79.402 Y81.237 E.0032
G1 X79.391 Y80.937 E.0036
; LINE_WIDTH: 0.392888
G1 X79.53 Y80.633 E.00409
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.392348
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398208
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.413028
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
G1 X79.562 Y81.518 E.00263
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.12288
G1 X79.391 Y80.937 E-.11422
G1 X79.53 Y80.633 E-.12693
G1 X79.751 Y80.449 E-.10946
G1 X80.016 Y80.374 E-.10438
G1 X80.289 Y80.403 E-.10452
G1 X80.466 Y80.505 E-.07761
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z2.92 F42000
G1 Z2.52
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2070
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z2.92 F42000
G1 X85.146 Y97.246 Z2.92
G1 Z2.52
G1 E.8 F1800
G1 F2070
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
G1 X77.451 Y75.848 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.408258
G1 F2071
M204 S5000
G1 X77.698 Y75.619 E.00429
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
G1 X102.207 Y75.569 E.005
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
G1 X77.407 Y75.889 E.00028
; WIPE_START
G1 F12000
M204 S6000
G1 X77.698 Y75.619 E-.15082
G1 X78.064 Y75.457 E-.15209
G1 X78.412 Y75.405 E-.1339
G1 X79.263 Y75.405 E-.32319
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.971 Y81.412 Z3 F42000
G1 X101.49 Y103.76 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.419998
M73 P37 R10
G1 F2071
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
M204 S10000
G1 X101.099 Y104.175 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2071
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
G1 F2071
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
G1 X81.962 Y79.921 Z3 F42000
G1 X79.518 Y81.476 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2071
M204 S5000
G1 X79.402 Y81.237 E.00318
G1 X79.388 Y80.964 E.00328
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.392908
G1 X79.74 Y80.457 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399268
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398248
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398408
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
G1 X79.56 Y81.517 E.00265
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.12234
G1 X79.388 Y80.964 E-.10389
G1 X79.494 Y80.683 E-.11416
G1 X79.74 Y80.457 E-.127
G1 X80.016 Y80.374 E-.10942
G1 X80.289 Y80.403 E-.10452
G1 X80.469 Y80.506 E-.07868
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2071
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z3 F42000
G1 X85.146 Y97.246 Z3
G1 Z2.6
G1 E.8 F1800
G1 F2071
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
G1 X77.456 Y75.844 F42000
G1 Z2.68
G1 E.8 F1800
; LINE_WIDTH: 0.408238
G1 F2070
M204 S5000
G1 X77.697 Y75.619 E.00421
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
G1 X102.82 Y103.711 E.00497
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
M73 P37 R9
G1 X77.391 Y75.904 E.00543
; LINE_WIDTH: 0.408238
G1 X77.412 Y75.885 E.00036
; WIPE_START
G1 F12000
M204 S6000
G1 X77.697 Y75.619 E-.14822
G1 X78.064 Y75.457 E-.15223
G1 X78.412 Y75.405 E-.13394
G1 X79.269 Y75.405 E-.32562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.977 Y81.413 Z3.08 F42000
G1 X101.49 Y103.76 Z3.08
G1 Z2.68
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2070
M204 S5000
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
M73 P38 R9
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
M204 S10000
G1 X101.099 Y104.175 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2070
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
G1 F2070
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
G1 X81.937 Y79.882 Z3.08 F42000
G1 X79.482 Y81.422 Z3.08
G1 Z2.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392888
G1 F2070
M204 S5000
G1 X79.471 Y81.41 E.0002
G1 X79.38 Y81.137 E.00353
; LINE_WIDTH: 0.392368
G1 X79.407 Y80.863 E.00336
G1 X79.537 Y80.621 E.00336
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399208
G1 X80.289 Y80.403 E.00342
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398208
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398408
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00448
; LINE_WIDTH: 0.389368
G1 X80.503 Y81.605 E.00348
G1 X80.259 Y81.729 E.00332
; LINE_WIDTH: 0.384948
G1 X79.986 Y81.75 E.00328
G1 X79.703 Y81.651 E.0036
; LINE_WIDTH: 0.392888
G1 X79.524 Y81.465 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X79.471 Y81.41 E-.02912
G1 X79.38 Y81.137 E-.10945
G1 X79.407 Y80.863 E-.10444
G1 X79.537 Y80.621 E-.10442
G1 X79.751 Y80.449 E-.10438
G1 X80.016 Y80.374 E-.10448
G1 X80.289 Y80.403 E-.10447
G1 X80.515 Y80.533 E-.09925
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z3.08 F42000
G1 Z2.68
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2070
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z3.08 F42000
G1 X85.146 Y97.246 Z3.08
G1 Z2.68
G1 E.8 F1800
G1 F2070
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
G1 X77.461 Y75.84 F42000
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.408468
G1 F2065
M204 S5000
G1 X77.699 Y75.617 E.00414
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
G1 X102.207 Y75.569 E.00499
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
G1 X77.418 Y75.881 E.00039
; WIPE_START
G1 F12000
M204 S6000
G1 X77.699 Y75.617 E-.14628
G1 X78.064 Y75.457 E-.15161
G1 X78.412 Y75.405 E-.13392
G1 X79.276 Y75.405 E-.32819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.983 Y81.413 Z3.16 F42000
G1 X101.49 Y103.76 Z3.16
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2065
M204 S5000
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
M73 P39 R9
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
M204 S10000
G1 X101.099 Y104.175 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2065
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
G1 F2065
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
G1 X81.969 Y79.932 Z3.16 F42000
G1 X79.528 Y81.49 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.386568
G1 F2065
M204 S5000
G1 X79.394 Y81.211 E.00373
; LINE_WIDTH: 0.392868
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.396088
G1 X79.783 Y80.429 E.00386
G1 X80.186 Y80.381 E.00501
; LINE_WIDTH: 0.388628
G1 X80.476 Y80.505 E.00381
; LINE_WIDTH: 0.405268
G1 X80.695 Y80.764 E.0043
; LINE_WIDTH: 0.409648
G1 X80.76 Y81.031 E.00351
G1 X80.735 Y81.253 E.00286
; LINE_WIDTH: 0.399228
G1 X80.606 Y81.511 E.00359
G1 X80.391 Y81.683 E.00343
; LINE_WIDTH: 0.398288
G1 X80.125 Y81.759 E.00343
G1 X79.775 Y81.691 E.00443
; LINE_WIDTH: 0.386568
G1 X79.574 Y81.528 E.00311
; WIPE_START
G1 F12000
M204 S6000
G1 X79.394 Y81.211 E-.13853
G1 X79.405 Y80.877 E-.12694
G1 X79.537 Y80.621 E-.10948
G1 X79.783 Y80.429 E-.11865
G1 X80.186 Y80.381 E-.15415
G1 X80.458 Y80.497 E-.11226
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2065
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z3.16 F42000
G1 X85.146 Y97.246 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F2065
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
G1 X101.49 Y103.76 F42000
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2100
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X102.053 Y104.077 E.00512
G1 X101.715 Y104.196 E.00455
; LINE_WIDTH: 0.409028
G1 X101.635 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.77 Y97.815 Z3.24 F42000
G1 X77.465 Y75.835 Z3.24
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.408218
G1 F2100
M204 S5000
G1 X77.697 Y75.619 E.00405
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
G1 X102.29 Y75.614 E.00489
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
M73 P40 R9
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
G1 X77.421 Y75.876 E.00052
; WIPE_START
G1 F12000
M204 S6000
G1 X77.697 Y75.619 E-.14341
G1 X78.064 Y75.457 E-.15217
G1 X78.412 Y75.405 E-.1339
G1 X79.282 Y75.405 E-.33052
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.913 Y75.552 Z3.24 F42000
G1 X101.099 Y75.825 Z3.24
G1 Z2.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443898
G1 F2100
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
G1 F2100
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.621 Y97.067 Z3.24 F42000
G1 X79.524 Y81.484 Z3.24
G1 Z2.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.386548
G1 F2100
M204 S5000
G1 X79.402 Y81.237 E.00331
; LINE_WIDTH: 0.384988
G1 X79.388 Y80.964 E.00328
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00476
G1 X80.154 Y80.378 E.00462
; LINE_WIDTH: 0.389408
G1 X80.437 Y80.479 E.00366
; LINE_WIDTH: 0.388668
G1 X80.662 Y80.706 E.00386
; LINE_WIDTH: 0.405268
G1 X80.763 Y81.031 E.00429
G1 X80.752 Y81.166 E.00172
; LINE_WIDTH: 0.384968
G1 X80.66 Y81.423 E.00327
; LINE_WIDTH: 0.399468
G1 X80.402 Y81.675 E.0045
G1 X80.125 Y81.759 E.00361
; LINE_WIDTH: 0.398268
G1 X79.775 Y81.691 E.00443
; LINE_WIDTH: 0.386548
G1 X79.569 Y81.523 E.00319
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.1258
G1 X79.388 Y80.964 E-.10395
G1 X79.494 Y80.683 E-.11407
G1 X79.783 Y80.429 E-.14643
G1 X80.154 Y80.378 E-.14222
G1 X80.437 Y80.479 E-.11449
G1 X80.462 Y80.504 E-.01304
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z3.24 F42000
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2100
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z3.24 F42000
G1 X85.146 Y97.246 Z3.24
G1 Z2.84
G1 E.8 F1800
G1 F2100
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
G1 X101.49 Y103.76 F42000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2103
M204 S5000
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.411208
G1 X78.111 Y104.15 E.00333
G1 X77.832 Y103.995 E.0041
; LINE_WIDTH: 0.408218
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.771 Y97.815 Z3.32 F42000
G1 X77.469 Y75.83 Z3.32
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.404578
G1 F2103
M204 S5000
G1 X77.705 Y75.62 E.00399
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
G1 X102.29 Y75.614 E.00489
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
M73 P41 R9
G1 X77.104 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00722
G1 X77.188 Y76.273 E.00585
; LINE_WIDTH: 0.403068
G1 X77.396 Y75.895 E.00543
; LINE_WIDTH: 0.404578
G1 X77.424 Y75.87 E.00047
; WIPE_START
G1 F12000
M204 S6000
G1 X77.705 Y75.62 E-.14289
G1 X78.13 Y75.439 E-.1755
G1 X78.41 Y75.405 E-.10724
G1 X79.29 Y75.405 E-.33438
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.921 Y75.552 Z3.32 F42000
G1 X101.099 Y75.825 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443898
G1 F2103
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
G1 X94.115 Y98.394 Z3.32 F42000
G1 X79.481 Y81.421 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392908
G1 F2103
M204 S5000
G1 X79.471 Y81.41 E.00019
G1 X79.38 Y81.137 E.00353
; LINE_WIDTH: 0.392388
G1 X79.407 Y80.863 E.00336
G1 X79.537 Y80.621 E.00336
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399228
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398248
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.685 Y81.381 E.00447
; LINE_WIDTH: 0.392388
G1 X80.502 Y81.603 E.00352
; LINE_WIDTH: 0.384968
G1 X80.259 Y81.729 E.00328
G1 X79.986 Y81.75 E.00328
G1 X79.703 Y81.651 E.0036
; LINE_WIDTH: 0.392908
G1 X79.523 Y81.464 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X79.471 Y81.41 E-.02864
G1 X79.38 Y81.137 E-.10942
G1 X79.407 Y80.863 E-.10445
G1 X79.537 Y80.621 E-.10434
G1 X79.751 Y80.449 E-.10446
G1 X80.016 Y80.374 E-.10446
G1 X80.289 Y80.403 E-.10457
G1 X80.517 Y80.534 E-.09966
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2103
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z3.32 F42000
G1 X85.146 Y97.246 Z3.32
G1 Z2.92
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
G1 X77.471 Y75.821 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.402958
G1 F2070
M204 S5000
G1 X77.745 Y75.595 E.00447
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
G1 X102.207 Y75.569 E.00499
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
G3 X77.141 Y76.413 I3.74 J-.283 E.01123
; LINE_WIDTH: 0.413068
G3 X77.428 Y75.863 I1.224 J.289 E.0081
; WIPE_START
G1 F12000
M204 S6000
G1 X77.745 Y75.595 E-.15765
G1 X78.129 Y75.438 E-.15766
G1 X78.41 Y75.405 E-.10747
G1 X79.298 Y75.405 E-.33722
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.002 Y81.416 Z3.4 F42000
G1 X101.49 Y103.76 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2070
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
M204 S10000
G1 X101.099 Y104.175 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2070
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
M73 P42 R9
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z3.4 F42000
G1 X101.099 Y75.825 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.443818
G1 F2070
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
G1 X81.961 Y79.919 Z3.4 F42000
G1 X79.516 Y81.473 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2070
M204 S5000
G1 X79.402 Y81.237 E.00314
G1 X79.388 Y80.964 E.00328
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.392908
G1 X79.74 Y80.457 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00342
; LINE_WIDTH: 0.413008
G1 X80.526 Y80.548 E.00359
G1 X80.694 Y80.764 E.00353
; LINE_WIDTH: 0.406108
G1 X80.762 Y81.031 E.00348
G1 X80.757 Y81.131 E.00128
; LINE_WIDTH: 0.385968
G1 X80.677 Y81.393 E.00329
; LINE_WIDTH: 0.389428
G1 X80.503 Y81.605 E.00332
G1 X80.259 Y81.728 E.00333
; LINE_WIDTH: 0.384968
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.558 Y81.515 E.00269
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.12104
G1 X79.388 Y80.964 E-.10398
G1 X79.494 Y80.683 E-.11416
G1 X79.74 Y80.457 E-.12695
G1 X80.016 Y80.374 E-.10952
G1 X80.289 Y80.403 E-.10444
G1 X80.469 Y80.513 E-.07991
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2070
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z3.4 F42000
G1 X85.146 Y97.246 Z3.4
G1 Z3
G1 E.8 F1800
G1 F2070
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
G1 X77.477 Y75.814 F42000
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.407748
G1 F2086
M204 S5000
G1 X77.824 Y75.546 E.00559
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
G1 X101.834 Y75.436 E.00308
; LINE_WIDTH: 0.403418
G1 X102.207 Y75.569 E.00498
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
G1 X77.435 Y75.857 E.00416
; WIPE_START
G1 F12000
M204 S6000
G1 X77.824 Y75.546 E-.18916
G1 X78.159 Y75.433 E-.13408
G1 X78.408 Y75.405 E-.09552
G1 X79.306 Y75.405 E-.34124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.009 Y81.416 Z3.48 F42000
G1 X101.49 Y103.76 Z3.48
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2086
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.862 Y104.023 Z3.48 F42000
G1 X86.402 Y104.174 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2086
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
G1 F2086
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
M73 P43 R9
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.961 Y79.919 Z3.48 F42000
G1 X79.516 Y81.473 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384948
G1 F2086
M204 S5000
G1 X79.402 Y81.237 E.00314
G1 X79.388 Y80.964 E.00328
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.392888
G1 X79.74 Y80.458 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398588
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
G1 X79.558 Y81.515 E.00269
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.12117
G1 X79.388 Y80.964 E-.10388
G1 X79.494 Y80.683 E-.11421
G1 X79.74 Y80.458 E-.12686
G1 X80.016 Y80.374 E-.1095
G1 X80.289 Y80.403 E-.10454
G1 X80.471 Y80.508 E-.07985
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2086
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z3.48 F42000
G1 X85.146 Y97.246 Z3.48
G1 Z3.08
G1 E.8 F1800
G1 F2086
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
G1 X77.484 Y75.817 F42000
G1 Z3.16
G1 E.8 F1800
; LINE_WIDTH: 0.408238
G1 F2065
M204 S5000
G1 X77.698 Y75.619 E.00371
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
G1 X102.207 Y75.569 E.00498
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
G1 X77.44 Y75.858 E.00085
; WIPE_START
G1 F12000
M204 S6000
G1 X77.698 Y75.619 E-.13353
G1 X78.064 Y75.457 E-.15209
G1 X78.412 Y75.405 E-.13396
G1 X79.308 Y75.405 E-.34043
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.011 Y81.417 Z3.56 F42000
G1 X101.49 Y103.76 Z3.56
G1 Z3.16
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2065
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
M204 S10000
G1 X101.099 Y104.175 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2065
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
G1 F2065
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
G1 X81.962 Y79.921 Z3.56 F42000
G1 X79.518 Y81.476 Z3.56
G1 Z3.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384948
G1 F2065
M204 S5000
G1 X79.394 Y81.211 E.0035
; LINE_WIDTH: 0.392928
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.392388
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399188
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398308
G1 X80.696 Y80.76 E.00343
G1 X80.766 Y81.03 E.00347
; LINE_WIDTH: 0.398388
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00348
G1 X80.259 Y81.729 E.00333
; LINE_WIDTH: 0.384948
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.56 Y81.517 E.00266
; WIPE_START
G1 F12000
M204 S6000
G1 X79.394 Y81.211 E-.13244
G1 X79.405 Y80.877 E-.127
G1 X79.537 Y80.621 E-.10939
G1 X79.751 Y80.449 E-.10446
G1 X80.016 Y80.374 E-.10441
G1 X80.289 Y80.403 E-.10444
G1 X80.467 Y80.505 E-.07788
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z3.56 F42000
G1 Z3.16
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2065
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
M73 P44 R9
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z3.56 F42000
G1 X85.146 Y97.246 Z3.56
G1 Z3.16
G1 E.8 F1800
G1 F2065
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
G1 X101.49 Y103.76 F42000
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2097
M204 S5000
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408478
M73 P44 R8
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.775 Y97.811 Z3.64 F42000
G1 X77.484 Y75.81 Z3.64
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.403008
G1 F2097
M204 S5000
G1 X77.745 Y75.595 E.00426
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
G1 X102.207 Y75.569 E.00498
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
G3 X77.44 Y75.85 I1.226 J.29 E.00831
; WIPE_START
G1 F12000
M204 S6000
G1 X77.745 Y75.595 E-.1513
G1 X78.129 Y75.438 E-.15759
G1 X78.41 Y75.405 E-.10748
G1 X79.315 Y75.405 E-.34363
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.946 Y75.552 Z3.64 F42000
G1 X101.099 Y75.825 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443768
G1 F2097
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
G1 F2097
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
G1 X94.114 Y98.395 Z3.64 F42000
G1 X79.516 Y81.471 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2097
M204 S5000
G1 X79.402 Y81.237 E.00312
G1 X79.388 Y80.964 E.00328
G1 X79.48 Y80.707 E.00328
G1 X79.687 Y80.489 E.0036
; LINE_WIDTH: 0.392828
G1 X80.002 Y80.377 E.00409
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00359
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398248
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.413028
G1 X80.759 Y81.031 E.00358
G1 X80.758 Y81.118 E.00112
; LINE_WIDTH: 0.389248
G1 X80.677 Y81.393 E.00348
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00332
G1 X80.259 Y81.729 E.00332
; LINE_WIDTH: 0.384968
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.557 Y81.514 E.00272
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.12052
G1 X79.388 Y80.964 E-.10392
G1 X79.48 Y80.707 E-.10391
G1 X79.687 Y80.489 E-.11411
G1 X80.002 Y80.377 E-.12696
G1 X80.289 Y80.403 E-.10958
G1 X80.474 Y80.51 E-.081
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2097
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z3.64 F42000
G1 X85.146 Y97.246 Z3.64
G1 Z3.24
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
G1 X77.49 Y75.8 F42000
G1 Z3.32
G1 E.8 F1800
; LINE_WIDTH: 0.407758
M73 P45 R8
G1 F2065
M204 S5000
G1 X77.825 Y75.546 E.00534
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
G1 X102.207 Y75.569 E.00498
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
G1 X77.445 Y75.839 E.00354
; WIPE_START
G1 F12000
M204 S6000
G1 X77.825 Y75.546 E-.18211
G1 X78.159 Y75.433 E-.13399
G1 X78.409 Y75.405 E-.09565
G1 X79.325 Y75.405 E-.34826
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.026 Y81.418 Z3.72 F42000
G1 X101.49 Y103.76 Z3.72
G1 Z3.32
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2065
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
M204 S10000
G1 X101.099 Y104.175 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2065
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
G1 F2065
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
G1 X81.962 Y79.921 Z3.72 F42000
G1 X79.518 Y81.475 Z3.72
G1 Z3.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2065
M204 S5000
G1 X79.394 Y81.211 E.0035
; LINE_WIDTH: 0.392868
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.392408
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399228
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398208
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398388
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.389388
G1 X80.503 Y81.605 E.00348
G1 X80.259 Y81.728 E.00333
; LINE_WIDTH: 0.384968
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.56 Y81.517 E.00266
; WIPE_START
G1 F12000
M204 S6000
G1 X79.394 Y81.211 E-.13223
G1 X79.405 Y80.877 E-.12693
G1 X79.537 Y80.621 E-.10946
G1 X79.751 Y80.449 E-.10446
G1 X80.016 Y80.374 E-.10442
G1 X80.289 Y80.403 E-.10449
G1 X80.467 Y80.506 E-.07801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z3.72 F42000
G1 Z3.32
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2065
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z3.72 F42000
G1 X85.146 Y97.246 Z3.72
G1 Z3.32
G1 E.8 F1800
G1 F2065
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
G1 X101.49 Y103.76 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2101
M204 S5000
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
M73 P46 R8
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.778 Y97.809 Z3.8 F42000
G1 X77.5 Y75.806 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.404358
G1 F2101
M204 S5000
G1 X77.72 Y75.609 E.00373
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
G1 X102.207 Y75.569 E.00499
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
G1 X77.104 Y79.287 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.287 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.725 E.00718
G1 X77.184 Y76.28 E.00576
; LINE_WIDTH: 0.403228
G1 X77.392 Y75.903 E.00542
; LINE_WIDTH: 0.404358
G1 X77.455 Y75.846 E.00107
; WIPE_START
G1 F12000
M204 S6000
G1 X77.72 Y75.609 E-.13514
G1 X78.154 Y75.436 E-.17755
G1 X78.409 Y75.405 E-.09746
G1 X79.329 Y75.405 E-.34986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.96 Y75.552 Z3.8 F42000
G1 X101.099 Y75.825 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443728
G1 F2101
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
G1 F2101
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.62 Y97.068 Z3.8 F42000
G1 X79.516 Y81.475 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.388168
G1 F2101
M204 S5000
G1 X79.401 Y81.238 E.00319
; LINE_WIDTH: 0.404488
G1 X79.398 Y80.894 E.00434
G1 X79.516 Y80.646 E.00347
; LINE_WIDTH: 0.402688
G1 X79.723 Y80.463 E.00346
G1 X79.981 Y80.376 E.00342
; LINE_WIDTH: 0.402448
G1 X80.289 Y80.404 E.00388
; LINE_WIDTH: 0.398228
G1 X80.528 Y80.541 E.00342
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.392728
G1 X80.505 Y81.606 E.00351
G1 X80.26 Y81.731 E.00337
; LINE_WIDTH: 0.390888
G1 X79.986 Y81.751 E.00334
; LINE_WIDTH: 0.388168
G1 X79.726 Y81.665 E.00331
G1 X79.558 Y81.517 E.00271
; WIPE_START
G1 F12000
M204 S6000
G1 X79.401 Y81.238 E-.12168
G1 X79.398 Y80.894 E-.13077
G1 X79.516 Y80.646 E-.10454
G1 X79.723 Y80.463 E-.1047
G1 X79.981 Y80.376 E-.10357
G1 X80.289 Y80.404 E-.11749
G1 X80.466 Y80.505 E-.07725
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2101
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z3.8 F42000
G1 X85.146 Y97.246 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F2101
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
G1 X101.49 Y103.76 F42000
G1 Z3.48
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2101
M204 S5000
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
M73 P47 R8
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.778 Y97.809 Z3.88 F42000
G1 X77.496 Y75.799 Z3.88
G1 Z3.48
G1 E.8 F1800
; LINE_WIDTH: 0.403068
G1 F2101
M204 S5000
G1 X77.745 Y75.595 E.00405
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
G1 X101.834 Y75.436 E.00303
; LINE_WIDTH: 0.403398
G1 X102.207 Y75.569 E.00498
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
G3 X77.451 Y75.838 I1.227 J.29 E.00853
; WIPE_START
G1 F12000
M204 S6000
G1 X77.745 Y75.595 E-.14517
G1 X78.158 Y75.433 E-.16857
G1 X78.409 Y75.405 E-.0958
G1 X79.331 Y75.405 E-.35046
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.962 Y75.552 Z3.88 F42000
G1 X101.099 Y75.825 Z3.88
G1 Z3.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443728
G1 F2101
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
G1 F2101
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.62 Y97.068 Z3.88 F42000
G1 X79.518 Y81.475 Z3.88
G1 Z3.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384948
G1 F2101
M204 S5000
G1 X79.394 Y81.211 E.00349
; LINE_WIDTH: 0.392908
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00385
G1 X80.186 Y80.381 E.00501
; LINE_WIDTH: 0.395288
G1 X80.499 Y80.522 E.00423
; LINE_WIDTH: 0.414228
G1 X80.691 Y80.766 E.00401
G1 X80.763 Y81.033 E.00358
; LINE_WIDTH: 0.406588
G1 X80.759 Y81.132 E.00125
; LINE_WIDTH: 0.389428
G1 X80.677 Y81.393 E.00333
; LINE_WIDTH: 0.384948
G1 X80.502 Y81.603 E.00328
G1 X80.259 Y81.729 E.00328
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.664 E.00327
G1 X79.56 Y81.517 E.00267
; WIPE_START
G1 F12000
M204 S6000
G1 X79.394 Y81.211 E-.13212
G1 X79.405 Y80.877 E-.12698
G1 X79.537 Y80.621 E-.10941
G1 X79.783 Y80.429 E-.11854
G1 X80.186 Y80.381 E-.15429
G1 X80.471 Y80.509 E-.11866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z3.88 F42000
G1 Z3.48
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2101
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z3.88 F42000
G1 X85.146 Y97.246 Z3.88
G1 Z3.48
G1 E.8 F1800
G1 F2101
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
G1 X101.49 Y103.76 F42000
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2095
M204 S5000
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
G1 X101.49 Y76.24 E.20326
G1 X101.498 Y75.939 E.00396
G1 X101.688 Y75.801 E.00308
; LINE_WIDTH: 0.403038
M73 P48 R8
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.78 Y97.808 Z3.96 F42000
G1 X77.51 Y75.797 Z3.96
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.401958
G1 F2095
M204 S5000
G1 X77.739 Y75.601 E.00378
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
G1 X102.291 Y75.613 E.00486
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
G1 X77.464 Y75.836 E.00104
; WIPE_START
G1 F12000
M204 S6000
G1 X77.739 Y75.601 E-.13734
G1 X78.129 Y75.438 E-.16089
G1 X78.41 Y75.405 E-.10731
G1 X79.343 Y75.405 E-.35447
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.974 Y75.552 Z3.96 F42000
G1 X101.099 Y75.825 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443708
G1 F2095
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
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z3.96 F42000
G1 X101.099 Y104.175 Z3.96
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2095
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.62 Y97.068 Z3.96 F42000
G1 X79.517 Y81.475 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384948
G1 F2095
M204 S5000
G1 X79.394 Y81.211 E.00349
; LINE_WIDTH: 0.392888
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.392388
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398248
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398388
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00348
G1 X80.259 Y81.728 E.00332
; LINE_WIDTH: 0.384948
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.559 Y81.517 E.00267
; WIPE_START
G1 F12000
M204 S6000
G1 X79.394 Y81.211 E-.13201
G1 X79.405 Y80.877 E-.12694
G1 X79.537 Y80.621 E-.1095
G1 X79.751 Y80.449 E-.10439
G1 X80.016 Y80.374 E-.10445
G1 X80.289 Y80.403 E-.10456
G1 X80.467 Y80.506 E-.07815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2095
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z3.96 F42000
G1 X85.146 Y97.246 Z3.96
G1 Z3.56
G1 E.8 F1800
G1 F2095
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
G3 Z3.96 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.64
; LAYER_HEIGHT: 0.0800002
; layer num/total_layer_count: 43/99
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y103.76 F42000
G1 Z3.64
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2100
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
M73 P49 R8
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.78 Y97.808 Z4.04 F42000
G1 X77.505 Y75.792 Z4.04
G1 Z3.64
G1 E.8 F1800
; LINE_WIDTH: 0.403088
G1 F2100
M204 S5000
G1 X77.745 Y75.595 E.00391
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
G1 X102.207 Y75.569 E.00498
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
G1 X77.459 Y75.83 E.00004
; WIPE_START
G1 F12000
M204 S6000
G1 X77.745 Y75.595 E-.14082
G1 X78.158 Y75.433 E-.1686
G1 X78.409 Y75.405 E-.09583
G1 X79.342 Y75.405 E-.35475
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.973 Y75.552 Z4.04 F42000
G1 X101.099 Y75.825 Z4.04
G1 Z3.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443688
G1 F2100
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
G1 F2100
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.62 Y97.068 Z4.04 F42000
G1 X79.516 Y81.471 Z4.04
G1 Z3.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2100
M204 S5000
G1 X79.402 Y81.237 E.00312
G1 X79.388 Y80.964 E.00328
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.392868
G1 X79.74 Y80.458 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399168
G1 X80.289 Y80.403 E.00342
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398408
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398248
G1 X80.583 Y81.536 E.00343
G1 X80.358 Y81.696 E.00343
; LINE_WIDTH: 0.393168
G1 X80 Y81.75 E.00443
; LINE_WIDTH: 0.387528
G1 X79.727 Y81.663 E.00346
; LINE_WIDTH: 0.384968
G1 X79.556 Y81.514 E.00272
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.12045
G1 X79.388 Y80.964 E-.10393
G1 X79.494 Y80.683 E-.11412
G1 X79.74 Y80.458 E-.12692
G1 X80.016 Y80.374 E-.10947
G1 X80.289 Y80.403 E-.10447
G1 X80.473 Y80.509 E-.08064
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z4.04 F42000
G1 Z3.64
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2100
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z4.04 F42000
G1 X85.146 Y97.246 Z4.04
G1 Z3.64
G1 E.8 F1800
G1 F2100
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
G3 Z4.04 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 44/99
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y103.76 F42000
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2100
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
M73 P50 R8
G1 X102.043 Y104.084 E.00532
G1 X101.715 Y104.196 E.00444
; LINE_WIDTH: 0.409028
G1 X101.635 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.782 Y97.806 Z4.12 F42000
G1 X77.517 Y75.787 Z4.12
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.407278
G1 F2100
M204 S5000
G1 X77.695 Y75.623 E.00307
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
G1 X102.207 Y75.569 E.00498
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
M73 P50 R7
G1 X77.104 Y79.288 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.288 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00719
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403928
G1 X77.378 Y75.917 E.00528
; LINE_WIDTH: 0.407278
G1 X77.473 Y75.828 E.00166
; WIPE_START
G1 F12000
M204 S6000
G1 X77.695 Y75.623 E-.11463
G1 X78.064 Y75.457 E-.15384
G1 X78.412 Y75.405 E-.13394
G1 X79.353 Y75.405 E-.35759
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.985 Y75.553 Z4.12 F42000
G1 X101.099 Y75.825 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443678
G1 F2100
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
G1 F2100
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.62 Y97.068 Z4.12 F42000
G1 X79.517 Y81.475 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2100
M204 S5000
G1 X79.394 Y81.211 E.00349
; LINE_WIDTH: 0.392868
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.392408
G1 X79.751 Y80.449 E.00337
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399228
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398208
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398368
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00348
G1 X80.259 Y81.728 E.00333
; LINE_WIDTH: 0.384968
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.559 Y81.517 E.00267
; WIPE_START
G1 F12000
M204 S6000
G1 X79.394 Y81.211 E-.13197
G1 X79.405 Y80.877 E-.12695
G1 X79.537 Y80.621 E-.10939
G1 X79.751 Y80.449 E-.10455
G1 X80.016 Y80.374 E-.1044
G1 X80.289 Y80.403 E-.10451
G1 X80.468 Y80.506 E-.07823
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2100
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z4.12 F42000
G1 X85.146 Y97.246 Z4.12
G1 Z3.72
G1 E.8 F1800
G1 F2100
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
G3 Z4.12 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 45/99
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y103.76 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2102
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.784 Y97.805 Z4.2 F42000
G1 X77.522 Y75.778 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.407538
G1 F2102
M204 S5000
G1 X77.823 Y75.547 E.00483
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
M73 P51 R7
G2 X101.6 Y75.404 I.35 J-45.224 E.01574
; LINE_WIDTH: 0.406728
G1 X101.834 Y75.436 E.00299
; LINE_WIDTH: 0.403388
G1 X102.207 Y75.569 E.00499
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
G1 X77.475 Y75.815 E.00035
; WIPE_START
G1 F12000
M204 S6000
G1 X77.823 Y75.547 E-.16695
G1 X78.161 Y75.435 E-.13519
G1 X78.407 Y75.405 E-.09444
G1 X79.364 Y75.405 E-.36342
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.995 Y75.553 Z4.2 F42000
G1 X101.099 Y75.825 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443658
G1 F2102
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
G1 F2102
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
G1 X94.115 Y98.394 Z4.2 F42000
G1 X79.48 Y81.42 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392888
G1 F2102
M204 S5000
G1 X79.471 Y81.41 E.00016
G1 X79.38 Y81.137 E.00353
; LINE_WIDTH: 0.392328
G1 X79.407 Y80.863 E.00336
G1 X79.537 Y80.621 E.00336
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00386
G1 X80.154 Y80.378 E.00463
; LINE_WIDTH: 0.389408
G1 X80.437 Y80.479 E.00365
; LINE_WIDTH: 0.388668
G1 X80.661 Y80.706 E.00386
; LINE_WIDTH: 0.405248
G1 X80.763 Y81.031 E.0043
G1 X80.749 Y81.193 E.00206
; LINE_WIDTH: 0.396888
G1 X80.581 Y81.54 E.00477
G1 X80.275 Y81.725 E.00443
; LINE_WIDTH: 0.392968
G1 X79.986 Y81.75 E.00355
; LINE_WIDTH: 0.384928
G1 X79.703 Y81.651 E.0036
; LINE_WIDTH: 0.392888
G1 X79.522 Y81.463 E.00319
; WIPE_START
G1 F12000
M204 S6000
G1 X79.471 Y81.41 E-.02792
G1 X79.38 Y81.137 E-.1095
G1 X79.407 Y80.863 E-.10438
G1 X79.537 Y80.621 E-.10441
G1 X79.783 Y80.429 E-.11861
G1 X80.154 Y80.378 E-.14239
G1 X80.437 Y80.479 E-.11444
G1 X80.508 Y80.551 E-.03836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2102
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z4.2 F42000
G1 X85.146 Y97.246 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F2102
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
G3 Z4.2 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.0800002
; layer num/total_layer_count: 46/99
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y103.76 F42000
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2100
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.783 Y97.805 Z4.28 F42000
G1 X77.518 Y75.781 Z4.28
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.403158
G1 F2100
M204 S5000
G1 X77.745 Y75.595 E.0037
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
G1 X102.291 Y75.613 E.00486
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
M73 P52 R7
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
G1 X77.472 Y75.819 E.00025
; WIPE_START
G1 F12000
M204 S6000
G1 X77.745 Y75.595 E-.13441
G1 X78.158 Y75.433 E-.16844
G1 X78.409 Y75.405 E-.09598
G1 X79.36 Y75.405 E-.36117
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.991 Y75.553 Z4.28 F42000
G1 X101.099 Y75.825 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443638
G1 F2100
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
G1 F2100
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.62 Y97.068 Z4.28 F42000
G1 X79.516 Y81.472 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384948
G1 F2100
M204 S5000
G1 X79.402 Y81.237 E.00312
G1 X79.391 Y80.937 E.0036
; LINE_WIDTH: 0.392828
G1 X79.53 Y80.633 E.00409
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.392348
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399268
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398288
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.726 Y81.3 E.00339
; LINE_WIDTH: 0.398208
G1 X80.514 Y81.595 E.00451
; LINE_WIDTH: 0.392388
G1 X80.259 Y81.728 E.00352
; LINE_WIDTH: 0.384948
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.557 Y81.514 E.00271
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.12057
G1 X79.391 Y80.937 E-.1142
G1 X79.53 Y80.633 E-.12697
G1 X79.751 Y80.449 E-.10944
G1 X80.016 Y80.374 E-.1044
G1 X80.289 Y80.403 E-.10455
G1 X80.471 Y80.508 E-.07986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2100
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z4.28 F42000
G1 X85.146 Y97.246 Z4.28
G1 Z3.88
G1 E.8 F1800
G1 F2100
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
G3 Z4.28 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.96
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 47/99
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y103.76 F42000
G1 Z3.96
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2101
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.786 Y97.803 Z4.36 F42000
G1 X77.534 Y75.772 Z4.36
G1 Z3.96
G1 E.8 F1800
; LINE_WIDTH: 0.408238
G1 F2101
M204 S5000
G1 X77.697 Y75.619 E.00286
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
G1 X102.291 Y75.613 E.00486
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
M73 P53 R7
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
G1 X77.49 Y75.814 E.00175
; WIPE_START
G1 F12000
M204 S6000
G1 X77.697 Y75.619 E-.10816
G1 X78.064 Y75.457 E-.15221
G1 X78.412 Y75.405 E-.13394
G1 X79.375 Y75.405 E-.3657
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.006 Y75.553 Z4.36 F42000
G1 X101.099 Y75.825 Z4.36
G1 Z3.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443638
G1 F2101
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
G1 F2101
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.62 Y97.068 Z4.36 F42000
G1 X79.516 Y81.475 Z4.36
G1 Z3.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.388228
G1 F2101
M204 S5000
G1 X79.401 Y81.238 E.00319
; LINE_WIDTH: 0.404468
G1 X79.398 Y80.894 E.00434
G1 X79.516 Y80.646 E.00347
; LINE_WIDTH: 0.402708
G1 X79.723 Y80.463 E.00346
G1 X79.981 Y80.376 E.00343
; LINE_WIDTH: 0.402428
G1 X80.289 Y80.404 E.00388
; LINE_WIDTH: 0.398208
G1 X80.529 Y80.541 E.00343
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.392728
G1 X80.505 Y81.606 E.00352
G1 X80.26 Y81.731 E.00336
; LINE_WIDTH: 0.390868
G1 X79.986 Y81.751 E.00334
; LINE_WIDTH: 0.388228
G1 X79.726 Y81.665 E.00332
G1 X79.557 Y81.517 E.00271
; WIPE_START
G1 F12000
M204 S6000
G1 X79.401 Y81.238 E-.12165
G1 X79.398 Y80.894 E-.13078
G1 X79.516 Y80.646 E-.1045
G1 X79.723 Y80.463 E-.10468
G1 X79.981 Y80.376 E-.1036
G1 X80.289 Y80.404 E-.11735
G1 X80.466 Y80.505 E-.07745
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z4.36 F42000
G1 Z3.96
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2101
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z4.36 F42000
G1 X85.146 Y97.246 Z4.36
G1 Z3.96
G1 E.8 F1800
G1 F2101
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
G3 Z4.36 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 48/99
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y103.76 F42000
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2102
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.787 Y97.802 Z4.44 F42000
G1 X77.539 Y75.768 Z4.44
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.408228
G1 F2102
M204 S5000
G1 X77.697 Y75.619 E.00278
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
G1 X102.291 Y75.613 E.00486
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
M73 P54 R7
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
G1 X77.495 Y75.809 E.00184
; WIPE_START
G1 F12000
M204 S6000
G1 X77.697 Y75.619 E-.10561
G1 X78.064 Y75.457 E-.15216
G1 X78.412 Y75.405 E-.13391
G1 X79.382 Y75.405 E-.36833
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.013 Y75.553 Z4.44 F42000
G1 X101.099 Y75.825 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443608
G1 F2102
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
G1 F2102
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
G1 X94.114 Y98.395 Z4.44 F42000
G1 X79.486 Y81.435 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.404488
G1 F2102
M204 S5000
G1 X79.478 Y81.427 E.00015
G1 X79.383 Y81.169 E.00347
; LINE_WIDTH: 0.402728
G1 X79.397 Y80.894 E.00346
G1 X79.537 Y80.621 E.00385
; LINE_WIDTH: 0.393128
G1 X79.802 Y80.427 E.00403
; LINE_WIDTH: 0.384808
G1 X80.145 Y80.382 E.00414
; LINE_WIDTH: 0.382888
G1 X80.437 Y80.479 E.00367
; LINE_WIDTH: 0.388708
G1 X80.661 Y80.706 E.00386
; LINE_WIDTH: 0.405268
G1 X80.763 Y81.031 E.0043
G1 X80.749 Y81.193 E.00206
; LINE_WIDTH: 0.396788
G1 X80.581 Y81.54 E.00477
G1 X80.276 Y81.726 E.00443
; LINE_WIDTH: 0.395948
G1 X79.986 Y81.753 E.00359
; LINE_WIDTH: 0.390888
G1 X79.726 Y81.665 E.00334
; LINE_WIDTH: 0.404488
G1 X79.53 Y81.476 E.00344
; WIPE_START
G1 F12000
M204 S6000
G1 X79.478 Y81.427 E-.02722
G1 X79.383 Y81.169 E-.10446
G1 X79.397 Y80.894 E-.10463
G1 X79.537 Y80.621 E-.11651
G1 X79.802 Y80.427 E-.12498
G1 X80.145 Y80.382 E-.13124
G1 X80.437 Y80.479 E-.11714
G1 X80.5 Y80.543 E-.03382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2102
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z4.44 F42000
G1 X85.146 Y97.246 Z4.44
G1 Z4.04
G1 E.8 F1800
G1 F2102
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
G3 Z4.44 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 4.12
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 49/99
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 15
G1 X77.531 Y75.77 F42000
G1 Z4.12
G1 E.8 F1800
; LINE_WIDTH: 0.404508
G1 F2071
M204 S5000
G1 X77.74 Y75.601 E.00339
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
G1 X102.291 Y75.613 E.00486
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
G1 X77.485 Y75.807 E.00053
; WIPE_START
G1 F12000
M204 S6000
G1 X77.74 Y75.601 E-.12469
G1 X78.129 Y75.438 E-.16049
G1 X78.41 Y75.405 E-.10748
G1 X79.377 Y75.405 E-.36735
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.071 Y81.424 Z4.52 F42000
G1 X101.49 Y103.76 Z4.52
G1 Z4.12
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2071
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
M73 P55 R7
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
G1 X101.492 Y103.82 E.00317
M204 S10000
G1 X101.099 Y104.175 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2071
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
G1 F2071
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
G1 X81.961 Y79.919 Z4.52 F42000
G1 X79.516 Y81.473 Z4.52
G1 Z4.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384948
G1 F2071
M204 S5000
G1 X79.402 Y81.237 E.00314
G1 X79.391 Y80.937 E.0036
; LINE_WIDTH: 0.392828
G1 X79.53 Y80.633 E.00409
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.392388
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398248
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398388
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
G1 X80.583 Y81.537 E.00343
G1 X80.358 Y81.696 E.00342
; LINE_WIDTH: 0.393188
G1 X80 Y81.75 E.00444
; LINE_WIDTH: 0.387568
G1 X79.727 Y81.663 E.00346
; LINE_WIDTH: 0.384948
G1 X79.558 Y81.515 E.00269
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.12111
G1 X79.391 Y80.937 E-.11424
G1 X79.53 Y80.633 E-.12696
G1 X79.751 Y80.449 E-.10944
G1 X80.016 Y80.374 E-.10443
G1 X80.289 Y80.403 E-.10455
G1 X80.47 Y80.507 E-.07928
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z4.52 F42000
G1 Z4.12
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2071
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z4.52 F42000
G1 X85.146 Y97.246 Z4.52
G1 Z4.12
G1 E.8 F1800
G1 F2071
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
G3 Z4.52 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 50/99
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y103.76 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2100
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
G1 X101.49 Y76.24 E.20326
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
G1 X102.047 Y104.081 E.0053
G1 X101.706 Y104.199 E.0046
; LINE_WIDTH: 0.417308
G1 X101.638 Y104.198 E.00088
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00258
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.789 Y97.8 Z4.6 F42000
G1 X77.548 Y75.759 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.408248
G1 F2100
M204 S5000
G1 X77.698 Y75.619 E.00261
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
G1 X102.291 Y75.614 E.00566
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
G1 X77.505 Y75.8 E.00201
; WIPE_START
G1 F12000
M204 S6000
G1 X77.698 Y75.619 E-.10054
G1 X78.064 Y75.457 E-.15214
G1 X78.412 Y75.405 E-.1339
G1 X79.395 Y75.405 E-.37343
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.026 Y75.553 Z4.6 F42000
G1 X101.099 Y75.825 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443588
G1 F2100
M204 S6000
G1 X98.402 Y75.825 E.03749
; LINE_WIDTH: 0.443738
G1 X94.402 Y75.825 E.05562
; LINE_WIDTH: 0.443888
G1 X90.402 Y75.825 E.05564
; LINE_WIDTH: 0.444048
M73 P56 R7
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
G1 F2100
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.62 Y97.068 Z4.6 F42000
G1 X79.515 Y81.473 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.388208
G1 F2100
M204 S5000
G1 X79.4 Y81.238 E.00316
G1 X79.386 Y80.964 E.00331
; LINE_WIDTH: 0.404508
G1 X79.517 Y80.646 E.00434
G1 X79.723 Y80.463 E.00347
; LINE_WIDTH: 0.402708
G1 X79.981 Y80.376 E.00343
; LINE_WIDTH: 0.402428
G1 X80.289 Y80.404 E.00388
; LINE_WIDTH: 0.398188
G1 X80.528 Y80.541 E.00342
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398808
G1 X80.767 Y81.035 E.00353
G1 X80.707 Y81.338 E.00384
; LINE_WIDTH: 0.389428
G1 X80.512 Y81.594 E.0039
G1 X80.259 Y81.73 E.00349
; LINE_WIDTH: 0.388208
G1 X79.986 Y81.751 E.00331
G1 X79.726 Y81.665 E.00331
G1 X79.556 Y81.515 E.00275
; WIPE_START
G1 F12000
M204 S6000
G1 X79.4 Y81.238 E-.12078
G1 X79.386 Y80.964 E-.10407
G1 X79.517 Y80.646 E-.13078
G1 X79.723 Y80.463 E-.10456
G1 X79.981 Y80.376 E-.10361
G1 X80.289 Y80.404 E-.11739
G1 X80.469 Y80.507 E-.0788
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2100
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z4.6 F42000
G1 X85.146 Y97.246 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F2100
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
G3 Z4.6 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 4.28
; LAYER_HEIGHT: 0.0800004
; layer num/total_layer_count: 51/99
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y103.76 F42000
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2101
M204 S5000
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.407998
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
G1 X101.49 Y76.24 E.20326
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
M73 P56 R6
G1 X102.38 Y103.752 E.00555
; LINE_WIDTH: 0.403948
G1 X102.071 Y104.066 E.00555
; LINE_WIDTH: 0.406448
G1 X101.692 Y104.2 E.0051
; LINE_WIDTH: 0.410098
G1 X101.642 Y104.196 E.00065
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00259
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.79 Y97.8 Z4.68 F42000
G1 X77.553 Y75.754 Z4.68
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.408248
G1 F2101
M204 S5000
G1 X77.698 Y75.619 E.00252
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
G1 X102.291 Y75.613 E.00486
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
G1 X77.51 Y75.795 E.00209
; WIPE_START
G1 F12000
M204 S6000
G1 X77.698 Y75.619 E-.09801
G1 X78.064 Y75.457 E-.15209
G1 X78.412 Y75.405 E-.13392
G1 X79.402 Y75.405 E-.37598
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.033 Y75.553 Z4.68 F42000
G1 X101.099 Y75.825 Z4.68
G1 Z4.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443568
G1 F2101
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
G1 F2101
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
M73 P57 R6
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
G1 X94.114 Y98.395 Z4.68 F42000
G1 X79.489 Y81.441 Z4.68
G1 Z4.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392568
G1 F2101
M204 S5000
G1 X79.383 Y81.146 E.00385
G1 X79.407 Y80.863 E.00347
; LINE_WIDTH: 0.392348
G1 X79.537 Y80.621 E.00336
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00386
G1 X80.154 Y80.378 E.00463
; LINE_WIDTH: 0.389408
G1 X80.437 Y80.479 E.00365
; LINE_WIDTH: 0.388668
G1 X80.661 Y80.706 E.00386
; LINE_WIDTH: 0.405268
G1 X80.763 Y81.031 E.0043
G1 X80.749 Y81.193 E.00206
; LINE_WIDTH: 0.392868
G1 X80.61 Y81.497 E.00409
G1 X80.389 Y81.681 E.00353
; LINE_WIDTH: 0.395168
G1 X80.092 Y81.762 E.00379
G1 X79.747 Y81.676 E.00439
; LINE_WIDTH: 0.384848
G1 X79.534 Y81.482 E.00345
; WIPE_START
G1 F12000
M204 S6000
G1 X79.383 Y81.146 E-.14002
G1 X79.407 Y80.863 E-.10776
G1 X79.537 Y80.621 E-.10442
G1 X79.783 Y80.429 E-.11865
G1 X80.154 Y80.378 E-.14234
G1 X80.437 Y80.479 E-.11437
G1 X80.497 Y80.54 E-.03244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z4.68 F42000
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2101
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z4.68 F42000
G1 X85.146 Y97.246 Z4.68
G1 Z4.28
G1 E.8 F1800
G1 F2101
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
G3 Z4.68 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 52/99
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y103.76 F42000
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2100
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
G1 X78.103 Y104.149 E.00416
; LINE_WIDTH: 0.404148
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.789 Y97.801 Z4.76 F42000
G1 X77.544 Y75.757 Z4.76
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.405848
G1 F2100
M204 S5000
G1 X77.74 Y75.6 E.00318
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
G1 X102.291 Y75.614 E.00566
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
G1 X77.497 Y75.794 E.00069
; WIPE_START
G1 F12000
M204 S6000
G1 X77.74 Y75.6 E-.11824
G1 X78.129 Y75.438 E-.16033
G1 X78.41 Y75.405 E-.10731
G1 X79.394 Y75.405 E-.37412
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.025 Y75.553 Z4.76 F42000
G1 X101.099 Y75.825 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443538
G1 F2100
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
G1 F2100
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.62 Y97.068 Z4.76 F42000
G1 X79.518 Y81.476 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
M73 P58 R6
G1 F2100
M204 S5000
G1 X79.394 Y81.211 E.00351
; LINE_WIDTH: 0.392868
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.392348
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398248
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398208
G1 X80.512 Y81.594 E.00451
; LINE_WIDTH: 0.389288
G1 X80.259 Y81.729 E.00348
; LINE_WIDTH: 0.385908
G1 X79.986 Y81.75 E.00329
; LINE_WIDTH: 0.389428
G1 X79.726 Y81.666 E.00332
G1 X79.56 Y81.518 E.00269
; WIPE_START
G1 F12000
M204 S6000
G1 X79.394 Y81.211 E-.13258
G1 X79.405 Y80.877 E-.12696
G1 X79.537 Y80.621 E-.10949
G1 X79.751 Y80.449 E-.1044
G1 X80.016 Y80.374 E-.10447
G1 X80.289 Y80.403 E-.10453
G1 X80.466 Y80.505 E-.07756
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2100
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z4.76 F42000
G1 X85.146 Y97.246 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F2100
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
G3 Z4.76 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 4.44
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 53/99
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 15
G1 X77.555 Y75.731 F42000
G1 Z4.44
G1 E.8 F1800
; LINE_WIDTH: 0.413228
G1 F2070
M204 S5000
G1 X77.561 Y75.724 E.00012
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
G1 X102.295 Y75.616 E.00572
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
G1 X77.515 Y75.776 E.00398
; WIPE_START
G1 F12000
M204 S6000
G1 X77.561 Y75.724 E-.02638
G1 X77.905 Y75.506 E-.15473
G1 X78.405 Y75.405 E-.19373
G1 X79.419 Y75.405 E-.38516
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.107 Y81.428 Z4.84 F42000
G1 X101.49 Y103.76 Z4.84
G1 Z4.44
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2070
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
M204 S10000
G1 X101.099 Y104.175 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2070
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
G1 F2070
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
G1 X81.961 Y79.92 Z4.84 F42000
G1 X79.516 Y81.473 Z4.84
G1 Z4.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384948
G1 F2070
M204 S5000
G1 X79.402 Y81.237 E.00314
G1 X79.388 Y80.964 E.00328
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.392828
G1 X79.74 Y80.458 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399268
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398248
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398288
G1 X80.512 Y81.594 E.00451
; LINE_WIDTH: 0.389248
G1 X80.259 Y81.729 E.00348
; LINE_WIDTH: 0.385908
G1 X79.986 Y81.75 E.00329
; LINE_WIDTH: 0.389388
G1 X79.726 Y81.665 E.00332
G1 X79.558 Y81.516 E.00273
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.12119
G1 X79.388 Y80.964 E-.10396
G1 X79.494 Y80.683 E-.1141
G1 X79.74 Y80.458 E-.12697
G1 X80.016 Y80.374 E-.10948
G1 X80.289 Y80.403 E-.10455
G1 X80.471 Y80.508 E-.07976
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z4.84 F42000
G1 Z4.44
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2070
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z4.84 F42000
G1 X85.146 Y97.246 Z4.84
G1 Z4.44
G1 E.8 F1800
G1 F2070
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
M73 P59 R6
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
G3 Z4.84 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 54/99
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 15
G1 X77.555 Y75.751 F42000
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.403288
G1 F2093
M204 S5000
G1 X77.745 Y75.595 E.0031
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
G1 X85.808 Y75.405 E.01785
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.671 J-1925.969 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.607 Y75.404 I.35 J-45.902 E.01582
; LINE_WIDTH: 0.406668
G1 X101.886 Y75.445 E.00358
; LINE_WIDTH: 0.412668
G1 X102.291 Y75.614 E.00565
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
G1 X77.509 Y75.789 E.00085
; WIPE_START
G1 F12000
M204 S6000
G1 X77.745 Y75.595 E-.11626
G1 X78.129 Y75.438 E-.1577
G1 X78.41 Y75.405 E-.1073
G1 X79.407 Y75.405 E-.37873
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.096 Y81.427 Z4.92 F42000
G1 X101.49 Y103.76 Z4.92
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2093
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.862 Y104.023 Z4.92 F42000
G1 X86.402 Y104.174 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2093
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
G1 F2093
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
G1 X81.953 Y79.908 Z4.92 F42000
G1 X79.504 Y81.459 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.394628
G1 F2093
M204 S5000
G1 X79.382 Y81.146 E.00413
G1 X79.407 Y80.863 E.00349
; LINE_WIDTH: 0.392388
G1 X79.537 Y80.621 E.00336
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399148
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398388
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398248
G1 X80.512 Y81.594 E.00451
; LINE_WIDTH: 0.389248
G1 X80.259 Y81.729 E.00348
; LINE_WIDTH: 0.385908
G1 X79.986 Y81.75 E.00329
G1 X79.727 Y81.664 E.00329
G1 X79.548 Y81.5 E.00292
; WIPE_START
G1 F12000
M204 S6000
G1 X79.382 Y81.146 E-.14854
G1 X79.407 Y80.863 E-.10793
G1 X79.537 Y80.621 E-.10437
G1 X79.751 Y80.449 E-.10446
G1 X80.016 Y80.374 E-.10448
G1 X80.289 Y80.403 E-.1044
G1 X80.485 Y80.516 E-.08584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2093
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z4.92 F42000
G1 X85.146 Y97.246 Z4.92
G1 Z4.52
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
G3 Z4.92 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 55/99
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 15
G1 X77.573 Y75.736 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.408258
G1 F2070
M204 S5000
G1 X77.698 Y75.619 E.00218
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
M73 P60 R6
G1 X101.886 Y75.445 E.00357
; LINE_WIDTH: 0.412608
G1 X102.291 Y75.614 E.00566
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
G1 X77.529 Y75.777 E.00244
; WIPE_START
G1 F12000
M204 S6000
G1 X77.698 Y75.619 E-.08781
G1 X78.064 Y75.457 E-.1521
G1 X78.412 Y75.405 E-.13392
G1 X79.429 Y75.405 E-.38617
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.115 Y81.429 Z5 F42000
G1 X101.49 Y103.76 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2070
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
M204 S10000
G1 X101.099 Y104.175 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2070
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
G1 F2070
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
G1 X81.962 Y79.922 Z5 F42000
G1 X79.519 Y81.477 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2070
M204 S5000
G1 X79.394 Y81.211 E.00353
; LINE_WIDTH: 0.392868
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00385
G1 X80.154 Y80.378 E.00463
; LINE_WIDTH: 0.389408
G1 X80.464 Y80.498 E.00403
; LINE_WIDTH: 0.397988
G1 X80.69 Y80.752 E.00423
; LINE_WIDTH: 0.398408
G1 X80.766 Y81.03 E.00358
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.389228
G1 X80.502 Y81.603 E.00348
; LINE_WIDTH: 0.385948
G1 X80.259 Y81.729 E.00328
G1 X79.986 Y81.75 E.00329
; LINE_WIDTH: 0.389388
G1 X79.726 Y81.666 E.00332
G1 X79.561 Y81.519 E.00268
; WIPE_START
G1 F12000
M204 S6000
G1 X79.394 Y81.211 E-.13313
G1 X79.405 Y80.877 E-.12692
G1 X79.537 Y80.621 E-.10946
G1 X79.783 Y80.429 E-.11854
G1 X80.154 Y80.378 E-.14239
G1 X80.464 Y80.498 E-.1262
G1 X80.469 Y80.505 E-.00336
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2070
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z5 F42000
G1 X85.146 Y97.246 Z5
G1 Z4.6
G1 E.8 F1800
G1 F2070
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
G3 Z5 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 56/99
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 15
G1 X77.579 Y75.734 F42000
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.403068
G1 F2071
M204 S5000
G1 X77.745 Y75.595 E.00272
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
G1 X102.291 Y75.614 E.00565
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
M73 P61 R6
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
G1 X77.533 Y75.772 E.00196
; WIPE_START
G1 F12000
M204 S6000
G1 X77.745 Y75.595 E-.10493
G1 X78.129 Y75.438 E-.15772
G1 X78.41 Y75.405 E-.10733
G1 X79.436 Y75.405 E-.39003
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.122 Y81.43 Z5.08 F42000
G1 X101.49 Y103.76 Z5.08
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2071
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
M204 S10000
G1 X101.099 Y104.175 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2071
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
G1 F2071
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
G1 X81.962 Y79.921 Z5.08 F42000
G1 X79.517 Y81.476 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392728
G1 F2071
M204 S5000
G1 X79.398 Y81.239 E.00325
G1 X79.385 Y80.964 E.00337
; LINE_WIDTH: 0.404508
G1 X79.517 Y80.646 E.00435
G1 X79.723 Y80.463 E.00347
; LINE_WIDTH: 0.402668
G1 X79.981 Y80.376 E.00343
; LINE_WIDTH: 0.402428
G1 X80.289 Y80.404 E.00388
; LINE_WIDTH: 0.398168
G1 X80.528 Y80.541 E.00342
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398208
G1 X80.583 Y81.536 E.00343
G1 X80.359 Y81.699 E.00343
G1 X80 Y81.751 E.00451
; LINE_WIDTH: 0.389228
G1 X79.727 Y81.664 E.00348
; LINE_WIDTH: 0.385948
G1 X79.56 Y81.518 E.00267
; WIPE_START
G1 F12000
M204 S6000
G1 X79.398 Y81.239 E-.12235
G1 X79.385 Y80.964 E-.10451
G1 X79.517 Y80.646 E-.13092
G1 X79.723 Y80.463 E-.10452
G1 X79.981 Y80.376 E-.10364
G1 X80.289 Y80.404 E-.11742
G1 X80.464 Y80.504 E-.07664
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2071
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z5.08 F42000
G1 X85.146 Y97.246 Z5.08
G1 Z4.68
G1 E.8 F1800
G1 F2071
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
G3 Z5.08 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 4.76
; LAYER_HEIGHT: 0.0800004
; layer num/total_layer_count: 57/99
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 15
G1 X77.588 Y75.727 F42000
G1 Z4.76
G1 E.8 F1800
; LINE_WIDTH: 0.403908
G1 F2091
M204 S5000
G1 X77.756 Y75.585 E.00277
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
G1 X102.291 Y75.614 E.00565
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
M73 P62 R6
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
G1 X77.542 Y75.766 E.00192
; WIPE_START
G1 F12000
M204 S6000
G1 X77.756 Y75.585 E-.10627
G1 X78.157 Y75.432 E-.16325
G1 X78.409 Y75.405 E-.09621
G1 X79.446 Y75.405 E-.39426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.131 Y81.431 Z5.16 F42000
G1 X101.49 Y103.76 Z5.16
G1 Z4.76
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2091
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.862 Y104.023 Z5.16 F42000
G1 X86.402 Y104.174 Z5.16
G1 Z4.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2091
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
G1 F2091
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
G1 X81.954 Y79.91 Z5.16 F42000
G1 X79.504 Y81.462 Z5.16
G1 Z4.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392848
G1 F2091
M204 S5000
G1 X79.384 Y81.15 E.00409
G1 X79.407 Y80.863 E.00353
; LINE_WIDTH: 0.392408
G1 X79.537 Y80.621 E.00336
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00386
G1 X80.154 Y80.378 E.00463
; LINE_WIDTH: 0.389408
G1 X80.437 Y80.479 E.00365
; LINE_WIDTH: 0.388668
G1 X80.661 Y80.706 E.00386
; LINE_WIDTH: 0.404668
G1 X80.763 Y81.031 E.00429
G1 X80.751 Y81.184 E.00194
; LINE_WIDTH: 0.393008
G1 X80.611 Y81.495 E.00418
G1 X80.389 Y81.681 E.00355
; LINE_WIDTH: 0.395168
G1 X80.092 Y81.762 E.00379
G1 X79.775 Y81.691 E.00401
; LINE_WIDTH: 0.385688
G1 X79.55 Y81.501 E.00354
; WIPE_START
G1 F12000
M204 S6000
G1 X79.384 Y81.15 E-.14738
G1 X79.407 Y80.863 E-.10951
G1 X79.537 Y80.621 E-.10431
G1 X79.783 Y80.429 E-.11862
G1 X80.154 Y80.378 E-.14233
G1 X80.437 Y80.479 E-.11445
G1 X80.481 Y80.523 E-.02342
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z5.16 F42000
G1 Z4.76
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2091
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z5.16 F42000
G1 X85.146 Y97.246 Z5.16
G1 Z4.76
G1 E.8 F1800
G1 F2091
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
G3 Z5.16 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 58/99
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y103.76 F42000
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2094
M204 S5000
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
M73 P62 R5
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
G1 X101.49 Y76.24 E.20326
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
M73 P63 R5
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.795 Y97.796 Z5.24 F42000
G1 X77.572 Y75.735 Z5.24
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.404238
G1 F2094
M204 S5000
G1 X77.745 Y75.595 E.00282
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
G1 X102.291 Y75.614 E.00565
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
G1 X77.525 Y75.773 E.00111
; WIPE_START
G1 F12000
M204 S6000
G1 X77.745 Y75.595 E-.10763
G1 X78.129 Y75.438 E-.15765
G1 X78.41 Y75.405 E-.10747
G1 X79.429 Y75.405 E-.38724
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.06 Y75.553 Z5.24 F42000
G1 X101.099 Y75.826 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443458
G1 F2094
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
G1 F2094
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.62 Y97.068 Z5.24 F42000
G1 X79.518 Y81.477 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2094
M204 S5000
G1 X79.402 Y81.237 E.00319
G1 X79.388 Y80.964 E.00328
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.392888
G1 X79.74 Y80.458 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399188
G1 X80.289 Y80.403 E.00342
G1 X80.52 Y80.535 E.00331
; LINE_WIDTH: 0.413848
G1 X80.691 Y80.766 E.00372
G1 X80.762 Y81.031 E.00354
; LINE_WIDTH: 0.406128
G1 X80.757 Y81.132 E.00128
; LINE_WIDTH: 0.385948
G1 X80.677 Y81.393 E.00329
G1 X80.502 Y81.603 E.00329
G1 X80.259 Y81.729 E.00329
G1 X79.986 Y81.75 E.00329
; LINE_WIDTH: 0.389388
G1 X79.726 Y81.665 E.00332
G1 X79.561 Y81.519 E.00268
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.12273
G1 X79.388 Y80.964 E-.10397
G1 X79.494 Y80.683 E-.11411
G1 X79.74 Y80.458 E-.12696
G1 X80.016 Y80.374 E-.10946
G1 X80.289 Y80.403 E-.10449
G1 X80.468 Y80.505 E-.07828
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2094
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z5.24 F42000
G1 X85.146 Y97.246 Z5.24
G1 Z4.84
G1 E.8 F1800
G1 F2094
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
G3 Z5.24 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 4.92
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 59/99
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y103.76 F42000
G1 Z4.92
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2100
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
G1 X101.49 Y76.24 E.20326
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
M73 P64 R5
G1 X101.715 Y104.196 E.00445
; LINE_WIDTH: 0.409018
G1 X101.634 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.795 Y97.796 Z5.32 F42000
G1 X77.574 Y75.735 Z5.32
G1 Z4.92
G1 E.8 F1800
; LINE_WIDTH: 0.403388
G1 F2100
M204 S5000
G1 X77.745 Y75.595 E.00279
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
G1 X102.291 Y75.613 E.00485
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
G1 X77.527 Y75.773 E.00115
; WIPE_START
G1 F12000
M204 S6000
G1 X77.745 Y75.595 E-.10699
G1 X78.165 Y75.438 E-.1702
G1 X78.407 Y75.405 E-.09287
G1 X79.433 Y75.405 E-.38994
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.064 Y75.553 Z5.32 F42000
G1 X101.099 Y75.826 Z5.32
G1 Z4.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443448
G1 F2100
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
G1 F2100
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.62 Y97.068 Z5.32 F42000
G1 X79.517 Y81.48 Z5.32
G1 Z4.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389408
G1 F2100
M204 S5000
G1 X79.402 Y81.237 E.00326
; LINE_WIDTH: 0.385008
G1 X79.388 Y80.964 E.00328
G1 X79.489 Y80.691 E.0035
; LINE_WIDTH: 0.393068
G1 X79.739 Y80.459 E.00418
G1 X80.016 Y80.374 E.00355
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398408
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398288
G1 X80.583 Y81.536 E.00343
G1 X80.359 Y81.698 E.00343
G1 X80 Y81.751 E.00451
; LINE_WIDTH: 0.389228
G1 X79.727 Y81.664 E.00348
; LINE_WIDTH: 0.389408
G1 X79.561 Y81.52 E.00266
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.12331
G1 X79.388 Y80.964 E-.10393
G1 X79.489 Y80.691 E-.11084
G1 X79.739 Y80.459 E-.1296
G1 X80.016 Y80.374 E-.11007
G1 X80.289 Y80.403 E-.10453
G1 X80.466 Y80.505 E-.07772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z5.32 F42000
G1 Z4.92
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2100
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z5.32 F42000
G1 X85.146 Y97.246 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F2100
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
G3 Z5.32 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 60/99
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y103.76 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2101
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.797 Y97.795 Z5.4 F42000
G1 X77.581 Y75.728 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.404238
G1 F2101
M204 S5000
G1 X77.745 Y75.595 E.00267
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
M73 P65 R5
G1 X101.887 Y75.445 E.00353
; LINE_WIDTH: 0.412458
G1 X102.291 Y75.614 E.00565
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
G1 X77.534 Y75.766 E.00125
; WIPE_START
G1 F12000
M204 S6000
G1 X77.745 Y75.595 E-.10329
G1 X78.129 Y75.438 E-.15766
G1 X78.41 Y75.405 E-.10733
G1 X79.441 Y75.405 E-.39172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.072 Y75.553 Z5.4 F42000
G1 X101.099 Y75.826 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443428
G1 F2101
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
G1 F2101
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
G1 X94.113 Y98.396 Z5.4 F42000
G1 X79.52 Y81.48 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2101
M204 S5000
G1 X79.394 Y81.211 E.00356
; LINE_WIDTH: 0.392888
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.392328
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398268
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398228
G1 X80.583 Y81.536 E.00343
G1 X80.272 Y81.724 E.00451
; LINE_WIDTH: 0.389368
G1 X79.986 Y81.752 E.00349
G1 X79.727 Y81.663 E.00332
; LINE_WIDTH: 0.384968
G1 X79.564 Y81.52 E.0026
; WIPE_START
G1 F12000
M204 S6000
G1 X79.394 Y81.211 E-.13407
G1 X79.405 Y80.877 E-.127
G1 X79.537 Y80.621 E-.10944
G1 X79.751 Y80.449 E-.10442
G1 X80.016 Y80.374 E-.10444
G1 X80.289 Y80.403 E-.10452
G1 X80.463 Y80.503 E-.07611
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2101
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z5.4 F42000
G1 X85.146 Y97.246 Z5.4
G1 Z5
G1 E.8 F1800
G1 F2101
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
G3 Z5.4 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.08
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 61/99
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 15
G1 X77.616 Y75.686 F42000
G1 Z5.08
G1 E.8 F1800
; LINE_WIDTH: 0.412968
G1 F2070
M204 S5000
G1 X77.968 Y75.483 E.00525
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
G1 X102.292 Y75.613 E.00486
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
G1 X77.57 Y75.724 E.00498
; WIPE_START
G1 F12000
M204 S6000
G1 X77.968 Y75.483 E-.17703
G1 X78.405 Y75.405 E-.16868
G1 X79.496 Y75.405 E-.41429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.174 Y81.436 Z5.48 F42000
G1 X101.49 Y103.76 Z5.48
G1 Z5.08
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2070
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
M73 P66 R5
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
M204 S10000
G1 X101.099 Y104.175 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2070
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
G1 F2070
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
G1 X81.968 Y79.931 Z5.48 F42000
G1 X79.527 Y81.488 Z5.48
G1 Z5.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.386588
G1 F2070
M204 S5000
G1 X79.394 Y81.211 E.0037
; LINE_WIDTH: 0.392908
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00386
G1 X80.154 Y80.378 E.00463
; LINE_WIDTH: 0.389408
G1 X80.437 Y80.479 E.00365
; LINE_WIDTH: 0.392908
G1 X80.669 Y80.72 E.00409
; LINE_WIDTH: 0.396108
G1 X80.767 Y81.03 E.00402
G1 X80.733 Y81.267 E.00295
; LINE_WIDTH: 0.392348
G1 X80.603 Y81.509 E.00336
G1 X80.389 Y81.681 E.00336
; LINE_WIDTH: 0.395168
G1 X80.092 Y81.762 E.00379
G1 X79.775 Y81.691 E.00401
; LINE_WIDTH: 0.386588
G1 X79.573 Y81.527 E.00314
; WIPE_START
G1 F12000
M204 S6000
G1 X79.394 Y81.211 E-.13778
G1 X79.405 Y80.877 E-.12693
G1 X79.537 Y80.621 E-.10948
G1 X79.783 Y80.429 E-.11863
G1 X80.154 Y80.378 E-.14229
G1 X80.437 Y80.479 E-.11443
G1 X80.457 Y80.499 E-.01045
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z5.48 F42000
G1 Z5.08
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2070
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z5.48 F42000
G1 X85.146 Y97.246 Z5.48
G1 Z5.08
G1 E.8 F1800
G1 F2070
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
G3 Z5.48 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.16
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 62/99
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 15
G1 X77.618 Y75.693 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.408228
G1 F2087
M204 S5000
G1 X77.698 Y75.619 E.00139
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
G1 X102.291 Y75.613 E.00486
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
G1 X77.574 Y75.734 E.00323
; WIPE_START
G1 F12000
M204 S6000
G1 X77.698 Y75.619 E-.06425
G1 X78.064 Y75.457 E-.15212
G1 X78.413 Y75.405 E-.13412
G1 X79.49 Y75.405 E-.40952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.169 Y81.435 Z5.56 F42000
G1 X101.49 Y103.76 Z5.56
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2087
M204 S5000
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
M73 P67 R5
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.862 Y104.023 Z5.56 F42000
G1 X86.402 Y104.174 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2087
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
G1 F2087
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
G1 X81.964 Y79.925 Z5.56 F42000
G1 X79.521 Y81.481 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2087
M204 S5000
G1 X79.394 Y81.211 E.00358
; LINE_WIDTH: 0.392908
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.392388
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399228
G1 X80.289 Y80.403 E.00342
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398268
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398408
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.389188
G1 X80.502 Y81.603 E.00348
; LINE_WIDTH: 0.385988
G1 X80.259 Y81.729 E.00329
; LINE_WIDTH: 0.389368
G1 X79.986 Y81.752 E.00332
G1 X79.727 Y81.663 E.00333
; LINE_WIDTH: 0.384968
G1 X79.565 Y81.522 E.00258
; WIPE_START
G1 F12000
M204 S6000
G1 X79.394 Y81.211 E-.1347
G1 X79.405 Y80.877 E-.127
G1 X79.537 Y80.621 E-.10939
G1 X79.751 Y80.449 E-.10443
G1 X80.016 Y80.374 E-.10444
G1 X80.289 Y80.403 E-.10449
G1 X80.461 Y80.502 E-.07555
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2087
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z5.56 F42000
G1 X85.146 Y97.246 Z5.56
G1 Z5.16
G1 E.8 F1800
G1 F2087
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
G3 Z5.56 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.24
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 63/99
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y103.76 F42000
G1 Z5.24
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2100
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.809 Y97.785 Z5.64 F42000
G1 X77.637 Y75.684 Z5.64
G1 Z5.24
G1 E.8 F1800
; LINE_WIDTH: 0.403468
G1 F2100
M204 S5000
G1 X77.745 Y75.595 E.00176
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
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.69 J-1924.588 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.613 Y75.404 I.351 J-46.617 E.01591
; LINE_WIDTH: 0.406668
G1 X101.887 Y75.445 E.00351
; LINE_WIDTH: 0.412308
G1 X102.291 Y75.614 E.00564
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
M73 P68 R5
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
G1 X77.59 Y75.722 E.00217
; WIPE_START
G1 F12000
M204 S6000
G1 X77.745 Y75.595 E-.07603
G1 X78.161 Y75.435 E-.16925
G1 X78.407 Y75.405 E-.09449
G1 X79.513 Y75.405 E-.42022
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.144 Y75.554 Z5.64 F42000
G1 X101.099 Y75.826 Z5.64
G1 Z5.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443258
G1 F2100
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
G1 F2100
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.617 Y97.069 Z5.64 F42000
G1 X79.491 Y81.444 Z5.64
G1 Z5.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.403388
G1 F2100
M204 S5000
G1 X79.478 Y81.429 E.00024
G1 X79.383 Y81.169 E.00349
; LINE_WIDTH: 0.402708
G1 X79.397 Y80.894 E.00346
G1 X79.516 Y80.646 E.00346
G1 X79.723 Y80.463 E.00346
G1 X79.981 Y80.376 E.00343
; LINE_WIDTH: 0.402408
G1 X80.289 Y80.404 E.00388
; LINE_WIDTH: 0.398208
G1 X80.529 Y80.541 E.00342
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398408
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398188
G1 X80.512 Y81.594 E.00451
; LINE_WIDTH: 0.389248
G1 X80.259 Y81.729 E.00348
; LINE_WIDTH: 0.385928
G1 X79.986 Y81.75 E.00329
; LINE_WIDTH: 0.400588
G1 X79.65 Y81.619 E.0045
; LINE_WIDTH: 0.403388
G1 X79.532 Y81.488 E.00223
; WIPE_START
G1 F12000
M204 S6000
G1 X79.478 Y81.429 E-.03014
G1 X79.383 Y81.169 E-.10546
G1 X79.397 Y80.894 E-.10468
G1 X79.516 Y80.646 E-.10458
G1 X79.723 Y80.463 E-.10466
G1 X79.981 Y80.376 E-.10367
G1 X80.289 Y80.404 E-.1174
G1 X80.493 Y80.521 E-.08941
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z5.64 F42000
G1 Z5.24
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2100
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z5.64 F42000
G1 X85.146 Y97.246 Z5.64
G1 Z5.24
G1 E.8 F1800
G1 F2100
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
G1 X77.633 Y75.681 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.406768
G1 F2065
M204 S5000
G1 X77.701 Y75.619 E.00116
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
G1 X102.292 Y75.613 E.00486
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
G1 X77.589 Y75.721 E.00337
; WIPE_START
G1 F12000
M204 S6000
G1 X77.701 Y75.619 E-.05744
G1 X78.064 Y75.456 E-.15115
G1 X78.412 Y75.405 E-.13401
G1 X79.511 Y75.405 E-.4174
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.187 Y81.437 Z5.72 F42000
G1 X101.49 Y103.76 Z5.72
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2065
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
M73 P68 R4
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410018
M73 P69 R4
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
G1 X101.492 Y103.82 E.00317
M204 S10000
G1 X101.099 Y104.175 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2065
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
G1 F2065
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
G1 X81.965 Y79.927 Z5.72 F42000
G1 X79.522 Y81.484 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389388
G1 F2065
M204 S5000
G1 X79.521 Y81.483 E.00001
; LINE_WIDTH: 0.384988
G1 X79.402 Y81.237 E.00328
G1 X79.388 Y80.964 E.00328
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.392888
G1 X79.74 Y80.458 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.521 Y80.536 E.00333
; LINE_WIDTH: 0.403668
G1 X80.695 Y80.764 E.00361
; LINE_WIDTH: 0.410848
G1 X80.76 Y81.031 E.00352
G1 X80.757 Y81.122 E.00118
; LINE_WIDTH: 0.388028
G1 X80.677 Y81.393 E.00342
; LINE_WIDTH: 0.385968
G1 X80.502 Y81.603 E.00329
G1 X80.259 Y81.729 E.00329
G1 X79.986 Y81.75 E.00329
; LINE_WIDTH: 0.389388
G1 X79.726 Y81.666 E.00331
G1 X79.567 Y81.523 E.0026
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.02301
G1 X79.402 Y81.237 E-.10391
G1 X79.388 Y80.964 E-.10385
G1 X79.494 Y80.683 E-.11414
G1 X79.74 Y80.458 E-.12691
G1 X80.016 Y80.374 E-.10949
G1 X80.289 Y80.403 E-.10454
G1 X80.459 Y80.5 E-.07415
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2065
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z5.72 F42000
G1 X85.146 Y97.246 Z5.72
G1 Z5.32
G1 E.8 F1800
G1 F2065
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
G1 X101.49 Y103.76 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2096
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.809 Y97.785 Z5.8 F42000
G1 X77.632 Y75.68 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.408258
G1 F2096
M204 S5000
G1 X77.698 Y75.619 E.00114
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
G1 X102.291 Y75.613 E.00564
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
G1 X77.588 Y75.721 E.00347
; WIPE_START
G1 F12000
M204 S6000
G1 X77.698 Y75.619 E-.05687
G1 X78.064 Y75.457 E-.15214
G1 X78.412 Y75.405 E-.13391
G1 X79.51 Y75.405 E-.41708
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.141 Y75.554 Z5.8 F42000
G1 X101.099 Y75.826 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2096
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
M73 P70 R4
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.865 Y83.439 Z5.8 F42000
G1 X86.402 Y104.174 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.443218
G1 F2096
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
G1 X94.113 Y98.396 Z5.8 F42000
G1 X79.548 Y81.513 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389248
G1 F2096
M204 S5000
G1 X79.411 Y81.271 E.00337
; LINE_WIDTH: 0.385948
G1 X79.387 Y80.962 E.00372
; LINE_WIDTH: 0.384788
G1 X79.508 Y80.662 E.00387
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00446
G1 X80.154 Y80.378 E.00463
; LINE_WIDTH: 0.389408
G1 X80.437 Y80.479 E.00365
; LINE_WIDTH: 0.388628
G1 X80.661 Y80.706 E.00386
; LINE_WIDTH: 0.405248
G1 X80.763 Y81.03 E.0043
G1 X80.752 Y81.166 E.00172
; LINE_WIDTH: 0.386268
G1 X80.644 Y81.448 E.00364
; LINE_WIDTH: 0.392648
G1 X80.396 Y81.675 E.00411
G1 X80.124 Y81.756 E.00347
; LINE_WIDTH: 0.396588
G1 X79.813 Y81.714 E.00389
G1 X79.593 Y81.551 E.00338
; WIPE_START
G1 F12000
M204 S6000
G1 X79.411 Y81.271 E-.12713
G1 X79.387 Y80.962 E-.11765
G1 X79.508 Y80.662 E-.12288
G1 X79.783 Y80.429 E-.13709
G1 X80.154 Y80.378 E-.14238
G1 X80.434 Y80.478 E-.11287
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2096
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z5.8 F42000
G1 X85.146 Y97.246 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F2096
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
G1 X77.65 Y75.672 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.404218
G1 F2086
M204 S5000
G1 X77.745 Y75.595 E.00155
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
G1 X102.291 Y75.614 E.00564
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
G1 X77.603 Y75.71 E.00237
; WIPE_START
G1 F12000
M204 S6000
G1 X77.745 Y75.595 E-.06957
G1 X78.153 Y75.433 E-.16666
G1 X78.409 Y75.405 E-.09803
G1 X79.53 Y75.405 E-.42574
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.203 Y81.439 Z5.88 F42000
G1 X101.49 Y103.76 Z5.88
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2086
M204 S5000
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
G1 X101.49 Y76.24 E.20326
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
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.862 Y104.023 Z5.88 F42000
G1 X86.402 Y104.174 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2086
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
G1 F2086
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
M73 P71 R4
G1 X86.402 Y75.825 E.02782
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.966 Y79.927 Z5.88 F42000
G1 X79.523 Y81.484 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384988
G1 F2086
M204 S5000
G1 X79.521 Y81.483 E.00002
G1 X79.394 Y81.211 E.0036
; LINE_WIDTH: 0.392908
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00385
G1 X80.154 Y80.378 E.00463
; LINE_WIDTH: 0.389408
G1 X80.437 Y80.479 E.00365
; LINE_WIDTH: 0.388668
G1 X80.661 Y80.706 E.00386
; LINE_WIDTH: 0.405248
G1 X80.763 Y81.03 E.00429
G1 X80.749 Y81.193 E.00206
; LINE_WIDTH: 0.392928
G1 X80.61 Y81.497 E.00409
; LINE_WIDTH: 0.396228
G1 X80.335 Y81.706 E.00427
G1 X79.996 Y81.752 E.00423
; LINE_WIDTH: 0.391248
G1 X79.727 Y81.663 E.00345
; LINE_WIDTH: 0.384988
G1 X79.568 Y81.524 E.00253
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.02358
G1 X79.394 Y81.211 E-.11408
G1 X79.405 Y80.877 E-.12701
G1 X79.537 Y80.621 E-.10944
G1 X79.783 Y80.429 E-.11854
G1 X80.154 Y80.378 E-.14237
G1 X80.437 Y80.479 E-.11444
G1 X80.457 Y80.499 E-.01054
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.654 Y82.754 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2086
M204 S5000
G1 X85.146 Y82.754 E.00787
G1 X85.146 Y83 E.00394
G1 X85.146 Y84.246 E.01995
G1 X84.654 Y84.246 E.00787
G1 X84.654 Y82.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y82.754 E-.18813
G1 X85.146 Y83 E-.09337
G1 X85.146 Y84.246 E-.47337
G1 X85.132 Y84.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.14 Y91.878 Z5.88 F42000
G1 X85.146 Y97.246 Z5.88
G1 Z5.48
G1 E.8 F1800
G1 F2086
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
G1 X77.655 Y75.668 F42000
G1 Z5.56
G1 E.8 F1800
; LINE_WIDTH: 0.404208
G1 F1713
M204 S5000
G1 X77.745 Y75.595 E.00146
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
G1 X102.279 Y75.606 E.00597
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
G1 X77.608 Y75.706 E.00246
; WIPE_START
G1 F12000
M204 S6000
G1 X77.745 Y75.595 E-.06687
G1 X78.161 Y75.435 E-.16916
G1 X78.407 Y75.405 E-.0945
G1 X79.538 Y75.405 E-.42948
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.278 Y81.387 Z5.96 F42000
G1 X102.174 Y103.971 Z5.96
G1 Z5.56
G1 E.8 F1800
; LINE_WIDTH: 0.408538
G1 F1713
M204 S5000
G1 X102.002 Y104.106 E.0028
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
G1 X101.833 Y75.83 E.00301
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
G1 X102.221 Y103.933 E.00095
; WIPE_START
G1 F12000
M204 S6000
G1 X102.002 Y104.106 E-.10607
G1 X101.585 Y104.202 E-.16257
G1 X100.292 Y104.202 E-.49137
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.142 Y98.569 Z5.96 F42000
G1 X79.525 Y81.486 Z5.96
G1 Z5.56
G1 E.8 F1800
; LINE_WIDTH: 0.384968
G1 F1713
M204 S5000
G1 X79.521 Y81.483 E.00006
G1 X79.402 Y81.237 E.00327
G1 X79.388 Y80.964 E.00328
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.392928
G1 X79.74 Y80.457 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.389228
G1 X80.502 Y81.603 E.00348
; LINE_WIDTH: 0.385968
G1 X80.259 Y81.729 E.00329
; LINE_WIDTH: 0.389408
G1 X79.986 Y81.752 E.00332
G1 X79.727 Y81.663 E.00332
; LINE_WIDTH: 0.384968
G1 X79.57 Y81.526 E.0025
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.02459
G1 X79.402 Y81.237 E-.10378
G1 X79.388 Y80.964 E-.10393
G1 X79.494 Y80.683 E-.11413
G1 X79.74 Y80.457 E-.12701
G1 X80.016 Y80.374 E-.1094
G1 X80.289 Y80.403 E-.10455
G1 X80.455 Y80.499 E-.0726
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
G1 X77.659 Y75.664 F42000
G1 Z5.64
M73 P72 R4
G1 E.8 F1800
; LINE_WIDTH: 0.404228
G1 F1708
M204 S5000
G1 X77.745 Y75.595 E.00139
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
G1 X102.279 Y75.606 E.00597
; LINE_WIDTH: 0.416448
G1 X102.576 Y75.863 E.00512
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
G1 X77.613 Y75.702 E.00253
; WIPE_START
G1 F12000
M204 S6000
G1 X77.745 Y75.595 E-.06472
G1 X78.152 Y75.433 E-.16627
G1 X78.409 Y75.405 E-.09847
G1 X79.542 Y75.405 E-.43054
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.27 Y81.397 Z6.04 F42000
G1 X102.115 Y104.017 Z6.04
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.409288
G1 F1708
M204 S5000
G1 X102.002 Y104.107 E.00184
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
G1 X101.832 Y75.83 E.003
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
G1 X102.162 Y103.98 E.00191
; WIPE_START
G1 F12000
M204 S6000
G1 X102.002 Y104.107 E-.07759
G1 X101.668 Y104.2 E-.13168
G1 X100.219 Y104.201 E-.55073
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.079 Y98.559 Z6.04 F42000
G1 X79.528 Y81.49 Z6.04
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.386588
G1 F1708
M204 S5000
G1 X79.394 Y81.211 E.00372
; LINE_WIDTH: 0.392888
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.396088
G1 X79.783 Y80.429 E.00386
G1 X80.154 Y80.378 E.00462
; LINE_WIDTH: 0.389408
G1 X80.437 Y80.479 E.00365
; LINE_WIDTH: 0.388648
G1 X80.661 Y80.706 E.00386
; LINE_WIDTH: 0.405248
G1 X80.763 Y81.03 E.0043
G1 X80.752 Y81.166 E.00172
; LINE_WIDTH: 0.384968
G1 X80.66 Y81.423 E.00328
G1 X80.453 Y81.641 E.0036
; LINE_WIDTH: 0.395208
G1 X80.092 Y81.762 E.00469
G1 X79.775 Y81.691 E.00401
; LINE_WIDTH: 0.386588
G1 X79.574 Y81.528 E.00311
; WIPE_START
G1 F12000
M204 S6000
G1 X79.394 Y81.211 E-.13837
G1 X79.405 Y80.877 E-.12702
G1 X79.537 Y80.621 E-.10952
G1 X79.783 Y80.429 E-.11865
G1 X80.154 Y80.378 E-.14223
G1 X80.437 Y80.479 E-.11439
G1 X80.456 Y80.498 E-.00983
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
G1 X77.66 Y75.658 F42000
G1 Z5.72
G1 E.8 F1800
; LINE_WIDTH: 0.406768
G1 F1708
M204 S5000
G1 X77.72 Y75.609 E.00098
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
G1 X102.278 Y75.605 E.00596
; LINE_WIDTH: 0.413068
G1 X102.577 Y75.862 E.00508
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
G1 X77.614 Y75.696 E.00273
; WIPE_START
G1 F12000
M204 S6000
G1 X77.72 Y75.609 E-.05218
G1 X78.151 Y75.434 E-.17674
G1 X78.409 Y75.405 E-.09877
G1 X79.547 Y75.405 E-.43231
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.274 Y81.397 Z6.12 F42000
G1 X102.118 Y104.015 Z6.12
G1 Z5.72
G1 E.8 F1800
; LINE_WIDTH: 0.405878
G1 F1708
M204 S5000
G1 X102.001 Y104.105 E.00187
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
G1 X101.832 Y75.83 E.00301
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
G1 X102.165 Y103.978 E.00184
; WIPE_START
G1 F12000
M204 S6000
G1 X102.001 Y104.105 E-.07882
G1 X101.668 Y104.2 E-.13167
G1 X100.222 Y104.201 E-.54951
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.081 Y98.56 Z6.12 F42000
G1 X79.528 Y81.49 Z6.12
G1 Z5.72
G1 E.8 F1800
; LINE_WIDTH: 0.386588
G1 F1708
M204 S5000
G1 X79.394 Y81.211 E.00372
; LINE_WIDTH: 0.392868
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00386
G1 X80.154 Y80.378 E.00463
; LINE_WIDTH: 0.389408
G1 X80.437 Y80.479 E.00365
; LINE_WIDTH: 0.388628
G1 X80.661 Y80.706 E.00386
; LINE_WIDTH: 0.404908
G1 X80.763 Y81.03 E.00429
G1 X80.75 Y81.187 E.00198
; LINE_WIDTH: 0.392928
G1 X80.611 Y81.496 E.00415
G1 X80.389 Y81.681 E.00354
; LINE_WIDTH: 0.392388
G1 X80.124 Y81.756 E.00336
; LINE_WIDTH: 0.397748
G1 X79.796 Y81.703 E.00413
G1 X79.575 Y81.527 E.0035
; WIPE_START
G1 F12000
M204 S6000
G1 X79.394 Y81.211 E-.1384
G1 X79.405 Y80.877 E-.12686
G1 X79.537 Y80.621 E-.10952
G1 X79.783 Y80.429 E-.11863
G1 X80.154 Y80.378 E-.14232
G1 X80.437 Y80.479 E-.11434
G1 X80.456 Y80.498 E-.00994
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
G1 X77.658 Y75.655 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.408258
G1 F1708
M204 S5000
G1 X77.698 Y75.618 E.00069
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
G1 X102.278 Y75.605 E.00596
; LINE_WIDTH: 0.416478
G1 X102.576 Y75.863 E.00513
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
M73 P74 R4
G1 X81.592 Y104.594 E.02549
; LINE_WIDTH: 0.408028
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
G1 X77.614 Y75.696 E.00382
; WIPE_START
G1 F12000
M204 S6000
G1 X77.698 Y75.618 E-.04323
G1 X78.064 Y75.457 E-.15194
G1 X78.412 Y75.405 E-.13397
G1 X79.546 Y75.405 E-.43087
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.287 Y81.387 Z6.2 F42000
G1 X102.181 Y103.966 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.408458
G1 F1708
M204 S5000
G1 X102.001 Y104.107 E.00291
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
G1 X101.833 Y75.83 E.00301
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
G1 X102.228 Y103.929 E.00083
; WIPE_START
G1 F12000
M204 S6000
G1 X102.001 Y104.107 E-.10952
G1 X101.585 Y104.202 E-.1622
G1 X100.3 Y104.202 E-.48827
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.149 Y98.57 Z6.2 F42000
G1 X79.528 Y81.489 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.389368
G1 F1708
M204 S5000
G1 X79.521 Y81.483 E.0001
; LINE_WIDTH: 0.384968
G1 X79.402 Y81.237 E.00328
G1 X79.388 Y80.964 E.00328
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.392888
G1 X79.74 Y80.458 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399208
G1 X80.289 Y80.403 E.00342
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398208
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398408
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398228
G1 X80.583 Y81.536 E.00343
G1 X80.359 Y81.699 E.00343
G1 X80 Y81.751 E.00451
; LINE_WIDTH: 0.389368
G1 X79.726 Y81.666 E.00348
G1 X79.572 Y81.529 E.0025
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.02593
G1 X79.402 Y81.237 E-.10384
G1 X79.388 Y80.964 E-.10392
G1 X79.494 Y80.683 E-.11415
G1 X79.74 Y80.458 E-.12698
G1 X80.016 Y80.374 E-.10946
G1 X80.289 Y80.403 E-.1045
G1 X80.451 Y80.497 E-.07122
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
G1 X77.673 Y75.653 F42000
G1 Z5.88
G1 E.8 F1800
; LINE_WIDTH: 0.404658
G1 F1710
M204 S5000
G1 X77.742 Y75.598 E.00111
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
G1 X102.278 Y75.605 E.00595
; LINE_WIDTH: 0.413048
G1 X102.577 Y75.862 E.0051
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
G1 X77.627 Y75.691 E.00279
; WIPE_START
G1 F12000
M204 S6000
G1 X77.742 Y75.598 E-.05619
G1 X78.129 Y75.438 E-.15927
G1 X78.41 Y75.405 E-.10758
G1 X79.56 Y75.405 E-.43697
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.299 Y81.388 Z6.28 F42000
G1 X102.179 Y103.963 Z6.28
G1 Z5.88
G1 E.8 F1800
; LINE_WIDTH: 0.406578
G1 F1710
M204 S5000
G1 X102 Y104.105 E.0029
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
G1 X101.833 Y75.83 E.00301
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
G1 X102.226 Y103.926 E.00115
; WIPE_START
G1 F12000
M204 S6000
G1 X102 Y104.105 E-.1095
G1 X101.668 Y104.2 E-.1313
G1 X100.302 Y104.201 E-.51921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.153 Y98.567 Z6.28 F42000
G1 X79.491 Y81.43 Z6.28
G1 Z5.88
G1 E.8 F1800
; LINE_WIDTH: 0.392908
G1 F1710
M204 S5000
G1 X79.471 Y81.41 E.00035
G1 X79.38 Y81.136 E.00353
; LINE_WIDTH: 0.392348
G1 X79.407 Y80.863 E.00336
G1 X79.537 Y80.621 E.00336
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399288
G1 X80.289 Y80.403 E.00343
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398408
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398268
G1 X80.512 Y81.594 E.00451
; LINE_WIDTH: 0.389248
G1 X80.259 Y81.729 E.00348
; LINE_WIDTH: 0.385908
G1 X79.986 Y81.75 E.00329
; LINE_WIDTH: 0.389388
G1 X79.726 Y81.666 E.00332
; LINE_WIDTH: 0.392908
G1 X79.533 Y81.472 E.00334
; WIPE_START
G1 F12000
M204 S6000
G1 X79.471 Y81.41 E-.03358
G1 X79.38 Y81.136 E-.10945
G1 X79.407 Y80.863 E-.10436
G1 X79.537 Y80.621 E-.1044
G1 X79.751 Y80.449 E-.10447
G1 X80.016 Y80.374 E-.10444
G1 X80.289 Y80.403 E-.10459
G1 X80.505 Y80.528 E-.09471
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
G1 X77.678 Y75.649 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.404218
G1 F1708
M204 S5000
G1 X77.745 Y75.595 E.00108
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
G1 X102.277 Y75.605 E.00595
; LINE_WIDTH: 0.413018
G1 X102.577 Y75.862 E.0051
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
G1 X77.632 Y75.687 E.00284
; WIPE_START
G1 F12000
M204 S6000
G1 X77.745 Y75.595 E-.05544
G1 X78.149 Y75.434 E-.16515
G1 X78.41 Y75.405 E-.09972
G1 X79.567 Y75.405 E-.43968
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.303 Y81.39 Z6.36 F42000
G1 X102.172 Y103.973 Z6.36
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.405988
G1 F1708
M204 S5000
G1 X102 Y104.105 E.00275
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
M73 P76 R3
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
G1 X101.832 Y75.83 E.00301
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
G1 X102.219 Y103.936 E.00096
; WIPE_START
G1 F12000
M204 S6000
G1 X102 Y104.105 E-.10516
G1 X101.668 Y104.2 E-.1312
G1 X100.29 Y104.201 E-.52363
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.144 Y98.565 Z6.36 F42000
G1 X79.452 Y81.376 Z6.36
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.398368
G1 F1708
M204 S5000
G1 X79.374 Y81.102 E.00354
G1 X79.465 Y80.732 E.00473
; LINE_WIDTH: 0.386908
G1 X79.687 Y80.492 E.00394
; LINE_WIDTH: 0.392568
G1 X80.007 Y80.376 E.00416
; LINE_WIDTH: 0.399168
G1 X80.289 Y80.403 E.00353
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398228
G1 X80.512 Y81.594 E.00451
; LINE_WIDTH: 0.389268
G1 X80.259 Y81.729 E.00348
; LINE_WIDTH: 0.385908
G1 X79.986 Y81.75 E.00329
; LINE_WIDTH: 0.386868
G1 X79.677 Y81.631 E.004
; LINE_WIDTH: 0.392528
G1 X79.491 Y81.421 E.00343
; WIPE_START
G1 F12000
M204 S6000
G1 X79.374 Y81.102 E-.1292
G1 X79.465 Y80.732 E-.14472
G1 X79.687 Y80.492 E-.12424
G1 X80.007 Y80.376 E-.12932
G1 X80.289 Y80.403 E-.1078
G1 X80.529 Y80.541 E-.10499
G1 X80.56 Y80.582 E-.01972
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
G1 X77.683 Y75.645 F42000
G1 Z6.04
G1 E.8 F1800
; LINE_WIDTH: 0.403668
G1 F1708
M204 S5000
G1 X77.745 Y75.595 E.001
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
G1 X102.277 Y75.605 E.00595
; LINE_WIDTH: 0.416818
G1 X102.579 Y75.866 E.0052
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
G1 X77.637 Y75.683 E.00293
; WIPE_START
G1 F12000
M204 S6000
G1 X77.745 Y75.595 E-.05307
G1 X78.148 Y75.434 E-.1648
G1 X78.41 Y75.405 E-.10011
G1 X79.573 Y75.405 E-.44203
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.312 Y81.388 Z6.44 F42000
G1 X102.188 Y103.96 Z6.44
G1 Z6.04
G1 E.8 F1800
; LINE_WIDTH: 0.409118
G1 F1708
M204 S5000
G1 X102 Y104.108 E.00305
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
M73 P77 R3
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
G1 X101.832 Y75.83 E.00301
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
G1 X102.235 Y103.923 E.0007
; WIPE_START
G1 F12000
M204 S6000
G1 X102 Y104.108 E-.11365
G1 X101.58 Y104.202 E-.16358
G1 X100.31 Y104.202 E-.48277
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.158 Y98.571 Z6.44 F42000
G1 X79.531 Y81.492 Z6.44
G1 Z6.04
G1 E.8 F1800
; LINE_WIDTH: 0.384988
G1 F1708
M204 S5000
G1 X79.521 Y81.483 E.00016
G1 X79.402 Y81.237 E.00327
G1 X79.388 Y80.964 E.00328
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.392908
G1 X79.74 Y80.458 E.00409
G1 X80.015 Y80.374 E.00353
; LINE_WIDTH: 0.399208
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398248
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398228
G1 X80.512 Y81.594 E.00451
; LINE_WIDTH: 0.389228
G1 X80.259 Y81.729 E.00348
; LINE_WIDTH: 0.389368
G1 X79.986 Y81.752 E.00332
G1 X79.727 Y81.663 E.00333
; LINE_WIDTH: 0.384988
G1 X79.576 Y81.531 E.0024
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.0279
G1 X79.402 Y81.237 E-.10379
G1 X79.388 Y80.964 E-.10395
G1 X79.494 Y80.683 E-.11402
G1 X79.74 Y80.458 E-.12698
G1 X80.015 Y80.374 E-.10949
G1 X80.289 Y80.403 E-.10451
G1 X80.447 Y80.494 E-.06936
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
G1 X77.675 Y75.64 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.408238
G1 F1708
M204 S5000
G1 X77.698 Y75.619 E.00039
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
G1 X102.276 Y75.604 E.00594
; LINE_WIDTH: 0.412998
G1 X102.577 Y75.862 E.00512
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
G1 X77.631 Y75.681 E.00422
; WIPE_START
G1 F12000
M204 S6000
G1 X77.698 Y75.619 E-.03448
G1 X77.981 Y75.482 E-.11967
G1 X78.415 Y75.405 E-.16757
G1 X79.569 Y75.405 E-.43828
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.306 Y81.39 Z6.52 F42000
G1 X102.178 Y103.969 Z6.52
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.407268
G1 F1708
M204 S5000
G1 X101.999 Y104.106 E.00287
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
G1 X101.833 Y75.83 E.00301
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
M73 P78 R3
G1 X102.464 Y103.548 E.00351
; LINE_WIDTH: 0.407268
G1 X102.279 Y103.891 E.00496
G1 X102.226 Y103.932 E.00085
; WIPE_START
G1 F12000
M204 S6000
G1 X101.999 Y104.106 E-.1086
G1 X101.668 Y104.198 E-.13065
G1 X100.298 Y104.201 E-.52075
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.147 Y98.568 Z6.52 F42000
G1 X79.514 Y81.471 Z6.52
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.389388
G1 F1708
M204 S5000
G1 X79.504 Y81.462 E.00017
; LINE_WIDTH: 0.392868
G1 X79.384 Y81.15 E.00409
G1 X79.407 Y80.863 E.00353
; LINE_WIDTH: 0.392388
G1 X79.537 Y80.621 E.00336
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399268
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398268
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398408
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398268
G1 X80.583 Y81.536 E.00343
G1 X80.359 Y81.699 E.00343
G1 X80 Y81.751 E.00451
; LINE_WIDTH: 0.389388
G1 X79.726 Y81.665 E.00348
G1 X79.558 Y81.512 E.00276
; WIPE_START
G1 F12000
M204 S6000
G1 X79.504 Y81.462 E-.02801
G1 X79.384 Y81.15 E-.12704
G1 X79.407 Y80.863 E-.10947
G1 X79.537 Y80.621 E-.10438
G1 X79.751 Y80.449 E-.10451
G1 X80.016 Y80.374 E-.10436
G1 X80.289 Y80.403 E-.10454
G1 X80.466 Y80.505 E-.0777
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
G1 X77.678 Y75.636 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.408238
G1 F1713
M204 S5000
G1 X77.698 Y75.619 E.00034
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
G1 X102.276 Y75.604 E.00593
; LINE_WIDTH: 0.412928
G1 X102.576 Y75.861 E.0051
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
G1 X77.634 Y75.677 E.00416
; WIPE_START
G1 F12000
M204 S6000
G1 X77.698 Y75.619 E-.03283
G1 X78.064 Y75.457 E-.1521
G1 X78.413 Y75.405 E-.13405
G1 X79.573 Y75.405 E-.44101
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.312 Y81.389 Z6.6 F42000
G1 X102.184 Y103.958 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.411408
G1 F1713
M204 S5000
G1 X101.96 Y104.121 E.00357
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
G1 X101.833 Y75.83 E.00301
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
G1 X102.233 Y103.922 E.00071
; WIPE_START
G1 F12000
M204 S6000
G1 X101.96 Y104.121 E-.12837
G1 X101.59 Y104.202 E-.14394
G1 X100.306 Y104.202 E-.4877
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.154 Y98.571 Z6.6 F42000
G1 X79.532 Y81.495 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.389368
G1 F1713
M204 S5000
G1 X79.52 Y81.485 E.00019
G1 X79.402 Y81.237 E.00332
; LINE_WIDTH: 0.385008
G1 X79.388 Y80.964 E.00328
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00476
G1 X80.154 Y80.378 E.00463
; LINE_WIDTH: 0.389408
G1 X80.464 Y80.498 E.00403
; LINE_WIDTH: 0.397988
G1 X80.69 Y80.752 E.00423
; LINE_WIDTH: 0.398408
G1 X80.766 Y81.03 E.00358
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398268
G1 X80.583 Y81.536 E.00343
G1 X80.272 Y81.724 E.00451
; LINE_WIDTH: 0.389188
G1 X79.986 Y81.75 E.00348
; LINE_WIDTH: 0.385968
G1 X79.727 Y81.664 E.00329
; LINE_WIDTH: 0.389368
G1 X79.577 Y81.534 E.0024
; WIPE_START
G1 F12000
M204 S6000
G1 X79.52 Y81.485 E-.02873
G1 X79.402 Y81.237 E-.10414
G1 X79.388 Y80.964 E-.10395
G1 X79.494 Y80.683 E-.1141
G1 X79.783 Y80.429 E-.14636
G1 X80.154 Y80.378 E-.14232
G1 X80.449 Y80.492 E-.12041
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
G1 X77.682 Y75.633 F42000
G1 Z6.28
G1 E.8 F1800
; LINE_WIDTH: 0.408248
G1 F1708
M204 S5000
G1 X77.698 Y75.619 E.00027
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
M73 P79 R3
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
G1 X102.275 Y75.604 E.00593
; LINE_WIDTH: 0.412968
G1 X102.577 Y75.862 E.00512
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
G1 X77.639 Y75.674 E.00435
; WIPE_START
G1 F12000
M204 S6000
G1 X77.698 Y75.619 E-.03084
G1 X78.064 Y75.457 E-.15205
G1 X78.413 Y75.405 E-.13409
G1 X79.579 Y75.405 E-.44303
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.314 Y81.391 Z6.68 F42000
G1 X102.177 Y103.969 Z6.68
G1 Z6.28
G1 E.8 F1800
; LINE_WIDTH: 0.409168
G1 F1708
M204 S5000
G1 X101.999 Y104.108 E.00288
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
G1 X101.833 Y75.83 E.00301
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
G1 X102.224 Y103.932 E.00087
; WIPE_START
G1 F12000
M204 S6000
G1 X101.999 Y104.108 E-.10833
G1 X101.668 Y104.199 E-.1305
G1 X100.297 Y104.201 E-.52117
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.146 Y98.568 Z6.68 F42000
G1 X79.535 Y81.495 Z6.68
G1 Z6.28
G1 E.8 F1800
; LINE_WIDTH: 0.384968
G1 F1708
M204 S5000
G1 X79.521 Y81.483 E.00021
G1 X79.402 Y81.237 E.00328
G1 X79.388 Y80.964 E.00328
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.392928
G1 X79.74 Y80.457 E.0041
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399168
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398408
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.0034
; LINE_WIDTH: 0.398288
G1 X80.583 Y81.536 E.00343
G1 X80.272 Y81.724 E.00451
; LINE_WIDTH: 0.389388
G1 X79.986 Y81.752 E.00348
G1 X79.727 Y81.663 E.00333
; LINE_WIDTH: 0.384968
G1 X79.58 Y81.535 E.00234
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.0296
G1 X79.402 Y81.237 E-.10389
G1 X79.388 Y80.964 E-.1039
G1 X79.494 Y80.683 E-.11409
G1 X79.74 Y80.457 E-.12706
G1 X80.016 Y80.374 E-.10939
G1 X80.289 Y80.403 E-.10442
G1 X80.443 Y80.492 E-.06765
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
G1 X77.712 Y75.612 F42000
G1 Z6.36
G1 E.8 F1800
; LINE_WIDTH: 0.412818
G1 F1713
M204 S5000
G1 X78.064 Y75.457 E.00496
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
G1 X102.275 Y75.603 E.00592
; LINE_WIDTH: 0.412958
G1 X102.577 Y75.862 E.00513
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
M73 P80 R3
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
G1 X77.665 Y75.649 E.00481
; WIPE_START
G1 F12000
M204 S6000
G1 X78.064 Y75.457 E-.16807
G1 X78.413 Y75.405 E-.1341
G1 X79.617 Y75.405 E-.45783
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.352 Y81.392 Z6.76 F42000
G1 X102.196 Y103.954 Z6.76
G1 Z6.36
G1 E.8 F1800
; LINE_WIDTH: 0.408988
G1 F1713
M204 S5000
G1 X101.999 Y104.108 E.0032
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
G1 X101.833 Y75.83 E.00301
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
G1 X102.243 Y103.917 E.00055
; WIPE_START
G1 F12000
M204 S6000
G1 X101.999 Y104.108 E-.11796
G1 X101.58 Y104.202 E-.16289
G1 X100.32 Y104.202 E-.47915
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.168 Y98.57 Z6.76 F42000
G1 X79.492 Y81.431 Z6.76
G1 Z6.36
G1 E.8 F1800
; LINE_WIDTH: 0.392908
G1 F1713
M204 S5000
G1 X79.471 Y81.41 E.00036
G1 X79.38 Y81.137 E.00353
; LINE_WIDTH: 0.392368
G1 X79.407 Y80.863 E.00336
G1 X79.537 Y80.621 E.00336
; LINE_WIDTH: 0.396088
G1 X79.783 Y80.429 E.00385
G1 X80.186 Y80.381 E.00501
; LINE_WIDTH: 0.388608
G1 X80.476 Y80.505 E.00381
; LINE_WIDTH: 0.405288
G1 X80.695 Y80.764 E.0043
; LINE_WIDTH: 0.408268
G1 X80.761 Y81.031 E.0035
G1 X80.742 Y81.224 E.00248
; LINE_WIDTH: 0.397988
G1 X80.588 Y81.528 E.00423
; LINE_WIDTH: 0.398308
G1 X80.359 Y81.699 E.00354
G1 X80 Y81.751 E.00451
; LINE_WIDTH: 0.389388
G1 X79.726 Y81.666 E.00348
; LINE_WIDTH: 0.392908
G1 X79.534 Y81.473 E.00333
; WIPE_START
G1 F12000
M204 S6000
G1 X79.471 Y81.41 E-.03412
G1 X79.38 Y81.137 E-.10945
G1 X79.407 Y80.863 E-.10443
G1 X79.537 Y80.621 E-.10441
G1 X79.783 Y80.429 E-.1186
G1 X80.186 Y80.381 E-.15419
G1 X80.476 Y80.505 E-.11968
G1 X80.501 Y80.535 E-.01512
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
G1 X77.718 Y75.61 F42000
G1 Z6.44
G1 E.8 F1800
; LINE_WIDTH: 0.412818
G1 F1708
M204 S5000
G1 X78.064 Y75.457 E.00488
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
G1 X102.577 Y75.862 E.00514
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
M73 P81 R3
G1 X77.67 Y75.645 E.00489
; WIPE_START
G1 F12000
M204 S6000
G1 X78.064 Y75.457 E-.16582
G1 X78.412 Y75.405 E-.13393
G1 X79.623 Y75.405 E-.46025
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.355 Y81.394 Z6.84 F42000
G1 X102.187 Y103.962 Z6.84
G1 Z6.44
G1 E.8 F1800
; LINE_WIDTH: 0.407338
G1 F1708
M204 S5000
G1 X101.998 Y104.106 E.00302
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
M73 P81 R2
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
G1 X102.234 Y103.926 E.0007
; WIPE_START
G1 F12000
M204 S6000
G1 X101.998 Y104.106 E-.11298
G1 X101.668 Y104.2 E-.13018
G1 X100.308 Y104.201 E-.51685
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.156 Y98.57 Z6.84 F42000
G1 X79.534 Y81.497 Z6.84
G1 Z6.44
G1 E.8 F1800
; LINE_WIDTH: 0.389408
G1 F1708
M204 S5000
G1 X79.52 Y81.485 E.00022
G1 X79.402 Y81.237 E.00333
; LINE_WIDTH: 0.384928
G1 X79.39 Y80.941 E.00356
; LINE_WIDTH: 0.392908
G1 X79.53 Y80.634 E.00413
G1 X79.751 Y80.449 E.00354
; LINE_WIDTH: 0.392368
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398248
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398228
G1 X80.513 Y81.594 E.0045
; LINE_WIDTH: 0.389268
G1 X80.259 Y81.729 E.00348
; LINE_WIDTH: 0.385928
G1 X79.986 Y81.75 E.00329
G1 X79.727 Y81.664 E.00329
; LINE_WIDTH: 0.389408
G1 X79.579 Y81.536 E.00237
; WIPE_START
G1 F12000
M204 S6000
G1 X79.52 Y81.485 E-.02975
G1 X79.402 Y81.237 E-.10417
G1 X79.39 Y80.941 E-.11271
G1 X79.53 Y80.634 E-.12811
G1 X79.751 Y80.449 E-.10969
G1 X80.016 Y80.374 E-.10445
G1 X80.289 Y80.403 E-.10456
G1 X80.441 Y80.491 E-.06655
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
G1 X77.719 Y75.608 F42000
G1 Z6.52
G1 E.8 F1800
; LINE_WIDTH: 0.413578
G1 F1713
M204 S5000
G1 X77.998 Y75.476 E.00399
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
G1 X102.577 Y75.862 E.00514
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
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408208
G1 X77.671 Y75.643 E.00492
; WIPE_START
G1 F12000
M204 S6000
G1 X77.998 Y75.476 E-.13953
G1 X78.415 Y75.405 E-.16064
G1 X79.625 Y75.405 E-.45983
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.357 Y81.394 Z6.92 F42000
G1 X102.189 Y103.96 Z6.92
G1 Z6.52
G1 E.8 F1800
; LINE_WIDTH: 0.406168
G1 F1713
M204 S5000
G1 X101.998 Y104.107 E.00306
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
M73 P82 R2
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
G1 X101.833 Y75.83 E.00301
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
G1 X102.237 Y103.924 E.00065
; WIPE_START
G1 F12000
M204 S6000
G1 X101.998 Y104.107 E-.11451
G1 X101.668 Y104.198 E-.12977
G1 X100.311 Y104.201 E-.51573
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.158 Y98.57 Z6.92 F42000
G1 X79.535 Y81.5 Z6.92
G1 Z6.52
G1 E.8 F1800
; LINE_WIDTH: 0.392728
G1 F1713
M204 S5000
G1 X79.519 Y81.486 E.00026
G1 X79.399 Y81.238 E.00336
; LINE_WIDTH: 0.390868
G1 X79.386 Y80.964 E.00335
; LINE_WIDTH: 0.388228
G1 X79.479 Y80.706 E.00331
; LINE_WIDTH: 0.404508
G1 X79.723 Y80.464 E.00434
G1 X79.981 Y80.376 E.00344
; LINE_WIDTH: 0.402448
G1 X80.289 Y80.404 E.00388
; LINE_WIDTH: 0.398268
G1 X80.529 Y80.541 E.00343
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398388
G1 X80.766 Y81.03 E.00347
G1 X80.727 Y81.296 E.00334
; LINE_WIDTH: 0.397408
G1 X80.513 Y81.594 E.00454
; LINE_WIDTH: 0.389468
G1 X80.259 Y81.729 E.00349
; LINE_WIDTH: 0.385928
G1 X79.986 Y81.75 E.00329
G1 X79.727 Y81.664 E.00329
; LINE_WIDTH: 0.392728
G1 X79.58 Y81.539 E.00236
; WIPE_START
G1 F12000
M204 S6000
G1 X79.519 Y81.486 E-.03079
G1 X79.399 Y81.238 E-.10443
G1 X79.386 Y80.964 E-.10435
G1 X79.479 Y80.706 E-.10409
G1 X79.723 Y80.464 E-.13073
G1 X79.981 Y80.376 E-.10353
G1 X80.289 Y80.404 E-.11748
G1 X80.437 Y80.489 E-.0646
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
G1 X77.715 Y75.619 F42000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.403808
G1 F1709
M204 S5000
G1 X77.745 Y75.595 E.00049
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
G1 X102.577 Y75.861 E.00514
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
G1 X77.668 Y75.657 E.00344
; WIPE_START
G1 F12000
M204 S6000
G1 X77.745 Y75.595 E-.03758
G1 X78.129 Y75.438 E-.15772
G1 X78.41 Y75.405 E-.10735
G1 X79.614 Y75.405 E-.45735
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.35 Y81.39 Z7 F42000
G1 X102.202 Y103.95 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.408888
G1 F1709
M204 S5000
G1 X101.998 Y104.109 E.00331
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
M73 P83 R2
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
G1 X101.833 Y75.83 E.00301
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
G1 X102.249 Y103.913 E.00044
; WIPE_START
G1 F12000
M204 S6000
G1 X101.998 Y104.109 E-.12117
G1 X101.58 Y104.202 E-.16241
G1 X100.327 Y104.202 E-.47642
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.175 Y98.571 Z7 F42000
G1 X79.494 Y81.433 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.392888
G1 F1709
M204 S5000
G1 X79.471 Y81.41 E.00039
G1 X79.38 Y81.137 E.00353
; LINE_WIDTH: 0.392348
G1 X79.407 Y80.863 E.00336
G1 X79.537 Y80.621 E.00336
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00386
G1 X80.154 Y80.378 E.00462
; LINE_WIDTH: 0.389388
G1 X80.464 Y80.498 E.00403
; LINE_WIDTH: 0.398028
G1 X80.691 Y80.753 E.00423
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00358
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398228
G1 X80.583 Y81.536 E.00342
G1 X80.359 Y81.698 E.00343
G1 X80 Y81.751 E.00451
; LINE_WIDTH: 0.389388
G1 X79.726 Y81.666 E.00348
; LINE_WIDTH: 0.392888
G1 X79.536 Y81.475 E.0033
; WIPE_START
G1 F12000
M204 S6000
G1 X79.471 Y81.41 E-.03502
G1 X79.38 Y81.137 E-.1095
G1 X79.407 Y80.863 E-.10435
G1 X79.537 Y80.621 E-.10448
G1 X79.783 Y80.429 E-.11864
G1 X80.154 Y80.378 E-.14222
G1 X80.464 Y80.498 E-.12631
G1 X80.498 Y80.536 E-.0195
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
G1 X77.735 Y75.604 F42000
G1 Z6.68
G1 E.8 F1800
; LINE_WIDTH: 0.411758
G1 F1708
M204 S5000
G1 X78.117 Y75.441 E.00534
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
G1 X102.29 Y75.615 E.00503
G1 X102.536 Y75.818 E.00414
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
G1 X77.686 Y75.637 E.00439
; WIPE_START
G1 F12000
M204 S6000
G1 X78.117 Y75.441 E-.17985
G1 X78.41 Y75.405 E-.11237
G1 X79.641 Y75.405 E-.46778
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.372 Y81.395 Z7.08 F42000
G1 X102.193 Y103.957 Z7.08
G1 Z6.68
G1 E.8 F1800
; LINE_WIDTH: 0.406218
G1 F1708
M204 S5000
G1 X101.997 Y104.107 E.00313
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
G1 X101.941 Y75.869 E.00445
; LINE_WIDTH: 0.405618
G1 X102.26 Y76.087 E.00488
; LINE_WIDTH: 0.407658
M73 P84 R2
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
G1 X102.241 Y103.921 E.00058
; WIPE_START
G1 F12000
M204 S6000
G1 X101.997 Y104.107 E-.11658
G1 X101.669 Y104.199 E-.12961
G1 X100.316 Y104.201 E-.51381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.163 Y98.571 Z7.08 F42000
G1 X79.533 Y81.497 Z7.08
G1 Z6.68
G1 E.8 F1800
; LINE_WIDTH: 0.396268
G1 F1708
M204 S5000
G1 X79.526 Y81.492 E.00011
; LINE_WIDTH: 0.391268
G1 X79.402 Y81.237 E.00345
; LINE_WIDTH: 0.384988
G1 X79.388 Y80.964 E.00328
G1 X79.48 Y80.707 E.00327
G1 X79.685 Y80.491 E.00357
; LINE_WIDTH: 0.392908
G1 X80.001 Y80.377 E.00412
G1 X80.172 Y80.38 E.00209
; LINE_WIDTH: 0.387088
G1 X80.437 Y80.479 E.00342
; LINE_WIDTH: 0.388668
G1 X80.661 Y80.706 E.00386
; LINE_WIDTH: 0.405288
G1 X80.763 Y81.031 E.0043
G1 X80.752 Y81.166 E.00172
; LINE_WIDTH: 0.386248
G1 X80.644 Y81.448 E.00364
; LINE_WIDTH: 0.392588
G1 X80.396 Y81.675 E.00411
G1 X80.124 Y81.756 E.00347
; LINE_WIDTH: 0.396268
G1 X79.796 Y81.702 E.00412
G1 X79.58 Y81.534 E.00338
; WIPE_START
G1 F12000
M204 S6000
G1 X79.526 Y81.492 E-.02621
G1 X79.402 Y81.237 E-.10762
G1 X79.388 Y80.964 E-.10391
G1 X79.48 Y80.707 E-.10379
G1 X79.685 Y80.491 E-.11305
G1 X80.001 Y80.377 E-.12788
G1 X80.172 Y80.38 E-.06491
G1 X80.437 Y80.479 E-.10765
G1 X80.447 Y80.489 E-.00498
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
G1 X77.734 Y75.601 F42000
G1 Z6.76
G1 E.8 F1800
; LINE_WIDTH: 0.413408
G1 F1708
M204 S5000
G1 X77.986 Y75.48 E.00362
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
G1 X102.576 Y75.862 E.00518
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
G1 X77.683 Y75.632 E.00513
; WIPE_START
G1 F12000
M204 S6000
G1 X77.986 Y75.48 E-.12893
G1 X78.416 Y75.405 E-.16555
G1 X79.641 Y75.405 E-.46552
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.374 Y81.392 Z7.16 F42000
G1 X102.205 Y103.947 Z7.16
G1 Z6.76
G1 E.8 F1800
; LINE_WIDTH: 0.408648
G1 F1708
M204 S5000
G1 X101.997 Y104.109 E.00337
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
G1 X101.833 Y75.831 E.00302
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
G1 X102.253 Y103.91 E.00037
; WIPE_START
G1 F12000
M204 S6000
G1 X101.997 Y104.109 E-.12313
G1 X101.581 Y104.202 E-.16204
G1 X100.331 Y104.202 E-.47483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.176 Y98.573 Z7.16 F42000
G1 X79.54 Y81.5 Z7.16
G1 Z6.76
G1 E.8 F1800
; LINE_WIDTH: 0.389408
G1 F1708
M204 S5000
G1 X79.521 Y81.483 E.0003
; LINE_WIDTH: 0.384968
G1 X79.402 Y81.237 E.00328
G1 X79.388 Y80.964 E.00328
G1 X79.48 Y80.707 E.00328
M73 P85 R2
G1 X79.687 Y80.489 E.0036
; LINE_WIDTH: 0.392868
G1 X80.002 Y80.377 E.00409
; LINE_WIDTH: 0.399268
G1 X80.289 Y80.403 E.00359
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398408
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.0034
; LINE_WIDTH: 0.398288
G1 X80.582 Y81.537 E.00343
G1 X80.359 Y81.698 E.00342
G1 X80 Y81.751 E.00451
; LINE_WIDTH: 0.389408
G1 X79.726 Y81.666 E.00348
G1 X79.585 Y81.54 E.0023
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.03225
G1 X79.402 Y81.237 E-.1039
G1 X79.388 Y80.964 E-.10383
G1 X79.48 Y80.707 E-.10385
G1 X79.687 Y80.489 E-.11426
G1 X80.002 Y80.377 E-.12698
G1 X80.289 Y80.403 E-.10959
G1 X80.438 Y80.489 E-.06535
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
G1 X77.701 Y75.632 F42000
G1 Z6.84
G1 E.8 F1800
; LINE_WIDTH: 0.413058
G1 F1713
M204 S5000
G1 X77.944 Y75.496 E.0036
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
G1 X102.577 Y75.861 E.00517
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
G1 X77.649 Y75.662 E.00057
; WIPE_START
G1 F12000
M204 S6000
G1 X77.944 Y75.496 E-.12867
G1 X78.405 Y75.405 E-.17866
G1 X79.596 Y75.405 E-.45266
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.336 Y81.387 Z7.24 F42000
G1 X102.209 Y103.946 Z7.24
G1 Z6.84
G1 E.8 F1800
; LINE_WIDTH: 0.408778
G1 F1713
M204 S5000
G1 X101.997 Y104.109 E.00342
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
G1 X101.833 Y75.831 E.00301
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
G1 X102.257 Y103.909 E.00032
; WIPE_START
G1 F12000
M204 S6000
G1 X101.997 Y104.109 E-.12468
G1 X101.581 Y104.202 E-.16197
G1 X100.335 Y104.202 E-.47335
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.179 Y98.574 Z7.24 F42000
G1 X79.535 Y81.496 Z7.24
G1 Z6.84
G1 E.8 F1800
; LINE_WIDTH: 0.389428
G1 F1713
M204 S5000
G1 X79.522 Y81.483 E.00022
; LINE_WIDTH: 0.384988
G1 X79.395 Y81.213 E.00358
; LINE_WIDTH: 0.392928
G1 X79.405 Y80.878 E.00412
G1 X79.537 Y80.621 E.00354
; LINE_WIDTH: 0.392388
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399208
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398208
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398208
G1 X80.512 Y81.594 E.00451
; LINE_WIDTH: 0.389228
G1 X80.259 Y81.729 E.00348
; LINE_WIDTH: 0.385908
G1 X79.986 Y81.75 E.00329
; LINE_WIDTH: 0.389428
G1 X79.726 Y81.666 E.00332
G1 X79.58 Y81.536 E.00238
; WIPE_START
G1 F12000
M204 S6000
G1 X79.522 Y81.483 E-.02978
G1 X79.395 Y81.213 E-.11334
G1 X79.405 Y80.878 E-.1277
G1 X79.537 Y80.621 E-.1097
G1 X79.751 Y80.449 E-.10435
G1 X80.016 Y80.374 E-.10445
G1 X80.289 Y80.403 E-.10446
G1 X80.44 Y80.49 E-.06622
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
G1 X77.732 Y75.605 F42000
G1 Z6.92
G1 E.8 F1800
; LINE_WIDTH: 0.403898
G1 F1703
M204 S5000
G1 X77.745 Y75.595 E.00021
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
G1 X102.536 Y75.818 E.00414
; LINE_WIDTH: 0.407678
G1 X102.779 Y76.174 E.00549
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00621
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407678
M73 P86 R2
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
G1 X77.686 Y75.643 E.00372
; WIPE_START
G1 F12000
M204 S6000
G1 X77.745 Y75.595 E-.02906
G1 X78.119 Y75.441 E-.15365
G1 X78.41 Y75.405 E-.11154
G1 X79.636 Y75.405 E-.46575
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.371 Y81.391 Z7.32 F42000
G1 X102.209 Y103.944 Z7.32
G1 Z6.92
G1 E.8 F1800
; LINE_WIDTH: 0.408758
G1 F1703
M204 S5000
G1 X101.996 Y104.109 E.00344
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
G1 X101.942 Y75.869 E.00445
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
G1 X102.256 Y103.907 E.0003
; WIPE_START
G1 F12000
M204 S6000
G1 X101.996 Y104.109 E-.12513
G1 X101.58 Y104.202 E-.16195
G1 X100.336 Y104.202 E-.47293
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.18 Y98.574 Z7.32 F42000
G1 X79.536 Y81.496 Z7.32
G1 Z6.92
G1 E.8 F1800
; LINE_WIDTH: 0.384988
G1 F1703
M204 S5000
G1 X79.521 Y81.483 E.00024
G1 X79.394 Y81.211 E.0036
; LINE_WIDTH: 0.392868
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.392388
G1 X79.751 Y80.449 E.00336
G1 X80.015 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.526 Y80.539 E.0034
; LINE_WIDTH: 0.413248
G1 X80.691 Y80.766 E.00362
G1 X80.762 Y81.031 E.00354
; LINE_WIDTH: 0.406108
G1 X80.757 Y81.132 E.00128
; LINE_WIDTH: 0.385988
G1 X80.678 Y81.393 E.00328
G1 X80.502 Y81.603 E.00329
G1 X80.259 Y81.729 E.00329
; LINE_WIDTH: 0.389388
G1 X79.986 Y81.752 E.00332
G1 X79.727 Y81.663 E.00333
; LINE_WIDTH: 0.384988
G1 X79.581 Y81.536 E.00232
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.03034
G1 X79.394 Y81.211 E-.11415
G1 X79.405 Y80.877 E-.12689
G1 X79.537 Y80.621 E-.10955
G1 X79.751 Y80.449 E-.1044
G1 X80.015 Y80.374 E-.10439
G1 X80.289 Y80.403 E-.10459
G1 X80.439 Y80.489 E-.0657
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
G1 X77.759 Y75.599 F42000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.413108
G1 F1713
M204 S5000
G1 X77.906 Y75.506 E.00224
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
G1 X102.536 Y75.818 E.00414
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
G1 X93.59 Y104.595 E.02558
; LINE_WIDTH: 0.409348
G1 X91.59 Y104.595 E.02557
; LINE_WIDTH: 0.409128
G1 X89.59 Y104.595 E.02555
; LINE_WIDTH: 0.408918
M73 P87 R2
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
G1 X77.709 Y75.631 E.00237
; WIPE_START
G1 F12000
M204 S6000
G1 X77.906 Y75.506 E-.08877
G1 X78.405 Y75.405 E-.19356
G1 X79.662 Y75.405 E-.47767
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.395 Y81.393 Z7.4 F42000
G1 X102.215 Y103.94 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.408718
G1 F1713
M204 S5000
G1 X101.996 Y104.11 E.00354
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
G1 X101.942 Y75.869 E.00445
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
G1 X102.263 Y103.903 E.0002
; WIPE_START
G1 F12000
M204 S6000
G1 X101.996 Y104.11 E-.12815
G1 X101.581 Y104.202 E-.16174
G1 X100.343 Y104.202 E-.47012
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.188 Y98.574 Z7.4 F42000
G1 X79.489 Y81.437 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.388848
G1 F1713
M204 S5000
G1 X79.487 Y81.435 E.00003
; LINE_WIDTH: 0.398388
G1 X79.374 Y81.1 E.0044
G1 X79.452 Y80.754 E.0044
; LINE_WIDTH: 0.385648
G1 X79.688 Y80.489 E.00426
; LINE_WIDTH: 0.392928
G1 X80.002 Y80.377 E.00409
; LINE_WIDTH: 0.399288
G1 X80.289 Y80.403 E.00359
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398208
G1 X80.696 Y80.76 E.00342
; LINE_WIDTH: 0.398388
G1 X80.766 Y81.031 E.00347
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.389228
G1 X80.502 Y81.603 E.00348
; LINE_WIDTH: 0.385948
G1 X80.259 Y81.729 E.00329
; LINE_WIDTH: 0.389368
G1 X79.986 Y81.752 E.00332
G1 X79.727 Y81.663 E.00332
; LINE_WIDTH: 0.388848
G1 X79.533 Y81.478 E.00325
; WIPE_START
G1 F12000
M204 S6000
G1 X79.487 Y81.435 E-.02387
G1 X79.374 Y81.1 E-.13453
G1 X79.452 Y80.754 E-.13455
G1 X79.688 Y80.489 E-.13477
M73 P87 R1
G1 X80.002 Y80.377 E-.12691
G1 X80.289 Y80.403 E-.10952
G1 X80.508 Y80.529 E-.09586
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
G1 X77.785 Y75.58 F42000
G1 Z7.08
G1 E.8 F1800
; LINE_WIDTH: 0.412808
G1 F1713
M204 S5000
G1 X78.064 Y75.457 E.00393
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
G1 X102.536 Y75.818 E.00413
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
G1 X77.104 Y81.29 E.02554
; LINE_WIDTH: 0.408888
M73 P88 R1
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
G1 X77.73 Y75.604 E.00046
; WIPE_START
G1 F12000
M204 S6000
G1 X78.064 Y75.457 E-.13859
G1 X78.412 Y75.405 E-.13398
G1 X79.695 Y75.405 E-.48742
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.421 Y81.398 Z7.48 F42000
G1 X102.204 Y103.95 Z7.48
G1 Z7.08
G1 E.8 F1800
; LINE_WIDTH: 0.406368
G1 F1713
M204 S5000
G1 X101.995 Y104.108 E.00332
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
G1 X101.941 Y75.869 E.00445
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
G1 X102.251 Y103.913 E.00038
; WIPE_START
G1 F12000
M204 S6000
G1 X101.995 Y104.108 E-.1223
G1 X101.669 Y104.2 E-.1287
G1 X100.329 Y104.201 E-.509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.174 Y98.573 Z7.48 F42000
G1 X79.545 Y81.512 Z7.48
G1 Z7.08
G1 E.8 F1800
; LINE_WIDTH: 0.389208
G1 F1713
M204 S5000
G1 X79.542 Y81.51 E.00005
; LINE_WIDTH: 0.386828
G1 X79.397 Y81.213 E.00399
; LINE_WIDTH: 0.392628
G1 X79.405 Y80.872 E.00417
G1 X79.537 Y80.621 E.00347
; LINE_WIDTH: 0.396128
G1 X79.783 Y80.429 E.00386
G1 X80.154 Y80.378 E.00462
; LINE_WIDTH: 0.392928
G1 X80.488 Y80.515 E.00442
; LINE_WIDTH: 0.403988
G1 X80.695 Y80.764 E.00409
; LINE_WIDTH: 0.410828
G1 X80.76 Y81.031 E.00352
G1 X80.757 Y81.122 E.00117
; LINE_WIDTH: 0.388088
G1 X80.66 Y81.425 E.00385
; LINE_WIDTH: 0.384888
G1 X80.431 Y81.655 E.00389
; LINE_WIDTH: 0.395148
G1 X80.092 Y81.762 E.00438
G1 X79.77 Y81.686 E.00408
; LINE_WIDTH: 0.389208
G1 X79.593 Y81.549 E.00272
; WIPE_START
G1 F12000
M204 S6000
G1 X79.542 Y81.51 E-.02428
G1 X79.397 Y81.213 E-.12585
G1 X79.405 Y80.872 E-.12933
G1 X79.537 Y80.621 E-.10778
G1 X79.783 Y80.429 E-.11867
G1 X80.154 Y80.378 E-.14226
G1 X80.426 Y80.489 E-.11184
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
G1 X77.792 Y75.576 F42000
G1 Z7.16
G1 E.8 F1800
; LINE_WIDTH: 0.411308
G1 F1708
M204 S5000
G1 X78.129 Y75.438 E.00468
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
G1 X102.577 Y75.861 E.00519
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
G1 X77.738 Y75.601 E.00457
; WIPE_START
G1 F12000
M204 S6000
G1 X78.129 Y75.438 E-.16099
G1 X78.41 Y75.405 E-.10726
G1 X79.704 Y75.405 E-.49175
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.429 Y81.399 Z7.56 F42000
G1 X102.206 Y103.948 Z7.56
G1 Z7.16
G1 E.8 F1800
; LINE_WIDTH: 0.407368
G1 F1708
M204 S5000
G1 X101.995 Y104.108 E.00337
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
M73 P89 R1
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
G1 X102.392 Y76.274 E.00443
; LINE_WIDTH: 0.409368
G1 X102.501 Y76.646 E.00495
G1 X102.502 Y80.646 E.05113
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
G1 X102.462 Y103.554 E.00359
; LINE_WIDTH: 0.407368
G1 X102.275 Y103.896 E.00496
G1 X102.254 Y103.912 E.00034
; WIPE_START
G1 F12000
M204 S6000
G1 X101.995 Y104.108 E-.12346
G1 X101.669 Y104.2 E-.12859
G1 X100.332 Y104.201 E-.50794
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.176 Y98.573 Z7.56 F42000
G1 X79.604 Y81.575 Z7.56
G1 Z7.16
G1 E.8 F1800
; LINE_WIDTH: 0.399108
G1 F1708
M204 S5000
G1 X79.444 Y81.371 E.00323
G1 X79.375 Y81.07 E.00384
; LINE_WIDTH: 0.390928
G1 X79.48 Y80.705 E.00464
; LINE_WIDTH: 0.384888
G1 X79.709 Y80.475 E.00388
; LINE_WIDTH: 0.396588
G1 X80.055 Y80.367 E.00449
G1 X80.394 Y80.454 E.00433
; LINE_WIDTH: 0.385668
G1 X80.654 Y80.694 E.00425
; LINE_WIDTH: 0.398448
G1 X80.766 Y81.03 E.0044
G1 X80.697 Y81.359 E.00418
; LINE_WIDTH: 0.387928
G1 X80.494 Y81.611 E.00391
; LINE_WIDTH: 0.382968
G1 X80.199 Y81.744 E.00385
; LINE_WIDTH: 0.392928
G1 X79.865 Y81.725 E.0041
G1 X79.653 Y81.609 E.00297
; WIPE_START
G1 F12000
M204 S6000
G1 X79.444 Y81.371 E-.1203
G1 X79.375 Y81.07 E-.11712
G1 X79.48 Y80.705 E-.1447
G1 X79.709 Y80.475 E-.12312
G1 X80.055 Y80.367 E-.13784
G1 X80.353 Y80.444 E-.11692
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
G1 X77.798 Y75.574 F42000
G1 Z7.24
G1 E.8 F1800
; LINE_WIDTH: 0.410838
G1 F1713
M204 S5000
G1 X78.137 Y75.436 E.0047
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
G1 X102.577 Y75.861 E.0052
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
G1 X77.743 Y75.597 E.00464
; WIPE_START
G1 F12000
M204 S6000
G1 X78.137 Y75.436 E-.16187
G1 X78.41 Y75.405 E-.10418
G1 X79.71 Y75.405 E-.49396
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.434 Y81.399 Z7.64 F42000
G1 X102.207 Y103.947 Z7.64
G1 Z7.24
G1 E.8 F1800
; LINE_WIDTH: 0.406418
G1 F1713
M204 S5000
G1 X101.994 Y104.108 E.00339
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
M73 P90 R1
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
G1 X102.394 Y76.279 E.00449
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
G1 X102.255 Y103.911 E.00031
; WIPE_START
G1 F12000
M204 S6000
G1 X101.994 Y104.108 E-.12431
G1 X101.669 Y104.199 E-.12835
G1 X100.334 Y104.201 E-.50734
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.18 Y98.572 Z7.64 F42000
G1 X79.648 Y81.608 Z7.64
G1 Z7.24
G1 E.8 F1800
; LINE_WIDTH: 0.408248
G1 F1713
M204 S5000
G1 X79.48 Y81.426 E.00317
G1 X79.384 Y81.168 E.0035
; LINE_WIDTH: 0.414868
G1 X79.403 Y80.895 E.00355
G1 X79.517 Y80.646 E.00355
; LINE_WIDTH: 0.404008
G1 X79.783 Y80.439 E.00425
; LINE_WIDTH: 0.394548
G1 X80.176 Y80.384 E.00489
; LINE_WIDTH: 0.388888
G1 X80.464 Y80.498 E.00375
; LINE_WIDTH: 0.398008
G1 X80.69 Y80.752 E.00423
; LINE_WIDTH: 0.398408
G1 X80.766 Y81.03 E.00358
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.389188
G1 X80.502 Y81.603 E.00348
; LINE_WIDTH: 0.385968
G1 X80.259 Y81.729 E.00329
; LINE_WIDTH: 0.392868
G1 X79.986 Y81.754 E.00336
; LINE_WIDTH: 0.399268
G1 X79.694 Y81.644 E.00388
; WIPE_START
G1 F12000
M204 S6000
G1 X79.48 Y81.426 E-.11646
G1 X79.384 Y81.168 E-.10425
G1 X79.403 Y80.895 E-.10411
G1 X79.517 Y80.646 E-.10412
G1 X79.783 Y80.439 E-.12806
G1 X80.176 Y80.384 E-.15099
G1 X80.303 Y80.435 E-.05203
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
G1 X77.803 Y75.571 F42000
G1 Z7.32
G1 E.8 F1800
; LINE_WIDTH: 0.411318
G1 F1713
M204 S5000
G1 X78.129 Y75.438 E.00453
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
G1 X102.536 Y75.818 E.00414
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
G1 X77.747 Y75.594 E.00003
; WIPE_START
G1 F12000
M204 S6000
G1 X78.129 Y75.438 E-.15688
G1 X78.41 Y75.405 E-.10738
G1 X79.714 Y75.405 E-.49574
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.441 Y81.398 Z7.72 F42000
G1 X102.217 Y103.938 Z7.72
G1 Z7.32
G1 E.8 F1800
; LINE_WIDTH: 0.408578
G1 F1713
M204 S5000
G1 X101.994 Y104.11 E.0036
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
G1 X102.26 Y76.087 E.00488
; LINE_WIDTH: 0.407968
G1 X102.431 Y76.354 E.00405
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407678
G1 X102.504 Y103.3 E.33858
; LINE_WIDTH: 0.411978
G1 X102.451 Y103.585 E.00373
G1 X102.273 Y103.895 E.00459
; LINE_WIDTH: 0.408578
M73 P91 R1
G1 X102.265 Y103.901 E.00014
; WIPE_START
G1 F12000
M204 S6000
G1 X101.994 Y104.11 E-.12989
G1 X101.581 Y104.202 E-.1611
G1 X100.346 Y104.202 E-.46902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.193 Y98.572 Z7.72 F42000
G1 X79.675 Y81.619 Z7.72
G1 Z7.32
G1 E.8 F1800
; LINE_WIDTH: 0.389408
G1 F1713
M204 S5000
G1 X79.52 Y81.485 E.0025
G1 X79.394 Y81.211 E.00365
; LINE_WIDTH: 0.392908
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00352
; LINE_WIDTH: 0.392368
G1 X79.751 Y80.449 E.00336
G1 X80.015 Y80.374 E.00336
G1 X80.231 Y80.39 E.00264
; LINE_WIDTH: 0.398008
G1 X80.52 Y80.536 E.00402
; LINE_WIDTH: 0.398248
G1 X80.696 Y80.76 E.00354
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398248
G1 X80.583 Y81.536 E.00343
G1 X80.272 Y81.724 E.00451
; LINE_WIDTH: 0.389208
G1 X79.987 Y81.75 E.00348
; LINE_WIDTH: 0.385968
G1 X79.727 Y81.664 E.00329
; LINE_WIDTH: 0.389408
G1 X79.721 Y81.659 E.0001
; WIPE_START
G1 F12000
M204 S6000
G1 X79.52 Y81.485 E-.10095
G1 X79.394 Y81.211 E-.11444
G1 X79.405 Y80.877 E-.127
G1 X79.537 Y80.621 E-.10935
G1 X79.751 Y80.449 E-.10439
G1 X80.015 Y80.374 E-.10444
G1 X80.231 Y80.39 E-.08215
G1 X80.272 Y80.411 E-.01729
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
G1 X77.802 Y75.569 F42000
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.413488
G1 F1708
M204 S5000
G1 X77.992 Y75.478 E.00271
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
G1 X102.536 Y75.818 E.00414
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
G1 X77.748 Y75.595 E.00072
; WIPE_START
G1 F12000
M204 S6000
G1 X77.992 Y75.478 E-.10262
G1 X78.415 Y75.405 E-.16326
G1 X79.715 Y75.405 E-.49412
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.442 Y81.398 Z7.8 F42000
G1 X102.22 Y103.937 Z7.8
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.408208
G1 F1708
M204 S5000
G1 X101.99 Y104.112 E.00368
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
G1 X102.279 Y76.112 E.00533
G1 X102.458 Y76.428 E.00466
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00351
G1 X102.504 Y103.3 E.33858
; LINE_WIDTH: 0.411558
G1 X102.452 Y103.585 E.00372
G1 X102.274 Y103.897 E.00462
; LINE_WIDTH: 0.408208
G1 X102.268 Y103.901 E.00009
; WIPE_START
G1 F12000
M204 S6000
G1 X101.99 Y104.112 E-.13253
G1 X101.58 Y104.202 E-.15946
G1 X100.349 Y104.202 E-.46801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.196 Y98.572 Z7.8 F42000
G1 X79.692 Y81.632 Z7.8
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.384968
G1 F1708
M204 S5000
G1 X79.504 Y81.462 E.00303
; LINE_WIDTH: 0.392848
G1 X79.384 Y81.15 E.00409
G1 X79.407 Y80.863 E.00353
; LINE_WIDTH: 0.392348
G1 X79.537 Y80.621 E.00336
G1 X79.751 Y80.449 E.00336
G1 X80.015 Y80.374 E.00336
G1 X80.231 Y80.39 E.00264
; LINE_WIDTH: 0.398008
G1 X80.52 Y80.536 E.00402
; LINE_WIDTH: 0.398268
G1 X80.696 Y80.76 E.00354
; LINE_WIDTH: 0.398408
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398268
G1 X80.583 Y81.536 E.00342
G1 X80.272 Y81.724 E.00451
; LINE_WIDTH: 0.389388
G1 X79.987 Y81.752 E.00348
G1 X79.739 Y81.667 E.00318
; WIPE_START
G1 F12000
M204 S6000
G1 X79.504 Y81.462 E-.11856
G1 X79.384 Y81.15 E-.12696
G1 X79.407 Y80.863 E-.10947
G1 X79.537 Y80.621 E-.10429
G1 X79.751 Y80.449 E-.10438
G1 X80.015 Y80.374 E-.10454
G1 X80.231 Y80.39 E-.08215
G1 X80.254 Y80.402 E-.00965
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
G1 X77.812 Y75.567 F42000
G1 Z7.48
G1 E.8 F1800
; LINE_WIDTH: 0.411528
G1 F2083
M204 S5000
G1 X78.124 Y75.44 E.00433
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
M73 P92 R1
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
G1 X102.487 Y75.772 E.00327
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
G1 X77.104 Y85.241 E.23026
; LINE_WIDTH: 0.419998
G2 X77.104 Y83.759 I-48.132 J-.741 E.01947
; LINE_WIDTH: 0.408588
G1 X77.104 Y76.725 E.08974
G1 X77.141 Y76.414 E.00399
; LINE_WIDTH: 0.412638
G1 X77.278 Y76.068 E.00479
G1 X77.457 Y75.829 E.00385
; LINE_WIDTH: 0.404048
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.411528
G1 X77.757 Y75.59 E.00016
; WIPE_START
G1 F12000
M204 S6000
G1 X78.124 Y75.44 E-.15074
G1 X78.41 Y75.405 E-.10967
G1 X79.725 Y75.405 E-.49959
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.449 Y81.4 Z7.88 F42000
G1 X102.216 Y103.941 Z7.88
G1 Z7.48
G1 E.8 F1800
; LINE_WIDTH: 0.408568
G1 F2083
M204 S5000
G1 X101.994 Y104.111 E.00357
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
G1 F2083
G1 X80.393 Y104.086 E.00029
; LINE_WIDTH: 0.416628
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
G1 X77.496 Y85.241 E.23014
; LINE_WIDTH: 0.409558
G1 X77.512 Y85.224 E.00031
; LINE_WIDTH: 0.410538
G1 X77.529 Y85.207 E.00031
; LINE_WIDTH: 0.411518
G1 X77.546 Y85.19 E.00031
; LINE_WIDTH: 0.412498
G1 X77.563 Y85.172 E.00031
; LINE_WIDTH: 0.413478
G1 X77.58 Y85.155 E.00031
; LINE_WIDTH: 0.414458
G1 X77.596 Y85.138 E.00031
; LINE_WIDTH: 0.415438
G1 X77.613 Y85.121 E.00031
; LINE_WIDTH: 0.416408
G1 X77.63 Y85.103 E.00031
; LINE_WIDTH: 0.417388
G1 X77.647 Y85.086 E.00031
; LINE_WIDTH: 0.418368
G1 X77.664 Y85.069 E.00031
; LINE_WIDTH: 0.419348
G1 X77.68 Y85.051 E.00032
; LINE_WIDTH: 0.419998
G1 X77.7 Y85.04 E.0003
G1 X77.725 Y85.04 E.00033
G1 X77.75 Y85.04 E.00033
G1 X77.776 Y85.04 E.00033
G1 X77.801 Y85.04 E.00033
G1 F984.366
G1 X77.826 Y85.04 E.00033
G1 F877.942
G1 X77.851 Y85.04 E.00033
G1 F777.604
G1 X77.876 Y85.04 E.00033
G1 F683.39
G1 X77.9 Y85.04 E.00031
; FEATURE: Overhang wall
M106 S255
G1 F600
G1 X78.49 Y85.04 E.00775
G1 X78.49 Y83.96 E.01418
G1 X77.9 Y83.96 E.00775
M106 S201.45
; FEATURE: Outer wall
G1 F683.354
G1 X77.876 Y83.96 E.00031
G1 F777.566
G1 X77.851 Y83.96 E.00033
G1 F877.901
G1 X77.826 Y83.96 E.00033
G1 F984.322
G1 X77.801 Y83.96 E.00033
G1 F1096.785
G1 X77.776 Y83.96 E.00033
G1 F1215.377
G1 X77.75 Y83.96 E.00033
G1 F1340.057
G1 X77.725 Y83.96 E.00033
G1 F1470.823
G1 X77.7 Y83.96 E.00033
G1 F1588.551
G1 X77.68 Y83.951 E.00029
; LINE_WIDTH: 0.419528
G1 F1712.306
G1 X77.664 Y83.936 E.00029
; LINE_WIDTH: 0.418798
G1 F1840.656
G1 X77.647 Y83.922 E.00029
; LINE_WIDTH: 0.418078
G1 F1973.692
G1 X77.63 Y83.907 E.00029
; LINE_WIDTH: 0.417358
G1 F2083
G1 X77.614 Y83.893 E.00029
; LINE_WIDTH: 0.416628
G1 X77.597 Y83.879 E.00029
; LINE_WIDTH: 0.415908
G1 X77.58 Y83.864 E.00029
; LINE_WIDTH: 0.415178
G1 X77.564 Y83.85 E.00029
; LINE_WIDTH: 0.414458
G1 X77.547 Y83.836 E.00028
; LINE_WIDTH: 0.413738
G1 X77.531 Y83.821 E.00028
; LINE_WIDTH: 0.413008
G1 X77.514 Y83.807 E.00028
; LINE_WIDTH: 0.412288
G1 X77.497 Y83.793 E.00028
; LINE_WIDTH: 0.411558
G1 X77.496 Y83.759 E.00044
; LINE_WIDTH: 0.408588
G1 X77.496 Y83.359 E.0051
G1 X77.496 Y82.959 E.0051
G1 X77.496 Y76.725 E.07953
G1 X77.528 Y76.466 E.00332
; LINE_WIDTH: 0.408218
G1 X77.73 Y76.101 E.00532
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
G1 X102.26 Y76.087 E.00488
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
G1 F2083
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
G1 F2083
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
G1 X102.264 Y103.905 E.00012
; WIPE_START
G1 F12000
M204 S6000
G1 X101.994 Y104.111 E-.12903
G1 X101.58 Y104.202 E-.16103
G1 X100.343 Y104.202 E-.46994
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.58 Y99.198 Z7.88 F42000
G1 X77.651 Y84.5 Z7.88
G1 Z7.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.696598
M204 S6000
G1 X77.658 Y84.5 E.00014
; LINE_WIDTH: 0.697068
G1 X77.7 Y84.5 E.00094
; LINE_WIDTH: 0.697548
G1 X77.743 Y84.5 E.00094
; LINE_WIDTH: 0.698018
G1 X77.785 Y84.5 E.00095
; LINE_WIDTH: 0.698488
G1 X77.828 Y84.5 E.00095
; LINE_WIDTH: 0.698968
G1 X77.871 Y84.5 E.00095
; LINE_WIDTH: 0.699298
G1 X77.9 Y84.5 E.00065
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X77.95 Y84.5 E.00111
M106 S201.45
; WIPE_START
M204 S6000
G1 X77.9 Y84.5 E-.12713
G1 X77.871 Y84.5 E-.07488
G1 X77.828 Y84.5 E-.10832
G1 X77.785 Y84.5 E-.10832
G1 X77.743 Y84.5 E-.10832
G1 X77.7 Y84.5 E-.10829
G1 X77.658 Y84.5 E-.10832
G1 X77.651 Y84.5 E-.01643
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.88 I-1.199 J.205 P1  F42000
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
G3 Z7.88 I.306 J1.178 P1  F42000
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
G3 Z7.88 I1.217 J0 P1  F42000
G1 X102.347 Y79.5 Z7.88
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
G3 Z7.88 I-.113 J-1.212 P1  F42000
G1 X79.675 Y81.62 Z7.88
G1 Z7.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389368
G1 F2083
M204 S5000
G1 X79.521 Y81.483 E.00249
; LINE_WIDTH: 0.384948
G1 X79.394 Y81.211 E.0036
; LINE_WIDTH: 0.392908
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00386
G1 X80.135 Y80.377 E.00439
; LINE_WIDTH: 0.393588
G1 X80.413 Y80.467 E.00359
; LINE_WIDTH: 0.388928
G1 X80.653 Y80.695 E.00402
; LINE_WIDTH: 0.398408
G1 X80.766 Y81.03 E.00439
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.389208
G1 X80.502 Y81.603 E.00348
; LINE_WIDTH: 0.385988
G1 X80.259 Y81.729 E.00329
G1 X79.987 Y81.75 E.00329
; LINE_WIDTH: 0.389368
G1 X79.726 Y81.666 E.00332
G1 X79.72 Y81.66 E.00011
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.10081
G1 X79.394 Y81.211 E-.1142
G1 X79.405 Y80.877 E-.12701
G1 X79.537 Y80.621 E-.10938
G1 X79.783 Y80.429 E-.11863
G1 X80.135 Y80.377 E-.13514
G1 X80.272 Y80.421 E-.05482
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
; LINE_WIDTH: 0.419998
G1 F1845
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
M73 P93 R1
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
; LINE_WIDTH: 0.410108
G1 X77.498 Y99.29 E.02562
; LINE_WIDTH: 0.409918
G1 X77.497 Y97.29 E.0256
; LINE_WIDTH: 0.409728
G1 X77.497 Y95.29 E.02559
; LINE_WIDTH: 0.409538
G1 X77.497 Y93.29 E.02558
; LINE_WIDTH: 0.409348
G1 X77.497 Y91.29 E.02557
; LINE_WIDTH: 0.409158
G1 X77.496 Y89.29 E.02555
; LINE_WIDTH: 0.408968
G1 X77.496 Y87.29 E.02554
; LINE_WIDTH: 0.408778
G1 X77.496 Y85.29 E.02553
; LINE_WIDTH: 0.408588
G1 X77.496 Y85.241 E.00062
; LINE_WIDTH: 0.419998
G1 X77.691 Y85.04 E.00369
G1 X78.49 Y85.04 E.01049
G1 X78.49 Y83.96 E.01418
G1 X77.691 Y83.96 E.01049
G1 X77.497 Y83.793 E.00337
; LINE_WIDTH: 0.411558
G1 X77.496 Y83.759 E.00044
; LINE_WIDTH: 0.408588
G1 X77.496 Y76.724 E.08975
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
G3 Z7.96 I.222 J-1.197 P1  F42000
G1 X77.817 Y75.566 Z7.96
G1 Z7.56
G1 E.8 F1800
; LINE_WIDTH: 0.411008
G1 F1845
M204 S5000
G1 X78.135 Y75.437 E.00439
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
G1 X102.513 Y75.797 E.00371
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
; LINE_WIDTH: 0.410108
G1 X77.105 Y99.295 E.02562
; LINE_WIDTH: 0.409918
G1 X77.105 Y97.295 E.0256
; LINE_WIDTH: 0.409728
G1 X77.105 Y95.295 E.02559
; LINE_WIDTH: 0.409538
G1 X77.105 Y93.295 E.02558
; LINE_WIDTH: 0.409348
G1 X77.105 Y91.295 E.02557
; LINE_WIDTH: 0.409158
G1 X77.104 Y89.295 E.02555
; LINE_WIDTH: 0.408968
G1 X77.104 Y87.295 E.02554
; LINE_WIDTH: 0.408778
G1 X77.104 Y85.295 E.02553
; LINE_WIDTH: 0.408588
G1 X77.104 Y85.241 E.00068
; LINE_WIDTH: 0.419998
G2 X77.104 Y83.759 I-48.137 J-.741 E.01947
; LINE_WIDTH: 0.408588
G1 X77.104 Y76.724 E.08975
G1 X77.141 Y76.414 E.00399
; LINE_WIDTH: 0.412628
G1 X77.279 Y76.068 E.0048
G1 X77.457 Y75.829 E.00384
; LINE_WIDTH: 0.404078
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.411008
G1 X77.762 Y75.588 E.00023
; WIPE_START
G1 F12000
M204 S6000
G1 X78.135 Y75.437 E-.15285
G1 X78.41 Y75.405 E-.10522
G1 X79.731 Y75.405 E-.50193
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.238 Y76.782 Z7.96 F42000
G1 X102.05 Y79.5 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.696368
G1 F1845
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
G1 F1845
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
G1 F1845
M204 S6000
G1 X81 Y103.55 E.01101
; WIPE_START
G1 F13250.883
G1 X81 Y104.047 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I1.215 J-.072 P1  F42000
G1 X79.672 Y81.615 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F1845
M204 S5000
G1 X79.521 Y81.483 E.0024
G1 X79.402 Y81.237 E.00328
G1 X79.388 Y80.964 E.00328
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.396148
G1 X79.783 Y80.429 E.00475
G1 X80.154 Y80.378 E.00463
; LINE_WIDTH: 0.389408
G1 X80.464 Y80.498 E.00403
; LINE_WIDTH: 0.398028
G1 X80.691 Y80.753 E.00423
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00358
G1 X80.726 Y81.3 E.00339
; LINE_WIDTH: 0.398288
G1 X80.582 Y81.537 E.00343
G1 X80.272 Y81.724 E.00451
; LINE_WIDTH: 0.389388
G1 X79.986 Y81.752 E.00348
G1 X79.727 Y81.664 E.00332
; LINE_WIDTH: 0.384968
G1 X79.717 Y81.655 E.00016
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.09895
G1 X79.402 Y81.237 E-.10384
G1 X79.388 Y80.964 E-.10398
G1 X79.494 Y80.683 E-.11412
G1 X79.783 Y80.429 E-.14625
G1 X80.154 Y80.378 E-.14239
G1 X80.278 Y80.426 E-.05046
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
M73 P93 R0
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1786
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
M73 P94 R0
G1 X81.741 Y104.204 E.02331
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
G1 X78.102 Y104.151 E.00386
G1 X77.798 Y103.967 E.00453
; LINE_WIDTH: 0.406538
G1 X77.569 Y103.645 E.00501
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.281 E.00475
G1 X77.496 Y85.241 E.23015
; LINE_WIDTH: 0.419998
G1 X77.691 Y85.04 E.00369
G1 X78.49 Y85.04 E.01049
G1 X78.49 Y83.96 E.01418
G1 X77.691 Y83.96 E.01049
G1 X77.497 Y83.793 E.00337
; LINE_WIDTH: 0.411558
G1 X77.496 Y83.759 E.00044
; LINE_WIDTH: 0.408588
G1 X77.496 Y76.724 E.08975
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
G3 Z8.04 I.222 J-1.197 P1  F42000
G1 X77.822 Y75.564 Z8.04
G1 Z7.64
G1 E.8 F1800
; LINE_WIDTH: 0.411298
G1 F1786
M204 S5000
G1 X78.13 Y75.438 E.00427
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
G1 X102.536 Y75.818 E.00414
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
G1 X77.104 Y85.241 E.23027
; LINE_WIDTH: 0.419998
G2 X77.104 Y83.759 I-48.132 J-.741 E.01947
; LINE_WIDTH: 0.408588
G1 X77.104 Y76.724 E.08975
G1 X77.141 Y76.414 E.00398
; LINE_WIDTH: 0.412638
G1 X77.279 Y76.067 E.00482
G1 X77.457 Y75.829 E.00383
; LINE_WIDTH: 0.404308
G1 X77.744 Y75.596 E.00467
; LINE_WIDTH: 0.411298
G1 X77.767 Y75.587 E.00031
; WIPE_START
G1 F12000
M204 S6000
G1 X78.13 Y75.438 E-.149
G1 X78.41 Y75.405 E-.10723
G1 X79.736 Y75.405 E-.50378
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.243 Y76.783 Z8.04 F42000
G1 X102.05 Y79.5 Z8.04
G1 Z7.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.696368
G1 F1786
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
G1 F1786
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
G1 F1786
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
G1 X77.827 Y75.562 F42000
G1 Z7.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.411298
G1 F1811
M204 S5000
G1 X78.129 Y75.438 E.0042
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
G1 X102.576 Y75.861 E.00488
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
M73 P95 R0
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
G1 X77.104 Y85.241 E.2303
; LINE_WIDTH: 0.419998
G2 X77.104 Y83.759 I-48.132 J-.741 E.01947
; LINE_WIDTH: 0.408588
G1 X77.104 Y76.724 E.08975
G1 X77.141 Y76.414 E.00398
; LINE_WIDTH: 0.412578
G1 X77.281 Y76.063 E.00487
G1 X77.457 Y75.828 E.00379
; LINE_WIDTH: 0.404248
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.411298
G1 X77.771 Y75.584 E.00036
; WIPE_START
G1 F12000
M204 S6000
G1 X78.129 Y75.438 E-.14709
G1 X78.41 Y75.405 E-.10725
G1 X79.74 Y75.405 E-.50567
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.273 Y76.635 Z8.12 F42000
G1 X101.51 Y78.96 Z8.12
G1 Z7.72
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1811
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
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.285 E.00371
G1 X77.496 Y85.241 E.23021
; LINE_WIDTH: 0.419998
G1 X77.691 Y85.04 E.00369
G1 X78.49 Y85.04 E.01049
G1 X78.49 Y83.96 E.01418
G1 X77.691 Y83.96 E.01049
G1 X77.497 Y83.793 E.00337
; LINE_WIDTH: 0.411558
G1 X77.496 Y83.759 E.00044
; LINE_WIDTH: 0.408588
G1 X77.499 Y76.671 E.09042
; LINE_WIDTH: 0.405698
G1 X77.552 Y76.403 E.00346
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
G3 Z8.12 I-.214 J-1.198 P1  F42000
G1 X77.95 Y84.5 Z8.12
G1 Z7.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.696528
G1 F1811
M204 S6000
G1 X77.651 Y84.5 E.00662
; WIPE_START
G1 F13247.763
G1 X77.95 Y84.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.127 Y92.041 Z8.12 F42000
G1 X81 Y104.049 Z8.12
G1 Z7.72
G1 E.8 F1800
G1 F1811
M204 S6000
G1 X81 Y103.55 E.01105
; WIPE_START
G1 F13247.763
G1 X81 Y104.049 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I.31 J1.177 P1  F42000
G1 X102.05 Y98.5 Z8.12
G1 Z7.72
G1 E.8 F1800
; LINE_WIDTH: 0.696488
G1 F1811
M204 S6000
G1 X102.349 Y98.5 E.00661
; WIPE_START
G1 F13248.543
G1 X102.05 Y98.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.05 Y90.868 Z8.12 F42000
G1 X102.05 Y79.5 Z8.12
G1 Z7.72
G1 E.8 F1800
; LINE_WIDTH: 0.696368
G1 F1811
M204 S6000
G1 X102.347 Y79.5 E.00658
; WIPE_START
G1 F13250.883
G1 X102.05 Y79.5 E-.76
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
G1 X77.831 Y75.56 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.411298
G1 F1656
M204 S5000
G1 X78.129 Y75.438 E.00414
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
G1 X102.536 Y75.818 E.0052
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
G1 X77.776 Y75.582 E.00042
; WIPE_START
G1 F12000
M204 S6000
G1 X78.129 Y75.438 E-.14518
G1 X78.41 Y75.405 E-.10726
G1 X79.745 Y75.405 E-.50757
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.427 Y81.433 Z8.2 F42000
G1 X102.025 Y104.092 Z8.2
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.404868
G1 F1656
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
G1 X101.991 Y104.112 F42000
G1 Z7.88
G1 E.8 F1800
; LINE_WIDTH: 0.408338
G1 F1200
M204 S5000
G1 X102.271 Y103.9 E.00449
; LINE_WIDTH: 0.407368
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
G1 X101.933 Y104.127 E.00375
; WIPE_START
G1 F12000
M204 S6000
G1 X102.271 Y103.9 E-.15498
G1 X102.462 Y103.56 E-.148
G1 X102.504 Y103.271 E-.11112
G1 X102.504 Y102.36 E-.34591
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.899 Y103.003 Z8.28 F42000
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
G1 X78.772 Y96.97 Z8.28 F42000
G1 X77.881 Y75.982 Z8.28
G1 Z7.88
G1 E.8 F1800
; LINE_WIDTH: 0.408078
G1 F1200
M204 S5000
G1 X77.791 Y76.036 E.00134
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
G1 X80.696 Y75.796 E.0025
G1 X80.5 Y75.796 E.0025
; LINE_WIDTH: 0.408978
G1 X78.419 Y75.796 E.02657
G1 X78.087 Y75.857 E.00431
; LINE_WIDTH: 0.408078
G1 X77.932 Y75.951 E.0023
; WIPE_START
G1 F12000
M204 S6000
G1 X77.791 Y76.036 E-.06287
G1 X77.585 Y76.321 E-.13368
G1 X77.496 Y76.724 E-.15683
G1 X77.496 Y77.794 E-.40662
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.119 Y78.16 Z8.28 F42000
G1 X102.504 Y78.996 Z8.28
G1 Z7.88
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
M73 P97 R0
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
G1 X78.77 Y96.97 Z8.36 F42000
G1 X77.871 Y75.992 Z8.36
G1 Z7.96
G1 E.8 F1800
; LINE_WIDTH: 0.411218
G1 F1200
M204 S5000
G1 X77.755 Y76.075 E.00184
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
G1 X80.696 Y75.796 E.0025
G1 X80.5 Y75.796 E.0025
; LINE_WIDTH: 0.408978
G1 X78.424 Y75.796 E.02651
G1 X78.015 Y75.889 E.00536
; LINE_WIDTH: 0.411218
G1 X77.92 Y75.957 E.0015
; WIPE_START
G1 F12000
M204 S6000
G1 X77.755 Y76.075 E-.07713
G1 X77.551 Y76.403 E-.14671
G1 X77.496 Y76.725 E-.12403
G1 X77.496 Y77.809 E-.41213
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.12 Y78.171 Z8.36 F42000
G1 X102.504 Y78.996 Z8.36
G1 Z7.96
G1 E.8 F1800
; LINE_WIDTH: 0.408738
G1 F1200
M204 S5000
G1 X102.504 Y78.8 E.0025
; LINE_WIDTH: 0.409328
G1 X102.501 Y76.666 E.02728
G1 X102.41 Y76.31 E.00469
; LINE_WIDTH: 0.404228
G1 X102.199 Y76.03 E.00443
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
G1 X102.27 Y103.899 F42000
G1 Z8.04
G1 E.8 F1800
; LINE_WIDTH: 0.403008
G1 F1200
M204 S5000
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
G1 X101.991 Y104.112 E.00452
; LINE_WIDTH: 0.408278
G1 X102.223 Y103.935 E.00372
; WIPE_START
G1 F12000
M204 S6000
G1 X102.435 Y103.634 E-.1401
G1 X102.504 Y103.271 E-.14042
G1 X102.504 Y102.009 E-.47949
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.91 Y102.773 Z8.44 F42000
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
G1 X78.774 Y96.969 Z8.44 F42000
G1 X77.888 Y75.979 Z8.44
G1 Z8.04
G1 E.8 F1800
; LINE_WIDTH: 0.404548
G1 F1200
M204 S5000
G1 X77.792 Y76.038 E.00142
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
G1 X80.696 Y75.796 E.0025
G1 X80.5 Y75.796 E.0025
; LINE_WIDTH: 0.408978
G1 X78.419 Y75.796 E.02657
G1 X78.087 Y75.857 E.00432
; LINE_WIDTH: 0.404548
G1 X77.939 Y75.948 E.00218
; WIPE_START
G1 F12000
M204 S6000
G1 X77.792 Y76.038 E-.06565
G1 X77.584 Y76.321 E-.13344
G1 X77.496 Y76.724 E-.15691
G1 X77.496 Y77.788 E-.404
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.097 Y77.093 Z8.44 F42000
G1 X99.304 Y75.796 Z8.44
G1 Z8.04
G1 E.8 F1800
; LINE_WIDTH: 0.408488
G1 F1200
M204 S5000
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
G1 X102.199 Y76.03 E.00443
; LINE_WIDTH: 0.410908
G1 X101.88 Y75.847 E.00472
G1 X101.633 Y75.797 E.00323
; LINE_WIDTH: 0.408488
G1 X99.364 Y75.796 E.02894
; WIPE_START
G1 F12000
M204 S6000
G1 X99.304 Y75.404 E-.15048
G1 X100.908 Y75.405 E-.60952
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
M73 P98 R0
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
G1 X78.775 Y96.97 Z8.52 F42000
G1 X77.89 Y75.978 Z8.52
G1 Z8.12
G1 E.8 F1800
; LINE_WIDTH: 0.404588
G1 F1200
M204 S5000
G1 X77.791 Y76.038 E.00145
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
G1 X80.696 Y75.796 E.0025
G1 X80.5 Y75.796 E.0025
; LINE_WIDTH: 0.408978
G1 X78.419 Y75.796 E.02657
G1 X78.087 Y75.857 E.00431
; LINE_WIDTH: 0.404588
G1 X77.941 Y75.947 E.00216
; WIPE_START
G1 F12000
M204 S6000
G1 X77.791 Y76.038 E-.06648
G1 X77.583 Y76.32 E-.13338
G1 X77.496 Y76.725 E-.15723
G1 X77.496 Y77.785 E-.40292
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.097 Y77.092 Z8.52 F42000
G1 X99.304 Y75.796 Z8.52
G1 Z8.12
G1 E.8 F1800
; LINE_WIDTH: 0.408488
G1 F1200
M204 S5000
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
G1 X102.199 Y76.03 E.00443
; LINE_WIDTH: 0.404378
G1 X101.934 Y75.864 E.00394
; LINE_WIDTH: 0.408098
G1 X101.634 Y75.797 E.00392
; LINE_WIDTH: 0.408488
G1 X99.364 Y75.796 E.02895
; WIPE_START
G1 F12000
M204 S6000
G1 X99.304 Y75.404 E-.15048
G1 X100.908 Y75.405 E-.60952
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


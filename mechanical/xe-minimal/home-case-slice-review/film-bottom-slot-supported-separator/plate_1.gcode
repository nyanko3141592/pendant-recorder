; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 2m 9s; total estimated time: 2m 28s
; total layer number: 10
; total filament length [mm] : 124.53
; total filament volume [cm^3] : 299.54
; total filament weight [g] : 0.37
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 1.42
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
; enable_support = 1
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
; support_on_build_plate_only = 1
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.16
; support_type = normal(auto)
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
M73 P0 R2
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
M73 P1 R2
G1 X10.4 Y20 Z0.28 F1500.0 E30 ;Draw the second line
G92 E0 ;Reset Extruder 
M73 P6 R2
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
; layer num/total_layer_count: 1/10
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
M73 P10 R2
G1 X85.672 Y73.84 F42000
M204 S6000
M73 P12 R2
G1 Z.4
G1 Z.14
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X85.672 Y75.427 E.04253
G1 X86.194 Y75.427 E.014
G1 X86.194 Y74.052 E.03687
G1 X86.716 Y74.052 E.014
G1 X86.716 Y75.427 E.03687
M73 P13 R2
G1 X87.239 Y75.427 E.014
G1 X87.239 Y74.052 E.03687
G1 X87.761 Y74.052 E.014
G1 X87.761 Y75.427 E.03687
G1 X88.283 Y75.427 E.014
G1 X88.283 Y74.052 E.03687
G1 X88.805 Y74.052 E.014
G1 X88.805 Y75.427 E.03687
G1 X89.327 Y75.427 E.014
G1 X89.327 Y74.052 E.03687
G1 X89.849 Y74.052 E.014
G1 X89.849 Y75.427 E.03687
G1 X90.372 Y75.427 E.014
G1 X90.372 Y74.052 E.03687
G1 X90.894 Y74.052 E.014
G1 X90.894 Y75.639 E.04253
M204 S6000
G1 X91.792 Y75.78 F42000
G1 F3000
M204 S500
G1 X91.792 Y73.629 E.05765
G1 X85.021 Y73.629 E.18152
G1 X85.021 Y75.85 E.05954
G1 X91.792 Y75.85 E.18152
; WIPE_START
G1 X89.792 Y75.85 E-.76
; WIPE_END
M73 P14 R2
G1 E-.04 F1800
M204 S6000
G1 X85.672 Y80.111 Z.54 F42000
G1 Z.14
G1 E.8 F1800
G1 F3000
M204 S500
G1 X85.672 Y79.182 E.02489
G1 X86.194 Y78.905 E.01585
G1 X86.194 Y80.642 E.04658
G1 X86.716 Y81.624 E.02982
G1 X86.716 Y78.627 E.08035
G1 X87.239 Y78.349 E.01585
G1 X87.239 Y82.606 E.11412
G1 X87.761 Y83.588 E.02982
G1 X87.761 Y78.072 E.14789
G1 X88.082 Y77.901 E.00976
G1 X88.283 Y78.278 E.01146
G1 X88.283 Y84.57 E.16868
G1 X88.805 Y85.553 E.02982
G1 X88.805 Y79.26 E.16868
G1 X89.327 Y80.242 E.02982
G1 X89.327 Y86.535 E.16868
M73 P15 R2
G1 X89.849 Y87.517 E.02982
G1 X89.849 Y81.224 E.16868
G1 X90.372 Y82.206 E.02982
G1 X90.372 Y88.499 E.16868
G1 X90.894 Y89.481 E.02982
G1 X90.894 Y83.188 E.16868
G1 X91.369 Y84.083 E.02715
G1 X91.416 Y90.463 E.17104
G1 X91.938 Y91.445 E.02982
G1 X91.938 Y85.595 E.15683
G1 X92.173 Y85.595 E.0063
G1 X92.46 Y86.135 E.01639
M73 P16 R2
G1 X92.46 Y92.427 E.16868
G1 X92.982 Y93.409 E.02982
G1 X92.982 Y87.117 E.16868
G1 X93.505 Y88.099 E.02982
G1 X93.512 Y94.406 E.16907
G1 X94.027 Y94.406 E.01379
G1 X94.027 Y89.081 E.14274
G1 X94.549 Y90.063 E.02982
G1 X94.549 Y96.355 E.16868
G1 X95.071 Y97.337 E.02982
G1 X95.071 Y91.045 E.16868
G1 X95.593 Y91.206 E.01465
G1 X95.593 Y97.791 E.17652
G1 X96.115 Y97.791 E.014
M73 P17 R2
G1 X96.115 Y91.071 E.18014
G1 X96.638 Y90.793 E.01585
G1 X96.638 Y97.791 E.18758
G1 X97.16 Y97.791 E.014
G1 X97.16 Y88.48 E.24959
G1 X97.682 Y88.48 E.014
G1 X97.682 Y94.905 E.17224
G1 X98.204 Y94.905 E.014
G1 X98.204 Y88.48 E.17224
G1 X98.726 Y88.48 E.014
G1 X98.726 Y94.905 E.17224
G1 X99.248 Y94.905 E.014
M73 P18 R2
G1 X99.248 Y88.48 E.17224
G1 X99.771 Y88.48 E.014
G1 X99.771 Y95.117 E.17791
M204 S6000
G1 X96.638 Y86.74 F42000
G1 F3000
M204 S500
G1 X96.638 Y85.595 E.03071
G1 X96.115 Y85.595 E.014
G1 X96.115 Y86.639 E.02799
; WIPE_START
G1 X96.115 Y85.595 E-.39673
G1 X96.638 Y85.595 E-.19842
G1 X96.638 Y86.028 E-.16484
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X91.792 Y83.977 Z.54 F42000
G1 Z.14
G1 E.8 F1800
G1 F3000
M204 S500
G1 X91.792 Y85.172 E.03202
G1 X92.427 Y85.172 E.01702
G1 X95.363 Y90.693 E.16765
G1 X95.72 Y90.802 E.00999
G1 X96.579 Y90.346 E.02608
G1 X96.712 Y89.886 E.01282
M73 P19 R2
G1 X96.712 Y87.114 E.07433
G1 X96.449 Y86.85 E.00999
G1 X95.512 Y86.85 E.0251
G1 X95.512 Y85.172 E.04499
G1 X97.563 Y85.172 E.05499
G1 X97.563 Y88.057 E.07736
G1 X100.449 Y88.057 E.07736
G1 X100.449 Y94.828 E.18152
M73 P19 R1
G1 X100.063 Y94.828 E.01034
G1 X100.063 Y95.328 E.0134
G1 X98.063 Y95.328 E.05361
G1 X98.063 Y98.214 E.07735
G1 X95.178 Y98.214 E.07735
G1 X95.178 Y98.439 E.00603
G1 X93.678 Y95.618 E.08564
G1 X93.678 Y94.828 E.02117
G1 X93.258 Y94.828 E.01125
G1 X84.902 Y79.113 E.47714
G1 X88.257 Y77.329 E.10187
M73 P20 R1
G1 X91.759 Y83.915 E.19996
; WIPE_START
G1 X90.82 Y82.149 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X93.397 Y89.333 Z.54 F42000
G1 X96.742 Y98.657 Z.54
G1 Z.14
G1 E.8 F1800
; FEATURE: Support transition
; LINE_WIDTH: 0.42
G1 F3000
M204 S500
G1 X96.049 Y98.657 E.01541
G1 X96.049 Y104.428 E.12838
G1 X95.621 Y104.428 E.00953
G1 X95.62 Y98.657 E.12838
G1 X95.856 Y98.657 E.00524
; WIPE_START
G1 X95.62 Y98.657 E-.08957
M73 P21 R1
G1 X95.62 Y100.421 E-.67043
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X95.148 Y101.695 Z.54 F42000
G1 Z.14
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X93.417 Y101.695 E.04639
G1 X93.417 Y103.195 E.04021
G1 X93.949 Y103.195 E.01424
G1 X94.212 Y103.485 E.01051
G1 X95.178 Y103.485 E.02588
G1 X95.178 Y101.736 E.04691
M204 S6000
G1 X94.549 Y103.274 F42000
G1 F3000
M204 S500
G1 X94.549 Y102.118 E.03099
G1 X94.027 Y102.118 E.014
G1 X94.027 Y102.984 E.0232
M204 S6000
G1 X98.013 Y104.428 F42000
; FEATURE: Support transition
; LINE_WIDTH: 0.42
G1 F3000
M204 S500
G1 X98.507 Y104.428 E.01097
G1 X98.507 Y102.224 E.04904
G1 X97.82 Y102.589 E.01729
G1 X97.82 Y104.428 E.04093
G1 X96.935 Y104.428 E.0197
G1 X96.935 Y102.732 E.03774
G1 X96.497 Y101.97 E.01954
G1 X96.629 Y101.54 E.01
G1 X96.935 Y101.377 E.00771
G1 X96.935 Y98.657 E.06051
G1 X97.82 Y98.657 E.0197
G1 X97.82 Y100.906 E.05004
M73 P22 R1
G1 X98.706 Y100.435 E.02231
G1 X98.706 Y95.771 E.10375
G1 X99.592 Y95.771 E.0197
G1 X99.592 Y99.964 E.09327
G1 X100.293 Y99.592 E.01766
G1 X100.477 Y99.648 E.0043
G1 X100.477 Y95.771 E.08624
G1 X101.363 Y95.771 E.0197
G1 X101.363 Y101.543 E.12838
G1 X100.477 Y101.543 E.0197
G1 X100.477 Y101.176 E.00816
G1 X99.787 Y101.543 E.01739
G1 X100.284 Y101.543 E.01106
; WIPE_START
G1 X99.787 Y101.543 E-.189
G1 X100.477 Y101.176 E-.29705
G1 X100.477 Y101.543 E-.13946
G1 X100.831 Y101.543 E-.13449
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X97.719 Y94.574 Z.54 F42000
G1 X92.299 Y82.438 Z.54
G1 Z.14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
M73 P23 R1
G1 F3000
M204 S500
G1 X89.418 Y77.02 E.16449
G1 X94.342 Y77.02 E.132
G1 X94.342 Y83.02 E.16084
G1 X95.542 Y83.02 E.03217
G1 X95.542 Y83.98 E.02574
G1 X94.342 Y83.98 E.03217
G1 X94.342 Y85.826 E.04948
G1 X94.128 Y85.879 E.00591
G1 X92.327 Y82.491 E.10287
; WIPE_START
G1 X91.388 Y80.725 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X94.711 Y87.596 Z.54 F42000
G1 X95.608 Y89.45 Z.54
G1 Z.14
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X95.865 Y89.933 E.01465
G1 X95.776 Y89.979 E.00268
G1 X88.636 Y76.55 E.40773
G1 X94.812 Y76.55 E.16556
G1 X94.812 Y82.55 E.16084
M73 P24 R1
G1 X96.012 Y82.55 E.03217
G1 X96.012 Y84.45 E.05093
G1 X94.812 Y84.45 E.03217
G1 X94.812 Y87.55 E.0831
G1 X96.012 Y87.55 E.03217
G1 X96.012 Y89.45 E.05093
G1 X95.668 Y89.45 E.00922
; WIPE_START
G1 X95.865 Y89.933 E-.19798
G1 X95.776 Y89.979 E-.038
G1 X95.129 Y88.762 E-.52402
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X94.564 Y96.373 Z.54 F42000
G1 X94.342 Y99.359 Z.54
G1 Z.14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X94.342 Y100.525 E.03125
G1 X92.247 Y100.525 E.05616
G1 X92.247 Y102.98 E.06581
G1 X79.882 Y102.98 E.33147
M73 P25 R1
G1 X79.882 Y102.17 E.02172
G1 X80.482 Y102.17 E.01608
G1 X80.482 Y98.83 E.08953
G1 X79.882 Y98.83 E.01608
G1 X79.882 Y83.17 E.4198
G1 X80.482 Y83.17 E.01608
G1 X80.482 Y79.83 E.08953
G1 X79.882 Y79.83 E.01608
G1 X79.882 Y77.02 E.07533
G1 X85.891 Y77.02 E.16107
G1 X85.944 Y77.234 E.00591
M73 P26 R1
G1 X83.32 Y78.629 E.07967
G1 X94.314 Y99.306 E.62778
M204 S6000
G1 X94.812 Y99.315 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X94.812 Y100.995 E.04504
G1 X92.717 Y100.995 E.05616
G1 X92.717 Y103.45 E.06581
G1 X79.412 Y103.45 E.35666
G1 X79.412 Y101.7 E.04691
G1 X80.012 Y101.7 E.01608
M73 P27 R1
G1 X80.012 Y99.3 E.06434
G1 X79.412 Y99.3 E.01608
G1 X79.412 Y82.7 E.44499
G1 X80.012 Y82.7 E.01608
G1 X80.012 Y80.3 E.06434
G1 X79.412 Y80.3 E.01608
G1 X79.412 Y76.55 E.10053
G1 X88.231 Y76.55 E.2364
G1 X83.955 Y78.823 E.1298
G1 X94.812 Y99.242 E.61993
G1 X94.812 Y99.255 E.00034
; WIPE_START
G1 X94.812 Y100.995 E-.66129
M73 P28 R1
G1 X94.552 Y100.995 E-.09871
; WIPE_END
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

G1 X94.107 Y83.5
G1 Z.14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.520204
G1 F3000
M204 S500
G1 X95.307 Y83.5 E.03355
; WIPE_START
G1 X94.107 Y83.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X94.154 Y78.192 Z.54 F42000
G1 Z.14
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.516114
G1 F6300
M204 S500
G1 X93.381 Y77.419 E.0303
G1 X92.694 Y77.419 E.01906
G1 X93.943 Y78.668 E.04896
G1 X93.943 Y79.355 E.01906
G1 X92.007 Y77.419 E.07592
G1 X91.319 Y77.419 E.01906
G1 X93.943 Y80.043 E.10287
G1 X93.943 Y80.73 E.01906
M73 P29 R1
G1 X90.632 Y77.419 E.12983
G1 X90.083 Y77.419 E.01523
G1 X90.24 Y77.714 E.00927
G1 X93.943 Y81.418 E.14521
G1 X93.943 Y82.105 E.01906
G1 X91.02 Y79.182 E.11461
G1 X91.801 Y80.65 E.04609
G1 X93.943 Y82.793 E.084
G1 X93.943 Y82.84 E.00133
G1 X93.708 Y82.84 E.00651
G1 X93.708 Y83.245 E.01122
G1 X92.581 Y82.118 E.04419
G1 X93.362 Y83.586 E.04609
G1 X94.154 Y84.379 E.03109
; WIPE_START
G1 X93.362 Y83.586 E-.42607
G1 X92.949 Y82.81 E-.33393
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X86.473 Y78.77 Z.54 F42000
G1 X84.716 Y77.674 Z.54
G1 Z.14
G1 E.8 F1800
; LINE_WIDTH: 0.503734
G1 F6300
M204 S500
G1 X84.461 Y77.419 E.00973
G1 X83.791 Y77.419 E.0181
G1 X84.122 Y77.75 E.01264
G1 X83.685 Y77.983 E.01338
G1 X83.121 Y77.419 E.02153
M73 P30 R1
G1 X82.451 Y77.419 E.0181
G1 X83.247 Y78.215 E.03041
G1 X82.81 Y78.448 E.01338
G1 X81.781 Y77.419 E.0393
G1 X81.111 Y77.419 E.0181
G1 X83.488 Y79.795 E.0908
G1 X84.248 Y81.226 E.04378
G1 X80.442 Y77.419 E.14546
G1 X80.281 Y77.419 E.00433
G1 X80.281 Y77.929 E.01377
G1 X85.009 Y82.656 E.18064
G1 X85.769 Y84.087 E.04378
G1 X80.281 Y78.599 E.20971
G1 X80.281 Y79.269 E.0181
G1 X80.443 Y79.431 E.00618
G1 X80.881 Y79.431 E.01184
G1 X80.881 Y79.869 E.01184
G1 X86.53 Y85.518 E.21585
G1 X87.291 Y86.948 E.04378
G1 X80.881 Y80.539 E.24491
G1 X80.881 Y81.209 E.0181
M73 P31 R1
G1 X88.051 Y88.379 E.27397
G1 X88.812 Y89.809 E.04378
G1 X80.881 Y81.879 E.30304
G1 X80.881 Y82.548 E.0181
G1 X89.573 Y91.24 E.3321
G1 X90.333 Y92.67 E.04378
G1 X80.881 Y83.218 E.36117
G1 X80.881 Y83.569 E.00948
G1 X80.562 Y83.569 E.00862
M73 P32 R1
G1 X91.094 Y94.101 E.40242
G1 X91.854 Y95.531 E.04378
G1 X80.281 Y83.958 E.44222
G1 X80.281 Y84.628 E.0181
G1 X92.615 Y96.962 E.47129
G1 X93.376 Y98.392 E.04378
G1 X80.281 Y85.298 E.50035
G1 X80.281 Y85.968 E.0181
G1 X93.943 Y99.629 E.52203
G1 X93.943 Y100.126 E.01341
M73 P33 R1
G1 X93.769 Y100.126 E.00469
G1 X80.281 Y86.638 E.5154
G1 X80.281 Y87.308 E.0181
G1 X93.1 Y100.126 E.4898
G1 X92.43 Y100.126 E.0181
G1 X80.281 Y87.978 E.4642
G1 X80.281 Y88.647 E.0181
G1 X91.848 Y100.214 E.44198
M73 P34 R1
G1 X91.848 Y100.884 E.0181
G1 X80.281 Y89.317 E.44198
G1 X80.281 Y89.987 E.0181
G1 X91.848 Y101.554 E.44197
G1 X91.848 Y102.224 E.0181
G1 X80.281 Y90.657 E.44197
G1 X80.281 Y91.327 E.0181
G1 X91.535 Y102.581 E.43002
M73 P35 R1
G1 X90.865 Y102.581 E.0181
G1 X80.281 Y91.997 E.40443
G1 X80.281 Y92.667 E.0181
G1 X90.195 Y102.581 E.37883
G1 X89.525 Y102.581 E.0181
G1 X80.281 Y93.337 E.35323
G1 X80.281 Y94.007 E.0181
G1 X88.856 Y102.581 E.32763
G1 X88.186 Y102.581 E.0181
G1 X80.281 Y94.677 E.30203
M73 P36 R1
G1 X80.281 Y95.346 E.0181
G1 X87.516 Y102.581 E.27644
G1 X86.846 Y102.581 E.0181
G1 X80.281 Y96.016 E.25084
G1 X80.281 Y96.686 E.0181
G1 X86.176 Y102.581 E.22524
G1 X85.506 Y102.581 E.0181
G1 X80.281 Y97.356 E.19964
G1 X80.281 Y98.026 E.0181
G1 X84.836 Y102.581 E.17404
M73 P37 R1
G1 X84.166 Y102.581 E.0181
G1 X80.881 Y99.296 E.12552
G1 X80.881 Y99.966 E.0181
G1 X83.496 Y102.581 E.09992
G1 X82.826 Y102.581 E.0181
G1 X80.881 Y100.636 E.07432
G1 X80.881 Y101.306 E.0181
G1 X82.157 Y102.581 E.04872
G1 X81.487 Y102.581 E.0181
G1 X80.881 Y101.976 E.02313
G1 X80.881 Y102.569 E.01604
G1 X80.805 Y102.569 E.00206
G1 X81.028 Y102.792 E.00852
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6300
G1 X80.805 Y102.569 E-.11978
G1 X80.881 Y102.569 E-.02892
G1 X80.881 Y101.976 E-.22564
G1 X81.487 Y102.581 E-.32524
G1 X81.646 Y102.581 E-.06042
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/10
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.54 I-.169 J1.205 P1  F42000
G1 X96.049 Y104.602 Z.54
G1 Z.3
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
M204 S6000
G1 X96.049 Y98.483 E.15384
M204 S10000
M73 P38 R1
G1 X95.621 Y95.964 F42000
; FEATURE: Support
G1 F9000
M204 S6000
G1 X95.621 Y98.271 E.058
G1 X98.121 Y98.271 E.06285
G1 X98.121 Y95.771 E.06285
G1 X95.621 Y95.771 E.06285
; WIPE_START
G1 X97.621 Y95.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I1.204 J-.175 P1  F42000
G1 X96.781 Y90 Z.7
G1 Z.3
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X98.506 Y90 E.04337
G1 X98.506 Y92.886 E.07255
G1 X96.007 Y92.886 E.06285
M204 S10000
G1 X95.356 Y92.886 F42000
; FEATURE: Support transition
G1 F3000
M204 S6000
G1 X95.621 Y92.886 E.00666
G1 X95.621 Y90.869 E.0507
G3 X95.163 Y90.515 I-.052 J-.406 E.01616
G1 X95.163 Y92.886 E.05961
G1 X94.278 Y92.886 E.02227
G1 X94.278 Y88.849 E.10148
G1 X93.674 Y87.713 E.03234
M204 S10000
G1 X93.654 Y87.676 F42000
G1 F3000
M204 S6000
G1 X93.392 Y87.184 E.01402
G1 X93.392 Y92.886 E.14336
G1 X92.506 Y92.886 E.02227
G1 X92.506 Y87.114 E.14511
G1 X91.621 Y87.114 E.02227
G1 X91.621 Y91.551 E.11156
G1 X91.359 Y91.059 E.01402
M204 S10000
G1 X90.473 Y89.393 F42000
G1 F3000
M204 S6000
G1 X90.735 Y89.886 E.01402
G1 X90.735 Y87.114 E.06968
G1 X89.849 Y87.114 E.02227
G1 X89.849 Y88.22 E.0278
; WIPE_START
G1 X89.849 Y87.114 E-.42021
G1 X90.735 Y87.114 E-.33655
G1 X90.735 Y87.123 E-.00324
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P39 R1
G3 Z.7 I1.211 J-.124 P1  F42000
G1 X90.111 Y81.013 Z.7
G1 Z.3
G1 E.8 F1800
G1 F3000
M204 S6000
G1 X89.849 Y80.521 E.01402
G1 X89.849 Y84.229 E.09322
G1 X88.964 Y84.229 E.02227
G1 X88.964 Y78.855 E.1351
G1 X88.219 Y77.454 E.03989
G1 X88.078 Y77.529 E.00401
G1 X88.078 Y84.229 E.16844
G1 X87.727 Y84.229 E.00882
G1 X87.192 Y83.223 E.02864
G1 X87.192 Y78 E.13131
G1 X86.964 Y78.122 E.00652
G1 X86.964 Y78.449 E.00822
M204 S10000
G1 X85.251 Y79.032 F42000
G1 F3000
M204 S6000
G1 X85.027 Y79.151 E.00636
G1 X85.421 Y79.892 E.02109
G1 X85.421 Y78.942 E.02388
G1 X86.307 Y78.471 E.02522
G1 X86.307 Y81.557 E.0776
G1 X86.045 Y81.065 E.01402
; WIPE_START
G1 X86.307 Y81.557 E-.21191
G1 X86.307 Y80.115 E-.54809
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-1.081 J.559 P1  F42000
G1 X97.82 Y102.392 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X97.82 Y104.428 E.0512
G1 X96.935 Y104.428 E.02227
G1 X96.935 Y102.732 E.04266
G1 X96.497 Y101.97 E.02209
G1 X96.629 Y101.54 E.0113
G1 X96.935 Y101.377 E.00871
G1 X96.935 Y98.657 E.06839
G1 X97.82 Y98.657 E.02227
G1 X97.82 Y100.906 E.05655
G1 X98.706 Y100.435 E.02522
G1 X98.706 Y95.771 E.11726
M73 P40 R1
G1 X99.592 Y95.771 E.02227
G1 X99.592 Y99.964 E.10542
G1 X100.293 Y99.592 E.01996
G1 X100.477 Y99.648 E.00486
G1 X100.477 Y95.771 E.09747
G1 X101.363 Y95.771 E.02227
G1 X101.363 Y101.716 E.14947
M204 S10000
G1 X100.477 Y101.716 F42000
G1 F4800
M204 S6000
G1 X100.477 Y100.979 E.01853
; WIPE_START
G1 X100.477 Y101.716 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I1.136 J-.437 P1  F42000
G1 X95.399 Y88.502 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10560
M204 S6000
G1 X95.085 Y87.911 E.01815
G1 X95.652 Y87.911 E.01535
G1 X95.652 Y88.574 E.01797
G1 X95.462 Y88.621 E.00528
G1 X95.427 Y88.555 E.00202
; WIPE_START
G1 F10826.06
G1 X95.085 Y87.911 E-.27728
G1 X95.652 Y87.911 E-.21532
G1 X95.652 Y88.574 E-.25194
G1 X95.612 Y88.584 E-.01546
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.104 Y86.066 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F10560
M204 S6000
G1 X89.236 Y76.911 E.28096
G1 X94.451 Y76.911 E.14132
G1 X94.452 Y82.911 E.16258
G1 X95.652 Y82.911 E.03252
G1 X95.652 Y84.089 E.03194
G1 X94.452 Y84.089 E.03252
G1 X94.452 Y86.317 E.06036
G1 X94.262 Y86.364 E.00528
G1 X94.132 Y86.119 E.00753
; WIPE_START
G1 F10826.06
G1 X93.193 Y84.353 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.68 Y89.501 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10560
M204 S5000
G1 X95.919 Y89.949 E.01277
G1 X95.76 Y90.034 E.00453
G1 X88.569 Y76.51 E.38507
G1 X94.852 Y76.51 E.15795
G1 X94.852 Y82.51 E.15085
M73 P41 R1
G1 X96.052 Y82.51 E.03017
G1 X96.052 Y84.49 E.04978
G1 X94.852 Y84.49 E.03017
G1 X94.852 Y87.51 E.07593
G1 X96.052 Y87.51 E.03017
G1 X96.052 Y89.49 E.04978
G1 X95.723 Y89.49 E.00828
; WIPE_START
G1 F11668.197
M204 S6000
G1 X95.919 Y89.949 E-.1897
G1 X95.76 Y90.034 E-.0684
G1 X95.14 Y88.867 E-.5019
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-1.214 J-.08 P1  F42000
G1 X94.452 Y99.353 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10560
M204 S6000
G1 X94.452 Y100.634 E.03471
G1 X92.357 Y100.634 E.05677
G1 X92.357 Y103.089 E.06652
G1 X79.775 Y103.089 E.34092
G1 X79.773 Y102.061 E.02787
G1 X80.373 Y102.061 E.01624
G1 X80.373 Y98.939 E.08458
G1 X79.773 Y98.939 E.01626
G1 X79.773 Y83.061 E.43027
G1 X80.373 Y83.061 E.01626
G1 X80.373 Y79.939 E.08458
G1 X79.773 Y79.939 E.01626
G1 X79.773 Y76.911 E.08207
G1 X86.381 Y76.911 E.17908
G1 X86.429 Y77.1 E.00528
G1 X83.467 Y78.674 E.09088
G1 X94.433 Y99.298 E.63293
M204 S250
G1 X94.852 Y99.353 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10560
M204 S5000
G1 X94.852 Y101.035 E.04228
G1 X92.757 Y101.035 E.05267
G1 X92.757 Y103.49 E.06172
M73 P42 R1
G1 X79.372 Y103.49 E.33651
G1 X79.372 Y101.66 E.046
G1 X79.972 Y101.66 E.01508
G1 X79.972 Y99.34 E.05833
G1 X79.372 Y99.34 E.01508
G1 X79.372 Y82.66 E.41936
G1 X79.972 Y82.66 E.01508
G1 X79.972 Y80.34 E.05833
G1 X79.372 Y80.34 E.01508
G1 X79.372 Y76.511 E.09627
G1 X88.391 Y76.51 E.22674
G1 X84.009 Y78.84 E.12477
G1 X94.852 Y99.232 E.58066
G1 X94.852 Y99.293 E.00154
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.852 Y101.035 E-.6618
G1 X94.594 Y101.035 E-.0982
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

G1 X94.285 Y100.036
G1 Z.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425516
G1 F10560
M204 S6000
G1 X94.027 Y100.294 E.0093
G1 X93.474 Y100.294 E.01411
G1 X94.111 Y99.656 E.02299
G1 X94.111 Y99.417 E.0061
G1 X94.002 Y99.212 E.00592
G1 X92.92 Y100.294 E.03901
G1 X92.367 Y100.294 E.01411
G1 X93.81 Y98.851 E.05204
G1 X93.618 Y98.49 E.01043
G1 X89.359 Y102.749 E.1536
G1 X89.912 Y102.749 E.01411
G1 X92.016 Y100.645 E.07587
G1 X92.016 Y101.198 E.01411
G1 X90.465 Y102.749 E.05592
G1 X91.019 Y102.749 E.01411
G1 X92.016 Y101.751 E.03597
G1 X92.016 Y102.305 E.01411
G1 X91.398 Y102.922 E.02228
M204 S10000
G1 X88.632 Y102.922 F42000
G1 F10560
M204 S6000
G1 X93.426 Y98.129 E.17288
M73 P43 R1
G1 X93.234 Y97.768 E.01043
G1 X88.253 Y102.749 E.17965
G1 X87.699 Y102.749 E.01411
G1 X93.042 Y97.406 E.19267
G1 X92.85 Y97.045 E.01043
G1 X87.146 Y102.749 E.2057
G1 X86.593 Y102.749 E.01411
G1 X92.658 Y96.684 E.21872
G1 X92.466 Y96.323 E.01043
G1 X86.04 Y102.749 E.23175
G1 X85.486 Y102.749 E.01411
G1 X92.274 Y95.962 E.24478
G1 X92.082 Y95.6 E.01043
G1 X84.933 Y102.749 E.2578
G1 X84.38 Y102.749 E.01411
G1 X91.89 Y95.239 E.27083
G1 X91.698 Y94.878 E.01043
G1 X83.827 Y102.749 E.28385
G1 X83.274 Y102.749 E.01411
G1 X91.506 Y94.517 E.29688
G1 X91.314 Y94.156 E.01043
G1 X82.72 Y102.749 E.3099
G1 X82.167 Y102.749 E.01411
G1 X91.122 Y93.795 E.32293
G1 X90.93 Y93.433 E.01043
G1 X81.614 Y102.749 E.33595
G1 X81.061 Y102.749 E.01411
G1 X90.737 Y93.072 E.34898
G1 X90.545 Y92.711 E.01043
G1 X80.508 Y102.749 E.362
M73 P44 R1
G1 X80.115 Y102.749 E.01001
G1 X80.115 Y102.589 E.00409
G1 X80.302 Y102.401 E.00676
G1 X80.713 Y102.401 E.01048
G1 X80.713 Y101.99 E.01048
G1 X90.353 Y92.35 E.34766
G1 X90.161 Y91.989 E.01043
G1 X80.713 Y101.437 E.34073
G1 X80.713 Y100.884 E.01411
G1 X89.969 Y91.628 E.33381
G1 X89.777 Y91.266 E.01043
G1 X80.713 Y100.33 E.32688
G1 X80.713 Y99.777 E.01411
G1 X89.585 Y90.905 E.31996
G1 X89.393 Y90.544 E.01043
G1 X80.713 Y99.224 E.31303
G1 X80.713 Y98.671 E.01411
G1 X89.201 Y90.183 E.30611
G1 X89.009 Y89.822 E.01043
G1 X80.232 Y98.599 E.31654
G1 X80.113 Y98.599 E.00303
G1 X80.113 Y98.164 E.01108
G1 X88.817 Y89.461 E.31389
G1 X88.625 Y89.099 E.01043
G1 X80.113 Y97.611 E.30697
G1 X80.113 Y97.058 E.01411
G1 X88.433 Y88.738 E.30004
G1 X88.241 Y88.377 E.01043
G1 X80.113 Y96.505 E.29312
G1 X80.113 Y95.952 E.01411
G1 X88.049 Y88.016 E.28619
M73 P45 R1
G1 X87.857 Y87.655 E.01043
G1 X80.113 Y95.398 E.27926
G1 X80.113 Y94.845 E.01411
G1 X87.665 Y87.293 E.27234
G1 X87.473 Y86.932 E.01043
G1 X80.113 Y94.292 E.26541
G1 X80.113 Y93.739 E.01411
G1 X87.281 Y86.571 E.25849
G1 X87.089 Y86.21 E.01043
G1 X80.113 Y93.185 E.25156
G1 X80.113 Y92.632 E.01411
G1 X86.897 Y85.849 E.24464
G1 X86.705 Y85.488 E.01043
G1 X80.113 Y92.079 E.23771
G1 X80.113 Y91.526 E.01411
G1 X86.513 Y85.126 E.23079
G1 X86.321 Y84.765 E.01043
G1 X80.113 Y90.973 E.22386
G1 X80.113 Y90.419 E.01411
G1 X86.129 Y84.404 E.21693
G1 X85.936 Y84.043 E.01043
G1 X80.113 Y89.866 E.21001
G1 X80.113 Y89.313 E.01411
G1 X85.744 Y83.682 E.20308
G1 X85.552 Y83.321 E.01043
G1 X80.113 Y88.76 E.19616
G1 X80.113 Y88.207 E.01411
G1 X85.36 Y82.959 E.18923
G1 X85.168 Y82.598 E.01043
G1 X80.113 Y87.653 E.18231
M73 P46 R1
G1 X80.113 Y87.1 E.01411
G1 X84.976 Y82.237 E.17538
G1 X84.784 Y81.876 E.01043
G1 X80.113 Y86.547 E.16845
G1 X80.113 Y85.994 E.01411
G1 X84.592 Y81.515 E.16153
G1 X84.4 Y81.154 E.01043
G1 X80.113 Y85.44 E.1546
G1 X80.113 Y84.887 E.01411
G1 X84.208 Y80.792 E.14768
G1 X84.016 Y80.431 E.01043
G1 X80.113 Y84.334 E.14075
G1 X80.113 Y83.781 E.01411
G1 X83.824 Y80.07 E.13383
G1 X83.632 Y79.709 E.01043
G1 X80.713 Y82.628 E.10526
G1 X80.713 Y82.074 E.01411
G1 X83.44 Y79.348 E.09834
G1 X83.248 Y78.987 E.01043
G1 X80.713 Y81.521 E.09141
G1 X80.713 Y80.968 E.01411
G1 X84.43 Y77.251 E.13404
G1 X84.983 Y77.251 E.01411
G1 X84.069 Y78.165 E.03296
M204 S10000
G1 X80.731 Y77.078 F42000
G1 F10560
M204 S6000
G1 X80.113 Y77.696 E.02228
G1 X80.113 Y78.249 E.01411
G1 X81.111 Y77.251 E.03598
G1 X81.664 Y77.251 E.01411
G1 X80.113 Y78.802 E.05593
G1 X80.113 Y79.355 E.01411
G1 X82.217 Y77.251 E.07588
G1 X82.77 Y77.251 E.01411
G1 X80.423 Y79.599 E.08467
G1 X80.713 Y79.599 E.00741
G1 X80.713 Y79.862 E.0067
G1 X83.324 Y77.251 E.09414
G1 X83.877 Y77.251 E.01411
G1 X80.54 Y80.588 E.12035
; WIPE_START
G1 F11503.655
G1 X81.954 Y79.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-.536 J1.092 P1  F42000
G1 X94.051 Y85.112 Z.7
G1 Z.3
M73 P47 R1
G1 E.8 F1800
; LINE_WIDTH: 0.419527
G1 F10560
M204 S6000
G1 X94.051 Y83.882 E.03091
G1 X94.134 Y83.724 E.00448
G1 X94.244 Y83.691 E.00287
G1 X95.253 Y83.691 E.02534
G1 X95.253 Y83.309 E.00958
G1 X94.244 Y83.309 E.02534
G1 X94.087 Y83.231 E.00439
G1 X94.051 Y83.119 E.00297
G1 X94.051 Y77.311 E.14582
G1 X89.903 Y77.311 E.10415
G1 X94.023 Y85.06 E.22035
M204 S10000
G1 X93.67 Y83.423 F42000
; LINE_WIDTH: 0.542908
G1 F8848.311
M204 S6000
G1 X93.664 Y83.322 E.00338
; LINE_WIDTH: 0.504211
G1 F9577.016
G1 X93.658 Y83.22 E.00312
; LINE_WIDTH: 0.465515
G1 F10436.518
G1 X93.652 Y83.119 E.00286
; LINE_WIDTH: 0.427542
G1 F10560
G2 X93.665 Y77.697 I-880.096 J-4.798 E.13897
G1 X90.545 Y77.697 E.07998
G2 X93.467 Y83.165 I889.44 J-471.817 E.15891
; LINE_WIDTH: 0.465515
G1 F10436.518
G1 X93.522 Y83.235 E.00252
; LINE_WIDTH: 0.504211
G1 F9577.016
G1 X93.578 Y83.306 E.00275
; LINE_WIDTH: 0.542908
G1 F8848.311
G1 X93.633 Y83.376 E.00297
M204 S10000
G1 X93.28 Y82.019 F42000
; LINE_WIDTH: 0.419996
G1 F10560
M204 S6000
G1 X93.279 Y78.083 E.09896
G1 X91.187 Y78.083 E.05261
G1 X93.251 Y81.966 E.11057
M204 S10000
G1 X92.894 Y80.472 F42000
G1 F10560
M204 S6000
G1 X92.894 Y78.468 E.05037
G1 X91.828 Y78.468 E.02678
G1 X92.866 Y80.419 E.05554
M204 S10000
G1 X92.52 Y78.823 F42000
; LINE_WIDTH: 0.448336
G1 F10560
M204 S6000
G2 X92.512 Y78.913 I-.026 J.043 E.00546
; WIPE_START
G1 F10869.566
G1 X92.468 Y78.913 E-.16634
G1 X92.442 Y78.868 E-.19789
G1 X92.468 Y78.823 E-.19791
G1 X92.52 Y78.823 E-.19785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.097 Y86.008 Z.7 F42000
G1 X100.271 Y100.432 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F10560
M204 S5000
G1 X100.281 Y100.452 E.0005
G1 X99.997 Y100.603 E.00721
G1 X99.986 Y100.583 E.0005
G1 X100.218 Y100.46 E.00587
; WIPE_START
G1 F12000
M204 S6000
G1 X100.281 Y100.452 E-.07252
G1 X99.997 Y100.603 E-.36499
G1 X99.986 Y100.583 E-.02541
G1 X100.218 Y100.46 E-.29707
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.214 Y101.001 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F10560
M204 S5000
G1 X99.222 Y101.015 E.00035
G1 X98.407 Y101.448 E.02064
G1 X98.397 Y101.428 E.0005
G1 X99.161 Y101.029 E.0193
; WIPE_START
G1 F12000
M204 S6000
G1 X99.222 Y101.015 E-.02524
G1 X98.407 Y101.448 E-.37501
G1 X98.397 Y101.428 E-.00913
G1 X99.161 Y101.029 E-.35062
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.622 Y101.84 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F10560
M204 S5000
G1 X97.632 Y101.86 E.0005
G1 X97.348 Y102.011 E.00721
G1 X97.337 Y101.992 E.0005
G1 X97.569 Y101.868 E.00587
; CHANGE_LAYER
; Z_HEIGHT: 0.46
; LAYER_HEIGHT: 0.16
; WIPE_START
M73 P48 R1
G1 F12000
M204 S6000
G1 X97.632 Y101.86 E-.07252
G1 X97.348 Y102.011 E-.36501
G1 X97.337 Y101.992 E-.02539
G1 X97.569 Y101.868 E-.29708
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/10
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.7 I-1.096 J.529 P1  F42000
G1 X98.68 Y104.171 Z.7
G1 Z.46
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
M204 S6000
G1 X95.621 Y104.171 E.07692
G1 X95.621 Y103.285 E.02227
G1 X98.507 Y103.285 E.07256
G1 X98.507 Y102.399 E.02227
G1 X98.176 Y102.399 E.0083
G1 X97.326 Y102.851 E.02421
G1 X96.896 Y102.72 E.0113
G1 X96.726 Y102.399 E.00913
G1 X95.621 Y102.399 E.02778
G1 X95.621 Y101.514 E.02227
G1 X96.678 Y101.514 E.02658
G1 X98.344 Y100.628 E.04743
G1 X95.621 Y100.628 E.06846
G1 X95.621 Y99.742 E.02227
G1 X101.392 Y99.742 E.14511
G1 X101.392 Y98.857 E.02227
G1 X95.621 Y98.857 E.14511
G1 X95.621 Y98.657 E.00502
G1 X98.506 Y98.657 E.07255
G1 X98.506 Y97.971 E.01724
G1 X101.392 Y97.971 E.07256
G1 X101.392 Y97.085 E.02227
G1 X98.506 Y97.085 E.07256
G1 X98.506 Y96.2 E.02227
G1 X101.566 Y96.2 E.07692
; WIPE_START
G1 X99.566 Y96.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I-1.109 J.501 P1  F42000
G1 X101.566 Y100.628 Z.86
G1 Z.46
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X101.074 Y100.628 E.01236
G1 X100.99 Y100.903 E.00724
G1 X99.941 Y101.433 E.02954
G3 X99.842 Y101.514 I-.09 J-.009 E.00357
G1 X101.566 Y101.514 E.04334
; WIPE_START
G1 X99.842 Y101.514 E-.65499
G1 X99.941 Y101.433 E-.04854
G1 X100.073 Y101.366 E-.05647
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I.428 J-1.139 P1  F42000
G1 X94.852 Y99.403 Z.86
G1 Z.46
G1 E.8 F1800
; FEATURE: Outer wall
M73 P49 R1
G1 F9814
M204 S5000
G1 X94.852 Y101.035 E.04103
G1 X92.757 Y101.035 E.05267
G1 X92.757 Y103.49 E.06172
G1 X79.372 Y103.489 E.33651
G1 X79.372 Y101.66 E.04599
G1 X79.972 Y101.66 E.01508
G1 X79.972 Y99.34 E.05833
G1 X79.372 Y99.34 E.01508
G1 X79.372 Y82.66 E.41936
G1 X79.972 Y82.66 E.01508
G1 X79.972 Y80.34 E.05833
G1 X79.372 Y80.34 E.01508
G1 X79.373 Y76.51 E.09628
G1 X88.391 Y76.51 E.22673
G1 X84.009 Y78.84 E.12476
G1 X94.852 Y99.232 E.58066
G1 X94.852 Y99.343 E.00279
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.852 Y101.035 E-.64289
G1 X94.544 Y101.035 E-.11711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I1.211 J.123 P1  F42000
G1 X95.711 Y89.559 Z.86
G1 Z.46
G1 E.8 F1800
G1 F9814
M204 S5000
G1 X95.919 Y89.949 E.01112
G1 X95.76 Y90.034 E.00453
G1 X88.569 Y76.51 E.38507
G1 X94.852 Y76.51 E.15795
G1 X94.852 Y82.51 E.15084
G1 X96.052 Y82.51 E.03017
G1 X96.052 Y84.49 E.04978
M73 P50 R1
G1 X94.852 Y84.49 E.03017
G1 X94.852 Y87.51 E.07593
G1 X96.052 Y87.51 E.03017
G1 X96.052 Y89.49 E.04978
G1 X95.675 Y89.49 E.00949
G1 X95.683 Y89.506 E.00044
; WIPE_START
G1 F11668.197
M204 S6000
G1 X95.919 Y89.949 E-.19087
G1 X95.76 Y90.034 E-.0684
G1 X95.141 Y88.87 E-.50073
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

G1 X95.48 Y87.722
G1 Z.46
G1 E.8 F1800
; FEATURE: Top surface
G1 F9814
M204 S2000
G1 X95.84 Y88.082 E.01281
G1 X95.84 Y88.628
G1 X94.934 Y87.722 E.0322
; WIPE_START
G1 F11668.197
M204 S6000
G1 X95.84 Y88.628 E-.48671
G1 X95.84 Y88.082 E-.20725
G1 X95.717 Y87.96 E-.06604
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.859 Y88.676 Z.86 F42000
G1 Z.46
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.233971
G1 F9814
M204 S6000
G1 X95.797 Y88.781 E.00159
; LINE_WIDTH: 0.2684
G1 X95.734 Y88.886 E.00187
; LINE_WIDTH: 0.26277
G1 X95.69 Y88.853 E.00081
; LINE_WIDTH: 0.217056
G1 X95.647 Y88.821 E.00065
; LINE_WIDTH: 0.175274
G1 X95.566 Y88.712 E.00125
; LINE_WIDTH: 0.137408
G1 X95.486 Y88.602 E.00091
; LINE_WIDTH: 0.0995422
G1 X95.405 Y88.493 E.00058
; WIPE_START
G1 F18000
G1 X95.486 Y88.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.9 Y80.992 Z.86 F42000
G1 X94.64 Y77.61 Z.86
G1 Z.46
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9814
M204 S2000
G1 X93.752 Y76.722 E.03157
G1 X93.206 Y76.722
G1 X94.64 Y78.156 E.05097
G1 X94.64 Y78.701
G1 X92.661 Y76.722 E.07036
G1 X92.116 Y76.722
G1 X94.64 Y79.247 E.08975
G1 X94.64 Y79.792
G1 X91.57 Y76.722 E.10915
G1 X91.025 Y76.722
G1 X94.64 Y80.337 E.12854
G1 X94.64 Y80.883
G1 X90.479 Y76.722 E.14793
G1 X89.934 Y76.722
G1 X94.64 Y81.428 E.16733
M73 P51 R1
G1 X94.64 Y81.974
G1 X89.389 Y76.722 E.18672
G1 X89.489 Y77.368
G1 X94.64 Y82.519 E.18315
G1 X95.388 Y82.722
G1 X95.84 Y83.174 E.01606
G1 X95.84 Y83.719
G1 X94.843 Y82.722 E.03545
; WIPE_START
G1 F11668.197
M204 S6000
G1 X95.84 Y83.719 E-.5358
G1 X95.84 Y83.174 E-.20725
G1 X95.809 Y83.142 E-.01695
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.84 Y84.265 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F9814
M204 S2000
G1 X90.108 Y78.533 E.2038
G1 X90.519 Y79.489
G1 X95.308 Y84.278 E.17027
G1 X94.763 Y84.278
G1 X90.87 Y80.385 E.1384
; WIPE_START
G1 F11668.197
M204 S6000
G1 X92.284 Y81.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.489 Y81.55 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F9814
M204 S2000
G1 X94.64 Y84.701 E.11202
G1 X94.64 Y85.246
G1 X92.109 Y82.715 E.09001
; WIPE_START
G1 F11668.197
M204 S6000
G1 X93.523 Y84.129 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.728 Y83.879 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F9814
M204 S2000
M73 P52 R1
G1 X94.64 Y85.792 E.06799
G1 X94.64 Y86.337
G1 X93.347 Y85.044 E.04597
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.64 Y86.337 E-.6948
G1 X94.64 Y86.165 E-.0652
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.966 Y86.209 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F9814
M204 S2000
G1 X94.64 Y86.882 E.02395
M204 S10000
G1 X94.412 Y86.992 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0966355
G1 F9814
M204 S6000
G1 X94.309 Y86.852 E.00071
M204 S10000
G1 X94.029 Y86.146 F42000
; LINE_WIDTH: 0.192949
G1 F9814
M204 S6000
G1 X93.916 Y85.993 E.00197
; LINE_WIDTH: 0.148013
G1 X93.803 Y85.84 E.00141
; LINE_WIDTH: 0.103077
G1 X93.69 Y85.687 E.00085
M204 S10000
G1 X93.41 Y84.981 F42000
; LINE_WIDTH: 0.192949
G1 F9814
M204 S6000
G1 X93.297 Y84.828 E.00197
; LINE_WIDTH: 0.148013
G1 X93.184 Y84.676 E.00141
; LINE_WIDTH: 0.103077
G1 X93.07 Y84.523 E.00085
M204 S10000
G1 X92.791 Y83.817 F42000
; LINE_WIDTH: 0.192951
G1 F9814
M204 S6000
G1 X92.677 Y83.664 E.00197
; LINE_WIDTH: 0.148014
G1 X92.564 Y83.511 E.00141
; LINE_WIDTH: 0.103078
G1 X92.451 Y83.358 E.00085
M204 S10000
G1 X92.171 Y82.652 F42000
; LINE_WIDTH: 0.192949
G1 F9814
M204 S6000
G1 X92.058 Y82.499 E.00197
; LINE_WIDTH: 0.148013
G1 X91.945 Y82.346 E.00141
; LINE_WIDTH: 0.103077
G1 X91.832 Y82.193 E.00085
M204 S10000
G1 X91.552 Y81.487 F42000
; LINE_WIDTH: 0.192958
G1 F9814
M204 S6000
G1 X91.439 Y81.334 E.00197
; LINE_WIDTH: 0.148019
G1 X91.326 Y81.182 E.00141
; LINE_WIDTH: 0.10308
G1 X91.213 Y81.029 E.00085
M204 S10000
G1 X90.933 Y80.323 F42000
; LINE_WIDTH: 0.192955
G1 F9814
M204 S6000
G1 X90.82 Y80.17 E.00197
; LINE_WIDTH: 0.148017
G1 X90.706 Y80.017 E.00141
; LINE_WIDTH: 0.103079
G1 X90.593 Y79.864 E.00085
; WIPE_START
G1 F18000
G1 X90.706 Y80.017 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.171 Y78.47 Z.86 F42000
G1 Z.46
G1 E.8 F1800
; LINE_WIDTH: 0.192949
G1 F9814
M204 S6000
G1 X90.058 Y78.317 E.00197
; LINE_WIDTH: 0.148013
G1 X89.945 Y78.164 E.00141
; LINE_WIDTH: 0.103077
G1 X89.831 Y78.011 E.00085
M204 S10000
G1 X89.278 Y77.39 F42000
; LINE_WIDTH: 0.104593
G1 F9814
M204 S6000
G1 X89.22 Y77.219 E.00083
; LINE_WIDTH: 0.15253
G1 X89.163 Y77.047 E.0014
; LINE_WIDTH: 0.200467
G1 X89.106 Y76.875 E.00196
; LINE_WIDTH: 0.248403
G1 X89.049 Y76.703 E.00253
; WIPE_START
G1 F18000
G1 X89.106 Y76.875 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.967 Y77.027 Z.86 F42000
G1 Z.46
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9814
M204 S2000
G1 X86.661 Y76.722 E.01085
G1 X86.116 Y76.722
G1 X86.61 Y77.217 E.01758
G1 X86.254 Y77.406
G1 X85.571 Y76.722 E.02431
G1 X85.025 Y76.722
G1 X85.898 Y77.595 E.03104
G1 X85.542 Y77.785
G1 X84.48 Y76.722 E.03777
G1 X83.934 Y76.722
G1 X85.186 Y77.974 E.04451
G1 X84.83 Y78.163
G1 X83.389 Y76.722 E.05124
G1 X82.844 Y76.722
G1 X84.474 Y78.353 E.05797
G1 X84.118 Y78.542
G1 X82.298 Y76.722 E.0647
G1 X81.753 Y76.722
G1 X83.762 Y78.731 E.07143
G1 X84.273 Y79.788
G1 X81.207 Y76.722 E.10901
G1 X80.662 Y76.722
M73 P53 R1
G1 X84.416 Y80.476 E.13348
; WIPE_START
G1 F11668.197
M204 S6000
G1 X83.002 Y79.062 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.035 Y81.641 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F9814
M204 S2000
G1 X80.117 Y76.722 E.17489
G1 X79.584 Y76.735
G1 X86.131 Y83.282 E.23277
; WIPE_START
G1 F11668.197
M204 S6000
G1 X84.717 Y81.868 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.75 Y84.447 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F9814
M204 S2000
G1 X79.584 Y77.281 E.25479
G1 X79.584 Y77.826
G1 X87.37 Y85.611 E.27681
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.955 Y84.197 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.989 Y86.776 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F9814
M204 S2000
G1 X79.584 Y78.371 E.29883
G1 X79.584 Y78.917
G1 X88.608 Y87.941 E.32085
; WIPE_START
G1 F11668.197
M204 S6000
G1 X87.194 Y86.526 E-.76
; WIPE_END
M73 P54 R1
G1 E-.04 F1800
M204 S10000
G1 X89.227 Y89.105 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F9814
M204 S2000
G1 X79.584 Y79.462 E.34286
; WIPE_START
G1 F11668.197
M204 S6000
G1 X80.998 Y80.876 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.184 Y80.608 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F9814
M204 S2000
G1 X89.847 Y90.27 E.34355
G1 X89.99 Y90.958
G1 X80.184 Y81.153 E.34863
G1 X80.184 Y81.698
G1 X90.609 Y92.123 E.37065
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.195 Y90.709 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.704 Y93.764 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F9814
M204 S2000
G1 X80.184 Y82.244 E.4096
G1 X80.184 Y82.789
G1 X92.324 Y94.929 E.43162
; WIPE_START
G1 F11668.197
M204 S6000
G1 X90.91 Y93.515 E-.76
; WIPE_END
M73 P55 R1
G1 E-.04 F1800
M204 S10000
G1 X92.943 Y96.093 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F9814
M204 S2000
G1 X79.722 Y82.872 E.47009
G1 X79.584 Y83.28
G1 X93.562 Y97.258 E.49699
; WIPE_START
G1 F11668.197
M204 S6000
G1 X92.148 Y95.844 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.182 Y98.423 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F9814
M204 S2000
G1 X79.584 Y83.826 E.51901
G1 X79.584 Y84.371
G1 X94.64 Y99.427 E.53531
G1 X94.64 Y99.972
G1 X79.584 Y84.916 E.53531
G1 X79.584 Y85.462
G1 X94.64 Y100.518 E.53531
G1 X94.4 Y100.823
G1 X79.584 Y86.007 E.52678
M73 P56 R1
G1 X79.584 Y86.553
G1 X93.855 Y100.823 E.50739
G1 X93.309 Y100.823
G1 X79.584 Y87.098 E.488
G1 X79.584 Y87.643
G1 X92.764 Y100.823 E.4686
G1 X92.545 Y101.15
G1 X79.584 Y88.189 E.46082
G1 X79.584 Y88.734
G1 X92.545 Y101.695 E.46082
G1 X92.545 Y102.24
G1 X79.584 Y89.28 E.46082
G1 X79.584 Y89.825
G1 X92.545 Y102.786 E.46082
M73 P57 R1
G1 X92.492 Y103.278
G1 X79.584 Y90.37 E.45893
G1 X79.584 Y90.916
G1 X91.946 Y103.278 E.43954
G1 X91.401 Y103.278
G1 X79.584 Y91.461 E.42015
G1 X79.584 Y92.007
G1 X90.856 Y103.278 E.40076
G1 X90.31 Y103.278
G1 X79.584 Y92.552 E.38136
G1 X79.584 Y93.097
G1 X89.765 Y103.278 E.36197
G1 X89.219 Y103.278
G1 X79.584 Y93.643 E.34258
M73 P58 R1
G1 X79.584 Y94.188
G1 X88.674 Y103.278 E.32319
G1 X88.129 Y103.278
G1 X79.584 Y94.734 E.3038
G1 X79.584 Y95.279
G1 X87.583 Y103.278 E.2844
G1 X87.038 Y103.278
G1 X79.584 Y95.824 E.26501
G1 X79.584 Y96.37
G1 X86.492 Y103.278 E.24562
G1 X85.947 Y103.278
G1 X79.584 Y96.915 E.22623
G1 X79.584 Y97.461
G1 X85.402 Y103.278 E.20684
G1 X84.856 Y103.278
G1 X79.584 Y98.006 E.18744
G1 X79.584 Y98.551
G1 X80.161 Y99.128 E.0205
M73 P59 R1
G1 X80.184 Y99.151
G1 X84.311 Y103.278 E.14672
G1 X83.765 Y103.278
G1 X80.184 Y99.697 E.12733
G1 X80.184 Y100.242
G1 X83.22 Y103.278 E.10793
G1 X82.675 Y103.278
G1 X80.184 Y100.788 E.08854
G1 X80.184 Y101.333
G1 X82.129 Y103.278 E.06915
G1 X81.584 Y103.278
G1 X80.178 Y101.872 E.04998
G1 X79.632 Y101.872
G1 X81.038 Y103.278 E.04998
G1 X80.493 Y103.278
G1 X79.584 Y102.369 E.0323
G1 X79.584 Y102.915
G1 X79.947 Y103.278 E.01291
; WIPE_START
G1 F11668.197
M204 S6000
G1 X79.584 Y102.915 E-.19511
G1 X79.584 Y102.369 E-.20728
G1 X80.25 Y103.035 E-.35761
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.585 Y96.753 Z.86 F42000
G1 X89.504 Y89.627 Z.86
G1 Z.46
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.103077
G1 F9814
M204 S6000
G1 X89.391 Y89.474 E.00085
; LINE_WIDTH: 0.148013
G1 X89.278 Y89.321 E.00141
; LINE_WIDTH: 0.192949
G1 X89.165 Y89.168 E.00197
M204 S10000
G1 X88.885 Y88.462 F42000
; LINE_WIDTH: 0.103078
G1 F9814
M204 S6000
G1 X88.772 Y88.309 E.00085
; LINE_WIDTH: 0.148015
G1 X88.659 Y88.156 E.00141
; LINE_WIDTH: 0.192952
G1 X88.545 Y88.003 E.00197
M204 S10000
G1 X88.266 Y87.297 F42000
; LINE_WIDTH: 0.103078
G1 F9814
M204 S6000
G1 X88.152 Y87.145 E.00085
; LINE_WIDTH: 0.148015
G1 X88.039 Y86.992 E.00141
; LINE_WIDTH: 0.192952
G1 X87.926 Y86.839 E.00197
M204 S10000
G1 X87.646 Y86.133 F42000
; LINE_WIDTH: 0.103078
G1 F9814
M204 S6000
G1 X87.533 Y85.98 E.00085
; LINE_WIDTH: 0.148014
G1 X87.42 Y85.827 E.00141
; LINE_WIDTH: 0.192951
G1 X87.307 Y85.674 E.00197
M204 S10000
G1 X87.027 Y84.968 F42000
; LINE_WIDTH: 0.103079
G1 F9814
M204 S6000
G1 X86.914 Y84.815 E.00085
; LINE_WIDTH: 0.148018
G1 X86.801 Y84.662 E.00141
; LINE_WIDTH: 0.192957
G1 X86.688 Y84.509 E.00197
M204 S10000
G1 X86.408 Y83.803 F42000
; LINE_WIDTH: 0.100679
G1 F9814
M204 S6000
G1 X86.322 Y83.688 E.00062
; LINE_WIDTH: 0.140819
G1 X86.237 Y83.573 E.001
; LINE_WIDTH: 0.180959
G1 X86.152 Y83.457 E.00137
; LINE_WIDTH: 0.208228
G1 X86.068 Y83.345 E.00159
M204 S10000
G1 X85.789 Y82.639 F42000
; LINE_WIDTH: 0.103741
G1 F9814
M204 S6000
G1 X85.672 Y82.482 E.00088
; LINE_WIDTH: 0.150004
G1 X85.556 Y82.325 E.00147
; LINE_WIDTH: 0.196268
G1 X85.44 Y82.168 E.00206
M204 S10000
G1 X85.312 Y82.162 F42000
; LINE_WIDTH: 0.103076
G1 F9814
M204 S6000
G1 X85.199 Y82.009 E.00085
; LINE_WIDTH: 0.148009
G1 X85.086 Y81.857 E.00141
; LINE_WIDTH: 0.192942
G1 X84.973 Y81.704 E.00197
M204 S10000
G1 X84.693 Y80.998 F42000
; LINE_WIDTH: 0.103076
G1 F9814
M204 S6000
G1 X84.58 Y80.845 E.00085
; LINE_WIDTH: 0.148011
G1 X84.467 Y80.692 E.00141
; LINE_WIDTH: 0.192945
G1 X84.353 Y80.539 E.00197
; WIPE_START
G1 F18000
G1 X84.467 Y80.692 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.979 Y88.178 Z.86 F42000
M73 P59 R0
G1 X80.278 Y101.772 Z.86
G1 Z.46
G1 E.8 F1800
; LINE_WIDTH: 0.0918758
G1 F9814
M204 S6000
G1 X80.193 Y101.655 E.00054
G1 X80.165 Y101.675 E.00013
; WIPE_START
G1 F18000
G1 X80.193 Y101.655 E-.14788
G1 X80.278 Y101.772 E-.61212
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P60 R0
G1 X87.764 Y100.279 Z.86 F42000
G1 X94.458 Y98.944 Z.86
G1 Z.46
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9814
M204 S6000
G1 X94.345 Y98.791 E.00085
; LINE_WIDTH: 0.148013
G1 X94.232 Y98.638 E.00141
; LINE_WIDTH: 0.192949
G1 X94.119 Y98.485 E.00197
M204 S10000
G1 X93.839 Y97.78 F42000
; LINE_WIDTH: 0.103078
G1 F9814
M204 S6000
G1 X93.726 Y97.627 E.00085
; LINE_WIDTH: 0.148015
G1 X93.613 Y97.474 E.00141
; LINE_WIDTH: 0.192952
G1 X93.5 Y97.321 E.00197
M204 S10000
G1 X93.22 Y96.615 F42000
; LINE_WIDTH: 0.103076
G1 F9814
M204 S6000
G1 X93.107 Y96.462 E.00085
; LINE_WIDTH: 0.148011
G1 X92.993 Y96.309 E.00141
; LINE_WIDTH: 0.192945
G1 X92.88 Y96.156 E.00197
M204 S10000
G1 X92.6 Y95.45 F42000
; LINE_WIDTH: 0.104597
G1 F9814
M204 S6000
G1 X92.49 Y95.301 E.00085
; LINE_WIDTH: 0.150297
G1 X92.376 Y95.146 E.00146
; LINE_WIDTH: 0.193704
G1 X92.261 Y94.991 E.002
M204 S10000
G1 X91.981 Y94.286 F42000
; LINE_WIDTH: 0.103077
G1 F9814
M204 S6000
G1 X91.868 Y94.133 E.00085
; LINE_WIDTH: 0.148013
G1 X91.755 Y93.98 E.00141
; LINE_WIDTH: 0.192949
G1 X91.642 Y93.827 E.00197
M204 S10000
G1 X91.362 Y93.121 F42000
; LINE_WIDTH: 0.0981812
G1 F9814
M204 S6000
G1 X91.271 Y92.999 E.00063
; LINE_WIDTH: 0.133325
G1 X91.181 Y92.876 E.00098
; LINE_WIDTH: 0.168468
G1 X91.09 Y92.754 E.00133
M204 S10000
G1 X90.886 Y92.644 F42000
; LINE_WIDTH: 0.103077
G1 F9814
M204 S6000
G1 X90.772 Y92.492 E.00085
; LINE_WIDTH: 0.148012
G1 X90.659 Y92.339 E.00141
; LINE_WIDTH: 0.192948
G1 X90.546 Y92.186 E.00197
M204 S10000
G1 X90.266 Y91.48 F42000
; LINE_WIDTH: 0.103076
G1 F9814
M204 S6000
G1 X90.153 Y91.327 E.00085
; LINE_WIDTH: 0.148009
G1 X90.04 Y91.174 E.00141
; LINE_WIDTH: 0.192942
G1 X89.927 Y91.021 E.00197
; WIPE_START
G1 F18000
G1 X90.04 Y91.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I-.817 J.902 P1  F42000
G1 X100.271 Y100.432 Z.86
G1 Z.46
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F9814
M204 S5000
G1 X100.281 Y100.452 E.0005
G1 X99.997 Y100.603 E.00721
G1 X99.986 Y100.583 E.0005
G1 X100.218 Y100.46 E.00587
; WIPE_START
G1 F12000
M204 S6000
G1 X100.281 Y100.452 E-.07252
G1 X99.997 Y100.603 E-.36499
G1 X99.986 Y100.583 E-.02541
G1 X100.218 Y100.46 E-.29708
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.211 Y100.995 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F9814
M204 S5000
G1 X99.222 Y101.015 E.0005
G1 X98.407 Y101.448 E.02064
G1 X98.397 Y101.428 E.0005
G1 X99.158 Y101.023 E.0193
; WIPE_START
G1 F12000
M204 S6000
G1 X99.222 Y101.015 E-.02601
G1 X98.407 Y101.448 E-.37462
G1 X98.397 Y101.428 E-.00911
G1 X99.158 Y101.023 E-.35025
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.622 Y101.84 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F9814
M204 S5000
G1 X97.632 Y101.86 E.0005
G1 X97.348 Y102.011 E.00721
G1 X97.337 Y101.992 E.0005
G1 X97.569 Y101.868 E.00587
; CHANGE_LAYER
; Z_HEIGHT: 0.54
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F12000
M204 S6000
G1 X97.632 Y101.86 E-.07253
G1 X97.348 Y102.011 E-.36498
G1 X97.337 Y101.992 E-.02543
G1 X97.569 Y101.868 E-.29707
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/10
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.86 I.452 J-1.13 P1  F42000
G1 X96.14 Y101.297 Z.86
G1 Z.54
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F1361
M204 S6000
G1 X96.27 Y101.543 E.00366
G1 X96.049 Y101.543 E.00291
G1 X96.049 Y101.127 E.00547
G1 X95.605 Y100.291 E.01242
G1 X95.605 Y101.47 E.01547
G1 X95.532 Y101.543 E.00136
G1 X95.856 Y101.543 E.00426
; WIPE_START
G1 F9000
G1 X95.532 Y101.543 E-.12325
G1 X95.605 Y101.47 E-.03927
G1 X95.605 Y100.291 E-.4478
G1 X95.79 Y100.639 E-.14968
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.94 I1.049 J.617 P1  F42000
G1 X96.673 Y99.136 Z.94
G1 Z.54
G1 E.8 F1800
G1 F1361
M204 S6000
M73 P61 R0
G1 X96.935 Y99.629 E.00732
G1 X96.935 Y98.254 E.01805
; LAYER_HEIGHT: 0.24
G1 X96.935 Y95.771 E.08947
G1 X97.82 Y95.771 E.03191
G1 X97.82 Y98.254 E.08947
; LAYER_HEIGHT: 0.08
G1 X97.82 Y100.906 E.03482
G1 X98.706 Y100.435 E.01317
G1 X98.706 Y99.095 E.0176
G1 X98.19 Y98.125 E.01442
G1 X98.322 Y97.695 E.0059
G1 X98.706 Y97.491 E.00571
G1 X98.706 Y95.771 E.02258
G1 X99.592 Y95.771 E.01163
G1 X99.592 Y97.597 E.02397
G1 X99.502 Y97.428 E.00251
G1 X99.072 Y97.296 E.0059
G1 X98.876 Y97.4 E.00291
M204 S10000
G1 X96.742 Y95.771 F42000
; LAYER_HEIGHT: 0.24
G1 F1361
M204 S6000
G1 X96.049 Y95.771 E.02496
G1 X96.049 Y98.254 E.08947
; LAYER_HEIGHT: 0.08
G1 X96.049 Y98.903 E.00853
G1 X95.605 Y99.14 E.0066
G2 X95.399 Y98.657 I-.954 J.122 E.00698
G1 X95.621 Y98.657 E.00291
G1 X95.621 Y98.254 E.00529
; LAYER_HEIGHT: 0.24
G1 X95.621 Y95.771 E.08947
G1 X95.856 Y95.771 E.00849
; WIPE_START
G1 F8141.211
G1 X95.621 Y95.771 E-.08953
G1 X95.621 Y97.536 E-.67047
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.94 I1.203 J.185 P1  F42000
G1 X96.781 Y90 Z.94
G1 Z.54
G1 E.8 F1800
M73 P62 R0
G1 F1361
M204 S6000
G1 X98.506 Y90 E.06216
G1 X98.506 Y92.886 E.10398
G1 X96.007 Y92.886 E.09008
M204 S10000
G1 X95.163 Y93.059 F42000
; FEATURE: Support interface
G1 F1361
M204 S6000
G1 X95.163 Y90.515 E.09168
G1 X94.278 Y88.849 E.06798
G1 X94.278 Y92.886 E.14545
G1 X93.392 Y92.886 E.03191
G1 X93.355 Y87.114 E.20797
G1 X92.506 Y87.114 E.03058
G1 X92.506 Y92.886 E.20797
G1 X92.33 Y92.886 E.00635
G1 X91.621 Y91.551 E.05446
G1 X91.621 Y87.114 E.15989
G1 X90.735 Y87.114 E.03191
G1 X90.735 Y89.886 E.09987
M73 P63 R0
G1 X89.849 Y88.22 E.06798
G1 X89.849 Y86.941 E.0461
; WIPE_START
G1 F4800
G1 X89.849 Y88.22 E-.48616
G1 X90.188 Y88.856 E-.27384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.94 I1.213 J-.092 P1  F42000
G1 X89.849 Y84.402 Z.94
G1 Z.54
G1 E.8 F1800
G1 F1361
M204 S6000
G1 X89.849 Y80.521 E.13986
G1 X88.964 Y78.855 E.06798
G1 X88.964 Y84.229 E.19363
G1 X88.078 Y84.229 E.03191
G1 X88.078 Y77.529 E.24142
G1 X87.192 Y78 E.03614
G1 X87.192 Y83.223 E.1882
M73 P64 R0
G1 X86.307 Y81.557 E.06798
G1 X86.307 Y78.471 E.11122
G1 X85.421 Y78.942 E.03614
G1 X85.421 Y80.261 E.04755
; WIPE_START
G1 F4800
G1 X85.421 Y78.942 E-.50143
G1 X86.022 Y78.622 E-.25857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.94 I-1.001 J.692 P1  F42000
G1 X101.054 Y100.347 Z.94
G1 Z.54
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.08
G1 F1361
M204 S6000
G1 X100.477 Y99.262 E.01614
G1 X100.477 Y95.771 E.04584
G1 X101.363 Y95.771 E.01163
G1 X101.363 Y101.543 E.07578
G1 X100.477 Y101.543 E.01163
G1 X100.477 Y101.176 E.00482
G1 X99.787 Y101.543 E.01026
G1 X100.284 Y101.543 E.00653
; WIPE_START
M73 P65 R0
G1 F9000
G1 X99.787 Y101.543 E-.189
G1 X100.477 Y101.176 E-.29705
G1 X100.477 Y101.543 E-.13946
G1 X100.831 Y101.543 E-.13449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.94 I-.559 J-1.081 P1  F42000
G1 X95.621 Y104.235 Z.94
G1 Z.54
G1 E.8 F1800
G1 F1361
M204 S6000
G1 X95.621 Y101.928 E.03029
G1 X96.51 Y101.928 E.01167
G1 X96.896 Y102.72 E.01156
G1 X97.326 Y102.852 E.0059
G1 X98.506 Y102.224 E.01755
G1 X98.506 Y104.428 E.02894
G1 X95.621 Y104.428 E.03789
; WIPE_START
G1 F9000
G1 X97.621 Y104.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.94 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 0.62
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 5/10
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
G1 X84.685 Y80.065
G1 Z.62
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
; LAYER_HEIGHT: 0.16
G1 F1361
M204 S5000
G1 X85.61 Y81.805 E.04411
G1 X85.634 Y81.851 E.00115
G1 X85.438 Y81.955 E.00498
G1 X84.488 Y80.169 E.04525
G1 X84.632 Y80.093 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X85.61 Y81.805 E-.74941
G1 X85.623 Y81.83 E-.0106
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I.925 J.791 P1  F42000
G1 X89.168 Y77.681 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F1361
M204 S5000
G1 X89.364 Y77.577 E.00498
M73 P66 R0
G1 X90.314 Y79.362 E.04525
G1 X90.117 Y79.467 E.00498
G1 X89.196 Y77.734 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X89.364 Y77.577 E-.08755
G1 X90.195 Y79.139 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.778 Y85.878 Z1.02 F42000
G1 X95.804 Y89.688 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F1361
M204 S5000
G1 X95.81 Y89.699 E.00028
G1 X95.948 Y89.958 E.00655
G1 X95.751 Y90.062 E.00498
G1 X94.802 Y88.277 E.04525
G1 X94.998 Y88.172 E.00498
G1 X95.776 Y89.635 E.03708
; WIPE_START
G1 F12000
M204 S6000
G1 X95.81 Y89.699 E-.02759
G1 X95.948 Y89.958 E-.11119
G1 X95.751 Y90.062 E-.08453
G1 X95.088 Y88.815 E-.53669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-.439 J-1.135 P1  F42000
G1 X90.318 Y90.66 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F1361
M204 S5000
G1 X91.244 Y92.401 E.04411
G1 X91.268 Y92.446 E.00115
G1 X91.071 Y92.55 E.00498
G1 X90.122 Y90.765 E.04525
G1 X90.265 Y90.688 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X91.244 Y92.401 E-.74941
G1 X91.257 Y92.425 E-.01059
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.497 Y99.336 Z1.02 F42000
G1 X94.673 Y99.711 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F1361
M204 S5000
G1 X94.451 Y99.711 E.00498
G1 X94.451 Y99.489 E.00498
G1 X94.673 Y99.489 E.00498
G1 X94.673 Y99.651 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X94.451 Y99.711 E-.20902
G1 X94.451 Y99.489 E-.20181
G1 X94.673 Y99.489 E-.20181
G1 X94.673 Y99.651 E-.14737
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-.726 J.977 P1  F42000
G1 X97.62 Y101.841 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F1361
M204 S5000
G1 X97.63 Y101.861 E.0005
G1 X97.348 Y102.011 E.00716
G1 X97.337 Y101.992 E.0005
G1 X97.567 Y101.869 E.00582
M204 S250
M73 P67 R0
G1 X98.398 Y101.427 F42000
G1 F1361
M204 S5000
G1 X99.21 Y100.996 E.02057
G1 X99.22 Y101.016 E.0005
G1 X98.442 Y101.43 E.01973
; WIPE_START
G1 F12000
M204 S6000
G1 X99.21 Y100.996 E-.37528
G1 X99.22 Y101.016 E-.00956
G1 X98.442 Y101.43 E-.37516
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.271 Y100.432 Z1.02 F42000
G1 Z.62
G1 E.8 F1800
G1 F1361
M204 S5000
G1 X100.281 Y100.452 E.0005
G1 X99.998 Y100.602 E.00717
G1 X99.988 Y100.582 E.0005
G1 X100.218 Y100.46 E.00583
; WIPE_START
G1 F12000
M204 S6000
G1 X100.281 Y100.452 E-.07291
G1 X99.998 Y100.602 E-.36491
G1 X99.988 Y100.582 E-.02556
G1 X100.218 Y100.46 E-.29662
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
; layer num/total_layer_count: 6/10
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
G1 X99.472 Y101.514 F42000
G1 Z.78
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F1474
M204 S6000
G1 X101.392 Y101.514 E.06919
G1 X101.392 Y100.628 E.03191
G1 X101.074 Y100.628 E.01147
G2 X101.06 Y100.358 I-.142 J-.128 E.01082
G1 X100.733 Y99.742 E.02512
G1 X101.392 Y99.742 E.02377
G1 X101.392 Y98.857 E.03191
G1 X100.262 Y98.857 E.04074
G1 X99.791 Y97.971 E.03614
G1 X101.392 Y97.971 E.05771
G1 X101.392 Y97.085 E.03191
G1 X95.62 Y97.085 E.20798
G1 X95.62 Y96.2 E.03191
G1 X101.566 Y96.2 E.21423
; WIPE_START
G1 F4800
G1 X99.566 Y96.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I-1.022 J-.661 P1  F42000
G1 X98.419 Y97.971 Z1.18
G1 Z.78
M73 P68 R0
G1 E.8 F1800
G1 F1474
M204 S6000
G1 X95.62 Y97.971 E.10084
G1 X95.62 Y98.657 E.02471
G1 X95.229 Y98.657 E.01412
G1 X95.335 Y98.857 E.00816
G1 X98.579 Y98.857 E.11691
G1 X99.05 Y99.742 E.03614
G1 X96.995 Y99.742 E.07406
G1 X97.466 Y100.628 E.03614
G1 X98.714 Y100.628 E.04496
; WIPE_START
G1 F4800
G1 X97.466 Y100.628 E-.4741
G1 X97.113 Y99.964 E-.28591
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I-1.119 J-.478 P1  F42000
G1 X96.451 Y101.514 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F1474
M204 S6000
G1 X95.349 Y101.514 E.03972
G1 X95.455 Y101.408 E.0054
G1 X95.455 Y100.628 E.0281
G1 X95.98 Y100.628 E.01894
; WIPE_START
G1 F4800
G1 X95.455 Y100.628 E-.19973
G1 X95.455 Y101.408 E-.2963
G1 X95.349 Y101.514 E-.05693
G1 X95.894 Y101.514 E-.20705
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I1.217 J.016 P1  F42000
G1 X96.007 Y92.886 Z1.18
G1 Z.78
G1 E.8 F1800
; FEATURE: Support
G1 F1474
M204 S6000
G1 X98.506 Y92.886 E.09008
G1 X98.506 Y90 E.10398
G1 X96.781 Y90 E.06216
; WIPE_START
G1 F8141.211
G1 X98.506 Y90 E-.6555
M73 P69 R0
G1 X98.506 Y90.275 E-.1045
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I.648 J-1.03 P1  F42000
G1 X93.843 Y87.343 Z1.18
G1 Z.78
G1 E.8 F1800
; FEATURE: Support interface
G1 F1474
M204 S6000
G1 X89.849 Y87.343 E.14392
G1 X89.849 Y88.229 E.03191
G1 X93.97 Y88.229 E.14848
G1 X94.419 Y89.114 E.03578
G1 X90.155 Y89.114 E.15364
G1 X90.567 Y89.89 E.03165
G3 X90.796 Y90 I-.007 J.307 E.00942
G1 X94.89 Y90 E.14752
G1 X95.299 Y90.771 E.03146
G1 X95.621 Y90.869 E.01211
G1 X91.267 Y90.886 E.1569
G1 X91.738 Y91.771 E.03614
G1 X95.621 Y91.771 E.13993
G1 X95.621 Y92.657 E.03191
G1 X91.869 Y92.657 E.13521
; WIPE_START
M73 P70 R0
G1 F4800
G1 X93.869 Y92.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I1.116 J-.485 P1  F42000
G1 X90.023 Y83.8 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F1474
M204 S6000
G1 X87.329 Y83.8 E.09707
G1 X86.858 Y82.915 E.03614
G1 X89.85 Y82.915 E.10778
G1 X89.85 Y82.029 E.03191
G1 X86.426 Y82.029 E.12335
G1 X86.474 Y81.872 E.0059
G1 X86.087 Y81.143 E.02975
G1 X90.35 Y81.143 E.15364
G1 X89.879 Y80.258 E.03614
G1 X85.616 Y80.258 E.15364
G1 X85.145 Y79.372 E.03614
G1 X89.239 Y79.372 E.14752
G1 X88.768 Y78.486 E.03614
G1 X85.958 Y78.486 E.10126
M73 P71 R0
G1 X86.963 Y78.457 E.03626
G1 X86.963 Y77.952 E.01821
G1 X87.623 Y77.601 E.02693
G1 X88.527 Y77.601 E.03258
; WIPE_START
G1 F4800
G1 X87.623 Y77.601 E-.34357
G1 X86.963 Y77.952 E-.28398
G1 X86.963 Y78.3 E-.13245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I-.745 J-.962 P1  F42000
G1 X84.685 Y80.065 Z1.18
G1 Z.78
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
; LAYER_HEIGHT: 0.16
G1 F1474
M204 S5000
G1 X85.634 Y81.851 E.04525
G1 X85.438 Y81.955 E.00498
G1 X84.488 Y80.169 E.04525
G1 X84.632 Y80.093 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X85.623 Y81.83 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I.925 J.791 P1  F42000
G1 X89.168 Y77.681 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F1474
M204 S5000
G1 X89.364 Y77.577 E.00498
G1 X90.121 Y78.999 E.03605
G1 X90.314 Y79.362 E.0092
G1 X90.117 Y79.467 E.00498
G1 X89.196 Y77.734 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X89.364 Y77.577 E-.08755
G1 X90.121 Y78.999 E-.61226
G1 X90.195 Y79.139 E-.06019
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.778 Y85.878 Z1.18 F42000
G1 X95.948 Y89.958 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F1474
M204 S5000
G1 X95.751 Y90.062 E.00498
G1 X94.802 Y88.277 E.04525
G1 X94.998 Y88.172 E.00498
G1 X95.621 Y89.343 E.02967
G1 X95.919 Y89.905 E.01424
; WIPE_START
G1 F12000
M204 S6000
M73 P72 R0
G1 X95.751 Y90.062 E-.08755
G1 X94.92 Y88.5 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I-.893 J-.827 P1  F42000
G1 X91.268 Y92.446 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F1474
M204 S5000
G1 X91.071 Y92.55 E.00498
G1 X90.122 Y90.765 E.04525
G1 X90.318 Y90.66 E.00498
G1 X91.24 Y92.393 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X91.071 Y92.55 E-.08755
G1 X90.241 Y90.988 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.698 Y97.792 Z1.18 F42000
G1 X94.673 Y99.711 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F1474
M204 S5000
G1 X94.451 Y99.711 E.00498
G1 X94.451 Y99.489 E.00498
G1 X94.673 Y99.489 E.00498
G1 X94.673 Y99.651 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X94.451 Y99.711 E-.20902
G1 X94.451 Y99.489 E-.20181
G1 X94.673 Y99.489 E-.20181
G1 X94.673 Y99.651 E-.14737
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I-.719 J.982 P1  F42000
G1 X97.665 Y101.843 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F1474
M204 S5000
G1 X97.348 Y102.011 E.00803
G1 X97.319 Y101.957 E.00137
M106 S255
G1 F600
G1 X97.155 Y101.648 E.00783
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X96.117 Y99.696 E.05992
G1 X96.136 Y99.685 E.00061
G1 X97.174 Y101.638 E.05992
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
M106 S255
G1 X97.339 Y101.947 E.00783
M106 S201.45
G1 F739.217
G1 X97.357 Y101.981 E.00087
G1 F1406.492
G1 X97.654 Y101.823 E.00753
G1 F1474
G1 X97.702 Y101.797 E.00122
G1 X97.71 Y101.812 E.00038
; WIPE_START
G1 F1646.899
M204 S6000
G1 X97.348 Y102.011 E-.15718
G1 X97.319 Y101.957 E-.0233
G1 X97.155 Y101.648 E-.13296
G1 X96.603 Y100.611 E-.44656
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P73 R0
G1 X100.233 Y100.408 Z1.18 F42000
G1 Z.78
G1 E.8 F1800
M106 S255
G1 F600
M204 S5000
G1 X100.068 Y100.099 E.00783
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X99.03 Y98.147 E.05992
G1 X99.05 Y98.136 E.00061
G1 X100.088 Y100.088 E.05992
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
M106 S255
G1 X100.253 Y100.397 E.00783
M106 S201.45
G1 F826.206
G1 X100.281 Y100.452 E.00137
G1 F1474
G1 X99.964 Y100.62 E.00804
G1 X99.916 Y100.646 E.00123
G1 X99.905 Y100.626 E.0005
G1 X99.953 Y100.601 E.00123
G1 X100.232 Y100.452 E.00707
; WIPE_START
G1 F4652.768
M204 S6000
G1 X100.068 Y100.099 E-.14796
G1 X99.312 Y98.677 E-.61204
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.315 Y101.471 Z1.18 F42000
G1 Z.78
G1 E.8 F1800
G1 F1474
M204 S5000
G1 X98.364 Y101.446 E.00123
G1 X98.717 Y101.258 E.00895
G1 X99.244 Y100.978 E.01336
G1 X99.292 Y100.952 E.00123
G1 X99.303 Y100.972 E.0005
G1 X99.254 Y100.998 E.00123
G1 X98.901 Y101.185 E.00895
G1 X98.374 Y101.466 E.01336
G1 X98.359 Y101.474 E.00038
; WIPE_START
G1 F6120
M204 S6000
G1 X98.364 Y101.446 E-.01074
G1 X98.717 Y101.258 E-.152
G1 X99.244 Y100.978 E-.22683
G1 X99.292 Y100.952 E-.02081
G1 X99.303 Y100.972 E-.00853
G1 X99.254 Y100.998 E-.02081
G1 X98.901 Y101.185 E-.152
G1 X98.51 Y101.393 E-.1683
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
; layer num/total_layer_count: 7/10
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S204
; OBJECT_ID: 15
G1 X100.477 Y101.716 F42000
G1 Z.94
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F1200
M204 S6000
G1 X100.477 Y100.979 E.01853
; WIPE_START
G1 F4800
G1 X100.477 Y101.716 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I0 J1.217 P1  F42000
G1 X101.363 Y101.716 Z1.34
G1 Z.94
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X101.363 Y95.771 E.14947
G1 X100.477 Y95.771 E.02227
G1 X100.477 Y99.262 E.08776
M73 P74 R0
G1 X99.592 Y97.596 E.04743
G1 X99.592 Y95.771 E.04589
G1 X98.706 Y95.771 E.02227
G1 X98.706 Y97.491 E.04323
G1 X98.322 Y97.695 E.01094
G1 X98.19 Y98.125 E.0113
G1 X98.706 Y99.095 E.02762
G1 X98.706 Y100.435 E.0337
G1 X97.82 Y100.906 E.02522
G1 X97.82 Y95.771 E.1291
G1 X96.935 Y95.771 E.02227
G1 X96.935 Y99.629 E.09698
G1 X96.588 Y98.977 E.01856
G1 X96.158 Y98.845 E.0113
G1 X96.049 Y98.903 E.00311
M73 P75 R0
G1 X96.049 Y95.771 E.07875
G1 X95.621 Y95.771 E.01077
G1 X95.621 Y98.657 E.07255
G1 X95.163 Y98.657 E.01149
G1 X95.163 Y99.079 E.01062
; WIPE_START
G1 F4800
G1 X95.163 Y98.657 E-.16046
G1 X95.621 Y98.657 E-.17374
G1 X95.621 Y97.536 E-.42581
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I-1.211 J.124 P1  F42000
G1 X96.049 Y101.716 Z1.34
G1 Z.94
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X96.049 Y101.127 E.01482
G1 X95.405 Y99.915 E.03449
G3 X95.265 Y100.265 I-.245 J.105 E.01051
G1 X95.265 Y101.448 E.02974
G1 X95.163 Y101.448 E.00255
G1 X95.163 Y101.543 E.00239
G1 X94.278 Y101.543 E.02227
G1 X94.278 Y101.448 E.00239
G1 X93.392 Y101.448 E.02227
G1 X93.392 Y101.716 E.00675
; WIPE_START
G1 F4800
G1 X93.392 Y101.448 E-.10207
G1 X94.278 Y101.448 E-.33655
G1 X94.278 Y101.543 E-.03612
G1 X95.028 Y101.543 E-.28526
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I1.184 J-.28 P1  F42000
G1 X89.364 Y77.577 Z1.34
G1 Z.94
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F1200
M204 S5000
G1 X89.895 Y78.576 E.02531
G1 X90.314 Y79.362 E.01994
G1 X90.117 Y79.467 E.00498
G1 X89.168 Y77.681 E.04525
G1 X89.311 Y77.605 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X89.895 Y78.576 E-.43047
G1 X90.303 Y79.341 E-.32953
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I-.166 J-1.206 P1  F42000
M73 P76 R0
G1 X84.709 Y80.11 Z1.34
G1 Z.94
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X85.634 Y81.851 E.04411
G1 X85.438 Y81.955 E.00498
G1 X84.488 Y80.169 E.04525
G1 X84.677 Y80.069 E.00478
; WIPE_START
G1 F12000
M204 S6000
G1 X85.624 Y81.831 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.207 Y88.57 Z1.34 F42000
G1 X91.268 Y92.446 Z1.34
G1 Z.94
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X91.071 Y92.55 E.00498
G1 X90.122 Y90.765 E.04525
G1 X90.318 Y90.66 E.00498
G1 X90.342 Y90.706 E.00115
G1 X91.24 Y92.393 E.04276
; WIPE_START
G1 F12000
M204 S6000
G1 X91.071 Y92.55 E-.08756
G1 X90.241 Y90.988 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I.216 J1.198 P1  F42000
G1 X95.948 Y89.958 Z1.34
G1 Z.94
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X95.751 Y90.062 E.00498
G1 X94.802 Y88.277 E.04525
G1 X94.998 Y88.172 E.00498
G1 X95.431 Y88.986 E.02063
G1 X95.919 Y89.905 E.02328
; WIPE_START
G1 F12000
M204 S6000
G1 X95.751 Y90.062 E-.08755
G1 X94.92 Y88.5 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I-1.21 J.132 P1  F42000
G1 X96.136 Y99.685 Z1.34
G1 Z.94
G1 E.8 F1800
G1 F1200
M204 S5000
M73 P77 R0
G1 X96.981 Y101.275 E.04027
G1 X97.169 Y101.628 E.00895
G1 X97.357 Y101.981 E.00895
G1 X97.737 Y101.779 E.00962
M106 S255
G1 F600
G1 X98.281 Y101.49 E.01379
M106 S204
G1 F1200
G1 X98.634 Y101.302 E.00895
G1 X98.987 Y101.114 E.00895
G1 X99.327 Y100.934 E.0086
M106 S255
G1 F600
G1 X99.871 Y100.644 E.01379
M106 S204
G1 F1200
G1 X100.251 Y100.442 E.00964
G1 X100.063 Y100.089 E.00895
G1 X99.875 Y99.736 E.00895
G1 X99.03 Y98.147 E.04028
G1 X99.05 Y98.136 E.0005
G1 X99.091 Y98.213 E.00194
G1 X99.906 Y99.745 E.03884
G1 X100.094 Y100.098 E.00895
G1 X100.281 Y100.452 E.00895
G1 X99.881 Y100.664 E.01014
M106 S255
G1 F600
G1 X99.337 Y100.954 E.01379
M106 S204
G1 F1200
G1 X98.984 Y101.141 E.00895
G1 X98.631 Y101.329 E.00895
G1 X98.292 Y101.509 E.0086
M106 S255
G1 F600
G1 X97.747 Y101.799 E.01379
M106 S204
G1 F1200
G1 X97.348 Y102.011 E.01012
G1 X97.16 Y101.658 E.00895
G1 X96.972 Y101.305 E.00895
G1 X96.134 Y99.729 E.03994
; WIPE_START
G1 F12000
M204 S6000
G1 X96.981 Y101.275 E-.66977
G1 X97.093 Y101.484 E-.09023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I.719 J-.982 P1  F42000
G1 X94.673 Y99.711 Z1.34
G1 Z.94
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X94.451 Y99.711 E.00498
G1 X94.451 Y99.489 E.00498
G1 X94.673 Y99.489 E.00498
G1 X94.673 Y99.651 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X94.451 Y99.711 E-.20902
G1 X94.451 Y99.489 E-.20181
G1 X94.673 Y99.489 E-.20181
G1 X94.673 Y99.651 E-.14737
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

; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 8/10
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
G1 X89.743 Y79.188 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
M73 P78 R0
G1 F600
M204 S6000
G1 X89.576 Y79.277 E.00513
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X85.779 Y81.296 E.11652
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X85.612 Y81.385 E.00513
M106 S204
M106 S255
G1 X85.059 Y80.344 E.03194
M106 S204
M106 S255
G1 X85.226 Y80.255 E.00513
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X89.023 Y78.236 E.11652
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X89.19 Y78.147 E.00513
M106 S204
M106 S255
G1 X89.298 Y78.35 E.00621
M106 S204
M106 S255
G1 X89.715 Y79.135 E.0241
M106 S204
M204 S250
G1 X90.285 Y79.354 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X90.09 Y79.457 E.00556
M106 S255
G1 F600
G1 X89.764 Y79.631 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X85.968 Y81.649 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
G1 X85.642 Y81.823 E.00928
G1 F1200
G1 X85.447 Y81.926 E.00556
G1 X85.259 Y81.573 E.01006
G1 X85.071 Y81.22 E.01006
G1 X84.883 Y80.867 E.01006
G1 X84.705 Y80.531 E.00956
G1 X84.517 Y80.178 E.01006
G1 X84.712 Y80.074 E.00556
M106 S255
G1 F600
G1 X85.038 Y79.901 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X88.835 Y77.882 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X89.16 Y77.709 E.00928
M106 S204
G1 F1200
G1 X89.356 Y77.605 E.00556
G1 X89.543 Y77.959 E.01006
G1 X89.651 Y78.162 E.00578
G1 X89.839 Y78.515 E.01006
G1 X90.257 Y79.301 E.02238
; WIPE_START
G1 F11668.197
M204 S6000
G1 X90.09 Y79.457 E-.08702
G1 X89.764 Y79.631 E-.14022
G1 X88.526 Y80.289 E-.53276
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

G1 X89.423 Y78.941
G1 Z1.1
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.475946
M106 S255
G1 F3000
M204 S6000
G1 X85.74 Y80.899 E.12008
G1 X85.533 Y80.509 E.01271
G1 X89.216 Y78.551 E.12008
M106 S204
; WIPE_START
G1 X87.45 Y79.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P79 R0
G3 Z1.5 I-.964 J.743 P1  F42000
G1 X95.377 Y89.783 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S6000
G1 X95.21 Y89.872 E.00513
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X91.413 Y91.891 E.11652
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X91.246 Y91.98 E.00513
M106 S204
M106 S255
G1 X90.693 Y90.939 E.03194
M106 S204
M106 S255
G1 X90.86 Y90.85 E.00513
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X94.656 Y88.832 E.11652
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X94.824 Y88.743 E.00513
M106 S204
M106 S255
G1 X95.349 Y89.73 E.03031
M106 S204
M204 S250
G1 X95.919 Y89.949 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X95.724 Y90.053 E.00556
M106 S255
G1 F600
G1 X95.398 Y90.226 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X91.601 Y92.245 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X91.275 Y92.418 E.00928
M106 S204
G1 F1200
G1 X91.08 Y92.522 E.00556
G1 X90.892 Y92.169 E.01006
G1 X90.705 Y91.815 E.01006
G1 X90.517 Y91.462 E.01006
G1 X90.338 Y91.127 E.00956
G1 X90.151 Y90.774 E.01006
G1 X90.346 Y90.67 E.00556
G1 F720
G1 X90.672 Y90.497 E.00928
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X94.468 Y88.478 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X94.794 Y88.305 E.00928
M106 S204
G1 F1200
G1 X94.989 Y88.201 E.00556
G1 X95.223 Y88.64 E.01249
G1 X95.41 Y88.993 E.01006
G1 X95.598 Y89.346 E.01006
G1 X95.891 Y89.896 E.01567
M204 S10000
G1 X95.056 Y89.536 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.475946
M106 S255
G1 F3000
M204 S6000
G1 X91.374 Y91.495 E.12008
G1 X91.166 Y91.105 E.01271
G1 X94.849 Y89.147 E.12008
M106 S204
; WIPE_START
M73 P80 R0
G1 X93.083 Y90.085 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.98 J.722 P1  F42000
G1 X99.041 Y98.166 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F1200
M204 S5000
G1 X99.03 Y98.147 E.0005
G1 X99.037 Y98.143 E.00016
; WIPE_START
G1 F12000
M204 S6000
G1 X99.03 Y98.147 E-.38
G1 X99.037 Y98.143 E-.38
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.571 J-1.075 P1  F42000
G1 X96.136 Y99.685 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X96.147 Y99.705 E.0005
G1 X96.14 Y99.709 E.00016
; WIPE_START
G1 F12000
M204 S6000
G1 X96.147 Y99.705 E-.38
G1 X96.14 Y99.709 E-.38
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.002 J-1.217 P1  F42000
G1 X94.451 Y99.711 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X94.451 Y99.489 E.00498
G1 X94.673 Y99.489 E.00498
G1 X94.673 Y99.711 E.00498
G1 X94.511 Y99.711 E.00363
; CHANGE_LAYER
; Z_HEIGHT: 1.26
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X94.451 Y99.489 E-.20902
G1 X94.673 Y99.489 E-.20181
G1 X94.673 Y99.711 E-.20181
G1 X94.511 Y99.711 E-.14737
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/10
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.5 I1.192 J-.247 P1  F42000
G1 X90.285 Y79.354 Z1.5
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.447 Y81.926 E.13778
G1 X84.517 Y80.178 E.04978
G1 X89.356 Y77.605 E.13778
G1 X89.426 Y77.738 E.00377
G1 X90.257 Y79.301 E.0445
; WIPE_START
M73 P81 R0
G1 F11668.197
M204 S6000
G1 X88.501 Y80.259 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X88.726 Y79.942
G1 Z1.26
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X89.791 Y78.877 E.03788
G1 X89.602 Y78.521
G1 X87.561 Y80.562 E.07256
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.976 Y79.148 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-.754 J-.956 P1  F42000
G1 X86.397 Y81.181 Z1.66
G1 Z1.26
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X89.413 Y78.165 E.10724
G1 X88.995 Y78.038
G1 X85.485 Y81.547 E.12478
G1 X85.296 Y81.191
G1 X87.83 Y78.657 E.09011
; WIPE_START
G1 F11668.197
M204 S6000
G1 X86.416 Y80.071 E-.76
; WIPE_END
M73 P82 R0
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I1.161 J.364 P1  F42000
G1 X86.665 Y79.276 Z1.66
G1 Z1.26
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X85.107 Y80.835 E.05543
G1 X84.917 Y80.479
G1 X85.501 Y79.895 E.02075
; WIPE_START
G1 F11668.197
M204 S6000
G1 X84.917 Y80.479 E-.3136
G1 X85.107 Y80.835 E-.15325
G1 X85.652 Y80.289 E-.29316
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.308 J1.177 P1  F42000
G1 X89.964 Y79.16 Z1.66
G1 Z1.26
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.236584
G1 F1200
M204 S6000
G1 X89.815 Y79.27 E.00244
; LINE_WIDTH: 0.192019
G1 X89.667 Y79.38 E.0019
; LINE_WIDTH: 0.147455
G1 X89.518 Y79.49 E.00136
; LINE_WIDTH: 0.102891
G1 X89.369 Y79.6 E.00083
; WIPE_START
G1 F18000
G1 X89.518 Y79.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.839 J-.882 P1  F42000
G1 X88.352 Y78.38 Z1.66
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.103076
G1 F1200
M204 S6000
G1 X88.199 Y78.493 E.00085
; LINE_WIDTH: 0.148009
G1 X88.046 Y78.606 E.00141
; LINE_WIDTH: 0.192943
G1 X87.893 Y78.719 E.00197
M204 S10000
G1 X87.187 Y78.999 F42000
; LINE_WIDTH: 0.103077
G1 F1200
M204 S6000
G1 X87.034 Y79.112 E.00085
; LINE_WIDTH: 0.148013
G1 X86.881 Y79.226 E.00141
; LINE_WIDTH: 0.192949
G1 X86.728 Y79.339 E.00197
M204 S10000
G1 X86.022 Y79.619 F42000
; LINE_WIDTH: 0.103077
G1 F1200
M204 S6000
G1 X85.869 Y79.732 E.00085
; LINE_WIDTH: 0.148013
G1 X85.716 Y79.845 E.00141
; LINE_WIDTH: 0.192949
G1 X85.563 Y79.958 E.00197
; WIPE_START
G1 F18000
G1 X85.716 Y79.845 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-1.095 J.531 P1  F42000
G1 X86.334 Y81.118 Z1.66
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.192949
G1 F1200
M204 S6000
G1 X86.181 Y81.231 E.00197
; LINE_WIDTH: 0.148013
G1 X86.028 Y81.345 E.00141
; LINE_WIDTH: 0.103077
G1 X85.875 Y81.458 E.00085
; WIPE_START
G1 F18000
G1 X86.028 Y81.345 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.607 J1.055 P1  F42000
G1 X87.499 Y80.499 Z1.66
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.192958
G1 F1200
M204 S6000
G1 X87.346 Y80.612 E.00197
; LINE_WIDTH: 0.148019
G1 X87.193 Y80.725 E.00141
; LINE_WIDTH: 0.10308
G1 X87.04 Y80.839 E.00085
; WIPE_START
G1 F18000
M73 P83 R0
G1 X87.193 Y80.725 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.607 J1.055 P1  F42000
G1 X88.663 Y79.88 Z1.66
M73 P85 R0
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.192957
G1 F1200
M204 S6000
G1 X88.51 Y79.993 E.00197
; LINE_WIDTH: 0.148018
G1 X88.358 Y80.106 E.00141
; LINE_WIDTH: 0.103079
G1 X88.205 Y80.219 E.00085
; WIPE_START
G1 F18000
G1 X88.358 Y80.106 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-.965 J.741 P1  F42000
G1 X95.919 Y89.949 Z1.66
G1 Z1.26
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X91.08 Y92.522 E.13778
G1 X90.151 Y90.774 E.04978
G1 X94.989 Y88.201 E.13778
G1 X95.033 Y88.283 E.00234
G1 X95.891 Y89.896 E.04594
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.135 Y90.854 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.823 J.896 P1  F42000
G1 X94.644 Y90.387 Z1.66
G1 Z1.26
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X95.471 Y89.559 E.02942
G1 X95.282 Y89.203
G1 X93.479 Y91.006 E.0641
; WIPE_START
G1 F11668.197
M204 S6000
M73 P86 R0
G1 X94.894 Y89.592 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-.754 J-.956 P1  F42000
G1 X92.315 Y91.625 Z1.66
G1 Z1.26
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X95.093 Y88.847 E.09877
G1 X94.903 Y88.491
G1 X91.165 Y92.229 E.13292
G1 X90.976 Y91.873
G1 X93.748 Y89.101 E.09857
; WIPE_START
G1 F11668.197
M204 S6000
G1 X92.334 Y90.515 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I1.161 J.364 P1  F42000
G1 X92.583 Y89.72 Z1.66
G1 Z1.26
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X90.786 Y91.517 E.06389
G1 X90.597 Y91.161
G1 X91.419 Y90.34 E.02921
; WIPE_START
G1 F11668.197
M204 S6000
G1 X90.597 Y91.161 E-.44153
G1 X90.786 Y91.517 E-.15324
G1 X91.094 Y91.21 E-.16522
; WIPE_END
M73 P87 R0
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-.355 J1.164 P1  F42000
G1 X92.252 Y91.562 Z1.66
G1 Z1.26
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192948
G1 F1200
M204 S6000
G1 X92.099 Y91.676 E.00197
; LINE_WIDTH: 0.148012
G1 X91.946 Y91.789 E.00141
; LINE_WIDTH: 0.103077
G1 X91.793 Y91.902 E.00085
; WIPE_START
G1 F18000
G1 X91.946 Y91.789 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.607 J1.055 P1  F42000
G1 X93.417 Y90.943 Z1.66
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.192943
G1 F1200
M204 S6000
G1 X93.264 Y91.056 E.00197
; LINE_WIDTH: 0.14801
G1 X93.111 Y91.17 E.00141
; LINE_WIDTH: 0.103076
G1 X92.958 Y91.283 E.00085
; WIPE_START
G1 F18000
G1 X93.111 Y91.17 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.607 J1.055 P1  F42000
G1 X94.581 Y90.324 Z1.66
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.192943
G1 F1200
M204 S6000
G1 X94.428 Y90.437 E.00197
; LINE_WIDTH: 0.14801
G1 X94.275 Y90.55 E.00141
; LINE_WIDTH: 0.103076
G1 X94.123 Y90.663 E.00085
; WIPE_START
G1 F18000
G1 X94.275 Y90.55 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.594 J1.062 P1  F42000
G1 X95.62 Y89.798 Z1.66
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.1515
G1 F1200
M204 S6000
G1 X95.454 Y89.921 E.00158
; LINE_WIDTH: 0.10424
G1 X95.287 Y90.044 E.00094
; WIPE_START
G1 F18000
G1 X95.454 Y89.921 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.827 J-.893 P1  F42000
G1 X94.269 Y88.824 Z1.66
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F1200
M204 S6000
G1 X94.117 Y88.937 E.00085
; LINE_WIDTH: 0.148013
G1 X93.964 Y89.051 E.00141
; LINE_WIDTH: 0.192949
G1 X93.811 Y89.164 E.00197
M204 S10000
G1 X93.105 Y89.444 F42000
; LINE_WIDTH: 0.103078
G1 F1200
M204 S6000
G1 X92.952 Y89.557 E.00085
; LINE_WIDTH: 0.148014
G1 X92.799 Y89.67 E.00141
; LINE_WIDTH: 0.192951
G1 X92.646 Y89.783 E.00197
M204 S10000
G1 X91.94 Y90.063 F42000
; LINE_WIDTH: 0.103078
G1 F1200
M204 S6000
G1 X91.787 Y90.176 E.00085
; LINE_WIDTH: 0.148014
G1 X91.634 Y90.289 E.00141
; LINE_WIDTH: 0.192951
G1 X91.481 Y90.402 E.00197
M204 S10000
G1 X90.775 Y90.682 F42000
; LINE_WIDTH: 0.103737
G1 F1200
M204 S6000
G1 X90.612 Y90.803 E.00092
; LINE_WIDTH: 0.149991
G1 X90.449 Y90.924 E.00153
; WIPE_START
G1 F18000
G1 X90.612 Y90.803 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.653 Y97.804 Z1.66 F42000
G1 X94.472 Y99.69 Z1.66
G1 Z1.26
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X94.472 Y99.51 E.00453
G1 X94.693 Y99.51 E.00556
M106 S255
G1 F600
G1 X95.062 Y99.51 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X95.638 Y99.51 E.0156
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X96.042 Y99.51 E.01015
M106 S204
M106 S255
G1 X95.953 Y99.343 E.00477
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X95.817 Y99.087 E.00786
G1 X98.713 Y97.547 E.08888
G1 X98.849 Y97.803 E.00786
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
M73 P88 R0
G1 X98.877 Y97.856 E.00151
M106 S204
G1 F1080
G1 X99.022 Y98.129 E.00777
G1 F1200
G1 X99.051 Y98.183 E.00156
G1 X99.079 Y98.235 E.00148
G1 F720
G1 X98.735 Y98.419 E.00981
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X96.527 Y99.592 E.06774
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X96.343 Y99.69 E.00524
M106 S204
G1 F840
G1 F1200
G1 X96.183 Y99.775 E.00457
G1 X96.155 Y99.723 E.00148
G1 X96.137 Y99.69 E.00094
G1 X96.091 Y99.69 E.00117
M106 S255
G1 F600
G1 X95.673 Y99.69 E.01051
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X95.062 Y99.69 E.01656
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X94.693 Y99.69 E.00928
M106 S204
G1 F1200
G1 X94.532 Y99.69 E.00405
; WIPE_START
G1 F1270.873
M204 S6000
G1 X94.472 Y99.51 E-.0721
G1 X94.693 Y99.51 E-.08398
G1 X95.062 Y99.51 E-.14022
G1 X95.638 Y99.51 E-.21883
G1 X96.042 Y99.51 E-.15345
G1 X95.953 Y99.343 E-.07204
G1 X95.929 Y99.298 E-.01938
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-.19 J1.202 P1  F42000
G1 X96.177 Y99.337 Z1.66
G1 Z1.26
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.413701
G1 F1200
M204 S6000
G1 X98.719 Y97.985 E.07121
; CHANGE_LAYER
; Z_HEIGHT: 1.42
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11861.925
G1 X96.953 Y98.924 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/10
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.66 I-.359 J-1.163 P1  F42000
G1 X94.472 Y99.69 Z1.66
G1 Z1.42
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X94.472 Y99.51 E.00453
G1 X96.042 Y99.51 E.03946
G1 X95.817 Y99.087 E.01206
G1 X98.713 Y97.547 E.08246
G1 X98.746 Y97.609 E.00176
G1 X99.079 Y98.235 E.01785
M73 P89 R0
G1 X96.183 Y99.775 E.08246
G1 X96.138 Y99.69 E.00243
G1 X94.532 Y99.69 E.04036
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.472 Y99.51 E-.0721
G1 X96.042 Y99.51 E-.59648
G1 X95.929 Y99.298 E-.09142
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.82 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X96.177 Y99.337
G1 Z1.42
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.413688
G1 F1200
M204 S6000
G1 X98.719 Y97.985 E.07121
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F11862.347
G1 X96.953 Y98.924 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.82 I1.217 J0 P1  F42000
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z1.92 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
M73 P90 R0
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
M73 P91 R0
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

M73 P92 R0
    G1 Z101.42 F600
    G1 Z99.42

M400 P100
M17 R ; restore z current

G90
M73 P93 R0
G1 X128 Y250 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END


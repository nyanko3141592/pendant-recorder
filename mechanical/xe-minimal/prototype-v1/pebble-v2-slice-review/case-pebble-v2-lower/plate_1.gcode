; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 9m 36s; total estimated time: 9m 55s
; total layer number: 50
; total filament length [mm] : 574.46
; total filament volume [cm^3] : 1381.73
; total filament weight [g] : 1.71
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 8.04
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
; layer num/total_layer_count: 1/50
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
M73 P2 R9
G1 X79.224 Y83.229 F42000
M204 S6000
M73 P3 R9
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X79.366 Y83.11 E.00687
G3 X79.92 Y82.891 I.708 J.979 E.02242
G3 X80.504 Y82.96 I.135 J1.357 E.02207
G3 X79.183 Y83.273 I-.43 J1.129 E.22906
M204 S6000
G1 X79.527 Y83.572 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X79.633 Y83.482 E.00518
G3 X79.977 Y83.345 I.44 J.607 E.01393
G1 X80.058 Y83.339 E.00302
G3 X79.489 Y83.618 I.015 J.75 E.15112
; WIPE_START
G1 X79.633 Y83.482 E-.07524
G1 X79.761 Y83.405 E-.05679
G1 X79.977 Y83.345 E-.08505
G1 X80.058 Y83.339 E-.03084
G1 X80.2 Y83.35 E-.05446
G1 X80.341 Y83.389 E-.0556
G1 X80.567 Y83.526 E-.10031
G1 X80.665 Y83.631 E-.05446
G1 X80.749 Y83.77 E-.06164
G1 X80.798 Y83.904 E-.05436
G1 X80.82 Y84.052 E-.05687
G1 X80.813 Y84.201 E-.05679
G1 X80.801 Y84.246 E-.01758
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X86.023 Y89.813 Z.6 F42000
G1 X100.384 Y105.122 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G3 X100.06 Y105.241 I-.298 J-.312 E.01321
G1 X79.94 Y105.241 E.74938
G3 X79.484 Y104.785 I-.027 J-.429 E.02717
G1 X79.484 Y86.126 E.69498
G1 X79.7 Y86.186 E.00837
G2 X79.484 Y82.04 I.362 J-2.098 E.28451
G3 X79.492 Y81.152 I6.363 J-.387 E.03309
G3 X79.88 Y80.811 I.41 J.075 E.02076
G1 X100.134 Y80.811 E.75437
G3 X100.514 Y81.204 I-.036 J.415 E.02222
G1 X100.516 Y104.785 E.87828
G3 X100.424 Y105.078 I-.43 J.026 E.01169
M204 S6000
G1 X100.705 Y105.45 F42000
G1 F3000
M204 S500
G3 X100.071 Y105.698 I-.613 J-.633 E.02603
G1 X79.929 Y105.698 E.75022
G3 X79.027 Y104.796 I-.02 J-.882 E.05309
G1 X79.027 Y85.408 E.72212
G2 X81.045 Y85.445 I1.035 J-1.394 E.08023
G2 X79.383 Y82.567 I-.981 J-1.352 E.18255
G1 X79.027 Y82.773 E.01531
G1 X79.027 Y81.254 E.0566
G3 X79.857 Y80.354 I.886 J-.015 E.05034
G1 X100.18 Y80.356 E.75696
G3 X100.971 Y81.182 I-.084 J.871 E.04638
G1 X100.973 Y104.796 E.87953
M73 P4 R9
G3 X100.747 Y105.407 I-.881 J.021 E.02485
M204 S6000
G1 X101.032 Y105.768 F42000
G1 F3000
M204 S500
G3 X100.082 Y106.155 I-.941 J-.953 E.03918
G1 X79.918 Y106.155 E.75106
G3 X78.57 Y104.807 I-.007 J-1.341 E.07896
G1 X78.57 Y81.242 E.8777
G3 X79.835 Y79.897 I1.348 J0 E.07577
G1 X100.227 Y79.901 E.75954
G3 X101.428 Y81.159 I-.132 J1.328 E.07055
G1 X101.43 Y104.807 E.88079
G3 X101.073 Y105.725 I-1.34 J.008 E.03757
M204 S6000
G1 X101.376 Y106.072 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X101.358 Y106.087 E.00086
G3 X100.094 Y106.612 I-1.27 J-1.274 E.05232
G1 X79.906 Y106.612 E.7519
G3 X78.113 Y104.818 I.006 J-1.8 E.10484
G1 X78.113 Y81.231 E.87854
G3 X79.812 Y79.44 I1.811 J.016 E.1012
G1 X100.274 Y79.446 E.76213
G3 X101.885 Y81.137 I-.181 J1.785 E.09471
G1 X101.887 Y104.818 E.88204
G3 X101.582 Y105.815 I-1.799 J-.006 E.03939
G1 X101.414 Y106.026 E.01005
; WIPE_START
G1 X101.358 Y106.087 E-.03143
G1 X101.165 Y106.26 E-.09867
G1 X101.019 Y106.357 E-.06671
G1 X100.702 Y106.507 E-.13308
G1 X100.408 Y106.584 E-.11558
G1 X100.094 Y106.612 E-.11983
G1 X99.581 Y106.612 E-.1947
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

G1 X99.243 Y80.994
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50576
G1 F6300
M204 S500
G1 X100.125 Y81.877 E.04707
G1 X100.125 Y82.531 E.02469
G1 X98.794 Y81.2 E.07101
G1 X98.139 Y81.2 E.02469
G1 X100.125 Y83.186 E.10593
G1 X100.125 Y83.841 E.02469
G1 X97.485 Y81.2 E.14085
G1 X96.83 Y81.2 E.02469
G1 X100.125 Y84.495 E.17577
G1 X100.126 Y85.15 E.02469
G1 X96.176 Y81.2 E.21068
M73 P5 R9
G1 X95.521 Y81.2 E.02469
G1 X100.126 Y85.804 E.2456
G1 X100.126 Y86.459 E.02469
G1 X94.866 Y81.2 E.28052
G1 X94.212 Y81.2 E.02469
G1 X100.126 Y87.114 E.31543
G1 X100.126 Y87.768 E.02469
G1 X93.557 Y81.2 E.35035
G1 X92.903 Y81.2 E.02469
G1 X100.126 Y88.423 E.38527
G1 X100.126 Y89.077 E.02469
G1 X92.248 Y81.2 E.42018
G1 X91.594 Y81.2 E.02469
G1 X100.126 Y89.732 E.4551
G1 X100.126 Y90.387 E.02469
G1 X90.939 Y81.2 E.49002
G1 X90.284 Y81.2 E.02469
G1 X100.126 Y91.041 E.52493
G1 X100.126 Y91.696 E.02469
G1 X89.63 Y81.2 E.55985
G1 X88.975 Y81.2 E.02469
G1 X100.126 Y92.351 E.59477
G1 X100.126 Y93.005 E.02469
G1 X88.321 Y81.2 E.62969
G1 X87.666 Y81.2 E.02469
G1 X100.126 Y93.66 E.6646
G1 X100.126 Y94.314 E.02469
G1 X87.012 Y81.2 E.69952
G1 X86.357 Y81.2 E.02469
G1 X100.127 Y94.969 E.73444
G1 X100.127 Y95.624 E.02469
G1 X85.702 Y81.2 E.76935
G1 X85.048 Y81.2 E.02469
G1 X100.127 Y96.278 E.80427
G1 X100.127 Y96.933 E.02469
G1 X84.393 Y81.2 E.83919
M73 P6 R9
G1 X83.739 Y81.2 E.02469
G1 X100.127 Y97.588 E.8741
G1 X100.127 Y98.242 E.02469
G1 X83.084 Y81.2 E.90902
G1 X82.43 Y81.199 E.02469
G1 X100.127 Y98.897 E.94394
G1 X100.127 Y99.551 E.02469
G1 X81.775 Y81.199 E.97886
G1 X81.12 Y81.199 E.02469
G1 X100.127 Y100.206 E1.01377
G1 X100.127 Y100.861 E.02469
G1 X80.26 Y80.994 E1.05966
M204 S6000
G1 X80.42 Y81.808 F42000
G1 F6300
M204 S500
G1 X79.711 Y81.099 E.03779
; WIPE_START
G1 X80.42 Y81.808 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X82.344 Y83.732 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X100.127 Y101.515 E.94854
G1 X100.127 Y102.17 E.02469
G1 X82.533 Y84.576 E.93842
G1 X82.438 Y84.951 E.0146
G1 X82.378 Y85.075 E.00519
G1 X100.127 Y102.825 E.94671
G1 X100.127 Y103.479 E.02469
G1 X82.148 Y85.499 E.95901
G1 X81.917 Y85.804 E.01441
G1 X81.853 Y85.86 E.00319
G1 X100.127 Y104.134 E.9747
G1 X100.128 Y104.755 E.02343
G1 X100.123 Y104.784 E.0011
G1 X81.499 Y86.16 E.99338
G1 X81.08 Y86.395 E.01813
G1 X99.537 Y104.852 E.98445
M73 P7 R9
G1 X98.882 Y104.852 E.02469
G1 X80.582 Y86.552 E.97608
G1 X80.133 Y86.608 E.01708
G1 X79.972 Y86.596 E.00609
G1 X98.228 Y104.852 E.97372
G1 X97.573 Y104.852 E.02469
G1 X79.872 Y87.152 E.94411
G1 X79.872 Y87.806 E.02469
G1 X96.918 Y104.852 E.9092
G1 X96.264 Y104.852 E.02469
G1 X79.872 Y88.461 E.87428
G1 X79.872 Y89.115 E.02469
G1 X95.609 Y104.852 E.83937
G1 X94.955 Y104.852 E.02469
G1 X79.872 Y89.77 E.80446
G1 X79.872 Y90.424 E.02469
G1 X94.3 Y104.852 E.76955
G1 X93.646 Y104.852 E.02469
G1 X79.872 Y91.079 E.73463
G1 X79.872 Y91.733 E.02469
G1 X92.991 Y104.852 E.69972
G1 X92.337 Y104.852 E.02469
G1 X79.872 Y92.388 E.66481
G1 X79.872 Y93.043 E.02469
G1 X91.682 Y104.852 E.6299
G1 X91.027 Y104.852 E.02469
G1 X79.872 Y93.697 E.59498
M73 P8 R9
G1 X79.872 Y94.352 E.02469
G1 X90.373 Y104.852 E.56007
G1 X89.718 Y104.852 E.02469
G1 X79.872 Y95.006 E.52516
G1 X79.872 Y95.661 E.02469
G1 X89.064 Y104.852 E.49024
G1 X88.409 Y104.852 E.02469
G1 X79.872 Y96.315 E.45533
G1 X79.872 Y96.97 E.02469
G1 X87.755 Y104.852 E.42042
G1 X87.1 Y104.852 E.02469
G1 X79.872 Y97.624 E.38551
G1 X79.872 Y98.279 E.02469
G1 X86.446 Y104.852 E.35059
G1 X85.791 Y104.852 E.02469
G1 X79.872 Y98.934 E.31568
G1 X79.872 Y99.588 E.02469
G1 X85.136 Y104.852 E.28077
G1 X84.482 Y104.852 E.02469
G1 X79.872 Y100.243 E.24586
G1 X79.872 Y100.897 E.02469
G1 X83.827 Y104.852 E.21094
G1 X83.173 Y104.852 E.02469
G1 X79.872 Y101.552 E.17603
G1 X79.872 Y102.206 E.02469
G1 X82.518 Y104.852 E.14112
G1 X81.864 Y104.852 E.02469
G1 X79.872 Y102.861 E.10621
G1 X79.872 Y103.515 E.02469
G1 X81.209 Y104.852 E.07129
G1 X80.555 Y104.852 E.02469
G1 X79.667 Y103.964 E.04735
; WIPE_START
G1 X80.555 Y104.852 E-.4771
G1 X81.209 Y104.852 E-.24873
G1 X81.146 Y104.788 E-.03417
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X80.329 Y97.2 Z.6 F42000
G1 X79.028 Y85.116 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.119272
G1 F3000
M204 S500
G1 X78.945 Y85.046 E.00068
; LINE_WIDTH: 0.150875
G3 X78.842 Y84.922 I.079 J-.17 E.00147
; LINE_WIDTH: 0.116452
G1 X78.821 Y84.84 E.00051
; WIPE_START
G1 X78.842 Y84.922 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X85.165 Y80.647 Z.6 F42000
G1 X91.693 Y76.232 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X88.307 Y76.232 E.12611
G1 X88.307 Y75.116 E.04159
G1 X91.693 Y75.116 E.12611
G1 X91.693 Y76.172 E.03936
M204 S6000
G1 X92.15 Y76.689 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X87.85 Y76.689 E.16016
G1 X87.85 Y74.659 E.07564
G1 X92.15 Y74.659 E.16016
G1 X92.15 Y76.629 E.07341
; WIPE_START
G1 X90.15 Y76.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
M73 P9 R9
G1 X91.464 Y75.674 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.70256
G1 F3000
M204 S500
G1 X88.536 Y75.674 E.15743
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
G1 X90.536 Y75.674 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/50
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S193.8
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.6 I-.683 J-1.007 P1  F42000
G1 X79.29 Y83.3 Z.6
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X79.424 Y83.19 E.00468
G3 X79.932 Y82.987 I.654 J.898 E.01498
G1 X80.058 Y82.977 E.00342
G3 X79.251 Y83.345 I.02 J1.11 E.16437
M204 S250
G1 X79.555 Y83.6 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X79.656 Y83.514 E.00335
G3 X79.982 Y83.385 I.416 J.574 E.00889
G1 X80.058 Y83.379 E.00192
G3 X79.518 Y83.646 I.015 J.709 E.09637
; WIPE_START
M204 S6000
G1 X79.656 Y83.514 E-.07297
G1 X79.778 Y83.441 E-.05369
G1 X79.982 Y83.385 E-.08042
G1 X80.058 Y83.379 E-.02895
G1 X80.193 Y83.389 E-.05179
G1 X80.33 Y83.428 E-.05387
G1 X80.456 Y83.492 E-.05373
G1 X80.566 Y83.58 E-.0538
G1 X80.658 Y83.689 E-.05384
G1 X80.725 Y83.813 E-.05372
G1 X80.767 Y83.949 E-.05388
G1 X80.781 Y84.09 E-.0538
G1 X80.737 Y84.335 E-.09475
G1 X80.736 Y84.337 E-.00078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.984 Y89.879 Z.76 F42000
G1 X100.757 Y105.482 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G3 X100.082 Y105.755 I-.659 J-.659 E.02028
G1 X79.918 Y105.755 E.54636
G3 X78.97 Y104.806 I-.016 J-.932 E.04057
G1 X78.97 Y85.705 E.51758
G2 X81.499 Y85.415 I1.09 J-1.667 E.07482
G2 X78.97 Y82.485 I-1.431 J-1.322 E.15388
G3 X78.972 Y81.179 I26.415 J-.621 E.03539
G3 X79.918 Y80.294 I.932 J.049 E.03881
G1 X100.101 Y80.296 E.5469
G3 X101.03 Y81.243 I-.004 J.932 E.04
G1 X101.03 Y104.806 E.6385
G3 X100.798 Y105.438 I-.932 J.016 E.01866
M204 S10000
G1 X101.051 Y105.776 F42000
G1 F10826.06
M204 S6000
G3 X100.087 Y106.17 I-.953 J-.953 E.02898
G1 X79.913 Y106.17 E.54665
G3 X78.554 Y104.811 I-.011 J-1.348 E.05798
G1 X78.554 Y84.885 E.53993
G1 X78.742 Y84.837 E.00525
G2 X78.742 Y83.342 I1.328 J-.748 E.21709
G1 X78.554 Y83.294 E.00525
G1 X78.554 Y81.238 E.05571
G3 X79.913 Y79.879 I1.348 J-.011 E.05797
G1 X100.113 Y79.88 E.54735
G3 X101.446 Y81.238 I-.016 J1.349 E.05723
G1 X101.446 Y104.811 E.63878
G3 X101.092 Y105.732 I-1.348 J.011 E.02737
M204 S10000
G1 X101.345 Y106.07 F42000
M73 P9 R8
G1 F10826.06
M204 S6000
G3 X100.092 Y106.586 I-1.247 J-1.247 E.03769
G1 X79.908 Y106.586 E.54693
G3 X78.139 Y104.816 I-.006 J-1.763 E.07539
G1 X78.139 Y81.233 E.63905
G3 X79.908 Y79.463 I1.763 J-.006 E.07539
G1 X100.124 Y79.464 E.5478
G3 X101.861 Y81.233 I-.028 J1.765 E.07446
G1 X101.861 Y104.817 E.63906
G3 X101.386 Y106.027 I-1.763 J.006 E.03607
M204 S250
G1 X101.648 Y106.331 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
M204 S5000
G1 X101.627 Y106.352 E.00074
G3 X100.097 Y106.987 I-1.535 J-1.538 E.04272
G1 X80.503 Y106.987 E.49263
G3 X79.272 Y106.893 I-.3 J-4.21 E.03114
G3 X77.738 Y104.822 I.634 J-2.074 E.06941
G1 X77.738 Y81.827 E.57811
G3 X77.831 Y80.597 I4.211 J-.3 E.03113
G3 X79.903 Y79.063 I2.071 J.63 E.06943
M106 S193.8
M106 S255
M73 P10 R8
G1 X80.503 Y79.063 E.01508
M106 S193.8
M106 S255
G1 X100.135 Y79.064 E.49359
M106 S193.8
M106 S255
G3 X102.262 Y81.227 I-.041 J2.167 E.08449
M106 S193.8
M106 S255
G1 X102.262 Y81.827 E.01508
M106 S193.8
M106 S255
G1 X102.262 Y104.222 E.56302
G3 X102.168 Y105.454 I-4.201 J.3 E.03119
G3 X101.835 Y106.111 I-2.076 J-.64 E.01862
M73 P11 R8
G1 X101.687 Y106.285 E.00575
M106 S193.8
; WIPE_START
M204 S6000
G1 X101.627 Y106.352 E-.03393
G1 X101.388 Y106.561 E-.12068
G1 X101.023 Y106.779 E-.1615
G1 X100.728 Y106.893 E-.12042
G1 X100.348 Y106.971 E-.14724
G1 X100.097 Y106.987 E-.09554
G1 X99.885 Y106.987 E-.08069
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

G1 X100.172 Y105.578
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421546
G1 F11621.601
M204 S6000
G1 X100.561 Y105.189 E.01389
G2 X100.689 Y104.795 I-.501 J-.382 E.01065
G1 X100.689 Y104.512 E.00713
G1 X99.788 Y105.414 E.03218
G1 X99.24 Y105.414 E.01382
G1 X100.689 Y103.965 E.05173
G1 X100.689 Y103.417 E.01382
G1 X98.693 Y105.414 E.07128
G1 X98.145 Y105.414 E.01382
G1 X100.689 Y102.87 E.09082
G1 X100.689 Y102.322 E.01382
G1 X97.598 Y105.414 E.11037
G1 X97.05 Y105.414 E.01382
G1 X100.689 Y101.775 E.12992
G1 X100.689 Y101.227 E.01382
G1 X96.502 Y105.414 E.14946
G1 X95.955 Y105.414 E.01382
G1 X100.689 Y100.68 E.16901
G1 X100.689 Y100.132 E.01382
G1 X95.407 Y105.414 E.18856
G1 X94.86 Y105.414 E.01382
G1 X100.689 Y99.584 E.2081
G1 X100.689 Y99.037 E.01382
G1 X94.312 Y105.414 E.22765
G1 X93.764 Y105.414 E.01382
G1 X100.689 Y98.489 E.2472
G1 X100.689 Y97.942 E.01382
G1 X93.217 Y105.414 E.26674
G1 X92.669 Y105.414 E.01382
G1 X100.689 Y97.394 E.28629
G1 X100.689 Y96.847 E.01382
G1 X92.122 Y105.414 E.30584
G1 X91.574 Y105.414 E.01382
G1 X100.689 Y96.299 E.32538
G1 X100.689 Y95.752 E.01382
G1 X91.026 Y105.414 E.34493
G1 X90.479 Y105.414 E.01382
G1 X100.689 Y95.204 E.36448
G1 X100.689 Y94.656 E.01382
G1 X89.931 Y105.414 E.38402
G1 X89.384 Y105.414 E.01382
G1 X100.689 Y94.109 E.40357
G1 X100.689 Y93.561 E.01382
G1 X88.836 Y105.414 E.42312
G1 X88.288 Y105.414 E.01382
G1 X100.689 Y93.014 E.44266
G1 X100.689 Y92.466 E.01382
G1 X87.741 Y105.414 E.46221
G1 X87.193 Y105.414 E.01382
G1 X100.689 Y91.919 E.48176
G1 X100.689 Y91.371 E.01382
G1 X86.646 Y105.414 E.5013
G1 X86.098 Y105.414 E.01382
G1 X100.689 Y90.823 E.52085
G1 X100.689 Y90.276 E.01382
G1 X85.55 Y105.414 E.5404
G1 X85.003 Y105.414 E.01382
G1 X100.688 Y89.728 E.55994
G1 X100.688 Y89.181 E.01382
G1 X84.455 Y105.414 E.57949
G1 X83.908 Y105.414 E.01382
G1 X100.688 Y88.633 E.59904
G1 X100.688 Y88.086 E.01382
G1 X83.36 Y105.414 E.61858
G1 X82.812 Y105.414 E.01382
G1 X100.688 Y87.538 E.63813
G1 X100.688 Y86.991 E.01382
G1 X82.265 Y105.414 E.65768
G1 X81.717 Y105.414 E.01382
G1 X100.688 Y86.443 E.67722
G1 X100.688 Y85.895 E.01382
G1 X81.17 Y105.414 E.69677
G1 X80.622 Y105.414 E.01382
G1 X100.688 Y85.348 E.71632
G1 X100.688 Y84.8 E.01382
G1 X80.074 Y105.414 E.73586
M73 P12 R8
G3 X79.609 Y105.332 I-.056 J-1.045 E.01204
G1 X100.688 Y84.253 E.75249
G1 X100.688 Y83.705 E.01382
G1 X79.357 Y105.036 E.76148
G3 X79.311 Y104.535 I1.222 J-.366 E.01279
G1 X100.688 Y83.158 E.76313
G1 X100.688 Y82.61 E.01382
G1 X79.311 Y103.988 E.76313
G1 X79.311 Y103.44 E.01382
G1 X100.688 Y82.062 E.76313
G1 X100.688 Y81.515 E.01382
G1 X79.311 Y102.892 E.76313
G1 X79.311 Y102.345 E.01382
G1 X100.643 Y81.012 E.76152
G2 X100.392 Y80.716 I-.55 J.211 E.00999
G1 X79.311 Y101.797 E.75255
G1 X79.311 Y101.25 E.01382
G1 X99.924 Y80.636 E.73586
G1 X99.376 Y80.636 E.01382
G1 X79.311 Y100.702 E.71631
G1 X79.311 Y100.154 E.01382
G1 X98.829 Y80.636 E.69676
G1 X98.281 Y80.636 E.01382
G1 X79.311 Y99.607 E.67721
G1 X79.311 Y99.059 E.01382
G1 X97.734 Y80.636 E.65767
G1 X97.186 Y80.636 E.01382
G1 X79.311 Y98.512 E.63812
G1 X79.311 Y97.964 E.01382
G1 X96.639 Y80.636 E.61857
G1 X96.091 Y80.636 E.01382
G1 X79.311 Y97.416 E.59903
G1 X79.311 Y96.869 E.01382
G1 X95.543 Y80.636 E.57948
G1 X94.996 Y80.636 E.01382
G1 X79.311 Y96.321 E.55993
G1 X79.311 Y95.774 E.01382
G1 X94.448 Y80.636 E.54039
G1 X93.901 Y80.636 E.01382
G1 X79.311 Y95.226 E.52084
G1 X79.311 Y94.678 E.01382
G1 X93.353 Y80.636 E.50129
G1 X92.806 Y80.636 E.01382
G1 X79.311 Y94.131 E.48174
G1 X79.311 Y93.583 E.01382
G1 X92.258 Y80.636 E.4622
G1 X91.71 Y80.636 E.01382
G1 X79.311 Y93.036 E.44265
G1 X79.311 Y92.488 E.01382
G1 X91.163 Y80.636 E.4231
G1 X90.615 Y80.636 E.01382
G1 X79.311 Y91.94 E.40356
G1 X79.311 Y91.393 E.01382
G1 X90.068 Y80.636 E.38401
G1 X89.52 Y80.636 E.01382
G1 X79.311 Y90.845 E.36446
G1 X79.311 Y90.298 E.01382
G1 X88.973 Y80.636 E.34491
G1 X88.425 Y80.635 E.01382
G1 X79.311 Y89.75 E.32537
G1 X79.311 Y89.202 E.01382
G1 X87.877 Y80.635 E.30582
G1 X87.33 Y80.635 E.01382
G1 X79.311 Y88.655 E.28627
G1 X79.311 Y88.107 E.01382
G1 X86.782 Y80.635 E.26673
G1 X86.235 Y80.635 E.01382
G1 X82.306 Y84.564 E.14024
G1 X82.361 Y84.089 E.01206
G1 X82.35 Y83.973 E.00296
G1 X85.687 Y80.635 E.11914
G1 X85.14 Y80.635 E.01382
G1 X82.274 Y83.501 E.10228
G2 X82.127 Y83.1 I-1.065 J.164 E.01084
G1 X84.592 Y80.635 E.08798
G1 X84.044 Y80.635 E.01382
G1 X81.926 Y82.754 E.07563
G1 X81.676 Y82.456 E.00981
G1 X83.497 Y80.635 E.065
M73 P13 R8
G1 X82.949 Y80.635 E.01382
G1 X81.373 Y82.212 E.05629
G1 X81.313 Y82.165 E.00192
G1 X81.022 Y82.015 E.00826
G1 X82.402 Y80.635 E.04926
G1 X81.854 Y80.635 E.01382
G1 X80.615 Y81.874 E.04424
G2 X80.134 Y81.808 I-.405 J1.156 E.01234
G1 X81.307 Y80.635 E.04187
G1 X80.759 Y80.635 E.01382
G1 X79.527 Y81.867 E.04398
G1 X79.313 Y81.939 E.00571
G1 X79.314 Y81.532 E.01025
G1 X80.211 Y80.635 E.03204
G2 X79.649 Y80.694 I-.151 J1.26 E.01439
G1 X79.527 Y80.772 E.00364
G1 X79.142 Y81.157 E.01376
; WIPE_START
G1 X79.527 Y80.772 E-.20713
G1 X79.649 Y80.694 E-.05484
G1 X79.789 Y80.648 E-.05577
G1 X80.211 Y80.635 E-.16078
G1 X79.688 Y81.159 E-.28148
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.602 Y83.52 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.460833
G1 F10551.073
M204 S6000
G2 X78.597 Y84.66 I3.109 J.582 E.03186
M204 S10000
G1 X78.762 Y85.306 F42000
; LINE_WIDTH: 0.103012
G1 F18000
M204 S6000
G1 X78.92 Y85.418 E.00087
; WIPE_START
G1 X78.762 Y85.306 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.623 Y86.152 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421546
G1 F11621.601
M204 S6000
G1 X79.311 Y86.464 E.01115
G1 X79.311 Y87.012 E.01382
G1 X79.955 Y86.367 E.02301
G1 X80.127 Y86.38 E.00435
G1 X80.542 Y86.328 E.01055
G1 X79.137 Y87.733 E.05015
; WIPE_START
G1 X80.542 Y86.328 E-.75493
G1 X80.529 Y86.33 E-.00507
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.95 Y80.958 Z.76 F42000
G1 X90.958 Y75.997 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X89.042 Y75.997 E.05192
G1 X89.042 Y75.353 E.01746
G1 X90.958 Y75.353 E.05192
G1 X90.958 Y75.937 E.01583
M204 S10000
G1 X91.374 Y76.413 F42000
G1 F10826.06
M204 S6000
G1 X88.626 Y76.413 E.07445
G1 X88.626 Y74.937 E.03998
G1 X91.374 Y74.937 E.07445
G1 X91.374 Y76.353 E.03836
M204 S10000
G1 X91.789 Y76.828 F42000
G1 F2700
M204 S6000
G1 X88.211 Y76.828 E.09697
G1 F3238.235
G1 X88.211 Y76.757 E.00193
G1 F7160.257
G1 X88.211 Y76.357 E.01084
G1 F10826.06
G1 X88.211 Y75.957 E.01084
G1 X88.211 Y75.391 E.01533
G1 X88.211 Y74.991 E.01084
G1 F7140.221
G1 X88.211 Y74.591 E.01084
G1 F3224.765
G1 X88.211 Y74.521 E.00189
G1 F2700
G1 X91.789 Y74.521 E.09697
G1 F3224.765
G1 X91.789 Y74.591 E.00189
G1 F7140.221
G1 X91.789 Y74.991 E.01084
G1 F10826.06
G1 X91.789 Y75.391 E.01084
G1 X91.789 Y75.957 E.01533
G1 X91.789 Y76.357 E.01084
G1 F9742.829
G1 X91.789 Y76.757 E.01084
G1 F5040
G1 X91.789 Y76.768 E.00031
M204 S250
G1 X92.19 Y77.139 F42000
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X92.19 Y77.229 E.00243
M106 S193.8
M106 S255
G1 F600
G1 X87.81 Y77.229 E.11869
G1 X87.81 Y77.139 E.00243
M106 S193.8
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X87.81 Y76.77 E.00928
M106 S193.8
G1 F2725.645
G1 X87.81 Y76.37 E.01006
G1 F6387.29
G1 X87.81 Y75.97 E.01006
G1 F10091.63
G1 X87.81 Y75.57 E.01006
G1 F8701.321
G1 X87.81 Y74.978 E.0149
G1 F2725.645
G1 X87.81 Y74.578 E.01006
M106 S255
G1 F600
G1 X87.81 Y74.209 E.00928
M106 S193.8
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X87.81 Y74.121 E.00238
G1 X92.19 Y74.121 E.11869
G1 X92.19 Y74.209 E.00238
M106 S193.8
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X92.19 Y74.578 E.00928
M106 S193.8
G1 F2725.645
G1 X92.19 Y74.978 E.01006
G1 F6387.29
G1 X92.19 Y75.378 E.01006
G1 F10091.63
G1 X92.19 Y75.778 E.01006
G1 F8701.321
G1 X92.19 Y76.37 E.0149
G1 F2725.645
G1 X92.19 Y76.77 E.01006
M106 S255
G1 F600
G1 X92.19 Y77.079 E.00777
M106 S193.8
; WIPE_START
M204 S6000
G1 X92.19 Y77.229 E-.05682
G1 X90.34 Y77.229 E-.70318
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I1.177 J.311 P1  F42000
G1 X90.75 Y75.675 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.262886
G1 F18000
M204 S6000
G1 X89.25 Y75.675 E.02236
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X90.75 Y75.675 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/50
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M106 S196.35
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.76 I-.674 J-1.013 P1  F42000
G1 X79.293 Y83.297 Z.76
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X79.421 Y83.185 E.0046
G3 X79.822 Y83.004 I.649 J.902 E.01203
G1 X80.042 Y82.976 E.00601
G3 X79.249 Y83.338 I.028 J1.112 E.16501
M204 S250
G1 X79.558 Y83.598 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X79.655 Y83.512 E.00326
G3 X79.912 Y83.396 I.415 J.577 E.00713
G1 X80.052 Y83.379 E.00356
G3 X79.518 Y83.642 I.018 J.71 E.09672
; WIPE_START
M204 S6000
G1 X79.655 Y83.512 E-.07201
G1 X79.778 Y83.441 E-.05383
G1 X79.912 Y83.396 E-.05373
G1 X80.052 Y83.379 E-.05375
G1 X80.194 Y83.389 E-.0539
G1 X80.325 Y83.426 E-.05179
G1 X80.461 Y83.496 E-.05797
G1 X80.567 Y83.581 E-.0516
G1 X80.658 Y83.689 E-.0538
G1 X80.725 Y83.813 E-.0537
G1 X80.767 Y83.949 E-.05375
G1 X80.772 Y84.199 E-.09518
G1 X80.738 Y84.333 E-.05259
G1 X80.735 Y84.339 E-.00242
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.984 Y89.88 Z.92 F42000
G1 X100.89 Y105.615 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G3 X100.081 Y105.944 I-.795 J-.795 E.02431
G1 X79.919 Y105.944 E.54634
G3 X78.781 Y104.806 I-.014 J-1.124 E.04861
G1 X78.781 Y85.547 E.52186
G2 X79.269 Y82.312 I1.285 J-1.46 E.2258
G1 X78.781 Y82.594 E.01528
G3 X78.782 Y81.17 I28.72 J-.675 E.0386
G3 X79.919 Y80.105 I1.119 J.056 E.04665
G1 X100.154 Y80.107 E.54831
G3 X101.219 Y81.243 I-.055 J1.119 E.04667
G1 X101.219 Y104.806 E.63848
G3 X100.932 Y105.571 I-1.124 J.014 E.02267
M204 S10000
G1 X101.184 Y105.908 F42000
G1 F10826.06
M204 S6000
G3 X100.087 Y106.36 I-1.089 J-1.089 E.03301
G1 X79.914 Y106.36 E.54663
G3 X78.365 Y104.811 I-.008 J-1.54 E.066
G1 X78.365 Y84.463 E.55138
G1 X78.571 Y84.427 E.00567
G2 X80.922 Y82.82 I1.491 J-.341 E.16128
G2 X78.583 Y83.753 I-.847 J1.275 E.08012
G1 X78.365 Y83.725 E.00596
G1 X78.365 Y81.238 E.0674
G3 X79.913 Y79.69 I1.54 J-.008 E.066
G1 X100.174 Y79.692 E.549
G3 X101.635 Y81.238 I-.075 J1.535 E.06367
G1 X101.635 Y104.811 E.63877
G3 X101.226 Y105.865 I-1.54 J.008 E.03137
M204 S10000
G1 X101.487 Y106.194 F42000
G1 F10826.06
M204 S6000
G1 X101.478 Y106.202 E.00035
G3 X100.092 Y106.775 I-1.384 J-1.384 E.0417
G1 X79.908 Y106.775 E.54692
G3 X77.949 Y104.816 I-.002 J-1.957 E.0834
G1 X77.949 Y81.233 E.63905
G3 X79.908 Y79.274 I1.957 J-.002 E.0834
G1 X100.194 Y79.276 E.54969
G3 X102.051 Y81.233 I-.096 J1.95 E.08067
G1 X102.051 Y104.817 E.63905
G3 X101.72 Y105.907 I-1.957 J.002 E.03133
G1 X101.525 Y106.147 E.00837
M204 S250
G1 X101.796 Y106.447 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1080
M204 S5000
G1 X101.761 Y106.485 E.00131
G3 X100.097 Y107.176 I-1.669 J-1.672 E.04646
G1 X80.503 Y107.176 E.49262
G3 X79.218 Y107.075 I-.3 J-4.399 E.03253
M73 P14 R8
G3 X77.549 Y104.822 I.694 J-2.259 E.07546
G1 X77.549 Y81.827 E.5781
G3 X77.619 Y80.653 I4.816 J-.3 E.02965
G3 X79.903 Y78.873 I2.283 J.574 E.0784
G1 X99.497 Y78.873 E.49262
G3 X100.214 Y78.876 I.3 J14.578 E.01802
G3 X102.451 Y81.227 I-.116 J2.35 E.09005
G1 X102.451 Y104.222 E.57811
G3 X102.35 Y105.507 I-4.397 J.3 E.03253
G3 X102.053 Y106.13 I-2.259 J-.694 E.0174
G1 X101.834 Y106.4 E.00876
; WIPE_START
M204 S6000
G1 X101.761 Y106.485 E-.04258
G1 X101.5 Y106.713 E-.13151
G1 X101.105 Y106.95 E-.17503
G1 X100.782 Y107.075 E-.13151
G1 X100.445 Y107.15 E-.1314
G1 X100.097 Y107.176 E-.13258
G1 X100.057 Y107.176 E-.01539
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

G1 X79.746 Y105.762
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421476
G1 F11623.702
M204 S6000
G1 X79.299 Y105.315 E.01596
G1 X79.199 Y105.157 E.00472
G3 X79.121 Y104.589 I1.244 J-.46 E.01457
M73 P15 R8
G1 X80.135 Y105.603 E.03619
G1 X80.683 Y105.603 E.01382
G1 X79.121 Y104.042 E.05574
G1 X79.121 Y103.494 E.01382
G1 X81.23 Y105.603 E.07528
G1 X81.778 Y105.603 E.01382
G1 X79.121 Y102.947 E.09482
G1 X79.121 Y102.399 E.01382
G1 X82.325 Y105.603 E.11436
G1 X82.873 Y105.603 E.01382
G1 X79.121 Y101.852 E.1339
G1 X79.121 Y101.304 E.01382
G1 X83.42 Y105.603 E.15344
G1 X83.968 Y105.603 E.01382
G1 X79.121 Y100.757 E.17298
G1 X79.121 Y100.209 E.01382
G1 X84.515 Y105.603 E.19252
G1 X85.063 Y105.603 E.01382
G1 X79.121 Y99.662 E.21206
G1 X79.121 Y99.114 E.01382
G1 X85.61 Y105.603 E.2316
G1 X86.158 Y105.603 E.01382
G1 X79.121 Y98.567 E.25115
G1 X79.121 Y98.019 E.01382
G1 X86.705 Y105.603 E.27069
G1 X87.253 Y105.603 E.01382
G1 X79.121 Y97.472 E.29023
G1 X79.121 Y96.924 E.01382
G1 X87.8 Y105.603 E.30977
G1 X88.348 Y105.603 E.01382
G1 X79.121 Y96.377 E.32931
G1 X79.121 Y95.829 E.01382
G1 X88.895 Y105.603 E.34885
G1 X89.443 Y105.603 E.01382
G1 X79.121 Y95.282 E.36839
G1 X79.121 Y94.734 E.01382
G1 X89.99 Y105.603 E.38793
G1 X90.538 Y105.603 E.01382
G1 X79.121 Y94.187 E.40747
G1 X79.121 Y93.639 E.01382
G1 X91.085 Y105.603 E.42701
G1 X91.633 Y105.603 E.01382
G1 X79.121 Y93.092 E.44655
G1 X79.121 Y92.544 E.01382
G1 X92.18 Y105.603 E.4661
G1 X92.728 Y105.603 E.01382
G1 X79.121 Y91.997 E.48564
G1 X79.121 Y91.449 E.01382
G1 X93.275 Y105.603 E.50518
G1 X93.823 Y105.603 E.01382
G1 X79.121 Y90.902 E.52472
G1 X79.121 Y90.354 E.01382
G1 X94.37 Y105.603 E.54426
G1 X94.918 Y105.603 E.01382
G1 X79.121 Y89.807 E.5638
G1 X79.121 Y89.259 E.01382
G1 X95.465 Y105.603 E.58334
G1 X96.013 Y105.603 E.01382
G1 X79.121 Y88.712 E.60288
G1 X79.121 Y88.164 E.01382
G1 X96.56 Y105.603 E.62242
G1 X97.108 Y105.603 E.01382
G1 X79.121 Y87.617 E.64197
G1 X79.121 Y87.069 E.01382
G1 X97.655 Y105.603 E.66151
G1 X98.203 Y105.603 E.01382
G1 X79.121 Y86.522 E.68105
G1 X79.121 Y86.165 E.009
G2 X79.423 Y86.276 I.424 J-.69 E.00816
G1 X98.75 Y105.603 E.68983
G1 X99.298 Y105.603 E.01382
G1 X80.07 Y86.376 E.68626
G1 X80.563 Y86.321 E.01251
G1 X99.845 Y105.603 E.68821
G2 X100.344 Y105.555 I.119 J-1.366 E.01272
G1 X80.973 Y86.184 E.69138
G1 X81.331 Y85.994 E.01022
G1 X100.677 Y105.34 E.69049
G2 X100.859 Y104.975 I-.894 J-.673 E.01036
G1 X81.635 Y85.751 E.68614
G2 X81.892 Y85.46 I-.83 J-.994 E.00983
G1 X100.879 Y104.447 E.67767
G1 X100.879 Y103.9 E.01382
G1 X82.103 Y85.123 E.67015
G2 X82.259 Y84.732 I-.891 J-.583 E.0107
G1 X100.879 Y103.352 E.66456
G1 X100.879 Y102.805 E.01382
G1 X82.344 Y84.27 E.66154
G2 X82.322 Y83.701 I-1.617 J-.224 E.01445
G1 X100.879 Y102.257 E.6623
G1 X100.879 Y101.709 E.01382
G1 X79.662 Y80.492 E.75726
M73 P16 R8
G3 X80.162 Y80.446 I.378 J1.341 E.01276
G1 X100.879 Y101.162 E.73939
G1 X100.879 Y100.614 E.01382
G1 X80.71 Y80.446 E.71985
G1 X81.257 Y80.446 E.01382
G1 X100.879 Y100.067 E.7003
G1 X100.878 Y99.519 E.01382
G1 X81.805 Y80.446 E.68076
G1 X82.353 Y80.446 E.01382
G1 X100.878 Y98.972 E.66121
G1 X100.878 Y98.424 E.01382
G1 X82.9 Y80.446 E.64167
G1 X83.448 Y80.446 E.01382
G1 X100.878 Y97.877 E.62212
G1 X100.878 Y97.329 E.01382
G1 X83.995 Y80.446 E.60258
G1 X84.543 Y80.446 E.01382
G1 X100.878 Y96.782 E.58304
G1 X100.878 Y96.234 E.01382
G1 X85.09 Y80.446 E.56349
G1 X85.638 Y80.446 E.01382
G1 X100.878 Y95.686 E.54395
G1 X100.878 Y95.139 E.01382
G1 X86.185 Y80.446 E.5244
G1 X86.733 Y80.446 E.01382
G1 X100.878 Y94.591 E.50486
G1 X100.878 Y94.044 E.01382
G1 X87.281 Y80.446 E.48532
G1 X87.828 Y80.446 E.01382
G1 X100.878 Y93.496 E.46577
G1 X100.878 Y92.949 E.01382
G1 X88.376 Y80.446 E.44623
G1 X88.923 Y80.446 E.01382
G1 X100.878 Y92.401 E.42668
G1 X100.878 Y91.854 E.01382
G1 X89.471 Y80.447 E.40714
G1 X90.018 Y80.447 E.01382
G1 X100.878 Y91.306 E.38759
G1 X100.878 Y90.759 E.01382
G1 X90.566 Y80.447 E.36805
G1 X91.113 Y80.447 E.01382
G1 X100.878 Y90.211 E.34851
G1 X100.878 Y89.664 E.01382
G1 X91.661 Y80.447 E.32896
G1 X92.208 Y80.447 E.01382
G1 X100.878 Y89.116 E.30942
G1 X100.878 Y88.568 E.01382
G1 X92.756 Y80.447 E.28987
G1 X93.304 Y80.447 E.01382
G1 X100.878 Y88.021 E.27033
G1 X100.878 Y87.473 E.01382
G1 X93.851 Y80.447 E.25078
G1 X94.399 Y80.447 E.01382
G1 X100.878 Y86.926 E.23124
G1 X100.877 Y86.378 E.01382
G1 X94.946 Y80.447 E.2117
G1 X95.494 Y80.447 E.01382
G1 X100.877 Y85.831 E.19215
G1 X100.877 Y85.283 E.01382
G1 X96.041 Y80.447 E.17261
G1 X96.589 Y80.447 E.01382
G1 X100.877 Y84.736 E.15306
G1 X100.877 Y84.188 E.01382
G1 X97.136 Y80.447 E.13352
G1 X97.684 Y80.447 E.01382
G1 X100.877 Y83.641 E.11397
G1 X100.877 Y83.093 E.01382
G1 X98.231 Y80.447 E.09443
G1 X98.779 Y80.447 E.01382
G1 X100.877 Y82.546 E.07489
G1 X100.877 Y81.998 E.01382
G1 X99.327 Y80.447 E.05534
G1 X99.874 Y80.447 E.01382
G1 X101.051 Y81.624 E.04199
M204 S10000
G1 X80.7 Y82.079 F42000
G1 F11623.702
M204 S6000
G1 X79.328 Y80.706 E.04899
G2 X79.14 Y81.066 I.537 J.508 E.01038
G1 X79.889 Y81.814 E.02671
G2 X79.427 Y81.9 I-.018 J1.188 E.01193
G1 X78.952 Y81.426 E.01695
; WIPE_START
G1 X79.427 Y81.9 E-.25519
G1 X79.561 Y81.856 E-.05354
G1 X79.889 Y81.814 E-.12562
G1 X79.283 Y81.209 E-.32565
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.856 Y82.819 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.102195
G1 F18000
M204 S6000
G2 X78.573 Y83.038 I2.017 J2.898 E.00159
; WIPE_START
G1 X78.856 Y82.819 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.593 Y85.03 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; LINE_WIDTH: 0.100119
G1 F18000
M204 S6000
G2 X78.657 Y85.155 I.157 J-.003 E.00062
G1 X78.695 Y85.189 E.00022
; WIPE_START
G1 X78.657 Y85.155 E-.20086
G1 X78.614 Y85.107 E-.24894
G1 X78.593 Y85.03 E-.3102
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.826 Y80.627 Z.92 F42000
G1 X90.958 Y76.295 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X89.042 Y76.295 E.05192
G1 X89.042 Y75.052 E.03367
G1 X90.958 Y75.052 E.05192
G1 X90.958 Y76.235 E.03205
M204 S10000
G1 X91.374 Y76.711 F42000
G1 F10826.06
M204 S6000
G1 X88.626 Y76.711 E.07445
G1 X88.626 Y74.637 E.0562
G1 X91.374 Y74.637 E.07445
G1 X91.374 Y76.651 E.05457
M204 S10000
G1 X91.789 Y77.126 F42000
G1 F10826.06
M204 S6000
G1 X88.211 Y77.126 E.09697
G1 X88.211 Y74.221 E.07872
G1 X91.789 Y74.221 E.09697
M73 P17 R8
G1 X91.789 Y77.066 E.0771
M204 S250
G1 X92.19 Y77.27 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1440
M204 S5000
G1 X92.19 Y77.527 E.00646
M106 S255
G1 F600
G1 X87.81 Y77.527 E.11012
M106 S196.35
G1 F1440
G1 X87.81 Y77.27 E.00646
G1 F4311.255
G1 X87.81 Y76.87 E.01006
G1 F8718.509
G1 X87.81 Y76.47 E.01006
G1 F11668.197
G1 X87.81 Y76.07 E.01006
G1 X87.81 Y75.28 E.01987
G1 X87.81 Y74.88 E.01006
G1 F8419.426
G1 X87.81 Y74.48 E.01006
G1 F4101.713
G1 X87.81 Y74.08 E.01006
G1 F1320
G1 X87.81 Y73.82 E.00652
M106 S255
G1 F600
G1 X92.19 Y73.82 E.11012
M106 S196.35
G1 F1320
G1 X92.19 Y74.08 E.00652
G1 F4101.713
G1 X92.19 Y74.48 E.01006
G1 F8419.426
G1 X92.19 Y74.88 E.01006
G1 F11668.197
G1 X92.19 Y75.28 E.01006
G1 X92.19 Y77.21 E.04853
; WIPE_START
M204 S6000
G1 X92.19 Y77.527 E-.1205
G1 X90.507 Y77.527 E-.6395
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.92 I1.026 J-.655 P1  F42000
G1 X89.457 Y75.88 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.447821
G1 F10883.107
M204 S6000
G1 X90.543 Y75.88 E.0293
G1 X90.543 Y75.467 E.01115
G1 X89.457 Y75.467 E.0293
G1 X89.457 Y75.82 E.00953
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10883.107
G1 X89.457 Y75.467 E-.13433
G1 X90.543 Y75.467 E-.41305
G1 X90.543 Y75.88 E-.15712
G1 X90.397 Y75.88 E-.0555
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/50
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S198.9
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.92 I-.645 J-1.032 P1  F42000
G1 X79.017 Y82.987 Z.92
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X79.178 Y82.848 E.00576
G3 X79.755 Y82.593 I.892 J1.238 E.01723
G3 X80.31 Y82.579 I.312 J1.365 E.01513
G3 X78.95 Y83.05 I-.24 J1.508 E.21928
G1 X78.973 Y83.028 E.00086
M204 S10000
G1 X79.292 Y83.299 F42000
G1 F10826.06
M204 S6000
G1 X79.423 Y83.189 E.00463
G3 X79.838 Y83.002 I.655 J.898 E.01243
G1 X80.042 Y82.976 E.00558
G3 X79.252 Y83.343 I.035 J1.111 E.16495
M204 S250
G1 X79.557 Y83.599 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X79.656 Y83.514 E.00329
G3 X79.917 Y83.396 I.417 J.575 E.00726
G1 X80.052 Y83.379 E.00342
G3 X79.518 Y83.645 I.02 J.71 E.09664
; WIPE_START
M204 S6000
G1 X79.656 Y83.514 E-.07234
G1 X79.773 Y83.444 E-.05173
G1 X79.917 Y83.396 E-.05781
G1 X80.052 Y83.379 E-.05173
G1 X80.188 Y83.389 E-.05172
G1 X80.334 Y83.43 E-.05783
G1 X80.451 Y83.49 E-.04967
G1 X80.57 Y83.585 E-.05788
G1 X80.658 Y83.689 E-.05182
G1 X80.725 Y83.813 E-.05367
G1 X80.767 Y83.949 E-.05385
G1 X80.781 Y84.09 E-.05386
G1 X80.767 Y84.231 E-.05401
G1 X80.734 Y84.337 E-.04207
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.984 Y89.877 Z1.08 F42000
G1 X100.988 Y105.712 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G3 X100.081 Y106.082 I-.893 J-.893 E.02725
G1 X79.919 Y106.082 E.54635
G3 X78.642 Y104.806 I-.014 J-1.262 E.0545
G1 X78.642 Y85.431 E.52499
G1 X79.012 Y85.727 E.01283
G2 X78.642 Y82.763 I1.052 J-1.636 E.23893
G3 X78.644 Y81.163 I32.208 J-.76 E.04336
G3 X79.919 Y79.967 I1.258 J.063 E.05235
G1 X100.151 Y79.968 E.54822
G3 X101.358 Y81.243 I-.052 J1.258 E.05265
G1 X101.358 Y104.806 E.63848
G3 X101.029 Y105.669 I-1.263 J.014 E.02562
M204 S10000
G1 X101.282 Y106.006 F42000
G1 F10826.06
M204 S6000
G3 X100.087 Y106.498 I-1.187 J-1.187 E.03595
G1 X79.913 Y106.498 E.54664
G3 X78.227 Y104.811 I-.008 J-1.679 E.07189
G1 X78.227 Y81.238 E.63877
G3 X79.913 Y79.551 I1.679 J-.008 E.07189
G1 X100.17 Y79.553 E.5489
G3 X101.773 Y81.238 I-.071 J1.673 E.06967
G1 X101.773 Y104.811 E.63877
G3 X101.323 Y105.963 I-1.679 J.008 E.03432
M204 S10000
G1 X101.575 Y106.3 F42000
G1 F10826.06
M204 S6000
G3 X100.092 Y106.914 I-1.482 J-1.482 E.04464
G1 X79.908 Y106.914 E.54693
G3 X77.811 Y104.816 I-.002 J-2.095 E.08928
G1 X77.811 Y81.232 E.63906
G3 X79.908 Y79.135 I2.095 J-.002 E.08928
G1 X100.19 Y79.138 E.54957
G3 X102.189 Y81.233 I-.091 J2.089 E.08669
G1 X102.189 Y104.816 E.63905
G3 X101.617 Y106.257 I-2.096 J.002 E.04302
M204 S250
G1 X101.881 Y106.56 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1800
M204 S5000
G1 X101.86 Y106.584 E.0008
G3 X100.097 Y107.314 I-1.763 J-1.763 E.04922
G1 X80.503 Y107.314 E.49263
G3 X79.295 Y107.24 I-.3 J-4.949 E.03049
G3 X77.41 Y104.822 I.608 J-2.417 E.08302
G1 X77.41 Y81.827 E.57812
G3 X77.485 Y80.619 I4.948 J-.3 E.0305
G3 X79.903 Y78.735 I2.417 J.608 E.08301
G1 X99.497 Y78.735 E.49263
G3 X100.208 Y78.737 I.3 J14.51 E.01788
M73 P18 R8
G3 X102.59 Y81.227 I-.11 J2.489 E.09566
G1 X102.59 Y104.222 E.57811
G3 X102.518 Y105.416 I-4.99 J.3 E.03015
G3 X102.169 Y106.207 I-2.421 J-.595 E.02185
G1 X101.919 Y106.514 E.00995
; WIPE_START
M204 S6000
G1 X101.86 Y106.584 E-.03494
G1 X101.583 Y106.825 E-.13934
G1 X101.164 Y107.075 E-.18533
G1 X100.822 Y107.207 E-.13941
G1 X100.466 Y107.287 E-.13888
G1 X100.145 Y107.311 E-.1221
; WIPE_END
G1 E-.04
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

G1 X99.751 Y105.915
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420126
G1 F11664.377
M204 S6000
G1 X101.017 Y104.649 E.04504
G1 X101.017 Y104.104 E.01372
G1 X99.379 Y105.742 E.05827
G1 X98.833 Y105.742 E.01372
G1 X101.017 Y103.558 E.07767
G1 X101.017 Y103.012 E.01372
G1 X98.288 Y105.742 E.09708
G1 X97.742 Y105.742 E.01372
G1 X101.017 Y102.467 E.11648
G1 X101.017 Y101.921 E.01372
G1 X97.197 Y105.742 E.13588
G1 X96.651 Y105.742 E.01372
G1 X101.017 Y101.376 E.15529
G1 X101.017 Y100.83 E.01372
G1 X96.105 Y105.742 E.17469
G1 X95.56 Y105.742 E.01372
G1 X101.017 Y100.285 E.19409
G1 X101.017 Y99.739 E.01372
G1 X95.014 Y105.742 E.2135
G1 X94.469 Y105.742 E.01372
G1 X101.017 Y99.194 E.2329
G1 X101.017 Y98.648 E.01372
G1 X93.923 Y105.742 E.2523
G1 X93.377 Y105.742 E.01372
G1 X101.017 Y98.103 E.27171
G1 X101.017 Y97.557 E.01372
G1 X92.832 Y105.742 E.29111
G1 X92.286 Y105.742 E.01372
G1 X101.017 Y97.012 E.31051
G1 X101.017 Y96.466 E.01372
G1 X91.741 Y105.742 E.32992
G1 X91.195 Y105.742 E.01372
G1 X101.017 Y95.92 E.34932
G1 X101.017 Y95.375 E.01372
G1 X90.65 Y105.742 E.36872
G1 X90.104 Y105.742 E.01372
G1 X101.017 Y94.829 E.38813
G1 X101.016 Y94.284 E.01372
G1 X89.558 Y105.742 E.40753
G1 X89.013 Y105.742 E.01372
G1 X101.016 Y93.738 E.42693
G1 X101.016 Y93.193 E.01372
G1 X88.467 Y105.742 E.44634
G1 X87.922 Y105.742 E.01372
G1 X101.016 Y92.647 E.46574
G1 X101.016 Y92.102 E.01372
G1 X87.376 Y105.742 E.48514
G1 X86.83 Y105.742 E.01372
G1 X101.016 Y91.556 E.50455
G1 X101.016 Y91.011 E.01372
G1 X86.285 Y105.742 E.52395
G1 X85.739 Y105.742 E.01372
G1 X101.016 Y90.465 E.54335
G1 X101.016 Y89.919 E.01372
G1 X85.194 Y105.742 E.56276
G1 X84.648 Y105.742 E.01372
G1 X101.016 Y89.374 E.58216
G1 X101.016 Y88.828 E.01372
G1 X84.102 Y105.742 E.60156
G1 X83.557 Y105.742 E.01372
G1 X101.016 Y88.283 E.62097
G1 X101.016 Y87.737 E.01372
G1 X83.011 Y105.742 E.64037
G1 X82.466 Y105.742 E.01372
G1 X101.016 Y87.192 E.65977
G1 X101.016 Y86.646 E.01372
G1 X81.92 Y105.742 E.67918
G1 X81.375 Y105.742 E.01372
G1 X101.016 Y86.101 E.69858
M73 P19 R8
G1 X101.016 Y85.555 E.01372
G1 X80.829 Y105.742 E.71798
G1 X80.283 Y105.742 E.01372
G1 X101.016 Y85.01 E.73739
G1 X101.016 Y84.464 E.01372
G1 X79.753 Y105.727 E.75625
G3 X79.369 Y105.565 I.148 J-.888 E.01057
G1 X101.016 Y83.918 E.7699
G1 X101.016 Y83.373 E.01372
G1 X79.112 Y105.277 E.77904
G3 X78.989 Y104.854 I.876 J-.485 E.01115
G1 X101.016 Y82.827 E.78343
G1 X101.015 Y82.282 E.01372
G1 X78.983 Y104.315 E.78364
G1 X78.983 Y103.769 E.01372
G1 X101.015 Y81.736 E.78364
G1 X101.015 Y81.191 E.01372
G1 X78.983 Y103.224 E.78364
G1 X78.983 Y102.678 E.01372
G1 X100.89 Y80.77 E.77918
G2 X100.632 Y80.483 I-.83 J.486 E.00978
G1 X78.983 Y102.132 E.77
G1 X78.983 Y101.587 E.01372
G1 X100.247 Y80.323 E.7563
G2 X99.715 Y80.309 I-.324 J2.255 E.01341
G1 X78.983 Y101.041 E.73738
G1 X78.983 Y100.496 E.01372
G1 X99.169 Y80.309 E.71798
G1 X98.624 Y80.309 E.01372
M73 P19 R7
G1 X78.983 Y99.95 E.69858
G1 X78.983 Y99.404 E.01372
G1 X98.078 Y80.309 E.67917
G1 X97.533 Y80.309 E.01372
G1 X78.983 Y98.859 E.65977
G1 X78.983 Y98.313 E.01372
G1 X96.987 Y80.309 E.64037
G1 X96.442 Y80.309 E.01372
G1 X78.983 Y97.768 E.62097
G1 X78.983 Y97.222 E.01372
G1 X95.896 Y80.309 E.60156
G1 X95.351 Y80.308 E.01372
G1 X78.983 Y96.676 E.58216
G1 X78.983 Y96.131 E.01372
G1 X94.805 Y80.308 E.56276
G1 X94.26 Y80.308 E.01372
G1 X78.983 Y95.585 E.54335
G1 X78.983 Y95.04 E.01372
G1 X93.714 Y80.308 E.52395
G1 X93.168 Y80.308 E.01372
G1 X78.983 Y94.494 E.50455
G1 X78.983 Y93.948 E.01372
G1 X92.623 Y80.308 E.48514
G1 X92.077 Y80.308 E.01372
G1 X78.983 Y93.403 E.46574
G1 X78.983 Y92.857 E.01372
G1 X91.532 Y80.308 E.44634
G1 X90.986 Y80.308 E.01372
G1 X78.983 Y92.312 E.42693
G1 X78.983 Y91.766 E.01372
G1 X90.441 Y80.308 E.40753
G1 X89.895 Y80.308 E.01372
G1 X78.983 Y91.221 E.38813
G1 X78.983 Y90.675 E.01372
G1 X89.35 Y80.308 E.36872
G1 X88.804 Y80.308 E.01372
G1 X78.983 Y90.129 E.34932
G1 X78.983 Y89.584 E.01372
G1 X88.259 Y80.308 E.32992
M73 P20 R7
G1 X87.713 Y80.308 E.01372
G1 X78.983 Y89.038 E.31051
G1 X78.983 Y88.493 E.01372
G1 X87.167 Y80.308 E.29111
G1 X86.622 Y80.308 E.01372
G1 X82.285 Y84.645 E.15426
G1 X82.316 Y84.545 E.00262
G1 X82.355 Y84.029 E.01303
G1 X86.076 Y80.308 E.13235
G1 X85.531 Y80.308 E.01372
G1 X82.289 Y83.549 E.11529
G1 X82.15 Y83.142 E.01081
G1 X84.985 Y80.308 E.10083
G1 X84.44 Y80.308 E.01372
G1 X81.956 Y82.791 E.08832
G1 X81.708 Y82.494 E.00974
G1 X83.894 Y80.307 E.07777
G1 X83.349 Y80.307 E.01372
G1 X81.412 Y82.244 E.06888
G2 X81.07 Y82.04 I-.848 J1.033 E.01005
G1 X82.803 Y80.307 E.06163
G1 X82.258 Y80.307 E.01372
G1 X80.668 Y81.897 E.05653
G2 X80.206 Y81.813 I-.437 J1.101 E.01189
G1 X81.712 Y80.307 E.05357
G1 X81.166 Y80.307 E.01372
G1 X79.626 Y81.847 E.05478
G1 X79.096 Y82.019 E.01401
G1 X78.985 Y82.083 E.00322
G1 X78.986 Y81.942 E.00354
G1 X80.621 Y80.307 E.05816
G1 X80.075 Y80.307 E.01372
G1 X78.814 Y81.569 E.04487
; WIPE_START
G1 X80.075 Y80.307 E-.678
G1 X80.291 Y80.307 E-.082
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.628 Y83.085 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0948578
G1 F18000
M204 S6000
G1 X78.564 Y83.154 E.00037
; LINE_WIDTH: 0.124513
G1 X78.434 Y83.321 E.00124
M204 S10000
G1 X78.434 Y84.908 F42000
; LINE_WIDTH: 0.101935
G1 F18000
M204 S6000
G2 X78.679 Y85.164 I2.713 J-2.347 E.00156
M204 S10000
G1 X78.85 Y85.87 F42000
; LINE_WIDTH: 0.102038
G1 F18000
M204 S6000
G1 X78.892 Y85.945 E.00038
G1 X79.054 Y86.009 E.00077
M204 S10000
G1 X79.673 Y86.166 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420126
G1 F11664.377
M204 S6000
G1 X78.983 Y86.856 E.02454
G1 X78.983 Y87.401 E.01372
G1 X80.012 Y86.372 E.03663
G1 X80.127 Y86.38 E.00289
G1 X80.544 Y86.328 E.01055
G1 X80.631 Y86.299 E.00232
G1 X78.809 Y88.121 E.0648
; WIPE_START
G1 X80.223 Y86.706 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.763 Y81.456 Z1.08 F42000
G1 X90.958 Y76.531 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X89.042 Y76.531 E.05192
G1 X89.042 Y74.817 E.04645
G1 X90.958 Y74.817 E.05192
G1 X90.958 Y76.471 E.04482
M204 S10000
G1 X91.374 Y76.947 F42000
G1 F10826.06
M204 S6000
G1 X88.626 Y76.947 E.07445
G1 X88.626 Y74.401 E.06897
G1 X91.374 Y74.401 E.07445
G1 X91.374 Y76.887 E.06735
M204 S10000
G1 X91.789 Y77.362 F42000
G1 F10826.06
M204 S6000
G1 X88.211 Y77.362 E.09697
G1 X88.211 Y73.986 E.0915
G1 X91.789 Y73.986 E.09697
G1 X91.789 Y77.302 E.08987
M204 S250
G1 X92.19 Y77.568 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1444.951
M204 S5000
G1 X92.19 Y77.763 E.00491
M106 S255
G1 F600
G1 X87.81 Y77.763 E.11012
M106 S198.9
G1 F1444.951
G1 X87.81 Y77.568 E.00491
G1 F4319.819
G1 X87.81 Y77.168 E.01006
G1 F8730.686
G1 X87.81 Y76.768 E.01006
G1 F11668.197
G1 X87.81 Y76.368 E.01006
G1 X87.81 Y74.979 E.03491
G1 X87.81 Y74.579 E.01006
G1 F8721.108
G1 X87.81 Y74.179 E.01006
G1 F4313.082
G1 X87.81 Y73.779 E.01006
G1 F1441.056
G1 X87.81 Y73.585 E.00489
M106 S255
G1 F600
G1 X92.19 Y73.585 E.11012
M106 S198.9
G1 F1441.056
G1 X92.19 Y73.779 E.00489
G1 F4313.082
G1 X92.19 Y74.179 E.01006
G1 F8721.108
G1 X92.19 Y74.579 E.01006
G1 F11668.197
G1 X92.19 Y74.979 E.01006
G1 X92.19 Y77.508 E.06357
; WIPE_START
M204 S6000
G1 X92.19 Y77.763 E-.09694
G1 X90.445 Y77.763 E-.66306
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.08 I1.214 J.083 P1  F42000
G1 X90.557 Y76.13 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F11668.309
M204 S6000
G1 X90.557 Y75.218 E.02295
G1 X89.443 Y75.218 E.02803
G1 X89.443 Y76.13 E.02295
G1 X90.497 Y76.13 E.02652
M204 S10000
G1 X89.899 Y75.674 F42000
; LINE_WIDTH: 0.561456
G1 F8536.956
M204 S6000
G1 X90.041 Y75.674 E.00488
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F8536.956
G1 X89.899 Y75.674 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/50
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.08 I-.74 J-.966 P1  F42000
G1 X79.559 Y83.596 Z1.08
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X79.651 Y83.516 E.00306
G3 X79.912 Y83.396 I.419 J.573 E.00727
G1 X80.052 Y83.379 E.00356
G3 X79.519 Y83.641 I.018 J.71 E.09678
; WIPE_START
M204 S6000
G1 X79.651 Y83.516 E-.06898
G1 X79.783 Y83.44 E-.05785
G1 X79.912 Y83.396 E-.05181
G1 X80.052 Y83.379 E-.05381
G1 X80.193 Y83.389 E-.05373
G1 X80.324 Y83.426 E-.0517
G1 X80.46 Y83.496 E-.05787
G1 X80.567 Y83.581 E-.05185
G1 X80.657 Y83.689 E-.05378
G1 X80.725 Y83.813 E-.05378
G1 X80.767 Y83.948 E-.05371
G1 X80.772 Y84.198 E-.09495
G1 X80.738 Y84.333 E-.05274
G1 X80.734 Y84.341 E-.00343
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.988 Y89.877 Z1.24 F42000
G1 X101.923 Y106.666 Z1.24
G1 Z.84
G1 E.8 F1800
G1 F2880
M204 S5000
G1 X101.842 Y106.746 E.00287
G3 X100.097 Y107.419 I-1.744 J-1.925 E.04808
G1 X80.503 Y107.419 E.49263
G3 X79.27 Y107.341 I-.3 J-5.058 E.03114
G3 X77.306 Y104.822 I.642 J-2.526 E.08645
G1 X77.306 Y81.829 E.57806
G3 X77.383 Y80.596 I5.082 J-.3 E.03114
G3 X79.903 Y78.63 I2.526 J.64 E.08649
G1 X100.164 Y78.632 E.50939
G3 X102.694 Y81.227 I-.065 J2.594 E.10089
G1 X102.694 Y104.222 E.57811
G3 X102.582 Y105.578 I-4.641 J.3 E.03433
G3 X102.022 Y106.566 I-2.485 J-.756 E.02881
M73 P21 R7
G1 X101.965 Y106.623 E.00202
; WIPE_START
M204 S6000
G1 X101.842 Y106.746 E-.06621
G1 X101.647 Y106.907 E-.09596
G1 X101.322 Y107.113 E-.14633
G1 X101.093 Y107.221 E-.09616
G1 X100.853 Y107.307 E-.09682
G1 X100.545 Y107.379 E-.1203
G1 X100.182 Y107.411 E-.13822
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

G1 X100.406 Y78.863
G1 Z.84
G1 E.8 F1800
; FEATURE: Top surface
G1 F11668.197
M204 S2000
G1 X102.281 Y80.737 E.06664
G1 X102.281 Y81.283
G1 X99.842 Y78.844 E.08671
G1 X99.297 Y78.844
G1 X102.281 Y81.828 E.1061
G1 X102.281 Y82.374
G1 X98.751 Y78.844 E.1255
G1 X98.206 Y78.844
G1 X102.281 Y82.919 E.14489
G1 X102.281 Y83.464
G1 X97.66 Y78.844 E.16428
G1 X97.115 Y78.844
G1 X102.281 Y84.01 E.18368
G1 X102.281 Y84.555
G1 X96.569 Y78.844 E.20307
G1 X96.024 Y78.844
G1 X102.281 Y85.101 E.22246
G1 X102.281 Y85.646
G1 X95.479 Y78.844 E.24186
G1 X94.933 Y78.844
G1 X102.281 Y86.191 E.26125
G1 X102.281 Y86.737
G1 X94.388 Y78.844 E.28065
G1 X93.842 Y78.844
G1 X102.281 Y87.282 E.30004
G1 X102.281 Y87.828
G1 X93.297 Y78.844 E.31943
G1 X92.751 Y78.843
G1 X102.281 Y88.373 E.33883
G1 X102.281 Y88.918
G1 X92.206 Y78.843 E.35822
G1 X91.66 Y78.843
G1 X102.281 Y89.464 E.37761
G1 X102.281 Y90.009
G1 X91.115 Y78.843 E.39701
G1 X90.569 Y78.843
G1 X102.281 Y90.555 E.4164
G1 X102.281 Y91.1
G1 X90.024 Y78.843 E.4358
G1 X89.479 Y78.843
G1 X102.281 Y91.645 E.45519
G1 X102.281 Y92.191
G1 X88.933 Y78.843 E.47458
G1 X88.388 Y78.843
G1 X102.281 Y92.736 E.49398
G1 X102.281 Y93.282
G1 X87.842 Y78.843 E.51337
G1 X87.297 Y78.843
G1 X102.281 Y93.827 E.53276
G1 X102.281 Y94.373
G1 X86.751 Y78.843 E.55216
G1 X86.206 Y78.843
G1 X102.281 Y94.918 E.57155
G1 X102.281 Y95.463
G1 X85.668 Y78.851 E.59066
G1 X85.316 Y79.044
G1 X102.281 Y96.009 E.6032
G1 X102.281 Y96.554
G1 X84.77 Y79.044 E.62259
G1 X84.225 Y79.044
G1 X102.281 Y97.1 E.64198
G1 X102.281 Y97.645
G1 X83.68 Y79.044 E.66137
M73 P22 R7
G1 X83.134 Y79.044
G1 X102.281 Y98.19 E.68076
G1 X102.281 Y98.736
G1 X82.589 Y79.044 E.70016
G1 X82.043 Y79.044
G1 X102.281 Y99.281 E.71955
G1 X102.281 Y99.827
G1 X81.498 Y79.044 E.73894
G1 X80.953 Y79.044
G1 X102.281 Y100.372 E.75833
G1 X102.281 Y100.917
G1 X80.407 Y79.044 E.77772
G1 X79.862 Y79.044
G1 X102.281 Y101.463 E.79712
G1 X102.281 Y102.008
G1 X79.316 Y79.044 E.81651
G1 X78.826 Y79.099
G1 X102.281 Y102.554 E.83393
G1 X102.281 Y103.099
G1 X78.488 Y79.306 E.84596
G1 X78.197 Y79.56
G1 X102.281 Y103.644 E.85632
G1 X102.281 Y104.19
G1 X77.95 Y79.858 E.86511
G1 X77.748 Y80.203
G1 X102.281 Y104.735 E.87226
G1 X102.281 Y105.281
G1 X80.984 Y83.983 E.75723
G1 X80.913 Y84.458
G1 X102.266 Y105.811 E.75921
G1 X102.071 Y106.162
G1 X80.684 Y84.774 E.76043
G1 X80.335 Y84.971
G1 X101.828 Y106.464 E.76418
G1 X101.54 Y106.721
G1 X79.783 Y84.964 E.77359
; WIPE_START
M204 S6000
G1 X81.197 Y86.378 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.175 Y83.175 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X77.719 Y80.719 E.08733
G1 X77.719 Y81.264
G1 X79.699 Y83.244 E.07039
G1 X79.383 Y83.474
G1 X77.719 Y81.81 E.05916
G1 X77.719 Y82.355
G1 X79.189 Y83.825 E.05227
G1 X79.197 Y84.378
G1 X77.719 Y82.901 E.05253
G1 X77.719 Y83.446
G1 X101.207 Y106.933 E.8351
G1 X100.822 Y107.094
G1 X77.719 Y83.991 E.82142
M73 P23 R7
G1 X77.719 Y84.537
G1 X100.372 Y107.189 E.80542
G1 X99.844 Y107.207
G1 X77.719 Y85.082 E.78664
G1 X77.719 Y85.628
G1 X99.298 Y107.207 E.76725
G1 X98.753 Y107.207
G1 X77.719 Y86.173 E.74786
G1 X77.719 Y86.718
G1 X98.207 Y107.207 E.72846
G1 X97.662 Y107.207
G1 X77.719 Y87.264 E.70907
G1 X77.719 Y87.809
G1 X97.117 Y107.207 E.68968
G1 X96.571 Y107.207
G1 X77.719 Y88.355 E.67029
G1 X77.719 Y88.9
G1 X96.026 Y107.207 E.6509
G1 X95.48 Y107.207
G1 X77.719 Y89.445 E.6315
G1 X77.719 Y89.991
G1 X94.935 Y107.207 E.61211
G1 X94.39 Y107.207
G1 X77.719 Y90.536 E.59272
G1 X77.719 Y91.082
G1 X93.844 Y107.207 E.57333
G1 X93.299 Y107.207
G1 X77.719 Y91.627 E.55394
G1 X77.719 Y92.172
G1 X92.753 Y107.207 E.53454
G1 X92.208 Y107.207
G1 X77.719 Y92.718 E.51515
G1 X77.719 Y93.263
G1 X91.663 Y107.207 E.49576
G1 X91.117 Y107.207
G1 X77.719 Y93.809 E.47637
G1 X77.719 Y94.354
G1 X90.572 Y107.207 E.45698
G1 X90.026 Y107.207
G1 X77.719 Y94.9 E.43758
G1 X77.719 Y95.445
G1 X89.481 Y107.207 E.41819
G1 X88.936 Y107.207
G1 X77.719 Y95.99 E.3988
G1 X77.719 Y96.536
G1 X88.39 Y107.207 E.37941
G1 X87.845 Y107.207
G1 X77.719 Y97.081 E.36002
G1 X77.719 Y97.627
G1 X87.299 Y107.207 E.34062
M73 P24 R7
G1 X86.754 Y107.207
G1 X77.719 Y98.172 E.32123
G1 X77.719 Y98.717
G1 X86.208 Y107.207 E.30184
G1 X85.462 Y107.005
G1 X77.719 Y99.263 E.27529
G1 X77.719 Y99.808
G1 X84.916 Y107.005 E.25589
G1 X84.371 Y107.005
G1 X77.719 Y100.354 E.2365
G1 X77.719 Y100.899
G1 X83.825 Y107.005 E.21711
G1 X83.28 Y107.005
G1 X77.719 Y101.444 E.19771
G1 X77.719 Y101.99
G1 X82.734 Y107.005 E.17832
G1 X82.189 Y107.005
G1 X77.719 Y102.535 E.15892
G1 X77.719 Y103.081
G1 X81.643 Y107.005 E.13953
G1 X81.098 Y107.005
G1 X77.719 Y103.626 E.12013
G1 X77.719 Y104.171
G1 X80.553 Y107.005 E.10074
G1 X80.007 Y107.005
G1 X77.719 Y104.717 E.08135
G1 X77.719 Y105.262
G1 X79.462 Y107.005 E.06195
; WIPE_START
M204 S6000
G1 X78.047 Y105.59 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.665 Y97.983 Z1.24 F42000
G1 X79.716 Y85.031 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.18478
G1 F18000
M204 S6000
G3 X79.539 Y84.901 I1.225 J-1.858 E.00216
; LINE_WIDTH: 0.153164
G1 X79.396 Y84.772 E.00148
G3 X79.266 Y84.63 I1.364 J-1.372 E.00149
; LINE_WIDTH: 0.182781
G1 X79.129 Y84.446 E.00222
; WIPE_START
G1 X79.266 Y84.63 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.299 Y84.981 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.0821254
G1 F18000
M204 S6000
G3 X80.154 Y85.062 I-.782 J-1.226 E.00052
; WIPE_START
G1 X80.299 Y84.981 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.062 Y83.905 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.106774
G1 F18000
M204 S6000
G2 X80.859 Y83.614 I-2.973 J1.863 E.00168
M204 S10000
G1 X81.041 Y83.768 F42000
; LINE_WIDTH: 0.126456
G1 F18000
M204 S6000
G1 X80.974 Y83.993 E.00141
; WIPE_START
G1 X81.041 Y83.768 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.389 Y83.116 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.101706
G1 F18000
M204 S6000
G1 X80.163 Y83.187 E.00104
M204 S10000
G1 X80.54 Y83.296 F42000
; LINE_WIDTH: 0.115376
G1 F18000
M204 S6000
G1 X80.494 Y83.26 E.00031
G2 X80.25 Y83.101 I-2.301 J3.243 E.00154
; WIPE_START
G1 X80.494 Y83.26 E-.63171
G1 X80.54 Y83.296 E-.12829
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.106 Y82.29 Z1.24 F42000
G1 X102.3 Y80.404 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.211441
G1 F18000
M204 S6000
G1 X102.186 Y80.238 E.00232
; LINE_WIDTH: 0.239385
G1 X102.119 Y80.145 E.00153
; LINE_WIDTH: 0.272754
G1 X102.051 Y80.055 E.00175
; LINE_WIDTH: 0.299789
G1 F16952.205
G1 X101.984 Y79.971 E.00186
; LINE_WIDTH: 0.343252
G1 F14567.089
G2 X101.445 Y79.418 I-3.749 J3.112 E.01556
; LINE_WIDTH: 0.31602
G1 F15975.374
G1 X101.312 Y79.308 E.00317
; LINE_WIDTH: 0.277965
G1 F18000
G1 X101.176 Y79.203 E.00274
; LINE_WIDTH: 0.238728
G1 X101.087 Y79.138 E.00146
; LINE_WIDTH: 0.200053
G1 X100.787 Y78.932 E.00393
; WIPE_START
G1 X101.087 Y79.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.362 Y85.133 Z1.24 F42000
G1 X79.106 Y107.024 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.252019
G1 F18000
M204 S6000
G1 X78.966 Y106.925 E.00244
; LINE_WIDTH: 0.28038
G1 X78.825 Y106.825 E.00276
; LINE_WIDTH: 0.309043
G1 F16381.103
G1 X78.74 Y106.76 E.00193
; LINE_WIDTH: 0.34654
G1 F14413.662
G3 X78.569 Y106.62 I2.787 J-3.571 E.0045
; LINE_WIDTH: 0.378948
G1 F13058.178
G3 X78.034 Y106.072 I2.978 J-3.441 E.01722
; LINE_WIDTH: 0.335686
G1 F14932.832
G1 X77.964 Y105.984 E.00219
; LINE_WIDTH: 0.308949
G1 F16386.731
G1 X77.899 Y105.899 E.00192
; LINE_WIDTH: 0.280101
G1 F18000
G1 X77.8 Y105.758 E.00277
; LINE_WIDTH: 0.251261
G1 X77.7 Y105.617 E.00244
; WIPE_START
G1 X77.8 Y105.758 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.95 Y98.806 Z1.24 F42000
G1 X90.958 Y76.727 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X89.042 Y76.727 E.05192
G1 X89.042 Y74.622 E.05703
G1 X90.958 Y74.622 E.05192
G1 X90.958 Y76.667 E.05541
M204 S10000
G1 X91.374 Y77.143 F42000
G1 F10826.06
M204 S6000
G1 X88.626 Y77.143 E.07445
G1 X88.626 Y74.207 E.07956
G1 X91.374 Y74.207 E.07445
G1 X91.374 Y77.083 E.07793
M204 S10000
G1 X91.789 Y77.558 F42000
G1 F10826.06
M204 S6000
G1 X88.211 Y77.558 E.09697
G1 X88.211 Y73.791 E.10208
G1 X91.789 Y73.791 E.09697
G1 X91.789 Y77.498 E.10046
M204 S250
G1 X92.19 Y77.804 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1900.234
M204 S5000
G1 X92.19 Y77.959 E.00389
G1 F1080
G1 X87.81 Y77.959 E.11012
G1 F1900.234
G1 X87.81 Y77.804 E.00389
G1 F5084.33
G1 X87.81 Y77.404 E.01006
G1 F9804.426
G1 X87.81 Y77.004 E.01006
G1 F11668.197
G1 X87.81 Y76.604 E.01006
G1 X87.81 Y74.744 E.04676
G1 X87.81 Y74.344 E.01006
G1 F9789.888
G1 X87.81 Y73.944 E.01006
G1 F5073.863
G1 X87.81 Y73.544 E.01006
G1 F1893.837
G1 X87.81 Y73.39 E.00387
G1 F1080
G1 X92.19 Y73.39 E.11012
G1 F1893.837
G1 X92.19 Y73.544 E.00387
G1 F5073.863
G1 X92.19 Y73.944 E.01006
G1 F9789.888
G1 X92.19 Y74.344 E.01006
G1 F11668.197
G1 X92.19 Y74.744 E.01006
G1 X92.19 Y77.744 E.07543
; WIPE_START
M204 S6000
G1 X92.19 Y77.959 E-.08164
G1 X90.405 Y77.959 E-.67836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.24 I1.212 J.113 P1  F42000
G1 X90.557 Y76.326 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F11668.309
M204 S6000
G1 X90.557 Y75.023 E.03277
G1 X89.443 Y75.023 E.02803
G1 X89.443 Y76.326 E.03277
G1 X90.497 Y76.326 E.02652
M204 S10000
G1 X90.182 Y75.951 F42000
; LINE_WIDTH: 0.398906
G1 F12343.309
M204 S6000
G1 X90.182 Y75.398 E.01315
G1 X89.818 Y75.398 E.00866
G1 X89.818 Y75.951 E.01315
G1 X90.122 Y75.951 E.00724
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12343.309
G1 X89.818 Y75.951 E-.13037
G1 X89.818 Y75.398 E-.23679
G1 X90.182 Y75.398 E-.15605
G1 X90.182 Y75.951 E-.23679
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/50
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.24 I-1.19 J-.253 P1  F42000
G1 X85.01 Y100.315 Z1.24
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2919
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2919
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.629 Y91.785 Z1.4 F42000
G1 X79.576 Y83.611 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2919
M204 S5000
M73 P25 R7
G1 X79.668 Y83.529 E.00275
G3 X79.917 Y83.417 I.402 J.56 E.00615
G1 X80.053 Y83.4 E.00307
G3 X79.535 Y83.655 I.017 J.689 E.08356
M204 S250
G1 X79.427 Y84.384 F42000
G1 F2919
M204 S5000
G1 X79.404 Y84.332 E.00127
G3 X80.091 Y83.379 I.668 J-.243 E.03096
G1 X80.158 Y83.384 E.00152
G3 X79.465 Y84.459 I-.087 J.705 E.06426
G1 X79.454 Y84.438 E.00054
; WIPE_START
G1 F12000
M204 S6000
G1 X79.404 Y84.332 E-.0444
G1 X79.367 Y84.196 E-.05373
G1 X79.36 Y84.054 E-.05387
G1 X79.381 Y83.914 E-.05376
G1 X79.429 Y83.781 E-.05388
G1 X79.503 Y83.66 E-.05378
G1 X79.6 Y83.556 E-.05383
G1 X79.714 Y83.474 E-.0537
G1 X79.844 Y83.416 E-.05385
G1 X80.091 Y83.379 E-.09497
G1 X80.158 Y83.384 E-.02575
G1 X80.296 Y83.416 E-.05379
G1 X80.425 Y83.474 E-.05377
G1 X80.54 Y83.556 E-.05387
G1 X80.546 Y83.562 E-.00305
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2919
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2919
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.743 Y79.729 Z1.4 F42000
G1 X90.958 Y78.033 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2919
M204 S6000
G1 X89.042 Y78.033 E.05192
G1 X89.042 Y77.986 E.00125
G1 X89.042 Y77.586 E.01084
G1 X89.042 Y77.186 E.01084
G1 X89.042 Y74.455 E.07401
G1 X90.958 Y74.455 E.05192
G1 X90.958 Y77.973 E.09531
M204 S10000
G1 X91.374 Y78.448 F42000
G1 F1080
M204 S6000
G1 X88.626 Y78.448 E.07445
M106 S255
G1 F600
G1 X88.626 Y77.986 E.01251
M106 S201.45
G1 F2725.645
G1 X88.626 Y77.586 E.01084
G1 F2919
G1 X88.626 Y77.186 E.01084
G1 X88.626 Y76.786 E.01084
G1 X88.626 Y74.04 E.07443
G1 X91.374 Y74.04 E.07445
G1 X91.374 Y76.786 E.07443
G1 X91.374 Y77.186 E.01084
G1 X91.374 Y77.586 E.01084
G1 F2725.645
G1 X91.374 Y77.986 E.01084
M106 S255
G1 F600
G1 X91.374 Y78.388 E.01088
M106 S201.45
M204 S10000
G1 X91.789 Y78.864 F42000
G1 F2919
M204 S6000
G1 X89.411 Y78.864 E.06446
G1 X89.011 Y78.864 E.01084
G1 X88.611 Y78.864 E.01084
G1 X88.211 Y78.864 E.01084
G1 F1809.07
G1 X88.211 Y78.604 E.00705
M106 S255
G1 F600
G1 X88.211 Y77.986 E.01672
M106 S201.45
G1 F2725.645
G1 X88.211 Y77.586 E.01084
G1 F2919
G1 X88.211 Y77.186 E.01084
G1 X88.211 Y76.786 E.01084
G1 X88.211 Y73.624 E.0857
G1 X91.789 Y73.624 E.09697
G1 X91.789 Y76.786 E.0857
G1 X91.789 Y77.186 E.01084
G1 X91.789 Y77.586 E.01084
G1 F2725.645
G1 X91.789 Y77.986 E.01084
M106 S255
G1 F600
G1 X91.789 Y78.604 E.01673
M106 S201.45
G1 F1471.141
G1 X91.789 Y78.804 E.00542
M204 S250
G1 X92.19 Y78.551 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2919
M204 S5000
G1 X99.497 Y78.551 E.18372
G3 X100.749 Y78.631 I.3 J5.133 E.03162
G3 X101.49 Y78.942 I-.671 J2.641 E.02026
G1 X101.49 Y78.988 E.00115
G1 X101.49 Y79.265 E.00696
G1 X101.09 Y79.265 E.01006
G1 X86.01 Y79.265 E.37913
G1 X86.01 Y78.815 E.01131
G1 X79.636 Y78.815 E.16025
G1 X79.236 Y78.815 E.01006
G1 X78.836 Y78.815 E.01006
G1 X78.744 Y78.815 E.00231
G1 X78.757 Y78.808 E.00036
G3 X79.903 Y78.551 I1.151 J2.45 E.02976
G1 X87.01 Y78.551 E.17868
G1 X87.41 Y78.551 E.01006
G1 F2725.645
G1 X87.81 Y78.551 E.01006
M106 S255
G1 F600
G1 X87.81 Y78 E.01386
M106 S201.45
G1 F2725.645
G1 X87.81 Y77.6 E.01006
G1 F2919
G1 X87.81 Y77.2 E.01006
G1 X87.81 Y76.8 E.01006
G1 X87.81 Y76.4 E.01006
G1 X87.81 Y74.549 E.04653
G1 X87.81 Y74.149 E.01006
G1 X87.81 Y73.749 E.01006
G1 X87.81 Y73.349 E.01006
G1 F2178.924
G1 X87.81 Y73.223 E.00317
G1 F1440
G1 X92.19 Y73.223 E.11012
G1 F2178.924
G1 X92.19 Y73.349 E.00317
G1 F2919
G1 X92.19 Y73.749 E.01006
G1 X92.19 Y74.149 E.01006
G1 X92.19 Y74.549 E.01006
G1 X92.19 Y76.4 E.04653
G1 X92.19 Y76.8 E.01006
G1 X92.19 Y77.2 E.01006
G1 X92.19 Y77.6 E.01006
G1 F2725.645
G1 X92.19 Y78 E.01006
M106 S255
G1 F600
G1 X92.19 Y78.491 E.01235
M106 S201.45
; WIPE_START
M204 S6000
G1 X94.19 Y78.508 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.223 Y85.028 Z1.4 F42000
G1 X77.484 Y105.968 Z1.4
G1 Z1
G1 E.8 F1800
G1 F2919
M204 S5000
G3 X77.239 Y105.077 I2.457 J-1.153 E.02333
G1 X77.227 Y104.82 E.00648
G1 X77.227 Y81.827 E.57806
G3 X77.307 Y80.575 I5.131 J-.3 E.03162
G3 X77.49 Y80.069 I2.718 J.696 E.01356
G1 X77.49 Y80.161 E.00231
G1 X77.49 Y80.561 E.01006
G1 X77.49 Y80.961 E.01006
G1 X77.49 Y105.488 E.61665
G1 X77.49 Y105.888 E.01006
G1 X77.49 Y105.934 E.00117
; WIPE_START
G1 F7800
M204 S6000
G1 X77.383 Y105.725 E-.08947
G1 X77.31 Y105.486 E-.095
G1 X77.239 Y105.077 E-.15752
G1 X77.227 Y104.82 E-.09795
G1 X77.227 Y103.977 E-.32006
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.809 Y104.855 Z1.4 F42000
G1 X101.49 Y106.785 Z1.4
G1 Z1
G1 E.8 F1800
G1 F2919
M204 S5000
G1 X101.49 Y107.062 E.00697
G1 X101.49 Y107.107 E.00115
G3 X100.097 Y107.498 I-1.414 J-2.364 E.0368
G1 X80.503 Y107.498 E.49263
G3 X79.251 Y107.418 I-.3 J-5.132 E.03162
G3 X78.743 Y107.234 I.695 J-2.713 E.0136
G1 X78.835 Y107.234 E.00231
G1 X79.235 Y107.234 E.01006
G1 X79.635 Y107.234 E.01006
G1 X86.01 Y107.235 E.16029
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.062 E-.10772
M73 P26 R7
G1 X101.49 Y107.107 E-.0174
G1 X101.243 Y107.241 E-.10671
G1 X100.876 Y107.383 E-.14944
G1 X100.504 Y107.467 E-.14496
G1 X100.097 Y107.498 E-.15507
G1 X99.89 Y107.498 E-.07871
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.616 Y99.9 Z1.4 F42000
G1 X102.51 Y80.069 Z1.4
G1 Z1
G1 E.8 F1800
G1 F2919
M204 S5000
G1 X102.516 Y80.082 E.00036
G3 X102.76 Y80.96 I-2.469 J1.157 E.02303
G1 X102.773 Y81.23 E.00679
G1 X102.773 Y104.222 E.57804
G3 X102.693 Y105.474 I-5.135 J.3 E.03163
G3 X102.51 Y105.98 I-2.72 J-.697 E.01355
G1 X102.51 Y105.888 E.00232
G1 X102.51 Y105.488 E.01006
G1 X102.51 Y105.088 E.01006
G1 X102.51 Y80.561 E.61665
G1 X102.51 Y80.161 E.01006
G1 X102.51 Y80.129 E.0008
; WIPE_START
G1 F7800
M204 S6000
G1 X102.516 Y80.082 E-.0181
G1 X102.658 Y80.448 E-.1494
G1 X102.722 Y80.703 E-.09975
G1 X102.76 Y80.96 E-.09874
G1 X102.773 Y81.23 E-.10268
G1 X102.773 Y81.997 E-.29134
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.22 Y79.037 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.185349
G1 F2919
M204 S6000
G1 X100.904 Y78.978 E.00317
; LINE_WIDTH: 0.225998
G1 X100.787 Y78.959 E.00148
; LINE_WIDTH: 0.260568
G1 X100.671 Y78.943 E.00172
; LINE_WIDTH: 0.300269
G2 X100.442 Y78.921 I-.579 J4.701 E.00399
; LINE_WIDTH: 0.346522
G2 X100.093 Y78.908 I-.368 J5.3 E.00711
G1 X91.99 Y78.908 E.16491
; WIPE_START
G1 F14414.506
G1 X93.99 Y78.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I.424 J-1.141 P1  F42000
G1 X90.557 Y77.632 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F2919
M204 S6000
G1 X90.557 Y74.856 E.06979
G1 X89.443 Y74.856 E.02803
G1 X89.443 Y77.632 E.06979
G1 X90.497 Y77.632 E.02652
M204 S10000
G1 X90.182 Y77.257 F42000
; LINE_WIDTH: 0.398906
G1 F2919
M204 S6000
G1 X90.182 Y75.231 E.04814
G1 X89.818 Y75.231 E.00866
G1 X89.818 Y77.257 E.04814
G1 X90.122 Y77.257 E.00724
; WIPE_START
G1 F12343.309
G1 X89.818 Y77.257 E-.11574
G1 X89.818 Y75.561 E-.64426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I-1.071 J-.578 P1  F42000
G1 X88.01 Y78.908 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.346908
G1 F2919
M204 S6000
G1 X86.21 Y78.908 E.03668
; WIPE_START
G1 F14396.695
G1 X88.01 Y78.908 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.525 Y86.525 Z1.4 F42000
G1 X86.21 Y107.141 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.346616
G1 F2919
M204 S6000
G1 X100.093 Y107.141 E.28261
G2 X100.453 Y107.127 I-.015 J-5.15 E.00734
; LINE_WIDTH: 0.299225
G2 X100.671 Y107.106 I-.333 J-4.47 E.00379
; LINE_WIDTH: 0.260496
G1 X100.787 Y107.09 E.00172
; LINE_WIDTH: 0.225992
G1 X100.904 Y107.071 E.00148
; LINE_WIDTH: 0.185394
G1 X101.22 Y107.012 E.00317
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X100.904 Y107.071 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/50
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.4 I.476 J-1.12 P1  F42000
G1 X85.01 Y100.315 Z1.4
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2681
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z1.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2681
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.63 Y91.785 Z1.56 F42000
G1 X79.577 Y83.609 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2681
M204 S5000
G1 X79.668 Y83.53 E.0027
G3 X79.916 Y83.417 I.402 J.558 E.00615
G1 X80.053 Y83.4 E.00308
G3 X79.536 Y83.653 I.017 J.688 E.08345
M204 S250
G1 X79.433 Y84.404 F42000
G1 F2681
M204 S5000
G1 X79.431 Y84.397 E.00016
G3 X80.092 Y83.379 I.64 J-.308 E.03254
G1 X80.158 Y83.384 E.0015
G3 X79.505 Y84.518 I-.087 J.705 E.06269
G1 X79.465 Y84.455 E.00166
; WIPE_START
G1 F12000
M204 S6000
G1 X79.431 Y84.397 E-.02546
G1 X79.381 Y84.265 E-.05376
G1 X79.36 Y84.054 E-.08052
G1 X79.381 Y83.914 E-.05379
G1 X79.429 Y83.781 E-.05382
G1 X79.503 Y83.66 E-.05378
G1 X79.6 Y83.556 E-.05383
G1 X79.715 Y83.474 E-.05381
G1 X79.844 Y83.416 E-.05377
G1 X80.092 Y83.379 E-.09531
G1 X80.158 Y83.384 E-.02544
G1 X80.296 Y83.416 E-.0538
G1 X80.425 Y83.474 E-.05376
G1 X80.53 Y83.549 E-.04916
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2681
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2681
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.699 Y79.698 Z1.56 F42000
G1 X90.874 Y78.033 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2681
M204 S6000
G1 X89.042 Y78.033 E.04965
G1 X89.042 Y74.313 E.1008
G1 X90.958 Y74.313 E.05192
G1 X90.958 Y78.033 E.1008
G1 X90.934 Y78.033 E.00065
M204 S10000
G1 X91.372 Y78.448 F42000
G1 F2681
M204 S6000
G1 X88.626 Y78.448 E.07441
G1 X88.626 Y73.897 E.12333
G1 X91.374 Y73.897 E.07445
G1 X91.374 Y78.39 E.12174
M204 S10000
G1 X91.789 Y78.495 F42000
G1 F2681
M204 S6000
G1 X91.789 Y78.864 E.01
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y73.481 E.14585
G1 X91.789 Y73.481 E.09697
G1 X91.789 Y78.435 E.13423
M204 S250
G1 X92.19 Y78.495 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2681
M204 S5000
G1 X92.231 Y78.495 E.00103
G1 X99.497 Y78.495 E.18268
G3 X100.763 Y78.577 I.3 J5.192 E.03198
G3 X101.019 Y78.654 I-.661 J2.641 E.00672
M73 P27 R7
G1 X101.172 Y78.715 E.00416
G3 X101.49 Y78.877 I-1.044 J2.439 E.00897
G1 X101.49 Y78.894 E.00042
G1 X101.49 Y79.265 E.00933
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X79.053 Y78.815 E.17491
G1 X78.653 Y78.815 E.01006
G1 X78.619 Y78.815 E.00087
G3 X78.98 Y78.655 I1.41 J2.699 E.00993
G1 X79.137 Y78.604 E.00416
G3 X79.903 Y78.495 I.813 J2.956 E.0195
G1 X87.769 Y78.495 E.19776
G1 X87.81 Y78.495 E.00103
G1 X87.81 Y78.095 E.01006
G1 X87.81 Y74.382 E.09334
G1 X87.81 Y73.982 E.01006
G1 X87.81 Y73.582 E.01006
G1 X87.81 Y73.182 E.01006
G1 F2307.178
G1 X87.81 Y73.081 E.00256
G1 F1680
G1 X92.19 Y73.081 E.11012
G1 F2307.178
G1 X92.19 Y73.182 E.00256
G1 F2681
G1 X92.19 Y73.582 E.01006
G1 X92.19 Y73.982 E.01006
G1 X92.19 Y74.382 E.01006
G1 X92.19 Y78.435 E.10189
; WIPE_START
G1 F11668.197
M204 S6000
G1 X92.231 Y78.495 E-.02761
G1 X94.158 Y78.495 E-.73239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.21 Y85.027 Z1.56 F42000
G1 X77.49 Y106.071 Z1.56
G1 Z1.16
G1 E.8 F1800
G1 F2681
M204 S5000
G1 X77.49 Y106.106 E.00087
G3 X77.17 Y104.819 I2.436 J-1.288 E.03366
G1 X77.17 Y81.827 E.57805
G3 X77.2 Y80.825 I6.557 J-.309 E.02524
G1 X77.23 Y80.662 E.00416
G3 X77.49 Y79.943 I2.984 J.674 E.01928
G1 X77.49 Y79.978 E.00087
G1 X77.49 Y80.378 E.01006
G1 X77.49 Y106.011 E.64447
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.49 Y106.106 E-.03589
G1 X77.33 Y105.744 E-.15029
G1 X77.252 Y105.489 E-.10151
G1 X77.184 Y105.095 E-.15199
G1 X77.17 Y104.819 E-.10471
G1 X77.17 Y104.252 E-.2156
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.762 Y105.043 Z1.56 F42000
G1 X101.49 Y106.785 Z1.56
G1 Z1.16
G1 E.8 F1800
G1 F2681
M204 S5000
G1 X101.49 Y107.156 E.00933
G1 X101.49 Y107.173 E.00045
G3 X101.145 Y107.346 I-1.518 J-2.6 E.0097
G1 X100.991 Y107.404 E.00416
G3 X100.633 Y107.501 I-.956 J-2.805 E.00931
G1 X100.47 Y107.528 E.00416
G3 X99.497 Y107.554 I-.666 J-6.75 E.02449
G1 X80.503 Y107.554 E.47754
G3 X79.237 Y107.472 I-.3 J-5.192 E.03197
G3 X78.617 Y107.234 I.702 J-2.748 E.01674
G1 X78.651 Y107.234 E.00087
G1 X79.051 Y107.234 E.01006
G1 X86.01 Y107.235 E.17495
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.156 E-.14281
G1 X101.49 Y107.173 E-.00677
G1 X101.145 Y107.346 E-.14644
G1 X100.991 Y107.404 E-.06289
G1 X100.633 Y107.501 E-.14065
G1 X100.47 Y107.528 E-.06286
G1 X100.234 Y107.551 E-.09016
G1 X99.951 Y107.552 E-.10742
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.674 Y99.954 Z1.56 F42000
G1 X102.568 Y80.058 Z1.56
G1 Z1.16
G1 E.8 F1800
G1 F2681
M204 S5000
G3 X102.748 Y80.56 I-3.331 J1.476 E.01343
G1 X102.782 Y80.722 E.00417
G3 X102.83 Y81.83 I-6.278 J.823 E.02791
G1 X102.83 Y104.222 E.56296
G3 X102.817 Y105.091 I-7.981 J.314 E.02187
G1 X102.795 Y105.255 E.00416
G3 X102.51 Y106.106 I-2.727 J-.44 E.02266
G1 X102.51 Y106.071 E.00087
G1 X102.51 Y105.671 E.01006
G1 X102.51 Y80.378 E.63592
G1 X102.51 Y79.978 E.01006
G1 X102.51 Y79.943 E.00087
G1 X102.541 Y80.004 E.00171
; WIPE_START
G1 F8640
M204 S6000
G1 X102.67 Y80.305 E-.12443
G1 X102.748 Y80.56 E-.10141
G1 X102.782 Y80.722 E-.06297
G1 X102.816 Y80.955 E-.08921
G1 X102.83 Y81.23 E-.10471
G1 X102.83 Y81.83 E-.228
G1 X102.83 Y81.959 E-.04927
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.29 Y79.022 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.219686
G1 F2681
M204 S6000
G1 X101.101 Y78.986 E.00233
; LINE_WIDTH: 0.248387
G1 X100.911 Y78.95 E.00269
; LINE_WIDTH: 0.281378
G1 X100.796 Y78.931 E.00189
; LINE_WIDTH: 0.315951
G1 X100.678 Y78.915 E.00218
; LINE_WIDTH: 0.356211
G2 X100.446 Y78.893 I-.583 J4.732 E.0049
; LINE_WIDTH: 0.402963
G2 X100.092 Y78.88 I-.37 J5.323 E.0085
G1 X91.99 Y78.88 E.19471
; WIPE_START
G1 F12207.471
G1 X93.99 Y78.88 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.557 Y77.632 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F2681
M204 S6000
G1 X90.557 Y74.713 E.07338
M73 P28 R7
G1 X89.443 Y74.713 E.02803
G1 X89.443 Y77.632 E.07338
G1 X90.497 Y77.632 E.02652
M204 S10000
G1 X90.182 Y77.257 F42000
; LINE_WIDTH: 0.398906
G1 F2681
M204 S6000
G1 X90.182 Y75.088 E.05154
G1 X89.818 Y75.088 E.00866
G1 X89.818 Y77.257 E.05154
G1 X90.122 Y77.257 E.00724
; WIPE_START
G1 F12343.309
G1 X89.818 Y77.257 E-.11574
G1 X89.818 Y75.561 E-.64426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.88 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.403335
G1 F2681
M204 S6000
G1 X86.21 Y78.88 E.0433
; WIPE_START
G1 F12195.156
G1 X88.01 Y78.88 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.526 Y86.497 Z1.56 F42000
G1 X86.21 Y107.169 Z1.56
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.402817
G1 F2681
M204 S6000
G1 X100.092 Y107.169 E.33347
G2 X100.566 Y107.146 I-.012 J-5.068 E.01138
; LINE_WIDTH: 0.34435
G1 X100.679 Y107.134 E.0023
; LINE_WIDTH: 0.315958
G1 X100.795 Y107.118 E.00216
; LINE_WIDTH: 0.285726
G1 X100.885 Y107.103 E.00148
; LINE_WIDTH: 0.257687
G1 X101.087 Y107.067 E.003
; LINE_WIDTH: 0.23039
G1 X101.29 Y107.03 E.00263
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.087 Y107.067 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/50
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.56 I.471 J-1.122 P1  F42000
G1 X85.01 Y100.315 Z1.56
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2664
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z1.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2664
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.632 Y91.784 Z1.72 F42000
G1 X79.581 Y83.606 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2664
M204 S5000
G1 X79.668 Y83.53 E.00258
G3 X79.917 Y83.417 I.402 J.558 E.00615
G1 X80.053 Y83.4 E.00307
G3 X79.54 Y83.649 I.017 J.688 E.08356
M204 S250
G1 X79.428 Y84.38 F42000
G1 F2664
M204 S5000
G1 X79.404 Y84.332 E.0012
G3 X80.093 Y83.379 I.668 J-.243 E.03098
G1 X80.158 Y83.384 E.00147
G3 X79.505 Y84.518 I-.086 J.705 E.06269
G1 X79.457 Y84.432 E.00219
; WIPE_START
G1 F12000
M204 S6000
G1 X79.404 Y84.332 E-.04313
G1 X79.367 Y84.195 E-.05377
G1 X79.36 Y84.054 E-.05377
G1 X79.381 Y83.914 E-.05379
G1 X79.429 Y83.781 E-.0538
G1 X79.503 Y83.66 E-.05377
G1 X79.6 Y83.556 E-.05385
G1 X79.714 Y83.474 E-.05379
G1 X79.843 Y83.416 E-.05373
G1 X80.093 Y83.379 E-.0958
G1 X80.158 Y83.384 E-.02498
G1 X80.296 Y83.416 E-.0538
G1 X80.425 Y83.474 E-.05382
G1 X80.54 Y83.556 E-.05378
G1 X80.548 Y83.565 E-.00442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2664
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2664
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.743 Y79.729 Z1.72 F42000
G1 X90.958 Y78.033 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2664
M204 S6000
G1 X89.042 Y78.033 E.05192
G1 X89.042 Y74.187 E.10419
G1 X90.958 Y74.187 E.05192
G1 X90.958 Y77.973 E.10257
M204 S10000
G1 X91.374 Y78.448 F42000
G1 F2664
M204 S6000
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y73.772 E.12672
G1 X91.374 Y73.772 E.07445
G1 X91.374 Y78.388 E.12509
M204 S10000
G1 X91.789 Y78.858 F42000
G1 F2664
M204 S6000
G1 X91.789 Y78.864 E.00015
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y73.356 E.14925
G1 X91.789 Y73.356 E.09697
G1 X91.789 Y78.798 E.14747
M204 S250
G1 X92.19 Y78.458 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2664
M204 S5000
G1 X100.097 Y78.458 E.1988
G3 X101.49 Y78.835 I.003 J2.751 E.03671
G1 X101.49 Y79.265 E.0108
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.543 Y78.815 E.18774
G3 X79.903 Y78.458 I1.362 J2.422 E.03574
G1 X87.81 Y78.458 E.1988
G1 X87.81 Y74.24 E.10605
G1 X87.81 Y73.84 E.01006
G1 X87.81 Y73.44 E.01006
G1 X87.81 Y73.04 E.01006
G1 X87.81 Y72.955 E.00212
G1 F2160
G1 X92.19 Y72.955 E.11012
G1 F2664
G1 X92.19 Y73.04 E.00212
G1 X92.19 Y73.44 E.01006
G1 X92.19 Y73.84 E.01006
G1 X92.19 Y74.24 E.01006
G1 X92.19 Y78.398 E.10454
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.413 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.708 Y79.727 Z1.72 F42000
G1 X102.51 Y79.867 Z1.72
G1 Z1.32
G1 E.8 F1800
G1 F2664
M204 S5000
G1 X102.539 Y79.919 E.00149
G3 X102.867 Y81.23 I-2.467 J1.313 E.03431
G1 X102.867 Y104.822 E.59313
G3 X102.51 Y106.18 I-2.763 J0 E.0357
G1 X102.51 Y79.927 E.66003
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.539 Y79.919 E-.01156
M73 P29 R7
G1 X102.656 Y80.166 E-.10389
G1 X102.783 Y80.551 E-.15406
G1 X102.853 Y80.951 E-.15426
G1 X102.867 Y81.23 E-.10613
G1 X102.867 Y81.835 E-.23009
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.446 Y89.456 Z1.72 F42000
G1 X101.49 Y106.785 Z1.72
G1 Z1.32
G1 E.8 F1800
G1 F2664
M204 S5000
G1 X101.49 Y107.216 E.01085
G3 X100.097 Y107.591 I-1.395 J-2.406 E.03669
G1 X79.903 Y107.591 E.50771
G3 X78.543 Y107.234 I0 J-2.763 E.03574
G1 X86.01 Y107.235 E.18772
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.216 E-.16555
G1 X101.159 Y107.381 E-.14058
G1 X100.774 Y107.508 E-.15413
G1 X100.371 Y107.578 E-.1552
G1 X100.097 Y107.591 E-.10429
G1 X99.991 Y107.591 E-.04025
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.374 Y107.114 Z1.72 F42000
G1 X77.49 Y106.182 Z1.72
G1 Z1.32
G1 E.8 F1800
G1 F2664
M204 S5000
G3 X77.133 Y104.819 I2.498 J-1.382 E.03578
G1 X77.133 Y81.227 E.59313
G3 X77.49 Y79.869 I2.763 J0 E.0357
G1 X77.49 Y106.122 E.66003
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.321 Y105.823 E-.13043
M73 P29 R6
G1 X77.217 Y105.498 E-.12963
G1 X77.147 Y105.098 E-.15436
G1 X77.133 Y104.819 E-.10613
G1 X77.133 Y104.189 E-.23945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.38 Y106.583 Z1.72 F42000
G1 X86.21 Y107.188 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.440161
G1 F2664
M204 S6000
G1 X100.092 Y107.188 E.36726
G2 X100.507 Y107.17 I-.01 J-5.012 E.01099
; LINE_WIDTH: 0.385878
G1 X100.687 Y107.151 E.00415
; LINE_WIDTH: 0.351807
G1 X100.801 Y107.136 E.00238
; LINE_WIDTH: 0.317227
G1 X100.92 Y107.117 E.00222
; LINE_WIDTH: 0.275687
G1 X101.29 Y107.048 E.00592
; WIPE_START
G1 F18000
G1 X100.92 Y107.117 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.02 Y99.485 Z1.72 F42000
G1 X101.29 Y79.001 Z1.72
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.275456
G1 F2664
M204 S6000
G1 X100.921 Y78.933 E.00589
; LINE_WIDTH: 0.311367
G1 X100.831 Y78.919 E.00164
; LINE_WIDTH: 0.338747
G1 X100.742 Y78.905 E.0018
; LINE_WIDTH: 0.373872
G1 X100.561 Y78.884 E.00403
; LINE_WIDTH: 0.439664
G2 X100.092 Y78.861 I-.539 J6.308 E.0124
G1 X91.99 Y78.861 E.21409
; WIPE_START
G1 F11102.136
G1 X93.99 Y78.861 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.557 Y77.632 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F2664
M204 S6000
G1 X90.557 Y74.588 E.07653
G1 X89.443 Y74.588 E.02803
G1 X89.443 Y77.632 E.07653
G1 X90.497 Y77.632 E.02652
M204 S10000
G1 X90.182 Y77.257 F42000
; LINE_WIDTH: 0.398906
G1 F2664
M204 S6000
G1 X90.182 Y74.963 E.05451
G1 X89.818 Y74.963 E.00866
G1 X89.818 Y77.257 E.05451
G1 X90.122 Y77.257 E.00724
; WIPE_START
G1 F12343.309
G1 X89.818 Y77.257 E-.11574
G1 X89.818 Y75.561 E-.64426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.861 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.440506
G1 F2664
M204 S6000
G1 X86.21 Y78.861 E.04766
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11079.105
G1 X88.01 Y78.861 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/50
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.72 I-1.205 J-.169 P1  F42000
G1 X85.01 Y100.315 Z1.72
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2763
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z1.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2763
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.632 Y91.784 Z1.88 F42000
G1 X79.58 Y83.607 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2763
M204 S5000
G1 X79.667 Y83.53 E.0026
G3 X79.917 Y83.417 I.402 J.559 E.00616
G1 X80.053 Y83.4 E.00307
G3 X79.539 Y83.65 I.017 J.689 E.08364
M204 S250
G1 X79.431 Y84.401 F42000
G1 F2763
M204 S5000
G1 X79.432 Y84.397 E.00009
M73 P30 R6
G3 X80.094 Y83.379 I.64 J-.308 E.03257
G1 X80.158 Y83.384 E.00145
G3 X79.505 Y84.517 I-.086 J.705 E.0627
G1 X79.464 Y84.452 E.00174
; WIPE_START
G1 F12000
M204 S6000
G1 X79.432 Y84.397 E-.02408
G1 X79.381 Y84.265 E-.05374
G1 X79.36 Y84.054 E-.08053
G1 X79.381 Y83.914 E-.05378
G1 X79.429 Y83.781 E-.05382
G1 X79.503 Y83.66 E-.05382
G1 X79.6 Y83.556 E-.05382
G1 X79.714 Y83.474 E-.05375
G1 X79.844 Y83.416 E-.05386
G1 X80.094 Y83.379 E-.09599
G1 X80.158 Y83.384 E-.02467
G1 X80.297 Y83.416 E-.05385
G1 X80.425 Y83.474 E-.05375
G1 X80.533 Y83.551 E-.05053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2763
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2763
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.109 Y80.008 Z1.88 F42000
G1 X91.374 Y78.448 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2763
M204 S6000
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y78.172 E.00747
G1 X91.374 Y78.172 E.07445
G1 X91.374 Y78.388 E.00585
M204 S10000
G1 X91.789 Y78.839 F42000
G1 F2763
M204 S6000
G1 X91.789 Y78.864 E.00068
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y77.757 E.03
G1 X91.789 Y77.757 E.09697
G1 X91.789 Y78.779 E.0277
M204 S250
G1 X92.19 Y78.438 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2763
M204 S5000
G1 X100.097 Y78.438 E.1988
G3 X101.49 Y78.811 I-.022 J2.874 E.03664
G1 X101.49 Y79.265 E.01141
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.506 Y78.815 E.18867
G3 X79.905 Y78.438 I1.404 J2.431 E.03686
G1 X87.81 Y78.438 E.19873
G1 X87.81 Y73.714 E.11877
G1 X87.81 Y73.314 E.01006
G1 X87.81 Y72.914 E.01006
G1 X87.81 Y72.848 E.00168
G1 F2700
G1 X92.19 Y72.848 E.11012
G1 F2763
G1 X92.19 Y72.914 E.00168
G1 X92.19 Y73.314 E.01006
G1 X92.19 Y73.714 E.01006
G1 X92.19 Y78.378 E.11726
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.393 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.711 Y79.69 Z1.88 F42000
G1 X102.51 Y79.828 Z1.88
G1 Z1.48
G1 E.8 F1800
G1 F2763
M204 S5000
G1 X102.557 Y79.911 E.0024
G3 X102.886 Y81.23 I-2.611 J1.352 E.03449
G1 X102.886 Y104.822 E.59313
G3 X102.51 Y106.221 I-2.801 J-.003 E.03686
G1 X102.51 Y79.888 E.66206
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.557 Y79.911 E-.01993
G1 X102.691 Y80.203 E-.12225
G1 X102.802 Y80.548 E-.13744
G1 X102.873 Y80.95 E-.15512
G1 X102.886 Y81.23 E-.10652
G1 X102.886 Y81.805 E-.21874
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.46 Y89.426 Z1.88 F42000
G1 X101.49 Y106.785 Z1.88
G1 Z1.48
G1 E.8 F1800
G1 F2763
M204 S5000
G1 X101.49 Y107.238 E.01141
G3 X100.097 Y107.611 I-1.42 J-2.517 E.03664
G1 X79.903 Y107.611 E.50771
G3 X78.502 Y107.234 I.003 J-2.801 E.0369
G1 X86.01 Y107.235 E.18877
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.238 E-.17389
G1 X101.166 Y107.397 E-.13705
G1 X100.776 Y107.527 E-.15634
G1 X100.373 Y107.597 E-.15539
G1 X100.097 Y107.611 E-.10502
G1 X100.012 Y107.611 E-.03231
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.394 Y107.141 Z1.88 F42000
G1 X77.49 Y106.221 Z1.88
G1 Z1.48
G1 E.8 F1800
G1 F2763
M204 S5000
G3 X77.114 Y104.819 I2.509 J-1.425 E.03687
G1 X77.114 Y81.227 E.59313
G3 X77.49 Y79.828 I2.8 J.002 E.03686
G1 X77.49 Y106.161 E.66204
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.311 Y105.848 E-.13686
M73 P31 R6
G1 X77.197 Y105.501 E-.13895
G1 X77.127 Y105.099 E-.15498
G1 X77.114 Y104.819 E-.1063
G1 X77.114 Y104.233 E-.22291
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.37 Y106.598 Z1.88 F42000
G1 X86.21 Y107.198 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.459707
G1 F2763
M204 S6000
G1 X100.092 Y107.198 E.38494
G2 X100.45 Y107.185 I-.018 J-5.423 E.00994
; LINE_WIDTH: 0.412416
G2 X100.683 Y107.162 I-.35 J-4.75 E.00577
; LINE_WIDTH: 0.371543
G1 X100.801 Y107.145 E.00262
; LINE_WIDTH: 0.335338
G1 X100.924 Y107.126 E.00243
; LINE_WIDTH: 0.29293
G1 X101.29 Y107.057 E.00628
; WIPE_START
G1 F17401.839
G1 X100.924 Y107.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.023 Y99.494 Z1.88 F42000
G1 X101.29 Y78.987 Z1.88
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.304622
G1 F2763
M204 S6000
G1 X101.044 Y78.945 E.00439
; LINE_WIDTH: 0.339434
G1 X100.798 Y78.903 E.00496
; LINE_WIDTH: 0.372218
G1 X100.685 Y78.888 E.00252
; LINE_WIDTH: 0.412211
G2 X100.45 Y78.864 I-.589 J4.774 E.00582
; LINE_WIDTH: 0.459552
G2 X100.092 Y78.851 I-.376 J5.425 E.00993
G1 X91.99 Y78.851 E.22459
; WIPE_START
G1 F10582.867
G1 X93.99 Y78.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.851 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.459936
G1 F2763
M204 S6000
G1 X86.21 Y78.851 E.04994
; WIPE_START
G1 F10573.309
G1 X88.01 Y78.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y73.22 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.379026
G1 F2763
M204 S6000
G1 X91.99 Y73.22 E.08942
M204 S10000
G1 X91.145 Y73.419 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2763
M204 S2000
G1 X91.978 Y74.252 E.02961
G1 X91.978 Y74.798
G1 X90.6 Y73.419 E.049
G1 X90.054 Y73.419
G1 X91.978 Y75.343 E.0684
G1 X91.978 Y75.889
G1 X89.509 Y73.419 E.08779
G1 X88.963 Y73.419
G1 X91.978 Y76.434 E.10718
G1 X91.978 Y76.979
G1 X88.418 Y73.419 E.12657
G1 X88.022 Y73.569
G1 X91.978 Y77.525 E.14065
G1 X91.437 Y77.53
G1 X88.022 Y74.114 E.12143
G1 X88.022 Y74.66
G1 X90.892 Y77.53 E.10204
G1 X90.347 Y77.53
G1 X88.022 Y75.205 E.08265
G1 X88.022 Y75.751
G1 X89.801 Y77.53 E.06326
G1 X89.256 Y77.53
G1 X88.022 Y76.296 E.04386
G1 X88.022 Y76.841
G1 X88.71 Y77.53 E.02447
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.022 Y76.841 E-.36987
G1 X88.022 Y76.296 E-.20725
G1 X88.362 Y76.636 E-.18288
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/50
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.88 I-1.205 J-.171 P1  F42000
G1 X85.01 Y100.315 Z1.88
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
G1 F2553
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z1.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2553
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.452 Y91.854 Z2.04 F42000
G1 X79.447 Y84.381 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2553
M204 S5000
G1 X79.436 Y84.357 E.00059
G3 X79.917 Y83.417 I.633 J-.269 E.0269
G1 X80.053 Y83.4 E.00307
G3 X79.502 Y84.477 I.017 J.688 E.06368
G1 X79.477 Y84.433 E.00113
M204 S250
G1 X79.584 Y83.573 F42000
G1 F2553
M204 S5000
G1 X79.599 Y83.556 E.00051
G3 X80.054 Y83.379 I.47 J.533 E.01116
G1 X80.09 Y83.379 E.0008
G3 X79.502 Y83.66 I-.021 J.71 E.08477
G1 X79.543 Y83.617 E.00131
; WIPE_START
G1 F12000
M204 S6000
G1 X79.599 Y83.556 E-.0315
G1 X79.714 Y83.474 E-.05385
G1 X79.844 Y83.416 E-.05387
G1 X80.054 Y83.379 E-.0812
G1 X80.09 Y83.379 E-.01358
G1 X80.228 Y83.396 E-.053
G1 X80.362 Y83.441 E-.05375
G1 X80.485 Y83.512 E-.05381
G1 X80.591 Y83.606 E-.05389
G1 X80.677 Y83.719 E-.05379
G1 X80.738 Y83.846 E-.0538
G1 X80.773 Y83.984 E-.05379
G1 X80.78 Y84.125 E-.05378
G1 X80.759 Y84.265 E-.05379
G1 X80.721 Y84.37 E-.0426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2553
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2553
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.71 Y79.705 Z2.04 F42000
G1 X90.894 Y78.033 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2553
M204 S6000
G1 X89.042 Y78.033 E.05019
G1 X89.042 Y77.613 E.01137
G1 X90.958 Y77.613 E.05192
G1 X90.958 Y78.033 E.01137
G1 X90.954 Y78.033 E.00011
M204 S10000
G1 X91.374 Y78.435 F42000
G1 F2553
M204 S6000
G1 X91.374 Y78.448 E.00037
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y77.197 E.0339
G1 X91.374 Y77.197 E.07445
G1 X91.374 Y78.375 E.0319
M204 S10000
G1 X91.789 Y78.435 F42000
G1 F2553
M204 S6000
G1 X91.789 Y78.864 E.01163
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y76.781 E.05643
G1 X91.789 Y76.781 E.09697
G1 X91.789 Y78.375 E.04317
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2553
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.003 J2.804 E.03665
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.496 Y78.815 E.18892
M73 P32 R6
G3 X79.903 Y78.435 I1.41 J2.425 E.03707
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y76.381 E.05163
G1 X92.19 Y76.381 E.11012
G1 X92.19 Y78.375 E.05012
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.683 Z2.04 F42000
G1 X102.51 Y79.82 Z2.04
G1 Z1.64
G1 E.8 F1800
G1 F2553
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.574 J1.344 E.03448
G1 X102.89 Y104.822 E.5932
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02211
G1 X102.678 Y80.157 E-.10417
G1 X102.806 Y80.547 E-.15589
G1 X102.877 Y80.951 E-.15601
G1 X102.89 Y81.227 E-.10513
G1 X102.89 Y81.798 E-.21668
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.418 Z2.04 F42000
G1 X101.49 Y106.785 Z2.04
G1 Z1.64
G1 E.8 F1800
G1 F2553
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50772
G3 X78.494 Y107.234 I.003 J-2.806 E.03711
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.168 Y107.402 E-.13672
G1 X100.778 Y107.531 E-.15589
G1 X100.373 Y107.601 E-.15601
G1 X100.097 Y107.615 E-.10513
G1 X100.016 Y107.615 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z2.04 F42000
G1 X77.49 Y106.229 Z2.04
G1 Z1.64
G1 E.8 F1800
G1 F2553
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.5932
G3 X77.49 Y79.82 I2.805 J.003 E.03707
G1 X77.49 Y106.169 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.12295
G1 X77.194 Y105.502 E-.15593
G1 X77.124 Y105.098 E-.156
G1 X77.11 Y104.822 E-.10515
G1 X77.11 Y104.243 E-.21999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z2.04 F42000
G1 X86.21 Y107.2 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463467
G1 F2553
M204 S6000
G1 X100.092 Y107.2 E.38834
G2 X100.451 Y107.187 I-.017 J-5.417 E.01003
; LINE_WIDTH: 0.41588
G2 X100.686 Y107.163 I-.356 J-4.818 E.00588
; LINE_WIDTH: 0.375289
G1 X100.803 Y107.147 E.00264
; LINE_WIDTH: 0.339901
G1 X100.924 Y107.128 E.00244
; LINE_WIDTH: 0.298045
G1 X101.29 Y107.06 E.00639
; WIPE_START
G1 F17064.293
G1 X100.924 Y107.128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.023 Y99.496 Z2.04 F42000
G1 X101.29 Y78.989 Z2.04
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.297999
G1 F2553
M204 S6000
G1 X100.924 Y78.921 E.00639
; LINE_WIDTH: 0.339514
G1 X100.806 Y78.902 E.00239
; LINE_WIDTH: 0.374932
G1 X100.686 Y78.886 E.00269
; LINE_WIDTH: 0.415897
G2 X100.45 Y78.863 I-.589 J4.768 E.00588
; LINE_WIDTH: 0.463301
G2 X100.092 Y78.85 I-.376 J5.42 E.01002
G1 X91.99 Y78.85 E.22658
; WIPE_START
G1 F10490.385
G1 X93.99 Y78.85 E-.76
; WIPE_END
M73 P33 R6
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2553
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.211 Y74.168 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2553
M204 S6000
G1 X88.211 Y73.154 E.02745
G1 X91.789 Y73.154 E.09697
G1 X91.789 Y74.168 E.02745
G1 X88.271 Y74.168 E.09535
M204 S250
G1 X87.81 Y74.568 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2553
M204 S5000
G1 X87.81 Y73.607 E.02418
G1 X87.81 Y73.207 E.01006
G1 X87.81 Y72.807 E.01006
G1 X87.81 Y72.754 E.00133
G1 X92.19 Y72.754 E.11012
G1 X92.19 Y72.807 E.00133
G1 X92.19 Y73.207 E.01006
G1 X92.19 Y73.607 E.01006
G1 X92.19 Y74.568 E.02418
G1 X87.87 Y74.568 E.10861
; WIPE_START
G1 F11668.197
M204 S6000
G1 X87.81 Y73.607 E-.36615
G1 X87.81 Y73.207 E-.152
G1 X87.81 Y72.807 E-.152
G1 X87.81 Y72.754 E-.02006
G1 X87.994 Y72.754 E-.06979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.418 Y73.661 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.631826
G1 F2553
M204 S6000
G1 X91.582 Y73.661 E.1232
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7531.507
G1 X89.582 Y73.661 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/50
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.04 I-1.199 J-.206 P1  F42000
G1 X85.01 Y100.315 Z2.04
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2522
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2522
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.452 Y91.854 Z2.2 F42000
G1 X79.45 Y84.389 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2522
M204 S5000
G1 X79.402 Y84.255 E.00319
G3 X79.916 Y83.417 I.667 J-.167 E.02449
G1 X80.053 Y83.4 E.00308
G3 X79.479 Y84.441 I.017 J.688 E.06463
M204 S250
G1 X79.586 Y83.571 F42000
G1 F2522
M204 S5000
G1 X79.599 Y83.556 E.00046
G3 X80.054 Y83.379 I.469 J.531 E.01115
G1 X80.091 Y83.379 E.00082
G3 X79.503 Y83.66 I-.023 J.708 E.08441
G1 X79.545 Y83.615 E.00137
; WIPE_START
G1 F12000
M204 S6000
G1 X79.599 Y83.556 E-.03062
G1 X79.714 Y83.474 E-.0538
G1 X79.844 Y83.416 E-.05382
G1 X80.054 Y83.379 E-.08119
G1 X80.091 Y83.379 E-.01398
G1 X80.228 Y83.396 E-.05269
G1 X80.362 Y83.441 E-.05375
G1 X80.485 Y83.512 E-.05382
G1 X80.591 Y83.606 E-.05378
G1 X80.677 Y83.719 E-.05378
G1 X80.738 Y83.846 E-.05379
G1 X80.773 Y83.984 E-.05382
G1 X80.78 Y84.125 E-.05375
G1 X80.759 Y84.265 E-.05386
G1 X80.72 Y84.373 E-.04356
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2522
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2522
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.103 Y80.003 Z2.2 F42000
G1 X91.374 Y78.435 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2522
M204 S6000
G1 X91.374 Y78.448 E.00037
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y77.46 E.02678
G1 X91.374 Y77.46 E.07445
G1 X91.374 Y78.375 E.02478
M204 S10000
G1 X91.789 Y78.435 F42000
G1 F2522
M204 S6000
G1 X91.789 Y78.864 E.01163
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y77.044 E.0493
G1 X91.789 Y77.044 E.09697
G1 X91.789 Y78.375 E.03604
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2522
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.003 J2.806 E.03666
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.496 Y78.815 E.18892
G3 X79.903 Y78.435 I1.41 J2.425 E.03707
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y76.644 E.04502
G1 X92.19 Y76.644 E.11012
G1 X92.19 Y78.375 E.04351
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.683 Z2.2 F42000
G1 X102.51 Y79.82 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F2522
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.572 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.808 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02207
M73 P34 R6
G1 X102.678 Y80.157 E-.10419
G1 X102.806 Y80.547 E-.15594
G1 X102.877 Y80.951 E-.15603
G1 X102.89 Y81.227 E-.1051
G1 X102.89 Y81.798 E-.21668
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.418 Z2.2 F42000
G1 X101.49 Y106.785 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F2522
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.004 J-2.809 E.03711
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.168 Y107.402 E-.13659
G1 X100.778 Y107.531 E-.15612
G1 X100.373 Y107.601 E-.15594
G1 X100.097 Y107.615 E-.10511
G1 X100.016 Y107.615 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z2.2 F42000
G1 X77.49 Y106.229 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F2522
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.808 J.003 E.03707
G1 X77.49 Y106.169 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.12296
G1 X77.194 Y105.502 E-.15598
G1 X77.123 Y105.098 E-.15598
G1 X77.11 Y104.822 E-.10511
G1 X77.11 Y104.243 E-.21998
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z2.2 F42000
G1 X86.21 Y107.2 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463467
G1 F2522
M204 S6000
G1 X100.092 Y107.2 E.38834
G2 X100.451 Y107.187 I-.017 J-5.415 E.01004
; LINE_WIDTH: 0.415921
G2 X100.686 Y107.163 I-.355 J-4.808 E.00588
; LINE_WIDTH: 0.37519
G1 X100.804 Y107.147 E.00266
; LINE_WIDTH: 0.340511
G1 X100.92 Y107.129 E.00233
; LINE_WIDTH: 0.298646
G1 X101.29 Y107.06 E.00648
; WIPE_START
G1 F17025.491
G1 X100.92 Y107.129 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.02 Y99.497 Z2.2 F42000
G1 X101.29 Y78.989 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.29801
G1 F2522
M204 S6000
G1 X100.924 Y78.921 E.00639
; LINE_WIDTH: 0.339058
G1 X100.809 Y78.903 E.00232
; LINE_WIDTH: 0.374476
G1 X100.685 Y78.886 E.00277
; LINE_WIDTH: 0.415938
G2 X100.45 Y78.863 I-.585 J4.732 E.00587
; LINE_WIDTH: 0.463301
G2 X100.092 Y78.85 I-.376 J5.405 E.01003
G1 X91.99 Y78.85 E.22658
; WIPE_START
G1 F10490.377
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.166 Y77.954 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.606836
G1 F2522
M204 S6000
G1 X88.834 Y77.954 E.08702
; WIPE_START
G1 F7860.263
G1 X90.834 Y77.954 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2522
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.211 Y73.905 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2522
M204 S6000
G1 X88.211 Y73.073 E.02254
G1 X91.789 Y73.073 E.09697
G1 X91.789 Y73.905 E.02254
G1 X88.271 Y73.905 E.09535
M204 S250
G1 X87.81 Y74.305 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2522
M204 S5000
G1 X87.81 Y73.513 E.01993
G1 X87.81 Y73.113 E.01006
G1 X87.81 Y72.713 E.01006
G1 X87.81 Y72.672 E.00102
G1 X92.19 Y72.672 E.11012
G1 X92.19 Y72.713 E.00102
G1 X92.19 Y73.113 E.01006
G1 X92.19 Y73.513 E.01006
G1 X92.19 Y74.305 E.01993
G1 X87.87 Y74.305 E.10861
M204 S10000
G1 X88.418 Y73.489 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.450456
G1 F2522
M204 S6000
G1 X91.582 Y73.489 E.0858
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10814.188
G1 X89.582 Y73.489 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/50
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.2 I-1.2 J-.204 P1  F42000
G1 X85.01 Y100.315 Z2.2
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2505
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z1.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2505
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.452 Y91.854 Z2.36 F42000
G1 X79.448 Y84.386 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
M73 P35 R6
G1 F2505
M204 S5000
G1 X79.405 Y84.259 E.00301
G3 X79.984 Y83.406 I.667 J-.17 E.02607
G1 X80.058 Y83.4 E.00164
G3 X79.478 Y84.437 I.015 J.688 E.06476
M204 S250
G1 X79.587 Y83.57 F42000
G1 F2505
M204 S5000
G1 X79.599 Y83.556 E.00041
G3 X80.054 Y83.379 I.469 J.532 E.01115
G1 X80.092 Y83.379 E.00085
G3 X79.502 Y83.66 I-.024 J.709 E.08453
G1 X79.546 Y83.613 E.00142
; WIPE_START
G1 F12000
M204 S6000
G1 X79.599 Y83.556 E-.02974
G1 X79.714 Y83.474 E-.05379
G1 X79.843 Y83.416 E-.05376
G1 X80.054 Y83.379 E-.0812
G1 X80.092 Y83.379 E-.0144
G1 X80.228 Y83.396 E-.05224
G1 X80.362 Y83.441 E-.05382
G1 X80.485 Y83.512 E-.05378
G1 X80.591 Y83.606 E-.05378
G1 X80.677 Y83.719 E-.05388
G1 X80.738 Y83.846 E-.05375
G1 X80.773 Y83.984 E-.05387
G1 X80.78 Y84.122 E-.0528
G1 X80.725 Y84.366 E-.09474
G1 X80.72 Y84.376 E-.00446
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2505
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2505
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.103 Y80.003 Z2.36 F42000
G1 X91.374 Y78.435 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2505
M204 S6000
G1 X91.374 Y78.448 E.00037
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y77.643 E.02182
G1 X91.374 Y77.643 E.07445
G1 X91.374 Y78.375 E.01983
M204 S10000
G1 X91.789 Y78.435 F42000
G1 F2505
M204 S6000
G1 X91.789 Y78.864 E.01163
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y77.227 E.04435
G1 X91.789 Y77.227 E.09697
G1 X91.789 Y78.375 E.03109
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2505
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.003 J2.803 E.03665
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.496 Y78.815 E.18892
G3 X79.903 Y78.435 I1.41 J2.425 E.03707
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y76.826 E.04043
G1 X92.19 Y76.826 E.11012
G1 X92.19 Y78.375 E.03892
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.683 Z2.36 F42000
G1 X102.51 Y79.82 Z2.36
G1 Z1.96
G1 E.8 F1800
G1 F2505
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.574 J1.344 E.03448
G1 X102.89 Y104.822 E.5932
G3 X102.51 Y106.229 I-2.805 J-.003 E.03706
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02208
G1 X102.678 Y80.157 E-.10418
G1 X102.806 Y80.547 E-.156
G1 X102.86 Y80.815 E-.10385
G1 X102.89 Y81.227 E-.1572
G1 X102.89 Y81.798 E-.21669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.418 Z2.36 F42000
G1 X101.49 Y106.785 Z2.36
G1 Z1.96
G1 E.8 F1800
G1 F2505
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50772
G3 X78.494 Y107.234 I.003 J-2.806 E.03711
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.168 Y107.402 E-.1366
G1 X100.778 Y107.531 E-.15614
G1 X100.373 Y107.601 E-.1559
G1 X100.097 Y107.615 E-.10512
G1 X100.016 Y107.615 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z2.36 F42000
G1 X77.49 Y106.229 Z2.36
G1 Z1.96
G1 E.8 F1800
G1 F2505
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.5932
G3 X77.49 Y79.82 I2.805 J.003 E.03706
G1 X77.49 Y106.169 E.66244
; WIPE_START
M73 P36 R6
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.12298
G1 X77.194 Y105.502 E-.15595
G1 X77.123 Y105.098 E-.15596
G1 X77.11 Y104.822 E-.10512
G1 X77.11 Y104.243 E-.21999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z2.36 F42000
G1 X86.21 Y107.2 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463457
G1 F2505
M204 S6000
G1 X100.092 Y107.2 E.38833
G2 X100.451 Y107.187 I-.018 J-5.429 E.01004
; LINE_WIDTH: 0.41592
G2 X100.686 Y107.163 I-.357 J-4.824 E.00587
; LINE_WIDTH: 0.375192
G1 X100.804 Y107.147 E.00266
; LINE_WIDTH: 0.340998
G1 X100.916 Y107.129 E.00227
; LINE_WIDTH: 0.299137
G1 X101.29 Y107.06 E.00655
; WIPE_START
G1 F16993.9
G1 X100.916 Y107.129 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.018 Y99.497 Z2.36 F42000
G1 X101.29 Y78.989 Z2.36
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.296656
G1 F2505
M204 S6000
G1 X100.932 Y78.923 E.00623
; LINE_WIDTH: 0.338412
G1 X100.804 Y78.902 E.00257
; LINE_WIDTH: 0.375196
G1 X100.686 Y78.886 E.00265
; LINE_WIDTH: 0.415897
G2 X100.45 Y78.863 I-.588 J4.762 E.00589
; LINE_WIDTH: 0.463311
G2 X100.092 Y78.85 I-.376 J5.405 E.01002
G1 X91.99 Y78.85 E.22659
; WIPE_START
G1 F10490.126
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.166 Y78.045 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.424106
G1 F2505
M204 S6000
G1 X88.834 Y78.045 E.05925
; WIPE_START
G1 F11545.27
G1 X90.834 Y78.045 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2505
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.211 Y73.722 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2505
M204 S6000
G1 X88.211 Y73.003 E.01949
G1 X91.789 Y73.003 E.09697
G1 X91.789 Y73.722 E.01949
G1 X88.271 Y73.722 E.09535
M204 S250
G1 X87.81 Y74.123 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2505
M204 S5000
G1 X87.81 Y73.431 E.01738
G1 X87.81 Y73.031 E.01006
G1 X87.81 Y72.631 E.01006
G1 X87.81 Y72.602 E.00073
G1 X92.19 Y72.602 E.11012
G1 X92.19 Y72.631 E.00073
G1 X92.19 Y73.031 E.01006
G1 X92.19 Y73.431 E.01006
G1 X92.19 Y74.123 E.01738
G1 X87.87 Y74.123 E.10861
M204 S10000
G1 X88.418 Y73.362 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.337946
G1 F2505
M204 S6000
G1 X91.582 Y73.362 E.0626
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F14821.646
G1 X89.582 Y73.362 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/50
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.36 I-1.2 J-.204 P1  F42000
G1 X85.01 Y100.315 Z2.36
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2494
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z2.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2494
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.452 Y91.854 Z2.52 F42000
G1 X79.447 Y84.385 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2494
M204 S5000
G1 X79.402 Y84.26 E.00297
G3 X79.917 Y83.417 I.668 J-.17 E.02462
G1 X80.053 Y83.4 E.00307
G3 X79.475 Y84.438 I.017 J.689 E.06489
M204 S250
G1 X79.589 Y83.568 F42000
G1 F2494
M204 S5000
G1 X79.599 Y83.556 E.00035
G3 X80.054 Y83.379 I.469 J.532 E.01116
G1 X80.092 Y83.379 E.00086
G3 X79.502 Y83.659 I-.025 J.709 E.08451
G1 X79.548 Y83.612 E.00148
; WIPE_START
G1 F12000
M204 S6000
G1 X79.599 Y83.556 E-.02876
G1 X79.715 Y83.474 E-.05388
G1 X79.844 Y83.416 E-.05383
G1 X80.054 Y83.379 E-.08112
G1 X80.092 Y83.379 E-.01466
G1 X80.228 Y83.396 E-.05204
G1 X80.362 Y83.441 E-.05376
G1 X80.485 Y83.512 E-.05379
G1 X80.591 Y83.606 E-.05379
G1 X80.677 Y83.719 E-.05379
G1 X80.738 Y83.846 E-.05381
G1 X80.773 Y83.984 E-.05383
G1 X80.78 Y84.122 E-.05282
G1 X80.725 Y84.366 E-.0947
G1 X80.718 Y84.378 E-.00541
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2494
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2494
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.103 Y80.003 Z2.52 F42000
G1 X91.374 Y78.435 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2494
M204 S6000
G1 X91.374 Y78.448 E.00037
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y77.781 E.01809
G1 X91.374 Y77.781 E.07445
G1 X91.374 Y78.375 E.01609
M204 S10000
G1 X91.789 Y78.435 F42000
G1 F2494
M204 S6000
G1 X91.789 Y78.864 E.01163
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y77.365 E.04062
G1 X91.789 Y77.365 E.09697
G1 X91.789 Y78.375 E.02736
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2494
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.004 J2.811 E.03665
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.496 Y78.815 E.18892
G3 X79.903 Y78.435 I1.41 J2.426 E.03707
G1 X87.81 Y78.435 E.1988
M73 P37 R6
G1 X87.81 Y76.964 E.03696
G1 X92.19 Y76.964 E.11012
G1 X92.19 Y78.375 E.03545
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.683 Z2.52 F42000
G1 X102.51 Y79.82 Z2.52
G1 Z2.12
G1 E.8 F1800
G1 F2494
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.575 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.813 J-.005 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02206
G1 X102.678 Y80.157 E-.10416
G1 X102.806 Y80.547 E-.15601
G1 X102.877 Y80.951 E-.15599
G1 X102.89 Y81.227 E-.1051
G1 X102.89 Y81.798 E-.21668
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.418 Z2.52 F42000
G1 X101.49 Y106.785 Z2.52
G1 Z2.12
G1 E.8 F1800
G1 F2494
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.005 J-2.813 E.03711
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.168 Y107.402 E-.13673
G1 X100.778 Y107.531 E-.15598
G1 X100.373 Y107.601 E-.15595
G1 X100.097 Y107.615 E-.1051
G1 X100.016 Y107.615 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z2.52 F42000
G1 X77.49 Y106.229 Z2.52
G1 Z2.12
G1 E.8 F1800
G1 F2494
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.813 J.005 E.03707
G1 X77.49 Y106.169 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.12291
G1 X77.194 Y105.502 E-.15598
G1 X77.123 Y105.098 E-.15603
G1 X77.11 Y104.822 E-.1051
G1 X77.11 Y104.243 E-.21999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z2.52 F42000
G1 X86.21 Y107.2 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463457
G1 F2494
M204 S6000
G1 X100.092 Y107.2 E.38833
G2 X100.451 Y107.187 I-.018 J-5.426 E.01004
; LINE_WIDTH: 0.415908
G2 X100.686 Y107.163 I-.354 J-4.792 E.00588
; LINE_WIDTH: 0.375138
G1 X100.805 Y107.147 E.00267
; LINE_WIDTH: 0.339766
G1 X100.924 Y107.128 E.00241
; LINE_WIDTH: 0.298073
G1 X101.29 Y107.06 E.00639
; WIPE_START
G1 F17062.497
G1 X100.924 Y107.128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.023 Y99.496 Z2.52 F42000
G1 X101.29 Y78.989 Z2.52
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.297953
G1 F2494
M204 S6000
G1 X100.924 Y78.921 E.00639
; LINE_WIDTH: 0.33798
G1 X100.815 Y78.904 E.00219
; LINE_WIDTH: 0.373509
G1 X100.685 Y78.886 E.00292
; LINE_WIDTH: 0.415989
G2 X100.451 Y78.863 I-.585 J4.738 E.00585
; LINE_WIDTH: 0.4633
G2 X100.092 Y78.85 I-.377 J5.414 E.01004
G1 X91.99 Y78.85 E.22658
; WIPE_START
G1 F10490.404
G1 X93.99 Y78.85 E-.76
; WIPE_END
M73 P38 R6
G1 E-.04 F1800
M204 S10000
G1 X91.166 Y78.114 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.286256
G1 F2494
M204 S6000
G1 X88.834 Y78.114 E.03829
; WIPE_START
G1 F17862.815
G1 X90.834 Y78.114 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2494
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.211 Y73.584 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2494
M204 S6000
G1 X88.211 Y72.943 E.01737
G1 X91.789 Y72.943 E.09697
G1 X91.789 Y73.584 E.01737
G1 X88.271 Y73.584 E.09535
M204 S250
G1 X87.81 Y73.985 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2494
M204 S5000
G1 X87.81 Y72.961 E.02574
G1 X87.81 Y72.561 E.01006
G1 X87.81 Y72.542 E.00047
G1 X92.19 Y72.542 E.11012
G1 X92.19 Y72.561 E.00047
G1 X92.19 Y72.961 E.01006
G1 X92.19 Y73.985 E.02574
G1 X87.87 Y73.985 E.10861
M204 S10000
G1 X88.418 Y73.264 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.259706
G1 F2494
M204 S6000
G1 X91.582 Y73.264 E.04647
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X89.582 Y73.264 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/50
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.52 I-1.2 J-.203 P1  F42000
G1 X85.01 Y100.315 Z2.52
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2485
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z2.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2485
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.452 Y91.854 Z2.68 F42000
G1 X79.443 Y84.373 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2485
M204 S5000
G1 X79.436 Y84.357 E.00039
G3 X79.917 Y83.417 I.633 J-.269 E.0269
G1 X80.053 Y83.4 E.00307
G3 X79.502 Y84.477 I.017 J.688 E.06368
G1 X79.473 Y84.425 E.00133
M204 S250
G1 X79.591 Y83.566 F42000
G1 F2485
M204 S5000
G1 X79.599 Y83.555 E.0003
G3 X80.054 Y83.379 I.469 J.534 E.01115
G1 X80.094 Y83.379 E.00089
G3 X79.502 Y83.659 I-.026 J.71 E.08468
G1 X79.549 Y83.61 E.00153
; WIPE_START
G1 F12000
M204 S6000
G1 X79.599 Y83.555 E-.02788
G1 X79.715 Y83.474 E-.05389
G1 X79.843 Y83.416 E-.05369
G1 X80.054 Y83.379 E-.08115
G1 X80.094 Y83.379 E-.01508
G1 X80.228 Y83.396 E-.05166
G1 X80.362 Y83.441 E-.05376
G1 X80.485 Y83.512 E-.05378
G1 X80.591 Y83.606 E-.05383
G1 X80.677 Y83.719 E-.05381
G1 X80.738 Y83.846 E-.05378
G1 X80.773 Y83.984 E-.05385
G1 X80.78 Y84.125 E-.05376
G1 X80.759 Y84.265 E-.05383
G1 X80.717 Y84.379 E-.04624
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2485
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2485
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.103 Y80.003 Z2.68 F42000
G1 X91.374 Y78.435 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2485
M204 S6000
G1 X91.374 Y78.448 E.00037
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y77.886 E.01524
G1 X91.374 Y77.886 E.07445
G1 X91.374 Y78.375 E.01324
M204 S10000
G1 X91.789 Y78.435 F42000
G1 F2485
M204 S6000
G1 X91.789 Y78.864 E.01163
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y77.47 E.03776
G1 X91.789 Y77.47 E.09697
G1 X91.789 Y78.375 E.0245
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2485
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.005 J2.814 E.03665
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.496 Y78.815 E.18892
G3 X79.903 Y78.435 I1.41 J2.425 E.03707
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y77.07 E.03432
G1 X92.19 Y77.07 E.11012
G1 X92.19 Y78.375 E.03281
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.683 Z2.68 F42000
G1 X102.51 Y79.82 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F2485
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.575 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.816 J-.005 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02212
M73 P39 R6
G1 X102.678 Y80.157 E-.1041
G1 X102.806 Y80.547 E-.15599
G1 X102.877 Y80.951 E-.15599
G1 X102.89 Y81.227 E-.10511
G1 X102.89 Y81.798 E-.21669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.418 Z2.68 F42000
G1 X101.49 Y106.785 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F2485
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.003 J-2.805 E.03711
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.168 Y107.402 E-.1365
G1 X100.778 Y107.531 E-.15617
G1 X100.373 Y107.601 E-.15599
G1 X100.097 Y107.615 E-.1051
G1 X100.016 Y107.615 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z2.68 F42000
G1 X77.49 Y106.229 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F2485
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.821 I2.797 J.002 E.03705
G1 X77.49 Y106.169 E.66242
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.323 Y105.893 E-.12275
G1 X77.194 Y105.502 E-.15616
G1 X77.123 Y105.098 E-.15599
G1 X77.11 Y104.822 E-.10511
G1 X77.11 Y104.243 E-.21999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z2.68 F42000
G1 X86.21 Y107.2 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463482
G1 F2485
M204 S6000
G1 X100.092 Y107.2 E.38836
G2 X100.436 Y107.187 I-.016 J-5.318 E.00964
; LINE_WIDTH: 0.416978
G2 X100.686 Y107.163 I-.322 J-4.648 E.00625
; LINE_WIDTH: 0.37514
G1 X100.804 Y107.147 E.00266
; LINE_WIDTH: 0.342051
G1 X100.91 Y107.13 E.00214
; LINE_WIDTH: 0.300081
G1 X101.29 Y107.06 E.00669
; WIPE_START
G1 F16933.556
G1 X100.91 Y107.13 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.013 Y99.498 Z2.68 F42000
G1 X101.29 Y78.989 Z2.68
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.297968
G1 F2485
M204 S6000
G1 X100.924 Y78.921 E.00639
; LINE_WIDTH: 0.337482
G1 X100.819 Y78.904 E.00212
; LINE_WIDTH: 0.373062
G1 X100.684 Y78.886 E.00299
; LINE_WIDTH: 0.416062
G2 X100.451 Y78.863 I-.586 J4.749 E.00584
; LINE_WIDTH: 0.463301
G2 X100.092 Y78.85 I-.376 J5.413 E.01003
G1 X91.99 Y78.85 E.22658
; WIPE_START
M73 P39 R5
G1 F10490.384
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.166 Y78.167 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.180976
G1 F2485
M204 S6000
G1 X88.834 Y78.167 E.02229
; WIPE_START
G1 F18000
G1 X90.834 Y78.167 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2485
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.211 Y73.479 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2485
M204 S6000
G1 X88.211 Y72.894 E.01584
G1 X91.789 Y72.894 E.09697
G1 X91.789 Y73.479 E.01584
G1 X88.271 Y73.479 E.09535
M204 S250
G1 X87.81 Y73.879 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2485
M204 S5000
G1 X87.81 Y72.501 E.03465
G1 X87.81 Y72.493 E.0002
G1 X92.19 Y72.493 E.11012
G1 X92.19 Y72.501 E.0002
G1 X92.19 Y72.901 E.01006
G1 X92.19 Y73.879 E.02459
G1 X87.87 Y73.879 E.10861
M204 S10000
G1 X88.418 Y73.186 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203356
G1 F2485
M204 S6000
G1 X91.582 Y73.186 E.03485
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X89.582 Y73.186 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/50
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.68 I-1.2 J-.202 P1  F42000
G1 X85.01 Y100.315 Z2.68
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2479
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z2.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2479
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.452 Y91.854 Z2.84 F42000
G1 X79.441 Y84.369 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2479
M204 S5000
M73 P40 R5
G1 X79.436 Y84.357 E.00029
G3 X79.917 Y83.417 I.633 J-.269 E.0269
G1 X80.053 Y83.4 E.00307
G3 X79.502 Y84.477 I.017 J.688 E.06368
G1 X79.471 Y84.421 E.00143
M204 S250
G1 X79.592 Y83.564 F42000
G1 F2479
M204 S5000
G1 X79.599 Y83.555 E.00025
G3 X80.054 Y83.379 I.469 J.534 E.01115
G1 X80.095 Y83.379 E.00091
G3 X79.502 Y83.659 I-.027 J.71 E.08465
G1 X79.551 Y83.608 E.00159
; WIPE_START
G1 F12000
M204 S6000
G1 X79.599 Y83.555 E-.02694
G1 X79.714 Y83.474 E-.0538
G1 X79.844 Y83.416 E-.0538
G1 X80.054 Y83.379 E-.0811
G1 X80.095 Y83.379 E-.01551
G1 X80.228 Y83.396 E-.05124
G1 X80.362 Y83.441 E-.05378
G1 X80.485 Y83.512 E-.0538
G1 X80.591 Y83.606 E-.05382
G1 X80.677 Y83.719 E-.05376
G1 X80.738 Y83.846 E-.05386
G1 X80.773 Y83.984 E-.05384
G1 X80.78 Y84.125 E-.05375
G1 X80.759 Y84.265 E-.05373
G1 X80.717 Y84.382 E-.04727
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2479
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2479
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.109 Y80.008 Z2.84 F42000
G1 X91.374 Y78.448 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2479
M204 S6000
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y77.967 E.01304
G1 X91.374 Y77.967 E.07445
G1 X91.374 Y78.388 E.01142
M204 S10000
G1 X91.789 Y78.835 F42000
G1 F2479
M204 S6000
G1 X91.789 Y78.864 E.00078
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y77.551 E.03557
G1 X91.789 Y77.551 E.09697
G1 X91.789 Y78.775 E.03317
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2479
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.002 J2.803 E.03666
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.496 Y78.815 E.18892
G3 X79.903 Y78.435 I1.41 J2.425 E.03707
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y77.151 E.03228
G1 X92.19 Y77.151 E.11012
G1 X92.19 Y78.375 E.03077
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.683 Z2.84 F42000
G1 X102.51 Y79.82 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F2479
M204 S5000
G1 X102.56 Y79.909 E.00258
G3 X102.89 Y81.227 I-2.598 J1.35 E.03447
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02215
G1 X102.678 Y80.157 E-.10411
G1 X102.806 Y80.546 E-.15575
G1 X102.877 Y80.951 E-.1562
G1 X102.89 Y81.227 E-.1051
G1 X102.89 Y81.798 E-.2167
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.418 Z2.84 F42000
G1 X101.49 Y106.785 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F2479
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.003 J-2.806 E.03711
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.168 Y107.402 E-.1365
G1 X100.778 Y107.531 E-.15622
G1 X100.373 Y107.601 E-.15593
G1 X100.097 Y107.615 E-.1051
G1 X100.016 Y107.615 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z2.84 F42000
G1 X77.49 Y106.229 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F2479
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03707
G1 X77.49 Y106.169 E.66244
; WIPE_START
M73 P41 R5
G1 F11668.197
M204 S6000
G1 X77.323 Y105.893 E-.12275
G1 X77.194 Y105.502 E-.15622
G1 X77.123 Y105.098 E-.15593
G1 X77.11 Y104.822 E-.1051
G1 X77.11 Y104.243 E-.21999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z2.84 F42000
G1 X86.21 Y107.2 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463488
G1 F2479
M204 S6000
G1 X100.092 Y107.2 E.38836
G2 X100.433 Y107.188 I-.015 J-5.294 E.00955
; LINE_WIDTH: 0.417251
G2 X100.686 Y107.163 I-.316 J-4.624 E.00633
; LINE_WIDTH: 0.375148
G1 X100.805 Y107.147 E.00267
; LINE_WIDTH: 0.342594
G1 X100.907 Y107.131 E.00208
; LINE_WIDTH: 0.313382
G1 X101.098 Y107.096 E.00354
; LINE_WIDTH: 0.287794
G1 X101.29 Y107.061 E.00322
; WIPE_START
G1 F17754.452
G1 X101.098 Y107.096 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.15 Y99.463 Z2.84 F42000
G1 X101.29 Y78.989 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.29851
G1 F2479
M204 S6000
G1 X100.924 Y78.921 E.0064
; LINE_WIDTH: 0.339729
G1 X100.805 Y78.902 E.00241
; LINE_WIDTH: 0.375125
G1 X100.686 Y78.886 E.00267
; LINE_WIDTH: 0.415913
G2 X100.451 Y78.863 I-.591 J4.791 E.00588
; LINE_WIDTH: 0.463301
G2 X100.092 Y78.85 I-.376 J5.41 E.01003
G1 X91.99 Y78.85 E.22658
; WIPE_START
G1 F10490.381
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.166 Y78.208 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.100036
G1 F2479
M204 S6000
G1 X88.834 Y78.208 E.00999
; WIPE_START
G1 F18000
G1 X90.834 Y78.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2479
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.211 Y73.398 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2479
M204 S6000
G1 X88.211 Y72.855 E.01471
G1 X91.789 Y72.855 E.09697
G1 X91.789 Y73.398 E.01471
G1 X88.271 Y73.398 E.09535
M204 S250
G1 X87.81 Y73.799 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2479
M204 S5000
G1 X87.81 Y72.454 E.0338
G1 X92.19 Y72.454 E.11012
G1 X92.19 Y73.799 E.0338
G1 X87.87 Y73.799 E.10861
M204 S10000
G1 X88.418 Y73.126 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.161716
G1 F2479
M204 S6000
G1 X91.582 Y73.126 E.02627
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X89.582 Y73.126 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/50
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.84 I-1.2 J-.202 P1  F42000
G1 X85.01 Y100.315 Z2.84
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2437
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2437
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.452 Y91.854 Z3 F42000
G1 X79.446 Y84.381 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2437
M204 S5000
G1 X79.404 Y84.259 E.00289
G3 X79.916 Y83.417 I.666 J-.172 E.0246
G1 X80.053 Y83.4 E.00308
G3 X79.475 Y84.434 I.017 J.688 E.06481
M204 S250
G1 X79.594 Y83.562 F42000
G1 F2437
M204 S5000
G1 X79.598 Y83.555 E.00019
G3 X80.054 Y83.379 I.469 J.534 E.01115
G1 X80.095 Y83.379 E.00094
G3 X79.502 Y83.659 I-.028 J.71 E.08463
G1 X79.553 Y83.606 E.00165
; WIPE_START
G1 F12000
M204 S6000
G1 X79.598 Y83.555 E-.02591
G1 X79.714 Y83.474 E-.05388
G1 X79.844 Y83.416 E-.05383
G1 X80.054 Y83.379 E-.08104
G1 X80.095 Y83.379 E-.01588
G1 X80.228 Y83.396 E-.05087
G1 X80.362 Y83.441 E-.05377
G1 X80.485 Y83.512 E-.0538
G1 X80.591 Y83.606 E-.0538
G1 X80.677 Y83.719 E-.05384
G1 X80.738 Y83.846 E-.05381
G1 X80.773 Y83.984 E-.05384
G1 X80.78 Y84.125 E-.05378
G1 X80.722 Y84.373 E-.09665
G1 X80.715 Y84.385 E-.0053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2437
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2437
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.109 Y80.008 Z3 F42000
G1 X91.374 Y78.448 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2437
M204 S6000
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y78.027 E.01142
G1 X91.374 Y78.027 E.07445
G1 X91.374 Y78.388 E.00979
M204 S10000
G1 X91.789 Y78.835 F42000
G1 F2437
M204 S6000
G1 X91.789 Y78.864 E.00078
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y77.611 E.03394
G1 X91.789 Y77.611 E.09697
G1 X91.789 Y78.775 E.03154
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2437
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.006 J2.819 E.03665
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.496 Y78.815 E.18892
G3 X79.903 Y78.435 I1.41 J2.425 E.03707
G1 X87.81 Y78.435 E.1988
M73 P42 R5
G1 X87.81 Y77.211 E.03077
G1 X92.19 Y77.211 E.11012
G1 X92.19 Y78.375 E.02926
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.683 Z3 F42000
G1 X102.51 Y79.82 Z3
G1 Z2.6
G1 E.8 F1800
G1 F2437
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.575 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.806 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02212
G1 X102.677 Y80.157 E-.10402
G1 X102.806 Y80.547 E-.15616
G1 X102.877 Y80.951 E-.15592
G1 X102.89 Y81.227 E-.1051
G1 X102.89 Y81.798 E-.21669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.418 Z3 F42000
G1 X101.49 Y106.785 Z3
G1 Z2.6
G1 E.8 F1800
G1 F2437
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.003 J-2.806 E.03711
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.168 Y107.402 E-.13633
G1 X100.778 Y107.531 E-.1564
G1 X100.373 Y107.601 E-.15592
G1 X100.097 Y107.615 E-.1051
G1 X100.016 Y107.615 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z3 F42000
G1 X77.49 Y106.229 Z3
G1 Z2.6
G1 E.8 F1800
G1 F2437
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.822 I2.809 J.005 E.03703
G1 X77.49 Y106.169 E.66241
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.323 Y105.893 E-.12259
G1 X77.194 Y105.502 E-.15641
G1 X77.123 Y105.098 E-.15592
G1 X77.11 Y104.822 E-.1051
G1 X77.11 Y104.243 E-.21999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z3 F42000
G1 X86.21 Y107.2 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463493
G1 F2437
M204 S6000
G1 X100.092 Y107.2 E.38837
G2 X100.43 Y107.188 I-.015 J-5.287 E.00946
; LINE_WIDTH: 0.417499
G2 X100.686 Y107.163 I-.31 J-4.593 E.00641
; LINE_WIDTH: 0.375177
G1 X100.804 Y107.147 E.00266
; LINE_WIDTH: 0.343088
G1 X100.904 Y107.131 E.00202
; LINE_WIDTH: 0.314057
G1 X101.097 Y107.096 E.00358
; LINE_WIDTH: 0.287897
G1 X101.29 Y107.061 E.00324
; WIPE_START
G1 F17747.199
G1 X101.097 Y107.096 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.149 Y99.464 Z3 F42000
G1 X101.29 Y78.989 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.297981
G1 F2437
M204 S6000
G1 X100.924 Y78.921 E.00639
; LINE_WIDTH: 0.336413
G1 X100.825 Y78.905 E.00197
; LINE_WIDTH: 0.371997
G1 X100.684 Y78.886 E.00314
; LINE_WIDTH: 0.416089
G2 X100.451 Y78.863 I-.587 J4.767 E.00584
; LINE_WIDTH: 0.463301
G2 X100.092 Y78.85 I-.376 J5.411 E.01003
G1 X91.99 Y78.85 E.22657
; WIPE_START
G1 F10490.381
G1 X93.99 Y78.85 E-.76
; WIPE_END
M73 P43 R5
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2437
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.211 Y73.338 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2437
M204 S6000
G1 X88.211 Y72.825 E.01391
G1 X91.789 Y72.825 E.09697
G1 X91.789 Y73.338 E.01391
G1 X88.271 Y73.338 E.09535
M204 S250
G1 X87.81 Y73.738 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2437
M204 S5000
G1 X87.81 Y72.424 E.03305
G1 X92.19 Y72.424 E.11012
G1 X92.19 Y73.738 E.03305
G1 X87.87 Y73.738 E.10861
M204 S10000
G1 X88.418 Y73.081 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.131856
G1 F2437
M204 S6000
G1 X91.582 Y73.081 E.02011
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X89.582 Y73.081 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/50
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3 I-1.2 J-.201 P1  F42000
G1 X85.01 Y100.315 Z3
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2434
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2434
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.451 Y91.854 Z3.16 F42000
G1 X79.439 Y84.367 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2434
M204 S5000
G1 X79.435 Y84.357 E.00023
G3 X79.916 Y83.417 I.634 J-.268 E.02691
G1 X80.053 Y83.4 E.00308
G3 X79.501 Y84.477 I.017 J.689 E.06377
G1 X79.469 Y84.419 E.0015
M204 S250
G1 X79.596 Y83.56 F42000
G1 F2434
M204 S5000
G1 X79.598 Y83.555 E.00013
G3 X80.054 Y83.379 I.469 J.534 E.01115
G1 X80.096 Y83.379 E.00096
G3 X79.502 Y83.659 I-.029 J.71 E.08461
G1 X79.554 Y83.604 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X79.598 Y83.555 E-.02494
G1 X79.715 Y83.474 E-.05393
G1 X79.844 Y83.416 E-.05375
G1 X80.054 Y83.379 E-.08103
G1 X80.096 Y83.379 E-.01629
G1 X80.228 Y83.396 E-.05055
G1 X80.362 Y83.441 E-.05371
G1 X80.485 Y83.512 E-.05388
G1 X80.591 Y83.606 E-.0538
G1 X80.677 Y83.719 E-.05383
G1 X80.738 Y83.846 E-.05375
G1 X80.773 Y83.984 E-.05384
G1 X80.78 Y84.125 E-.05377
G1 X80.759 Y84.265 E-.05376
G1 X80.715 Y84.387 E-.04918
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2434
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2434
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.109 Y80.008 Z3.16 F42000
G1 X91.374 Y78.448 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2434
M204 S6000
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y78.068 E.01029
G1 X91.374 Y78.068 E.07445
G1 X91.374 Y78.388 E.00866
M204 S10000
G1 X91.789 Y78.835 F42000
G1 F2434
M204 S6000
G1 X91.789 Y78.864 E.00078
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y77.653 E.03282
G1 X91.789 Y77.653 E.09697
G1 X91.789 Y78.775 E.03041
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2434
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.002 J2.803 E.03666
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.496 Y78.815 E.18892
G3 X79.903 Y78.435 I1.41 J2.425 E.03707
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y77.252 E.02973
G1 X92.19 Y77.252 E.11012
G1 X92.19 Y78.375 E.02822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.683 Z3.16 F42000
G1 X102.51 Y79.82 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F2434
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.574 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02212
G1 X102.677 Y80.157 E-.10401
G1 X102.806 Y80.547 E-.15603
G1 X102.877 Y80.951 E-.15605
G1 X102.89 Y81.227 E-.1051
G1 X102.89 Y81.798 E-.21669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.418 Z3.16 F42000
G1 X101.49 Y106.785 Z3.16
G1 Z2.76
M73 P44 R5
G1 E.8 F1800
G1 F2434
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.003 J-2.806 E.03711
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.168 Y107.402 E-.13632
G1 X100.778 Y107.531 E-.15629
G1 X100.373 Y107.601 E-.15605
G1 X100.097 Y107.615 E-.1051
G1 X100.016 Y107.615 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z3.16 F42000
G1 X77.49 Y106.229 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F2434
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03707
G1 X77.49 Y106.169 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.323 Y105.893 E-.12256
G1 X77.194 Y105.503 E-.15631
G1 X77.123 Y105.098 E-.15605
G1 X77.11 Y104.822 E-.1051
G1 X77.11 Y104.243 E-.21999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z3.16 F42000
G1 X86.21 Y107.2 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463457
G1 F2434
M204 S6000
G1 X100.092 Y107.2 E.38833
G2 X100.451 Y107.187 I-.018 J-5.422 E.01004
; LINE_WIDTH: 0.415893
G2 X100.686 Y107.163 I-.352 J-4.775 E.00588
; LINE_WIDTH: 0.375169
G1 X100.804 Y107.147 E.00266
; LINE_WIDTH: 0.34364
G1 X100.9 Y107.132 E.00196
; LINE_WIDTH: 0.314852
G1 X101.095 Y107.096 E.00362
; LINE_WIDTH: 0.288123
G1 X101.29 Y107.061 E.00327
; WIPE_START
G1 F17731.458
G1 X101.095 Y107.096 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.148 Y99.464 Z3.16 F42000
G1 X101.29 Y78.989 Z3.16
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.293568
G1 F2434
M204 S6000
G1 X100.948 Y78.926 E.00588
; LINE_WIDTH: 0.33559
G1 X100.803 Y78.902 E.00289
; LINE_WIDTH: 0.375432
G1 X100.685 Y78.886 E.00263
; LINE_WIDTH: 0.415923
G2 X100.451 Y78.863 I-.588 J4.763 E.00587
; LINE_WIDTH: 0.4633
G2 X100.092 Y78.85 I-.376 J5.409 E.01003
G1 X91.99 Y78.85 E.22657
; WIPE_START
G1 F10490.392
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2434
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.211 Y73.296 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2434
M204 S6000
G1 X88.211 Y72.803 E.01336
G1 X91.789 Y72.803 E.09697
G1 X91.789 Y73.296 E.01336
G1 X88.271 Y73.296 E.09535
M204 S250
G1 X87.81 Y73.697 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2434
M204 S5000
G1 X87.81 Y72.403 E.03254
G1 X92.19 Y72.403 E.11012
G1 X92.19 Y73.697 E.03254
G1 X87.87 Y73.697 E.10861
M204 S10000
G1 X88.418 Y73.05 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.111786
G1 F2434
M204 S6000
G1 X91.582 Y73.05 E.01597
; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X89.582 Y73.05 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/50
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.16 I-1.2 J-.201 P1  F42000
G1 X85.01 Y100.315 Z3.16
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2433
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z2.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2433
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.451 Y91.854 Z3.32 F42000
G1 X79.438 Y84.363 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2433
M204 S5000
G1 X79.437 Y84.357 E.00015
G3 X79.916 Y83.417 I.633 J-.269 E.0269
G1 X80.053 Y83.4 E.00308
G3 X79.502 Y84.477 I.017 J.688 E.06368
G1 X79.467 Y84.416 E.00158
M204 S250
G1 X79.598 Y83.559 F42000
G1 F2433
M204 S5000
G1 X79.598 Y83.555 E.00008
M73 P45 R5
G3 X80.053 Y83.379 I.469 J.534 E.01115
G1 X80.097 Y83.379 E.00098
G3 X79.502 Y83.659 I-.03 J.71 E.08458
G1 X79.556 Y83.602 E.00177
; WIPE_START
G1 F12000
M204 S6000
G1 X79.598 Y83.555 E-.02399
G1 X79.715 Y83.474 E-.05386
G1 X79.843 Y83.416 E-.05373
G1 X80.053 Y83.379 E-.08103
G1 X80.097 Y83.379 E-.01667
G1 X80.228 Y83.396 E-.0502
G1 X80.363 Y83.442 E-.05379
G1 X80.485 Y83.512 E-.05375
G1 X80.591 Y83.606 E-.0538
G1 X80.677 Y83.719 E-.05383
G1 X80.738 Y83.846 E-.05378
G1 X80.773 Y83.984 E-.05384
G1 X80.78 Y84.125 E-.05379
G1 X80.759 Y84.265 E-.05383
G1 X80.714 Y84.389 E-.0501
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2433
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2433
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.109 Y80.008 Z3.32 F42000
G1 X91.374 Y78.448 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2433
M204 S6000
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y78.093 E.00963
G1 X91.374 Y78.093 E.07445
G1 X91.374 Y78.388 E.008
M204 S10000
G1 X91.789 Y78.835 F42000
G1 F2433
M204 S6000
G1 X91.789 Y78.864 E.00078
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y77.677 E.03216
G1 X91.789 Y77.677 E.09697
G1 X91.789 Y78.775 E.02975
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2433
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.002 J2.802 E.03666
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.496 Y78.815 E.18892
G3 X79.903 Y78.435 I1.41 J2.425 E.03707
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y77.276 E.02911
G1 X92.19 Y77.276 E.11012
G1 X92.19 Y78.375 E.02761
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.683 Z3.32 F42000
G1 X102.51 Y79.82 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F2433
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.574 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.804 J-.002 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02212
G1 X102.727 Y80.285 E-.15601
G1 X102.806 Y80.547 E-.10403
G1 X102.877 Y80.951 E-.15607
G1 X102.89 Y81.227 E-.10509
G1 X102.89 Y81.798 E-.21669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.418 Z3.32 F42000
G1 X101.49 Y106.785 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F2433
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.002 J-2.804 E.03711
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.168 Y107.402 E-.13666
G1 X100.778 Y107.531 E-.15594
G1 X100.373 Y107.601 E-.15606
G1 X100.097 Y107.615 E-.1051
G1 X100.016 Y107.615 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z3.32 F42000
G1 X77.49 Y106.229 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F2433
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.825 J.008 E.03707
G1 X77.49 Y106.169 E.66244
; WIPE_START
M73 P46 R5
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.12291
G1 X77.194 Y105.503 E-.15595
G1 X77.123 Y105.098 E-.15605
G1 X77.11 Y104.822 E-.1051
G1 X77.11 Y104.243 E-.21999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z3.32 F42000
G1 X86.21 Y107.2 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463504
G1 F2433
M204 S6000
G1 X100.092 Y107.2 E.38838
G2 X100.423 Y107.188 I-.014 J-5.246 E.00927
; LINE_WIDTH: 0.417966
G2 X100.686 Y107.163 I-.303 J-4.596 E.0066
; LINE_WIDTH: 0.375162
G1 X100.804 Y107.147 E.00266
; LINE_WIDTH: 0.339767
G1 X100.924 Y107.128 E.00242
; LINE_WIDTH: 0.298034
G1 X101.29 Y107.06 E.00639
; WIPE_START
G1 F17065.018
G1 X100.924 Y107.128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.023 Y99.496 Z3.32 F42000
G1 X101.29 Y78.989 Z3.32
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.298007
G1 F2433
M204 S6000
G1 X100.924 Y78.921 E.00639
; LINE_WIDTH: 0.339751
G1 X100.805 Y78.902 E.00241
; LINE_WIDTH: 0.37142
G1 X100.713 Y78.889 E.00203
; LINE_WIDTH: 0.400839
G1 X100.565 Y78.872 E.00355
; LINE_WIDTH: 0.462822
G2 X100.092 Y78.85 I-.545 J6.355 E.01324
G1 X91.99 Y78.85 E.22632
; WIPE_START
G1 F10502.092
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2433
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.211 Y73.272 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2433
M204 S6000
G1 X88.211 Y72.79 E.01305
G1 X91.789 Y72.79 E.09697
G1 X91.789 Y73.272 E.01305
G1 X88.271 Y73.272 E.09535
M204 S250
G1 X87.81 Y73.673 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2433
M204 S5000
G1 X87.81 Y72.39 E.03225
G1 X92.19 Y72.39 E.11012
G1 X92.19 Y73.673 E.03225
G1 X87.87 Y73.673 E.10861
M204 S10000
G1 X88.418 Y73.031 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.100226
G1 F2433
M204 S6000
G1 X91.582 Y73.031 E.01359
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X89.582 Y73.031 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/50
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.32 I-1.2 J-.201 P1  F42000
G1 X85.01 Y100.315 Z3.32
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2433
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z3.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2433
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.452 Y91.854 Z3.48 F42000
G1 X79.444 Y84.373 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2433
M204 S5000
G1 X79.404 Y84.254 E.00281
G3 X79.921 Y83.416 I.668 J-.166 E.02454
G1 X80.053 Y83.4 E.00296
G3 X79.473 Y84.426 I.019 J.688 E.06508
M204 S250
G1 X79.599 Y83.557 F42000
G1 F2433
M204 S5000
G1 X79.599 Y83.555 E.00003
G3 X80.053 Y83.379 I.468 J.532 E.01114
G1 X80.098 Y83.379 E.00101
G3 X79.502 Y83.659 I-.031 J.709 E.08437
G1 X79.558 Y83.6 E.00182
; WIPE_START
G1 F12000
M204 S6000
G1 X79.599 Y83.555 E-.02299
G1 X79.715 Y83.474 E-.05383
G1 X79.843 Y83.416 E-.05374
G1 X80.053 Y83.379 E-.08099
G1 X80.098 Y83.379 E-.0171
G1 X80.228 Y83.396 E-.0498
G1 X80.362 Y83.441 E-.05376
G1 X80.485 Y83.512 E-.05384
G1 X80.591 Y83.606 E-.05379
G1 X80.677 Y83.719 E-.05375
G1 X80.738 Y83.846 E-.05378
G1 X80.773 Y83.984 E-.05391
G1 X80.78 Y84.123 E-.05285
G1 X80.725 Y84.366 E-.09473
G1 X80.711 Y84.392 E-.01115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2433
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2433
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.109 Y80.008 Z3.48 F42000
G1 X91.374 Y78.448 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2433
M204 S6000
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y78.101 E.00941
G1 X91.374 Y78.101 E.07445
G1 X91.374 Y78.388 E.00779
M204 S10000
G1 X91.789 Y78.835 F42000
G1 F2433
M204 S6000
G1 X91.789 Y78.864 E.00078
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y77.685 E.03194
G1 X91.789 Y77.685 E.09697
G1 X91.789 Y78.775 E.02954
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2433
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.008 J2.825 E.03665
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.496 Y78.815 E.18892
G3 X79.903 Y78.435 I1.41 J2.425 E.03707
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y77.285 E.02891
G1 X92.19 Y77.285 E.11012
M73 P47 R5
G1 X92.19 Y78.375 E.0274
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.683 Z3.48 F42000
G1 X102.51 Y79.82 Z3.48
G1 Z3.08
G1 E.8 F1800
G1 F2433
M204 S5000
G1 X102.56 Y79.909 E.00258
G3 X102.89 Y81.227 I-2.574 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.827 J-.008 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02215
G1 X102.678 Y80.157 E-.10407
G1 X102.806 Y80.547 E-.15593
G1 X102.877 Y80.951 E-.15605
G1 X102.89 Y81.227 E-.10512
G1 X102.89 Y81.798 E-.21669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.418 Z3.48 F42000
G1 X101.49 Y106.785 Z3.48
G1 Z3.08
G1 E.8 F1800
G1 F2433
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.003 J-2.806 E.03711
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.168 Y107.402 E-.13666
G1 X100.778 Y107.531 E-.15593
G1 X100.373 Y107.601 E-.15605
G1 X100.097 Y107.615 E-.10512
G1 X100.016 Y107.615 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z3.48 F42000
G1 X77.49 Y106.229 Z3.48
G1 Z3.08
G1 E.8 F1800
G1 F2433
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.827 J.008 E.03707
G1 X77.49 Y106.169 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.12292
G1 X77.194 Y105.503 E-.15593
G1 X77.123 Y105.098 E-.15605
G1 X77.11 Y104.822 E-.10512
G1 X77.11 Y104.243 E-.21999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z3.48 F42000
G1 X86.21 Y107.2 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463457
G1 F2433
M204 S6000
G1 X100.092 Y107.2 E.38833
G2 X100.451 Y107.187 I-.018 J-5.427 E.01003
; LINE_WIDTH: 0.41589
G2 X100.686 Y107.163 I-.355 J-4.805 E.00588
; LINE_WIDTH: 0.37516
G1 X100.804 Y107.147 E.00266
; LINE_WIDTH: 0.339767
G1 X100.924 Y107.128 E.00242
; LINE_WIDTH: 0.298056
G1 X101.29 Y107.06 E.00639
; WIPE_START
G1 F17063.585
G1 X100.924 Y107.128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.023 Y99.496 Z3.48 F42000
G1 X101.29 Y78.989 Z3.48
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.298002
G1 F2433
M204 S6000
G1 X100.924 Y78.921 E.00639
; LINE_WIDTH: 0.334801
G1 X100.835 Y78.907 E.00177
; LINE_WIDTH: 0.370499
G1 X100.683 Y78.885 E.00337
; LINE_WIDTH: 0.416194
G2 X100.45 Y78.863 I-.581 J4.713 E.00582
; LINE_WIDTH: 0.463301
G2 X100.092 Y78.85 I-.376 J5.406 E.01003
G1 X91.99 Y78.85 E.22657
; WIPE_START
G1 F10490.377
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2433
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
M73 P48 R5
G1 E-.04 F1800
M204 S10000
G1 X88.211 Y73.264 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2433
M204 S6000
G1 X88.211 Y72.786 E.01295
G1 X91.789 Y72.786 E.09697
G1 X91.789 Y73.264 E.01295
G1 X88.271 Y73.264 E.09535
M204 S250
G1 X87.81 Y73.665 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2433
M204 S5000
G1 X87.81 Y72.385 E.03216
G1 X92.19 Y72.385 E.11012
G1 X92.19 Y73.665 E.03216
G1 X87.87 Y73.665 E.10861
M204 S10000
G1 X88.418 Y73.025 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0964363
G1 F2433
M204 S6000
G1 X91.582 Y73.025 E.0128
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X89.582 Y73.025 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/50
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.48 I-1.2 J-.201 P1  F42000
G1 X85.01 Y100.315 Z3.48
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2433
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z3.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2433
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.451 Y91.854 Z3.64 F42000
G1 X79.436 Y84.36 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2433
M204 S5000
G1 X79.436 Y84.357 E.00007
G3 X79.917 Y83.417 I.633 J-.269 E.0269
G1 X80.053 Y83.4 E.00307
G3 X79.502 Y84.477 I.017 J.688 E.06368
G1 X79.465 Y84.412 E.00167
M204 S250
G1 X79.602 Y83.555 F42000
G1 F2433
M204 S5000
G1 X79.714 Y83.473 E.0031
G3 X80.053 Y83.379 I.353 J.616 E.00797
G1 X80.099 Y83.379 E.00103
G3 X79.558 Y83.594 I-.032 J.71 E.08646
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y83.473 E-.07519
G1 X79.844 Y83.416 E-.05385
G1 X80.053 Y83.379 E-.08096
G1 X80.099 Y83.379 E-.01742
G1 X80.228 Y83.396 E-.04936
G1 X80.362 Y83.441 E-.05383
G1 X80.485 Y83.512 E-.05381
G1 X80.591 Y83.606 E-.05378
G1 X80.677 Y83.719 E-.05388
G1 X80.738 Y83.846 E-.05375
G1 X80.773 Y83.984 E-.05384
G1 X80.78 Y84.125 E-.05378
G1 X80.759 Y84.265 E-.05376
G1 X80.712 Y84.395 E-.05277
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2433
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2433
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.109 Y80.008 Z3.64 F42000
G1 X91.374 Y78.448 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2433
M204 S6000
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y78.093 E.00963
G1 X91.374 Y78.093 E.07445
G1 X91.374 Y78.388 E.008
M204 S10000
G1 X91.789 Y78.835 F42000
G1 F2433
M204 S6000
G1 X91.789 Y78.864 E.00078
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y77.677 E.03216
G1 X91.789 Y77.677 E.09697
G1 X91.789 Y78.775 E.02975
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2433
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.002 J2.801 E.03666
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.496 Y78.815 E.1889
G3 X79.903 Y78.435 I1.408 J2.419 E.03705
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y77.276 E.02911
G1 X92.19 Y77.276 E.11012
G1 X92.19 Y78.375 E.02761
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.684 Z3.64 F42000
G1 X102.511 Y79.822 Z3.64
G1 Z3.24
G1 E.8 F1800
G1 F2433
M204 S5000
G3 X102.89 Y81.227 I-2.426 J1.408 E.03703
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.803 J-.002 E.03707
G1 X102.511 Y79.882 E.66241
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.678 Y80.157 E-.12234
G1 X102.806 Y80.547 E-.15593
G1 X102.877 Y80.951 E-.15606
G1 X102.89 Y81.227 E-.1051
G1 X102.89 Y81.808 E-.22056
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.428 Z3.64 F42000
G1 X101.49 Y106.785 Z3.64
G1 Z3.24
G1 E.8 F1800
G1 F2433
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.002 J-2.804 E.03712
G1 X86.01 Y107.235 E.18896
M73 P49 R5
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.168 Y107.402 E-.13666
G1 X100.778 Y107.531 E-.15593
G1 X100.373 Y107.601 E-.15606
G1 X100.097 Y107.615 E-.1051
G1 X100.016 Y107.615 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z3.64 F42000
G1 X77.49 Y106.229 Z3.64
G1 Z3.24
G1 E.8 F1800
G1 F2433
M204 S5000
G1 X77.489 Y106.228 E.00003
G3 X77.11 Y104.822 I2.425 J-1.408 E.03703
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.803 J.002 E.03707
G1 X77.49 Y106.169 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.489 Y106.228 E-.02236
G1 X77.322 Y105.892 E-.14235
G1 X77.194 Y105.503 E-.15593
G1 X77.123 Y105.098 E-.15606
G1 X77.11 Y104.822 E-.1051
G1 X77.11 Y104.353 E-.17819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.394 Y106.631 Z3.64 F42000
G1 X86.21 Y107.2 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463457
G1 F2433
M204 S6000
G1 X100.092 Y107.2 E.38833
G2 X100.451 Y107.187 I-.018 J-5.423 E.01003
; LINE_WIDTH: 0.41589
G2 X100.686 Y107.163 I-.353 J-4.792 E.00588
; LINE_WIDTH: 0.375172
G1 X100.804 Y107.147 E.00265
; LINE_WIDTH: 0.339787
G1 X100.924 Y107.128 E.00242
; LINE_WIDTH: 0.298002
G1 X101.29 Y107.06 E.00639
; WIPE_START
G1 F17067.091
G1 X100.924 Y107.128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.023 Y99.496 Z3.64 F42000
G1 X101.29 Y78.989 Z3.64
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.298579
G1 F2433
M204 S6000
G1 X100.924 Y78.921 E.0064
; LINE_WIDTH: 0.33942
G1 X100.806 Y78.902 E.00237
; LINE_WIDTH: 0.373338
G1 X100.685 Y78.887 E.0027
; LINE_WIDTH: 0.415098
G2 X100.451 Y78.863 I-.454 J3.19 E.00585
; LINE_WIDTH: 0.463301
G2 X100.092 Y78.85 I-.376 J5.409 E.01003
G1 X91.99 Y78.85 E.22657
; WIPE_START
G1 F10490.38
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2433
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.211 Y73.272 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2433
M204 S6000
G1 X88.211 Y72.79 E.01305
G1 X91.789 Y72.79 E.09697
G1 X91.789 Y73.272 E.01305
G1 X88.271 Y73.272 E.09535
M204 S250
G1 X87.81 Y73.673 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2433
M204 S5000
M73 P49 R4
G1 X87.81 Y72.39 E.03225
G1 X92.19 Y72.39 E.11012
G1 X92.19 Y73.673 E.03225
G1 X87.87 Y73.673 E.10861
M204 S10000
G1 X88.418 Y73.031 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.100226
G1 F2433
M204 S6000
G1 X91.582 Y73.031 E.01359
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X89.582 Y73.031 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/50
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.64 I-1.2 J-.201 P1  F42000
G1 X85.01 Y100.315 Z3.64
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2435
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2435
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.451 Y91.854 Z3.8 F42000
G1 X79.436 Y84.359 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2435
M204 S5000
G1 X79.394 Y84.222 E.0032
G3 X79.917 Y83.417 I.676 J-.134 E.02376
G1 X80.053 Y83.4 E.00307
G3 X79.462 Y84.413 I.017 J.689 E.06546
M204 S250
G1 X79.604 Y83.553 F42000
G1 F2435
M204 S5000
G1 X79.714 Y83.473 E.00305
G3 X80.053 Y83.379 I.353 J.617 E.00796
G1 X80.1 Y83.379 E.00105
G3 X79.559 Y83.592 I-.033 J.71 E.0865
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y83.473 E-.0743
G1 X79.843 Y83.416 E-.05377
G1 X80.053 Y83.379 E-.08099
G1 X80.1 Y83.379 E-.01781
G1 X80.228 Y83.396 E-.04906
G1 X80.362 Y83.441 E-.05382
G1 X80.485 Y83.512 E-.05377
G1 X80.591 Y83.606 E-.0538
G1 X80.677 Y83.719 E-.0538
G1 X80.738 Y83.846 E-.05384
G1 X80.773 Y83.984 E-.05382
G1 X80.78 Y84.125 E-.05378
G1 X80.759 Y84.265 E-.05376
G1 X80.711 Y84.398 E-.05368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2435
M204 S5000
G1 X85.59 Y85.735 E.01458
M73 P50 R4
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2435
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.109 Y80.008 Z3.8 F42000
G1 X91.374 Y78.448 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2435
M204 S6000
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y78.068 E.01029
G1 X91.374 Y78.068 E.07445
G1 X91.374 Y78.388 E.00866
M204 S10000
G1 X91.789 Y78.835 F42000
G1 F2435
M204 S6000
G1 X91.789 Y78.864 E.00078
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y77.653 E.03282
G1 X91.789 Y77.653 E.09697
G1 X91.789 Y78.775 E.03041
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2435
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.002 J2.8 E.03666
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.5 Y78.812 E.18881
G3 X79.903 Y78.435 I1.405 J2.427 E.03695
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y77.252 E.02973
G1 X92.19 Y77.252 E.11012
G1 X92.19 Y78.375 E.02822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.711 Y79.686 Z3.8 F42000
G1 X102.512 Y79.824 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F2435
M204 S5000
G3 X102.89 Y81.227 I-2.427 J1.405 E.03695
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.831 J-.01 E.03706
G1 X102.512 Y79.884 E.66233
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.678 Y80.157 E-.12111
G1 X102.806 Y80.546 E-.1555
G1 X102.877 Y80.951 E-.15646
G1 X102.89 Y81.227 E-.10509
G1 X102.89 Y81.811 E-.22184
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.432 Z3.8 F42000
G1 X101.49 Y106.785 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F2435
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.01 J-2.832 E.03711
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.169 Y107.402 E-.13627
G1 X100.778 Y107.531 E-.15639
G1 X100.374 Y107.601 E-.15592
G1 X100.097 Y107.615 E-.10517
G1 X100.016 Y107.615 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z3.8 F42000
G1 X77.49 Y106.229 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F2435
M204 S5000
G1 X77.488 Y106.225 E.00012
G3 X77.11 Y104.822 I2.427 J-1.405 E.03695
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.831 J.01 E.03706
G1 X77.49 Y106.169 E.66243
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.488 Y106.225 E-.02132
M73 P51 R4
G1 X77.323 Y105.893 E-.14064
G1 X77.194 Y105.502 E-.15639
G1 X77.123 Y105.098 E-.15598
G1 X77.11 Y104.822 E-.10512
G1 X77.11 Y104.347 E-.18056
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.393 Y106.63 Z3.8 F42000
G1 X86.21 Y107.2 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463458
G1 F2435
M204 S6000
G1 X100.092 Y107.2 E.38834
G2 X100.45 Y107.187 I-.017 J-5.414 E.01002
; LINE_WIDTH: 0.415928
G2 X100.686 Y107.163 I-.353 J-4.791 E.00589
; LINE_WIDTH: 0.375185
G1 X100.804 Y107.147 E.00266
; LINE_WIDTH: 0.345801
G1 X100.887 Y107.134 E.0017
; LINE_WIDTH: 0.317994
G1 X101.088 Y107.098 E.00379
; LINE_WIDTH: 0.28895
G1 X101.29 Y107.061 E.0034
; WIPE_START
G1 F17673.812
G1 X101.088 Y107.098 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.143 Y99.465 Z3.8 F42000
G1 X101.29 Y78.989 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.298648
G1 F2435
M204 S6000
G1 X100.924 Y78.921 E.00641
; LINE_WIDTH: 0.339465
G1 X100.806 Y78.902 E.00238
; LINE_WIDTH: 0.373374
G1 X100.685 Y78.887 E.0027
; LINE_WIDTH: 0.41511
G2 X100.45 Y78.863 I-.455 J3.197 E.00585
; LINE_WIDTH: 0.463301
G2 X100.092 Y78.85 I-.376 J5.404 E.01003
G1 X91.99 Y78.85 E.22658
; WIPE_START
G1 F10490.377
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2435
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.211 Y73.296 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2435
M204 S6000
G1 X88.211 Y72.803 E.01336
G1 X91.789 Y72.803 E.09697
G1 X91.789 Y73.296 E.01336
G1 X88.271 Y73.296 E.09535
M204 S250
G1 X87.81 Y73.697 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2435
M204 S5000
G1 X87.81 Y72.403 E.03254
G1 X92.19 Y72.403 E.11012
G1 X92.19 Y73.697 E.03254
G1 X87.87 Y73.697 E.10861
M204 S10000
G1 X88.418 Y73.05 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.111786
G1 F2435
M204 S6000
G1 X91.582 Y73.05 E.01597
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X89.582 Y73.05 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/50
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.8 I-1.2 J-.201 P1  F42000
G1 X85.01 Y100.315 Z3.8
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2439
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z3.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2439
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.451 Y91.854 Z3.96 F42000
G1 X79.434 Y84.356 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2439
M204 S5000
G1 X79.396 Y84.227 E.003
G3 X79.916 Y83.417 I.674 J-.139 E.02385
G1 X80.053 Y83.4 E.00308
G3 X79.461 Y84.408 I.017 J.688 E.06546
M204 S250
G1 X79.606 Y83.552 F42000
G1 F2439
M204 S5000
G1 X79.714 Y83.473 E.00299
G3 X80.053 Y83.379 I.353 J.617 E.00796
G1 X80.101 Y83.379 E.00107
G3 X79.561 Y83.59 I-.034 J.71 E.08653
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y83.473 E-.07331
G1 X79.844 Y83.416 E-.05378
G1 X80.053 Y83.379 E-.08093
G1 X80.101 Y83.379 E-.01824
G1 X80.228 Y83.396 E-.04868
G1 X80.362 Y83.441 E-.05381
G1 X80.485 Y83.512 E-.05374
G1 X80.591 Y83.606 E-.05383
G1 X80.677 Y83.719 E-.05376
G1 X80.738 Y83.846 E-.05384
G1 X80.773 Y83.983 E-.05379
G1 X80.78 Y84.125 E-.05384
G1 X80.759 Y84.265 E-.05378
G1 X80.711 Y84.398 E-.0538
G1 X80.709 Y84.4 E-.00088
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2439
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2439
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.103 Y80.003 Z3.96 F42000
G1 X91.374 Y78.435 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2439
M204 S6000
G1 X91.374 Y78.448 E.00037
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y78.027 E.01142
G1 X91.374 Y78.027 E.07445
G1 X91.374 Y78.375 E.00942
M204 S10000
G1 X91.789 Y78.435 F42000
G1 F2439
M204 S6000
G1 X91.789 Y78.864 E.01163
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y77.611 E.03394
G1 X91.789 Y77.611 E.09697
G1 X91.789 Y78.375 E.02068
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2439
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.01 J2.832 E.03665
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.496 Y78.815 E.18892
G3 X79.903 Y78.435 I1.41 J2.425 E.03707
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y77.211 E.03076
G1 X92.19 Y77.211 E.11012
G1 X92.19 Y78.375 E.02925
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
M73 P52 R4
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.683 Z3.96 F42000
G1 X102.51 Y79.82 Z3.96
G1 Z3.56
G1 E.8 F1800
G1 F2439
M204 S5000
G1 X102.561 Y79.909 E.00258
G3 X102.89 Y81.227 I-2.628 J1.357 E.03447
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.561 Y79.909 E-.02215
G1 X102.678 Y80.157 E-.10401
G1 X102.806 Y80.545 E-.1555
G1 X102.877 Y80.951 E-.15654
G1 X102.89 Y81.227 E-.1051
G1 X102.89 Y81.798 E-.2167
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.418 Z3.96 F42000
G1 X101.49 Y106.785 Z3.96
G1 Z3.56
G1 E.8 F1800
G1 F2439
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.003 J-2.806 E.03711
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.169 Y107.402 E-.13614
G1 X100.778 Y107.531 E-.15646
G1 X100.373 Y107.601 E-.15606
G1 X100.097 Y107.615 E-.1051
G1 X100.016 Y107.615 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z3.96 F42000
G1 X77.49 Y106.229 Z3.96
G1 Z3.56
G1 E.8 F1800
G1 F2439
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03707
G1 X77.49 Y106.169 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.323 Y105.893 E-.1224
G1 X77.194 Y105.503 E-.15646
G1 X77.123 Y105.098 E-.15606
G1 X77.11 Y104.822 E-.1051
G1 X77.11 Y104.243 E-.21999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z3.96 F42000
G1 X86.21 Y107.2 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463119
G1 F2439
M204 S6000
G1 X100.092 Y107.2 E.38803
G2 X100.573 Y107.176 I-.012 J-5.134 E.01345
; LINE_WIDTH: 0.403814
G1 X100.686 Y107.163 E.00274
; LINE_WIDTH: 0.375166
G1 X100.804 Y107.147 E.00266
; LINE_WIDTH: 0.346382
G1 X100.883 Y107.135 E.00163
; LINE_WIDTH: 0.318829
G1 X101.086 Y107.098 E.00383
; LINE_WIDTH: 0.289093
G1 X101.29 Y107.061 E.00343
; WIPE_START
G1 F17663.907
G1 X101.086 Y107.098 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.142 Y99.466 Z3.96 F42000
G1 X101.29 Y78.989 Z3.96
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.298004
G1 F2439
M204 S6000
G1 X100.924 Y78.921 E.00639
; LINE_WIDTH: 0.333217
G1 X100.845 Y78.908 E.00156
; LINE_WIDTH: 0.369006
G1 X100.682 Y78.885 E.00359
; LINE_WIDTH: 0.416261
G2 X100.451 Y78.863 I-.579 J4.698 E.00579
; LINE_WIDTH: 0.4633
G2 X100.092 Y78.85 I-.376 J5.409 E.01003
G1 X91.99 Y78.85 E.22657
; WIPE_START
G1 F10490.392
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2439
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.211 Y73.338 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2439
M204 S6000
G1 X88.211 Y72.825 E.01391
G1 X91.789 Y72.825 E.09697
G1 X91.789 Y73.338 E.01391
G1 X88.271 Y73.338 E.09535
M204 S250
M73 P53 R4
G1 X87.81 Y73.738 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2439
M204 S5000
G1 X87.81 Y72.424 E.03304
G1 X92.19 Y72.424 E.11012
G1 X92.19 Y73.738 E.03304
G1 X92.19 Y73.738 E.00001
G1 X87.87 Y73.738 E.10861
M204 S10000
G1 X88.418 Y73.081 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.131856
G1 F2439
M204 S6000
G1 X91.582 Y73.081 E.02011
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X89.582 Y73.081 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/50
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.96 I-1.2 J-.201 P1  F42000
G1 X85.01 Y100.315 Z3.96
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2480
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z3.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2480
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.451 Y91.854 Z4.12 F42000
G1 X79.433 Y84.353 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2480
M204 S5000
G1 X79.4 Y84.227 E.00291
G3 X79.917 Y83.417 I.669 J-.143 E.02384
G1 X80.053 Y83.4 E.00307
G3 X79.463 Y84.402 I.016 J.684 E.06514
M204 S250
G1 X79.609 Y83.55 F42000
G1 F2480
M204 S5000
G1 X79.714 Y83.473 E.00292
G3 X80.053 Y83.379 I.353 J.614 E.00796
G1 X80.102 Y83.379 E.00109
G3 X79.563 Y83.589 I-.035 J.707 E.08623
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y83.473 E-.07228
G1 X79.844 Y83.416 E-.05381
G1 X80.053 Y83.379 E-.08092
G1 X80.102 Y83.379 E-.01858
G1 X80.228 Y83.396 E-.04831
G1 X80.363 Y83.442 E-.05386
G1 X80.485 Y83.512 E-.05378
G1 X80.591 Y83.606 E-.05373
G1 X80.677 Y83.719 E-.05386
G1 X80.738 Y83.846 E-.05383
G1 X80.773 Y83.984 E-.05378
G1 X80.78 Y84.125 E-.05376
G1 X80.759 Y84.265 E-.05382
G1 X80.711 Y84.398 E-.05383
G1 X80.708 Y84.402 E-.00183
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2480
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2480
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.103 Y80.003 Z4.12 F42000
G1 X91.374 Y78.435 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2480
M204 S6000
G1 X91.374 Y78.448 E.00037
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y77.967 E.01304
G1 X91.374 Y77.967 E.07445
G1 X91.374 Y78.375 E.01105
M204 S10000
G1 X91.789 Y78.435 F42000
G1 F2480
M204 S6000
G1 X91.789 Y78.864 E.01163
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y77.551 E.03557
G1 X91.789 Y77.551 E.09697
G1 X91.789 Y78.375 E.02231
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2480
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.002 J2.803 E.03666
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.496 Y78.815 E.18892
G3 X79.903 Y78.435 I1.409 J2.423 E.03707
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y77.57 E.02174
G1 X87.81 Y77.17 E.01006
G1 X87.81 Y77.151 E.00048
G1 X92.19 Y77.151 E.11012
G1 X92.19 Y77.17 E.00048
G1 X92.19 Y77.57 E.01006
G1 X92.19 Y78.375 E.02024
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.683 Z4.12 F42000
G1 X102.51 Y79.82 Z4.12
G1 Z3.72
G1 E.8 F1800
G1 F2480
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.574 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02208
G1 X102.677 Y80.157 E-.10406
G1 X102.806 Y80.547 E-.15604
G1 X102.877 Y80.951 E-.15605
G1 X102.89 Y81.227 E-.1051
G1 X102.89 Y81.798 E-.21668
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.418 Z4.12 F42000
G1 X101.49 Y106.785 Z4.12
G1 Z3.72
G1 E.8 F1800
G1 F2480
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.003 J-2.805 E.03711
G1 X86.01 Y107.235 E.18896
M73 P54 R4
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.169 Y107.402 E-.1361
G1 X100.778 Y107.531 E-.15651
G1 X100.373 Y107.601 E-.15603
G1 X100.097 Y107.615 E-.10511
G1 X100.016 Y107.615 E-.03068
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z4.12 F42000
G1 X77.49 Y106.229 Z4.12
G1 Z3.72
G1 E.8 F1800
G1 F2480
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03707
G1 X77.49 Y106.169 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.323 Y105.894 E-.12236
G1 X77.194 Y105.503 E-.15651
G1 X77.123 Y105.098 E-.15603
G1 X77.11 Y104.822 E-.10511
G1 X77.11 Y104.243 E-.21999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z4.12 F42000
G1 X86.21 Y107.2 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463109
G1 F2480
M204 S6000
G1 X100.092 Y107.2 E.38802
G2 X100.573 Y107.176 I-.012 J-5.128 E.01345
; LINE_WIDTH: 0.403793
G1 X100.686 Y107.163 E.00274
; LINE_WIDTH: 0.37514
G1 X100.804 Y107.147 E.00266
; LINE_WIDTH: 0.346928
G1 X100.88 Y107.135 E.00155
; LINE_WIDTH: 0.319653
G1 X101.085 Y107.098 E.00387
; LINE_WIDTH: 0.289286
G1 X101.29 Y107.061 E.00346
; WIPE_START
G1 F17650.544
G1 X101.085 Y107.098 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.14 Y99.466 Z4.12 F42000
G1 X101.29 Y78.986 Z4.12
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.296241
G1 F2480
M204 S6000
G1 X101.045 Y78.944 E.00424
; LINE_WIDTH: 0.338889
G1 X100.8 Y78.901 E.00493
; LINE_WIDTH: 0.375765
G1 X100.686 Y78.886 E.00257
; LINE_WIDTH: 0.415905
G2 X100.451 Y78.863 I-.59 J4.781 E.00588
; LINE_WIDTH: 0.463301
G2 X100.092 Y78.85 I-.376 J5.413 E.01003
G1 X91.99 Y78.85 E.22657
; WIPE_START
G1 F10490.384
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.166 Y78.208 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.100036
G1 F2480
M204 S6000
G1 X88.834 Y78.208 E.00999
; WIPE_START
G1 F18000
G1 X90.834 Y78.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2480
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.211 Y73.398 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2480
M204 S6000
G1 X88.211 Y72.855 E.01471
G1 X91.789 Y72.855 E.09697
G1 X91.789 Y73.398 E.01471
G1 X88.271 Y73.398 E.09535
M204 S250
G1 X87.81 Y73.779 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2480
M204 S5000
G1 X87.81 Y72.454 E.03332
G1 X92.19 Y72.454 E.11012
G1 X92.19 Y73.379 E.02326
G1 X92.19 Y73.779 E.01006
G1 X92.19 Y73.799 E.00048
G1 X87.851 Y73.799 E.10909
M204 S10000
G1 X88.418 Y73.126 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.161716
G1 F2480
M204 S6000
G1 X91.582 Y73.126 E.02627
; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X89.582 Y73.126 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/50
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.12 I-1.2 J-.202 P1  F42000
G1 X85.01 Y100.315 Z4.12
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2486
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z3.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2486
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.473 Y91.845 Z4.28 F42000
G1 X79.381 Y84.09 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2486
M204 S5000
G3 X79.916 Y83.417 I.689 J-.001 E.02077
G1 X80.053 Y83.4 E.00307
G3 X79.383 Y84.15 I.017 J.689 E.07169
M204 S250
G1 X79.611 Y83.548 F42000
G1 F2486
M204 S5000
G1 X79.714 Y83.473 E.00287
G3 X80.053 Y83.379 I.353 J.617 E.00795
G1 X80.103 Y83.379 E.00112
G3 X79.565 Y83.587 I-.036 J.71 E.08661
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y83.473 E-.07134
G1 X79.844 Y83.416 E-.05376
G1 X80.053 Y83.379 E-.08086
G1 X80.103 Y83.379 E-.01901
G1 X80.228 Y83.396 E-.04799
G1 X80.362 Y83.441 E-.0538
G1 X80.485 Y83.512 E-.05375
G1 X80.591 Y83.606 E-.05381
G1 X80.677 Y83.719 E-.0538
G1 X80.738 Y83.846 E-.0538
G1 X80.773 Y83.984 E-.05381
G1 X80.78 Y84.125 E-.05384
G1 X80.759 Y84.265 E-.05375
G1 X80.711 Y84.398 E-.05385
G1 X80.707 Y84.404 E-.00283
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2486
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2486
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.103 Y80.003 Z4.28 F42000
G1 X91.374 Y78.435 Z4.28
G1 Z3.88
M73 P55 R4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2486
M204 S6000
G1 X91.374 Y78.448 E.00037
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y77.886 E.01524
G1 X91.374 Y77.886 E.07445
G1 X91.374 Y78.375 E.01324
M204 S10000
G1 X91.789 Y78.435 F42000
G1 F2486
M204 S6000
G1 X91.789 Y78.864 E.01163
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y77.47 E.03776
G1 X91.789 Y77.47 E.09697
G1 X91.789 Y78.375 E.0245
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2486
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.001 J2.799 E.03666
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.497 Y78.815 E.18889
G1 X78.509 Y78.807 E.00037
G3 X79.903 Y78.435 I1.396 J2.431 E.03668
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y77.91 E.0132
G1 X87.81 Y77.51 E.01006
G1 X87.81 Y77.11 E.01006
G1 X87.81 Y77.07 E.001
G1 X92.19 Y77.07 E.11012
G1 X92.19 Y77.11 E.001
G1 X92.19 Y77.51 E.01006
G1 X92.19 Y77.91 E.01006
G1 X92.19 Y78.375 E.01169
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.684 Z4.28 F42000
G1 X102.51 Y79.821 Z4.28
G1 Z3.88
G1 E.8 F1800
G1 F2486
M204 S5000
G1 X102.583 Y79.954 E.00381
G3 X102.89 Y81.227 I-2.658 J1.314 E.0332
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.881 E.66241
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.583 Y79.954 E-.03918
G1 X102.727 Y80.285 E-.13701
G1 X102.806 Y80.545 E-.10344
G1 X102.877 Y80.951 E-.15661
G1 X102.89 Y81.227 E-.10509
G1 X102.89 Y81.803 E-.21868
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.423 Z4.28 F42000
G1 X101.49 Y106.785 Z4.28
G1 Z3.88
G1 E.8 F1800
G1 F2486
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.003 J-2.806 E.03711
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.169 Y107.402 E-.13616
G1 X100.778 Y107.531 E-.15644
G1 X100.373 Y107.601 E-.15606
G1 X100.097 Y107.615 E-.1051
G1 X100.016 Y107.615 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z4.28 F42000
G1 X77.49 Y106.228 Z4.28
G1 Z3.88
G1 E.8 F1800
G1 F2486
M204 S5000
G1 X77.482 Y106.216 E.00036
G3 X77.11 Y104.822 I2.431 J-1.396 E.03669
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03707
G1 X77.49 Y106.168 E.66241
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.482 Y106.216 E-.01836
M73 P56 R4
G1 X77.323 Y105.893 E-.13658
G1 X77.194 Y105.503 E-.15644
G1 X77.123 Y105.098 E-.15606
G1 X77.11 Y104.822 E-.1051
G1 X77.11 Y104.328 E-.18746
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.389 Y106.625 Z4.28 F42000
G1 X86.21 Y107.2 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463118
G1 F2486
M204 S6000
G1 X100.092 Y107.2 E.38803
G2 X100.573 Y107.176 I-.012 J-5.131 E.01346
; LINE_WIDTH: 0.403978
G1 X100.684 Y107.164 E.0027
; LINE_WIDTH: 0.377475
G1 X100.782 Y107.149 E.0022
; LINE_WIDTH: 0.349152
G1 X100.879 Y107.135 E.00202
; LINE_WIDTH: 0.319775
G1 X101.084 Y107.098 E.00388
; LINE_WIDTH: 0.289372
G1 X101.29 Y107.061 E.00347
; WIPE_START
G1 F17644.601
G1 X101.084 Y107.098 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.14 Y99.466 Z4.28 F42000
G1 X101.29 Y78.989 Z4.28
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.298046
G1 F2486
M204 S6000
G1 X100.924 Y78.921 E.00639
; LINE_WIDTH: 0.339429
G1 X100.807 Y78.902 E.00237
; LINE_WIDTH: 0.373323
G1 X100.685 Y78.887 E.00271
; LINE_WIDTH: 0.4151
G2 X100.451 Y78.863 I-.455 J3.195 E.00585
; LINE_WIDTH: 0.463301
G2 X100.092 Y78.85 I-.376 J5.412 E.01003
G1 X91.99 Y78.85 E.22658
; WIPE_START
G1 F10490.384
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.166 Y78.167 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.180976
G1 F2486
M204 S6000
G1 X88.834 Y78.167 E.02229
; WIPE_START
G1 F18000
G1 X90.834 Y78.167 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2486
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.211 Y73.479 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2486
M204 S6000
G1 X88.211 Y72.894 E.01584
G1 X91.789 Y72.894 E.09697
G1 X91.789 Y73.479 E.01584
G1 X88.271 Y73.479 E.09535
M204 S250
G1 X87.81 Y73.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2486
M204 S5000
G1 X87.81 Y72.493 E.03384
G1 X92.19 Y72.493 E.11012
G1 X92.19 Y73.04 E.01373
G1 X92.19 Y73.44 E.01006
G1 X92.19 Y73.84 E.01006
G1 X92.19 Y73.879 E.001
G1 X87.83 Y73.879 E.10962
M204 S10000
G1 X88.418 Y73.186 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203356
G1 F2486
M204 S6000
G1 X91.582 Y73.186 E.03485
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X89.582 Y73.186 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/50
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.28 I-1.2 J-.202 P1  F42000
G1 X85.01 Y100.315 Z4.28
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2493
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z4.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2493
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.451 Y91.854 Z4.44 F42000
G1 X79.434 Y84.353 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2493
M204 S5000
G1 X79.395 Y84.222 E.00306
G3 X79.917 Y83.417 I.675 J-.134 E.02375
G1 X80.053 Y83.4 E.00307
G3 X79.46 Y84.407 I.017 J.688 E.06549
M204 S250
G1 X79.613 Y83.547 F42000
G1 F2493
M204 S5000
G1 X79.714 Y83.473 E.0028
G3 X80.053 Y83.379 I.353 J.616 E.00796
G1 X80.104 Y83.38 E.00114
G3 X79.567 Y83.585 I-.037 J.71 E.08665
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y83.473 E-.07022
G1 X79.844 Y83.416 E-.05385
G1 X80.053 Y83.379 E-.08083
G1 X80.104 Y83.38 E-.0194
G1 X80.228 Y83.396 E-.04761
G1 X80.362 Y83.441 E-.0538
G1 X80.485 Y83.512 E-.0538
G1 X80.591 Y83.606 E-.05374
G1 X80.677 Y83.719 E-.05386
G1 X80.738 Y83.846 E-.05379
G1 X80.773 Y83.984 E-.05378
G1 X80.78 Y84.125 E-.05382
G1 X80.759 Y84.265 E-.05381
G1 X80.711 Y84.398 E-.05377
G1 X80.705 Y84.407 E-.0039
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2493
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2493
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.103 Y80.003 Z4.44 F42000
G1 X91.374 Y78.435 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2493
M204 S6000
G1 X91.374 Y78.448 E.00037
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y77.781 E.01809
G1 X91.374 Y77.781 E.07445
G1 X91.374 Y78.375 E.01609
M204 S10000
G1 X91.789 Y78.435 F42000
G1 F2493
M204 S6000
G1 X91.789 Y78.864 E.01163
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y77.365 E.04062
G1 X91.789 Y77.365 E.09697
G1 X91.789 Y78.375 E.02736
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2493
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.012 J2.838 E.03665
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.496 Y78.815 E.18892
G3 X79.903 Y78.435 I1.41 J2.425 E.03707
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y77.829 E.01523
G1 X87.81 Y77.429 E.01006
G1 X87.81 Y77.029 E.01006
G1 X87.81 Y76.964 E.00162
G1 X92.19 Y76.964 E.11012
G1 X92.19 Y77.029 E.00162
G1 X92.19 Y77.429 E.01006
G1 X92.19 Y77.829 E.01006
G1 X92.19 Y78.375 E.01373
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.683 Z4.44 F42000
G1 X102.51 Y79.82 Z4.44
G1 Z4.04
G1 E.8 F1800
G1 F2493
M204 S5000
G1 X102.56 Y79.909 E.00257
M73 P57 R4
G3 X102.89 Y81.227 I-2.574 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.84 J-.012 E.03706
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02212
G1 X102.678 Y80.157 E-.10407
G1 X102.806 Y80.547 E-.15596
G1 X102.877 Y80.951 E-.15606
G1 X102.89 Y81.227 E-.1051
G1 X102.89 Y81.798 E-.21669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.418 Z4.44 F42000
G1 X101.49 Y106.785 Z4.44
G1 Z4.04
G1 E.8 F1800
G1 F2493
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.012 J-2.84 E.0371
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17556
G1 X101.169 Y107.402 E-.13613
G1 X100.778 Y107.531 E-.15646
G1 X100.373 Y107.601 E-.15605
G1 X100.097 Y107.615 E-.10512
G1 X100.016 Y107.615 E-.03068
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z4.44 F42000
G1 X77.49 Y106.229 Z4.44
G1 Z4.04
G1 E.8 F1800
G1 F2493
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.823 I2.817 J.009 E.037
G1 X77.49 Y106.169 E.66237
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.323 Y105.893 E-.12239
G1 X77.194 Y105.503 E-.15646
G1 X77.123 Y105.098 E-.15605
G1 X77.11 Y104.822 E-.10512
G1 X77.11 Y104.243 E-.21999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z4.44 F42000
G1 X86.21 Y107.2 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463118
G1 F2493
M204 S6000
G1 X100.092 Y107.2 E.38803
G2 X100.573 Y107.176 I-.012 J-5.131 E.01346
; LINE_WIDTH: 0.403965
G1 X100.684 Y107.164 E.0027
; LINE_WIDTH: 0.37774
G1 X100.78 Y107.15 E.00216
; LINE_WIDTH: 0.349986
G1 X100.875 Y107.136 E.00199
; LINE_WIDTH: 0.320606
G1 X101.083 Y107.099 E.00393
; LINE_WIDTH: 0.289585
G1 X101.29 Y107.061 E.0035
; WIPE_START
G1 F17629.849
G1 X101.083 Y107.099 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.139 Y99.466 Z4.44 F42000
G1 X101.29 Y78.987 Z4.44
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.292135
G1 F2493
M204 S6000
G1 X101.071 Y78.948 E.00373
; LINE_WIDTH: 0.326291
G1 X100.853 Y78.91 E.00422
; LINE_WIDTH: 0.367787
G1 X100.682 Y78.885 E.00376
; LINE_WIDTH: 0.416328
G2 X100.451 Y78.863 I-.578 J4.691 E.00578
; LINE_WIDTH: 0.463301
G2 X100.092 Y78.85 I-.376 J5.415 E.01003
G1 X91.99 Y78.85 E.22657
; WIPE_START
G1 F10490.384
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.166 Y78.114 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.286256
G1 F2493
M204 S6000
G1 X88.834 Y78.114 E.03829
; WIPE_START
G1 F17862.815
G1 X90.834 Y78.114 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2493
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.211 Y73.584 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2493
M204 S6000
G1 X88.211 Y72.943 E.01737
G1 X91.789 Y72.943 E.09697
G1 X91.789 Y73.584 E.01737
G1 X88.271 Y73.584 E.09535
M204 S250
G1 X87.81 Y73.92 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2493
M204 S5000
M73 P58 R4
G1 X87.81 Y72.542 E.03465
G1 X92.19 Y72.542 E.11012
G1 X92.19 Y73.12 E.01453
G1 X92.19 Y73.52 E.01006
G1 X92.19 Y73.92 E.01006
G1 X92.19 Y73.985 E.00162
G1 X87.81 Y73.985 E.11012
G1 X87.81 Y73.98 E.00011
M204 S10000
G1 X88.418 Y73.264 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.259706
G1 F2493
M204 S6000
G1 X91.582 Y73.264 E.04647
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X89.582 Y73.264 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/50
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.44 I-1.2 J-.203 P1  F42000
G1 X85.01 Y100.315 Z4.44
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2534
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2534
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.452 Y91.854 Z4.6 F42000
G1 X79.437 Y84.356 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2534
M204 S5000
G1 X79.403 Y84.259 E.0023
G3 X79.917 Y83.417 I.666 J-.171 E.0246
G1 X80.053 Y83.4 E.00307
G3 X79.462 Y84.411 I.017 J.688 E.0654
M204 S250
G1 X79.631 Y83.533 F42000
G1 F2534
M204 S5000
G1 X79.655 Y83.512 E.00071
G3 X80.052 Y83.379 I.415 J.577 E.00951
G1 X80.123 Y83.381 E.00159
G3 X79.549 Y83.606 I-.053 J.709 E.08562
G1 X79.586 Y83.573 E.00112
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y83.512 E-.03482
G1 X79.778 Y83.441 E-.05374
G1 X79.912 Y83.396 E-.05379
G1 X80.052 Y83.379 E-.05379
G1 X80.123 Y83.381 E-.02693
G1 X80.33 Y83.428 E-.08057
G1 X80.456 Y83.492 E-.05378
G1 X80.567 Y83.581 E-.05384
G1 X80.657 Y83.689 E-.05374
G1 X80.725 Y83.813 E-.05384
G1 X80.767 Y83.949 E-.05376
G1 X80.781 Y84.09 E-.05382
G1 X80.767 Y84.23 E-.05376
G1 X80.725 Y84.366 E-.05391
G1 X80.692 Y84.426 E-.0259
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2534
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2534
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.103 Y80.003 Z4.6 F42000
G1 X91.374 Y78.435 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2534
M204 S6000
G1 X91.374 Y78.448 E.00037
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y77.643 E.02182
G1 X91.374 Y77.643 E.07445
G1 X91.374 Y78.375 E.01983
M204 S10000
G1 X91.789 Y78.435 F42000
G1 F2534
M204 S6000
G1 X91.789 Y78.864 E.01163
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y77.227 E.04435
G1 X91.789 Y77.227 E.09697
G1 X91.789 Y78.375 E.03109
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2534
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.012 J2.841 E.03665
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.497 Y78.815 E.18889
G3 X79.903 Y78.435 I1.407 J2.416 E.03705
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y78.123 E.00782
G1 X87.81 Y77.723 E.01006
G1 X87.81 Y77.323 E.01006
G1 X87.81 Y76.923 E.01006
G1 F2414.451
G1 X87.81 Y76.826 E.00244
G1 F1800
G1 X92.19 Y76.826 E.11012
G1 F2414.451
G1 X92.19 Y76.923 E.00244
G1 F2534
G1 X92.19 Y77.323 E.01006
G1 X92.19 Y77.723 E.01006
G1 X92.19 Y78.123 E.01006
G1 X92.19 Y78.375 E.00632
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.684 Z4.6 F42000
G1 X102.51 Y79.821 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F2534
M204 S5000
G1 X102.586 Y79.96 E.00398
G3 X102.89 Y81.227 I-2.671 J1.31 E.03303
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.881 E.66241
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.586 Y79.96 E-.04166
G1 X102.727 Y80.285 E-.13435
G1 X102.806 Y80.545 E-.10344
G1 X102.877 Y80.951 E-.15663
G1 X102.89 Y81.227 E-.10509
G1 X102.89 Y81.803 E-.21882
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.424 Z4.6 F42000
G1 X101.49 Y106.785 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F2534
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.003 J-2.806 E.03711
G1 X86.01 Y107.235 E.18896
M73 P59 R4
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.169 Y107.402 E-.13611
G1 X100.778 Y107.531 E-.15641
G1 X100.373 Y107.601 E-.15615
G1 X100.097 Y107.615 E-.10509
G1 X100.016 Y107.615 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z4.6 F42000
G1 X77.49 Y106.229 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F2534
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03707
G1 X77.49 Y106.169 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.323 Y105.894 E-.12229
G1 X77.194 Y105.503 E-.15649
G1 X77.123 Y105.098 E-.15615
G1 X77.11 Y104.822 E-.10509
G1 X77.11 Y104.243 E-.21999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z4.6 F42000
G1 X86.21 Y107.2 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463118
G1 F2534
M204 S6000
G1 X100.092 Y107.2 E.38803
G2 X100.573 Y107.176 I-.011 J-5.121 E.01346
; LINE_WIDTH: 0.403924
G1 X100.685 Y107.163 E.00271
; LINE_WIDTH: 0.377915
G1 X100.778 Y107.15 E.00212
; LINE_WIDTH: 0.350711
G1 X100.872 Y107.136 E.00196
; LINE_WIDTH: 0.321357
G1 X101.081 Y107.099 E.00397
; LINE_WIDTH: 0.289839
G1 X101.29 Y107.062 E.00353
; WIPE_START
G1 F17612.339
G1 X101.081 Y107.099 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.138 Y99.467 Z4.6 F42000
G1 X101.29 Y78.987 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.291853
G1 F2534
M204 S6000
G1 X101.073 Y78.949 E.0037
; LINE_WIDTH: 0.325485
G1 X100.856 Y78.91 E.00418
; LINE_WIDTH: 0.36727
G1 X100.682 Y78.885 E.00383
; LINE_WIDTH: 0.416344
G2 X100.451 Y78.863 I-.578 J4.693 E.00578
; LINE_WIDTH: 0.4633
G2 X100.092 Y78.85 I-.376 J5.408 E.01003
G1 X91.99 Y78.85 E.22657
; WIPE_START
G1 F10490.391
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.166 Y78.045 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.424106
G1 F2534
M204 S6000
G1 X88.834 Y78.045 E.05925
; WIPE_START
G1 F11545.27
G1 X90.834 Y78.045 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2534
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.211 Y73.722 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2534
M204 S6000
G1 X88.211 Y73.003 E.01949
G1 X91.789 Y73.003 E.09697
G1 X91.789 Y73.722 E.01949
G1 X88.271 Y73.722 E.09535
M204 S250
G1 X87.81 Y74.026 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2534
M204 S5000
G1 X87.81 Y72.602 E.03579
G1 X92.19 Y72.602 E.11012
G1 X92.19 Y72.826 E.00563
G1 X92.19 Y73.226 E.01006
G1 X92.19 Y73.626 E.01006
G1 X92.19 Y74.026 E.01006
G1 F2414.383
G1 X92.19 Y74.123 E.00243
G1 F1800
G1 X87.81 Y74.123 E.11012
G1 F2023.151
G1 X87.81 Y74.086 E.00093
M204 S10000
G1 X88.418 Y73.362 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.337946
G1 F2534
M204 S6000
G1 X91.582 Y73.362 E.0626
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F14821.646
G1 X89.582 Y73.362 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/50
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.6 I-1.2 J-.204 P1  F42000
G1 X85.01 Y100.315 Z4.6
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P59 R3
G1 F2607
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z4.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2607
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.451 Y91.854 Z4.76 F42000
G1 X79.43 Y84.342 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2607
M204 S5000
G1 X79.397 Y84.226 E.00271
G3 X79.984 Y83.406 I.675 J-.137 E.02531
G1 X80.058 Y83.4 E.00165
G3 X79.456 Y84.396 I.015 J.688 E.06578
M204 S250
G1 X79.632 Y83.532 F42000
G1 F2607
M204 S5000
G1 X79.654 Y83.512 E.00067
G3 X80.053 Y83.379 I.413 J.576 E.00955
G1 X80.106 Y83.38 E.00119
G3 X79.548 Y83.605 I-.038 J.708 E.0858
G1 X79.587 Y83.571 E.00116
; WIPE_START
G1 F12000
M204 S6000
G1 X79.654 Y83.512 E-.03418
G1 X79.778 Y83.441 E-.05388
G1 X79.912 Y83.396 E-.05384
G1 X80.053 Y83.379 E-.05409
G1 X80.106 Y83.38 E-.02013
G1 X80.228 Y83.396 E-.04686
G1 X80.362 Y83.441 E-.05385
G1 X80.485 Y83.512 E-.0538
G1 X80.591 Y83.606 E-.05376
G1 X80.677 Y83.719 E-.05385
G1 X80.738 Y83.847 E-.05383
G1 X80.773 Y83.984 E-.05378
G1 X80.78 Y84.125 E-.05377
G1 X80.759 Y84.265 E-.05378
G1 X80.711 Y84.398 E-.05378
G1 X80.692 Y84.426 E-.01282
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2607
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2607
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.103 Y80.003 Z4.76 F42000
G1 X91.374 Y78.435 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2607
M204 S6000
M73 P60 R3
G1 X91.374 Y78.448 E.00037
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y77.46 E.02678
G1 X91.374 Y77.46 E.07445
G1 X91.374 Y78.375 E.02478
M204 S10000
G1 X91.789 Y78.435 F42000
G1 F2607
M204 S6000
G1 X91.789 Y78.864 E.01163
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y77.044 E.0493
G1 X91.789 Y77.044 E.09697
G1 X91.789 Y78.375 E.03604
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2607
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.013 J2.843 E.03665
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.496 Y78.815 E.18892
G3 X79.903 Y78.435 I1.41 J2.425 E.03707
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y77.985 E.01129
G1 X87.81 Y77.585 E.01006
G1 X87.81 Y77.185 E.01006
G1 X87.81 Y76.785 E.01006
G1 F1976.785
G1 X87.81 Y76.644 E.00356
G1 F1200
G1 X92.19 Y76.644 E.11012
G1 F1976.785
G1 X92.19 Y76.785 E.00356
G1 F2607
G1 X92.19 Y77.185 E.01006
G1 X92.19 Y77.585 E.01006
G1 X92.19 Y77.985 E.01006
G1 X92.19 Y78.375 E.00978
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.683 Z4.76 F42000
G1 X102.51 Y79.82 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F2607
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.649 J1.362 E.03446
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02214
G1 X102.678 Y80.157 E-.10401
G1 X102.806 Y80.545 E-.1554
G1 X102.877 Y80.951 E-.15667
G1 X102.89 Y81.227 E-.10509
G1 X102.89 Y81.798 E-.2167
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.418 Z4.76 F42000
G1 X101.49 Y106.785 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F2607
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.003 J-2.806 E.03711
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.169 Y107.401 E-.13605
G1 X100.778 Y107.531 E-.15649
G1 X100.373 Y107.601 E-.15611
G1 X100.097 Y107.615 E-.10511
G1 X100.016 Y107.615 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z4.76 F42000
G1 X77.49 Y106.229 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F2607
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03707
G1 X77.49 Y106.169 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.323 Y105.894 E-.12228
M73 P61 R3
G1 X77.194 Y105.503 E-.15651
G1 X77.123 Y105.098 E-.15611
G1 X77.11 Y104.822 E-.10511
G1 X77.11 Y104.243 E-.21999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z4.76 F42000
G1 X86.21 Y107.2 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463117
G1 F2607
M204 S6000
G1 X100.092 Y107.2 E.38803
G2 X100.573 Y107.176 I-.012 J-5.123 E.01347
; LINE_WIDTH: 0.403881
G1 X100.685 Y107.163 E.0027
; LINE_WIDTH: 0.378205
G1 X100.777 Y107.15 E.00209
; LINE_WIDTH: 0.351583
G1 X100.869 Y107.137 E.00192
; LINE_WIDTH: 0.322168
G1 X101.079 Y107.099 E.00401
; LINE_WIDTH: 0.289991
G1 X101.29 Y107.062 E.00356
; WIPE_START
G1 F17601.863
G1 X101.079 Y107.099 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.136 Y99.467 Z4.76 F42000
G1 X101.29 Y78.987 Z4.76
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.291626
G1 F2607
M204 S6000
G1 X101.075 Y78.949 E.00366
; LINE_WIDTH: 0.324646
G1 X100.86 Y78.911 E.00413
; LINE_WIDTH: 0.353918
G1 X100.771 Y78.898 E.00188
; LINE_WIDTH: 0.379483
G1 X100.681 Y78.885 E.00203
; LINE_WIDTH: 0.416375
G2 X100.45 Y78.863 I-.576 J4.674 E.00578
; LINE_WIDTH: 0.463301
G2 X100.092 Y78.85 I-.376 J5.4 E.01003
G1 X91.99 Y78.85 E.22658
; WIPE_START
G1 F10490.375
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.166 Y77.954 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.606836
G1 F2607
M204 S6000
G1 X88.834 Y77.954 E.08702
; WIPE_START
G1 F7860.263
G1 X90.834 Y77.954 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2607
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.211 Y73.905 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2607
M204 S6000
G1 X88.211 Y73.073 E.02254
G1 X91.789 Y73.073 E.09697
G1 X91.789 Y73.905 E.02254
G1 X88.271 Y73.905 E.09535
M204 S250
G1 X87.81 Y74.164 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2607
M204 S5000
G1 X87.81 Y72.672 E.0375
G1 X92.19 Y72.672 E.11012
G1 X92.19 Y72.964 E.00733
G1 X92.19 Y73.364 E.01006
G1 X92.19 Y73.764 E.01006
G1 X92.19 Y74.164 E.01006
G1 F1976.723
G1 X92.19 Y74.305 E.00356
G1 F1200
G1 X87.81 Y74.305 E.11012
G1 F1624.367
G1 X87.81 Y74.224 E.00205
M204 S10000
G1 X88.418 Y73.489 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.450456
G1 F2607
M204 S6000
G1 X91.582 Y73.489 E.0858
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10814.188
G1 X89.582 Y73.489 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/50
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.76 I-1.2 J-.204 P1  F42000
G1 X85.01 Y100.315 Z4.76
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2815
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z4.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2815
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.451 Y91.854 Z4.92 F42000
G1 X79.43 Y84.342 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2815
M204 S5000
G1 X79.395 Y84.227 E.00269
G3 X79.917 Y83.417 I.675 J-.138 E.02386
G1 X80.053 Y83.4 E.00307
G3 X79.454 Y84.397 I.017 J.689 E.06587
M204 S250
G1 X79.635 Y83.53 F42000
G1 F2815
M204 S5000
G1 X79.654 Y83.511 E.00061
G3 X80.053 Y83.379 I.413 J.576 E.00954
G1 X80.107 Y83.38 E.00121
G3 X79.548 Y83.605 I-.039 J.708 E.08579
G1 X79.589 Y83.569 E.00122
; WIPE_START
G1 F12000
M204 S6000
G1 X79.654 Y83.511 E-.03314
G1 X79.778 Y83.441 E-.05382
G1 X79.912 Y83.396 E-.05377
G1 X80.053 Y83.379 E-.05411
G1 X80.107 Y83.38 E-.02049
G1 X80.228 Y83.396 E-.04653
G1 X80.363 Y83.442 E-.05385
G1 X80.485 Y83.512 E-.05371
G1 X80.591 Y83.606 E-.05386
G1 X80.677 Y83.719 E-.0538
G1 X80.738 Y83.846 E-.0538
G1 X80.773 Y83.984 E-.05381
G1 X80.78 Y84.125 E-.0538
G1 X80.738 Y84.333 E-.08054
G1 X80.691 Y84.43 E-.04099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2815
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2815
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.71 Y79.705 Z4.92 F42000
G1 X90.894 Y78.033 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2815
M204 S6000
G1 X89.042 Y78.033 E.05019
G1 X89.042 Y77.613 E.01137
G1 X90.958 Y77.613 E.05192
G1 X90.958 Y78.033 E.01137
G1 X90.954 Y78.033 E.00011
M204 S10000
G1 X91.374 Y78.435 F42000
G1 F2815
M204 S6000
G1 X91.374 Y78.448 E.00037
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y77.197 E.0339
G1 X91.374 Y77.197 E.07445
G1 X91.374 Y78.375 E.0319
M204 S10000
G1 X91.789 Y78.435 F42000
G1 F2815
M204 S6000
G1 X91.789 Y78.864 E.01163
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y76.781 E.05643
G1 X91.789 Y76.781 E.09697
G1 X91.789 Y78.375 E.04317
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2815
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.013 J2.844 E.03665
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.498 Y78.815 E.18887
G1 X78.521 Y78.8 E.0007
G3 X79.903 Y78.435 I1.383 J2.432 E.03633
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y77.803 E.01588
G1 X87.81 Y77.403 E.01006
G1 X87.81 Y77.003 E.01006
G1 X87.81 Y76.603 E.01006
G1 F1560
G1 X87.81 Y76.381 E.00558
M106 S255
G1 F600
G1 X92.19 Y76.381 E.11012
M106 S201.45
G1 F1560
G1 X92.19 Y76.603 E.00558
M73 P62 R3
G1 F2815
G1 X92.19 Y77.003 E.01006
G1 X92.19 Y77.403 E.01006
G1 X92.19 Y77.803 E.01006
G1 X92.19 Y78.375 E.01438
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.684 Z4.92 F42000
G1 X102.51 Y79.821 Z4.92
G1 Z4.52
G1 E.8 F1800
G1 F2815
M204 S5000
G1 X102.589 Y79.966 E.00415
G3 X102.89 Y81.227 I-2.685 J1.307 E.03286
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.806 J-.003 E.03707
G1 X102.51 Y79.881 E.66241
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.589 Y79.966 E-.04405
G1 X102.727 Y80.285 E-.13187
G1 X102.806 Y80.545 E-.10343
G1 X102.877 Y80.951 E-.15661
G1 X102.89 Y81.227 E-.10509
G1 X102.89 Y81.804 E-.21895
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.424 Z4.92 F42000
G1 X101.49 Y106.785 Z4.92
G1 Z4.52
G1 E.8 F1800
G1 F2815
M204 S5000
G1 X101.49 Y107.242 E.0115
G1 X101.479 Y107.249 E.00033
G3 X100.097 Y107.615 I-1.384 J-2.437 E.03633
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.003 J-2.806 E.03711
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.242 E-.17538
G1 X101.479 Y107.249 E-.00499
G1 X101.169 Y107.401 E-.13118
G1 X100.778 Y107.531 E-.15662
G1 X100.373 Y107.601 E-.15597
G1 X100.097 Y107.615 E-.1051
G1 X100.016 Y107.615 E-.03076
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.145 Z4.92 F42000
G1 X77.49 Y106.227 Z4.92
G1 Z4.52
G1 E.8 F1800
G1 F2815
M204 S5000
G1 X77.476 Y106.204 E.00069
G3 X77.11 Y104.822 I2.436 J-1.384 E.03634
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.806 J.003 E.03707
G1 X77.49 Y106.167 E.66239
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.476 Y106.204 E-.01494
G1 X77.323 Y105.894 E-.13124
G1 X77.194 Y105.503 E-.15658
G1 X77.123 Y105.098 E-.15604
G1 X77.11 Y104.822 E-.1051
G1 X77.11 Y104.306 E-.1961
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.384 Y106.619 Z4.92 F42000
G1 X86.21 Y107.2 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463457
G1 F2815
M204 S6000
G1 X100.092 Y107.2 E.38833
G2 X100.451 Y107.187 I-.018 J-5.422 E.01004
; LINE_WIDTH: 0.416056
G2 X100.684 Y107.164 I-.349 J-4.744 E.00584
; LINE_WIDTH: 0.378549
G1 X100.775 Y107.15 E.00205
; LINE_WIDTH: 0.352414
G1 X100.865 Y107.137 E.0019
; LINE_WIDTH: 0.322981
G1 X101.078 Y107.1 E.00405
; LINE_WIDTH: 0.290271
G1 X101.29 Y107.062 E.0036
; WIPE_START
G1 F17582.633
G1 X101.078 Y107.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.135 Y99.467 Z4.92 F42000
G1 X101.29 Y78.987 Z4.92
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.291366
G1 F2815
M204 S6000
G1 X101.076 Y78.949 E.00363
; LINE_WIDTH: 0.323906
G1 X100.863 Y78.911 E.00409
; LINE_WIDTH: 0.353185
G1 X100.772 Y78.898 E.00191
; LINE_WIDTH: 0.379244
G1 X100.681 Y78.885 E.00206
; LINE_WIDTH: 0.416359
G2 X100.451 Y78.863 I-.576 J4.677 E.00577
; LINE_WIDTH: 0.463301
G2 X100.092 Y78.85 I-.376 J5.41 E.01003
G1 X91.99 Y78.85 E.22657
; WIPE_START
G1 F10490.381
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.463686
G1 F2815
M204 S6000
G1 X86.21 Y78.85 E.05038
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.92 I1.216 J.052 P1  F42000
G1 X88.211 Y74.168 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2815
M204 S6000
G1 X88.211 Y73.154 E.02745
G1 X91.789 Y73.154 E.09697
G1 X91.789 Y74.168 E.02745
G1 X88.271 Y74.168 E.09535
M204 S250
G1 X87.81 Y74.346 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2815
M204 S5000
G1 X87.81 Y72.754 E.04004
G1 X92.19 Y72.754 E.11012
G1 X92.19 Y73.146 E.00987
G1 X92.19 Y73.546 E.01006
G1 X92.19 Y73.946 E.01006
G1 X92.19 Y74.346 E.01006
G1 F1560
G1 X92.19 Y74.568 E.00558
M106 S255
G1 F600
G1 X87.81 Y74.568 E.11012
M106 S201.45
G1 F1275.422
G1 X87.81 Y74.406 E.00407
M204 S10000
M73 P63 R3
G1 X88.418 Y73.661 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.631826
G1 F2815
M204 S6000
G1 X91.582 Y73.661 E.1232
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F7531.507
G1 X89.582 Y73.661 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/50
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.92 I-1.199 J-.206 P1  F42000
G1 X85.01 Y100.315 Z4.92
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2937
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z4.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2937
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.452 Y91.854 Z5.08 F42000
G1 X79.435 Y84.35 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2937
M204 S5000
G1 X79.407 Y84.258 E.00215
G3 X79.916 Y83.417 I.662 J-.174 E.02454
G1 X80.053 Y83.4 E.00307
G3 X79.464 Y84.403 I.017 J.684 E.06512
M204 S250
G1 X79.637 Y83.528 F42000
G1 F2937
M204 S5000
G1 X79.654 Y83.511 E.00054
G3 X80.053 Y83.379 I.413 J.576 E.00954
G1 X80.108 Y83.38 E.00123
G3 X79.548 Y83.605 I-.04 J.708 E.08576
G1 X79.591 Y83.568 E.00129
; WIPE_START
G1 F12000
M204 S6000
G1 X79.654 Y83.511 E-.032
G1 X79.778 Y83.441 E-.05386
G1 X79.912 Y83.396 E-.05377
G1 X80.053 Y83.379 E-.05407
G1 X80.108 Y83.38 E-.02092
G1 X80.228 Y83.396 E-.04614
G1 X80.362 Y83.441 E-.05379
G1 X80.485 Y83.512 E-.05383
G1 X80.591 Y83.606 E-.05376
G1 X80.677 Y83.719 E-.05381
G1 X80.738 Y83.846 E-.05381
G1 X80.773 Y83.984 E-.05378
G1 X80.78 Y84.125 E-.05383
G1 X80.759 Y84.265 E-.05377
G1 X80.711 Y84.398 E-.05384
G1 X80.688 Y84.431 E-.01502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2937
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2937
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.983 Y78.79 Z5.08 F42000
G1 X89.042 Y75.971 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
M204 S5000
G1 X89.042 Y74.978 E.0269
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X89.042 Y74.596 E.01036
M106 S201.45
G1 F2937
G1 X89.042 Y74.08 E.01399
G1 X89.442 Y74.08 E.01084
G1 X89.842 Y74.08 E.01084
G1 X90.158 Y74.08 E.00857
G1 X90.558 Y74.08 E.01084
G1 X90.958 Y74.08 E.01084
G1 X90.958 Y74.596 E.01399
M106 S255
G1 F600
G1 X90.958 Y74.978 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X90.958 Y75.971 E.0269
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X90.958 Y76.353 E.01036
M106 S201.45
G1 F2725.645
G1 X90.958 Y76.753 E.01084
G1 F2937
G1 X90.958 Y77.153 E.01084
G1 X90.958 Y77.553 E.01084
G1 X90.958 Y78.033 E.01298
G1 X89.042 Y78.033 E.05192
G1 X89.042 Y77.553 E.01298
G1 X89.042 Y77.153 E.01084
G1 X89.042 Y76.753 E.01084
G1 F2725.645
G1 X89.042 Y76.353 E.01084
M106 S255
G1 F600
G1 X89.042 Y76.031 E.00874
M106 S201.45
M204 S10000
G1 X88.626 Y76.173 F42000
M106 S255
G1 F600
M204 S6000
G1 X88.626 Y75.971 E.00547
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X88.626 Y74.978 E.0269
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X88.626 Y74.596 E.01036
M106 S201.45
G1 F2725.645
G1 X88.626 Y74.196 E.01084
G1 F2937
G1 X88.626 Y73.664 E.01441
G1 X89.026 Y73.664 E.01084
G1 X90.974 Y73.664 E.05277
G1 X91.374 Y73.664 E.01084
G1 X91.374 Y74.196 E.01441
G1 F2725.645
G1 X91.374 Y74.596 E.01084
M106 S255
G1 F600
G1 X91.374 Y74.978 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X91.374 Y75.971 E.0269
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X91.374 Y76.353 E.01036
M106 S201.45
G1 F2725.645
G1 X91.374 Y76.753 E.01084
G1 F2937
G1 X91.374 Y77.153 E.01084
G1 X91.374 Y77.553 E.01084
G1 X91.374 Y78.448 E.02425
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y77.553 E.02425
G1 X88.626 Y77.153 E.01084
G1 X88.626 Y76.753 E.01084
G1 F2725.645
G1 X88.626 Y76.353 E.01084
M106 S255
G1 F600
G1 X88.626 Y76.233 E.00327
M106 S201.45
M204 S10000
G1 X88.211 Y76.614 F42000
G1 F1810.426
M204 S6000
G1 X88.211 Y76.353 E.00706
M106 S255
G1 F600
G1 X88.211 Y75.971 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X88.211 Y74.978 E.0269
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X88.211 Y74.596 E.01036
M106 S201.45
G1 F2725.645
G1 X88.211 Y74.196 E.01084
G1 F2937
G1 X88.211 Y73.796 E.01084
G1 X88.211 Y73.248 E.01484
G1 X91.789 Y73.248 E.09697
G1 X91.789 Y73.796 E.01484
G1 X91.789 Y74.196 E.01084
G1 F2725.645
G1 X91.789 Y74.596 E.01084
M106 S255
G1 F600
G1 X91.789 Y74.978 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X91.789 Y75.971 E.0269
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X91.789 Y76.353 E.01036
M106 S201.45
G1 F2725.645
G1 X91.789 Y76.753 E.01084
G1 F2937
G1 X91.789 Y77.153 E.01084
G1 X91.789 Y77.553 E.01084
G1 X91.789 Y78.864 E.03551
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y76.674 E.05934
; WIPE_START
G1 F10826.06
G1 X88.211 Y76.353 E-.12182
G1 X88.211 Y75.971 E-.14535
G1 X88.211 Y74.978 E-.37718
G1 X88.211 Y74.674 E-.11565
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.01 Y78.815 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2937
M204 S5000
G1 X78.497 Y78.815 E.18889
G3 X79.903 Y78.435 I1.407 J2.415 E.03704
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y77.94 E.01244
G1 X87.81 Y77.54 E.01006
G1 X87.81 Y77.14 E.01006
G1 X87.81 Y76.74 E.01006
G1 F2725.645
G1 X87.81 Y76.34 E.01006
M106 S255
G1 F600
G1 X87.81 Y75.971 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X87.81 Y74.978 E.0269
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X87.81 Y74.609 E.00928
M106 S201.45
G1 F2725.645
G1 X87.81 Y74.209 E.01006
G1 F2937
G1 X87.81 Y73.809 E.01006
G1 X87.81 Y73.409 E.01006
G1 X87.81 Y72.848 E.01412
G1 X92.19 Y72.848 E.11012
G1 X92.19 Y73.409 E.01412
G1 X92.19 Y73.809 E.01006
G1 X92.19 Y74.209 E.01006
G1 F2725.645
G1 X92.19 Y74.609 E.01006
M106 S255
G1 F600
G1 X92.19 Y74.978 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X92.19 Y75.971 E.0269
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X92.19 Y76.34 E.00928
M106 S201.45
G1 F2725.645
G1 X92.19 Y76.74 E.01006
G1 F2937
G1 X92.19 Y77.14 E.01006
G1 X92.19 Y77.54 E.01006
G1 X92.19 Y77.94 E.01006
G1 X92.19 Y78.435 E.01244
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.001 J2.797 E.03666
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.875 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X84.01 Y78.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.632 Y79.255 Z5.08 F42000
G1 X102.51 Y79.822 Z5.08
G1 Z4.68
G1 E.8 F1800
G1 F2937
M204 S5000
G1 X102.591 Y79.969 E.00423
G3 X102.89 Y81.227 I-2.601 J1.283 E.03279
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.806 J-.003 E.03707
G1 X102.51 Y79.882 E.66241
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.591 Y79.969 E-.0453
M73 P64 R3
G1 X102.727 Y80.285 E-.13048
G1 X102.806 Y80.547 E-.10415
G1 X102.877 Y80.951 E-.15596
G1 X102.89 Y81.227 E-.10509
G1 X102.89 Y81.804 E-.21902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.424 Z5.08 F42000
G1 X101.49 Y106.785 Z5.08
G1 Z4.68
G1 E.8 F1800
G1 F2937
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.003 J-2.806 E.03711
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.169 Y107.401 E-.13601
G1 X100.778 Y107.531 E-.15669
G1 X100.373 Y107.601 E-.15595
G1 X100.097 Y107.615 E-.1051
G1 X100.016 Y107.615 E-.03068
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z5.08 F42000
G1 X77.49 Y106.229 Z5.08
G1 Z4.68
G1 E.8 F1800
G1 F2937
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.824 I2.78 J-.001 E.03699
G1 X77.49 Y106.169 E.66236
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.323 Y105.894 E-.12226
G1 X77.194 Y105.502 E-.15669
G1 X77.123 Y105.098 E-.15595
G1 X77.11 Y104.822 E-.1051
G1 X77.11 Y104.243 E-.21999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z5.08 F42000
G1 X86.21 Y107.2 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463116
G1 F2937
M204 S6000
G1 X100.092 Y107.2 E.38803
G2 X100.573 Y107.176 I-.012 J-5.127 E.01347
; LINE_WIDTH: 0.403907
G1 X100.684 Y107.164 E.00269
; LINE_WIDTH: 0.378853
G1 X100.773 Y107.151 E.00201
; LINE_WIDTH: 0.353287
G1 X100.862 Y107.138 E.00187
; LINE_WIDTH: 0.323836
G1 X101.076 Y107.1 E.0041
; LINE_WIDTH: 0.290475
G1 X101.29 Y107.062 E.00363
; WIPE_START
G1 F17568.633
G1 X101.076 Y107.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.134 Y99.468 Z5.08 F42000
G1 X101.29 Y78.989 Z5.08
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.298878
G1 F2937
M204 S6000
G1 X100.924 Y78.921 E.00641
; LINE_WIDTH: 0.339415
G1 X100.807 Y78.902 E.00237
; LINE_WIDTH: 0.373338
G1 X100.684 Y78.887 E.00272
; LINE_WIDTH: 0.415112
G2 X100.451 Y78.863 I-.456 J3.209 E.00584
; LINE_WIDTH: 0.463301
G2 X100.092 Y78.85 I-.376 J5.412 E.01003
G1 X91.99 Y78.85 E.22657
; WIPE_START
G1 F10490.384
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.608 Y77.865 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.439496
M106 S255
G1 F3000
M204 S6000
G1 X90.608 Y74.42 E.091
G1 X90.203 Y74.42 E.0107
G1 X90.203 Y77.692 E.08642
G1 X89.797 Y77.692 E.0107
G1 X89.797 Y74.42 E.08642
G1 X89.392 Y74.42 E.0107
G1 X89.392 Y77.865 E.091
M106 S201.45
; WIPE_START
G1 X89.392 Y75.865 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2937
M204 S6000
G1 X86.21 Y78.85 E.05038
; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/50
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.08 I-1.205 J-.168 P1  F42000
G1 X85.01 Y100.315 Z5.08
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2663
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z4.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2663
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.452 Y91.854 Z5.24 F42000
G1 X79.428 Y84.337 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2663
M204 S5000
G1 X79.396 Y84.226 E.0026
G3 X79.917 Y83.417 I.674 J-.138 E.02384
G1 X80.053 Y83.4 E.00307
G3 X79.453 Y84.392 I.017 J.688 E.06587
M204 S250
G1 X79.639 Y83.526 F42000
G1 F2663
M204 S5000
G1 X79.654 Y83.511 E.00048
G3 X80.053 Y83.379 I.413 J.578 E.00954
G1 X80.109 Y83.38 E.00126
G3 X79.548 Y83.605 I-.041 J.709 E.08591
G1 X79.594 Y83.565 E.00135
; WIPE_START
G1 F12000
M204 S6000
G1 X79.654 Y83.511 E-.03093
G1 X79.778 Y83.441 E-.05381
G1 X79.912 Y83.396 E-.05379
G1 X80.053 Y83.379 E-.05407
G1 X80.109 Y83.38 E-.02132
G1 X80.228 Y83.396 E-.04575
G1 X80.363 Y83.442 E-.05383
G1 X80.485 Y83.512 E-.05379
G1 X80.591 Y83.606 E-.05379
G1 X80.677 Y83.719 E-.05378
G1 X80.738 Y83.846 E-.05385
G1 X80.773 Y83.984 E-.05377
G1 X80.78 Y84.125 E-.0538
G1 X80.738 Y84.333 E-.08047
G1 X80.689 Y84.435 E-.04325
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2663
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2663
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.71 Y79.705 Z5.24 F42000
G1 X90.894 Y78.033 Z5.24
G1 Z4.84
M73 P65 R3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2663
M204 S6000
G1 X89.042 Y78.033 E.05019
G1 X89.042 Y74.187 E.10419
G1 X90.958 Y74.187 E.05192
G1 X90.958 Y78.033 E.10419
G1 X90.954 Y78.033 E.00011
M204 S10000
G1 X91.374 Y78.435 F42000
G1 F2663
M204 S6000
G1 X91.374 Y78.448 E.00037
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y73.772 E.12672
G1 X91.374 Y73.772 E.07445
G1 X91.374 Y78.375 E.12472
M204 S10000
G1 X91.789 Y78.435 F42000
G1 F2663
M204 S6000
G1 X91.789 Y78.864 E.01163
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y73.356 E.14925
G1 X91.789 Y73.356 E.09697
G1 X91.789 Y78.375 E.13599
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2663
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.042 J2.95 E.03662
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.497 Y78.815 E.18889
G3 X79.903 Y78.435 I1.408 J2.418 E.03704
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y72.955 E.13775
G1 X92.19 Y72.955 E.11012
G1 X92.19 Y78.375 E.13625
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.684 Z5.24 F42000
G1 X102.51 Y79.822 Z5.24
G1 Z4.84
G1 E.8 F1800
G1 F2663
M204 S5000
G1 X102.591 Y79.97 E.00424
G3 X102.89 Y81.227 I-2.506 J1.261 E.0328
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.949 J-.041 E.03703
G1 X102.51 Y79.882 E.66241
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.591 Y79.97 E-.04535
G1 X102.727 Y80.285 E-.13045
G1 X102.806 Y80.547 E-.10401
G1 X102.877 Y80.951 E-.15604
G1 X102.89 Y81.227 E-.1051
G1 X102.89 Y81.804 E-.21905
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.424 Z5.24 F42000
G1 X101.49 Y106.785 Z5.24
G1 Z4.84
G1 E.8 F1800
G1 F2663
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.408 J-2.478 E.03664
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.041 J-2.949 E.03707
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.169 Y107.402 E-.13611
G1 X100.776 Y107.531 E-.15715
G1 X100.442 Y107.592 E-.129
G1 X100.097 Y107.615 E-.13147
G1 X100.016 Y107.615 E-.0307
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z5.24 F42000
G1 X77.49 Y106.229 Z5.24
G1 Z4.84
G1 E.8 F1800
G1 F2663
M204 S5000
G3 X77.11 Y104.822 I2.47 J-1.422 E.03706
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.951 J.042 E.03703
G1 X77.49 Y106.169 E.66244
; WIPE_START
M73 P66 R3
G1 F11668.197
M204 S6000
G1 X77.323 Y105.894 E-.12224
G1 X77.193 Y105.501 E-.15728
G1 X77.132 Y105.167 E-.129
G1 X77.11 Y104.822 E-.13148
G1 X77.11 Y104.243 E-.22001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z5.24 F42000
G1 X86.21 Y107.2 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463115
G1 F2663
M204 S6000
G1 X100.092 Y107.2 E.38802
G2 X100.573 Y107.176 I-.053 J-5.962 E.01346
; LINE_WIDTH: 0.404322
G1 X100.681 Y107.164 E.00262
; LINE_WIDTH: 0.379043
G1 X100.773 Y107.151 E.00209
; LINE_WIDTH: 0.352457
G1 X100.865 Y107.137 E.00193
; LINE_WIDTH: 0.322851
G1 X101.077 Y107.1 E.00405
; LINE_WIDTH: 0.290201
G1 X101.29 Y107.062 E.0036
; WIPE_START
G1 F17587.395
G1 X101.077 Y107.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.135 Y99.467 Z5.24 F42000
G1 X101.29 Y78.987 Z5.24
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.290273
G1 F2663
M204 S6000
G1 X101.076 Y78.949 E.00361
; LINE_WIDTH: 0.323346
G1 X100.863 Y78.911 E.00408
; LINE_WIDTH: 0.353015
G1 X100.772 Y78.898 E.00191
; LINE_WIDTH: 0.379251
G1 X100.681 Y78.885 E.00207
; LINE_WIDTH: 0.416411
G2 X100.451 Y78.863 I-.577 J4.684 E.00576
; LINE_WIDTH: 0.463301
G2 X100.092 Y78.85 I-.376 J5.41 E.01003
G1 X91.99 Y78.85 E.22657
; WIPE_START
G1 F10490.381
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.557 Y77.632 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F2663
M204 S6000
G1 X90.557 Y74.588 E.07653
G1 X89.443 Y74.588 E.02803
G1 X89.443 Y77.632 E.07653
G1 X90.497 Y77.632 E.02652
M204 S10000
G1 X90.182 Y77.257 F42000
; LINE_WIDTH: 0.398906
G1 F2663
M204 S6000
G1 X90.182 Y74.963 E.05451
G1 X89.818 Y74.963 E.00866
G1 X89.818 Y77.257 E.05451
G1 X90.122 Y77.257 E.00724
; WIPE_START
G1 F12343.309
G1 X89.818 Y77.257 E-.11574
G1 X89.818 Y75.561 E-.64426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2663
M204 S6000
G1 X86.21 Y78.85 E.05038
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/50
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.24 I-1.205 J-.168 P1  F42000
G1 X85.01 Y100.315 Z5.24
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2652
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2652
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.452 Y91.854 Z5.4 F42000
G1 X79.428 Y84.335 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2652
M204 S5000
G1 X79.396 Y84.227 E.00253
G3 X79.916 Y83.417 I.674 J-.139 E.02385
G1 X80.053 Y83.4 E.00308
G3 X79.452 Y84.39 I.017 J.688 E.06592
M204 S250
G1 X79.641 Y83.524 F42000
G1 F2652
M204 S5000
G1 X79.655 Y83.512 E.00041
G3 X80.053 Y83.379 I.414 J.576 E.00954
G1 X80.11 Y83.38 E.00128
G3 X79.548 Y83.605 I-.042 J.708 E.08572
G1 X79.596 Y83.564 E.00142
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y83.512 E-.02981
G1 X79.778 Y83.441 E-.05386
G1 X79.912 Y83.396 E-.05376
G1 X80.053 Y83.379 E-.054
G1 X80.11 Y83.38 E-.02171
G1 X80.363 Y83.442 E-.09883
G1 X80.485 Y83.512 E-.05371
G1 X80.591 Y83.606 E-.05376
G1 X80.677 Y83.719 E-.0539
G1 X80.738 Y83.846 E-.05378
G1 X80.773 Y83.984 E-.05385
G1 X80.78 Y84.125 E-.05376
G1 X80.738 Y84.333 E-.08055
G1 X80.687 Y84.439 E-.04472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2652
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2652
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.743 Y79.729 Z5.4 F42000
G1 X90.958 Y78.033 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2652
M204 S6000
G1 X89.042 Y78.033 E.05192
G1 X89.042 Y74.313 E.1008
G1 X90.958 Y74.313 E.05192
G1 X90.958 Y77.973 E.09917
M204 S10000
G1 X91.374 Y78.448 F42000
G1 F2652
M204 S6000
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y73.897 E.12333
G1 X91.374 Y73.897 E.07445
G1 X91.374 Y78.388 E.1217
M204 S10000
G1 X91.789 Y78.835 F42000
G1 F2652
M204 S6000
G1 X91.789 Y78.864 E.00078
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y73.481 E.14585
G1 X91.789 Y73.481 E.09697
G1 X91.789 Y78.775 E.14345
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2652
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.807 I-.041 J2.943 E.03662
G1 X101.49 Y79.265 E.0115
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.499 Y78.815 E.18883
G3 X79.903 Y78.435 I1.403 J2.399 E.03699
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y73.081 E.13461
G1 X92.19 Y73.081 E.11012
M73 P67 R3
G1 X92.19 Y78.375 E.1331
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.683 Z5.4 F42000
G1 X102.51 Y79.82 Z5.4
G1 Z5
G1 E.8 F1800
G1 F2652
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.489 J1.323 E.03451
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.227 I-2.935 J-.04 E.03698
G1 X102.51 Y79.88 E.66239
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02206
G1 X102.678 Y80.157 E-.10415
G1 X102.806 Y80.545 E-.15529
G1 X102.877 Y80.953 E-.15733
G1 X102.89 Y81.227 E-.10449
G1 X102.89 Y81.798 E-.21668
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.418 Z5.4 F42000
G1 X101.49 Y106.785 Z5.4
G1 Z5
G1 E.8 F1800
G1 F2652
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.415 J-2.506 E.03664
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.042 J-2.953 E.03707
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17558
G1 X101.168 Y107.402 E-.13664
G1 X100.778 Y107.531 E-.15596
G1 X100.439 Y107.593 E-.13093
G1 X100.097 Y107.615 E-.13021
G1 X100.016 Y107.615 E-.03069
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z5.4 F42000
G1 X77.49 Y106.229 Z5.4
G1 Z5
G1 E.8 F1800
G1 F2652
M204 S5000
G3 X77.11 Y104.822 I2.498 J-1.43 E.03705
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.822 I2.935 J.04 E.03698
G1 X77.49 Y106.169 E.66239
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.1229
G1 X77.194 Y105.503 E-.15596
G1 X77.132 Y105.164 E-.13093
G1 X77.11 Y104.822 E-.13021
G1 X77.11 Y104.243 E-.22001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z5.4 F42000
G1 X86.21 Y107.2 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463114
G1 F2652
M204 S6000
G1 X100.092 Y107.2 E.38802
G2 X100.573 Y107.176 I-.051 J-5.924 E.01346
; LINE_WIDTH: 0.403775
G1 X100.686 Y107.163 E.00273
; LINE_WIDTH: 0.375184
G1 X100.804 Y107.147 E.00265
; LINE_WIDTH: 0.339765
G1 X100.924 Y107.128 E.00242
; LINE_WIDTH: 0.298035
G1 X101.29 Y107.06 E.00639
; WIPE_START
G1 F17064.95
G1 X100.924 Y107.128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.023 Y99.496 Z5.4 F42000
G1 X101.29 Y78.987 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.290037
G1 F2652
M204 S6000
G1 X101.078 Y78.95 E.00358
; LINE_WIDTH: 0.322517
G1 X100.867 Y78.912 E.00404
; LINE_WIDTH: 0.352168
G1 X100.774 Y78.899 E.00195
; LINE_WIDTH: 0.378991
G1 X100.681 Y78.885 E.00211
; LINE_WIDTH: 0.416437
G2 X100.45 Y78.863 I-.576 J4.679 E.00576
; LINE_WIDTH: 0.463301
G2 X100.092 Y78.85 I-.376 J5.413 E.01003
G1 X91.99 Y78.85 E.22658
; WIPE_START
G1 F10490.369
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.557 Y77.632 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F2652
M204 S6000
G1 X90.557 Y74.713 E.07338
G1 X89.443 Y74.713 E.02803
G1 X89.443 Y77.632 E.07338
G1 X90.497 Y77.632 E.02652
M204 S10000
G1 X90.182 Y77.257 F42000
; LINE_WIDTH: 0.398906
M73 P68 R3
G1 F2652
M204 S6000
G1 X90.182 Y75.088 E.05154
G1 X89.818 Y75.088 E.00866
G1 X89.818 Y77.257 E.05154
G1 X90.122 Y77.257 E.00724
; WIPE_START
G1 F12343.309
G1 X89.818 Y77.257 E-.11574
G1 X89.818 Y75.561 E-.64426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2652
M204 S6000
G1 X86.21 Y78.85 E.05038
; CHANGE_LAYER
; Z_HEIGHT: 5.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/50
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.4 I-1.205 J-.168 P1  F42000
G1 X85.01 Y100.315 Z5.4
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2638
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z5.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2638
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.452 Y91.854 Z5.56 F42000
G1 X79.432 Y84.344 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2638
M204 S5000
G1 X79.404 Y84.259 E.00199
G3 X79.917 Y83.417 I.666 J-.172 E.02459
G1 X80.053 Y83.4 E.00307
G3 X79.456 Y84.398 I.017 J.687 E.06565
M204 S250
G1 X79.643 Y83.523 F42000
G1 F2638
M204 S5000
G1 X79.654 Y83.511 E.00035
G3 X80.053 Y83.379 I.414 J.578 E.00954
G1 X80.111 Y83.38 E.0013
G3 X79.548 Y83.605 I-.043 J.709 E.08588
G1 X79.598 Y83.562 E.00148
; WIPE_START
G1 F12000
M204 S6000
G1 X79.654 Y83.511 E-.02871
G1 X79.778 Y83.441 E-.05389
G1 X79.912 Y83.396 E-.05381
G1 X80.053 Y83.379 E-.05399
G1 X80.111 Y83.38 E-.02201
G1 X80.362 Y83.441 E-.09845
G1 X80.485 Y83.512 E-.05382
G1 X80.591 Y83.606 E-.05387
G1 X80.677 Y83.719 E-.05377
G1 X80.738 Y83.846 E-.05374
G1 X80.773 Y83.983 E-.0538
G1 X80.78 Y84.125 E-.05384
G1 X80.738 Y84.333 E-.08056
G1 X80.686 Y84.441 E-.04574
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2638
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2638
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.743 Y79.729 Z5.56 F42000
G1 X90.958 Y78.033 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2638
M204 S6000
G1 X89.042 Y78.033 E.05192
G1 X89.042 Y74.455 E.09693
G1 X90.958 Y74.455 E.05192
G1 X90.958 Y77.973 E.09531
M204 S10000
G1 X91.374 Y78.448 F42000
G1 F2638
M204 S6000
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y74.04 E.11946
G1 X91.374 Y74.04 E.07445
G1 X91.374 Y78.388 E.11783
M204 S10000
G1 X91.789 Y78.835 F42000
G1 F2638
M204 S6000
G1 X91.789 Y78.864 E.00078
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y73.624 E.14199
G1 X91.789 Y73.624 E.09697
G1 X91.789 Y78.775 E.13958
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2638
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.001 J2.798 E.03666
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.496 Y78.815 E.18892
G3 X79.903 Y78.435 I1.421 J2.467 E.03706
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y73.223 E.13102
G1 X92.19 Y73.223 E.11012
G1 X92.19 Y78.375 E.12951
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.683 Z5.56 F42000
G1 X102.51 Y79.82 Z5.56
G1 Z5.16
G1 E.8 F1800
G1 F2638
M204 S5000
G1 X102.561 Y79.909 E.00258
G3 X102.89 Y81.227 I-2.574 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.848 J-.014 E.03706
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.561 Y79.909 E-.02218
G1 X102.678 Y80.157 E-.10404
G1 X102.806 Y80.547 E-.15592
G1 X102.877 Y80.953 E-.15661
G1 X102.89 Y81.227 E-.10455
G1 X102.89 Y81.798 E-.2167
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.418 Z5.56 F42000
G1 X101.49 Y106.785 Z5.56
G1 Z5.16
G1 E.8 F1800
M73 P69 R3
G1 F2638
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.407 J-2.474 E.03665
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.003 J-2.806 E.03711
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17556
G1 X101.168 Y107.402 E-.13668
G1 X100.776 Y107.531 E-.15659
G1 X100.439 Y107.593 E-.13032
G1 X100.097 Y107.615 E-.13015
G1 X100.016 Y107.615 E-.0307
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z5.56 F42000
G1 X77.49 Y106.229 Z5.56
G1 Z5.16
G1 E.8 F1800
G1 F2638
M204 S5000
G3 X77.11 Y104.822 I2.467 J-1.421 E.03706
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.848 J.014 E.03706
G1 X77.49 Y106.169 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.12293
G1 X77.193 Y105.501 E-.15659
G1 X77.132 Y105.163 E-.13032
G1 X77.11 Y104.822 E-.13015
G1 X77.11 Y104.243 E-.22001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z5.56 F42000
G1 X86.21 Y107.2 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463129
G1 F2638
M204 S6000
G1 X100.092 Y107.2 E.38804
G2 X100.57 Y107.176 I-.05 J-5.92 E.01337
; LINE_WIDTH: 0.404754
G1 X100.68 Y107.164 E.00269
; LINE_WIDTH: 0.374327
G1 X100.803 Y107.146 E.00275
; LINE_WIDTH: 0.338029
G1 X100.926 Y107.128 E.00246
; LINE_WIDTH: 0.297733
G1 X101.29 Y107.06 E.00636
; WIPE_START
G1 F17084.474
G1 X100.926 Y107.128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.025 Y99.496 Z5.56 F42000
G1 X101.29 Y78.989 Z5.56
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.297268
G1 F2638
M204 S6000
G1 X100.928 Y78.922 E.0063
; LINE_WIDTH: 0.333014
G1 X100.836 Y78.908 E.00182
; LINE_WIDTH: 0.361251
G1 X100.744 Y78.894 E.00199
; LINE_WIDTH: 0.396537
G1 X100.566 Y78.873 E.00422
; LINE_WIDTH: 0.462817
G2 X100.092 Y78.85 I-.545 J6.341 E.01327
G1 X91.99 Y78.85 E.22632
; WIPE_START
G1 F10502.218
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.557 Y77.632 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F2638
M204 S6000
G1 X90.557 Y74.856 E.06979
G1 X89.443 Y74.856 E.02803
G1 X89.443 Y77.632 E.06979
G1 X90.497 Y77.632 E.02652
M204 S10000
G1 X90.182 Y77.257 F42000
; LINE_WIDTH: 0.398906
G1 F2638
M204 S6000
G1 X90.182 Y75.231 E.04814
G1 X89.818 Y75.231 E.00866
G1 X89.818 Y77.257 E.04814
G1 X90.122 Y77.257 E.00724
; WIPE_START
G1 F12343.309
G1 X89.818 Y77.257 E-.11574
G1 X89.818 Y75.561 E-.64426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2638
M204 S6000
G1 X86.21 Y78.85 E.05038
; CHANGE_LAYER
; Z_HEIGHT: 5.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/50
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.56 I-1.205 J-.168 P1  F42000
G1 X85.01 Y100.315 Z5.56
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2620
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z5.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2620
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.452 Y91.854 Z5.72 F42000
G1 X79.425 Y84.327 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2620
M204 S5000
G1 X79.396 Y84.226 E.00235
G3 X79.916 Y83.417 I.674 J-.138 E.02383
G1 X80.053 Y83.4 E.00307
G3 X79.448 Y84.382 I.017 J.688 E.06612
M204 S250
M73 P69 R2
G1 X79.645 Y83.521 F42000
G1 F2620
M204 S5000
G1 X79.655 Y83.512 E.00029
G3 X80.053 Y83.379 I.414 J.576 E.00954
G1 X80.112 Y83.38 E.00132
G3 X79.548 Y83.605 I-.043 J.708 E.08568
G1 X79.6 Y83.56 E.00154
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y83.512 E-.02764
G1 X79.778 Y83.441 E-.05387
G1 X79.912 Y83.396 E-.05379
G1 X80.053 Y83.379 E-.05399
G1 X80.112 Y83.38 E-.02239
G1 X80.362 Y83.441 E-.09813
G1 X80.485 Y83.512 E-.0538
G1 X80.591 Y83.606 E-.05378
G1 X80.677 Y83.719 E-.05384
G1 X80.738 Y83.846 E-.05378
G1 X80.773 Y83.984 E-.0538
G1 X80.78 Y84.125 E-.05379
G1 X80.759 Y84.265 E-.05377
G1 X80.711 Y84.398 E-.05377
G1 X80.681 Y84.441 E-.01987
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2620
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2620
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.71 Y79.705 Z5.72 F42000
G1 X90.894 Y78.033 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2620
M204 S6000
G1 X89.042 Y78.033 E.05019
G1 X89.042 Y74.622 E.09241
G1 X90.958 Y74.622 E.05192
G1 X90.958 Y78.033 E.09241
G1 X90.954 Y78.033 E.00011
M204 S10000
M73 P70 R2
G1 X91.374 Y78.435 F42000
G1 F2620
M204 S6000
G1 X91.374 Y78.448 E.00037
G1 X88.626 Y78.448 E.07445
G1 X88.626 Y74.207 E.11494
G1 X91.374 Y74.207 E.07445
G1 X91.374 Y78.375 E.11294
M204 S10000
G1 X91.789 Y78.435 F42000
G1 F2620
M204 S6000
G1 X91.789 Y78.864 E.01163
G1 X88.211 Y78.864 E.09697
G1 X88.211 Y73.791 E.13746
G1 X91.789 Y73.791 E.09697
G1 X91.789 Y78.375 E.1242
M204 S250
G1 X92.19 Y78.435 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2620
M204 S5000
G1 X100.097 Y78.435 E.1988
G3 X101.49 Y78.806 I-.002 J2.803 E.03666
G1 X101.49 Y79.265 E.01152
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.496 Y78.815 E.18892
G3 X79.903 Y78.435 I1.421 J2.465 E.03706
G1 X87.81 Y78.435 E.1988
G1 X87.81 Y73.39 E.12682
G1 X92.19 Y73.39 E.11012
G1 X92.19 Y78.375 E.12531
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.19 Y78.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.712 Y79.683 Z5.72 F42000
G1 X102.51 Y79.82 Z5.72
G1 Z5.32
G1 E.8 F1800
G1 F2620
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.575 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.845 J-.013 E.03706
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02214
G1 X102.678 Y80.158 E-.10465
G1 X102.806 Y80.546 E-.1553
G1 X102.877 Y80.953 E-.15667
G1 X102.89 Y81.227 E-.10455
G1 X102.89 Y81.798 E-.2167
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.418 Z5.72 F42000
G1 X101.49 Y106.785 Z5.72
G1 Z5.32
G1 E.8 F1800
G1 F2620
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.406 J-2.472 E.03665
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.014 J-2.846 E.0371
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.168 Y107.402 E-.13668
G1 X100.777 Y107.531 E-.15648
G1 X100.436 Y107.593 E-.13174
G1 X100.097 Y107.615 E-.12885
G1 X100.016 Y107.615 E-.03069
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z5.72 F42000
G1 X77.49 Y106.229 Z5.72
G1 Z5.32
G1 E.8 F1800
G1 F2620
M204 S5000
G3 X77.11 Y104.822 I2.465 J-1.421 E.03706
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.846 J.013 E.03706
G1 X77.49 Y106.169 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.12289
M73 P71 R2
G1 X77.193 Y105.501 E-.15651
G1 X77.131 Y105.16 E-.13174
G1 X77.11 Y104.822 E-.12885
G1 X77.11 Y104.243 E-.22001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z5.72 F42000
G1 X86.21 Y107.2 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463131
G1 F2620
M204 S6000
G1 X100.092 Y107.2 E.38804
G2 X100.569 Y107.176 I-.048 J-5.89 E.01336
; LINE_WIDTH: 0.404744
G1 X100.681 Y107.164 E.00271
; LINE_WIDTH: 0.374251
G1 X100.803 Y107.146 E.00275
; LINE_WIDTH: 0.338
G1 X100.926 Y107.128 E.00245
; LINE_WIDTH: 0.297727
G1 X101.29 Y107.06 E.00635
; WIPE_START
G1 F17084.894
G1 X100.926 Y107.128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.025 Y99.496 Z5.72 F42000
G1 X101.29 Y78.987 Z5.72
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.290183
G1 F2620
M204 S6000
G1 X101.078 Y78.95 E.00358
; LINE_WIDTH: 0.322676
G1 X100.867 Y78.912 E.00404
; LINE_WIDTH: 0.352117
G1 X100.775 Y78.899 E.00191
; LINE_WIDTH: 0.378478
G1 X100.684 Y78.886 E.00207
; LINE_WIDTH: 0.416066
G2 X100.451 Y78.863 I-.585 J4.741 E.00584
; LINE_WIDTH: 0.4633
G2 X100.092 Y78.85 I-.376 J5.409 E.01003
G1 X91.99 Y78.85 E.22657
; WIPE_START
G1 F10490.391
G1 X93.99 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.557 Y77.632 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F2620
M204 S6000
G1 X90.557 Y75.023 E.06559
G1 X89.443 Y75.023 E.02803
G1 X89.443 Y77.632 E.06559
G1 X90.497 Y77.632 E.02652
M204 S10000
G1 X90.182 Y77.257 F42000
; LINE_WIDTH: 0.398906
G1 F2620
M204 S6000
G1 X90.182 Y75.398 E.04418
G1 X89.818 Y75.398 E.00866
G1 X89.818 Y77.257 E.04418
G1 X90.122 Y77.257 E.00724
; WIPE_START
G1 F12343.309
G1 X89.818 Y77.257 E-.11574
G1 X89.818 Y75.561 E-.64426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.01 Y78.85 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2620
M204 S6000
G1 X86.21 Y78.85 E.05038
; CHANGE_LAYER
; Z_HEIGHT: 5.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10480.96
G1 X88.01 Y78.85 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/50
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.72 I-1.205 J-.168 P1  F42000
G1 X85.01 Y100.315 Z5.72
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2561
M204 S5000
G1 X85.01 Y98.735 E.03972
G1 X85.59 Y98.735 E.01458
G1 X85.59 Y100.315 E.03972
G1 X85.07 Y100.315 E.01307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.01 Y98.735 E-.60084
G1 X85.429 Y98.735 E-.15917
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

G1 X85.3 Y98.935
G1 Z5.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2561
M204 S6000
G1 X85.3 Y100.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y98.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.452 Y91.854 Z5.88 F42000
G1 X79.428 Y84.337 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2561
M204 S5000
G1 X79.396 Y84.226 E.00257
G3 X79.917 Y83.417 I.674 J-.138 E.02385
G1 X80.053 Y83.4 E.00307
G3 X79.452 Y84.391 I.017 J.688 E.06588
M204 S250
G1 X79.648 Y83.519 F42000
G1 F2561
M204 S5000
G1 X79.655 Y83.512 E.00023
G3 X80.053 Y83.379 I.414 J.578 E.00953
G1 X80.113 Y83.38 E.00134
G3 X79.548 Y83.605 I-.044 J.709 E.08583
G1 X79.602 Y83.558 E.00161
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y83.512 E-.02663
G1 X79.778 Y83.441 E-.05377
G1 X79.912 Y83.396 E-.05381
G1 X80.053 Y83.379 E-.054
G1 X80.113 Y83.38 E-.02278
G1 X80.362 Y83.441 E-.09773
G1 X80.485 Y83.512 E-.05376
G1 X80.591 Y83.606 E-.05387
G1 X80.677 Y83.719 E-.05383
G1 X80.738 Y83.846 E-.05377
G1 X80.773 Y83.984 E-.05378
G1 X80.78 Y84.125 E-.05381
G1 X80.759 Y84.265 E-.05376
G1 X80.711 Y84.398 E-.05379
G1 X80.68 Y84.443 E-.02091
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y85.735 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2561
M204 S5000
G1 X85.59 Y85.735 E.01458
G1 X85.59 Y87.315 E.03972
G1 X85.01 Y87.315 E.01458
G1 X85.01 Y85.795 E.03822
M204 S10000
G1 X85.3 Y85.935 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2561
M204 S6000
G1 X85.3 Y87.114 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y85.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.235 Y79.395 Z5.88 F42000
G1 X90.958 Y76.531 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2561
M204 S6000
G1 X89.042 Y76.531 E.05192
G1 X89.042 Y74.817 E.04645
G1 X90.958 Y74.817 E.05192
G1 X90.958 Y76.471 E.04483
M204 S10000
G1 X91.374 Y76.947 F42000
G1 F2561
M204 S6000
G1 X88.626 Y76.947 E.07445
G1 X88.626 Y74.401 E.06898
G1 X91.374 Y74.401 E.07445
G1 X91.374 Y76.887 E.06735
M204 S10000
G1 X91.789 Y77.363 F42000
G1 F2561
M204 S6000
G1 X88.211 Y77.363 E.09697
G1 X88.211 Y73.986 E.0915
G1 X91.789 Y73.986 E.09697
G1 X91.789 Y77.303 E.08988
M204 S250
G1 X92.19 Y77.763 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2561
M204 S5000
G1 X87.81 Y77.763 E.11012
G1 X87.81 Y73.585 E.10505
G1 X92.19 Y73.585 E.11012
G1 X92.19 Y77.703 E.10354
; WIPE_START
G1 F11668.197
M204 S6000
G1 X90.19 Y77.731 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.557 Y76.131 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F2561
M204 S6000
G1 X90.557 Y75.218 E.02295
G1 X89.443 Y75.218 E.02803
G1 X89.443 Y76.131 E.02295
G1 X90.497 Y76.131 E.02652
M204 S10000
G1 X89.899 Y75.674 F42000
; LINE_WIDTH: 0.561636
G1 F2561
M204 S6000
G1 X90.041 Y75.674 E.00488
; WIPE_START
G1 F8534.042
G1 X89.899 Y75.674 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.19 Y77.933 Z5.88 F42000
G1 X101.49 Y79.265 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2561
M204 S5000
G1 X86.01 Y79.265 E.38919
G1 X86.01 Y78.815 E.01131
G1 X78.496 Y78.815 E.18892
G3 X79.903 Y78.435 I1.41 J2.425 E.03707
G1 X100.18 Y78.437 E.50981
M73 P72 R2
G3 X101.49 Y78.806 I-.104 J2.872 E.03454
G1 X101.49 Y79.205 E.01001
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y79.212 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.51 Y79.82 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
G1 F2561
M204 S5000
G1 X102.561 Y79.909 E.00258
G3 X102.89 Y81.227 I-2.574 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.561 Y79.909 E-.02217
G1 X102.678 Y80.158 E-.10464
G1 X102.806 Y80.546 E-.15525
G1 X102.877 Y80.951 E-.15615
G1 X102.89 Y81.227 E-.10509
G1 X102.89 Y81.798 E-.2167
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.463 Y89.418 Z5.88 F42000
G1 X101.49 Y106.785 Z5.88
G1 Z5.48
G1 E.8 F1800
G1 F2561
M204 S5000
G1 X101.49 Y107.243 E.01152
G3 X100.097 Y107.615 I-1.395 J-2.431 E.03666
G1 X79.903 Y107.615 E.50771
G3 X78.494 Y107.234 I.002 J-2.802 E.03712
G1 X86.01 Y107.235 E.18896
G1 X86.01 Y106.785 E.01131
G1 X101.43 Y106.785 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y107.243 E-.17557
G1 X101.168 Y107.402 E-.13667
G1 X100.778 Y107.531 E-.15585
G1 X100.373 Y107.601 E-.15614
G1 X100.097 Y107.615 E-.1051
G1 X100.016 Y107.615 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y107.146 Z5.88 F42000
G1 X77.49 Y106.229 Z5.88
G1 Z5.48
G1 E.8 F1800
G1 F2561
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03707
G1 X77.49 Y106.169 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y105.891 E-.12351
G1 X77.194 Y105.503 E-.15525
G1 X77.131 Y105.157 E-.13371
G1 X77.11 Y104.822 E-.12751
G1 X77.11 Y104.243 E-.22002
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.369 Y106.601 Z5.88 F42000
G1 X86.21 Y107.2 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463457
G1 F2561
M204 S6000
G1 X100.092 Y107.2 E.38833
G2 X100.451 Y107.187 I-.018 J-5.416 E.01004
; LINE_WIDTH: 0.41584
G2 X100.686 Y107.163 I-.354 J-4.798 E.00589
; LINE_WIDTH: 0.375664
G1 X100.8 Y107.148 E.00256
; LINE_WIDTH: 0.3452
G1 X101.045 Y107.107 E.00503
; LINE_WIDTH: 0.315327
G1 X101.29 Y107.065 E.00454
; WIPE_START
G1 F16014.767
G1 X101.045 Y107.107 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.111 Y99.474 Z5.88 F42000
G1 X101.29 Y78.989 Z5.88
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.298016
G1 F2561
M204 S6000
G1 X100.924 Y78.921 E.00639
; LINE_WIDTH: 0.339751
G1 X100.804 Y78.902 E.00241
; LINE_WIDTH: 0.375155
G1 X100.686 Y78.886 E.00266
; LINE_WIDTH: 0.415902
G2 X100.45 Y78.863 I-.59 J4.783 E.00588
; LINE_WIDTH: 0.462075
G2 X100.168 Y78.851 I-.33 J4.457 E.00788
G1 X86.21 Y78.85 E.3892
; CHANGE_LAYER
; Z_HEIGHT: 5.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10520.454
G1 X88.21 Y78.85 E-.76
; WIPE_END
M73 P73 R2
G1 E-.04 F1800
; layer num/total_layer_count: 35/50
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.88 I-.585 J-1.067 P1  F42000
G1 X79.663 Y83.533 Z5.88
G1 Z5.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2061
M204 S5000
G1 X79.668 Y83.53 E.00013
G3 X79.916 Y83.417 I.402 J.558 E.00615
G1 X80.053 Y83.4 E.00308
G3 X79.565 Y83.621 I.017 J.688 E.08442
G1 X79.618 Y83.573 E.0016
M204 S250
G1 X79.404 Y84.33 F42000
G1 F2061
M204 S5000
G1 X79.374 Y84.23 E.00233
G3 X80.053 Y83.379 I.695 J-.142 E.02778
G1 X80.114 Y83.38 E.00137
G3 X79.425 Y84.386 I-.045 J.708 E.06689
; WIPE_START
G1 F12000
M204 S6000
G1 X79.374 Y84.23 E-.06225
G1 X79.36 Y84.052 E-.06798
G1 X79.381 Y83.914 E-.05291
G1 X79.429 Y83.781 E-.05386
G1 X79.503 Y83.66 E-.05371
G1 X79.6 Y83.556 E-.05382
G1 X79.778 Y83.441 E-.08059
G1 X79.912 Y83.396 E-.05379
G1 X80.053 Y83.379 E-.05394
G1 X80.114 Y83.38 E-.02321
G1 X80.362 Y83.441 E-.09735
G1 X80.485 Y83.512 E-.05382
G1 X80.589 Y83.604 E-.05279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.828 Y79.207 Z6.04 F42000
G1 X90.958 Y76.295 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2061
M204 S6000
G1 X89.042 Y76.295 E.05192
G1 X89.042 Y75.052 E.03368
G1 X90.958 Y75.052 E.05192
G1 X90.958 Y76.235 E.03205
M204 S10000
G1 X91.374 Y76.711 F42000
G1 F2061
M204 S6000
G1 X88.626 Y76.711 E.07445
G1 X88.626 Y74.637 E.0562
G1 X91.374 Y74.637 E.07445
G1 X91.374 Y76.651 E.05458
M204 S10000
G1 X91.789 Y77.127 F42000
G1 F2061
M204 S6000
G1 X88.211 Y77.127 E.09697
G1 X88.211 Y74.221 E.07873
G1 X91.789 Y74.221 E.09697
G1 X91.789 Y77.067 E.0771
M204 S250
G1 X92.19 Y77.527 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2061
M204 S5000
G1 X87.81 Y77.527 E.11012
G1 X87.81 Y73.82 E.09319
G1 X92.19 Y73.82 E.11012
G1 X92.19 Y77.467 E.09168
; WIPE_START
G1 F11668.197
M204 S6000
G1 X90.19 Y77.495 E-.76
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

G1 X89.457 Y75.881
G1 Z5.64
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.447901
G1 F2061
M204 S6000
G1 X90.543 Y75.881 E.0293
G1 X90.543 Y75.467 E.01115
G1 X89.457 Y75.467 E.0293
G1 X89.457 Y75.821 E.00953
; WIPE_START
G1 F10881.002
G1 X89.457 Y75.467 E-.13436
G1 X90.543 Y75.467 E-.41302
G1 X90.543 Y75.881 E-.15715
G1 X90.397 Y75.881 E-.05547
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.777 Y77.83 Z6.04 F42000
G1 X101.504 Y78.815 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2061
M204 S5000
G1 X78.496 Y78.815 E.57847
G3 X79.903 Y78.435 I1.41 J2.425 E.03707
G1 X100.184 Y78.437 E.50989
G3 X101.452 Y78.785 I-.107 J2.872 E.03336
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.452 Y78.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.51 Y79.82 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
G1 F2061
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.575 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02212
G1 X102.727 Y80.285 E-.15604
G1 X102.806 Y80.546 E-.10392
G1 X102.877 Y80.953 E-.15667
G1 X102.89 Y81.227 E-.10456
G1 X102.89 Y81.798 E-.21669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.475 Y89.419 Z6.04 F42000
G1 X101.504 Y107.235 Z6.04
G1 Z5.64
G1 E.8 F1800
M73 P74 R2
G1 F2061
M204 S5000
G1 X101.415 Y107.285 E.00257
G3 X100.097 Y107.615 I-1.344 J-2.574 E.03448
G1 X79.903 Y107.615 E.50771
G3 X78.496 Y107.235 I.002 J-2.802 E.03707
G1 X101.444 Y107.235 E.57696
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.415 Y107.285 E-.02212
G1 X101.168 Y107.402 E-.10404
G1 X100.778 Y107.531 E-.15599
G1 X100.373 Y107.601 E-.15606
G1 X100.097 Y107.615 E-.1051
G1 X99.527 Y107.615 E-.21668
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.91 Y107.135 Z6.04 F42000
G1 X77.49 Y106.226 Z6.04
G1 Z5.64
G1 E.8 F1800
G1 F2061
M204 S5000
G3 X77.11 Y104.822 I2.403 J-1.404 E.037
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03707
G1 X77.49 Y106.166 E.66237
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.12193
G1 X77.194 Y105.503 E-.15597
G1 X77.123 Y105.098 E-.15606
G1 X77.11 Y104.822 E-.1051
G1 X77.11 Y104.24 E-.22095
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/50
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.04 I1.208 J.149 P1  F42000
G1 X79.665 Y83.531 Z6.04
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F2013
M204 S5000
G1 X79.667 Y83.53 E.00006
G3 X79.917 Y83.417 I.402 J.558 E.00616
G1 X80.053 Y83.4 E.00307
G3 X79.565 Y83.621 I.017 J.688 E.08442
G1 X79.62 Y83.571 E.00166
M204 S250
G1 X79.409 Y84.343 F42000
G1 F2013
M204 S5000
G1 X79.38 Y84.265 E.00186
G3 X80.053 Y83.379 I.688 J-.176 E.02859
G1 X80.115 Y83.38 E.00139
G3 X79.429 Y84.399 I-.046 J.709 E.0667
; WIPE_START
G1 F12000
M204 S6000
G1 X79.38 Y84.265 E-.05431
G1 X79.36 Y84.125 E-.05386
G1 X79.367 Y83.984 E-.05377
G1 X79.402 Y83.846 E-.05381
G1 X79.463 Y83.719 E-.05374
G1 X79.549 Y83.606 E-.05378
G1 X79.655 Y83.512 E-.05385
G1 X79.778 Y83.441 E-.05385
G1 X79.912 Y83.396 E-.05378
G1 X80.053 Y83.379 E-.05392
G1 X80.115 Y83.38 E-.02363
G1 X80.362 Y83.441 E-.09696
G1 X80.485 Y83.512 E-.0538
G1 X80.578 Y83.594 E-.04695
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.737 Y79.086 Z6.2 F42000
G1 X90.958 Y75.997 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2013
M204 S6000
G1 X89.042 Y75.997 E.05192
G1 X89.042 Y75.353 E.01745
G1 X90.958 Y75.353 E.05192
G1 X90.958 Y75.937 E.01582
M204 S10000
G1 X91.374 Y76.412 F42000
G1 F2013
M204 S6000
G1 X88.626 Y76.412 E.07445
G1 X88.626 Y74.937 E.03997
G1 X91.374 Y74.937 E.07445
G1 X91.374 Y76.352 E.03835
M204 S10000
G1 X91.789 Y76.828 F42000
G1 F2013
M204 S6000
G1 X88.211 Y76.828 E.09697
G1 X88.211 Y74.521 E.0625
G1 X91.789 Y74.521 E.09697
G1 X91.789 Y76.768 E.06087
M204 S250
G1 X92.19 Y77.229 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2013
M204 S5000
G1 X87.81 Y77.229 E.11012
G1 X87.81 Y74.121 E.07814
G1 X92.19 Y74.121 E.11012
G1 X92.19 Y77.169 E.07663
; WIPE_START
G1 F11668.197
M204 S6000
G1 X90.19 Y77.196 E-.76
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

G1 X90.75 Y75.675
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.262556
G1 F2013
M204 S6000
G1 X89.25 Y75.675 E.02232
; WIPE_START
G1 F18000
G1 X90.75 Y75.675 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.077 Y77.814 Z6.2 F42000
G1 X101.504 Y78.815 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2013
M204 S5000
G1 X78.498 Y78.815 E.5784
G3 X79.903 Y78.435 I1.403 J2.399 E.03701
G1 X100.187 Y78.437 E.50998
M73 P75 R2
G3 X101.452 Y78.785 I-.111 J2.873 E.03327
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.452 Y78.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.51 Y79.82 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F2013
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.575 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02214
G1 X102.727 Y80.285 E-.15596
G1 X102.806 Y80.547 E-.10415
G1 X102.877 Y80.951 E-.15589
G1 X102.89 Y81.227 E-.10517
G1 X102.89 Y81.798 E-.21669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.474 Y89.419 Z6.2 F42000
G1 X101.502 Y107.235 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F2013
M204 S5000
G1 X101.414 Y107.286 E.00255
G3 X100.097 Y107.615 I-1.343 J-2.577 E.03444
G1 X79.903 Y107.615 E.50771
G3 X78.496 Y107.235 I.002 J-2.802 E.03707
G1 X101.442 Y107.235 E.57689
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.414 Y107.286 E-.02205
G1 X101.168 Y107.402 E-.10354
G1 X100.828 Y107.517 E-.13617
G1 X100.509 Y107.584 E-.12395
G1 X100.097 Y107.615 E-.15697
G1 X99.525 Y107.615 E-.21732
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.908 Y107.135 Z6.2 F42000
G1 X77.49 Y106.226 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F2013
M204 S5000
G3 X77.11 Y104.822 I2.404 J-1.404 E.03701
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03707
G1 X77.49 Y106.166 E.66237
; CHANGE_LAYER
; Z_HEIGHT: 5.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.12199
M73 P76 R2
G1 X77.194 Y105.502 E-.15604
G1 X77.124 Y105.098 E-.15591
G1 X77.11 Y104.822 E-.10517
G1 X77.11 Y104.24 E-.22089
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/50
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.2 I1.208 J.149 P1  F42000
G1 X79.667 Y83.53 Z6.2
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1976
M204 S5000
G3 X79.917 Y83.417 I.402 J.558 E.00616
G1 X80.053 Y83.4 E.00307
G3 X79.62 Y83.567 I.017 J.688 E.08615
M204 S250
G1 X79.409 Y84.341 F42000
G1 F1976
M204 S5000
G1 X79.381 Y84.265 E.00181
G3 X80.053 Y83.379 I.688 J-.176 E.02859
G1 X80.116 Y83.38 E.00141
G3 X79.429 Y84.398 I-.047 J.709 E.06672
G1 X79.429 Y84.397 E.00002
; WIPE_START
G1 F12000
M204 S6000
G1 X79.381 Y84.265 E-.05347
G1 X79.36 Y84.125 E-.05385
G1 X79.367 Y83.984 E-.05376
G1 X79.402 Y83.846 E-.05382
G1 X79.463 Y83.719 E-.05377
G1 X79.549 Y83.606 E-.05387
G1 X79.655 Y83.512 E-.05376
G1 X79.778 Y83.441 E-.05377
G1 X79.912 Y83.396 E-.05376
G1 X80.053 Y83.379 E-.05397
G1 X80.116 Y83.38 E-.024
G1 X80.362 Y83.441 E-.0966
G1 X80.485 Y83.512 E-.05385
G1 X80.579 Y83.595 E-.04775
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.168 Y79.742 Z6.36 F42000
G1 X92.19 Y76.804 Z6.36
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1976
M204 S5000
G1 X87.81 Y76.804 E.11012
G1 X87.81 Y74.547 E.05674
G1 X92.19 Y74.547 E.11012
G1 X92.19 Y76.744 E.05523
; WIPE_START
G1 F11668.197
M204 S6000
G1 X90.19 Y76.772 E-.76
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

G1 X91.394 Y74.76
G1 Z5.96
G1 E.8 F1800
; FEATURE: Top surface
G1 F1976
M204 S2000
G1 X91.978 Y75.343 E.02075
G1 X91.978 Y75.889
G1 X90.849 Y74.76 E.04014
G1 X90.304 Y74.76
G1 X91.978 Y76.434 E.05953
G1 X91.591 Y76.592
G1 X89.758 Y74.76 E.06515
G1 X89.213 Y74.76
G1 X91.045 Y76.592 E.06515
G1 X90.5 Y76.592
G1 X88.667 Y74.76 E.06515
G1 X88.122 Y74.76
G1 X89.954 Y76.592 E.06515
G1 X89.409 Y76.592
G1 X88.022 Y75.205 E.04931
G1 X88.022 Y75.751
G1 X88.864 Y76.592 E.02992
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.022 Y75.751 E-.45222
G1 X88.022 Y75.205 E-.20726
G1 X88.209 Y75.392 E-.10053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.601 Y77.295 Z6.36 F42000
G1 X101.504 Y78.815 Z6.36
G1 Z5.96
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1976
M204 S5000
G1 X78.496 Y78.815 E.57847
G3 X79.903 Y78.435 I1.409 J2.422 E.03707
G1 X100.191 Y78.437 E.51007
G3 X101.452 Y78.785 I-.115 J2.874 E.03318
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.452 Y78.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.51 Y79.82 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
G1 F1976
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.576 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02214
M73 P77 R2
G1 X102.678 Y80.157 E-.10401
G1 X102.793 Y80.5 E-.13761
G1 X102.86 Y80.815 E-.12255
G1 X102.89 Y81.227 E-.15697
G1 X102.89 Y81.798 E-.21671
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.475 Y89.419 Z6.36 F42000
G1 X101.504 Y107.235 Z6.36
G1 Z5.96
G1 E.8 F1800
G1 F1976
M204 S5000
G1 X101.415 Y107.285 E.00258
G3 X100.097 Y107.615 I-1.344 J-2.574 E.03448
G1 X79.903 Y107.615 E.50771
G3 X78.496 Y107.235 I.002 J-2.802 E.03707
G1 X101.444 Y107.235 E.57696
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.415 Y107.285 E-.02217
G1 X101.168 Y107.402 E-.10397
G1 X100.778 Y107.531 E-.15599
G1 X100.373 Y107.601 E-.15607
G1 X100.097 Y107.615 E-.10509
G1 X99.527 Y107.615 E-.2167
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.909 Y107.136 Z6.36 F42000
G1 X77.49 Y106.229 Z6.36
G1 Z5.96
G1 E.8 F1800
G1 F1976
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03707
G1 X77.49 Y106.169 E.66244
; CHANGE_LAYER
; Z_HEIGHT: 6.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.12286
G1 X77.194 Y105.502 E-.15604
G1 X77.129 Y105.146 E-.13752
G1 X77.11 Y104.822 E-.12357
G1 X77.11 Y104.243 E-.22
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/50
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.36 I.878 J.842 P1  F42000
G1 X101.503 Y78.815 Z6.36
G1 Z6.12
G1 E.8 F1800
G1 F1484
M204 S5000
G1 X78.494 Y78.815 E.57848
G3 X79.903 Y78.435 I1.419 J2.454 E.03711
G1 X100.194 Y78.437 E.51016
G3 X101.451 Y78.785 I-.117 J2.865 E.03307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.451 Y78.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.51 Y79.82 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F1484
M204 S5000
G1 X102.561 Y79.909 E.00258
G3 X102.89 Y81.227 I-2.574 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
M73 P78 R2
G1 F11668.197
M204 S6000
G1 X102.561 Y79.909 E-.02218
G1 X102.678 Y80.157 E-.10397
G1 X102.806 Y80.547 E-.15602
G1 X102.877 Y80.952 E-.15647
G1 X102.89 Y81.227 E-.10467
G1 X102.89 Y81.798 E-.2167
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.475 Y89.419 Z6.52 F42000
G1 X101.504 Y107.235 Z6.52
G1 Z6.12
G1 E.8 F1800
G1 F1484
M204 S5000
G1 X101.415 Y107.285 E.00258
G3 X100.097 Y107.615 I-1.344 J-2.575 E.03448
G1 X96.181 Y107.615 E.09846
G1 X96.181 Y107.235 E.00955
G1 X101.444 Y107.235 E.13234
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.415 Y107.285 E-.02215
G1 X101.168 Y107.402 E-.10401
G1 X100.778 Y107.531 E-.15602
G1 X100.373 Y107.601 E-.15605
G1 X100.097 Y107.615 E-.10509
G1 X99.527 Y107.615 E-.21669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.897 Y107.43 Z6.52 F42000
G1 X83.819 Y107.235 Z6.52
G1 Z6.12
G1 E.8 F1800
G1 F1484
M204 S5000
G1 X83.819 Y107.615 E.00955
G1 X79.903 Y107.615 E.09846
G3 X78.496 Y107.235 I.003 J-2.805 E.03707
G1 X83.759 Y107.235 E.13233
; WIPE_START
G1 F11668.197
M204 S6000
G1 X83.819 Y107.615 E-.14619
G1 X82.204 Y107.615 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.49 Y106.229 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F1484
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03707
G1 X77.49 Y106.169 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.12295
G1 X77.194 Y105.502 E-.15592
G1 X77.129 Y105.143 E-.13888
G1 X77.11 Y104.822 E-.12225
G1 X77.11 Y104.243 E-.22001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.989 Y96.661 Z6.52 F42000
G1 X79.421 Y84.314 Z6.52
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1484
M204 S5000
G1 X79.397 Y84.226 E.00205
G3 X79.918 Y83.417 I.674 J-.138 E.02385
G1 X80.053 Y83.4 E.00304
M73 P79 R2
G3 X79.443 Y84.37 I.018 J.688 E.06644
M204 S250
G1 X79.656 Y83.512 F42000
G1 F1484
M204 S5000
G1 X79.777 Y83.441 E.00314
G3 X80.053 Y83.379 I.292 J.648 E.00636
G1 X80.117 Y83.38 E.00143
G3 X79.609 Y83.548 I-.047 J.709 E.08762
; WIPE_START
G1 F12000
M204 S6000
G1 X79.777 Y83.441 E-.07589
G1 X79.912 Y83.396 E-.05384
G1 X80.053 Y83.379 E-.05392
G1 X80.117 Y83.38 E-.02433
G1 X80.362 Y83.441 E-.09628
G1 X80.485 Y83.512 E-.05383
G1 X80.591 Y83.606 E-.05375
G1 X80.677 Y83.719 E-.05384
G1 X80.738 Y83.847 E-.05386
G1 X80.773 Y83.984 E-.05378
G1 X80.78 Y84.125 E-.05384
G1 X80.759 Y84.265 E-.05371
G1 X80.711 Y84.398 E-.05385
G1 X80.676 Y84.455 E-.02527
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
; Z_HEIGHT: 6.28
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 39/50
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 15
G1 X101.503 Y78.815 F42000
G1 Z6.28
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1461
M204 S5000
G1 X78.494 Y78.815 E.57848
G3 X79.903 Y78.435 I1.419 J2.452 E.03711
G1 X100.195 Y78.437 E.51018
G3 X101.451 Y78.785 I-.119 J2.868 E.03305
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.451 Y78.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.51 Y79.82 Z6.68 F42000
G1 Z6.28
G1 E.8 F1800
G1 F1461
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.575 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02209
G1 X102.678 Y80.157 E-.10412
G1 X102.806 Y80.547 E-.15601
G1 X102.877 Y80.952 E-.15639
G1 X102.89 Y81.227 E-.1047
G1 X102.89 Y81.798 E-.21668
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.474 Y89.419 Z6.68 F42000
G1 X101.502 Y107.235 Z6.68
G1 Z6.28
G1 E.8 F1800
G1 F1461
M204 S5000
G1 X101.414 Y107.285 E.00255
G3 X100.097 Y107.615 I-1.343 J-2.575 E.03445
G1 X96.606 Y107.615 E.08777
G1 X96.606 Y107.235 E.00955
G1 X101.442 Y107.235 E.12158
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.414 Y107.285 E-.02204
M73 P79 R1
G1 X101.04 Y107.451 E-.15558
G1 X100.778 Y107.531 E-.10404
G1 X100.373 Y107.601 E-.15605
G1 X100.097 Y107.615 E-.10509
G1 X99.526 Y107.615 E-.2172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.895 Y107.435 Z6.68 F42000
G1 X83.394 Y107.235 Z6.68
G1 Z6.28
G1 E.8 F1800
G1 F1461
M204 S5000
G1 X83.394 Y107.615 E.00955
G1 X79.903 Y107.615 E.08777
G3 X78.496 Y107.235 I.003 J-2.805 E.03707
G1 X83.334 Y107.235 E.12164
; WIPE_START
M73 P80 R1
G1 F11668.197
M204 S6000
G1 X83.394 Y107.615 E-.14619
G1 X81.779 Y107.615 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.49 Y106.226 Z6.68 F42000
G1 Z6.28
G1 E.8 F1800
G1 F1461
M204 S5000
G3 X77.11 Y104.822 I2.407 J-1.405 E.03702
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03707
G1 X77.49 Y106.166 E.66238
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.12214
G1 X77.194 Y105.503 E-.15592
G1 X77.123 Y105.098 E-.15609
G1 X77.11 Y104.822 E-.10509
G1 X77.11 Y104.241 E-.22076
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.985 Y96.659 Z6.68 F42000
G1 X79.413 Y84.283 Z6.68
G1 Z6.28
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1461
M204 S5000
G1 X79.402 Y84.258 E.00061
G3 X79.917 Y83.417 I.668 J-.169 E.02457
G1 X80.053 Y83.4 E.00307
G3 X79.501 Y84.478 I.017 J.689 E.06377
G1 X79.437 Y84.337 E.00345
M204 S250
G1 X79.658 Y83.51 F42000
G1 F1461
M204 S5000
G1 X79.778 Y83.441 E.00308
G3 X80.053 Y83.379 I.292 J.648 E.00635
G1 X80.117 Y83.38 E.00145
G3 X79.611 Y83.547 I-.048 J.709 E.08765
; WIPE_START
G1 F12000
M204 S6000
G1 X79.778 Y83.441 E-.07505
G1 X79.912 Y83.396 E-.05381
G1 X80.053 Y83.379 E-.05387
G1 X80.117 Y83.38 E-.02467
G1 X80.362 Y83.441 E-.09597
G1 X80.485 Y83.512 E-.05383
G1 X80.591 Y83.606 E-.05377
G1 X80.677 Y83.719 E-.05373
G1 X80.738 Y83.846 E-.05385
G1 X80.773 Y83.984 E-.05384
G1 X80.78 Y84.125 E-.05378
G1 X80.759 Y84.265 E-.05379
G1 X80.711 Y84.398 E-.05377
G1 X80.672 Y84.455 E-.02628
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
; Z_HEIGHT: 6.44
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 40/50
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 15
G1 X101.504 Y78.815 F42000
G1 Z6.44
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1455
M204 S5000
G1 X78.494 Y78.815 E.57851
G3 X79.903 Y78.435 I1.418 J2.45 E.03711
G1 X100.199 Y78.437 E.51027
G3 X101.452 Y78.785 I-.125 J2.878 E.03298
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.452 Y78.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.51 Y79.82 Z6.84 F42000
G1 Z6.44
G1 E.8 F1800
G1 F1455
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.575 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.806 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
M73 P81 R1
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02212
G1 X102.678 Y80.157 E-.1041
G1 X102.806 Y80.547 E-.15596
G1 X102.877 Y80.952 E-.15641
G1 X102.89 Y81.227 E-.10473
G1 X102.89 Y81.798 E-.21668
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.475 Y89.419 Z6.84 F42000
G1 X101.504 Y107.235 Z6.84
G1 Z6.44
G1 E.8 F1800
G1 F1455
M204 S5000
G1 X101.415 Y107.285 E.00258
G3 X100.097 Y107.615 I-1.344 J-2.575 E.03448
G1 X96.816 Y107.615 E.08248
G1 X96.816 Y107.235 E.00955
G1 X101.444 Y107.235 E.11635
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.415 Y107.285 E-.02215
G1 X101.168 Y107.402 E-.10406
G1 X100.778 Y107.531 E-.15596
G1 X100.373 Y107.601 E-.15605
G1 X100.097 Y107.615 E-.10509
G1 X99.527 Y107.615 E-.21669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.896 Y107.437 Z6.84 F42000
G1 X83.184 Y107.235 Z6.84
G1 Z6.44
G1 E.8 F1800
G1 F1455
M204 S5000
G1 X83.184 Y107.615 E.00955
G1 X79.903 Y107.615 E.08248
G3 X78.496 Y107.235 I.003 J-2.806 E.03707
G1 X83.124 Y107.235 E.11635
; WIPE_START
G1 F11668.197
M204 S6000
G1 X83.184 Y107.615 E-.14619
G1 X81.568 Y107.615 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.49 Y106.229 Z6.84 F42000
G1 Z6.44
G1 E.8 F1800
G1 F1455
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03708
G1 X77.49 Y106.169 E.66245
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.12291
G1 X77.194 Y105.503 E-.15594
G1 X77.123 Y105.098 E-.15606
G1 X77.11 Y104.822 E-.10509
G1 X77.11 Y104.243 E-.21999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.981 Y96.66 Z6.84 F42000
G1 X79.406 Y84.265 Z6.84
G1 Z6.44
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1455
M204 S5000
G1 X79.394 Y84.226 E.00091
G3 X79.917 Y83.417 I.676 J-.137 E.02385
G1 X80.053 Y83.4 E.00307
G3 X79.435 Y84.357 I.017 J.689 E.0669
G1 X79.424 Y84.322 E.00082
M204 S250
G1 X79.66 Y83.509 F42000
G1 F1455
M204 S5000
G1 X79.778 Y83.441 E.00303
G3 X80.053 Y83.379 I.292 J.646 E.00635
G1 X80.118 Y83.38 E.00147
G3 X79.613 Y83.545 I-.049 J.708 E.0875
; WIPE_START
G1 F12000
M204 S6000
G1 X79.778 Y83.441 E-.07406
M73 P82 R1
G1 X79.912 Y83.396 E-.0538
G1 X80.053 Y83.379 E-.05391
G1 X80.118 Y83.38 E-.02505
G1 X80.362 Y83.441 E-.09561
G1 X80.485 Y83.512 E-.05374
G1 X80.591 Y83.606 E-.05386
G1 X80.677 Y83.719 E-.05376
G1 X80.738 Y83.846 E-.05377
G1 X80.773 Y83.984 E-.05389
G1 X80.78 Y84.125 E-.05377
G1 X80.759 Y84.265 E-.0538
G1 X80.711 Y84.398 E-.05379
G1 X80.67 Y84.457 E-.02717
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
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 41/50
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 15
G1 X101.504 Y78.815 F42000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1450
M204 S5000
G1 X78.494 Y78.815 E.57851
G3 X79.903 Y78.435 I1.411 J2.425 E.03712
G1 X100.202 Y78.437 E.51036
G3 X101.452 Y78.785 I-.129 J2.878 E.0329
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.452 Y78.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.51 Y79.82 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F1450
M204 S5000
G1 X102.56 Y79.909 E.00258
G3 X102.89 Y81.227 I-2.575 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02215
G1 X102.727 Y80.285 E-.15605
G1 X102.806 Y80.547 E-.10405
G1 X102.877 Y80.951 E-.15596
G1 X102.89 Y81.227 E-.1051
G1 X102.89 Y81.798 E-.21669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.474 Y89.419 Z7 F42000
G1 X101.502 Y107.235 Z7
G1 Z6.6
G1 E.8 F1800
G1 F1450
M204 S5000
G1 X101.414 Y107.286 E.00256
G3 X100.097 Y107.615 I-1.343 J-2.575 E.03445
G1 X96.96 Y107.615 E.07888
G1 X96.96 Y107.235 E.00955
G1 X101.442 Y107.235 E.1127
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.414 Y107.286 E-.02211
G1 X101.04 Y107.451 E-.15564
G1 X100.778 Y107.531 E-.10403
G1 X100.374 Y107.601 E-.15591
G1 X100.097 Y107.615 E-.10517
G1 X99.526 Y107.615 E-.21715
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.895 Y107.439 Z7 F42000
G1 X83.04 Y107.235 Z7
G1 Z6.6
G1 E.8 F1800
G1 F1450
M204 S5000
G1 X83.04 Y107.615 E.00955
G1 X79.903 Y107.615 E.07888
G3 X78.496 Y107.235 I.003 J-2.805 E.03707
G1 X82.98 Y107.235 E.11275
; WIPE_START
G1 F11668.197
M204 S6000
G1 X83.04 Y107.615 E-.14619
G1 X81.425 Y107.615 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.49 Y106.227 Z7 F42000
M73 P83 R1
G1 Z6.6
G1 E.8 F1800
G1 F1450
M204 S5000
G3 X77.11 Y104.822 I2.41 J-1.406 E.03702
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03707
G1 X77.49 Y106.167 E.66239
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.12219
G1 X77.194 Y105.502 E-.15608
G1 X77.123 Y105.098 E-.15598
G1 X77.11 Y104.822 E-.1051
G1 X77.11 Y104.241 E-.22066
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.982 Y96.659 Z7 F42000
G1 X79.408 Y84.267 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1450
M204 S5000
G1 X79.394 Y84.221 E.00107
G3 X79.916 Y83.417 I.676 J-.133 E.02374
G1 X80.053 Y83.4 E.00307
G3 X79.437 Y84.361 I.017 J.689 E.06674
G1 X79.426 Y84.324 E.00087
M204 S250
G1 X79.663 Y83.508 F42000
G1 F1450
M204 S5000
G1 X79.777 Y83.441 E.00297
G3 X80.052 Y83.379 I.292 J.648 E.00635
G1 X80.119 Y83.38 E.0015
G3 X79.614 Y83.544 I-.05 J.709 E.08772
; WIPE_START
G1 F12000
M204 S6000
G1 X79.777 Y83.441 E-.07313
G1 X79.912 Y83.396 E-.0538
G1 X80.052 Y83.379 E-.05391
G1 X80.119 Y83.38 E-.0254
G1 X80.362 Y83.441 E-.09525
G1 X80.485 Y83.512 E-.05382
G1 X80.591 Y83.606 E-.05377
G1 X80.677 Y83.719 E-.05382
G1 X80.738 Y83.846 E-.05382
G1 X80.773 Y83.984 E-.05378
G1 X80.78 Y84.125 E-.05386
G1 X80.759 Y84.265 E-.05377
G1 X80.711 Y84.398 E-.05376
G1 X80.669 Y84.459 E-.02811
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
; Z_HEIGHT: 6.76
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 42/50
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 15
G1 X101.504 Y78.815 F42000
G1 Z6.76
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1447
M204 S5000
G1 X78.494 Y78.815 E.57851
G3 X79.903 Y78.435 I1.411 J2.425 E.03712
G1 X100.206 Y78.437 E.51044
G3 X101.452 Y78.785 I-.132 J2.879 E.03281
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.452 Y78.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.51 Y79.82 Z7.16 F42000
G1 Z6.76
G1 E.8 F1800
G1 F1447
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.575 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
M73 P84 R1
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02211
G1 X102.678 Y80.158 E-.10447
G1 X102.806 Y80.547 E-.15569
G1 X102.877 Y80.951 E-.15596
G1 X102.89 Y81.227 E-.10509
G1 X102.89 Y81.798 E-.21668
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.475 Y89.419 Z7.16 F42000
G1 X101.504 Y107.235 Z7.16
G1 Z6.76
G1 E.8 F1800
G1 F1447
M204 S5000
G1 X101.415 Y107.285 E.00257
G3 X100.097 Y107.615 I-1.344 J-2.574 E.03448
G1 X97.062 Y107.615 E.07631
G1 X97.062 Y107.235 E.00955
G1 X101.444 Y107.235 E.11018
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.415 Y107.285 E-.02211
G1 X101.069 Y107.44 E-.14422
G1 X100.778 Y107.531 E-.11593
G1 X100.373 Y107.601 E-.15596
G1 X100.097 Y107.615 E-.10509
G1 X99.527 Y107.615 E-.2167
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.896 Y107.44 Z7.16 F42000
G1 X82.938 Y107.235 Z7.16
G1 Z6.76
G1 E.8 F1800
G1 F1447
M204 S5000
G1 X82.938 Y107.615 E.00955
G1 X79.903 Y107.615 E.07631
G3 X78.496 Y107.235 I.002 J-2.805 E.03707
G1 X82.878 Y107.235 E.11018
; WIPE_START
G1 F11668.197
M204 S6000
G1 X82.938 Y107.615 E-.14619
G1 X81.323 Y107.615 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.49 Y106.227 Z7.16 F42000
G1 Z6.76
G1 E.8 F1800
G1 F1447
M204 S5000
G3 X77.11 Y104.822 I2.411 J-1.406 E.03703
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03707
G1 X77.49 Y106.167 E.66239
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.12233
G1 X77.194 Y105.502 E-.15599
G1 X77.123 Y105.098 E-.15597
G1 X77.11 Y104.822 E-.10509
G1 X77.11 Y104.241 E-.22061
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.983 Y96.659 Z7.16 F42000
G1 X79.409 Y84.277 Z7.16
G1 Z6.76
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1447
M204 S5000
G1 X79.402 Y84.255 E.00052
G3 X79.916 Y83.417 I.668 J-.166 E.02449
G1 X80.053 Y83.4 E.00307
G3 X79.45 Y84.388 I.017 J.688 E.06604
G1 X79.43 Y84.333 E.00131
M204 S250
G1 X79.665 Y83.507 F42000
G1 F1447
M204 S5000
G1 X79.778 Y83.441 E.00292
G3 X80.052 Y83.379 I.292 J.648 E.00635
G1 X80.12 Y83.38 E.00152
G3 X79.616 Y83.542 I-.05 J.709 E.08776
; WIPE_START
G1 F12000
M204 S6000
G1 X79.778 Y83.441 E-.07227
G1 X79.912 Y83.396 E-.05379
G1 X80.052 Y83.379 E-.05387
G1 X80.12 Y83.38 E-.02581
G1 X80.362 Y83.441 E-.09488
G1 X80.485 Y83.512 E-.05375
G1 X80.591 Y83.606 E-.05385
G1 X80.677 Y83.719 E-.05382
G1 X80.738 Y83.846 E-.05381
G1 X80.773 Y83.984 E-.05383
G1 X80.78 Y84.125 E-.05376
G1 X80.738 Y84.333 E-.08051
G1 X80.677 Y84.46 E-.05386
G1 X80.673 Y84.465 E-.00219
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
; Z_HEIGHT: 6.92
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 43/50
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 15
G1 X101.504 Y78.815 F42000
G1 Z6.92
G1 E.8 F1800
; LINE_WIDTH: 0.42
M73 P85 R1
G1 F1445
M204 S5000
G1 X78.494 Y78.815 E.57851
G3 X79.903 Y78.435 I1.411 J2.425 E.03712
G1 X100.209 Y78.437 E.51053
G3 X101.452 Y78.785 I-.137 J2.88 E.03272
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.452 Y78.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.51 Y79.82 Z7.32 F42000
G1 Z6.92
G1 E.8 F1800
G1 F1445
M204 S5000
G1 X102.56 Y79.909 E.00258
G3 X102.89 Y81.227 I-2.575 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02215
G1 X102.678 Y80.157 E-.10406
G1 X102.806 Y80.547 E-.15602
G1 X102.877 Y80.951 E-.15592
G1 X102.89 Y81.227 E-.10517
G1 X102.89 Y81.798 E-.21669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.475 Y89.419 Z7.32 F42000
G1 X101.504 Y107.235 Z7.32
G1 Z6.92
G1 E.8 F1800
G1 F1445
M204 S5000
G1 X101.415 Y107.285 E.00258
G3 X100.097 Y107.615 I-1.344 J-2.575 E.03448
G1 X97.134 Y107.615 E.07451
G1 X97.134 Y107.235 E.00955
G1 X101.444 Y107.235 E.10838
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.415 Y107.285 E-.02215
G1 X101.168 Y107.402 E-.10406
G1 X100.778 Y107.531 E-.15602
G1 X100.374 Y107.601 E-.15592
G1 X100.097 Y107.615 E-.10517
G1 X99.527 Y107.615 E-.21669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.896 Y107.44 Z7.32 F42000
G1 X82.867 Y107.235 Z7.32
G1 Z6.92
G1 E.8 F1800
G1 F1445
M204 S5000
G1 X82.867 Y107.615 E.00955
G1 X79.903 Y107.615 E.07451
G3 X78.496 Y107.235 I.003 J-2.805 E.03707
G1 X82.807 Y107.235 E.10838
; WIPE_START
G1 F11668.197
M204 S6000
G1 X82.867 Y107.615 E-.14619
G1 X81.251 Y107.615 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.49 Y106.229 Z7.32 F42000
G1 Z6.92
G1 E.8 F1800
G1 F1445
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03707
G1 X77.49 Y106.169 E.66244
; WIPE_START
M73 P86 R1
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.1229
G1 X77.194 Y105.502 E-.15601
G1 X77.124 Y105.098 E-.15593
G1 X77.11 Y104.822 E-.10517
G1 X77.11 Y104.243 E-.21999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.981 Y96.66 Z7.32 F42000
G1 X79.406 Y84.265 Z7.32
G1 Z6.92
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1445
M204 S5000
G1 X79.395 Y84.226 E.00091
G3 X79.916 Y83.417 I.675 J-.137 E.02384
G1 X80.053 Y83.4 E.00308
G3 X79.435 Y84.357 I.017 J.689 E.06686
G1 X79.424 Y84.322 E.00082
M204 S250
G1 X79.667 Y83.506 F42000
G1 F1445
M204 S5000
G1 X79.778 Y83.442 E.00287
G3 X80.052 Y83.379 I.293 J.646 E.00635
G1 X80.121 Y83.38 E.00154
G3 X79.618 Y83.541 I-.051 J.707 E.08761
; WIPE_START
G1 F12000
M204 S6000
G1 X79.778 Y83.442 E-.07138
G1 X79.912 Y83.396 E-.05379
G1 X80.052 Y83.379 E-.05385
G1 X80.121 Y83.38 E-.02619
G1 X80.362 Y83.441 E-.09455
G1 X80.485 Y83.512 E-.05385
G1 X80.591 Y83.606 E-.05368
G1 X80.677 Y83.719 E-.05383
G1 X80.738 Y83.846 E-.0538
G1 X80.773 Y83.984 E-.05384
G1 X80.78 Y84.125 E-.05381
G1 X80.738 Y84.333 E-.08049
G1 X80.677 Y84.46 E-.0538
G1 X80.672 Y84.467 E-.00314
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
; Z_HEIGHT: 7.08
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 44/50
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 15
G1 X101.504 Y78.815 F42000
G1 Z7.08
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1443
M204 S5000
G1 X78.494 Y78.815 E.57851
G3 X79.903 Y78.435 I1.411 J2.425 E.03711
G1 X100.213 Y78.437 E.51062
G3 X101.452 Y78.785 I-.14 J2.881 E.03264
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.452 Y78.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.51 Y79.82 Z7.48 F42000
G1 Z7.08
G1 E.8 F1800
G1 F1443
M204 S5000
G1 X102.56 Y79.909 E.00258
G3 X102.89 Y81.227 I-2.575 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
M73 P87 R1
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02215
G1 X102.678 Y80.157 E-.10406
G1 X102.806 Y80.547 E-.15603
G1 X102.877 Y80.951 E-.15598
G1 X102.89 Y81.227 E-.1051
G1 X102.89 Y81.798 E-.2167
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.475 Y89.419 Z7.48 F42000
G1 X101.504 Y107.235 Z7.48
G1 Z7.08
G1 E.8 F1800
G1 F1443
M204 S5000
G1 X101.415 Y107.285 E.00257
G3 X100.097 Y107.615 I-1.344 J-2.575 E.03448
G1 X97.18 Y107.615 E.07334
G1 X97.18 Y107.235 E.00955
G1 X101.444 Y107.235 E.10721
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.415 Y107.285 E-.02214
G1 X101.063 Y107.443 E-.14679
G1 X100.778 Y107.531 E-.11328
G1 X100.373 Y107.601 E-.15598
G1 X100.097 Y107.615 E-.1051
G1 X99.527 Y107.615 E-.21671
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.896 Y107.441 Z7.48 F42000
G1 X82.82 Y107.235 Z7.48
G1 Z7.08
G1 E.8 F1800
G1 F1443
M204 S5000
G1 X82.82 Y107.615 E.00955
G1 X79.903 Y107.615 E.07334
G3 X78.496 Y107.235 I.003 J-2.805 E.03707
G1 X82.76 Y107.235 E.10721
; WIPE_START
G1 F11668.197
M204 S6000
G1 X82.82 Y107.615 E-.14619
G1 X81.205 Y107.615 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.49 Y106.227 Z7.48 F42000
G1 Z7.08
G1 E.8 F1800
G1 F1443
M204 S5000
G3 X77.11 Y104.822 I2.414 J-1.407 E.03704
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03708
G1 X77.49 Y106.167 E.66241
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.323 Y105.892 E-.12234
G1 X77.194 Y105.502 E-.15608
G1 X77.123 Y105.098 E-.156
G1 X77.11 Y104.822 E-.1051
G1 X77.11 Y104.241 E-.22049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.983 Y96.659 Z7.48 F42000
G1 X79.408 Y84.278 Z7.48
G1 Z7.08
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1443
M204 S5000
G1 X79.404 Y84.259 E.00042
G3 X79.916 Y83.417 I.666 J-.172 E.0246
G1 X80.052 Y83.4 E.00307
G3 X79.451 Y84.388 I.017 J.688 E.06599
G1 X79.43 Y84.334 E.0013
M204 S250
G1 X79.668 Y83.504 F42000
G1 F1443
M204 S5000
G1 X79.777 Y83.441 E.00282
G3 X80.052 Y83.379 I.291 J.648 E.00635
G1 X80.117 Y83.38 E.00146
G3 X79.619 Y83.538 I-.049 J.709 E.08791
; WIPE_START
G1 F12000
M204 S6000
G1 X79.777 Y83.441 E-.07052
G1 X79.912 Y83.396 E-.05387
G1 X80.052 Y83.379 E-.05383
G1 X80.117 Y83.38 E-.02472
G1 X80.362 Y83.441 E-.09599
G1 X80.485 Y83.512 E-.05375
G1 X80.591 Y83.606 E-.05382
G1 X80.677 Y83.719 E-.05385
G1 X80.738 Y83.846 E-.05373
G1 X80.773 Y83.983 E-.0538
G1 X80.78 Y84.125 E-.05385
G1 X80.738 Y84.333 E-.08061
G1 X80.677 Y84.46 E-.05375
G1 X80.67 Y84.469 E-.00391
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
; Z_HEIGHT: 7.24
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 45/50
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 15
G1 X101.504 Y78.815 F42000
G1 Z7.24
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1443
M204 S5000
G1 X78.496 Y78.815 E.57847
G3 X79.903 Y78.435 I1.408 J2.413 E.03708
G1 X100.216 Y78.437 E.5107
M73 P88 R1
G3 X101.452 Y78.785 I-.144 J2.883 E.03255
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.452 Y78.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.51 Y79.82 Z7.64 F42000
G1 Z7.24
G1 E.8 F1800
G1 F1443
M204 S5000
G1 X102.56 Y79.909 E.00257
G3 X102.89 Y81.227 I-2.575 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.56 Y79.909 E-.02214
G1 X102.678 Y80.157 E-.10405
G1 X102.801 Y80.527 E-.14815
G1 X102.86 Y80.815 E-.11182
G1 X102.89 Y81.227 E-.15713
G1 X102.89 Y81.798 E-.21671
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.474 Y89.419 Z7.64 F42000
G1 X101.503 Y107.235 Z7.64
G1 Z7.24
G1 E.8 F1800
G1 F1443
M204 S5000
G1 X101.415 Y107.285 E.00256
G3 X100.097 Y107.615 I-1.343 J-2.575 E.03446
G1 X97.205 Y107.615 E.07271
G1 X97.205 Y107.235 E.00955
G1 X101.443 Y107.235 E.10655
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.415 Y107.285 E-.02208
G1 X101.04 Y107.451 E-.1557
G1 X100.778 Y107.531 E-.10417
G1 X100.373 Y107.601 E-.15597
G1 X100.097 Y107.615 E-.10509
G1 X99.526 Y107.615 E-.21699
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.896 Y107.441 Z7.64 F42000
G1 X82.795 Y107.235 Z7.64
G1 Z7.24
G1 E.8 F1800
G1 F1443
M204 S5000
G1 X82.795 Y107.615 E.00955
G1 X79.903 Y107.615 E.07271
G3 X78.496 Y107.235 I.003 J-2.805 E.03707
G1 X82.735 Y107.235 E.10659
; WIPE_START
G1 F11668.197
M204 S6000
G1 X82.795 Y107.615 E-.14619
G1 X81.18 Y107.615 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.49 Y106.229 Z7.64 F42000
G1 Z7.24
G1 E.8 F1800
G1 F1443
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03708
G1 X77.49 Y106.169 E.66245
; WIPE_START
M73 P89 R1
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.1229
G1 X77.194 Y105.502 E-.15604
G1 X77.123 Y105.098 E-.15597
G1 X77.11 Y104.822 E-.1051
G1 X77.11 Y104.243 E-.22
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.981 Y96.66 Z7.64 F42000
G1 X79.405 Y84.264 Z7.64
G1 Z7.24
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1443
M204 S5000
G1 X79.397 Y84.226 E.00087
G3 X79.92 Y83.417 I.674 J-.138 E.02388
G1 X80.053 Y83.4 E.00299
G3 X79.436 Y84.352 I.018 J.688 E.06689
G1 X79.425 Y84.32 E.00074
M204 S250
G1 X79.67 Y83.503 F42000
G1 F1443
M204 S5000
G1 X79.777 Y83.441 E.00277
G3 X80.052 Y83.379 I.291 J.648 E.00635
G1 X80.118 Y83.38 E.00148
G3 X79.621 Y83.537 I-.05 J.709 E.08794
; WIPE_START
G1 F12000
M204 S6000
G1 X79.777 Y83.441 E-.06977
G1 X79.912 Y83.396 E-.05376
G1 X80.052 Y83.379 E-.05392
G1 X80.118 Y83.38 E-.02505
G1 X80.362 Y83.441 E-.09559
G1 X80.485 Y83.512 E-.05386
G1 X80.591 Y83.606 E-.05377
G1 X80.677 Y83.719 E-.05378
G1 X80.738 Y83.846 E-.05381
G1 X80.773 Y83.984 E-.05384
G1 X80.78 Y84.125 E-.05376
G1 X80.738 Y84.333 E-.08055
G1 X80.677 Y84.46 E-.05378
G1 X80.669 Y84.47 E-.00476
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
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 46/50
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 15
G1 X101.504 Y78.815 F42000
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1442
M204 S5000
G1 X78.494 Y78.815 E.57851
G3 X79.903 Y78.435 I1.411 J2.424 E.03711
G1 X100.22 Y78.438 E.51079
G3 X101.452 Y78.785 I-.149 J2.884 E.03246
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.452 Y78.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.51 Y79.82 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F1442
M204 S5000
G1 X102.561 Y79.91 E.00258
G3 X102.89 Y81.227 I-2.575 J1.344 E.03447
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y79.88 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.561 Y79.91 E-.02222
M73 P90 R0
G1 X102.678 Y80.157 E-.10396
G1 X102.802 Y80.53 E-.14938
G1 X102.86 Y80.815 E-.11057
G1 X102.89 Y81.227 E-.15714
G1 X102.89 Y81.798 E-.21673
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.475 Y89.419 Z7.8 F42000
G1 X101.503 Y107.235 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F1442
M204 S5000
G1 X101.415 Y107.285 E.00257
G3 X100.097 Y107.615 I-1.343 J-2.575 E.03446
G1 X97.21 Y107.615 E.07259
G1 X97.21 Y107.235 E.00955
G1 X101.443 Y107.235 E.10643
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.415 Y107.285 E-.02217
G1 X101.04 Y107.451 E-.15569
G1 X100.778 Y107.531 E-.10407
G1 X100.373 Y107.601 E-.15602
G1 X100.097 Y107.615 E-.1051
G1 X99.526 Y107.615 E-.21696
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.896 Y107.441 Z7.8 F42000
G1 X82.79 Y107.235 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F1442
M204 S5000
G1 X82.79 Y107.615 E.00955
G1 X79.903 Y107.615 E.07259
G3 X78.496 Y107.235 I.003 J-2.805 E.03707
G1 X82.73 Y107.235 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X82.79 Y107.615 E-.14619
G1 X81.175 Y107.615 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.49 Y106.228 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F1442
M204 S5000
G3 X77.11 Y104.822 I2.417 J-1.407 E.03705
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03708
G1 X77.49 Y106.168 E.66242
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.323 Y105.892 E-.12248
G1 X77.194 Y105.502 E-.15604
G1 X77.126 Y105.115 E-.1495
G1 X77.11 Y104.822 E-.11161
G1 X77.11 Y104.242 E-.22038
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.982 Y96.659 Z7.8 F42000
G1 X79.406 Y84.265 Z7.8
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1442
M204 S5000
G1 X79.397 Y84.225 E.00092
G3 X79.919 Y83.417 I.673 J-.138 E.02385
G1 X80.053 Y83.4 E.00301
G3 X79.438 Y84.356 I.018 J.687 E.06672
G1 X79.426 Y84.322 E.00081
M204 S250
G1 X79.672 Y83.502 F42000
G1 F1442
M204 S5000
G1 X79.777 Y83.441 E.00272
G3 X80.052 Y83.379 I.291 J.648 E.00635
G1 X80.119 Y83.38 E.0015
G3 X79.623 Y83.536 I-.051 J.709 E.08797
; WIPE_START
G1 F12000
M204 S6000
G1 X79.777 Y83.441 E-.06889
G1 X79.912 Y83.396 E-.05388
G1 X80.052 Y83.379 E-.05383
G1 X80.119 Y83.38 E-.02549
G1 X80.363 Y83.442 E-.09528
G1 X80.485 Y83.512 E-.05374
G1 X80.591 Y83.606 E-.05384
G1 X80.677 Y83.719 E-.05379
G1 X80.738 Y83.846 E-.05374
G1 X80.773 Y83.983 E-.05381
G1 X80.78 Y84.125 E-.05387
G1 X80.738 Y84.333 E-.0805
G1 X80.677 Y84.46 E-.05369
G1 X80.668 Y84.472 E-.00563
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
; Z_HEIGHT: 7.56
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 47/50
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 15
G1 X77.518 Y87.664 F42000
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2128.994
M204 S6000
G1 X77.518 Y87.385 E.00755
G1 F720
G1 X77.9 Y87.385 E.01036
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X78.089 Y87.385 E.00513
G1 X78.089 Y87.664 E.00755
M106 S201.45
M106 S255
G1 F3000
G1 X77.9 Y87.664 E.00513
M106 S201.45
; FEATURE: Inner wall
G1 F720
M204 S6000
G1 X77.578 Y87.664 E.00874
M204 S250
G1 X77.531 Y88.065 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2282
M204 S5000
G1 X77.49 Y88.065 E.00103
G1 X77.49 Y106.229 E.45668
G3 X77.11 Y104.822 I2.435 J-1.412 E.03707
G1 X77.11 Y81.227 E.59319
M73 P91 R0
G3 X77.49 Y79.82 I2.805 J.002 E.03708
G1 X77.49 Y85.785 E.14996
G1 X77.49 Y86.185 E.01006
G1 X77.49 Y86.585 E.01006
G1 X77.49 Y86.985 E.01006
G1 F747.493
G1 X77.531 Y86.985 E.00103
M106 S255
G1 F600
G1 X77.9 Y86.985 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X78.49 Y86.985 E.01599
G1 X78.49 Y88.065 E.02927
G1 X77.9 Y88.065 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
G1 X77.591 Y88.065 E.00777
; WIPE_START
M204 S6000
G1 X77.49 Y88.065 E-.0384
G1 X77.49 Y89.963 E-.7216
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.07 Y97.431 Z7.96 F42000
G1 X81.139 Y107.214 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1919.225
M204 S6000
G1 X80.861 Y107.207 E.00755
M106 S255
G1 F600
G1 X80.861 Y106.825 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X80.861 Y106.435 E.01055
G1 X81.139 Y106.435 E.00755
G1 X81.139 Y106.825 E.01055
M106 S201.45
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X81.139 Y107.154 E.00892
M106 S201.45
M204 S250
G1 X81.54 Y107.194 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2282
M204 S5000
G1 X81.54 Y107.235 E.00103
G1 X82.79 Y107.235 E.03143
G1 X82.79 Y107.615 E.00955
G1 X79.903 Y107.615 E.07259
G3 X78.496 Y107.235 I.003 J-2.805 E.03707
G1 X79.26 Y107.235 E.01922
G1 X79.66 Y107.235 E.01006
G1 X80.06 Y107.235 E.01006
G1 X80.46 Y107.235 E.01006
G1 F747.227
G1 X80.46 Y107.194 E.00103
M106 S255
G1 F600
G1 X80.46 Y106.825 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X80.46 Y106.035 E.02141
G1 X81.54 Y106.035 E.02927
G1 X81.54 Y106.825 E.02141
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X81.54 Y107.134 E.00777
M106 S201.45
; WIPE_START
M204 S6000
G1 X81.54 Y107.235 E-.03838
G1 X82.79 Y107.235 E-.475
G1 X82.79 Y107.615 E-.1444
G1 X82.521 Y107.615 E-.10222
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.152 Y107.462 Z7.96 F42000
G1 X101.504 Y107.235 Z7.96
G1 Z7.56
G1 E.8 F1800
G1 F2282
M204 S5000
G1 X101.415 Y107.285 E.00258
G3 X100.097 Y107.615 I-1.344 J-2.574 E.03448
G1 X97.21 Y107.615 E.07259
G1 X97.21 Y107.235 E.00955
G1 X101.444 Y107.235 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.415 Y107.285 E-.02215
G1 X101.053 Y107.447 E-.15085
G1 X100.778 Y107.531 E-.10915
G1 X100.373 Y107.601 E-.15605
G1 X100.097 Y107.615 E-.1051
G1 X99.527 Y107.615 E-.21671
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I1.209 J.142 P1  F42000
G1 X102.483 Y82.385 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1961.093
M204 S6000
G1 X102.489 Y82.664 E.00755
G1 F623.509
G1 X102.483 Y82.664 E.00019
M106 S255
G1 F600
G1 X102.1 Y82.664 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X101.911 Y82.664 E.00513
G1 X101.911 Y82.385 E.00755
G1 X102.1 Y82.385 E.00513
M106 S201.45
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X102.423 Y82.385 E.00874
M106 S201.45
; WIPE_START
G1 X102.489 Y82.664 E-.13155
G1 X102.483 Y82.664 E-.00315
G1 X102.1 Y82.664 E-.17556
G1 X101.911 Y82.664 E-.0869
G1 X101.911 Y82.385 E-.12792
G1 X102.1 Y82.385 E-.0869
G1 X102.423 Y82.385 E-.14802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.447 Y90.018 Z7.96 F42000
G1 X102.483 Y101.385 Z7.96
G1 Z7.56
G1 E.8 F1800
G1 F1961.093
M204 S6000
G1 X102.489 Y101.664 E.00755
G1 F623.509
G1 X102.483 Y101.664 E.00019
M106 S255
G1 F600
G1 X102.1 Y101.664 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X101.911 Y101.664 E.00513
G1 X101.911 Y101.385 E.00755
G1 X102.1 Y101.385 E.00513
M106 S201.45
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X102.423 Y101.385 E.00874
M106 S201.45
; WIPE_START
G1 X102.489 Y101.664 E-.13155
G1 X102.483 Y101.664 E-.00315
G1 X102.1 Y101.664 E-.17556
G1 X101.911 Y101.664 E-.0869
G1 X101.911 Y101.385 E-.12792
G1 X102.1 Y101.385 E-.0869
G1 X102.423 Y101.385 E-.14802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.441 Y93.753 Z7.96 F42000
G1 X102.469 Y81.985 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2282
M204 S5000
G1 X102.51 Y81.985 E.00103
G1 X102.509 Y79.819 E.05445
G1 X102.561 Y79.909 E.00262
G3 X102.89 Y81.227 I-2.575 J1.344 E.03447
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y103.265 E.07453
G1 X102.51 Y102.865 E.01006
G1 X102.51 Y102.465 E.01006
G1 X102.51 Y102.065 E.01006
G1 F747.227
G1 X102.469 Y102.065 E.00103
M106 S255
G1 F600
G1 X102.1 Y102.065 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X101.51 Y102.065 E.01599
G1 X101.51 Y100.985 E.02927
G1 X102.1 Y100.985 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X102.469 Y100.985 E.00928
M106 S201.45
G1 F747.227
G1 X102.51 Y100.985 E.00103
G1 F2282
G1 X102.51 Y100.585 E.01006
G1 X102.51 Y100.185 E.01006
G1 X102.51 Y99.785 E.01006
G1 X102.51 Y84.265 E.39019
G1 X102.51 Y83.865 E.01006
G1 X102.51 Y83.465 E.01006
M73 P92 R0
G1 X102.51 Y83.065 E.01006
G1 F747.227
G1 X102.469 Y83.065 E.00103
M106 S255
G1 F600
G1 X102.1 Y83.065 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X101.51 Y83.065 E.01599
G1 X101.51 Y81.985 E.02927
G1 X102.1 Y81.985 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X102.409 Y81.985 E.00777
M106 S201.45
; WIPE_START
M204 S6000
G1 X102.51 Y81.985 E-.03841
G1 X102.509 Y80.086 E-.72159
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.504 Y78.815 Z7.96 F42000
G1 Z7.56
G1 E.8 F1800
G1 F2282
M204 S5000
G1 X78.494 Y78.815 E.57851
G3 X79.903 Y78.435 I1.411 J2.425 E.03711
G1 X100.223 Y78.438 E.51088
G3 X101.452 Y78.785 I-.153 J2.885 E.03238
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.452 Y78.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.029 Y80.565 Z7.96 F42000
G1 X79.683 Y83.521 Z7.96
G1 Z7.56
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F2282
M204 S5000
G1 X79.786 Y83.461 E.00268
G3 X79.917 Y83.417 I.283 J.627 E.00308
G1 X80.053 Y83.4 E.00307
G3 X79.634 Y83.556 I.017 J.688 E.08654
M204 S250
G1 X79.381 Y84.251 F42000
G1 F2282
M204 S5000
G1 X79.367 Y84.195 E.00129
G3 X80.052 Y83.379 I.703 J-.106 E.02697
G1 X80.123 Y83.381 E.00158
G3 X79.402 Y84.333 I-.053 J.709 E.06817
G1 X79.396 Y84.309 E.00054
; WIPE_START
G1 F12000
M204 S6000
G1 X79.367 Y84.195 E-.04474
G1 X79.36 Y84.054 E-.05377
G1 X79.381 Y83.914 E-.05374
G1 X79.429 Y83.781 E-.05384
G1 X79.503 Y83.66 E-.05382
G1 X79.6 Y83.556 E-.05374
G1 X79.778 Y83.441 E-.08056
G1 X79.912 Y83.396 E-.05382
G1 X80.052 Y83.379 E-.05375
G1 X80.123 Y83.381 E-.02675
G1 X80.365 Y83.443 E-.09493
G1 X80.485 Y83.512 E-.05294
G1 X80.591 Y83.606 E-.05377
G1 X80.639 Y83.669 E-.02983
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
; Z_HEIGHT: 7.72
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 48/50
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 15
G1 X78.49 Y88.065 F42000
G1 Z7.72
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1562
M204 S5000
G1 X77.49 Y88.065 E.02514
G1 X77.49 Y106.229 E.45668
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03707
G1 X77.49 Y86.985 E.18012
G1 X78.49 Y86.985 E.02514
G1 X78.49 Y88.005 E.02564
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.49 Y88.065 E-.38068
G1 X77.49 Y89.063 E-.37932
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I-1.188 J.265 P1  F42000
G1 X81.54 Y107.235 Z8.12
G1 Z7.72
G1 E.8 F1800
G1 F1562
M204 S5000
G1 X82.79 Y107.235 E.03143
G1 X82.79 Y107.615 E.00955
G1 X79.903 Y107.615 E.07259
G3 X78.496 Y107.235 I.003 J-2.805 E.03707
G1 X80.46 Y107.235 E.04939
G1 X80.46 Y106.035 E.03017
G1 X81.54 Y106.035 E.02715
G1 X81.54 Y107.175 E.02866
; WIPE_START
G1 F11668.197
M204 S6000
G1 X82.79 Y107.235 E-.47555
G1 X82.79 Y107.615 E-.1444
G1 X82.421 Y107.615 E-.14005
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.052 Y107.463 Z8.12 F42000
G1 X101.504 Y107.235 Z8.12
G1 Z7.72
G1 E.8 F1800
G1 F1562
M204 S5000
G1 X101.415 Y107.285 E.00257
G3 X100.097 Y107.615 I-1.344 J-2.575 E.03447
G1 X97.21 Y107.615 E.07259
G1 X97.21 Y107.235 E.00955
G1 X101.444 Y107.235 E.10644
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.415 Y107.285 E-.0221
M73 P93 R0
G1 X101.04 Y107.451 E-.15586
G1 X100.778 Y107.531 E-.10406
G1 X100.374 Y107.601 E-.15587
G1 X100.097 Y107.615 E-.10524
G1 X99.526 Y107.615 E-.21687
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I1.146 J.41 P1  F42000
G1 X101.51 Y102.065 Z8.12
G1 Z7.72
G1 E.8 F1800
G1 F1562
M204 S5000
G1 X101.51 Y100.985 E.02715
G1 X102.51 Y100.985 E.02514
G1 X102.51 Y83.065 E.45053
G1 X101.51 Y83.065 E.02514
G1 X101.51 Y81.985 E.02715
G1 X102.51 Y81.985 E.02514
G1 X102.509 Y79.819 E.05445
G1 X102.56 Y79.909 E.00261
G3 X102.89 Y81.227 I-2.575 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.51 Y106.229 I-2.805 J-.003 E.03707
G1 X102.51 Y102.065 E.1047
G1 X101.57 Y102.065 E.02363
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.51 Y100.985 E-.41104
G1 X102.428 Y100.985 E-.34896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I1.216 J-.051 P1  F42000
G1 X101.504 Y78.815 Z8.12
G1 Z7.72
G1 E.8 F1800
G1 F1562
M204 S5000
G1 X78.494 Y78.815 E.57851
G3 X79.903 Y78.435 I1.411 J2.424 E.03711
G1 X100.226 Y78.438 E.51096
G3 X101.452 Y78.785 I-.157 J2.887 E.03229
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.452 Y78.788 E-.76
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

G1 X102.329 Y82.852
G1 Z7.72
G1 E.8 F1800
; FEATURE: Top surface
G1 F1562
M204 S2000
G1 X102.678 Y82.503 E.01241
G1 X102.439 Y82.197
G1 X101.783 Y82.852 E.02332
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.439 Y82.197 E-.38948
G1 X102.678 Y82.503 E-.16322
G1 X102.329 Y82.852 E-.2073
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P94 R0
G3 Z8.12 I-1.217 J.013 P1  F42000
G1 X102.528 Y101.197 Z8.12
G1 Z7.72
G1 E.8 F1800
G1 F1562
M204 S2000
G1 X101.873 Y101.852 E.02332
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.528 Y101.197 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I-.324 J-1.173 P1  F42000
G1 X80.672 Y107.236 Z8.12
G1 Z7.72
G1 E.8 F1800
G1 F1562
M204 S2000
G1 X81.328 Y106.58 E.02332
G1 X81.116 Y106.247
G1 X80.672 Y106.691 E.01579
M204 S10000
G1 X81.347 Y107.393 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0918373
G1 F1562
M204 S6000
G1 X80.653 Y107.393 E.0026
; WIPE_START
G1 F18000
G1 X81.347 Y107.393 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I1.203 J-.183 P1  F42000
G1 X78.278 Y87.269 Z8.12
G1 Z7.72
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1562
M204 S2000
G1 X77.694 Y87.852 E.02075
G1 X77.322 Y87.679
G1 X77.805 Y87.197 E.01716
; CHANGE_LAYER
; Z_HEIGHT: 7.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y87.679 E-.27036
G1 X77.694 Y87.852 E-.16264
G1 X78.278 Y87.269 E-.327
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/50
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.12 I.416 J1.144 P1  F42000
G1 X101.504 Y78.815 Z8.12
G1 Z7.88
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1364
M204 S5000
G1 X78.494 Y78.815 E.57851
G3 X79.903 Y78.435 I1.411 J2.425 E.03711
G1 X100.23 Y78.438 E.51105
G3 X101.452 Y78.785 I-.161 J2.889 E.0322
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.452 Y78.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.28 I-1.209 J.135 P1  F42000
G1 X102.51 Y106.229 Z8.28
G1 Z7.88
G1 E.8 F1800
G1 F1364
M204 S5000
G1 X102.51 Y79.82 E.66395
G1 X102.561 Y79.909 E.00258
G3 X102.89 Y81.227 I-2.575 J1.344 E.03447
M73 P95 R0
G1 X102.89 Y104.822 E.59319
G3 X102.54 Y106.177 I-2.805 J-.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.537 Y104.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.504 Y107.235 Z8.28 F42000
G1 Z7.88
G1 E.8 F1800
G1 F1364
M204 S5000
G1 X101.415 Y107.285 E.00258
G3 X100.097 Y107.615 I-1.344 J-2.575 E.03447
G1 X97.21 Y107.615 E.07259
G1 X97.21 Y107.235 E.00955
G1 X101.444 Y107.235 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.415 Y107.285 E-.02222
G1 X101.04 Y107.451 E-.15593
G1 X100.778 Y107.531 E-.10404
G1 X100.373 Y107.601 E-.15601
G1 X100.097 Y107.615 E-.10507
G1 X99.527 Y107.615 E-.21673
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.896 Y107.441 Z8.28 F42000
G1 X82.79 Y107.235 Z8.28
G1 Z7.88
G1 E.8 F1800
G1 F1364
M204 S5000
G1 X82.79 Y107.615 E.00955
G1 X79.903 Y107.615 E.07259
G3 X78.496 Y107.235 I.003 J-2.805 E.03707
G1 X82.73 Y107.235 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X82.79 Y107.615 E-.14619
G1 X81.175 Y107.615 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.28 I.428 J-1.139 P1  F42000
G1 X77.49 Y106.229 Z8.28
G1 Z7.88
G1 E.8 F1800
G1 F1364
M204 S5000
G3 X77.11 Y104.822 I2.425 J-1.41 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.002 E.03707
G1 X77.49 Y106.169 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.12291
G1 X77.194 Y105.502 E-.15601
G1 X77.124 Y105.105 E-.15339
G1 X77.11 Y104.822 E-.10768
G1 X77.11 Y104.243 E-.22002
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
; Z_HEIGHT: 8.04
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 50/50
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 15
G1 X101.504 Y78.815 F42000
G1 Z8.04
G1 E.8 F1800
G1 F1359
M204 S5000
G1 X78.494 Y78.815 E.57851
G3 X79.903 Y78.435 I1.411 J2.425 E.03711
G1 X100.234 Y78.438 E.51114
M73 P96 R0
G3 X101.452 Y78.785 I-.166 J2.891 E.03211
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.452 Y78.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.297 Y86.373 Z8.44 F42000
G1 X102.51 Y106.229 Z8.44
G1 Z8.04
G1 E.8 F1800
G1 F1359
M204 S5000
G1 X102.51 Y79.82 E.66395
G1 X102.56 Y79.909 E.00258
G3 X102.89 Y81.227 I-2.574 J1.344 E.03448
G1 X102.89 Y104.822 E.59319
G3 X102.54 Y106.177 I-2.805 J-.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.537 Y104.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.504 Y107.235 Z8.44 F42000
G1 Z8.04
G1 E.8 F1800
G1 F1359
M204 S5000
G1 X101.415 Y107.285 E.00257
G3 X100.097 Y107.615 I-1.344 J-2.574 E.03449
G1 X97.21 Y107.615 E.07259
G1 X97.21 Y107.235 E.00955
G1 X101.444 Y107.235 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.415 Y107.285 E-.02205
G1 X101.168 Y107.402 E-.1042
G1 X100.778 Y107.531 E-.15588
G1 X100.373 Y107.601 E-.1561
G1 X100.097 Y107.615 E-.10509
G1 X99.527 Y107.615 E-.21668
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.896 Y107.441 Z8.44 F42000
G1 X82.79 Y107.235 Z8.44
G1 Z8.04
G1 E.8 F1800
G1 F1359
M204 S5000
G1 X82.79 Y107.615 E.00955
G1 X79.903 Y107.615 E.07259
G3 X78.496 Y107.235 I.003 J-2.805 E.03707
G1 X82.73 Y107.235 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X82.79 Y107.615 E-.14619
G1 X81.175 Y107.615 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.49 Y106.229 Z8.44 F42000
G1 Z8.04
G1 E.8 F1800
G1 F1359
M204 S5000
G3 X77.11 Y104.822 I2.423 J-1.409 E.03707
G1 X77.11 Y81.227 E.59319
G3 X77.49 Y79.82 I2.805 J.003 E.03707
M73 P97 R0
G1 X77.49 Y106.169 E.66244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y105.892 E-.1228
G1 X77.194 Y105.503 E-.15594
G1 X77.123 Y105.098 E-.1561
G1 X77.11 Y104.822 E-.10509
G1 X77.11 Y104.243 E-.22008
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
G1 Z8.54 F900 ; lower z a little
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

M73 P98 R0
    G1 Z108.04 F600
    G1 Z106.04

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


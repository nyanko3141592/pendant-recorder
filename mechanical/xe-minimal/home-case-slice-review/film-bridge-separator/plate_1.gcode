; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 1m 10s; total estimated time: 1m 29s
; total layer number: 7
; total filament length [mm] : 70.65
; total filament volume [cm^3] : 169.93
; total filament weight [g] : 0.21
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
M73 P10 R1
G1 E-.8 F1800
; layer num/total_layer_count: 1/7
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
M73 P18 R1
G1 X77.02 Y86.78 F42000
M204 S6000
M73 P21 R1
G1 Z.4
G1 Z.14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X77.02 Y83.37 E.09141
G1 X83.02 Y83.37 E.16084
G1 X83.02 Y82.17 E.03217
G1 X83.98 Y82.17 E.02574
G1 X83.98 Y83.37 E.03217
G1 X96.02 Y83.37 E.32275
G1 X96.02 Y82.17 E.03217
G1 X96.98 Y82.17 E.02574
M73 P22 R1
G1 X96.98 Y83.37 E.03217
G1 X100.525 Y83.37 E.09503
G1 X100.525 Y85.465 E.05616
G1 X102.98 Y85.465 E.06581
G1 X102.98 Y86.78 E.03525
G1 X77.08 Y86.78 E.6943
; WIPE_START
G1 X77.045 Y84.78 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
M73 P23 R1
G1 X76.553 Y92.397 Z.54 F42000
G1 X76.55 Y92.45 Z.54
G1 Z.14
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X76.55 Y87.25 E.1394
G1 X103.45 Y87.25 E.7211
G1 X103.45 Y92.45 E.1394
M73 P24 R1
G1 X76.61 Y92.45 E.71949
; WIPE_START
G1 X76.587 Y90.45 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
M73 P25 R1
G1 X79.83 Y97.23 Z.54 F42000
G1 Z.14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X79.83 Y97.83 E.01608
G1 X77.02 Y97.83 E.07533
G1 X77.02 Y92.92 E.13162
G1 X102.98 Y92.92 E.69591
M73 P26 R1
G1 X102.98 Y97.83 E.13162
G1 X102.17 Y97.83 E.02172
G1 X102.17 Y97.23 E.01608
M73 P27 R1
G1 X98.83 Y97.23 E.08953
G1 X98.83 Y97.83 E.01608
G1 X83.17 Y97.83 E.4198
G1 X83.17 Y97.23 E.01608
G1 X79.89 Y97.23 E.08792
M204 S6000
G1 X80.3 Y97.7 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
M73 P28 R1
G1 X80.3 Y98.3 E.01608
G1 X76.55 Y98.3 E.10053
G1 X76.55 Y82.9 E.41283
G1 X82.55 Y82.9 E.16084
G1 X82.55 Y81.7 E.03217
G1 X84.45 Y81.7 E.05093
G1 X84.45 Y82.9 E.03217
G1 X95.55 Y82.9 E.29756
M73 P29 R1
G1 X95.55 Y81.7 E.03217
G1 X97.45 Y81.7 E.05093
G1 X97.45 Y82.9 E.03217
G1 X100.995 Y82.9 E.09503
G1 X100.995 Y84.995 E.05616
G1 X103.45 Y84.995 E.06581
G1 X103.45 Y98.3 E.35666
G1 X101.7 Y98.3 E.04691
M73 P30 R1
G1 X101.7 Y97.7 E.01608
G1 X99.3 Y97.7 E.06434
G1 X99.3 Y98.3 E.01608
G1 X82.7 Y98.3 E.44499
G1 X82.7 Y97.7 E.01608
G1 X80.36 Y97.7 E.06273
; WIPE_START
M73 P31 R1
G1 X80.3 Y98.3 E-.22914
G1 X78.903 Y98.3 E-.53086
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
G1 X91.1 Y82.903 Z.54 F42000
G1 X96.5 Y82.405 Z.54
G1 Z.14
M73 P32 R1
G1 E.8 F1800
G1 F3000
M204 S500
G1 X96.5 Y83.605 E.03355
; WIPE_START
G1 X96.5 Y82.405 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X100.337 Y84.149 Z.54 F42000
G1 Z.14
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.500574
G1 F6300
M204 S500
G1 X99.957 Y83.769 E.01441
G1 X99.292 Y83.769 E.01786
G1 X100.337 Y84.814 E.03967
; WIPE_START
G1 X99.292 Y83.769 E-.56168
G1 X99.814 Y83.769 E-.19832
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X101.841 Y85.653 Z.54 F42000
G1 Z.14
G1 E.8 F1800
G1 F6300
M204 S500
G1 X102.569 Y86.381 E.02763
G1 X101.903 Y86.381 E.01786
G1 X101.176 Y85.653 E.02763
M204 S6000
G1 X101.45 Y86.592 F42000
G1 F6300
M204 S500
M73 P33 R1
G1 X100.722 Y85.864 E.02763
G1 X100.126 Y85.864 E.01599
G1 X100.126 Y85.268 E.01599
G1 X98.627 Y83.769 E.0569
G1 X97.961 Y83.769 E.01786
G1 X100.573 Y86.381 E.09912
G1 X99.907 Y86.381 E.01786
G1 X97.296 Y83.769 E.09912
M73 P33 R0
G1 X97.16 Y83.769 E.00366
G1 X97.16 Y84.004 E.0063
G1 X96.865 Y84.004 E.0079
G1 X99.242 Y86.381 E.09021
G1 X98.576 Y86.381 E.01786
G1 X96.2 Y84.004 E.09021
G1 X95.84 Y84.004 E.00964
G1 X95.84 Y83.769 E.0063
M73 P34 R0
G1 X95.299 Y83.769 E.01452
G1 X97.911 Y86.381 E.09912
G1 X97.245 Y86.381 E.01786
G1 X94.634 Y83.769 E.09912
G1 X93.969 Y83.769 E.01786
G1 X96.58 Y86.381 E.09912
G1 X95.915 Y86.381 E.01786
G1 X93.303 Y83.769 E.09912
G1 X92.638 Y83.769 E.01786
G1 X95.249 Y86.381 E.09912
G1 X94.584 Y86.381 E.01786
G1 X91.972 Y83.769 E.09912
M73 P35 R0
G1 X91.307 Y83.769 E.01786
G1 X93.918 Y86.381 E.09912
G1 X93.253 Y86.381 E.01786
G1 X90.641 Y83.769 E.09912
G1 X89.976 Y83.769 E.01786
G1 X92.587 Y86.381 E.09912
G1 X91.922 Y86.381 E.01786
G1 X89.311 Y83.769 E.09912
G1 X88.645 Y83.769 E.01786
G1 X91.257 Y86.381 E.09912
M73 P36 R0
G1 X90.591 Y86.381 E.01786
G1 X87.98 Y83.769 E.09912
G1 X87.314 Y83.769 E.01786
G1 X89.926 Y86.381 E.09912
G1 X89.26 Y86.381 E.01786
G1 X86.649 Y83.769 E.09912
G1 X85.983 Y83.769 E.01786
G1 X88.595 Y86.381 E.09912
G1 X87.929 Y86.381 E.01786
G1 X85.318 Y83.769 E.09912
M73 P37 R0
G1 X84.653 Y83.769 E.01786
G1 X87.264 Y86.381 E.09912
G1 X86.599 Y86.381 E.01786
G1 X84.16 Y83.942 E.09258
G1 X84.16 Y84.004 E.00168
G1 X83.557 Y84.004 E.01618
G1 X85.933 Y86.381 E.09021
G1 X85.268 Y86.381 E.01786
G1 X82.656 Y83.769 E.09912
G1 X81.991 Y83.769 E.01786
G1 X84.602 Y86.381 E.09912
M73 P38 R0
G1 X83.937 Y86.381 E.01786
G1 X81.325 Y83.769 E.09912
G1 X80.66 Y83.769 E.01786
G1 X83.271 Y86.381 E.09912
G1 X82.606 Y86.381 E.01786
G1 X79.995 Y83.769 E.09912
G1 X79.329 Y83.769 E.01786
G1 X81.941 Y86.381 E.09912
G1 X81.275 Y86.381 E.01786
G1 X78.664 Y83.769 E.09912
M73 P39 R0
G1 X77.998 Y83.769 E.01786
G1 X80.61 Y86.381 E.09912
G1 X79.944 Y86.381 E.01786
G1 X77.419 Y83.856 E.09584
G1 X77.419 Y84.521 E.01786
G1 X79.279 Y86.381 E.07058
G1 X78.613 Y86.381 E.01786
G1 X77.419 Y85.187 E.04533
G1 X77.419 Y85.852 E.01786
G1 X78.159 Y86.592 E.02809
; WIPE_START
G1 X77.419 Y85.852 E-.39777
M73 P40 R0
G1 X77.419 Y85.187 E-.25286
G1 X77.623 Y85.39 E-.10937
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X84.895 Y87.708 Z.54 F42000
G1 X101.832 Y93.108 Z.54
G1 Z.14
G1 E.8 F1800
; LINE_WIDTH: 0.504784
G1 F6300
M204 S500
G1 X102.581 Y93.857 E.02867
G1 X102.581 Y94.528 E.01818
G1 X101.372 Y93.319 E.04628
G1 X100.701 Y93.319 E.01818
G1 X102.581 Y95.199 E.072
G1 X102.581 Y95.871 E.01818
G1 X100.029 Y93.319 E.09771
G1 X99.358 Y93.319 E.01818
G1 X102.581 Y96.542 E.12342
M73 P41 R0
G1 X102.581 Y97.213 E.01818
G1 X98.687 Y93.319 E.14913
G1 X98.015 Y93.319 E.01818
G1 X101.527 Y96.831 E.13447
G1 X100.855 Y96.831 E.01818
G1 X97.344 Y93.319 E.13447
G1 X96.672 Y93.319 E.01818
G1 X100.184 Y96.831 E.13447
G1 X99.512 Y96.831 E.01818
M73 P42 R0
G1 X96.001 Y93.319 E.13447
G1 X95.33 Y93.319 E.01818
G1 X98.841 Y96.831 E.13447
G1 X98.431 Y96.831 E.01111
G1 X98.431 Y97.092 E.00707
G1 X94.658 Y93.319 E.14447
G1 X93.987 Y93.319 E.01818
G1 X98.098 Y97.431 E.15745
G1 X97.427 Y97.431 E.01818
G1 X93.316 Y93.319 E.15745
M73 P43 R0
G1 X92.644 Y93.319 E.01818
G1 X96.756 Y97.431 E.15745
G1 X96.084 Y97.431 E.01818
G1 X91.973 Y93.319 E.15745
G1 X91.301 Y93.319 E.01818
G1 X95.413 Y97.431 E.15745
G1 X94.741 Y97.431 E.01818
G1 X90.63 Y93.319 E.15745
M73 P44 R0
G1 X89.959 Y93.319 E.01818
G1 X94.07 Y97.431 E.15745
G1 X93.399 Y97.431 E.01818
G1 X89.287 Y93.319 E.15745
G1 X88.616 Y93.319 E.01818
G1 X92.727 Y97.431 E.15745
G1 X92.056 Y97.431 E.01818
G1 X87.944 Y93.319 E.15745
M73 P45 R0
G1 X87.273 Y93.319 E.01818
G1 X91.384 Y97.431 E.15745
G1 X90.713 Y97.431 E.01818
G1 X86.602 Y93.319 E.15745
G1 X85.93 Y93.319 E.01818
G1 X90.042 Y97.431 E.15745
G1 X89.37 Y97.431 E.01818
G1 X85.259 Y93.319 E.15745
M73 P46 R0
G1 X84.588 Y93.319 E.01818
G1 X88.699 Y97.431 E.15745
G1 X88.028 Y97.431 E.01818
G1 X83.916 Y93.319 E.15745
G1 X83.245 Y93.319 E.01818
G1 X87.356 Y97.431 E.15745
G1 X86.685 Y97.431 E.01818
G1 X82.573 Y93.319 E.15745
M73 P47 R0
G1 X81.902 Y93.319 E.01818
G1 X86.013 Y97.431 E.15745
G1 X85.342 Y97.431 E.01818
G1 X81.231 Y93.319 E.15745
G1 X80.559 Y93.319 E.01818
G1 X84.671 Y97.431 E.15745
G1 X83.999 Y97.431 E.01818
G1 X79.888 Y93.319 E.15745
M73 P48 R0
G1 X79.216 Y93.319 E.01818
G1 X82.728 Y96.831 E.13447
G1 X82.057 Y96.831 E.01818
G1 X78.545 Y93.319 E.13447
G1 X77.874 Y93.319 E.01818
G1 X81.385 Y96.831 E.13447
G1 X80.714 Y96.831 E.01818
G1 X77.419 Y93.536 E.12617
G1 X77.419 Y94.208 E.01818
M73 P49 R0
G1 X80.042 Y96.831 E.10045
G1 X79.431 Y96.831 E.01656
G1 X79.431 Y96.89 E.00162
G1 X77.419 Y94.879 E.07703
G1 X77.419 Y95.55 E.01818
G1 X79.3 Y97.431 E.07201
G1 X78.628 Y97.431 E.01818
G1 X77.419 Y96.222 E.0463
G1 X77.419 Y96.893 E.01818
G1 X78.168 Y97.642 E.02869
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6300
G1 X77.419 Y96.893 E-.40253
G1 X77.419 Y96.222 E-.25513
G1 X77.61 Y96.412 E-.10235
; WIPE_END
M73 P50 R0
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
G3 Z.54 I1.179 J-.3 P1  F42000
G1 X76.59 Y92.41 Z.54
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7254
M204 S5000
G1 X76.59 Y87.29 E.12872
G1 X103.41 Y87.29 E.67429
G1 X103.41 Y92.41 E.12872
G1 X76.65 Y92.41 E.67278
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.627 Y90.41 E-.76
; WIPE_END
M73 P51 R0
G1 E-.04 F1800
M204 S10000
G1 X80.076 Y97.219 Z.7 F42000
G1 X80.34 Y97.74 Z.7
G1 Z.3
G1 E.8 F1800
G1 F7254
M204 S5000
G1 X80.34 Y98.34 E.01508
G1 X76.51 Y98.34 E.09628
G1 X76.51 Y82.86 E.38918
G1 X82.51 Y82.86 E.15084
G1 X82.51 Y81.66 E.03017
G1 X84.49 Y81.66 E.04978
G1 X84.49 Y82.86 E.03017
G1 X95.51 Y82.86 E.27706
G1 X95.51 Y81.66 E.03017
G1 X97.49 Y81.66 E.04978
G1 X97.49 Y82.86 E.03017
G1 X101.035 Y82.86 E.08913
G1 X101.035 Y84.955 E.05267
G1 X103.49 Y84.955 E.06172
G1 X103.49 Y98.34 E.33651
G1 X101.66 Y98.34 E.04601
G1 X101.66 Y97.74 E.01508
M73 P52 R0
G1 X99.34 Y97.74 E.05833
G1 X99.34 Y98.34 E.01508
G1 X82.66 Y98.34 E.41936
G1 X82.66 Y97.74 E.01508
G1 X80.4 Y97.74 E.05682
; WIPE_START
G1 F11668.197
M204 S6000
G1 X80.34 Y98.34 E-.22914
G1 X78.943 Y98.34 E-.53086
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

G1 X103.278 Y97.72
G1 Z.3
G1 E.8 F1800
; FEATURE: Top surface
G1 F7254
M204 S2000
G1 X102.87 Y98.128 E.01449
G1 X102.325 Y98.128
G1 X103.278 Y97.175 E.03389
G1 X103.278 Y96.629
G1 X101.872 Y98.035 E.04998
G1 X101.834 Y97.528
G1 X103.278 Y96.084 E.05134
M73 P53 R0
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
G1 X102.922 Y92.622
G1 X97.416 Y98.128 E.19576
G1 X96.871 Y98.128
G1 X102.376 Y92.622 E.19576
M73 P54 R0
G1 X101.831 Y92.622
G1 X96.325 Y98.128 E.19576
G1 X95.78 Y98.128
G1 X101.286 Y92.622 E.19576
G1 X100.74 Y92.622
G1 X95.234 Y98.128 E.19576
G1 X94.689 Y98.128
G1 X100.195 Y92.622 E.19576
G1 X99.649 Y92.622
G1 X94.144 Y98.128 E.19576
G1 X93.598 Y98.128
G1 X99.104 Y92.622 E.19576
M73 P55 R0
G1 X98.559 Y92.622
G1 X93.053 Y98.128 E.19576
G1 X92.507 Y98.128
G1 X98.013 Y92.622 E.19576
G1 X97.468 Y92.622
G1 X91.962 Y98.128 E.19576
G1 X91.417 Y98.128
G1 X96.922 Y92.622 E.19576
G1 X96.377 Y92.622
G1 X90.871 Y98.128 E.19576
G1 X90.326 Y98.128
G1 X95.832 Y92.622 E.19576
G1 X95.286 Y92.622
M73 P56 R0
G1 X89.78 Y98.128 E.19576
G1 X89.235 Y98.128
G1 X94.741 Y92.622 E.19576
G1 X94.195 Y92.622
G1 X88.69 Y98.128 E.19576
G1 X88.144 Y98.128
G1 X93.65 Y92.622 E.19576
G1 X93.105 Y92.622
G1 X87.599 Y98.128 E.19576
G1 X87.053 Y98.128
G1 X92.559 Y92.622 E.19576
G1 X92.014 Y92.622
G1 X86.508 Y98.128 E.19576
M73 P57 R0
G1 X85.963 Y98.128
G1 X91.468 Y92.622 E.19576
G1 X90.923 Y92.622
G1 X85.417 Y98.128 E.19576
G1 X84.872 Y98.128
G1 X90.378 Y92.622 E.19576
G1 X89.832 Y92.622
G1 X84.326 Y98.128 E.19576
G1 X83.781 Y98.128
G1 X89.287 Y92.622 E.19576
G1 X88.741 Y92.622
G1 X83.236 Y98.128 E.19576
M73 P58 R0
G1 X82.872 Y97.946
G1 X88.196 Y92.622 E.18929
G1 X87.651 Y92.622
G1 X82.745 Y97.528 E.17443
G1 X82.199 Y97.528
G1 X87.105 Y92.622 E.17443
G1 X86.56 Y92.622
G1 X81.654 Y97.528 E.17443
G1 X81.109 Y97.528
G1 X86.014 Y92.622 E.17443
G1 X85.469 Y92.622
G1 X80.563 Y97.528 E.17443
; WIPE_START
G1 F11668.197
M204 S6000
M73 P59 R0
G1 X81.977 Y96.114 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.418 Y98.128 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F7254
M204 S2000
G1 X84.923 Y92.622 E.19576
G1 X84.378 Y92.622
G1 X78.872 Y98.128 E.19576
G1 X78.327 Y98.128
G1 X83.833 Y92.622 E.19576
G1 X83.287 Y92.622
G1 X77.781 Y98.128 E.19576
G1 X77.236 Y98.128
G1 X82.742 Y92.622 E.19576
G1 X82.196 Y92.622
G1 X76.722 Y98.096 E.19464
M73 P60 R0
G1 X76.722 Y97.551
G1 X81.651 Y92.622 E.17525
G1 X81.106 Y92.622
G1 X76.722 Y97.006 E.15586
G1 X76.722 Y96.46
G1 X80.56 Y92.622 E.13647
G1 X80.015 Y92.622
G1 X76.722 Y95.915 E.11707
G1 X76.722 Y95.369
G1 X79.469 Y92.622 E.09768
G1 X78.924 Y92.622
G1 X76.722 Y94.824 E.07829
G1 X76.722 Y94.279
G1 X78.379 Y92.622 E.0589
G1 X77.833 Y92.622
M73 P61 R0
G1 X76.722 Y93.733 E.03951
G1 X76.722 Y93.188
G1 X77.288 Y92.622 E.02011
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.722 Y93.188 E-.30402
G1 X76.722 Y93.733 E-.20725
G1 X77.185 Y93.27 E-.24874
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.71 Y94.548 Z.7 F42000
G1 X101.746 Y97.44 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.106423
G1 F7254
M204 S6000
G1 X101.624 Y97.513 E.00067
; LINE_WIDTH: 0.0875684
G1 X101.632 Y97.53 E.00006
; LINE_WIDTH: 0.058027
G1 X101.639 Y97.547 E.00003
; WIPE_START
G1 F18000
G1 X101.632 Y97.53 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.735 Y89.978 Z.7 F42000
G1 X103.278 Y86.267 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F7254
M204 S2000
G1 X102.467 Y87.078 E.02885
G1 X101.921 Y87.078
G1 X103.278 Y85.721 E.04824
G1 X103.278 Y85.176
G1 X101.376 Y87.078 E.06763
G1 X100.83 Y87.078
G1 X102.741 Y85.167 E.06794
G1 X102.196 Y85.167
G1 X100.285 Y87.078 E.06794
M73 P62 R0
G1 X99.74 Y87.078
G1 X101.65 Y85.167 E.06794
G1 X101.105 Y85.167
G1 X99.194 Y87.078 E.06794
G1 X98.649 Y87.078
G1 X100.823 Y84.904 E.0773
G1 X100.823 Y84.358
G1 X98.103 Y87.078 E.09669
G1 X97.558 Y87.078
G1 X100.823 Y83.813 E.11609
G1 X100.823 Y83.268
G1 X97.013 Y87.078 E.13548
G1 X96.467 Y87.078
G1 X100.473 Y83.072 E.14243
G1 X99.928 Y83.072
G1 X95.922 Y87.078 E.14243
G1 X95.376 Y87.078
M73 P63 R0
G1 X99.382 Y83.072 E.14243
G1 X98.837 Y83.072
G1 X94.831 Y87.078 E.14243
G1 X94.286 Y87.078
G1 X98.291 Y83.072 E.14243
G1 X97.746 Y83.072
G1 X93.74 Y87.078 E.14243
G1 X93.195 Y87.078
G1 X97.278 Y82.995 E.14518
G1 X97.278 Y82.449
G1 X92.649 Y87.078 E.16457
G1 X92.104 Y87.078
G1 X97.278 Y81.904 E.18396
G1 X96.764 Y81.872
G1 X95.722 Y82.914 E.03706
M73 P64 R0
G1 X95.722 Y82.369
G1 X96.219 Y81.872 E.01766
; WIPE_START
G1 F11668.197
M204 S6000
G1 X95.722 Y82.369 E-.26698
G1 X95.722 Y82.914 E-.20725
G1 X96.254 Y82.383 E-.28576
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.564 Y83.072 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F7254
M204 S2000
G1 X91.559 Y87.078 E.14243
G1 X91.013 Y87.078
G1 X95.019 Y83.072 E.14243
G1 X94.473 Y83.072
G1 X90.468 Y87.078 E.14243
G1 X89.922 Y87.078
G1 X93.928 Y83.072 E.14243
G1 X93.383 Y83.072
G1 X89.377 Y87.078 E.14243
G1 X88.831 Y87.078
G1 X92.837 Y83.072 E.14243
M73 P65 R0
G1 X92.292 Y83.072
G1 X88.286 Y87.078 E.14243
G1 X87.741 Y87.078
G1 X91.746 Y83.072 E.14243
G1 X91.201 Y83.072
G1 X87.195 Y87.078 E.14243
G1 X86.65 Y87.078
G1 X90.656 Y83.072 E.14243
G1 X90.11 Y83.072
G1 X86.104 Y87.078 E.14243
G1 X85.559 Y87.078
G1 X89.565 Y83.072 E.14243
G1 X89.019 Y83.072
G1 X85.014 Y87.078 E.14243
M73 P66 R0
G1 X84.468 Y87.078
G1 X88.474 Y83.072 E.14243
G1 X87.929 Y83.072
G1 X83.923 Y87.078 E.14243
G1 X83.377 Y87.078
G1 X87.383 Y83.072 E.14243
G1 X86.838 Y83.072
G1 X82.832 Y87.078 E.14243
G1 X82.287 Y87.078
G1 X86.292 Y83.072 E.14243
G1 X85.747 Y83.072
G1 X81.741 Y87.078 E.14243
G1 X81.196 Y87.078
G1 X85.202 Y83.072 E.14243
M73 P67 R0
G1 X84.656 Y83.072
G1 X80.65 Y87.078 E.14243
G1 X80.105 Y87.078
G1 X84.278 Y82.905 E.14837
G1 X84.278 Y82.36
G1 X79.56 Y87.078 E.16776
G1 X79.014 Y87.078
G1 X84.22 Y81.872 E.18509
G1 X83.675 Y81.872
G1 X82.722 Y82.825 E.03387
G1 X82.722 Y82.279
G1 X83.129 Y81.872 E.01447
; WIPE_START
G1 F11668.197
M204 S6000
G1 X82.722 Y82.279 E-.21876
G1 X82.722 Y82.825 E-.20726
G1 X83.344 Y82.203 E-.33399
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.475 Y83.072 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F7254
M204 S2000
G1 X78.469 Y87.078 E.14243
M73 P68 R0
G1 X77.923 Y87.078
G1 X81.929 Y83.072 E.14243
G1 X81.384 Y83.072
G1 X77.378 Y87.078 E.14243
G1 X76.833 Y87.078
G1 X80.838 Y83.072 E.14243
G1 X80.293 Y83.072
G1 X76.722 Y86.643 E.12696
G1 X76.722 Y86.098
G1 X79.748 Y83.072 E.10757
G1 X79.202 Y83.072
G1 X76.722 Y85.552 E.08818
G1 X76.722 Y85.007
G1 X78.657 Y83.072 E.06879
G1 X78.111 Y83.072
G1 X76.722 Y84.461 E.04939
M73 P69 R0
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
G1 X84.53 Y83.901 Z.7 F42000
G1 X100.842 Y83.099 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126093
G1 F7254
M204 S6000
G1 X100.5 Y83.099 E.00205
; WIPE_START
G1 F18000
G1 X100.842 Y83.099 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.21 Y83.032 Z.7 F42000
G1 X82.84 Y82.942 Z.7
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.087016
G1 F7254
M204 S6000
G1 X82.592 Y83.19 E.0012
; CHANGE_LAYER
; Z_HEIGHT: 0.46
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X82.84 Y82.942 E-.76
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
G3 Z.7 I-.409 J1.146 P1  F42000
G1 X95.089 Y87.311 Z.7
G1 Z.46
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F1200
M204 S5000
G1 X95.089 Y87.089 E.00498
G1 X95.911 Y87.089 E.0184
G1 X95.911 Y87.311 E.00498
M73 P70 R0
G1 X95.149 Y87.311 E.01706
; WIPE_START
G1 F12000
M204 S6000
G1 X95.089 Y87.089 E-.08755
G1 X95.911 Y87.089 E-.31253
G1 X95.911 Y87.311 E-.08453
G1 X95.186 Y87.311 E-.2754
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.089 Y92.389 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X95.911 Y92.389 E.0184
G1 X95.911 Y92.611 E.00498
G1 X95.089 Y92.611 E.0184
G1 X95.089 Y92.449 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X95.911 Y92.389 E-.31336
G1 X95.911 Y92.611 E-.08453
G1 X95.089 Y92.611 E-.31253
G1 X95.089 Y92.481 E-.04959
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.456 Y92.439 Z.86 F42000
G1 X78.089 Y92.389 Z.86
G1 Z.46
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X78.911 Y92.389 E.0184
G1 X78.911 Y92.611 E.00498
G1 X78.089 Y92.611 E.0184
G1 X78.089 Y92.449 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X78.911 Y92.389 E-.31336
G1 X78.911 Y92.611 E-.08453
G1 X78.089 Y92.611 E-.31253
G1 X78.089 Y92.481 E-.04959
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.089 Y87.311 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X78.089 Y87.089 E.00498
M73 P71 R0
G1 X78.911 Y87.089 E.0184
G1 X78.911 Y87.311 E.00498
G1 X78.149 Y87.311 E.01706
; WIPE_START
G1 F12000
M204 S6000
G1 X78.089 Y87.089 E-.08755
G1 X78.911 Y87.089 E-.31253
G1 X78.911 Y87.311 E-.08453
G1 X78.187 Y87.311 E-.27539
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
G1 X95.089 Y87.311 F42000
G1 Z.62
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X95.089 Y87.089 E.00498
G1 X95.911 Y87.089 E.0184
G1 X95.911 Y87.311 E.00498
G1 X95.149 Y87.311 E.01706
; WIPE_START
G1 F12000
M204 S6000
G1 X95.089 Y87.089 E-.08755
G1 X95.911 Y87.089 E-.31253
G1 X95.911 Y87.311 E-.08453
G1 X95.186 Y87.311 E-.2754
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.089 Y92.389 Z1.02 F42000
G1 Z.62
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X95.911 Y92.389 E.0184
G1 X95.911 Y92.611 E.00498
G1 X95.089 Y92.611 E.0184
G1 X95.089 Y92.449 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X95.911 Y92.389 E-.31336
G1 X95.911 Y92.611 E-.08453
G1 X95.089 Y92.611 E-.31253
G1 X95.089 Y92.481 E-.04959
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.456 Y92.439 Z1.02 F42000
G1 X78.089 Y92.389 Z1.02
G1 Z.62
M73 P72 R0
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X78.911 Y92.389 E.0184
G1 X78.911 Y92.611 E.00498
G1 X78.089 Y92.611 E.0184
G1 X78.089 Y92.449 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X78.911 Y92.389 E-.31336
G1 X78.911 Y92.611 E-.08453
G1 X78.089 Y92.611 E-.31253
G1 X78.089 Y92.481 E-.04959
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.089 Y87.311 Z1.02 F42000
G1 Z.62
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X78.089 Y87.089 E.00498
G1 X78.911 Y87.089 E.0184
G1 X78.911 Y87.311 E.00498
G1 X78.149 Y87.311 E.01706
; WIPE_START
G1 F12000
M204 S6000
G1 X78.089 Y87.089 E-.08755
G1 X78.911 Y87.089 E-.31253
G1 X78.911 Y87.311 E-.08453
G1 X78.187 Y87.311 E-.27539
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
M204 S250
G1 X78.089 Y87.089 F42000
M204 S10000
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X78.911 Y87.089 E.0184
G1 X78.911 Y87.311 E.00498
G1 X78.089 Y87.311 E.0184
G1 X78.089 Y87.149 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X78.911 Y87.089 E-.31336
G1 X78.911 Y87.311 E-.08452
G1 X78.089 Y87.311 E-.31253
G1 X78.089 Y87.181 E-.04959
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P73 R0
G1 X78.089 Y92.389 Z1.18 F42000
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X78.911 Y92.389 E.0184
G1 X78.911 Y92.611 E.00498
G1 X78.089 Y92.611 E.0184
G1 X78.089 Y92.449 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X78.911 Y92.389 E-.31336
G1 X78.911 Y92.611 E-.08453
G1 X78.089 Y92.611 E-.31253
G1 X78.089 Y92.481 E-.04959
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.721 Y92.539 Z1.18 F42000
G1 X95.089 Y92.611 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X95.089 Y92.389 E.00498
G1 X95.911 Y92.389 E.0184
G1 X95.911 Y92.611 E.00498
G1 X95.149 Y92.611 E.01706
; WIPE_START
G1 F12000
M204 S6000
G1 X95.089 Y92.389 E-.08755
G1 X95.911 Y92.389 E-.31252
G1 X95.911 Y92.611 E-.08453
G1 X95.186 Y92.611 E-.2754
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.911 Y87.089 Z1.18 F42000
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X95.911 Y87.311 E.00498
G1 X95.089 Y87.311 E.0184
G1 X95.089 Y87.089 E.00498
G1 X95.851 Y87.089 E.01706
; WIPE_START
G1 F12000
M204 S6000
G1 X95.911 Y87.311 E-.08754
G1 X95.089 Y87.311 E-.31252
G1 X95.089 Y87.089 E-.08452
G1 X95.814 Y87.089 E-.27541
; WIPE_END
M73 P74 R0
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
G1 X95.11 Y92.59 F42000
G1 Z.94
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X95.11 Y92.369 E.00556
M106 S255
G1 F600
G1 X95.11 Y92 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X95.11 Y87.7 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X95.11 Y87.331 E.00928
M106 S204
G1 F1200
G1 X95.11 Y87.11 E.00556
G1 X95.51 Y87.11 E.01006
G1 X95.89 Y87.11 E.00955
G1 X95.89 Y87.331 E.00556
M106 S255
G1 F600
M73 P77 R0
G1 X95.89 Y87.7 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X95.89 Y92 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X95.89 Y92.369 E.00928
M106 S204
M73 P78 R0
G1 F1200
G1 X95.89 Y92.59 E.00556
G1 X95.49 Y92.59 E.01006
G1 X95.17 Y92.59 E.00805
; WIPE_START
G1 F8044.417
M204 S6000
G1 X95.11 Y92.369 E-.08702
G1 X95.11 Y92 E-.14022
G1 X95.11 Y90.598 E-.53276
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

G1 X95.5 Y92.39
G1 Z.94
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.413686
G1 F1200
M204 S6000
G1 X95.5 Y87.31 E.12561
; WIPE_START
G1 F11862.397
G1 X95.5 Y89.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.983 Y90.632 Z1.34 F42000
G1 X78.11 Y92.369 Z1.34
G1 Z.94
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
M204 S5000
G1 X78.11 Y92 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X78.11 Y87.7 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X78.11 Y87.331 E.00928
M106 S204
M73 P79 R0
G1 F1200
G1 X78.11 Y87.11 E.00556
G1 X78.51 Y87.11 E.01006
G1 X78.89 Y87.11 E.00955
G1 X78.89 Y87.331 E.00556
M106 S255
G1 F600
G1 X78.89 Y87.7 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X78.89 Y92 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X78.89 Y92.369 E.00928
M106 S204
G1 F1200
G1 X78.89 Y92.59 E.00556
G1 X78.49 Y92.59 E.01006
G1 X78.11 Y92.59 E.00955
G1 X78.11 Y92.429 E.00405
M204 S10000
G1 X78.5 Y92.39 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.413686
G1 F1200
M204 S6000
G1 X78.5 Y87.31 E.12561
; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11862.397
G1 X78.5 Y89.31 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/7
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.34 I-.236 J1.194 P1  F42000
G1 X95.11 Y92.59 Z1.34
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X95.11 Y87.11 E.13778
G1 X95.89 Y87.11 E.01961
G1 X95.89 Y92.59 E.13778
M73 P80 R0
G1 X95.17 Y92.59 E.0181
; WIPE_START
G1 F11668.197
M204 S6000
G1 X95.148 Y90.59 E-.76
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

G1 X95.5 Y92.39
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.413686
G1 F1200
M204 S6000
G1 X95.5 Y87.31 E.12561
; WIPE_START
G1 F11862.397
G1 X95.5 Y89.31 E-.76
; WIPE_END
M73 P81 R0
G1 E-.04 F1800
M204 S10000
G1 X88 Y90.725 Z1.5 F42000
G1 X78.11 Y92.59 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X78.11 Y87.11 E.13778
G1 X78.89 Y87.11 E.01961
G1 X78.89 Y92.59 E.13778
G1 X78.17 Y92.59 E.0181
M204 S10000
G1 X78.5 Y92.39 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.413686
M73 P82 R0
G1 F1200
M204 S6000
G1 X78.5 Y87.31 E.12561
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F11862.397
G1 X78.5 Y89.31 E-.76
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
M73 P83 R0
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
M73 P84 R0
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
M73 P86 R0
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
M73 P88 R0
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


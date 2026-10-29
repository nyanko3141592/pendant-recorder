; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 8m 45s; total estimated time: 9m 4s
; total layer number: 50
; total filament length [mm] : 576.82
; total filament volume [cm^3] : 1387.41
; total filament weight [g] : 1.72
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
M73 P1 R8
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
M73 P2 R8
G1 X79.878 Y79.874 F42000
M204 S6000
M73 P3 R8
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X79.92 Y79.866 E.00156
G3 X80.504 Y79.936 I.135 J1.357 E.02208
G3 X79.784 Y79.892 I-.43 J1.129 E.25545
G1 X79.82 Y79.885 E.00136
M204 S6000
G1 X79.955 Y80.326 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X79.977 Y80.321 E.00082
G1 X80.058 Y80.314 E.00302
G3 X79.762 Y80.382 I.015 J.75 E.16408
G1 X79.898 Y80.343 E.00527
; WIPE_START
G1 X79.977 Y80.321 E-.03116
G1 X80.058 Y80.314 E-.03084
G1 X80.2 Y80.325 E-.05446
G1 X80.341 Y80.365 E-.0556
G1 X80.567 Y80.502 E-.10031
G1 X80.665 Y80.607 E-.05446
G1 X80.749 Y80.745 E-.06164
G1 X80.798 Y80.88 E-.05436
G1 X80.82 Y81.028 E-.05687
G1 X80.813 Y81.177 E-.05677
G1 X80.776 Y81.322 E-.05692
G1 X80.711 Y81.457 E-.05689
G1 X80.621 Y81.576 E-.05689
G1 X80.556 Y81.633 E-.03282
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X79.659 Y89.213 Z.6 F42000
G1 X77.938 Y103.762 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G3 X77.743 Y103.282 I.473 J-.472 E.0198
G1 X77.743 Y76.716 E.98949
G3 X78.418 Y76.043 I.667 J-.006 E.03956
G1 X101.626 Y76.044 E.86442
G3 X102.256 Y76.668 I-.035 J.665 E.03613
G1 X102.257 Y103.284 E.99135
G3 X101.583 Y103.957 I-.663 J.011 E.03963
G1 X78.416 Y103.957 E.86286
G3 X77.983 Y103.802 I-.005 J-.668 E.01751
M204 S6000
G1 X77.616 Y104.084 F42000
; FEATURE: Outer wall
M73 P4 R8
G1 F3000
M204 S500
G3 X77.286 Y103.294 I.798 J-.798 E.03272
G1 X77.286 Y76.706 E.99029
G3 X78.406 Y75.586 I1.128 J.008 E.06544
G1 X101.64 Y75.587 E.86538
G3 X102.713 Y76.645 I-.055 J1.128 E.06145
G1 X102.714 Y103.294 E.99257
G3 X101.594 Y104.414 I-1.122 J-.002 E.06553
G1 X78.406 Y104.414 E.86366
G3 X77.66 Y104.125 I.008 J-1.129 E.03048
; WIPE_START
G1 X77.444 Y103.873 E-.12598
G1 X77.35 Y103.673 E-.08419
G1 X77.311 Y103.534 E-.05469
G1 X77.286 Y103.294 E-.09181
G1 X77.286 Y102.232 E-.40332
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

G1 X100.855 Y76.227
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50117
G1 F6300
M204 S500
G1 X101.867 Y77.239 E.05347
G1 X101.867 Y77.887 E.0242
G1 X100.412 Y76.432 E.07683
G1 X99.764 Y76.432 E.0242
G1 X101.867 Y78.535 E.11106
G1 X101.867 Y79.183 E.0242
G1 X99.116 Y76.432 E.14529
G1 X98.468 Y76.432 E.0242
G1 X101.867 Y79.832 E.17952
G1 X101.867 Y80.48 E.0242
G1 X97.82 Y76.432 E.21374
G1 X97.172 Y76.432 E.0242
G1 X101.867 Y81.128 E.24797
G1 X101.868 Y81.776 E.0242
G1 X96.524 Y76.432 E.2822
G1 X95.876 Y76.432 E.0242
G1 X101.868 Y82.424 E.31643
G1 X101.868 Y83.072 E.0242
G1 X95.228 Y76.432 E.35065
G1 X94.579 Y76.432 E.0242
G1 X101.868 Y83.72 E.38488
G1 X101.868 Y84.368 E.0242
G1 X93.931 Y76.432 E.41911
M73 P5 R8
G1 X93.283 Y76.432 E.0242
G1 X101.868 Y85.016 E.45334
G1 X101.868 Y85.664 E.0242
G1 X92.635 Y76.432 E.48756
G1 X91.987 Y76.432 E.0242
G1 X101.868 Y86.313 E.52179
G1 X101.868 Y86.961 E.0242
G1 X91.339 Y76.432 E.55602
G1 X90.691 Y76.432 E.0242
G1 X101.868 Y87.609 E.59025
G1 X101.868 Y88.257 E.0242
G1 X90.043 Y76.432 E.62447
G1 X89.395 Y76.432 E.0242
G1 X101.868 Y88.905 E.6587
G1 X101.868 Y89.553 E.0242
G1 X88.747 Y76.432 E.69293
G1 X88.099 Y76.432 E.0242
G1 X101.868 Y90.201 E.72715
G1 X101.868 Y90.849 E.0242
G1 X87.45 Y76.432 E.76138
G1 X86.802 Y76.432 E.0242
G1 X101.868 Y91.497 E.79561
G1 X101.868 Y92.146 E.0242
G1 X86.154 Y76.432 E.82984
G1 X85.506 Y76.432 E.0242
G1 X101.868 Y92.794 E.86407
G1 X101.868 Y93.442 E.0242
G1 X84.858 Y76.431 E.89829
G1 X84.21 Y76.431 E.0242
G1 X101.868 Y94.09 E.93252
M73 P6 R8
G1 X101.868 Y94.738 E.0242
G1 X83.562 Y76.431 E.96675
G1 X82.914 Y76.431 E.0242
G1 X101.868 Y95.386 E1.00098
G1 X101.868 Y96.034 E.0242
G1 X82.266 Y76.431 E1.0352
G1 X81.618 Y76.431 E.0242
G1 X101.868 Y96.682 E1.06943
G1 X101.868 Y97.33 E.0242
G1 X80.969 Y76.431 E1.10366
G1 X80.321 Y76.431 E.0242
G1 X101.869 Y97.978 E1.13788
G1 X101.869 Y98.627 E.0242
G1 X79.673 Y76.431 E1.17211
G1 X79.025 Y76.431 E.0242
G1 X101.869 Y99.275 E1.20634
G1 X101.869 Y99.923 E.0242
G1 X78.382 Y76.436 E1.24029
G2 X78.131 Y76.748 I.034 J.285 E.01655
G1 X78.131 Y76.833 E.00318
G1 X101.869 Y100.571 E1.25356
G1 X101.869 Y101.219 E.0242
G1 X81.667 Y81.018 E1.06681
M73 P7 R8
G1 X81.669 Y80.985 E.00121
G2 X80.121 Y79.471 I-1.596 J.084 E.08883
G1 X78.131 Y77.481 E.10509
G1 X78.131 Y78.129 E.0242
G1 X79.558 Y79.556 E.07536
G2 X79.126 Y79.773 I.75 J2.034 E.01807
G1 X78.131 Y78.777 E.05256
G1 X78.131 Y79.426 E.0242
G1 X78.804 Y80.098 E.03552
G2 X78.573 Y80.515 I1.281 J.984 E.01786
G1 X78.131 Y80.074 E.02331
G1 X78.131 Y80.722 E.0242
G1 X78.698 Y81.289 E.02994
; WIPE_START
G1 X78.131 Y80.722 E-.30466
G1 X78.131 Y80.074 E-.24626
G1 X78.52 Y80.463 E-.20908
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X81.413 Y81.412 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X101.869 Y101.867 E1.08023
G1 X101.869 Y102.515 E.0242
G1 X81.357 Y82.004 E1.08319
G3 X81.04 Y82.334 I-.976 J-.621 E.01723
G1 X101.869 Y103.163 E1.09997
G3 X101.671 Y103.556 I-.343 J.073 E.01776
G1 X101.62 Y103.562 E.00192
G1 X80.619 Y82.561 E1.10903
G3 X80.072 Y82.663 I-.609 J-1.758 E.02084
G1 X100.978 Y103.569 E1.10403
G1 X100.33 Y103.569 E.0242
G1 X78.131 Y81.37 E1.17231
G1 X78.131 Y82.018 E.0242
G1 X99.682 Y103.569 E1.13809
G1 X99.034 Y103.569 E.0242
G1 X78.131 Y82.666 E1.10386
G1 X78.131 Y83.314 E.0242
M73 P8 R8
G1 X98.386 Y103.569 E1.06964
G1 X97.738 Y103.569 E.0242
G1 X78.131 Y83.962 E1.03542
G1 X78.131 Y84.61 E.0242
G1 X97.09 Y103.569 E1.00119
G1 X96.442 Y103.569 E.0242
G1 X78.131 Y85.258 E.96697
G1 X78.131 Y85.906 E.0242
G1 X95.794 Y103.569 E.93275
G1 X95.146 Y103.569 E.0242
G1 X78.131 Y86.554 E.89852
G1 X78.131 Y87.202 E.0242
G1 X94.498 Y103.569 E.8643
G1 X93.85 Y103.569 E.0242
G1 X78.131 Y87.85 E.83008
G1 X78.131 Y88.498 E.0242
G1 X93.202 Y103.569 E.79585
G1 X92.553 Y103.569 E.0242
G1 X78.131 Y89.147 E.76163
G1 X78.131 Y89.795 E.0242
G1 X91.905 Y103.569 E.72741
G1 X91.257 Y103.569 E.0242
G1 X78.131 Y90.443 E.69318
G1 X78.131 Y91.091 E.0242
M73 P9 R8
G1 X90.609 Y103.569 E.65896
G1 X89.961 Y103.569 E.0242
G1 X78.131 Y91.739 E.62473
G1 X78.131 Y92.387 E.0242
G1 X89.313 Y103.569 E.59051
G1 X88.665 Y103.569 E.0242
G1 X78.131 Y93.035 E.55629
G1 X78.131 Y93.683 E.0242
G1 X88.017 Y103.569 E.52206
G1 X87.369 Y103.569 E.0242
G1 X78.131 Y94.331 E.48784
G1 X78.131 Y94.979 E.0242
G1 X86.721 Y103.569 E.45362
G1 X86.073 Y103.569 E.0242
G1 X78.131 Y95.627 E.41939
G1 X78.131 Y96.275 E.0242
G1 X85.425 Y103.569 E.38517
G1 X84.777 Y103.569 E.0242
G1 X78.131 Y96.923 E.35095
G1 X78.131 Y97.571 E.0242
G1 X84.129 Y103.569 E.31672
G1 X83.481 Y103.569 E.0242
G1 X78.131 Y98.219 E.2825
G1 X78.131 Y98.867 E.0242
G1 X82.833 Y103.569 E.24828
G1 X82.184 Y103.569 E.0242
G1 X78.131 Y99.516 E.21405
G1 X78.131 Y100.164 E.0242
G1 X81.536 Y103.569 E.17983
G1 X80.888 Y103.569 E.0242
G1 X78.131 Y100.812 E.1456
G1 X78.131 Y101.46 E.0242
G1 X80.24 Y103.569 E.11138
G1 X79.592 Y103.569 E.0242
G1 X78.131 Y102.108 E.07716
G1 X78.131 Y102.756 E.0242
G1 X78.944 Y103.569 E.04293
M73 P10 R8
G1 X78.448 Y103.569 E.01853
G3 X78.229 Y103.502 I-.015 J-.341 E.00873
G1 X77.925 Y103.198 E.01602
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6300
G1 X78.229 Y103.502 E-.163
G1 X78.309 Y103.546 E-.03467
G1 X78.448 Y103.569 E-.05371
G1 X78.944 Y103.569 E-.18853
G1 X78.349 Y102.973 E-.32008
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/50
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S198.9
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.6 I1.214 J.08 P1  F42000
G1 X79.858 Y79.982 Z.6
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X79.932 Y79.962 E.00207
G1 X80.058 Y79.953 E.00342
G3 X79.614 Y80.054 I.02 J1.11 E.17666
G1 X79.801 Y79.999 E.00527
M204 S250
G1 X79.963 Y80.365 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X79.982 Y80.36 E.00048
G1 X80.058 Y80.355 E.00192
G3 X79.778 Y80.418 I.015 J.709 E.10477
G1 X79.905 Y80.382 E.00333
; WIPE_START
M204 S6000
G1 X79.982 Y80.36 E-.03009
G1 X80.058 Y80.355 E-.02895
G1 X80.193 Y80.365 E-.05179
G1 X80.33 Y80.403 E-.05387
G1 X80.456 Y80.468 E-.05372
G1 X80.566 Y80.556 E-.05381
G1 X80.658 Y80.665 E-.05384
G1 X80.725 Y80.789 E-.05372
G1 X80.767 Y80.924 E-.05388
G1 X80.781 Y81.065 E-.0538
G1 X80.737 Y81.31 E-.09475
G1 X80.677 Y81.436 E-.05289
G1 X80.591 Y81.549 E-.05378
G1 X80.485 Y81.642 E-.05388
G1 X80.446 Y81.665 E-.01722
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.534 Y89.243 Z.76 F42000
G1 X77.77 Y103.898 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X77.765 Y103.892 E.00022
G3 X77.529 Y103.285 I.641 J-.598 E.01809
G1 X77.529 Y76.708 E.72015
G3 X78.415 Y75.829 I.878 J-.001 E.03762
G1 X101.637 Y75.831 E.62925
G3 X102.469 Y76.657 I-.049 J.881 E.03476
G1 X102.471 Y103.292 E.72172
G3 X101.585 Y104.171 I-.877 J.002 E.03762
G1 X78.408 Y104.171 E.62802
G3 X77.917 Y104.022 I-.002 J-.877 E.0141
G1 X77.816 Y103.937 E.00359
M204 S250
G1 X77.511 Y104.203 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2520
M204 S5000
G1 X77.379 Y104.057 E.00497
G1 F2340
G3 X77.226 Y103.788 I1.261 J-.894 E.00777
G1 F2520
G3 X77.153 Y103.547 I1.239 J-.507 E.00635
G1 F2340
G3 X77.129 Y103.295 I1.268 J-.251 E.00639
G1 X77.129 Y77.303 E.65347
G3 X77.13 Y76.64 I13.584 J-.3 E.01666
G1 F2520
G1 X77.143 Y76.514 E.0032
G1 F2340
G3 X77.31 Y76.046 I1.658 J.33 E.01252
G1 F2520
G1 X77.38 Y75.941 E.0032
G1 F2340
G3 X77.456 Y75.848 I.981 J.727 E.00301
G1 F2520
G3 X77.746 Y75.61 I1.048 J.979 E.00947
G1 F2340
G3 X78.029 Y75.484 I.768 J1.346 E.00778
G1 F2520
G3 X78.276 Y75.435 I.384 J1.284 E.00635
G1 F2340
G3 X79.005 Y75.429 I.429 J7.415 E.01834
G1 X101.651 Y75.43 E.56933
G3 X102.583 Y75.893 I-.058 J1.285 E.02694
G1 F2520
G3 X102.77 Y76.203 I-1.12 J.889 E.00913
G1 F2340
G3 X102.87 Y76.638 I-1.735 J.627 E.01124
G1 X102.871 Y102.697 E.65517
G3 X102.87 Y103.36 I-13.543 J.301 E.01666
G1 F2520
G1 X102.857 Y103.487 E.0032
G1 F2340
G3 X102.722 Y103.898 I-1.805 J-.366 E.01091
G1 F2520
G1 X102.657 Y104.006 E.00318
G1 F2340
G3 X102.544 Y104.152 I-1.045 J-.696 E.00464
G1 F2520
G1 X102.454 Y104.242 E.0032
G1 F2340
G3 X101.971 Y104.516 I-.889 J-1.003 E.01406
G1 F2520
G3 X101.725 Y104.565 I-.372 J-1.225 E.00632
G1 F2340
G3 X100.995 Y104.572 I-.43 J-7.438 E.01836
G1 X79.003 Y104.572 E.5529
G3 X78.34 Y104.57 I-.3 J-13.584 E.01666
G1 F2520
G1 X78.214 Y104.557 E.0032
G1 F2340
G3 X77.802 Y104.422 I.366 J-1.804 E.01091
G1 F2520
G3 X77.591 Y104.281 I.61 J-1.141 E.00638
G1 F2340
G1 X77.552 Y104.247 E.00131
; WIPE_START
M204 S6000
G1 X77.379 Y104.057 E-.09792
G1 X77.226 Y103.788 E-.11722
G1 X77.153 Y103.547 E-.0958
G1 X77.129 Y103.295 E-.09645
G1 X77.129 Y102.367 E-.35262
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

G1 X77.696 Y81.026
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420136
G1 F11664.075
M204 S6000
G1 X82.552 Y76.17 E.17271
G1 X82.006 Y76.17 E.01372
G1 X77.87 Y80.307 E.14713
G1 X77.87 Y79.761 E.01372
G1 X81.461 Y76.17 E.12772
G1 X80.915 Y76.17 E.01372
G1 X77.87 Y79.215 E.10832
G1 X77.87 Y78.67 E.01372
G1 X80.37 Y76.17 E.08891
G1 X79.824 Y76.17 E.01372
G1 X77.87 Y78.124 E.06951
G1 X77.87 Y77.578 E.01372
G1 X79.278 Y76.17 E.05011
G1 X78.733 Y76.17 E.01372
G1 X77.696 Y77.206 E.03687
M204 S10000
G1 X86.544 Y75.997 F42000
G1 F11664.075
M204 S6000
G1 X81.521 Y81.02 E.17866
G2 X81.432 Y80.564 I-1.171 J-.006 E.01176
G1 X85.825 Y76.17 E.15628
G1 X85.28 Y76.17 E.01372
G1 X81.242 Y80.208 E.14361
M73 P11 R8
G2 X80.973 Y79.932 I-.817 J.527 E.00977
G1 X84.734 Y76.17 E.13379
G1 X84.189 Y76.17 E.01372
G1 X80.633 Y79.726 E.12646
G1 X80.313 Y79.629 E.0084
G1 X80.187 Y79.626 E.00318
G1 X83.643 Y76.17 E.12293
G1 X83.097 Y76.17 E.01372
G1 X77.87 Y81.398 E.18594
G1 X77.87 Y81.943 E.01372
G1 X78.626 Y81.187 E.02691
G2 X78.731 Y81.628 I1.143 J-.038 E.01148
G1 X77.87 Y82.489 E.03063
G1 X77.87 Y83.035 E.01372
G1 X78.936 Y81.968 E.03794
G2 X79.214 Y82.236 I.802 J-.554 E.00977
G1 X77.87 Y83.58 E.04782
G1 X77.87 Y84.126 E.01372
G1 X79.567 Y82.428 E.06037
G2 X80.026 Y82.515 I.443 J-1.094 E.01184
G1 X77.87 Y84.671 E.07671
G1 X77.87 Y85.217 E.01372
G1 X86.916 Y76.17 E.32177
G1 X87.462 Y76.17 E.01372
G1 X77.87 Y85.763 E.34118
G1 X77.87 Y86.308 E.01372
G1 X88.008 Y76.17 E.36058
G1 X88.553 Y76.17 E.01372
G1 X77.87 Y86.854 E.37999
G1 X77.87 Y87.399 E.01372
G1 X89.099 Y76.17 E.39939
G1 X89.644 Y76.17 E.01372
G1 X77.87 Y87.945 E.4188
G1 X77.87 Y88.491 E.01372
G1 X90.19 Y76.17 E.4382
G1 X90.735 Y76.17 E.01372
G1 X77.87 Y89.036 E.4576
G1 X77.87 Y89.582 E.01372
G1 X91.281 Y76.171 E.47701
G1 X91.827 Y76.171 E.01372
G1 X77.87 Y90.127 E.49641
G1 X77.87 Y90.673 E.01372
G1 X92.372 Y76.171 E.51582
G1 X92.918 Y76.171 E.01372
G1 X77.87 Y91.219 E.53522
G1 X77.87 Y91.764 E.01372
G1 X93.463 Y76.171 E.55463
G1 X94.009 Y76.171 E.01372
G1 X77.87 Y92.31 E.57403
G1 X77.87 Y92.855 E.01372
G1 X94.554 Y76.171 E.59344
G1 X95.1 Y76.171 E.01372
G1 X77.87 Y93.401 E.61284
G1 X77.87 Y93.947 E.01372
G1 X95.646 Y76.171 E.63225
G1 X96.191 Y76.171 E.01372
G1 X77.87 Y94.492 E.65165
G1 X77.87 Y95.038 E.01372
G1 X96.737 Y76.171 E.67106
G1 X97.282 Y76.171 E.01372
G1 X77.87 Y95.583 E.69046
G1 X77.87 Y96.129 E.01372
G1 X97.828 Y76.171 E.70987
G1 X98.373 Y76.171 E.01372
G1 X77.87 Y96.675 E.72927
G1 X77.87 Y97.22 E.01372
G1 X98.919 Y76.171 E.74868
G1 X99.465 Y76.171 E.01372
G1 X77.87 Y97.766 E.76808
G1 X77.87 Y98.311 E.01372
G1 X100.01 Y76.171 E.78749
G1 X100.556 Y76.171 E.01372
G1 X77.87 Y98.857 E.80689
G1 X77.87 Y99.403 E.01372
G1 X101.101 Y76.171 E.82629
G1 X101.644 Y76.174 E.01364
G1 X77.87 Y99.948 E.84558
G1 X77.87 Y100.494 E.01372
G1 X102.002 Y76.362 E.85833
G3 X102.129 Y76.781 I-.426 J.357 E.01131
G1 X77.87 Y101.039 E.86283
M73 P12 R7
G1 X77.87 Y101.585 E.01372
G1 X102.129 Y77.326 E.86283
G1 X102.129 Y77.872 E.01372
G1 X77.87 Y102.131 E.86284
G1 X77.87 Y102.676 E.01372
G1 X102.129 Y78.417 E.86284
G1 X102.129 Y78.963 E.01372
G1 X77.87 Y103.222 E.86284
G2 X77.999 Y103.638 I.603 J.041 E.01121
G1 X102.129 Y79.508 E.85823
G1 X102.129 Y80.054 E.01372
G1 X78.357 Y103.826 E.8455
G2 X78.898 Y103.83 I.302 J-3.607 E.01362
G1 X102.129 Y80.6 E.82626
G1 X102.129 Y81.145 E.01372
G1 X79.444 Y103.83 E.80686
G1 X79.989 Y103.83 E.01372
G1 X102.129 Y81.691 E.78746
G1 X102.129 Y82.236 E.01372
G1 X80.535 Y103.83 E.76805
G1 X81.08 Y103.83 E.01372
G1 X102.129 Y82.782 E.74865
G1 X102.129 Y83.327 E.01372
G1 X81.626 Y103.83 E.72924
G1 X82.172 Y103.83 E.01372
G1 X102.129 Y83.873 E.70984
G1 X102.129 Y84.419 E.01372
G1 X82.717 Y103.83 E.69043
G1 X83.263 Y103.83 E.01372
G1 X102.129 Y84.964 E.67103
G1 X102.129 Y85.51 E.01372
G1 X83.809 Y103.83 E.65162
G1 X84.354 Y103.83 E.01372
G1 X102.129 Y86.055 E.63222
G1 X102.129 Y86.601 E.01372
G1 X84.9 Y103.83 E.61281
G1 X85.445 Y103.83 E.01372
G1 X102.129 Y87.146 E.59341
G1 X102.129 Y87.692 E.01372
G1 X85.991 Y103.83 E.574
G1 X86.537 Y103.83 E.01372
G1 X102.129 Y88.238 E.5546
G1 X102.129 Y88.783 E.01372
G1 X87.082 Y103.83 E.5352
G1 X87.628 Y103.83 E.01372
G1 X102.129 Y89.329 E.51579
G1 X102.129 Y89.874 E.01372
G1 X88.173 Y103.83 E.49639
G1 X88.719 Y103.83 E.01372
G1 X102.129 Y90.42 E.47698
G1 X102.129 Y90.965 E.01372
G1 X89.265 Y103.83 E.45758
G1 X89.81 Y103.83 E.01372
G1 X102.13 Y91.511 E.43817
G1 X102.13 Y92.057 E.01372
G1 X90.356 Y103.83 E.41877
G1 X90.901 Y103.83 E.01372
G1 X102.13 Y92.602 E.39936
G1 X102.13 Y93.148 E.01372
M73 P13 R7
G1 X91.447 Y103.83 E.37996
G1 X91.993 Y103.83 E.01372
G1 X102.13 Y93.693 E.36055
G1 X102.13 Y94.239 E.01372
G1 X92.538 Y103.83 E.34115
G1 X93.084 Y103.83 E.01372
G1 X102.13 Y94.784 E.32174
G1 X102.13 Y95.33 E.01372
G1 X93.629 Y103.83 E.30234
G1 X94.175 Y103.83 E.01372
G1 X102.13 Y95.875 E.28294
G1 X102.13 Y96.421 E.01372
G1 X94.721 Y103.83 E.26353
G1 X95.266 Y103.83 E.01372
G1 X102.13 Y96.967 E.24413
G1 X102.13 Y97.512 E.01372
G1 X95.812 Y103.83 E.22472
G1 X96.357 Y103.83 E.01372
G1 X102.13 Y98.058 E.20532
G1 X102.13 Y98.603 E.01372
G1 X96.903 Y103.83 E.18591
G1 X97.449 Y103.83 E.01372
G1 X102.13 Y99.149 E.16651
G1 X102.13 Y99.694 E.01372
G1 X97.994 Y103.83 E.1471
G1 X98.54 Y103.83 E.01372
G1 X102.13 Y100.24 E.1277
G1 X102.13 Y100.786 E.01372
G1 X99.085 Y103.83 E.10829
G1 X99.631 Y103.83 E.01372
G1 X102.13 Y101.331 E.08889
G1 X102.13 Y101.877 E.01372
G1 X100.177 Y103.83 E.06948
G1 X100.722 Y103.83 E.01372
G1 X102.13 Y102.422 E.05008
G1 X102.13 Y102.968 E.01372
G1 X101.094 Y104.004 E.03685
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11664.075
G1 X102.13 Y102.968 E-.55674
G1 X102.13 Y102.433 E-.20326
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/50
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.76 I.865 J-.856 P1  F42000
G1 X79.899 Y79.97 Z.76
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X80.042 Y79.952 E.00391
G3 X79.823 Y79.979 I.028 J1.112 E.18328
G1 X79.84 Y79.977 E.00047
M204 S250
G1 X79.949 Y80.367 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X80.052 Y80.354 E.00261
G3 X79.89 Y80.377 I.018 J.71 E.10806
; WIPE_START
M204 S6000
G1 X80.052 Y80.354 E-.06225
G1 X80.194 Y80.365 E-.05389
G1 X80.325 Y80.402 E-.05177
G1 X80.461 Y80.471 E-.05799
G1 X80.567 Y80.556 E-.05161
G1 X80.658 Y80.665 E-.0538
G1 X80.725 Y80.789 E-.05371
G1 X80.767 Y80.924 E-.05375
G1 X80.772 Y81.174 E-.09518
G1 X80.738 Y81.309 E-.05259
G1 X80.679 Y81.431 E-.05164
G1 X80.59 Y81.548 E-.05588
G1 X80.48 Y81.645 E-.05596
G1 X80.457 Y81.659 E-.01
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.544 Y89.236 Z.92 F42000
G1 X77.775 Y103.925 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G3 X77.511 Y103.285 I.638 J-.638 E.01927
G1 X77.511 Y76.708 E.72015
G3 X78.415 Y75.811 I.902 J.005 E.03834
G1 X101.585 Y75.811 E.62783
G3 X102.488 Y76.649 I.002 J.902 E.03674
G1 X102.489 Y103.292 E.72194
G3 X101.585 Y104.189 I-.902 J-.005 E.03834
G1 X78.408 Y104.189 E.62802
G3 X77.819 Y103.966 I.004 J-.902 E.01745
M204 S250
G1 X77.493 Y104.216 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X77.492 Y104.208 E.00021
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.703 E.66855
G3 X78.405 Y75.41 I1.306 J.013 E.05098
G1 X101.595 Y75.41 E.58302
G3 X102.888 Y76.634 I-.011 J1.307 E.04926
G1 X102.89 Y103.297 E.67033
G3 X101.595 Y104.59 I-1.306 J-.013 E.05098
G1 X78.403 Y104.59 E.58307
G3 X77.738 Y104.4 I.013 J-1.306 E.0176
G1 X77.541 Y104.252 E.0062
; WIPE_START
M204 S6000
G1 X77.492 Y104.208 E-.02488
G1 X77.294 Y103.963 E-.11967
G1 X77.186 Y103.734 E-.09611
G1 X77.135 Y103.554 E-.07115
G1 X77.11 Y103.295 E-.09906
G1 X77.11 Y102.376 E-.34913
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

G1 X78.35 Y104.018
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420546
G1 F11651.692
M204 S6000
G1 X77.975 Y103.643 E.01335
G1 X77.907 Y103.533 E.00325
G3 X77.851 Y102.973 I1.19 J-.401 E.01431
G1 X78.727 Y103.849 E.0312
G1 X79.274 Y103.849 E.01375
G1 X77.851 Y102.426 E.05064
G1 X77.851 Y101.88 E.01375
G1 X79.82 Y103.849 E.07009
G1 X80.366 Y103.849 E.01375
G1 X77.851 Y101.334 E.08954
G1 X77.851 Y100.788 E.01375
G1 X80.912 Y103.849 E.10898
G1 X81.458 Y103.849 E.01375
G1 X77.851 Y100.242 E.12843
G1 X77.851 Y99.696 E.01375
G1 X82.004 Y103.849 E.14788
G1 X82.551 Y103.849 E.01375
G1 X77.851 Y99.149 E.16733
G1 X77.851 Y98.603 E.01375
G1 X83.097 Y103.849 E.18677
G1 X83.643 Y103.849 E.01375
G1 X77.851 Y98.057 E.20622
G1 X77.851 Y97.511 E.01375
G1 X84.189 Y103.849 E.22567
G1 X84.735 Y103.849 E.01375
G1 X77.851 Y96.965 E.24511
G1 X77.851 Y96.418 E.01375
G1 X85.282 Y103.849 E.26456
G1 X85.828 Y103.849 E.01375
G1 X77.851 Y95.872 E.28401
G1 X77.851 Y95.326 E.01375
G1 X86.374 Y103.849 E.30346
G1 X86.92 Y103.849 E.01375
G1 X77.851 Y94.78 E.3229
G1 X77.851 Y94.234 E.01375
G1 X87.466 Y103.849 E.34235
G1 X88.012 Y103.849 E.01375
G1 X77.851 Y93.688 E.3618
G1 X77.851 Y93.141 E.01375
G1 X88.559 Y103.849 E.38125
M73 P14 R7
G1 X89.105 Y103.849 E.01375
G1 X77.851 Y92.595 E.40069
G1 X77.851 Y92.049 E.01375
G1 X89.651 Y103.849 E.42014
G1 X90.197 Y103.849 E.01375
G1 X77.851 Y91.503 E.43959
G1 X77.851 Y90.957 E.01375
G1 X90.743 Y103.849 E.45903
G1 X91.29 Y103.849 E.01375
G1 X77.851 Y90.41 E.47848
G1 X77.851 Y89.864 E.01375
G1 X91.836 Y103.849 E.49793
G1 X92.382 Y103.849 E.01375
G1 X77.851 Y89.318 E.51738
G1 X77.851 Y88.772 E.01375
G1 X92.928 Y103.849 E.53682
G1 X93.474 Y103.849 E.01375
G1 X77.851 Y88.226 E.55627
G1 X77.851 Y87.68 E.01375
G1 X94.02 Y103.849 E.57572
G1 X94.567 Y103.849 E.01375
G1 X77.851 Y87.133 E.59516
G1 X77.851 Y86.587 E.01375
G1 X95.113 Y103.849 E.61461
G1 X95.659 Y103.849 E.01375
G1 X77.851 Y86.041 E.63406
G1 X77.851 Y85.495 E.01375
G1 X96.205 Y103.849 E.65351
G1 X96.751 Y103.849 E.01375
G1 X77.851 Y84.949 E.67295
G1 X77.851 Y84.402 E.01375
G1 X97.298 Y103.849 E.6924
G1 X97.844 Y103.849 E.01375
G1 X77.851 Y83.856 E.71185
G1 X77.851 Y83.31 E.01375
G1 X98.39 Y103.849 E.73129
G1 X98.936 Y103.849 E.01375
G1 X77.851 Y82.764 E.75074
G1 X77.851 Y82.218 E.01375
G1 X99.482 Y103.849 E.77019
G1 X100.028 Y103.849 E.01375
G1 X77.851 Y81.672 E.78964
G1 X77.851 Y81.125 E.01375
G1 X100.748 Y104.022 E.81526
M204 S10000
G1 X102.322 Y101.773 F42000
G1 F11651.692
M204 S6000
G1 X81.516 Y80.967 E.74081
G3 X81.464 Y81.461 I-1.425 J.099 E.01257
G1 X102.149 Y102.146 E.73649
G1 X102.149 Y102.692 E.01375
G1 X81.297 Y81.84 E.74245
G3 X81.044 Y82.134 I-.828 J-.456 E.00982
G1 X102.149 Y103.238 E.75143
G3 X102.018 Y103.651 I-.774 J-.019 E.01105
G1 X80.724 Y82.36 E.75812
G1 X80.377 Y82.487 E.0093
G1 X80.313 Y82.495 E.00163
G1 X101.658 Y103.84 E.76002
G3 X101.121 Y103.849 I-.314 J-2.778 E.01356
G1 X79.753 Y82.481 E.76082
G3 X78.659 Y81.424 I.307 J-1.412 E.04033
G1 X78.652 Y81.38 E.00111
G1 X77.851 Y80.579 E.02853
G1 X77.851 Y80.033 E.01375
G1 X78.638 Y80.819 E.028
G3 X78.776 Y80.412 I1.077 J.14 E.01091
G1 X77.851 Y79.487 E.03294
G1 X77.851 Y78.941 E.01375
M73 P15 R7
G1 X78.995 Y80.085 E.04073
G3 X79.298 Y79.841 I1.333 J1.349 E.0098
G1 X77.851 Y78.394 E.05152
G1 X77.851 Y77.848 E.01375
G1 X79.673 Y79.67 E.06487
G3 X80.169 Y79.62 I.399 J1.458 E.0126
G1 X77.851 Y77.302 E.08252
G1 X77.851 Y76.756 E.01375
G1 X102.149 Y101.053 E.86513
G1 X102.149 Y100.507 E.01375
G1 X77.987 Y76.345 E.86031
G3 X78.349 Y76.161 I.391 J.322 E.01053
G1 X102.149 Y99.961 E.84739
G1 X102.149 Y99.415 E.01375
G1 X78.885 Y76.151 E.82831
G1 X79.431 Y76.151 E.01375
G1 X102.149 Y98.868 E.80886
G1 X102.148 Y98.322 E.01375
G1 X79.977 Y76.151 E.78941
G1 X80.524 Y76.151 E.01375
G1 X102.148 Y97.776 E.76996
G1 X102.148 Y97.23 E.01375
G1 X81.07 Y76.151 E.75052
G1 X81.616 Y76.151 E.01375
G1 X102.148 Y96.684 E.73107
G1 X102.148 Y96.137 E.01375
G1 X82.162 Y76.151 E.71162
G1 X82.708 Y76.151 E.01375
G1 X102.148 Y95.591 E.69217
G1 X102.148 Y95.045 E.01375
G1 X83.255 Y76.151 E.67272
G1 X83.801 Y76.151 E.01375
G1 X102.148 Y94.499 E.65327
G1 X102.148 Y93.952 E.01375
G1 X84.347 Y76.151 E.63382
G1 X84.893 Y76.151 E.01375
G1 X102.148 Y93.406 E.61438
G1 X102.148 Y92.86 E.01375
G1 X85.439 Y76.151 E.59493
G1 X85.985 Y76.151 E.01375
G1 X102.148 Y92.314 E.57548
G1 X102.148 Y91.768 E.01375
G1 X86.532 Y76.151 E.55603
G1 X87.078 Y76.151 E.01375
G1 X102.148 Y91.221 E.53658
G1 X102.148 Y90.675 E.01375
G1 X87.624 Y76.151 E.51713
G1 X88.17 Y76.151 E.01375
G1 X102.148 Y90.129 E.49768
G1 X102.148 Y89.583 E.01375
G1 X88.716 Y76.151 E.47824
G1 X89.263 Y76.151 E.01375
G1 X102.148 Y89.036 E.45879
G1 X102.148 Y88.49 E.01375
G1 X89.809 Y76.151 E.43934
G1 X90.355 Y76.151 E.01375
G1 X102.148 Y87.944 E.41989
G1 X102.148 Y87.398 E.01375
G1 X90.901 Y76.151 E.40044
G1 X91.447 Y76.151 E.01375
G1 X102.148 Y86.852 E.38099
G1 X102.148 Y86.305 E.01375
G1 X91.994 Y76.151 E.36154
G1 X92.54 Y76.151 E.01375
G1 X102.148 Y85.759 E.3421
G1 X102.148 Y85.213 E.01375
G1 X93.086 Y76.151 E.32265
G1 X93.632 Y76.151 E.01375
G1 X102.148 Y84.667 E.3032
G1 X102.147 Y84.12 E.01375
G1 X94.178 Y76.151 E.28375
G1 X94.724 Y76.151 E.01375
G1 X102.147 Y83.574 E.2643
M73 P16 R7
G1 X102.147 Y83.028 E.01375
G1 X95.271 Y76.151 E.24485
G1 X95.817 Y76.151 E.01375
G1 X102.147 Y82.482 E.2254
G1 X102.147 Y81.936 E.01375
G1 X96.363 Y76.151 E.20596
G1 X96.909 Y76.151 E.01375
G1 X102.147 Y81.389 E.18651
G1 X102.147 Y80.843 E.01375
G1 X97.455 Y76.151 E.16706
G1 X98.002 Y76.151 E.01375
G1 X102.147 Y80.297 E.14761
G1 X102.147 Y79.751 E.01375
G1 X98.548 Y76.151 E.12816
G1 X99.094 Y76.151 E.01375
G1 X102.147 Y79.204 E.10871
G1 X102.147 Y78.658 E.01375
G1 X99.64 Y76.151 E.08926
G1 X100.186 Y76.151 E.01375
G1 X102.147 Y78.112 E.06982
G1 X102.147 Y77.566 E.01375
G1 X100.732 Y76.151 E.05037
G1 X101.279 Y76.151 E.01375
G1 X102.321 Y77.193 E.0371
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11651.692
G1 X101.279 Y76.151 E-.55993
G1 X100.752 Y76.151 E-.20007
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/50
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.92 I-.219 J-1.197 P1  F42000
G1 X79.895 Y79.97 Z.92
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X80.042 Y79.952 E.00401
G3 X79.822 Y79.979 I.028 J1.111 E.18328
G1 X79.836 Y79.978 E.00036
M204 S250
G1 X79.945 Y80.368 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X80.052 Y80.354 E.00272
G3 X79.886 Y80.378 I.018 J.71 E.10795
; WIPE_START
M204 S6000
G1 X80.052 Y80.354 E-.06379
G1 X80.188 Y80.364 E-.05172
G1 X80.334 Y80.406 E-.05783
G1 X80.451 Y80.465 E-.04967
G1 X80.57 Y80.56 E-.05788
G1 X80.658 Y80.665 E-.05182
G1 X80.725 Y80.789 E-.05367
G1 X80.767 Y80.924 E-.05385
G1 X80.781 Y81.065 E-.05386
G1 X80.767 Y81.206 E-.05401
G1 X80.725 Y81.342 E-.05378
G1 X80.589 Y81.55 E-.09464
G1 X80.485 Y81.642 E-.05277
G1 X80.461 Y81.656 E-.0107
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.547 Y89.234 Z1.08 F42000
G1 X77.775 Y103.925 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G3 X77.511 Y103.285 I.637 J-.638 E.01928
G1 X77.511 Y76.715 E.71996
G3 X78.415 Y75.811 I.901 J-.003 E.03854
G1 X101.587 Y75.811 E.62788
G3 X102.488 Y76.657 I.001 J.901 E.0369
G1 X102.489 Y103.285 E.72155
G3 X101.585 Y104.189 I-.902 J.003 E.03854
G1 X78.408 Y104.189 E.62802
G3 X77.819 Y103.966 I.004 J-.902 E.01744
M204 S250
G1 X77.493 Y104.216 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X77.493 Y104.208 E.0002
G3 X77.11 Y103.295 I.924 J-.924 E.02553
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.01 E.05104
G1 X101.596 Y75.41 E.58306
G3 X102.888 Y76.637 I-.013 J1.307 E.04928
G1 X102.89 Y103.295 E.67021
G3 X101.595 Y104.59 I-1.306 J-.011 E.05104
G1 X78.403 Y104.59 E.58307
G3 X77.738 Y104.4 I.013 J-1.306 E.01759
G1 X77.541 Y104.252 E.0062
; WIPE_START
M204 S6000
G1 X77.493 Y104.208 E-.02481
G1 X77.326 Y104.014 E-.09688
G1 X77.186 Y103.734 E-.11907
G1 X77.135 Y103.552 E-.07182
G1 X77.11 Y103.295 E-.09839
G1 X77.11 Y102.376 E-.34904
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

G1 X77.678 Y84.847
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420506
G1 F11652.899
M204 S6000
G1 X80.011 Y82.513 E.08308
G3 X79.556 Y82.422 I-.002 J-1.174 E.01176
G1 X77.851 Y84.127 E.0607
G1 X77.851 Y83.581 E.01375
G1 X79.204 Y82.228 E.04818
G3 X78.928 Y81.958 I.53 J-.82 E.00979
G1 X77.851 Y83.035 E.03834
G1 X77.851 Y82.489 E.01375
G1 X78.726 Y81.614 E.03116
G3 X78.627 Y81.167 I1.036 J-.466 E.01159
G1 X77.851 Y81.943 E.0276
G1 X77.851 Y81.397 E.01375
G1 X83.097 Y76.151 E.18674
G1 X83.643 Y76.151 E.01375
G1 X80.174 Y79.62 E.12349
G3 X80.616 Y79.717 I-.018 J1.141 E.01146
G1 X84.189 Y76.151 E.12708
G1 X84.735 Y76.151 E.01375
G1 X80.96 Y79.926 E.13439
G3 X81.234 Y80.198 I-.537 J.813 E.00979
G1 X85.281 Y76.151 E.14408
G1 X85.827 Y76.151 E.01375
G1 X81.427 Y80.551 E.15664
G3 X81.52 Y81.005 I-1.075 J.455 E.01173
G1 X86.373 Y76.151 E.17279
G1 X86.919 Y76.151 E.01375
G1 X77.851 Y85.219 E.32285
G1 X77.851 Y85.766 E.01375
G1 X87.466 Y76.151 E.34229
G1 X88.012 Y76.151 E.01375
G1 X77.851 Y86.312 E.36173
G1 X77.851 Y86.858 E.01375
G1 X88.558 Y76.151 E.38118
G1 X89.104 Y76.151 E.01375
G1 X77.851 Y87.404 E.40062
G1 X77.851 Y87.95 E.01375
G1 X89.65 Y76.151 E.42006
G1 X90.196 Y76.151 E.01375
G1 X77.851 Y88.496 E.43951
G1 X77.851 Y89.042 E.01375
G1 X90.742 Y76.151 E.45895
G1 X91.288 Y76.151 E.01375
G1 X77.851 Y89.588 E.47839
G1 X77.851 Y90.135 E.01375
G1 X91.835 Y76.151 E.49783
G1 X92.381 Y76.151 E.01375
G1 X77.851 Y90.681 E.51728
G1 X77.851 Y91.227 E.01375
G1 X92.927 Y76.151 E.53672
M73 P17 R7
G1 X93.473 Y76.151 E.01375
G1 X77.851 Y91.773 E.55616
G1 X77.851 Y92.319 E.01375
G1 X94.019 Y76.151 E.57561
G1 X94.565 Y76.151 E.01375
G1 X77.851 Y92.865 E.59505
G1 X77.851 Y93.411 E.01375
G1 X95.111 Y76.151 E.61449
G1 X95.657 Y76.151 E.01375
G1 X77.851 Y93.957 E.63394
G1 X77.851 Y94.504 E.01375
G1 X96.204 Y76.151 E.65338
G1 X96.75 Y76.151 E.01375
G1 X77.851 Y95.05 E.67282
G1 X77.851 Y95.596 E.01375
G1 X97.296 Y76.151 E.69227
G1 X97.842 Y76.151 E.01375
G1 X77.851 Y96.142 E.71171
G1 X77.851 Y96.688 E.01375
G1 X98.388 Y76.151 E.73115
G1 X98.934 Y76.151 E.01375
G1 X77.851 Y97.234 E.7506
G1 X77.851 Y97.78 E.01375
G1 X99.48 Y76.151 E.77004
G1 X100.026 Y76.151 E.01375
G1 X77.851 Y98.327 E.78948
G1 X77.851 Y98.873 E.01375
G1 X100.573 Y76.151 E.80892
G1 X101.119 Y76.151 E.01375
G1 X77.851 Y99.419 E.82837
G1 X77.851 Y99.965 E.01375
G1 X101.657 Y76.159 E.84752
G3 X102.01 Y76.352 I-.044 J.5 E.01043
G1 X77.851 Y100.511 E.8601
G1 X77.851 Y101.057 E.01375
G1 X102.147 Y76.761 E.86498
G1 X102.147 Y77.307 E.01375
G1 X77.851 Y101.603 E.86498
G1 X77.851 Y102.149 E.01375
G1 X102.147 Y77.854 E.86498
G1 X102.147 Y78.4 E.01375
G1 X77.851 Y102.696 E.86498
G1 X77.851 Y103.242 E.01375
G1 X102.147 Y78.946 E.86498
G1 X102.147 Y79.492 E.01375
G1 X77.985 Y103.654 E.86022
G2 X78.342 Y103.843 I.43 J-.381 E.01039
G1 X102.147 Y80.038 E.8475
G1 X102.147 Y80.584 E.01375
G1 X78.882 Y103.849 E.82827
G1 X79.429 Y103.849 E.01375
G1 X102.147 Y81.13 E.80883
G1 X102.147 Y81.676 E.01375
G1 X79.975 Y103.849 E.78939
M73 P18 R7
G1 X80.521 Y103.849 E.01375
G1 X102.147 Y82.222 E.76995
G1 X102.147 Y82.768 E.01375
G1 X81.067 Y103.849 E.75051
G1 X81.613 Y103.849 E.01375
G1 X102.147 Y83.314 E.73106
G1 X102.147 Y83.861 E.01375
G1 X82.159 Y103.849 E.71162
G1 X82.705 Y103.849 E.01375
G1 X102.148 Y84.407 E.69218
G1 X102.148 Y84.953 E.01375
G1 X83.251 Y103.849 E.67274
G1 X83.798 Y103.849 E.01375
G1 X102.148 Y85.499 E.6533
G1 X102.148 Y86.045 E.01375
G1 X84.344 Y103.849 E.63385
G1 X84.89 Y103.849 E.01375
G1 X102.148 Y86.591 E.61441
G1 X102.148 Y87.137 E.01375
G1 X85.436 Y103.849 E.59497
G1 X85.982 Y103.849 E.01375
G1 X102.148 Y87.683 E.57553
G1 X102.148 Y88.229 E.01375
G1 X86.528 Y103.849 E.55609
G1 X87.074 Y103.849 E.01375
G1 X102.148 Y88.775 E.53665
G1 X102.148 Y89.321 E.01375
G1 X87.62 Y103.849 E.5172
G1 X88.167 Y103.849 E.01375
G1 X102.148 Y89.868 E.49776
G1 X102.148 Y90.414 E.01375
G1 X88.713 Y103.849 E.47832
G1 X89.259 Y103.849 E.01375
G1 X102.148 Y90.96 E.45888
G1 X102.148 Y91.506 E.01375
G1 X89.805 Y103.849 E.43944
G1 X90.351 Y103.849 E.01375
G1 X102.148 Y92.052 E.41999
G1 X102.148 Y92.598 E.01375
G1 X90.897 Y103.849 E.40055
G1 X91.443 Y103.849 E.01375
G1 X102.148 Y93.144 E.38111
G1 X102.148 Y93.69 E.01375
G1 X91.989 Y103.849 E.36167
G1 X92.536 Y103.849 E.01375
G1 X102.148 Y94.236 E.34223
G1 X102.148 Y94.782 E.01375
G1 X93.082 Y103.849 E.32278
G1 X93.628 Y103.849 E.01375
G1 X102.148 Y95.328 E.30334
G1 X102.148 Y95.874 E.01375
G1 X94.174 Y103.849 E.2839
G1 X94.72 Y103.849 E.01375
G1 X102.148 Y96.421 E.26446
G1 X102.148 Y96.967 E.01375
G1 X95.266 Y103.849 E.24502
G1 X95.812 Y103.849 E.01375
G1 X102.148 Y97.513 E.22558
G1 X102.148 Y98.059 E.01375
G1 X96.358 Y103.849 E.20613
G1 X96.905 Y103.849 E.01375
G1 X102.148 Y98.605 E.18669
G1 X102.149 Y99.151 E.01375
G1 X97.451 Y103.849 E.16725
G1 X97.997 Y103.849 E.01375
G1 X102.149 Y99.697 E.14781
G1 X102.149 Y100.243 E.01375
G1 X98.543 Y103.849 E.12837
G1 X99.089 Y103.849 E.01375
G1 X102.149 Y100.789 E.10892
G1 X102.149 Y101.335 E.01375
G1 X99.635 Y103.849 E.08948
G1 X100.181 Y103.849 E.01375
G1 X102.149 Y101.881 E.07004
G1 X102.149 Y102.428 E.01375
G1 X100.728 Y103.849 E.0506
G1 X101.274 Y103.849 E.01375
G1 X102.149 Y102.974 E.03116
G1 X102.149 Y103.269 E.00743
G3 X102.023 Y103.645 I-.641 J-.005 E.01016
G1 X101.656 Y104.013 E.01308
M204 S10000
G1 X77.678 Y81.024 F42000
G1 F11652.899
M204 S6000
G1 X82.55 Y76.151 E.17348
G1 X82.004 Y76.151 E.01375
G1 X77.851 Y80.304 E.14786
G1 X77.851 Y79.758 E.01375
M73 P19 R7
G1 X81.458 Y76.151 E.12842
G1 X80.912 Y76.151 E.01375
G1 X77.851 Y79.212 E.10897
G1 X77.851 Y78.666 E.01375
G1 X80.366 Y76.151 E.08953
G1 X79.82 Y76.151 E.01375
G1 X77.851 Y78.12 E.07009
G1 X77.851 Y77.574 E.01375
G1 X79.274 Y76.151 E.05064
G1 X78.728 Y76.151 E.01375
G1 X77.851 Y77.028 E.0312
G3 X77.913 Y76.45 I1.366 J-.145 E.01474
G1 X77.975 Y76.358 E.00278
G1 X78.346 Y75.987 E.01321
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11652.899
G1 X77.975 Y76.358 E-.19941
G1 X77.913 Y76.45 E-.04193
G1 X77.858 Y76.628 E-.07106
G1 X77.851 Y77.028 E-.15167
G1 X78.402 Y76.477 E-.29592
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/50
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.08 I-1.13 J.451 P1  F42000
G1 X79.952 Y80.367 Z1.08
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X80.052 Y80.354 E.00253
G3 X79.893 Y80.376 I.018 J.709 E.108
; WIPE_START
M204 S6000
G1 X80.052 Y80.354 E-.06096
G1 X80.193 Y80.365 E-.05373
G1 X80.329 Y80.403 E-.05372
G1 X80.456 Y80.468 E-.0539
G1 X80.567 Y80.556 E-.05389
G1 X80.657 Y80.664 E-.05378
G1 X80.725 Y80.789 E-.05378
G1 X80.767 Y80.924 E-.05371
G1 X80.781 Y81.059 E-.05179
G1 X80.738 Y81.308 E-.09588
G1 X80.677 Y81.436 E-.05381
G1 X80.591 Y81.549 E-.05386
G1 X80.489 Y81.639 E-.05168
G1 X80.454 Y81.659 E-.0155
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.46 Y89.227 Z1.24 F42000
G1 X77.492 Y104.216 Z1.24
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S5000
G1 X77.492 Y104.208 E.0002
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.004 E.05112
G1 X101.598 Y75.41 E.58309
G3 X102.888 Y76.637 I-.014 J1.307 E.04924
G1 X102.89 Y103.295 E.67021
G3 X101.595 Y104.59 I-1.306 J-.01 E.05104
G1 X78.405 Y104.59 E.58301
G3 X77.687 Y104.368 I.01 J-1.306 E.01918
G1 X77.54 Y104.253 E.0047
; WIPE_START
M204 S6000
G1 X77.492 Y104.208 E-.0248
G1 X77.326 Y104.014 E-.09707
G1 X77.186 Y103.735 E-.11868
G1 X77.124 Y103.487 E-.09709
G1 X77.11 Y103.295 E-.07324
G1 X77.11 Y102.376 E-.34913
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

G1 X101.529 Y75.622
G1 Z.84
G1 E.8 F1800
; FEATURE: Top surface
G1 F11668.197
M204 S2000
G1 X102.676 Y76.769 E.04079
G1 X102.676 Y77.315
G1 X100.983 Y75.622 E.06018
G1 X100.438 Y75.622
G1 X102.676 Y77.86 E.07958
G1 X102.676 Y78.406
G1 X99.893 Y75.622 E.09897
G1 X99.347 Y75.622
G1 X102.676 Y78.951 E.11836
G1 X102.676 Y79.497
G1 X98.802 Y75.622 E.13776
G1 X98.256 Y75.622
G1 X102.676 Y80.042 E.15715
G1 X102.676 Y80.588
G1 X97.711 Y75.622 E.17654
G1 X97.166 Y75.622
G1 X102.676 Y81.133 E.19594
G1 X102.676 Y81.678
G1 X96.62 Y75.622 E.21533
G1 X96.075 Y75.622
G1 X102.676 Y82.224 E.23472
G1 X102.677 Y82.769
G1 X95.529 Y75.622 E.25412
G1 X94.984 Y75.622
G1 X102.677 Y83.315 E.27351
G1 X102.677 Y83.86
G1 X94.439 Y75.622 E.2929
G1 X93.893 Y75.622
G1 X102.677 Y84.406 E.3123
G1 X102.677 Y84.951
G1 X93.348 Y75.622 E.33169
G1 X92.802 Y75.622
G1 X102.677 Y85.496 E.35109
G1 X102.677 Y86.042
G1 X92.257 Y75.622 E.37048
G1 X91.712 Y75.622
G1 X102.677 Y86.587 E.38987
G1 X102.677 Y87.133
G1 X91.166 Y75.622 E.40927
G1 X90.621 Y75.622
G1 X102.677 Y87.678 E.42866
G1 X102.677 Y88.224
G1 X90.075 Y75.622 E.44805
G1 X89.53 Y75.622
G1 X102.677 Y88.769 E.46745
G1 X102.677 Y89.315
G1 X88.985 Y75.622 E.48684
G1 X88.439 Y75.622
G1 X102.677 Y89.86 E.50623
M73 P20 R7
G1 X102.677 Y90.405
G1 X87.894 Y75.622 E.52563
G1 X87.348 Y75.622
G1 X102.677 Y90.951 E.54502
G1 X102.677 Y91.496
G1 X86.803 Y75.622 E.56441
G1 X86.257 Y75.622
G1 X102.677 Y92.042 E.58381
G1 X102.677 Y92.587
G1 X85.712 Y75.622 E.6032
G1 X85.167 Y75.622
G1 X102.677 Y93.133 E.62259
G1 X102.677 Y93.678
G1 X84.621 Y75.622 E.64199
G1 X84.076 Y75.622
G1 X102.677 Y94.224 E.66138
G1 X102.677 Y94.769
G1 X83.53 Y75.622 E.68077
G1 X82.985 Y75.622
G1 X102.677 Y95.314 E.70017
G1 X102.677 Y95.86
G1 X82.44 Y75.622 E.71956
G1 X81.894 Y75.622
G1 X102.677 Y96.405 E.73895
G1 X102.677 Y96.951
G1 X81.349 Y75.622 E.75835
G1 X80.803 Y75.622
G1 X102.678 Y97.496 E.77774
G1 X102.678 Y98.042
G1 X80.258 Y75.622 E.79713
G1 X79.713 Y75.622
G1 X102.678 Y98.587 E.81653
G1 X102.678 Y99.133
G1 X79.167 Y75.622 E.83592
G1 X78.622 Y75.622
G1 X102.678 Y99.678 E.85531
G1 X102.678 Y100.223
G1 X78.116 Y75.662 E.8733
G1 X77.75 Y75.841
G1 X102.678 Y100.769 E.88631
G1 X102.678 Y101.314
G1 X77.489 Y76.126 E.89558
M73 P21 R7
G1 X77.339 Y76.521
G1 X102.678 Y101.86 E.90094
G1 X102.678 Y102.405
G1 X80.854 Y80.581 E.77597
G1 X80.973 Y81.246
G1 X102.678 Y102.951 E.77172
G1 X102.661 Y103.48
G1 X80.803 Y81.621 E.7772
G1 X80.511 Y81.874
G1 X102.511 Y103.875 E.78223
G1 X102.249 Y104.158
G1 X80.079 Y81.988 E.78827
; WIPE_START
M204 S6000
G1 X81.493 Y83.402 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.551 Y80.278 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X77.322 Y77.049 E.11479
G1 X77.322 Y77.595
G1 X79.888 Y80.161 E.09124
G1 X79.512 Y80.331
G1 X77.322 Y78.14 E.07788
G1 X77.322 Y78.686
G1 X79.261 Y80.625 E.06895
G1 X79.147 Y81.056
G1 X77.322 Y79.231 E.06487
G1 X77.322 Y79.776
G1 X101.884 Y104.338 E.8733
G1 X101.378 Y104.378
G1 X77.322 Y80.322 E.85532
G1 X77.322 Y80.867
G1 X100.833 Y104.378 E.83593
G1 X100.287 Y104.378
G1 X77.322 Y81.413 E.81653
G1 X77.322 Y81.958
G1 X99.742 Y104.378 E.79714
G1 X99.196 Y104.378
G1 X77.322 Y82.504 E.77775
G1 X77.322 Y83.049
G1 X98.651 Y104.378 E.75836
G1 X98.106 Y104.378
G1 X77.322 Y83.594 E.73897
G1 X77.322 Y84.14
G1 X97.56 Y104.378 E.71957
G1 X97.015 Y104.378
G1 X77.322 Y84.685 E.70018
G1 X77.322 Y85.231
G1 X96.469 Y104.378 E.68079
G1 X95.924 Y104.378
M73 P22 R7
G1 X77.322 Y85.776 E.6614
G1 X77.322 Y86.321
G1 X95.379 Y104.378 E.64201
G1 X94.833 Y104.378
G1 X77.322 Y86.867 E.62261
G1 X77.322 Y87.412
G1 X94.288 Y104.378 E.60322
G1 X93.742 Y104.378
G1 X77.322 Y87.958 E.58383
G1 X77.322 Y88.503
G1 X93.197 Y104.378 E.56444
G1 X92.652 Y104.378
G1 X77.322 Y89.048 E.54505
G1 X77.322 Y89.594
G1 X92.106 Y104.378 E.52565
G1 X91.561 Y104.378
G1 X77.322 Y90.139 E.50626
G1 X77.322 Y90.685
G1 X91.015 Y104.378 E.48687
G1 X90.47 Y104.378
G1 X77.322 Y91.23 E.46748
G1 X77.322 Y91.775
G1 X89.925 Y104.378 E.44809
G1 X89.379 Y104.378
G1 X77.322 Y92.321 E.42869
G1 X77.322 Y92.866
G1 X88.834 Y104.378 E.4093
G1 X88.288 Y104.378
G1 X77.322 Y93.412 E.38991
G1 X77.322 Y93.957
G1 X87.743 Y104.378 E.37052
G1 X87.198 Y104.378
G1 X77.322 Y94.502 E.35112
G1 X77.322 Y95.048
G1 X86.652 Y104.378 E.33173
G1 X86.107 Y104.378
G1 X77.322 Y95.593 E.31234
G1 X77.322 Y96.139
G1 X85.561 Y104.378 E.29295
G1 X85.016 Y104.378
G1 X77.322 Y96.684 E.27356
G1 X77.322 Y97.229
G1 X84.471 Y104.378 E.25416
G1 X83.925 Y104.378
G1 X77.322 Y97.775 E.23477
G1 X77.322 Y98.32
G1 X83.38 Y104.378 E.21538
G1 X82.834 Y104.378
G1 X77.322 Y98.866 E.19599
G1 X77.322 Y99.411
G1 X82.289 Y104.378 E.1766
G1 X81.744 Y104.378
G1 X77.322 Y99.956 E.1572
G1 X77.322 Y100.502
G1 X81.198 Y104.378 E.13781
M73 P23 R6
G1 X80.653 Y104.378
G1 X77.322 Y101.047 E.11842
G1 X77.322 Y101.593
G1 X80.107 Y104.378 E.09903
G1 X79.562 Y104.378
G1 X77.322 Y102.138 E.07964
G1 X77.322 Y102.684
G1 X79.016 Y104.378 E.06024
G1 X78.471 Y104.378
G1 X77.322 Y103.229 E.04085
; WIPE_START
M204 S6000
G1 X78.471 Y104.378 E-.61746
G1 X78.846 Y104.378 E-.14254
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.478 Y104.334 Z1.24 F42000
G1 X102.062 Y104.243 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0863768
G1 F18000
M204 S6000
G1 X101.917 Y104.33 E.00057
M204 S10000
G1 X78.137 Y104.361 F42000
; LINE_WIDTH: 0.179994
G1 F18000
M204 S6000
G3 X77.839 Y104.14 I2.913 J-4.249 E.00352
; LINE_WIDTH: 0.213392
G3 X77.494 Y103.777 I1.344 J-1.621 E.00585
; LINE_WIDTH: 0.174357
G1 X77.471 Y103.746 E.00036
; LINE_WIDTH: 0.146732
G1 X77.347 Y103.559 E.00165
; WIPE_START
G1 X77.471 Y103.746 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.571 Y98.067 Z1.24 F42000
G1 X102.417 Y75.97 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.0906088
G1 F18000
M204 S6000
G1 X101.856 Y75.652 E.00236
M204 S10000
G1 X102.661 Y76.437 F42000
; LINE_WIDTH: 0.179961
G1 F18000
M204 S6000
G2 X102.44 Y76.139 I-4.159 J2.842 E.00353
; LINE_WIDTH: 0.213891
G2 X102.082 Y75.798 I-1.612 J1.336 E.0058
; LINE_WIDTH: 0.164574
G1 X101.861 Y75.643 E.00229
; WIPE_START
G1 X102.082 Y75.798 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.633 Y77.459 Z1.24 F42000
G1 X80.918 Y80.517 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.224181
G1 F18000
M204 S6000
G2 X80.614 Y80.215 I-1.727 J1.437 E.00531
; WIPE_START
G1 X80.918 Y80.517 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.194 Y81.359 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.127468
G1 F18000
M204 S6000
G1 X79.072 Y81.13 E.00157
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X79.194 Y81.359 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/50
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.24 I-.863 J.858 P1  F42000
G1 X101.49 Y103.76 Z1.24
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.056 J-.92 E.03459
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.744 E.01247
G1 X101.82 Y75.817 E.00851
G3 X102.51 Y76.694 I-.237 J.896 E.03011
G1 X102.51 Y103.308 E.6691
G3 X102.178 Y104.003 I-.954 J-.029 E.01994
G3 X101.49 Y104.26 I-.88 J-1.307 E.01863
G1 X101.49 Y103.82 E.01107
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z1.4 F42000
G1 X77.493 Y104.216 Z1.4
G1 Z1
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.493 Y104.208 E.0002
G3 X77.11 Y103.295 I.924 J-.924 E.02553
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.6 Y75.41 E.58314
M73 P24 R6
G3 X102.888 Y76.637 I-.016 J1.307 E.0492
G1 X102.89 Y103.295 E.67021
G3 X101.597 Y104.59 I-1.306 J-.011 E.05098
G1 X78.405 Y104.59 E.58307
G3 X77.738 Y104.4 I.011 J-1.306 E.01766
G1 X77.541 Y104.252 E.0062
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.493 Y104.208 E-.02474
G1 X77.295 Y103.965 E-.11882
G1 X77.185 Y103.732 E-.09808
G1 X77.135 Y103.552 E-.07113
G1 X77.11 Y103.295 E-.09809
G1 X77.11 Y102.376 E-.34914
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

G1 X86.21 Y104.175
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2147
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z1.4 F42000
G1 X101.29 Y75.825 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.463615
G1 F2147
M204 S6000
G1 X86.21 Y75.825 E.42199
; WIPE_START
G1 F10482.697
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.53 Y79.516 Z1.4 F42000
G1 X79.952 Y80.388 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2147
M204 S5000
G1 X80.053 Y80.376 E.00227
G3 X79.893 Y80.398 I.017 J.688 E.09311
M204 S250
G1 X79.595 Y80.537 F42000
G1 F2147
M204 S5000
G1 X79.6 Y80.533 E.00014
G3 X80.091 Y80.354 I.471 J.532 E.01196
G1 X80.158 Y80.36 E.00152
G3 X79.504 Y80.637 I-.087 J.705 E.08325
G1 X79.555 Y80.581 E.00168
; WIPE_START
G1 F12000
M204 S6000
G1 X79.6 Y80.533 E-.02515
G1 X79.714 Y80.449 E-.05374
G1 X79.844 Y80.391 E-.05384
G1 X80.091 Y80.354 E-.09497
G1 X80.158 Y80.36 E-.02575
G1 X80.296 Y80.391 E-.05383
G1 X80.425 Y80.449 E-.05374
G1 X80.54 Y80.532 E-.05387
G1 X80.637 Y80.636 E-.05384
G1 X80.711 Y80.757 E-.05379
G1 X80.759 Y80.89 E-.05382
G1 X80.78 Y81.03 E-.05374
G1 X80.773 Y81.171 E-.05379
G1 X80.738 Y81.308 E-.05386
G1 X80.713 Y81.361 E-.0223
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2147
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z1.4 F42000
G1 X85.01 Y97.29 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2147
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/50
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.4 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z1.4
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P25 R6
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.353 Y104.209 E.19252
G3 X77.49 Y103.308 I.059 J-.92 E.03446
G1 X77.49 Y76.695 E.66907
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.744 E.01246
G1 X101.82 Y75.817 E.0085
G3 X102.51 Y76.695 I-.257 J.911 E.03002
G1 X102.51 Y103.305 E.66901
G3 X102.174 Y104.007 I-.978 J-.037 E.02013
G3 X101.49 Y104.26 I-.847 J-1.237 E.01852
G1 X101.49 Y103.82 E.01107
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z1.56 F42000
G1 X77.492 Y104.216 Z1.56
G1 Z1.16
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.493 Y104.208 E.0002
G3 X77.11 Y103.295 I.924 J-.924 E.02553
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.01 E.05105
G1 X101.601 Y75.41 E.58317
G3 X102.888 Y76.637 I-.017 J1.307 E.04916
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
G1 X78.405 Y104.59 E.58301
M73 P26 R6
G3 X77.687 Y104.367 I.011 J-1.307 E.01918
G1 X77.54 Y104.253 E.00469
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.493 Y104.208 E-.02466
G1 X77.326 Y104.015 E-.09688
G1 X77.234 Y103.852 E-.07116
G1 X77.135 Y103.554 E-.11916
G1 X77.11 Y103.295 E-.09907
G1 X77.11 Y102.376 E-.34907
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

G1 X86.21 Y104.175
G1 Z1.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z1.56 F42000
G1 X101.29 Y75.825 Z1.56
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.463585
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42196
; WIPE_START
G1 F10483.439
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.531 Y79.518 Z1.56 F42000
G1 X79.959 Y80.387 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.375 E.00211
G3 X79.9 Y80.397 I.017 J.688 E.09327
M204 S250
G1 X79.596 Y80.536 F42000
G1 F2142
M204 S5000
G1 X79.601 Y80.533 E.00012
G3 X80.092 Y80.355 I.471 J.532 E.01197
G1 X80.158 Y80.36 E.0015
G3 X79.505 Y80.637 I-.087 J.705 E.08325
G1 X79.556 Y80.58 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X79.601 Y80.533 E-.02474
G1 X79.715 Y80.449 E-.05375
G1 X79.843 Y80.391 E-.05372
G1 X80.092 Y80.355 E-.09536
G1 X80.158 Y80.36 E-.02544
G1 X80.297 Y80.391 E-.05381
G1 X80.425 Y80.449 E-.05373
G1 X80.54 Y80.532 E-.05385
G1 X80.637 Y80.636 E-.0538
G1 X80.711 Y80.756 E-.05378
G1 X80.759 Y80.89 E-.05383
G1 X80.78 Y81.03 E-.05377
G1 X80.773 Y81.171 E-.0538
G1 X80.738 Y81.308 E-.05387
G1 X80.712 Y81.362 E-.02275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z1.56 F42000
G1 X85.01 Y97.29 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/50
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.56 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z1.56
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.352 Y104.209 E.19252
G3 X77.49 Y103.305 I.06 J-.92 E.03451
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.744 E.01246
G1 X101.821 Y75.817 E.00851
M73 P27 R6
G3 X102.51 Y76.695 I-.246 J.903 E.03007
G1 X102.51 Y103.305 E.66901
G3 X102.176 Y104.005 I-.953 J-.025 E.02008
G3 X101.49 Y104.26 I-.878 J-1.31 E.01857
G1 X101.49 Y103.82 E.01107
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z1.72 F42000
G1 X77.492 Y104.216 Z1.72
G1 Z1.32
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.492 Y104.208 E.0002
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.6685
G3 X78.405 Y75.41 I1.307 J.012 E.05103
G1 X101.603 Y75.41 E.58321
G3 X102.888 Y76.637 I-.019 J1.306 E.04913
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.307 J-.012 E.05103
G1 X78.405 Y104.59 E.58302
G3 X77.687 Y104.368 I.011 J-1.306 E.01918
G1 X77.54 Y104.253 E.00469
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.02478
G1 X77.328 Y104.016 E-.0959
G1 X77.186 Y103.735 E-.11996
G1 X77.135 Y103.554 E-.0711
G1 X77.11 Y103.295 E-.09915
G1 X77.11 Y102.376 E-.34912
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

G1 X86.21 Y104.175
G1 Z1.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z1.72 F42000
G1 X101.29 Y75.825 Z1.72
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.463554
G1 F2142
M204 S6000
M73 P28 R6
G1 X86.21 Y75.825 E.42193
; WIPE_START
G1 F10484.18
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.531 Y79.519 Z1.72 F42000
G1 X79.961 Y80.387 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.00206
G3 X79.902 Y80.396 I.017 J.688 E.09332
M204 S250
G1 X79.597 Y80.535 F42000
G1 F2142
M204 S5000
G1 X79.601 Y80.533 E.00009
G3 X80.093 Y80.355 I.471 J.532 E.012
G1 X80.158 Y80.36 E.00147
G3 X79.505 Y80.637 I-.086 J.705 E.08325
G1 X79.557 Y80.579 E.00173
; WIPE_START
G1 F12000
M204 S6000
G1 X79.601 Y80.533 E-.02428
G1 X79.714 Y80.449 E-.05372
G1 X79.843 Y80.391 E-.05378
G1 X80.093 Y80.355 E-.09578
G1 X80.158 Y80.36 E-.02498
G1 X80.296 Y80.391 E-.0538
G1 X80.425 Y80.449 E-.05381
G1 X80.54 Y80.532 E-.05379
G1 X80.637 Y80.636 E-.05378
G1 X80.711 Y80.757 E-.05387
G1 X80.759 Y80.89 E-.05378
G1 X80.78 Y81.029 E-.05374
G1 X80.773 Y81.171 E-.05384
G1 X80.738 Y81.308 E-.05382
G1 X80.712 Y81.363 E-.02323
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z1.72 F42000
G1 X85.01 Y97.29 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/50
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.72 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z1.72
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.057 J-.92 E.03458
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.744 E.01248
G1 X101.821 Y75.817 E.00852
G3 X102.51 Y76.692 I-.246 J.903 E.03
G1 X102.51 Y103.306 E.6691
G3 X102.174 Y104.006 I-.953 J-.026 E.02012
G3 X101.49 Y104.261 I-.848 J-1.237 E.01853
G1 X101.49 Y103.82 E.01108
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z1.88 F42000
G1 X77.493 Y104.216 Z1.88
G1 Z1.48
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.492 Y104.208 E.0002
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.307 J.012 E.05103
G1 X101.604 Y75.41 E.58325
M73 P29 R6
G3 X102.888 Y76.637 I-.02 J1.306 E.04909
G1 X102.89 Y103.297 E.67027
G3 X101.595 Y104.59 I-1.306 J-.013 E.05098
G1 X78.403 Y104.59 E.58307
G3 X77.738 Y104.401 I.013 J-1.306 E.01758
G1 X77.54 Y104.252 E.00623
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.02483
G1 X77.323 Y104.009 E-.09916
G1 X77.186 Y103.735 E-.11643
G1 X77.124 Y103.487 E-.09716
G1 X77.11 Y103.295 E-.07328
G1 X77.11 Y102.376 E-.34915
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

G1 X86.21 Y104.175
G1 Z1.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z1.88 F42000
G1 X101.29 Y75.825 Z1.88
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.463534
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42191
; WIPE_START
G1 F10484.675
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.532 Y79.519 Z1.88 F42000
G1 X79.963 Y80.387 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.00201
G3 X79.904 Y80.396 I.017 J.688 E.09336
M204 S250
G1 X79.598 Y80.534 F42000
G1 F2142
M204 S5000
G1 X79.601 Y80.533 E.00007
G3 X80.094 Y80.355 I.471 J.532 E.01201
G1 X80.158 Y80.36 E.00145
G3 X79.505 Y80.637 I-.086 J.705 E.08326
G1 X79.558 Y80.579 E.00176
; WIPE_START
G1 F12000
M204 S6000
G1 X79.601 Y80.533 E-.02385
G1 X79.714 Y80.449 E-.05366
G1 X79.844 Y80.391 E-.05388
G1 X80.094 Y80.355 E-.09599
G1 X80.158 Y80.36 E-.02467
G1 X80.297 Y80.391 E-.05384
G1 X80.425 Y80.449 E-.05377
G1 X80.541 Y80.532 E-.05386
G1 X80.637 Y80.636 E-.05374
G1 X80.711 Y80.756 E-.05379
G1 X80.759 Y80.89 E-.05383
G1 X80.78 Y81.03 E-.05378
G1 X80.766 Y81.208 E-.0681
G1 X80.725 Y81.341 E-.05288
G1 X80.712 Y81.365 E-.01036
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z1.88 F42000
G1 X85.01 Y97.29 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/50
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.88 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z1.88
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
M73 P30 R6
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.308 I.056 J-.92 E.03452
G1 X77.49 Y76.695 E.66907
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.745 E.01245
G1 X101.821 Y75.817 E.00851
G3 X102.51 Y76.692 I-.237 J.896 E.03004
G1 X102.51 Y103.305 E.6691
G3 X102.176 Y104.005 I-.954 J-.026 E.02008
G3 X101.49 Y104.261 I-.877 J-1.306 E.01856
G1 X101.49 Y103.82 E.01108
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z2.04 F42000
G1 X77.492 Y104.216 Z2.04
G1 Z1.64
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.493 Y104.208 E.0002
G3 X77.11 Y103.295 I.924 J-.925 E.02553
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.307 J.012 E.05103
G1 X101.606 Y75.41 E.58328
G3 X102.888 Y76.637 I-.021 J1.306 E.04905
G1 X102.89 Y103.297 E.67027
G3 X101.595 Y104.59 I-1.299 J-.006 E.05106
G1 X78.403 Y104.59 E.58307
M73 P31 R6
G3 X77.687 Y104.367 I.014 J-1.307 E.01911
G1 X77.54 Y104.252 E.0047
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.493 Y104.208 E-.02446
G1 X77.295 Y103.965 E-.11898
G1 X77.185 Y103.732 E-.09804
G1 X77.135 Y103.552 E-.07114
G1 X77.11 Y103.295 E-.09815
G1 X77.11 Y102.376 E-.34923
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

G1 X86.21 Y104.175
G1 Z1.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z2.04 F42000
G1 X101.29 Y75.825 Z2.04
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.463504
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42188
; WIPE_START
G1 F10485.419
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.531 Y79.518 Z2.04 F42000
G1 X79.959 Y80.387 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.00212
G3 X79.9 Y80.397 I.017 J.688 E.09326
M204 S250
G1 X79.598 Y80.533 F42000
G1 F2142
M204 S5000
G1 X79.599 Y80.531 E.00005
G3 X80.054 Y80.354 I.47 J.533 E.01116
G1 X80.09 Y80.354 E.0008
G3 X79.502 Y80.635 I-.021 J.71 E.08477
G1 X79.557 Y80.577 E.00179
; WIPE_START
G1 F12000
M204 S6000
G1 X79.599 Y80.531 E-.02347
G1 X79.714 Y80.449 E-.05384
G1 X79.844 Y80.391 E-.05385
G1 X80.054 Y80.354 E-.08123
G1 X80.09 Y80.354 E-.01358
G1 X80.228 Y80.372 E-.053
G1 X80.362 Y80.417 E-.05376
G1 X80.485 Y80.488 E-.0538
G1 X80.591 Y80.582 E-.05389
G1 X80.677 Y80.694 E-.05379
G1 X80.738 Y80.822 E-.0538
G1 X80.773 Y80.959 E-.05379
G1 X80.78 Y81.1 E-.05378
G1 X80.759 Y81.24 E-.05379
G1 X80.713 Y81.366 E-.05063
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z2.04 F42000
G1 X85.01 Y97.29 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/50
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.04 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z2.04
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19247
G3 X77.49 Y103.305 I.057 J-.92 E.03457
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.744 E.01248
G1 X101.821 Y75.817 E.00853
M73 P32 R6
G3 X102.51 Y76.695 I-.248 J.904 E.03004
G1 X102.51 Y103.308 E.66909
G3 X102.176 Y104.005 I-.957 J-.03 E.02001
G3 X101.49 Y104.261 I-.878 J-1.306 E.01857
G1 X101.49 Y103.82 E.01108
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z2.2 F42000
G1 X77.493 Y104.216 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.493 Y104.208 E.0002
G3 X77.11 Y103.295 I.924 J-.924 E.02552
G1 X77.11 Y76.704 E.66853
G3 X78.405 Y75.41 I1.3 J.006 E.05107
G1 X101.607 Y75.41 E.58332
G3 X102.888 Y76.637 I-.023 J1.306 E.04901
G1 X102.89 Y103.296 E.67026
G3 X101.595 Y104.59 I-1.306 J-.012 E.051
G1 X78.404 Y104.59 E.58305
G3 X77.74 Y104.401 I.012 J-1.306 E.01756
G1 X77.54 Y104.252 E.00627
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.493 Y104.208 E-.02471
G1 X77.294 Y103.963 E-.11972
G1 X77.186 Y103.735 E-.09605
G1 X77.135 Y103.554 E-.07121
G1 X77.11 Y103.295 E-.09909
G1 X77.11 Y102.376 E-.34922
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

G1 X86.21 Y104.175
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z2.2 F42000
G1 X101.29 Y75.825 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.463483
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42186
; WIPE_START
G1 F10485.918
G1 X88.21 Y75.825 E-.76
; WIPE_END
M73 P33 R6
G1 E-.04 F1800
M204 S10000
G1 X81.532 Y79.52 Z2.2 F42000
G1 X79.967 Y80.386 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.00193
G3 X79.908 Y80.395 I.017 J.688 E.09352
M204 S250
G1 X79.599 Y80.532 F42000
G1 F2142
M204 S5000
G3 X80.054 Y80.354 I.469 J.531 E.01115
G1 X80.091 Y80.354 E.00082
G3 X79.556 Y80.573 I-.023 J.708 E.08624
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y80.449 E-.07642
G1 X79.844 Y80.391 E-.05386
G1 X80.054 Y80.354 E-.08117
G1 X80.091 Y80.354 E-.01398
G1 X80.228 Y80.372 E-.05269
G1 X80.362 Y80.417 E-.05373
G1 X80.485 Y80.488 E-.05384
G1 X80.591 Y80.581 E-.05378
G1 X80.677 Y80.694 E-.05378
G1 X80.738 Y80.822 E-.05379
G1 X80.773 Y80.959 E-.05382
G1 X80.78 Y81.1 E-.05375
G1 X80.759 Y81.24 E-.05386
G1 X80.713 Y81.368 E-.05153
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z2.2 F42000
G1 X85.01 Y97.29 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/50
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.2 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z2.2
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.057 J-.92 E.03458
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.744 E.01248
G1 X101.821 Y75.817 E.00852
G3 X102.51 Y76.692 I-.246 J.903 E.02999
G1 X102.51 Y103.305 E.66909
G3 X102.174 Y104.006 I-.977 J-.037 E.02011
G3 X101.49 Y104.261 I-.85 J-1.239 E.01854
G1 X101.49 Y103.82 E.01108
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z2.36 F42000
G1 X77.492 Y104.215 Z2.36
G1 Z1.96
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.489 Y104.208 E.0002
G3 X77.11 Y103.295 I.92 J-.917 E.0255
G1 X77.11 Y76.705 E.6685
G3 X78.405 Y75.41 I1.299 J.004 E.05111
G1 X101.609 Y75.41 E.58336
M73 P34 R5
G3 X102.888 Y76.637 I-.025 J1.306 E.04898
G1 X102.89 Y103.297 E.67026
G3 X101.595 Y104.59 I-1.306 J-.013 E.05099
G1 X78.405 Y104.59 E.58302
G3 X77.685 Y104.37 I.004 J-1.299 E.0192
G1 X77.539 Y104.253 E.00471
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.489 Y104.208 E-.02561
G1 X77.294 Y103.963 E-.11893
G1 X77.186 Y103.734 E-.09605
G1 X77.135 Y103.554 E-.07111
G1 X77.11 Y103.295 E-.09912
G1 X77.11 Y102.376 E-.34918
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

G1 X86.21 Y104.175
G1 Z1.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z2.36 F42000
G1 X101.29 Y75.825 Z2.36
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.463453
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42183
; WIPE_START
G1 F10486.658
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.534 Y79.524 Z2.36 F42000
G1 X79.986 Y80.381 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.058 Y80.376 E.00162
G3 X79.926 Y80.391 I.015 J.688 E.09375
M204 S250
G1 X79.599 Y80.531 F42000
G1 F2142
M204 S5000
G3 X80.054 Y80.354 I.469 J.532 E.01115
G1 X80.092 Y80.354 E.00085
G3 X79.556 Y80.573 I-.024 J.709 E.08637
; WIPE_START
G1 F12000
M204 S6000
G1 X79.715 Y80.449 E-.07644
G1 X79.844 Y80.391 E-.05386
G1 X80.054 Y80.354 E-.0811
G1 X80.092 Y80.354 E-.0144
G1 X80.228 Y80.372 E-.05224
G1 X80.363 Y80.417 E-.05389
G1 X80.485 Y80.488 E-.05372
G1 X80.591 Y80.581 E-.05378
G1 X80.677 Y80.694 E-.05388
G1 X80.738 Y80.822 E-.05375
G1 X80.773 Y80.959 E-.05387
G1 X80.78 Y81.098 E-.0528
G1 X80.725 Y81.341 E-.09474
G1 X80.711 Y81.368 E-.01155
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z2.36 F42000
G1 X85.01 Y97.29 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/50
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.36 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z2.36
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
M73 P35 R5
G3 X77.49 Y103.305 I.057 J-.92 E.03458
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.744 E.01248
G1 X101.821 Y75.817 E.00853
G3 X102.51 Y76.692 I-.26 J.913 E.02991
G1 X102.51 Y103.305 E.66909
G3 X102.176 Y104.005 I-.973 J-.035 E.02006
G3 X101.49 Y104.261 I-.875 J-1.301 E.01857
G1 X101.49 Y103.82 E.01108
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z2.52 F42000
G1 X77.492 Y104.215 Z2.52
G1 Z2.12
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.492 Y104.208 E.0002
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.011 E.05104
G1 X101.61 Y75.41 E.5834
G3 X102.888 Y76.637 I-.026 J1.306 E.04894
G1 X102.89 Y103.295 E.67021
G3 X101.595 Y104.59 I-1.306 J-.011 E.05104
G1 X78.405 Y104.59 E.58301
M73 P36 R5
G3 X77.738 Y104.401 I.011 J-1.306 E.01764
G1 X77.54 Y104.252 E.00623
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.02471
G1 X77.294 Y103.963 E-.11967
G1 X77.186 Y103.735 E-.09606
G1 X77.135 Y103.554 E-.0712
G1 X77.11 Y103.295 E-.0991
G1 X77.11 Y102.376 E-.34925
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

G1 X86.21 Y104.175
G1 Z2.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z2.52 F42000
G1 X101.29 Y75.825 Z2.52
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.463433
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42181
; WIPE_START
G1 F10487.149
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.538 Y79.53 Z2.52 F42000
G1 X80.005 Y80.382 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.00108
G3 X79.917 Y80.393 I.017 J.689 E.09383
G1 X79.945 Y80.389 E.00065
M204 S250
G1 X79.602 Y80.531 F42000
G1 F2142
M204 S5000
G1 X79.714 Y80.448 E.00312
G3 X80.054 Y80.354 I.354 J.615 E.00798
G1 X80.092 Y80.354 E.00086
G3 X79.557 Y80.571 I-.025 J.709 E.08641
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y80.448 E-.07549
G1 X79.844 Y80.391 E-.05386
G1 X80.054 Y80.354 E-.08113
G1 X80.092 Y80.354 E-.01466
G1 X80.228 Y80.372 E-.05204
G1 X80.362 Y80.417 E-.05375
G1 X80.485 Y80.488 E-.0538
G1 X80.591 Y80.581 E-.05379
G1 X80.677 Y80.694 E-.05379
G1 X80.738 Y80.822 E-.05381
G1 X80.773 Y80.959 E-.05383
G1 X80.78 Y81.098 E-.05282
G1 X80.725 Y81.341 E-.09472
G1 X80.709 Y81.37 E-.01251
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z2.52 F42000
G1 X85.01 Y97.29 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/50
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.52 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z2.52
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.353 Y104.209 E.19252
G3 X77.49 Y103.305 I.059 J-.92 E.03452
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.733 E.01273
G1 X101.901 Y75.841 E.01067
M73 P37 R5
G3 X102.51 Y76.692 I-.306 J.863 E.02802
G1 X102.51 Y103.305 E.66909
G3 X102.176 Y104.005 I-.954 J-.025 E.02009
G3 X101.49 Y104.261 I-.877 J-1.303 E.01857
G1 X101.49 Y103.82 E.01109
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z2.68 F42000
G1 X77.492 Y104.215 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.494 Y104.207 E.0002
G3 X77.11 Y103.295 I.925 J-.926 E.02553
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.011 E.05104
G1 X101.612 Y75.41 E.58343
G3 X102.888 Y76.637 I-.027 J1.306 E.0489
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.308 J-.013 E.05102
G1 X78.405 Y104.59 E.58301
G3 X77.74 Y104.401 I.013 J-1.308 E.0176
G1 X77.54 Y104.251 E.00627
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.494 Y104.207 E-.0244
G1 X77.326 Y104.015 E-.09707
G1 X77.186 Y103.734 E-.1191
G1 X77.135 Y103.554 E-.07117
G1 X77.11 Y103.295 E-.09905
G1 X77.11 Y102.376 E-.34921
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

G1 X86.21 Y104.175
G1 Z2.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z2.68 F42000
G1 X101.29 Y75.825 Z2.68
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.463412
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42179
; WIPE_START
G1 F10487.649
G1 X88.21 Y75.825 E-.76
; WIPE_END
M73 P38 R5
G1 E-.04 F1800
M204 S10000
G1 X81.538 Y79.531 Z2.68 F42000
G1 X80.007 Y80.381 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.00103
G3 X79.917 Y80.393 I.017 J.688 E.09365
G1 X79.948 Y80.389 E.0007
M204 S250
G1 X79.603 Y80.53 F42000
G1 F2142
M204 S5000
G1 X79.714 Y80.448 E.00309
G3 X80.054 Y80.354 I.354 J.616 E.00797
G1 X80.094 Y80.354 E.00089
G3 X79.558 Y80.569 I-.026 J.71 E.08661
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y80.448 E-.07496
G1 X79.843 Y80.391 E-.05375
G1 X80.054 Y80.354 E-.08115
G1 X80.094 Y80.354 E-.01508
G1 X80.228 Y80.372 E-.05166
G1 X80.362 Y80.417 E-.05378
G1 X80.485 Y80.488 E-.05376
G1 X80.591 Y80.581 E-.05383
G1 X80.677 Y80.694 E-.05381
G1 X80.738 Y80.822 E-.05378
G1 X80.773 Y80.959 E-.05385
G1 X80.78 Y81.1 E-.05376
G1 X80.759 Y81.241 E-.05383
G1 X80.711 Y81.372 E-.05299
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z2.68 F42000
G1 X85.01 Y97.29 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/50
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.68 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z2.68
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.056 J-.92 E.03459
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.733 E.01274
G1 X101.901 Y75.841 E.01068
G3 X102.51 Y76.692 I-.306 J.863 E.02801
G1 X102.51 Y103.305 E.66909
G3 X102.176 Y104.005 I-.959 J-.028 E.02008
G3 X101.49 Y104.261 I-.879 J-1.306 E.01857
G1 X101.49 Y103.82 E.0111
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z2.84 F42000
G1 X77.492 Y104.215 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.493 Y104.208 E.00019
G3 X77.11 Y103.295 I.923 J-.923 E.02553
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.308 J.013 E.05102
G1 X101.613 Y75.41 E.58347
M73 P39 R5
G3 X102.888 Y76.637 I-.029 J1.306 E.04885
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
G1 X78.405 Y104.59 E.58301
G3 X77.687 Y104.368 I.01 J-1.306 E.01918
G1 X77.539 Y104.252 E.00471
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.493 Y104.208 E-.02458
G1 X77.295 Y103.966 E-.11877
G1 X77.186 Y103.734 E-.09716
G1 X77.135 Y103.554 E-.07109
G1 X77.11 Y103.295 E-.09912
G1 X77.11 Y102.375 E-.34929
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

G1 X86.21 Y104.175
G1 Z2.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z2.84 F42000
G1 X101.29 Y75.825 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.463382
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42176
; WIPE_START
G1 F10488.392
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.538 Y79.532 Z2.84 F42000
G1 X80.009 Y80.381 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.00098
G3 X79.917 Y80.393 I.017 J.688 E.09365
G1 X79.95 Y80.388 E.00075
M204 S250
G1 X79.599 Y80.531 F42000
G1 F2142
M204 S5000
G3 X80.054 Y80.354 I.469 J.534 E.01115
G1 X80.095 Y80.355 E.00091
G3 X79.555 Y80.572 I-.027 J.71 E.08649
; WIPE_START
G1 F12000
M204 S6000
G1 X79.715 Y80.449 E-.07644
G1 X79.844 Y80.391 E-.05381
G1 X80.054 Y80.354 E-.08108
G1 X80.095 Y80.355 E-.01552
G1 X80.228 Y80.372 E-.05124
G1 X80.363 Y80.417 E-.05381
G1 X80.485 Y80.488 E-.05377
G1 X80.591 Y80.581 E-.05382
G1 X80.677 Y80.694 E-.05382
G1 X80.738 Y80.822 E-.0538
G1 X80.773 Y80.959 E-.05384
G1 X80.78 Y81.1 E-.05375
G1 X80.759 Y81.24 E-.05373
G1 X80.713 Y81.368 E-.05159
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z2.84 F42000
G1 X85.01 Y97.29 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/50
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.84 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z2.84
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
M73 P40 R5
G3 X77.49 Y103.305 I.057 J-.92 E.03458
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.733 E.01276
G1 X101.901 Y75.841 E.01069
G3 X102.51 Y76.692 I-.306 J.862 E.028
G1 X102.51 Y103.305 E.6691
G3 X102.175 Y104.005 I-.954 J-.026 E.02008
G3 X101.49 Y104.262 I-.88 J-1.308 E.01857
G1 X101.49 Y103.82 E.01111
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z3 F42000
G1 X77.492 Y104.215 Z3
G1 Z2.6
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.492 Y104.208 E.0002
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.011 E.05105
G1 X101.615 Y75.41 E.58351
G3 X102.888 Y76.637 I-.03 J1.306 E.04883
G1 X102.89 Y103.295 E.67021
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
G1 X78.405 Y104.59 E.58301
M73 P41 R5
G3 X77.687 Y104.368 I.01 J-1.306 E.01918
G1 X77.539 Y104.252 E.00471
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.02469
G1 X77.328 Y104.017 E-.09582
G1 X77.186 Y103.734 E-.12001
G1 X77.132 Y103.536 E-.07824
G1 X77.11 Y103.295 E-.09197
G1 X77.11 Y102.375 E-.34927
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

G1 X86.21 Y104.175
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z3 F42000
G1 X101.29 Y75.825 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.463352
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42173
; WIPE_START
G1 F10489.133
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.539 Y79.532 Z3 F42000
G1 X80.011 Y80.381 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.375 E.00093
G3 X79.916 Y80.393 I.017 J.688 E.09364
G1 X79.952 Y80.388 E.0008
M204 S250
G1 X79.605 Y80.528 F42000
G1 F2142
M204 S5000
G1 X79.714 Y80.448 E.00302
G3 X80.054 Y80.354 I.353 J.616 E.00797
G1 X80.095 Y80.355 E.00094
G3 X79.56 Y80.567 I-.028 J.71 E.08663
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y80.448 E-.07379
G1 X79.844 Y80.391 E-.05382
G1 X80.054 Y80.354 E-.08107
G1 X80.095 Y80.355 E-.01588
G1 X80.228 Y80.372 E-.05086
G1 X80.362 Y80.417 E-.05378
G1 X80.485 Y80.488 E-.0538
G1 X80.591 Y80.581 E-.05382
G1 X80.677 Y80.694 E-.05384
G1 X80.738 Y80.822 E-.0538
G1 X80.773 Y80.959 E-.05382
G1 X80.78 Y81.1 E-.05379
G1 X80.759 Y81.24 E-.05369
G1 X80.711 Y81.373 E-.05389
G1 X80.71 Y81.374 E-.00035
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z3 F42000
G1 X85.01 Y97.29 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/50
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z3
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2143
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.056 J-.92 E.03459
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.733 E.01274
G1 X101.901 Y75.841 E.01068
M73 P42 R5
G3 X102.51 Y76.695 I-.306 J.862 E.02808
G1 X102.51 Y103.305 E.66903
G3 X102.175 Y104.005 I-.977 J-.037 E.02005
G3 X101.49 Y104.261 I-.877 J-1.302 E.01857
G1 X101.49 Y103.82 E.01109
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z3.16 F42000
G1 X77.492 Y104.215 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F2143
M204 S5000
G1 X77.492 Y104.208 E.0002
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.011 E.05104
G1 X101.616 Y75.411 E.58355
G3 X102.888 Y76.634 I-.032 J1.306 E.04873
G1 X102.89 Y103.295 E.67027
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
G1 X78.405 Y104.59 E.58301
G3 X77.689 Y104.369 I.01 J-1.306 E.01912
G1 X77.539 Y104.252 E.00477
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.02466
G1 X77.317 Y103.999 E-.10347
G1 X77.186 Y103.735 E-.11226
G1 X77.132 Y103.534 E-.07882
G1 X77.11 Y103.295 E-.09147
G1 X77.11 Y102.375 E-.34933
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

G1 X86.21 Y104.175
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2143
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z3.16 F42000
G1 X101.29 Y75.825 Z3.16
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.463341
G1 F2143
M204 S6000
G1 X86.21 Y75.825 E.42172
; WIPE_START
G1 F10489.385
G1 X88.21 Y75.825 E-.76
; WIPE_END
M73 P43 R5
G1 E-.04 F1800
M204 S10000
G1 X81.54 Y79.534 Z3.16 F42000
G1 X80.021 Y80.379 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2143
M204 S5000
G1 X80.058 Y80.376 E.00082
G3 X79.962 Y80.385 I.015 J.688 E.09455
M204 S250
G1 X79.607 Y80.527 F42000
G1 F2143
M204 S5000
G1 X79.714 Y80.448 E.00298
G3 X80.054 Y80.354 I.353 J.616 E.00797
G1 X80.096 Y80.355 E.00096
G3 X79.561 Y80.566 I-.029 J.71 E.08665
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y80.448 E-.07325
G1 X79.844 Y80.391 E-.05384
G1 X80.054 Y80.354 E-.08099
G1 X80.096 Y80.355 E-.01629
G1 X80.228 Y80.372 E-.05055
G1 X80.362 Y80.417 E-.05374
G1 X80.485 Y80.488 E-.05386
G1 X80.591 Y80.581 E-.05379
G1 X80.677 Y80.694 E-.05373
G1 X80.738 Y80.822 E-.05384
G1 X80.773 Y80.959 E-.05384
G1 X80.78 Y81.1 E-.05377
G1 X80.759 Y81.24 E-.05376
G1 X80.711 Y81.374 E-.05384
G1 X80.709 Y81.375 E-.00091
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2143
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2143
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z3.16 F42000
G1 X85.01 Y97.29 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2143
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2143
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/50
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.16 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z3.16
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.354 Y104.209 E.19247
G3 X77.49 Y103.305 I.058 J-.92 E.03456
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.743 E.01248
G1 X101.821 Y75.817 E.00853
G3 X102.51 Y76.692 I-.261 J.914 E.02989
G1 X102.51 Y103.305 E.6691
G3 X102.176 Y104.005 I-.953 J-.025 E.02009
G3 X101.49 Y104.261 I-.873 J-1.295 E.01857
G1 X101.49 Y103.82 E.01108
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z3.32 F42000
G1 X77.492 Y104.215 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.489 Y104.211 E.00014
G3 X77.11 Y103.295 I.915 J-.915 E.02558
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.294 J-.001 E.05117
G1 X101.618 Y75.411 E.58359
M73 P44 R5
G3 X102.888 Y76.637 I-.033 J1.306 E.04874
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
G1 X78.405 Y104.59 E.58301
G3 X77.684 Y104.371 I-.001 J-1.294 E.01923
G1 X77.539 Y104.253 E.00471
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.489 Y104.211 E-.02477
G1 X77.317 Y104.001 E-.10319
G1 X77.186 Y103.735 E-.11278
G1 X77.135 Y103.554 E-.07116
G1 X77.11 Y103.295 E-.0991
G1 X77.11 Y102.376 E-.349
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

G1 X86.21 Y104.175
G1 Z2.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z3.32 F42000
G1 X101.29 Y75.825 Z3.32
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.463311
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42169
; WIPE_START
G1 F10490.129
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.54 Y79.535 Z3.32 F42000
G1 X80.022 Y80.379 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.375 E.00069
G3 X79.916 Y80.393 I.017 J.688 E.09371
G1 X79.963 Y80.387 E.00104
M204 S250
G1 X79.608 Y80.526 F42000
G1 F2142
M204 S5000
G1 X79.714 Y80.448 E.00294
G3 X80.053 Y80.354 I.353 J.617 E.00797
G1 X80.097 Y80.355 E.00098
G3 X79.562 Y80.564 I-.03 J.71 E.08666
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y80.448 E-.07259
G1 X79.843 Y80.391 E-.05381
G1 X80.053 Y80.354 E-.08104
G1 X80.097 Y80.355 E-.01667
G1 X80.228 Y80.372 E-.0502
G1 X80.362 Y80.417 E-.05378
G1 X80.485 Y80.488 E-.05376
G1 X80.591 Y80.581 E-.0538
G1 X80.677 Y80.694 E-.05383
G1 X80.738 Y80.822 E-.05378
G1 X80.773 Y80.959 E-.05384
G1 X80.78 Y81.1 E-.05379
G1 X80.759 Y81.241 E-.05383
G1 X80.711 Y81.374 E-.05379
G1 X80.708 Y81.377 E-.0015
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z3.32 F42000
G1 X85.01 Y97.29 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/50
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.32 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z3.32
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.354 Y104.209 E.19248
M73 P45 R4
G3 X77.49 Y103.305 I.058 J-.92 E.03456
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.743 E.01249
G1 X101.822 Y75.817 E.00854
G3 X102.51 Y76.692 I-.238 J.895 E.03001
G1 X102.51 Y103.305 E.6691
G3 X102.176 Y104.005 I-.971 J-.034 E.02007
G3 X101.49 Y104.261 I-.876 J-1.299 E.01857
G1 X101.49 Y103.82 E.0111
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.951 Z3.48 F42000
G1 X77.492 Y104.213 Z3.48
G1 Z3.08
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.474 Y104.197 E.00061
G3 X77.11 Y103.295 I.928 J-.899 E.02508
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.292 J-.003 E.05119
G1 X101.619 Y75.411 E.58362
G3 X102.888 Y76.637 I-.035 J1.306 E.04871
G1 X102.89 Y103.295 E.67022
G3 X101.597 Y104.59 I-1.292 J.003 E.05113
G1 X78.405 Y104.59 E.58307
G3 X77.684 Y104.372 I-.003 J-1.292 E.01922
M73 P46 R4
G1 X77.539 Y104.251 E.00476
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.474 Y104.197 E-.032
G1 X77.294 Y103.963 E-.11224
G1 X77.186 Y103.735 E-.09597
G1 X77.131 Y103.532 E-.07993
G1 X77.11 Y103.295 E-.09039
G1 X77.11 Y102.375 E-.34946
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

G1 X86.21 Y104.175
G1 Z3.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z3.48 F42000
G1 X101.29 Y75.825 Z3.48
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.463281
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42166
; WIPE_START
G1 F10490.869
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.54 Y79.534 Z3.48 F42000
G1 X80.018 Y80.38 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.00078
G3 X79.921 Y80.392 I.019 J.688 E.09383
G1 X79.959 Y80.387 E.00084
M204 S250
G1 X79.609 Y80.525 F42000
G1 F2142
M204 S5000
G1 X79.714 Y80.448 E.00291
G3 X80.053 Y80.354 I.353 J.615 E.00796
G1 X80.098 Y80.355 E.00101
G3 X79.564 Y80.564 I-.031 J.709 E.08648
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y80.448 E-.07202
G1 X79.844 Y80.391 E-.05383
G1 X80.053 Y80.354 E-.08095
G1 X80.098 Y80.355 E-.0171
G1 X80.228 Y80.372 E-.0498
G1 X80.362 Y80.417 E-.05375
G1 X80.485 Y80.488 E-.05385
G1 X80.591 Y80.581 E-.05379
G1 X80.677 Y80.694 E-.05375
G1 X80.738 Y80.822 E-.05387
G1 X80.773 Y80.959 E-.05381
G1 X80.78 Y81.1 E-.05376
G1 X80.759 Y81.24 E-.0538
G1 X80.711 Y81.373 E-.05378
G1 X80.708 Y81.378 E-.00215
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z3.48 F42000
G1 X85.01 Y97.29 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/50
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.48 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z3.48
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.056 J-.92 E.03459
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.733 E.01275
G1 X101.901 Y75.841 E.01069
M73 P47 R4
G3 X102.51 Y76.692 I-.311 J.866 E.028
G1 X102.51 Y103.305 E.66907
G3 X102.176 Y104.005 I-.954 J-.025 E.02009
G3 X101.49 Y104.262 I-.876 J-1.298 E.01858
G1 X101.49 Y103.82 E.0111
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z3.64 F42000
G1 X77.498 Y104.215 Z3.64
G1 Z3.24
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.367 Y104.066 E.00498
G3 X77.11 Y103.295 I1.042 J-.775 E.0208
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.291 J-.004 E.0512
G1 X101.621 Y75.411 E.58366
G3 X102.888 Y76.637 I-.036 J1.306 E.04867
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.299 J-.003 E.05112
G1 X78.405 Y104.59 E.58301
G3 X77.541 Y104.257 I.003 J-1.299 E.02382
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.367 Y104.066 E-.09806
G1 X77.234 Y103.851 E-.09599
G1 X77.148 Y103.612 E-.09664
G1 X77.11 Y103.295 E-.12148
G1 X77.11 Y102.379 E-.34782
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

G1 X86.21 Y104.175
G1 Z3.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z3.64 F42000
G1 X101.29 Y75.825 Z3.64
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.46326
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42164
; WIPE_START
G1 F10491.369
G1 X88.21 Y75.825 E-.76
; WIPE_END
M73 P48 R4
G1 E-.04 F1800
M204 S10000
G1 X81.54 Y79.535 Z3.64 F42000
G1 X80.021 Y80.38 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.00073
G3 X79.917 Y80.393 I.017 J.688 E.09365
G1 X79.961 Y80.387 E.001
M204 S250
G1 X79.61 Y80.524 F42000
G1 F2142
M204 S5000
G1 X79.714 Y80.448 E.00287
G3 X80.053 Y80.354 I.353 J.617 E.00797
G1 X80.099 Y80.355 E.00103
G3 X79.565 Y80.562 I-.032 J.71 E.08669
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y80.448 E-.07139
G1 X79.844 Y80.391 E-.05382
G1 X80.053 Y80.354 E-.08098
G1 X80.099 Y80.355 E-.01742
G1 X80.228 Y80.372 E-.04936
G1 X80.363 Y80.417 E-.05391
G1 X80.485 Y80.488 E-.05373
G1 X80.591 Y80.581 E-.05378
G1 X80.677 Y80.694 E-.05388
G1 X80.738 Y80.822 E-.05375
G1 X80.773 Y80.959 E-.05384
G1 X80.78 Y81.1 E-.05378
G1 X80.759 Y81.24 E-.05376
G1 X80.711 Y81.374 E-.05387
G1 X80.706 Y81.379 E-.00271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z3.64 F42000
G1 X85.01 Y97.29 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/50
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.64 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z3.64
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.063 J-.926 E.03453
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.733 E.01275
G1 X101.901 Y75.841 E.01069
G3 X102.51 Y76.692 I-.306 J.862 E.02802
G1 X102.51 Y103.305 E.66907
G3 X102.176 Y104.005 I-.954 J-.025 E.02009
G3 X101.49 Y104.261 I-.875 J-1.296 E.01857
G1 X101.49 Y103.82 E.0111
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z3.8 F42000
G1 X77.492 Y104.215 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.486 Y104.21 E.00019
G3 X77.11 Y103.295 I.915 J-.911 E.02554
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.291 J-.004 E.0512
G1 X101.622 Y75.411 E.5837
M73 P49 R4
G3 X102.888 Y76.637 I-.038 J1.306 E.04864
G1 X102.89 Y103.295 E.67021
G3 X101.595 Y104.59 I-1.291 J.004 E.0512
G1 X78.405 Y104.59 E.58301
G3 X77.684 Y104.372 I-.004 J-1.291 E.01923
G1 X77.538 Y104.253 E.00474
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.486 Y104.21 E-.02561
G1 X77.295 Y103.965 E-.11804
G1 X77.186 Y103.734 E-.09707
G1 X77.135 Y103.554 E-.07111
G1 X77.11 Y103.295 E-.09911
G1 X77.11 Y102.376 E-.34906
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

G1 X86.21 Y104.175
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z3.8 F42000
G1 X101.29 Y75.825 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.46323
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42161
; WIPE_START
G1 F10492.109
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.541 Y79.536 Z3.8 F42000
G1 X80.027 Y80.379 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.00058
G3 X79.916 Y80.393 I.017 J.688 E.09365
G1 X79.968 Y80.386 E.00115
M204 S250
G1 X79.612 Y80.523 F42000
G1 F2142
M204 S5000
G1 X79.714 Y80.448 E.00283
G3 X80.053 Y80.354 I.353 J.616 E.00796
G1 X80.1 Y80.355 E.00105
G3 X79.566 Y80.561 I-.033 J.71 E.08671
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y80.448 E-.07077
G1 X79.843 Y80.391 E-.05379
G1 X80.053 Y80.354 E-.081
G1 X80.1 Y80.355 E-.01781
G1 X80.228 Y80.372 E-.04906
G1 X80.362 Y80.417 E-.05383
G1 X80.485 Y80.488 E-.05376
G1 X80.591 Y80.581 E-.0538
G1 X80.677 Y80.694 E-.0538
G1 X80.738 Y80.822 E-.05385
G1 X80.773 Y80.959 E-.05382
G1 X80.78 Y81.1 E-.05378
G1 X80.759 Y81.24 E-.05376
G1 X80.711 Y81.374 E-.05385
G1 X80.705 Y81.381 E-.00334
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z3.8 F42000
G1 X85.01 Y97.29 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/50
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.8 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z3.8
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
M73 P50 R4
G3 X77.49 Y103.305 I.056 J-.92 E.03458
G1 X77.49 Y76.695 E.66903
G3 X78.395 Y75.79 I.92 J.016 E.03557
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.733 E.01274
G1 X101.901 Y75.841 E.01069
G3 X102.51 Y76.691 I-.306 J.862 E.02799
G1 X102.51 Y103.305 E.6691
G3 X102.176 Y104.005 I-.954 J-.025 E.02009
G3 X101.49 Y104.261 I-.873 J-1.291 E.01857
G1 X101.49 Y103.82 E.01109
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z3.96 F42000
G1 X77.492 Y104.215 Z3.96
G1 Z3.56
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.489 Y104.211 E.00013
G3 X77.11 Y103.295 I.915 J-.915 E.02558
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.623 Y75.411 E.58373
G3 X102.888 Y76.637 I-.039 J1.306 E.0486
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.294 J-.002 E.0511
G1 X78.405 Y104.59 E.58301
G3 X77.686 Y104.373 I-.001 J-1.294 E.01916
G1 X77.539 Y104.253 E.00478
; WIPE_START
M73 P51 R4
G1 F11668.197
M204 S6000
G1 X77.489 Y104.211 E-.02466
G1 X77.314 Y103.996 E-.10537
G1 X77.186 Y103.735 E-.11058
G1 X77.131 Y103.527 E-.08152
G1 X77.11 Y103.295 E-.08875
G1 X77.11 Y102.376 E-.34912
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

G1 X86.21 Y104.175
G1 Z3.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z3.96 F42000
G1 X101.29 Y75.825 Z3.96
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.46321
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42159
; WIPE_START
G1 F10492.609
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.541 Y79.536 Z3.96 F42000
G1 X80.025 Y80.379 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.00062
G3 X79.916 Y80.393 I.017 J.688 E.09365
G1 X79.966 Y80.386 E.00111
M204 S250
G1 X79.613 Y80.522 F42000
G1 F2142
M204 S5000
G1 X79.714 Y80.448 E.0028
G3 X80.053 Y80.354 I.353 J.617 E.00796
G1 X80.101 Y80.355 E.00107
G3 X79.567 Y80.56 I-.034 J.71 E.08672
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y80.448 E-.07016
G1 X79.843 Y80.391 E-.05377
G1 X80.053 Y80.354 E-.08095
G1 X80.101 Y80.355 E-.01824
G1 X80.228 Y80.372 E-.04868
G1 X80.362 Y80.417 E-.05382
G1 X80.485 Y80.488 E-.05372
G1 X80.591 Y80.581 E-.05383
G1 X80.677 Y80.694 E-.05379
G1 X80.738 Y80.822 E-.05381
G1 X80.773 Y80.959 E-.05379
G1 X80.78 Y81.1 E-.05384
G1 X80.759 Y81.24 E-.05377
G1 X80.711 Y81.373 E-.05383
G1 X80.705 Y81.382 E-.00401
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z3.96 F42000
G1 X85.01 Y97.29 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/50
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.96 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z3.96
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.056 J-.92 E.03459
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.743 E.0125
G1 X101.822 Y75.817 E.00855
M73 P52 R4
G3 X102.51 Y76.691 I-.252 J.906 E.02992
G1 X102.51 Y103.305 E.66911
G3 X102.176 Y104.005 I-.954 J-.026 E.02008
G3 X101.49 Y104.261 I-.872 J-1.29 E.01857
G1 X101.49 Y103.82 E.01109
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z4.12 F42000
G1 X77.492 Y104.215 Z4.12
G1 Z3.72
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.492 Y104.208 E.00019
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.293 J-.003 E.05119
G1 X101.625 Y75.411 E.58377
G3 X102.888 Y76.637 I-.041 J1.306 E.04856
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.306 J-.013 E.05098
G1 X78.405 Y104.59 E.58301
G3 X77.687 Y104.368 I.01 J-1.306 E.01917
G1 X77.539 Y104.252 E.00472
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.02454
G1 X77.328 Y104.016 E-.09592
G1 X77.186 Y103.734 E-.11998
G1 X77.135 Y103.554 E-.07111
G1 X77.11 Y103.295 E-.0991
G1 X77.11 Y102.375 E-.34936
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

G1 X86.21 Y104.175
G1 Z3.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z4.12 F42000
G1 X101.29 Y75.825 Z4.12
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.463179
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42156
; WIPE_START
G1 F10493.35
G1 X88.21 Y75.825 E-.76
; WIPE_END
M73 P53 R4
G1 E-.04 F1800
M204 S10000
G1 X81.541 Y79.536 Z4.12 F42000
G1 X80.028 Y80.378 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.058 Y80.376 E.00065
G3 X79.969 Y80.384 I.015 J.688 E.09472
M204 S250
G1 X79.615 Y80.521 F42000
G1 F2142
M204 S5000
G1 X79.714 Y80.448 E.00276
G3 X80.053 Y80.354 I.353 J.614 E.00796
G1 X80.102 Y80.355 E.00109
G3 X79.569 Y80.559 I-.035 J.707 E.0864
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y80.448 E-.06946
G1 X79.844 Y80.391 E-.0539
G1 X80.053 Y80.354 E-.08087
G1 X80.102 Y80.355 E-.01858
G1 X80.228 Y80.372 E-.04831
G1 X80.362 Y80.417 E-.05377
G1 X80.485 Y80.488 E-.05387
G1 X80.591 Y80.581 E-.05373
G1 X80.677 Y80.694 E-.05386
G1 X80.738 Y80.822 E-.05383
G1 X80.773 Y80.959 E-.05378
G1 X80.78 Y81.1 E-.05376
G1 X80.759 Y81.24 E-.05382
G1 X80.711 Y81.373 E-.05377
G1 X80.704 Y81.384 E-.00469
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z4.12 F42000
G1 X85.01 Y97.29 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/50
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.12 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z4.12
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.057 J-.92 E.03459
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.733 E.01274
G1 X101.901 Y75.841 E.01069
G3 X102.51 Y76.695 I-.319 J.871 E.02802
G1 X102.51 Y103.305 E.66903
G3 X102.175 Y104.005 I-.954 J-.026 E.02009
G3 X101.49 Y104.261 I-.87 J-1.286 E.01857
G1 X101.49 Y103.82 E.01109
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z4.28 F42000
G1 X77.492 Y104.215 Z4.28
G1 Z3.88
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.491 Y104.208 E.00018
G3 X77.11 Y103.295 I.921 J-.92 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.293 J-.003 E.05119
G1 X101.626 Y75.411 E.58381
M73 P54 R4
G3 X102.888 Y76.637 I-.042 J1.306 E.04853
G1 X102.89 Y103.295 E.67021
G3 X101.595 Y104.59 I-1.299 J-.004 E.05112
G1 X78.405 Y104.59 E.58301
G3 X77.686 Y104.369 I.007 J-1.302 E.0192
G1 X77.539 Y104.252 E.00471
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.491 Y104.208 E-.02489
G1 X77.294 Y103.963 E-.11947
G1 X77.186 Y103.734 E-.09608
G1 X77.13 Y103.524 E-.08253
G1 X77.11 Y103.295 E-.08768
G1 X77.11 Y102.375 E-.34935
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

G1 X86.21 Y104.175
G1 Z3.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z4.28 F42000
G1 X101.29 Y75.825 Z4.28
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.463149
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42153
; WIPE_START
G1 F10494.095
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.541 Y79.537 Z4.28 F42000
G1 X80.03 Y80.378 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.00051
G3 X79.916 Y80.393 I.017 J.689 E.0938
G1 X79.97 Y80.386 E.00122
M204 S250
G1 X79.616 Y80.52 F42000
G1 F2142
M204 S5000
G1 X79.714 Y80.448 E.00272
G3 X80.053 Y80.354 I.353 J.617 E.00796
G1 X80.103 Y80.355 E.00112
G3 X79.569 Y80.558 I-.036 J.71 E.08675
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y80.448 E-.06891
G1 X79.844 Y80.391 E-.05378
G1 X80.053 Y80.354 E-.08086
G1 X80.103 Y80.355 E-.01901
G1 X80.228 Y80.372 E-.04799
G1 X80.363 Y80.417 E-.05382
G1 X80.485 Y80.488 E-.05373
G1 X80.591 Y80.581 E-.05379
G1 X80.677 Y80.694 E-.05382
G1 X80.738 Y80.822 E-.0538
G1 X80.773 Y80.959 E-.05381
G1 X80.78 Y81.101 E-.05384
G1 X80.759 Y81.24 E-.05375
G1 X80.711 Y81.374 E-.05385
G1 X80.703 Y81.385 E-.00524
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z4.28 F42000
G1 X85.01 Y97.29 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/50
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.28 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z4.28
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.354 Y104.209 E.19248
M73 P55 R4
G3 X77.49 Y103.305 I.058 J-.92 E.03455
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.743 E.0125
G1 X101.822 Y75.817 E.00856
G3 X102.51 Y76.695 I-.226 J.885 E.03015
G1 X102.51 Y103.305 E.66901
G3 X102.175 Y104.005 I-.954 J-.025 E.0201
G3 X101.49 Y104.261 I-.871 J-1.287 E.01857
G1 X101.49 Y103.82 E.0111
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z4.44 F42000
G1 X77.492 Y104.215 Z4.44
G1 Z4.04
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.489 Y104.208 E.0002
G3 X77.11 Y103.295 I.92 J-.916 E.0255
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.628 Y75.411 E.58385
G3 X102.888 Y76.637 I-.044 J1.306 E.04849
G1 X102.89 Y103.295 E.67021
G3 X101.597 Y104.59 I-1.299 J-.003 E.05106
G1 X78.405 Y104.59 E.58307
G3 X77.738 Y104.404 I.003 J-1.299 E.01762
G1 X77.54 Y104.251 E.0063
; WIPE_START
M73 P56 R3
G1 F11668.197
M204 S6000
G1 X77.489 Y104.208 E-.02547
G1 X77.294 Y103.963 E-.11881
G1 X77.186 Y103.735 E-.09607
G1 X77.13 Y103.523 E-.08316
G1 X77.11 Y103.295 E-.08711
G1 X77.11 Y102.375 E-.34938
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

G1 X86.21 Y104.175
G1 Z4.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z4.44 F42000
G1 X101.29 Y75.825 Z4.44
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.463139
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42152
; WIPE_START
G1 F10494.347
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.542 Y79.538 Z4.44 F42000
G1 X80.032 Y80.378 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.00046
G3 X79.917 Y80.393 I.017 J.688 E.09364
G1 X79.973 Y80.386 E.00127
M204 S250
G1 X79.617 Y80.519 F42000
G1 F2142
M204 S5000
G1 X79.714 Y80.448 E.00268
G3 X80.053 Y80.354 I.353 J.616 E.00796
G1 X80.104 Y80.355 E.00114
G3 X79.571 Y80.556 I-.037 J.71 E.08677
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y80.448 E-.06818
G1 X79.844 Y80.391 E-.05384
G1 X80.053 Y80.354 E-.08084
G1 X80.104 Y80.355 E-.0194
G1 X80.228 Y80.372 E-.04761
G1 X80.362 Y80.417 E-.0538
G1 X80.485 Y80.488 E-.0538
G1 X80.591 Y80.581 E-.05374
G1 X80.677 Y80.694 E-.05386
G1 X80.738 Y80.822 E-.05379
G1 X80.773 Y80.959 E-.05383
G1 X80.78 Y81.1 E-.05378
G1 X80.759 Y81.241 E-.05382
G1 X80.711 Y81.374 E-.05381
G1 X80.702 Y81.387 E-.00589
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z4.44 F42000
G1 X85.01 Y97.29 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/50
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.44 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z4.44
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.354 Y104.209 E.19249
G3 X77.49 Y103.305 I.058 J-.92 E.03455
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.733 E.01275
G1 X101.902 Y75.841 E.0107
M73 P57 R3
G3 X102.51 Y76.695 I-.311 J.866 E.02805
G1 X102.51 Y103.305 E.66901
G3 X102.176 Y104.005 I-.954 J-.025 E.02009
G3 X101.49 Y104.261 I-.871 J-1.285 E.01857
G1 X101.49 Y103.82 E.0111
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z4.6 F42000
G1 X77.492 Y104.215 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.492 Y104.208 E.00019
G3 X77.11 Y103.295 I.923 J-.923 E.02553
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.293 J-.002 E.05118
G1 X101.629 Y75.411 E.58388
G3 X102.888 Y76.637 I-.045 J1.306 E.04845
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.299 J-.006 E.05106
G1 X78.405 Y104.59 E.58301
G3 X77.687 Y104.368 I.01 J-1.306 E.01919
G1 X77.539 Y104.252 E.00471
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.0245
G1 X77.328 Y104.016 E-.09596
G1 X77.186 Y103.734 E-.11999
G1 X77.13 Y103.522 E-.08362
G1 X77.11 Y103.295 E-.08657
G1 X77.11 Y102.375 E-.34937
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

G1 X86.21 Y104.175
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z4.6 F42000
G1 X101.29 Y75.825 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.463108
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42149
; WIPE_START
G1 F10495.092
G1 X88.21 Y75.825 E-.76
; WIPE_END
M73 P58 R3
G1 E-.04 F1800
M204 S10000
G1 X81.542 Y79.538 Z4.6 F42000
G1 X80.035 Y80.378 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.00041
G3 X79.916 Y80.393 I.017 J.688 E.09365
G1 X79.975 Y80.385 E.00132
M204 S250
G1 X79.634 Y80.506 F42000
G1 F2142
M204 S5000
G1 X79.655 Y80.488 E.00062
G3 X80.052 Y80.354 I.415 J.575 E.00951
G1 X80.123 Y80.356 E.00159
G3 X79.549 Y80.582 I-.053 J.707 E.08543
G1 X79.589 Y80.546 E.0012
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y80.488 E-.0334
G1 X79.778 Y80.417 E-.0537
G1 X79.912 Y80.372 E-.05383
G1 X80.052 Y80.354 E-.05377
G1 X80.123 Y80.356 E-.02693
G1 X80.262 Y80.381 E-.05376
G1 X80.394 Y80.432 E-.05388
G1 X80.513 Y80.509 E-.05381
G1 X80.615 Y80.608 E-.05375
G1 X80.725 Y80.789 E-.08054
G1 X80.767 Y80.924 E-.05378
G1 X80.781 Y81.065 E-.05382
G1 X80.75 Y81.272 E-.07964
G1 X80.69 Y81.405 E-.05537
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z4.6 F42000
G1 X85.01 Y97.29 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/50
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.6 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z4.6
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.062 J-.926 E.03453
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.743 E.0125
G1 X101.822 Y75.817 E.00856
G3 X102.51 Y76.695 I-.226 J.885 E.03016
G1 X102.51 Y103.305 E.66901
G3 X102.175 Y104.005 I-.954 J-.026 E.0201
G3 X101.49 Y104.261 I-.868 J-1.281 E.01857
G1 X101.49 Y103.82 E.01109
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z4.76 F42000
G1 X77.492 Y104.215 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.492 Y104.208 E.00019
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.004 E.05112
G1 X101.631 Y75.411 E.58392
M73 P59 R3
G3 X102.888 Y76.637 I-.047 J1.306 E.04841
G1 X102.89 Y103.295 E.67022
G3 X101.597 Y104.59 I-1.306 J-.01 E.05099
G1 X78.405 Y104.59 E.58307
G3 X77.687 Y104.368 I.01 J-1.306 E.01919
G1 X77.539 Y104.252 E.00471
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.0245
G1 X77.327 Y104.016 E-.09619
G1 X77.186 Y103.734 E-.11971
G1 X77.135 Y103.554 E-.07111
G1 X77.11 Y103.295 E-.09909
G1 X77.11 Y102.375 E-.34939
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

G1 X86.21 Y104.175
G1 Z4.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z4.76 F42000
G1 X101.29 Y75.825 Z4.76
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.463078
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42146
; WIPE_START
G1 F10495.832
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.542 Y79.539 Z4.76 F42000
G1 X80.038 Y80.377 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.058 Y80.376 E.00044
G3 X79.978 Y80.382 I.015 J.688 E.09501
M204 S250
G1 X79.636 Y80.505 F42000
G1 F2142
M204 S5000
G1 X79.654 Y80.487 E.00058
G3 X80.053 Y80.354 I.413 J.576 E.00955
G1 X80.106 Y80.355 E.00118
G3 X79.548 Y80.581 I-.038 J.708 E.0858
G1 X79.59 Y80.544 E.00125
; WIPE_START
G1 F12000
M204 S6000
G1 X79.654 Y80.487 E-.03264
G1 X79.778 Y80.417 E-.05391
G1 X79.912 Y80.372 E-.0538
G1 X80.053 Y80.354 E-.05409
G1 X80.106 Y80.355 E-.02012
G1 X80.228 Y80.372 E-.04684
G1 X80.362 Y80.417 E-.05384
G1 X80.485 Y80.488 E-.05383
G1 X80.591 Y80.581 E-.05376
G1 X80.677 Y80.694 E-.05381
G1 X80.738 Y80.822 E-.05387
G1 X80.773 Y80.959 E-.05378
G1 X80.78 Y81.1 E-.05377
G1 X80.759 Y81.24 E-.05378
G1 X80.711 Y81.374 E-.05382
G1 X80.689 Y81.405 E-.01435
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z4.76 F42000
G1 X85.01 Y97.29 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/50
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.76 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z4.76
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
M73 P60 R3
G3 X77.49 Y103.305 I.047 J-.911 E.03467
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.743 E.01249
G1 X101.822 Y75.817 E.00856
G3 X102.51 Y76.695 I-.226 J.885 E.03015
G1 X102.51 Y103.305 E.66901
G3 X102.176 Y104.005 I-.954 J-.026 E.02009
G3 X101.49 Y104.261 I-.868 J-1.279 E.01857
G1 X101.49 Y103.82 E.01109
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z4.92 F42000
G1 X77.492 Y104.215 Z4.92
G1 Z4.52
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.486 Y104.21 E.00018
G3 X77.11 Y103.295 I.915 J-.911 E.02554
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.291 J-.004 E.0512
G1 X101.632 Y75.411 E.58396
G3 X102.888 Y76.637 I-.048 J1.306 E.04838
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
G1 X78.405 Y104.59 E.58301
G3 X77.684 Y104.372 I-.004 J-1.291 E.01923
G1 X77.538 Y104.253 E.00473
; WIPE_START
M73 P61 R3
G1 F11668.197
M204 S6000
G1 X77.486 Y104.21 E-.02553
G1 X77.295 Y103.965 E-.11813
G1 X77.186 Y103.734 E-.09706
G1 X77.135 Y103.554 E-.07106
G1 X77.11 Y103.295 E-.09914
G1 X77.11 Y102.376 E-.3491
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

G1 X86.21 Y104.175
G1 Z4.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z4.92 F42000
G1 X101.29 Y75.825 Z4.92
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.463057
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42144
; WIPE_START
G1 F10496.333
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.543 Y79.54 Z4.92 F42000
G1 X80.039 Y80.377 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.0003
G3 X79.917 Y80.393 I.017 J.689 E.09378
G1 X79.98 Y80.385 E.00143
M204 S250
G1 X79.637 Y80.504 F42000
G1 F2142
M204 S5000
G1 X79.654 Y80.487 E.00054
G3 X80.053 Y80.354 I.413 J.578 E.00954
G1 X80.107 Y80.355 E.00121
G3 X79.548 Y80.58 I-.039 J.709 E.08596
G1 X79.591 Y80.543 E.00129
; WIPE_START
G1 F12000
M204 S6000
G1 X79.654 Y80.487 E-.032
G1 X79.778 Y80.417 E-.05384
G1 X79.912 Y80.372 E-.05375
G1 X80.053 Y80.354 E-.05411
G1 X80.107 Y80.355 E-.02049
G1 X80.228 Y80.372 E-.04653
G1 X80.363 Y80.417 E-.05384
G1 X80.485 Y80.488 E-.05372
G1 X80.591 Y80.581 E-.05383
G1 X80.677 Y80.694 E-.05381
G1 X80.738 Y80.822 E-.0538
G1 X80.773 Y80.959 E-.05381
G1 X80.78 Y81.1 E-.0538
G1 X80.738 Y81.308 E-.08055
G1 X80.69 Y81.408 E-.04211
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z4.92 F42000
G1 X85.01 Y97.29 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/50
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.92 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z4.92
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.049 J-.913 E.03464
G1 X77.49 Y76.695 E.66903
G3 X78.395 Y75.79 I.92 J.016 E.03557
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.733 E.01275
G1 X101.902 Y75.841 E.0107
M73 P62 R3
G3 X102.51 Y76.695 I-.318 J.87 E.02802
G1 X102.51 Y103.305 E.66901
G3 X102.175 Y104.005 I-.954 J-.025 E.0201
G3 X101.49 Y104.261 I-.869 J-1.281 E.01857
G1 X101.49 Y103.82 E.0111
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z5.08 F42000
G1 X77.492 Y104.215 Z5.08
G1 Z4.68
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.489 Y104.211 E.00012
G3 X77.11 Y103.295 I.915 J-.915 E.02559
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.291 J-.004 E.0512
G1 X101.634 Y75.411 E.58399
G3 X102.888 Y76.637 I-.05 J1.306 E.04834
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.299 J-.006 E.05106
G1 X78.403 Y104.59 E.58307
G3 X77.685 Y104.372 I.002 J-1.294 E.01914
G1 X77.538 Y104.253 E.00475
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.489 Y104.211 E-.02452
G1 X77.309 Y103.987 E-.10914
G1 X77.186 Y103.734 E-.10692
G1 X77.129 Y103.517 E-.08521
G1 X77.11 Y103.295 E-.085
G1 X77.11 Y102.376 E-.34921
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

G1 X86.21 Y104.175
G1 Z4.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z5.08 F42000
G1 X101.29 Y75.825 Z5.08
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.463027
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42141
; WIPE_START
G1 F10497.075
G1 X88.21 Y75.825 E-.76
; WIPE_END
M73 P63 R3
G1 E-.04 F1800
M204 S10000
G1 X81.543 Y79.54 Z5.08 F42000
G1 X80.042 Y80.377 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.00025
G3 X79.916 Y80.393 I.017 J.688 E.09369
G1 X79.982 Y80.384 E.00148
M204 S250
G1 X79.638 Y80.502 F42000
G1 F2142
M204 S5000
G1 X79.654 Y80.487 E.0005
G3 X80.053 Y80.354 I.413 J.576 E.00954
G1 X80.108 Y80.355 E.00123
G3 X79.548 Y80.581 I-.04 J.708 E.08576
G1 X79.593 Y80.542 E.00133
; WIPE_START
G1 F12000
M204 S6000
G1 X79.654 Y80.487 E-.03124
G1 X79.778 Y80.417 E-.05386
G1 X79.912 Y80.372 E-.05377
G1 X80.053 Y80.354 E-.05407
G1 X80.108 Y80.355 E-.02092
G1 X80.228 Y80.372 E-.04614
G1 X80.362 Y80.417 E-.05383
G1 X80.485 Y80.488 E-.05381
G1 X80.591 Y80.581 E-.05374
G1 X80.677 Y80.694 E-.05381
G1 X80.738 Y80.822 E-.05379
G1 X80.773 Y80.959 E-.05382
G1 X80.78 Y81.1 E-.05381
G1 X80.738 Y81.308 E-.08052
G1 X80.689 Y81.41 E-.04286
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z5.08 F42000
G1 X85.01 Y97.29 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/50
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.08 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z5.08
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.047 J-.912 E.03467
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.733 E.01275
G1 X101.902 Y75.841 E.0107
G3 X102.51 Y76.695 I-.318 J.87 E.02801
G1 X102.51 Y103.307 E.66907
G3 X102.176 Y104.005 I-.954 J-.028 E.02004
G3 X101.49 Y104.262 I-.869 J-1.28 E.01858
G1 X101.49 Y103.82 E.0111
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z5.24 F42000
G1 X77.492 Y104.215 Z5.24
G1 Z4.84
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.486 Y104.21 E.00018
G3 X77.11 Y103.295 I.915 J-.911 E.02554
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.297 J.002 E.05114
G1 X101.635 Y75.411 E.58403
M73 P64 R3
G3 X102.888 Y76.637 I-.044 J1.298 E.04837
G1 X102.89 Y103.297 E.67028
G3 X101.597 Y104.59 I-1.291 J.002 E.05108
G1 X78.405 Y104.59 E.58307
G3 X77.683 Y104.372 I-.004 J-1.291 E.01924
G1 X77.538 Y104.253 E.00473
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.486 Y104.21 E-.0255
G1 X77.295 Y103.965 E-.11809
G1 X77.186 Y103.735 E-.09703
G1 X77.135 Y103.554 E-.07117
G1 X77.11 Y103.295 E-.09911
G1 X77.11 Y102.376 E-.34911
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

G1 X86.21 Y104.175
G1 Z4.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z5.24 F42000
G1 X101.29 Y75.826 Z5.24
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.463007
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42139
; WIPE_START
G1 F10497.574
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.543 Y79.541 Z5.24 F42000
G1 X80.044 Y80.377 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.0002
G3 X79.917 Y80.393 I.017 J.688 E.09365
G1 X79.984 Y80.384 E.00153
M204 S250
G1 X79.64 Y80.501 F42000
G1 F2142
M204 S5000
G1 X79.654 Y80.487 E.00046
G3 X80.053 Y80.354 I.413 J.578 E.00954
G1 X80.109 Y80.355 E.00126
G3 X79.548 Y80.58 I-.041 J.709 E.08591
G1 X79.594 Y80.54 E.00138
; WIPE_START
G1 F12000
M204 S6000
G1 X79.654 Y80.487 E-.03056
G1 X79.778 Y80.417 E-.05388
G1 X79.912 Y80.372 E-.05374
G1 X80.053 Y80.354 E-.05405
G1 X80.109 Y80.355 E-.02132
G1 X80.228 Y80.372 E-.04576
G1 X80.363 Y80.417 E-.05383
G1 X80.485 Y80.488 E-.05378
G1 X80.591 Y80.581 E-.05376
G1 X80.677 Y80.694 E-.05381
G1 X80.738 Y80.822 E-.05385
G1 X80.773 Y80.959 E-.05377
G1 X80.78 Y81.1 E-.0538
G1 X80.759 Y81.24 E-.05378
G1 X80.711 Y81.374 E-.05388
G1 X80.686 Y81.409 E-.01643
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z5.24 F42000
G1 X85.01 Y97.29 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/50
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.24 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z5.24
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.353 Y104.209 E.19251
M73 P65 R3
G3 X77.49 Y103.305 I.059 J-.92 E.03452
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.743 E.0125
G1 X101.822 Y75.817 E.00856
G3 X102.51 Y76.695 I-.226 J.885 E.03015
G1 X102.51 Y103.305 E.66901
G3 X102.176 Y104.005 I-.954 J-.025 E.02009
G3 X101.49 Y104.261 I-.867 J-1.276 E.01858
G1 X101.49 Y103.82 E.0111
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z5.4 F42000
G1 X77.498 Y104.216 Z5.4
G1 Z5
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.367 Y104.066 E.00499
G3 X77.11 Y103.295 I1.042 J-.775 E.0208
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.637 Y75.411 E.58407
G3 X102.888 Y76.637 I-.053 J1.306 E.04826
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.299 J-.006 E.05106
G1 X78.405 Y104.59 E.58301
G3 X77.541 Y104.257 I.003 J-1.299 E.02382
; WIPE_START
G1 F11668.197
M204 S6000
M73 P66 R3
G1 X77.367 Y104.066 E-.09816
G1 X77.234 Y103.851 E-.09603
G1 X77.149 Y103.613 E-.0963
G1 X77.11 Y103.295 E-.12178
G1 X77.11 Y102.38 E-.34773
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

G1 X86.21 Y104.175
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z5.4 F42000
G1 X101.29 Y75.826 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.462987
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42137
; WIPE_START
G1 F10498.068
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.544 Y79.542 Z5.4 F42000
G1 X80.046 Y80.376 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.00015
G3 X79.916 Y80.393 I.017 J.688 E.09365
G1 X79.987 Y80.384 E.00159
M204 S250
G1 X79.641 Y80.5 F42000
G1 F2142
M204 S5000
G1 X79.654 Y80.487 E.00041
G3 X80.053 Y80.354 I.414 J.578 E.00954
G1 X80.11 Y80.355 E.00128
G3 X79.548 Y80.581 I-.042 J.709 E.08589
G1 X79.596 Y80.539 E.00142
; WIPE_START
G1 F12000
M204 S6000
G1 X79.654 Y80.487 E-.02981
G1 X79.778 Y80.417 E-.05393
G1 X79.912 Y80.372 E-.05373
G1 X80.053 Y80.354 E-.05403
G1 X80.11 Y80.355 E-.0217
G1 X80.362 Y80.417 E-.09881
G1 X80.485 Y80.488 E-.05374
G1 X80.591 Y80.581 E-.05376
G1 X80.677 Y80.694 E-.0539
G1 X80.738 Y80.822 E-.05378
G1 X80.773 Y80.959 E-.05385
G1 X80.78 Y81.1 E-.05376
G1 X80.759 Y81.24 E-.05376
G1 X80.711 Y81.373 E-.05379
G1 X80.686 Y81.413 E-.01766
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z5.4 F42000
G1 X85.01 Y97.29 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/50
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.4 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z5.4
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.056 J-.92 E.03459
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.743 E.01249
G1 X101.822 Y75.817 E.00856
G3 X102.51 Y76.695 I-.226 J.885 E.03015
G1 X102.51 Y103.305 E.66901
G3 X102.175 Y104.005 I-.964 J-.031 E.02008
M73 P67 R3
G3 X101.49 Y104.261 I-.865 J-1.272 E.01857
M73 P67 R2
G1 X101.49 Y103.82 E.01109
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z5.56 F42000
G1 X77.492 Y104.215 Z5.56
G1 Z5.16
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.489 Y104.211 E.00012
G3 X77.11 Y103.295 I.915 J-.915 E.02558
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.294 J-.001 E.05117
G1 X101.638 Y75.411 E.58411
G3 X102.888 Y76.637 I-.054 J1.306 E.04823
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
G1 X78.403 Y104.59 E.58307
G3 X77.685 Y104.372 I.002 J-1.294 E.01913
G1 X77.538 Y104.253 E.00475
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.489 Y104.211 E-.0245
G1 X77.307 Y103.984 E-.11076
G1 X77.186 Y103.735 E-.10522
G1 X77.135 Y103.554 E-.07115
G1 X77.11 Y103.295 E-.09911
G1 X77.11 Y102.376 E-.34926
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

G1 X86.21 Y104.175
G1 Z5.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z5.56 F42000
G1 X101.29 Y75.826 Z5.56
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.462956
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42134
; WIPE_START
G1 F10498.809
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.544 Y79.542 Z5.56 F42000
M73 P68 R2
G1 X80.049 Y80.376 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.376 E.0001
G3 X79.917 Y80.393 I.017 J.687 E.09358
G1 X79.989 Y80.383 E.00163
M204 S250
G1 X79.642 Y80.499 F42000
G1 F2142
M204 S5000
G1 X79.654 Y80.487 E.00037
G3 X80.053 Y80.354 I.414 J.578 E.00954
G1 X80.111 Y80.355 E.0013
G3 X79.548 Y80.581 I-.043 J.709 E.08588
G1 X79.597 Y80.538 E.00146
; WIPE_START
G1 F12000
M204 S6000
G1 X79.654 Y80.487 E-.02912
G1 X79.778 Y80.417 E-.05392
G1 X79.912 Y80.372 E-.05378
G1 X80.053 Y80.354 E-.05399
G1 X80.111 Y80.355 E-.02201
G1 X80.362 Y80.417 E-.09847
G1 X80.485 Y80.488 E-.0538
G1 X80.591 Y80.582 E-.05387
G1 X80.677 Y80.694 E-.05377
G1 X80.738 Y80.822 E-.05374
G1 X80.773 Y80.959 E-.0538
G1 X80.78 Y81.1 E-.05384
G1 X80.738 Y81.308 E-.08058
G1 X80.686 Y81.416 E-.04531
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z5.56 F42000
G1 X85.01 Y97.29 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/50
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.56 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z5.56
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.353 Y104.209 E.19249
G3 X77.49 Y103.309 I.058 J-.92 E.03445
G1 X77.49 Y76.695 E.6691
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.743 E.0125
G1 X101.823 Y75.818 E.00857
G3 X102.51 Y76.695 I-.252 J.905 E.03
G1 X102.51 Y103.305 E.66901
G3 X102.175 Y104.005 I-.954 J-.026 E.0201
G3 X101.49 Y104.261 I-.866 J-1.273 E.01857
G1 X101.49 Y103.82 E.0111
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.952 Z5.72 F42000
G1 X77.498 Y104.216 Z5.72
G1 Z5.32
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.365 Y104.067 E.005
G3 X77.11 Y103.297 I1.039 J-.772 E.02075
G1 X77.11 Y76.705 E.66855
G3 X78.403 Y75.41 I1.294 J-.001 E.05111
G1 X101.64 Y75.411 E.58421
G3 X102.888 Y76.637 I-.056 J1.306 E.04819
M73 P69 R2
G1 X102.89 Y103.295 E.67022
G3 X101.597 Y104.59 I-1.294 J.001 E.05111
G1 X78.405 Y104.59 E.58308
G3 X77.54 Y104.259 I-.001 J-1.294 E.02383
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.365 Y104.067 E-.0983
G1 X77.234 Y103.852 E-.096
G1 X77.135 Y103.554 E-.11928
G1 X77.11 Y103.297 E-.09792
G1 X77.11 Y102.38 E-.34849
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

G1 X86.21 Y104.175
G1 Z5.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z5.72 F42000
G1 X101.29 Y75.826 Z5.72
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.462946
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42133
; WIPE_START
G1 F10499.065
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.544 Y79.543 Z5.72 F42000
G1 X80.051 Y80.376 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G1 X80.053 Y80.375 E.00005
G3 X79.918 Y80.392 I.018 J.688 E.09367
G1 X79.991 Y80.383 E.00165
M204 S250
G1 X79.644 Y80.498 F42000
G1 F2142
M204 S5000
G1 X79.655 Y80.487 E.00033
G3 X80.053 Y80.354 I.414 J.576 E.00954
G1 X80.112 Y80.355 E.00132
G3 X79.548 Y80.581 I-.043 J.708 E.08568
G1 X79.599 Y80.537 E.00149
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y80.487 E-.02842
G1 X79.778 Y80.417 E-.05389
G1 X79.912 Y80.372 E-.05377
G1 X80.053 Y80.354 E-.05399
G1 X80.112 Y80.355 E-.02239
G1 X80.362 Y80.417 E-.0981
G1 X80.485 Y80.488 E-.05383
G1 X80.591 Y80.581 E-.05378
G1 X80.677 Y80.694 E-.05384
G1 X80.738 Y80.822 E-.05378
G1 X80.773 Y80.959 E-.0538
G1 X80.78 Y81.1 E-.05379
G1 X80.759 Y81.24 E-.05375
G1 X80.711 Y81.374 E-.05386
G1 X80.682 Y81.415 E-.01901
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z5.72 F42000
G1 X85.01 Y97.29 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/50
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.72 I-.464 J1.125 P1  F42000
G1 X101.49 Y103.76 Z5.72
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.309 I.057 J-.92 E.03449
M73 P70 R2
G1 X77.49 Y76.695 E.6691
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.49 Y76.24 E.38919
G1 X101.49 Y75.743 E.0125
G1 X101.823 Y75.818 E.00857
G3 X102.51 Y76.692 I-.252 J.905 E.02994
G1 X102.51 Y103.305 E.66907
G3 X102.175 Y104.005 I-.954 J-.025 E.0201
G3 X101.49 Y104.261 I-.865 J-1.271 E.01857
G1 X101.49 Y103.82 E.0111
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.49 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.859 Y103.95 Z5.88 F42000
G1 X77.492 Y104.21 Z5.88
G1 Z5.48
G1 E.8 F1800
G1 F2142
M204 S5000
G1 X77.46 Y104.181 E.0011
G3 X77.11 Y103.295 I.944 J-.884 E.02454
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.641 Y75.411 E.58418
G3 X102.888 Y76.637 I-.057 J1.306 E.04815
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.293 J-.001 E.05112
G1 X78.405 Y104.59 E.58301
G3 X77.686 Y104.373 I-.002 J-1.293 E.01916
G1 X77.538 Y104.248 E.00486
; WIPE_START
M73 P71 R2
G1 F11668.197
M204 S6000
G1 X77.46 Y104.181 E-.03935
G1 X77.294 Y103.963 E-.10407
G1 X77.186 Y103.734 E-.09616
G1 X77.124 Y103.487 E-.097
G1 X77.11 Y103.295 E-.07318
G1 X77.11 Y102.373 E-.35023
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

G1 X86.21 Y104.175
G1 Z5.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2142
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z5.88 F42000
G1 X101.29 Y75.826 Z5.88
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.462925
G1 F2142
M204 S6000
G1 X86.21 Y75.825 E.42131
; WIPE_START
G1 F10499.566
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.545 Y79.543 Z5.88 F42000
G1 X80.053 Y80.376 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2142
M204 S5000
G3 X79.917 Y80.393 I.017 J.688 E.09374
G1 X79.993 Y80.383 E.00173
M204 S250
G1 X79.645 Y80.496 F42000
G1 F2142
M204 S5000
G1 X79.655 Y80.487 E.0003
G3 X80.053 Y80.354 I.414 J.578 E.00953
G1 X80.113 Y80.355 E.00134
G3 X79.548 Y80.581 I-.044 J.709 E.08583
G1 X79.6 Y80.536 E.00154
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y80.487 E-.0278
G1 X79.778 Y80.417 E-.0538
G1 X79.912 Y80.372 E-.05375
G1 X80.053 Y80.354 E-.05402
G1 X80.113 Y80.355 E-.02278
G1 X80.362 Y80.417 E-.09775
G1 X80.485 Y80.488 E-.05375
G1 X80.591 Y80.581 E-.05387
G1 X80.677 Y80.694 E-.05383
G1 X80.738 Y80.822 E-.05376
G1 X80.773 Y80.959 E-.05379
G1 X80.78 Y81.1 E-.05381
G1 X80.738 Y81.308 E-.0805
G1 X80.685 Y81.419 E-.04681
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y82.71 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.59 Y82.71 E.01458
G1 X85.59 Y84.29 E.03972
G1 X85.01 Y84.29 E.01458
G1 X85.01 Y82.77 E.03822
M204 S10000
G1 X85.3 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y90.541 Z5.88 F42000
G1 X85.01 Y97.29 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2142
M204 S5000
G1 X85.01 Y95.71 E.03972
G1 X85.59 Y95.71 E.01458
G1 X85.59 Y97.29 E.03972
G1 X85.07 Y97.29 E.01307
M204 S10000
G1 X85.3 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2142
M204 S6000
G1 X85.3 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/50
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.88 I-.485 J1.116 P1  F42000
G1 X101.677 Y104.203 Z5.88
G1 Z5.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1728
M204 S5000
G1 X101.605 Y104.21 E.00182
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.305 I.017 J-.923 E.03555
G1 X77.49 Y76.695 E.66903
G3 X78.395 Y75.79 I.92 J.016 E.03557
G1 X101.605 Y75.79 E.58353
G3 X102.51 Y76.692 I-.019 J.925 E.03548
G1 X102.51 Y103.305 E.66907
M73 P72 R2
G3 X101.778 Y104.19 I-.923 J-.017 E.03116
G1 X101.736 Y104.195 E.00107
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y104.21 E-.05028
G1 X99.737 Y104.21 E-.70972
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.105 Y104.21 Z6.04 F42000
G1 X77.49 Y104.21 Z6.04
G1 Z5.64
G1 E.8 F1800
G1 F1728
M204 S5000
G1 X77.447 Y104.164 E.0016
G3 X77.11 Y103.295 I.962 J-.873 E.02397
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.297 J.002 E.05114
G1 X101.643 Y75.411 E.58422
G3 X102.888 Y76.637 I-.059 J1.306 E.04812
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.291 J.002 E.05114
G1 X78.403 Y104.59 E.58307
G3 X77.582 Y104.293 I.006 J-1.299 E.02238
G1 X77.535 Y104.25 E.0016
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.447 Y104.164 E-.04688
G1 X77.294 Y103.963 E-.09595
G1 X77.186 Y103.735 E-.0961
G1 X77.135 Y103.554 E-.07113
G1 X77.11 Y103.295 E-.09912
G1 X77.11 Y102.371 E-.35083
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.123 Y94.806 Z6.04 F42000
G1 X80.055 Y80.376 Z6.04
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.377567
M73 P73 R2
G1 F1728
M204 S5000
G1 X80.19 Y80.386 E.00302
G3 X79.917 Y80.393 I-.12 J.677 E.09057
G1 X79.996 Y80.383 E.00179
M204 S250
G1 X79.647 Y80.495 F42000
G1 F1728
M204 S5000
G1 X79.655 Y80.487 E.00025
G3 X80.053 Y80.354 I.414 J.576 E.00954
G1 X80.114 Y80.355 E.00137
G3 X79.549 Y80.581 I-.045 J.708 E.08564
G1 X79.601 Y80.535 E.00157
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y80.487 E-.02705
G1 X79.778 Y80.417 E-.05388
G1 X79.912 Y80.372 E-.05376
G1 X80.053 Y80.354 E-.05398
G1 X80.114 Y80.355 E-.02321
G1 X80.363 Y80.417 E-.09738
G1 X80.485 Y80.488 E-.0538
G1 X80.591 Y80.582 E-.05382
G1 X80.677 Y80.694 E-.05375
G1 X80.738 Y80.822 E-.0538
G1 X80.773 Y80.959 E-.05382
G1 X80.78 Y81.1 E-.05376
G1 X80.759 Y81.24 E-.0538
G1 X80.711 Y81.374 E-.05387
G1 X80.683 Y81.419 E-.02033
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
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 36/50
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 15
G1 X101.685 Y104.202 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1729
M204 S5000
G1 X101.605 Y104.21 E.00201
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.305 I.021 J-.926 E.03551
G1 X77.49 Y76.695 E.66903
G3 X78.395 Y75.79 I.92 J.016 E.03557
G1 X101.605 Y75.79 E.58353
G3 X102.51 Y76.695 I-.019 J.925 E.03554
G1 X102.51 Y103.305 E.66901
G3 X101.778 Y104.19 I-.922 J-.017 E.03116
G1 X101.744 Y104.195 E.00087
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y104.21 E-.05323
G1 X99.745 Y104.21 E-.70678
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.112 Y104.212 Z6.2 F42000
G1 X77.492 Y104.215 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F1729
M204 S5000
G1 X77.489 Y104.211 E.00011
G3 X77.11 Y103.295 I.915 J-.915 E.02559
G1 X77.11 Y76.705 E.66849
G3 X78.403 Y75.41 I1.298 J.002 E.05107
G1 X101.644 Y75.411 E.58432
M73 P74 R2
G3 X102.888 Y76.637 I-.06 J1.306 E.04808
G1 X102.89 Y103.295 E.67023
G3 X101.595 Y104.59 I-1.306 J-.011 E.05104
G1 X78.403 Y104.59 E.58307
G3 X77.685 Y104.372 I.002 J-1.294 E.01913
G1 X77.538 Y104.253 E.00477
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.489 Y104.211 E-.02443
G1 X77.304 Y103.979 E-.11291
G1 X77.186 Y103.734 E-.10319
G1 X77.127 Y103.508 E-.08898
G1 X77.11 Y103.295 E-.08117
G1 X77.11 Y102.375 E-.34933
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.124 Y94.81 Z6.2 F42000
G1 X80.057 Y80.376 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1729
M204 S5000
G1 X80.19 Y80.386 E.00297
G3 X79.917 Y80.393 I-.12 J.677 E.09057
G1 X79.998 Y80.382 E.00183
M204 S250
G1 X79.648 Y80.494 F42000
G1 F1729
M204 S5000
G1 X79.655 Y80.487 E.00021
G3 X80.053 Y80.354 I.414 J.577 E.00953
G1 X80.115 Y80.356 E.00139
G3 X79.548 Y80.581 I-.046 J.709 E.08579
G1 X79.603 Y80.533 E.00162
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y80.487 E-.02641
G1 X79.778 Y80.417 E-.05389
G1 X79.912 Y80.372 E-.05375
G1 X80.053 Y80.354 E-.05392
G1 X80.115 Y80.356 E-.02363
G1 X80.363 Y80.417 E-.09705
G1 X80.485 Y80.488 E-.05371
G1 X80.591 Y80.581 E-.05384
G1 X80.677 Y80.694 E-.0538
G1 X80.738 Y80.822 E-.05381
G1 X80.773 Y80.959 E-.05382
G1 X80.78 Y81.1 E-.05377
G1 X80.759 Y81.24 E-.0538
G1 X80.711 Y81.373 E-.05376
G1 X80.679 Y81.419 E-.02106
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
; Z_HEIGHT: 5.96
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 37/50
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 15
G1 X101.692 Y104.201 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1729
M204 S5000
G1 X101.605 Y104.21 E.00221
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.308 I.017 J-.923 E.03547
G1 X77.49 Y76.695 E.6691
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X101.605 Y75.79 E.58353
M73 P75 R2
G3 X102.51 Y76.692 I-.02 J.925 E.03548
G1 X102.51 Y103.305 E.66908
G3 X101.778 Y104.19 I-.922 J-.017 E.03116
G1 X101.752 Y104.194 E.00068
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y104.21 E-.05613
G1 X99.753 Y104.21 E-.70388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.12 Y104.212 Z6.36 F42000
G1 X77.493 Y104.215 Z6.36
G1 Z5.96
G1 E.8 F1800
G1 F1729
M204 S5000
G1 X77.367 Y104.067 E.00491
G3 X77.11 Y103.295 I1.042 J-.775 E.0208
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.304 J.009 E.05107
G1 X101.646 Y75.411 E.58429
G3 X102.888 Y76.637 I-.062 J1.306 E.04804
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.299 J-.006 E.05106
G1 X78.405 Y104.59 E.58302
G3 X77.538 Y104.255 I.004 J-1.299 E.0239
; WIPE_START
G1 F11668.197
M204 S6000
M73 P76 R2
G1 X77.367 Y104.067 E-.09671
G1 X77.234 Y103.851 E-.09602
G1 X77.139 Y103.571 E-.11248
G1 X77.11 Y103.295 E-.10562
G1 X77.11 Y102.376 E-.34917
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.124 Y94.811 Z6.36 F42000
G1 X80.06 Y80.376 Z6.36
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1729
M204 S5000
G1 X80.19 Y80.386 E.00292
G3 X79.917 Y80.393 I-.12 J.679 E.09077
G1 X80 Y80.382 E.00188
M204 S250
G1 X79.649 Y80.493 F42000
G1 F1729
M204 S5000
G1 X79.655 Y80.488 E.00017
G3 X80.053 Y80.354 I.414 J.576 E.00953
G1 X80.116 Y80.356 E.00141
G3 X79.549 Y80.581 I-.047 J.708 E.0856
G1 X79.604 Y80.532 E.00165
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y80.488 E-.02575
G1 X79.778 Y80.417 E-.0538
G1 X79.912 Y80.372 E-.05378
G1 X80.053 Y80.354 E-.05394
G1 X80.116 Y80.356 E-.024
G1 X80.362 Y80.417 E-.09664
G1 X80.485 Y80.488 E-.05383
G1 X80.591 Y80.581 E-.05367
G1 X80.677 Y80.694 E-.05391
G1 X80.738 Y80.822 E-.0538
G1 X80.773 Y80.959 E-.0538
G1 X80.78 Y81.1 E-.05378
G1 X80.738 Y81.308 E-.08053
G1 X80.682 Y81.424 E-.04878
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
; Z_HEIGHT: 6.12
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 38/50
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 15
G1 X101.7 Y104.201 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1729
M204 S5000
G1 X101.605 Y104.21 E.00239
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.308 I.021 J-.926 E.03546
G1 X77.49 Y76.695 E.66907
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X101.605 Y75.79 E.58353
G3 X102.51 Y76.695 I-.02 J.925 E.03554
G1 X102.51 Y103.305 E.66901
G3 X101.779 Y104.19 I-.922 J-.017 E.03116
G1 X101.759 Y104.193 E.00049
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y104.21 E-.05897
G1 X99.76 Y104.21 E-.70103
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.128 Y104.212 Z6.52 F42000
G1 X77.491 Y104.215 Z6.52
G1 Z6.12
G1 E.8 F1800
G1 F1729
M204 S5000
G1 X77.488 Y104.208 E.00019
G3 X77.11 Y103.295 I.92 J-.916 E.02549
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.647 Y75.411 E.58433
M73 P77 R2
G3 X102.888 Y76.637 I-.063 J1.306 E.04801
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
G1 X78.403 Y104.59 E.58307
G3 X77.685 Y104.37 I.006 J-1.299 E.01915
G1 X77.538 Y104.252 E.00473
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.488 Y104.208 E-.02541
G1 X77.293 Y103.962 E-.11913
G1 X77.186 Y103.734 E-.09575
G1 X77.135 Y103.554 E-.07115
G1 X77.11 Y103.295 E-.09906
G1 X77.11 Y102.375 E-.34951
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.125 Y94.81 Z6.52 F42000
G1 X80.062 Y80.376 Z6.52
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1729
M204 S5000
G1 X80.19 Y80.386 E.00287
G3 X79.916 Y80.393 I-.12 J.677 E.09057
G1 X80.002 Y80.382 E.00193
M204 S250
G1 X79.65 Y80.492 F42000
G1 F1729
M204 S5000
G1 X79.655 Y80.487 E.00014
G3 X80.053 Y80.354 I.414 J.577 E.00953
G1 X80.117 Y80.356 E.00143
G3 X79.549 Y80.581 I-.047 J.709 E.08576
G1 X79.605 Y80.531 E.00169
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y80.487 E-.02511
G1 X79.778 Y80.417 E-.05384
G1 X79.912 Y80.372 E-.05375
G1 X80.053 Y80.354 E-.05392
G1 X80.117 Y80.356 E-.02433
G1 X80.362 Y80.417 E-.09629
G1 X80.485 Y80.488 E-.05381
G1 X80.591 Y80.581 E-.05381
G1 X80.677 Y80.694 E-.05379
G1 X80.738 Y80.822 E-.05386
G1 X80.773 Y80.959 E-.05378
G1 X80.78 Y81.101 E-.05384
G1 X80.759 Y81.24 E-.05371
G1 X80.711 Y81.373 E-.05382
G1 X80.68 Y81.424 E-.02235
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
G1 X101.707 Y104.2 F42000
G1 Z6.28
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1729
M204 S5000
G1 X101.605 Y104.21 E.00258
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.305 I.015 J-.92 E.03558
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X101.605 Y75.79 E.58353
M73 P78 R1
G3 X102.51 Y76.695 I-.02 J.925 E.03554
G1 X102.51 Y103.305 E.66901
G3 X101.779 Y104.19 I-.922 J-.017 E.03116
G1 X101.766 Y104.192 E.00031
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y104.21 E-.06179
G1 X99.767 Y104.21 E-.69822
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.135 Y104.213 Z6.68 F42000
G1 X77.5 Y104.219 Z6.68
G1 Z6.28
G1 E.8 F1800
G1 F1729
M204 S5000
G1 X77.447 Y104.164 E.00192
G3 X77.11 Y103.295 I.962 J-.873 E.02398
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.648 Y75.411 E.58436
G3 X102.888 Y76.637 I-.065 J1.306 E.04797
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.306 J-.013 E.05098
G1 X78.403 Y104.59 E.58307
M73 P79 R1
G3 X77.582 Y104.293 I.006 J-1.299 E.02239
G1 X77.544 Y104.259 E.00127
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.447 Y104.164 E-.05172
G1 X77.294 Y103.963 E-.09594
G1 X77.185 Y103.732 E-.09713
G1 X77.139 Y103.568 E-.06465
G1 X77.11 Y103.295 E-.10456
G1 X77.11 Y102.384 E-.34601
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.125 Y94.819 Z6.68 F42000
G1 X80.064 Y80.376 Z6.68
G1 Z6.28
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1729
M204 S5000
G1 X80.19 Y80.386 E.00283
G3 X79.917 Y80.393 I-.12 J.677 E.0905
G1 X80.004 Y80.382 E.00197
M204 S250
G1 X79.652 Y80.491 F42000
G1 F1729
M204 S5000
G1 X79.655 Y80.487 E.0001
G3 X80.053 Y80.354 I.414 J.577 E.00953
G1 X80.117 Y80.356 E.00145
G3 X79.548 Y80.581 I-.048 J.709 E.08573
G1 X79.607 Y80.53 E.00173
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y80.487 E-.0245
G1 X79.778 Y80.417 E-.05383
G1 X79.912 Y80.372 E-.05379
G1 X80.053 Y80.354 E-.05387
G1 X80.117 Y80.356 E-.02467
G1 X80.362 Y80.417 E-.09591
G1 X80.485 Y80.488 E-.05389
G1 X80.591 Y80.581 E-.05377
G1 X80.677 Y80.694 E-.05381
G1 X80.738 Y80.822 E-.05377
G1 X80.773 Y80.959 E-.05384
G1 X80.78 Y81.1 E-.05378
G1 X80.759 Y81.24 E-.05379
G1 X80.711 Y81.374 E-.05386
G1 X80.677 Y81.423 E-.02292
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
G1 X101.714 Y104.199 F42000
G1 Z6.44
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1729
M204 S5000
G1 X101.605 Y104.21 E.00276
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.308 I.021 J-.926 E.03544
G1 X77.49 Y76.695 E.66909
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X101.605 Y75.79 E.58353
G3 X102.51 Y76.695 I-.02 J.925 E.03554
G1 X102.51 Y103.305 E.66901
G3 X101.779 Y104.19 I-.922 J-.017 E.03116
G1 X101.774 Y104.191 E.00013
; WIPE_START
M73 P80 R1
G1 F11668.197
M204 S6000
G1 X101.605 Y104.21 E-.0645
G1 X99.775 Y104.21 E-.69551
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.142 Y104.212 Z6.84 F42000
G1 X77.491 Y104.215 Z6.84
G1 Z6.44
G1 E.8 F1800
G1 F1729
M204 S5000
G1 X77.492 Y104.208 E.00018
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.304 J.009 E.05106
G1 X101.65 Y75.411 E.5844
G3 X102.888 Y76.634 I-.067 J1.306 E.04787
G1 X102.89 Y103.295 E.67029
G3 X101.595 Y104.59 I-1.306 J-.011 E.05104
G1 X78.403 Y104.59 E.58307
G3 X77.688 Y104.368 I.013 J-1.306 E.01908
G1 X77.539 Y104.252 E.00477
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.0243
G1 X77.302 Y103.976 E-.11383
G1 X77.186 Y103.734 E-.10198
G1 X77.124 Y103.487 E-.09706
G1 X77.11 Y103.295 E-.07315
G1 X77.11 Y102.374 E-.34968
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.126 Y94.81 Z6.84 F42000
G1 X80.066 Y80.376 Z6.84
G1 Z6.44
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1729
M204 S5000
G1 X80.19 Y80.386 E.00278
G3 X79.917 Y80.393 I-.12 J.678 E.0907
G1 X80.006 Y80.381 E.00202
M204 S250
G1 X79.653 Y80.49 F42000
G1 F1729
M204 S5000
G1 X79.655 Y80.488 E.00006
G3 X80.053 Y80.354 I.415 J.577 E.00953
G1 X80.118 Y80.356 E.00147
G3 X79.549 Y80.581 I-.049 J.709 E.08572
G1 X79.608 Y80.529 E.00176
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y80.488 E-.02382
G1 X79.778 Y80.417 E-.05382
G1 X79.912 Y80.372 E-.05384
G1 X80.053 Y80.354 E-.05388
G1 X80.118 Y80.356 E-.02505
G1 X80.362 Y80.417 E-.09556
G1 X80.485 Y80.488 E-.05379
G1 X80.591 Y80.581 E-.05386
G1 X80.677 Y80.694 E-.05376
G1 X80.738 Y80.822 E-.05377
G1 X80.773 Y80.959 E-.05389
G1 X80.78 Y81.1 E-.05377
G1 X80.759 Y81.24 E-.0538
G1 X80.711 Y81.373 E-.05376
G1 X80.676 Y81.425 E-.02362
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
G1 X101.721 Y104.198 F42000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1729
M204 S5000
G1 X101.605 Y104.21 E.00294
G1 X78.392 Y104.21 E.58359
G3 X77.49 Y103.309 I.024 J-.926 E.03537
G1 X77.49 Y76.695 E.66911
M73 P81 R1
G3 X78.395 Y75.79 I.92 J.016 E.03557
G1 X101.605 Y75.79 E.58353
G3 X102.51 Y76.695 I-.02 J.925 E.03554
G1 X102.51 Y103.305 E.66901
G3 X101.78 Y104.189 I-.926 J-.021 E.03108
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y104.21 E-.06716
G1 X99.782 Y104.21 E-.69284
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.149 Y104.212 Z7 F42000
G1 X77.491 Y104.215 Z7
G1 Z6.6
G1 E.8 F1800
G1 F1729
M204 S5000
G1 X77.493 Y104.208 E.00018
G3 X77.11 Y103.295 I.923 J-.923 E.02553
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.651 Y75.411 E.58444
G3 X102.888 Y76.637 I-.068 J1.306 E.0479
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
M73 P82 R1
G1 X78.405 Y104.59 E.58301
G3 X77.688 Y104.368 I.01 J-1.306 E.01914
G1 X77.539 Y104.252 E.00477
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.493 Y104.208 E-.02423
G1 X77.301 Y103.975 E-.11435
G1 X77.185 Y103.732 E-.10246
G1 X77.138 Y103.566 E-.06574
G1 X77.11 Y103.295 E-.10348
G1 X77.11 Y102.374 E-.34973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.127 Y94.81 Z7 F42000
G1 X80.068 Y80.377 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1729
M204 S5000
G1 X80.19 Y80.386 E.00274
G3 X79.916 Y80.393 I-.12 J.678 E.09069
G1 X80.008 Y80.381 E.00207
M204 S250
G1 X79.655 Y80.488 F42000
G1 F1729
M204 S5000
G3 X80.052 Y80.354 I.415 J.577 E.00953
G1 X80.119 Y80.356 E.0015
G3 X79.608 Y80.525 I-.05 J.709 E.08753
; WIPE_START
G1 F12000
M204 S6000
G1 X79.778 Y80.417 E-.07646
G1 X79.912 Y80.372 E-.05377
G1 X80.052 Y80.354 E-.05391
G1 X80.119 Y80.356 E-.0254
G1 X80.362 Y80.417 E-.09525
G1 X80.485 Y80.488 E-.05385
G1 X80.591 Y80.581 E-.05374
G1 X80.677 Y80.694 E-.05381
G1 X80.738 Y80.822 E-.05379
G1 X80.773 Y80.959 E-.05381
G1 X80.78 Y81.101 E-.05386
G1 X80.759 Y81.24 E-.05377
G1 X80.711 Y81.374 E-.05381
G1 X80.674 Y81.427 E-.02477
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
G1 X101.728 Y104.198 F42000
G1 Z6.76
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1729
M204 S5000
G1 X101.605 Y104.21 E.00311
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.305 I.017 J-.922 E.03556
G1 X77.49 Y76.695 E.66903
G3 X78.395 Y75.79 I.92 J.016 E.03557
G1 X101.605 Y75.79 E.58353
G3 X102.51 Y76.695 I-.02 J.925 E.03553
G1 X102.51 Y103.305 E.66901
G3 X101.787 Y104.189 I-.92 J-.015 E.03096
; WIPE_START
G1 F11668.197
M204 S6000
M73 P83 R1
G1 X101.605 Y104.21 E-.06974
G1 X99.788 Y104.21 E-.69026
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.156 Y104.212 Z7.16 F42000
G1 X77.491 Y104.215 Z7.16
G1 Z6.76
G1 E.8 F1800
G1 F1729
M204 S5000
G1 X77.492 Y104.208 E.00018
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.298 J.003 E.05113
G1 X101.653 Y75.411 E.58447
G3 X102.888 Y76.637 I-.07 J1.306 E.04786
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
G1 X78.405 Y104.59 E.58301
G3 X77.687 Y104.368 I.011 J-1.306 E.01918
G1 X77.539 Y104.252 E.00473
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.02426
G1 X77.295 Y103.965 E-.119
G1 X77.186 Y103.734 E-.0969
G1 X77.135 Y103.554 E-.07131
G1 X77.11 Y103.295 E-.09885
G1 X77.11 Y102.374 E-.34969
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.128 Y94.81 Z7.16 F42000
G1 X80.07 Y80.377 Z7.16
G1 Z6.76
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1729
M204 S5000
G1 X80.19 Y80.386 E.00269
G3 X79.916 Y80.393 I-.12 J.678 E.0907
G1 X80.01 Y80.381 E.00211
M204 S250
G1 X79.655 Y80.488 F42000
G1 F1729
M204 S5000
G3 X80.052 Y80.354 I.415 J.577 E.00952
G1 X80.12 Y80.356 E.00152
G3 X79.608 Y80.525 I-.05 J.709 E.0875
; WIPE_START
G1 F12000
M204 S6000
G1 X79.778 Y80.417 E-.07651
M73 P84 R1
G1 X79.912 Y80.372 E-.05376
G1 X80.052 Y80.354 E-.05387
G1 X80.12 Y80.356 E-.02581
G1 X80.362 Y80.417 E-.0949
G1 X80.485 Y80.488 E-.05373
G1 X80.591 Y80.581 E-.05385
G1 X80.677 Y80.694 E-.05382
G1 X80.738 Y80.822 E-.05381
G1 X80.773 Y80.959 E-.05383
G1 X80.78 Y81.1 E-.05376
G1 X80.759 Y81.24 E-.05375
G1 X80.711 Y81.373 E-.05383
G1 X80.674 Y81.427 E-.02476
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
G1 X101.735 Y104.197 F42000
G1 Z6.92
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1729
M204 S5000
G1 X101.605 Y104.21 E.00327
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.309 I.021 J-.926 E.03544
G1 X77.49 Y76.695 E.66911
G3 X78.395 Y75.79 I.92 J.016 E.03557
G1 X101.605 Y75.79 E.58353
G3 X102.51 Y76.692 I-.02 J.925 E.03547
G1 X102.51 Y103.305 E.66907
G3 X101.794 Y104.187 I-.922 J-.016 E.03078
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y104.21 E-.07224
G1 X99.795 Y104.21 E-.68776
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.163 Y104.212 Z7.32 F42000
G1 X77.491 Y104.215 Z7.32
G1 Z6.92
G1 E.8 F1800
G1 F1729
M204 S5000
G1 X77.493 Y104.208 E.00018
G3 X77.11 Y103.295 I.924 J-.924 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.305 J.009 E.05106
G1 X101.654 Y75.412 E.58451
G3 X102.888 Y76.637 I-.071 J1.306 E.04782
G1 X102.89 Y103.295 E.67022
M73 P85 R1
G3 X101.595 Y104.59 I-1.298 J-.003 E.05113
G1 X78.405 Y104.59 E.58301
G3 X77.74 Y104.401 I.011 J-1.306 E.01761
G1 X77.539 Y104.251 E.0063
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.493 Y104.208 E-.02417
G1 X77.3 Y103.973 E-.11541
G1 X77.186 Y103.735 E-.10035
G1 X77.124 Y103.487 E-.09709
G1 X77.11 Y103.295 E-.07318
G1 X77.11 Y102.374 E-.3498
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.128 Y94.81 Z7.32 F42000
G1 X80.072 Y80.377 Z7.32
G1 Z6.92
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1729
M204 S5000
G1 X80.19 Y80.386 E.00265
G3 X79.916 Y80.393 I-.12 J.677 E.0905
G1 X80.012 Y80.381 E.00215
M204 S250
G1 X79.657 Y80.487 F42000
G1 F1729
M204 S5000
G1 X79.778 Y80.417 E.00312
G3 X80.052 Y80.354 I.293 J.646 E.00635
G1 X80.121 Y80.356 E.00154
G3 X79.609 Y80.524 I-.051 J.707 E.08735
; WIPE_START
G1 F12000
M204 S6000
G1 X79.778 Y80.417 E-.07571
G1 X79.912 Y80.372 E-.05383
G1 X80.052 Y80.354 E-.05382
G1 X80.121 Y80.356 E-.02619
G1 X80.362 Y80.417 E-.09456
G1 X80.485 Y80.488 E-.05383
G1 X80.591 Y80.581 E-.05368
G1 X80.677 Y80.694 E-.05383
G1 X80.738 Y80.822 E-.0538
G1 X80.773 Y80.959 E-.05384
G1 X80.78 Y81.1 E-.05381
G1 X80.759 Y81.24 E-.05378
G1 X80.711 Y81.373 E-.05378
G1 X80.676 Y81.431 E-.02553
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
G1 X101.741 Y104.196 F42000
G1 Z7.08
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1729
M204 S5000
G1 X101.605 Y104.21 E.00343
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.308 I.021 J-.926 E.03546
G1 X77.49 Y76.695 E.66907
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X101.605 Y75.79 E.58353
G3 X102.51 Y76.695 I-.02 J.925 E.03553
G1 X102.51 Y103.305 E.66901
M73 P86 R1
G3 X101.8 Y104.186 I-.921 J-.016 E.03062
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y104.21 E-.07464
G1 X99.801 Y104.21 E-.68536
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.169 Y104.212 Z7.48 F42000
G1 X77.491 Y104.214 Z7.48
G1 Z7.08
G1 E.8 F1800
G1 F1729
M204 S5000
G1 X77.489 Y104.208 E.00018
G3 X77.11 Y103.295 I.92 J-.916 E.0255
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.656 Y75.412 E.58455
G3 X102.888 Y76.637 I-.073 J1.306 E.04779
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.011 E.05104
G1 X78.405 Y104.59 E.58301
G3 X77.687 Y104.371 I.003 J-1.299 E.01916
G1 X77.538 Y104.252 E.00479
; WIPE_START
M73 P87 R1
G1 F11668.197
M204 S6000
G1 X77.489 Y104.208 E-.02518
G1 X77.294 Y103.963 E-.11905
G1 X77.186 Y103.735 E-.09584
G1 X77.125 Y103.496 E-.09341
G1 X77.11 Y103.295 E-.07686
G1 X77.11 Y102.375 E-.34966
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.129 Y94.81 Z7.48 F42000
G1 X80.073 Y80.377 Z7.48
G1 Z7.08
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1729
M204 S5000
G1 X80.19 Y80.386 E.00261
G3 X79.916 Y80.393 I-.12 J.678 E.09064
G1 X80.014 Y80.38 E.0022
M204 S250
G1 X79.658 Y80.486 F42000
G1 F1729
M204 S5000
G1 X79.777 Y80.416 E.0031
G3 X80.052 Y80.354 I.291 J.648 E.00635
G1 X80.117 Y80.356 E.00146
G3 X79.61 Y80.522 I-.049 J.709 E.08764
; WIPE_START
G1 F12000
M204 S6000
G1 X79.777 Y80.416 E-.07516
G1 X79.912 Y80.372 E-.05384
G1 X80.052 Y80.354 E-.05383
G1 X80.117 Y80.356 E-.02472
G1 X80.362 Y80.417 E-.09597
G1 X80.485 Y80.488 E-.05378
G1 X80.591 Y80.581 E-.05383
G1 X80.677 Y80.694 E-.05382
G1 X80.738 Y80.822 E-.05375
G1 X80.773 Y80.959 E-.0538
G1 X80.78 Y81.1 E-.05385
G1 X80.759 Y81.24 E-.05374
G1 X80.711 Y81.373 E-.05382
G1 X80.672 Y81.43 E-.02609
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
G1 X102.143 Y104.026 F42000
G1 Z7.24
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1729
M204 S5000
G1 X102.102 Y104.052 E.00123
G3 X101.605 Y104.21 I-.518 J-.768 E.0133
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.305 I.021 J-.926 E.03552
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X101.605 Y75.79 E.58353
G3 X102.51 Y76.692 I-.02 J.925 E.03547
G1 X102.51 Y103.305 E.66907
G3 X102.244 Y103.934 I-.926 J-.021 E.01757
G1 X102.188 Y103.985 E.00192
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.102 Y104.052 E-.04123
G1 X101.907 Y104.157 E-.0844
G1 X101.78 Y104.192 E-.05013
G1 X101.605 Y104.21 E-.0667
G1 X100.243 Y104.21 E-.51754
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.611 Y104.212 Z7.64 F42000
G1 X77.491 Y104.215 Z7.64
G1 Z7.24
G1 E.8 F1800
G1 F1729
M204 S5000
G1 X77.492 Y104.208 E.00018
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.657 Y75.412 E.58458
M73 P88 R1
G3 X102.888 Y76.637 I-.074 J1.306 E.04775
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
G1 X78.405 Y104.59 E.58301
G3 X77.688 Y104.369 I.01 J-1.306 E.01913
G1 X77.539 Y104.252 E.00478
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.02425
G1 X77.294 Y103.963 E-.11963
G1 X77.185 Y103.732 E-.09705
G1 X77.135 Y103.552 E-.07123
G1 X77.11 Y103.295 E-.09808
G1 X77.11 Y102.374 E-.34976
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.13 Y94.81 Z7.64 F42000
G1 X80.076 Y80.377 Z7.64
G1 Z7.24
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1729
M204 S5000
G1 X80.19 Y80.386 E.00254
G3 X79.984 Y80.381 I-.118 J.675 E.09177
G1 X80.017 Y80.379 E.00073
M204 S250
G1 X79.659 Y80.485 F42000
G1 F1729
M204 S5000
G1 X79.777 Y80.416 E.00306
G3 X80.052 Y80.354 I.291 J.648 E.00635
G1 X80.118 Y80.356 E.00148
G3 X79.611 Y80.521 I-.05 J.709 E.08765
; WIPE_START
G1 F12000
M204 S6000
G1 X79.777 Y80.416 E-.07465
G1 X79.912 Y80.372 E-.0538
G1 X80.052 Y80.354 E-.0539
G1 X80.118 Y80.356 E-.02505
G1 X80.362 Y80.417 E-.0956
G1 X80.485 Y80.488 E-.05381
G1 X80.591 Y80.581 E-.05381
G1 X80.677 Y80.694 E-.05387
G1 X80.738 Y80.822 E-.05372
G1 X80.773 Y80.959 E-.05384
G1 X80.78 Y81.1 E-.05376
G1 X80.759 Y81.24 E-.05382
G1 X80.711 Y81.374 E-.0538
G1 X80.671 Y81.431 E-.02656
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
G1 X102.165 Y104.009 F42000
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1729
M204 S5000
G1 X102.103 Y104.054 E.00191
G3 X101.605 Y104.21 I-.514 J-.764 E.01331
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.308 I.021 J-.926 E.03545
G1 X77.49 Y76.695 E.66908
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X101.606 Y75.79 E.58355
M73 P89 R1
G3 X102.51 Y76.695 I-.016 J.92 E.03556
M73 P89 R0
G1 X102.51 Y103.305 E.66901
G3 X102.24 Y103.941 I-.92 J-.015 E.0178
G1 X102.209 Y103.969 E.00105
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.103 Y104.054 E-.0516
G1 X101.907 Y104.157 E-.08443
G1 X101.78 Y104.192 E-.05013
G1 X101.605 Y104.21 E-.06672
G1 X100.27 Y104.21 E-.50711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.638 Y104.212 Z7.8 F42000
G1 X77.491 Y104.215 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F1729
M204 S5000
G1 X77.492 Y104.208 E.00018
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.659 Y75.412 E.58462
G3 X102.888 Y76.637 I-.076 J1.306 E.04771
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.299 J-.006 E.05106
G1 X78.405 Y104.59 E.58301
G3 X77.687 Y104.368 I.01 J-1.306 E.01918
G1 X77.539 Y104.252 E.00473
; WIPE_START
M73 P90 R0
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.02425
G1 X77.295 Y103.965 E-.11879
G1 X77.185 Y103.732 E-.09796
G1 X77.137 Y103.559 E-.06846
G1 X77.11 Y103.295 E-.10082
G1 X77.11 Y102.374 E-.34972
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.131 Y94.81 Z7.8 F42000
G1 X80.078 Y80.377 Z7.8
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1729
M204 S5000
G1 X80.19 Y80.386 E.00251
G3 X79.919 Y80.392 I-.118 J.679 E.09075
G1 X80.018 Y80.38 E.00223
M204 S250
G1 X79.66 Y80.485 F42000
G1 F1729
M204 S5000
G1 X79.777 Y80.416 E.00303
G3 X80.052 Y80.354 I.291 J.648 E.00635
G1 X80.119 Y80.356 E.0015
G3 X79.612 Y80.52 I-.051 J.709 E.08766
; WIPE_START
G1 F12000
M204 S6000
G1 X79.777 Y80.416 E-.07418
G1 X79.912 Y80.372 E-.05383
G1 X80.052 Y80.354 E-.05381
G1 X80.119 Y80.356 E-.02549
G1 X80.362 Y80.417 E-.09525
G1 X80.485 Y80.488 E-.05377
G1 X80.591 Y80.581 E-.05384
G1 X80.677 Y80.694 E-.05379
G1 X80.738 Y80.822 E-.05374
G1 X80.773 Y80.959 E-.05381
G1 X80.78 Y81.101 E-.05387
G1 X80.759 Y81.24 E-.05377
G1 X80.711 Y81.373 E-.05378
G1 X80.67 Y81.432 E-.02707
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
G1 X102.144 Y104.025 F42000
G1 Z7.56
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2857
M204 S5000
G1 X102.103 Y104.053 E.00125
G3 X101.605 Y104.21 I-.514 J-.765 E.01331
G1 X82.74 Y104.21 E.47429
G1 X82.34 Y104.21 E.01006
G1 X81.94 Y104.21 E.01006
G1 X81.54 Y104.21 E.01006
G1 F747.227
G1 X81.54 Y104.169 E.00103
M106 S255
G1 F600
G1 X81.54 Y103.8 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X81.54 Y103.01 E.02141
G1 X80.46 Y103.01 E.02927
G1 X80.46 Y103.8 E.02141
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X80.46 Y104.169 E.00928
M106 S201.45
G1 F747.227
G1 X80.46 Y104.21 E.00103
G1 F2857
G1 X80.06 Y104.21 E.01006
G1 X79.66 Y104.21 E.01006
G1 X79.26 Y104.21 E.01006
G1 X78.395 Y104.21 E.02175
G3 X77.49 Y103.308 I.007 J-.912 E.0356
G1 X77.49 Y86.24 E.4291
G1 X77.49 Y85.84 E.01006
G1 X77.49 Y85.44 E.01006
G1 X77.49 Y85.04 E.01006
G1 F747.227
G1 X77.531 Y85.04 E.00103
M106 S255
G1 F600
G1 X77.9 Y85.04 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X78.49 Y85.04 E.01599
G1 X78.49 Y83.96 E.02927
G1 X77.9 Y83.96 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X77.531 Y83.96 E.00928
M106 S201.45
G1 F747.227
G1 X77.49 Y83.96 E.00103
G1 F2857
G1 X77.49 Y83.56 E.01006
G1 X77.49 Y83.16 E.01006
G1 X77.49 Y82.76 E.01006
G1 X77.49 Y76.695 E.15248
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X101.605 Y75.79 E.58353
G3 X102.509 Y76.655 I-.007 J.913 E.03467
G1 X102.51 Y77.76 E.02777
G1 X102.51 Y78.16 E.01006
G1 X102.51 Y78.56 E.01006
G1 X102.51 Y78.96 E.01006
G1 F747.53
G1 X102.469 Y78.96 E.00103
M106 S255
G1 F600
G1 X102.1 Y78.96 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X101.51 Y78.96 E.01599
G1 X101.51 Y80.04 E.02927
G1 X102.1 Y80.04 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X102.469 Y80.04 E.00928
M106 S201.45
G1 F747.227
G1 X102.51 Y80.04 E.00103
G1 F2857
G1 X102.51 Y80.44 E.01006
G1 X102.51 Y80.84 E.01006
G1 X102.51 Y81.24 E.01006
G1 X102.51 Y96.76 E.39019
G1 X102.51 Y97.16 E.01006
G1 X102.51 Y97.56 E.01006
G1 X102.51 Y97.96 E.01006
G1 F747.227
G1 X102.469 Y97.96 E.00103
M106 S255
G1 F600
G1 X102.1 Y97.96 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X101.51 Y97.96 E.01599
G1 X101.51 Y99.04 E.02927
G1 X102.1 Y99.04 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X102.469 Y99.04 E.00928
M106 S201.45
G1 F747.379
G1 X102.51 Y99.04 E.00103
G1 F2857
G1 X102.51 Y99.44 E.01006
G1 X102.51 Y99.84 E.01006
G1 X102.51 Y100.24 E.01006
G1 X102.509 Y103.345 E.07806
G3 X102.24 Y103.941 I-.92 J-.056 E.0168
G1 X102.189 Y103.986 E.00171
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.103 Y104.053 E-.04167
G1 X101.906 Y104.157 E-.08454
G1 X101.78 Y104.192 E-.04996
G1 X101.605 Y104.21 E-.06677
G1 X100.244 Y104.21 E-.51707
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.503 Y99.181 Z7.96 F42000
G1 X77.9 Y84.639 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S6000
G1 X77.518 Y84.639 E.01036
M106 S201.45
G1 F1166.154
G1 X77.518 Y84.361 E.00755
M106 S255
G1 F600
G1 X77.9 Y84.361 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X78.089 Y84.361 E.00513
G1 X78.089 Y84.639 E.00755
M106 S201.45
M106 S255
G1 F3000
G1 X77.96 Y84.639 E.0035
M106 S201.45
; WIPE_START
M204 S6000
G1 X77.518 Y84.639 E-.1977
G1 X77.518 Y84.361 E-.12451
G1 X77.9 Y84.361 E-.1709
M73 P91 R0
G1 X78.089 Y84.361 E-.08459
G1 X78.089 Y84.639 E-.12451
G1 X77.96 Y84.639 E-.05778
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I-1.201 J.199 P1  F42000
G1 X81.139 Y103.819 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X81.139 Y104.183 E.00984
M106 S201.45
G1 F623.509
G1 X81.139 Y104.189 E.00019
G1 F1182.642
G1 X80.861 Y104.183 E.00755
M106 S255
G1 F600
G1 X80.861 Y103.8 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X80.861 Y103.411 E.01055
G1 X81.139 Y103.411 E.00755
G1 X81.139 Y103.759 E.00944
M106 S201.45
; WIPE_START
M204 S6000
G1 X81.139 Y104.183 E-.16085
G1 X81.139 Y104.189 E-.00261
G1 X80.861 Y104.183 E-.10593
G1 X80.861 Y103.8 E-.14535
G1 X80.861 Y103.411 E-.14795
G1 X81.139 Y103.411 E-.1059
G1 X81.139 Y103.651 E-.09141
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I.283 J1.184 P1  F42000
G1 X102.1 Y98.639 Z7.96
G1 Z7.56
G1 E.8 F1800
M106 S255
G1 F600
M204 S5000
G1 X101.911 Y98.639 E.00513
G1 X101.911 Y98.361 E.00755
G1 X102.1 Y98.361 E.00513
M106 S201.45
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X102.483 Y98.361 E.01036
M106 S201.45
G1 F1181.837
G1 X102.489 Y98.639 E.00755
G1 F622.368
G1 X102.483 Y98.639 E.00018
M106 S255
G1 F600
G1 X102.16 Y98.639 E.00874
M106 S201.45
; WIPE_START
G1 X101.911 Y98.639 E-.11097
G1 X101.911 Y98.361 E-.12403
G1 X102.1 Y98.361 E-.08426
G1 X102.483 Y98.361 E-.17023
G1 X102.489 Y98.639 E-.12407
G1 X102.483 Y98.639 E-.00291
G1 X102.16 Y98.639 E-.14353
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I1.217 J-.004 P1  F42000
G1 X102.1 Y79.639 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X101.911 Y79.639 E.00513
G1 X101.911 Y79.361 E.00755
G1 X102.1 Y79.361 E.00513
M106 S201.45
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X102.483 Y79.361 E.01036
M106 S201.45
G1 F1178.823
G1 X102.488 Y79.639 E.00755
G1 F618.089
G1 X102.483 Y79.639 E.00014
M106 S255
G1 F600
G1 X102.16 Y79.639 E.00874
M106 S201.45
; WIPE_START
G1 X101.911 Y79.639 E-.11105
G1 X101.911 Y79.361 E-.12412
G1 X102.1 Y79.361 E-.08433
G1 X102.483 Y79.361 E-.17036
G1 X102.488 Y79.639 E-.12415
G1 X102.483 Y79.639 E-.00236
G1 X102.16 Y79.639 E-.14364
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I-.859 J-.862 P1  F42000
G1 X77.491 Y104.215 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2857
M204 S5000
G1 X77.492 Y104.208 E.00018
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.298 J.003 E.05112
G1 X101.66 Y75.412 E.58466
G3 X102.888 Y76.637 I-.077 J1.306 E.04768
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.299 J-.006 E.05106
G1 X78.403 Y104.59 E.58307
G3 X77.687 Y104.368 I.013 J-1.306 E.01912
G1 X77.539 Y104.252 E.00473
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.02426
G1 X77.297 Y103.968 E-.11754
G1 X77.185 Y103.732 E-.09924
G1 X77.135 Y103.552 E-.07112
G1 X77.11 Y103.295 E-.09813
G1 X77.11 Y102.374 E-.34972
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.131 Y94.81 Z7.96 F42000
G1 X80.078 Y80.377 Z7.96
G1 Z7.56
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F2857
M204 S5000
G1 X80.189 Y80.386 E.00249
G3 X79.917 Y80.393 I-.12 J.678 E.09065
G1 X80.019 Y80.38 E.0023
M204 S250
G1 X79.646 Y80.502 F42000
G1 F2857
M204 S5000
G1 X79.778 Y80.417 E.0035
G3 X80.052 Y80.354 I.292 J.648 E.00634
G1 X80.123 Y80.356 E.00158
G3 X79.596 Y80.535 I-.053 J.709 E.08711
; WIPE_START
G1 F12000
M204 S6000
G1 X79.778 Y80.417 E-.08229
G1 X79.912 Y80.372 E-.05377
G1 X80.052 Y80.354 E-.05375
G1 X80.123 Y80.356 E-.02675
G1 X80.365 Y80.418 E-.09492
G1 X80.485 Y80.488 E-.05295
G1 X80.591 Y80.581 E-.05377
G1 X80.677 Y80.694 E-.05374
G1 X80.738 Y80.822 E-.05378
G1 X80.773 Y80.959 E-.05388
G1 X80.78 Y81.1 E-.05379
G1 X80.759 Y81.241 E-.05382
G1 X80.711 Y81.374 E-.0538
G1 X80.684 Y81.416 E-.01899
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
G1 X101.51 Y97.96 F42000
G1 Z7.72
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1851
M204 S5000
G1 X101.51 Y99.04 E.02715
G1 X102.51 Y99.04 E.02514
G1 X102.509 Y103.347 E.10829
G3 X101.605 Y104.21 I-.92 J-.059 E.03453
G1 X81.54 Y104.21 E.50446
G1 X81.54 Y103.01 E.03017
G1 X80.46 Y103.01 E.02715
M73 P92 R0
G1 X80.46 Y104.21 E.03017
G1 X78.395 Y104.21 E.05191
G3 X77.49 Y103.305 I.007 J-.912 E.03566
G1 X77.49 Y85.04 E.45921
G1 X78.49 Y85.04 E.02514
G1 X78.49 Y83.96 E.02715
G1 X77.49 Y83.96 E.02514
G1 X77.49 Y76.695 E.18266
G3 X78.395 Y75.79 I.92 J.016 E.03557
G1 X101.605 Y75.79 E.58353
G3 X102.509 Y76.653 I-.007 J.913 E.03461
G1 X102.51 Y78.96 E.05801
G1 X101.51 Y78.96 E.02514
G1 X101.51 Y80.04 E.02715
G1 X102.51 Y80.04 E.02514
G1 X102.51 Y97.96 E.45053
G1 X101.57 Y97.96 E.02363
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.51 Y99.04 E-.41104
G1 X102.428 Y99.04 E-.34896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I-.247 J-1.192 P1  F42000
G1 X77.491 Y104.215 Z8.12
G1 Z7.72
G1 E.8 F1800
G1 F1851
M204 S5000
G1 X77.492 Y104.208 E.00018
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.703 E.66855
G3 X78.405 Y75.41 I1.299 J.006 E.05106
G1 X101.662 Y75.412 E.58469
G3 X102.888 Y76.637 I-.079 J1.306 E.04764
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
G1 X78.405 Y104.59 E.58301
M73 P93 R0
G3 X77.688 Y104.369 I.01 J-1.306 E.01913
G1 X77.538 Y104.252 E.00479
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.0242
G1 X77.295 Y103.965 E-.11892
G1 X77.186 Y103.734 E-.09693
G1 X77.124 Y103.487 E-.09703
G1 X77.11 Y103.295 E-.07315
G1 X77.11 Y102.374 E-.34978
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

G1 X81.328 Y103.853
G1 Z7.72
G1 E.8 F1800
; FEATURE: Top surface
G1 F1851
M204 S2000
G1 X80.803 Y104.378 E.01865
G1 X80.672 Y103.964
G1 X81.328 Y103.308 E.02332
; WIPE_START
G1 F11668.197
M204 S6000
G1 X80.672 Y103.964 E-.35243
G1 X80.803 Y104.378 E-.16508
G1 X81.255 Y103.927 E-.24249
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I1.202 J-.192 P1  F42000
G1 X78.102 Y84.172 Z8.12
G1 Z7.72
G1 E.8 F1800
G1 F1851
M204 S2000
G1 X77.446 Y84.828 E.02332
M204 S10000
G1 X78.263 Y84.847 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102989
G1 F1851
M204 S6000
G1 X78.263 Y84.153 E.00311
; WIPE_START
G1 F18000
G1 X78.263 Y84.847 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I.273 J1.186 P1  F42000
G1 X102.676 Y79.233 Z8.12
G1 Z7.72
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
M73 P94 R0
G1 F1851
M204 S2000
G1 X102.081 Y79.828 E.02117
G1 X101.722 Y79.641
G1 X102.191 Y79.172 E.01668
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.722 Y79.641 E-.26406
G1 X102.081 Y79.828 E-.16093
G1 X102.676 Y79.233 E-.335
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.479 Y86.862 Z8.12 F42000
G1 X102.17 Y98.828 Z8.12
G1 Z7.72
G1 E.8 F1800
G1 F1851
M204 S2000
G1 X102.678 Y98.32 E.01804
G1 X102.281 Y98.172
G1 X101.722 Y98.731 E.01986
; CHANGE_LAYER
; Z_HEIGHT: 7.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.281 Y98.172 E-.31079
G1 X102.678 Y98.32 E-.1668
G1 X102.17 Y98.828 E-.2824
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/50
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.12 I1.217 J-.01 P1  F42000
G1 X101.987 Y75.882 Z8.12
G1 Z7.88
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1647
M204 S5000
G3 X102.51 Y76.695 I-.403 J.834 E.02557
G1 X102.51 Y103.305 E.66901
G3 X101.608 Y104.21 I-.92 J-.015 E.03552
G1 X78.395 Y104.21 E.58359
G3 X77.49 Y103.308 I.015 J-.921 E.03551
G1 X77.49 Y76.695 E.66909
G3 X78.395 Y75.79 I.92 J.016 E.03557
G1 X101.605 Y75.79 E.58353
G3 X101.932 Y75.858 I-.021 J.926 E.00845
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.146 Y75.971 E-.09182
G1 X102.242 Y76.055 E-.04844
G1 X102.423 Y76.311 E-.11913
G1 X102.492 Y76.52 E-.08378
G1 X102.51 Y76.695 E-.06689
G1 X102.51 Y77.616 E-.34995
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.281 Y83.175 Z8.28 F42000
G1 X77.491 Y104.215 Z8.28
G1 Z7.88
G1 E.8 F1800
G1 F1647
M204 S5000
G1 X77.492 Y104.208 E.00018
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.01 E.05104
G1 X101.663 Y75.412 E.58473
M73 P95 R0
G3 X102.888 Y76.637 I-.08 J1.306 E.04761
G1 X102.89 Y103.295 E.67021
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
G1 X78.405 Y104.59 E.58301
G3 X77.689 Y104.369 I.01 J-1.306 E.01913
G1 X77.538 Y104.252 E.0048
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.02421
G1 X77.328 Y104.016 E-.09587
G1 X77.186 Y103.734 E-.11996
G1 X77.135 Y103.554 E-.07113
G1 X77.11 Y103.295 E-.09906
G1 X77.11 Y102.374 E-.34977
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
G1 X101.988 Y75.879 F42000
G1 Z8.04
G1 E.8 F1800
G1 F1647
M204 S5000
G3 X102.51 Y76.695 I-.393 J.826 E.02567
G1 X102.51 Y103.308 E.66907
G3 X101.605 Y104.21 I-.912 J-.01 E.0356
G1 X78.392 Y104.21 E.5836
G3 X77.49 Y103.305 I.01 J-.912 E.03559
G1 X77.49 Y76.695 E.66903
M73 P96 R0
G3 X78.395 Y75.79 I.915 J.01 E.03563
G1 X99.1 Y75.79 E.52055
G1 X101.605 Y75.79 E.06298
G3 X101.933 Y75.855 I-.01 J.915 E.00846
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.178 Y75.996 E-.10732
G1 X102.275 Y76.088 E-.05081
G1 X102.423 Y76.311 E-.10164
G1 X102.493 Y76.522 E-.0847
G1 X102.51 Y76.695 E-.06592
G1 X102.51 Y77.615 E-.34962
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.281 Y83.175 Z8.44 F42000
G1 X77.491 Y104.215 Z8.44
G1 Z8.04
G1 E.8 F1800
G1 F1647
M204 S5000
G1 X77.492 Y104.208 E.00018
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.01 E.05105
G1 X101.664 Y75.412 E.58477
G3 X102.888 Y76.637 I-.082 J1.306 E.04757
G1 X102.89 Y103.295 E.67021
G3 X101.595 Y104.59 I-1.306 J-.01 E.05104
G1 X78.406 Y104.59 E.58301
G3 X77.687 Y104.368 I.01 J-1.306 E.01919
G1 X77.538 Y104.252 E.00473
; WIPE_START
M73 P97 R0
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.02419
G1 X77.294 Y103.964 E-.11918
G1 X77.186 Y103.735 E-.09655
G1 X77.135 Y103.554 E-.07124
G1 X77.11 Y103.295 E-.09902
G1 X77.11 Y102.374 E-.34982
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

    G1 Z108.04 F600
M73 P98 R0
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


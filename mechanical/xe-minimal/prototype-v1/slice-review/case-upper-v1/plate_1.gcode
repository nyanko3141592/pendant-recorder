; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 5m 55s; total estimated time: 6m 14s
; total layer number: 30
; total filament length [mm] : 438.91
; total filament volume [cm^3] : 1055.70
; total filament weight [g] : 1.31
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 4.84
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
M73 P0 R6
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
M73 P2 R6
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
; layer num/total_layer_count: 1/30
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
M73 P4 R5
G1 X89.88 Y102.806 F42000
M204 S6000
M73 P5 R5
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X90.011 Y102.8 E.00489
G3 X89.821 Y102.811 I-.012 J1.499 E.34377
; WIPE_START
G1 X90.011 Y102.8 E-.07258
G1 X90.307 Y102.832 E-.11289
G1 X90.588 Y102.92 E-.11186
G1 X90.848 Y103.063 E-.11279
G1 X90.966 Y103.153 E-.05654
G1 X91.172 Y103.364 E-.11198
G1 X91.333 Y103.612 E-.1124
G1 X91.4 Y103.781 E-.06896
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X88.706 Y96.639 Z.6 F42000
G1 X87.465 Y93.35 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X87.598 Y93.319 E.00509
G1 X87.819 Y93.303 E.00825
G3 X87.168 Y93.418 I.056 J2.221 E.49524
G1 X87.407 Y93.363 E.00912
M204 S6000
G1 X87.566 Y93.794 F42000
G1 F3000
M204 S500
G1 X87.655 Y93.774 E.0034
G1 X87.831 Y93.76 E.00655
G3 X87.313 Y93.852 I.044 J1.764 E.39329
G1 X87.508 Y93.807 E.00743
M204 S6000
G1 X87.668 Y94.238 F42000
G1 F3000
M204 S500
G1 X87.712 Y94.228 E.0017
G1 X87.842 Y94.218 E.00486
G3 X87.459 Y94.285 I.033 J1.307 E.29135
G1 X87.609 Y94.251 E.00575
M204 S6000
G1 X87.769 Y94.682 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X87.854 Y94.675 E.00316
G3 X87.71 Y94.691 I.021 J.849 E.19347
; WIPE_START
G1 X87.854 Y94.675 E-.05503
G1 X88.023 Y94.688 E-.06433
G1 X88.186 Y94.734 E-.06433
G1 X88.336 Y94.811 E-.06433
G1 X88.469 Y94.917 E-.06434
G1 X88.578 Y95.046 E-.06439
G1 X88.659 Y95.195 E-.06435
G1 X88.708 Y95.357 E-.06434
G1 X88.725 Y95.526 E-.06443
G1 X88.708 Y95.694 E-.06431
G1 X88.659 Y95.856 E-.06429
G1 X88.581 Y95.998 E-.06152
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X89.121 Y101.044 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X78.657 Y101.042 E.38976
G1 X78.657 Y74.957 E.97156
G1 X101.342 Y74.958 E.84492
G1 X101.343 Y101.042 E.97152
G1 X90.879 Y101.044 E.38976
M73 P6 R5
G1 X90.879 Y101.564 E.01937
G2 X89.121 Y101.561 I-.884 J2.855 E.06645
G1 X89.121 Y101.104 E.01701
M204 S6000
G1 X88.664 Y101.501 F42000
G1 F3000
M204 S500
G1 X78.388 Y101.499 E.38275
G1 X78.321 Y101.483 E.00255
G1 X78.263 Y101.444 E.0026
G3 X78.2 Y101.272 I.161 J-.157 E.00706
G1 X78.2 Y74.727 E.98869
G3 X78.429 Y74.5 I.208 J-.019 E.01371
G1 X101.612 Y74.501 E.86348
G1 X101.676 Y74.517 E.00247
G1 X101.741 Y74.56 E.0029
G1 X101.785 Y74.627 E.00299
G1 X101.799 Y74.691 E.00244
G1 X101.8 Y101.274 E.99013
G3 X101.61 Y101.499 I-.206 J.019 E.01224
G1 X91.336 Y101.501 E.38266
G1 X91.336 Y102.267 E.02854
G2 X89.09 Y102.063 I-1.33 J2.175 E.08702
G2 X88.664 Y102.287 I.924 J2.267 E.01795
G1 X88.664 Y101.561 E.02706
M204 S6000
G1 X88.207 Y101.958 F42000
G1 F3000
M204 S500
G1 X78.366 Y101.956 E.36653
G3 X77.743 Y101.283 I.046 J-.668 E.03767
G1 X77.743 Y74.717 E.98949
M73 P7 R5
G3 X78.417 Y74.043 I.667 J-.006 E.03956
G1 X101.626 Y74.044 E.86443
G3 X102.256 Y74.668 I-.035 J.665 E.03613
G1 X102.257 Y101.284 E.99135
G3 X101.632 Y101.956 I-.66 J.012 E.03779
G1 X91.793 Y101.958 E.36647
G1 X91.793 Y103.119 E.04323
G1 X91.603 Y103.18 E.00743
G2 X88.395 Y103.182 I-1.604 J1.139 E.13974
G1 X88.207 Y103.119 E.00737
G1 X88.207 Y102.018 E.04102
M204 S6000
G1 X87.75 Y102.415 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X78.345 Y102.413 E.3503
G3 X77.286 Y101.294 I.073 J-1.13 E.06313
G1 X77.286 Y74.706 E.99029
G3 X78.406 Y73.586 I1.128 J.008 E.06544
G1 X101.64 Y73.587 E.86538
G3 X102.713 Y74.646 I-.055 J1.128 E.06145
G1 X102.714 Y101.295 E.99257
M73 P8 R5
G3 X101.655 Y102.413 I-1.118 J.002 E.06332
G1 X92.25 Y102.415 E.35029
G1 X92.25 Y104.553 E.07965
G3 X88.143 Y105.57 I-2.249 J-.282 E.20323
G3 X87.75 Y104.553 I2.169 J-1.421 E.04094
G1 X87.75 Y102.475 E.07738
; WIPE_START
G1 X85.75 Y102.462 E-.76
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

G1 X88.221 Y103.57
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.414646
G1 F3000
M204 S500
G1 X88.481 Y103.451 E.00865
M204 S6000
G1 X88.221 Y103.57 F42000
; LINE_WIDTH: 0.448535
G1 F3000
M204 S500
G1 X88.194 Y103.583 E.00099
G1 X88.168 Y103.732 E.005
; LINE_WIDTH: 0.397391
G1 X88.144 Y103.921 E.0055
; LINE_WIDTH: 0.337941
G1 X88.129 Y104.479 E.01342
G2 X91.872 Y104.139 I1.87 J-.183 E.14126
G1 X91.859 Y103.953 E.0045
; LINE_WIDTH: 0.38955
G1 X91.837 Y103.764 E.00537
; LINE_WIDTH: 0.42652
G1 X91.823 Y103.678 E.00272
; LINE_WIDTH: 0.462773
G1 X91.806 Y103.581 E.00337
G1 X91.515 Y103.449 E.01094
M204 S6000
G1 X91.564 Y102.695 F42000
; LINE_WIDTH: 0.118969
G1 F3000
M204 S500
G1 X91.382 Y102.574 E.00136
; WIPE_START
G1 X91.564 Y102.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X94.152 Y95.515 Z.6 F42000
G1 X101.159 Y76.071 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50281
G1 F6300
M204 S500
G1 X100.434 Y75.347 E.03839
G1 X99.784 Y75.347 E.02437
G1 X100.953 Y76.516 E.06196
G1 X100.953 Y77.166 E.02437
G1 X99.134 Y75.347 E.09643
G1 X98.483 Y75.347 E.02437
G1 X100.953 Y77.817 E.13091
G1 X100.953 Y78.467 E.02437
G1 X97.833 Y75.347 E.16538
G1 X97.182 Y75.347 E.02437
G1 X100.953 Y79.118 E.19985
G1 X100.953 Y79.768 E.02437
G1 X96.532 Y75.347 E.23432
G1 X95.882 Y75.347 E.02437
G1 X100.953 Y80.418 E.2688
G1 X100.953 Y81.069 E.02437
G1 X95.231 Y75.347 E.30327
G1 X94.581 Y75.347 E.02437
G1 X100.954 Y81.719 E.33774
M73 P9 R5
G1 X100.954 Y82.37 E.02437
G1 X93.93 Y75.346 E.37222
G1 X93.28 Y75.346 E.02437
G1 X100.954 Y83.02 E.40669
G1 X100.954 Y83.671 E.02437
G1 X92.63 Y75.346 E.44116
G1 X91.979 Y75.346 E.02437
G1 X100.954 Y84.321 E.47563
G1 X100.954 Y84.971 E.02437
G1 X91.329 Y75.346 E.51011
G1 X90.678 Y75.346 E.02437
G1 X100.954 Y85.622 E.54458
G1 X100.954 Y86.272 E.02437
G1 X90.028 Y75.346 E.57905
G1 X89.377 Y75.346 E.02437
G1 X100.954 Y86.923 E.61353
G1 X100.954 Y87.573 E.02437
G1 X88.727 Y75.346 E.648
G1 X88.077 Y75.346 E.02437
G1 X100.954 Y88.223 E.68247
G1 X100.954 Y88.874 E.02437
G1 X87.426 Y75.346 E.71694
M73 P10 R5
G1 X86.776 Y75.346 E.02437
G1 X100.954 Y89.524 E.75142
G1 X100.954 Y90.175 E.02437
G1 X86.125 Y75.346 E.78589
G1 X85.475 Y75.346 E.02437
G1 X100.954 Y90.825 E.82036
G1 X100.954 Y91.476 E.02437
G1 X84.825 Y75.346 E.85484
G1 X84.174 Y75.346 E.02437
G1 X100.954 Y92.126 E.88931
G1 X100.954 Y92.776 E.02437
G1 X83.524 Y75.346 E.92378
G1 X82.873 Y75.346 E.02437
G1 X100.954 Y93.427 E.95825
G1 X100.954 Y94.077 E.02437
G1 X82.223 Y75.346 E.99273
G1 X81.572 Y75.346 E.02437
G1 X100.954 Y94.728 E1.0272
M73 P11 R5
G1 X100.954 Y95.378 E.02437
G1 X80.922 Y75.346 E1.06167
G1 X80.272 Y75.346 E.02437
G1 X100.954 Y96.029 E1.09615
G1 X100.954 Y96.679 E.02437
G1 X79.621 Y75.346 E1.13062
G1 X79.045 Y75.346 E.02158
G1 X79.045 Y75.42 E.00279
G1 X100.954 Y97.329 E1.16114
G1 X100.955 Y97.98 E.02437
G1 X79.045 Y76.071 E1.16114
G1 X79.045 Y76.721 E.02437
G1 X100.955 Y98.63 E1.16115
G1 X100.955 Y99.281 E.02437
G1 X79.045 Y77.371 E1.16115
M73 P12 R5
G1 X79.045 Y78.022 E.02437
G1 X100.955 Y99.931 E1.16115
G1 X100.955 Y100.582 E.02437
G1 X79.045 Y78.672 E1.16115
G1 X79.045 Y79.323 E.02437
G1 X100.376 Y100.654 E1.13051
G1 X99.726 Y100.654 E.02437
G1 X79.045 Y79.973 E1.09605
G1 X79.045 Y80.623 E.02437
G1 X99.076 Y100.654 E1.06158
G1 X98.426 Y100.654 E.02437
G1 X79.045 Y81.274 E1.02712
G1 X79.045 Y81.924 E.02437
G1 X97.775 Y100.654 E.99266
G1 X97.125 Y100.654 E.02437
M73 P13 R5
G1 X79.045 Y82.574 E.9582
G1 X79.045 Y83.225 E.02437
G1 X96.475 Y100.654 E.92373
G1 X95.825 Y100.655 E.02437
G1 X90.476 Y95.306 E.28348
G1 X90.476 Y95.786 E.018
G1 X90.447 Y95.927 E.00541
G1 X95.174 Y100.655 E.25054
G1 X94.524 Y100.655 E.02437
G1 X90.311 Y96.442 E.22328
G3 X90.103 Y96.884 I-1.571 J-.471 E.01838
G1 X93.874 Y100.655 E.19987
G1 X93.224 Y100.655 E.02437
G1 X89.827 Y97.259 E.17999
G3 X89.487 Y97.569 I-1.736 J-1.561 E.01728
G1 X92.573 Y100.655 E.16355
G1 X91.923 Y100.655 E.02437
G1 X89.096 Y97.828 E.14985
G1 X88.708 Y98.003 E.01594
G1 X88.637 Y98.019 E.00274
G1 X91.273 Y100.655 E.13971
G1 X90.622 Y100.655 E.02437
G1 X87.888 Y97.921 E.14493
; WIPE_START
G1 X89.302 Y99.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X88.347 Y93.177 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X79.045 Y83.875 E.49295
G1 X79.045 Y84.526 E.02437
G1 X87.47 Y92.95 E.44649
M73 P14 R5
G1 X87.053 Y93.045 E.01602
G1 X86.954 Y93.084 E.00401
G1 X79.045 Y85.176 E.41913
G1 X79.045 Y85.826 E.02437
G1 X86.515 Y93.296 E.39588
G2 X86.147 Y93.578 I1.291 J2.066 E.01741
G1 X79.045 Y86.477 E.37636
G1 X79.045 Y87.127 E.02437
G1 X85.829 Y93.91 E.3595
G1 X85.569 Y94.301 E.01758
G1 X79.045 Y87.777 E.34573
G1 X79.045 Y88.428 E.02437
G1 X85.377 Y94.759 E.33555
G1 X85.274 Y95.307 E.02089
G1 X79.045 Y89.078 E.33012
G1 X79.045 Y89.729 E.02437
G1 X85.318 Y96.001 E.33244
G1 X85.378 Y96.296 E.01128
G1 X85.58 Y96.775 E.01949
G1 X85.873 Y97.205 E.0195
G1 X86.245 Y97.569 E.0195
G1 X86.683 Y97.851 E.01952
G1 X87.167 Y98.041 E.01951
G1 X87.399 Y98.082 E.00881
G1 X90.378 Y101.062 E.1579
G2 X89.717 Y101.051 I-.396 J4.104 E.0248
G1 X79.045 Y90.379 E.56559
G1 X79.045 Y91.029 E.02437
G1 X88.671 Y100.655 E.51015
G1 X88.021 Y100.655 E.02438
G1 X79.045 Y91.68 E.47568
G1 X79.045 Y92.33 E.02437
G1 X87.37 Y100.655 E.4412
M73 P15 R5
G1 X86.72 Y100.655 E.02438
G1 X79.045 Y92.981 E.40673
G1 X79.045 Y93.631 E.02437
G1 X86.069 Y100.655 E.37225
G1 X85.419 Y100.655 E.02438
G1 X79.045 Y94.281 E.33778
G1 X79.045 Y94.932 E.02437
G1 X84.768 Y100.655 E.3033
G1 X84.118 Y100.655 E.02438
G1 X79.045 Y95.582 E.26883
G1 X79.045 Y96.232 E.02437
G1 X83.467 Y100.654 E.23435
G1 X82.817 Y100.654 E.02438
G1 X79.045 Y96.883 E.19988
G1 X79.045 Y97.533 E.02437
G1 X82.166 Y100.654 E.1654
G1 X81.516 Y100.654 E.02438
G1 X79.045 Y98.184 E.13093
G1 X79.045 Y98.834 E.02437
G1 X80.865 Y100.654 E.09645
G1 X80.215 Y100.654 E.02438
G1 X79.045 Y99.484 E.06198
G1 X79.045 Y100.135 E.02437
G1 X79.77 Y100.859 E.0384
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6300
G1 X79.045 Y100.135 E-.38943
G1 X79.045 Y99.484 E-.24714
G1 X79.275 Y99.714 E-.12343
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/30
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S198.9
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.6 I-.345 J1.167 P1  F42000
G1 X89.881 Y102.846 Z.6
G1 Z.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X90.009 Y102.84 E.00323
G3 X89.821 Y102.851 I-.01 J1.459 E.22579
; WIPE_START
M204 S6000
G1 X90.009 Y102.84 E-.07162
G1 X90.157 Y102.849 E-.05625
G1 X90.439 Y102.908 E-.10958
G1 X90.704 Y103.021 E-.10943
G1 X90.941 Y103.184 E-.10939
G1 X91.14 Y103.387 E-.10779
G1 X91.297 Y103.629 E-.10945
G1 X91.381 Y103.84 E-.08649
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.02 Y96.33 Z.76 F42000
G1 X89.718 Y94.661 Z.76
G1 Z.36
M73 P16 R5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X89.827 Y94.924 E.00771
G3 X87.621 Y93.497 I-1.952 J.6 E.27043
G1 X87.824 Y93.482 E.00551
G3 X89.669 Y94.548 I.051 J2.042 E.06075
G1 X89.694 Y94.606 E.0017
M204 S10000
G1 X89.336 Y94.822 F42000
G1 F10826.06
M204 S6000
G1 X89.43 Y95.046 E.00658
G3 X87.673 Y93.91 I-1.555 J.478 E.21536
G1 X87.834 Y93.898 E.00439
G3 X89.304 Y94.747 I.041 J1.626 E.04838
G1 X89.312 Y94.767 E.00058
M204 S10000
G1 X88.954 Y94.983 F42000
G1 F10826.06
M204 S6000
G1 X89.032 Y95.169 E.00546
G3 X87.725 Y94.323 I-1.157 J.356 E.16029
G1 X87.845 Y94.314 E.00327
G3 X88.929 Y94.929 I.03 J1.21 E.03547
M204 S250
G1 X88.586 Y95.138 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X87.774 Y94.721 I-.711 J.387 E.10354
G1 X87.855 Y94.715 E.00203
G3 X88.556 Y95.086 I.02 J.809 E.02084
; WIPE_START
M204 S6000
G1 X88.649 Y95.287 E-.08401
G1 X88.681 Y95.444 E-.06105
G1 X88.66 Y95.725 E-.1071
G1 X88.605 Y95.877 E-.06129
G1 X88.521 Y96.015 E-.06137
G1 X88.411 Y96.133 E-.06126
G1 X88.28 Y96.227 E-.06134
G1 X88.133 Y96.293 E-.06132
G1 X87.976 Y96.329 E-.06139
G1 X87.814 Y96.333 E-.06122
G1 X87.656 Y96.305 E-.06127
G1 X87.613 Y96.289 E-.01737
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.935 Y101.34 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X78.36 Y101.338 E.28654
G1 X78.36 Y74.661 E.72288
G1 X101.638 Y74.662 E.63075
G1 X101.64 Y101.338 E.72284
G1 X91.058 Y101.34 E.28673
G1 X91.058 Y101.823 E.01309
G2 X88.942 Y101.82 I-1.062 J2.51 E.05889
G1 X88.942 Y101.393 E.01157
M204 S10000
G1 X88.522 Y101.756 F42000
G1 F10826.06
M204 S6000
G1 X78.376 Y101.754 E.27491
G1 X78.25 Y101.729 E.00349
G3 X77.945 Y101.275 I.159 J-.436 E.01586
G1 X77.945 Y74.691 E.72036
G3 X78.425 Y74.245 I.466 J.021 E.01967
G1 X101.624 Y74.247 E.6286
G1 X101.636 Y74.247 E.00034
G3 X102.053 Y74.678 I-.039 J.455 E.01772
G1 X102.055 Y101.31 E.72165
G3 X101.622 Y101.754 I-.457 J-.013 E.01845
G1 X91.474 Y101.756 E.27499
G1 X91.474 Y102.537 E.02116
G2 X90.016 Y102.023 I-1.58 J2.159 E.04249
G2 X88.526 Y102.56 I.003 J2.343 E.04377
G1 X88.526 Y101.811 E.0203
M204 S10000
G1 X88.108 Y102.171 F42000
G1 F10826.06
M204 S6000
G1 X78.357 Y102.169 E.26424
G3 X77.529 Y101.285 I.049 J-.875 E.03622
G1 X77.529 Y74.708 E.72015
G3 X78.415 Y73.83 I.877 J-.002 E.03762
G1 X101.637 Y73.831 E.62925
G3 X102.469 Y74.658 I-.049 J.881 E.03476
G1 X102.471 Y101.292 E.72172
G3 X101.643 Y102.169 I-.874 J.004 E.03607
G1 X91.889 Y102.171 E.26428
G1 X91.889 Y103.489 E.03572
G1 X91.693 Y103.532 E.00544
G2 X88.305 Y103.536 I-1.693 J.78 E.11518
G1 X88.111 Y103.492 E.0054
G1 X88.111 Y102.229 E.03421
M204 S250
G1 X87.71 Y102.572 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2622.814
M204 S5000
G1 X87.669 Y102.572 E.00103
G1 F2340
G1 X78.337 Y102.57 E.23461
G3 X77.961 Y102.493 I.158 J-1.732 E.00968
G1 F2520
G1 X77.857 Y102.45 E.00284
G1 F2340
G3 X77.696 Y102.359 I.535 J-1.136 E.00466
G1 F2520
G1 X77.594 Y102.283 E.0032
G1 F2340
G3 X77.388 Y102.069 I.814 J-.989 E.00749
G1 F2520
G1 X77.309 Y101.953 E.00351
G1 F2340
G3 X77.184 Y101.672 I1.346 J-.767 E.00776
G1 F2520
G3 X77.135 Y101.424 I1.282 J-.384 E.00635
G1 F2340
G3 X77.129 Y100.695 I7.421 J-.429 E.01834
G1 X77.129 Y75.303 E.63838
G3 X77.13 Y74.641 I13.584 J-.3 E.01666
G1 F2520
M73 P17 R5
G1 X77.143 Y74.514 E.0032
G1 F2340
G3 X77.544 Y73.76 I1.311 J.215 E.02186
G1 F2520
G3 X77.746 Y73.61 I.863 J.951 E.00634
G1 F2340
G3 X78.029 Y73.484 I.766 J1.343 E.00778
G1 F2520
G3 X78.276 Y73.435 I.384 J1.285 E.00635
G1 F2340
G3 X79.005 Y73.429 I.429 J7.414 E.01834
G1 X101.651 Y73.43 E.56933
G3 X102.87 Y74.638 I-.067 J1.287 E.04721
G1 X102.871 Y100.698 E.65517
G3 X102.87 Y101.36 I-13.547 J.301 E.01666
G1 F2520
G1 X102.857 Y101.487 E.0032
G1 F2340
G3 X102.499 Y102.199 I-1.267 J-.191 E.02039
G1 F2520
G3 X101.967 Y102.518 I-.928 J-.946 E.01574
G1 F2340
G3 X101.662 Y102.57 I-.414 J-1.493 E.00778
G1 X92.331 Y102.572 E.2346
G1 F2622.814
G1 X92.29 Y102.572 E.00103
G1 F6229.35
G1 X92.289 Y102.972 E.01006
G1 F11371.885
G1 X92.287 Y103.372 E.01006
G1 F11668.197
G1 X92.285 Y103.772 E.01006
G1 X92.282 Y104.59 E.02058
G3 X87.718 Y104.59 I-2.282 J-.303 E.16656
G1 X87.71 Y102.632 E.04924
; WIPE_START
M204 S6000
G1 X87.669 Y102.572 E-.02766
G1 X85.742 Y102.572 E-.73234
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

G1 X88.337 Y103.042
G1 Z.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0961221
G1 F18000
M204 S6000
G3 X88.381 Y102.962 I.101 J.004 E.00038
G1 X88.429 Y102.92 E.00026
M204 S10000
G1 X88.413 Y103.765 F42000
; LINE_WIDTH: 0.467089
G1 F10398.554
M204 S6000
G1 X88.142 Y103.942 E.00912
G1 X88.129 Y104.483 E.01527
G2 X91.871 Y104.134 I1.87 J-.188 E.16581
G1 X91.861 Y103.97 E.00464
G2 X91.831 Y103.707 I-5.342 J.477 E.00745
M204 S10000
G1 X91.663 Y103.041 F42000
; LINE_WIDTH: 0.0986254
G1 F18000
M204 S6000
G1 X91.644 Y102.981 E.00026
; LINE_WIDTH: 0.119638
G1 X91.628 Y102.939 E.00025
G1 X91.5 Y102.832 E.00093
; LINE_WIDTH: 0.0909853
G1 X91.457 Y102.799 E.0002
; WIPE_START
G1 X91.5 Y102.832 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.011 Y101.474 Z.76 F42000
G1 X100.688 Y101.171 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422186
G1 F11602.424
M204 S6000
G1 X101.299 Y100.56 E.02184
G1 X101.299 Y100.012 E.01387
G1 X100.313 Y100.998 E.03525
G1 X99.764 Y100.998 E.01387
G1 X101.299 Y99.464 E.05486
G1 X101.299 Y98.915 E.01387
G1 X99.216 Y100.998 E.07448
G1 X98.667 Y100.998 E.01387
G1 X101.299 Y98.367 E.0941
G1 X101.299 Y97.818 E.01387
G1 X98.119 Y100.998 E.11371
G1 X97.57 Y100.998 E.01387
G1 X101.299 Y97.27 E.13333
G1 X101.299 Y96.721 E.01387
G1 X97.021 Y100.998 E.15294
G1 X96.473 Y100.999 E.01387
G1 X101.299 Y96.173 E.17256
G1 X101.299 Y95.624 E.01387
G1 X95.924 Y100.999 E.19217
G1 X95.376 Y100.999 E.01387
G1 X101.299 Y95.076 E.21179
G1 X101.299 Y94.527 E.01387
G1 X94.827 Y100.999 E.2314
G1 X94.278 Y100.999 E.01387
G1 X101.298 Y93.979 E.25102
G1 X101.298 Y93.43 E.01387
G1 X93.73 Y100.999 E.27063
G1 X93.181 Y100.999 E.01387
G1 X101.298 Y92.882 E.29025
G1 X101.298 Y92.334 E.01387
G1 X92.633 Y100.999 E.30986
G1 X92.084 Y100.999 E.01387
G1 X101.298 Y91.785 E.32948
M73 P18 R5
G1 X101.298 Y91.237 E.01387
G1 X91.362 Y101.173 E.3553
M204 S10000
G1 X90.5 Y101.486 F42000
G1 F11602.424
M204 S6000
G1 X101.298 Y90.688 E.38612
G1 X101.298 Y90.14 E.01387
G1 X90.164 Y101.274 E.39813
G2 X89.593 Y101.297 I-.165 J3.008 E.01448
G1 X101.298 Y89.591 E.41856
G1 X101.298 Y89.043 E.01387
G1 X89.282 Y101.058 E.42964
G1 X89.282 Y101 E.00148
G1 X88.793 Y101 E.01238
G1 X101.298 Y88.494 E.44715
G1 X101.298 Y87.946 E.01387
G1 X88.244 Y100.999 E.46676
G1 X87.696 Y100.999 E.01387
G1 X101.298 Y87.397 E.48637
G1 X101.298 Y86.849 E.01387
G1 X87.148 Y100.999 E.50597
G1 X86.599 Y100.999 E.01387
G1 X101.298 Y86.3 E.52558
G1 X101.298 Y85.752 E.01387
G1 X86.051 Y100.999 E.54519
G1 X85.502 Y100.999 E.01387
G1 X88.779 Y97.722 E.11717
G1 X88.635 Y97.787 E.00401
G1 X88.171 Y97.893 E.01202
G1 X88.057 Y97.896 E.00289
G1 X84.954 Y100.999 E.11096
G1 X84.406 Y100.999 E.01387
G1 X87.529 Y97.875 E.11169
G3 X87.089 Y97.767 I.047 J-1.143 E.01154
G1 X83.857 Y100.999 E.11555
G1 X83.309 Y100.999 E.01387
G1 X86.709 Y97.598 E.12157
G1 X86.378 Y97.381 E.01002
G1 X82.76 Y100.998 E.12934
G1 X82.212 Y100.998 E.01387
G1 X86.1 Y97.11 E.13902
G1 X85.867 Y96.795 E.00992
G1 X81.664 Y100.998 E.1503
G1 X81.115 Y100.998 E.01387
G1 X85.681 Y96.432 E.16325
G3 X85.544 Y96.021 I1.295 J-.661 E.011
G1 X80.567 Y100.998 E.17795
G1 X80.018 Y100.998 E.01387
G1 X85.493 Y95.523 E.19575
G1 X85.494 Y95.393 E.00328
G1 X85.581 Y94.887 E.01299
G1 X79.47 Y100.998 E.2185
G1 X78.922 Y100.998 E.01387
G1 X101.297 Y78.622 E.80009
G1 X101.298 Y79.17 E.01387
G1 X87.231 Y93.237 E.50299
G3 X87.866 Y93.151 I.532 J1.528 E.01631
G1 X101.298 Y79.719 E.48028
G1 X101.298 Y80.267 E.01387
G1 X88.364 Y93.201 E.46246
G3 X88.782 Y93.331 I-.113 J1.1 E.01115
G1 X101.298 Y80.816 E.44751
G1 X101.298 Y81.364 E.01387
G1 X89.143 Y93.518 E.43459
G3 X89.458 Y93.753 I-.422 J.894 E.00998
G1 X101.298 Y81.913 E.42336
G1 X101.298 Y82.461 E.01387
G1 X89.729 Y94.03 E.41366
G1 X89.951 Y94.356 E.00998
G1 X101.298 Y83.01 E.40571
M73 P19 R5
G1 X101.298 Y83.558 E.01387
G1 X90.119 Y94.737 E.39972
G1 X90.155 Y94.823 E.00235
G1 X90.227 Y95.177 E.00915
G1 X101.298 Y84.107 E.39586
G1 X101.298 Y84.655 E.01387
G1 X90.249 Y95.704 E.39508
G3 X90.073 Y96.428 I-2.146 J-.137 E.01894
G1 X101.471 Y85.03 E.40758
M204 S10000
G1 X79.312 Y74.828 F42000
G1 F11602.424
M204 S6000
G1 X78.701 Y75.439 E.02184
G1 X78.701 Y75.987 E.01387
G1 X79.687 Y75.001 E.03525
G1 X80.235 Y75.002 E.01387
G1 X78.701 Y76.536 E.05486
G1 X78.701 Y77.084 E.01387
G1 X80.784 Y75.002 E.07447
G1 X81.332 Y75.002 E.01387
G1 X78.701 Y77.633 E.09408
G1 X78.701 Y78.181 E.01387
G1 X81.881 Y75.002 E.11369
G1 X82.429 Y75.002 E.01387
G1 X78.701 Y78.73 E.1333
G1 X78.701 Y79.278 E.01387
G1 X82.978 Y75.002 E.15291
G1 X83.526 Y75.002 E.01387
G1 X78.701 Y79.827 E.17253
G1 X78.701 Y80.375 E.01387
G1 X84.074 Y75.002 E.19214
G1 X84.623 Y75.002 E.01387
G1 X78.701 Y80.924 E.21175
G1 X78.701 Y81.472 E.01387
G1 X85.171 Y75.002 E.23136
G1 X85.72 Y75.002 E.01387
G1 X78.701 Y82.021 E.25097
G1 X78.701 Y82.569 E.01387
G1 X86.268 Y75.002 E.27058
G1 X86.817 Y75.002 E.01387
G1 X78.701 Y83.118 E.29019
G1 X78.701 Y83.666 E.01387
G1 X87.365 Y75.002 E.30981
G1 X87.914 Y75.002 E.01387
G1 X78.701 Y84.215 E.32942
G1 X78.701 Y84.763 E.01387
G1 X88.462 Y75.002 E.34903
G1 X89.011 Y75.002 E.01387
G1 X78.701 Y85.312 E.36864
G1 X78.701 Y85.86 E.01387
G1 X89.559 Y75.002 E.38825
G1 X90.108 Y75.002 E.01387
G1 X78.701 Y86.409 E.40786
G1 X78.701 Y86.957 E.01387
G1 X90.656 Y75.002 E.42748
G1 X91.205 Y75.002 E.01387
G1 X78.701 Y87.506 E.44709
G1 X78.701 Y88.054 E.01387
G1 X91.753 Y75.002 E.4667
G1 X92.301 Y75.002 E.01387
G1 X78.701 Y88.603 E.48631
G1 X78.701 Y89.151 E.01387
G1 X92.85 Y75.002 E.50592
G1 X93.398 Y75.002 E.01387
G1 X78.701 Y89.7 E.52553
G1 X78.701 Y90.248 E.01387
G1 X93.947 Y75.002 E.54514
G1 X94.495 Y75.002 E.01387
G1 X78.701 Y90.797 E.56476
M73 P19 R4
G1 X78.701 Y91.345 E.01387
G1 X95.044 Y75.002 E.58437
M73 P20 R4
G1 X95.592 Y75.002 E.01387
G1 X78.701 Y91.894 E.60398
G1 X78.701 Y92.442 E.01387
G1 X96.141 Y75.002 E.62359
G1 X96.689 Y75.003 E.01387
G1 X78.701 Y92.991 E.6432
G1 X78.701 Y93.539 E.01387
G1 X97.238 Y75.003 E.66281
G1 X97.786 Y75.003 E.01387
G1 X78.701 Y94.088 E.68243
G1 X78.701 Y94.636 E.01387
G1 X98.335 Y75.003 E.70204
G1 X98.883 Y75.003 E.01387
G1 X78.701 Y95.185 E.72165
G1 X78.701 Y95.733 E.01387
G1 X99.432 Y75.003 E.74126
G1 X99.98 Y75.003 E.01387
G1 X78.701 Y96.282 E.76087
G1 X78.701 Y96.83 E.01387
G1 X100.529 Y75.003 E.78048
G1 X101.077 Y75.003 E.01387
G1 X78.701 Y97.379 E.80009
G1 X78.701 Y97.927 E.01387
G1 X101.297 Y75.331 E.80797
G1 X101.297 Y75.88 E.01387
G1 X78.701 Y98.476 E.80797
G1 X78.701 Y99.024 E.01387
G1 X101.297 Y76.428 E.80797
G1 X101.297 Y76.976 E.01387
G1 X78.701 Y99.573 E.80797
G1 X78.701 Y100.121 E.01387
G1 X101.297 Y77.525 E.80797
G1 X101.297 Y78.073 E.01387
G1 X78.527 Y100.843 E.81418
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11602.424
G1 X79.942 Y99.429 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/30
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.76 I-.396 J1.151 P1  F42000
G1 X89.88 Y102.846 Z.76
G1 Z.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P21 R4
G1 F11668.197
M204 S5000
G1 X90.008 Y102.84 E.00322
G3 X89.821 Y102.851 I-.009 J1.459 E.2258
; WIPE_START
M204 S6000
G1 X90.008 Y102.84 E-.07137
G1 X90.158 Y102.849 E-.05704
G1 X90.44 Y102.908 E-.1096
G1 X90.705 Y103.022 E-.10956
G1 X90.942 Y103.185 E-.10927
G1 X91.139 Y103.386 E-.10706
G1 X91.296 Y103.628 E-.10948
G1 X91.381 Y103.839 E-.08662
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.734 Y96.681 Z.92 F42000
G1 X87.561 Y93.508 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X87.621 Y93.497 E.00166
G1 X87.824 Y93.482 E.00552
G3 X87.394 Y93.539 I.051 J2.042 E.33596
G1 X87.502 Y93.519 E.00298
M204 S10000
G1 X87.713 Y93.907 F42000
G1 F10826.06
M204 S6000
G1 X87.834 Y93.898 E.00329
G3 X87.654 Y93.913 I.041 J1.626 E.27201
M204 S10000
G1 X87.673 Y94.337 F42000
G1 F10826.06
M204 S6000
G1 X87.724 Y94.323 E.00143
G1 X87.845 Y94.314 E.00327
G3 X87.407 Y94.408 I.03 J1.21 E.1939
G1 X87.615 Y94.352 E.00586
M204 S250
G1 X87.774 Y94.721 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X87.855 Y94.715 E.00203
G3 X87.715 Y94.731 I.02 J.809 E.12438
; WIPE_START
M204 S6000
G1 X87.855 Y94.715 E-.05341
G1 X88.016 Y94.727 E-.06129
G1 X88.171 Y94.771 E-.06131
G1 X88.315 Y94.845 E-.06133
G1 X88.441 Y94.945 E-.06133
G1 X88.587 Y95.138 E-.09172
G1 X88.649 Y95.286 E-.06134
G1 X88.681 Y95.445 E-.06137
G1 X88.681 Y95.606 E-.06125
G1 X88.649 Y95.764 E-.06134
G1 X88.542 Y95.986 E-.09345
G1 X88.491 Y96.048 E-.03086
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.935 Y101.359 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X78.342 Y101.357 E.28703
G1 X78.342 Y74.642 E.72388
G1 X101.656 Y74.642 E.63175
G1 X101.658 Y101.357 E.72388
G1 X91.058 Y101.359 E.28723
G1 X91.058 Y101.823 E.01259
G2 X88.942 Y101.82 I-1.062 J2.537 E.05886
G1 X88.942 Y101.412 E.01107
M204 S10000
G1 X88.522 Y101.774 F42000
G1 F10826.06
M204 S6000
G1 X78.365 Y101.772 E.27521
G3 X77.926 Y101.275 I.039 J-.477 E.01986
G1 X77.926 Y74.726 E.7194
G3 X78.425 Y74.227 I.486 J-.013 E.02141
G1 X101.575 Y74.227 E.62729
G3 X102.072 Y74.666 I.02 J.478 E.01985
G1 X102.074 Y101.287 E.72135
G3 X101.624 Y101.772 I-.476 J.01 E.01983
G1 X91.474 Y101.774 E.27503
G1 X91.474 Y102.537 E.02067
G2 X90.014 Y102.023 I-1.58 J2.157 E.04254
G2 X88.526 Y102.56 I.005 J2.343 E.04372
G1 X88.526 Y101.83 E.0198
M204 S10000
G1 X88.108 Y102.19 F42000
G1 F10826.06
M204 S6000
G1 X78.349 Y102.188 E.26444
G3 X77.511 Y101.285 I.058 J-.895 E.03681
G1 X77.511 Y74.716 E.71995
G3 X78.415 Y73.811 I.896 J-.009 E.0386
G1 X101.585 Y73.811 E.62785
G3 X102.488 Y74.65 I.002 J.902 E.03674
G1 X102.489 Y101.292 E.72193
G3 X101.644 Y102.188 I-.893 J.004 E.03682
G1 X91.889 Y102.19 E.26433
G1 X91.889 Y103.49 E.03522
G1 X91.693 Y103.533 E.00544
G2 X88.305 Y103.536 I-1.693 J.78 E.11519
G1 X88.111 Y103.492 E.0054
G1 X88.111 Y102.248 E.03371
M204 S250
G1 X87.71 Y102.59 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X78.334 Y102.589 E.23572
G3 X77.11 Y101.295 I.075 J-1.297 E.04933
G1 X77.11 Y74.706 E.66849
G3 X78.405 Y73.41 I1.299 J.003 E.05111
G1 X101.595 Y73.41 E.58303
G3 X102.888 Y74.635 I-.012 J1.307 E.04926
G1 X102.89 Y101.297 E.67033
G3 X101.664 Y102.589 I-1.294 J-.001 E.04936
G1 X92.29 Y102.59 E.23567
M73 P22 R4
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.303 E.16656
G1 X87.71 Y102.65 E.04877
; WIPE_START
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.337 Y103.042
G1 Z.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0961699
G1 F18000
M204 S6000
G3 X88.381 Y102.962 I.101 J.004 E.00038
G1 X88.429 Y102.919 E.00026
M204 S10000
G1 X88.413 Y103.765 F42000
; LINE_WIDTH: 0.466925
G1 F10402.502
M204 S6000
G1 X88.142 Y103.942 E.00912
G1 X88.129 Y104.483 E.01528
G2 X91.871 Y104.133 I1.87 J-.188 E.16576
G1 X91.86 Y103.969 E.00464
G2 X91.831 Y103.708 I-5.511 J.494 E.00741
M204 S10000
G1 X91.663 Y103.041 F42000
; LINE_WIDTH: 0.099375
G1 F18000
M204 S6000
G1 X91.643 Y102.979 E.00027
; LINE_WIDTH: 0.11929
G1 X91.628 Y102.94 E.00024
G1 X91.499 Y102.831 E.00093
; LINE_WIDTH: 0.0907142
G1 X91.458 Y102.8 E.00019
; WIPE_START
G1 X91.499 Y102.831 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.935 Y101.814 Z.92 F42000
G1 X79.296 Y101.19 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422746
G1 F11585.696
M204 S6000
G1 X78.682 Y100.577 E.02195
G1 X78.682 Y100.027 E.01391
G1 X79.671 Y101.016 E.03541
G1 X80.221 Y101.016 E.01391
G1 X78.682 Y99.478 E.05508
G1 X78.682 Y98.929 E.01391
G1 X80.77 Y101.017 E.07476
G1 X81.32 Y101.017 E.01391
G1 X78.682 Y98.38 E.09443
G1 X78.682 Y97.83 E.01391
G1 X81.869 Y101.017 E.1141
G1 X82.418 Y101.017 E.01391
G1 X78.682 Y97.281 E.13378
G1 X78.682 Y96.732 E.01391
G1 X82.968 Y101.017 E.15345
G1 X83.517 Y101.017 E.01391
G1 X78.682 Y96.182 E.17312
G1 X78.682 Y95.633 E.01391
G1 X84.067 Y101.017 E.1928
G1 X84.616 Y101.017 E.01391
G1 X78.682 Y95.084 E.21247
G1 X78.682 Y94.534 E.01391
G1 X85.165 Y101.017 E.23214
G1 X85.715 Y101.017 E.01391
G1 X78.682 Y93.985 E.25182
G1 X78.682 Y93.436 E.01391
G1 X86.264 Y101.018 E.27149
G1 X86.814 Y101.018 E.01391
G1 X78.682 Y92.887 E.29116
G1 X78.682 Y92.337 E.01391
G1 X87.363 Y101.018 E.31084
G1 X87.912 Y101.018 E.01391
G1 X78.682 Y91.788 E.33051
G1 X78.682 Y91.239 E.01391
G1 X88.635 Y101.192 E.3564
M204 S10000
G1 X89.481 Y101.488 F42000
G1 F11585.696
M204 S6000
G1 X78.682 Y90.689 E.38667
G1 X78.682 Y90.14 E.01391
G1 X89.817 Y101.274 E.3987
G3 X90.384 Y101.292 I.176 J3.393 E.01439
G1 X78.682 Y89.591 E.41901
G1 X78.682 Y89.042 E.01391
G1 X85.525 Y95.884 E.24503
G1 X85.501 Y95.763 E.00314
G1 X85.501 Y95.311 E.01145
G1 X78.682 Y88.492 E.24415
G1 X78.683 Y87.943 E.01391
G1 X85.589 Y94.85 E.24732
G1 X85.748 Y94.459 E.01068
G1 X78.683 Y87.394 E.253
G1 X78.683 Y86.844 E.01391
G1 X85.959 Y94.121 E.26056
G3 X86.215 Y93.828 I.853 J.487 E.00992
G1 X78.683 Y86.295 E.26973
G1 X78.683 Y85.746 E.01391
G1 X86.51 Y93.573 E.28029
G3 X86.857 Y93.371 I.887 J1.127 E.01021
G1 X78.683 Y85.196 E.29273
G1 X78.683 Y84.647 E.01391
G1 X87.259 Y93.223 E.30709
G3 X87.739 Y93.154 I.536 J2.015 E.01231
G1 X78.683 Y84.098 E.32428
G1 X78.683 Y83.549 E.01391
G1 X88.567 Y93.433 E.35394
; WIPE_START
G1 X87.152 Y92.019 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P23 R4
G1 X87.299 Y97.658 Z.92 F42000
G1 Z.52
G1 E.8 F1800
G1 F11585.696
M204 S6000
G1 X90.718 Y101.077 E.1224
G1 X90.718 Y101.018 E.00148
G1 X91.208 Y101.018 E.01243
G1 X88.085 Y97.895 E.11183
G1 X88.172 Y97.893 E.00219
G1 X88.547 Y97.807 E.00974
G1 X91.758 Y101.018 E.11497
G1 X92.307 Y101.018 E.01391
G1 X88.939 Y97.65 E.1206
G2 X89.287 Y97.449 I-.493 J-1.255 E.01022
G1 X92.856 Y101.018 E.1278
G1 X93.405 Y101.018 E.01391
G1 X89.583 Y97.196 E.13686
G1 X89.83 Y96.893 E.00988
G1 X93.954 Y101.018 E.14768
G1 X94.503 Y101.017 E.01391
G1 X90.024 Y96.538 E.16039
G1 X90.155 Y96.229 E.00851
G1 X90.173 Y96.138 E.00234
G1 X95.053 Y101.017 E.17472
G1 X95.602 Y101.017 E.01391
G1 X90.249 Y95.665 E.19167
G2 X90.205 Y95.072 I-1.488 J-.188 E.01516
G1 X96.151 Y101.017 E.2129
G1 X96.7 Y101.017 E.01391
G1 X78.683 Y82.999 E.64519
G1 X78.683 Y82.45 E.01391
G1 X97.249 Y101.017 E.66485
G1 X97.799 Y101.017 E.01391
G1 X78.683 Y81.901 E.68452
G1 X78.683 Y81.351 E.01391
G1 X98.348 Y101.017 E.70418
G1 X98.897 Y101.017 E.01391
G1 X78.683 Y80.802 E.72385
G1 X78.683 Y80.253 E.01391
G1 X99.446 Y101.016 E.74351
G1 X99.995 Y101.016 E.01391
G1 X78.683 Y79.704 E.76318
G1 X78.683 Y79.154 E.01391
G1 X100.545 Y101.016 E.78284
G1 X101.094 Y101.016 E.01391
G1 X78.683 Y78.605 E.80251
G1 X78.683 Y78.056 E.01391
G1 X101.317 Y100.691 E.81052
G1 X101.317 Y100.141 E.01391
G1 X78.683 Y77.506 E.81052
G1 X78.683 Y76.957 E.01391
G1 X101.317 Y99.592 E.81052
G1 X101.317 Y99.043 E.01391
G1 X78.683 Y76.408 E.81052
G1 X78.683 Y75.858 E.01391
G1 X101.317 Y98.493 E.81052
G1 X101.317 Y97.944 E.01391
G1 X78.683 Y75.309 E.81052
M73 P24 R4
G1 X78.683 Y74.983 E.00826
G1 X78.906 Y74.983 E.00565
G1 X101.317 Y97.395 E.80253
G1 X101.317 Y96.845 E.01391
G1 X79.455 Y74.983 E.78286
G1 X80.004 Y74.983 E.01391
G1 X101.317 Y96.296 E.76319
G1 X101.317 Y95.747 E.01391
G1 X80.553 Y74.983 E.74352
G1 X81.103 Y74.983 E.01391
G1 X101.317 Y95.197 E.72385
G1 X101.317 Y94.648 E.01391
G1 X81.652 Y74.983 E.70417
G1 X82.201 Y74.983 E.01391
G1 X101.317 Y94.099 E.6845
G1 X101.317 Y93.549 E.01391
G1 X82.751 Y74.983 E.66483
G1 X83.3 Y74.983 E.01391
G1 X101.317 Y93 E.64516
G1 X101.317 Y92.451 E.01391
G1 X83.849 Y74.983 E.62549
G1 X84.398 Y74.983 E.01391
G1 X101.317 Y91.901 E.60582
G1 X101.317 Y91.352 E.01391
G1 X84.948 Y74.983 E.58615
G1 X85.497 Y74.983 E.01391
G1 X101.317 Y90.803 E.56648
G1 X101.317 Y90.253 E.01391
G1 X86.046 Y74.983 E.54681
G1 X86.596 Y74.983 E.01391
G1 X101.317 Y89.704 E.52714
G1 X101.317 Y89.155 E.01391
G1 X87.145 Y74.983 E.50747
G1 X87.694 Y74.983 E.01391
G1 X101.317 Y88.605 E.4878
G1 X101.317 Y88.056 E.01391
G1 X88.244 Y74.983 E.46813
G1 X88.793 Y74.983 E.01391
G1 X101.317 Y87.507 E.44845
G1 X101.317 Y86.957 E.01391
G1 X89.342 Y74.983 E.42878
G1 X89.891 Y74.983 E.01391
G1 X101.316 Y86.408 E.40911
G1 X101.316 Y85.859 E.01391
G1 X90.441 Y74.983 E.38944
M73 P25 R4
G1 X90.99 Y74.983 E.01391
G1 X101.316 Y85.309 E.36977
G1 X101.316 Y84.76 E.01391
G1 X91.539 Y74.983 E.3501
G1 X92.089 Y74.983 E.01391
G1 X101.316 Y84.211 E.33043
G1 X101.316 Y83.661 E.01391
G1 X92.638 Y74.983 E.31076
G1 X93.187 Y74.983 E.01391
G1 X101.316 Y83.112 E.29109
G1 X101.316 Y82.563 E.01391
G1 X93.737 Y74.983 E.27142
G1 X94.286 Y74.983 E.01391
G1 X101.316 Y82.013 E.25175
G1 X101.316 Y81.464 E.01391
G1 X94.835 Y74.983 E.23208
G1 X95.384 Y74.983 E.01391
G1 X101.316 Y80.915 E.21241
G1 X101.316 Y80.365 E.01391
G1 X95.934 Y74.983 E.19274
G1 X96.483 Y74.983 E.01391
G1 X101.316 Y79.816 E.17306
G1 X101.316 Y79.267 E.01391
G1 X97.032 Y74.983 E.15339
G1 X97.582 Y74.983 E.01391
G1 X101.316 Y78.717 E.13372
G1 X101.316 Y78.168 E.01391
G1 X98.131 Y74.983 E.11405
G1 X98.68 Y74.983 E.01391
G1 X101.316 Y77.619 E.09438
G1 X101.316 Y77.069 E.01391
G1 X99.229 Y74.983 E.07471
G1 X99.779 Y74.983 E.01391
G1 X101.316 Y76.52 E.05504
G1 X101.316 Y75.971 E.01391
G1 X100.328 Y74.983 E.03537
G1 X100.877 Y74.983 E.01391
G1 X101.489 Y75.595 E.02191
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11585.696
G1 X100.877 Y74.983 E-.32887
G1 X100.328 Y74.983 E-.20873
G1 X100.742 Y75.397 E-.2224
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/30
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.92 I-1.132 J-.448 P1  F42000
G1 X89.88 Y102.846 Z.92
G1 Z.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X90.007 Y102.84 E.0032
G3 X89.82 Y102.851 I-.007 J1.459 E.22582
; WIPE_START
M204 S6000
G1 X90.007 Y102.84 E-.07106
G1 X90.302 Y102.872 E-.11285
G1 X90.569 Y102.955 E-.10618
G1 X90.821 Y103.093 E-.10944
G1 X91.042 Y103.278 E-.10934
G1 X91.223 Y103.502 E-.10942
G1 X91.356 Y103.758 E-.10954
G1 X91.383 Y103.838 E-.03217
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.602 Y96.416 Z1.08 F42000
G1 X88.978 Y93.817 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X89.149 Y93.928 E.00551
G3 X87.621 Y93.497 I-1.274 J1.597 E.30356
G1 X87.824 Y93.482 E.0055
G3 X88.808 Y93.707 I.052 J2.042 E.02763
G1 X88.928 Y93.785 E.00389
M204 S10000
G1 X88.822 Y94.209 F42000
G1 F10826.06
M204 S6000
G1 X89.011 Y94.36 E.00658
G3 X87.673 Y93.91 I-1.136 J1.164 E.23735
G1 X87.834 Y93.898 E.00439
G3 X88.758 Y94.158 I.041 J1.626 E.0264
G1 X88.775 Y94.172 E.00058
M204 S10000
G1 X88.497 Y94.49 F42000
G1 F10826.06
M204 S6000
G1 X88.532 Y94.508 E.00108
G3 X87.724 Y94.323 I-.657 J1.017 E.1832
G1 X87.845 Y94.314 E.00327
G3 X88.318 Y94.398 I.031 J1.21 E.0131
G1 X88.443 Y94.462 E.00383
M204 S250
G1 X88.315 Y94.845 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X87.774 Y94.721 I-.44 J.68 E.11369
G1 X87.855 Y94.715 E.00203
G3 X88.263 Y94.814 I.02 J.809 E.01068
; WIPE_START
M204 S6000
G1 X88.441 Y94.945 E-.08396
G1 X88.544 Y95.069 E-.06125
G1 X88.622 Y95.211 E-.06138
G1 X88.669 Y95.365 E-.06137
G1 X88.685 Y95.525 E-.06125
G1 X88.669 Y95.686 E-.06131
G1 X88.622 Y95.84 E-.06136
G1 X88.544 Y95.982 E-.0613
G1 X88.445 Y96.101 E-.05899
G1 X88.351 Y96.181 E-.04698
G1 X88.208 Y96.264 E-.06259
G1 X88.055 Y96.315 E-.06141
G1 X88.011 Y96.321 E-.01687
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.935 Y101.359 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X78.342 Y101.357 E.28704
G1 X78.342 Y74.642 E.72388
G1 X82.583 Y74.642 E.11491
G1 X82.583 Y79.118 E.12127
G1 X97.417 Y79.118 E.40198
G1 X97.417 Y74.642 E.12127
G1 X101.656 Y74.642 E.11486
G1 X101.658 Y101.357 E.72388
G1 X91.058 Y101.359 E.28723
G1 X91.058 Y101.823 E.01258
M73 P26 R4
G2 X88.942 Y101.82 I-1.061 J2.542 E.05885
G1 X88.942 Y101.412 E.01107
M204 S10000
G1 X88.522 Y101.774 F42000
G1 F10826.06
M204 S6000
G1 X78.365 Y101.772 E.27521
G3 X77.926 Y101.275 I.039 J-.477 E.01986
G1 X77.926 Y74.726 E.71939
G3 X78.425 Y74.227 I.486 J-.014 E.02142
G1 X82.998 Y74.227 E.12391
G1 X82.998 Y78.702 E.12127
G1 X97.002 Y78.702 E.37945
G1 X97.002 Y74.227 E.12127
G1 X101.577 Y74.227 E.12399
G3 X102.072 Y74.677 I.018 J.476 E.02009
G1 X102.074 Y101.287 E.72104
G3 X101.623 Y101.772 I-.476 J.01 E.01984
G1 X91.474 Y101.774 E.27502
G1 X91.474 Y102.536 E.02064
G2 X90.013 Y102.023 I-1.576 J2.153 E.04257
G2 X88.526 Y102.56 I.007 J2.343 E.04368
G1 X88.526 Y101.83 E.01979
M204 S10000
G1 X88.108 Y102.19 F42000
G1 F10826.06
M204 S6000
G1 X78.349 Y102.188 E.26445
G3 X77.511 Y101.285 I.058 J-.894 E.03681
G1 X77.511 Y74.716 E.71995
G3 X78.415 Y73.811 I.896 J-.009 E.0386
G1 X83.414 Y73.811 E.13545
G1 X83.414 Y78.286 E.12127
G1 X96.586 Y78.286 E.35692
G1 X96.586 Y73.811 E.12127
G1 X101.588 Y73.811 E.13553
G3 X102.488 Y74.657 I0 J.901 E.03686
G1 X102.489 Y101.292 E.72174
G3 X101.644 Y102.188 I-.893 J.004 E.03684
G1 X91.889 Y102.19 E.26431
G1 X91.889 Y103.49 E.03523
G1 X91.693 Y103.533 E.00544
G2 X88.305 Y103.536 I-1.693 J.78 E.1152
G1 X88.111 Y103.492 E.0054
G1 X88.111 Y102.248 E.03371
M204 S250
G1 X87.71 Y102.59 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X78.334 Y102.589 E.23572
G3 X77.11 Y101.295 I.075 J-1.297 E.04933
G1 X77.11 Y74.706 E.66849
G3 X78.405 Y73.41 I1.299 J.003 E.05112
G1 X101.598 Y73.41 E.58309
G3 X102.888 Y74.637 I-.014 J1.307 E.04924
G1 X102.89 Y101.297 E.67028
G3 X101.663 Y102.589 I-1.294 J-.001 E.04938
G1 X92.29 Y102.59 E.23566
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.303 E.16656
G1 X87.71 Y102.65 E.04877
; WIPE_START
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.337 Y103.042
G1 Z.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0962435
G1 F18000
M204 S6000
G3 X88.382 Y102.962 I.102 J.004 E.00039
G1 X88.43 Y102.919 E.00026
M204 S10000
G1 X88.413 Y103.766 F42000
; LINE_WIDTH: 0.466929
G1 F10402.385
M204 S6000
G1 X88.142 Y103.942 E.00912
G1 X88.129 Y104.484 E.0153
G2 X91.871 Y104.132 I1.87 J-.19 E.16572
G1 X91.86 Y103.968 E.00463
G2 X91.83 Y103.708 I-5.028 J.448 E.00738
M204 S10000
G1 X91.663 Y103.041 F42000
; LINE_WIDTH: 0.100111
G1 F18000
M204 S6000
G1 X91.642 Y102.977 E.00029
; LINE_WIDTH: 0.120284
G1 X91.627 Y102.938 E.00024
G1 X91.497 Y102.829 E.00095
; LINE_WIDTH: 0.0910416
G1 X91.454 Y102.796 E.0002
; WIPE_START
G1 X91.497 Y102.829 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.365 Y101.192 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422766
G1 F11585.099
M204 S6000
G1 X101.317 Y91.24 E.35637
G1 X101.317 Y91.789 E.01391
G1 X92.088 Y101.018 E.33048
G1 X92.638 Y101.018 E.01391
G1 X101.317 Y92.338 E.31081
G1 X101.317 Y92.888 E.01391
G1 X93.187 Y101.018 E.29114
G1 X93.736 Y101.018 E.01391
G1 X101.317 Y93.437 E.27146
G1 X101.317 Y93.986 E.01391
G1 X94.286 Y101.018 E.25179
M73 P27 R4
G1 X94.835 Y101.017 E.01391
G1 X101.317 Y94.536 E.23212
G1 X101.317 Y95.085 E.01391
G1 X95.385 Y101.017 E.21244
G1 X95.934 Y101.017 E.01391
G1 X101.317 Y95.634 E.19277
G1 X101.317 Y96.183 E.01391
G1 X96.484 Y101.017 E.17309
G1 X97.033 Y101.017 E.01391
G1 X101.317 Y96.733 E.15342
G1 X101.317 Y97.282 E.01391
G1 X97.582 Y101.017 E.13375
G1 X98.132 Y101.017 E.01391
G1 X101.317 Y97.831 E.11407
G1 X101.317 Y98.381 E.01391
G1 X98.681 Y101.017 E.0944
G1 X99.231 Y101.017 E.01391
G1 X101.317 Y98.93 E.07472
G1 X101.317 Y99.479 E.01391
G1 X99.78 Y101.016 E.05505
G1 X100.33 Y101.016 E.01391
G1 X101.317 Y100.028 E.03538
G1 X101.317 Y100.578 E.01391
G1 X100.705 Y101.19 E.02192
; WIPE_START
G1 X101.317 Y100.578 E-.32892
G1 X101.317 Y100.028 E-.20873
G1 X100.904 Y100.442 E-.22235
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.31 Y101.208 Z1.08 F42000
G1 X90.518 Y101.489 Z1.08
G1 Z.68
G1 E.8 F1800
G1 F11585.099
M204 S6000
G1 X101.317 Y90.691 E.38671
G1 X101.317 Y90.141 E.01391
G1 X90.183 Y101.275 E.3987
G2 X89.615 Y101.294 I-.186 J2.991 E.01441
G1 X101.317 Y89.592 E.41904
G1 X101.317 Y89.043 E.01391
G1 X89.282 Y101.077 E.43095
G1 X89.282 Y101.018 E.00149
G1 X88.792 Y101.018 E.01242
G1 X101.317 Y88.493 E.44851
G1 X101.317 Y87.944 E.01391
G1 X88.243 Y101.018 E.46818
G1 X87.694 Y101.018 E.01391
G1 X101.317 Y87.395 E.48784
G1 X101.317 Y86.846 E.01391
G1 X87.144 Y101.018 E.50751
G1 X86.595 Y101.018 E.01391
G1 X101.316 Y86.296 E.52718
G1 X101.316 Y85.747 E.01391
G1 X86.046 Y101.018 E.54684
G1 X85.497 Y101.017 E.01391
G1 X88.803 Y97.711 E.11839
G1 X88.635 Y97.787 E.00465
G1 X88.172 Y97.893 E.01204
G1 X88.069 Y97.895 E.00259
G1 X84.947 Y101.017 E.1118
G1 X84.398 Y101.017 E.01391
G1 X87.539 Y97.877 E.11246
G3 X87.096 Y97.77 I.043 J-1.148 E.01161
G1 X83.849 Y101.017 E.11628
G1 X83.3 Y101.017 E.01391
G1 X86.715 Y97.602 E.12228
G1 X86.382 Y97.386 E.01005
G1 X82.751 Y101.017 E.13004
G1 X82.201 Y101.017 E.01391
G1 X86.104 Y97.114 E.13975
G1 X86.047 Y97.059 E.002
G1 X85.87 Y96.799 E.00797
G1 X81.652 Y101.017 E.15104
G1 X81.103 Y101.017 E.01391
G1 X85.683 Y96.437 E.164
G3 X85.552 Y96.018 I.971 J-.532 E.01118
G1 X80.554 Y101.016 E.179
G1 X80.005 Y101.016 E.01391
G1 X85.501 Y95.52 E.19682
G1 X85.501 Y95.288 E.00589
G1 X85.581 Y94.89 E.01026
G1 X79.455 Y101.016 E.21937
G1 X78.906 Y101.016 E.01391
G1 X101.316 Y78.606 E.8025
G1 X101.316 Y79.156 E.01391
G1 X87.235 Y93.236 E.50423
G3 X87.87 Y93.151 I.529 J1.527 E.01633
G1 X101.316 Y79.705 E.4815
M73 P28 R4
G1 X101.316 Y80.254 E.01391
G1 X88.369 Y93.202 E.46365
G3 X88.787 Y93.333 I-.115 J1.1 E.01117
G1 X101.316 Y80.803 E.44868
G1 X101.316 Y81.353 E.01391
G1 X89.148 Y93.521 E.43575
G3 X89.462 Y93.756 I-.425 J.894 E.01
G1 X101.316 Y81.902 E.42451
G1 X101.316 Y82.451 E.01391
G1 X89.732 Y94.035 E.41482
G1 X89.955 Y94.362 E.01001
G1 X101.316 Y83.001 E.40684
G1 X101.316 Y83.55 E.01391
G1 X90.122 Y94.744 E.40087
G1 X90.155 Y94.822 E.00214
G1 X90.229 Y95.187 E.00943
G1 X101.316 Y84.099 E.39705
G1 X101.316 Y84.648 E.01391
G1 X90.249 Y95.716 E.39632
G1 X90.155 Y96.229 E.01321
G1 X90.06 Y96.454 E.0062
G1 X101.49 Y85.024 E.40931
; WIPE_START
G1 X100.076 Y86.438 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.523 Y79.683 Z1.08 F42000
G1 X95.669 Y78.059 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S2000
G1 X96.359 Y77.369 E.02454
G1 X96.359 Y76.824
G1 X95.123 Y78.059 E.04393
G1 X94.578 Y78.059
G1 X96.359 Y76.278 E.06332
G1 X96.359 Y75.733
G1 X94.032 Y78.059 E.08272
G1 X93.487 Y78.059
G1 X96.359 Y75.187 E.10211
G1 X96.359 Y74.642
G1 X92.942 Y78.059 E.1215
G1 X92.396 Y78.059
G1 X96.359 Y74.097 E.14089
G1 X96.287 Y73.623
G1 X91.851 Y78.059 E.15775
G1 X91.305 Y78.059
G1 X95.742 Y73.623 E.15775
G1 X95.197 Y73.623
G1 X90.76 Y78.059 E.15775
G1 X90.215 Y78.059
G1 X94.651 Y73.623 E.15775
G1 X94.106 Y73.623
G1 X89.669 Y78.059 E.15775
G1 X89.124 Y78.059
G1 X93.56 Y73.623 E.15775
G1 X93.015 Y73.623
G1 X88.578 Y78.059 E.15775
G1 X88.033 Y78.059
G1 X92.47 Y73.623 E.15775
G1 X91.924 Y73.623
G1 X87.488 Y78.059 E.15775
G1 X86.942 Y78.059
G1 X91.379 Y73.623 E.15775
G1 X90.833 Y73.623
G1 X86.397 Y78.059 E.15775
G1 X85.851 Y78.059
G1 X90.288 Y73.623 E.15775
M73 P29 R4
G1 X89.743 Y73.623
G1 X85.306 Y78.059 E.15775
G1 X84.76 Y78.059
G1 X89.197 Y73.623 E.15775
G1 X88.652 Y73.623
G1 X84.215 Y78.059 E.15775
G1 X83.67 Y78.059
G1 X88.106 Y73.623 E.15775
G1 X87.561 Y73.623
G1 X83.641 Y77.542 E.13937
G1 X83.641 Y76.997
G1 X87.016 Y73.623 E.11997
G1 X86.47 Y73.623
G1 X83.641 Y76.451 E.10058
G1 X83.641 Y75.906
G1 X85.925 Y73.623 E.08119
G1 X85.379 Y73.623
G1 X83.641 Y75.361 E.0618
G1 X83.641 Y74.815
G1 X84.834 Y73.623 E.04241
G1 X84.289 Y73.622
G1 X83.641 Y74.27 E.02301
; WIPE_START
M204 S6000
G1 X84.289 Y73.622 E-.34786
G1 X84.834 Y73.623 E-.20725
G1 X84.453 Y74.004 E-.20489
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.509 Y75.595 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422766
G1 F11585.099
M204 S6000
G1 X79.121 Y74.983 E.02192
G1 X79.67 Y74.983 E.01391
G1 X78.683 Y75.971 E.03538
G1 X78.683 Y76.52 E.01391
G1 X80.22 Y74.983 E.05505
G1 X80.769 Y74.983 E.01391
G1 X78.683 Y77.07 E.07472
G1 X78.683 Y77.619 E.01391
G1 X81.318 Y74.983 E.09439
G1 X81.868 Y74.983 E.01391
G1 X78.683 Y78.168 E.11406
G1 X78.683 Y78.718 E.01391
G1 X82.242 Y75.158 E.12747
G1 X82.242 Y75.707 E.01391
G1 X78.683 Y79.267 E.12747
G1 X78.683 Y79.816 E.01391
G1 X82.242 Y76.257 E.12747
G1 X82.242 Y76.806 E.01391
G1 X78.683 Y80.365 E.12747
G1 X78.683 Y80.915 E.01391
G1 X82.242 Y77.355 E.12747
G1 X82.242 Y77.905 E.01391
G1 X78.683 Y81.464 E.12747
G1 X78.683 Y82.013 E.01391
G1 X82.242 Y78.454 E.12747
G1 X82.242 Y79.003 E.01391
G1 X78.683 Y82.563 E.12747
G1 X78.683 Y83.112 E.01391
G1 X82.336 Y79.458 E.13085
G1 X82.886 Y79.458 E.01391
G1 X78.683 Y83.661 E.15052
G1 X78.683 Y84.211 E.01391
G1 X83.435 Y79.458 E.17019
G1 X83.984 Y79.458 E.01391
G1 X78.683 Y84.76 E.18986
G1 X78.683 Y85.309 E.01391
G1 X84.534 Y79.458 E.20953
G1 X85.083 Y79.458 E.01391
G1 X78.683 Y85.859 E.2292
G1 X78.682 Y86.408 E.01391
G1 X85.632 Y79.458 E.24887
G1 X86.182 Y79.458 E.01391
G1 X78.682 Y86.957 E.26855
G1 X78.682 Y87.507 E.01391
G1 X86.731 Y79.458 E.28822
G1 X87.28 Y79.458 E.01391
G1 X78.683 Y88.056 E.30789
G1 X78.683 Y88.605 E.01391
G1 X87.83 Y79.458 E.32756
G1 X88.379 Y79.458 E.01391
G1 X78.683 Y89.155 E.34723
G1 X78.683 Y89.704 E.01391
G1 X88.928 Y79.458 E.3669
G1 X89.478 Y79.458 E.01391
G1 X78.683 Y90.253 E.38657
G1 X78.683 Y90.803 E.01391
G1 X90.027 Y79.458 E.40625
M73 P30 R4
G1 X90.576 Y79.458 E.01391
G1 X78.683 Y91.352 E.42592
G1 X78.683 Y91.901 E.01391
G1 X91.126 Y79.458 E.44559
G1 X91.675 Y79.458 E.01391
G1 X78.683 Y92.451 E.46526
G1 X78.683 Y93 E.01391
G1 X92.224 Y79.458 E.48493
G1 X92.773 Y79.458 E.01391
G1 X78.683 Y93.549 E.5046
G1 X78.683 Y94.099 E.01391
G1 X93.323 Y79.458 E.52427
G1 X93.872 Y79.458 E.01391
G1 X78.683 Y94.648 E.54395
G1 X78.683 Y95.197 E.01391
G1 X94.421 Y79.458 E.56362
G1 X94.971 Y79.458 E.01391
G1 X78.683 Y95.747 E.58329
G1 X78.683 Y96.296 E.01391
G1 X95.52 Y79.458 E.60296
G1 X96.069 Y79.458 E.01391
G1 X78.683 Y96.845 E.62263
G1 X78.683 Y97.394 E.01391
G1 X96.619 Y79.458 E.6423
G1 X97.168 Y79.458 E.01391
G1 X78.509 Y98.117 E.66819
M204 S10000
G1 X78.509 Y100.864 F42000
G1 F11585.099
M204 S6000
G1 X101.316 Y78.057 E.81672
G1 X101.316 Y77.508 E.01391
G1 X78.683 Y100.141 E.81051
G1 X78.683 Y99.592 E.01391
G1 X101.316 Y76.958 E.81051
G1 X101.316 Y76.409 E.01391
G1 X78.683 Y99.042 E.8105
G1 X78.683 Y98.493 E.01391
G1 X101.316 Y75.86 E.8105
G1 X101.316 Y75.311 E.01391
G1 X97.758 Y78.868 E.12741
G1 X97.758 Y78.319 E.01391
G1 X101.094 Y74.983 E.11947
G1 X100.545 Y74.983 E.01391
G1 X97.758 Y77.77 E.09979
G1 X97.758 Y77.22 E.01391
G1 X99.995 Y74.983 E.08012
G1 X99.446 Y74.983 E.01391
G1 X97.758 Y76.671 E.06045
G1 X97.758 Y76.122 E.01391
G1 X98.897 Y74.983 E.04078
G1 X98.347 Y74.983 E.01391
G1 X97.758 Y75.572 E.02111
G1 X97.758 Y75.023 E.01391
G1 X97.972 Y74.809 E.00765
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11585.099
G1 X97.758 Y75.023 E-.11486
G1 X97.758 Y75.572 E-.20874
G1 X98.347 Y74.983 E-.3168
G1 X98.662 Y74.983 E-.11959
; WIPE_END
M73 P31 R4
G1 E-.04 F1800
; layer num/total_layer_count: 5/30
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.08 I-1.061 J-.596 P1  F42000
G1 X87.069 Y95.606 Z1.08
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X87.775 Y94.721 I.806 J-.081 E.03148
G1 X87.855 Y94.715 E.00203
G3 X87.078 Y95.665 I.02 J.809 E.0929
; WIPE_START
M204 S6000
G1 X87.069 Y95.445 E-.08374
G1 X87.101 Y95.286 E-.06146
G1 X87.207 Y95.067 E-.09261
G1 X87.339 Y94.918 E-.07578
G1 X87.47 Y94.824 E-.06124
G1 X87.617 Y94.757 E-.06115
G1 X87.775 Y94.721 E-.06158
G1 X87.855 Y94.715 E-.03063
G1 X88.015 Y94.727 E-.06118
G1 X88.171 Y94.771 E-.06151
G1 X88.315 Y94.845 E-.06127
G1 X88.413 Y94.923 E-.04784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.802 Y102.428 Z1.24 F42000
G1 X89.879 Y102.846 Z1.24
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S5000
G1 X90.005 Y102.84 E.00318
G3 X89.819 Y102.851 I-.006 J1.459 E.22583
; WIPE_START
M204 S6000
G1 X90.005 Y102.84 E-.07086
G1 X90.302 Y102.872 E-.11352
G1 X90.567 Y102.955 E-.10545
G1 X90.82 Y103.092 E-.10934
G1 X91.041 Y103.277 E-.10957
G1 X91.137 Y103.385 E-.05478
G1 X91.295 Y103.626 E-.1096
G1 X91.38 Y103.838 E-.08686
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S5000
G1 X78.334 Y102.589 E.23572
G3 X77.11 Y101.295 I.07 J-1.292 E.04938
G1 X77.11 Y74.706 E.6685
G3 X78.403 Y73.41 I1.294 J-.001 E.0511
G1 X84.79 Y73.41 E.16058
G1 X84.79 Y76.91 E.08799
G1 X95.21 Y76.91 E.26197
G1 X95.21 Y73.41 E.08799
G1 X101.595 Y73.41 E.16052
G3 X102.89 Y74.706 I.004 J1.291 E.05119
G1 X102.89 Y101.295 E.66849
G3 X101.666 Y102.589 I-1.294 J.001 E.04938
G1 X92.29 Y102.59 E.23572
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.303 E.16656
G1 X87.71 Y102.65 E.04877
; WIPE_START
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.228 Y103.386
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.562225
G1 F8524.528
M204 S6000
G2 X88.165 Y103.753 I7.329 J1.457 E.01281
; LINE_WIDTH: 0.520216
G1 F9261.547
G1 X88.142 Y103.94 E.00597
; LINE_WIDTH: 0.465466
G1 F10437.683
G1 X88.129 Y104.484 E.01531
G2 X91.871 Y104.131 I1.87 J-.189 E.16524
G1 X91.858 Y103.944 E.00527
; LINE_WIDTH: 0.519655
G1 F9272.253
G2 X91.835 Y103.754 I-3.831 J.365 E.00603
; LINE_WIDTH: 0.559334
G1 F8571.472
G1 X91.774 Y103.386 E.01278
; WIPE_START
G1 X91.835 Y103.754 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.214 Y96.502 Z1.24 F42000
G1 X101.718 Y73.629 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S2000
G1 X102.671 Y74.583 E.03389
G1 X102.678 Y75.135
G1 X101.165 Y73.622 E.05378
G1 X100.62 Y73.622
G1 X102.678 Y75.68 E.07317
G1 X102.678 Y76.226
G1 X100.075 Y73.622 E.09256
G1 X99.529 Y73.622
G1 X102.678 Y76.771 E.11195
G1 X102.678 Y77.317
G1 X98.984 Y73.622 E.13135
G1 X98.438 Y73.622
G1 X102.678 Y77.862 E.15074
G1 X102.678 Y78.407
G1 X97.893 Y73.622 E.17013
G1 X97.348 Y73.622
G1 X102.678 Y78.953 E.18952
G1 X102.678 Y79.498
G1 X96.802 Y73.622 E.20891
G1 X96.257 Y73.622
G1 X102.678 Y80.044 E.22831
G1 X102.678 Y80.589
G1 X95.711 Y73.622 E.2477
G1 X95.422 Y73.879
G1 X102.678 Y81.134 E.25798
G1 X102.678 Y81.68
G1 X95.422 Y74.424 E.25798
M73 P32 R4
G1 X95.422 Y74.969
G1 X102.678 Y82.225 E.25798
G1 X102.678 Y82.771
G1 X95.422 Y75.515 E.25798
G1 X95.422 Y76.06
G1 X102.678 Y83.316 E.25798
G1 X102.678 Y83.861
G1 X95.422 Y76.606 E.25798
G1 X95.394 Y77.122
G1 X102.678 Y84.407 E.259
G1 X102.678 Y84.952
G1 X94.848 Y77.122 E.27839
G1 X94.303 Y77.122
G1 X102.678 Y85.498 E.29778
G1 X102.678 Y86.043
G1 X93.757 Y77.122 E.31717
G1 X93.212 Y77.122
G1 X102.678 Y86.589 E.33657
G1 X102.678 Y87.134
G1 X92.666 Y77.122 E.35596
G1 X92.121 Y77.122
G1 X102.678 Y87.679 E.37535
G1 X102.678 Y88.225
G1 X91.576 Y77.122 E.39474
G1 X91.03 Y77.122
G1 X102.678 Y88.77 E.41414
G1 X102.678 Y89.316
G1 X90.485 Y77.122 E.43353
G1 X89.939 Y77.122
G1 X102.678 Y89.861 E.45292
G1 X102.678 Y90.406
G1 X89.394 Y77.122 E.47231
G1 X88.849 Y77.122
G1 X102.678 Y90.952 E.4917
G1 X102.678 Y91.497
G1 X88.303 Y77.122 E.5111
G1 X87.758 Y77.122
G1 X102.678 Y92.043 E.53049
G1 X102.678 Y92.588
G1 X87.212 Y77.122 E.54988
M73 P33 R4
G1 X86.667 Y77.122
G1 X102.678 Y93.133 E.56927
G1 X102.678 Y93.679
G1 X86.122 Y77.122 E.58866
G1 X85.576 Y77.122
G1 X102.678 Y94.224 E.60806
G1 X102.678 Y94.77
G1 X85.031 Y77.122 E.62745
; WIPE_START
M204 S6000
G1 X86.445 Y78.537 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.578 Y74.488 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X83.712 Y73.622 E.03077
G1 X83.167 Y73.622
G1 X84.578 Y75.033 E.05016
G1 X84.578 Y75.579
G1 X82.622 Y73.622 E.06956
G1 X82.076 Y73.622
G1 X84.578 Y76.124 E.08895
G1 X84.578 Y76.67
G1 X81.531 Y73.622 E.10834
G1 X80.985 Y73.622
G1 X102.678 Y95.315 E.77128
G1 X102.678 Y95.86
G1 X80.44 Y73.622 E.79068
G1 X79.895 Y73.622
G1 X102.678 Y96.406 E.81007
G1 X102.678 Y96.951
G1 X79.349 Y73.622 E.82946
G1 X78.804 Y73.622
G1 X102.678 Y97.497 E.84885
G1 X102.678 Y98.042
G1 X78.268 Y73.632 E.8679
G1 X77.86 Y73.769
G1 X102.678 Y98.587 E.88241
G1 X102.678 Y99.133
G1 X77.565 Y74.02 E.8929
G1 X77.373 Y74.374
M73 P34 R4
G1 X102.678 Y99.678 E.89971
G1 X102.678 Y100.224
G1 X77.322 Y74.868 E.90153
G1 X77.322 Y75.413
G1 X102.678 Y100.769 E.90153
G1 X102.677 Y101.313
G1 X77.322 Y75.959 E.90149
G1 X77.322 Y76.504
G1 X102.576 Y101.758 E.89789
G1 X102.347 Y102.075
G1 X77.322 Y77.049 E.88978
G1 X77.322 Y77.595
G1 X102.019 Y102.291 E.87809
G1 X101.558 Y102.376
G1 X77.322 Y78.14 E.86172
G1 X77.322 Y78.686
G1 X101.013 Y102.377 E.84234
G1 X100.468 Y102.377
G1 X77.322 Y79.231 E.82295
G1 X77.322 Y79.776
G1 X99.922 Y102.377 E.80356
G1 X99.377 Y102.377
G1 X77.322 Y80.322 E.78417
G1 X77.322 Y80.867
G1 X98.832 Y102.377 E.76478
M73 P35 R4
G1 X98.287 Y102.377
G1 X77.322 Y81.413 E.7454
G1 X77.322 Y81.958
G1 X97.741 Y102.377 E.72601
G1 X97.196 Y102.377
G1 X77.322 Y82.504 E.70662
G1 X77.322 Y83.049
G1 X96.651 Y102.377 E.68723
G1 X96.105 Y102.378
G1 X88.781 Y95.054 E.2604
G1 X88.882 Y95.699
G1 X95.56 Y102.378 E.23745
G1 X95.015 Y102.378
G1 X88.727 Y96.09 E.22356
G1 X88.457 Y96.365
G1 X94.469 Y102.378 E.21377
G1 X93.924 Y102.378
G1 X88.074 Y96.527 E.20802
G1 X87.459 Y96.458
G1 X93.379 Y102.378 E.21049
; WIPE_START
M204 S6000
G1 X91.965 Y100.964 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.345 Y94.618 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X77.322 Y83.594 E.39193
G1 X77.322 Y84.14
G1 X87.701 Y94.519 E.36903
G1 X87.311 Y94.674
G1 X77.322 Y84.685 E.35515
G1 X77.322 Y85.231
G1 X87.034 Y94.943 E.34532
G1 X86.872 Y95.326
G1 X77.322 Y85.776 E.33956
G1 X77.322 Y86.321
G1 X86.941 Y95.941 E.34202
; WIPE_START
M204 S6000
G1 X85.527 Y94.526 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.727 Y100.114 Z1.24 F42000
G1 X92.834 Y102.378 Z1.24
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X77.322 Y86.867 E.55151
G1 X77.322 Y87.412
G1 X92.288 Y102.378 E.53213
M73 P36 R3
G1 X92.078 Y102.713
G1 X77.322 Y87.958 E.52465
G1 X77.322 Y88.503
G1 X92.078 Y103.259 E.52465
G1 X91.633 Y103.359
G1 X77.322 Y89.048 E.50882
G1 X77.322 Y89.594
G1 X90.409 Y102.681 E.4653
G1 X89.822 Y102.639
G1 X77.322 Y90.139 E.44442
G1 X77.322 Y90.685
G1 X89.384 Y102.746 E.42885
G1 X89.031 Y102.939
G1 X77.322 Y91.23 E.41632
G1 X77.322 Y91.775
G1 X88.744 Y103.198 E.40613
G1 X88.36 Y103.359
G1 X87.922 Y102.921 E.01559
G1 X87.38 Y102.378
G1 X77.322 Y92.321 E.35759
G1 X77.322 Y92.866
G1 X86.834 Y102.378 E.3382
G1 X86.289 Y102.378
G1 X77.322 Y93.412 E.3188
G1 X77.322 Y93.957
G1 X85.743 Y102.378 E.29941
G1 X85.197 Y102.378
G1 X77.322 Y94.502 E.28001
G1 X77.322 Y95.048
G1 X84.652 Y102.378 E.26062
G1 X84.106 Y102.378
G1 X77.322 Y95.593 E.24122
G1 X77.322 Y96.139
G1 X83.561 Y102.378 E.22182
G1 X83.015 Y102.377
G1 X77.322 Y96.684 E.20243
G1 X77.322 Y97.229
G1 X82.47 Y102.377 E.18303
G1 X81.924 Y102.377
G1 X77.322 Y97.775 E.16364
G1 X77.322 Y98.32
G1 X81.379 Y102.377 E.14424
M73 P37 R3
G1 X80.833 Y102.377
G1 X77.322 Y98.866 E.12484
G1 X77.322 Y99.411
G1 X80.288 Y102.377 E.10545
G1 X79.742 Y102.377
G1 X77.322 Y99.957 E.08605
G1 X77.322 Y100.502
G1 X79.197 Y102.377 E.06666
G1 X78.651 Y102.377
G1 X77.322 Y101.047 E.04726
; WIPE_START
M204 S6000
G1 X78.651 Y102.377 E-.71432
G1 X78.772 Y102.377 E-.04568
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.931 Y95.977 Z1.24 F42000
G1 X95.197 Y77.103 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0745487
G1 F18000
M204 S6000
G1 X95.179 Y77.135 E.0001
; LINE_WIDTH: 0.103086
G1 X95.3 Y77.216 E.00065
; WIPE_START
G1 X95.179 Y77.135 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.229 Y74.211 Z1.24 F42000
G1 X102.493 Y74.101 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.0907333
G1 F18000
M204 S6000
G2 X102.199 Y73.808 I-1.686 J1.397 E.00153
; WIPE_START
G1 X102.493 Y74.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.408 Y81.733 Z1.24 F42000
G1 X102.183 Y102.183 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.095734
G1 F18000
M204 S6000
G3 X102.068 Y102.27 I-1.242 J-1.518 E.00058
; WIPE_START
G1 X102.183 Y102.183 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.563 Y102.621 Z1.24 F42000
G1 X90.81 Y102.836 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.0937102
G1 F18000
M204 S6000
G1 X90.737 Y102.784 E.00035
; LINE_WIDTH: 0.129851
G2 X90.48 Y102.609 I-3.782 J5.259 E.00193
M204 S10000
G1 X89.604 Y102.694 F42000
; LINE_WIDTH: 0.12165
G1 F18000
M204 S6000
G1 X89.52 Y102.672 E.0005
G1 X89.421 Y102.736 E.00067
; WIPE_START
G1 X89.52 Y102.672 E-.43649
G1 X89.604 Y102.694 E-.32351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.974 Y102.491 Z1.24 F42000
G1 X78.301 Y102.393 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.297539
G1 F17097.059
M204 S6000
G1 X77.945 Y102.141 E.00748
; LINE_WIDTH: 0.340194
G1 F14712.702
G3 X77.552 Y101.746 I1.121 J-1.508 E.01115
; LINE_WIDTH: 0.306386
G1 F16541.075
G1 X77.532 Y101.718 E.0006
; LINE_WIDTH: 0.279621
G1 F18000
G1 X77.307 Y101.382 E.00646
; WIPE_START
G1 X77.532 Y101.718 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.285 Y98.161 Z1.24 F42000
G1 X87.394 Y96.522 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.192715
G1 F18000
M204 S6000
G1 X87.2 Y96.366 E.00258
G1 X86.977 Y96.133 E.00333
G3 X86.937 Y96.041 I.026 J-.066 E.00116
; LINE_WIDTH: 0.163912
G1 X86.953 Y95.929 E.00095
; WIPE_START
G1 X86.937 Y96.041 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.844 Y94.991 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.206398
G1 F18000
M204 S6000
G1 X88.705 Y94.823 E.00245
G1 X88.482 Y94.613 E.00344
G1 X88.335 Y94.628 E.00165
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X88.482 Y94.613 E-.16674
G1 X88.705 Y94.823 E-.34683
G1 X88.844 Y94.991 E-.24643
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/30
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.24 I-1.215 J.062 P1  F42000
G1 X89.233 Y102.607 Z1.24
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1750
M204 S6000
G2 X88.305 Y103.536 I.849 J1.776 E.03627
G1 X88.111 Y103.492 E.0054
G1 X88.111 Y102.411 E.02928
G1 X89.19 Y102.411 E.02924
G1 X89.22 Y102.548 E.0038
M204 S250
G1 X89.878 Y102.846 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1750
M204 S5000
G1 X90.004 Y102.84 E.00317
G3 X89.818 Y102.852 I-.005 J1.459 E.22585
; WIPE_START
G1 F11668.197
M204 S6000
G1 X90.004 Y102.84 E-.07066
G1 X90.304 Y102.872 E-.11458
G1 X90.566 Y102.954 E-.10452
G1 X90.819 Y103.092 E-.10936
G1 X91.041 Y103.276 E-.10953
G1 X91.222 Y103.5 E-.10958
G1 X91.295 Y103.625 E-.05485
G1 X91.38 Y103.837 E-.08692
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.808 Y102.411 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1750
M204 S6000
G1 X91.889 Y102.411 E.02929
G1 X91.889 Y103.49 E.02924
G1 X91.693 Y103.533 E.00544
G2 X90.764 Y102.605 I-1.776 J.85 E.03628
G1 X90.795 Y102.47 E.00377
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41641
G1 X91.889 Y103.315 E-.34359
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1750
M204 S5000
G1 X78.334 Y102.589 E.23572
G3 X77.11 Y101.298 I.075 J-1.297 E.04927
G1 X77.112 Y74.637 E.67028
G3 X78.334 Y73.412 I1.293 J.068 E.04765
G1 X84.79 Y73.41 E.16231
M73 P38 R3
G1 X84.79 Y73.79 E.00955
G1 X78.353 Y73.791 E.16184
G2 X77.49 Y74.695 I.059 J.92 E.03452
G1 X77.49 Y101.305 E.66901
G2 X78.392 Y102.21 I.933 J-.028 E.03537
G1 X87.71 Y102.21 E.23427
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.606 Y102.21 E.23421
G2 X102.51 Y101.305 I-.016 J-.921 E.03556
G1 X102.51 Y74.695 E.66901
G2 X101.647 Y73.791 I-.922 J.016 E.03452
G1 X95.21 Y73.79 E.16184
M73 P39 R3
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.888 Y74.637 I-.068 J1.292 E.04771
G1 X102.888 Y101.364 E.67194
G3 X101.663 Y102.589 I-1.298 J-.074 E.04766
G1 X92.29 Y102.59 E.23566
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.303 E.16656
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.413 Y103.766
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.466883
G1 F1750
M204 S6000
G1 X88.142 Y103.942 E.00912
G1 X88.129 Y104.485 E.01532
G2 X91.871 Y104.129 I1.87 J-.189 E.16585
G1 X91.86 Y103.965 E.00464
G2 X91.831 Y103.708 I-5.366 J.484 E.0073
M204 S10000
G1 X90.534 Y102.716 F42000
; LINE_WIDTH: 0.425834
G1 F1750
M204 S6000
G1 X90.378 Y102.473 E.00736
; LINE_WIDTH: 0.458733
G1 X90.368 Y102.458 E.0005
; LINE_WIDTH: 0.482639
G1 X90.358 Y102.443 E.00053
G1 X90.217 Y102.432 E.00413
G2 X89.639 Y102.443 I-.211 J4.041 E.01689
G1 X89.464 Y102.722 E.00965
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10037.85
G1 X89.639 Y102.443 E-.23516
G1 X90.217 Y102.432 E-.41122
G1 X90.358 Y102.443 E-.10068
G1 X90.368 Y102.458 E-.01294
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/30
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.4 I-.158 J-1.207 P1  F42000
G1 X89.233 Y102.607 Z1.4
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G2 X88.305 Y103.536 I.849 J1.776 E.03627
G1 X88.111 Y103.492 E.0054
G1 X88.111 Y102.411 E.02928
G1 X89.19 Y102.411 E.02924
G1 X89.22 Y102.548 E.00381
M204 S250
G1 X89.877 Y102.846 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G1 X90.002 Y102.84 E.00316
G3 X89.817 Y102.852 I-.003 J1.459 E.22586
; WIPE_START
G1 F11668.197
M204 S6000
G1 X90.002 Y102.84 E-.07049
M73 P40 R3
G1 X90.289 Y102.869 E-.10964
G1 X90.564 Y102.954 E-.10925
G1 X90.818 Y103.091 E-.10961
G1 X91.04 Y103.275 E-.10954
G1 X91.221 Y103.5 E-.10967
G1 X91.355 Y103.755 E-.10959
G1 X91.378 Y103.837 E-.03222
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.808 Y102.411 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G1 X91.889 Y102.411 E.02929
G1 X91.889 Y103.49 E.02924
G1 X91.693 Y103.533 E.00544
G2 X90.764 Y102.605 I-1.776 J.849 E.03627
G1 X90.795 Y102.47 E.00377
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41638
G1 X91.889 Y103.315 E-.34362
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G1 X78.334 Y102.589 E.23572
G3 X77.11 Y101.295 I.085 J-1.306 E.04924
G1 X77.11 Y74.706 E.6685
G3 X78.334 Y73.412 I1.307 J.011 E.04925
G1 X84.79 Y73.41 E.16231
G1 X84.79 Y73.79 E.00955
G1 X78.353 Y73.791 E.16184
G2 X77.49 Y74.693 I.073 J.934 E.03434
G1 X77.49 Y101.308 E.66914
G2 X78.392 Y102.21 I.933 J-.031 E.03532
G1 X87.71 Y102.21 E.23427
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.2342
M73 P41 R3
G2 X102.51 Y101.305 I-.021 J-.926 E.03552
G1 X102.51 Y74.695 E.66901
G2 X101.647 Y73.791 I-.922 J.016 E.03452
G1 X95.21 Y73.79 E.16184
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.888 Y74.637 I-.068 J1.292 E.04772
G1 X102.888 Y101.363 E.67193
G3 X101.595 Y102.59 I-1.297 J-.072 E.0494
G1 X92.29 Y102.59 E.23393
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.303 E.16656
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.413 Y103.766
G1 Z1.16
M73 P42 R3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.46684
G1 F1749
M204 S6000
G1 X88.142 Y103.942 E.00912
G1 X88.129 Y104.486 E.01533
G2 X91.871 Y104.128 I1.87 J-.191 E.16575
G1 X91.86 Y103.964 E.00464
G2 X91.831 Y103.708 I-5.841 J.531 E.00727
M204 S10000
G1 X90.534 Y102.715 F42000
; LINE_WIDTH: 0.461492
G1 F1749
M204 S6000
G1 X90.364 Y102.452 E.00871
; LINE_WIDTH: 0.483044
G1 X90.016 Y102.425 E.01023
G1 X89.639 Y102.443 E.01101
G1 X89.467 Y102.729 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10028.803
G1 X89.639 Y102.443 E-.23963
G1 X90.016 Y102.425 E-.26975
G1 X90.364 Y102.452 E-.25062
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/30
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.56 I-.165 J-1.206 P1  F42000
G1 X89.233 Y102.607 Z1.56
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1769
M204 S6000
G2 X88.305 Y103.536 I.849 J1.776 E.03627
G1 X88.111 Y103.492 E.0054
G1 X88.111 Y102.411 E.02928
G1 X89.19 Y102.411 E.02924
G1 X89.22 Y102.548 E.00381
M204 S250
G1 X89.876 Y102.846 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1769
M204 S5000
G1 X89.998 Y102.84 E.00308
G3 X89.816 Y102.852 I-.001 J1.459 E.22593
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.998 Y102.84 E-.06936
G1 X90.234 Y102.859 E-.08982
G1 X90.513 Y102.933 E-.10967
G1 X90.772 Y103.061 E-.10973
G1 X91.001 Y103.237 E-.10965
G1 X91.19 Y103.454 E-.1096
G1 X91.333 Y103.705 E-.1097
G1 X91.377 Y103.836 E-.05248
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.812 Y102.411 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1769
M204 S6000
G1 X91.889 Y102.411 E.02919
G1 X91.889 Y103.493 E.02931
G1 X91.698 Y103.538 E.00533
G2 X90.764 Y102.598 I-1.752 J.806 E.03667
G1 X90.797 Y102.469 E.0036
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41571
G1 X91.889 Y103.317 E-.34429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1769
M204 S5000
G1 X78.335 Y102.589 E.2357
G3 X77.11 Y101.295 I.082 J-1.305 E.04928
G1 X77.112 Y74.637 E.67022
G3 X78.334 Y73.412 I1.308 J.083 E.04752
G1 X84.79 Y73.41 E.16231
G1 X84.79 Y73.79 E.00955
G1 X78.353 Y73.791 E.16185
G2 X77.49 Y74.695 I.074 J.934 E.03439
G1 X77.49 Y101.305 E.66901
G2 X78.395 Y102.21 I.933 J-.028 E.03544
G1 X87.71 Y102.21 E.2342
M73 P43 R3
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.51 Y101.305 I-.021 J-.926 E.03553
G1 X102.51 Y74.695 E.66901
G2 X101.647 Y73.791 I-.937 J.03 E.03439
G1 X95.21 Y73.79 E.16185
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.706 I-.08 J1.304 E.04932
G1 X102.888 Y101.364 E.67022
G3 X101.663 Y102.589 I-1.292 J-.068 E.04771
G1 X92.29 Y102.59 E.23566
M73 P44 R3
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.303 E.16656
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.413 Y103.766
G1 Z1.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.465432
G1 F1769
M204 S6000
G1 X88.142 Y103.942 E.00909
G1 X88.129 Y104.486 E.0153
G2 X91.867 Y104.058 I1.871 J-.193 E.16728
; LINE_WIDTH: 0.488981
G1 X91.837 Y103.711 E.01032
; WIPE_START
G1 F9897.84
G1 X91.867 Y104.058 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.509 Y102.619 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.173438
G1 F1769
M204 S6000
G1 X91.667 Y103.041 E.00409
M204 S10000
G1 X91.682 Y102.797 F42000
; LINE_WIDTH: 0.236186
G1 F1769
M204 S6000
G1 X91.233 Y102.619 E.00636
M204 S10000
G1 X90.59 Y102.468 F42000
; LINE_WIDTH: 0.483833
G1 F1769
M204 S6000
G2 X89.408 Y102.47 I-.583 J4.01 E.03477
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10011.198
G1 X90.003 Y102.425 E-.38282
G1 X90.59 Y102.468 E-.37718
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/30
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.72 I-.124 J-1.211 P1  F42000
G1 X89.233 Y102.607 Z1.72
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1770
M204 S6000
G2 X88.305 Y103.536 I.85 J1.776 E.03627
G1 X88.111 Y103.492 E.0054
G1 X88.111 Y102.411 E.02928
G1 X89.19 Y102.411 E.02924
G1 X89.22 Y102.548 E.00381
M204 S250
G1 X89.875 Y102.846 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1770
M204 S5000
G1 X89.997 Y102.84 E.00307
G3 X89.815 Y102.852 I.001 J1.459 E.22594
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.997 Y102.84 E-.06918
G1 X90.235 Y102.859 E-.09074
G1 X90.514 Y102.934 E-.10985
G1 X90.773 Y103.061 E-.10947
G1 X91.001 Y103.238 E-.10979
G1 X91.19 Y103.455 E-.10942
G1 X91.334 Y103.706 E-.10986
G1 X91.376 Y103.835 E-.05169
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.812 Y102.411 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1770
M204 S6000
G1 X91.889 Y102.411 E.02919
G1 X91.889 Y103.493 E.02931
G1 X91.698 Y103.538 E.00533
G2 X90.764 Y102.598 I-1.752 J.806 E.03667
G1 X90.797 Y102.469 E.0036
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41567
G1 X91.889 Y103.317 E-.34433
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1770
M204 S5000
G1 X78.334 Y102.589 E.23572
G3 X77.11 Y101.295 I.07 J-1.293 E.04938
G1 X77.11 Y74.705 E.6685
G3 X78.334 Y73.412 I1.299 J.004 E.04932
G1 X84.79 Y73.41 E.16231
M73 P45 R3
G1 X84.79 Y73.79 E.00955
G1 X78.355 Y73.791 E.16178
G2 X77.49 Y74.693 I.072 J.935 E.03439
G1 X77.49 Y101.308 E.66912
G2 X78.395 Y102.21 I.926 J-.024 E.03546
G1 X87.71 Y102.21 E.23419
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.51 Y101.305 I-.015 J-.92 E.03558
G1 X102.51 Y74.693 E.66907
G2 X101.645 Y73.791 I-.936 J.032 E.0344
G1 X95.21 Y73.79 E.16178
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.706 I-.072 J1.297 E.0494
G1 X102.888 Y101.363 E.67021
M73 P46 R3
G3 X101.595 Y102.59 I-1.289 J-.064 E.04948
G1 X92.29 Y102.59 E.23393
G1 X92.284 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.283 J-.311 E.16632
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.413 Y103.766
G1 Z1.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.465455
G1 F1770
M204 S6000
G1 X88.142 Y103.942 E.00909
G1 X88.13 Y104.487 E.01532
G2 X91.867 Y104.061 I1.871 J-.195 E.16711
; LINE_WIDTH: 0.488826
G1 X91.837 Y103.711 E.01039
; WIPE_START
G1 F9901.218
G1 X91.867 Y104.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.509 Y102.619 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.171877
G1 F1770
M204 S6000
G1 X91.667 Y103.041 E.00404
M204 S10000
G1 X91.682 Y102.797 F42000
; LINE_WIDTH: 0.237451
G1 F1770
M204 S6000
G1 X91.234 Y102.619 E.00638
M204 S10000
G1 X90.59 Y102.468 F42000
; LINE_WIDTH: 0.483848
G1 F1770
M204 S6000
G2 X89.408 Y102.47 I-.585 J4.018 E.03478
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10010.865
G1 X90.002 Y102.425 E-.38178
G1 X90.59 Y102.468 E-.37822
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/30
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.88 I-.124 J-1.211 P1  F42000
G1 X89.233 Y102.607 Z1.88
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1769
M204 S6000
G2 X88.305 Y103.536 I.85 J1.776 E.03627
G1 X88.111 Y103.492 E.0054
G1 X88.111 Y102.411 E.02928
G1 X89.19 Y102.411 E.02924
G1 X89.22 Y102.548 E.00381
M204 S250
G1 X89.874 Y102.846 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1769
M204 S5000
G1 X89.875 Y102.846 E.00002
G1 X89.995 Y102.84 E.00303
G3 X89.592 Y102.898 I.002 J1.459 E.22024
G1 X89.815 Y102.857 E.00571
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.875 Y102.846 E-.02317
G1 X89.995 Y102.84 E-.04577
G1 X90.236 Y102.859 E-.09159
G1 X90.515 Y102.934 E-.1098
G1 X90.774 Y103.062 E-.10967
G1 X91.002 Y103.238 E-.10977
G1 X91.192 Y103.456 E-.10967
G1 X91.334 Y103.708 E-.10984
G1 X91.376 Y103.834 E-.05071
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.812 Y102.411 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1769
M204 S6000
G1 X91.889 Y102.411 E.02919
G1 X91.889 Y103.493 E.02931
G1 X91.698 Y103.538 E.00534
G2 X90.764 Y102.598 I-1.752 J.806 E.03667
G1 X90.797 Y102.469 E.0036
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41563
G1 X91.889 Y103.317 E-.34437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1769
M204 S5000
G1 X78.334 Y102.589 E.23572
G3 X77.11 Y101.295 I.072 J-1.294 E.04936
G1 X77.11 Y74.706 E.66849
M73 P47 R3
G3 X78.334 Y73.412 I1.295 J-.001 E.04938
G1 X84.79 Y73.41 E.16231
G1 X84.79 Y73.79 E.00955
G1 X78.352 Y73.791 E.16186
G2 X77.49 Y74.695 I.074 J.934 E.03438
G1 X77.49 Y101.308 E.66907
G2 X78.392 Y102.21 I.927 J-.024 E.03538
G1 X87.71 Y102.21 E.23427
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.608 Y102.21 E.23427
G2 X102.51 Y101.305 I-.024 J-.926 E.03545
G1 X102.51 Y74.695 E.66901
G2 X101.648 Y73.791 I-.936 J.029 E.03438
G1 X95.21 Y73.79 E.16186
M73 P48 R3
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.706 I-.08 J1.304 E.04932
G1 X102.888 Y101.364 E.67022
G3 X101.595 Y102.59 I-1.303 J-.079 E.04934
G1 X92.29 Y102.59 E.23393
G1 X92.283 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.306 E.16647
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.413 Y103.766
G1 Z1.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.465321
G1 F1769
M204 S6000
G1 X88.142 Y103.942 E.00909
G1 X88.13 Y104.487 E.01533
G2 X91.868 Y104.062 I1.871 J-.194 E.16709
; LINE_WIDTH: 0.488715
G1 X91.837 Y103.711 E.01044
; WIPE_START
G1 F9903.642
G1 X91.868 Y104.062 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.508 Y102.619 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.170677
G1 F1769
M204 S6000
G1 X91.667 Y103.041 E.00401
M204 S10000
G1 X91.682 Y102.797 F42000
; LINE_WIDTH: 0.238981
G1 F1769
M204 S6000
G1 X91.234 Y102.619 E.00643
M204 S10000
G1 X90.59 Y102.468 F42000
; LINE_WIDTH: 0.483848
G1 F1769
M204 S6000
G2 X89.408 Y102.47 I-.583 J3.985 E.03478
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10010.857
G1 X90 Y102.425 E-.38079
G1 X90.59 Y102.468 E-.37921
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/30
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.04 I-.124 J-1.211 P1  F42000
G1 X89.233 Y102.607 Z2.04
G1 Z1.8
M73 P49 R3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1769
M204 S6000
G2 X88.305 Y103.536 I.85 J1.776 E.03627
G1 X88.111 Y103.492 E.0054
G1 X88.111 Y102.411 E.02928
G1 X89.19 Y102.411 E.02924
G1 X89.22 Y102.548 E.00381
M204 S250
G1 X89.873 Y102.846 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1769
M204 S5000
G1 X89.876 Y102.846 E.00007
G1 X89.994 Y102.84 E.00298
G3 X89.592 Y102.898 I.003 J1.459 E.22028
G1 X89.814 Y102.857 E.00568
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.876 Y102.846 E-.02381
G1 X89.994 Y102.84 E-.04498
G1 X90.237 Y102.859 E-.09248
G1 X90.516 Y102.934 E-.10985
G1 X90.774 Y103.063 E-.10969
G1 X91.003 Y103.239 E-.1098
G1 X91.192 Y103.457 E-.10966
G1 X91.335 Y103.709 E-.10985
G1 X91.376 Y103.833 E-.04989
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.812 Y102.411 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1769
M204 S6000
G1 X91.889 Y102.411 E.02918
G1 X91.889 Y103.493 E.02931
G1 X91.698 Y103.538 E.00534
G2 X90.764 Y102.598 I-1.753 J.806 E.03666
G1 X90.797 Y102.469 E.0036
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41559
G1 X91.889 Y103.317 E-.34441
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1769
M204 S5000
G1 X78.334 Y102.589 E.23572
G3 X77.11 Y101.295 I.078 J-1.3 E.04931
G1 X77.11 Y74.706 E.66849
G3 X78.334 Y73.412 I1.307 J.011 E.04926
G1 X84.79 Y73.41 E.16231
G1 X84.79 Y73.79 E.00955
G1 X78.353 Y73.791 E.16185
G2 X77.49 Y74.695 I.073 J.934 E.03439
G1 X77.49 Y101.308 E.66907
G2 X78.395 Y102.21 I.926 J-.024 E.03546
G1 X87.71 Y102.21 E.23419
M73 P50 R3
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.51 Y101.305 I-.015 J-.92 E.03558
G1 X102.51 Y74.693 E.66906
G2 X101.645 Y73.791 I-.936 J.031 E.0344
G1 X95.21 Y73.79 E.16178
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.706 I-.08 J1.304 E.04932
G1 X102.888 Y101.366 E.67027
G3 X101.595 Y102.59 I-1.304 J-.083 E.04927
G1 X92.29 Y102.59 E.23393
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.303 E.16656
G1 X87.71 Y102.65 E.04877
; WIPE_START
M73 P51 R3
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.413 Y103.766
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.465389
G1 F1769
M204 S6000
G1 X88.142 Y103.942 E.00909
G1 X88.13 Y104.488 E.01534
G2 X91.868 Y104.064 I1.871 J-.196 E.16696
; LINE_WIDTH: 0.48859
G1 X91.838 Y103.711 E.01049
; WIPE_START
G1 F9906.35
G1 X91.868 Y104.064 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.509 Y102.619 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.169416
G1 F1769
M204 S6000
G1 X91.667 Y103.041 E.00397
M204 S10000
G1 X91.682 Y102.797 F42000
; LINE_WIDTH: 0.240253
G1 F1769
M204 S6000
G1 X91.233 Y102.619 E.00647
M204 S10000
G1 X90.59 Y102.468 F42000
; LINE_WIDTH: 0.483866
G1 F1769
M204 S6000
G2 X89.408 Y102.47 I-.584 J3.989 E.03478
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10010.468
G1 X89.999 Y102.425 E-.37975
G1 X90.59 Y102.468 E-.38025
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/30
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.2 I-.124 J-1.211 P1  F42000
G1 X89.232 Y102.607 Z2.2
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1771
M204 S6000
G2 X88.305 Y103.536 I.85 J1.776 E.03626
G1 X88.111 Y103.492 E.0054
G1 X88.111 Y102.411 E.02928
G1 X89.19 Y102.411 E.02924
G1 X89.22 Y102.548 E.00381
M204 S250
G1 X89.872 Y102.846 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1771
M204 S5000
G1 X89.876 Y102.845 E.00011
G1 X89.993 Y102.84 E.00292
G3 X89.593 Y102.898 I.005 J1.459 E.22034
G1 X89.813 Y102.857 E.00563
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.876 Y102.845 E-.02443
G1 X89.993 Y102.84 E-.0442
G1 X90.238 Y102.86 E-.09341
G1 X90.517 Y102.935 E-.10976
G1 X90.775 Y103.063 E-.10984
G1 X91.004 Y103.24 E-.10979
G1 X91.193 Y103.458 E-.10968
G1 X91.335 Y103.71 E-.10985
G1 X91.376 Y103.832 E-.04903
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y102.411 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1771
M204 S6000
G1 X91.889 Y102.411 E.02918
G1 X91.889 Y103.493 E.02931
G1 X91.698 Y103.538 E.00534
G2 X90.764 Y102.597 I-1.753 J.806 E.03666
G1 X90.797 Y102.469 E.00359
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41554
G1 X91.889 Y103.318 E-.34446
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1771
M204 S5000
G1 X78.334 Y102.589 E.23572
G3 X77.11 Y101.295 I.067 J-1.289 E.04941
G1 X77.11 Y74.705 E.6685
G3 X78.334 Y73.412 I1.295 J0 E.04937
G1 X84.79 Y73.41 E.16231
G1 X84.79 Y73.79 E.00955
G1 X78.353 Y73.791 E.16185
G2 X77.49 Y74.695 I.066 J.926 E.03446
G1 X77.49 Y101.308 E.66907
M73 P52 R2
G2 X78.395 Y102.21 I.926 J-.024 E.03546
G1 X87.71 Y102.21 E.23419
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.51 Y101.305 I-.021 J-.926 E.03553
G1 X102.51 Y74.693 E.66906
G2 X101.645 Y73.791 I-.938 J.034 E.03439
G1 X95.21 Y73.79 E.16178
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.706 I-.072 J1.297 E.0494
G1 X102.888 Y101.364 E.67022
G3 X101.595 Y102.59 I-1.297 J-.072 E.04939
G1 X92.29 Y102.59 E.23393
M73 P53 R2
G1 X92.285 Y104.59 E.05028
G3 X88.248 Y105.774 I-2.285 J-.318 E.13312
G3 X87.71 Y104.59 I2.115 J-1.674 E.03302
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.146 Y103.94
G1 Z1.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.469376
G1 F1771
M204 S6000
G1 X88.413 Y103.766 E.00905
M204 S10000
G1 X88.146 Y103.94 F42000
; LINE_WIDTH: 0.466441
G1 F1771
M204 S6000
G1 X88.13 Y104.488 E.01547
G2 X91.868 Y104.066 I1.871 J-.195 E.16738
G1 X91.838 Y103.711 E.01004
; WIPE_START
G1 F10414.146
G1 X91.868 Y104.066 E-.13543
G1 X91.868 Y104.518 E-.1717
G1 X91.81 Y104.789 E-.10532
G1 X91.688 Y105.117 E-.13293
G1 X91.493 Y105.434 E-.14157
G1 X91.362 Y105.575 E-.07306
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.509 Y102.619 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.167714
G1 F1771
M204 S6000
G1 X91.667 Y103.041 E.00392
M204 S10000
G1 X91.682 Y102.797 F42000
; LINE_WIDTH: 0.241667
G1 F1771
M204 S6000
G1 X91.234 Y102.619 E.00651
M204 S10000
G1 X90.591 Y102.468 F42000
; LINE_WIDTH: 0.483872
G1 F1771
M204 S6000
G2 X89.408 Y102.47 I-.585 J4.007 E.03479
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10010.32
G1 X89.997 Y102.425 E-.3788
G1 X90.591 Y102.468 E-.3812
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/30
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.36 I-.124 J-1.211 P1  F42000
G1 X89.232 Y102.607 Z2.36
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1771
M204 S6000
G2 X88.305 Y103.536 I.85 J1.777 E.03626
G1 X88.111 Y103.492 E.0054
G1 X88.111 Y102.411 E.02928
G1 X89.19 Y102.411 E.02924
G1 X89.22 Y102.549 E.00381
M204 S250
G1 X89.871 Y102.846 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1771
M204 S5000
G1 X89.877 Y102.845 E.00015
G1 X89.991 Y102.84 E.00287
G3 X89.594 Y102.897 I.006 J1.459 E.2204
G1 X89.812 Y102.857 E.00558
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.877 Y102.845 E-.0251
G1 X89.991 Y102.84 E-.04339
G1 X90.238 Y102.86 E-.09421
G1 X90.518 Y102.935 E-.10996
G1 X90.776 Y103.064 E-.10981
G1 X91.005 Y103.241 E-.10971
G1 X91.194 Y103.459 E-.10983
G1 X91.336 Y103.711 E-.10993
G1 X91.375 Y103.831 E-.04806
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y102.411 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1771
M204 S6000
G1 X91.889 Y102.411 E.02918
G1 X91.889 Y103.493 E.02931
G1 X91.697 Y103.538 E.00534
G2 X90.764 Y102.597 I-1.753 J.806 E.03666
G1 X90.797 Y102.469 E.00359
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41552
G1 X91.889 Y103.318 E-.34448
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1771
M204 S5000
G1 X78.334 Y102.589 E.23572
G3 X77.11 Y101.295 I.08 J-1.302 E.04929
G1 X77.112 Y74.637 E.67022
G3 X78.336 Y73.412 I1.289 J.064 E.04772
G1 X84.79 Y73.41 E.16227
M73 P54 R2
G1 X84.79 Y73.79 E.00955
G1 X78.353 Y73.791 E.16185
G2 X77.49 Y74.693 I.066 J.926 E.0344
G1 X77.49 Y101.308 E.66915
G2 X78.395 Y102.21 I.926 J-.024 E.03545
G1 X87.71 Y102.21 E.23419
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.51 Y101.305 I-.015 J-.92 E.03558
G1 X102.51 Y74.695 E.66901
G2 X101.647 Y73.791 I-.939 J.032 E.03437
G1 X95.21 Y73.79 E.16185
M73 P55 R2
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.706 I-.08 J1.304 E.04932
G1 X102.888 Y101.366 E.67028
G3 X101.664 Y102.589 I-1.306 J-.084 E.04751
G1 X92.29 Y102.59 E.23569
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.306 E.16646
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.146 Y103.939
G1 Z2.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.469068
G1 F1771
M204 S6000
G1 X88.413 Y103.766 E.00904
M204 S10000
G1 X88.146 Y103.939 F42000
; LINE_WIDTH: 0.466233
G1 F1771
M204 S6000
G1 X88.13 Y104.489 E.01548
G2 X91.868 Y104.068 I1.871 J-.195 E.16723
G1 X91.838 Y103.711 E.01009
; WIPE_START
G1 F10419.147
G1 X91.868 Y104.068 E-.13618
G1 X91.868 Y104.509 E-.16765
G1 X91.81 Y104.788 E-.10822
G1 X91.678 Y105.135 E-.141
G1 X91.494 Y105.433 E-.13301
G1 X91.362 Y105.575 E-.07394
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.509 Y102.619 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.166577
G1 F1771
M204 S6000
G1 X91.667 Y103.041 E.00389
M204 S10000
G1 X91.682 Y102.797 F42000
; LINE_WIDTH: 0.242772
G1 F1771
M204 S6000
G1 X91.234 Y102.619 E.00654
M204 S10000
G1 X90.591 Y102.468 F42000
; LINE_WIDTH: 0.483874
G1 F1771
M204 S6000
G2 X89.408 Y102.469 I-.587 J4.02 E.03479
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10010.292
G1 X89.996 Y102.425 E-.37784
G1 X90.591 Y102.468 E-.38216
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/30
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.52 I-.124 J-1.211 P1  F42000
G1 X89.232 Y102.607 Z2.52
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1771
M204 S6000
G2 X88.305 Y103.536 I.85 J1.776 E.03626
G1 X88.111 Y103.492 E.0054
G1 X88.111 Y102.411 E.02929
G1 X89.189 Y102.411 E.02923
G1 X89.22 Y102.549 E.00381
M204 S250
G1 X89.87 Y102.847 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1771
M204 S5000
G1 X89.878 Y102.845 E.0002
G1 X89.99 Y102.84 E.00282
G3 X89.594 Y102.897 I.007 J1.459 E.22045
G1 X89.811 Y102.858 E.00554
; WIPE_START
G1 F11668.197
M204 S6000
M73 P56 R2
G1 X89.878 Y102.845 E-.02576
G1 X89.99 Y102.84 E-.04261
G1 X90.239 Y102.86 E-.09509
G1 X90.518 Y102.935 E-.10983
G1 X90.777 Y103.064 E-.11001
G1 X91.006 Y103.242 E-.10985
G1 X91.194 Y103.46 E-.10967
G1 X91.337 Y103.713 E-.11025
G1 X91.375 Y103.83 E-.04695
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y102.411 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1771
M204 S6000
G1 X91.889 Y102.411 E.02917
G1 X91.889 Y103.493 E.02931
G1 X91.697 Y103.538 E.00535
G2 X90.764 Y102.597 I-1.753 J.806 E.03665
G1 X90.798 Y102.469 E.00359
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41545
G1 X91.889 Y103.318 E-.34455
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1771
M204 S5000
G1 X78.334 Y102.589 E.23572
G3 X77.11 Y101.295 I.07 J-1.293 E.04938
G1 X77.11 Y74.705 E.66851
G3 X78.334 Y73.412 I1.303 J.008 E.04929
G1 X84.79 Y73.41 E.16231
G1 X84.79 Y73.79 E.00955
G1 X78.353 Y73.791 E.16184
G2 X77.49 Y74.695 I.076 J.937 E.03437
G1 X77.49 Y101.305 E.66901
G2 X78.392 Y102.21 I.924 J-.019 E.03548
G1 X87.71 Y102.21 E.23426
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
M73 P57 R2
G2 X102.51 Y101.305 I-.019 J-.924 E.03554
G1 X102.51 Y74.694 E.66906
G2 X101.647 Y73.791 I-.928 J.024 E.03442
G1 X95.21 Y73.79 E.16184
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.706 I-.072 J1.297 E.0494
G1 X102.888 Y101.366 E.67028
G3 X101.595 Y102.59 I-1.305 J-.083 E.04926
G1 X92.29 Y102.59 E.23393
G1 X92.282 Y104.59 E.05028
G3 X87.799 Y104.93 I-2.277 J-.297 E.15765
G1 X87.71 Y104.59 E.00882
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.146 Y103.939
G1 Z2.28
M73 P58 R2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.468754
G1 F1771
M204 S6000
G1 X88.413 Y103.766 E.00902
M204 S10000
G1 X88.146 Y103.939 F42000
; LINE_WIDTH: 0.466252
G1 F1771
M204 S6000
G1 X88.13 Y104.49 E.0155
G2 X91.868 Y104.07 I1.871 J-.196 E.16716
G1 X91.838 Y103.711 E.01015
; WIPE_START
G1 F10418.704
G1 X91.868 Y104.07 E-.13692
G1 X91.868 Y104.509 E-.16692
G1 X91.811 Y104.787 E-.10787
G1 X91.679 Y105.134 E-.14104
G1 X91.495 Y105.432 E-.13301
G1 X91.362 Y105.575 E-.07424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.509 Y102.619 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.165072
G1 F1771
M204 S6000
G1 X91.667 Y103.041 E.00384
M204 S10000
G1 X91.682 Y102.797 F42000
; LINE_WIDTH: 0.244481
G1 F1771
M204 S6000
G1 X91.235 Y102.619 E.00659
M204 S10000
G1 X90.591 Y102.468 F42000
; LINE_WIDTH: 0.483883
G1 F1771
M204 S6000
G2 X89.407 Y102.47 I-.585 J3.995 E.0348
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10010.083
G1 X89.994 Y102.425 E-.37685
G1 X90.591 Y102.468 E-.38315
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/30
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.68 I-.124 J-1.211 P1  F42000
G1 X89.232 Y102.607 Z2.68
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1748
M204 S6000
G2 X88.305 Y103.536 I.85 J1.776 E.03626
G1 X88.111 Y103.492 E.0054
G1 X88.111 Y102.411 E.02929
G1 X89.189 Y102.411 E.02923
G1 X89.219 Y102.549 E.00382
M204 S250
G1 X89.869 Y102.847 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
M204 S5000
G1 X89.878 Y102.845 E.00024
G1 X89.988 Y102.84 E.00277
G3 X89.595 Y102.897 I.009 J1.459 E.22049
G1 X89.81 Y102.858 E.0055
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.878 Y102.845 E-.02642
G1 X89.988 Y102.84 E-.0418
G1 X90.24 Y102.86 E-.09592
G1 X90.519 Y102.936 E-.11003
G1 X90.778 Y103.065 E-.10985
G1 X91.006 Y103.243 E-.10997
G1 X91.195 Y103.462 E-.10984
G1 X91.337 Y103.714 E-.10988
G1 X91.375 Y103.829 E-.04628
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y102.411 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1748
M204 S6000
G1 X91.889 Y102.411 E.02917
G1 X91.889 Y103.493 E.02931
G1 X91.697 Y103.538 E.00535
G2 X90.764 Y102.597 I-1.753 J.805 E.03665
G1 X90.798 Y102.469 E.00359
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41543
G1 X91.889 Y103.318 E-.34457
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
M204 S5000
G1 X78.336 Y102.589 E.23568
G3 X77.11 Y101.295 I.081 J-1.305 E.0493
G1 X77.11 Y74.706 E.66849
G3 X78.334 Y73.412 I1.307 J.011 E.04926
G1 X84.79 Y73.41 E.16231
G1 X84.79 Y73.79 E.00955
G1 X78.353 Y73.791 E.16184
G2 X77.49 Y74.695 I.074 J.934 E.0344
G1 X77.49 Y101.308 E.66907
G2 X78.395 Y102.21 I.926 J-.024 E.03546
G1 X87.71 Y102.21 E.23419
M73 P59 R2
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.51 Y101.305 I-.021 J-.926 E.03552
G1 X102.51 Y74.693 E.66907
G2 X101.647 Y73.791 I-.922 J.019 E.03446
G1 X95.21 Y73.79 E.16184
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.706 I-.08 J1.304 E.04932
G1 X102.888 Y101.364 E.67022
G3 X101.595 Y102.59 I-1.293 J-.068 E.04944
G1 X92.29 Y102.59 E.23393
M73 P60 R2
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.303 E.16656
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.146 Y103.939
G1 Z2.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.468365
G1 F1748
M204 S6000
G1 X88.413 Y103.766 E.00901
M204 S10000
G1 X88.146 Y103.939 F42000
; LINE_WIDTH: 0.46636
G1 F1748
M204 S6000
G1 X88.13 Y104.49 E.01552
G2 X91.868 Y104.072 I1.871 J-.197 E.16708
G1 X91.838 Y103.711 E.0102
M204 S10000
G1 X90.591 Y102.468 F42000
; LINE_WIDTH: 0.483885
G1 F1748
M204 S6000
G2 X89.407 Y102.47 I-.585 J3.996 E.03481
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10010.048
G1 X89.993 Y102.425 E-.37589
G1 X90.591 Y102.468 E-.38411
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/30
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.84 I-.124 J-1.211 P1  F42000
G1 X89.232 Y102.607 Z2.84
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G2 X88.305 Y103.536 I.851 J1.777 E.03625
G1 X88.111 Y103.492 E.0054
G1 X88.111 Y102.411 E.02929
G1 X89.189 Y102.411 E.02923
G1 X89.219 Y102.549 E.00382
M204 S250
G1 X89.867 Y102.847 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G1 X89.879 Y102.845 E.0003
G1 X89.987 Y102.84 E.00271
G3 X89.595 Y102.897 I.01 J1.459 E.22054
G1 X89.808 Y102.858 E.00545
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.879 Y102.845 E-.02731
G1 X89.987 Y102.84 E-.041
G1 X90.241 Y102.86 E-.09681
G1 X90.52 Y102.936 E-.11
G1 X90.779 Y103.065 E-.11002
G1 X91.007 Y103.243 E-.10991
G1 X91.196 Y103.463 E-.1099
G1 X91.338 Y103.715 E-.1099
G1 X91.374 Y103.828 E-.04515
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y102.411 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G1 X91.889 Y102.411 E.02917
G1 X91.889 Y103.493 E.02931
G1 X91.697 Y103.538 E.00535
G2 X90.764 Y102.597 I-1.753 J.806 E.03665
G1 X90.798 Y102.469 E.00359
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41538
G1 X91.889 Y103.318 E-.34462
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G1 X78.337 Y102.589 E.23566
G3 X77.11 Y101.295 I.08 J-1.304 E.04932
G1 X77.11 Y74.705 E.66851
G3 X78.334 Y73.412 I1.297 J.002 E.04934
G1 X84.79 Y73.41 E.16231
M73 P61 R2
G1 X84.79 Y73.79 E.00955
G1 X78.355 Y73.791 E.16178
G2 X77.49 Y74.693 I.047 J.912 E.03462
G1 X77.49 Y101.308 E.66914
G2 X78.395 Y102.21 I.931 J-.029 E.03541
G1 X87.71 Y102.21 E.23419
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.51 Y101.305 I-.021 J-.926 E.03553
G1 X102.51 Y74.695 E.66901
G2 X101.647 Y73.791 I-.928 J.022 E.03447
G1 X95.21 Y73.79 E.16184
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
M73 P62 R2
G3 X102.89 Y74.706 I-.08 J1.304 E.04932
G1 X102.888 Y101.364 E.67023
G3 X101.664 Y102.589 I-1.289 J-.065 E.04771
G1 X92.29 Y102.59 E.23568
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.303 E.16656
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.147 Y103.939
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.465494
G1 F1749
M204 S6000
G1 X88.13 Y104.491 E.01551
G2 X91.868 Y104.074 I1.87 J-.199 E.16664
G1 X91.858 Y103.945 E.00365
; LINE_WIDTH: 0.479481
G1 X91.836 Y103.93 E.00076
; LINE_WIDTH: 0.441286
G1 X91.814 Y103.916 E.00069
; LINE_WIDTH: 0.403576
G1 X91.584 Y103.77 E.00654
M204 S10000
G1 X90.591 Y102.468 F42000
; LINE_WIDTH: 0.483904
G1 F1749
M204 S6000
G2 X89.407 Y102.47 I-.586 J4.005 E.03481
M204 S10000
G1 X88.413 Y103.766 F42000
; LINE_WIDTH: 0.467812
G1 F1749
M204 S6000
G1 X88.147 Y103.939 E.00899
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10381.198
G1 X88.413 Y103.766 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/30
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3 I.994 J.702 P1  F42000
G1 X89.232 Y102.607 Z3
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1748
M204 S6000
G2 X88.305 Y103.536 I.851 J1.777 E.03625
G1 X88.111 Y103.492 E.00539
G1 X88.111 Y102.411 E.02929
G1 X89.189 Y102.411 E.02923
G1 X89.219 Y102.549 E.00382
M204 S250
G1 X89.867 Y102.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
M204 S5000
G1 X89.88 Y102.845 E.00033
G1 X89.985 Y102.84 E.00266
G3 X89.596 Y102.897 I.012 J1.459 E.2206
G1 X89.808 Y102.858 E.00541
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.88 Y102.845 E-.02773
G1 X89.985 Y102.84 E-.04022
G1 X90.242 Y102.86 E-.0977
G1 X90.521 Y102.936 E-.11002
G1 X90.78 Y103.066 E-.10994
G1 X91.008 Y103.244 E-.11006
G1 X91.197 Y103.464 E-.11004
G1 X91.338 Y103.716 E-.10985
G1 X91.374 Y103.827 E-.04445
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y102.411 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1748
M204 S6000
G1 X91.889 Y102.411 E.02916
G1 X91.889 Y103.493 E.02931
G1 X91.697 Y103.538 E.00535
G2 X90.764 Y102.597 I-1.754 J.806 E.03664
G1 X90.798 Y102.469 E.00359
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41533
G1 X91.889 Y103.318 E-.34467
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P63 R2
G1 F1748
M204 S5000
G1 X78.334 Y102.589 E.23572
G3 X77.11 Y101.295 I.07 J-1.293 E.04938
G1 X77.112 Y74.637 E.67022
G3 X78.334 Y73.412 I1.293 J.068 E.04765
G1 X84.79 Y73.41 E.16231
G1 X84.79 Y73.79 E.00955
G1 X78.353 Y73.791 E.16184
G2 X77.49 Y74.695 I.065 J.926 E.03447
G1 X77.49 Y101.305 E.66901
G2 X78.395 Y102.21 I.93 J-.025 E.03548
G1 X87.71 Y102.21 E.23419
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.51 Y101.305 I-.007 J-.912 E.03567
G1 X102.51 Y74.694 E.66905
G2 X101.647 Y73.791 I-.922 J.018 E.03448
M73 P64 R2
G1 X95.21 Y73.79 E.16184
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.706 I-.08 J1.304 E.04932
G1 X102.888 Y101.366 E.67028
G3 X101.595 Y102.59 I-1.304 J-.083 E.04926
G1 X92.29 Y102.59 E.23393
G1 X92.285 Y104.59 E.05028
G3 X88.858 Y106.285 I-2.295 J-.328 E.11301
G3 X87.71 Y104.59 I1.293 J-2.112 E.05306
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.146 Y103.939
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.46552
G1 F1748
M204 S6000
G1 X88.13 Y104.491 E.01552
G2 X91.868 Y104.076 I1.87 J-.198 E.16661
G1 X91.858 Y103.944 E.0037
; LINE_WIDTH: 0.480563
G1 X91.837 Y103.931 E.00072
; LINE_WIDTH: 0.444631
G1 X91.817 Y103.917 E.00066
; LINE_WIDTH: 0.407802
G1 X91.584 Y103.77 E.00669
M204 S10000
G1 X90.591 Y102.468 F42000
; LINE_WIDTH: 0.483911
G1 F1748
M204 S6000
G2 X89.407 Y102.47 I-.586 J3.994 E.03482
M204 S10000
G1 X88.413 Y103.766 F42000
; LINE_WIDTH: 0.468065
G1 F1748
M204 S6000
G1 X88.146 Y103.939 E.009
; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10375.147
G1 X88.413 Y103.766 E-.76
; WIPE_END
M73 P65 R2
G1 E-.04 F1800
; layer num/total_layer_count: 18/30
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.16 I.994 J.702 P1  F42000
G1 X89.232 Y102.607 Z3.16
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1748
M204 S6000
G2 X88.305 Y103.536 I.85 J1.776 E.03625
G1 X88.111 Y103.492 E.00539
G1 X88.111 Y102.411 E.02929
G1 X89.189 Y102.411 E.02923
G1 X89.219 Y102.549 E.00382
M204 S250
G1 X89.866 Y102.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
M204 S5000
G1 X89.88 Y102.845 E.00037
G1 X89.984 Y102.841 E.00261
G3 X89.596 Y102.897 I.013 J1.459 E.22065
G1 X89.807 Y102.858 E.00538
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.88 Y102.845 E-.02839
G1 X89.984 Y102.841 E-.03943
G1 X90.243 Y102.86 E-.09853
G1 X90.522 Y102.937 E-.11019
G1 X90.781 Y103.067 E-.10996
G1 X91.009 Y103.245 E-.11003
G1 X91.198 Y103.465 E-.11007
G1 X91.339 Y103.717 E-.10995
G1 X91.374 Y103.826 E-.04345
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y102.411 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1748
M204 S6000
G1 X91.889 Y102.411 E.02916
G1 X91.889 Y103.493 E.02931
G1 X91.697 Y103.538 E.00536
G2 X90.764 Y102.597 I-1.754 J.806 E.03664
G1 X90.798 Y102.469 E.00358
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41527
G1 X91.889 Y103.318 E-.34473
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
M204 S5000
G1 X78.334 Y102.589 E.23572
G3 X77.11 Y101.295 I.07 J-1.293 E.04938
G1 X77.11 Y74.705 E.66851
G3 X78.336 Y73.412 I1.294 J0 E.0494
G1 X84.79 Y73.41 E.16226
G1 X84.79 Y73.79 E.00955
G1 X78.353 Y73.791 E.16184
G2 X77.49 Y74.695 I.065 J.926 E.03447
G1 X77.49 Y101.308 E.66907
G2 X78.395 Y102.21 I.933 J-.031 E.03539
G1 X87.71 Y102.21 E.23419
M73 P66 R2
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.51 Y101.308 I-.015 J-.921 E.03552
G1 X102.51 Y74.693 E.66914
G2 X101.647 Y73.791 I-.936 J.032 E.03434
G1 X95.21 Y73.79 E.16184
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.706 I-.08 J1.304 E.04932
G1 X102.888 Y101.366 E.67028
G3 X101.595 Y102.59 I-1.297 J-.075 E.04933
G1 X92.29 Y102.59 E.23393
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.303 E.16656
M73 P67 R2
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.147 Y103.939
G1 Z2.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.465496
G1 F1748
M204 S6000
G1 X88.129 Y104.125 E.00526
G1 X88.13 Y104.492 E.0103
G2 X91.868 Y104.078 I1.87 J-.199 E.16651
G1 X91.858 Y103.944 E.00376
; LINE_WIDTH: 0.481556
G1 X91.838 Y103.932 E.00068
; LINE_WIDTH: 0.447688
G1 X91.819 Y103.919 E.00062
; LINE_WIDTH: 0.411697
G1 X91.585 Y103.77 E.00683
M204 S10000
G1 X90.591 Y102.468 F42000
; LINE_WIDTH: 0.483911
G1 F1748
M204 S6000
G2 X89.407 Y102.47 I-.588 J4.001 E.03482
M204 S10000
G1 X88.413 Y103.766 F42000
; LINE_WIDTH: 0.466905
G1 F1748
M204 S6000
G1 X88.147 Y103.939 E.00895
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10402.975
G1 X88.413 Y103.766 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/30
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.32 I.994 J.702 P1  F42000
G1 X89.232 Y102.607 Z3.32
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1748
M204 S6000
G2 X88.305 Y103.536 I.852 J1.777 E.03625
G1 X88.111 Y103.492 E.00539
G1 X88.111 Y102.411 E.02929
G1 X89.189 Y102.411 E.02922
G1 X89.219 Y102.549 E.00382
M204 S250
G1 X89.864 Y102.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
M204 S5000
G1 X89.881 Y102.845 E.00043
G1 X89.983 Y102.841 E.00256
G3 X89.597 Y102.896 I.015 J1.459 E.2207
G1 X89.805 Y102.859 E.00531
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.881 Y102.845 E-.02935
G1 X89.983 Y102.841 E-.03864
G1 X90.244 Y102.861 E-.09945
G1 X90.523 Y102.937 E-.11008
G1 X90.782 Y103.067 E-.1101
G1 X91.01 Y103.246 E-.11008
G1 X91.198 Y103.466 E-.10995
G1 X91.339 Y103.719 E-.11006
G1 X91.373 Y103.824 E-.04229
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.814 Y102.411 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1748
M204 S6000
G1 X91.889 Y102.411 E.02915
G1 X91.889 Y103.493 E.02931
G1 X91.697 Y103.538 E.00536
G2 X90.765 Y102.597 I-1.754 J.806 E.03663
G1 X90.798 Y102.469 E.00358
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41522
G1 X91.889 Y103.318 E-.34478
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
M204 S5000
G1 X78.337 Y102.589 E.23566
G3 X77.11 Y101.295 I.08 J-1.305 E.04932
G1 X77.112 Y74.637 E.67022
G3 X78.334 Y73.412 I1.291 J.066 E.04767
G1 X84.79 Y73.41 E.16231
G1 X84.79 Y73.79 E.00955
G1 X78.353 Y73.791 E.16184
M73 P68 R2
G2 X77.49 Y74.694 I.073 J.933 E.03436
G1 X77.49 Y101.308 E.66913
M73 P68 R1
G2 X78.395 Y102.21 I.933 J-.031 E.03538
G1 X87.71 Y102.21 E.23419
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.51 Y101.306 I-.021 J-.926 E.03551
G1 X102.51 Y74.694 E.66907
G2 X101.647 Y73.791 I-.936 J.031 E.03435
G1 X95.21 Y73.79 E.16184
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.706 I-.08 J1.304 E.04932
G1 X102.888 Y101.366 E.67028
G3 X101.595 Y102.59 I-1.289 J-.067 E.04941
G1 X92.29 Y102.59 E.23393
M73 P69 R1
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.303 E.16656
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.147 Y103.939
G1 Z3.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.465494
G1 F1748
M204 S6000
G1 X88.129 Y104.125 E.00526
G1 X88.13 Y104.492 E.01032
G2 X91.869 Y104.08 I1.87 J-.199 E.16646
G1 X91.858 Y103.944 E.00382
; LINE_WIDTH: 0.48266
G1 X91.84 Y103.932 E.00063
; LINE_WIDTH: 0.451058
G1 X91.822 Y103.92 E.00059
; LINE_WIDTH: 0.416005
G1 X91.585 Y103.77 E.00699
M204 S10000
G1 X90.591 Y102.468 F42000
; LINE_WIDTH: 0.48393
G1 F1748
M204 S6000
G2 X89.407 Y102.47 I-.588 J4.004 E.03483
M204 S10000
G1 X88.414 Y103.766 F42000
; LINE_WIDTH: 0.466996
G1 F1748
M204 S6000
G1 X88.147 Y103.939 E.00895
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10400.79
G1 X88.414 Y103.766 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/30
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.48 I.994 J.702 P1  F42000
G1 X89.232 Y102.607 Z3.48
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1748
M204 S6000
G2 X88.305 Y103.536 I.851 J1.777 E.03625
G1 X88.111 Y103.492 E.00539
G1 X88.111 Y102.411 E.02929
G1 X89.189 Y102.411 E.02922
G1 X89.219 Y102.549 E.00382
M204 S250
G1 X89.864 Y102.848 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
M204 S5000
G1 X89.882 Y102.845 E.00046
G1 X89.981 Y102.841 E.0025
G3 X89.598 Y102.896 I.016 J1.459 E.22075
G1 X89.805 Y102.859 E.00529
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.882 Y102.845 E-.0297
G1 X89.981 Y102.841 E-.03783
G1 X90.244 Y102.861 E-.1003
G1 X90.524 Y102.937 E-.11022
G1 X90.783 Y103.068 E-.11003
G1 X91.011 Y103.247 E-.11012
G1 X91.199 Y103.467 E-.11006
G1 X91.34 Y103.72 E-.11014
G1 X91.373 Y103.824 E-.0416
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.814 Y102.411 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1748
M204 S6000
G1 X91.889 Y102.411 E.02915
G1 X91.889 Y103.493 E.02931
G1 X91.697 Y103.538 E.00536
G2 X90.765 Y102.597 I-1.754 J.805 E.03663
G1 X90.798 Y102.469 E.00358
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41521
G1 X91.889 Y103.318 E-.34479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
M204 S5000
G1 X78.334 Y102.589 E.23572
G3 X77.11 Y101.295 I.075 J-1.297 E.04933
G1 X77.11 Y74.706 E.66849
G3 X78.334 Y73.412 I1.303 J.007 E.0493
G1 X84.79 Y73.41 E.16231
M73 P70 R1
G1 X84.79 Y73.79 E.00955
G1 X78.353 Y73.791 E.16184
G2 X77.49 Y74.695 I.074 J.934 E.0344
G1 X77.49 Y101.308 E.66907
G2 X78.395 Y102.21 I.926 J-.024 E.03546
G1 X87.71 Y102.21 E.23419
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.51 Y101.305 I-.007 J-.912 E.03567
G1 X102.51 Y74.695 E.66901
G2 X101.647 Y73.791 I-.928 J.022 E.03447
G1 X95.21 Y73.79 E.16184
M73 P71 R1
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.706 I-.08 J1.304 E.04932
G1 X102.888 Y101.364 E.67022
G3 X101.595 Y102.59 I-1.293 J-.068 E.04944
G1 X92.29 Y102.59 E.23393
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.306 E.16646
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.147 Y103.939
G1 Z3.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.465544
G1 F1748
M204 S6000
G1 X88.129 Y104.125 E.00526
G1 X88.13 Y104.493 E.01035
G2 X91.869 Y104.082 I1.87 J-.199 E.16645
G1 X91.858 Y103.944 E.00388
; LINE_WIDTH: 0.483756
G1 X91.841 Y103.933 E.00059
; LINE_WIDTH: 0.454499
G1 X91.824 Y103.922 E.00055
; LINE_WIDTH: 0.420262
G1 X91.585 Y103.77 E.00714
M204 S10000
G1 X90.591 Y102.468 F42000
; LINE_WIDTH: 0.483927
G1 F1748
M204 S6000
G2 X89.407 Y102.47 I-.588 J4.003 E.03483
M204 S10000
G1 X88.413 Y103.766 F42000
; LINE_WIDTH: 0.466436
G1 F1748
M204 S6000
G1 X88.147 Y103.939 E.00893
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10414.255
G1 X88.413 Y103.766 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/30
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.64 I.994 J.702 P1  F42000
G1 X89.232 Y102.607 Z3.64
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1748
M204 S6000
G2 X88.305 Y103.536 I.852 J1.777 E.03625
G1 X88.111 Y103.492 E.00539
G1 X88.111 Y102.411 E.02929
G1 X89.189 Y102.411 E.02922
G1 X89.219 Y102.549 E.00382
M204 S250
G1 X89.863 Y102.849 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
M204 S5000
G1 X89.882 Y102.845 E.0005
G1 X89.98 Y102.841 E.00245
G3 X89.598 Y102.896 I.018 J1.459 E.2208
G1 X89.804 Y102.859 E.00525
; WIPE_START
G1 F11668.197
M204 S6000
M73 P72 R1
G1 X89.882 Y102.845 E-.03032
G1 X89.98 Y102.841 E-.03705
G1 X90.245 Y102.861 E-.10115
G1 X90.525 Y102.938 E-.11023
G1 X90.784 Y103.068 E-.11009
G1 X91.012 Y103.247 E-.11019
G1 X91.2 Y103.468 E-.11017
G1 X91.34 Y103.721 E-.11002
G1 X91.373 Y103.823 E-.04077
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.814 Y102.411 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1748
M204 S6000
G1 X91.889 Y102.411 E.02915
G1 X91.889 Y103.493 E.02931
G1 X91.697 Y103.538 E.00536
G2 X90.765 Y102.597 I-1.754 J.806 E.03663
G1 X90.798 Y102.469 E.00358
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41514
G1 X91.889 Y103.319 E-.34486
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
M204 S5000
G1 X78.337 Y102.589 E.23565
G3 X77.11 Y101.295 I.067 J-1.293 E.04945
G1 X77.112 Y74.637 E.67022
G3 X78.334 Y73.412 I1.289 J.064 E.04769
G1 X84.79 Y73.41 E.16231
G1 X84.79 Y73.79 E.00955
G1 X78.353 Y73.791 E.16184
G2 X77.49 Y74.695 I.074 J.934 E.0344
G1 X77.49 Y101.305 E.66901
G2 X78.395 Y102.21 I.933 J-.028 E.03545
G1 X87.71 Y102.21 E.23419
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
M73 P73 R1
G2 X102.51 Y101.309 I-.021 J-.926 E.03543
G1 X102.51 Y74.695 E.6691
G2 X101.647 Y73.791 I-.936 J.029 E.0344
G1 X95.21 Y73.79 E.16184
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.888 Y74.637 I-.068 J1.292 E.04771
G1 X102.888 Y101.365 E.67197
G3 X101.595 Y102.59 I-1.304 J-.081 E.04929
G1 X92.29 Y102.59 E.23393
G1 X92.282 Y104.59 E.05028
G3 X87.717 Y104.59 I-2.282 J-.303 E.16657
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.147 Y103.939
G1 Z3.4
M73 P74 R1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.465627
G1 F1748
M204 S6000
G1 X88.129 Y104.125 E.00526
G1 X88.13 Y104.493 E.01036
G2 X91.869 Y104.084 I1.87 J-.2 E.16641
G1 X91.858 Y103.944 E.00394
; LINE_WIDTH: 0.484724
G1 X91.842 Y103.934 E.00055
; LINE_WIDTH: 0.457427
G1 X91.827 Y103.923 E.00051
; LINE_WIDTH: 0.424039
G1 X91.585 Y103.769 E.00728
M204 S10000
G1 X90.591 Y102.469 F42000
; LINE_WIDTH: 0.483944
G1 F1748
M204 S6000
G2 X89.407 Y102.47 I-.589 J3.994 E.03484
M204 S10000
G1 X88.414 Y103.766 F42000
; LINE_WIDTH: 0.46637
G1 F1748
M204 S6000
G1 X88.147 Y103.939 E.00893
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10415.856
G1 X88.414 Y103.766 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/30
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.8 I.997 J.698 P1  F42000
G1 X89.233 Y102.596 Z3.8
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1747
M204 S6000
G2 X88.305 Y103.536 I.831 J1.75 E.03655
G1 X88.111 Y103.492 E.00539
G1 X88.111 Y102.411 E.02929
G1 X89.184 Y102.411 E.02908
G1 X89.218 Y102.538 E.00355
M204 S250
G1 X89.862 Y102.849 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1747
M204 S5000
G1 X89.883 Y102.845 E.00054
G1 X89.979 Y102.841 E.00242
G3 X89.599 Y102.896 I.019 J1.459 E.22084
G1 X89.803 Y102.859 E.00521
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.883 Y102.845 E-.0309
G1 X89.979 Y102.841 E-.03659
G1 X90.266 Y102.865 E-.10949
G1 X90.545 Y102.946 E-.11019
G1 X90.802 Y103.08 E-.11021
G1 X91.027 Y103.262 E-.1101
G1 X91.212 Y103.486 E-.11019
G1 X91.349 Y103.741 E-.11024
G1 X91.373 Y103.822 E-.0321
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.81 Y102.411 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1747
M204 S6000
G1 X91.889 Y102.411 E.02925
G1 X91.889 Y103.492 E.02928
G1 X91.695 Y103.535 E.00541
G2 X90.767 Y102.607 I-1.777 J.848 E.03626
G1 X90.797 Y102.47 E.00381
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41564
G1 X91.889 Y103.317 E-.34436
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1747
M204 S5000
G1 X78.337 Y102.589 E.23566
G3 X77.11 Y101.295 I.068 J-1.293 E.04944
G1 X77.11 Y74.706 E.66849
G3 X78.334 Y73.412 I1.292 J-.003 E.0494
G1 X84.79 Y73.41 E.16231
G1 X84.79 Y73.79 E.00955
G1 X78.353 Y73.791 E.16184
G2 X77.49 Y74.695 I.06 J.92 E.03451
G1 X77.49 Y101.306 E.66903
G2 X78.395 Y102.21 I.926 J-.022 E.03551
G1 X87.71 Y102.21 E.23419
M73 P75 R1
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.51 Y101.309 I-.021 J-.926 E.03542
G1 X102.51 Y74.694 E.66915
G2 X101.647 Y73.791 I-.936 J.031 E.03436
G1 X95.21 Y73.79 E.16184
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.706 I-.08 J1.304 E.04932
G1 X102.888 Y101.366 E.67028
G3 X101.595 Y102.59 I-1.304 J-.083 E.04926
G1 X92.29 Y102.59 E.23393
M73 P76 R1
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.306 E.16646
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.148 Y103.938
G1 Z3.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.4659
G1 F1747
M204 S6000
G1 X88.413 Y103.766 E.00891
M204 S10000
G1 X88.148 Y103.938 F42000
; LINE_WIDTH: 0.466249
G1 F1747
M204 S6000
G1 X88.129 Y104.125 E.00527
G1 X88.13 Y104.494 E.01039
G2 X91.87 Y104.111 I1.869 J-.199 E.16586
G1 X91.858 Y103.942 E.00477
G1 X91.585 Y103.766 E.00915
M204 S10000
G1 X90.592 Y102.47 F42000
; LINE_WIDTH: 0.484439
G1 F1747
M204 S6000
G2 X89.407 Y102.47 I-.593 J3.943 E.0349
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F9997.715
G1 X89.985 Y102.425 E-.37092
G1 X90.592 Y102.47 E-.38908
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/30
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.96 I-.112 J-1.212 P1  F42000
G1 X89.234 Y102.596 Z3.96
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G2 X88.305 Y103.536 I.831 J1.75 E.03655
G1 X88.111 Y103.492 E.00539
G1 X88.111 Y102.411 E.02929
G1 X89.184 Y102.411 E.02908
G1 X89.218 Y102.538 E.00355
M204 S250
G1 X89.861 Y102.849 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G1 X89.884 Y102.845 E.00058
G1 X89.977 Y102.841 E.00235
G3 X89.6 Y102.896 I.021 J1.459 E.22091
G1 X89.802 Y102.86 E.00516
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.884 Y102.845 E-.03153
G1 X89.977 Y102.841 E-.0355
G1 X90.247 Y102.861 E-.10298
G1 X90.526 Y102.938 E-.1101
G1 X90.786 Y103.069 E-.11037
G1 X91.013 Y103.249 E-.11019
G1 X91.201 Y103.47 E-.11026
G1 X91.341 Y103.724 E-.11007
G1 X91.372 Y103.821 E-.039
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.814 Y102.411 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G1 X91.889 Y102.411 E.02914
G1 X91.889 Y103.493 E.02931
G1 X91.696 Y103.537 E.00537
G2 X90.765 Y102.597 I-1.755 J.806 E.03661
G1 X90.799 Y102.469 E.00357
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41501
G1 X91.889 Y103.319 E-.34499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G1 X78.337 Y102.589 E.23565
G3 X77.11 Y101.295 I.064 J-1.289 E.04948
G1 X77.112 Y74.637 E.67022
G3 X78.336 Y73.412 I1.292 J.068 E.0477
G1 X84.79 Y73.41 E.16225
M73 P77 R1
G1 X84.79 Y73.79 E.00955
G1 X78.353 Y73.791 E.16184
G2 X77.49 Y74.695 I.073 J.934 E.0344
G1 X77.49 Y101.308 E.66907
G2 X78.395 Y102.21 I.926 J-.024 E.03546
G1 X87.71 Y102.21 E.23419
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.51 Y101.309 I-.015 J-.92 E.03549
G1 X102.51 Y74.695 E.6691
G2 X101.647 Y73.791 I-.928 J.022 E.03447
G1 X95.21 Y73.79 E.16184
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
M73 P78 R1
G3 X102.89 Y74.706 I-.08 J1.304 E.04932
G1 X102.888 Y101.363 E.67019
G3 X101.595 Y102.59 I-1.289 J-.063 E.0495
G1 X92.29 Y102.59 E.23393
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.303 E.16656
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.148 Y103.938
G1 Z3.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.465629
G1 F1749
M204 S6000
G1 X88.129 Y104.125 E.00527
G1 X88.13 Y104.494 E.01039
G2 X91.869 Y104.088 I1.87 J-.201 E.16627
G1 X91.858 Y103.944 E.00405
G1 X91.832 Y103.926 E.00089
; LINE_WIDTH: 0.432018
G1 X91.585 Y103.769 E.00758
M204 S10000
G1 X90.592 Y102.469 F42000
; LINE_WIDTH: 0.483911
G1 F1749
M204 S6000
G2 X89.407 Y102.47 I-.589 J3.992 E.03483
M204 S10000
G1 X88.413 Y103.766 F42000
; LINE_WIDTH: 0.465669
G1 F1749
M204 S6000
G1 X88.148 Y103.938 E.0089
; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10432.77
G1 X88.413 Y103.766 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/30
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.12 I.997 J.698 P1  F42000
G1 X89.234 Y102.596 Z4.12
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1748
M204 S6000
G2 X88.305 Y103.536 I.831 J1.749 E.03656
G1 X88.111 Y103.492 E.00539
G1 X88.111 Y102.411 E.02929
G1 X89.184 Y102.411 E.02909
G1 X89.218 Y102.538 E.00355
M204 S250
G1 X89.859 Y102.849 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
M204 S5000
G1 X89.884 Y102.845 E.00065
G1 X89.975 Y102.841 E.00229
G3 X89.6 Y102.896 I.022 J1.459 E.22096
G1 X89.8 Y102.86 E.00509
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.884 Y102.845 E-.03267
G1 X89.975 Y102.841 E-.03469
G1 X90.248 Y102.861 E-.10375
G1 X90.527 Y102.939 E-.11028
G1 X90.786 Y103.07 E-.11021
G1 X91.014 Y103.25 E-.11037
G1 X91.202 Y103.471 E-.11019
G1 X91.342 Y103.725 E-.11028
G1 X91.372 Y103.819 E-.03757
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.814 Y102.411 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1748
M204 S6000
G1 X91.889 Y102.411 E.02913
G1 X91.889 Y103.493 E.0293
G1 X91.696 Y103.537 E.00537
G2 X90.765 Y102.596 I-1.755 J.806 E.03661
G1 X90.799 Y102.469 E.00357
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41497
G1 X91.889 Y103.319 E-.34503
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
M204 S5000
G1 X78.337 Y102.589 E.23565
G3 X77.11 Y101.295 I.067 J-1.293 E.04945
G1 X77.11 Y74.706 E.66849
M73 P79 R1
G3 X78.334 Y73.412 I1.307 J.011 E.04927
G1 X84.79 Y73.41 E.1623
G1 X84.79 Y73.79 E.00955
G1 X78.355 Y73.791 E.16178
G2 X77.49 Y74.695 I.071 J.934 E.03446
G1 X77.49 Y101.305 E.66901
G2 X78.395 Y102.21 I.926 J-.021 E.03552
G1 X87.71 Y102.21 E.23419
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.51 Y101.308 I-.021 J-.926 E.03546
G1 X102.51 Y74.695 E.6691
G2 X101.647 Y73.791 I-.928 J.023 E.03445
G1 X95.21 Y73.79 E.16184
M73 P80 R1
G1 X95.21 Y73.41 E.00955
G1 X101.666 Y73.412 E.1623
G3 X102.89 Y74.706 I-.083 J1.304 E.04927
G1 X102.888 Y101.364 E.67022
G3 X101.595 Y102.59 I-1.297 J-.072 E.04939
G1 X92.29 Y102.59 E.23394
G1 X92.282 Y104.59 E.05028
G3 X87.716 Y104.59 I-2.283 J-.307 E.16645
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.148 Y103.938
G1 Z3.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.465612
G1 F1748
M204 S6000
G1 X88.129 Y104.125 E.00527
G1 X88.13 Y104.495 E.01041
G2 X91.87 Y104.106 I1.869 J-.202 E.16566
G1 X91.858 Y103.944 E.00458
G1 X91.836 Y103.929 E.00072
; LINE_WIDTH: 0.438834
G1 X91.586 Y103.768 E.00785
M204 S10000
G1 X90.592 Y102.469 F42000
; LINE_WIDTH: 0.483906
G1 F1748
M204 S6000
G2 X89.407 Y102.469 I-.59 J3.995 E.03483
M204 S10000
G1 X88.413 Y103.766 F42000
; LINE_WIDTH: 0.465041
G1 F1748
M204 S6000
G1 X88.148 Y103.938 E.00887
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10447.996
G1 X88.413 Y103.766 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/30
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.28 I.993 J.703 P1  F42000
G1 X89.238 Y102.602 Z4.28
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1755
M204 S6000
G2 X88.299 Y103.538 I.802 J1.744 E.03669
M73 P81 R1
G1 X88.111 Y103.49 E.00525
G1 X88.111 Y102.411 E.02923
G1 X89.192 Y102.411 E.02929
G1 X89.224 Y102.543 E.00369
M204 S250
G1 X89.855 Y102.849 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1755
M204 S5000
G1 X89.971 Y102.841 E.00294
G3 X89.795 Y102.855 I.028 J1.459 E.22607
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.971 Y102.841 E-.06726
G1 X90.249 Y102.862 E-.10574
G1 X90.528 Y102.939 E-.11028
G1 X90.787 Y103.071 E-.11027
G1 X91.015 Y103.251 E-.11034
G1 X91.202 Y103.472 E-.11024
G1 X91.343 Y103.726 E-.1104
G1 X91.37 Y103.816 E-.03548
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.814 Y102.411 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1755
M204 S6000
G1 X91.889 Y102.411 E.02913
G1 X91.889 Y103.492 E.0293
G1 X91.696 Y103.537 E.00537
G2 X90.765 Y102.596 I-1.756 J.806 E.0366
G1 X90.799 Y102.469 E.00357
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41492
G1 X91.889 Y103.319 E-.34508
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1755
M204 S5000
G1 X78.337 Y102.589 E.23565
G3 X77.11 Y101.295 I.067 J-1.293 E.04945
G1 X77.11 Y74.706 E.66849
G3 X78.334 Y73.412 I1.299 J.004 E.04934
G1 X84.79 Y73.41 E.1623
G1 X84.79 Y73.79 E.00955
G1 X78.353 Y73.791 E.16184
G2 X77.49 Y74.695 I.06 J.92 E.03451
G1 X77.49 Y101.308 E.66909
G2 X78.395 Y102.21 I.926 J-.024 E.03545
G1 X87.71 Y102.21 E.23419
G1 X87.71 Y102.01 E.00503
M73 P82 R1
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.51 Y101.306 I-.021 J-.926 E.03551
G1 X102.51 Y74.695 E.66903
G2 X101.647 Y73.791 I-.936 J.03 E.03439
G1 X95.21 Y73.79 E.16184
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.706 I-.072 J1.297 E.0494
G1 X102.888 Y101.364 E.67022
G3 X101.595 Y102.59 I-1.293 J-.068 E.04943
G1 X92.29 Y102.59 E.23394
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.304 E.16654
G1 X87.71 Y102.65 E.04877
; WIPE_START
M73 P83 R1
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.318 Y102.793
G1 Z4.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.18429
G1 F1755
M204 S6000
G1 X88.74 Y102.633 E.00441
M204 S10000
G1 X88.496 Y102.619 F42000
; LINE_WIDTH: 0.234005
G1 F1755
M204 S6000
G1 X88.318 Y103.07 E.00631
M204 S10000
G1 X88.412 Y103.773 F42000
; LINE_WIDTH: 0.460934
G1 F1755
M204 S6000
G1 X88.15 Y103.938 E.00861
; LINE_WIDTH: 0.465962
G1 X88.13 Y104.104 E.00469
G2 X91.87 Y104.108 I1.87 J.191 E.17684
G1 X91.858 Y103.943 E.00464
G1 X91.588 Y103.768 E.00907
M204 S10000
G1 X90.592 Y102.469 F42000
; LINE_WIDTH: 0.482503
G1 F1755
M204 S6000
G2 X89.411 Y102.464 I-.609 J4.299 E.03461
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10040.898
G1 X89.972 Y102.425 E-.36124
G1 X90.592 Y102.469 E-.39876
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/30
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.44 I-.119 J-1.211 P1  F42000
G1 X89.238 Y102.602 Z4.44
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2773
M204 S6000
G2 X88.299 Y103.538 I.802 J1.745 E.03669
G1 X88.111 Y103.49 E.00525
G1 X88.111 Y102.411 E.02923
G1 X89.192 Y102.411 E.0293
G1 X89.224 Y102.543 E.00369
M204 S250
G1 X89.854 Y102.849 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2773
M204 S5000
G1 X89.97 Y102.841 E.00293
G3 X89.794 Y102.855 I.029 J1.459 E.22609
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.97 Y102.841 E-.06708
G1 X90.249 Y102.862 E-.1065
G1 X90.53 Y102.94 E-.1105
G1 X90.788 Y103.071 E-.11022
G1 X91.016 Y103.251 E-.11038
G1 X91.203 Y103.473 E-.11027
G1 X91.343 Y103.728 E-.11053
G1 X91.37 Y103.815 E-.03451
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.815 Y102.411 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2773
M204 S6000
G1 X91.889 Y102.411 E.02912
G1 X91.889 Y103.492 E.0293
G1 X91.696 Y103.537 E.00538
G2 X90.765 Y102.596 I-1.756 J.806 E.03659
G1 X90.799 Y102.469 E.00357
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41486
G1 X91.889 Y103.319 E-.34514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.802 Y100.084 Z4.6 F42000
G1 X102.483 Y98.361 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F1950.95
M204 S6000
G1 X102.488 Y98.64 E.00755
G1 F617.917
G1 X102.483 Y98.64 E.00014
M106 S255
G1 F600
G1 X102.1 Y98.64 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X101.911 Y98.64 E.00513
G1 X101.911 Y98.361 E.00755
G1 X102.1 Y98.361 E.00513
M106 S201.45
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X102.423 Y98.361 E.00874
M106 S201.45
; WIPE_START
G1 X102.488 Y98.64 E-.13153
G1 X102.483 Y98.64 E-.00241
G1 X102.1 Y98.64 E-.17578
G1 X101.911 Y98.64 E-.08701
G1 X101.911 Y98.361 E-.12807
G1 X102.1 Y98.361 E-.08701
G1 X102.423 Y98.361 E-.1482
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.447 Y90.729 Z4.6 F42000
G1 X102.483 Y79.361 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F1958.706
M204 S6000
G1 X102.489 Y79.64 E.00755
G1 F622.195
G1 X102.483 Y79.64 E.00018
M106 S255
G1 F600
G1 X102.1 Y79.64 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X101.911 Y79.64 E.00513
G1 X101.911 Y79.361 E.00755
G1 X102.1 Y79.361 E.00513
M106 S201.45
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X102.423 Y79.361 E.00874
M106 S201.45
; WIPE_START
G1 X102.489 Y79.64 E-.13154
G1 X102.483 Y79.64 E-.00298
G1 X102.1 Y79.64 E-.17561
G1 X101.911 Y79.64 E-.08693
G1 X101.911 Y79.361 E-.12795
G1 X102.1 Y79.361 E-.08693
G1 X102.423 Y79.361 E-.14807
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I.307 J-1.178 P1  F42000
G1 X81.139 Y73.818 Z4.6
G1 Z4.2
G1 E.8 F1800
M106 S255
G1 F600
M204 S6000
G1 X81.139 Y74.201 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X81.139 Y74.59 E.01054
M106 S201.45
M106 S255
G1 F600
G1 X80.861 Y74.59 E.00755
G1 X80.861 Y74.201 E.01054
M106 S201.45
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X80.861 Y73.818 E.01036
M106 S201.45
G1 F1571.875
G1 X81.079 Y73.818 E.00593
; WIPE_START
G1 X81.139 Y74.201 E-.14712
G1 X81.139 Y74.59 E-.14776
G1 X80.861 Y74.59 E-.1059
G1 X80.861 Y74.201 E-.14774
G1 X80.861 Y73.818 E-.14535
G1 X81.035 Y73.818 E-.06612
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I-1.202 J-.193 P1  F42000
G1 X77.9 Y93.361 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X78.089 Y93.361 E.00513
G1 X78.089 Y93.64 E.00755
M106 S201.45
M106 S255
G1 F3000
G1 X77.9 Y93.64 E.00513
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X77.518 Y93.64 E.01036
M106 S201.45
G1 F1166.154
G1 X77.518 Y93.361 E.00755
M106 S255
G1 F600
G1 X77.84 Y93.361 E.00874
M106 S201.45
; WIPE_START
G1 X78.089 Y93.361 E-.1114
G1 X78.089 Y93.64 E-.12451
G1 X77.9 Y93.64 E-.08459
G1 X77.518 Y93.64 E-.1709
G1 X77.518 Y93.361 E-.12451
G1 X77.84 Y93.361 E-.14409
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I-.831 J.889 P1  F42000
G1 X87.71 Y102.59 Z4.6
G1 Z4.2
M73 P84 R1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2773
M204 S5000
G1 X78.338 Y102.589 E.23564
G3 X77.11 Y101.297 I.064 J-1.29 E.04943
G1 X77.11 Y74.705 E.66856
G3 X78.334 Y73.412 I1.295 J-.001 E.04938
M73 P84 R0
G1 X84.79 Y73.41 E.1623
G1 X84.79 Y73.79 E.00955
G1 X82.74 Y73.79 E.05154
G1 X82.34 Y73.79 E.01006
G1 X81.94 Y73.79 E.01006
G1 X81.54 Y73.79 E.01006
G1 F748.895
G1 X81.54 Y73.832 E.00104
M106 S255
G1 F600
G1 X81.54 Y74.201 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X81.54 Y74.99 E.02139
G1 X80.46 Y74.99 E.02927
G1 X80.46 Y74.201 E.02139
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X80.46 Y73.832 E.00928
M106 S201.45
G1 F749.426
G1 X80.46 Y73.79 E.00105
G1 F2773
G1 X80.06 Y73.79 E.01006
G1 X79.66 Y73.79 E.01006
G1 X79.26 Y73.79 E.01006
G1 X78.395 Y73.79 E.02175
G2 X77.49 Y74.695 I.028 J.933 E.03544
G1 X77.49 Y91.76 E.42905
G1 X77.49 Y92.16 E.01006
G1 X77.49 Y92.56 E.01006
G1 X77.49 Y92.96 E.01006
G1 F747.227
G1 X77.531 Y92.96 E.00103
M106 S255
G1 F600
G1 X77.9 Y92.96 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X78.49 Y92.96 E.01599
G1 X78.49 Y94.04 E.02927
G1 X77.9 Y94.04 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X77.531 Y94.04 E.00928
M106 S201.45
G1 F747.227
G1 X77.49 Y94.04 E.00103
G1 F2773
G1 X77.49 Y94.44 E.01006
G1 X77.49 Y94.84 E.01006
G1 X77.49 Y95.24 E.01006
G1 X77.49 Y101.305 E.15248
G2 X78.395 Y102.21 I.926 J-.021 E.03552
G1 X87.71 Y102.21 E.23419
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.509 Y101.348 I-.007 J-.913 E.03459
G1 X102.51 Y100.24 E.02786
G1 X102.51 Y99.84 E.01006
G1 X102.51 Y99.44 E.01006
G1 X102.51 Y99.04 E.01006
G1 F747.53
G1 X102.469 Y99.04 E.00103
M106 S255
G1 F600
G1 X102.1 Y99.04 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X101.51 Y99.04 E.01599
G1 X101.51 Y97.96 E.02927
G1 X102.1 Y97.96 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X102.469 Y97.96 E.00928
M106 S201.45
G1 F747.227
G1 X102.51 Y97.96 E.00103
G1 F2773
G1 X102.51 Y97.56 E.01006
G1 X102.51 Y97.16 E.01006
G1 X102.51 Y96.76 E.01006
G1 X102.51 Y81.24 E.39019
G1 X102.51 Y80.84 E.01006
G1 X102.51 Y80.44 E.01006
M73 P85 R0
G1 X102.51 Y80.04 E.01006
G1 F747.227
G1 X102.469 Y80.04 E.00103
M106 S255
G1 F600
G1 X102.1 Y80.04 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X101.51 Y80.04 E.01599
G1 X101.51 Y78.96 E.02927
G1 X102.1 Y78.96 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X102.469 Y78.96 E.00928
M106 S201.45
G1 F747.227
G1 X102.51 Y78.96 E.00103
G1 F2773
G1 X102.51 Y78.56 E.01006
G1 X102.51 Y78.16 E.01006
G1 X102.51 Y77.76 E.01006
G1 X102.51 Y74.693 E.07712
G2 X101.647 Y73.791 I-.936 J.032 E.03434
G1 X95.21 Y73.79 E.16184
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.706 I-.08 J1.304 E.04933
G1 X102.888 Y101.364 E.67022
G3 X101.595 Y102.59 I-1.293 J-.068 E.04944
G1 X92.29 Y102.59 E.23393
G1 X92.282 Y104.59 E.05028
G3 X87.717 Y104.59 I-2.283 J-.304 E.16658
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.318 Y102.793
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.183996
G1 F2773
M204 S6000
G1 X88.74 Y102.633 E.0044
M204 S10000
G1 X88.496 Y102.619 F42000
; LINE_WIDTH: 0.232676
G1 F2773
M204 S6000
G1 X88.318 Y103.069 E.00626
M204 S10000
G1 X88.412 Y103.773 F42000
; LINE_WIDTH: 0.460922
G1 F2773
M204 S6000
G1 X88.15 Y103.938 E.00861
; LINE_WIDTH: 0.46582
G1 X88.13 Y104.103 E.00468
G2 X91.87 Y104.107 I1.87 J.192 E.17685
G1 X91.858 Y103.943 E.00462
G1 X91.587 Y103.768 E.00908
M204 S10000
G1 X90.592 Y102.469 F42000
; LINE_WIDTH: 0.482505
G1 F2773
M204 S6000
G2 X89.411 Y102.464 I-.609 J4.305 E.03461
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10040.851
G1 X89.971 Y102.425 E-.36027
G1 X90.592 Y102.469 E-.39973
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/30
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.6 I-.119 J-1.211 P1  F42000
G1 X89.238 Y102.602 Z4.6
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1978
M204 S6000
G2 X88.299 Y103.538 I.802 J1.745 E.03669
G1 X88.111 Y103.49 E.00525
G1 X88.111 Y102.411 E.02923
G1 X89.192 Y102.411 E.0293
G1 X89.224 Y102.543 E.00369
M204 S250
G1 X89.853 Y102.849 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1978
M204 S5000
G1 X89.969 Y102.841 E.00292
G3 X89.793 Y102.855 I.031 J1.459 E.2261
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.969 Y102.841 E-.0669
G1 X90.25 Y102.862 E-.10741
G1 X90.53 Y102.94 E-.11043
G1 X90.789 Y103.072 E-.1103
G1 X91.017 Y103.252 E-.11043
G1 X91.204 Y103.474 E-.11026
G1 X91.344 Y103.729 E-.11045
G1 X91.37 Y103.814 E-.03381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.815 Y102.411 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1978
M204 S6000
G1 X91.889 Y102.411 E.02912
G1 X91.889 Y103.492 E.0293
G1 X91.696 Y103.537 E.00538
G2 X90.765 Y102.596 I-1.756 J.807 E.03659
G1 X90.799 Y102.469 E.00357
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41479
G1 X91.889 Y103.319 E-.34521
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1978
M204 S5000
G1 X78.337 Y102.589 E.23565
G3 X77.11 Y101.295 I.08 J-1.304 E.04933
G1 X77.112 Y74.637 E.67022
M73 P86 R0
G3 X78.334 Y73.412 I1.293 J.068 E.04765
G1 X84.79 Y73.41 E.1623
G1 X84.79 Y73.79 E.00955
G1 X81.54 Y73.79 E.08171
G1 X81.54 Y74.99 E.03017
G1 X80.46 Y74.99 E.02715
G1 X80.46 Y73.79 E.03017
G1 X78.395 Y73.79 E.05192
G2 X77.49 Y74.692 I.029 J.934 E.03538
G1 X77.49 Y92.96 E.45928
G1 X78.49 Y92.96 E.02514
G1 X78.49 Y94.04 E.02715
G1 X77.49 Y94.04 E.02514
G1 X77.49 Y101.308 E.18273
G2 X78.393 Y102.21 I.926 J-.024 E.03539
G1 X87.71 Y102.21 E.23425
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.509 Y101.348 I-.007 J-.913 E.03459
G1 X102.51 Y99.04 E.05803
G1 X101.51 Y99.04 E.02514
G1 X101.51 Y97.96 E.02715
G1 X102.51 Y97.96 E.02514
G1 X102.51 Y80.04 E.45053
G1 X101.51 Y80.04 E.02514
G1 X101.51 Y78.96 E.02715
M73 P87 R0
G1 X102.51 Y78.96 E.02514
G1 X102.51 Y74.692 E.1073
G2 X101.647 Y73.791 I-.928 J.025 E.03439
G1 X95.21 Y73.79 E.16184
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.706 I-.08 J1.304 E.04933
G1 X102.888 Y101.364 E.67022
G3 X101.663 Y102.589 I-1.289 J-.064 E.04775
G1 X92.29 Y102.59 E.23566
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.304 E.16655
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.318 Y102.793
G1 Z4.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.183905
G1 F1978
M204 S6000
G1 X88.74 Y102.633 E.0044
M204 S10000
G1 X88.496 Y102.619 F42000
; LINE_WIDTH: 0.230344
G1 F1978
M204 S6000
G1 X88.318 Y103.07 E.00619
M204 S10000
G1 X88.412 Y103.773 F42000
; LINE_WIDTH: 0.461035
G1 F1978
M204 S6000
G1 X88.15 Y103.938 E.00861
; LINE_WIDTH: 0.465825
G1 X88.129 Y104.126 E.00531
G1 X88.13 Y104.497 E.01043
G2 X91.87 Y104.106 I1.869 J-.202 E.16575
G1 X91.858 Y103.943 E.0046
G1 X91.587 Y103.768 E.00907
M204 S10000
G1 X90.592 Y102.469 F42000
; LINE_WIDTH: 0.482516
G1 F1978
M204 S6000
G2 X89.411 Y102.464 I-.61 J4.308 E.03462
; WIPE_START
G1 F10040.612
G1 X89.969 Y102.425 E-.3593
G1 X90.592 Y102.469 E-.4007
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.755 Y99.832 Z4.76 F42000
G1 X102.263 Y98.172 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1978
M204 S2000
G1 X102.676 Y98.586 E.0147
G1 X102.373 Y98.828
G1 X101.722 Y98.177 E.02316
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.373 Y98.828 E-.36966
G1 X102.676 Y98.586 E-.15574
G1 X102.263 Y98.172 E-.2346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.76 I1.217 J-.029 P1  F42000
G1 X101.807 Y79.172 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F1978
M204 S2000
G1 X102.463 Y79.828 E.02332
M204 S10000
G1 X102.64 Y79.153 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.152008
G1 F1978
M204 S6000
G1 X102.64 Y79.732 E.00444
G1 X102.592 Y79.848 E.00096
; WIPE_START
G1 F18000
G1 X102.64 Y79.732 E-.13458
G1 X102.64 Y79.153 E-.62542
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.76 I.285 J-1.183 P1  F42000
G1 X80.672 Y73.855 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
M73 P88 R0
G1 F1978
M204 S2000
G1 X81.328 Y74.51 E.02332
G1 X81.05 Y74.778
G1 X80.672 Y74.4 E.01345
M204 S10000
G1 X81.347 Y73.671 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.169755
G1 F1978
M204 S6000
G1 X80.761 Y73.671 E.00517
G1 X80.653 Y73.716 E.00104
; WIPE_START
G1 F18000
G1 X80.761 Y73.671 E-.12697
G1 X81.347 Y73.671 E-.63303
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.76 I-1.203 J-.183 P1  F42000
G1 X78.278 Y93.822 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1978
M204 S2000
G1 X77.628 Y93.172 E.02309
G1 X77.323 Y93.412
G1 X77.739 Y93.828 E.0148
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.323 Y93.412 E-.23595
G1 X77.628 Y93.172 E-.15575
G1 X78.278 Y93.822 E-.3683
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/30
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.76 I-.761 J.95 P1  F42000
G1 X89.238 Y102.602 Z4.76
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1761
M204 S6000
G2 X88.299 Y103.538 I.803 J1.745 E.03669
G1 X88.111 Y103.49 E.00525
G1 X88.111 Y102.411 E.02923
G1 X89.192 Y102.411 E.0293
G1 X89.224 Y102.543 E.00369
M204 S250
G1 X89.852 Y102.849 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1761
M204 S5000
G1 X89.967 Y102.841 E.0029
G3 X89.792 Y102.855 I.032 J1.459 E.22612
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.967 Y102.841 E-.06665
G1 X90.251 Y102.862 E-.10832
G1 X90.531 Y102.94 E-.11055
G1 X90.79 Y103.072 E-.11022
G1 X91.018 Y103.253 E-.11053
G1 X91.208 Y103.48 E-.11259
G1 X91.347 Y103.736 E-.11057
G1 X91.37 Y103.813 E-.03059
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.815 Y102.411 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1761
M204 S6000
G1 X91.889 Y102.411 E.02911
G1 X91.889 Y103.492 E.02929
G1 X91.695 Y103.536 E.00539
G2 X90.766 Y102.596 I-1.755 J.806 E.03656
G1 X90.8 Y102.469 E.00356
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41473
G1 X91.889 Y103.32 E-.34527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1761
M204 S5000
G1 X78.337 Y102.589 E.23564
G3 X77.11 Y101.295 I.072 J-1.298 E.0494
G1 X77.11 Y74.705 E.6685
G3 X78.334 Y73.412 I1.299 J.004 E.04933
G1 X84.79 Y73.41 E.1623
G1 X84.79 Y73.79 E.00955
G1 X78.355 Y73.791 E.16178
G2 X77.49 Y74.692 I.07 J.934 E.03439
G1 X77.49 Y101.308 E.66916
G2 X78.395 Y102.21 I.926 J-.024 E.03545
G1 X87.71 Y102.21 E.23419
M73 P89 R0
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.51 Y101.306 I-.015 J-.92 E.03557
G1 X102.51 Y74.695 E.66903
G2 X101.647 Y73.791 I-.936 J.03 E.03439
G1 X95.21 Y73.79 E.16184
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.706 I-.072 J1.297 E.0494
G1 X102.888 Y101.364 E.67022
G3 X101.595 Y102.59 I-1.293 J-.068 E.04944
G1 X92.29 Y102.59 E.23393
M73 P90 R0
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.303 E.16656
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.318 Y102.793
G1 Z4.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.183634
G1 F1761
M204 S6000
G1 X88.74 Y102.633 E.00439
M204 S10000
G1 X88.496 Y102.619 F42000
; LINE_WIDTH: 0.228772
G1 F1761
M204 S6000
G1 X88.318 Y103.069 E.00614
M204 S10000
G1 X88.412 Y103.773 F42000
; LINE_WIDTH: 0.459926
G1 F1761
M204 S6000
G1 X88.151 Y103.938 E.00857
; LINE_WIDTH: 0.465893
G1 X88.129 Y104.125 E.00531
G1 X88.13 Y104.497 E.01045
G2 X91.87 Y104.105 I1.869 J-.203 E.1658
G1 X91.858 Y103.942 E.00459
G1 X91.587 Y103.766 E.00909
M204 S10000
G1 X90.592 Y102.469 F42000
; LINE_WIDTH: 0.48252
G1 F1761
M204 S6000
G2 X89.411 Y102.464 I-.61 J4.311 E.03462
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10040.516
G1 X89.968 Y102.425 E-.35824
G1 X90.592 Y102.469 E-.40176
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/30
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.92 I-.113 J-1.212 P1  F42000
G1 X89.234 Y102.596 Z4.92
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G2 X88.305 Y103.536 I.828 J1.748 E.03657
G1 X88.111 Y103.492 E.00539
G1 X88.111 Y102.411 E.02929
G1 X89.184 Y102.411 E.0291
G1 X89.218 Y102.538 E.00356
M204 S250
G1 X89.854 Y102.85 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G1 X89.888 Y102.845 E.00085
G1 X89.968 Y102.841 E.00203
G3 X89.604 Y102.895 I.031 J1.459 E.22123
G1 X89.795 Y102.861 E.00489
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.888 Y102.845 E-.03564
G1 X89.968 Y102.841 E-.03074
G1 X90.252 Y102.862 E-.10815
G1 X90.532 Y102.94 E-.1104
G1 X90.791 Y103.073 E-.11059
G1 X91.021 Y103.256 E-.11174
G1 X91.207 Y103.479 E-.11045
G1 X91.346 Y103.735 E-.11055
G1 X91.371 Y103.815 E-.03175
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.815 Y102.411 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G1 X91.889 Y102.411 E.02911
G1 X91.889 Y103.492 E.02929
G1 X91.695 Y103.536 E.00539
G2 X90.766 Y102.596 I-1.755 J.806 E.03657
G1 X90.8 Y102.469 E.00356
; WIPE_START
G1 F10826.06
G1 X91.889 Y102.411 E-.41468
G1 X91.889 Y103.32 E-.34532
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G1 X78.334 Y102.589 E.23572
G3 X77.11 Y101.295 I.083 J-1.305 E.04926
G1 X77.112 Y74.637 E.67022
G3 X78.334 Y73.412 I1.289 J.064 E.04768
G1 X84.79 Y73.41 E.1623
M73 P91 R0
G1 X84.79 Y73.79 E.00955
G1 X78.353 Y73.791 E.16184
G2 X77.49 Y74.695 I.065 J.926 E.03446
G1 X77.49 Y101.306 E.66902
M73 P92 R0
G2 X78.395 Y102.21 I.926 J-.022 E.03552
G1 X87.71 Y102.21 E.23419
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.51 Y101.308 I-.021 J-.926 E.03545
G1 X102.51 Y74.695 E.66908
G2 X101.647 Y73.791 I-.936 J.029 E.0344
G1 X95.21 Y73.79 E.16184
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.701 I-.08 J1.304 E.04922
G1 X102.888 Y101.364 E.67033
G3 X101.595 Y102.59 I-1.293 J-.068 E.04944
G1 X92.29 Y102.59 E.23393
M73 P93 R0
G1 X92.282 Y104.59 E.05028
G3 X87.717 Y104.59 I-2.283 J-.303 E.16657
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.149 Y103.938
G1 Z4.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.465794
G1 F1749
M204 S6000
G1 X88.129 Y104.124 E.00528
G1 X88.13 Y104.498 E.01051
G2 X91.87 Y104.104 I1.869 J-.205 E.16572
G1 X91.853 Y103.939 E.00466
; LINE_WIDTH: 0.466841
G1 X91.587 Y103.766 E.00895
M204 S10000
G1 X90.592 Y102.469 F42000
; LINE_WIDTH: 0.483922
G1 F1749
M204 S6000
G2 X89.408 Y102.469 I-.592 J3.991 E.03485
M204 S10000
G1 X88.413 Y103.767 F42000
; LINE_WIDTH: 0.46335
G1 F1749
M204 S6000
G1 X88.149 Y103.938 E.0088
; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10489.178
G1 X88.413 Y103.767 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/30
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.08 I.655 J1.026 P1  F42000
G1 X89.85 Y102.849 Z5.08
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1775
M204 S5000
G1 X89.964 Y102.841 E.00286
G3 X89.791 Y102.855 I.036 J1.459 E.22616
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.964 Y102.841 E-.06595
G1 X90.253 Y102.862 E-.11044
G1 X90.534 Y102.941 E-.11064
G1 X90.792 Y103.074 E-.11041
G1 X91.02 Y103.255 E-.11051
G1 X91.207 Y103.478 E-.11056
G1 X91.346 Y103.733 E-.11049
G1 X91.37 Y103.811 E-.031
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.71 Y102.59 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
G1 F1775
M204 S5000
G1 X78.337 Y102.589 E.23565
G3 X77.11 Y101.298 I.067 J-1.293 E.04938
G1 X77.112 Y74.637 E.67028
G3 X78.334 Y73.412 I1.306 J.081 E.04754
G1 X84.79 Y73.41 E.1623
M73 P94 R0
G1 X84.79 Y73.79 E.00955
G1 X78.353 Y73.791 E.16184
G2 X77.49 Y74.692 I.073 J.934 E.03433
G1 X77.49 Y101.308 E.66916
G2 X78.395 Y102.21 I.933 J-.031 E.03538
G1 X87.71 Y102.21 E.23419
G1 X87.71 Y102.01 E.00503
G1 X92.29 Y102.01 E.11515
G1 X92.29 Y102.21 E.00503
G1 X101.605 Y102.21 E.23419
G2 X102.51 Y101.306 I-.021 J-.926 E.03552
G1 X102.51 Y74.695 E.66903
G2 X101.645 Y73.791 I-.936 J.03 E.03445
G1 X95.21 Y73.79 E.16178
G1 X95.21 Y73.41 E.00955
G1 X101.663 Y73.412 E.16224
G3 X102.89 Y74.706 I-.08 J1.304 E.04933
G1 X102.888 Y101.364 E.67022
M73 P95 R0
G3 X101.595 Y102.59 I-1.305 J-.08 E.04932
G1 X92.29 Y102.59 E.23393
G1 X92.282 Y104.59 E.05028
G3 X87.718 Y104.59 I-2.282 J-.303 E.16656
G1 X87.71 Y102.65 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.71 Y102.637 E-.76
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

G1 X88.149 Y103.938
G1 Z4.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463248
G1 F1775
M204 S6000
G1 X88.414 Y103.767 E.0088
M204 S10000
G1 X88.149 Y103.938 F42000
; LINE_WIDTH: 0.465801
G1 F1775
M204 S6000
G1 X88.129 Y104.124 E.00528
G1 X88.13 Y104.498 E.01053
G2 X91.87 Y104.102 I1.869 J-.205 E.16575
G1 X91.851 Y103.938 E.00466
; LINE_WIDTH: 0.463512
G1 X91.586 Y103.767 E.00881
M204 S10000
G1 X92.078 Y102.921 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1775
M204 S2000
G1 X91.692 Y103.306 E.01371
G1 X91.255 Y103.198
G1 X92.078 Y102.375 E.02926
G1 X91.685 Y102.223
G1 X90.966 Y102.942 E.02558
M204 S10000
G1 X90.957 Y102.203 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115104
G1 F1775
M204 S6000
G1 X90.789 Y102.803 E.00328
G2 X90.878 Y102.884 I.219 J-.152 E.00064
M204 S10000
G1 X90.592 Y102.469 F42000
; LINE_WIDTH: 0.482523
G1 F1775
M204 S6000
G2 X89.411 Y102.463 I-.612 J4.314 E.03464
; WIPE_START
G1 F10040.465
G1 X89.964 Y102.425 E-.35583
G1 X90.592 Y102.469 E-.40417
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.389 Y103.338 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1775
M204 S2000
G1 X89.203 Y102.523 E.02895
G1 X88.958 Y102.223
G1 X87.922 Y103.259 E.03684
G1 X87.922 Y102.713
G1 X88.413 Y102.223 E.01745
; WIPE_START
G1 F11668.197
M204 S6000
G1 X87.922 Y102.713 E-.26373
G1 X87.922 Y103.259 E-.20726
G1 X88.46 Y102.721 E-.28902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.302 Y103.251 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.13622
G1 F1775
M204 S6000
G3 X88.067 Y103.436 I-.755 J-.715 E.00199
; LINE_WIDTH: 0.0994793
G1 X88.071 Y103.458 E.0001
; LINE_WIDTH: 0.0638462
G1 X88.075 Y103.48 E.00004
M204 S10000
G1 X88.533 Y103.531 F42000
; LINE_WIDTH: 0.0890558
G1 F1775
M204 S6000
G1 X88.447 Y103.425 E.00049
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F18000
G1 X88.533 Y103.531 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.24 I1.217 J0 P1  F42000
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z5.34 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
M73 P96 R0
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

    G1 Z104.84 F600
M73 P97 R0
    G1 Z102.84

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


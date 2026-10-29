; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 3m 3s; total estimated time: 3m 22s
; total layer number: 8
; total filament length [mm] : 170.16
; total filament volume [cm^3] : 409.27
; total filament weight [g] : 0.51
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
M73 P0 R3
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
M73 P4 R3
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
; layer num/total_layer_count: 1/9
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
M73 P7 R3
G1 X75.399 Y83.815 F42000
M204 S6000
M73 P9 R3
G1 Z.4
G1 Z.14
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F3000
M204 S500
G1 X79.494 Y83.815 E.09108
G1 X79.462 Y83.712 E.0024
G1 X79.664 Y83.333 E.00954
G1 X79.664 Y83.177 E.00347
G2 X79.878 Y82.93 I-.298 J-.475 E.0074
G1 X75.573 Y82.93 E.09577
G1 X75.573 Y82.044 E.0197
G1 X80.349 Y82.044 E.10625
G1 X80.82 Y81.158 E.02231
G1 X78.458 Y81.158 E.05254
G1 X78.458 Y80.273 E.0197
G1 X81.488 Y80.273 E.06738
; WIPE_START
G1 X79.488 Y80.273 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X84.404 Y78.501 Z.54 F42000
G1 Z.14
G1 E.8 F1800
G1 F3000
M204 S500
M73 P10 R3
G1 X78.458 Y78.501 E.13224
G1 X78.458 Y79.387 E.0197
G1 X84.23 Y79.387 E.12838
G1 X84.23 Y80.273 E.0197
G1 X82.51 Y80.273 E.03826
G1 X83.297 Y80.691 E.01982
G1 X83.409 Y81.158 E.01069
G1 X84.23 Y81.158 E.01827
G1 X84.23 Y81.358 E.00444
G1 X90.001 Y81.358 E.12838
G1 X90.001 Y82.044 E.01526
G1 X84.23 Y82.044 E.12838
G1 X84.23 Y82.93 E.0197
G1 X90.001 Y82.93 E.12838
G1 X90.001 Y83.815 E.0197
G1 X84.23 Y83.815 E.12839
G1 X84.23 Y84.244 E.00953
G1 X87.115 Y84.244 E.06419
G1 X87.115 Y84.701 E.01017
G1 X90.001 Y84.701 E.0642
G1 X90.001 Y85.587 E.0197
G1 X87.115 Y85.587 E.0642
G1 X87.115 Y86.472 E.0197
G1 X89.084 Y86.472 E.04379
M204 S6000
M73 P11 R3
G1 X91.682 Y86.58 F42000
; FEATURE: Support transition
G1 F3000
M204 S500
G1 X91.39 Y87.13 E.01385
G1 X91.773 Y87.13 E.00852
G1 X91.773 Y86.409 E.01602
G1 X92.35 Y85.324 E.02734
M204 S6000
G1 X95.508 Y87.13 F42000
G1 F3000
M204 S500
G1 X95.773 Y87.13 E.00589
G1 X95.773 Y81.358 E.12838
G1 X95.315 Y81.358 E.01018
M73 P11 R2
G1 X95.315 Y87.13 E.12838
G1 X94.43 Y87.13 E.0197
G1 X94.43 Y81.358 E.12838
G1 X93.544 Y81.358 E.0197
G1 X93.544 Y87.13 E.12838
G1 X92.658 Y87.13 E.0197
G1 X92.658 Y78.472 E.19257
G1 X91.773 Y78.472 E.0197
G1 X91.773 Y84.72 E.13897
G1 X90.887 Y85.231 E.02275
G1 X90.887 Y78.472 E.15034
G1 X90.001 Y78.472 E.0197
G1 X90.001 Y80.972 E.05561
; WIPE_START
M73 P12 R2
G1 X90.001 Y78.972 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X84.081 Y83.79 Z.54 F42000
G1 X81.345 Y86.017 Z.54
G1 Z.14
G1 E.8 F1800
G1 F3000
M204 S500
G1 X81.345 Y85.337 E.01512
G1 X81.145 Y85.597 E.00728
G1 X81.145 Y95.786 E.22666
G1 X80.259 Y95.786 E.0197
G1 X80.259 Y85.915 E.21957
G1 X80.147 Y85.962 E.00269
G1 X79.682 Y85.652 E.01244
M204 S6000
G1 X79.664 Y85.181 F42000
G1 F3000
M204 S500
G1 X79.664 Y84.629 E.01227
G1 X79.373 Y84.629 E.00646
G1 X79.373 Y95.786 E.24818
G1 X78.488 Y95.786 E.0197
G1 X78.488 Y84.629 E.24818
G1 X77.602 Y84.629 E.0197
G1 X77.602 Y92.901 E.18399
G1 X76.716 Y92.901 E.0197
M73 P13 R2
G1 X76.716 Y84.629 E.18399
G1 X75.831 Y84.629 E.0197
G1 X75.831 Y92.901 E.18399
G1 X75.573 Y92.901 E.00574
G1 X75.573 Y92.415 E.01082
; WIPE_START
G1 X75.573 Y92.901 E-.18478
G1 X75.831 Y92.901 E-.098
G1 X75.831 Y91.645 E-.47722
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X83.334 Y93.043 Z.54 F42000
G1 X95.599 Y95.329 Z.54
G1 Z.14
G1 E.8 F1800
; FEATURE: Support interface
G1 F3000
M204 S500
G1 X98.889 Y95.329 E.07318
G1 X98.889 Y94.89 E.00977
G1 X97.678 Y94.89 E.02693
G1 X97.449 Y94.509 E.00988
G1 X97.484 Y94.443 E.00166
G1 X95.772 Y94.443 E.03807
G1 X95.772 Y93.558 E.0197
G1 X98.151 Y93.558 E.05292
; WIPE_START
G1 X96.151 Y93.558 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X101.718 Y94.443 Z.54 F42000
G1 Z.14
G1 E.8 F1800
G1 F3000
M204 S500
G1 X101.092 Y94.443 E.01392
G1 X100.621 Y95.329 E.02231
G1 X101.718 Y95.329 E.0244
M204 S6000
M73 P14 R2
G1 X98.878 Y94.236 F42000
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X98.878 Y93.215 E.02736
M204 S6000
G1 X95.33 Y92.528 F42000
G1 F3000
M204 S500
G1 X95.33 Y96.229 E.09922
G1 X101.987 Y96.229 E.17847
G1 X101.987 Y92.624 E.09665
G1 X101.608 Y92.529 E.01048
G1 X99.994 Y95.564 E.09212
G1 X99.332 Y95.211 E.02013
G1 X99.332 Y94.447 E.02048
G1 X97.983 Y94.447 E.03614
G1 X99.041 Y92.458 E.0604
G1 X95.33 Y92.458 E.0995
M204 S6000
G1 X90.523 Y87.365 F42000
G1 F3000
M204 S500
G1 X90.523 Y86.441 E.02478
G1 X90.001 Y86.742 E.01616
G1 X90.001 Y103.077 E.4379
G1 X90.523 Y103.077 E.014
G1 X90.523 Y87.995 E.4043
G1 X91.046 Y87.995 E.014
G1 X91.046 Y103.077 E.4043
M73 P15 R2
G1 X91.568 Y103.077 E.014
G1 X91.568 Y87.995 E.4043
G1 X92.09 Y87.995 E.014
G1 X92.09 Y103.077 E.4043
G1 X92.612 Y103.077 E.014
G1 X92.612 Y87.995 E.4043
G1 X93.134 Y87.995 E.014
G1 X93.134 Y103.077 E.4043
G1 X93.656 Y103.077 E.014
G1 X93.656 Y87.995 E.4043
M73 P16 R2
G1 X94.179 Y87.995 E.014
G1 X94.179 Y103.289 E.40997
M204 S6000
G1 X89.479 Y103.289 F42000
G1 F3000
M204 S500
G1 X89.479 Y87.043 E.43549
G1 X88.957 Y87.345 E.01616
G1 X88.957 Y103.077 E.42174
G1 X88.435 Y103.077 E.014
G1 X88.435 Y87.746 E.41099
G1 X88.302 Y87.995 E.00758
G1 X87.913 Y87.995 E.01044
M73 P17 R2
G1 X87.913 Y103.077 E.4043
G1 X87.39 Y103.077 E.014
G1 X87.39 Y87.995 E.4043
G1 X86.868 Y87.995 E.014
G1 X86.868 Y103.077 E.4043
G1 X86.346 Y103.077 E.014
G1 X86.346 Y87.995 E.4043
G1 X86.249 Y87.995 E.00259
G1 X86.25 Y85.609 E.06396
G1 X85.824 Y85.609 E.01141
G1 X85.824 Y103.077 E.46826
M73 P18 R2
G1 X85.302 Y103.077 E.014
G1 X85.302 Y85.11 E.48166
G1 X84.78 Y85.11 E.014
G1 X84.78 Y103.077 E.48166
G1 X84.257 Y103.077 E.014
G1 X84.257 Y85.11 E.48166
G1 X83.735 Y85.11 E.014
G1 X83.735 Y103.077 E.48166
G1 X83.213 Y103.077 E.014
G1 X83.213 Y82.724 E.54562
M73 P19 R2
G1 X82.95 Y82.724 E.00704
G1 X82.691 Y83.212 E.01482
G1 X82.691 Y103.077 E.53253
G1 X82.169 Y103.077 E.014
G1 X82.169 Y96.652 E.17224
G1 X81.647 Y96.652 E.014
G1 X81.647 Y103.077 E.17224
G1 X81.124 Y103.077 E.014
G1 X81.124 Y96.652 E.17224
G1 X80.602 Y96.652 E.014
G1 X80.602 Y103.077 E.17224
M73 P20 R2
G1 X80.08 Y103.077 E.014
G1 X80.08 Y96.652 E.17224
G1 X79.558 Y96.652 E.014
G1 X79.558 Y103.077 E.17224
G1 X79.036 Y103.077 E.014
G1 X79.036 Y96.652 E.17224
G1 X78.513 Y96.652 E.014
G1 X78.513 Y103.077 E.17224
G1 X77.991 Y103.077 E.014
G1 X77.991 Y96.652 E.17224
G1 X77.593 Y96.652 E.01069
G1 X77.593 Y93.767 E.07736
G1 X77.469 Y93.767 E.00331
G1 X77.469 Y103.077 E.24959
G1 X76.947 Y103.077 E.014
G1 X76.947 Y93.767 E.24959
G1 X76.425 Y93.767 E.014
G1 X76.425 Y103.077 E.24959
M73 P21 R2
G1 X75.903 Y103.077 E.014
G1 X75.903 Y93.767 E.24959
G1 X75.38 Y93.767 E.014
G1 X75.38 Y103.077 E.24959
G1 X74.858 Y103.077 E.014
G1 X74.858 Y93.767 E.24959
G1 X74.707 Y93.767 E.00406
G1 X74.707 Y91.767 E.05361
G1 X74.336 Y91.767 E.00994
G1 X74.336 Y103.289 E.30888
M204 S6000
G1 X94.701 Y80.703 F42000
G1 F3000
M204 S500
G1 X94.701 Y79.838 E.0232
G1 X95.223 Y79.838 E.014
G1 X95.223 Y80.492 E.01753
G1 X95.745 Y80.492 E.014
G1 X95.745 Y79.838 E.01753
G1 X96.267 Y79.838 E.014
M73 P22 R2
G1 X96.267 Y80.703 E.0232
; WIPE_START
G1 X96.267 Y79.838 E-.32885
G1 X95.745 Y79.838 E-.19842
G1 X95.745 Y80.451 E-.23273
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X97.765 Y87.811 Z.54 F42000
G1 X102.011 Y103.289 Z.54
G1 Z.14
G1 E.8 F1800
G1 F3000
M204 S500
G1 X102.011 Y96.652 E.17791
G1 X101.489 Y96.652 E.014
G1 X101.489 Y103.077 E.17224
G1 X100.967 Y103.077 E.014
G1 X100.967 Y96.652 E.17224
G1 X100.445 Y96.652 E.014
G1 X100.445 Y103.077 E.17224
G1 X99.922 Y103.077 E.014
G1 X99.922 Y96.652 E.17224
G1 X99.4 Y96.652 E.014
G1 X99.4 Y103.077 E.17224
G1 X98.878 Y103.077 E.014
G1 X98.878 Y96.652 E.17224
G1 X98.356 Y96.652 E.014
G1 X98.356 Y103.077 E.17224
M73 P23 R2
G1 X97.834 Y103.077 E.014
G1 X97.834 Y96.652 E.17224
G1 X97.312 Y96.652 E.014
G1 X97.312 Y103.077 E.17224
G1 X96.789 Y103.077 E.014
G1 X96.789 Y96.652 E.17224
G1 X96.267 Y96.652 E.014
G1 X96.267 Y103.077 E.17224
G1 X95.745 Y103.077 E.014
G1 X95.745 Y96.652 E.17224
G1 X95.223 Y96.652 E.014
G1 X95.223 Y103.077 E.17224
G1 X94.701 Y103.077 E.014
G1 X94.701 Y87.995 E.4043
G1 X95.223 Y87.995 E.014
G1 X95.223 Y92.035 E.10828
M73 P24 R2
G1 X95.745 Y92.035 E.014
G1 X95.745 Y87.995 E.10828
G1 X96.267 Y87.995 E.014
G1 X96.267 Y92.035 E.10828
G1 X96.789 Y92.035 E.014
G1 X96.789 Y79.838 E.32695
G1 X97.312 Y79.838 E.014
G1 X97.312 Y92.035 E.32695
G1 X97.834 Y92.035 E.014
G1 X97.834 Y79.838 E.32695
G1 X98.356 Y79.838 E.014
G1 X98.356 Y92.035 E.32695
G1 X98.878 Y92.035 E.014
G1 X98.878 Y79.838 E.32695
M73 P25 R2
G1 X99.4 Y79.838 E.014
G1 X99.4 Y94.024 E.38028
G1 X99.755 Y94.024 E.0095
G1 X99.755 Y94.957 E.02501
G1 X99.82 Y94.991 E.00198
G1 X99.922 Y94.798 E.00587
G1 X99.922 Y79.838 E.40103
G1 X100.445 Y79.838 E.014
G1 X100.445 Y93.816 E.3747
G1 X100.967 Y92.834 E.02981
G1 X100.967 Y79.838 E.34838
G1 X101.489 Y79.838 E.014
G1 X101.489 Y92.064 E.32773
G1 X102.011 Y92.194 E.01443
M73 P26 R2
G1 X102.011 Y79.838 E.33122
G1 X102.533 Y79.838 E.014
G1 X102.533 Y103.077 E.62297
G1 X103.055 Y103.077 E.014
G1 X103.055 Y79.838 E.62297
G1 X103.578 Y79.838 E.014
G1 X103.578 Y103.077 E.62297
G1 X104.1 Y103.077 E.014
G1 X104.1 Y79.838 E.62297
M73 P27 R2
G1 X104.622 Y79.838 E.014
G1 X104.622 Y103.077 E.62297
G1 X105.144 Y103.077 E.014
G1 X105.144 Y79.838 E.62297
G1 X105.666 Y79.838 E.014
G1 X105.666 Y103.289 E.62864
M204 S6000
M73 P28 R2
G1 X106.372 Y103.43 F42000
G1 F3000
M204 S500
G1 X106.372 Y79.415 E.64376
G1 X94.216 Y79.415 E.32588
G1 X94.216 Y80.915 E.04021
G1 X96.216 Y80.915 E.05361
G1 X96.216 Y87.572 E.17846
G1 X90.653 Y87.572 E.14913
G1 X91.953 Y85.127 E.07425
G1 X88.194 Y87.297 E.11634
M73 P29 R2
G1 X88.048 Y87.572 E.00837
G1 X86.672 Y87.572 E.03687
G1 X86.673 Y85.186 E.06396
G1 X86.173 Y85.186 E.0134
G1 X86.173 Y84.687 E.0134
G1 X83.787 Y84.687 E.06396
G1 X83.787 Y82.301 E.06396
G1 X82.696 Y82.301 E.02924
G1 X81.758 Y84.065 E.05356
G1 X81.787 Y96.229 E.32609
G1 X78.016 Y96.229 E.10111
G1 X78.016 Y93.344 E.07736
G1 X75.13 Y93.344 E.07735
G1 X75.13 Y91.344 E.05361
G1 X73.63 Y91.344 E.04021
G1 X73.63 Y103.5 E.32588
G1 X106.372 Y103.5 E.87771
; WIPE_START
G1 X104.372 Y103.5 E-.76
; WIPE_END
M73 P30 R2
G1 E-.04 F1800
M204 S6000
G1 X98.497 Y98.629 Z.54 F42000
G1 X80.556 Y83.756 Z.54
G1 Z.14
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X80.556 Y84.955 E.03214
G1 X80.456 Y84.986 E.00281
G1 X80.456 Y83.703 E.0344
G1 X80.385 Y83.665 E.00216
G1 X81.888 Y80.839 E.08578
G1 X82.506 Y81.168 E.01877
G1 X81.003 Y83.994 E.08578
G1 X80.609 Y83.784 E.01196
; WIPE_START
G1 X80.556 Y84.955 E-.44531
G1 X80.456 Y84.986 E-.03983
G1 X80.456 Y84.263 E-.27487
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

G1 X80.805 Y83.622
G1 Z.14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.260126
G1 F3000
M204 S500
G1 X82.086 Y81.211 E.03583
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
G1 X81.147 Y82.977 E-.76
; WIPE_END
M73 P31 R2
G1 E-.04 F1800
; layer num/total_layer_count: 2/9
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.54 I-1.217 J-.001 P1  F42000
G1 X81.145 Y85.312 Z.54
G1 Z.3
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
M204 S6000
G1 X81.145 Y95.787 E.26335
G1 X80.259 Y95.787 E.02227
G1 X80.259 Y85.915 E.24818
G1 X80.148 Y85.962 E.00303
G1 X79.664 Y85.64 E.01462
G1 X79.664 Y84.179 E.03672
G1 X79.594 Y84.142 E.00199
G1 X79.463 Y83.712 E.0113
G1 X79.664 Y83.333 E.01078
G3 X79.841 Y83 I.255 J-.078 E.01054
G1 X80.259 Y82.214 E.02238
G1 X80.259 Y78.472 E.09408
G1 X81.145 Y78.472 E.02227
G1 X81.145 Y80.549 E.05221
G1 X81.411 Y80.048 E.01425
G1 X81.841 Y79.917 E.0113
G1 X82.03 Y80.018 E.0054
G1 X82.03 Y78.472 E.03886
G1 X82.916 Y78.472 E.02227
G1 X82.916 Y80.489 E.0507
G1 X83.297 Y80.691 E.01085
G1 X83.428 Y81.121 E.0113
G1 X83.302 Y81.358 E.00675
G1 X83.802 Y81.358 E.01255
G1 X83.802 Y78.472 E.07256
G1 X84.23 Y78.472 E.01077
G1 X84.23 Y81.358 E.07255
G1 X84.687 Y81.358 E.01149
G1 X84.687 Y84.244 E.07256
G1 X85.573 Y84.244 E.02227
G1 X85.573 Y81.358 E.07256
G1 X86.459 Y81.358 E.02227
G1 X86.459 Y84.244 E.07256
G1 X87.115 Y84.244 E.01651
G1 X87.115 Y87.13 E.07255
G1 X87.344 Y87.13 E.00576
G1 X87.344 Y81.358 E.14511
G1 X88.23 Y81.358 E.02227
G1 X88.23 Y86.765 E.13595
G1 X89.116 Y86.254 E.02571
G1 X89.116 Y81.358 E.12309
G1 X90.001 Y81.358 E.02226
G1 X90.001 Y78.472 E.07255
G1 X90.001 Y85.742 E.18279
G1 X90.887 Y85.231 E.02571
G1 X90.887 Y78.472 E.16993
G1 X91.773 Y78.472 E.02227
G1 X91.773 Y84.72 E.15708
G1 X92.139 Y84.508 E.01064
G1 X92.565 Y84.919 E.01488
M73 P32 R2
G1 X91.773 Y86.409 E.04242
G1 X91.773 Y87.13 E.01812
G1 X92.658 Y87.13 E.02227
G1 X92.658 Y78.472 E.21766
G1 X92.887 Y78.472 E.00576
G1 X92.887 Y81.358 E.07255
G1 X93.544 Y81.358 E.01651
G1 X93.544 Y87.13 E.14511
G1 X94.43 Y87.13 E.02227
G1 X94.43 Y81.358 E.14511
G1 X95.315 Y81.358 E.02227
G1 X95.315 Y87.303 E.14948
M204 S10000
G1 X96.158 Y86.936 F42000
; FEATURE: Support
G1 F9000
M204 S6000
G1 X96.158 Y84.244 E.0677
G1 X104.43 Y84.244 E.20795
G1 X104.43 Y81.358 E.07255
G1 X96.158 Y81.358 E.20795
; WIPE_START
G1 X98.158 Y81.358 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-.444 J-1.133 P1  F42000
G1 X84.23 Y86.821 Z.7
G1 Z.3
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X84.23 Y84.629 E.05509
G1 X83.844 Y84.629 E.0097
G1 X83.844 Y84.244 E.0097
G1 X81.768 Y84.244 E.05219
G1 X81.73 Y87.129 E.07256
G1 X86.73 Y87.129 E.1257
G1 X86.73 Y87.515 E.0097
G1 X87.577 Y87.515 E.02129
G1 X86.878 Y88.83 E.03745
G1 X86.973 Y89.141 E.00818
G1 X88.086 Y89.733 E.03169
; WIPE_START
G1 X86.973 Y89.141 E-.47905
G1 X86.878 Y88.83 E-.12367
G1 X87.072 Y88.465 E-.15728
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I.274 J1.186 P1  F42000
G1 X91.185 Y87.515 Z.7
G1 Z.3
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X96.158 Y87.515 E.12504
G1 X96.158 Y87.129 E.0097
G1 X104.43 Y87.129 E.20795
G1 X104.43 Y90.015 E.07255
G1 X102.857 Y90.015 E.03955
G1 X100.707 Y88.872 E.06121
G1 X100.396 Y88.967 E.00818
G1 X99.838 Y90.015 E.02984
G1 X89.856 Y90.015 E.25098
G3 X89.379 Y90.421 I-.441 J-.035 E.01748
G1 X88.616 Y90.015 E.02174
G1 X81.73 Y90.015 E.17311
G1 X81.73 Y92.901 E.07255
M73 P33 R2
G1 X95.387 Y92.901 E.34335
G1 X95.387 Y92.515 E.0097
G1 X98.509 Y92.515 E.0785
G1 X98.658 Y92.234 E.00799
; WIPE_START
G1 X98.509 Y92.515 E-.1207
G1 X96.827 Y92.515 E-.6393
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-.936 J.777 P1  F42000
G1 X97.972 Y93.895 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X97.972 Y92.9 E.025
G1 X97.087 Y92.9 E.02227
G1 X97.087 Y95.786 E.07256
G1 X97.972 Y95.786 E.02227
G1 X97.972 Y94.89 E.02255
G1 X98.858 Y94.89 E.02227
G1 X98.858 Y95.96 E.02691
; WIPE_START
G1 X98.858 Y94.89 E-.40671
G1 X97.972 Y94.89 E-.33655
G1 X97.972 Y94.934 E-.01674
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-.438 J1.135 P1  F42000
G1 X100.629 Y95.96 Z.7
G1 Z.3
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X100.629 Y95.313 E.01627
G1 X101.515 Y93.647 E.04743
G1 X101.515 Y95.96 E.05815
; WIPE_START
G1 X101.515 Y93.96 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-.429 J-1.139 P1  F42000
G1 X96.201 Y95.96 Z.7
G1 Z.3
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X96.201 Y92.727 E.08129
; WIPE_START
G1 X96.201 Y94.727 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I.682 J1.008 P1  F42000
G1 X103.027 Y90.105 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G1 X103.113 Y90.151 E.00246
G1 X103.208 Y90.463 E.00818
G1 X101.967 Y92.798 E.0665
G2 X101.93 Y92.901 I.078 J.086 E.00285
G1 X104.43 Y92.901 E.06285
G1 X104.43 Y95.786 E.07255
G1 X101.93 Y95.786 E.06285
G1 X101.93 Y96.172 E.0097
G1 X95.387 Y96.172 E.1645
G1 X95.387 Y95.786 E.0097
G1 X81.73 Y95.786 E.34335
G1 X81.73 Y96.172 E.0097
G1 X78.073 Y96.172 E.09195
G1 X78.073 Y95.786 E.0097
G1 X75.573 Y95.786 E.06285
G1 X75.573 Y98.672 E.07255
G1 X104.43 Y98.672 E.7255
G1 X104.43 Y101.558 E.07255
G1 X75.573 Y101.558 E.7255
M204 S10000
M73 P34 R2
G1 X75.573 Y95.593 F42000
G1 F9000
M204 S6000
G1 X75.573 Y93.286 E.058
G1 X78.073 Y93.286 E.06285
G1 X78.073 Y95.593 E.058
; WIPE_START
G1 X78.073 Y93.593 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-1.067 J.586 P1  F42000
G1 X79.373 Y95.96 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X79.373 Y78.472 E.43968
G1 X78.488 Y78.472 E.02227
G1 X78.488 Y95.787 E.43531
G1 X78.458 Y92.901 E.07255
G1 X77.602 Y92.901 E.02153
G1 X77.602 Y81.358 E.29021
G1 X76.716 Y81.358 E.02227
G1 X76.716 Y92.901 E.29021
G1 X75.831 Y92.901 E.02227
G1 X75.831 Y81.184 E.29458
; WIPE_START
G1 X75.831 Y83.184 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-.162 J1.206 P1  F42000
G1 X80.596 Y83.822 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
G1 F11668.197
M204 S5000
M73 P35 R2
G1 X80.596 Y84.985 E.02922
G1 X80.416 Y85.041 E.00474
G1 X80.416 Y83.727 E.03305
G1 X80.331 Y83.681 E.00243
G1 X81.871 Y80.785 E.08246
G1 X82.56 Y81.152 E.01961
G1 X81.02 Y84.048 E.08246
G1 X80.649 Y83.851 E.01055
; WIPE_START
M204 S6000
G1 X80.596 Y84.985 E-.43135
G1 X80.416 Y85.041 E-.07171
G1 X80.416 Y84.365 E-.25694
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

G1 X80.942 Y82.985
G1 Z.3
G1 E.8 F1800
; FEATURE: Top surface
G1 F11668.197
M204 S2000
G1 X81.802 Y82.124 E.03059
G1 X82.187 Y81.194
G1 X81.561 Y81.82 E.02227
M204 S10000
G1 X81.609 Y81.868 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.211751
G1 F18000
M204 S6000
G1 X81.563 Y81.965 E.00124
; LINE_WIDTH: 0.1904
G1 X81.47 Y82.09 E.00159
; LINE_WIDTH: 0.146486
G1 X81.377 Y82.216 E.00114
; LINE_WIDTH: 0.102571
G1 X81.284 Y82.341 E.0007
M204 S10000
G1 X81.46 Y82.767 F42000
; LINE_WIDTH: 0.105371
G1 F18000
M204 S6000
G1 X81.356 Y82.908 E.00081
; LINE_WIDTH: 0.154886
G1 X81.251 Y83.049 E.00138
; LINE_WIDTH: 0.204401
G1 X81.147 Y83.19 E.00194
; LINE_WIDTH: 0.254114
G1 X81.105 Y83.215 E.0007
; LINE_WIDTH: 0.303991
G1 F16687.989
G1 X81.064 Y83.241 E.00086
; LINE_WIDTH: 0.353868
G1 F14083.089
G1 X81.022 Y83.266 E.00102
; LINE_WIDTH: 0.391206
G1 F12609.647
G1 X80.98 Y83.292 E.00114
G1 X80.914 Y82.995 E.00707
; WIPE_START
G1 X80.98 Y83.292 E-.65447
G1 X81.022 Y83.266 E-.10553
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-.654 J1.026 P1  F42000
G1 X88.455 Y88.001 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X88.614 Y87.702 E.00918
G1 X90.245 Y86.76 E.05104
G1 X90.38 Y86.891 E.00509
G1 X89.167 Y89.172 E.07
G1 X88.127 Y88.618 E.03194
G1 X88.427 Y88.054 E.01732
M106 S201.45
M204 S250
G1 X88.101 Y87.813 F42000
M106 S255
G1 F600
M204 S5000
G1 X88.314 Y87.412 E.01229
G1 X91.55 Y85.544 E.10125
G1 X89.333 Y89.714 E.12796
G1 X87.585 Y88.784 E.05365
G1 X88.073 Y87.866 E.02818
M106 S201.45
; WIPE_START
M204 S6000
M73 P36 R2
G1 X88.314 Y87.412 E-.19515
G1 X89.601 Y86.669 E-.56485
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-1.065 J-.589 P1  F42000
G1 X89.068 Y87.632 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.475946
M106 S255
G1 F3000
M204 S6000
G1 X88.612 Y88.491 E.02799
G1 X89.002 Y88.698 E.01271
G1 X89.79 Y87.216 E.04833
M106 S201.45
; WIPE_START
G1 X89.002 Y88.698 E-.63797
G1 X88.718 Y88.547 E-.12203
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-.564 J1.078 P1  F42000
G1 X98.916 Y93.886 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X100.918 Y90.121 E.11556
G1 X101.959 Y90.674 E.03194
G1 X100.081 Y94.206 E.1084
G1 X99.892 Y94.159 E.00528
G1 X99.892 Y93.886 E.00739
M73 P37 R2
G1 X98.976 Y93.886 E.02482
M106 S201.45
M204 S250
G1 X98.25 Y94.287 F42000
M106 S255
G1 F600
M204 S5000
G1 X100.753 Y89.579 E.14449
G1 X102.501 Y90.509 E.05365
G1 X99.928 Y95.347 E.14849
G1 X99.491 Y95.115 E.01341
G1 X99.491 Y94.287 E.02243
G1 X98.31 Y94.287 E.03203
M106 S201.45
; WIPE_START
M204 S6000
G1 X99.231 Y92.512 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P38 R2
G3 Z.7 I.889 J.831 P1  F42000
G1 X101.166 Y90.441 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.475946
M106 S255
G1 F3000
M204 S6000
G1 X99.515 Y93.546 E.10122
G1 X100.015 Y93.546 E.0144
G1 X101.555 Y90.649 E.09446
M106 S201.45
; CHANGE_LAYER
; Z_HEIGHT: 0.46
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
G1 X100.616 Y92.415 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/9
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M106 S198.9
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.7 I-1.142 J.421 P1  F42000
G1 X101.253 Y94.14 Z.7
G1 Z.46
G1 E.8 F1800
; FEATURE: Support transition
; LINE_WIDTH: 0.42
G1 F3000
M204 S6000
G1 X101.515 Y93.647 E.01402
G1 X101.515 Y101.558 E.19888
G1 X102.4 Y101.558 E.02227
G1 X102.4 Y91.982 E.24075
G1 X102.978 Y90.896 E.03091
M204 S10000
G1 X104.43 Y81.844 F42000
G1 F3000
M204 S6000
G1 X104.43 Y81.358 E.01223
G1 X104.172 Y81.358 E.00648
G1 X104.172 Y101.558 E.50785
G1 X103.286 Y101.558 E.02227
G1 X103.286 Y81.358 E.50785
G1 X102.4 Y81.358 E.02227
G1 X102.4 Y89.773 E.21156
M73 P39 R2
G1 X101.515 Y89.302 E.02522
G1 X101.515 Y81.358 E.19972
G1 X100.629 Y81.358 E.02227
G1 X100.629 Y88.896 E.18951
G1 X100.396 Y88.967 E.00614
G1 X99.838 Y90.015 E.02984
G1 X99.743 Y90.015 E.00239
G1 X99.743 Y81.358 E.21766
G1 X98.858 Y81.358 E.02227
G1 X98.858 Y90.015 E.21766
G1 X98.658 Y90.015 E.00501
G1 X98.658 Y92.234 E.0558
G1 X98.254 Y92.995 E.02166
; WIPE_START
G1 X98.658 Y92.234 E-.32737
G1 X98.658 Y91.096 E-.43263
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I-.934 J.78 P1  F42000
G1 X101.233 Y94.177 Z.86
G1 Z.46
G1 E.8 F1800
G1 F3000
M204 S6000
G1 X100.629 Y95.313 E.03234
G1 X100.629 Y101.558 E.157
G1 X99.743 Y101.558 E.02227
G1 X99.743 Y95.932 E.14145
G1 X98.858 Y95.461 E.02522
G1 X98.858 Y101.558 E.15329
G1 X97.972 Y101.558 E.02227
G1 X97.972 Y94.99 E.16513
G2 X97.678 Y94.89 I-.241 J.227 E.00813
G3 X97.526 Y94.637 I.44 J-.436 E.00748
G1 X97.449 Y94.509 E.00376
G1 X97.972 Y93.525 E.02802
M73 P40 R2
G1 X97.972 Y81.358 E.3059
G1 X97.087 Y81.358 E.02227
G1 X97.087 Y101.558 E.50785
G1 X96.201 Y101.558 E.02227
G1 X96.201 Y81.358 E.50785
; WIPE_START
G1 X96.201 Y83.358 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I1.022 J-.661 P1  F42000
G1 X93.061 Y78.501 Z.86
G1 Z.46
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X90.001 Y78.501 E.07692
G1 X90.001 Y79.387 E.02227
G1 X92.887 Y79.387 E.07256
G1 X92.887 Y80.273 E.02227
G1 X90.001 Y80.273 E.07256
G1 X90.001 Y81.158 E.02227
G1 X92.887 Y81.158 E.07256
G1 X92.887 Y81.358 E.00501
G1 X95.773 Y81.358 E.07255
G1 X95.773 Y82.044 E.01725
G1 X90.001 Y82.044 E.14511
G1 X90.001 Y82.93 E.02227
G1 X95.773 Y82.93 E.14511
G1 X95.773 Y83.815 E.02227
G1 X90.001 Y83.815 E.14511
M73 P40 R1
G1 X90.001 Y84.701 E.02227
G1 X95.773 Y84.701 E.14511
G1 X95.773 Y85.587 E.02227
G1 X92.21 Y85.587 E.08957
M73 P41 R1
G1 X91.739 Y86.472 E.02522
G1 X95.946 Y86.472 E.10577
M204 S10000
G1 X95.892 Y87.515 F42000
; FEATURE: Support transition
G1 F3000
M204 S6000
G1 X95.315 Y87.515 E.01451
G1 X95.315 Y101.558 E.35305
G1 X94.43 Y101.558 E.02227
G1 X94.43 Y87.515 E.35305
G1 X93.544 Y87.515 E.02227
G1 X93.544 Y101.558 E.35305
G1 X92.658 Y101.558 E.02227
G1 X92.658 Y87.515 E.35305
G1 X91.773 Y87.515 E.02227
G1 X91.773 Y101.558 E.35305
G1 X90.887 Y101.558 E.02227
G1 X90.887 Y88.075 E.33897
G1 X90.625 Y88.567 E.01402
M204 S10000
G1 X90.605 Y88.605 F42000
M73 P42 R1
G1 F3000
M204 S6000
G1 X90.001 Y89.741 E.03234
G1 X90.001 Y101.558 E.2971
G1 X89.116 Y101.558 E.02227
G1 X89.116 Y90.281 E.28352
G1 X88.23 Y89.81 E.02522
G1 X88.23 Y101.558 E.29536
G1 X87.344 Y101.558 E.02227
G1 X87.344 Y89.339 E.3072
G1 X86.973 Y89.141 E.01058
G1 X86.878 Y88.83 E.00818
G1 X87.344 Y87.953 E.02499
G1 X87.344 Y87.129 E.0207
G1 X86.459 Y87.129 E.02227
G1 X86.459 Y101.558 E.36276
G1 X85.573 Y101.558 E.02227
G1 X85.573 Y87.129 E.36276
G1 X84.687 Y87.129 E.02227
G1 X84.687 Y101.558 E.36276
G1 X83.802 Y101.558 E.02227
G1 X83.802 Y90.015 E.29021
M73 P43 R1
G1 X84.23 Y90.015 E.01076
G1 X84.23 Y87.129 E.07254
G1 X83.802 Y87.129 E.01076
G1 X83.802 Y84.243 E.07256
G1 X82.916 Y84.243 E.02227
G1 X82.916 Y87.129 E.07256
G1 X82.03 Y87.129 E.02227
G1 X82.03 Y84.243 E.07256
G1 X81.768 Y84.243 E.00659
G1 X81.73 Y84.316 E.00206
G1 X81.73 Y84.828 E.01289
; WIPE_START
G1 X81.73 Y84.316 E-.19483
G1 X81.768 Y84.243 E-.03108
G1 X82.03 Y84.243 E-.09956
G1 X82.03 Y85.387 E-.43453
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I.363 J-1.161 P1  F42000
G1 X79.837 Y84.701 Z.86
G1 Z.46
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X75.573 Y84.701 E.10722
G1 X75.573 Y85.587 E.02227
G1 X79.664 Y85.587 E.10285
G1 X79.664 Y85.64 E.00134
G1 X80.148 Y85.962 E.01462
G3 X81.344 Y85.587 I2.023 J4.354 E.03161
G1 X81.344 Y86.472 E.02227
G1 X75.573 Y86.472 E.14511
G1 X75.573 Y87.358 E.02227
G1 X81.344 Y87.358 E.14511
G1 X81.344 Y88.244 E.02227
G1 X75.573 Y88.244 E.14511
G1 X75.573 Y89.129 E.02227
G1 X81.344 Y89.129 E.14511
G1 X81.344 Y90.015 E.02227
G1 X75.573 Y90.015 E.14511
G1 X75.573 Y90.901 E.02227
G1 X81.344 Y90.901 E.14511
G1 X81.344 Y91.786 E.02227
G1 X75.573 Y91.786 E.14511
G1 X75.573 Y92.672 E.02227
G1 X81.344 Y92.672 E.14511
G1 X81.344 Y93.558 E.02227
G1 X78.458 Y93.558 E.07256
G1 X78.458 Y94.443 E.02227
M73 P44 R1
G1 X81.344 Y94.443 E.07256
G1 X81.344 Y95.329 E.02227
G1 X78.285 Y95.329 E.07692
M204 S10000
G1 X81.722 Y96.172 F42000
; FEATURE: Support transition
G1 F3000
M204 S6000
G1 X81.145 Y96.172 E.01451
G1 X81.145 Y101.558 E.13541
G1 X80.259 Y101.558 E.02227
G1 X80.259 Y96.172 E.13541
G1 X79.373 Y96.172 E.02227
G1 X79.373 Y101.558 E.13541
G1 X78.488 Y101.558 E.02227
G1 X78.488 Y96.172 E.13541
G1 X78.073 Y96.172 E.01043
G1 X78.073 Y93.286 E.07255
G1 X77.602 Y93.286 E.01184
G1 X77.602 Y101.558 E.20796
G1 X76.716 Y101.558 E.02227
G1 X76.716 Y93.286 E.20796
G1 X75.831 Y93.286 E.02227
G1 X75.831 Y101.558 E.20796
G1 X75.573 Y101.558 E.00648
G1 X75.573 Y101.071 E.01223
M204 S10000
G1 X81.73 Y90.6 F42000
G1 F3000
M204 S6000
G1 X81.73 Y90.015 E.01471
G1 X82.03 Y90.015 E.00755
G1 X82.03 Y101.558 E.29021
G1 X82.916 Y101.558 E.02227
G1 X82.916 Y90.015 E.29021
G1 X83.609 Y90.015 E.01742
; WIPE_START
G1 X82.916 Y90.015 E-.26328
M73 P45 R1
G1 X82.916 Y91.322 E-.49672
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I.727 J.976 P1  F42000
G1 X90.618 Y85.587 Z.86
G1 Z.46
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X89.876 Y85.587 E.01866
M204 S10000
G1 X89.615 Y84.436 F42000
; FEATURE: Support
G1 F9000
M204 S6000
G1 X89.615 Y84.788 E.00885
G1 X89.301 Y84.244 E.01582
G1 X89.615 Y84.244 E.00791
G1 X89.615 Y81.358 E.07255
G1 X87.635 Y81.358 E.04979
; WIPE_START
G1 X89.615 Y81.358 E-.75262
G1 X89.615 Y81.377 E-.00738
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I-1.008 J-.681 P1  F42000
G1 X87.566 Y84.411 Z.86
G1 Z.46
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X88.752 Y86.464 E.0596
G1 X88.267 Y86.743 E.01407
G1 X87.116 Y86.743 E.02895
G1 X87.116 Y84.31 E.06117
M204 S10000
G1 X84.616 Y84.244 F42000
G1 F9000
M204 S6000
G1 X87.47 Y84.244 E.07176
G1 X86.167 Y81.986 E.06553
G1 X86.251 Y81.672 E.00818
G1 X86.795 Y81.358 E.01579
G1 X84.23 Y81.358 E.06449
; WIPE_START
G1 X86.23 Y81.358 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I-.493 J-1.113 P1  F42000
G1 X80.395 Y83.941 Z.86
G1 Z.46
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F12000
M204 S5000
G1 X80.618 Y84.059 E.00564
G1 X80.618 Y85.001 E.02108
G2 X80.395 Y85.072 I1.245 J4.316 E.00522
G1 X80.395 Y84.001 E.02396
; WIPE_START
M204 S6000
G1 X80.618 Y84.059 E-.08738
G1 X80.618 Y85.001 E-.35803
G1 X80.395 Y85.072 E-.08867
G1 X80.395 Y84.477 E-.22593
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I-.575 J1.073 P1  F42000
G1 X88.127 Y88.618 Z.86
G1 Z.46
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X88.614 Y87.702 E.02813
G1 X90.245 Y86.76 E.05104
G1 X90.38 Y86.891 E.00509
G1 X89.167 Y89.172 E.07
G1 X88.18 Y88.647 E.03031
M204 S250
G1 X87.585 Y88.784 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X88.314 Y87.412 E.03906
G1 X91.55 Y85.544 E.09394
G1 X89.333 Y89.714 E.11872
G1 X87.638 Y88.812 E.04827
; WIPE_START
M204 S6000
G1 X88.314 Y87.412 E-.5908
G1 X88.7 Y87.19 E-.1692
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

G1 X89.003 Y88.633
G1 Z.46
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415858
G1 F11794.88
M204 S6000
M73 P46 R1
G1 X89.536 Y87.63 E.02825
G1 X88.912 Y87.99 E.01791
G1 X88.666 Y88.454 E.01306
G1 X88.95 Y88.605 E.008
; WIPE_START
G1 X88.666 Y88.454 E-.12218
G1 X88.912 Y87.99 E-.19955
G1 X89.536 Y87.63 E-.27358
G1 X89.332 Y88.013 E-.1647
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I-.592 J1.064 P1  F42000
G1 X99.892 Y93.886 Z.86
G1 Z.46
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X98.916 Y93.886 E.02644
G1 X100.918 Y90.121 E.11556
G1 X101.959 Y90.674 E.03194
G1 X100.081 Y94.206 E.1084
G1 X99.892 Y94.159 E.00528
G1 X99.892 Y93.946 E.00577
M204 S250
G1 X99.491 Y94.287 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X98.25 Y94.287 E.03122
G1 X100.753 Y89.579 E.13406
G1 X101.044 Y89.734 E.0083
G1 X102.501 Y90.509 E.04148
G1 X99.928 Y95.347 E.13778
G1 X99.491 Y95.115 E.01244
G1 X99.491 Y94.347 E.0193
M204 S10000
G1 X99.58 Y93.488 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415851
G1 F11795.082
M204 S6000
G1 X100.012 Y93.488 E.01075
G1 X101.42 Y90.839 E.07461
G1 X101.083 Y90.66 E.00949
G1 X99.608 Y93.435 E.07816
; CHANGE_LAYER
; Z_HEIGHT: 0.62
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11795.082
G1 X100.547 Y91.669 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/9
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.86 I1.198 J.212 P1  F42000
G1 X102.4 Y81.184 Z.86
G1 Z.62
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
M204 S6000
G1 X102.4 Y89.773 E.21592
G1 X101.515 Y89.302 E.02522
G1 X101.515 Y81.358 E.19972
G1 X100.629 Y81.358 E.02227
G1 X100.629 Y88.896 E.18951
G1 X100.396 Y88.967 E.00614
G1 X99.838 Y90.015 E.02984
G1 X99.743 Y90.015 E.00239
G1 X99.743 Y81.358 E.21766
G1 X98.858 Y81.358 E.02227
G1 X98.858 Y90.015 E.21766
G1 X98.658 Y90.015 E.00501
G1 X98.658 Y92.234 E.0558
G1 X97.972 Y93.525 E.03675
G1 X97.972 Y81.358 E.3059
G1 X97.087 Y81.358 E.02227
G1 X97.087 Y101.558 E.50786
M73 P47 R1
G1 X97.972 Y101.558 E.02227
G1 X97.972 Y94.99 E.16513
G1 X98.858 Y95.461 E.02522
G1 X98.858 Y101.558 E.15329
G1 X99.743 Y101.558 E.02227
G1 X99.743 Y95.932 E.14145
G2 X100.286 Y95.959 I.285 J-.257 E.01516
G1 X100.629 Y95.313 E.0184
G1 X100.629 Y101.558 E.157
G1 X101.515 Y101.558 E.02227
G1 X101.515 Y93.647 E.19888
G1 X102.4 Y91.982 E.04743
G1 X102.4 Y101.558 E.24075
G1 X103.286 Y101.558 E.02227
G1 X103.286 Y81.358 E.50785
G1 X104.172 Y81.358 E.02227
G1 X104.172 Y101.731 E.51222
; WIPE_START
G1 X104.172 Y99.731 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-.296 J-1.18 P1  F42000
G1 X96.201 Y101.731 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X96.201 Y81.358 E.51222
G1 X95.315 Y81.358 E.02227
G1 X95.315 Y101.558 E.50786
M73 P48 R1
G1 X94.43 Y101.558 E.02227
G1 X94.43 Y81.358 E.50786
G1 X93.544 Y81.358 E.02227
G1 X93.544 Y83.593 E.05619
G1 X94.367 Y85.018 E.04137
G1 X94.282 Y85.332 E.00818
G1 X93.544 Y85.759 E.02144
G1 X93.544 Y101.558 E.39721
G1 X92.658 Y101.558 E.02227
G1 X92.658 Y85.23 E.41051
G1 X92.524 Y84.997 E.00677
G1 X91.773 Y86.409 E.04022
G1 X91.773 Y101.558 E.38085
G1 X90.887 Y101.558 E.02227
G1 X90.887 Y88.075 E.33897
G1 X90.001 Y89.741 E.04743
G1 X90.001 Y101.558 E.2971
G1 X89.116 Y101.558 E.02227
G1 X89.116 Y90.281 E.28352
G1 X88.23 Y89.81 E.02522
G1 X88.23 Y101.558 E.29536
M73 P49 R1
G1 X87.344 Y101.558 E.02227
G1 X87.344 Y89.339 E.3072
G1 X86.973 Y89.141 E.01058
G1 X86.878 Y88.83 E.00818
G1 X87.344 Y87.953 E.02499
G1 X87.344 Y87.129 E.0207
G1 X86.459 Y87.129 E.02227
G1 X86.459 Y101.558 E.36276
G1 X85.573 Y101.558 E.02227
G1 X85.573 Y87.129 E.36276
G1 X84.687 Y87.129 E.02227
G1 X84.687 Y101.558 E.36276
G1 X83.802 Y101.558 E.02227
G1 X83.802 Y90.015 E.29021
G1 X82.916 Y90.015 E.02227
G1 X82.916 Y101.558 E.29021
G1 X82.03 Y101.558 E.02227
G1 X82.03 Y90.015 E.29021
G1 X81.518 Y90.015 E.01288
G1 X81.145 Y90.015 E.00939
G1 X81.145 Y101.558 E.29021
G1 X80.259 Y101.558 E.02227
G1 X80.259 Y93.429 E.20438
G1 X79.451 Y93.895 E.02344
G1 X79.373 Y93.874 E.00203
G1 X79.373 Y101.558 E.19318
G1 X78.488 Y101.558 E.02227
G1 X78.488 Y92.686 E.22306
M73 P50 R1
G1 X77.602 Y91.152 E.04453
G1 X77.602 Y101.558 E.26162
G1 X76.716 Y101.558 E.02227
G1 X76.716 Y89.27 E.30892
; WIPE_START
G1 X76.716 Y91.27 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I.743 J.964 P1  F42000
G1 X78.844 Y89.629 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G1 X78.844 Y87.669 E.04927
G1 X78.98 Y87.515 E.00517
G1 X81.344 Y87.515 E.05943
G1 X81.344 Y89.629 E.05315
G1 X78.902 Y89.629 E.0614
; WIPE_START
G1 X80.902 Y89.629 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-.92 J-.796 P1  F42000
G1 X79.373 Y91.396 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X79.373 Y90.015 E.03472
G1 X80.259 Y90.015 E.02227
G1 X80.259 Y92.93 E.07329
; WIPE_START
G1 X80.259 Y90.93 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.193 J-.243 P1  F42000
G1 X79.373 Y86.575 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X79.373 Y87.303 E.0183
; WIPE_START
G1 X79.373 Y86.575 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-.197 J1.201 P1  F42000
G1 X83.802 Y87.303 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X83.802 Y84.243 E.07692
G1 X82.916 Y84.243 E.02227
G1 X82.916 Y87.129 E.07256
G1 X82.03 Y87.129 E.02227
G1 X82.03 Y84.243 E.07256
G1 X81.598 Y84.243 E.01086
G1 X81.377 Y84.66 E.01185
G1 X81.266 Y84.694 E.00293
G1 X81.349 Y84.777 E.00297
G1 X81.349 Y85.33 E.01391
G1 X81.145 Y85.597 E.00845
G1 X81.145 Y87.129 E.03853
G1 X80.259 Y87.129 E.02227
G1 X80.259 Y85.916 E.03052
G1 X80.149 Y85.962 E.00301
G1 X79.664 Y85.637 E.01468
G1 X79.664 Y84.777 E.02161
G1 X79.814 Y84.627 E.00533
G1 X79.814 Y84.259 E.00927
G1 X79.373 Y84.243 E.01108
G1 X79.373 Y85.917 E.04208
G1 X78.844 Y85.579 E.01579
G1 X78.526 Y85.65 E.00818
M73 P51 R1
G1 X78.488 Y85.71 E.00179
G1 X78.488 Y84.243 E.03687
G1 X77.602 Y84.243 E.02227
G1 X77.602 Y87.981 E.09396
G1 X77.148 Y87.194 E.02285
G1 X76.833 Y87.109 E.00818
G1 X76.716 Y87.177 E.0034
G1 X76.716 Y84.243 E.07375
G1 X75.831 Y84.243 E.02227
G1 X75.831 Y101.731 E.43967
; WIPE_START
G1 X75.831 Y99.731 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I.828 J.892 P1  F42000
G1 X91.773 Y84.92 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X91.773 Y84.243 E.01701
G1 X90.887 Y84.243 E.02227
G1 X90.887 Y85.231 E.02483
G1 X90.125 Y85.671 E.02212
G1 X90.001 Y85.457 E.00622
G1 X90.001 Y84.07 E.03487
; WIPE_START
G1 X90.001 Y85.457 E-.52702
G1 X90.125 Y85.671 E-.09396
G1 X90.442 Y85.488 E-.13902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.211 J-.123 P1  F42000
G1 X90.001 Y81.165 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G1 X90.001 Y80.628 E.01351
G1 X90.423 Y81.358 E.02119
G1 X90.001 Y81.358 E.0106
; WIPE_START
G1 X90.423 Y81.358 E-.17779
G1 X90.001 Y80.628 E-.35559
G1 X90.001 Y81.165 E-.22661
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-.104 J1.213 P1  F42000
G1 X92.254 Y81.358 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X92.501 Y81.358 E.00622
G1 X92.501 Y80.972 E.0097
G1 X92.887 Y80.972 E.0097
G1 X92.887 Y78.472 E.06285
G1 X90.001 Y78.472 E.07255
; WIPE_START
G1 X92.001 Y78.472 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-.956 J.753 P1  F42000
G1 X100.753 Y89.579 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Outer wall
G1 F11668.197
M204 S5000
G1 X101.468 Y89.959 E.02036
G1 X102.501 Y90.509 E.02942
G1 X100.304 Y94.641 E.11766
G1 X100.116 Y94.994 E.01006
G1 F8046.989
G1 X99.928 Y95.347 E.01006
G1 F3843.032
G1 X99.45 Y95.093 E.01361
M106 S255
G1 F600
G1 X99.081 Y94.897 E.01051
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X98.706 Y94.697 E.01153
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X98.18 Y94.418 E.01496
M106 S201.45
G1 F993.661
G1 X98.228 Y94.328 E.00255
G1 F3508.808
G1 X98.416 Y93.975 E.01006
G1 F7559.956
G1 X98.603 Y93.622 E.01006
G1 F11668.197
G1 X98.791 Y93.269 E.01006
G1 X100.725 Y89.632 E.10355
; WIPE_START
M204 S6000
G1 X101.468 Y89.959 E-.30865
G1 X102.501 Y90.509 E-.44461
G1 X102.493 Y90.524 E-.00675
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P52 R1
G3 Z1.02 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X100.375 Y93.549
G1 Z.62
G1 E.8 F1800
; FEATURE: Top surface
G1 F11668.197
M204 S2000
G1 X100.95 Y92.974 E.02044
; WIPE_START
M204 S6000
G1 X100.375 Y93.549 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.003 J.689 P1  F42000
G1 X101.569 Y91.809 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X100.081 Y93.297 E.05291
G1 X99.709 Y93.124
G1 X102.083 Y90.75 E.08443
G1 X101.727 Y90.561
G1 X99.24 Y93.048 E.08843
G1 X99.664 Y92.078
G1 X101.371 Y90.371 E.06067
G1 X101.015 Y90.182
G1 X100.284 Y90.913 E.02599
; WIPE_START
M204 S6000
G1 X101.015 Y90.182 E-.3929
G1 X101.371 Y90.371 E-.15325
G1 X100.973 Y90.769 E-.21385
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-1.207 J-.155 P1  F42000
G1 X100.608 Y93.617 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.103424
G1 F18000
M204 S6000
G2 X100.527 Y93.81 I.105 J.157 E.001
; WIPE_START
G1 X100.525 Y93.725 E-.29359
G1 X100.608 Y93.617 E-.46641
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.075 J.571 P1  F42000
G1 X101.227 Y92.452 Z1.02
G1 Z.62
G1 E.8 F1800
; LINE_WIDTH: 0.10308
G1 F18000
M204 S6000
G1 X101.114 Y92.605 E.00085
; LINE_WIDTH: 0.148013
G1 X101.001 Y92.758 E.00141
; LINE_WIDTH: 0.192946
G1 X100.887 Y92.911 E.00197
; WIPE_START
G1 X101.001 Y92.758 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.055 J.607 P1  F42000
G1 X101.846 Y91.288 Z1.02
G1 Z.62
G1 E.8 F1800
; LINE_WIDTH: 0.103081
G1 F18000
M204 S6000
G1 X101.733 Y91.441 E.00085
; LINE_WIDTH: 0.148014
G1 X101.62 Y91.594 E.00141
; LINE_WIDTH: 0.192948
G1 X101.507 Y91.746 E.00197
; WIPE_START
G1 X101.62 Y91.594 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.074 J-.572 P1  F42000
G1 X100.794 Y90.043 Z1.02
G1 Z.62
G1 E.8 F1800
; LINE_WIDTH: 0.126131
G1 F18000
M204 S6000
G1 X100.71 Y90.156 E.00085
; LINE_WIDTH: 0.0957863
G1 X100.626 Y90.27 E.00057
M204 S10000
G1 X100.346 Y90.976 F42000
; LINE_WIDTH: 0.192958
G1 F18000
M204 S6000
G1 X100.233 Y91.129 E.00197
; LINE_WIDTH: 0.14802
G1 X100.12 Y91.282 E.00141
; LINE_WIDTH: 0.103083
G1 X100.007 Y91.435 E.00085
; WIPE_START
G1 X100.12 Y91.282 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-1.082 J-.557 P1  F42000
G1 X99.19 Y93.086 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.467146
M106 S255
G1 F3000
M204 S6000
G1 X100.096 Y93.568 E.02893
G1 X100.227 Y93.703 E.00533
G1 X100.34 Y93.875 E.0058
G1 X100.21 Y94.119 E.00778
G1 X99.041 Y93.497 E.03737
G1 X98.838 Y93.879 E.01221
G1 X100.007 Y94.501 E.03737
G1 X99.913 Y94.679 E.00568
G1 X99.089 Y94.24 E.02633
G1 X99.089 Y94.503 E.0074
G1 X98.756 Y94.326 E.01063
M106 S201.45
; WIPE_START
G1 X99.089 Y94.503 E-.14323
M73 P53 R1
G1 X99.089 Y94.24 E-.09964
G1 X99.913 Y94.679 E-.35465
G1 X100.007 Y94.501 E-.0765
G1 X99.807 Y94.395 E-.08599
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I.734 J-.971 P1  F42000
G1 X89.555 Y86.649 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
M204 S5000
G1 X89.37 Y86.329 E.00928
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X86.875 Y82.008 E.13521
G1 X87.204 Y81.818 E.0103
G1 X87.774 Y82.805 E.03089
M106 S201.45
M106 S255
G1 F3000
G1 X89.699 Y86.139 E.10432
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
G1 X89.884 Y86.459 E.00928
G1 F880.464
G1 X89.904 Y86.494 E.00103
G1 F3293.087
G1 X90.251 Y86.294 E.01006
G1 F7241.71
G1 X90.597 Y86.094 E.01006
G1 F11668.197
G1 X90.943 Y85.894 E.01006
G1 X91.55 Y85.544 E.01761
G1 X89.333 Y89.714 E.11872
G1 X87.585 Y88.784 E.04978
G1 X88.314 Y87.412 E.03906
G1 X89.559 Y86.694 E.03613
M204 S10000
G1 X89.28 Y87.123 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.098904
G1 F18000
M204 S6000
G1 X90.766 Y86.265 E.00722
G1 X90.801 Y86.263 E.00015
; LINE_WIDTH: 0.146741
G1 X90.837 Y86.261 E.00026
; LINE_WIDTH: 0.174613
G1 X90.929 Y86.286 E.00087
; WIPE_START
G1 X90.837 Y86.261 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-1.095 J-.531 P1  F42000
G1 X89.887 Y88.221 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S2000
G1 X89.022 Y89.085 E.03073
G1 X88.666 Y88.896
G1 X90.506 Y87.056 E.06541
G1 X90.542 Y86.474
G1 X88.31 Y88.706 E.07935
G1 X87.982 Y88.489
G1 X89.285 Y87.186 E.04635
M204 S10000
G1 X88.781 Y87.389 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.101625
G1 F18000
M204 S6000
G1 X88.644 Y87.494 E.00076
; LINE_WIDTH: 0.130198
G1 X88.507 Y87.599 E.00108
G1 X88.324 Y87.846 E.00192
; WIPE_START
G1 X88.507 Y87.599 E-.48681
G1 X88.644 Y87.494 E-.27319
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I.564 J1.078 P1  F42000
G1 X89.855 Y86.86 Z1.02
G1 Z.62
G1 E.8 F1800
; LINE_WIDTH: 0.10335
G1 F18000
M204 S6000
G1 X89.686 Y86.99 E.00096
; LINE_WIDTH: 0.148832
G1 X89.517 Y87.119 E.00159
; LINE_WIDTH: 0.194315
G1 X89.349 Y87.249 E.00222
M204 S10000
M73 P54 R1
G1 X90.163 Y87.699 F42000
; LINE_WIDTH: 0.103081
G1 F18000
M204 S6000
G1 X90.05 Y87.852 E.00085
; LINE_WIDTH: 0.148014
G1 X89.937 Y88.005 E.00141
; LINE_WIDTH: 0.192948
G1 X89.824 Y88.158 E.00197
M204 S10000
G1 X89.544 Y88.864 F42000
; LINE_WIDTH: 0.0985386
G1 F18000
M204 S6000
G1 X89.452 Y88.988 E.00065
; LINE_WIDTH: 0.134387
G1 X89.36 Y89.113 E.00101
; LINE_WIDTH: 0.170236
G1 X89.268 Y89.237 E.00137
; CHANGE_LAYER
; Z_HEIGHT: 0.78
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X89.36 Y89.113 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/9
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S198.9
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.02 I1.146 J.409 P1  F42000
G1 X90.618 Y85.587 Z1.02
G1 Z.78
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
M204 S6000
G1 X90.076 Y85.587 E.01362
G1 X90.001 Y85.457 E.00378
G1 X90.001 Y84.701 E.019
G1 X92.553 Y84.701 E.06417
; WIPE_START
G1 X90.553 Y84.701 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I-.769 J-.943 P1  F42000
G1 X79.689 Y93.558 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X97.955 Y93.558 E.45924
G1 X98.426 Y92.672 E.02522
G1 X80.31 Y92.672 E.45544
G1 X79.799 Y91.786 E.02571
G1 X98.658 Y91.786 E.47415
G1 X98.658 Y90.901 E.02227
G1 X79.288 Y90.901 E.487
G1 X78.776 Y90.015 E.02571
G1 X88.616 Y90.015 E.24738
G1 X86.969 Y89.129 E.04701
G1 X84.23 Y89.129 E.06887
G1 X84.23 Y88.244 E.02227
G1 X87.189 Y88.244 E.07441
G1 X87.66 Y87.358 E.02522
G1 X84.23 Y87.358 E.08625
G1 X84.23 Y87.129 E.00575
G1 X79.226 Y87.129 E.1258
G1 X79.645 Y86.472 E.01959
G1 X84.23 Y86.472 E.11528
M73 P55 R1
G1 X84.23 Y85.587 E.02227
G1 X81.153 Y85.587 E.07737
G1 X81.349 Y85.33 E.00812
G1 X81.349 Y84.777 E.0139
G1 X81.273 Y84.701 E.00272
G1 X84.404 Y84.701 E.07871
; WIPE_START
G1 X82.404 Y84.701 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I0 J-1.217 P1  F42000
G1 X79.986 Y84.701 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X75.573 Y84.701 E.11094
G1 X75.573 Y85.587 E.02227
G1 X79.897 Y85.587 E.10872
; WIPE_START
G1 X77.897 Y85.587 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I-1.216 J.058 P1  F42000
G1 X78.065 Y89.129 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X78.459 Y89.129 E.00991
G1 X78.459 Y88.244 E.02227
G1 X77.754 Y88.244 E.01772
G1 X77.242 Y87.358 E.02571
G1 X77.987 Y87.358 E.01871
G1 X77.79 Y87.233 E.00586
G1 X77.72 Y86.915 E.00818
G1 X78.002 Y86.472 E.0132
G1 X75.573 Y86.472 E.06107
G1 X75.573 Y87.358 E.02227
G1 X76.403 Y87.358 E.02087
G1 X76.194 Y87.478 E.00605
G2 X75.923 Y88.244 I.072 J.456 E.02494
G1 X75.573 Y88.244 E.00881
G1 X75.573 Y89.129 E.02227
G1 X76.434 Y89.129 E.02166
G1 X76.946 Y90.015 E.02571
G1 X75.573 Y90.015 E.03452
G1 X75.573 Y90.901 E.02227
G1 X77.457 Y90.901 E.04737
G1 X77.968 Y91.786 E.02571
G1 X75.573 Y91.786 E.06023
G1 X75.573 Y92.672 E.02227
G1 X78.48 Y92.672 E.07309
G1 X78.991 Y93.558 E.02571
G1 X75.573 Y93.558 E.08594
G1 X75.573 Y94.443 E.02227
G1 X97.484 Y94.443 E.55088
G1 X97.568 Y94.775 E.0086
G1 X98.61 Y95.329 E.02967
G1 X75.573 Y95.329 E.57919
G1 X75.573 Y96.215 E.02227
G1 X104.43 Y96.215 E.7255
M73 P56 R1
G1 X104.43 Y95.329 E.02227
G1 X100.621 Y95.329 E.09576
G1 X101.092 Y94.443 E.02522
G1 X104.43 Y94.443 E.08392
G1 X104.43 Y93.558 E.02227
G1 X101.563 Y93.558 E.07208
G1 X102.034 Y92.672 E.02522
G1 X104.43 Y92.672 E.06024
G1 X104.43 Y91.786 E.02227
G1 X102.504 Y91.786 E.0484
G1 X102.975 Y90.901 E.02522
G1 X104.43 Y90.901 E.03656
G1 X104.43 Y90.015 E.02227
G1 X102.856 Y90.015 E.03956
G1 X101.191 Y89.129 E.04743
G1 X104.43 Y89.129 E.08144
G1 X104.43 Y88.244 E.02227
G1 X90.797 Y88.244 E.34274
G1 X91.268 Y87.358 E.02522
G1 X104.43 Y87.358 E.3309
G1 X104.43 Y86.472 E.02227
G1 X91.739 Y86.472 E.31906
G1 X92.21 Y85.587 E.02522
G1 X92.864 Y85.587 E.01645
G1 X92.994 Y85.811 E.0065
G1 X93.308 Y85.895 E.00818
G1 X93.842 Y85.587 E.0155
G1 X104.43 Y85.587 E.2662
G1 X104.43 Y84.701 E.02227
G1 X94.184 Y84.701 E.2576
G1 X93.672 Y83.815 E.02571
G1 X104.43 Y83.815 E.27046
G1 X104.43 Y82.93 E.02227
G1 X93.161 Y82.93 E.28331
M73 P57 R1
G1 X92.887 Y82.455 E.01379
G1 X92.887 Y82.044 E.01032
G1 X104.603 Y82.044 E.29457
; WIPE_START
G1 X102.603 Y82.044 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I-1.167 J-.345 P1  F42000
G1 X100.506 Y89.129 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90.326 Y89.129 E.25593
G1 X89.855 Y90.015 E.02522
G1 X100.035 Y90.015 E.25593
; WIPE_START
G1 X98.035 Y90.015 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I-.892 J.827 P1  F42000
G1 X104.603 Y97.1 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X75.573 Y97.1 E.72987
G1 X75.573 Y97.986 E.02227
G1 X104.43 Y97.986 E.7255
G1 X104.43 Y98.872 E.02227
G1 X75.573 Y98.872 E.7255
G1 X75.573 Y99.757 E.02227
G1 X104.43 Y99.757 E.7255
M73 P58 R1
G1 X104.43 Y100.643 E.02227
G1 X75.573 Y100.643 E.7255
G1 X75.573 Y101.528 E.02227
G1 X104.603 Y101.528 E.72987
; WIPE_START
G1 X102.603 Y101.528 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I.426 J-1.14 P1  F42000
G1 X79.802 Y92.997 Z1.18
G1 Z.78
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X79.473 Y93.187 E.0103
G1 X76.483 Y88.008 E.16204
G1 X76.812 Y87.818 E.0103
G1 X79.772 Y92.945 E.1604
M106 S198.9
; WIPE_START
M204 S6000
M73 P59 R1
G1 X79.473 Y93.187 E-.1462
G1 X78.665 Y91.788 E-.6138
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I1.214 J.079 P1  F42000
G1 X79.015 Y86.378 Z1.18
G1 Z.78
G1 E.8 F1800
M106 S255
G1 F600
M204 S5000
G1 X78.587 Y87.051 E.02161
G1 X78.399 Y86.931 E.00603
G1 X78.827 Y86.259 E.02161
G1 X78.964 Y86.346 E.0044
M106 S198.9
; WIPE_START
M204 S6000
G1 X78.587 Y87.051 E-.30663
G1 X78.399 Y86.931 E-.0853
G1 X78.827 Y86.259 E-.30577
G1 X78.964 Y86.346 E-.06229
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I.098 J1.213 P1  F42000
G1 X93.329 Y85.187 Z1.18
G1 Z.78
G1 E.8 F1800
M106 S255
G1 F600
M204 S5000
G1 X90.339 Y80.008 E.16204
M73 P60 R1
G1 X90.668 Y79.818 E.0103
G1 X91.204 Y80.746 E.02903
G1 X93.658 Y84.997 E.13301
G1 X93.381 Y85.157 E.00867
M106 S198.9
; WIPE_START
M204 S6000
G1 X92.364 Y83.435 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I-1.013 J-.675 P1  F42000
G1 X89.865 Y87.187 Z1.18
G1 Z.78
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X86.875 Y82.008 E.15035
G1 X87.204 Y81.818 E.00955
G1 X89.156 Y85.199 E.09816
G1 X90.194 Y86.997 E.05219
G1 X89.917 Y87.157 E.00805
; WIPE_START
M204 S6000
G1 X88.9 Y85.435 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.556 Y88.793 Z1.18 F42000
G1 Z.78
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F12000
M204 S5000
G1 X87.66 Y88.596 E.00498
G1 X89.083 Y89.353 E.03605
G1 X89.446 Y89.546 E.0092
G1 X89.342 Y89.742 E.00498
G1 X87.609 Y88.821 E.04391
; WIPE_START
M204 S6000
G1 X87.66 Y88.596 E-.08755
G1 X89.083 Y89.353 E-.61227
M73 P61 R1
G1 X89.223 Y89.427 E-.06018
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I-.595 J1.062 P1  F42000
G1 X98.151 Y94.426 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X98.256 Y94.23 E.00498
G1 X99.678 Y94.986 E.03605
G1 X100.042 Y95.18 E.0092
G1 X99.937 Y95.376 E.00498
G1 X98.204 Y94.455 E.04391
; WIPE_START
M204 S6000
G1 X98.256 Y94.23 E-.08755
G1 X99.678 Y94.986 E-.61227
G1 X99.818 Y95.061 E-.06018
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.744 Y89.55 Z1.18 F42000
G1 Z.78
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X101.902 Y90.166 E.02934
G1 X102.53 Y90.5 E.01591
G1 X102.425 Y90.696 E.00498
G1 X100.64 Y89.747 E.04525
G1 X100.716 Y89.603 E.00363
; WIPE_START
M204 S6000
G1 X101.902 Y90.166 E-.49879
G1 X102.509 Y90.489 E-.26121
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
; layer num/total_layer_count: 6/9
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S204
; OBJECT_ID: 15
G1 X79.015 Y86.378 F42000
G1 Z.94
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X78.587 Y87.051 E.01784
G1 X78.399 Y86.931 E.00498
G1 X78.827 Y86.259 E.01784
G1 X78.964 Y86.346 E.00364
; WIPE_START
G1 F12000
M204 S6000
G1 X78.587 Y87.051 E-.30663
G1 X78.399 Y86.931 E-.0853
G1 X78.827 Y86.259 E-.30577
G1 X78.964 Y86.346 E-.0623
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I-1.207 J.152 P1  F42000
G1 X79.802 Y92.997 Z1.34
G1 Z.94
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X79.473 Y93.187 E.00955
G1 X76.483 Y88.008 E.15035
G1 X76.812 Y87.818 E.00955
G1 X77.023 Y88.183 E.0106
G1 X79.772 Y92.945 E.13824
; WIPE_START
G1 F11668.197
M204 S6000
G1 X79.473 Y93.187 E-.1462
G1 X78.665 Y91.788 E-.6138
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I.388 J1.153 P1  F42000
G1 X87.556 Y88.793 Z1.34
G1 Z.94
G1 E.8 F1800
; LINE_WIDTH: 0.377567
M73 P62 R1
G1 F1200
M204 S5000
G1 X87.66 Y88.596 E.00498
G1 X88.235 Y88.902 E.01457
G1 X89.446 Y89.546 E.03068
G1 X89.342 Y89.742 E.00498
G1 X87.609 Y88.821 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X87.66 Y88.596 E-.08755
G1 X88.235 Y88.902 E-.24747
G1 X89.223 Y89.427 E-.42498
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.865 Y87.187 Z1.34 F42000
G1 Z.94
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X86.875 Y82.008 E.15035
G1 X87.204 Y81.818 E.00955
G1 X88.128 Y83.417 E.04644
G1 X90.194 Y86.997 E.10391
G1 X89.917 Y87.157 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.9 Y85.435 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I.068 J1.215 P1  F42000
G1 X93.329 Y85.187 Z1.34
G1 Z.94
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X90.339 Y80.008 E.15035
G1 X90.668 Y79.818 E.00955
G1 X92.485 Y82.965 E.09137
G1 X93.658 Y84.997 E.05898
G1 X93.381 Y85.157 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X92.364 Y83.435 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I-.717 J.983 P1  F42000
G1 X100.744 Y89.55 Z1.34
G1 Z.94
M73 P63 R1
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1200
M204 S5000
G1 X102.326 Y90.391 E.04008
G1 X102.53 Y90.5 E.00517
G1 X102.425 Y90.696 E.00498
G1 X100.64 Y89.747 E.04525
G1 X100.716 Y89.603 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X102.326 Y90.391 E-.68105
G1 X102.509 Y90.489 E-.07895
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.151 Y94.426 Z1.34 F42000
G1 Z.94
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X98.256 Y94.23 E.00498
G1 X98.831 Y94.536 E.01457
G1 X100.042 Y95.18 E.03068
G1 X99.937 Y95.376 E.00498
G1 X98.204 Y94.455 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X98.256 Y94.23 E-.08755
G1 X98.831 Y94.536 E-.24747
G1 X99.818 Y95.061 E-.42498
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
; layer num/total_layer_count: 7/9
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S183.6
; OBJECT_ID: 15
G1 X89.865 Y87.187 F42000
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X86.875 Y82.008 E.15035
G1 X87.204 Y81.818 E.00955
G1 X90.194 Y86.997 E.15035
G1 X89.917 Y87.157 E.00805
; WIPE_START
M204 S6000
G1 X88.9 Y85.435 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.764 J-.947 P1  F42000
G1 X79.73 Y92.831 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F623.412
M204 S6000
G1 X79.736 Y92.827 E.00019
M106 S255
G1 F600
G1 X80.067 Y92.636 E.01036
M106 S183.6
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X80.475 Y92.401 E.01275
G2 X85.549 Y89.472 I1.126 J-3.909 E.17723
G1 X86.919 Y88.68 E.04289
G1 X87.119 Y88.786 E.00613
M106 S183.6
; FEATURE: Inner wall
M106 S255
M204 S6000
M73 P64 R1
G1 X89.591 Y90.101 E.07587
M106 S183.6
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X97.715 Y94.42 E.24929
M106 S183.6
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X100.187 Y95.735 E.07587
M106 S183.6
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X101.432 Y96.397 E.03823
M106 S183.6
M106 S255
G1 F600
G1 X103.007 Y93.436 E.09088
G1 X103.196 Y93.483 E.00528
G1 X103.196 Y100.091 E.17907
G1 X100.167 Y100.091 E.08207
G1 X100.167 Y99.491 E.01626
M73 P65 R1
G1 X97.046 Y99.491 E.08458
G1 X97.046 Y100.091 E.01626
G1 X81.167 Y100.091 E.43027
G1 X81.167 Y99.491 E.01626
G1 X78.046 Y99.491 E.08458
M73 P66 R1
G1 X78.046 Y100.091 E.01626
G1 X77.017 Y100.091 E.02787
G1 X77.017 Y92.544 E.20451
G1 X77.202 Y92.495 E.00519
G1 X77.98 Y93.842 E.04215
G1 X79.028 Y93.236 E.03281
M106 S183.6
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X79.257 Y93.104 E.00717
M106 S183.6
G1 F1066.607
G1 X79.359 Y93.045 E.00319
G1 F3383.331
G1 X79.678 Y92.861 E.00998
; WIPE_START
G1 X79.736 Y92.827 E-.0254
G1 X80.067 Y92.636 E-.14535
G1 X80.475 Y92.401 E-.17887
G1 X80.959 Y92.511 E-.18844
G1 X81.352 Y92.555 E-.15064
G1 X81.54 Y92.558 E-.07131
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P67 R1
G3 Z1.5 I.907 J-.811 P1  F42000
G1 X77.257 Y87.768 Z1.5
G1 Z1.1
G1 E.8 F1800
M106 S255
G1 F600
M204 S6000
G1 X77.017 Y87.906 E.00749
M106 S183.6
M106 S255
G1 X77.017 Y87.508 E.0108
M106 S183.6
M106 S255
G1 X77.106 Y87.508 E.00242
M106 S183.6
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X77.338 Y87.508 E.00627
G1 X77.387 Y87.693 E.00519
M106 S183.6
M106 S255
G1 F3000
G1 X77.309 Y87.738 E.00246
M106 S183.6
; WIPE_START
M204 S6000
G1 X77.017 Y87.906 E-.19118
G1 X77.017 Y87.508 E-.22638
G1 X77.106 Y87.508 E-.05069
G1 X77.338 Y87.508 E-.13144
G1 X77.387 Y87.693 E-.10869
G1 X77.309 Y87.738 E-.05161
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.138 J.431 P1  F42000
G1 X79.183 Y92.684 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X77.173 Y89.203 E.10107
G1 X76.973 Y88.856 E.01006
G1 F6808.54
G1 X76.773 Y88.51 E.01006
G1 F3003.157
G1 X76.737 Y88.531 E.00103
G1 F2700
G1 X76.616 Y88.6 E.00351
G1 X76.617 Y88.321 E.00702
G1 F5047.801
G1 X76.617 Y88.239 E.00206
G1 X76.483 Y88.008 E.00672
G1 X76.617 Y87.931 E.00388
G1 X76.617 Y87.883 E.00119
G1 F720
G1 X76.617 Y87.457 E.01071
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X76.616 Y87.107 E.00948
G1 X77.952 Y87.107 E.03618
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X78.223 Y87.107 E.00683
M106 S183.6
M106 S255
G1 X78.169 Y87.246 E.00374
M106 S183.6
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X78.169 Y87.246 E.00001
M106 S183.6
M106 S255
G1 F600
G2 X78.017 Y87.792 I4.812 J1.63 E.01535
G1 X77.457 Y88.115 E.01753
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X77.137 Y88.3 E.00928
M106 S183.6
G1 F747.185
G1 X77.102 Y88.32 E.00103
G1 F3030.228
G1 X77.302 Y88.666 E.01006
G1 F6849.27
G1 X77.502 Y89.013 E.01006
G1 F11668.197
G1 X77.702 Y89.359 E.01006
G1 X78.912 Y91.455 E.06084
G1 X79.112 Y91.801 E.01006
G1 F6849.328
G1 X79.312 Y92.148 E.01006
G1 F3030.266
G1 X79.512 Y92.494 E.01006
G1 F747.204
G1 X79.547 Y92.474 E.00103
M106 S255
G1 F600
G1 X79.867 Y92.289 E.00928
M106 S183.6
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X80.427 Y91.966 E.01753
G2 X85.196 Y89.213 I1.174 J-3.472 E.1688
G1 X86.911 Y88.222 E.05368
G1 X87.307 Y88.433 E.01215
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
G1 X87.633 Y88.606 E.00928
M73 P68 R1
G1 F2975.226
G1 X87.986 Y88.794 E.01006
G1 F6766.451
G1 X88.339 Y88.981 E.01006
G1 F9655.58
G1 X88.693 Y89.169 E.01006
G1 F7092.722
G1 X89.101 Y89.386 E.01162
G1 F2725.645
G1 X89.454 Y89.574 E.01006
M106 S255
G1 F600
G1 X89.78 Y89.747 E.00928
M106 S183.6
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X97.903 Y94.066 E.24929
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X98.228 Y94.239 E.00928
M106 S183.6
G1 F2725.645
G1 X98.582 Y94.427 E.01006
G1 F6387.29
G1 X98.935 Y94.615 E.01006
G1 F9201.585
G1 X99.288 Y94.803 E.01006
G1 F7491.979
G1 X99.696 Y95.02 E.01162
G1 F2975.226
G1 X100.049 Y95.208 E.01006
G1 F720
G1 X100.375 Y95.381 E.00928
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X101.267 Y95.855 E.02737
G1 X103.597 Y91.473 E.13447
G1 X103.596 Y100.492 E.24439
G1 X99.766 Y100.492 E.10378
G1 X99.766 Y99.892 E.01626
G1 X97.447 Y99.892 E.06286
M73 P69 R1
G1 X97.447 Y100.492 E.01626
G1 X80.766 Y100.492 E.45198
G1 X80.766 Y99.892 E.01626
G1 X78.446 Y99.892 E.06286
M73 P70 R1
G1 X78.446 Y100.492 E.01626
G1 X76.616 Y100.492 E.04959
G1 X76.616 Y90.679 E.2659
G1 X78.126 Y93.294 E.08182
G1 X78.828 Y92.889 E.02195
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P70 R0
G1 F720
M73 P71 R0
G1 X79.131 Y92.714 E.0088
; WIPE_START
M204 S6000
G1 X78.157 Y90.967 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.096 J1.213 P1  F42000
G1 X100.494 Y89.192 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X93.743 Y85.602 E.20721
G1 X93.79 Y85.413 E.00528
G1 X96.017 Y85.413 E.06036
G1 X96.017 Y84.213 E.03252
G1 X97.196 Y84.213 E.03194
G1 X97.196 Y85.413 E.03252
G1 X100.217 Y85.413 E.08187
G1 X100.217 Y84.013 E.03794
G1 X100.996 Y84.013 E.0211
M73 P72 R0
G1 X100.996 Y85.413 E.03793
M106 S183.6
M106 S255

G1 X103.196 Y85.413 E.05961
G1 X103.196 Y90.628 E.14132
G1 X102.967 Y90.506 E.00703
M106 S183.6
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X100.547 Y89.22 E.07425
M106 S183.6
; WIPE_START
G1 X98.781 Y88.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.641 J-1.035 P1  F42000
G1 X93.004 Y84.705 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X93.039 Y84.684 E.00103
G1 X90.339 Y80.008 E.13576
G1 X90.668 Y79.818 E.00955
G1 X93.067 Y83.973 E.12063
M73 P73 R0
G1 X93.267 Y84.319 E.01006
G1 F6906.741
G1 X93.467 Y84.666 E.01006
G1 F3068.494
G1 X93.667 Y85.012 E.01006
G1 F766.248
G1 X93.713 Y85.012 E.00116
M106 S255
G1 F600
G1 X94.141 Y85.012 E.01075
M106 S183.6
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X95.616 Y85.012 E.03999
G1 X95.616 Y83.812 E.03252
G1 X97.597 Y83.812 E.05365
G1 X97.597 Y85.012 E.03252
G1 X99.816 Y85.012 E.06016
G1 X99.816 Y83.612 E.03794
G1 X101.397 Y83.612 E.04281
G1 X101.397 Y85.012 E.03794
G1 X103.596 Y85.012 E.0596
G1 X103.597 Y91.295 E.17024
G1 X102.779 Y90.86 E.0251
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
M73 P74 R0
G1 X102.453 Y90.687 E.00928
G1 F2975.226
G1 X102.1 Y90.499 E.01006
G1 F6766.451
G1 X101.746 Y90.311 E.01006
G1 F9655.576
G1 X101.393 Y90.124 E.01006
G1 F7092.722
G1 X100.985 Y89.907 E.01162
G1 F2725.645
G1 X100.632 Y89.719 E.01006
M106 S255
G1 F600
G1 X100.306 Y89.546 E.00928
M106 S183.6
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X92.183 Y85.226 E.24929
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X92.14 Y85.203 E.00123
G1 X92.22 Y85.157 E.00232
M106 S183.6
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X92.684 Y84.889 E.01452
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X92.952 Y84.735 E.00777
M106 S183.6
; WIPE_START
M204 S6000
G1 X93.039 Y84.684 E-.03838
G1 X92.09 Y83.04 E-.72162
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.233 J-1.194 P1  F42000
G1 X79.53 Y85.493 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G2 X79.071 Y85.863 I2.23 J3.229 E.01598
G1 X79.071 Y85.012 E.02307
G1 X80.006 Y85.012 E.02534
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X80.505 Y85.012 E.01254
G1 X80.382 Y85.053 E.00326
M106 S183.6
M106 S255
G2 X80.006 Y85.211 I1.238 J3.463 E.01025
M106 S183.6
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G2 X79.579 Y85.459 I1.753 J3.51 E.01339
M106 S183.6
; WIPE_START
M204 S6000
G1 X79.267 Y85.687 E-.14682
G1 X79.071 Y85.863 E-.10013
G1 X79.071 Y85.012 E-.32348
G1 X79.57 Y85.012 E-.18957
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.054 J-.608 P1  F42000
G1 X78.834 Y86.288 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X78.986 Y86.385 E.00453
G1 X78.58 Y87.021 E.01898
G1 X78.428 Y86.925 E.00453
G1 X78.802 Y86.339 E.01747
; WIPE_START
M204 S6000
G1 X78.986 Y86.385 E-.07925
G1 X78.58 Y87.021 E-.31531
G1 X78.428 Y86.925 E-.07519
G1 X78.802 Y86.339 E-.29025
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

G1 X77.765 Y93.803
G1 Z1.1
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.430596
M106 S255
M73 P75 R0
G1 F3000
M204 S6000
G1 X77.184 Y93.803 E.01499
M106 S183.6
; WIPE_START
G1 X77.765 Y93.803 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.023 J.659 P1  F42000
G1 X81.334 Y99.351 Z1.5
G1 Z1.1
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X96.705 Y99.35 E.39707
G1 X96.705 Y99.746 E.01024
G1 X81.334 Y99.747 E.39707
M106 S183.6
; WIPE_START
G1 X83.334 Y99.747 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I0 J-1.217 P1  F42000
G1 X77.184 Y99.747 Z1.5
G1 Z1.1
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X77.705 Y99.747 E.01346
G1 X77.705 Y99.351 E.01024
G1 X77.358 Y99.351 E.00898
G1 X77.358 Y98.955 E.01024
G1 X102.855 Y98.953 E.65866
G1 X102.855 Y98.557 E.01024
G1 X77.358 Y98.558 E.65866
G1 X77.358 Y98.162 E.01024
G1 X102.855 Y98.16 E.65866
M73 P76 R0
G1 X102.855 Y97.764 E.01024
G1 X77.358 Y97.766 E.65866
G1 X77.358 Y97.37 E.01024
G1 X102.855 Y97.368 E.65866
G1 X102.855 Y96.972 E.01024
G1 X77.358 Y96.973 E.65866
G1 X77.358 Y96.577 E.01024
G1 X101.043 Y96.575 E.61183
M73 P77 R0
G1 X100.298 Y96.179 E.0218
G1 X77.358 Y96.181 E.59258
G1 X77.358 Y95.785 E.01024
G1 X99.552 Y95.783 E.57334
G1 X98.807 Y95.387 E.0218
G1 X77.358 Y95.388 E.55409
G1 X77.358 Y94.992 E.01024
G1 X98.062 Y94.991 E.53484
M73 P78 R0
G1 X97.317 Y94.594 E.0218
G1 X77.358 Y94.596 E.51559
G1 X77.358 Y94.199 E.01024
G1 X96.572 Y94.198 E.49634
G1 X95.827 Y93.802 E.0218
G1 X78.727 Y93.803 E.44171
G1 X79.414 Y93.407 E.02047
G1 X95.081 Y93.406 E.40473
G1 X94.336 Y93.01 E.0218
G1 X80.1 Y93.011 E.36775
M73 P79 R0
G1 X80.525 Y92.765 E.01268
G2 X83.167 Y92.614 I1.086 J-4.18 E.06948
G1 X93.591 Y92.613 E.26927
G1 X92.846 Y92.217 E.0218
G1 X83.957 Y92.218 E.22962
G2 X84.482 Y91.821 I-1.365 J-2.355 E.01703
G1 X92.101 Y91.821 E.19681
G1 X91.356 Y91.425 E.0218
G1 X84.893 Y91.425 E.16695
G2 X85.21 Y91.029 I-1.819 J-1.781 E.01314
G1 X90.611 Y91.028 E.13951
G1 X89.865 Y90.632 E.0218
G1 X85.447 Y90.633 E.11412
G2 X85.647 Y90.236 I-1.525 J-1.016 E.01149
G1 X89.12 Y90.236 E.08972
G1 X88.375 Y89.84 E.0218
G1 X85.791 Y89.84 E.06676
G1 X85.834 Y89.7 E.00379
G1 X86.278 Y89.444 E.01324
G1 X88 Y89.444 E.04447
M106 S183.6
; WIPE_START
G1 X86.278 Y89.444 E-.65415
G1 X86.037 Y89.583 E-.10585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.524 J1.098 P1  F42000
G1 X94.428 Y85.58 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.421356
M106 S255
G1 F3000
M204 S6000
G1 X102.855 Y90.061 E.2408
M73 P80 R0
G1 X102.855 Y89.622 E.01106
G1 X95.579 Y85.753 E.20792
G1 X96.358 Y85.753 E.01965
G1 X96.358 Y85.729 E.00061
G1 X102.855 Y89.184 E.18566
G1 X102.855 Y88.746 E.01106
G1 X96.358 Y85.291 E.18566
G1 X96.358 Y84.852 E.01106
G1 X96.855 Y85.117 E.01422
G1 X96.855 Y84.679 E.01106
G1 X96.293 Y84.38 E.01606
M106 S183.6
; WIPE_START
G1 X96.855 Y84.679 E-.24194
G1 X96.855 Y85.117 E-.16656
G1 X96.358 Y84.852 E-.21413
G1 X96.358 Y85.214 E-.13737
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.314 J1.176 P1  F42000
G1 X97.726 Y85.58 Z1.5
G1 Z1.1
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X102.855 Y88.307 E.14658
G1 X102.855 Y87.869 E.01106
G1 X98.876 Y85.753 E.11369
G1 X99.701 Y85.753 E.0208
G1 X102.855 Y87.431 E.09014
G1 X102.855 Y86.992 E.01106
G1 X100.916 Y85.961 E.05542
G1 X101.146 Y85.961 E.0058
G1 X101.146 Y85.753 E.00524
G1 X101.35 Y85.753 E.00514
G1 X102.855 Y86.554 E.04303
G1 X102.855 Y86.116 E.01106
G1 X101.848 Y85.58 E.02879
M106 S183.6
; WIPE_START
G1 X102.855 Y86.116 E-.43368
G1 X102.855 Y86.554 E-.16657
G1 X102.484 Y86.357 E-.15976
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.444 J-1.133 P1  F42000
G1 X100.607 Y85.62 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F12395.67
M204 S6000
G1 X100.607 Y84.221 E.03313
; WIPE_START
G1 X100.607 Y85.62 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.189 J.261 P1  F42000
G1 X102.58 Y94.594 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.430596
M106 S255
G1 F3000
M204 S6000
G1 X102.855 Y94.594 E.00711
G1 X102.855 Y94.99 E.01024
G1 X102.566 Y94.99 E.00748
G1 X102.355 Y95.387 E.01159
G1 X102.855 Y95.386 E.01292
M73 P81 R0
G1 X102.855 Y95.783 E.01024
G1 X102.145 Y95.783 E.01836
G1 X101.934 Y96.179 E.01159
G1 X102.855 Y96.179 E.0238
G1 X102.855 Y96.575 E.01024
G1 X101.527 Y96.575 E.03432
M106 S183.6
; WIPE_START
G1 X102.855 Y96.575 E-.50492
G1 X102.855 Y96.179 E-.15058
G1 X102.58 Y96.179 E-.1045
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.993 J-.704 P1  F42000
G1 X100.334 Y99.349 Z1.5
G1 Z1.1
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X102.855 Y99.349 E.06513
G1 X102.855 Y99.745 E.01024
G1 X100.334 Y99.746 E.06513
M106 S183.6
; CHANGE_LAYER
; Z_HEIGHT: 1.26
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
G1 X102.334 Y99.745 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/9
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.5 I1.2 J-.205 P1  F42000
G1 X99.816 Y85.012 Z1.5
G1 Z1.26
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7913
M204 S5000
G1 X99.816 Y83.612 E.0352
G1 X101.397 Y83.612 E.03972
G1 X101.397 Y85.012 E.0352
G1 X103.594 Y85.013 E.05526
G1 X103.595 Y91.294 E.15792
G1 X92.14 Y85.203 E.32618
G1 X92.597 Y84.94 E.01325
G1 X92.597 Y85.012 E.00182
G1 X95.616 Y85.012 E.07593
G1 X95.616 Y83.812 E.03017
G1 X97.597 Y83.812 E.04978
G1 X97.597 Y85.012 E.03017
G1 X99.756 Y85.012 E.05431
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.816 Y83.612 E-.53249
G1 X100.415 Y83.612 E-.22751
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-.485 J-1.116 P1  F42000
G1 X78.126 Y93.294 Z1.66
G1 Z1.26
G1 E.8 F1800
G1 F7913
M204 S5000
G1 X80.427 Y91.966 E.0668
G2 X85.196 Y89.213 I1.175 J-3.472 E.15662
G1 X86.911 Y88.222 E.04981
G1 X101.267 Y95.855 E.40876
G1 X103.595 Y91.476 E.1247
G1 X103.596 Y100.492 E.22668
G1 X99.766 Y100.492 E.09628
G1 X99.766 Y99.892 E.01508
G1 X97.447 Y99.892 E.05833
M73 P82 R0
G1 X97.447 Y100.492 E.01508
G1 X80.766 Y100.492 E.41936
G1 X80.766 Y99.892 E.01508
G1 X78.446 Y99.892 E.05833
G1 X78.446 Y100.492 E.01508
G1 X76.617 Y100.492 E.046
G1 X76.616 Y90.679 E.24671
G1 X78.096 Y93.242 E.07441
; WIPE_START
G1 F11668.197
M204 S6000
G1 X79.851 Y92.282 E-.76
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

G1 X102.766 Y90.613
G1 Z1.26
G1 E.8 F1800
; FEATURE: Top surface
G1 F7913
M204 S2000
G1 X103.383 Y89.996 E.02195
G1 X103.383 Y89.45
G1 X102.409 Y90.424 E.03461
G1 X102.053 Y90.234
G1 X103.383 Y88.905 E.04727
G1 X103.383 Y88.36
G1 X101.697 Y90.045 E.05992
G1 X101.341 Y89.856
G1 X103.383 Y87.814 E.07258
G1 X103.383 Y87.269
G1 X100.985 Y89.666 E.08524
G1 X100.629 Y89.477
G1 X103.382 Y86.724 E.0979
G1 X103.382 Y86.178
G1 X100.273 Y89.288 E.11055
G1 X99.917 Y89.098
G1 X103.382 Y85.633 E.12321
G1 X103.245 Y85.225
G1 X99.561 Y88.909 E.13098
G1 X99.205 Y88.72
G1 X102.7 Y85.225 E.12426
G1 X102.155 Y85.225
G1 X98.849 Y88.53 E.11754
G1 X98.493 Y88.341
G1 X101.609 Y85.224 E.11082
G1 X101.184 Y85.104
G1 X98.137 Y88.152 E.10837
M73 P83 R0
G1 X97.78 Y87.962
G1 X101.184 Y84.558 E.12103
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.77 Y85.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I1.159 J.372 P1  F42000
G1 X100.029 Y85.169 Z1.66
G1 Z1.26
G1 E.8 F1800
G1 F7913
M204 S2000
G1 X101.184 Y84.013 E.04109
G1 X100.828 Y83.824
G1 X100.029 Y84.623 E.02842
G1 X99.973 Y85.224
G1 X97.424 Y87.773 E.09062
G1 X97.068 Y87.584
G1 X99.428 Y85.224 E.08389
G1 X98.882 Y85.224
G1 X96.712 Y87.394 E.07716
G1 X96.356 Y87.205
G1 X98.337 Y85.224 E.07043
G1 X97.792 Y85.224
G1 X96 Y87.016 E.0637
G1 X95.644 Y86.826
G1 X97.384 Y85.086 E.06188
G1 X97.384 Y84.541
G1 X95.288 Y86.637 E.07454
G1 X94.932 Y86.448
G1 X97.355 Y84.024 E.08617
G1 X96.81 Y84.024
G1 X95.829 Y85.006 E.03489
G1 X95.829 Y84.46
G1 X96.265 Y84.024 E.0155
; WIPE_START
G1 F11668.197
M204 S6000
G1 X95.829 Y84.46 E-.23428
G1 X95.829 Y85.006 E-.20725
G1 X96.421 Y84.413 E-.31846
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-.861 J-.861 P1  F42000
G1 X95.61 Y85.224 Z1.66
G1 Z1.26
G1 E.8 F1800
G1 F7913
M204 S2000
G1 X94.576 Y86.258 E.03677
G1 X94.22 Y86.069
G1 X95.065 Y85.224 E.03004
G1 X94.519 Y85.224
G1 X93.864 Y85.88 E.02331
G1 X93.508 Y85.69
G1 X93.974 Y85.224 E.01657
M204 S10000
G1 X93.173 Y85.217 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.225519
G1 F7913
M204 S6000
G1 X93.23 Y85.339 E.00167
; LINE_WIDTH: 0.179999
G1 X93.287 Y85.46 E.00127
; LINE_WIDTH: 0.134479
G1 X93.344 Y85.581 E.00087
; LINE_WIDTH: 0.0961682
G1 X93.447 Y85.658 E.00052
; WIPE_START
G1 F18000
G1 X93.344 Y85.581 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.215 J1.198 P1  F42000
G1 X95.938 Y85.115 Z1.66
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.11094
G1 F7913
M204 S6000
M73 P84 R0
G1 X95.719 Y85.333 E.00154
; WIPE_START
G1 F18000
G1 X95.938 Y85.115 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-1.086 J.55 P1  F42000
G1 X103.384 Y99.811 Z1.66
G1 Z1.26
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F7913
M204 S2000
G1 X102.916 Y100.28 E.01666
G1 X102.37 Y100.28
G1 X103.384 Y99.266 E.03605
G1 X103.384 Y98.721
G1 X101.825 Y100.28 E.05544
G1 X101.28 Y100.28
G1 X103.384 Y98.176 E.07483
G1 X103.384 Y97.63
G1 X100.734 Y100.28 E.09422
G1 X100.189 Y100.28
G1 X103.384 Y97.085 E.11361
G1 X103.384 Y96.54
G1 X99.979 Y99.945 E.12107
G1 X99.698 Y99.68
G1 X103.384 Y95.994 E.13105
G1 X103.384 Y95.449
G1 X99.153 Y99.68 E.15044
G1 X98.607 Y99.68
G1 X103.384 Y94.904 E.16983
G1 X103.384 Y94.358
G1 X98.062 Y99.68 E.18922
G1 X97.516 Y99.68
G1 X101.159 Y96.038 E.1295
G1 X100.803 Y95.848
G1 X96.371 Y100.28 E.15757
G1 X95.826 Y100.28
G1 X100.446 Y95.659 E.1643
G1 X100.09 Y95.47
G1 X95.28 Y100.28 E.17103
G1 X94.735 Y100.28
G1 X99.734 Y95.28 E.17776
G1 X99.378 Y95.091
G1 X94.189 Y100.28 E.18449
M73 P85 R0
G1 X93.644 Y100.28
G1 X99.022 Y94.902 E.19123
G1 X98.666 Y94.712
G1 X93.098 Y100.28 E.19796
G1 X92.553 Y100.28
G1 X98.31 Y94.523 E.20469
G1 X97.954 Y94.334
G1 X92.008 Y100.28 E.21142
G1 X91.462 Y100.28
G1 X97.598 Y94.144 E.21815
G1 X97.242 Y93.955
G1 X90.917 Y100.28 E.22488
G1 X90.371 Y100.28
G1 X96.886 Y93.766 E.23162
G1 X96.53 Y93.576
G1 X89.826 Y100.28 E.23835
G1 X89.281 Y100.28
G1 X96.174 Y93.387 E.24508
G1 X95.817 Y93.198
G1 X88.735 Y100.28 E.25181
G1 X88.19 Y100.28
G1 X95.461 Y93.008 E.25854
G1 X95.105 Y92.819
G1 X87.644 Y100.28 E.26527
G1 X87.099 Y100.28
G1 X94.749 Y92.63 E.27201
G1 X94.393 Y92.44
G1 X86.554 Y100.28 E.27874
M73 P86 R0
G1 X86.008 Y100.28
G1 X94.037 Y92.251 E.28547
G1 X93.681 Y92.062
G1 X85.463 Y100.28 E.2922
G1 X84.917 Y100.28
G1 X93.325 Y91.872 E.29893
G1 X92.969 Y91.683
G1 X84.372 Y100.28 E.30566
G1 X83.827 Y100.28
G1 X92.613 Y91.494 E.3124
G1 X92.257 Y91.305
G1 X83.281 Y100.28 E.31913
G1 X82.736 Y100.28
G1 X91.901 Y91.115 E.32586
G1 X91.545 Y90.926
G1 X82.19 Y100.28 E.33259
G1 X81.645 Y100.28
G1 X91.188 Y90.737 E.33932
G1 X90.832 Y90.547
G1 X81.1 Y100.28 E.34605
G1 X80.979 Y99.856
G1 X90.476 Y90.358 E.33769
M73 P87 R0
G1 X90.12 Y90.169
G1 X80.609 Y99.68 E.33818
G1 X80.063 Y99.68
G1 X89.764 Y89.979 E.34492
G1 X89.408 Y89.79
G1 X79.518 Y99.68 E.35165
G1 X78.973 Y99.68
G1 X89.052 Y89.601 E.35838
G1 X88.696 Y89.411
G1 X78.427 Y99.68 E.36511
G1 X78.234 Y99.873
G1 X77.827 Y100.28 E.01448
G1 X77.282 Y100.28
G1 X88.34 Y89.222 E.39317
G1 X87.984 Y89.033
G1 X76.829 Y100.188 E.39663
G1 X76.829 Y99.642
G1 X87.628 Y88.843 E.38397
G1 X87.272 Y88.654
G1 X76.829 Y99.097 E.3713
G1 X76.829 Y98.552
G1 X83.503 Y91.877 E.23731
G1 X82.588 Y92.247
G1 X76.829 Y98.006 E.20478
M73 P88 R0
G1 X76.829 Y97.461
G1 X81.928 Y92.361 E.18133
G1 X81.377 Y92.367
G1 X76.829 Y96.915 E.16171
G1 X76.829 Y96.37
G1 X80.892 Y92.307 E.14447
G1 X80.455 Y92.199
G1 X76.829 Y95.825 E.12892
G1 X76.829 Y95.279
G1 X79.173 Y92.935 E.08334
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.758 Y94.349 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I1.157 J.378 P1  F42000
G1 X78.023 Y93.539 Z1.66
G1 Z1.26
G1 E.8 F1800
G1 F7913
M204 S2000
G1 X76.829 Y94.734 E.04246
G1 X76.829 Y94.188
G1 X77.823 Y93.194 E.03537
G1 X77.624 Y92.848
G1 X76.829 Y93.643 E.02827
G1 X76.829 Y93.097
G1 X77.424 Y92.502 E.02117
G1 X77.224 Y92.156
G1 X76.829 Y92.552 E.01407
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.224 Y92.156 E-.2127
G1 X77.424 Y92.502 E-.15172
G1 X76.829 Y93.097 E-.31998
G1 X76.829 Y93.296 E-.07559
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.408 J1.147 P1  F42000
G1 X84.983 Y90.397 Z1.66
G1 Z1.26
G1 E.8 F1800
G1 F7913
M204 S2000
G1 X86.915 Y88.465 E.06869
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.501 Y89.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-.399 J1.15 P1  F42000
G1 X101.695 Y95.502 Z1.66
G1 Z1.26
G1 E.8 F1800
G1 F7913
M204 S2000
G1 X103.383 Y93.813 E.06004
G1 X103.383 Y93.268
G1 X102.314 Y94.337 E.03802
; WIPE_START
G1 F11668.197
M204 S6000
G1 X103.383 Y93.268 E-.57466
M73 P89 R0
G1 X103.383 Y93.755 E-.18534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I1.216 J.042 P1  F42000
G1 X103.403 Y93.202 Z1.66
G1 Z1.26
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.235006
G1 F7913
M204 S6000
G1 X103.354 Y93.13 E.00114
; LINE_WIDTH: 0.271591
G1 X103.305 Y93.057 E.00135
; LINE_WIDTH: 0.308177
G1 X103.257 Y92.985 E.00155
; LINE_WIDTH: 0.336744
G2 X103.147 Y93.031 I-.036 J.069 E.00267
; LINE_WIDTH: 0.293752
G1 X103.049 Y93.164 E.00279
; LINE_WIDTH: 0.246388
G1 X102.951 Y93.296 E.00228
; LINE_WIDTH: 0.199024
G1 X102.853 Y93.429 E.00177
; LINE_WIDTH: 0.15166
M73 P90 R0
G1 X102.755 Y93.561 E.00126
; LINE_WIDTH: 0.104296
G1 X102.657 Y93.694 E.00075
; WIPE_START
G1 F18000
G1 X102.755 Y93.561 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.21 J-1.199 P1  F42000
G1 X85.046 Y90.459 Z1.66
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.211312
G1 F7913
M204 S6000
G1 X84.944 Y90.59 E.00192
; LINE_WIDTH: 0.182558
G1 X84.822 Y90.74 E.00186
; LINE_WIDTH: 0.136275
G1 X84.57 Y91.026 E.00254
; LINE_WIDTH: 0.109565
G1 X84.03 Y91.557 E.00372
; LINE_WIDTH: 0.140835
G1 X83.883 Y91.685 E.00135
; LINE_WIDTH: 0.172625
G1 X83.734 Y91.808 E.00174
; LINE_WIDTH: 0.205231
G1 X83.566 Y91.94 E.00239
; WIPE_START
G1 F18000
G1 X83.734 Y91.808 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.984 J.716 P1  F42000
G1 X85.652 Y89.172 Z1.66
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.141184
G1 F7913
M204 S6000
G1 X85.238 Y89.847 E.00551
M204 S10000
G1 X85.629 Y89.185 F42000
; LINE_WIDTH: 0.238425
G1 F7913
M204 S6000
G1 X85.243 Y89.85 E.01022
; WIPE_START
G1 F18000
G1 X85.629 Y89.185 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.575 J1.072 P1  F42000
G1 X86.2 Y88.879 Z1.66
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.103458
G1 F7913
M204 S6000
G1 X86.022 Y89.015 E.00101
; LINE_WIDTH: 0.149156
G1 X85.844 Y89.152 E.00168
; LINE_WIDTH: 0.194854
G1 X85.666 Y89.289 E.00235
; LINE_WIDTH: 0.240551
G1 X85.488 Y89.425 E.00302
; LINE_WIDTH: 0.286249
G1 X85.31 Y89.562 E.00369
; WIPE_START
G1 F17863.353
G1 X85.488 Y89.425 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-.43 J1.139 P1  F42000
G1 X101.757 Y95.564 Z1.66
G1 Z1.26
M73 P91 R0
G1 E.8 F1800
; LINE_WIDTH: 0.192946
G1 F7913
M204 S6000
G1 X101.644 Y95.717 E.00197
; LINE_WIDTH: 0.148013
G1 X101.531 Y95.87 E.00141
; LINE_WIDTH: 0.10308
G1 X101.418 Y96.023 E.00085
; WIPE_START
G1 F18000
G1 X101.531 Y95.87 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I1.055 J.607 P1  F42000
G1 X102.377 Y94.4 Z1.66
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.192946
G1 F7913
M204 S6000
G1 X102.264 Y94.552 E.00197
; LINE_WIDTH: 0.148013
G1 X102.15 Y94.705 E.00141
; LINE_WIDTH: 0.10308
G1 X102.037 Y94.858 E.00085
; WIPE_START
G1 F18000
G1 X102.15 Y94.705 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-1.132 J-.447 P1  F42000
G1 X100.05 Y100.017 Z1.66
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.146586
G1 F7913
M204 S6000
G1 X100.014 Y100.105 E.0007
G1 X100.014 Y100.299 E.00142
; WIPE_START
G1 F18000
G1 X100.014 Y100.105 E-.50904
G1 X100.05 Y100.017 E-.25096
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.399 J-1.15 P1  F42000
G1 X77.183 Y92.087 Z1.66
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.0926789
G1 F7913
M204 S6000
G1 X77.113 Y91.995 E.00044
; LINE_WIDTH: 0.129616
G1 X77.066 Y91.964 E.00035
; LINE_WIDTH: 0.158621
G1 X76.809 Y92.079 E.00228
; WIPE_START
G1 F18000
G1 X77.066 Y91.964 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-.859 J.862 P1  F42000
G1 X78.457 Y93.349 Z1.66
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.103631
G1 F7913
M204 S6000
G1 X78.281 Y93.485 E.00101
; LINE_WIDTH: 0.149675
G1 X78.104 Y93.62 E.00168
; WIPE_START
G1 F18000
G1 X78.281 Y93.485 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.626 J1.043 P1  F42000
G1 X79.748 Y92.604 Z1.66
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.103681
G1 F7913
M204 S6000
G1 X79.577 Y92.735 E.00097
; LINE_WIDTH: 0.149826
G1 X79.406 Y92.866 E.00162
; LINE_WIDTH: 0.19597
G1 X79.235 Y92.997 E.00227
; WIPE_START
G1 F18000
G1 X79.406 Y92.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.332 J1.171 P1  F42000
G1 X81.079 Y92.392 Z1.66
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.113001
G1 F7913
M204 S6000
G1 X80.916 Y92.309 E.00094
; WIPE_START
G1 F18000
G1 X81.079 Y92.392 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.074 J1.215 P1  F42000
G1 X82.219 Y92.323 Z1.66
G1 Z1.26
G1 E.8 F1800
; LINE_WIDTH: 0.132221
G1 F7913
M204 S6000
G1 X81.998 Y92.431 E.00157
; WIPE_START
G1 F18000
G1 X82.219 Y92.323 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I1.185 J-.278 P1  F42000
G1 X80.506 Y85.012 Z1.66
G1 Z1.26
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7913
M204 S5000
G1 X80.374 Y85.056 E.00349
G2 X79.071 Y85.864 I1.244 J3.459 E.03884
G1 X79.071 Y85.012 E.02142
G1 X80.446 Y85.012 E.03456
M204 S10000
G1 X79.521 Y85.231 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12765
G1 F7913
M204 S6000
G1 X79.272 Y85.306 E.00158
; WIPE_START
G1 F18000
G1 X79.521 Y85.231 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-1.001 J-.692 P1  F42000
G1 X78.223 Y87.107 Z1.66
G1 Z1.26
M73 P92 R0
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7913
M204 S5000
G1 X78.147 Y87.311 E.00546
G2 X78.017 Y87.792 I5.309 J1.69 E.01253
G1 X76.616 Y88.6 E.04066
G1 X76.616 Y87.107 E.03754
G1 X78.163 Y87.107 E.03888
M204 S10000
G1 X77.698 Y87.319 F42000
; FEATURE: Top surface
G1 F7913
M204 S2000
G1 X76.829 Y88.189 E.03092
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.698 Y87.319 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-.959 J.75 P1  F42000
G1 X77.875 Y87.545 Z1.66
G1 Z1.26
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.168699
G1 F7913
M204 S6000
G1 X77.73 Y87.657 E.0016
; LINE_WIDTH: 0.133463
G1 X77.585 Y87.768 E.00118
; LINE_WIDTH: 0.0982272
G1 X77.439 Y87.879 E.00076
M204 S10000
G1 X77.875 Y87.3 F42000
; LINE_WIDTH: 0.106197
G1 F7913
M204 S6000
G1 X77.839 Y87.672 E.00175
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F18000
G1 X77.875 Y87.3 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I1.217 J0 P1  F42000
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z1.76 F900 ; lower z a little
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
M73 P93 R0
G1 Y-3
T255
G1 X65 F12000
G1 Y265
M73 P94 R0
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

    G1 Z101.26 F600
    G1 Z99.26

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


; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 1m 22s; total estimated time: 1m 41s
; total layer number: 8
; total filament length [mm] : 78.03
; total filament volume [cm^3] : 187.68
; total filament weight [g] : 0.23
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 1.26
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
M73 P8 R1
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
; layer num/total_layer_count: 1/8
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
M73 P15 R1
G1 X82.438 Y86.97 F42000
M204 S6000
M73 P18 R1
G1 Z.4
G1 Z.14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X77.02 Y89.851 E.16449
G1 X77.02 Y84.926 E.132
G1 X83.02 Y84.926 E.16084
G1 X83.02 Y83.726 E.03217
M73 P19 R1
G1 X83.98 Y83.726 E.02574
G1 X83.98 Y84.926 E.03217
G1 X85.826 Y84.926 E.04948
G1 X85.879 Y85.14 E.00591
G1 X82.491 Y86.942 E.10287
; WIPE_START
G1 X80.725 Y87.881 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X87.596 Y84.557 Z.54 F42000
G1 X89.45 Y83.66 Z.54
G1 Z.14
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X89.933 Y83.404 E.01465
G1 X89.979 Y83.492 E.00268
G1 X76.55 Y90.633 E.40773
G1 X76.55 Y84.456 E.16557
G1 X82.55 Y84.456 E.16084
M73 P20 R1
G1 X82.55 Y83.256 E.03217
G1 X84.45 Y83.256 E.05093
G1 X84.45 Y84.456 E.03217
G1 X87.55 Y84.456 E.0831
G1 X87.55 Y83.256 E.03217
G1 X89.45 Y83.256 E.05093
M73 P21 R1
G1 X89.45 Y83.6 E.00922
; WIPE_START
G1 X89.933 Y83.404 E-.19798
G1 X89.979 Y83.492 E-.038
G1 X88.762 Y84.14 E-.52402
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X96.373 Y84.705 Z.54 F42000
G1 X99.359 Y84.926 Z.54
G1 Z.14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X100.525 Y84.926 E.03125
G1 X100.525 Y87.021 E.05616
G1 X102.98 Y87.021 E.06581
G1 X102.98 Y99.386 E.33147
G1 X102.17 Y99.386 E.02172
G1 X102.17 Y98.786 E.01608
M73 P22 R1
G1 X98.83 Y98.786 E.08953
G1 X98.83 Y99.386 E.01608
G1 X83.17 Y99.386 E.4198
G1 X83.17 Y98.786 E.01608
G1 X79.83 Y98.786 E.08953
G1 X79.83 Y99.386 E.01608
G1 X77.02 Y99.386 E.07533
G1 X77.02 Y93.378 E.16107
G1 X77.234 Y93.325 E.00591
M73 P23 R1
G1 X78.629 Y95.949 E.07967
G1 X99.306 Y84.955 E.62778
M204 S6000
G1 X99.316 Y84.456 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X100.995 Y84.456 E.045
G1 X100.995 Y86.551 E.05616
G1 X103.45 Y86.551 E.06581
G1 X103.45 Y99.856 E.35666
M73 P24 R1
G1 X101.7 Y99.856 E.04691
G1 X101.7 Y99.256 E.01608
G1 X99.3 Y99.256 E.06434
G1 X99.3 Y99.856 E.01608
G1 X82.7 Y99.856 E.44499
G1 X82.7 Y99.256 E.01608
G1 X80.3 Y99.256 E.06434
M73 P25 R1
G1 X80.3 Y99.856 E.01608
G1 X76.55 Y99.856 E.10053
G1 X76.55 Y91.038 E.2364
G1 X78.823 Y95.313 E.12981
G1 X99.242 Y84.456 E.61993
G1 X99.256 Y84.456 E.00038
; WIPE_START
G1 X100.995 Y84.456 E-.6607
M73 P26 R1
G1 X100.995 Y84.718 E-.09931
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

G1 X100.337 Y85.716
G1 Z.14
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.505664
G1 F6300
M204 S500
G1 X99.947 Y85.326 E.01498
G1 X99.459 Y85.326 E.01323
G1 X99.338 Y85.39 E.00371
G1 X100.337 Y86.389 E.03833
; WIPE_START
G1 X99.338 Y85.39 E-.53686
G1 X99.459 Y85.326 E-.05196
G1 X99.909 Y85.326 E-.17118
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X101.83 Y87.209 Z.54 F42000
G1 Z.14
G1 E.8 F1800
M73 P27 R1
G1 F6300
M204 S500
G1 X102.581 Y87.96 E.0288
G1 X102.581 Y88.632 E.01825
G1 X101.158 Y87.209 E.0546
; WIPE_START
G1 X102.572 Y88.623 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X102.792 Y89.517 Z.54 F42000
G1 Z.14
G1 E.8 F1800
G1 F6300
M204 S500
G1 X100.696 Y87.421 E.08041
G1 X100.126 Y87.421 E.01548
G1 X100.126 Y86.85 E.01548
G1 X98.899 Y85.623 E.04706
G1 X98.46 Y85.857 E.01349
G1 X102.581 Y89.978 E.1581
G1 X102.581 Y90.65 E.01825
G1 X98.021 Y86.09 E.17495
G1 X97.582 Y86.324 E.01349
G1 X102.581 Y91.323 E.1918
M73 P28 R1
G1 X102.581 Y91.996 E.01825
G1 X97.143 Y86.557 E.20865
G1 X96.703 Y86.791 E.01349
G1 X102.581 Y92.668 E.2255
G1 X102.581 Y93.341 E.01825
G1 X96.264 Y87.024 E.24235
G1 X95.825 Y87.258 E.01349
G1 X102.581 Y94.013 E.25919
M73 P29 R1
G1 X102.581 Y94.686 E.01825
G1 X95.386 Y87.491 E.27604
G1 X94.947 Y87.725 E.01349
G1 X102.581 Y95.359 E.29289
G1 X102.581 Y96.031 E.01825
G1 X94.508 Y87.958 E.30974
G1 X94.069 Y88.192 E.01349
M73 P30 R1
G1 X102.581 Y96.704 E.32659
G1 X102.581 Y97.377 E.01825
G1 X93.629 Y88.425 E.34344
G1 X93.19 Y88.659 E.01349
G1 X102.581 Y98.049 E.36029
G1 X102.581 Y98.722 E.01825
G1 X92.751 Y88.892 E.37713
M73 P31 R1
G1 X92.312 Y89.126 E.01349
G1 X101.573 Y98.387 E.35534
G1 X100.901 Y98.387 E.01825
G1 X91.873 Y89.359 E.34638
G1 X91.434 Y89.593 E.01349
G1 X100.228 Y98.387 E.33742
M73 P32 R1
G1 X99.556 Y98.387 E.01825
G1 X90.995 Y89.826 E.32846
G1 X90.556 Y90.06 E.01349
G1 X98.883 Y98.387 E.3195
G1 X98.431 Y98.387 E.01227
G1 X98.431 Y98.608 E.00598
M73 P33 R1
G1 X90.116 Y90.293 E.319
G1 X89.677 Y90.527 E.01349
G1 X98.138 Y98.987 E.3246
G1 X97.465 Y98.987 E.01825
G1 X89.238 Y90.76 E.31565
G1 X88.799 Y90.994 E.01349
G1 X96.792 Y98.987 E.30669
M73 P34 R1
G1 X96.12 Y98.987 E.01825
G1 X88.36 Y91.227 E.29773
G1 X87.921 Y91.461 E.01349
G1 X95.447 Y98.987 E.28877
G1 X94.775 Y98.987 E.01825
G1 X87.482 Y91.694 E.27981
G1 X87.042 Y91.928 E.01349
G1 X94.102 Y98.987 E.27085
M73 P35 R1
G1 X93.429 Y98.987 E.01825
G1 X86.603 Y92.161 E.26189
G1 X86.164 Y92.395 E.01349
G1 X92.757 Y98.987 E.25294
G1 X92.084 Y98.987 E.01825
G1 X85.725 Y92.628 E.24398
M73 P36 R1
G1 X85.286 Y92.862 E.01349
G1 X91.411 Y98.987 E.23502
G1 X90.739 Y98.987 E.01825
G1 X84.847 Y93.095 E.22606
G1 X84.408 Y93.329 E.01349
G1 X90.066 Y98.987 E.2171
G1 X89.394 Y98.987 E.01825
G1 X83.969 Y93.562 E.20814
M73 P37 R1
G1 X83.529 Y93.796 E.01349
G1 X88.721 Y98.987 E.19919
G1 X88.048 Y98.987 E.01825
G1 X83.09 Y94.029 E.19023
G1 X82.651 Y94.263 E.01349
G1 X87.376 Y98.987 E.18127
G1 X86.703 Y98.987 E.01825
G1 X82.212 Y94.496 E.17231
M73 P38 R1
G1 X81.773 Y94.73 E.01349
G1 X86.03 Y98.987 E.16335
G1 X85.358 Y98.987 E.01825
G1 X81.334 Y94.963 E.15439
G1 X80.895 Y95.197 E.01349
G1 X84.685 Y98.987 E.14543
G1 X84.012 Y98.987 E.01825
G1 X80.455 Y95.43 E.13648
G1 X80.016 Y95.664 E.01349
G1 X82.74 Y98.387 E.1045
M73 P39 R1
G1 X82.067 Y98.387 E.01825
G1 X79.577 Y95.897 E.09554
G1 X79.138 Y96.131 E.01349
G1 X81.395 Y98.387 E.08658
G1 X80.722 Y98.387 E.01825
G1 X77.419 Y95.084 E.12672
G1 X77.419 Y95.757 E.01825
G1 X80.049 Y98.387 E.10091
G1 X79.431 Y98.387 E.01678
G1 X79.431 Y98.441 E.00146
G1 X77.419 Y96.43 E.07717
G1 X77.419 Y97.102 E.01825
G1 X79.304 Y98.987 E.07231
M73 P40 R1
G1 X78.631 Y98.987 E.01825
G1 X77.419 Y97.775 E.04651
G1 X77.419 Y98.448 E.01825
G1 X78.17 Y99.199 E.02881
; WIPE_START
G1 X77.419 Y98.448 E-.4036
G1 X77.419 Y97.775 E-.2556
G1 X77.607 Y97.963 E-.1008
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X80.799 Y91.029 Z.54 F42000
G1 X83.5 Y85.161 Z.54
G1 Z.14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.520204
G1 F3000
M204 S500
G1 X83.5 Y83.961 E.03355
; WIPE_START
G1 X83.5 Y85.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X84.151 Y85.114 Z.54 F42000
G1 Z.14
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.519834
G1 F6300
M204 S500
G1 X84.472 Y85.436 E.01271
M73 P41 R1
G1 X84.02 Y85.676 E.01431
G1 X83.904 Y85.561 E.00457
G1 X83.212 Y85.561 E.01935
G1 X83.568 Y85.917 E.01407
G1 X83.116 Y86.157 E.01431
G1 X82.284 Y85.326 E.03285
G1 X81.591 Y85.326 E.01935
G1 X82.663 Y86.398 E.04235
G1 X82.211 Y86.638 E.01431
G1 X80.899 Y85.326 E.05185
G1 X80.206 Y85.326 E.01935
G1 X81.759 Y86.879 E.06135
G1 X81.307 Y87.119 E.01431
G1 X79.513 Y85.326 E.07085
M73 P41 R0
G1 X78.821 Y85.326 E.01935
G1 X80.855 Y87.359 E.08035
G1 X80.402 Y87.6 E.01431
G1 X78.128 Y85.326 E.08985
G1 X77.435 Y85.326 E.01935
G1 X79.95 Y87.84 E.09935
M73 P42 R0
G1 X79.498 Y88.081 E.01431
G1 X77.419 Y86.002 E.08213
G1 X77.419 Y86.695 E.01935
G1 X79.046 Y88.321 E.06426
G1 X78.593 Y88.562 E.01431
G1 X77.419 Y87.388 E.04639
G1 X77.419 Y88.08 E.01935
G1 X78.141 Y88.802 E.02852
G1 X77.689 Y89.043 E.01431
G1 X77.208 Y88.561 E.01901
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6300
G1 X77.689 Y89.043 E-.2586
G1 X78.141 Y88.802 E-.19462
G1 X77.57 Y88.231 E-.30678
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/8
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.54 I.422 J1.142 P1  F42000
M73 P43 R0
G1 X89.316 Y83.89 Z.54
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9558
M204 S5000
G1 X76.51 Y90.699 E.36464
G1 X76.51 Y84.417 E.15795
G1 X82.51 Y84.416 E.15084
G1 X82.51 Y83.216 E.03017
G1 X84.49 Y83.216 E.04978
G1 X84.49 Y84.416 E.03017
G1 X87.51 Y84.416 E.07593
G1 X87.51 Y83.216 E.03017
G1 X89.49 Y83.216 E.04978
G1 X89.49 Y83.594 E.00949
G1 X89.949 Y83.35 E.01307
G1 X90.034 Y83.509 E.00453
G1 X89.369 Y83.862 E.01893
; WIPE_START
G1 F11668.197
M204 S6000
G1 X87.603 Y84.801 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.231 Y84.551 Z.7 F42000
G1 X99.338 Y84.416 Z.7
G1 Z.3
G1 E.8 F1800
G1 F9558
M204 S5000
G1 X101.035 Y84.416 E.04268
G1 X101.035 Y86.511 E.05267
G1 X103.49 Y86.511 E.06172
G1 X103.49 Y99.896 E.33651
G1 X101.66 Y99.896 E.04601
M73 P44 R0
G1 X101.66 Y99.296 E.01508
G1 X99.34 Y99.296 E.05833
G1 X99.34 Y99.896 E.01508
G1 X82.66 Y99.896 E.41936
G1 X82.66 Y99.296 E.01508
G1 X80.34 Y99.296 E.05833
G1 X80.34 Y99.896 E.01508
G1 X76.51 Y99.896 E.09628
G1 X76.51 Y90.877 E.22675
G1 X78.84 Y95.259 E.12477
G1 X99.232 Y84.416 E.58066
G1 X99.278 Y84.416 E.00114
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.035 Y84.416 E-.66783
G1 X101.035 Y84.659 E-.09217
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

G1 X88.669 Y83.429
G1 Z.3
G1 E.8 F1800
; FEATURE: Top surface
M73 P45 R0
G1 F9558
M204 S2000
G1 X87.938 Y84.159 E.02599
G1 X87.722 Y83.83
G1 X88.124 Y83.429 E.01428
M204 S10000
G1 X88.709 Y83.409 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230101
G1 F9558
M204 S6000
G1 X88.813 Y83.468 E.00153
; LINE_WIDTH: 0.256792
G1 X88.917 Y83.527 E.00174
; LINE_WIDTH: 0.246202
G1 X88.886 Y83.571 E.00074
; LINE_WIDTH: 0.198315
G1 X88.855 Y83.614 E.00057
; LINE_WIDTH: 0.15092
G1 X88.718 Y83.716 E.00129
; LINE_WIDTH: 0.104046
G1 X88.581 Y83.817 E.00077
; WIPE_START
G1 F18000
G1 X88.718 Y83.716 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.917 Y84.635 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9558
M204 S2000
G1 X86.297 Y85.255 E.02204
; WIPE_START
G1 F11668.197
M204 S6000
G1 X86.917 Y84.635 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.132 Y85.875 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9558
M204 S2000
G1 X86.378 Y84.629 E.0443
G1 X85.833 Y84.629
G1 X83.968 Y86.494 E.06632
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.382 Y85.08 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.803 Y87.113 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9558
M204 S2000
G1 X85.287 Y84.629 E.08834
G1 X84.742 Y84.629
G1 X81.638 Y87.732 E.11036
; WIPE_START
G1 F11668.197
M204 S6000
G1 X83.052 Y86.318 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.474 Y88.352 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9558
M204 S2000
M73 P46 R0
G1 X84.278 Y84.547 E.13526
G1 X84.278 Y84.002
G1 X79.503 Y88.777 E.16976
G1 X78.621 Y89.114
G1 X84.278 Y83.456 E.20114
G1 X83.76 Y83.429
G1 X82.722 Y84.467 E.03692
G1 X82.722 Y83.921
G1 X83.215 Y83.429 E.01753
; WIPE_START
G1 F11668.197
M204 S6000
G1 X82.722 Y83.921 E-.26489
G1 X82.722 Y84.467 E-.20725
G1 X83.258 Y83.931 E-.28786
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.56 Y84.629 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9558
M204 S2000
G1 X77.456 Y89.733 E.18148
G1 X76.722 Y89.921
G1 X82.015 Y84.629 E.18819
G1 X81.47 Y84.629
G1 X76.722 Y89.376 E.1688
G1 X76.722 Y88.831
G1 X80.924 Y84.629 E.14941
M73 P47 R0
G1 X80.379 Y84.629
G1 X76.722 Y88.285 E.13001
G1 X76.722 Y87.74
G1 X79.833 Y84.629 E.11062
G1 X79.288 Y84.629
G1 X76.722 Y87.194 E.09123
G1 X76.722 Y86.649
G1 X78.743 Y84.629 E.07184
G1 X78.197 Y84.629
G1 X76.722 Y86.104 E.05245
G1 X76.722 Y85.558
G1 X77.652 Y84.629 E.03305
G1 X77.106 Y84.629
G1 X76.722 Y85.013 E.01366
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.106 Y84.629 E-.2065
G1 X77.652 Y84.629 E-.20726
G1 X77.007 Y85.273 E-.34625
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.64 Y85.206 Z.7 F42000
G1 X86.234 Y85.193 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192949
G1 F9558
M204 S6000
G1 X86.081 Y85.306 E.00197
; LINE_WIDTH: 0.148013
G1 X85.928 Y85.419 E.00141
; LINE_WIDTH: 0.103077
G1 X85.775 Y85.532 E.00085
; WIPE_START
G1 F18000
G1 X85.928 Y85.419 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.197 Y89.016 Z.7 F42000
M73 P48 R0
G1 X77.401 Y89.975 Z.7
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.122197
G1 F9558
M204 S6000
G1 X77.203 Y90.052 E.00122
; LINE_WIDTH: 0.169939
G1 X77.005 Y90.129 E.00188
; LINE_WIDTH: 0.218439
G1 X76.806 Y90.206 E.00255
G1 X76.792 Y90.195 E.00021
; LINE_WIDTH: 0.195048
G1 X76.774 Y90.169 E.00033
; LINE_WIDTH: 0.158112
G1 X76.755 Y90.143 E.00026
; LINE_WIDTH: 0.121177
G1 X76.737 Y90.117 E.00018
; LINE_WIDTH: 0.0916505
G1 X76.723 Y90.006 E.00042
; WIPE_START
G1 F18000
G1 X76.737 Y90.117 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.558 Y89.051 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.192946
G1 F9558
M204 S6000
G1 X78.405 Y89.164 E.00197
; LINE_WIDTH: 0.148011
G1 X78.252 Y89.277 E.00141
; LINE_WIDTH: 0.103076
G1 X78.099 Y89.39 E.00085
; WIPE_START
G1 F18000
G1 X78.252 Y89.277 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.411 Y88.289 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.192951
G1 F9558
M204 S6000
G1 X80.258 Y88.402 E.00197
; LINE_WIDTH: 0.148014
G1 X80.105 Y88.515 E.00141
; LINE_WIDTH: 0.103078
G1 X79.952 Y88.628 E.00085
; WIPE_START
G1 F18000
G1 X80.105 Y88.515 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.576 Y87.67 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.192948
G1 F9558
M204 S6000
G1 X81.423 Y87.783 E.00197
; LINE_WIDTH: 0.148012
G1 X81.27 Y87.896 E.00141
; LINE_WIDTH: 0.103077
G1 X81.117 Y88.009 E.00085
; WIPE_START
G1 F18000
G1 X81.27 Y87.896 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.74 Y87.05 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.192951
G1 F9558
M204 S6000
G1 X82.587 Y87.164 E.00197
; LINE_WIDTH: 0.148014
G1 X82.434 Y87.277 E.00141
; LINE_WIDTH: 0.103078
G1 X82.281 Y87.39 E.00085
; WIPE_START
G1 F18000
G1 X82.434 Y87.277 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.905 Y86.431 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.192949
G1 F9558
M204 S6000
G1 X83.752 Y86.544 E.00197
; LINE_WIDTH: 0.148013
G1 X83.599 Y86.657 E.00141
; LINE_WIDTH: 0.103077
G1 X83.446 Y86.771 E.00085
; WIPE_START
G1 F18000
G1 X83.599 Y86.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.07 Y85.812 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.192958
G1 F9558
M204 S6000
G1 X84.917 Y85.925 E.00197
; LINE_WIDTH: 0.148019
G1 X84.764 Y86.038 E.00141
; LINE_WIDTH: 0.10308
G1 X84.611 Y86.151 E.00085
; WIPE_START
G1 F18000
G1 X84.764 Y86.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.802 Y90.707 Z.7 F42000
G1 X102.411 Y99.684 Z.7
G1 Z.3
M73 P49 R0
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9558
M204 S2000
G1 X103.278 Y98.817 E.03083
G1 X103.278 Y98.272
G1 X101.872 Y99.677 E.04998
G1 X101.872 Y99.132
G1 X103.278 Y97.726 E.04998
G1 X103.278 Y97.181
G1 X101.374 Y99.084 E.06768
G1 X100.829 Y99.084
G1 X103.278 Y96.635 E.08707
G1 X103.278 Y96.09
G1 X100.284 Y99.084 E.10647
G1 X99.738 Y99.084
G1 X103.278 Y95.545 E.12586
G1 X103.278 Y94.999
G1 X99.193 Y99.084 E.14525
G1 X99.128 Y99.149
G1 X98.593 Y99.684 E.01903
G1 X98.047 Y99.684
G1 X103.278 Y94.454 E.18597
G1 X103.278 Y93.908
G1 X97.502 Y99.684 E.20537
M73 P50 R0
G1 X96.957 Y99.684
G1 X103.278 Y93.363 E.22476
G1 X103.278 Y92.818
G1 X96.411 Y99.684 E.24415
G1 X95.866 Y99.684
G1 X103.278 Y92.272 E.26354
G1 X103.278 Y91.727
G1 X95.32 Y99.684 E.28294
G1 X94.775 Y99.684
G1 X103.278 Y91.181 E.30233
G1 X103.278 Y90.636
G1 X94.229 Y99.684 E.32172
G1 X93.684 Y99.684
M73 P51 R0
G1 X103.278 Y90.09 E.34111
G1 X103.278 Y89.545
G1 X93.139 Y99.684 E.3605
G1 X92.593 Y99.684
G1 X103.278 Y89 E.3799
G1 X103.278 Y88.454
G1 X92.048 Y99.684 E.39929
G1 X91.502 Y99.684
G1 X103.278 Y87.909 E.41868
G1 X103.278 Y87.363
G1 X90.957 Y99.684 E.43807
M73 P52 R0
G1 X90.412 Y99.684
G1 X103.278 Y86.818 E.45746
G1 X102.827 Y86.724
G1 X89.866 Y99.684 E.46082
G1 X89.321 Y99.684
G1 X102.282 Y86.724 E.46082
G1 X101.736 Y86.724
G1 X88.775 Y99.684 E.46082
G1 X88.23 Y99.684
G1 X101.191 Y86.724 E.46082
M73 P53 R0
G1 X100.823 Y86.546
G1 X87.685 Y99.684 E.46714
G1 X87.139 Y99.684
G1 X100.823 Y86.001 E.48653
G1 X100.823 Y85.455
G1 X86.594 Y99.684 E.50592
G1 X86.048 Y99.684
G1 X100.823 Y84.91 E.52531
G1 X100.559 Y84.629
G1 X85.503 Y99.684 E.53531
M73 P54 R0
G1 X84.958 Y99.684
G1 X100.013 Y84.629 E.53531
G1 X99.468 Y84.629
G1 X84.412 Y99.684 E.53531
G1 X83.867 Y99.684
G1 X98.511 Y85.04 E.52068
; WIPE_START
G1 F11668.197
M204 S6000
G1 X97.097 Y86.454 E-.76
; WIPE_END
M73 P55 R0
G1 E-.04 F1800
M204 S10000
G1 X97.346 Y85.659 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9558
M204 S2000
G1 X83.321 Y99.684 E.49866
G1 X82.872 Y99.588
G1 X96.182 Y86.279 E.47322
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.767 Y87.693 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.017 Y86.898 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9558
M204 S2000
G1 X82.831 Y99.084 E.43329
G1 X82.285 Y99.084
G1 X93.852 Y87.517 E.41127
; WIPE_START
G1 F11668.197
M204 S6000
G1 X92.438 Y88.931 E-.76
; WIPE_END
M73 P56 R0
G1 E-.04 F1800
M204 S10000
G1 X92.211 Y88.613 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9558
M204 S2000
G1 X81.74 Y99.084 E.37231
G1 X81.194 Y99.084
G1 X91.046 Y89.232 E.3503
G1 X90.358 Y89.375
G1 X80.649 Y99.084 E.34522
; WIPE_START
G1 F11668.197
M204 S6000
G1 X82.063 Y97.67 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.504 Y99.684 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9558
M204 S2000
G1 X89.194 Y89.994 E.34453
; WIPE_START
G1 F11668.197
M204 S6000
G1 X87.779 Y91.409 E-.76
; WIPE_END
M73 P57 R0
G1 E-.04 F1800
M204 S10000
G1 X88.029 Y90.614 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9558
M204 S2000
G1 X78.958 Y99.684 E.32251
G1 X78.413 Y99.684
G1 X86.864 Y91.233 E.30049
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.45 Y92.647 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.7 Y91.852 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9558
M204 S2000
G1 X77.867 Y99.684 E.27848
G1 X77.322 Y99.684
G1 X84.535 Y92.471 E.25646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X83.121 Y93.886 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.37 Y93.091 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9558
M204 S2000
G1 X76.777 Y99.684 E.23444
M73 P58 R0
G1 X76.722 Y99.193
G1 X81.729 Y94.186 E.17802
; WIPE_START
G1 F11668.197
M204 S6000
G1 X80.315 Y95.601 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.564 Y94.806 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9558
M204 S2000
G1 X76.722 Y98.648 E.13661
G1 X76.722 Y98.103
G1 X79.876 Y94.948 E.11214
; WIPE_START
G1 F11668.197
M204 S6000
G1 X78.462 Y96.363 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.746 Y95.534 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9558
M204 S2000
G1 X76.722 Y97.557 E.07194
G1 X76.722 Y97.012
G1 X78.556 Y95.178 E.06521
G1 X78.367 Y94.822
G1 X76.722 Y96.466 E.05848
G1 X76.722 Y95.921
G1 X78.178 Y94.465 E.05175
G1 X77.988 Y94.109
G1 X76.722 Y95.375 E.04502
M73 P59 R0
G1 X76.722 Y94.83
G1 X77.799 Y93.753 E.03829
G1 X77.61 Y93.397
G1 X76.722 Y94.285 E.03155
G1 X76.722 Y93.739
G1 X77.42 Y93.041 E.02482
G1 X77.231 Y92.685
G1 X76.722 Y93.194 E.01809
G1 X76.722 Y92.648
G1 X77.042 Y92.329 E.01136
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.722 Y92.648 E-.17168
G1 X76.722 Y93.194 E-.20726
G1 X77.231 Y92.685 E-.27343
G1 X77.364 Y92.935 E-.10764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.233 Y95.291 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.100991
G1 F9558
M204 S6000
G1 X79.093 Y95.394 E.00076
; LINE_WIDTH: 0.141753
G1 X78.953 Y95.498 E.00122
; LINE_WIDTH: 0.182516
G1 X78.813 Y95.601 E.00168
; WIPE_START
G1 F18000
G1 X78.953 Y95.498 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.086 Y94.529 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9558
M204 S6000
G1 X80.933 Y94.642 E.00085
; LINE_WIDTH: 0.148012
G1 X80.78 Y94.755 E.00141
; LINE_WIDTH: 0.192948
G1 X80.627 Y94.868 E.00197
; WIPE_START
G1 F18000
G1 X80.78 Y94.755 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.414 Y93.577 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.0971601
G1 F9558
M204 S6000
G1 X82.222 Y93.931 E.00165
; LINE_WIDTH: 0.106164
G1 X82.078 Y94.037 E.00083
; LINE_WIDTH: 0.149862
G1 X81.935 Y94.143 E.00134
; LINE_WIDTH: 0.193561
G1 X81.792 Y94.249 E.00185
; WIPE_START
G1 F18000
G1 X81.935 Y94.143 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.727 Y93.433 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.101204
G1 F9558
M204 S6000
G1 X82.475 Y93.619 E.00136
; LINE_WIDTH: 0.142394
G1 X82.224 Y93.805 E.0022
; LINE_WIDTH: 0.183584
G1 X81.972 Y93.992 E.00305
; LINE_WIDTH: 0.224775
G1 X81.721 Y94.178 E.00389
; WIPE_START
G1 F18000
G1 X81.972 Y93.992 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.892 Y92.814 Z.7 F42000
G1 Z.3
M73 P60 R0
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9558
M204 S6000
G1 X83.739 Y92.927 E.00085
; LINE_WIDTH: 0.148012
G1 X83.586 Y93.04 E.00141
; LINE_WIDTH: 0.192948
G1 X83.433 Y93.153 E.00197
; WIPE_START
G1 F18000
G1 X83.586 Y93.04 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.056 Y92.195 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9558
M204 S6000
G1 X84.903 Y92.308 E.00085
; LINE_WIDTH: 0.148013
G1 X84.75 Y92.421 E.00141
; LINE_WIDTH: 0.192949
G1 X84.598 Y92.534 E.00197
; WIPE_START
G1 F18000
G1 X84.75 Y92.421 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.221 Y91.575 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9558
M204 S6000
G1 X86.068 Y91.689 E.00085
; LINE_WIDTH: 0.148012
G1 X85.915 Y91.802 E.00141
; LINE_WIDTH: 0.192948
G1 X85.762 Y91.915 E.00197
; WIPE_START
G1 F18000
G1 X85.915 Y91.802 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.386 Y90.956 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9558
M204 S6000
G1 X87.233 Y91.069 E.00085
; LINE_WIDTH: 0.148013
G1 X87.08 Y91.182 E.00141
; LINE_WIDTH: 0.192949
G1 X86.927 Y91.296 E.00197
; WIPE_START
G1 F18000
G1 X87.08 Y91.182 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.55 Y90.337 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9558
M204 S6000
G1 X88.397 Y90.45 E.00085
; LINE_WIDTH: 0.148013
G1 X88.244 Y90.563 E.00141
; LINE_WIDTH: 0.192949
G1 X88.092 Y90.676 E.00197
; WIPE_START
G1 F18000
G1 X88.244 Y90.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.715 Y89.718 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103076
G1 F9558
M204 S6000
G1 X89.562 Y89.831 E.00085
; LINE_WIDTH: 0.148011
G1 X89.409 Y89.944 E.00141
; LINE_WIDTH: 0.192945
G1 X89.256 Y90.057 E.00197
; WIPE_START
G1 F18000
G1 X89.409 Y89.944 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.568 Y88.955 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103076
G1 F9558
M204 S6000
G1 X91.415 Y89.069 E.00085
; LINE_WIDTH: 0.148009
G1 X91.262 Y89.182 E.00141
; LINE_WIDTH: 0.192943
G1 X91.109 Y89.295 E.00197
; WIPE_START
G1 F18000
G1 X91.262 Y89.182 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.733 Y88.336 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103076
G1 F9558
M204 S6000
G1 X92.58 Y88.449 E.00085
; LINE_WIDTH: 0.148009
M73 P61 R0
G1 X92.427 Y88.562 E.00141
; LINE_WIDTH: 0.192942
G1 X92.274 Y88.676 E.00197
; WIPE_START
G1 F18000
G1 X92.427 Y88.562 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.209 Y87.86 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.10251
G1 F9558
M204 S6000
G1 X93.06 Y87.97 E.00083
; LINE_WIDTH: 0.14631
G1 X92.91 Y88.081 E.00136
; LINE_WIDTH: 0.190111
G1 X92.761 Y88.191 E.00189
; WIPE_START
G1 F18000
G1 X92.91 Y88.081 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.374 Y87.24 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9558
M204 S6000
G1 X94.221 Y87.354 E.00085
; LINE_WIDTH: 0.148013
G1 X94.068 Y87.467 E.00141
; LINE_WIDTH: 0.192949
G1 X93.915 Y87.58 E.00197
; WIPE_START
G1 F18000
G1 X94.068 Y87.467 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.538 Y86.621 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9558
M204 S6000
G1 X95.385 Y86.734 E.00085
; LINE_WIDTH: 0.148012
G1 X95.233 Y86.848 E.00141
; LINE_WIDTH: 0.192948
G1 X95.08 Y86.961 E.00197
; WIPE_START
G1 F18000
G1 X95.233 Y86.848 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.703 Y86.002 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103076
G1 F9558
M204 S6000
G1 X96.55 Y86.115 E.00085
; LINE_WIDTH: 0.148011
G1 X96.397 Y86.228 E.00141
; LINE_WIDTH: 0.192945
G1 X96.244 Y86.341 E.00197
; WIPE_START
G1 F18000
G1 X96.397 Y86.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.868 Y85.383 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103076
G1 F9558
M204 S6000
G1 X97.715 Y85.496 E.00085
; LINE_WIDTH: 0.148011
G1 X97.562 Y85.609 E.00141
; LINE_WIDTH: 0.192945
G1 X97.409 Y85.722 E.00197
; WIPE_START
G1 F18000
G1 X97.562 Y85.609 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.032 Y84.763 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103078
G1 F9558
M204 S6000
G1 X98.879 Y84.877 E.00085
; LINE_WIDTH: 0.148014
G1 X98.727 Y84.99 E.00141
; LINE_WIDTH: 0.192951
G1 X98.574 Y85.103 E.00197
; CHANGE_LAYER
; Z_HEIGHT: 0.46
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X98.727 Y84.99 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/8
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M106 S204
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.7 I-.556 J-1.082 P1  F42000
G1 X80.065 Y94.584 Z.7
G1 Z.46
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F1200
M204 S5000
G1 X81.851 Y93.634 E.04525
M73 P62 R0
G1 X81.955 Y93.831 E.00498
G1 X80.169 Y94.78 E.04525
G1 X80.093 Y94.637 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X81.83 Y93.646 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.681 Y90.101 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X77.577 Y89.904 E.00498
G1 X79.362 Y88.955 E.04525
G1 X79.467 Y89.151 E.00498
G1 X77.734 Y90.072 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X77.577 Y89.904 E-.08755
G1 X79.139 Y89.073 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.955 Y85.638 Z.86 F42000
G1 X88.277 Y84.467 Z.86
G1 Z.46
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X88.172 Y84.271 E.00498
G1 X89.958 Y83.321 E.04525
G1 X90.022 Y83.442 E.00306
G1 X90.062 Y83.517 E.00191
G1 X88.33 Y84.439 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X88.172 Y84.271 E-.08756
M73 P63 R0
G1 X89.735 Y83.44 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.66 Y88.95 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.446 Y88.001 E.04525
G1 X92.55 Y88.197 E.00498
G1 X90.765 Y89.147 E.04525
G1 X90.688 Y89.003 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X92.426 Y88.012 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.296 Y84.688 Z.86 F42000
G1 X99.489 Y84.595 Z.86
G1 Z.46
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X99.711 Y84.595 E.00498
G1 X99.711 Y84.818 E.00498
G1 X99.489 Y84.818 E.00498
G1 X99.489 Y84.655 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X99.711 Y84.595 E-.20902
G1 X99.711 Y84.818 E-.20181
G1 X99.489 Y84.818 E-.20181
G1 X99.489 Y84.655 E-.14737
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
; layer num/total_layer_count: 4/8
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
G1 X80.065 Y94.584 F42000
G1 Z.62
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X81.851 Y93.634 E.04525
G1 X81.875 Y93.68 E.00115
G1 X81.955 Y93.831 E.00383
G1 X80.169 Y94.78 E.04525
G1 X80.093 Y94.637 E.00363
; WIPE_START
G1 F12000
M204 S6000
M73 P64 R0
G1 X81.83 Y93.646 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.681 Y90.101 Z1.02 F42000
G1 Z.62
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X77.577 Y89.904 E.00498
G1 X79.362 Y88.955 E.04525
G1 X79.443 Y89.106 E.00383
G1 X79.467 Y89.151 E.00115
G1 X77.734 Y90.072 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X77.577 Y89.904 E-.08755
G1 X79.139 Y89.073 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.955 Y85.638 Z1.02 F42000
G1 X88.277 Y84.467 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X88.172 Y84.271 E.00498
G1 X89.958 Y83.321 E.04525
G1 X90.062 Y83.517 E.00498
G1 X88.33 Y84.439 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X88.172 Y84.271 E-.08756
G1 X89.735 Y83.44 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.66 Y88.95 Z1.02 F42000
G1 Z.62
G1 E.8 F1800
G1 F1200
M204 S5000
M73 P65 R0
G1 X92.446 Y88.001 E.04525
G1 X92.47 Y88.046 E.00115
G1 X92.55 Y88.197 E.00383
G1 X90.765 Y89.147 E.04525
G1 X90.688 Y89.003 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X92.426 Y88.012 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.296 Y84.688 Z1.02 F42000
G1 X99.489 Y84.595 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X99.711 Y84.595 E.00498
G1 X99.711 Y84.818 E.00498
G1 X99.489 Y84.818 E.00498
G1 X99.489 Y84.655 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X99.711 Y84.595 E-.20902
G1 X99.711 Y84.818 E-.20181
G1 X99.489 Y84.818 E-.20181
G1 X99.489 Y84.655 E-.14737
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
; layer num/total_layer_count: 5/8
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
G1 X80.169 Y94.78 F42000
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X80.065 Y94.584 E.00498
G1 X81.851 Y93.634 E.04525
G1 X81.955 Y93.831 E.00498
G1 X80.222 Y94.752 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X80.065 Y94.584 E-.08756
G1 X81.627 Y93.753 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.577 Y89.904 Z1.18 F42000
M73 P66 R0
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X79.362 Y88.955 E.04525
G1 X79.467 Y89.151 E.00498
G1 X77.681 Y90.101 E.04525
G1 X77.605 Y89.957 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X79.342 Y88.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.159 Y85.533 Z1.18 F42000
G1 X88.277 Y84.467 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X88.172 Y84.271 E.00498
G1 X89.958 Y83.321 E.04525
G1 X90.062 Y83.517 E.00498
G1 X88.33 Y84.439 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X88.172 Y84.271 E-.08756
G1 X89.735 Y83.44 E-.67244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.66 Y88.95 Z1.18 F42000
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.446 Y88.001 E.04525
G1 X92.55 Y88.197 E.00498
G1 X90.765 Y89.147 E.04525
G1 X90.688 Y89.003 E.00363
; WIPE_START
M73 P67 R0
G1 F12000
M204 S6000
G1 X92.426 Y88.012 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.296 Y84.688 Z1.18 F42000
G1 X99.489 Y84.595 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X99.711 Y84.595 E.00498
G1 X99.711 Y84.818 E.00498
G1 X99.489 Y84.818 E.00498
G1 X99.489 Y84.655 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X99.711 Y84.595 E-.20902
G1 X99.711 Y84.818 E-.20181
G1 X99.489 Y84.818 E-.20181
G1 X99.489 Y84.655 E-.14737
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
; layer num/total_layer_count: 6/8
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
G1 X80.344 Y94.21 F42000
G1 Z.94
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S6000
G1 X80.255 Y94.042 E.00513
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X78.236 Y90.246 E.11652
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X78.147 Y90.079 E.00513
M106 S204
M106 S255
G1 X79.188 Y89.525 E.03194
M106 S204
M106 S255
G1 X79.277 Y89.692 E.00513
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X81.296 Y93.489 E.11652
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X81.385 Y93.656 E.00513
M106 S204
M106 S255
G1 X80.397 Y94.182 E.03031
M106 S204
M204 S250
G1 X80.178 Y94.752 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
M73 P68 R0
G1 X80.074 Y94.556 E.00556
M106 S255
G1 F600
G1 X79.901 Y94.231 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X77.882 Y90.434 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
G1 X77.709 Y90.108 E.00928
G1 F1200
G1 X77.605 Y89.913 E.00556
G1 X77.959 Y89.725 E.01006
G1 X78.312 Y89.537 E.01006
G1 X78.665 Y89.35 E.01006
G1 X79 Y89.171 E.00956
G1 X79.354 Y88.983 E.01006
G1 X79.424 Y89.116 E.00377
G1 F865.268
G1 X79.457 Y89.179 E.00179
M106 S255
G1 F600
G1 X79.631 Y89.504 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X81.649 Y93.301 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X81.823 Y93.627 E.00928
M106 S204
G1 F1200
G1 X81.926 Y93.822 E.00556
G1 X81.573 Y94.01 E.01006
G1 X81.22 Y94.198 E.01006
G1 X80.867 Y94.385 E.01006
G1 X80.231 Y94.723 E.0181
; WIPE_START
G1 F11668.197
M204 S6000
G1 X80.074 Y94.556 E-.08703
G1 X79.901 Y94.231 E-.14022
G1 X79.243 Y92.993 E-.53275
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

G1 X80.591 Y93.889
G1 Z.94
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.476046
M106 S255
G1 F3000
M204 S6000
G1 X78.632 Y90.206 E.12011
G1 X79.022 Y89.999 E.01272
G1 X80.981 Y93.682 E.12011
M106 S204
; WIPE_START
G1 X80.042 Y91.916 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P69 R0
G3 Z1.34 I.793 J.923 P1  F42000
G1 X88.743 Y84.445 Z1.34
G1 Z.94
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S6000
G1 X89.783 Y83.892 E.03194
M106 S204
M106 S255
G1 X89.872 Y84.059 E.00513
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X91.891 Y87.855 E.11652
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X91.98 Y88.023 E.00513
M106 S204
M106 S255
G1 X90.939 Y88.576 E.03194
M106 S204
M106 S255
G1 X90.85 Y88.409 E.00513
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X88.832 Y84.612 E.11652
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X88.771 Y84.498 E.00351
M106 S204
M204 S250
G1 X88.305 Y84.474 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X88.201 Y84.279 E.00556
G1 X88.89 Y83.913 E.01961
G1 X89.243 Y83.725 E.01006
G1 X89.596 Y83.538 E.01006
G1 X89.949 Y83.35 E.01006
G1 X90.019 Y83.482 E.00377
G1 F865.213
G1 X90.053 Y83.545 E.00179
M106 S255
G1 F600
G1 X90.226 Y83.871 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X92.245 Y87.667 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
G1 X92.418 Y87.993 E.00928
M73 P70 R0
G1 F1200
G1 X92.522 Y88.188 E.00556
G1 X92.169 Y88.376 E.01006
G1 X91.815 Y88.564 E.01006
G1 X91.462 Y88.752 E.01006
G1 X91.127 Y88.93 E.00956
G1 X90.774 Y89.118 E.01006
G1 X90.67 Y88.923 E.00556
G1 F720
G1 X90.497 Y88.597 E.00928
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X88.478 Y84.8 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X88.333 Y84.527 E.00777
M106 S204
; WIPE_START
M204 S6000
G1 X88.201 Y84.279 E-.10679
G1 X88.89 Y83.913 E-.29642
G1 X89.243 Y83.725 E-.152
G1 X89.596 Y83.538 E-.152
G1 X89.719 Y83.472 E-.0528
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I-1.163 J.357 P1  F42000
G1 X91.186 Y88.256 Z1.34
G1 Z.94
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.476046
M106 S255
G1 F3000
M204 S6000
G1 X89.228 Y84.573 E.12011
G1 X89.618 Y84.365 E.01272
G1 X91.576 Y88.048 E.12011
M106 S204
; WIPE_START
G1 X90.637 Y86.282 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I.228 J1.195 P1  F42000
G1 X99.489 Y84.595 Z1.34
G1 Z.94
M73 P71 R0
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F1200
M204 S5000
G1 X99.711 Y84.595 E.00498
G1 X99.711 Y84.818 E.00498
G1 X99.489 Y84.818 E.00498
G1 X99.489 Y84.655 E.00363
; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X99.711 Y84.595 E-.20902
G1 X99.711 Y84.818 E-.20181
G1 X99.489 Y84.818 E-.20181
G1 X99.489 Y84.655 E-.14737
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/8
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.34 I-.564 J-1.078 P1  F42000
G1 X80.178 Y94.752 Z1.34
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X77.605 Y89.913 E.13778
G1 X79.354 Y88.983 E.04978
G1 X81.926 Y93.822 E.13778
G1 X80.231 Y94.723 E.04827
; WIPE_START
G1 F11668.197
M204 S6000
M73 P72 R0
G1 X79.273 Y92.968 E-.76
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

G1 X79.989 Y90.631
G1 Z1.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X78.85 Y89.491 E.04052
G1 X78.494 Y89.681
G1 X80.609 Y91.796 E.07519
; WIPE_START
G1 F11668.197
M204 S6000
G1 X79.195 Y90.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.956 J.754 P1  F42000
G1 X81.228 Y92.96 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X78.138 Y89.87 E.10987
G1 X78.085 Y90.362
G1 X81.52 Y93.798 E.12215
M73 P73 R0
G1 X81.164 Y93.987
G1 X78.704 Y91.527 E.08747
; WIPE_START
G1 F11668.197
M204 S6000
G1 X80.118 Y92.941 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.364 J-1.161 P1  F42000
G1 X79.323 Y92.692 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X80.808 Y94.176 E.05279
; WIPE_START
G1 F11668.197
M204 S6000
G1 X79.394 Y92.762 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I1.215 J-.072 P1  F42000
G1 X79.386 Y92.629 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192948
G1 F1200
M204 S6000
G1 X79.273 Y92.476 E.00197
; LINE_WIDTH: 0.148012
G1 X79.16 Y92.323 E.00141
; LINE_WIDTH: 0.103077
G1 X79.046 Y92.17 E.00085
M204 S10000
G1 X78.767 Y91.464 F42000
; LINE_WIDTH: 0.192949
G1 F1200
M204 S6000
G1 X78.653 Y91.311 E.00197
; LINE_WIDTH: 0.148013
G1 X78.54 Y91.158 E.00141
; LINE_WIDTH: 0.103077
G1 X78.427 Y91.006 E.00085
; WIPE_START
G1 F18000
M73 P74 R0
G1 X78.54 Y91.158 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.884 J.836 P1  F42000
G1 X79.647 Y89.988 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.101039
G1 F1200
M204 S6000
G1 X79.547 Y89.853 E.00073
; LINE_WIDTH: 0.141898
G1 X79.447 Y89.717 E.00118
; LINE_WIDTH: 0.182756
G1 X79.347 Y89.582 E.00163
; LINE_WIDTH: 0.223615
G1 X79.247 Y89.447 E.00208
; LINE_WIDTH: 0.264474
G1 X79.147 Y89.312 E.00252
; WIPE_START
G1 F18000
G1 X79.247 Y89.447 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.045 J.624 P1  F42000
G1 X80.266 Y91.152 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F1200
M204 S6000
G1 X80.153 Y91 E.00085
; LINE_WIDTH: 0.148013
G1 X80.04 Y90.847 E.00141
; LINE_WIDTH: 0.192949
G1 X79.927 Y90.694 E.00197
; WIPE_START
G1 F18000
G1 X80.04 Y90.847 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.055 J.607 P1  F42000
G1 X80.886 Y92.317 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.103078
G1 F1200
M204 S6000
G1 X80.772 Y92.164 E.00085
; LINE_WIDTH: 0.148014
G1 X80.659 Y92.011 E.00141
; LINE_WIDTH: 0.192951
G1 X80.546 Y91.858 E.00197
; WIPE_START
G1 F18000
G1 X80.659 Y92.011 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.055 J.607 P1  F42000
G1 X81.505 Y93.482 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.101324
G1 F1200
M204 S6000
G1 X81.415 Y93.36 E.00066
; LINE_WIDTH: 0.142754
G1 X81.324 Y93.238 E.00107
; LINE_WIDTH: 0.176457
G1 X81.245 Y93.13 E.00124
; LINE_WIDTH: 0.202436
G1 X81.165 Y93.023 E.00146
; WIPE_START
G1 F18000
G1 X81.245 Y93.13 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.028 J-.651 P1  F42000
G1 X80.447 Y94.39 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.383052
G1 F1200
M204 S6000
M73 P75 R0
G1 X80.335 Y94.24 E.00426
; LINE_WIDTH: 0.336522
G1 X80.224 Y94.089 E.0037
; LINE_WIDTH: 0.289993
G1 X80.112 Y93.938 E.00313
; LINE_WIDTH: 0.243463
G1 X80 Y93.787 E.00256
; LINE_WIDTH: 0.196933
G1 X79.889 Y93.636 E.00199
; LINE_WIDTH: 0.150404
G1 X79.777 Y93.486 E.00142
; LINE_WIDTH: 0.103874
G1 X79.666 Y93.335 E.00085
; WIPE_START
G1 F18000
G1 X79.777 Y93.486 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.898 J.822 P1  F42000
G1 X88.201 Y84.279 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X89.949 Y83.35 E.04978
G1 X92.522 Y88.188 E.13778
G1 X90.774 Y89.118 E.04978
G1 X88.229 Y84.332 E.13627
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.949 Y83.35 E-.75276
M73 P76 R0
G1 X89.958 Y83.367 E-.00725
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.147 J.405 P1  F42000
G1 X90.434 Y84.713 Z1.5
M73 P79 R0
G1 Z1.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X89.532 Y83.812 E.03205
G1 X89.176 Y84.001
G1 X91.053 Y85.878 E.06673
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.639 Y84.464 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.956 J.754 P1  F42000
G1 X91.672 Y87.042 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X88.82 Y84.19 E.10141
G1 X88.529 Y84.444
G1 X92.202 Y88.118 E.13062
G1 X91.846 Y88.307
G1 X89.148 Y85.609 E.09594
; WIPE_START
M73 P80 R0
G1 F11668.197
M204 S6000
G1 X90.562 Y87.023 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.364 J-1.161 P1  F42000
G1 X89.767 Y86.774 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X91.49 Y88.497 E.06126
G1 X91.134 Y88.686
G1 X90.387 Y87.938 E.02658
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.134 Y88.686 E-.40173
G1 X91.49 Y88.497 E-.15324
G1 X91.109 Y88.115 E-.20503
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.979 J-.723 P1  F42000
G1 X89.211 Y85.546 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192957
G1 F1200
M204 S6000
G1 X89.098 Y85.393 E.00197
; LINE_WIDTH: 0.148018
G1 X88.984 Y85.24 E.00141
; LINE_WIDTH: 0.103079
G1 X88.871 Y85.088 E.00085
; WIPE_START
G1 F18000
G1 X88.984 Y85.24 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.055 J.607 P1  F42000
G1 X89.83 Y86.711 Z1.5
G1 Z1.1
M73 P81 R0
G1 E.8 F1800
; LINE_WIDTH: 0.192951
G1 F1200
M204 S6000
G1 X89.717 Y86.558 E.00197
; LINE_WIDTH: 0.148014
G1 X89.604 Y86.405 E.00141
; LINE_WIDTH: 0.103078
G1 X89.491 Y86.252 E.00085
; WIPE_START
G1 F18000
G1 X89.604 Y86.405 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.055 J.607 P1  F42000
G1 X90.449 Y87.876 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.192952
G1 F1200
M204 S6000
G1 X90.336 Y87.723 E.00197
; LINE_WIDTH: 0.148015
G1 X90.223 Y87.57 E.00141
; LINE_WIDTH: 0.103078
G1 X90.11 Y87.417 E.00085
; WIPE_START
G1 F18000
G1 X90.223 Y87.57 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.068 J.584 P1  F42000
G1 X90.91 Y88.827 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.130444
G1 F1200
M204 S6000
G1 X90.82 Y88.704 E.00096
; LINE_WIDTH: 0.0972209
G1 X90.729 Y88.582 E.00062
; WIPE_START
G1 F18000
G1 X90.82 Y88.704 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.865 J.856 P1  F42000
G1 X91.949 Y87.564 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.103076
G1 F1200
M204 S6000
G1 X91.836 Y87.411 E.00085
; LINE_WIDTH: 0.148009
G1 X91.723 Y87.258 E.00141
; LINE_WIDTH: 0.192943
G1 X91.61 Y87.105 E.00197
M204 S10000
G1 X91.33 Y86.399 F42000
; LINE_WIDTH: 0.103077
G1 F1200
M204 S6000
G1 X91.217 Y86.246 E.00085
; LINE_WIDTH: 0.148012
G1 X91.103 Y86.093 E.00141
; LINE_WIDTH: 0.192948
G1 X90.99 Y85.94 E.00197
M204 S10000
G1 X90.71 Y85.235 F42000
; LINE_WIDTH: 0.103077
G1 F1200
M204 S6000
G1 X90.597 Y85.082 E.00085
; LINE_WIDTH: 0.148012
G1 X90.484 Y84.929 E.00141
; LINE_WIDTH: 0.192948
G1 X90.371 Y84.776 E.00197
M204 S10000
G1 X90.091 Y84.07 F42000
; LINE_WIDTH: 0.100704
G1 F1200
M204 S6000
G1 X89.989 Y83.932 E.00074
; LINE_WIDTH: 0.140892
G1 X89.887 Y83.794 E.00119
; LINE_WIDTH: 0.18108
G1 X89.785 Y83.656 E.00164
; WIPE_START
G1 F18000
G1 X89.887 Y83.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.107 J1.212 P1  F42000
G1 X99.51 Y84.642 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P82 R0
G1 F848.872
M204 S5000
G1 X99.51 Y84.575 E.00168
M106 S255
G1 F600
G1 X99.51 Y84.206 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X99.51 Y83.227 E.02655
G1 X99.087 Y83.452 E.013
G1 X97.547 Y80.556 E.08888
G1 X98.235 Y80.19 E.02114
G1 X99.216 Y82.035 E.05663
M106 S204
M106 S255

G1 X99.775 Y83.086 E.03225
G1 X99.69 Y83.131 E.00262
G1 X99.69 Y84.206 E.02914
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X99.69 Y84.575 E.00928
M106 S204
G1 F1200
M73 P83 R0
G1 X99.69 Y84.796 E.00556
G1 X99.51 Y84.796 E.00453
G1 X99.51 Y84.702 E.00236
; WIPE_START
G1 F3456.45
M204 S6000
G1 X99.51 Y84.575 E-.04825
G1 X99.51 Y84.206 E-.14022
G1 X99.51 Y83.227 E-.37228
G1 X99.087 Y83.452 E-.18225
G1 X99.066 Y83.412 E-.017
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.929 J.786 P1  F42000
G1 X99.337 Y83.092 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.413691
G1 F1200
M204 S6000
G1 X97.985 Y80.55 E.07121
; CHANGE_LAYER
; Z_HEIGHT: 1.26
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11862.26
G1 X98.924 Y82.316 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/8
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.5 I-1.184 J.28 P1  F42000
G1 X99.51 Y84.796 Z1.5
G1 Z1.26
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X99.51 Y83.227 E.03946
G1 X99.087 Y83.452 E.01206
G1 X97.547 Y80.556 E.08246
G1 X98.235 Y80.19 E.01961
G1 X98.6 Y80.874 E.0195
G1 X99.775 Y83.086 E.06296
G1 X99.69 Y83.131 E.00243
M73 P84 R0
G1 X99.69 Y84.796 E.04187
G1 X99.57 Y84.796 E.00302
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.51 Y83.227 E-.59691
G1 X99.131 Y83.428 E-.16309
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

G1 X99.337 Y83.092
G1 Z1.26
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.413679
G1 F1200
M204 S6000
G1 X97.985 Y80.55 E.0712
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F11862.638
G1 X98.924 Y82.316 E-.76
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
M73 P85 R0
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
M73 P86 R0
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
M73 P87 R0
G1 Y265
M73 P88 R0
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
M73 P89 R0
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


; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 8m 30s; total estimated time: 8m 49s
; total layer number: 50
; total filament length [mm] : 550.15
; total filament volume [cm^3] : 1323.27
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
M73 P0 R8
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
; Z_HEIGHT: 0.28
; LAYER_HEIGHT: 0.28
G1 E-.8 F1800
; layer num/total_layer_count: 1/50
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
M73 P3 R8
G1 X78.954 Y81.477 F42000
M204 S6000
G1 Z.4
G1 Z.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X78.904 Y81.301 E.0092
G3 X79.855 Y79.892 I1.166 J-.238 E.09499
G1 X80.049 Y79.873 E.0098
G3 X78.977 Y81.533 I.021 J1.19 E.25821
M204 S6000
G1 X79.375 Y81.347 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X79.336 Y81.214 E.007
G3 X79.937 Y80.326 I.734 J-.15 E.05993
G1 X80.054 Y80.314 E.00594
G3 X79.401 Y81.401 I.015 J.749 E.16037
; WIPE_START
G1 X79.336 Y81.214 E-.07553
G1 X79.319 Y81.065 E-.05679
G1 X79.334 Y80.916 E-.05682
G1 X79.378 Y80.773 E-.05681
G1 X79.449 Y80.642 E-.05688
G1 X79.545 Y80.527 E-.05691
G1 X79.662 Y80.434 E-.05683
G1 X79.796 Y80.366 E-.0569
G1 X79.937 Y80.326 E-.05563
G1 X80.054 Y80.314 E-.04499
G1 X80.2 Y80.325 E-.05564
G1 X80.344 Y80.366 E-.05683
G1 X80.472 Y80.431 E-.05443
G1 X80.511 Y80.462 E-.01901
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X79.714 Y88.053 Z.68 F42000
G1 X78.049 Y103.913 Z.68
G1 Z.28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X77.882 Y103.787 E.01049
G3 X77.686 Y103.291 I.525 J-.494 E.02742
G1 X77.686 Y76.717 E1.33365
G3 X78.409 Y75.986 I.718 J-.013 E.05749
G1 X101.62 Y75.987 E1.16486
G3 X102.312 Y76.665 I-.029 J.723 E.0533
G1 X102.314 Y103.291 E1.33626
G3 X101.591 Y104.014 I-.72 J.003 E.05704
G1 X78.417 Y104.014 E1.16302
M73 P4 R8
G3 X78.099 Y103.945 I-.01 J-.721 E.01646
M204 S6000
G1 X77.769 Y104.265 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X77.761 Y104.257 E.00059
G3 X77.246 Y103.297 I.648 J-.965 E.0569
G1 X77.246 Y76.706 E1.33446
G3 X78.403 Y75.546 I1.158 J-.002 E.09136
G1 X101.633 Y75.547 E1.16578
G3 X102.752 Y76.643 I-.047 J1.168 E.08618
G1 X102.754 Y103.297 E1.33762
G3 X101.597 Y104.454 I-1.162 J-.005 E.09113
G1 X78.406 Y104.454 E1.16383
G3 X77.905 Y104.339 I.002 J-1.162 E.02602
G1 X77.822 Y104.294 E.00476
; WIPE_START
G1 X77.761 Y104.257 E-.02715
G1 X77.561 Y104.091 E-.09844
G1 X77.411 Y103.893 E-.09465
G1 X77.314 Y103.689 E-.08598
G1 X77.269 Y103.527 E-.06358
G1 X77.246 Y103.297 E-.08813
G1 X77.246 Y102.502 E-.30207
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

G1 X100.912 Y76.163
G1 Z.28
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.503109
G1 F5804.317
M204 S500
G1 X101.938 Y77.189 E.07336
G1 X101.938 Y77.816 E.03167
G1 X100.483 Y76.361 E.10399
G1 X99.857 Y76.361 E.03167
G1 X101.938 Y78.442 E.14878
G1 X101.938 Y79.069 E.03167
G1 X99.23 Y76.361 E.19357
G1 X98.604 Y76.361 E.03167
G1 X101.939 Y79.696 E.23835
G1 X101.939 Y80.322 E.03167
G1 X97.977 Y76.361 E.28314
G1 X97.351 Y76.361 E.03167
G1 X101.939 Y80.949 E.32792
G1 X101.939 Y81.575 E.03167
G1 X96.724 Y76.361 E.37271
G1 X96.098 Y76.361 E.03167
G1 X101.939 Y82.202 E.41749
G1 X101.939 Y82.828 E.03167
G1 X95.471 Y76.361 E.46228
M73 P5 R8
G1 X94.844 Y76.361 E.03167
G1 X101.939 Y83.455 E.50707
G1 X101.939 Y84.082 E.03167
G1 X94.218 Y76.361 E.55185
G1 X93.591 Y76.361 E.03167
G1 X101.939 Y84.708 E.59664
G1 X101.939 Y85.335 E.03167
G1 X92.965 Y76.361 E.64142
G1 X92.338 Y76.361 E.03167
G1 X101.939 Y85.961 E.68621
G1 X101.939 Y86.588 E.03167
G1 X91.712 Y76.361 E.731
G1 X91.085 Y76.361 E.03167
G1 X101.939 Y87.214 E.77578
G1 X101.939 Y87.841 E.03167
G1 X90.459 Y76.361 E.82057
G1 X89.832 Y76.36 E.03167
G1 X101.939 Y88.467 E.86535
G1 X101.939 Y89.094 E.03167
G1 X89.205 Y76.36 E.91014
G1 X88.579 Y76.36 E.03167
G1 X101.939 Y89.721 E.95493
G1 X101.939 Y90.347 E.03167
G1 X87.952 Y76.36 E.99971
G1 X87.326 Y76.36 E.03167
G1 X101.939 Y90.974 E1.0445
G1 X101.939 Y91.6 E.03167
G1 X86.699 Y76.36 E1.08928
G1 X86.073 Y76.36 E.03167
G1 X101.939 Y92.227 E1.13407
M73 P6 R8
G1 X101.939 Y92.853 E.03167
G1 X85.446 Y76.36 E1.17885
G1 X84.82 Y76.36 E.03167
G1 X101.939 Y93.48 E1.22364
G1 X101.939 Y94.107 E.03167
G1 X84.193 Y76.36 E1.26843
G1 X83.567 Y76.36 E.03167
G1 X101.939 Y94.733 E1.31321
G1 X101.939 Y95.36 E.03167
G1 X82.94 Y76.36 E1.358
G1 X82.313 Y76.36 E.03167
G1 X101.94 Y95.986 E1.40278
G1 X101.94 Y96.613 E.03167
G1 X81.687 Y76.36 E1.44757
G1 X81.06 Y76.36 E.03167
G1 X101.94 Y97.239 E1.49236
G1 X101.94 Y97.866 E.03167
G1 X80.434 Y76.36 E1.53714
G1 X79.807 Y76.36 E.03167
G1 X101.94 Y98.493 E1.58193
G1 X101.94 Y99.119 E.03167
G1 X79.181 Y76.36 E1.62671
M73 P7 R8
G1 X78.554 Y76.36 E.03167
G1 X101.94 Y99.746 E1.6715
G1 X101.94 Y100.372 E.03167
G1 X78.111 Y76.544 E1.70315
G2 X78.06 Y76.748 I.249 J.171 E.01086
G1 X78.06 Y77.119 E.01876
G1 X101.94 Y100.999 E1.70682
G1 X101.94 Y101.625 E.03167
G1 X81.616 Y81.301 E1.45269
G3 X81.462 Y81.774 I-1.679 J-.283 E.02523
G1 X101.94 Y102.252 E1.46365
G1 X101.94 Y102.878 E.03167
G1 X81.206 Y82.145 E1.48195
G3 X80.852 Y82.417 I-.85 J-.742 E.02274
G1 X101.891 Y103.456 E1.50377
G3 X101.448 Y103.64 I-.351 J-.219 E.02582
G1 X80.228 Y82.419 E1.51676
; WIPE_START
G1 X81.642 Y83.834 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X80.014 Y79.699 Z.68 F42000
G1 Z.28
G1 E.8 F1800
G1 F5804.317
M204 S500
G1 X78.06 Y77.745 E.13965
G1 X78.06 Y78.372 E.03167
G1 X79.362 Y79.674 E.09303
M73 P8 R8
G2 X78.99 Y79.929 I.446 J1.046 E.02292
G1 X78.06 Y78.999 E.0665
G1 X78.06 Y79.625 E.03167
G1 X78.718 Y80.283 E.04703
G2 X78.539 Y80.731 I1.016 J.665 E.02453
G1 X78.06 Y80.252 E.03425
G1 X78.06 Y80.878 E.03167
G1 X78.529 Y81.347 E.03353
G1 X78.532 Y81.376 E.00146
G2 X79.79 Y82.608 I1.543 J-.317 E.09445
G1 X100.822 Y103.64 E1.50325
G1 X100.195 Y103.64 E.03167
G1 X78.06 Y81.505 E1.58213
G1 X78.06 Y82.131 E.03167
G1 X99.569 Y103.64 E1.53735
G1 X98.942 Y103.64 E.03167
G1 X78.06 Y82.758 E1.49257
G1 X78.06 Y83.384 E.03167
G1 X98.316 Y103.64 E1.44779
G1 X97.689 Y103.64 E.03167
G1 X78.06 Y84.011 E1.40301
G1 X78.06 Y84.637 E.03167
G1 X97.063 Y103.64 E1.35823
G1 X96.436 Y103.64 E.03167
G1 X78.06 Y85.264 E1.31345
G1 X78.06 Y85.89 E.03167
G1 X95.81 Y103.64 E1.26867
G1 X95.183 Y103.64 E.03167
G1 X78.06 Y86.517 E1.22389
G1 X78.06 Y87.143 E.03167
G1 X94.557 Y103.64 E1.1791
M73 P9 R8
G1 X93.93 Y103.64 E.03167
G1 X78.06 Y87.77 E1.13432
G1 X78.06 Y88.396 E.03166
G1 X93.304 Y103.64 E1.08954
G1 X92.677 Y103.64 E.03167
G1 X78.06 Y89.023 E1.04476
G1 X78.06 Y89.649 E.03166
G1 X92.051 Y103.64 E.99998
G1 X91.424 Y103.64 E.03166
G1 X78.06 Y90.276 E.9552
G1 X78.06 Y90.902 E.03167
M73 P9 R7
G1 X90.798 Y103.64 E.91042
G1 X90.171 Y103.64 E.03166
G1 X78.06 Y91.529 E.86564
G1 X78.06 Y92.156 E.03167
G1 X89.544 Y103.64 E.82086
G1 X88.918 Y103.64 E.03166
G1 X78.06 Y92.782 E.77608
G1 X78.06 Y93.409 E.03167
G1 X88.291 Y103.64 E.73129
G1 X87.665 Y103.64 E.03166
G1 X78.06 Y94.035 E.68651
G1 X78.06 Y94.662 E.03167
G1 X87.038 Y103.64 E.64173
G1 X86.412 Y103.64 E.03166
G1 X78.06 Y95.288 E.59695
M73 P10 R7
G1 X78.06 Y95.915 E.03167
G1 X85.785 Y103.64 E.55217
G1 X85.159 Y103.64 E.03166
G1 X78.06 Y96.541 E.50739
G1 X78.06 Y97.168 E.03167
G1 X84.532 Y103.64 E.46261
G1 X83.906 Y103.64 E.03166
G1 X78.06 Y97.794 E.41783
G1 X78.06 Y98.421 E.03167
G1 X83.279 Y103.64 E.37304
G1 X82.653 Y103.64 E.03166
G1 X78.06 Y99.047 E.32826
G1 X78.06 Y99.674 E.03167
G1 X82.026 Y103.64 E.28348
G1 X81.4 Y103.64 E.03166
G1 X78.06 Y100.3 E.2387
G1 X78.06 Y100.927 E.03167
G1 X80.773 Y103.64 E.19392
G1 X80.147 Y103.64 E.03166
G1 X78.06 Y101.553 E.14914
G1 X78.06 Y102.18 E.03167
G1 X79.52 Y103.64 E.10436
G1 X78.894 Y103.64 E.03166
G1 X78.06 Y102.806 E.05958
G2 X78.069 Y103.366 I2.819 J.233 E.02832
G2 X78.137 Y103.51 I.388 J-.094 E.00811
G1 X78.465 Y103.838 E.02343
; CHANGE_LAYER
; Z_HEIGHT: 0.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F5804.317
G1 X78.137 Y103.51 E-.17617
G1 X78.069 Y103.366 E-.06059
G1 X78.06 Y102.806 E-.2126
G1 X78.638 Y103.384 E-.31064
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
G3 Z.68 I1.217 J.022 P1  F42000
G1 X79.033 Y81.451 Z.68
G1 Z.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X78.985 Y81.269 E.00512
G3 X79.932 Y79.962 I1.092 J-.205 E.04893
G1 X80.058 Y79.953 E.00342
G3 X79.058 Y81.508 I.02 J1.111 E.13008
G1 X79.057 Y81.506 E.00006
M204 S250
G1 X79.414 Y81.334 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X79.376 Y81.2 E.0035
G3 X79.982 Y80.36 I.697 J-.136 E.02917
G1 X80.058 Y80.355 E.00191
G3 X79.441 Y81.387 I.015 J.71 E.07601
; WIPE_START
M204 S6000
G1 X79.376 Y81.2 E-.07542
G1 X79.359 Y81.065 E-.05167
G1 X79.373 Y80.929 E-.05174
G1 X79.417 Y80.784 E-.05783
G1 X79.483 Y80.664 E-.0518
G1 X79.574 Y80.556 E-.05379
G1 X79.684 Y80.468 E-.05374
G1 X79.808 Y80.404 E-.05276
G1 X79.982 Y80.36 E-.06817
G1 X80.058 Y80.355 E-.02893
G1 X80.194 Y80.365 E-.05181
G1 X80.33 Y80.403 E-.05387
G1 X80.456 Y80.468 E-.0537
G1 X80.566 Y80.556 E-.05381
G1 X80.568 Y80.558 E-.00095
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.709 Y88.142 Z.84 F42000
G1 X77.908 Y104.036 Z.84
G1 Z.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G3 X77.513 Y103.285 I.498 J-.742 E.02397
G1 X77.513 Y76.715 E.71995
G3 X78.415 Y75.813 I.894 J-.009 E.03852
G1 X101.649 Y75.814 E.62956
G3 X102.486 Y76.657 I-.061 J.898 E.03513
G1 X102.487 Y103.285 E.72154
G3 X101.585 Y104.187 I-.9 J.003 E.03845
G1 X78.415 Y104.187 E.62782
G3 X77.959 Y104.067 I-.009 J-.894 E.01293
M204 S250
G1 X77.702 Y104.38 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3240
M204 S5000
G1 X77.685 Y104.37 E.0005
G3 X77.187 Y103.731 I.729 J-1.083 E.02071
G1 F3060
G1 X77.168 Y103.676 E.00146
G1 F3240
G3 X77.112 Y103.295 I1.419 J-.404 E.00973
G1 X77.112 Y77.305 E.6534
G3 X77.119 Y76.571 I7.478 J-.3 E.01847
G1 F3060
G1 X77.126 Y76.514 E.00145
G1 F3240
G3 X77.188 Y76.264 I1.3 J.193 E.00649
G1 F3060
G1 X77.209 Y76.21 E.00146
G1 F3240
G3 X77.491 Y75.788 I1.549 J.729 E.01281
G1 F3060
G1 X77.533 Y75.747 E.00146
G1 F3240
G3 X77.969 Y75.487 I1.096 J1.334 E.01281
G1 F3060
G1 X78.024 Y75.468 E.00146
G1 F3240
G3 X78.405 Y75.412 I.404 J1.419 E.00972
G1 X101.663 Y75.414 E.58474
G1 F3060
G1 X101.724 Y75.418 E.00154
M73 P11 R7
G1 F3240
G3 X102.737 Y76.095 I-.155 J1.328 E.0318
G1 F3060
G1 X102.764 Y76.15 E.00154
G1 F3240
G3 X102.886 Y76.637 I-1.585 J.655 E.01267
G1 X102.888 Y102.695 E.65513
G3 X102.881 Y103.429 I-7.467 J.3 E.01847
G1 F3060
G1 X102.874 Y103.486 E.00145
G1 F3240
G3 X102.764 Y103.85 I-1.438 J-.236 E.00959
G1 F3060
G1 X102.737 Y103.905 E.00153
G1 F3240
G3 X102.031 Y104.513 I-1.172 J-.645 E.02393
G1 F3060
G1 X101.976 Y104.532 E.00146
G1 F3240
G3 X101.595 Y104.588 I-.404 J-1.418 E.00973
G1 X79.005 Y104.588 E.56792
G3 X78.271 Y104.581 I-.3 J-7.478 E.01847
G1 F3060
G1 X78.214 Y104.574 E.00145
G1 F3240
G3 X77.964 Y104.512 I.193 J-1.301 E.00649
G1 F3060
G1 X77.907 Y104.49 E.00153
G1 F3240
G1 X77.755 Y104.408 E.00433
; WIPE_START
M204 S6000
G1 X77.685 Y104.37 E-.03031
G1 X77.448 Y104.167 E-.11873
G1 X77.295 Y103.962 E-.09704
G1 X77.187 Y103.731 E-.09682
G1 X77.168 Y103.676 E-.02212
G1 X77.118 Y103.426 E-.0969
G1 X77.112 Y103.295 E-.05004
G1 X77.112 Y102.642 E-.24805
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

G1 X77.68 Y84.847
G1 Z.44
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420466
G1 F11654.106
M204 S6000
G1 X80.013 Y82.514 E.08305
G3 X79.555 Y82.425 I-.01 J-1.177 E.01181
G1 X77.853 Y84.127 E.06058
G1 X77.853 Y83.581 E.01375
G1 X79.205 Y82.229 E.04814
G3 X78.929 Y81.959 I.529 J-.819 E.00979
G1 X77.853 Y83.035 E.03829
G1 X77.853 Y82.489 E.01375
G1 X78.727 Y81.615 E.0311
G3 X78.625 Y81.171 I1.046 J-.474 E.01154
G1 X77.853 Y81.943 E.02746
G1 X77.853 Y81.397 E.01375
G1 X83.096 Y76.154 E.18664
G1 X83.642 Y76.154 E.01374
G1 X80.17 Y79.626 E.12361
G1 X80.314 Y79.629 E.00362
G1 X80.622 Y79.72 E.0081
G1 X84.188 Y76.154 E.12695
G1 X84.734 Y76.154 E.01374
G1 X80.963 Y79.925 E.13423
G3 X81.235 Y80.199 I-.544 J.809 E.00978
G1 X85.28 Y76.154 E.14401
G1 X85.826 Y76.154 E.01374
G1 X81.428 Y80.552 E.15658
G3 X81.52 Y81.006 I-1.077 J.455 E.01174
G1 X86.372 Y76.154 E.17273
G1 X86.918 Y76.154 E.01374
G1 X77.853 Y85.219 E.3227
G1 X77.853 Y85.765 E.01375
G1 X87.464 Y76.154 E.34214
G1 X88.01 Y76.154 E.01374
G1 X77.853 Y86.311 E.36158
G1 X77.853 Y86.857 E.01375
G1 X88.556 Y76.154 E.38102
G1 X89.102 Y76.154 E.01374
G1 X77.853 Y87.403 E.40045
G1 X77.853 Y87.949 E.01375
G1 X89.649 Y76.154 E.41989
G1 X90.195 Y76.154 E.01374
G1 X77.853 Y88.495 E.43933
G1 X77.853 Y89.042 E.01375
G1 X90.741 Y76.154 E.45877
G1 X91.287 Y76.154 E.01374
G1 X77.853 Y89.588 E.47821
G1 X77.853 Y90.134 E.01375
G1 X91.833 Y76.154 E.49764
G1 X92.379 Y76.154 E.01374
G1 X77.853 Y90.68 E.51708
G1 X77.853 Y91.226 E.01375
G1 X92.925 Y76.154 E.53652
G1 X93.471 Y76.154 E.01374
G1 X77.853 Y91.772 E.55596
G1 X77.853 Y92.318 E.01375
G1 X94.017 Y76.154 E.57539
G1 X94.563 Y76.154 E.01374
G1 X77.853 Y92.864 E.59483
G1 X77.853 Y93.41 E.01375
G1 X95.109 Y76.154 E.61427
G1 X95.655 Y76.155 E.01374
G1 X77.853 Y93.956 E.63371
G1 X77.853 Y94.502 E.01375
G1 X96.201 Y76.155 E.65314
G1 X96.747 Y76.155 E.01374
G1 X77.853 Y95.048 E.67258
G1 X77.853 Y95.594 E.01375
G1 X97.293 Y76.155 E.69202
G1 X97.839 Y76.155 E.01374
G1 X77.853 Y96.14 E.71146
M73 P12 R7
G1 X77.853 Y96.686 E.01375
G1 X98.385 Y76.155 E.73089
G1 X98.931 Y76.155 E.01374
G1 X77.853 Y97.233 E.75033
G1 X77.853 Y97.779 E.01375
G1 X99.477 Y76.155 E.76977
G1 X100.023 Y76.155 E.01374
G1 X77.853 Y98.325 E.78921
G1 X77.853 Y98.871 E.01375
G1 X100.569 Y76.155 E.80865
G1 X101.115 Y76.155 E.01374
G1 X77.853 Y99.417 E.82808
G1 X77.853 Y99.963 E.01375
G1 X101.657 Y76.159 E.84738
G3 X102.013 Y76.349 I-.068 J.555 E.01039
G1 X77.853 Y100.509 E.86004
G1 X77.853 Y101.055 E.01375
G1 X102.145 Y76.763 E.86474
G1 X102.145 Y77.309 E.01374
G1 X77.853 Y101.601 E.86474
G1 X77.853 Y102.147 E.01375
G1 X102.145 Y77.855 E.86475
G1 X102.145 Y78.401 E.01374
G1 X77.853 Y102.693 E.86475
G1 X77.853 Y103.239 E.01375
G1 X102.145 Y78.947 E.86475
G1 X102.145 Y79.493 E.01374
G1 X77.988 Y103.65 E.85994
G2 X78.343 Y103.841 I.408 J-.333 E.01041
G1 X102.145 Y80.04 E.84731
G1 X102.145 Y80.586 E.01374
G1 X78.884 Y103.847 E.82806
G1 X79.43 Y103.847 E.01375
G1 X102.145 Y81.132 E.80862
G1 X102.145 Y81.678 E.01374
G1 X79.976 Y103.847 E.78918
G1 X80.522 Y103.847 E.01375
G1 X102.145 Y82.224 E.76975
G1 X102.145 Y82.77 E.01374
G1 X81.068 Y103.847 E.75031
G1 X81.614 Y103.847 E.01375
G1 X102.145 Y83.316 E.73087
G1 X102.145 Y83.862 E.01374
G1 X82.16 Y103.847 E.71143
G1 X82.706 Y103.847 E.01375
G1 X102.145 Y84.408 E.69199
G1 X102.146 Y84.954 E.01374
G1 X83.253 Y103.847 E.67256
G1 X83.799 Y103.847 E.01375
G1 X102.146 Y85.5 E.65312
G1 X102.146 Y86.046 E.01374
G1 X84.345 Y103.847 E.63368
M73 P13 R7
G1 X84.891 Y103.847 E.01375
G1 X102.146 Y86.592 E.61424
G1 X102.146 Y87.138 E.01374
G1 X85.437 Y103.847 E.59481
G1 X85.983 Y103.847 E.01375
G1 X102.146 Y87.684 E.57537
G1 X102.146 Y88.23 E.01374
G1 X86.529 Y103.847 E.55593
G1 X87.075 Y103.847 E.01375
G1 X102.146 Y88.776 E.53649
G1 X102.146 Y89.322 E.01374
G1 X87.621 Y103.847 E.51705
G1 X88.167 Y103.847 E.01375
G1 X102.146 Y89.868 E.49762
G1 X102.146 Y90.414 E.01374
G1 X88.713 Y103.847 E.47818
G1 X89.259 Y103.847 E.01375
G1 X102.146 Y90.96 E.45874
G1 X102.146 Y91.506 E.01374
G1 X89.805 Y103.847 E.4393
G1 X90.351 Y103.847 E.01375
G1 X102.146 Y92.052 E.41987
G1 X102.146 Y92.598 E.01374
G1 X90.898 Y103.847 E.40043
G1 X91.444 Y103.847 E.01375
G1 X102.146 Y93.144 E.38099
G1 X102.146 Y93.69 E.01374
G1 X91.99 Y103.847 E.36155
G1 X92.536 Y103.847 E.01375
G1 X102.146 Y94.236 E.34211
G1 X102.146 Y94.782 E.01374
G1 X93.082 Y103.847 E.32268
G1 X93.628 Y103.847 E.01375
G1 X102.146 Y95.328 E.30324
G1 X102.146 Y95.874 E.01374
G1 X94.174 Y103.847 E.2838
G1 X94.72 Y103.847 E.01375
G1 X102.146 Y96.42 E.26436
G1 X102.146 Y96.967 E.01374
G1 X95.266 Y103.847 E.24493
G1 X95.812 Y103.847 E.01375
G1 X102.146 Y97.513 E.22549
G1 X102.146 Y98.059 E.01374
G1 X96.358 Y103.847 E.20605
G1 X96.904 Y103.847 E.01375
G1 X102.146 Y98.605 E.18661
G1 X102.147 Y99.151 E.01374
G1 X97.45 Y103.847 E.16717
G1 X97.996 Y103.847 E.01375
G1 X102.147 Y99.697 E.14774
G1 X102.147 Y100.243 E.01374
G1 X98.543 Y103.847 E.1283
G1 X99.089 Y103.847 E.01375
G1 X102.147 Y100.789 E.10886
G1 X102.147 Y101.335 E.01374
G1 X99.635 Y103.847 E.08942
G1 X100.181 Y103.847 E.01375
G1 X102.147 Y101.881 E.06998
G1 X102.147 Y102.427 E.01374
G1 X100.727 Y103.847 E.05055
G1 X101.273 Y103.847 E.01375
G1 X102.147 Y102.973 E.03111
G1 X102.147 Y103.274 E.00757
G3 X102.021 Y103.644 I-.711 J-.034 E.00998
G1 X101.653 Y104.013 E.01313
M204 S10000
G1 X77.68 Y81.024 F42000
G1 F11654.106
M204 S6000
G1 X82.55 Y76.154 E.17338
G1 X82.004 Y76.153 E.01374
G1 X77.853 Y80.304 E.14776
G1 X77.853 Y79.758 E.01375
G1 X81.458 Y76.153 E.12833
G1 X80.912 Y76.153 E.01374
G1 X77.853 Y79.212 E.10889
G1 X77.853 Y78.666 E.01375
G1 X80.366 Y76.153 E.08945
G1 X79.82 Y76.153 E.01374
G1 X77.853 Y78.12 E.07001
G1 X77.853 Y77.574 E.01375
G1 X79.274 Y76.153 E.05058
G1 X78.728 Y76.153 E.01374
G1 X77.68 Y77.202 E.03732
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11654.106
G1 X78.728 Y76.153 E-.56334
G1 X79.245 Y76.153 E-.19666
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
G3 Z.84 I-1.216 J-.05 P1  F42000
G1 X79.03 Y81.452 Z.84
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X78.981 Y81.285 E.0047
G3 X79.822 Y79.979 I1.088 J-.223 E.0466
G1 X80.042 Y79.952 E.00602
G3 X79.052 Y81.507 I.027 J1.111 E.13019
M204 S250
G1 X79.412 Y81.334 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X79.375 Y81.206 E.00335
G3 X79.911 Y80.372 I.695 J-.142 E.0276
G1 X80.052 Y80.354 E.00357
G3 X79.439 Y81.387 I.017 J.709 E.07601
; WIPE_START
M204 S6000
G1 X79.375 Y81.206 E-.07324
G1 X79.359 Y81.07 E-.05175
G1 X79.375 Y80.919 E-.05782
G1 X79.465 Y80.692 E-.09295
G1 X79.549 Y80.581 E-.0527
G1 X79.655 Y80.488 E-.05369
G1 X79.778 Y80.417 E-.05379
G1 X79.911 Y80.372 E-.05369
G1 X80.052 Y80.354 E-.05393
G1 X80.193 Y80.365 E-.05379
G1 X80.33 Y80.403 E-.05404
G1 X80.456 Y80.468 E-.05391
G1 X80.567 Y80.556 E-.0536
G1 X80.569 Y80.558 E-.00111
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.709 Y88.142 Z1 F42000
G1 X77.908 Y104.036 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G3 X77.511 Y103.285 I.504 J-.748 E.02397
G1 X77.511 Y76.715 E.71996
G3 X78.415 Y75.811 I.902 J-.002 E.03853
G1 X101.586 Y75.811 E.62786
G3 X102.488 Y76.657 I.002 J.901 E.03692
G1 X102.489 Y103.292 E.72174
M73 P14 R7
G3 X101.585 Y104.189 I-.902 J-.005 E.03834
G1 X78.415 Y104.189 E.62783
G3 X77.959 Y104.067 I-.003 J-.902 E.01294
M204 S250
G1 X77.701 Y104.381 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X77.687 Y104.368 E.0005
G3 X77.11 Y103.295 I.729 J-1.083 E.03186
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.011 E.05104
G1 X101.596 Y75.41 E.58304
G3 X102.888 Y76.637 I-.012 J1.307 E.0493
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.306 J-.013 E.05098
G1 X78.405 Y104.59 E.58301
G3 X77.969 Y104.511 I.01 J-1.306 E.01119
G1 X77.755 Y104.407 E.00599
; WIPE_START
M204 S6000
G1 X77.687 Y104.368 E-.03003
G1 X77.488 Y104.212 E-.09583
G1 X77.295 Y103.965 E-.11904
G1 X77.185 Y103.734 E-.09746
G1 X77.135 Y103.554 E-.07071
G1 X77.11 Y103.295 E-.09913
G1 X77.11 Y102.643 E-.2478
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

G1 X78.347 Y104.015
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420546
G1 F11651.692
M204 S6000
G1 X77.98 Y103.648 E.01308
G1 X77.906 Y103.532 E.00344
G3 X77.851 Y102.973 I1.187 J-.4 E.01427
G1 X78.727 Y103.849 E.03117
G1 X79.273 Y103.849 E.01375
G1 X77.851 Y102.427 E.05062
G1 X77.851 Y101.881 E.01375
G1 X79.819 Y103.849 E.07006
G1 X80.365 Y103.849 E.01375
G1 X77.851 Y101.335 E.08951
G1 X77.851 Y100.789 E.01375
G1 X80.911 Y103.849 E.10896
G1 X81.458 Y103.849 E.01375
G1 X77.851 Y100.242 E.12841
G1 X77.851 Y99.696 E.01375
G1 X82.004 Y103.849 E.14785
G1 X82.55 Y103.849 E.01375
G1 X77.851 Y99.15 E.1673
G1 X77.851 Y98.604 E.01375
G1 X83.096 Y103.849 E.18675
G1 X83.642 Y103.849 E.01375
G1 X77.851 Y98.058 E.20619
G1 X77.851 Y97.512 E.01375
G1 X84.188 Y103.849 E.22564
G1 X84.735 Y103.849 E.01375
G1 X77.851 Y96.965 E.24509
G1 X77.851 Y96.419 E.01375
G1 X85.281 Y103.849 E.26454
G1 X85.827 Y103.849 E.01375
G1 X77.851 Y95.873 E.28398
G1 X77.851 Y95.327 E.01375
G1 X86.373 Y103.849 E.30343
G1 X86.919 Y103.849 E.01375
G1 X77.851 Y94.781 E.32288
G1 X77.851 Y94.234 E.01375
G1 X87.466 Y103.849 E.34232
G1 X88.012 Y103.849 E.01375
G1 X77.851 Y93.688 E.36177
G1 X77.851 Y93.142 E.01375
G1 X88.558 Y103.849 E.38122
G1 X89.104 Y103.849 E.01375
G1 X77.851 Y92.596 E.40067
G1 X77.851 Y92.05 E.01375
G1 X89.65 Y103.849 E.42011
G1 X90.196 Y103.849 E.01375
G1 X77.851 Y91.504 E.43956
G1 X77.851 Y90.957 E.01375
G1 X90.743 Y103.849 E.45901
G1 X91.289 Y103.849 E.01375
G1 X77.851 Y90.411 E.47846
G1 X77.851 Y89.865 E.01375
G1 X91.835 Y103.849 E.4979
G1 X92.381 Y103.849 E.01375
G1 X77.851 Y89.319 E.51735
G1 X77.851 Y88.773 E.01375
G1 X92.927 Y103.849 E.5368
G1 X93.474 Y103.849 E.01375
G1 X77.851 Y88.226 E.55624
G1 X77.851 Y87.68 E.01375
G1 X94.02 Y103.849 E.57569
G1 X94.566 Y103.849 E.01375
G1 X77.851 Y87.134 E.59514
G1 X77.851 Y86.588 E.01375
G1 X95.112 Y103.849 E.61459
G1 X95.658 Y103.849 E.01375
G1 X77.851 Y86.042 E.63403
G1 X77.851 Y85.496 E.01375
G1 X96.204 Y103.849 E.65348
G1 X96.751 Y103.849 E.01375
G1 X77.851 Y84.949 E.67293
G1 X77.851 Y84.403 E.01375
G1 X97.297 Y103.849 E.69237
G1 X97.843 Y103.849 E.01375
G1 X77.851 Y83.857 E.71182
M73 P15 R7
G1 X77.851 Y83.311 E.01375
G1 X98.389 Y103.849 E.73127
G1 X98.935 Y103.849 E.01375
G1 X77.851 Y82.765 E.75072
G1 X77.851 Y82.218 E.01375
G1 X99.482 Y103.849 E.77016
G1 X100.028 Y103.849 E.01375
G1 X77.851 Y81.672 E.78961
G1 X77.851 Y81.126 E.01375
G1 X100.748 Y104.022 E.81524
M204 S10000
G1 X102.322 Y101.774 F42000
G1 F11651.692
M204 S6000
G1 X81.516 Y80.968 E.74081
G3 X81.464 Y81.462 I-1.431 J.098 E.01256
G1 X102.149 Y102.146 E.73649
G1 X102.149 Y102.693 E.01375
G1 X81.299 Y81.842 E.74239
G3 X81.046 Y82.136 I-.852 J-.478 E.00982
G1 X102.149 Y103.239 E.75138
G3 X102.016 Y103.653 I-.684 J.009 E.01113
G1 X80.724 Y82.36 E.75813
G3 X80.312 Y82.495 I-.708 J-1.471 E.01094
G1 X101.658 Y103.84 E.76002
G3 X101.12 Y103.849 I-.313 J-2.778 E.01356
G1 X79.752 Y82.48 E.76083
G3 X78.651 Y81.38 I.302 J-1.403 E.04143
G1 X77.851 Y80.58 E.02847
G1 X77.851 Y80.034 E.01375
G1 X78.641 Y80.824 E.02813
G3 X78.776 Y80.412 I1.485 J.256 E.01095
G1 X77.851 Y79.488 E.03291
G1 X77.851 Y78.941 E.01375
G1 X78.995 Y80.085 E.04072
G3 X79.295 Y79.839 I1.488 J1.513 E.00979
G1 X77.851 Y78.395 E.05142
G1 X77.851 Y77.849 E.01375
G1 X79.672 Y79.67 E.06485
G3 X80.168 Y79.62 I.4 J1.461 E.0126
G1 X77.851 Y77.303 E.08249
G1 X77.851 Y76.757 E.01375
G1 X102.149 Y101.054 E.86513
G1 X102.149 Y100.508 E.01375
G1 X77.987 Y76.346 E.86031
G3 X78.346 Y76.159 I.397 J.326 E.01049
G1 X102.149 Y99.962 E.8475
G1 X102.149 Y99.415 E.01375
G1 X78.884 Y76.151 E.82834
G1 X79.431 Y76.151 E.01375
G1 X102.149 Y98.869 E.80889
G1 X102.148 Y98.323 E.01375
G1 X79.977 Y76.151 E.78944
G1 X80.523 Y76.151 E.01375
G1 X102.148 Y97.777 E.76999
G1 X102.148 Y97.23 E.01375
G1 X81.069 Y76.151 E.75054
G1 X81.615 Y76.151 E.01375
G1 X102.148 Y96.684 E.73109
G1 X102.148 Y96.138 E.01375
G1 X82.161 Y76.151 E.71164
G1 X82.708 Y76.151 E.01375
G1 X102.148 Y95.592 E.6922
G1 X102.148 Y95.046 E.01375
G1 X83.254 Y76.151 E.67275
M73 P16 R7
G1 X83.8 Y76.151 E.01375
G1 X102.148 Y94.499 E.6533
G1 X102.148 Y93.953 E.01375
G1 X84.346 Y76.151 E.63385
G1 X84.892 Y76.151 E.01375
G1 X102.148 Y93.407 E.6144
G1 X102.148 Y92.861 E.01375
G1 X85.439 Y76.151 E.59495
G1 X85.985 Y76.151 E.01375
G1 X102.148 Y92.315 E.5755
G1 X102.148 Y91.768 E.01375
G1 X86.531 Y76.151 E.55606
G1 X87.077 Y76.151 E.01375
G1 X102.148 Y91.222 E.53661
G1 X102.148 Y90.676 E.01375
G1 X87.623 Y76.151 E.51716
G1 X88.17 Y76.151 E.01375
G1 X102.148 Y90.13 E.49771
G1 X102.148 Y89.583 E.01375
G1 X88.716 Y76.151 E.47826
G1 X89.262 Y76.151 E.01375
G1 X102.148 Y89.037 E.45881
G1 X102.148 Y88.491 E.01375
G1 X89.808 Y76.151 E.43936
G1 X90.354 Y76.151 E.01375
G1 X102.148 Y87.945 E.41992
G1 X102.148 Y87.399 E.01375
G1 X90.9 Y76.151 E.40047
G1 X91.447 Y76.151 E.01375
G1 X102.148 Y86.852 E.38102
G1 X102.148 Y86.306 E.01375
G1 X91.993 Y76.151 E.36157
G1 X92.539 Y76.151 E.01375
G1 X102.148 Y85.76 E.34212
G1 X102.148 Y85.214 E.01375
G1 X93.085 Y76.151 E.32267
G1 X93.631 Y76.151 E.01375
G1 X102.148 Y84.667 E.30322
G1 X102.147 Y84.121 E.01375
G1 X94.178 Y76.151 E.28378
G1 X94.724 Y76.151 E.01375
G1 X102.147 Y83.575 E.26433
G1 X102.147 Y83.029 E.01375
G1 X95.27 Y76.151 E.24488
G1 X95.816 Y76.151 E.01375
G1 X102.147 Y82.483 E.22543
G1 X102.147 Y81.936 E.01375
G1 X96.362 Y76.151 E.20598
G1 X96.908 Y76.151 E.01375
G1 X102.147 Y81.39 E.18653
G1 X102.147 Y80.844 E.01375
G1 X97.455 Y76.151 E.16708
G1 X98.001 Y76.151 E.01375
G1 X102.147 Y80.298 E.14763
G1 X102.147 Y79.751 E.01375
G1 X98.547 Y76.151 E.12819
G1 X99.093 Y76.151 E.01375
G1 X102.147 Y79.205 E.10874
G1 X102.147 Y78.659 E.01375
G1 X99.639 Y76.151 E.08929
G1 X100.186 Y76.151 E.01375
G1 X102.147 Y78.113 E.06984
G1 X102.147 Y77.567 E.01375
G1 X100.732 Y76.151 E.05039
G1 X101.278 Y76.151 E.01375
G1 X102.321 Y77.194 E.03712
; CHANGE_LAYER
; Z_HEIGHT: 0.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11651.692
G1 X101.278 Y76.151 E-.56031
G1 X100.752 Y76.151 E-.1997
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
G3 Z1 I-.287 J-1.183 P1  F42000
G1 X79.414 Y81.335 Z1
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X79.366 Y81.1 E.00604
G3 X79.982 Y80.36 I.704 J-.04 E.02664
G1 X80.052 Y80.355 E.00178
G3 X79.444 Y81.385 I.017 J.705 E.07543
; WIPE_START
M204 S6000
G1 X79.366 Y81.1 E-.1126
G1 X79.367 Y80.959 E-.05348
G1 X79.402 Y80.822 E-.05373
G1 X79.463 Y80.694 E-.0539
G1 X79.549 Y80.581 E-.05381
G1 X79.655 Y80.488 E-.05373
G1 X79.777 Y80.417 E-.05382
G1 X79.982 Y80.36 E-.08055
G1 X80.052 Y80.355 E-.0269
G1 X80.199 Y80.366 E-.05575
G1 X80.33 Y80.403 E-.05176
G1 X80.451 Y80.465 E-.05184
G1 X80.57 Y80.56 E-.05779
G1 X80.571 Y80.561 E-.00034
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.657 Y88.138 Z1.16 F42000
G1 X77.7 Y104.381 Z1.16
G1 Z.76
G1 E.8 F1800
G1 F11668.197
M204 S5000
G1 X77.687 Y104.368 E.00047
G3 X77.11 Y103.295 I.729 J-1.083 E.03186
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.011 E.05104
G1 X101.597 Y75.41 E.58308
G3 X102.888 Y76.637 I-.013 J1.307 E.04926
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.011 E.05104
G1 X78.403 Y104.59 E.58308
G3 X77.967 Y104.51 I.013 J-1.306 E.01119
G1 X77.754 Y104.407 E.00595
; WIPE_START
M204 S6000
G1 X77.687 Y104.368 E-.02968
G1 X77.488 Y104.212 E-.09586
G1 X77.294 Y103.963 E-.12002
G1 X77.186 Y103.735 E-.0961
M73 P17 R7
G1 X77.135 Y103.554 E-.07118
G1 X77.11 Y103.295 E-.09906
G1 X77.11 Y102.642 E-.24811
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

G1 X102.678 Y103.229
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
G1 F11668.197
M204 S2000
G1 X101.529 Y104.378 E.04086
G1 X100.983 Y104.378
G1 X102.678 Y102.683 E.06025
G1 X102.678 Y102.138
G1 X100.438 Y104.378 E.07964
G1 X99.893 Y104.378
G1 X102.678 Y101.593 E.09903
G1 X102.678 Y101.047
G1 X99.347 Y104.378 E.11842
G1 X98.802 Y104.378
G1 X102.678 Y100.502 E.13781
G1 X102.678 Y99.957
G1 X98.256 Y104.378 E.1572
G1 X97.711 Y104.378
G1 X102.678 Y99.411 E.17659
G1 X102.678 Y98.866
G1 X97.166 Y104.378 E.19598
G1 X96.62 Y104.378
G1 X102.678 Y98.32 E.21537
G1 X102.678 Y97.775
G1 X96.075 Y104.378 E.23476
G1 X95.529 Y104.378
G1 X102.677 Y97.23 E.25415
G1 X102.677 Y96.684
G1 X94.984 Y104.378 E.27355
G1 X94.439 Y104.378
G1 X102.677 Y96.139 E.29294
G1 X102.677 Y95.594
G1 X93.893 Y104.378 E.31233
G1 X93.348 Y104.378
G1 X102.677 Y95.048 E.33172
G1 X102.677 Y94.503
G1 X92.802 Y104.378 E.35111
G1 X92.257 Y104.378
G1 X102.677 Y93.958 E.3705
G1 X102.677 Y93.412
G1 X91.711 Y104.378 E.38989
G1 X91.166 Y104.378
G1 X102.677 Y92.867 E.40928
G1 X102.677 Y92.321
G1 X90.621 Y104.378 E.42867
G1 X90.075 Y104.378
G1 X102.677 Y91.776 E.44806
G1 X102.677 Y91.231
G1 X89.53 Y104.378 E.46745
G1 X88.984 Y104.378
G1 X102.677 Y90.685 E.48684
G1 X102.677 Y90.14
G1 X88.439 Y104.378 E.50623
G1 X87.894 Y104.378
G1 X102.677 Y89.595 E.52562
G1 X102.677 Y89.049
G1 X87.348 Y104.378 E.54502
G1 X86.803 Y104.378
G1 X102.677 Y88.504 E.56441
G1 X102.677 Y87.958
G1 X86.257 Y104.378 E.5838
G1 X85.712 Y104.378
G1 X102.677 Y87.413 E.60319
G1 X102.677 Y86.868
G1 X85.167 Y104.378 E.62258
M73 P18 R7
G1 X84.621 Y104.378
G1 X102.677 Y86.322 E.64197
G1 X102.677 Y85.777
G1 X84.076 Y104.378 E.66136
G1 X83.53 Y104.378
G1 X102.677 Y85.232 E.68075
G1 X102.677 Y84.686
G1 X82.985 Y104.378 E.70014
G1 X82.44 Y104.378
G1 X102.677 Y84.141 E.71953
G1 X102.677 Y83.596
G1 X81.894 Y104.378 E.73892
G1 X81.349 Y104.378
G1 X102.677 Y83.05 E.75831
G1 X102.676 Y82.505
G1 X80.803 Y104.378 E.7777
G1 X80.258 Y104.378
G1 X102.676 Y81.959 E.79709
G1 X102.676 Y81.414
G1 X79.713 Y104.378 E.81649
G1 X79.167 Y104.378
G1 X102.676 Y80.869 E.83588
G1 X102.676 Y80.323
G1 X78.622 Y104.378 E.85527
G1 X78.116 Y104.338
G1 X102.676 Y79.778 E.87325
G1 X102.676 Y79.233
G1 X77.751 Y104.158 E.88624
G1 X77.489 Y103.874
G1 X102.676 Y78.687 E.89553
G1 X102.676 Y78.142
G1 X77.339 Y103.479 E.90088
G1 X77.322 Y102.951
G1 X102.676 Y77.596 E.90147
G1 X102.676 Y77.051
G1 X77.322 Y102.405 E.90147
G1 X77.322 Y101.86
G1 X102.661 Y76.52 E.90095
M73 P19 R7
G1 X102.511 Y76.126
G1 X77.322 Y101.314 E.89558
G1 X77.322 Y100.769
G1 X102.249 Y75.842 E.88629
G1 X101.884 Y75.662
G1 X77.322 Y100.224 E.8733
G1 X77.322 Y99.678
G1 X101.378 Y75.622 E.85531
G1 X100.833 Y75.622
G1 X77.322 Y99.133 E.83592
G1 X77.322 Y98.587
G1 X100.287 Y75.622 E.81653
G1 X99.742 Y75.622
G1 X77.322 Y98.042 E.79714
G1 X77.322 Y97.496
G1 X99.196 Y75.622 E.77775
G1 X98.651 Y75.622
G1 X77.322 Y96.951 E.75836
G1 X77.322 Y96.406
G1 X98.106 Y75.622 E.73896
G1 X97.56 Y75.622
G1 X77.322 Y95.86 E.71957
G1 X77.322 Y95.315
G1 X97.015 Y75.622 E.70018
G1 X96.469 Y75.622
G1 X77.322 Y94.769 E.68079
G1 X77.322 Y94.224
G1 X95.924 Y75.622 E.66139
G1 X95.379 Y75.622
G1 X77.322 Y93.679 E.642
G1 X77.322 Y93.133
G1 X94.833 Y75.622 E.62261
G1 X94.288 Y75.622
G1 X77.322 Y92.588 E.60322
G1 X77.322 Y92.042
G1 X93.742 Y75.622 E.58383
G1 X93.197 Y75.622
G1 X77.322 Y91.497 E.56444
G1 X77.322 Y90.952
G1 X92.652 Y75.622 E.54504
M73 P20 R7
G1 X92.106 Y75.622
G1 X77.322 Y90.406 E.52565
G1 X77.322 Y89.861
G1 X91.561 Y75.622 E.50626
G1 X91.015 Y75.622
G1 X77.322 Y89.315 E.48687
G1 X77.322 Y88.77
G1 X90.47 Y75.622 E.46748
G1 X89.925 Y75.622
G1 X77.322 Y88.225 E.44808
G1 X77.322 Y87.679
G1 X89.379 Y75.622 E.42869
G1 X88.834 Y75.622
G1 X77.322 Y87.134 E.4093
G1 X77.322 Y86.588
G1 X88.288 Y75.622 E.38991
G1 X87.743 Y75.622
G1 X77.322 Y86.043 E.37052
G1 X77.322 Y85.498
G1 X87.198 Y75.622 E.35112
G1 X86.652 Y75.622
G1 X80.954 Y81.321 E.20262
G1 X80.945 Y80.783
G1 X86.107 Y75.622 E.18351
G1 X85.561 Y75.622
G1 X80.745 Y80.439 E.17125
G1 X80.425 Y80.213
G1 X85.016 Y75.622 E.16324
G1 X84.471 Y75.622
G1 X79.941 Y80.152 E.16107
; WIPE_START
M204 S6000
G1 X81.355 Y78.738 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.324 Y81.95 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X77.322 Y84.952 E.10675
G1 X77.322 Y84.407
G1 X79.788 Y81.941 E.08767
G1 X79.443 Y81.741
G1 X77.322 Y83.861 E.07539
G1 X77.322 Y83.316
G1 X79.218 Y81.42 E.06741
G1 X79.156 Y80.937
G1 X77.322 Y82.771 E.06519
G1 X77.322 Y82.225
G1 X83.925 Y75.622 E.23477
G1 X83.38 Y75.622
G1 X77.322 Y81.68 E.21538
G1 X77.322 Y81.134
G1 X82.834 Y75.622 E.19599
G1 X82.289 Y75.622
G1 X77.322 Y80.589 E.1766
G1 X77.322 Y80.044
G1 X81.744 Y75.622 E.1572
M73 P20 R6
G1 X81.198 Y75.622
G1 X77.322 Y79.498 E.13781
G1 X77.322 Y78.953
G1 X80.653 Y75.622 E.11842
G1 X80.107 Y75.622
G1 X77.322 Y78.407 E.09903
G1 X77.322 Y77.862
G1 X79.562 Y75.622 E.07964
G1 X79.016 Y75.622
G1 X77.322 Y77.316 E.06024
G1 X77.322 Y76.771
G1 X78.471 Y75.622 E.04085
M204 S10000
G1 X78.136 Y75.637 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.180697
G1 F18000
M204 S6000
G1 X77.878 Y75.829 E.00307
; LINE_WIDTH: 0.212461
G2 X77.496 Y76.221 I1.467 J1.811 E.00637
; LINE_WIDTH: 0.174528
G1 X77.339 Y76.437 E.00244
; WIPE_START
G1 X77.496 Y76.221 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.665 Y81.837 Z1.16 F42000
G1 X102.663 Y103.564 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.183778
G1 F18000
M204 S6000
G3 X102.444 Y103.857 I-4.085 J-2.826 E.00356
; LINE_WIDTH: 0.216761
G3 X102.122 Y104.171 I-1.636 J-1.351 E.00536
; LINE_WIDTH: 0.180811
G1 X101.864 Y104.363 E.00307
; WIPE_START
G1 X102.122 Y104.171 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.491 Y104.014 Z1.16 F42000
G1 X77.427 Y103.664 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.0902653
M73 P21 R6
G1 F18000
M204 S6000
G1 X77.339 Y103.503 E.00067
; WIPE_START
G1 X77.427 Y103.664 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.047 Y96.056 Z1.16 F42000
G1 X79.313 Y80.537 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.0829455
G1 F18000
M204 S6000
G1 X79.275 Y80.582 E.00019
; LINE_WIDTH: 0.101337
G1 X79.222 Y80.657 E.0004
; LINE_WIDTH: 0.143331
G2 X79.084 Y80.865 I1.989 J1.468 E.00178
; WIPE_START
G1 X79.222 Y80.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.863 Y80.075 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.111802
G1 F18000
M204 S6000
G2 X79.541 Y80.308 I2.156 J3.322 E.00201
; WIPE_START
G1 X79.863 Y80.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.947 Y81.314 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.184793
G1 F18000
M204 S6000
G1 X80.975 Y81.457 E.00143
; LINE_WIDTH: 0.18448
G1 X80.921 Y81.529 E.00088
; LINE_WIDTH: 0.141426
G1 X80.731 Y81.749 E.00203
G3 X80.588 Y81.877 I-1.346 J-1.371 E.00134
; LINE_WIDTH: 0.172223
G1 X80.461 Y81.969 E.00141
G3 X80.316 Y81.941 I.252 J-1.69 E.00133
; CHANGE_LAYER
; Z_HEIGHT: 0.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X80.461 Y81.969 E-.36761
G1 X80.588 Y81.877 E-.39239
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/50
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.16 I.317 J1.175 P1  F42000
G1 X101.49 Y76.24 Z1.16
G1 Z.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2150
M204 S5000
G1 X101.49 Y75.744 E.01247
G1 X101.821 Y75.817 E.00851
G3 X102.51 Y76.694 I-.246 J.903 E.03006
G1 X102.51 Y103.306 E.66904
G3 X102.174 Y104.007 I-.977 J-.037 E.02011
G3 X101.49 Y104.26 I-.847 J-1.237 E.01851
G1 X101.49 Y103.76 E.01258
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.308 I.057 J-.92 E.03452
G1 X77.49 Y76.695 E.66907
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.744 E-.18982
G1 X101.821 Y75.817 E-.12861
G1 X102.068 Y75.919 E-.10174
G1 X102.174 Y75.993 E-.04911
G1 X102.304 Y76.123 E-.06996
G1 X102.379 Y76.229 E-.0491
G1 X102.458 Y76.395 E-.06987
G1 X102.492 Y76.519 E-.04908
G1 X102.506 Y76.657 E-.05271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.418 Y82.346 Z1.32 F42000
G1 X77.708 Y104.384 Z1.32
G1 Z.92
G1 E.8 F1800
G1 F2150
M204 S5000
G1 X77.493 Y104.208 E.00699
G3 X77.11 Y103.295 I.924 J-.924 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.011 E.05104
G1 X101.599 Y75.41 E.58312
G3 X102.888 Y76.637 I-.015 J1.307 E.04922
G1 X102.89 Y103.297 E.67028
M73 P22 R6
G3 X101.595 Y104.59 I-1.306 J-.014 E.05098
G1 X78.405 Y104.59 E.58301
G3 X77.76 Y104.413 I.011 J-1.306 E.01701
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.493 Y104.208 E-.12821
G1 X77.326 Y104.015 E-.09681
G1 X77.186 Y103.735 E-.11896
G1 X77.124 Y103.487 E-.09721
G1 X77.11 Y103.295 E-.07318
G1 X77.11 Y102.648 E-.24563
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

G1 X86.21 Y104.175
G1 Z.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2150
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z1.32 F42000
G1 X101.29 Y75.825 Z1.32
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.463625
G1 F2150
M204 S6000
G1 X86.21 Y75.825 E.422
; WIPE_START
G1 F10482.449
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.745 Y79.881 Z1.32 F42000
G1 X79.434 Y81.33 Z1.32
G1 Z.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2150
M204 S5000
G1 X79.395 Y81.197 E.00311
G3 X79.917 Y80.393 I.675 J-.133 E.02373
G1 X80.053 Y80.376 E.00307
G3 X79.461 Y81.384 I.017 J.688 E.06548
M204 S250
G1 X79.363 Y81.043 F42000
G1 F2150
M204 S5000
G1 X79.363 Y80.994 E.00109
G3 X80.088 Y80.354 I.707 J.07 E.02379
G1 X80.158 Y80.36 E.00158
G3 X79.363 Y81.136 I-.088 J.705 E.07135
G1 X79.363 Y81.103 E.00073
; WIPE_START
G1 F12000
M204 S6000
G1 X79.363 Y80.994 E-.04133
G1 X79.391 Y80.855 E-.05389
G1 X79.446 Y80.725 E-.05371
G1 X79.525 Y80.608 E-.05378
G1 X79.627 Y80.509 E-.05374
G1 X79.81 Y80.403 E-.08059
G1 X79.947 Y80.365 E-.05382
G1 X80.088 Y80.354 E-.05382
G1 X80.158 Y80.36 E-.02691
G1 X80.296 Y80.391 E-.05374
G1 X80.425 Y80.449 E-.05378
G1 X80.54 Y80.532 E-.05381
G1 X80.637 Y80.636 E-.0538
G1 X80.711 Y80.756 E-.05381
G1 X80.728 Y80.805 E-.01945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z1.32 F42000
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2150
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2150
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z1.32 F42000
G1 X85.19 Y97.29 Z1.32
G1 Z.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2150
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2150
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 1.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/50
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.32 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z1.32
G1 Z1.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.744 E.01247
G1 X101.82 Y75.817 E.00851
G3 X102.51 Y76.692 I-.237 J.896 E.03006
G1 X102.51 Y103.308 E.66916
G3 X102.178 Y104.003 I-.955 J-.029 E.01993
G3 X101.49 Y104.261 I-.882 J-1.309 E.01864
M73 P23 R6
G1 X101.49 Y103.76 E.01258
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.353 Y104.209 E.19252
G3 X77.49 Y103.308 I.059 J-.92 E.03446
G1 X77.49 Y76.695 E.66907
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.744 E-.18985
G1 X101.82 Y75.817 E-.12857
G1 X102.068 Y75.919 E-.10184
G1 X102.174 Y75.993 E-.04915
G1 X102.303 Y76.121 E-.06886
G1 X102.404 Y76.272 E-.06897
G1 X102.456 Y76.39 E-.04906
G1 X102.501 Y76.569 E-.06999
G1 X102.507 Y76.657 E-.03371
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.418 Y82.345 Z1.48 F42000
G1 X77.7 Y104.381 Z1.48
G1 Z1.08
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.687 Y104.368 E.00047
G3 X77.11 Y103.295 I.729 J-1.083 E.03186
G1 X77.11 Y76.705 E.66849
G3 X78.403 Y75.41 I1.307 J.011 E.05098
G1 X101.6 Y75.41 E.58322
G3 X102.888 Y76.637 I-.016 J1.307 E.04918
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
G1 X78.405 Y104.59 E.58301
G3 X77.906 Y104.486 I.01 J-1.306 E.01291
G1 X77.753 Y104.408 E.0043
; WIPE_START
M73 P24 R6
G1 F11668.197
M204 S6000
G1 X77.687 Y104.368 E-.02967
G1 X77.488 Y104.212 E-.09592
G1 X77.325 Y104.012 E-.09801
G1 X77.186 Y103.734 E-.11801
G1 X77.134 Y103.549 E-.07312
G1 X77.11 Y103.295 E-.0971
G1 X77.11 Y102.642 E-.24817
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

G1 X86.21 Y104.175
G1 Z1.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z1.48 F42000
G1 X101.29 Y75.825 Z1.48
G1 Z1.08
G1 E.8 F1800
; LINE_WIDTH: 0.463595
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42197
; WIPE_START
G1 F10483.189
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.744 Y79.879 Z1.48 F42000
G1 X79.433 Y81.328 Z1.48
G1 Z1.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.396 Y81.201 E.00296
G3 X79.916 Y80.393 I.674 J-.138 E.02383
G1 X80.053 Y80.376 E.00307
G3 X79.46 Y81.382 I.017 J.688 E.06552
M204 S250
G1 X79.361 Y81.055 F42000
G1 F2153
M204 S5000
G1 X79.362 Y81.03 E.00057
G3 X80.091 Y80.354 I.71 J.035 E.02462
G1 X80.158 Y80.36 E.00151
G3 X79.369 Y81.171 I-.087 J.705 E.07059
G1 X79.365 Y81.115 E.00125
; WIPE_START
G1 F12000
M204 S6000
G1 X79.362 Y81.03 E-.03246
G1 X79.381 Y80.89 E-.05371
G1 X79.429 Y80.756 E-.05383
G1 X79.503 Y80.636 E-.05376
G1 X79.6 Y80.532 E-.05379
G1 X79.714 Y80.449 E-.05377
G1 X79.844 Y80.391 E-.05387
G1 X80.091 Y80.354 E-.0951
G1 X80.158 Y80.36 E-.0256
G1 X80.296 Y80.391 E-.05379
G1 X80.426 Y80.449 E-.05385
G1 X80.54 Y80.532 E-.05378
G1 X80.637 Y80.636 E-.05376
G1 X80.711 Y80.757 E-.05385
G1 X80.724 Y80.794 E-.01507
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z1.48 F42000
G1 Z1.08
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z1.48 F42000
G1 X85.19 Y97.29 Z1.48
G1 Z1.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 1.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/50
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.48 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z1.48
G1 Z1.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.744 E.01247
G1 X101.82 Y75.817 E.00849
G3 X102.51 Y76.692 I-.246 J.903 E.03002
G1 X102.51 Y103.305 E.66908
G3 X102.174 Y104.007 I-.954 J-.026 E.02015
G3 X101.49 Y104.26 I-.847 J-1.236 E.01853
G1 X101.49 Y103.76 E.01258
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.352 Y104.209 E.19252
G3 X77.49 Y103.308 I.06 J-.92 E.03445
G1 X77.49 Y76.695 E.66907
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
M73 P25 R6
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.744 E-.1898
G1 X101.82 Y75.817 E-.12836
G1 X102.066 Y75.918 E-.101
G1 X102.211 Y76.025 E-.0684
G1 X102.301 Y76.119 E-.04963
G1 X102.403 Y76.271 E-.06935
G1 X102.456 Y76.39 E-.04974
G1 X102.501 Y76.567 E-.06921
G1 X102.507 Y76.657 E-.03453
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.418 Y82.345 Z1.64 F42000
G1 X77.699 Y104.381 Z1.64
G1 Z1.24
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.689 Y104.369 E.0004
G3 X77.11 Y103.295 I.728 J-1.085 E.03192
G1 X77.11 Y76.705 E.6685
G3 X78.405 Y75.41 I1.306 J.011 E.05104
G1 X101.602 Y75.41 E.58319
G3 X102.888 Y76.637 I-.018 J1.306 E.04915
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.011 E.05104
G1 X78.405 Y104.59 E.58302
G3 X77.967 Y104.51 I.012 J-1.307 E.01125
G1 X77.753 Y104.407 E.00597
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.689 Y104.369 E-.02841
G1 X77.488 Y104.212 E-.09667
G1 X77.326 Y104.015 E-.09715
G1 X77.186 Y103.735 E-.11906
G1 X77.135 Y103.554 E-.07122
G1 X77.11 Y103.295 E-.09904
G1 X77.11 Y102.641 E-.24844
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

G1 X86.21 Y104.175
G1 Z1.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z1.64 F42000
G1 X101.29 Y75.825 Z1.64
G1 Z1.24
G1 E.8 F1800
; LINE_WIDTH: 0.463575
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42195
; WIPE_START
G1 F10483.689
G1 X88.21 Y75.825 E-.76
; WIPE_END
M73 P26 R6
G1 E-.04 F1800
M204 S10000
G1 X81.744 Y79.88 Z1.64 F42000
G1 X79.433 Y81.329 Z1.64
G1 Z1.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.396 Y81.201 E.00297
G3 X79.916 Y80.393 I.674 J-.138 E.02383
G1 X80.053 Y80.376 E.00307
G3 X79.46 Y81.382 I.017 J.688 E.06552
M204 S250
G1 X79.361 Y81.053 F42000
G1 F2153
M204 S5000
G1 X79.362 Y81.03 E.00053
G3 X80.092 Y80.355 I.71 J.035 E.02464
G1 X80.158 Y80.36 E.00148
G3 X79.369 Y81.17 I-.087 J.705 E.0706
G1 X79.365 Y81.113 E.00128
; WIPE_START
G1 F12000
M204 S6000
G1 X79.362 Y81.03 E-.03182
G1 X79.381 Y80.89 E-.05368
G1 X79.429 Y80.757 E-.05378
G1 X79.503 Y80.636 E-.05387
G1 X79.6 Y80.532 E-.0538
G1 X79.714 Y80.449 E-.05377
G1 X79.843 Y80.391 E-.05378
G1 X80.092 Y80.355 E-.09555
G1 X80.158 Y80.36 E-.02521
G1 X80.296 Y80.391 E-.05373
G1 X80.425 Y80.449 E-.05381
G1 X80.541 Y80.532 E-.05389
G1 X80.637 Y80.636 E-.05376
G1 X80.711 Y80.757 E-.05381
G1 X80.725 Y80.795 E-.01573
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z1.64 F42000
G1 Z1.24
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z1.64 F42000
G1 X85.19 Y97.29 Z1.64
G1 Z1.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/50
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.64 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z1.64
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.744 E.01248
G1 X101.821 Y75.817 E.00852
G3 X102.51 Y76.692 I-.247 J.903 E.02999
G1 X102.51 Y103.305 E.66907
G3 X102.176 Y104.005 I-.955 J-.025 E.02008
G3 X101.49 Y104.261 I-.85 J-1.234 E.0186
G1 X101.49 Y103.76 E.01259
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.056 J-.92 E.03459
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.744 E-.18996
G1 X101.821 Y75.817 E-.12883
G1 X102.066 Y75.918 E-.10061
G1 X102.21 Y76.024 E-.06791
G1 X102.301 Y76.119 E-.05
G1 X102.402 Y76.27 E-.06901
G1 X102.456 Y76.39 E-.0501
G1 X102.501 Y76.569 E-.06998
G1 X102.507 Y76.657 E-.03361
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.418 Y82.344 Z1.8 F42000
G1 X77.699 Y104.38 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.687 Y104.368 E.00043
G3 X77.11 Y103.295 I.729 J-1.083 E.03186
G1 X77.11 Y76.705 E.6685
G3 X78.403 Y75.41 I1.306 J.011 E.05098
G1 X101.603 Y75.41 E.58329
M73 P27 R6
G3 X102.888 Y76.637 I-.019 J1.306 E.04911
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.011 E.05104
G1 X78.403 Y104.59 E.58307
G3 X77.967 Y104.511 I.013 J-1.306 E.0112
G1 X77.752 Y104.406 E.006
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.687 Y104.368 E-.02897
G1 X77.488 Y104.212 E-.09592
G1 X77.294 Y103.963 E-.11994
G1 X77.186 Y103.734 E-.09618
G1 X77.135 Y103.554 E-.07103
G1 X77.11 Y103.295 E-.09914
G1 X77.11 Y102.64 E-.24882
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

G1 X86.21 Y104.175
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z1.8 F42000
G1 X101.29 Y75.825 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.463544
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42192
; WIPE_START
G1 F10484.431
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.744 Y79.88 Z1.8 F42000
G1 X79.433 Y81.33 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.395 Y81.201 E.003
G3 X79.916 Y80.393 I.675 J-.138 E.02384
G1 X80.053 Y80.376 E.00307
G3 X79.46 Y81.383 I.017 J.688 E.06554
M204 S250
G1 X79.361 Y81.054 F42000
G1 F2153
M204 S5000
G1 X79.362 Y81.03 E.00054
G3 X80.093 Y80.355 I.71 J.035 E.02466
G1 X80.158 Y80.36 E.00146
G3 X79.369 Y81.171 I-.086 J.705 E.0706
G1 X79.365 Y81.114 E.00128
; WIPE_START
G1 F12000
M204 S6000
G1 X79.362 Y81.03 E-.03195
G1 X79.381 Y80.89 E-.05368
G1 X79.429 Y80.757 E-.05379
G1 X79.503 Y80.636 E-.05388
G1 X79.6 Y80.532 E-.05375
G1 X79.714 Y80.449 E-.0538
G1 X79.844 Y80.391 E-.05381
G1 X80.093 Y80.355 E-.09586
G1 X80.158 Y80.36 E-.02487
G1 X80.296 Y80.391 E-.05381
G1 X80.425 Y80.449 E-.05379
G1 X80.54 Y80.532 E-.05378
G1 X80.637 Y80.636 E-.05381
G1 X80.711 Y80.757 E-.05382
G1 X80.725 Y80.795 E-.01561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z1.8 F42000
G1 X85.19 Y97.29 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 1.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/50
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.8 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z1.8
G1 Z1.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.744 E.01247
M73 P28 R6
G1 X101.821 Y75.817 E.00851
G3 X102.51 Y76.695 I-.258 J.912 E.03
G1 X102.51 Y103.305 E.66903
G3 X102.174 Y104.007 I-.953 J-.026 E.02013
G3 X101.49 Y104.26 I-.847 J-1.234 E.01853
G1 X101.49 Y103.76 E.01258
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.353 Y104.209 E.19252
G3 X77.49 Y103.305 I.06 J-.92 E.03452
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.744 E-.18979
G1 X101.821 Y75.817 E-.12865
G1 X102.066 Y75.918 E-.10075
G1 X102.209 Y76.023 E-.06762
G1 X102.303 Y76.121 E-.05131
G1 X102.379 Y76.229 E-.05025
G1 X102.458 Y76.395 E-.0699
G1 X102.492 Y76.519 E-.04906
G1 X102.506 Y76.657 E-.05268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.417 Y82.345 Z1.96 F42000
G1 X77.698 Y104.38 Z1.96
G1 Z1.56
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.687 Y104.368 E.00041
G3 X77.11 Y103.295 I.729 J-1.083 E.03187
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.605 Y75.41 E.58327
G3 X102.888 Y76.634 I-.021 J1.307 E.04901
G1 X102.89 Y103.297 E.67034
G3 X101.595 Y104.59 I-1.306 J-.013 E.05098
G1 X78.403 Y104.59 E.58307
M73 P29 R6
G3 X77.967 Y104.511 I.013 J-1.306 E.01119
G1 X77.752 Y104.406 E.00601
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.687 Y104.368 E-.02874
G1 X77.488 Y104.212 E-.09594
G1 X77.295 Y103.965 E-.11903
G1 X77.186 Y103.734 E-.09715
G1 X77.134 Y103.545 E-.07463
G1 X77.11 Y103.295 E-.09554
G1 X77.11 Y102.639 E-.24898
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

G1 X86.21 Y104.175
G1 Z1.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z1.96 F42000
G1 X101.29 Y75.825 Z1.96
G1 Z1.56
G1 E.8 F1800
; LINE_WIDTH: 0.463524
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.4219
; WIPE_START
G1 F10484.926
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.744 Y79.88 Z1.96 F42000
G1 X79.433 Y81.33 Z1.96
G1 Z1.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.396 Y81.201 E.00299
G3 X79.916 Y80.393 I.674 J-.138 E.02383
G1 X80.053 Y80.376 E.00307
G3 X79.46 Y81.383 I.017 J.688 E.06549
M204 S250
G1 X79.361 Y81.052 F42000
G1 F2153
M204 S5000
G1 X79.36 Y81.03 E.0005
G3 X80.054 Y80.354 I.708 J.034 E.02386
G1 X80.089 Y80.354 E.00079
G3 X79.367 Y81.171 I-.021 J.709 E.07189
G1 X79.364 Y81.112 E.00132
; WIPE_START
G1 F12000
M204 S6000
G1 X79.36 Y81.03 E-.03129
G1 X79.381 Y80.89 E-.05374
G1 X79.429 Y80.756 E-.0539
G1 X79.503 Y80.636 E-.05377
G1 X79.6 Y80.532 E-.05378
G1 X79.715 Y80.449 E-.05384
G1 X79.843 Y80.391 E-.05374
G1 X80.054 Y80.354 E-.08127
G1 X80.089 Y80.354 E-.01342
G1 X80.228 Y80.372 E-.05314
G1 X80.362 Y80.417 E-.0538
G1 X80.485 Y80.488 E-.05385
G1 X80.591 Y80.581 E-.05379
G1 X80.677 Y80.694 E-.05381
G1 X80.726 Y80.796 E-.04286
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z1.96 F42000
G1 Z1.56
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z1.96 F42000
G1 X85.19 Y97.29 Z1.96
G1 Z1.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 1.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/50
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.96 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z1.96
G1 Z1.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.744 E.01247
G1 X101.821 Y75.817 E.00852
G3 X102.51 Y76.692 I-.248 J.904 E.02998
G1 X102.51 Y103.308 E.66916
G3 X102.176 Y104.005 I-.953 J-.028 E.02001
G3 X101.49 Y104.261 I-.877 J-1.305 E.01857
G1 X101.49 Y103.76 E.01258
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.056 J-.92 E.03459
G1 X77.49 Y76.695 E.66901
M73 P30 R6
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.744 E-.18991
G1 X101.821 Y75.817 E-.1288
G1 X102.066 Y75.918 E-.10066
G1 X102.208 Y76.023 E-.06727
G1 X102.301 Y76.119 E-.05068
G1 X102.401 Y76.268 E-.06837
G1 X102.456 Y76.39 E-.05056
G1 X102.501 Y76.569 E-.07007
G1 X102.507 Y76.657 E-.03368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.418 Y82.345 Z2.12 F42000
G1 X77.698 Y104.381 Z2.12
G1 Z1.72
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.687 Y104.371 E.00037
G3 X77.11 Y103.295 I.721 J-1.08 E.03197
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.011 E.05105
G1 X101.606 Y75.41 E.5833
G3 X102.888 Y76.637 I-.022 J1.306 E.04903
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.299 J-.004 E.05112
G1 X78.403 Y104.59 E.58307
G3 X77.85 Y104.464 I.006 J-1.299 E.01438
G1 X77.751 Y104.41 E.00284
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.687 Y104.371 E-.02821
G1 X77.444 Y104.166 E-.12076
G1 X77.294 Y103.963 E-.09606
G1 X77.186 Y103.735 E-.09609
G1 X77.135 Y103.554 E-.07115
G1 X77.11 Y103.295 E-.09912
G1 X77.11 Y102.64 E-.24863
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

G1 X86.21 Y104.175
G1 Z1.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
M73 P31 R6
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z2.12 F42000
G1 X101.29 Y75.825 Z2.12
G1 Z1.72
G1 E.8 F1800
; LINE_WIDTH: 0.463494
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42187
; WIPE_START
G1 F10485.667
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.745 Y79.881 Z2.12 F42000
G1 X79.434 Y81.331 Z2.12
G1 Z1.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.394 Y81.202 E.00303
G3 X79.917 Y80.393 I.676 J-.137 E.02385
G1 X80.053 Y80.376 E.00307
G3 X79.46 Y81.385 I.017 J.689 E.0656
M204 S250
G1 X79.361 Y81.05 F42000
G1 F2153
M204 S5000
G1 X79.359 Y81.029 E.00046
G3 X80.054 Y80.354 I.71 J.035 E.02387
G1 X80.09 Y80.354 E.00081
G3 X79.366 Y81.171 I-.022 J.71 E.07204
G1 X79.363 Y81.11 E.00138
; WIPE_START
G1 F12000
M204 S6000
G1 X79.359 Y81.029 E-.03057
G1 X79.381 Y80.89 E-.05382
G1 X79.429 Y80.756 E-.05387
G1 X79.503 Y80.636 E-.05374
G1 X79.6 Y80.532 E-.05385
G1 X79.714 Y80.449 E-.05375
G1 X79.843 Y80.391 E-.05381
G1 X80.054 Y80.354 E-.08123
G1 X80.09 Y80.354 E-.01376
G1 X80.228 Y80.372 E-.05288
G1 X80.362 Y80.417 E-.0538
G1 X80.485 Y80.488 E-.05375
G1 X80.591 Y80.581 E-.05383
G1 X80.677 Y80.694 E-.05375
G1 X80.726 Y80.798 E-.0436
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z2.12 F42000
G1 Z1.72
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z2.12 F42000
G1 X85.19 Y97.29 Z2.12
G1 Z1.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 1.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/50
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.12 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z2.12
G1 Z1.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.744 E.01247
G1 X101.821 Y75.817 E.00852
G3 X102.51 Y76.692 I-.237 J.896 E.03003
G1 X102.51 Y103.305 E.66911
G3 X102.176 Y104.005 I-.953 J-.026 E.02008
G3 X101.49 Y104.261 I-.876 J-1.303 E.01856
G1 X101.49 Y103.76 E.01258
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.057 J-.92 E.03458
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.744 E-.18989
G1 X101.821 Y75.817 E-.12881
G1 X102.064 Y75.917 E-.09967
G1 X102.174 Y75.993 E-.05092
G1 X102.303 Y76.121 E-.06907
G1 X102.401 Y76.267 E-.06695
G1 X102.456 Y76.39 E-.05097
G1 X102.5 Y76.563 E-.06805
G1 X102.507 Y76.657 E-.03568
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P32 R6
G1 X97.417 Y82.344 Z2.28 F42000
G1 X77.697 Y104.379 Z2.28
G1 Z1.88
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.687 Y104.368 E.00039
G3 X77.11 Y103.295 I.729 J-1.083 E.03187
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.011 E.05105
G1 X101.608 Y75.41 E.58334
M73 P32 R5
G3 X102.888 Y76.637 I-.024 J1.306 E.049
G1 X102.89 Y103.295 E.67021
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
G1 X78.403 Y104.59 E.58307
G3 X77.967 Y104.51 I.013 J-1.306 E.0112
G1 X77.751 Y104.406 E.00603
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.687 Y104.368 E-.02836
G1 X77.488 Y104.212 E-.09596
G1 X77.321 Y104.006 E-.10081
G1 X77.186 Y103.735 E-.11531
G1 X77.135 Y103.554 E-.07117
G1 X77.11 Y103.295 E-.09908
G1 X77.11 Y102.639 E-.24931
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

G1 X86.21 Y104.175
G1 Z1.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z2.28 F42000
G1 X101.29 Y75.825 Z2.28
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.463463
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42184
; WIPE_START
G1 F10486.41
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.749 Y79.888 Z2.28 F42000
G1 X79.44 Y81.34 Z2.28
G1 Z1.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.405 Y81.234 E.00249
G3 X79.984 Y80.381 I.667 J-.17 E.02607
G1 X80.058 Y80.376 E.00165
G3 X79.467 Y81.393 I.015 J.688 E.06524
M204 S250
G1 X79.361 Y81.048 F42000
G1 F2153
M204 S5000
G1 X79.358 Y81.029 E.00041
G3 X80.054 Y80.354 I.71 J.035 E.02387
G1 X80.091 Y80.354 E.00084
G3 X79.366 Y81.171 I-.023 J.71 E.07201
G1 X79.363 Y81.108 E.00142
; WIPE_START
G1 F12000
M204 S6000
G1 X79.358 Y81.029 E-.02977
G1 X79.381 Y80.89 E-.05384
G1 X79.429 Y80.757 E-.05382
G1 X79.503 Y80.636 E-.05384
G1 X79.6 Y80.532 E-.0538
G1 X79.715 Y80.449 E-.05377
G1 X79.843 Y80.391 E-.05376
G1 X80.054 Y80.354 E-.08122
G1 X80.091 Y80.354 E-.01419
G1 X80.228 Y80.372 E-.05244
G1 X80.363 Y80.417 E-.05385
G1 X80.485 Y80.488 E-.05378
G1 X80.591 Y80.581 E-.05375
G1 X80.677 Y80.694 E-.05384
G1 X80.727 Y80.799 E-.04434
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z2.28 F42000
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
M73 P33 R5
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z2.28 F42000
G1 X85.19 Y97.29 Z2.28
G1 Z1.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/50
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.28 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z2.28
G1 Z2.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.744 E.01247
G1 X101.821 Y75.817 E.00852
G3 X102.51 Y76.692 I-.237 J.896 E.03005
G1 X102.51 Y103.305 E.66909
G3 X102.176 Y104.005 I-.953 J-.026 E.02007
G3 X101.49 Y104.26 I-.874 J-1.3 E.01857
G1 X101.49 Y103.76 E.01258
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.353 Y104.209 E.19252
G3 X77.49 Y103.305 I.059 J-.92 E.03452
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.744 E-.18984
G1 X101.821 Y75.817 E-.12874
G1 X102.063 Y75.916 E-.09943
G1 X102.174 Y75.993 E-.05129
G1 X102.303 Y76.121 E-.0691
G1 X102.401 Y76.267 E-.06656
G1 X102.456 Y76.39 E-.05129
G1 X102.501 Y76.569 E-.07007
G1 X102.507 Y76.657 E-.03369
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.418 Y82.345 Z2.44 F42000
G1 X77.703 Y104.38 Z2.44
G1 Z2.04
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.494 Y104.208 E.00683
G3 X77.11 Y103.295 I.924 J-.925 E.02554
G1 X77.11 Y76.705 E.6685
G3 X78.405 Y75.41 I1.306 J.011 E.05104
G1 X101.609 Y75.41 E.58338
G3 X102.888 Y76.637 I-.025 J1.306 E.04896
G1 X102.89 Y103.297 E.67027
M73 P34 R5
G3 X101.595 Y104.59 I-1.306 J-.013 E.05098
G1 X78.405 Y104.59 E.58302
G3 X77.755 Y104.41 I.013 J-1.308 E.01714
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.494 Y104.208 E-.12575
G1 X77.295 Y103.965 E-.11907
G1 X77.185 Y103.732 E-.09793
G1 X77.135 Y103.552 E-.07121
G1 X77.11 Y103.295 E-.09815
G1 X77.11 Y102.642 E-.2479
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

G1 X86.21 Y104.175
G1 Z2.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z2.44 F42000
G1 X101.29 Y75.825 Z2.44
G1 Z2.04
G1 E.8 F1800
; LINE_WIDTH: 0.463453
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42183
; WIPE_START
G1 F10486.661
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.745 Y79.881 Z2.44 F42000
G1 X79.434 Y81.331 Z2.44
G1 Z2.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.397 Y81.201 E.00302
G3 X79.984 Y80.381 I.675 J-.137 E.02531
G1 X80.058 Y80.376 E.00165
G3 X79.462 Y81.382 I.015 J.688 E.06552
M204 S250
G1 X79.361 Y81.046 F42000
G1 F2153
M204 S5000
G1 X79.358 Y81.03 E.00036
G3 X80.054 Y80.354 I.71 J.035 E.02388
G1 X80.092 Y80.354 E.00086
G3 X79.365 Y81.171 I-.024 J.71 E.07199
G1 X79.363 Y81.106 E.00147
; WIPE_START
G1 F12000
M204 S6000
G1 X79.358 Y81.03 E-.02891
G1 X79.381 Y80.89 E-.05389
G1 X79.429 Y80.756 E-.05389
G1 X79.503 Y80.636 E-.05375
G1 X79.6 Y80.532 E-.0538
G1 X79.714 Y80.449 E-.05378
G1 X79.844 Y80.391 E-.0538
G1 X80.054 Y80.354 E-.08115
G1 X80.092 Y80.354 E-.01456
G1 X80.228 Y80.372 E-.05217
G1 X80.362 Y80.417 E-.05377
G1 X80.485 Y80.488 E-.05382
G1 X80.591 Y80.581 E-.05376
G1 X80.677 Y80.694 E-.05383
G1 X80.728 Y80.801 E-.04512
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z2.44 F42000
G1 Z2.04
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z2.44 F42000
G1 X85.19 Y97.29 Z2.44
G1 Z2.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/50
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.44 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z2.44
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.745 E.01245
G1 X101.821 Y75.817 E.00851
G3 X102.51 Y76.692 I-.237 J.896 E.03004
G1 X102.51 Y103.305 E.66909
G3 X102.177 Y104.004 I-.974 J-.035 E.02001
G3 X101.49 Y104.261 I-.876 J-1.296 E.01862
G1 X101.49 Y103.76 E.01258
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
M73 P35 R5
G1 X78.353 Y104.209 E.19252
G3 X77.49 Y103.308 I.059 J-.92 E.03445
G1 X77.49 Y76.695 E.66907
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.745 E-.18948
G1 X101.821 Y75.817 E-.12856
G1 X102.062 Y75.916 E-.0993
G1 X102.174 Y75.993 E-.05145
G1 X102.303 Y76.122 E-.06922
G1 X102.4 Y76.266 E-.06621
G1 X102.456 Y76.39 E-.05159
G1 X102.5 Y76.562 E-.06741
G1 X102.507 Y76.658 E-.03678
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.417 Y82.345 Z2.6 F42000
G1 X77.696 Y104.379 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.686 Y104.369 E.00035
G3 X77.11 Y103.295 I.725 J-1.08 E.03191
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.011 E.05105
G1 X101.611 Y75.41 E.58342
G3 X102.888 Y76.637 I-.027 J1.306 E.04892
G1 X102.89 Y103.295 E.67021
G3 X101.595 Y104.59 I-1.3 J-.005 E.0511
G1 X78.405 Y104.59 E.58301
G3 X77.966 Y104.512 I.005 J-1.3 E.01127
G1 X77.75 Y104.405 E.00606
; WIPE_START
M73 P36 R5
G1 F11668.197
M204 S6000
G1 X77.686 Y104.369 E-.02797
G1 X77.487 Y104.211 E-.09666
G1 X77.294 Y103.963 E-.11941
G1 X77.186 Y103.735 E-.09602
G1 X77.135 Y103.554 E-.0712
G1 X77.11 Y103.295 E-.09909
G1 X77.11 Y102.638 E-.24965
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

G1 X86.21 Y104.175
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z2.6 F42000
G1 X101.29 Y75.825 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.463423
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.4218
; WIPE_START
G1 F10487.402
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.745 Y79.882 Z2.6 F42000
G1 X79.434 Y81.332 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.396 Y81.201 E.00304
G3 X79.916 Y80.393 I.674 J-.138 E.02383
G1 X80.053 Y80.375 E.00308
G3 X79.461 Y81.384 I.017 J.688 E.06546
M204 S250
G1 X79.361 Y81.043 F42000
G1 F2153
M204 S5000
G1 X79.358 Y81.03 E.00031
G3 X80.054 Y80.354 I.71 J.035 E.02389
G1 X80.093 Y80.354 E.00088
G3 X79.365 Y81.171 I-.026 J.71 E.07196
G1 X79.363 Y81.103 E.00152
; WIPE_START
G1 F12000
M204 S6000
G1 X79.358 Y81.03 E-.02807
G1 X79.381 Y80.89 E-.05396
G1 X79.429 Y80.756 E-.05382
G1 X79.503 Y80.636 E-.05378
G1 X79.6 Y80.532 E-.05383
G1 X79.715 Y80.449 E-.0538
G1 X79.844 Y80.391 E-.05378
G1 X80.054 Y80.354 E-.08112
G1 X80.093 Y80.354 E-.01491
G1 X80.228 Y80.372 E-.05181
G1 X80.362 Y80.417 E-.05371
G1 X80.485 Y80.488 E-.05387
G1 X80.591 Y80.581 E-.0538
G1 X80.677 Y80.694 E-.05381
G1 X80.729 Y80.803 E-.04592
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z2.6 F42000
G1 X85.19 Y97.29 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/50
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.6 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z2.6
G1 Z2.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.745 E.01244
G1 X101.821 Y75.817 E.00851
G3 X102.51 Y76.692 I-.237 J.896 E.03004
G1 X102.51 Y103.305 E.66909
G3 X102.176 Y104.005 I-.954 J-.026 E.02009
G3 X101.49 Y104.261 I-.874 J-1.298 E.01856
G1 X101.49 Y103.76 E.01258
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.056 J-.92 E.03458
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
M73 P37 R5
G1 F11668.197
M204 S6000
G1 X101.49 Y75.745 E-.18936
G1 X101.821 Y75.817 E-.12858
G1 X102.062 Y75.915 E-.09886
G1 X102.174 Y75.993 E-.05183
G1 X102.303 Y76.121 E-.06917
G1 X102.4 Y76.265 E-.06595
G1 X102.456 Y76.39 E-.05186
G1 X102.5 Y76.561 E-.06715
G1 X102.507 Y76.659 E-.03724
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.417 Y82.346 Z2.76 F42000
G1 X77.696 Y104.379 Z2.76
G1 Z2.36
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.688 Y104.367 E.00036
G3 X77.11 Y103.295 I.731 J-1.085 E.03185
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.308 J.013 E.05102
G1 X101.612 Y75.41 E.58345
G3 X102.888 Y76.637 I-.021 J1.298 E.04895
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.306 J-.013 E.05098
G1 X78.405 Y104.59 E.58301
G3 X77.967 Y104.51 I.013 J-1.308 E.01126
G1 X77.75 Y104.405 E.00606
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.688 Y104.367 E-.02773
G1 X77.489 Y104.213 E-.09572
G1 X77.326 Y104.015 E-.09718
G1 X77.186 Y103.734 E-.11922
G1 X77.135 Y103.554 E-.07111
G1 X77.11 Y103.295 E-.0991
G1 X77.11 Y102.637 E-.24993
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

G1 X86.21 Y104.175
G1 Z2.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z2.76 F42000
G1 X101.29 Y75.825 Z2.76
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.463392
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42177
; WIPE_START
G1 F10488.141
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.75 Y79.889 Z2.76 F42000
G1 X79.441 Y81.342 Z2.76
G1 Z2.36
M73 P38 R5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.403 Y81.235 E.00255
G3 X79.917 Y80.393 I.667 J-.171 E.02461
G1 X80.053 Y80.376 E.00307
G3 X79.467 Y81.396 I.017 J.688 E.06523
M204 S250
G1 X79.36 Y81.041 F42000
G1 F2153
M204 S5000
G1 X79.359 Y81.03 E.00026
G3 X80.054 Y80.354 I.708 J.034 E.02387
G1 X80.094 Y80.354 E.0009
G3 X79.367 Y81.171 I-.026 J.709 E.07176
G1 X79.363 Y81.101 E.00157
; WIPE_START
G1 F12000
M204 S6000
G1 X79.359 Y81.03 E-.02721
G1 X79.381 Y80.89 E-.05383
G1 X79.429 Y80.756 E-.05384
G1 X79.503 Y80.636 E-.0538
G1 X79.599 Y80.532 E-.05373
G1 X79.714 Y80.449 E-.05383
G1 X79.844 Y80.391 E-.0538
G1 X80.054 Y80.354 E-.08113
G1 X80.094 Y80.354 E-.01527
G1 X80.228 Y80.372 E-.05144
G1 X80.362 Y80.417 E-.05383
G1 X80.485 Y80.488 E-.05374
G1 X80.591 Y80.581 E-.0538
G1 X80.677 Y80.694 E-.05388
G1 X80.73 Y80.806 E-.04689
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z2.76 F42000
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z2.76 F42000
G1 X85.19 Y97.29 Z2.76
G1 Z2.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/50
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.76 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z2.76
G1 Z2.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.744 E.01247
G1 X101.821 Y75.817 E.00852
G3 X102.51 Y76.692 I-.249 J.905 E.02997
G1 X102.51 Y103.305 E.66909
G3 X102.176 Y104.005 I-.954 J-.026 E.02009
G3 X101.49 Y104.26 I-.872 J-1.294 E.01857
G1 X101.49 Y103.76 E.01258
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.063 J-.926 E.03453
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.744 E-.18983
G1 X101.821 Y75.817 E-.12881
G1 X102.066 Y75.918 E-.10083
G1 X102.205 Y76.02 E-.06556
G1 X102.301 Y76.119 E-.0521
G1 X102.399 Y76.265 E-.06689
G1 X102.456 Y76.39 E-.05216
G1 X102.499 Y76.56 E-.06678
G1 X102.507 Y76.657 E-.03703
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.417 Y82.344 Z2.92 F42000
G1 X77.695 Y104.379 Z2.92
G1 Z2.52
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.687 Y104.368 E.00036
G3 X77.11 Y103.295 I.729 J-1.083 E.03186
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.614 Y75.41 E.58349
M73 P39 R5
G3 X102.888 Y76.637 I-.03 J1.306 E.04884
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
G1 X78.405 Y104.59 E.58301
G3 X77.894 Y104.481 I.01 J-1.306 E.01323
G1 X77.749 Y104.406 E.00411
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.687 Y104.368 E-.02778
G1 X77.488 Y104.212 E-.0959
G1 X77.294 Y103.963 E-.11998
G1 X77.186 Y103.735 E-.09608
G1 X77.135 Y103.554 E-.07119
G1 X77.11 Y103.295 E-.09905
G1 X77.11 Y102.637 E-.25001
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

G1 X86.21 Y104.175
G1 Z2.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z2.92 F42000
G1 X101.29 Y75.825 Z2.92
G1 Z2.52
G1 E.8 F1800
; LINE_WIDTH: 0.463372
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42175
; WIPE_START
G1 F10488.641
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.746 Y79.883 Z2.92 F42000
G1 X79.438 Y81.331 Z2.92
G1 Z2.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G3 X79.939 Y80.388 I.633 J-.268 E.02735
G1 X80.054 Y80.376 E.0026
G3 X79.464 Y81.386 I.017 J.688 E.0654
M204 S250
G1 X79.36 Y81.039 F42000
G1 F2153
M204 S5000
G1 X79.36 Y81.03 E.00021
G3 X80.054 Y80.354 I.707 J.033 E.02385
G1 X80.095 Y80.355 E.00092
G3 X79.368 Y81.171 I-.028 J.708 E.07161
G1 X79.364 Y81.099 E.00162
; WIPE_START
G1 F12000
M204 S6000
G1 X79.36 Y81.03 E-.02632
G1 X79.381 Y80.89 E-.05379
G1 X79.429 Y80.757 E-.05376
G1 X79.503 Y80.636 E-.05375
G1 X79.6 Y80.532 E-.0539
G1 X79.714 Y80.449 E-.05376
G1 X79.843 Y80.391 E-.05376
G1 X80.054 Y80.354 E-.08113
G1 X80.095 Y80.355 E-.01571
G1 X80.228 Y80.372 E-.05103
G1 X80.362 Y80.417 E-.0538
G1 X80.485 Y80.488 E-.05385
G1 X80.591 Y80.581 E-.05377
G1 X80.677 Y80.694 E-.05373
G1 X80.731 Y80.808 E-.04794
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z2.92 F42000
G1 Z2.52
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z2.92 F42000
G1 X85.19 Y97.29 Z2.92
G1 Z2.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/50
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.92 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z2.92
G1 Z2.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.746 E.01243
G1 X101.821 Y75.817 E.0085
G3 X102.51 Y76.691 I-.249 J.905 E.02996
G1 X102.51 Y103.305 E.66911
G3 X102.176 Y104.005 I-.953 J-.026 E.02008
G3 X101.49 Y104.259 I-.864 J-1.279 E.01856
M73 P40 R5
G1 X101.49 Y103.76 E.01255
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.056 J-.92 E.03459
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.746 E-.18921
G1 X101.821 Y75.817 E-.12853
G1 X102.066 Y75.918 E-.10096
G1 X102.205 Y76.02 E-.06532
G1 X102.301 Y76.119 E-.0524
G1 X102.404 Y76.272 E-.07021
G1 X102.456 Y76.39 E-.04909
G1 X102.499 Y76.559 E-.06618
G1 X102.507 Y76.659 E-.03811
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.417 Y82.346 Z3.08 F42000
G1 X77.695 Y104.378 Z3.08
G1 Z2.68
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.688 Y104.367 E.00034
G3 X77.11 Y103.295 I.731 J-1.085 E.03185
G1 X77.11 Y76.705 E.6685
G3 X78.405 Y75.41 I1.299 J.004 E.05111
G1 X101.615 Y75.411 E.58353
G3 X102.888 Y76.637 I-.031 J1.306 E.04881
G1 X102.89 Y103.295 E.67021
G3 X101.595 Y104.59 I-1.306 J-.011 E.05104
G1 X78.405 Y104.59 E.58302
M73 P41 R5
G3 X77.967 Y104.51 I.013 J-1.309 E.01125
G1 X77.749 Y104.404 E.00609
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.688 Y104.367 E-.02741
G1 X77.489 Y104.213 E-.09561
G1 X77.326 Y104.015 E-.09727
G1 X77.186 Y103.734 E-.11921
G1 X77.132 Y103.535 E-.07842
G1 X77.11 Y103.295 E-.09176
G1 X77.11 Y102.636 E-.25033
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

G1 X86.21 Y104.175
G1 Z2.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z3.08 F42000
G1 X101.29 Y75.825 Z3.08
G1 Z2.68
G1 E.8 F1800
; LINE_WIDTH: 0.463352
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42173
; WIPE_START
G1 F10489.136
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.642 Y79.712 Z3.08 F42000
G1 X79.382 Y81.049 Z3.08
G1 Z2.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.396 Y80.929 E.00271
G3 X79.938 Y80.388 I.675 J.135 E.01815
G1 X80.054 Y80.376 E.00262
G3 X79.384 Y81.109 I.017 J.688 E.07197
M204 S250
G1 X79.413 Y81.332 F42000
G1 F2153
M204 S5000
G1 X79.4 Y81.309 E.0006
G3 X80.054 Y80.354 I.667 J-.244 E.03025
G1 X80.096 Y80.355 E.00095
G3 X79.462 Y81.437 I-.029 J.71 E.06552
G1 X79.439 Y81.386 E.00124
; WIPE_START
G1 F12000
M204 S6000
G1 X79.4 Y81.309 E-.03299
G1 X79.367 Y81.171 E-.05383
G1 X79.36 Y81.03 E-.05381
G1 X79.381 Y80.889 E-.05382
G1 X79.429 Y80.757 E-.05373
G1 X79.503 Y80.636 E-.05382
G1 X79.599 Y80.532 E-.05378
G1 X79.715 Y80.449 E-.05386
G1 X79.844 Y80.391 E-.05378
G1 X80.054 Y80.354 E-.08105
G1 X80.096 Y80.355 E-.01609
G1 X80.228 Y80.372 E-.05068
G1 X80.362 Y80.417 E-.05379
G1 X80.485 Y80.488 E-.05379
G1 X80.566 Y80.559 E-.04118
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3.08 F42000
G1 Z2.68
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z3.08 F42000
G1 X85.19 Y97.29 Z3.08
G1 Z2.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/50
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.08 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z3.08
G1 Z2.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.733 E.01275
G1 X101.901 Y75.841 E.01069
G3 X102.51 Y76.695 I-.306 J.862 E.02808
G1 X102.51 Y103.305 E.66903
G3 X102.175 Y104.005 I-.953 J-.026 E.02009
G3 X101.49 Y104.262 I-.879 J-1.306 E.01857
G1 X101.49 Y103.76 E.01261
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.057 J-.92 E.03458
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
M73 P42 R5
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.733 E-.19409
G1 X101.901 Y75.841 E-.16152
G1 X102.14 Y75.968 E-.10291
G1 X102.356 Y76.193 E-.11852
G1 X102.457 Y76.392 E-.08475
G1 X102.492 Y76.519 E-.05026
G1 X102.505 Y76.645 E-.04796
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.416 Y82.333 Z3.24 F42000
G1 X77.694 Y104.378 Z3.24
G1 Z2.84
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.687 Y104.368 E.00031
G3 X77.11 Y103.295 I.729 J-1.084 E.03187
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.292 J-.003 E.05119
G1 X101.617 Y75.411 E.58357
G3 X102.888 Y76.637 I-.033 J1.306 E.04877
G1 X102.89 Y103.295 E.67021
G3 X101.597 Y104.59 I-1.306 J-.01 E.05098
G1 X78.405 Y104.59 E.58307
G3 X77.967 Y104.51 I.011 J-1.306 E.01126
G1 X77.748 Y104.404 E.00611
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.687 Y104.368 E-.02706
G1 X77.488 Y104.212 E-.096
G1 X77.294 Y103.963 E-.11999
G1 X77.186 Y103.735 E-.09606
G1 X77.132 Y103.534 E-.07903
G1 X77.11 Y103.295 E-.09124
G1 X77.11 Y102.635 E-.25062
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

G1 X86.21 Y104.175
G1 Z2.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z3.24 F42000
G1 X101.29 Y75.825 Z3.24
G1 Z2.84
M73 P43 R5
G1 E.8 F1800
; LINE_WIDTH: 0.463331
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42171
; WIPE_START
G1 F10489.637
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.643 Y79.714 Z3.24 F42000
G1 X79.384 Y81.051 Z3.24
G1 Z2.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.388 Y80.962 E.00199
G3 X79.916 Y80.393 I.682 J.102 E.01846
G1 X80.053 Y80.376 E.00307
G3 X79.382 Y81.111 I.017 J.689 E.07201
M204 S250
G1 X79.414 Y81.333 F42000
G1 F2153
M204 S5000
G1 X79.4 Y81.309 E.00061
G3 X80.054 Y80.354 I.667 J-.244 E.03025
G1 X80.097 Y80.355 E.00097
G3 X79.462 Y81.437 I-.03 J.71 E.0655
G1 X79.439 Y81.387 E.00122
; WIPE_START
G1 F12000
M204 S6000
G1 X79.4 Y81.309 E-.03316
G1 X79.367 Y81.171 E-.05392
G1 X79.36 Y81.03 E-.05381
G1 X79.381 Y80.89 E-.05374
G1 X79.429 Y80.757 E-.05382
G1 X79.503 Y80.636 E-.05384
G1 X79.6 Y80.532 E-.0538
G1 X79.715 Y80.449 E-.05378
G1 X79.844 Y80.391 E-.0538
G1 X80.054 Y80.354 E-.08099
G1 X80.097 Y80.355 E-.01651
G1 X80.228 Y80.372 E-.05033
G1 X80.363 Y80.417 E-.05381
G1 X80.485 Y80.488 E-.05375
G1 X80.566 Y80.559 E-.04092
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3.24 F42000
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z3.24 F42000
G1 X85.19 Y97.29 Z3.24
G1 Z2.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/50
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.24 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z3.24
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.733 E.01274
G1 X101.901 Y75.841 E.01068
G3 X102.51 Y76.692 I-.311 J.866 E.02798
G1 X102.51 Y103.305 E.6691
G3 X102.177 Y104.004 I-.954 J-.025 E.02004
G3 X101.49 Y104.261 I-.877 J-1.295 E.01862
M73 P43 R4
G1 X101.49 Y103.76 E.0126
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.056 J-.92 E.03459
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.733 E-.19394
G1 X101.901 Y75.841 E-.16143
G1 X102.141 Y75.968 E-.103
G1 X102.303 Y76.121 E-.08466
G1 X102.379 Y76.229 E-.05047
G1 X102.457 Y76.393 E-.06885
G1 X102.499 Y76.558 E-.06467
G1 X102.506 Y76.644 E-.03299
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.417 Y82.332 Z3.4 F42000
G1 X77.694 Y104.378 Z3.4
G1 Z3
G1 E.8 F1800
G1 F2153
M204 S5000
M73 P44 R4
G1 X77.687 Y104.368 E.0003
G3 X77.11 Y103.295 I.729 J-1.084 E.03188
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.01 E.05105
G1 X101.618 Y75.411 E.5836
G3 X102.888 Y76.637 I-.034 J1.306 E.04873
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.294 J.001 E.05117
G1 X78.405 Y104.59 E.58301
G3 X77.967 Y104.51 I.01 J-1.306 E.01126
G1 X77.748 Y104.404 E.00613
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.687 Y104.368 E-.02674
G1 X77.488 Y104.212 E-.09619
G1 X77.294 Y103.963 E-.11998
G1 X77.186 Y103.734 E-.09607
G1 X77.132 Y103.532 E-.07953
G1 X77.11 Y103.295 E-.09066
G1 X77.11 Y102.635 E-.25083
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

G1 X86.21 Y104.175
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z3.4 F42000
G1 X101.29 Y75.825 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.463301
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42168
; WIPE_START
G1 F10490.377
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.64 Y79.709 Z3.4 F42000
G1 X79.382 Y81.044 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.395 Y80.931 E.00255
G3 X79.917 Y80.393 I.675 J.133 E.01774
G1 X80.053 Y80.376 E.00307
G3 X79.383 Y81.104 I.017 J.688 E.07204
M204 S250
G1 X79.414 Y81.333 F42000
G1 F2153
M204 S5000
G1 X79.402 Y81.308 E.00062
G3 X80.053 Y80.354 I.666 J-.245 E.03021
G1 X80.098 Y80.355 E.001
G3 X79.464 Y81.435 I-.031 J.709 E.06532
G1 X79.44 Y81.387 E.0012
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.308 E-.03334
G1 X79.367 Y81.171 E-.05379
G1 X79.36 Y81.03 E-.05382
G1 X79.381 Y80.89 E-.05377
G1 X79.429 Y80.756 E-.05385
G1 X79.503 Y80.636 E-.05373
G1 X79.599 Y80.532 E-.0538
G1 X79.715 Y80.449 E-.05387
G1 X79.843 Y80.391 E-.05373
G1 X80.053 Y80.354 E-.08102
G1 X80.098 Y80.355 E-.01691
G1 X80.228 Y80.372 E-.04994
G1 X80.363 Y80.417 E-.05384
G1 X80.485 Y80.488 E-.05375
G1 X80.566 Y80.559 E-.04083
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z3.4 F42000
G1 X85.19 Y97.29 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P45 R4
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/50
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.4 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z3.4
G1 Z3.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.743 E.01249
G1 X101.821 Y75.817 E.00854
G3 X102.51 Y76.691 I-.25 J.905 E.02994
G1 X102.51 Y103.305 E.6691
G3 X102.176 Y104.005 I-.97 J-.033 E.02007
G3 X101.49 Y104.261 I-.874 J-1.295 E.01857
G1 X101.49 Y103.76 E.0126
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.056 J-.92 E.03459
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.743 E-.19017
G1 X101.821 Y75.817 E-.12907
G1 X102.066 Y75.918 E-.10064
G1 X102.203 Y76.018 E-.06435
G1 X102.301 Y76.119 E-.0533
G1 X102.398 Y76.262 E-.06565
G1 X102.456 Y76.389 E-.05329
G1 X102.499 Y76.557 E-.06563
G1 X102.507 Y76.656 E-.03789
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.417 Y82.343 Z3.56 F42000
G1 X77.693 Y104.378 Z3.56
G1 Z3.16
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.684 Y104.371 E.00028
G3 X77.11 Y103.295 I.72 J-1.076 E.03194
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.011 E.05105
G1 X101.62 Y75.411 E.58364
G3 X102.888 Y76.637 I-.036 J1.306 E.04869
G1 X102.89 Y103.295 E.67021
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
M73 P46 R4
G1 X78.405 Y104.59 E.58301
G3 X77.887 Y104.482 I-.001 J-1.294 E.01339
G1 X77.746 Y104.406 E.00404
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.684 Y104.371 E-.02696
G1 X77.488 Y104.212 E-.09596
G1 X77.316 Y103.999 E-.10412
G1 X77.186 Y103.735 E-.11195
G1 X77.135 Y103.554 E-.07114
G1 X77.11 Y103.295 E-.09914
G1 X77.11 Y102.635 E-.25072
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

G1 X86.21 Y104.175
G1 Z3.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z3.56 F42000
G1 X101.29 Y75.825 Z3.56
G1 Z3.16
G1 E.8 F1800
; LINE_WIDTH: 0.46327
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42165
; WIPE_START
G1 F10491.121
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.614 Y79.665 Z3.56 F42000
G1 X79.39 Y80.96 Z3.56
G1 Z3.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G3 X79.917 Y80.393 I.68 J.103 E.01841
G1 X80.053 Y80.376 E.00307
G3 X79.383 Y81.02 I.017 J.688 E.0739
M204 S250
G1 X79.414 Y81.334 F42000
G1 F2153
M204 S5000
G1 X79.4 Y81.309 E.00064
G3 X80.053 Y80.354 I.667 J-.244 E.03025
G1 X80.099 Y80.355 E.00102
G3 X79.462 Y81.437 I-.032 J.71 E.06546
G1 X79.439 Y81.388 E.00119
; WIPE_START
G1 F12000
M204 S6000
G1 X79.4 Y81.309 E-.03363
G1 X79.367 Y81.171 E-.05386
G1 X79.36 Y81.03 E-.05384
G1 X79.381 Y80.89 E-.05379
G1 X79.429 Y80.756 E-.05382
G1 X79.503 Y80.636 E-.0538
G1 X79.6 Y80.532 E-.05383
G1 X79.714 Y80.449 E-.05375
G1 X79.843 Y80.391 E-.05377
G1 X80.053 Y80.354 E-.08098
G1 X80.099 Y80.355 E-.01728
G1 X80.228 Y80.372 E-.04961
G1 X80.363 Y80.417 E-.05384
G1 X80.485 Y80.488 E-.05379
G1 X80.565 Y80.558 E-.04041
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3.56 F42000
G1 Z3.16
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z3.56 F42000
G1 X85.19 Y97.29 Z3.56
G1 Z3.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/50
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.56 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z3.56
G1 Z3.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.733 E.01275
G1 X101.901 Y75.841 E.01069
G3 X102.51 Y76.692 I-.306 J.862 E.02802
G1 X102.51 Y103.305 E.66907
G3 X102.176 Y104.005 I-.954 J-.026 E.02009
G3 X101.49 Y104.261 I-.875 J-1.297 E.01857
G1 X101.49 Y103.76 E.01261
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
M73 P47 R4
G3 X77.49 Y103.305 I.057 J-.92 E.03458
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.733 E-.194
G1 X101.901 Y75.841 E-.16156
G1 X102.14 Y75.968 E-.10284
G1 X102.356 Y76.193 E-.11855
G1 X102.456 Y76.389 E-.08373
G1 X102.501 Y76.569 E-.07027
G1 X102.507 Y76.645 E-.02905
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.417 Y82.333 Z3.72 F42000
G1 X77.692 Y104.377 Z3.72
G1 Z3.32
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.687 Y104.368 E.00029
G3 X77.11 Y103.295 I.729 J-1.083 E.03186
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.01 E.05105
G1 X101.621 Y75.411 E.58368
G3 X102.888 Y76.637 I-.037 J1.306 E.04866
G1 X102.89 Y103.297 E.67027
G3 X101.595 Y104.59 I-1.306 J-.013 E.05098
G1 X78.403 Y104.59 E.58307
G3 X77.888 Y104.478 I.013 J-1.306 E.01335
G1 X77.746 Y104.405 E.00402
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.687 Y104.368 E-.02658
G1 X77.488 Y104.212 E-.09583
G1 X77.294 Y103.964 E-.11977
G1 X77.186 Y103.734 E-.09637
G1 X77.131 Y103.529 E-.08062
G1 X77.11 Y103.295 E-.08957
G1 X77.11 Y102.633 E-.25126
; WIPE_END
M73 P48 R4
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

G1 X86.21 Y104.175
G1 Z3.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z3.72 F42000
G1 X101.29 Y75.825 Z3.72
G1 Z3.32
G1 E.8 F1800
; LINE_WIDTH: 0.46325
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42163
; WIPE_START
G1 F10491.617
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.644 Y79.716 Z3.72 F42000
G1 X79.383 Y81.056 Z3.72
G1 Z3.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.391 Y80.962 E.00212
G3 X79.984 Y80.381 I.681 J.102 E.01993
G1 X80.058 Y80.376 E.00164
G3 X79.386 Y81.116 I.015 J.688 E.07177
M204 S250
G1 X79.414 Y81.334 F42000
G1 F2153
M204 S5000
G1 X79.4 Y81.309 E.00065
G3 X80.053 Y80.354 I.667 J-.244 E.03025
G1 X80.1 Y80.355 E.00104
G3 X79.462 Y81.437 I-.033 J.71 E.06543
G1 X79.44 Y81.389 E.00118
; WIPE_START
G1 F12000
M204 S6000
G1 X79.4 Y81.309 E-.03388
G1 X79.367 Y81.171 E-.05387
G1 X79.36 Y81.03 E-.05382
G1 X79.381 Y80.89 E-.05379
G1 X79.429 Y80.756 E-.05384
G1 X79.503 Y80.636 E-.05376
G1 X79.6 Y80.532 E-.05384
G1 X79.714 Y80.449 E-.05374
G1 X79.844 Y80.391 E-.05382
G1 X80.053 Y80.354 E-.08096
G1 X80.1 Y80.355 E-.01761
G1 X80.228 Y80.372 E-.04916
G1 X80.362 Y80.417 E-.05387
G1 X80.485 Y80.488 E-.05384
G1 X80.564 Y80.558 E-.0402
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3.72 F42000
G1 Z3.32
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z3.72 F42000
G1 X85.19 Y97.29 Z3.72
G1 Z3.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/50
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.72 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z3.72
G1 Z3.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.733 E.01275
G1 X101.901 Y75.841 E.01069
G3 X102.51 Y76.691 I-.311 J.866 E.02795
G1 X102.51 Y103.305 E.66911
G3 X102.176 Y104.005 I-.953 J-.025 E.02009
G3 X101.49 Y104.261 I-.875 J-1.295 E.01857
G1 X101.49 Y103.76 E.01261
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.354 Y104.209 E.19248
G3 X77.49 Y103.305 I.058 J-.92 E.03456
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
M73 P49 R4
G1 F11668.197
M204 S6000
G1 X101.49 Y75.733 E-.19402
G1 X101.901 Y75.841 E-.16161
G1 X102.141 Y75.968 E-.10289
G1 X102.302 Y76.121 E-.08458
G1 X102.379 Y76.229 E-.05054
G1 X102.457 Y76.393 E-.06879
G1 X102.499 Y76.555 E-.0637
G1 X102.506 Y76.644 E-.03386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.417 Y82.332 Z3.88 F42000
G1 X77.692 Y104.377 Z3.88
G1 Z3.48
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.686 Y104.374 E.00019
G3 X77.11 Y103.295 I.715 J-1.075 E.03203
G1 X77.11 Y76.703 E.66855
G3 X78.405 Y75.41 I1.291 J-.002 E.05114
G1 X101.623 Y75.411 E.58371
G3 X102.888 Y76.637 I-.039 J1.306 E.04862
G1 X102.89 Y103.297 E.67027
G3 X101.595 Y104.59 I-1.291 J.002 E.05114
G1 X78.403 Y104.59 E.58307
G3 X77.965 Y104.514 I-.002 J-1.291 E.01122
G1 X77.746 Y104.404 E.00618
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.686 Y104.374 E-.02564
G1 X77.486 Y104.21 E-.09799
G1 X77.295 Y103.965 E-.11811
G1 X77.186 Y103.734 E-.09704
G1 X77.131 Y103.528 E-.08116
G1 X77.11 Y103.295 E-.08905
G1 X77.11 Y102.634 E-.25101
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

G1 X86.21 Y104.175
G1 Z3.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z3.88 F42000
G1 X101.29 Y75.825 Z3.88
G1 Z3.48
G1 E.8 F1800
; LINE_WIDTH: 0.46322
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.4216
; WIPE_START
G1 F10492.358
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.638 Y79.706 Z3.88 F42000
G1 X79.383 Y81.037 Z3.88
G1 Z3.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.395 Y80.928 E.00245
G3 X79.917 Y80.393 I.675 J.135 E.01769
G1 X80.053 Y80.376 E.00307
G3 X79.383 Y81.097 I.017 J.688 E.07216
M204 S250
M73 P50 R4
G1 X79.415 Y81.335 F42000
G1 F2153
M204 S5000
G1 X79.402 Y81.308 E.00066
G3 X80.053 Y80.354 I.666 J-.245 E.03021
G1 X80.101 Y80.355 E.00106
G3 X79.464 Y81.435 I-.033 J.708 E.06526
G1 X79.441 Y81.389 E.00116
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.308 E-.03404
G1 X79.367 Y81.171 E-.05377
G1 X79.36 Y81.03 E-.05382
G1 X79.381 Y80.89 E-.05376
G1 X79.429 Y80.757 E-.05382
G1 X79.503 Y80.636 E-.05383
G1 X79.599 Y80.532 E-.05374
G1 X79.715 Y80.449 E-.05384
G1 X79.844 Y80.391 E-.05385
G1 X80.053 Y80.354 E-.08088
G1 X80.101 Y80.355 E-.018
G1 X80.228 Y80.372 E-.04895
G1 X80.363 Y80.417 E-.05379
G1 X80.485 Y80.488 E-.05379
G1 X80.564 Y80.558 E-.04011
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3.88 F42000
G1 Z3.48
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z3.88 F42000
G1 X85.19 Y97.29 Z3.88
G1 Z3.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/50
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.88 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z3.88
G1 Z3.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.733 E.01275
G1 X101.901 Y75.841 E.01069
G3 X102.51 Y76.692 I-.306 J.862 E.02802
G1 X102.51 Y103.305 E.66907
G3 X102.176 Y104.005 I-.954 J-.026 E.02009
G3 X101.49 Y104.261 I-.873 J-1.29 E.01857
G1 X101.49 Y103.76 E.0126
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.056 J-.92 E.03458
G1 X77.49 Y76.695 E.66903
G3 X78.395 Y75.79 I.92 J.016 E.03557
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.733 E-.194
G1 X101.901 Y75.841 E-.16158
G1 X102.141 Y75.968 E-.10293
G1 X102.356 Y76.194 E-.1187
G1 X102.456 Y76.39 E-.08384
G1 X102.501 Y76.569 E-.06984
G1 X102.507 Y76.645 E-.02911
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.417 Y82.333 Z4.04 F42000
G1 X77.692 Y104.377 Z4.04
G1 Z3.64
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.684 Y104.373 E.00022
G3 X77.11 Y103.295 I.717 J-1.074 E.03198
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.296 J.001 E.05115
G1 X101.624 Y75.411 E.58375
G3 X102.888 Y76.637 I-.033 J1.298 E.04865
M73 P51 R4
G1 X102.89 Y103.295 E.67021
G3 X101.597 Y104.59 I-1.306 J-.01 E.05099
G1 X78.405 Y104.59 E.58307
G3 X77.966 Y104.514 I-.004 J-1.291 E.01128
G1 X77.745 Y104.404 E.0062
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.684 Y104.373 E-.02608
G1 X77.486 Y104.21 E-.09731
G1 X77.295 Y103.965 E-.11803
G1 X77.186 Y103.735 E-.09706
G1 X77.135 Y103.554 E-.07109
G1 X77.11 Y103.295 E-.09915
G1 X77.11 Y102.633 E-.25128
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

G1 X86.21 Y104.175
G1 Z3.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z4.04 F42000
G1 X101.29 Y75.825 Z4.04
G1 Z3.64
G1 E.8 F1800
; LINE_WIDTH: 0.463189
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42157
; WIPE_START
G1 F10493.103
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.637 Y79.705 Z4.04 F42000
G1 X79.383 Y81.035 Z4.04
G1 Z3.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.395 Y80.928 E.0024
G3 X79.916 Y80.393 I.675 J.135 E.01769
G1 X80.053 Y80.376 E.00307
G3 X79.383 Y81.095 I.017 J.688 E.07221
M204 S250
G1 X79.415 Y81.335 F42000
G1 F2153
M204 S5000
G1 X79.4 Y81.309 E.00068
G3 X80.053 Y80.354 I.667 J-.244 E.03024
G1 X80.102 Y80.355 E.00108
G3 X79.462 Y81.437 I-.034 J.71 E.06539
G1 X79.44 Y81.39 E.00115
; WIPE_START
G1 F12000
M204 S6000
G1 X79.4 Y81.309 E-.03435
G1 X79.367 Y81.171 E-.05387
G1 X79.36 Y81.03 E-.05381
G1 X79.381 Y80.89 E-.05375
G1 X79.429 Y80.756 E-.05388
G1 X79.503 Y80.636 E-.05376
G1 X79.6 Y80.532 E-.05384
G1 X79.714 Y80.449 E-.05377
G1 X79.843 Y80.391 E-.05375
G1 X80.053 Y80.354 E-.08095
G1 X80.102 Y80.355 E-.01839
G1 X80.228 Y80.372 E-.04855
G1 X80.362 Y80.417 E-.0538
G1 X80.485 Y80.488 E-.05376
G1 X80.563 Y80.557 E-.03978
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z4.04 F42000
G1 Z3.64
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z4.04 F42000
G1 X85.19 Y97.29 Z4.04
G1 Z3.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/50
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.04 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z4.04
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.743 E.0125
G1 X101.822 Y75.817 E.00855
G3 X102.51 Y76.691 I-.252 J.906 E.02992
G1 X102.51 Y103.305 E.66912
G3 X102.175 Y104.005 I-.954 J-.026 E.02009
G3 X101.49 Y104.261 I-.872 J-1.289 E.01857
M73 P52 R4
G1 X101.49 Y103.76 E.0126
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.308 I.057 J-.92 E.03452
G1 X77.49 Y76.695 E.66907
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.743 E-.19025
G1 X101.822 Y75.817 E-.12928
G1 X102.067 Y75.918 E-.10053
G1 X102.201 Y76.016 E-.06302
G1 X102.301 Y76.119 E-.05453
G1 X102.396 Y76.259 E-.06442
G1 X102.456 Y76.389 E-.05441
G1 X102.498 Y76.553 E-.06449
G1 X102.507 Y76.656 E-.03907
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.417 Y82.343 Z4.2 F42000
G1 X77.696 Y104.374 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.486 Y104.21 E.00669
G3 X77.11 Y103.295 I.915 J-.911 E.02554
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.626 Y75.411 E.58379
G3 X102.888 Y76.637 I-.042 J1.306 E.04854
G1 X102.89 Y103.295 E.67021
G3 X101.595 Y104.59 I-1.291 J.004 E.0512
G1 X78.405 Y104.59 E.58301
G3 X77.744 Y104.41 I-.004 J-1.291 E.01745
; WIPE_START
M73 P53 R4
G1 F11668.197
M204 S6000
G1 X77.486 Y104.21 E-.12388
G1 X77.295 Y103.965 E-.11813
G1 X77.186 Y103.735 E-.09699
G1 X77.13 Y103.525 E-.08228
G1 X77.11 Y103.295 E-.08798
G1 X77.11 Y102.635 E-.25074
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

G1 X86.21 Y104.175
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z4.2 F42000
G1 X101.29 Y75.825 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.463169
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42155
; WIPE_START
G1 F10493.603
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.637 Y79.704 Z4.2 F42000
G1 X79.383 Y81.033 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.395 Y80.929 E.00235
G3 X79.917 Y80.393 I.675 J.135 E.01769
G1 X80.053 Y80.376 E.00307
G3 X79.382 Y81.093 I.017 J.688 E.07226
M204 S250
G1 X79.415 Y81.336 F42000
G1 F2153
M204 S5000
G1 X79.402 Y81.308 E.00069
G3 X80.053 Y80.354 I.665 J-.245 E.03021
G1 X80.103 Y80.355 E.00111
G3 X79.464 Y81.436 I-.036 J.708 E.06521
G1 X79.441 Y81.39 E.00114
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.308 E-.03449
G1 X79.367 Y81.171 E-.0538
G1 X79.36 Y81.03 E-.05381
G1 X79.381 Y80.89 E-.0538
G1 X79.429 Y80.756 E-.05384
G1 X79.503 Y80.636 E-.05375
G1 X79.6 Y80.532 E-.05386
G1 X79.715 Y80.449 E-.05379
G1 X79.844 Y80.391 E-.05374
G1 X80.053 Y80.354 E-.08089
G1 X80.103 Y80.355 E-.01882
G1 X80.228 Y80.372 E-.04817
G1 X80.363 Y80.417 E-.0538
G1 X80.485 Y80.488 E-.05375
G1 X80.563 Y80.557 E-.03968
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z4.2 F42000
G1 X85.19 Y97.29 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/50
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.2 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z4.2
G1 Z3.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.743 E.0125
G1 X101.822 Y75.817 E.00855
G3 X102.51 Y76.695 I-.225 J.885 E.03016
G1 X102.51 Y103.305 E.66901
G3 X102.175 Y104.005 I-.954 J-.025 E.0201
G3 X101.49 Y104.262 I-.872 J-1.289 E.01857
G1 X101.49 Y103.76 E.01261
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.354 Y104.209 E.19248
G3 X77.49 Y103.305 I.049 J-.912 E.03464
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
M73 P54 R4
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.743 E-.19023
G1 X101.822 Y75.817 E-.12925
G1 X102.067 Y75.919 E-.10067
G1 X102.196 Y76.012 E-.06057
G1 X102.303 Y76.122 E-.05829
G1 X102.393 Y76.254 E-.06059
G1 X102.457 Y76.393 E-.05825
G1 X102.497 Y76.547 E-.06065
G1 X102.507 Y76.656 E-.04151
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.416 Y82.343 Z4.36 F42000
G1 X77.695 Y104.374 Z4.36
G1 Z3.96
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.492 Y104.207 E.00659
G3 X77.11 Y103.295 I.924 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.294 J-.001 E.05117
G1 X101.627 Y75.411 E.58383
G3 X102.888 Y76.637 I-.043 J1.306 E.0485
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.294 J.001 E.05117
G1 X78.405 Y104.59 E.58301
G3 X77.746 Y104.405 I.011 J-1.306 E.01742
; WIPE_START
G1 F11668.197
M204 S6000
M73 P54 R3
G1 X77.492 Y104.207 E-.12224
G1 X77.294 Y103.963 E-.11962
G1 X77.186 Y103.735 E-.09608
G1 X77.135 Y103.554 E-.0712
G1 X77.11 Y103.295 E-.0991
G1 X77.11 Y102.632 E-.25176
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

G1 X86.21 Y104.175
G1 Z3.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z4.36 F42000
G1 X101.29 Y75.825 Z4.36
G1 Z3.96
G1 E.8 F1800
; LINE_WIDTH: 0.463149
M73 P55 R3
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42153
; WIPE_START
G1 F10494.099
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.637 Y79.704 Z4.36 F42000
G1 X79.384 Y81.033 Z4.36
G1 Z3.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.388 Y80.962 E.00159
G3 X79.916 Y80.393 I.682 J.102 E.01847
G1 X80.053 Y80.376 E.00307
G3 X79.382 Y81.099 I.017 J.689 E.07227
G1 X79.382 Y81.093 E.00014
M204 S250
G1 X79.416 Y81.336 F42000
G1 F2153
M204 S5000
G1 X79.4 Y81.309 E.00071
G3 X80.053 Y80.354 I.667 J-.244 E.03024
G1 X80.104 Y80.355 E.00113
G3 X79.462 Y81.437 I-.036 J.71 E.06535
G1 X79.441 Y81.391 E.00113
; WIPE_START
G1 F12000
M204 S6000
G1 X79.4 Y81.309 E-.03477
G1 X79.367 Y81.171 E-.0539
G1 X79.36 Y81.03 E-.05381
G1 X79.381 Y80.89 E-.0538
G1 X79.429 Y80.757 E-.05377
G1 X79.503 Y80.636 E-.05384
G1 X79.6 Y80.532 E-.05382
G1 X79.715 Y80.449 E-.05378
G1 X79.844 Y80.391 E-.05383
G1 X80.053 Y80.354 E-.08082
G1 X80.104 Y80.355 E-.01921
G1 X80.228 Y80.372 E-.04777
G1 X80.362 Y80.417 E-.05379
G1 X80.485 Y80.488 E-.05377
G1 X80.563 Y80.556 E-.03931
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z4.36 F42000
G1 Z3.96
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z4.36 F42000
G1 X85.19 Y97.29 Z4.36
G1 Z3.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/50
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.36 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z4.36
G1 Z4.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.733 E.01275
G1 X101.901 Y75.841 E.01069
G3 X102.51 Y76.695 I-.318 J.87 E.02802
G1 X102.51 Y103.305 E.66901
G3 X102.175 Y104.005 I-.954 J-.025 E.0201
G3 X101.49 Y104.261 I-.871 J-1.286 E.01857
G1 X101.49 Y103.76 E.01261
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.047 J-.912 E.03467
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.733 E-.19398
G1 X101.901 Y75.841 E-.16164
G1 X102.14 Y75.968 E-.10277
G1 X102.243 Y76.056 E-.05167
G1 X102.356 Y76.193 E-.06723
G1 X102.457 Y76.393 E-.08515
G1 X102.497 Y76.546 E-.06026
G1 X102.506 Y76.644 E-.0373
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.418 Y82.334 Z4.52 F42000
G1 X77.701 Y104.382 Z4.52
G1 Z4.12
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.686 Y104.37 E.00048
G3 X77.11 Y103.295 I.723 J-1.079 E.03193
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.293 J-.003 E.05119
G1 X101.629 Y75.411 E.58386
M73 P56 R3
G3 X102.888 Y76.637 I-.045 J1.306 E.04847
G1 X102.89 Y103.295 E.67021
G3 X101.595 Y104.59 I-1.299 J-.003 E.05112
G1 X78.403 Y104.59 E.58307
G3 X77.849 Y104.463 I.006 J-1.299 E.01441
G1 X77.753 Y104.411 E.00274
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.686 Y104.37 E-.02992
G1 X77.486 Y104.21 E-.09724
G1 X77.294 Y103.963 E-.11903
G1 X77.186 Y103.735 E-.096
G1 X77.135 Y103.554 E-.07119
G1 X77.11 Y103.295 E-.0991
G1 X77.11 Y102.643 E-.24752
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

G1 X86.21 Y104.175
G1 Z4.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z4.52 F42000
G1 X101.29 Y75.825 Z4.52
G1 Z4.12
G1 E.8 F1800
; LINE_WIDTH: 0.463118
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.4215
; WIPE_START
G1 F10494.839
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.635 Y79.701 Z4.52 F42000
G1 X79.384 Y81.028 Z4.52
G1 Z4.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.394 Y80.929 E.00223
G3 X79.916 Y80.393 I.675 J.135 E.01771
G1 X80.053 Y80.375 E.00308
G3 X79.381 Y81.088 I.017 J.689 E.07247
M204 S250
G1 X79.416 Y81.337 F42000
G1 F2153
M204 S5000
G1 X79.402 Y81.308 E.00072
G3 X80.053 Y80.354 I.666 J-.245 E.0302
G1 X80.105 Y80.355 E.00115
G3 X79.464 Y81.435 I-.037 J.708 E.06518
G1 X79.442 Y81.391 E.00111
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.308 E-.03495
G1 X79.367 Y81.171 E-.05382
G1 X79.36 Y81.03 E-.05379
G1 X79.381 Y80.89 E-.05376
G1 X79.429 Y80.756 E-.05385
G1 X79.503 Y80.636 E-.05376
G1 X79.6 Y80.532 E-.05382
G1 X79.714 Y80.449 E-.05378
G1 X79.844 Y80.391 E-.05389
G1 X80.053 Y80.354 E-.08076
G1 X80.105 Y80.355 E-.0196
G1 X80.228 Y80.372 E-.04743
G1 X80.362 Y80.417 E-.0538
G1 X80.485 Y80.488 E-.05379
G1 X80.562 Y80.556 E-.0392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z4.52 F42000
G1 Z4.12
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z4.52 F42000
G1 X85.19 Y97.29 Z4.52
G1 Z4.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
M73 P57 R3
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/50
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.52 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z4.52
G1 Z4.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.733 E.01275
G1 X101.901 Y75.841 E.0107
G3 X102.51 Y76.695 I-.318 J.87 E.02803
G1 X102.51 Y103.305 E.66901
G3 X102.176 Y104.005 I-.954 J-.025 E.02009
G3 X101.49 Y104.262 I-.871 J-1.286 E.01858
G1 X101.49 Y103.76 E.01261
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.353 Y104.209 E.19251
G3 X77.49 Y103.308 I.059 J-.92 E.03446
G1 X77.49 Y76.695 E.66907
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.733 E-.19404
G1 X101.901 Y75.841 E-.16166
G1 X102.141 Y75.968 E-.10283
G1 X102.244 Y76.056 E-.05167
G1 X102.356 Y76.193 E-.06716
G1 X102.457 Y76.393 E-.08516
G1 X102.497 Y76.546 E-.05995
G1 X102.505 Y76.644 E-.03754
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.416 Y82.332 Z4.68 F42000
G1 X77.695 Y104.372 Z4.68
G1 Z4.28
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.538 Y104.255 E.00493
G3 X77.11 Y103.295 I.871 J-.964 E.02722
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.291 J-.004 E.0512
G1 X101.63 Y75.411 E.5839
G3 X102.888 Y76.637 I-.046 J1.306 E.04843
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.306 J-.013 E.05098
G1 X78.405 Y104.59 E.58301
M73 P58 R3
G3 X77.766 Y104.42 I.003 J-1.299 E.01682
G1 X77.745 Y104.406 E.00064
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.538 Y104.255 E-.09722
G1 X77.364 Y104.068 E-.09691
G1 X77.234 Y103.851 E-.09614
G1 X77.135 Y103.554 E-.11901
G1 X77.11 Y103.295 E-.09911
G1 X77.11 Y102.633 E-.25161
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

G1 X86.21 Y104.175
G1 Z4.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z4.68 F42000
G1 X101.29 Y75.825 Z4.68
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.463098
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42148
; WIPE_START
G1 F10495.34
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.635 Y79.7 Z4.68 F42000
G1 X79.384 Y81.026 Z4.68
G1 Z4.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.395 Y80.929 E.0022
G3 X79.917 Y80.393 I.675 J.135 E.01769
G1 X80.053 Y80.376 E.00307
G3 X79.382 Y81.086 I.017 J.688 E.07241
M204 S250
G1 X79.416 Y81.338 F42000
G1 F2153
M204 S5000
G1 X79.4 Y81.309 E.00073
G3 X80.053 Y80.354 I.667 J-.244 E.03023
G1 X80.105 Y80.355 E.00117
G3 X79.462 Y81.437 I-.038 J.71 E.06531
G1 X79.441 Y81.392 E.0011
; WIPE_START
G1 F12000
M204 S6000
G1 X79.4 Y81.309 E-.03525
G1 X79.367 Y81.171 E-.05386
G1 X79.36 Y81.03 E-.05382
G1 X79.381 Y80.89 E-.05375
G1 X79.429 Y80.756 E-.05389
G1 X79.503 Y80.636 E-.05376
G1 X79.599 Y80.532 E-.05373
G1 X79.715 Y80.449 E-.05395
G1 X79.844 Y80.391 E-.0537
G1 X80.053 Y80.354 E-.08085
G1 X80.105 Y80.355 E-.01992
G1 X80.228 Y80.372 E-.04708
G1 X80.362 Y80.417 E-.05379
G1 X80.485 Y80.488 E-.05379
G1 X80.562 Y80.555 E-.03886
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z4.68 F42000
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z4.68 F42000
G1 X85.19 Y97.29 Z4.68
G1 Z4.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/50
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.68 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z4.68
G1 Z4.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.733 E.01275
G1 X101.902 Y75.841 E.0107
G3 X102.51 Y76.695 I-.318 J.87 E.02802
G1 X102.51 Y103.305 E.66901
G3 X102.175 Y104.005 I-.954 J-.025 E.0201
G3 X101.49 Y104.261 I-.87 J-1.283 E.01857
G1 X101.49 Y103.76 E.01261
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.354 Y104.209 E.19249
M73 P59 R3
G3 X77.49 Y103.305 I.049 J-.912 E.03463
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.733 E-.194
G1 X101.902 Y75.841 E-.16169
G1 X102.141 Y75.968 E-.10276
G1 X102.243 Y76.056 E-.05162
G1 X102.356 Y76.193 E-.06727
G1 X102.457 Y76.393 E-.0851
G1 X102.497 Y76.545 E-.05964
G1 X102.505 Y76.644 E-.03792
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.416 Y82.332 Z4.84 F42000
G1 X77.689 Y104.376 Z4.84
G1 Z4.44
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.686 Y104.373 E.0001
G3 X77.11 Y103.295 I.718 J-1.077 E.03201
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.293 J-.002 E.05118
G1 X101.632 Y75.411 E.58394
G3 X102.888 Y76.637 I-.048 J1.306 E.04839
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.306 J-.013 E.05099
G1 X78.405 Y104.59 E.58301
G3 X77.966 Y104.513 I-.001 J-1.294 E.01127
G1 X77.743 Y104.402 E.00626
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.686 Y104.373 E-.02423
G1 X77.488 Y104.212 E-.09703
G1 X77.31 Y103.989 E-.10836
G1 X77.186 Y103.735 E-.10768
G1 X77.129 Y103.519 E-.08449
G1 X77.11 Y103.295 E-.08576
G1 X77.11 Y102.63 E-.25246
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

G1 X86.21 Y104.175
G1 Z4.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
M73 P60 R3
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z4.84 F42000
G1 X101.29 Y75.825 Z4.84
G1 Z4.44
G1 E.8 F1800
; LINE_WIDTH: 0.463068
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42145
; WIPE_START
G1 F10496.084
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.752 Y79.892 Z4.84 F42000
G1 X79.442 Y81.347 Z4.84
G1 Z4.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.402 Y81.235 E.00265
G3 X79.917 Y80.393 I.668 J-.171 E.02463
G1 X80.053 Y80.376 E.00307
G3 X79.468 Y81.401 I.017 J.689 E.06519
M204 S250
G1 X79.364 Y81.025 F42000
G1 F2153
M204 S5000
G1 X79.365 Y80.959 E.00148
G3 X80.053 Y80.354 I.703 J.106 E.02227
G1 X80.106 Y80.355 E.0012
G3 X79.358 Y81.101 I-.039 J.709 E.07324
G1 X79.359 Y81.085 E.00036
; WIPE_START
G1 F12000
M204 S6000
G1 X79.365 Y80.959 E-.0479
G1 X79.402 Y80.822 E-.05394
G1 X79.463 Y80.694 E-.0538
G1 X79.549 Y80.581 E-.05377
G1 X79.655 Y80.488 E-.05382
G1 X79.778 Y80.417 E-.05376
G1 X79.912 Y80.372 E-.05375
G1 X80.053 Y80.354 E-.05414
G1 X80.106 Y80.355 E-.02033
G1 X80.228 Y80.372 E-.04669
G1 X80.363 Y80.417 E-.05385
G1 X80.485 Y80.488 E-.05379
G1 X80.591 Y80.581 E-.05379
G1 X80.677 Y80.694 E-.05376
G1 X80.737 Y80.82 E-.05291
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z4.84 F42000
G1 Z4.44
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z4.84 F42000
G1 X85.19 Y97.29 Z4.84
G1 Z4.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/50
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.84 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z4.84
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.743 E.0125
G1 X101.822 Y75.817 E.00856
G3 X102.51 Y76.695 I-.239 J.895 E.03008
G1 X102.51 Y103.305 E.66901
G3 X102.176 Y104.005 I-.954 J-.025 E.02009
G3 X101.49 Y104.261 I-.869 J-1.28 E.01857
G1 X101.49 Y103.76 E.0126
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.047 J-.912 E.03466
G1 X77.49 Y76.695 E.66903
G3 X78.395 Y75.79 I.92 J.016 E.03557
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.743 E-.19029
M73 P61 R3
G1 X101.822 Y75.817 E-.12944
G1 X102.067 Y75.919 E-.10052
G1 X102.193 Y76.01 E-.05932
G1 X102.303 Y76.122 E-.05957
G1 X102.404 Y76.273 E-.06889
G1 X102.456 Y76.391 E-.04904
G1 X102.496 Y76.544 E-.06023
G1 X102.506 Y76.656 E-.0427
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.415 Y82.342 Z5 F42000
G1 X77.688 Y104.375 Z5
G1 Z4.6
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.685 Y104.37 E.00014
G3 X77.11 Y103.295 I.724 J-1.078 E.03191
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.291 J-.004 E.0512
G1 X101.633 Y75.411 E.58398
G3 X102.888 Y76.637 I-.049 J1.306 E.04835
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.299 J-.003 E.05112
G1 X78.403 Y104.59 E.58307
G3 X77.876 Y104.476 I.006 J-1.299 E.01365
G1 X77.741 Y104.403 E.00387
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.685 Y104.37 E-.02456
G1 X77.486 Y104.21 E-.09692
G1 X77.294 Y103.963 E-.11907
G1 X77.186 Y103.734 E-.09609
G1 X77.129 Y103.518 E-.08489
G1 X77.11 Y103.295 E-.08527
G1 X77.11 Y102.628 E-.25319
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

G1 X86.21 Y104.175
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z5 F42000
G1 X101.29 Y75.825 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.463047
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42143
; WIPE_START
G1 F10496.58
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.631 Y79.694 Z5 F42000
G1 X79.385 Y81.015 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.395 Y80.929 E.00194
G3 X79.918 Y80.392 I.675 J.135 E.01771
G1 X80.053 Y80.376 E.00304
G3 X79.382 Y81.075 I.018 J.688 E.07276
M204 S250
G1 X79.422 Y81.354 F42000
G1 F2153
M204 S5000
G1 X79.381 Y81.24 E.00271
M73 P62 R3
G3 X80.053 Y80.354 I.687 J-.177 E.02861
G1 X80.107 Y80.355 E.00122
G3 X79.448 Y81.409 I-.04 J.708 E.06583
; WIPE_START
G1 F12000
M204 S6000
G1 X79.381 Y81.24 E-.06878
G1 X79.36 Y81.1 E-.05378
G1 X79.367 Y80.959 E-.05381
G1 X79.402 Y80.822 E-.05386
G1 X79.463 Y80.694 E-.05373
G1 X79.549 Y80.581 E-.05381
G1 X79.655 Y80.488 E-.05383
G1 X79.778 Y80.417 E-.05375
G1 X79.912 Y80.372 E-.05377
G1 X80.053 Y80.354 E-.05412
G1 X80.107 Y80.355 E-.02069
G1 X80.228 Y80.372 E-.04633
G1 X80.363 Y80.417 E-.05384
G1 X80.485 Y80.488 E-.05376
G1 X80.548 Y80.544 E-.03213
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z5 F42000
G1 X85.19 Y97.29 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/50
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z5
G1 Z4.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.743 E.01249
G1 X101.822 Y75.817 E.00856
G3 X102.51 Y76.695 I-.238 J.895 E.03008
G1 X102.51 Y103.305 E.66901
G3 X102.175 Y104.005 I-.966 J-.031 E.02008
G3 X101.49 Y104.261 I-.867 J-1.278 E.01857
G1 X101.49 Y103.76 E.0126
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.305 I.047 J-.911 E.03466
G1 X77.49 Y76.695 E.66903
G3 X78.395 Y75.79 I.92 J.016 E.03557
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.743 E-.19022
G1 X101.822 Y75.817 E-.12941
G1 X102.067 Y75.919 E-.1006
G1 X102.193 Y76.01 E-.05895
G1 X102.303 Y76.122 E-.0599
G1 X102.391 Y76.25 E-.05896
G1 X102.458 Y76.395 E-.0608
G1 X102.492 Y76.52 E-.04901
G1 X102.506 Y76.656 E-.05215
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.415 Y82.342 Z5.16 F42000
G1 X77.688 Y104.375 Z5.16
G1 Z4.76
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.685 Y104.372 E.00011
G3 X77.11 Y103.295 I.719 J-1.076 E.03197
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.634 Y75.411 E.58401
G3 X102.888 Y76.637 I-.051 J1.306 E.04833
G1 X102.89 Y103.295 E.67021
M73 P63 R3
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
G1 X78.405 Y104.59 E.58301
G3 X77.966 Y104.513 I-.001 J-1.294 E.01127
G1 X77.742 Y104.402 E.00629
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.685 Y104.372 E-.02434
G1 X77.488 Y104.212 E-.09642
G1 X77.326 Y104.014 E-.09706
G1 X77.209 Y103.796 E-.09433
G1 X77.135 Y103.554 E-.09589
G1 X77.11 Y103.295 E-.09909
G1 X77.11 Y102.629 E-.25286
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

G1 X86.21 Y104.175
G1 Z4.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z5.16 F42000
G1 X101.29 Y75.826 Z5.16
G1 Z4.76
G1 E.8 F1800
; LINE_WIDTH: 0.463017
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.4214
; WIPE_START
G1 F10497.323
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.621 Y79.677 Z5.16 F42000
G1 X79.389 Y80.982 Z5.16
G1 Z4.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.39 Y80.96 E.0005
G3 X79.917 Y80.393 I.68 J.103 E.01841
G1 X80.053 Y80.376 E.00307
G3 X79.396 Y81.201 I.017 J.688 E.06981
G1 X79.391 Y81.042 E.00356
M204 S250
G1 X79.424 Y81.357 F42000
G1 F2153
M204 S5000
G1 X79.379 Y81.241 E.00279
G3 X80.053 Y80.354 I.688 J-.176 E.02862
G1 X80.108 Y80.355 E.00124
G3 X79.448 Y81.412 I-.041 J.709 E.06588
; WIPE_START
G1 F12000
M204 S6000
G1 X79.379 Y81.241 E-.07009
G1 X79.36 Y81.1 E-.05379
G1 X79.367 Y80.959 E-.05379
G1 X79.402 Y80.822 E-.05385
G1 X79.463 Y80.694 E-.05379
G1 X79.549 Y80.581 E-.0538
G1 X79.655 Y80.488 E-.05378
G1 X79.778 Y80.417 E-.05381
G1 X79.912 Y80.372 E-.05378
G1 X80.053 Y80.354 E-.05405
G1 X80.108 Y80.355 E-.02112
G1 X80.228 Y80.372 E-.04594
G1 X80.363 Y80.417 E-.05385
G1 X80.485 Y80.488 E-.05376
G1 X80.546 Y80.541 E-.0308
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5.16 F42000
G1 Z4.76
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z5.16 F42000
G1 X85.19 Y97.29 Z5.16
G1 Z4.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/50
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.16 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z5.16
G1 Z4.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.733 E.01275
G1 X101.902 Y75.841 E.0107
G3 X102.51 Y76.692 I-.307 J.862 E.028
G1 X102.51 Y103.305 E.66907
G3 X102.177 Y104.005 I-.954 J-.025 E.02006
G3 X101.49 Y104.261 I-.869 J-1.276 E.01861
M73 P64 R3
G1 X101.49 Y103.76 E.01261
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.354 Y104.209 E.19249
G3 X77.49 Y103.305 I.058 J-.92 E.03455
G1 X77.49 Y76.695 E.66901
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X86.01 Y75.79 E.19146
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.733 E-.194
G1 X101.902 Y75.841 E-.16177
G1 X102.141 Y75.968 E-.10271
G1 X102.244 Y76.056 E-.05166
G1 X102.356 Y76.193 E-.06717
G1 X102.457 Y76.393 E-.08515
G1 X102.501 Y76.569 E-.06888
G1 X102.506 Y76.644 E-.02866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.415 Y82.33 Z5.32 F42000
G1 X77.684 Y104.367 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.63 Y104.334 E.0016
G3 X77.11 Y103.295 I.771 J-1.035 E.03031
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.294 J-.001 E.05117
G1 X101.636 Y75.411 E.58405
G3 X102.888 Y76.637 I-.052 J1.306 E.04828
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.291 J.002 E.05114
G1 X78.403 Y104.59 E.58307
G3 X77.849 Y104.466 I-.002 J-1.291 E.0144
G1 X77.736 Y104.398 E.00331
; WIPE_START
M73 P65 R3
G1 F11668.197
M204 S6000
G1 X77.63 Y104.334 E-.04692
G1 X77.486 Y104.21 E-.07211
G1 X77.295 Y103.965 E-.11809
G1 X77.186 Y103.734 E-.09705
G1 X77.129 Y103.515 E-.08607
G1 X77.11 Y103.295 E-.08413
G1 X77.11 Y102.622 E-.25563
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

G1 X86.21 Y104.175
G1 Z4.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z5.32 F42000
G1 X101.29 Y75.826 Z5.32
G1 Z4.92
G1 E.8 F1800
; LINE_WIDTH: 0.462997
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42138
; WIPE_START
G1 F10497.82
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.621 Y79.678 Z5.32 F42000
G1 X79.387 Y80.984 Z5.32
G1 Z4.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.389 Y80.962 E.0005
G3 X79.917 Y80.393 I.681 J.101 E.01846
G1 X80.053 Y80.376 E.00307
G3 X79.383 Y81.099 I.017 J.688 E.07212
G1 X79.385 Y81.044 E.00123
M204 S250
G1 X79.423 Y81.355 F42000
G1 F2153
M204 S5000
G1 X79.381 Y81.24 E.00274
G3 X80.053 Y80.354 I.687 J-.177 E.0286
G1 X80.109 Y80.355 E.00127
G3 X79.449 Y81.409 I-.042 J.708 E.06576
; WIPE_START
G1 F12000
M204 S6000
G1 X79.381 Y81.24 E-.06922
G1 X79.36 Y81.1 E-.05378
G1 X79.367 Y80.959 E-.05383
G1 X79.402 Y80.822 E-.0537
G1 X79.463 Y80.694 E-.05388
G1 X79.549 Y80.581 E-.05385
G1 X79.655 Y80.488 E-.05374
G1 X79.778 Y80.417 E-.0538
G1 X79.912 Y80.372 E-.05378
G1 X80.053 Y80.354 E-.05403
G1 X80.109 Y80.355 E-.02152
G1 X80.228 Y80.372 E-.0456
G1 X80.362 Y80.417 E-.05379
G1 X80.485 Y80.488 E-.05375
G1 X80.548 Y80.543 E-.03172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5.32 F42000
G1 Z4.92
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z5.32 F42000
G1 X85.19 Y97.29 Z5.32
G1 Z4.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/50
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.32 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z5.32
G1 Z5.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.733 E.01275
G1 X101.902 Y75.841 E.0107
G3 X102.51 Y76.695 I-.318 J.87 E.02802
G1 X102.51 Y103.305 E.66901
G3 X102.175 Y104.005 I-.978 J-.037 E.02007
G3 X101.49 Y104.261 I-.867 J-1.276 E.01857
G1 X101.49 Y103.76 E.01261
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.308 I.047 J-.912 E.0346
G1 X77.49 Y76.695 E.66907
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
M73 P66 R3
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
M73 P66 R2
G1 F11668.197
M204 S6000
G1 X101.49 Y75.733 E-.194
G1 X101.902 Y75.841 E-.16179
G1 X102.14 Y75.968 E-.10265
G1 X102.244 Y76.056 E-.0517
G1 X102.356 Y76.193 E-.06715
G1 X102.457 Y76.393 E-.08523
G1 X102.496 Y76.541 E-.0583
G1 X102.505 Y76.644 E-.03918
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.414 Y82.33 Z5.48 F42000
G1 X77.681 Y104.37 Z5.48
G1 Z5.08
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.492 Y104.208 E.00626
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.403 Y75.41 I1.297 J.002 E.05108
G1 X101.638 Y75.411 E.58415
G3 X102.888 Y76.637 I-.054 J1.306 E.04824
G1 X102.89 Y103.295 E.67023
G3 X101.597 Y104.59 I-1.294 J0 E.05109
G1 X78.405 Y104.59 E.58307
G3 X77.732 Y104.397 I.01 J-1.306 E.01784
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.1159
G1 X77.326 Y104.014 E-.09686
G1 X77.186 Y103.735 E-.11899
G1 X77.128 Y103.514 E-.08659
G1 X77.11 Y103.295 E-.08365
G1 X77.11 Y102.616 E-.258
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

G1 X86.21 Y104.175
G1 Z5.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z5.48 F42000
G1 X101.29 Y75.826 Z5.48
G1 Z5.08
G1 E.8 F1800
; LINE_WIDTH: 0.462976
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42136
; WIPE_START
G1 F10498.319
G1 X88.21 Y75.825 E-.76
; WIPE_END
M73 P67 R2
G1 E-.04 F1800
M204 S10000
G1 X81.617 Y79.67 Z5.48 F42000
G1 X79.39 Y80.968 Z5.48
G1 Z5.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.394 Y80.929 E.00088
G3 X79.916 Y80.393 I.675 J.135 E.01771
G1 X80.053 Y80.376 E.00307
G3 X79.381 Y81.065 I.017 J.689 E.07299
G1 X79.384 Y81.028 E.00084
M204 S250
G1 X79.424 Y81.358 F42000
G1 F2153
M204 S5000
G1 X79.38 Y81.241 E.00281
G3 X80.053 Y80.354 I.688 J-.176 E.02861
G1 X80.11 Y80.355 E.00129
G3 X79.449 Y81.413 I-.042 J.709 E.06583
; WIPE_START
G1 F12000
M204 S6000
G1 X79.38 Y81.241 E-.07032
G1 X79.36 Y81.1 E-.05386
G1 X79.367 Y80.959 E-.0538
G1 X79.402 Y80.822 E-.0538
G1 X79.463 Y80.694 E-.05382
G1 X79.549 Y80.582 E-.05373
G1 X79.655 Y80.488 E-.05386
G1 X79.778 Y80.417 E-.05381
G1 X79.912 Y80.372 E-.05377
G1 X80.053 Y80.354 E-.05401
G1 X80.11 Y80.355 E-.02193
G1 X80.362 Y80.417 E-.09856
G1 X80.485 Y80.488 E-.0538
G1 X80.546 Y80.542 E-.03093
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5.48 F42000
G1 Z5.08
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z5.48 F42000
G1 X85.19 Y97.29 Z5.48
G1 Z5.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/50
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.48 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z5.48
G1 Z5.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.743 E.0125
G1 X101.823 Y75.818 E.00857
G3 X102.51 Y76.695 I-.252 J.905 E.03
G1 X102.51 Y103.305 E.66901
G3 X102.175 Y104.005 I-.954 J-.025 E.0201
G3 X101.49 Y104.261 I-.866 J-1.273 E.01857
G1 X101.49 Y103.76 E.01261
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
G3 X77.49 Y103.309 I.056 J-.92 E.03449
G1 X77.49 Y76.695 E.66911
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.743 E-.19033
G1 X101.823 Y75.818 E-.12952
G1 X102.07 Y75.921 E-.102
G1 X102.187 Y76.004 E-.05455
G1 X102.306 Y76.125 E-.06427
G1 X102.387 Y76.243 E-.05453
G1 X102.458 Y76.397 E-.06435
G1 X102.495 Y76.535 E-.05449
G1 X102.506 Y76.656 E-.04595
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.414 Y82.341 Z5.64 F42000
G1 X77.68 Y104.37 Z5.64
G1 Z5.24
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.491 Y104.208 E.00625
G3 X77.11 Y103.295 I.922 J-.921 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.639 Y75.411 E.58412
M73 P68 R2
G3 X102.888 Y76.637 I-.055 J1.306 E.04821
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.303 J-.011 E.05101
G1 X78.405 Y104.59 E.58301
G3 X77.731 Y104.397 I.008 J-1.303 E.01784
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.491 Y104.208 E-.11624
G1 X77.294 Y103.963 E-.11953
G1 X77.186 Y103.734 E-.09609
G1 X77.128 Y103.513 E-.0871
G1 X77.11 Y103.295 E-.08311
G1 X77.11 Y102.616 E-.25793
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

G1 X86.21 Y104.175
G1 Z5.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z5.64 F42000
G1 X101.29 Y75.826 Z5.64
G1 Z5.24
G1 E.8 F1800
; LINE_WIDTH: 0.462966
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42135
; WIPE_START
G1 F10498.571
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.616 Y79.668 Z5.64 F42000
G1 X79.39 Y80.966 Z5.64
G1 Z5.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.395 Y80.929 E.00083
G3 X79.917 Y80.393 I.675 J.135 E.0177
G1 X80.053 Y80.376 E.00307
G3 X79.381 Y81.065 I.017 J.688 E.07297
G1 X79.385 Y81.025 E.00089
M204 S250
G1 X79.424 Y81.359 F42000
G1 F2153
M204 S5000
G1 X79.38 Y81.241 E.00283
G3 X80.053 Y80.354 I.688 J-.176 E.02861
G1 X80.111 Y80.355 E.00131
G3 X79.449 Y81.413 I-.043 J.709 E.0658
; WIPE_START
G1 F12000
M204 S6000
G1 X79.38 Y81.241 E-.07066
G1 X79.36 Y81.1 E-.05381
G1 X79.367 Y80.959 E-.05382
G1 X79.402 Y80.822 E-.05382
G1 X79.463 Y80.694 E-.05374
G1 X79.549 Y80.581 E-.05379
G1 X79.655 Y80.488 E-.05386
G1 X79.778 Y80.417 E-.05378
G1 X79.912 Y80.372 E-.05382
G1 X80.053 Y80.354 E-.05399
G1 X80.111 Y80.355 E-.02222
G1 X80.362 Y80.417 E-.09829
G1 X80.485 Y80.488 E-.05376
G1 X80.545 Y80.541 E-.03064
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5.64 F42000
G1 Z5.24
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z5.64 F42000
G1 X85.19 Y97.29 Z5.64
G1 Z5.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
M73 P69 R2
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/50
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.64 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z5.64
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.743 E.0125
G1 X101.823 Y75.818 E.00857
G3 X102.51 Y76.692 I-.252 J.906 E.02994
G1 X102.51 Y103.305 E.66907
G3 X102.175 Y104.005 I-.978 J-.037 E.02007
G3 X101.49 Y104.261 I-.866 J-1.272 E.01857
G1 X101.49 Y103.76 E.01261
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.353 Y104.209 E.1925
G3 X77.49 Y103.309 I.058 J-.92 E.03445
G1 X77.49 Y76.695 E.6691
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.743 E-.19032
G1 X101.823 Y75.818 E-.12953
G1 X102.07 Y75.92 E-.10194
G1 X102.186 Y76.004 E-.05424
G1 X102.306 Y76.125 E-.06467
G1 X102.387 Y76.242 E-.05421
G1 X102.457 Y76.393 E-.06315
G1 X102.501 Y76.569 E-.06887
G1 X102.507 Y76.656 E-.03305
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.414 Y82.34 Z5.8 F42000
G1 X77.679 Y104.369 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.46 Y104.182 E.00723
G3 X77.11 Y103.295 I.943 J-.885 E.02456
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.64 Y75.411 E.58416
G3 X102.888 Y76.637 I-.057 J1.306 E.04817
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.293 J-.001 E.05112
G1 X78.403 Y104.59 E.58307
M73 P70 R2
G3 X77.73 Y104.401 I.001 J-1.293 E.0178
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.46 Y104.182 E-.13194
G1 X77.294 Y103.963 E-.1044
G1 X77.186 Y103.734 E-.09615
G1 X77.135 Y103.554 E-.07109
G1 X77.11 Y103.295 E-.09912
G1 X77.11 Y102.618 E-.2573
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

G1 X86.21 Y104.175
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z5.8 F42000
G1 X101.29 Y75.826 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.462936
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.42132
; WIPE_START
G1 F10499.312
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.619 Y79.673 Z5.8 F42000
G1 X79.388 Y80.974 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.389 Y80.962 E.00027
G3 X79.916 Y80.393 I.681 J.101 E.01846
G1 X80.053 Y80.375 E.00308
G3 X79.396 Y81.204 I.017 J.688 E.06976
G1 X79.39 Y81.034 E.00379
M204 S250
G1 X79.424 Y81.359 F42000
G1 F2153
M204 S5000
G1 X79.38 Y81.241 E.00283
G3 X80.053 Y80.354 I.688 J-.176 E.0286
G1 X80.112 Y80.355 E.00133
G3 X79.45 Y81.414 I-.044 J.709 E.06577
; WIPE_START
G1 F12000
M204 S6000
G1 X79.38 Y81.241 E-.0708
G1 X79.36 Y81.1 E-.05381
G1 X79.367 Y80.959 E-.05383
G1 X79.402 Y80.822 E-.05383
G1 X79.463 Y80.694 E-.05376
G1 X79.549 Y80.581 E-.05382
G1 X79.655 Y80.488 E-.05378
G1 X79.778 Y80.417 E-.05383
G1 X79.912 Y80.372 E-.05375
G1 X80.053 Y80.354 E-.05401
G1 X80.112 Y80.355 E-.0226
G1 X80.362 Y80.417 E-.09785
G1 X80.485 Y80.488 E-.05389
G1 X80.545 Y80.541 E-.03044
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z5.8 F42000
G1 X85.19 Y97.29 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/50
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.8 I.952 J.758 P1  F42000
G1 X101.49 Y76.24 Z5.8
G1 Z5.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X101.49 Y75.743 E.01249
G1 X101.823 Y75.818 E.00857
G3 X102.51 Y76.692 I-.252 J.905 E.02994
G1 X102.51 Y103.305 E.66907
G3 X102.176 Y104.005 I-.954 J-.026 E.0201
G3 X101.49 Y104.261 I-.864 J-1.268 E.01858
G1 X101.49 Y103.76 E.0126
G1 X86.01 Y103.76 E.38919
G1 X86.01 Y104.21 E.01131
G1 X78.355 Y104.209 E.19245
M73 P71 R2
G3 X77.49 Y103.305 I.056 J-.92 E.03458
G1 X77.49 Y76.695 E.66903
G3 X78.395 Y75.79 I.92 J.016 E.03557
G1 X86.01 Y75.79 E.19145
G1 X86.01 Y76.24 E.01131
G1 X101.43 Y76.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y75.743 E-.19018
G1 X101.823 Y75.818 E-.12946
G1 X102.07 Y75.92 E-.10192
G1 X102.186 Y76.003 E-.05392
G1 X102.306 Y76.125 E-.06492
G1 X102.386 Y76.242 E-.05394
G1 X102.457 Y76.393 E-.06353
G1 X102.501 Y76.569 E-.06886
G1 X102.507 Y76.656 E-.03327
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.414 Y82.341 Z5.96 F42000
G1 X77.679 Y104.369 Z5.96
G1 Z5.56
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X77.489 Y104.208 E.00626
G3 X77.11 Y103.295 I.92 J-.917 E.0255
G1 X77.11 Y76.705 E.66849
G3 X78.403 Y75.41 I1.294 J-.001 E.05111
G1 X101.642 Y75.411 E.58426
G3 X102.888 Y76.637 I-.058 J1.306 E.04813
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.294 J.002 E.05118
G1 X78.403 Y104.59 E.58307
G3 X77.73 Y104.399 I.006 J-1.299 E.01781
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.489 Y104.208 E-.1169
G1 X77.294 Y103.963 E-.11893
G1 X77.186 Y103.734 E-.0961
G1 X77.128 Y103.51 E-.0882
G1 X77.11 Y103.295 E-.082
G1 X77.11 Y102.616 E-.25788
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

G1 X86.21 Y104.175
G1 Z5.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2153
M204 S6000
G1 X101.29 Y104.175 E.42206
; WIPE_START
M73 P72 R2
G1 F10480.96
G1 X99.29 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.827 Y96.561 Z5.96 F42000
G1 X101.29 Y75.826 Z5.96
G1 Z5.56
G1 E.8 F1800
; LINE_WIDTH: 0.462905
G1 F2153
M204 S6000
G1 X86.21 Y75.825 E.4213
; WIPE_START
G1 F10500.059
G1 X88.21 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.754 Y79.896 Z5.96 F42000
G1 X79.445 Y81.352 Z5.96
G1 Z5.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2153
M204 S5000
G1 X79.39 Y81.167 E.00432
G3 X79.917 Y80.393 I.68 J-.104 E.02306
G1 X80.053 Y80.376 E.00307
G3 X79.473 Y81.405 I.017 J.688 E.06492
M204 S250
G1 X79.37 Y80.958 F42000
G1 F2153
M204 S5000
G1 X79.374 Y80.924 E.00077
G3 X80.052 Y80.354 I.696 J.139 E.02141
G1 X80.123 Y80.356 E.00159
G3 X79.361 Y81.065 I-.053 J.707 E.07355
G1 X79.365 Y81.018 E.00105
; WIPE_START
G1 F12000
M204 S6000
G1 X79.374 Y80.924 E-.03582
G1 X79.415 Y80.789 E-.05375
G1 X79.549 Y80.581 E-.09384
G1 X79.655 Y80.488 E-.05381
G1 X79.778 Y80.417 E-.05378
G1 X79.912 Y80.372 E-.05381
G1 X80.052 Y80.354 E-.05379
G1 X80.123 Y80.356 E-.02695
G1 X80.262 Y80.381 E-.05377
G1 X80.394 Y80.432 E-.05378
G1 X80.513 Y80.509 E-.0539
G1 X80.615 Y80.608 E-.05376
G1 X80.694 Y80.725 E-.05377
G1 X80.749 Y80.855 E-.05377
G1 X80.755 Y80.885 E-.0117
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5.96 F42000
G1 Z5.56
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X85.19 Y82.71 E.01458
G1 X85.19 Y84.29 E.03972
G1 X84.61 Y84.29 E.01458
G1 X84.61 Y82.77 E.03822
M204 S10000
G1 X84.9 Y82.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y84.09 E.01379
; WIPE_START
G1 F18000
G1 X84.9 Y82.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.054 Y90.541 Z5.96 F42000
G1 X85.19 Y97.29 Z5.96
G1 Z5.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2153
M204 S5000
G1 X84.61 Y97.29 E.01458
G1 X84.61 Y95.71 E.03972
G1 X85.19 Y95.71 E.01458
G1 X85.19 Y97.23 E.03822
M204 S10000
G1 X84.9 Y97.09 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2153
M204 S6000
G1 X84.9 Y95.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X84.9 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/50
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.96 I.959 J.75 P1  F42000
G1 X101.552 Y75.79 Z5.96
G1 Z5.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1736
M204 S5000
G1 X101.605 Y75.79 E.00132
G3 X102.51 Y76.692 I-.019 J.925 E.03548
G1 X102.51 Y103.305 E.66907
G3 X101.605 Y104.21 I-.922 J-.017 E.03556
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.305 I.021 J-.926 E.03552
G1 X77.49 Y76.695 E.66903
G3 X78.395 Y75.79 I.92 J.016 E.03557
G1 X101.492 Y75.79 E.5807
; WIPE_START
M73 P73 R2
G1 F11668.197
M204 S6000
G1 X101.605 Y75.79 E-.04271
G1 X101.792 Y75.81 E-.07152
G1 X101.988 Y75.877 E-.07871
G1 X102.154 Y75.978 E-.07398
G1 X102.242 Y76.055 E-.04417
G1 X102.423 Y76.311 E-.1193
G1 X102.483 Y76.479 E-.06767
G1 X102.51 Y76.692 E-.08189
G1 X102.51 Y77.166 E-.18005
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.364 Y82.803 Z6.12 F42000
G1 X77.678 Y104.368 Z6.12
G1 Z5.72
G1 E.8 F1800
G1 F1736
M204 S5000
G1 X77.489 Y104.208 E.00624
G3 X77.11 Y103.295 I.92 J-.917 E.0255
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.304 J.008 E.05107
G1 X101.643 Y75.411 E.58423
G3 X102.888 Y76.637 I-.06 J1.306 E.0481
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.294 J-.002 E.05111
G1 X78.405 Y104.59 E.58302
G3 X77.729 Y104.398 I.004 J-1.299 E.01788
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.489 Y104.208 E-.11663
G1 X77.294 Y103.963 E-.1189
G1 X77.186 Y103.735 E-.09605
G1 X77.135 Y103.554 E-.0711
G1 X77.11 Y103.295 E-.09915
G1 X77.11 Y102.615 E-.25818
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.909 Y95.025 Z6.12 F42000
G1 X79.389 Y80.969 Z6.12
G1 Z5.72
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1736
M204 S5000
G1 X79.39 Y80.96 E.00021
G3 X79.917 Y80.393 I.68 J.103 E.0184
G1 X80.053 Y80.376 E.00307
G3 X79.396 Y81.201 I.017 J.688 E.06982
G1 X79.391 Y81.029 E.00385
M204 S250
G1 X79.424 Y81.358 F42000
G1 F1736
M204 S5000
G1 X79.382 Y81.24 E.0028
G3 X80.053 Y80.354 I.687 J-.177 E.02857
G1 X80.114 Y80.355 E.00138
G3 X79.451 Y81.412 I-.045 J.708 E.06562
; WIPE_START
M73 P74 R2
G1 F12000
M204 S6000
G1 X79.382 Y81.24 E-.07028
G1 X79.36 Y81.1 E-.05377
G1 X79.367 Y80.959 E-.05378
G1 X79.402 Y80.822 E-.05379
G1 X79.463 Y80.694 E-.05386
G1 X79.549 Y80.581 E-.05378
G1 X79.655 Y80.488 E-.05383
G1 X79.778 Y80.417 E-.05375
G1 X79.912 Y80.372 E-.0538
G1 X80.053 Y80.354 E-.05396
G1 X80.114 Y80.355 E-.02336
G1 X80.362 Y80.417 E-.09721
G1 X80.485 Y80.488 E-.05381
G1 X80.546 Y80.542 E-.03102
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
; Z_HEIGHT: 5.88
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 36/50
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 15
G1 X101.555 Y75.79 F42000
G1 Z5.88
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1731
M204 S5000
G1 X101.605 Y75.79 E.00124
G3 X102.51 Y76.695 I-.02 J.925 E.03554
G1 X102.51 Y103.305 E.66901
G3 X101.605 Y104.21 I-.922 J-.017 E.03556
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.305 I.017 J-.922 E.03555
G1 X77.49 Y76.695 E.66903
G3 X78.395 Y75.79 I.92 J.016 E.03557
G1 X101.495 Y75.79 E.58078
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y75.79 E-.04157
G1 X101.791 Y75.81 E-.07122
G1 X101.988 Y75.877 E-.07909
G1 X102.154 Y75.978 E-.07356
G1 X102.242 Y76.054 E-.04443
G1 X102.423 Y76.311 E-.11932
G1 X102.494 Y76.532 E-.08827
G1 X102.51 Y76.695 E-.06228
G1 X102.51 Y77.169 E-.18025
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.364 Y82.806 Z6.28 F42000
G1 X77.677 Y104.367 Z6.28
G1 Z5.88
G1 E.8 F1800
G1 F1731
M204 S5000
G1 X77.492 Y104.208 E.00615
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.291 J-.004 E.0512
G1 X101.645 Y75.411 E.58427
M73 P75 R2
G3 X102.888 Y76.637 I-.061 J1.306 E.04806
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.011 E.05104
G1 X78.403 Y104.59 E.58307
G3 X77.729 Y104.395 I.013 J-1.306 E.01785
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.11476
G1 X77.295 Y103.965 E-.11873
G1 X77.186 Y103.735 E-.09702
G1 X77.127 Y103.507 E-.0893
G1 X77.11 Y103.295 E-.08095
G1 X77.11 Y102.612 E-.25924
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.909 Y95.022 Z6.28 F42000
G1 X79.389 Y80.968 Z6.28
G1 Z5.88
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1731
M204 S5000
G1 X79.389 Y80.961 E.00015
G3 X79.917 Y80.393 I.68 J.103 E.01842
G1 X80.053 Y80.376 E.00307
G3 X79.396 Y81.202 I.017 J.688 E.0698
G1 X79.39 Y81.028 E.0039
M204 S250
G1 X79.425 Y81.361 F42000
G1 F1731
M204 S5000
G1 X79.38 Y81.241 E.00287
G3 X80.053 Y80.354 I.688 J-.176 E.02859
G1 X80.115 Y80.356 E.0014
G3 X79.451 Y81.415 I-.046 J.709 E.0657
; WIPE_START
G1 F12000
M204 S6000
G1 X79.38 Y81.241 E-.07127
G1 X79.36 Y81.1 E-.05379
G1 X79.367 Y80.959 E-.05383
G1 X79.402 Y80.822 E-.05376
G1 X79.463 Y80.694 E-.05377
G1 X79.549 Y80.581 E-.05387
G1 X79.655 Y80.488 E-.05374
G1 X79.778 Y80.417 E-.05386
G1 X79.912 Y80.372 E-.05378
G1 X80.053 Y80.354 E-.05393
G1 X80.115 Y80.356 E-.02377
G1 X80.362 Y80.417 E-.09681
G1 X80.485 Y80.488 E-.05385
G1 X80.544 Y80.54 E-.02999
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
; Z_HEIGHT: 6.04
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 37/50
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 15
G1 X101.558 Y75.79 F42000
G1 Z6.04
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1731
M204 S5000
G1 X101.605 Y75.79 E.00117
G3 X102.51 Y76.695 I-.02 J.925 E.03554
G1 X102.51 Y103.305 E.66901
G3 X101.605 Y104.21 I-.922 J-.017 E.03556
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.308 I.021 J-.926 E.03544
G1 X77.49 Y76.695 E.6691
M73 P76 R2
G3 X78.395 Y75.79 I.92 J.015 E.03557
G1 X101.498 Y75.79 E.58086
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y75.79 E-.04044
G1 X101.79 Y75.81 E-.07093
G1 X101.988 Y75.877 E-.0794
G1 X102.153 Y75.977 E-.07323
G1 X102.242 Y76.055 E-.04488
G1 X102.423 Y76.311 E-.11921
G1 X102.494 Y76.531 E-.08793
G1 X102.51 Y76.695 E-.06258
G1 X102.51 Y77.172 E-.1814
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.363 Y82.808 Z6.44 F42000
G1 X77.676 Y104.367 Z6.44
G1 Z6.04
G1 E.8 F1800
G1 F1731
M204 S5000
G1 X77.489 Y104.208 E.00618
G3 X77.11 Y103.295 I.92 J-.917 E.0255
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.646 Y75.411 E.58431
G3 X102.888 Y76.637 I-.055 J1.298 E.04809
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.299 J-.003 E.05112
G1 X78.403 Y104.59 E.58307
G3 X77.728 Y104.397 I.006 J-1.299 E.01788
; WIPE_START
G1 F11668.197
M204 S6000
M73 P77 R2
G1 X77.489 Y104.208 E-.11588
G1 X77.294 Y103.963 E-.11889
G1 X77.185 Y103.732 E-.09711
G1 X77.135 Y103.552 E-.07111
G1 X77.11 Y103.295 E-.09812
G1 X77.11 Y102.613 E-.25889
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.909 Y95.023 Z6.44 F42000
G1 X79.388 Y80.967 Z6.44
G1 Z6.04
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1731
M204 S5000
G1 X79.392 Y80.963 E.00013
G3 X79.917 Y80.393 I.677 J.097 E.01843
G1 X80.053 Y80.376 E.00307
G3 X79.386 Y81.099 I.017 J.684 E.07164
G1 X79.387 Y81.027 E.00161
M204 S250
G1 X79.424 Y81.36 F42000
G1 F1731
M204 S5000
G1 X79.382 Y81.24 E.00284
G3 X80.053 Y80.354 I.687 J-.177 E.02856
G1 X80.116 Y80.356 E.00142
G3 X79.452 Y81.413 I-.047 J.708 E.06554
; WIPE_START
G1 F12000
M204 S6000
G1 X79.382 Y81.24 E-.07096
G1 X79.36 Y81.1 E-.05372
G1 X79.367 Y80.959 E-.05383
G1 X79.402 Y80.822 E-.05382
G1 X79.463 Y80.694 E-.05373
G1 X79.549 Y80.581 E-.0538
G1 X79.655 Y80.488 E-.05386
G1 X79.778 Y80.417 E-.05378
G1 X79.912 Y80.372 E-.0538
G1 X80.053 Y80.354 E-.05387
G1 X80.116 Y80.356 E-.02414
G1 X80.363 Y80.417 E-.09651
G1 X80.485 Y80.488 E-.05381
G1 X80.545 Y80.541 E-.03036
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
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 38/50
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 15
G1 X101.561 Y75.79 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1731
M204 S5000
G1 X101.605 Y75.79 E.00109
G3 X102.51 Y76.695 I-.02 J.925 E.03554
G1 X102.51 Y103.305 E.66901
G3 X101.605 Y104.21 I-.92 J-.015 E.03558
G1 X78.395 Y104.21 E.58353
M73 P77 R1
G3 X77.49 Y103.308 I.021 J-.926 E.03544
G1 X77.49 Y76.695 E.6691
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X101.501 Y75.79 E.58093
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y75.79 E-.03933
G1 X101.79 Y75.81 E-.07061
G1 X101.989 Y75.877 E-.07975
G1 X102.152 Y75.977 E-.07292
G1 X102.242 Y76.054 E-.04503
G1 X102.423 Y76.311 E-.11934
G1 X102.494 Y76.53 E-.08763
G1 X102.51 Y76.695 E-.06291
G1 X102.51 Y77.175 E-.1825
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.363 Y82.811 Z6.6 F42000
G1 X77.676 Y104.366 Z6.6
G1 Z6.2
M73 P78 R1
G1 E.8 F1800
G1 F1731
M204 S5000
G1 X77.492 Y104.207 E.00611
G3 X77.11 Y103.295 I.924 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.648 Y75.411 E.58435
G3 X102.888 Y76.637 I-.064 J1.306 E.04799
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.306 J-.013 E.05098
G1 X78.403 Y104.59 E.58307
G3 X77.728 Y104.394 I.013 J-1.306 E.01788
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.207 E-.11437
G1 X77.303 Y103.978 E-.11294
G1 X77.186 Y103.735 E-.10281
G1 X77.135 Y103.554 E-.07113
G1 X77.11 Y103.295 E-.09911
G1 X77.11 Y102.611 E-.25965
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.91 Y95.021 Z6.6 F42000
G1 X79.391 Y80.953 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1731
M204 S5000
G1 X79.395 Y80.929 E.00055
G3 X79.917 Y80.393 I.675 J.135 E.01769
G1 X80.053 Y80.376 E.00307
G3 X79.382 Y81.065 I.017 J.688 E.07289
G1 X79.386 Y81.013 E.00118
M204 S250
G1 X79.42 Y81.351 F42000
G1 F1731
M204 S5000
G1 X79.416 Y81.341 E.00025
G3 X80.053 Y80.354 I.653 J-.277 E.03093
G1 X80.117 Y80.356 E.00144
G3 X79.484 Y81.464 I-.048 J.708 E.06417
G1 X79.45 Y81.403 E.00157
; WIPE_START
G1 F12000
M204 S6000
G1 X79.416 Y81.341 E-.02703
G1 X79.36 Y81.1 E-.09371
G1 X79.367 Y80.959 E-.05381
G1 X79.402 Y80.822 E-.05382
G1 X79.463 Y80.694 E-.05384
G1 X79.549 Y80.581 E-.05373
G1 X79.655 Y80.488 E-.05387
G1 X79.777 Y80.417 E-.05372
G1 X79.912 Y80.372 E-.05384
G1 X80.053 Y80.354 E-.05393
G1 X80.117 Y80.356 E-.02447
G1 X80.362 Y80.417 E-.09607
G1 X80.485 Y80.488 E-.05386
G1 X80.553 Y80.548 E-.03432
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
; Z_HEIGHT: 6.36
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 39/50
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 15
G1 X101.564 Y75.79 F42000
G1 Z6.36
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1731
M204 S5000
G1 X101.605 Y75.79 E.00102
G3 X102.51 Y76.695 I-.02 J.925 E.03554
G1 X102.51 Y103.305 E.66901
G3 X101.605 Y104.21 I-.922 J-.017 E.03557
G1 X78.395 Y104.21 E.58353
M73 P79 R1
G3 X77.49 Y103.308 I.021 J-.926 E.03544
G1 X77.49 Y76.695 E.66909
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X101.504 Y75.79 E.581
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y75.79 E-.03823
G1 X101.789 Y75.81 E-.0704
G1 X101.989 Y75.877 E-.07997
G1 X102.152 Y75.976 E-.07261
G1 X102.242 Y76.055 E-.0454
G1 X102.423 Y76.311 E-.11922
G1 X102.494 Y76.529 E-.08735
G1 X102.51 Y76.695 E-.06325
G1 X102.51 Y77.178 E-.18359
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.362 Y82.813 Z6.76 F42000
G1 X77.675 Y104.365 Z6.76
G1 Z6.36
G1 E.8 F1800
G1 F1731
M204 S5000
G1 X77.492 Y104.208 E.00607
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.649 Y75.411 E.58438
G3 X102.888 Y76.637 I-.066 J1.306 E.04795
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.306 J-.013 E.05098
G1 X78.403 Y104.59 E.58307
M73 P80 R1
G3 X77.727 Y104.394 I.013 J-1.306 E.01792
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.11384
G1 X77.295 Y103.965 E-.11876
G1 X77.186 Y103.735 E-.09701
G1 X77.124 Y103.487 E-.09708
G1 X77.11 Y103.295 E-.07315
G1 X77.11 Y102.61 E-.26016
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.941 Y95.023 Z6.76 F42000
G1 X79.439 Y81.341 Z6.76
G1 Z6.36
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1731
M204 S5000
G1 X79.435 Y81.333 E.00022
G3 X79.917 Y80.393 I.635 J-.268 E.02692
G1 X80.053 Y80.376 E.00307
G3 X79.501 Y81.453 I.017 J.689 E.0638
G1 X79.468 Y81.394 E.00151
M204 S250
G1 X79.367 Y80.961 F42000
G1 F1731
M204 S5000
G1 X79.367 Y80.959 E.00004
G3 X80.053 Y80.354 I.703 J.106 E.02222
G1 X80.118 Y80.356 E.00146
G3 X79.36 Y81.1 I-.048 J.709 E.07303
G1 X79.364 Y81.021 E.00179
; WIPE_START
G1 F12000
M204 S6000
G1 X79.367 Y80.959 E-.02345
G1 X79.402 Y80.822 E-.05382
G1 X79.463 Y80.694 E-.05376
G1 X79.549 Y80.582 E-.05378
G1 X79.655 Y80.488 E-.05382
G1 X79.778 Y80.417 E-.0538
G1 X79.912 Y80.372 E-.05382
G1 X80.053 Y80.354 E-.05392
G1 X80.118 Y80.356 E-.02484
G1 X80.362 Y80.417 E-.09577
G1 X80.485 Y80.488 E-.0538
G1 X80.591 Y80.581 E-.05378
G1 X80.677 Y80.694 E-.05389
G1 X80.738 Y80.822 E-.05375
G1 X80.754 Y80.883 E-.02403
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
; Z_HEIGHT: 6.52
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 40/50
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 15
G1 X101.567 Y75.79 F42000
G1 Z6.52
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1731
M204 S5000
G1 X101.605 Y75.79 E.00095
G3 X102.51 Y76.695 I-.02 J.925 E.03554
G1 X102.51 Y103.305 E.66901
G3 X101.605 Y104.21 I-.922 J-.017 E.03557
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.308 I.015 J-.92 E.03552
G1 X77.49 Y76.695 E.66907
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X101.507 Y75.79 E.58107
; WIPE_START
M73 P81 R1
G1 F11668.197
M204 S6000
G1 X101.605 Y75.79 E-.03717
G1 X101.788 Y75.809 E-.07003
G1 X101.988 Y75.877 E-.0803
G1 X102.151 Y75.976 E-.07232
G1 X102.242 Y76.055 E-.04578
G1 X102.423 Y76.311 E-.11919
G1 X102.494 Y76.529 E-.08701
G1 X102.51 Y76.695 E-.06356
G1 X102.51 Y77.181 E-.18465
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.363 Y82.817 Z6.92 F42000
G1 X77.683 Y104.364 Z6.92
G1 Z6.52
G1 E.8 F1800
G1 F1731
M204 S5000
G1 X77.492 Y104.208 E.00621
G3 X77.11 Y103.295 I.924 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.651 Y75.411 E.58442
G3 X102.888 Y76.637 I-.067 J1.306 E.04791
G1 X102.89 Y103.295 E.67023
G3 X101.595 Y104.59 I-1.298 J-.003 E.05112
G1 X78.405 Y104.59 E.58301
G3 X77.74 Y104.401 I.011 J-1.306 E.0176
G1 X77.733 Y104.397 E.0002
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.11651
G1 X77.294 Y103.963 E-.11976
G1 X77.186 Y103.734 E-.09606
G1 X77.135 Y103.554 E-.07108
G1 X77.11 Y103.295 E-.09913
G1 X77.11 Y102.617 E-.25747
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.943 Y95.03 Z6.92 F42000
G1 X79.445 Y81.355 Z6.92
G1 Z6.52
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1731
M204 S5000
G1 X79.403 Y81.235 E.00284
G3 X79.917 Y80.393 I.667 J-.171 E.02461
G1 X80.053 Y80.376 E.00307
G3 X79.473 Y81.408 I.017 J.688 E.06493
M204 S250
G1 X79.368 Y80.956 F42000
G1 F1731
M204 S5000
M73 P82 R1
G1 X79.403 Y80.822 E.00309
G3 X80.052 Y80.354 I.667 J.241 E.01904
G1 X80.119 Y80.356 E.00149
G3 X79.362 Y81.016 I-.049 J.708 E.07475
; WIPE_START
G1 F12000
M204 S6000
G1 X79.403 Y80.822 E-.07506
G1 X79.463 Y80.694 E-.05387
G1 X79.549 Y80.581 E-.0537
G1 X79.655 Y80.488 E-.05384
G1 X79.778 Y80.417 E-.0538
G1 X79.912 Y80.372 E-.05379
G1 X80.052 Y80.354 E-.0539
G1 X80.119 Y80.356 E-.02525
G1 X80.362 Y80.417 E-.09539
G1 X80.485 Y80.488 E-.05383
G1 X80.591 Y80.581 E-.05376
G1 X80.677 Y80.694 E-.0538
G1 X80.738 Y80.822 E-.05384
G1 X80.755 Y80.889 E-.02617
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
; Z_HEIGHT: 6.68
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 41/50
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 15
G1 X101.57 Y75.79 F42000
G1 Z6.68
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1731
M204 S5000
G1 X101.605 Y75.79 E.00088
G3 X102.51 Y76.692 I-.02 J.925 E.03547
G1 X102.51 Y103.305 E.66907
G3 X101.605 Y104.21 I-.922 J-.017 E.03557
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.309 I.015 J-.92 E.03549
G1 X77.49 Y76.695 E.66911
G3 X78.395 Y75.79 I.92 J.016 E.03557
G1 X101.51 Y75.79 E.58114
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y75.79 E-.03612
G1 X101.788 Y75.809 E-.06979
G1 X101.989 Y75.877 E-.08065
G1 X102.15 Y75.975 E-.07191
G1 X102.242 Y76.054 E-.04594
G1 X102.423 Y76.311 E-.11942
G1 X102.483 Y76.479 E-.06766
G1 X102.51 Y76.692 E-.08186
G1 X102.51 Y77.184 E-.18665
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.361 Y82.818 Z7.08 F42000
G1 X77.673 Y104.363 Z7.08
G1 Z6.68
G1 E.8 F1800
G1 F1731
M204 S5000
G1 X77.456 Y104.174 E.00725
G3 X77.11 Y103.295 I.952 J-.882 E.02432
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.652 Y75.411 E.58446
M73 P83 R1
G3 X102.888 Y76.637 I-.069 J1.306 E.04788
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.306 J-.013 E.05098
G1 X78.405 Y104.59 E.58301
G3 X77.724 Y104.395 I.002 J-1.298 E.01805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.456 Y104.174 E-.13207
G1 X77.294 Y103.963 E-.10112
G1 X77.186 Y103.734 E-.09617
G1 X77.135 Y103.553 E-.07136
G1 X77.11 Y103.295 E-.09877
G1 X77.11 Y102.609 E-.2605
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.91 Y95.019 Z7.08 F42000
G1 X79.392 Y80.947 Z7.08
G1 Z6.68
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1731
M204 S5000
G1 X79.394 Y80.929 E.00041
G3 X79.916 Y80.393 I.676 J.136 E.0177
G1 X80.053 Y80.376 E.00308
G3 X79.381 Y81.065 I.017 J.689 E.07303
G1 X79.386 Y81.007 E.00131
M204 S250
G1 X79.425 Y81.361 F42000
G1 F1731
M204 S5000
G1 X79.383 Y81.24 E.00287
G3 X80.052 Y80.354 I.687 J-.177 E.02854
G1 X80.12 Y80.356 E.00151
G3 X79.453 Y81.414 I-.05 J.707 E.06545
; WIPE_START
G1 F12000
M204 S6000
G1 X79.383 Y81.24 E-.07139
G1 X79.36 Y81.1 E-.05373
G1 X79.367 Y80.959 E-.0538
G1 X79.402 Y80.822 E-.05377
G1 X79.463 Y80.694 E-.05386
G1 X79.549 Y80.581 E-.05382
G1 X79.655 Y80.488 E-.05382
G1 X79.778 Y80.417 E-.05376
G1 X79.912 Y80.372 E-.05381
G1 X80.052 Y80.354 E-.05383
G1 X80.12 Y80.356 E-.02561
G1 X80.362 Y80.417 E-.09508
G1 X80.485 Y80.488 E-.05373
G1 X80.544 Y80.54 E-.02998
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
; Z_HEIGHT: 6.84
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 42/50
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 15
G1 X101.573 Y75.79 F42000
G1 Z6.84
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1731
M204 S5000
G1 X101.605 Y75.79 E.00081
G3 X102.51 Y76.693 I-.02 J.925 E.03547
G1 X102.51 Y103.305 E.66907
G3 X101.605 Y104.21 I-.922 J-.017 E.03557
G1 X78.393 Y104.21 E.58358
G3 X77.49 Y103.309 I.023 J-.926 E.03538
G1 X77.49 Y76.695 E.66911
M73 P84 R1
G3 X78.395 Y75.79 I.92 J.016 E.03557
G1 X101.513 Y75.79 E.5812
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y75.79 E-.03512
G1 X101.787 Y75.809 E-.06941
G1 X101.989 Y75.877 E-.08104
G1 X102.15 Y75.975 E-.07155
G1 X102.242 Y76.055 E-.04637
G1 X102.357 Y76.194 E-.0687
G1 X102.456 Y76.391 E-.0838
G1 X102.501 Y76.569 E-.06981
G1 X102.51 Y76.693 E-.04701
G1 X102.51 Y77.185 E-.1872
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.361 Y82.819 Z7.24 F42000
G1 X77.673 Y104.364 Z7.24
G1 Z6.84
G1 E.8 F1800
G1 F1731
M204 S5000
G1 X77.489 Y104.208 E.00608
G3 X77.11 Y103.295 I.92 J-.917 E.0255
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.654 Y75.411 E.58449
G3 X102.888 Y76.637 I-.07 J1.306 E.04784
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
G1 X78.405 Y104.59 E.58301
G3 X77.724 Y104.395 I.003 J-1.299 E.01804
; WIPE_START
G1 F11668.197
M204 S6000
M73 P85 R1
G1 X77.489 Y104.208 E-.11437
G1 X77.293 Y103.963 E-.11909
G1 X77.186 Y103.734 E-.09595
G1 X77.135 Y103.553 E-.07133
G1 X77.11 Y103.295 E-.09882
G1 X77.11 Y102.609 E-.26044
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.909 Y95.019 Z7.24 F42000
G1 X79.389 Y80.956 Z7.24
G1 Z6.84
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1731
M204 S5000
G1 X79.422 Y80.829 E.00293
G3 X79.917 Y80.393 I.648 J.235 E.01539
G1 X80.053 Y80.376 E.00307
G3 X79.382 Y81.016 I.017 J.689 E.07415
M204 S250
G1 X79.426 Y81.363 F42000
G1 F1731
M204 S5000
G1 X79.382 Y81.24 E.00293
G3 X80.052 Y80.354 I.688 J-.176 E.02855
G1 X80.121 Y80.356 E.00153
G3 X79.453 Y81.417 I-.051 J.709 E.06555
; WIPE_START
G1 F12000
M204 S6000
G1 X79.382 Y81.24 E-.07227
G1 X79.36 Y81.1 E-.05372
G1 X79.367 Y80.959 E-.05384
G1 X79.402 Y80.822 E-.05379
G1 X79.463 Y80.694 E-.05379
G1 X79.549 Y80.581 E-.05379
G1 X79.655 Y80.488 E-.0538
G1 X79.778 Y80.417 E-.05382
G1 X79.912 Y80.372 E-.05374
G1 X80.052 Y80.354 E-.0539
G1 X80.121 Y80.356 E-.02602
G1 X80.362 Y80.417 E-.09462
G1 X80.485 Y80.488 E-.05385
G1 X80.542 Y80.538 E-.02905
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
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 43/50
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 15
G1 X101.575 Y75.79 F42000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1731
M204 S5000
G1 X101.605 Y75.79 E.00075
G3 X102.51 Y76.692 I-.02 J.925 E.03547
G1 X102.51 Y103.305 E.66907
G3 X101.605 Y104.21 I-.921 J-.016 E.03557
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.308 I.021 J-.926 E.03544
G1 X77.49 Y76.695 E.66911
G3 X78.395 Y75.79 I.92 J.016 E.03557
G1 X101.515 Y75.79 E.58127
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y75.79 E-.03413
M73 P86 R1
G1 X101.786 Y75.809 E-.06912
G1 X101.989 Y75.877 E-.08144
G1 X102.149 Y75.974 E-.07115
G1 X102.242 Y76.054 E-.04658
G1 X102.423 Y76.311 E-.11916
G1 X102.483 Y76.479 E-.06799
G1 X102.51 Y76.692 E-.08179
G1 X102.51 Y77.189 E-.18864
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.362 Y82.823 Z7.4 F42000
G1 X77.681 Y104.363 Z7.4
G1 Z7
G1 E.8 F1800
G1 F1731
M204 S5000
G1 X77.493 Y104.208 E.00614
G3 X77.11 Y103.295 I.923 J-.924 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.01 E.05105
G1 X101.655 Y75.412 E.58453
G3 X102.888 Y76.637 I-.072 J1.306 E.0478
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.306 J-.01 E.05105
G1 X78.405 Y104.59 E.58301
G3 X77.74 Y104.401 I.011 J-1.306 E.0176
G1 X77.731 Y104.396 E.00026
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.493 Y104.208 E-.11547
G1 X77.294 Y103.963 E-.1198
G1 X77.186 Y103.735 E-.09603
G1 X77.135 Y103.554 E-.07118
G1 X77.11 Y103.295 E-.09906
G1 X77.11 Y102.615 E-.25846
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.909 Y95.024 Z7.4 F42000
G1 X79.39 Y80.954 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1731
M204 S5000
G1 X79.423 Y80.829 E.00289
G3 X79.917 Y80.392 I.647 J.234 E.01539
G1 X80.053 Y80.376 E.00307
G3 X79.383 Y81.014 I.017 J.688 E.07402
M204 S250
G1 X79.425 Y81.362 F42000
G1 F1731
M204 S5000
G1 X79.383 Y81.24 E.00289
G3 X80.052 Y80.354 I.687 J-.177 E.02852
G1 X80.122 Y80.356 E.00155
G3 X79.454 Y81.415 I-.051 J.707 E.0654
; WIPE_START
G1 F12000
M204 S6000
G1 X79.383 Y81.24 E-.07167
G1 X79.36 Y81.1 E-.05381
G1 X79.367 Y80.959 E-.05372
G1 X79.402 Y80.822 E-.05383
G1 X79.463 Y80.694 E-.05386
G1 X79.549 Y80.581 E-.05372
G1 X79.655 Y80.488 E-.05379
G1 X79.778 Y80.417 E-.0538
G1 X79.912 Y80.372 E-.0538
G1 X80.052 Y80.354 E-.05387
G1 X80.122 Y80.356 E-.02638
G1 X80.362 Y80.417 E-.09432
G1 X80.485 Y80.488 E-.05381
G1 X80.543 Y80.539 E-.02963
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
; Z_HEIGHT: 7.16
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 44/50
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 15
G1 X101.578 Y75.79 F42000
G1 Z7.16
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1731
M204 S5000
G1 X101.605 Y75.79 E.00069
G3 X102.51 Y76.692 I-.021 J.926 E.03547
G1 X102.51 Y103.305 E.66907
G3 X101.605 Y104.21 I-.921 J-.016 E.03557
G1 X78.395 Y104.21 E.58353
M73 P87 R1
G3 X77.49 Y103.308 I.015 J-.92 E.03552
G1 X77.49 Y76.695 E.66907
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X101.518 Y75.79 E.58133
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y75.79 E-.03317
G1 X101.785 Y75.809 E-.06882
G1 X101.989 Y75.877 E-.08161
G1 X102.149 Y75.974 E-.07099
G1 X102.242 Y76.054 E-.0469
G1 X102.423 Y76.311 E-.11932
G1 X102.483 Y76.479 E-.06771
G1 X102.51 Y76.692 E-.08189
G1 X102.51 Y77.191 E-.18959
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.36 Y82.825 Z7.56 F42000
G1 X77.671 Y104.362 Z7.56
G1 Z7.16
G1 E.8 F1800
G1 F1731
M204 S5000
G1 X77.453 Y104.171 E.00729
G3 X77.11 Y103.295 I.955 J-.879 E.02421
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.306 J.01 E.05105
G1 X101.657 Y75.412 E.58457
G3 X102.888 Y76.637 I-.074 J1.306 E.04777
G1 X102.89 Y103.295 E.67022
M73 P88 R1
G3 X101.595 Y104.59 I-1.299 J-.003 E.05112
G1 X78.405 Y104.59 E.58301
G3 X77.722 Y104.394 I.003 J-1.298 E.01811
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.453 Y104.171 E-.13281
G1 X77.294 Y103.963 E-.0995
G1 X77.185 Y103.732 E-.09696
G1 X77.137 Y103.561 E-.06767
G1 X77.11 Y103.295 E-.10162
G1 X77.11 Y102.607 E-.26145
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.91 Y95.016 Z7.56 F42000
G1 X79.393 Y80.941 Z7.56
G1 Z7.16
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1731
M204 S5000
G1 X79.397 Y80.929 E.0003
G3 X79.921 Y80.392 I.675 J.135 E.01776
G1 X80.053 Y80.376 E.00296
G3 X79.384 Y81.065 I.019 J.688 E.073
G1 X79.388 Y81.001 E.00143
M204 S250
G1 X79.425 Y81.363 F42000
G1 F1731
M204 S5000
G1 X79.38 Y81.241 E.00291
G3 X80.052 Y80.354 I.688 J-.176 E.02861
G1 X80.118 Y80.356 E.00147
G3 X79.451 Y81.417 I-.05 J.709 E.06555
; WIPE_START
G1 F12000
M204 S6000
G1 X79.38 Y81.241 E-.07213
G1 X79.36 Y81.1 E-.05392
G1 X79.367 Y80.959 E-.05367
G1 X79.402 Y80.822 E-.05381
G1 X79.463 Y80.694 E-.05391
G1 X79.549 Y80.581 E-.05375
G1 X79.655 Y80.488 E-.05377
G1 X79.777 Y80.417 E-.05377
G1 X79.912 Y80.372 E-.05384
G1 X80.052 Y80.354 E-.05382
G1 X80.118 Y80.356 E-.02492
G1 X80.362 Y80.417 E-.09579
G1 X80.485 Y80.488 E-.05374
G1 X80.542 Y80.538 E-.02915
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
; Z_HEIGHT: 7.32
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 45/50
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 15
G1 X101.58 Y75.79 F42000
G1 Z7.32
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1731
M204 S5000
G1 X101.605 Y75.79 E.00063
G3 X102.51 Y76.695 I-.02 J.926 E.03553
G1 X102.51 Y103.305 E.66901
G3 X101.605 Y104.21 I-.921 J-.016 E.03557
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.308 I.021 J-.926 E.03545
G1 X77.49 Y76.695 E.66908
M73 P88 R0
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X101.52 Y75.79 E.58139
; WIPE_START
M73 P89 R0
G1 F11668.197
M204 S6000
G1 X101.605 Y75.79 E-.03226
G1 X101.784 Y75.809 E-.06859
G1 X101.989 Y75.877 E-.08184
G1 X102.148 Y75.973 E-.0707
G1 X102.242 Y76.055 E-.04723
G1 X102.423 Y76.311 E-.11916
G1 X102.492 Y76.52 E-.0838
G1 X102.51 Y76.695 E-.06688
G1 X102.51 Y77.194 E-.18952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.36 Y82.827 Z7.72 F42000
G1 X77.67 Y104.361 Z7.72
G1 Z7.32
G1 E.8 F1800
G1 F1731
M204 S5000
G1 X77.447 Y104.164 E.00748
G3 X77.11 Y103.295 I.962 J-.873 E.02398
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.658 Y75.412 E.5846
G3 X102.888 Y76.637 I-.075 J1.306 E.04773
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.299 J-.003 E.05112
G1 X78.405 Y104.59 E.58301
G3 X77.721 Y104.393 I.003 J-1.299 E.01814
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.447 Y104.164 E-.13567
G1 X77.294 Y103.963 E-.09595
G1 X77.186 Y103.734 E-.09615
G1 X77.125 Y103.494 E-.09412
G1 X77.11 Y103.295 E-.07609
G1 X77.11 Y102.605 E-.26203
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.942 Y95.018 Z7.72 F42000
G1 X79.442 Y81.346 Z7.72
G1 Z7.32
G1 E.8 F1800
; LINE_WIDTH: 0.377567
M73 P90 R0
G1 F1731
M204 S5000
G1 X79.436 Y81.332 E.00033
G3 X79.917 Y80.393 I.633 J-.269 E.0269
G1 X80.053 Y80.376 E.00307
G3 X79.502 Y81.452 I.017 J.688 E.06368
G1 X79.471 Y81.398 E.00139
M204 S250
G1 X79.37 Y80.947 F42000
G1 F1731
M204 S5000
G1 X79.401 Y80.821 E.00289
G3 X80.052 Y80.354 I.668 J.243 E.01906
G1 X80.119 Y80.356 E.00149
G3 X79.36 Y81.006 I-.051 J.709 E.0751
; WIPE_START
G1 F12000
M204 S6000
G1 X79.401 Y80.821 E-.07173
G1 X79.463 Y80.694 E-.05379
G1 X79.549 Y80.581 E-.05389
G1 X79.655 Y80.488 E-.05375
G1 X79.778 Y80.417 E-.05379
G1 X79.912 Y80.372 E-.05386
G1 X80.052 Y80.354 E-.05379
G1 X80.119 Y80.356 E-.02526
G1 X80.362 Y80.417 E-.09543
G1 X80.485 Y80.488 E-.05381
G1 X80.591 Y80.582 E-.05388
G1 X80.677 Y80.694 E-.05373
G1 X80.738 Y80.822 E-.05376
G1 X80.757 Y80.897 E-.02952
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
; Z_HEIGHT: 7.48
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 46/50
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 15
G1 X101.582 Y75.79 F42000
G1 Z7.48
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1731
M204 S5000
G1 X101.605 Y75.79 E.00058
G3 X102.51 Y76.695 I-.021 J.926 E.03553
G1 X102.51 Y103.305 E.66901
G3 X101.605 Y104.21 I-.921 J-.016 E.03558
G1 X78.395 Y104.21 E.58353
G3 X77.49 Y103.308 I.015 J-.921 E.03551
G1 X77.49 Y76.695 E.66908
G3 X78.395 Y75.79 I.92 J.015 E.03558
G1 X101.522 Y75.79 E.58144
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y75.79 E-.03153
G1 X101.783 Y75.808 E-.0682
G1 X101.904 Y75.842 E-.04756
G1 X102.068 Y75.919 E-.0688
G1 X102.216 Y76.03 E-.07022
G1 X102.357 Y76.194 E-.08239
G1 X102.457 Y76.393 E-.08456
G1 X102.492 Y76.52 E-.04996
G1 X102.51 Y76.695 E-.06697
G1 X102.51 Y77.195 E-.18982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.36 Y82.827 Z7.88 F42000
G1 X77.67 Y104.362 Z7.88
G1 Z7.48
G1 E.8 F1800
G1 F1731
M204 S5000
G1 X77.489 Y104.208 E.00599
G3 X77.11 Y103.295 I.92 J-.917 E.0255
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.305 J.01 E.05105
G1 X101.659 Y75.412 E.58464
M73 P91 R0
G3 X102.888 Y76.637 I-.076 J1.306 E.0477
G1 X102.89 Y103.295 E.67022
G3 X101.595 Y104.59 I-1.299 J-.003 E.05112
G1 X78.405 Y104.59 E.58301
G3 X77.721 Y104.393 I.003 J-1.299 E.01813
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.489 Y104.208 E-.11306
G1 X77.294 Y103.963 E-.11894
G1 X77.186 Y103.735 E-.09606
G1 X77.135 Y103.554 E-.07113
G1 X77.11 Y103.295 E-.0991
G1 X77.11 Y102.606 E-.26171
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.942 Y95.019 Z7.88 F42000
G1 X79.442 Y81.346 Z7.88
G1 Z7.48
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1731
M204 S5000
G1 X79.436 Y81.332 E.00034
G3 X79.917 Y80.393 I.633 J-.269 E.0269
G1 X80.053 Y80.376 E.00307
G3 X79.502 Y81.452 I.017 J.688 E.06369
G1 X79.472 Y81.398 E.00138
M204 S250
G1 X79.371 Y80.944 F42000
G1 F1731
M204 S5000
G1 X79.401 Y80.822 E.00282
G3 X80.052 Y80.354 I.668 J.243 E.01906
G1 X80.12 Y80.356 E.00151
G3 X79.361 Y81.003 I-.051 J.709 E.07516
; WIPE_START
G1 F12000
M204 S6000
G1 X79.401 Y80.822 E-.07054
G1 X79.463 Y80.694 E-.05383
G1 X79.549 Y80.582 E-.05371
G1 X79.655 Y80.488 E-.0539
G1 X79.778 Y80.417 E-.05381
G1 X79.912 Y80.372 E-.05384
G1 X80.052 Y80.354 E-.05377
G1 X80.12 Y80.356 E-.02557
G1 X80.362 Y80.417 E-.09513
G1 X80.485 Y80.488 E-.05382
G1 X80.591 Y80.581 E-.05384
G1 X80.677 Y80.694 E-.05369
G1 X80.738 Y80.822 E-.05387
G1 X80.758 Y80.9 E-.03067
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
; Z_HEIGHT: 7.64
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 47/50
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 15
G1 X101.78 Y75.812 F42000
G1 Z7.64
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2926
M204 S5000
G1 X101.82 Y75.818 E.00103
G3 X102.509 Y76.653 I-.223 J.885 E.02913
G1 X102.51 Y77.76 E.02784
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
G1 F2926
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
G1 F2926
G1 X102.51 Y99.44 E.01006
G1 X102.51 Y99.84 E.01006
G1 X102.51 Y100.24 E.01006
G1 X102.509 Y103.345 E.07806
G3 X101.605 Y104.21 I-.921 J-.057 E.03458
G1 X82.74 Y104.21 E.47429
G1 X82.34 Y104.21 E.01006
G1 X81.94 Y104.21 E.01006
M73 P92 R0
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
G1 F2926
G1 X80.06 Y104.21 E.01006
G1 X79.66 Y104.21 E.01006
G1 X79.26 Y104.21 E.01006
G1 X78.395 Y104.21 E.02175
G3 X77.49 Y103.305 I.007 J-.912 E.03566
G1 X77.49 Y86.24 E.42904
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
G1 F2926
G1 X77.49 Y83.56 E.01006
G1 X77.49 Y83.16 E.01006
G1 X77.49 Y82.76 E.01006
G1 X77.49 Y76.695 E.15249
G3 X78.395 Y75.79 I.92 J.016 E.03558
G1 X101.608 Y75.79 E.58359
G1 X101.72 Y75.804 E.00286
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.82 Y75.818 E-.03842
G1 X101.989 Y75.877 E-.06795
G1 X102.244 Y76.056 E-.11828
G1 X102.381 Y76.232 E-.0848
G1 X102.441 Y76.352 E-.05088
G1 X102.493 Y76.525 E-.06871
G1 X102.509 Y76.653 E-.04898
G1 X102.509 Y77.395 E-.282
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.166 Y79.474 Z8.04 F42000
G1 X77.9 Y84.361 Z8.04
G1 Z7.64
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X78.089 Y84.361 E.00513
G1 X78.089 Y84.639 E.00755
M106 S201.45
M106 S255
G1 F3000
G1 X77.9 Y84.639 E.00513
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X77.518 Y84.639 E.01036
M106 S201.45
G1 F1166.154
G1 X77.518 Y84.361 E.00755
M106 S255
G1 F600
G1 X77.84 Y84.361 E.00874
M106 S201.45
; WIPE_START
G1 X78.089 Y84.361 E-.1114
G1 X78.089 Y84.639 E-.12451
G1 X77.9 Y84.639 E-.08459
G1 X77.518 Y84.639 E-.1709
G1 X77.518 Y84.361 E-.12451
G1 X77.84 Y84.361 E-.14409
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.04 I-1.2 J.204 P1  F42000
G1 X81.139 Y103.8 Z8.04
G1 Z7.64
G1 E.8 F1800
M106 S255
G1 F600
M204 S6000
G1 X81.139 Y104.183 E.01036
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
G1 X81.139 Y103.74 E.00892
M106 S201.45
; WIPE_START
M204 S6000
G1 X81.139 Y104.183 E-.16815
G1 X81.139 Y104.189 E-.00261
G1 X80.861 Y104.183 E-.10593
G1 X80.861 Y103.8 E-.14535
G1 X80.861 Y103.411 E-.14795
G1 X81.139 Y103.411 E-.1059
G1 X81.139 Y103.632 E-.08411
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.04 I.297 J1.18 P1  F42000
G1 X102.1 Y98.361 Z8.04
G1 Z7.64
G1 E.8 F1800
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X102.483 Y98.361 E.01036
M106 S201.45
G1 F1181.837
G1 X102.489 Y98.639 E.00755
G1 F622.368
G1 X102.483 Y98.639 E.00018
M106 S255
G1 F600
G1 X102.1 Y98.639 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X101.911 Y98.639 E.00513
G1 X101.911 Y98.361 E.00755
G1 X102.04 Y98.361 E.0035
M106 S201.45
; WIPE_START
M204 S6000
G1 X102.483 Y98.361 E-.19694
G1 X102.489 Y98.639 E-.12407
G1 X102.483 Y98.639 E-.00291
G1 X102.1 Y98.639 E-.17023
G1 X101.911 Y98.639 E-.08426
G1 X101.911 Y98.361 E-.12403
G1 X102.04 Y98.361 E-.05756
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.04 I1.217 J.004 P1  F42000
G1 X102.1 Y79.361 Z8.04
G1 Z7.64
G1 E.8 F1800
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X102.483 Y79.361 E.01036
M106 S201.45
G1 F1178.823
G1 X102.488 Y79.639 E.00755
G1 F618.089
G1 X102.483 Y79.639 E.00014
M106 S255
G1 F600
G1 X102.1 Y79.639 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X101.911 Y79.639 E.00513
G1 X101.911 Y79.361 E.00755
G1 X102.04 Y79.361 E.0035
M106 S201.45
; WIPE_START
M204 S6000
G1 X102.483 Y79.361 E-.19708
G1 X102.488 Y79.639 E-.12415
G1 X102.483 Y79.639 E-.00236
G1 X102.1 Y79.639 E-.17036
G1 X101.911 Y79.639 E-.08433
G1 X101.911 Y79.361 E-.12412
G1 X102.04 Y79.361 E-.0576
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.04 I-.871 J-.849 P1  F42000
G1 X77.67 Y104.361 Z8.04
G1 Z7.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2926
M204 S5000
G1 X77.492 Y104.208 E.00589
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.661 Y75.412 E.58467
G3 X102.888 Y76.637 I-.078 J1.306 E.04766
G1 X102.89 Y103.297 E.67028
M73 P93 R0
G3 X101.595 Y104.59 I-1.299 J-.006 E.05106
G1 X78.403 Y104.59 E.58307
G3 X77.722 Y104.39 I.013 J-1.306 E.01807
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.492 Y104.208 E-.1114
G1 X77.296 Y103.967 E-.11783
G1 X77.186 Y103.734 E-.09803
G1 X77.135 Y103.554 E-.07109
G1 X77.11 Y103.295 E-.09909
G1 X77.11 Y102.604 E-.26257
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.942 Y95.017 Z8.04 F42000
G1 X79.441 Y81.344 Z8.04
G1 Z7.64
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F2926
M204 S5000
G1 X79.436 Y81.332 E.00029
G3 X79.917 Y80.393 I.634 J-.268 E.02691
G1 X80.053 Y80.376 E.00307
G3 X79.502 Y81.453 I.017 J.688 E.06373
G1 X79.47 Y81.396 E.00144
M204 S250
G1 X79.375 Y80.927 F42000
G1 F2926
M204 S5000
G1 X79.381 Y80.89 E.00084
G3 X80.052 Y80.354 I.689 J.175 E.02063
G1 X80.123 Y80.356 E.00158
G3 X79.36 Y81.03 I-.053 J.709 E.07451
G1 X79.367 Y80.986 E.00099
; WIPE_START
G1 F12000
M204 S6000
G1 X79.381 Y80.89 E-.03699
G1 X79.429 Y80.757 E-.05385
G1 X79.503 Y80.636 E-.05379
G1 X79.6 Y80.532 E-.05384
G1 X79.778 Y80.417 E-.08048
G1 X79.912 Y80.372 E-.05379
G1 X80.052 Y80.354 E-.05385
G1 X80.123 Y80.356 E-.02689
G1 X80.262 Y80.381 E-.05379
G1 X80.394 Y80.432 E-.05386
G1 X80.513 Y80.509 E-.05381
G1 X80.615 Y80.608 E-.05381
G1 X80.694 Y80.725 E-.05376
G1 X80.749 Y80.853 E-.05289
G1 X80.757 Y80.917 E-.02461
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
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 48/50
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 15
G1 X101.51 Y78.96 F42000
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1853
M204 S5000
G1 X101.51 Y80.04 E.02715
G1 X102.51 Y80.04 E.02514
G1 X102.51 Y97.96 E.45053
G1 X101.51 Y97.96 E.02514
G1 X101.51 Y99.04 E.02715
G1 X102.51 Y99.04 E.02514
G1 X102.509 Y103.345 E.10822
G3 X101.605 Y104.21 I-.92 J-.056 E.03459
G1 X81.54 Y104.21 E.50446
G1 X81.54 Y103.01 E.03017
G1 X80.46 Y103.01 E.02715
M73 P94 R0
G1 X80.46 Y104.21 E.03017
G1 X78.395 Y104.21 E.05192
G3 X77.49 Y103.308 I.007 J-.912 E.03559
G1 X77.49 Y85.04 E.45928
G1 X78.49 Y85.04 E.02514
G1 X78.49 Y83.96 E.02715
G1 X77.49 Y83.96 E.02514
G1 X77.49 Y76.695 E.18266
G3 X78.395 Y75.79 I.92 J.016 E.03558
G1 X101.605 Y75.79 E.58354
G3 X102.509 Y76.653 I-.011 J.916 E.03457
G1 X102.51 Y78.96 E.058
G1 X101.57 Y78.96 E.02363
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.51 Y80.04 E-.41104
G1 X102.428 Y80.04 E-.34896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I-.853 J-.868 P1  F42000
G1 X77.67 Y104.361 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F1853
M204 S5000
G1 X77.493 Y104.208 E.00589
G3 X77.11 Y103.295 I.923 J-.923 E.02552
G1 X77.11 Y76.705 E.66849
G3 X78.405 Y75.41 I1.299 J.003 E.05112
G1 X101.662 Y75.412 E.58471
G3 X102.888 Y76.637 I-.08 J1.306 E.04763
G1 X102.89 Y103.295 E.67021
M73 P95 R0
G3 X101.595 Y104.59 I-1.298 J-.003 E.05112
G1 X78.405 Y104.59 E.58301
G3 X77.722 Y104.39 I.01 J-1.306 E.01814
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.493 Y104.208 E-.11129
G1 X77.296 Y103.966 E-.1184
G1 X77.185 Y103.732 E-.09845
G1 X77.135 Y103.552 E-.07109
G1 X77.11 Y103.295 E-.09808
G1 X77.11 Y102.603 E-.26269
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

G1 X81.328 Y103.853
G1 Z7.8
G1 E.8 F1800
; FEATURE: Top surface
G1 F1853
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
G3 Z8.2 I1.202 J-.192 P1  F42000
G1 X78.102 Y84.172 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F1853
M204 S2000
G1 X77.446 Y84.828 E.02332
M204 S10000
G1 X78.263 Y84.847 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.103013
G1 F1853
M204 S6000
G1 X78.263 Y84.153 E.00311
; WIPE_START
G1 F18000
G1 X78.263 Y84.847 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I.273 J1.186 P1  F42000
G1 X102.676 Y79.233 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1853
M204 S2000
G1 X102.081 Y79.828 E.02117
G1 X101.722 Y79.641
G1 X102.191 Y79.172 E.01668
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.722 Y79.641 E-.26406
G1 X102.081 Y79.828 E-.16093
G1 X102.676 Y79.233 E-.33501
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.479 Y86.862 Z8.2 F42000
G1 X102.17 Y98.828 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F1853
M204 S2000
G1 X102.678 Y98.32 E.01804
G1 X102.281 Y98.172
G1 X101.722 Y98.731 E.01986
; CHANGE_LAYER
; Z_HEIGHT: 7.96
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
M106 S204
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.2 I-1.215 J.068 P1  F42000
G1 X102.438 Y103.647 Z8.2
G1 Z7.96
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1200
M204 S5000
G2 X102.509 Y103.345 I-.849 J-.359 E.00785
G1 X102.51 Y101.01 E.0587
G1 X102.89 Y101.01 E.00956
G1 X102.89 Y103.295 E.05744
G3 X101.666 Y104.588 I-1.299 J-.004 E.04934
G1 X99.31 Y104.59 E.05923
G1 X99.31 Y104.21 E.00955
G1 X101.605 Y104.21 E.0577
G2 X102.413 Y103.702 I-.016 J-.922 E.02522
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.482 Y103.524 E-.07268
G1 X102.509 Y103.345 E-.06875
G1 X102.51 Y101.717 E-.61858
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.92 Y102.522 Z8.36 F42000
G1 X77.661 Y104.353 Z8.36
G1 Z7.96
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X77.635 Y104.331 E.00086
G3 X77.11 Y103.295 I.781 J-1.047 E.03026
G1 X77.11 Y101.01 E.05744
G1 X77.49 Y101.01 E.00955
G1 X77.49 Y103.308 E.05777
G2 X78.395 Y104.21 I.926 J-.024 E.03545
G1 X80.69 Y104.21 E.0577
G1 X80.69 Y104.59 E.00955
G1 X78.405 Y104.59 E.05744
G3 X77.906 Y104.486 I.01 J-1.306 E.01291
G1 X77.714 Y104.381 E.00551
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.635 Y104.331 E-.03557
G1 X77.488 Y104.212 E-.07182
G1 X77.295 Y103.965 E-.11904
G1 X77.186 Y103.735 E-.09704
G1 X77.135 Y103.554 E-.0712
G1 X77.11 Y103.295 E-.09902
G1 X77.11 Y102.594 E-.26631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.233 Y94.962 Z8.36 F42000
G1 X77.49 Y78.99 Z8.36
G1 Z7.96
G1 E.8 F1800
M73 P96 R0
G1 F1200
M204 S5000
G1 X77.11 Y78.99 E.00955
G1 X77.11 Y76.705 E.05744
G3 X78.405 Y75.41 I1.294 J-.001 E.05117
G1 X80.69 Y75.41 E.05744
G1 X80.69 Y75.79 E.00956
G1 X78.355 Y75.791 E.0587
G2 X77.49 Y76.695 I.057 J.92 E.03457
G1 X77.49 Y78.93 E.0562
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.11 Y78.99 E-.14619
G1 X77.11 Y77.375 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y77.859 Z8.36 F42000
G1 X102.51 Y78.99 Z8.36
G1 Z7.96
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X102.51 Y76.695 E.0577
G2 X101.645 Y75.791 I-.922 J.016 E.03458
G1 X99.31 Y75.79 E.0587
G1 X99.31 Y75.41 E.00955
G1 X101.664 Y75.412 E.05917
G3 X102.888 Y76.634 I-.082 J1.306 E.04753
G1 X102.89 Y78.99 E.05923
G1 X102.57 Y78.99 E.00804
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.518 Y76.991 E-.76
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
; Z_HEIGHT: 8.12
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 50/50
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 15
G1 X102.401 Y103.725 F42000
G1 Z8.12
G1 E.8 F1800
G1 F1200
M204 S5000
G2 X102.509 Y103.347 I-.812 J-.437 E.00996
G1 X102.51 Y101.01 E.05876
G1 X102.89 Y101.01 E.00956
G1 X102.89 Y103.295 E.05744
G3 X101.663 Y104.588 I-1.299 J-.004 E.04939
G1 X99.31 Y104.59 E.05917
G1 X99.31 Y104.21 E.00955
G1 X101.606 Y104.21 E.05772
G2 X102.371 Y103.777 I-.017 J-.922 E.02304
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.457 Y103.607 E-.07258
G1 X102.509 Y103.347 E-.10054
G1 X102.51 Y101.803 E-.58689
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.917 Y102.581 Z8.52 F42000
G1 X77.659 Y104.351 Z8.52
G1 Z8.12
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X77.632 Y104.332 E.00084
G3 X77.11 Y103.295 I.777 J-1.041 E.03026
G1 X77.11 Y101.01 E.05744
G1 X77.49 Y101.01 E.00955
G1 X77.49 Y103.305 E.05771
G2 X78.395 Y104.21 I.926 J-.021 E.03552
G1 X80.69 Y104.21 E.0577
G1 X80.69 Y104.59 E.00955
G1 X78.405 Y104.59 E.05744
G3 X77.907 Y104.489 I.003 J-1.299 E.01286
G1 X77.711 Y104.38 E.00565
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.632 Y104.332 E-.03538
G1 X77.486 Y104.21 E-.07197
G1 X77.329 Y104.019 E-.09423
G1 X77.208 Y103.794 E-.09699
G1 X77.124 Y103.487 E-.12101
G1 X77.11 Y103.295 E-.07312
G1 X77.11 Y102.591 E-.26729
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.233 Y94.96 Z8.52 F42000
G1 X77.49 Y78.99 Z8.52
G1 Z8.12
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X77.11 Y78.99 E.00955
G1 X77.11 Y76.705 E.05744
G3 X78.405 Y75.41 I1.294 J-.001 E.05117
G1 X80.69 Y75.41 E.05744
G1 X80.69 Y75.79 E.00956
G1 X78.355 Y75.791 E.0587
G2 X77.49 Y76.695 I.056 J.92 E.03458
G1 X77.49 Y78.93 E.0562
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.11 Y78.99 E-.14619
G1 X77.11 Y77.375 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.723 Y76.831 Z8.52 F42000
G1 X99.31 Y75.79 Z8.52
G1 Z8.12
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X99.31 Y75.41 E.00955
G1 X101.665 Y75.412 E.05921
G3 X102.888 Y76.637 I-.075 J1.298 E.04762
G1 X102.89 Y78.99 E.05917
G1 X102.51 Y78.99 E.00955
G1 X102.51 Y76.695 E.0577
G2 X101.647 Y75.791 I-.922 J.016 E.03452
G1 X99.37 Y75.79 E.05725
; WIPE_START
G1 F11668.197
M204 S6000
M73 P97 R0
G1 X99.31 Y75.41 E-.14617
G1 X100.925 Y75.411 E-.61383
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
M73 P98 R0
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


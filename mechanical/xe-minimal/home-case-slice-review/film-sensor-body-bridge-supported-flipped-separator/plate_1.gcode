; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 2m 55s; total estimated time: 3m 14s
; total layer number: 8
; total filament length [mm] : 175.98
; total filament volume [cm^3] : 423.29
; total filament weight [g] : 0.52
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
M73 P8 R2
G1 X75.398 Y83.951 F42000
M204 S6000
M73 P9 R2
G1 Z.4
G1 Z.14
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F3000
M204 S500
G1 X79.388 Y83.951 E.08874
G1 X79.356 Y83.848 E.0024
G1 X79.557 Y83.469 E.00954
G1 X79.557 Y83.313 E.00347
G2 X79.772 Y83.065 I-.298 J-.475 E.0074
G1 X75.572 Y83.065 E.09343
G1 X75.572 Y82.18 E.0197
G1 X80.243 Y82.18 E.10391
M73 P10 R2
G1 X80.714 Y81.294 E.02231
G1 X75.572 Y81.294 E.11438
G1 X75.572 Y80.408 E.0197
G1 X81.381 Y80.408 E.12923
; WIPE_START
G1 X79.381 Y80.408 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X84.402 Y81.294 Z.54 F42000
G1 Z.14
G1 E.8 F1800
G1 F3000
M204 S500
G1 X83.302 Y81.294 E.02447
G1 X83.191 Y80.827 E.01069
G1 X82.404 Y80.408 E.01982
G1 X84.229 Y80.408 E.0406
G1 X84.229 Y79.523 E.0197
G1 X75.572 Y79.523 E.19257
G1 X75.572 Y78.637 E.0197
G1 X84.402 Y78.637 E.19643
; WIPE_START
G1 X82.402 Y78.637 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X86.813 Y84.866 Z.54 F42000
G1 X89.29 Y88.366 Z.54
G1 Z.14
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
M73 P11 R2
G1 F3000
M204 S500
G1 X90.605 Y85.893 E.07506
G1 X91.223 Y86.222 E.01877
G1 X89.909 Y88.694 E.07506
G1 X89.353 Y88.399 E.01688
M204 S6000
G1 X98.65 Y93.342 F42000
G1 F3000
M204 S500
G1 X99.964 Y90.87 E.07506
G1 X100.582 Y91.198 E.01877
G1 X99.268 Y93.671 E.07506
G1 X98.712 Y93.375 E.01688
M204 S6000
G1 X100.6 Y82.366 F42000
G1 F3000
M204 S500
G1 X100.6 Y79.551 E.07547
G1 X88.057 Y79.551 E.33623
G1 X88.057 Y82.437 E.07736
G1 X82.59 Y82.437 E.14657
G1 X81.31 Y84.843 E.07307
G1 X81.15 Y84.892 E.00449
G1 X81.15 Y85.924 E.02767
G1 X80.886 Y86.188 E.00999
G1 X79.914 Y86.188 E.02608
G1 X79.65 Y85.924 E.00999
G1 X79.65 Y84.822 E.02954
G1 X75.129 Y84.822 E.1212
G1 X75.129 Y82.822 E.05361
G1 X73.629 Y82.822 E.04021
M73 P12 R2
G1 X73.629 Y103.636 E.55795
G1 X106.371 Y103.636 E.87771
G1 X106.371 Y82.437 E.56829
G1 X100.6 Y82.437 E.15471
M204 S6000
G1 X100.443 Y82.648 F42000
M73 P13 R2
G1 F3000
M204 S500
G1 X100.443 Y90.646 E.21439
G1 X99.921 Y90.368 E.01585
G1 X99.921 Y79.974 E.27863
G1 X99.399 Y79.974 E.014
G1 X99.399 Y91.032 E.29643
G1 X98.877 Y92.014 E.02982
G1 X98.877 Y79.974 E.32275
G1 X98.355 Y79.974 E.014
G1 X98.355 Y103.213 E.62297
G1 X98.877 Y103.213 E.014
G1 X98.877 Y93.942 E.24853
M73 P14 R2
G1 X99.399 Y94.22 E.01585
G1 X99.399 Y103.213 E.24109
G1 X99.921 Y103.213 E.014
G1 X99.921 Y93.343 E.26459
G1 X100.443 Y92.361 E.02982
G1 X100.443 Y103.213 E.29091
G1 X100.966 Y103.213 E.014
G1 X100.966 Y82.86 E.54562
G1 X101.488 Y82.86 E.014
G1 X101.488 Y103.213 E.54562
G1 X102.01 Y103.213 E.014
G1 X102.01 Y82.86 E.54562
M73 P15 R2
G1 X102.532 Y82.86 E.014
G1 X102.532 Y103.213 E.54562
G1 X103.054 Y103.213 E.014
G1 X103.054 Y82.86 E.54562
G1 X103.576 Y82.86 E.014
G1 X103.576 Y103.213 E.54562
G1 X104.099 Y103.213 E.014
M73 P16 R2
G1 X104.099 Y82.86 E.54562
G1 X104.621 Y82.86 E.014
G1 X104.621 Y103.213 E.54562
G1 X105.143 Y103.213 E.014
G1 X105.143 Y82.86 E.54562
G1 X105.665 Y82.86 E.014
G1 X105.665 Y103.425 E.55129
M204 S6000
M73 P17 R2
G1 X97.833 Y103.425 F42000
G1 F3000
M204 S500
G1 X97.833 Y79.974 E.62864
G1 X97.31 Y79.974 E.014
G1 X97.31 Y103.213 E.62297
G1 X96.788 Y103.213 E.014
G1 X96.788 Y79.974 E.62297
G1 X96.266 Y79.974 E.014
G1 X96.266 Y103.213 E.62297
M73 P18 R2
G1 X95.744 Y103.213 E.014
G1 X95.744 Y79.974 E.62297
G1 X95.222 Y79.974 E.014
G1 X95.222 Y103.213 E.62297
G1 X94.7 Y103.213 E.014
G1 X94.7 Y79.974 E.62297
M73 P19 R2
G1 X94.177 Y79.974 E.014
G1 X94.177 Y103.213 E.62297
G1 X93.655 Y103.213 E.014
G1 X93.655 Y79.974 E.62297
G1 X93.133 Y79.974 E.014
G1 X93.133 Y103.213 E.62297
G1 X92.611 Y103.213 E.014
G1 X92.611 Y79.974 E.62297
M73 P20 R2
G1 X92.089 Y79.974 E.014
G1 X92.089 Y103.213 E.62297
G1 X91.567 Y103.213 E.014
G1 X91.567 Y79.974 E.62297
G1 X91.044 Y79.974 E.014
G1 X91.044 Y85.648 E.1521
M73 P21 R2
G1 X90.522 Y85.37 E.01585
G1 X90.522 Y79.974 E.14466
G1 X90 Y79.974 E.014
G1 X90 Y86.13 E.16503
G1 X89.478 Y87.112 E.02982
G1 X89.478 Y79.974 E.19136
G1 X88.956 Y79.974 E.014
G1 X88.956 Y103.213 E.62297
G1 X89.478 Y103.213 E.014
G1 X89.478 Y88.944 E.3825
G1 X90 Y89.222 E.01585
G1 X90 Y103.213 E.37506
M73 P22 R2
G1 X90.522 Y103.213 E.014
G1 X90.522 Y88.442 E.39598
G1 X91.044 Y87.459 E.02982
G1 X91.044 Y103.425 E.42798
M204 S6000
G1 X88.433 Y103.425 F42000
G1 F3000
M204 S500
G1 X88.433 Y82.86 E.55129
G1 X87.911 Y82.86 E.014
G1 X87.911 Y103.213 E.54562
G1 X87.389 Y103.213 E.014
M73 P23 R2
G1 X87.389 Y82.86 E.54562
G1 X86.867 Y82.86 E.014
G1 X86.867 Y103.213 E.54562
G1 X86.345 Y103.213 E.014
G1 X86.345 Y82.86 E.54562
G1 X85.823 Y82.86 E.014
G1 X85.823 Y103.213 E.54562
M73 P24 R2
G1 X85.3 Y103.213 E.014
G1 X85.3 Y82.86 E.54562
G1 X84.778 Y82.86 E.014
G1 X84.778 Y103.213 E.54562
G1 X84.256 Y103.213 E.014
G1 X84.256 Y82.86 E.54562
G1 X83.734 Y82.86 E.014
G1 X83.734 Y103.213 E.54562
M73 P25 R2
G1 X83.212 Y103.213 E.014
G1 X83.212 Y82.86 E.54562
G1 X82.844 Y82.86 E.00986
G1 X82.69 Y83.15 E.00881
G1 X82.69 Y103.213 E.53784
G1 X82.167 Y103.213 E.014
G1 X82.167 Y84.132 E.51151
G1 X81.645 Y85.114 E.02982
G1 X81.645 Y103.213 E.48519
M73 P26 R2
G1 X81.123 Y103.213 E.014
G1 X81.123 Y86.549 E.44671
G1 X81.062 Y86.611 E.00233
G1 X80.601 Y86.611 E.01235
G1 X80.601 Y103.213 E.44506
G1 X80.079 Y103.213 E.014
G1 X80.079 Y86.611 E.44506
G1 X79.738 Y86.611 E.00912
G1 X79.557 Y86.429 E.00689
M73 P27 R2
G1 X79.557 Y103.213 E.44993
G1 X79.034 Y103.213 E.014
G1 X79.034 Y85.245 E.48166
G1 X78.512 Y85.245 E.014
G1 X78.512 Y103.213 E.48166
G1 X77.99 Y103.213 E.014
G1 X77.99 Y85.245 E.48166
G1 X77.468 Y85.245 E.014
G1 X77.468 Y103.213 E.48166
M73 P28 R2
G1 X76.946 Y103.213 E.014
G1 X76.946 Y85.245 E.48166
G1 X76.424 Y85.245 E.014
G1 X76.424 Y103.213 E.48166
G1 X75.901 Y103.213 E.014
G1 X75.901 Y85.245 E.48166
G1 X75.379 Y85.245 E.014
G1 X75.379 Y103.213 E.48166
G1 X74.857 Y103.213 E.014
G1 X74.857 Y85.245 E.48166
M73 P29 R2
G1 X74.706 Y85.245 E.00406
G1 X74.706 Y83.245 E.05361
G1 X74.335 Y83.245 E.00994
G1 X74.335 Y103.425 E.54094
; WIPE_START
G1 X74.335 Y101.425 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X76.848 Y94.218 Z.54 F42000
G1 X80.45 Y83.892 Z.54
G1 Z.14
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X80.45 Y85.488 E.04279
G1 X80.35 Y85.488 E.00268
G1 X80.35 Y83.838 E.04422
G1 X80.279 Y83.801 E.00216
G1 X81.781 Y80.975 E.08578
G1 X82.399 Y81.304 E.01877
G1 X80.897 Y84.129 E.08578
M73 P30 R2
G1 X80.503 Y83.92 E.01196
; WIPE_START
G1 X80.45 Y85.488 E-.59621
G1 X80.35 Y85.488 E-.038
G1 X80.35 Y85.157 E-.12578
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

G1 X80.698 Y83.758
G1 Z.14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.260126
G1 F3000
M204 S500
G1 X81.98 Y81.347 E.03583
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
G1 X81.041 Y83.113 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/9
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S198.9
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.54 I.565 J1.078 P1  F42000
G1 X83.8 Y81.667 Z.54
G1 Z.3
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
M204 S6000
G1 X83.8 Y78.608 E.07692
G1 X82.915 Y78.608 E.02227
G1 X82.915 Y80.68 E.0521
G1 X82.029 Y80.209 E.02522
G1 X82.029 Y78.608 E.04026
G1 X81.143 Y78.608 E.02227
G1 X81.143 Y80.486 E.04722
G1 X80.258 Y82.152 E.04743
G1 X80.258 Y78.608 E.0891
G1 X79.372 Y78.608 E.02227
G1 X79.372 Y84.38 E.14511
G1 X78.486 Y84.38 E.02227
G1 X78.486 Y78.608 E.14511
G1 X77.601 Y78.608 E.02227
G1 X77.601 Y84.38 E.14511
G1 X76.715 Y84.38 E.02227
G1 X76.715 Y78.608 E.14511
G1 X75.829 Y78.608 E.02227
G1 X75.829 Y84.553 E.14947
; WIPE_START
G1 X75.829 Y82.553 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-1.217 J-.029 P1  F42000
G1 X75.572 Y93.229 Z.7
G1 Z.3
M73 P31 R2
G1 E.8 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G1 X75.572 Y95.922 E.0677
G1 X99.363 Y95.922 E.59816
G1 X99.868 Y96.19 E.01437
G1 X100.179 Y96.095 E.00818
G1 X100.271 Y95.922 E.00493
G1 X104.428 Y95.922 E.10452
G1 X104.428 Y98.808 E.07255
G1 X75.572 Y98.808 E.7255
G1 X75.572 Y101.693 E.07255
G1 X104.428 Y101.693 E.7255
M204 S10000
G1 X100.362 Y95.752 F42000
G1 F9000
M204 S6000
G1 X101.806 Y93.036 E.07732
G1 X104.428 Y93.036 E.06594
G1 X104.428 Y90.151 E.07255
G1 X102.75 Y90.151 E.0422
G1 X100.799 Y89.113 E.05554
G1 X100.758 Y88.978 E.00356
G1 X99.411 Y88.262 E.03835
G1 X99.1 Y88.357 E.00818
G1 X98.146 Y90.151 E.05107
G1 X91.335 Y90.151 E.17125
G1 X90.773 Y91.207 E.03008
G1 X90.462 Y91.302 E.00818
G1 X89.115 Y90.586 E.03835
G1 X89.074 Y90.451 E.00356
G1 X88.509 Y90.151 E.01607
G1 X75.572 Y90.151 E.32527
G1 X75.572 Y93.036 E.07255
G1 X96.612 Y93.036 E.52898
G1 X96.083 Y94.031 E.02831
G1 X96.178 Y94.342 E.00818
G1 X97.525 Y95.058 E.03835
G1 X97.661 Y95.017 E.00356
G1 X98.834 Y95.64 E.0334
; WIPE_START
G1 X97.661 Y95.017 E-.50481
G1 X97.525 Y95.058 E-.05374
G1 X97.057 Y94.809 E-.20146
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I1.204 J.179 P1  F42000
G1 X98.657 Y84.071 Z.7
G1 Z.3
M73 P32 R2
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X98.657 Y81.494 E.06479
G1 X90 Y81.494 E.21765
G1 X90 Y83.376 E.04731
G1 X91.896 Y84.379 E.05393
G1 X104.428 Y84.379 E.31509
G1 X104.428 Y87.265 E.07255
G1 X92.869 Y87.265 E.29062
G1 X91.425 Y89.98 E.07732
; WIPE_START
G1 X92.364 Y88.215 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-.43 J-1.139 P1  F42000
G1 X87.979 Y89.869 Z.7
G1 Z.3
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X86.866 Y89.277 E.0317
G1 X86.771 Y88.966 E.00818
G1 X87.675 Y87.265 E.04843
G1 X75.572 Y87.265 E.3043
G1 X75.572 Y84.765 E.06285
G1 X79.557 Y84.765 E.1002
G1 X79.557 Y85.963 E.03011
G1 X79.875 Y86.281 E.01131
G1 X80.925 Y86.281 E.02639
G1 X81.243 Y85.963 E.01131
G1 X81.243 Y84.961 E.02519
G1 X81.374 Y84.921 E.00345
G1 X81.662 Y84.379 E.01542
G1 X87.114 Y84.379 E.13708
G1 X87.114 Y86.971 E.06517
; WIPE_START
G1 X87.114 Y84.971 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I.184 J-1.203 P1  F42000
G1 X80.49 Y83.958 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
G1 F11668.197
M204 S5000
G1 X80.49 Y85.528 E.03946
G1 X80.31 Y85.528 E.00453
G1 X80.31 Y83.863 E.04187
G1 X80.225 Y83.817 E.00243
G1 X81.765 Y80.921 E.08246
G1 X82.453 Y81.287 E.01961
G1 X80.913 Y84.183 E.08246
G1 X80.543 Y83.986 E.01055
; WIPE_START
M204 S6000
G1 X80.49 Y85.528 E-.58611
G1 X80.31 Y85.528 E-.0684
G1 X80.31 Y85.25 E-.10548
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

G1 X80.716 Y83.345
G1 Z.3
G1 E.8 F1800
; FEATURE: Top surface
G1 F11668.197
M204 S2000
G1 X81.576 Y82.485 E.03059
G1 X82.15 Y81.366
G1 X81.335 Y82.181 E.02896
; WIPE_START
M204 S6000
M73 P33 R2
G1 X82.15 Y81.366 E-.43767
G1 X81.763 Y82.121 E-.32233
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.914 Y81.219 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.14809
G1 F18000
M204 S6000
G1 X81.796 Y81.378 E.00147
; LINE_WIDTH: 0.103106
G1 X81.678 Y81.537 E.00089
M204 S10000
G1 X81.446 Y82.317 F42000
; LINE_WIDTH: 0.213762
G1 F18000
M204 S6000
G1 X81.343 Y82.317 E.0012
; LINE_WIDTH: 0.192946
G1 X81.248 Y82.445 E.00165
; LINE_WIDTH: 0.148013
G1 X81.153 Y82.574 E.00118
; LINE_WIDTH: 0.103081
G1 X81.058 Y82.702 E.00072
M204 S10000
G1 X81.234 Y83.128 F42000
; LINE_WIDTH: 0.105371
G1 F18000
M204 S6000
G1 X81.13 Y83.269 E.00081
; LINE_WIDTH: 0.154886
G1 X81.025 Y83.41 E.00138
; LINE_WIDTH: 0.204401
G1 X80.921 Y83.551 E.00194
; LINE_WIDTH: 0.254114
G1 X80.879 Y83.576 E.0007
; LINE_WIDTH: 0.303994
G1 F16687.806
G1 X80.838 Y83.602 E.00086
; LINE_WIDTH: 0.353874
G1 F14082.835
G1 X80.796 Y83.627 E.00102
; LINE_WIDTH: 0.42381
G1 F11554.039
G1 X80.754 Y83.653 E.00124
G1 X80.66 Y83.83 E.0051
; WIPE_START
G1 X80.754 Y83.653 E-.61113
G1 X80.796 Y83.627 E-.14887
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-.624 J1.045 P1  F42000
G1 X88.348 Y88.137 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X90.217 Y84.623 E.10783
G1 X91.257 Y85.176 E.03194
G1 X89.061 Y89.308 E.12678
G1 X88.02 Y88.754 E.03194
G1 X88.32 Y88.19 E.01732
M106 S198.9
M204 S250
G1 X87.995 Y87.949 F42000
M106 S255
G1 F600
M204 S5000
G1 X90.051 Y84.081 E.11869
G1 X91.799 Y85.011 E.05365
G1 X89.227 Y89.849 E.14849
M73 P34 R2
G1 X87.478 Y88.92 E.05365
G1 X87.967 Y88.002 E.02818
M106 S198.9
; WIPE_START
M204 S6000
G1 X88.905 Y86.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I.777 J.937 P1  F42000
G1 X90.464 Y84.944 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.475946
M106 S255
G1 F3000
M204 S6000
G1 X88.505 Y88.626 E.12008
G1 X88.895 Y88.834 E.01271
G1 X90.854 Y85.151 E.12008
M106 S198.9
; WIPE_START
G1 X89.915 Y86.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-1.2 J.2 P1  F42000
G1 X90.29 Y89.169 Z.7
G1 Z.3
M73 P35 R2
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X92.394 Y85.214 E.1214
G1 X93.082 Y85.58 E.02114
G1 X90.416 Y90.595 E.15391
G1 X89.727 Y90.229 E.02114
G1 X90.262 Y89.222 E.03089
M106 S198.9
; WIPE_START
M204 S6000
G1 X91.201 Y87.456 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-1.14 J-.425 P1  F42000
G1 X90.165 Y90.235 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.413692
G1 F11862.219
M204 S6000
G1 X92.644 Y85.574 E.13056
; WIPE_START
G1 X91.705 Y87.339 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-.856 J.865 P1  F42000
G1 X97.354 Y92.925 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
M73 P36 R2
G1 F600
M204 S5000
G1 X99.457 Y88.969 E.1214
G1 X100.146 Y89.336 E.02114
G1 X97.479 Y94.351 E.15391
G1 X96.791 Y93.984 E.02114
G1 X97.326 Y92.978 E.03089
M106 S198.9
; WIPE_START
M204 S6000
G1 X98.265 Y91.212 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-1.14 J-.425 P1  F42000
G1 X97.229 Y93.991 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.413692
G1 F11862.219
M204 S6000
G1 X99.707 Y89.329 E.13056
; WIPE_START
G1 X98.769 Y91.095 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-1.214 J.08 P1  F42000
G1 X98.944 Y93.77 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
M73 P37 R2
G1 X100.812 Y90.257 E.10783
G1 X101.853 Y90.81 E.03194
G1 X99.656 Y94.941 E.12678
G1 X98.615 Y94.388 E.03194
G1 X98.916 Y93.823 E.01732
M106 S198.9
M204 S250
G1 X98.59 Y93.582 F42000
M106 S255
G1 F600
M204 S5000
G1 X100.646 Y89.715 E.11869
G1 X102.395 Y90.644 E.05365
G1 X99.822 Y95.483 E.14849
G1 X98.074 Y94.553 E.05365
G1 X98.562 Y93.635 E.02818
M106 S198.9
M204 S10000
M73 P38 R2
G1 X99.019 Y94.413 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.475946
M106 S255
G1 F3000
M204 S6000
G1 X100.977 Y90.73 E.12008
G1 X101.367 Y90.938 E.01271
G1 X99.409 Y94.621 E.12008
M106 S198.9
; CHANGE_LAYER
; Z_HEIGHT: 0.46
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
G1 X100.348 Y92.855 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/9
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.7 I-.979 J.723 P1  F42000
G1 X101.252 Y94.078 Z.7
G1 Z.46
M73 P38 R1
G1 E.8 F1800
; FEATURE: Support transition
; LINE_WIDTH: 0.42
G1 F3000
M204 S6000
G1 X101.514 Y93.585 E.01402
G1 X101.514 Y101.693 E.20385
G1 X102.399 Y101.693 E.02227
G1 X102.399 Y91.92 E.24573
G1 X102.976 Y90.834 E.03091
M204 S10000
G1 X101.232 Y94.115 F42000
G1 F3000
M204 S6000
G1 X100.628 Y95.251 E.03234
G1 X100.628 Y101.693 E.16197
G1 X99.742 Y101.693 E.02227
G1 X99.742 Y96.123 E.14004
G1 X98.857 Y95.652 E.02522
G1 X98.857 Y101.693 E.15188
M73 P39 R1
G1 X97.971 Y101.693 E.02227
G1 X97.971 Y95.181 E.16372
G1 X97.661 Y95.016 E.00884
G1 X97.525 Y95.058 E.00356
G1 X97.085 Y94.824 E.01253
G1 X97.085 Y101.693 E.17271
G1 X96.2 Y101.693 E.02227
G1 X96.179 Y94.342 E.18483
G3 X96.2 Y93.812 I.275 J-.254 E.0148
G1 X96.2 Y81.494 E.3097
G1 X97.085 Y81.494 E.02227
G1 X97.085 Y92.146 E.26783
G1 X96.481 Y93.282 E.03234
M204 S10000
G1 X97.367 Y91.616 F42000
G1 F3000
M204 S6000
G1 X97.971 Y90.481 E.03234
G1 X97.971 Y81.494 E.22595
G1 X98.657 Y81.494 E.01725
G1 X98.657 Y84.379 E.07255
G1 X98.857 Y84.379 E.00501
G1 X98.857 Y88.815 E.11152
G1 X98.253 Y89.951 E.03234
M204 S10000
G1 X99.049 Y84.379 F42000
G1 F3000
M204 S6000
G1 X99.742 Y84.379 E.01742
G1 X99.742 Y88.438 E.10205
G1 X100.628 Y88.909 E.02522
G1 X100.628 Y84.379 E.11389
G1 X101.514 Y84.379 E.02227
G1 X101.514 Y89.493 E.12858
M73 P40 R1
G1 X102.399 Y89.964 E.02522
G1 X102.399 Y84.379 E.14042
G1 X103.285 Y84.379 E.02227
G1 X103.285 Y101.693 E.4353
G1 X104.171 Y101.693 E.02227
G1 X104.171 Y84.379 E.4353
G1 X104.428 Y84.379 E.00648
G1 X104.428 Y84.866 E.01223
; WIPE_START
G1 X104.428 Y84.379 E-.1848
G1 X104.171 Y84.379 E-.09801
G1 X104.171 Y85.635 E-.47719
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I.341 J-1.168 P1  F42000
G1 X90 Y81.494 Z.86
G1 Z.46
G1 E.8 F1800
G1 F3000
M204 S6000
G1 X90 Y83.376 E.04732
G1 X90.886 Y83.842 E.02517
G1 X90.886 Y81.494 E.05905
G1 X91.771 Y81.494 E.02227
G1 X91.771 Y84.313 E.07089
G1 X92.212 Y84.548 E.01256
G1 X92.347 Y84.506 E.00356
G1 X92.657 Y84.671 E.00881
G1 X92.657 Y81.494 E.07988
G1 X93.35 Y81.494 E.01742
M204 S10000
G1 X96.007 Y81.494 F42000
G1 F3000
M204 S6000
G1 X95.314 Y81.494 E.01742
G1 X95.314 Y101.693 E.50785
G1 X94.428 Y101.693 E.02227
G1 X94.428 Y81.494 E.50785
M73 P41 R1
G1 X93.543 Y81.494 E.02227
G1 X93.543 Y85.142 E.09172
G1 X93.694 Y85.223 E.00432
G1 X93.789 Y85.534 E.00818
G1 X93.543 Y85.998 E.01322
G1 X93.543 Y101.693 E.39461
G1 X92.657 Y101.693 E.02227
G1 X92.657 Y90.151 E.29021
G1 X92.886 Y90.151 E.00575
G1 X92.886 Y87.234 E.07333
; WIPE_START
G1 X92.886 Y89.234 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I-1.106 J-.508 P1  F42000
G1 X92.464 Y90.151 Z.86
G1 Z.46
G1 E.8 F1800
G1 F3000
M204 S6000
G1 X91.771 Y90.151 E.01742
G1 X91.771 Y101.693 E.29021
G1 X90.886 Y101.693 E.02227
G1 X90.886 Y90.995 E.26898
G1 X90.773 Y91.207 E.00604
G1 X90.462 Y91.302 E.00818
M73 P42 R1
G1 X90 Y91.057 E.01315
G1 X90 Y101.693 E.26743
G1 X89.114 Y101.693 E.02227
G1 X89.114 Y90.584 E.27931
G1 X89.074 Y90.451 E.0035
G1 X88.229 Y90.001 E.02406
G1 X88.229 Y101.693 E.29395
G1 X87.343 Y101.693 E.02227
G1 X87.343 Y89.531 E.30579
G1 X86.866 Y89.277 E.01358
G1 X86.771 Y88.966 E.00818
G1 X87.343 Y87.89 E.03063
G1 X87.343 Y87.265 E.01572
G1 X87.114 Y87.265 E.00575
G1 X87.114 Y84.379 E.07255
G1 X86.457 Y84.379 E.01652
G1 X86.457 Y101.693 E.4353
G1 X85.572 Y101.693 E.02227
G1 X85.572 Y84.379 E.4353
G1 X84.686 Y84.379 E.02227
G1 X84.686 Y101.693 E.4353
M73 P43 R1
G1 X83.8 Y101.693 E.02227
G1 X83.8 Y84.379 E.4353
G1 X82.915 Y84.379 E.02227
G1 X82.915 Y101.693 E.4353
G1 X82.029 Y101.693 E.02227
G1 X82.029 Y84.379 E.4353
G1 X81.662 Y84.379 E.00923
G1 X81.374 Y84.921 E.01542
G1 X81.243 Y84.961 E.00345
G1 X81.243 Y85.963 E.02519
G1 X81.143 Y86.062 E.00353
G1 X81.143 Y101.693 E.393
G1 X80.258 Y101.693 E.02227
G1 X80.258 Y86.281 E.3875
M73 P44 R1
G1 X79.875 Y86.281 E.00962
G1 X79.681 Y86.086 E.00692
M204 S10000
G1 X79.372 Y84.379 F42000
G1 F3000
M204 S6000
G1 X79.372 Y101.693 E.4353
G1 X78.486 Y101.693 E.02227
G1 X78.486 Y84.379 E.4353
G1 X77.601 Y84.379 E.02227
G1 X77.601 Y101.693 E.4353
G1 X76.715 Y101.693 E.02227
G1 X76.715 Y84.379 E.4353
G1 X75.829 Y84.379 E.02227
G1 X75.829 Y101.693 E.4353
G1 X75.572 Y101.693 E.00648
M73 P45 R1
G1 X75.572 Y101.207 E.01223
; WIPE_START
G1 X75.572 Y101.693 E-.18478
G1 X75.829 Y101.693 E-.098
G1 X75.829 Y100.438 E-.47722
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I.312 J1.176 P1  F42000
G1 X98.615 Y94.388 Z.86
G1 Z.46
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X100.812 Y90.257 E.12678
G1 X101.853 Y90.81 E.03194
G1 X99.656 Y94.941 E.12678
G1 X98.668 Y94.416 E.03031
M204 S250
G1 X98.074 Y94.553 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X100.646 Y89.715 E.13778
G1 X100.938 Y89.87 E.0083
G1 X102.395 Y90.644 E.04148
G1 X99.822 Y95.483 E.13778
G1 X98.127 Y94.582 E.04827
; WIPE_START
M204 S6000
G1 X99.046 Y92.806 E-.76
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

G1 X99.155 Y94.223
G1 Z.46
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415846
G1 F11795.235
M204 S6000
G1 X99.491 Y94.402 E.00949
G1 X101.314 Y90.975 E.09654
G1 X100.977 Y90.796 E.00949
G1 X99.183 Y94.17 E.09504
; WIPE_START
G1 X100.122 Y92.404 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I1.217 J.01 P1  F42000
G1 X100.146 Y89.336 Z.86
G1 Z.46
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X97.479 Y94.351 E.1428
G1 X96.791 Y93.984 E.01961
G1 X99.457 Y88.969 E.1428
G1 X100.002 Y89.259 E.0155
G1 X100.093 Y89.307 E.0026
M204 S10000
G1 X99.707 Y89.329 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.413692
G1 F11862.219
M204 S6000
G1 X97.229 Y93.991 E.13056
; WIPE_START
G1 X98.168 Y92.225 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I.939 J-.774 P1  F42000
G1 X92.394 Y85.214 Z.86
G1 Z.46
M73 P46 R1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X92.938 Y85.503 E.0155
G1 X93.082 Y85.58 E.00411
G1 X90.416 Y90.595 E.1428
G1 X89.727 Y90.229 E.01961
G1 X92.365 Y85.267 E.14129
M204 S10000
G1 X92.644 Y85.574 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.413687
G1 F11862.371
M204 S6000
G1 X90.165 Y90.235 E.13056
; WIPE_START
G1 X91.104 Y88.469 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I1.216 J.057 P1  F42000
G1 X91.257 Y85.176 Z.86
G1 Z.46
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X89.061 Y89.308 E.12678
G1 X88.02 Y88.754 E.03194
G1 X90.217 Y84.623 E.12678
G1 X91.204 Y85.148 E.03031
M204 S250
G1 X91.799 Y85.011 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X89.227 Y89.849 E.13778
G1 X87.478 Y88.92 E.04978
G1 X90.051 Y84.081 E.13777
G1 X91.746 Y84.983 E.04827
; WIPE_START
M204 S6000
G1 X90.827 Y86.759 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I-.878 J-.843 P1  F42000
G1 X88.896 Y88.768 Z.86
G1 Z.46
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415846
G1 F11795.235
M204 S6000
G1 X90.718 Y85.341 E.09654
G1 X90.381 Y85.162 E.00949
G1 X88.559 Y88.589 E.09654
G1 X88.843 Y88.74 E.008
; WIPE_START
G1 X88.559 Y88.589 E-.12218
G1 X89.347 Y87.107 E-.63782
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I.386 J-1.154 P1  F42000
G1 X80.289 Y84.076 Z.86
G1 Z.46
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F12000
M204 S5000
G1 X80.511 Y84.195 E.00564
G1 X80.511 Y85.549 E.03031
G1 X80.289 Y85.549 E.00498
G1 X80.289 Y84.136 E.03161
; CHANGE_LAYER
; Z_HEIGHT: 0.62
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X80.511 Y84.195 E-.08738
G1 X80.511 Y85.549 E-.5147
G1 X80.289 Y85.549 E-.08453
G1 X80.289 Y85.356 E-.0734
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
G3 Z.86 I.304 J-1.178 P1  F42000
G1 X75.829 Y84.206 Z.86
G1 Z.62
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
M204 S6000
G1 X75.829 Y101.693 E.43967
G1 X76.715 Y101.693 E.02227
G1 X76.715 Y84.379 E.4353
M73 P47 R1
G1 X77.601 Y84.379 E.02227
G1 X77.601 Y101.693 E.4353
G1 X78.486 Y101.693 E.02227
G1 X78.486 Y84.379 E.4353
G1 X79.372 Y84.379 E.02227
G1 X79.372 Y101.693 E.4353
G1 X80.258 Y101.693 E.02227
G1 X80.258 Y86.281 E.3875
G1 X80.925 Y86.281 E.01677
G1 X81.143 Y86.062 E.00777
G1 X81.143 Y101.693 E.393
G1 X82.029 Y101.693 E.02227
G1 X82.029 Y84.379 E.4353
G1 X82.915 Y84.379 E.02227
G1 X82.915 Y101.693 E.4353
G1 X83.8 Y101.693 E.02227
G1 X83.8 Y84.379 E.4353
M73 P48 R1
G1 X84.686 Y84.379 E.02227
G1 X84.686 Y101.693 E.4353
G1 X85.572 Y101.693 E.02227
G1 X85.572 Y84.379 E.4353
G1 X86.457 Y84.379 E.02227
G1 X86.457 Y101.693 E.4353
G1 X87.343 Y101.693 E.02227
G1 X87.343 Y89.531 E.30579
G1 X88.229 Y90.001 E.02522
G1 X88.229 Y101.693 E.29395
G1 X89.114 Y101.693 E.02227
G1 X89.114 Y90.584 E.27931
G1 X90 Y91.057 E.02524
G1 X90 Y101.693 E.26743
G1 X90.886 Y101.693 E.02227
G1 X90.886 Y90.995 E.26898
G1 X91.335 Y90.151 E.02404
G1 X91.771 Y90.151 E.01098
M73 P49 R1
G1 X91.771 Y101.693 E.29021
G1 X92.657 Y101.693 E.02227
G1 X92.657 Y90.151 E.29021
G1 X92.886 Y90.151 E.00575
G1 X92.886 Y87.234 E.07333
G1 X93.543 Y85.998 E.03519
G1 X93.543 Y101.693 E.39461
G1 X94.428 Y101.693 E.02227
G1 X94.428 Y81.494 E.50785
G1 X95.314 Y81.494 E.02227
G1 X95.314 Y101.693 E.50785
G1 X96.2 Y101.693 E.02227
G1 X96.2 Y81.494 E.50785
G1 X97.085 Y81.494 E.02227
G1 X97.085 Y92.146 E.26783
G1 X97.971 Y90.481 E.04743
G1 X97.971 Y81.494 E.22595
G1 X98.657 Y81.494 E.01725
G1 X98.657 Y84.379 E.07255
G1 X98.857 Y84.379 E.00501
G1 X98.857 Y88.815 E.11152
M73 P50 R1
G1 X99.1 Y88.357 E.01303
G1 X99.411 Y88.262 E.00818
G1 X99.742 Y88.438 E.00943
G1 X99.742 Y84.379 E.10205
G1 X100.628 Y84.379 E.02227
G1 X100.628 Y88.909 E.11389
G3 X100.799 Y89.114 I-.017 J.188 E.00745
G1 X101.514 Y89.493 E.02034
G1 X101.514 Y84.379 E.12858
G1 X102.399 Y84.379 E.02227
G1 X102.399 Y90.161 E.14536
; WIPE_START
G1 X102.399 Y88.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-.94 J-.773 P1  F42000
G1 X97.085 Y94.627 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X97.085 Y101.693 E.17765
G1 X97.971 Y101.693 E.02227
G1 X97.971 Y95.181 E.16372
G1 X98.857 Y95.652 E.02522
G1 X98.857 Y101.693 E.15188
G1 X99.742 Y101.693 E.02227
G1 X99.742 Y96.123 E.14004
G2 X100.298 Y95.871 I.167 J-.371 E.01736
G1 X100.628 Y95.251 E.01766
G1 X100.628 Y101.693 E.16197
G1 X101.514 Y101.693 E.02227
G1 X101.514 Y93.585 E.20385
G1 X102.399 Y91.92 E.04743
G1 X102.399 Y101.693 E.24573
G1 X103.285 Y101.693 E.02227
G1 X103.285 Y84.379 E.4353
G1 X104.171 Y84.379 E.02227
G1 X104.171 Y101.867 E.43967
; WIPE_START
G1 X104.171 Y99.867 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P51 R1
G3 Z1.02 I.982 J-.719 P1  F42000
G1 X93.543 Y85.338 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X93.543 Y81.494 E.09667
G1 X92.657 Y81.494 E.02227
G1 X92.657 Y84.671 E.07989
G1 X92.348 Y84.506 E.00881
G1 X92.212 Y84.548 E.00356
G1 X91.771 Y84.313 E.01256
G1 X91.771 Y81.494 E.07089
G1 X90.886 Y81.494 E.02227
G1 X90.886 Y83.842 E.05905
G1 X90 Y83.376 E.02517
G1 X90 Y81.32 E.05168
; WIPE_START
G1 X90 Y83.32 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-.995 J-.701 P1  F42000
G1 X87.343 Y87.091 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X87.343 Y88.26 E.02938
; WIPE_START
G1 X87.343 Y87.091 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-.695 J.999 P1  F42000
G1 X98.074 Y94.553 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Outer wall
G1 F11668.197
M204 S5000
G1 X100.646 Y89.715 E.13778
G1 X101.362 Y90.095 E.02036
G1 X102.395 Y90.644 E.02942
G1 X99.822 Y95.483 E.13778
G1 X98.127 Y94.582 E.04827
; WIPE_START
M204 S6000
G1 X99.046 Y92.806 E-.76
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

G1 X100.105 Y94.499
G1 Z.62
G1 E.8 F1800
; FEATURE: Top surface
G1 F11668.197
M204 S2000
G1 X99.521 Y95.083 E.02076
G1 X99.165 Y94.893
G1 X100.724 Y93.334 E.05544
; WIPE_START
M204 S6000
G1 X99.31 Y94.749 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I.956 J.754 P1  F42000
G1 X101.343 Y92.17 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X98.809 Y94.704 E.09012
G1 X98.453 Y94.515
G1 X101.963 Y91.005 E.12479
G1 X101.835 Y90.587
M73 P52 R1
G1 X98.819 Y93.603 E.10723
; WIPE_START
M204 S6000
G1 X100.233 Y92.189 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-.364 J-1.161 P1  F42000
G1 X99.438 Y92.438 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X101.479 Y90.398 E.07255
G1 X101.123 Y90.209
G1 X100.058 Y91.274 E.03787
M204 S10000
G1 X100.12 Y91.336 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192946
G1 F18000
M204 S6000
G1 X100.007 Y91.489 E.00197
; LINE_WIDTH: 0.148013
G1 X99.894 Y91.642 E.00141
; LINE_WIDTH: 0.10308
G1 X99.781 Y91.795 E.00085
M204 S10000
G1 X99.501 Y92.501 F42000
; LINE_WIDTH: 0.192956
G1 F18000
M204 S6000
G1 X99.388 Y92.654 E.00197
; LINE_WIDTH: 0.148019
G1 X99.275 Y92.807 E.00141
; LINE_WIDTH: 0.103082
G1 X99.162 Y92.96 E.00085
M204 S10000
G1 X98.882 Y93.666 F42000
; LINE_WIDTH: 0.192946
G1 F18000
M204 S6000
G1 X98.769 Y93.819 E.00197
; LINE_WIDTH: 0.148013
G1 X98.656 Y93.972 E.00141
; LINE_WIDTH: 0.10308
G1 X98.542 Y94.124 E.00085
; WIPE_START
G1 X98.656 Y93.972 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-.004 J1.217 P1  F42000
G1 X100.382 Y93.978 Z1.02
G1 Z.62
G1 E.8 F1800
; LINE_WIDTH: 0.10308
G1 F18000
M204 S6000
G1 X100.268 Y94.13 E.00085
; LINE_WIDTH: 0.148013
G1 X100.155 Y94.283 E.00141
; LINE_WIDTH: 0.192946
G1 X100.042 Y94.436 E.00197
; WIPE_START
G1 X100.155 Y94.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.055 J.607 P1  F42000
G1 X101.001 Y92.813 Z1.02
G1 Z.62
G1 E.8 F1800
; LINE_WIDTH: 0.103083
G1 F18000
M204 S6000
G1 X100.888 Y92.966 E.00085
; LINE_WIDTH: 0.14802
G1 X100.775 Y93.119 E.00141
; LINE_WIDTH: 0.192958
G1 X100.661 Y93.272 E.00197
; WIPE_START
G1 X100.775 Y93.119 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.055 J.607 P1  F42000
G1 X101.62 Y91.648 Z1.02
G1 Z.62
G1 E.8 F1800
; LINE_WIDTH: 0.10308
G1 F18000
M204 S6000
G1 X101.507 Y91.801 E.00085
; LINE_WIDTH: 0.148013
G1 X101.394 Y91.954 E.00141
; LINE_WIDTH: 0.192946
G1 X101.281 Y92.107 E.00197
; WIPE_START
G1 X101.394 Y91.954 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.169 J-.338 P1  F42000
G1 X100.84 Y90.036 Z1.02
G1 Z.62
G1 E.8 F1800
; LINE_WIDTH: 0.23649
G1 F18000
M204 S6000
G1 X100.73 Y90.185 E.00244
; LINE_WIDTH: 0.191954
G1 X100.62 Y90.333 E.0019
; LINE_WIDTH: 0.147418
G1 X100.51 Y90.482 E.00136
; LINE_WIDTH: 0.102882
G1 X100.4 Y90.63 E.00083
; WIPE_START
G1 X100.51 Y90.482 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.16 J-.369 P1  F42000
G1 X100.146 Y89.336 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X97.479 Y94.351 E.1428
G1 X96.791 Y93.984 E.01961
G1 X99.457 Y88.969 E.1428
G1 X99.813 Y89.159 E.01014
G1 X100.093 Y89.307 E.00796
M204 S10000
G1 X99.875 Y89.418 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.413012
G1 F11883.52
M204 S6000
G1 X99.618 Y89.497 E.00662
G1 X97.229 Y93.991 E.12564
; WIPE_START
G1 X98.168 Y92.225 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I.28 J-1.184 P1  F42000
G1 X89.727 Y90.229 Z1.02
G1 Z.62
M73 P53 R1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X92.394 Y85.214 E.1428
G1 X92.75 Y85.403 E.01014
G1 X93.082 Y85.58 E.00947
G1 X90.416 Y90.595 E.1428
G1 X89.78 Y90.257 E.0181
M204 S10000
G1 X90.165 Y90.235 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.41302
G1 F11883.259
M204 S6000
G1 X92.555 Y85.741 E.12565
G1 X92.811 Y85.663 E.00662
; WIPE_START
G1 X92.555 Y85.741 E-.10191
G1 X91.742 Y87.27 E-.65809
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.217 J.031 P1  F42000
G1 X91.799 Y85.011 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X89.227 Y89.849 E.13778
G1 X87.478 Y88.92 E.04978
G1 X90.051 Y84.081 E.13778
G1 X91.746 Y84.983 E.04827
; WIPE_START
M204 S6000
G1 X90.827 Y86.759 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-1.025 J-.656 P1  F42000
G1 X89.661 Y88.581 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Top surface
G1 F11668.197
M204 S2000
G1 X88.839 Y89.403 E.02922
G1 X88.483 Y89.214
G1 X90.28 Y87.416 E.0639
; WIPE_START
M204 S6000
G1 X88.866 Y88.831 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I.956 J.754 P1  F42000
G1 X90.899 Y86.252 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X88.127 Y89.024 E.09858
G1 X87.771 Y88.835
G1 X91.509 Y85.097 E.13292
G1 X91.153 Y84.907
G1 X88.375 Y87.685 E.09876
; WIPE_START
M204 S6000
G1 X89.789 Y86.271 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-.364 J-1.161 P1  F42000
G1 X88.994 Y86.52 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X90.797 Y84.718 E.06408
G1 X90.441 Y84.529
G1 X89.614 Y85.356 E.02941
; WIPE_START
M204 S6000
G1 X90.441 Y84.529 E-.44445
G1 X90.797 Y84.718 E-.15325
G1 X90.495 Y85.02 E-.16231
; WIPE_END
M73 P54 R1
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-.972 J-.733 P1  F42000
G1 X88.438 Y87.748 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192946
G1 F18000
M204 S6000
G1 X88.325 Y87.901 E.00197
; LINE_WIDTH: 0.148013
G1 X88.211 Y88.054 E.00141
; LINE_WIDTH: 0.10308
G1 X88.098 Y88.206 E.00085
; WIPE_START
G1 X88.211 Y88.054 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.055 J.607 P1  F42000
G1 X89.057 Y86.583 Z1.02
G1 Z.62
G1 E.8 F1800
; LINE_WIDTH: 0.192946
G1 F18000
M204 S6000
G1 X88.944 Y86.736 E.00197
; LINE_WIDTH: 0.148013
G1 X88.831 Y86.889 E.00141
; LINE_WIDTH: 0.10308
G1 X88.718 Y87.042 E.00085
; WIPE_START
G1 X88.831 Y86.889 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.055 J.607 P1  F42000
G1 X89.676 Y85.418 Z1.02
G1 Z.62
G1 E.8 F1800
; LINE_WIDTH: 0.192946
G1 F18000
M204 S6000
G1 X89.563 Y85.571 E.00197
; LINE_WIDTH: 0.148013
G1 X89.45 Y85.724 E.00141
; LINE_WIDTH: 0.10308
G1 X89.337 Y85.877 E.00085
; WIPE_START
G1 X89.45 Y85.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.062 J.594 P1  F42000
G1 X90.202 Y84.38 Z1.02
G1 Z.62
G1 E.8 F1800
; LINE_WIDTH: 0.15142
G1 F18000
M204 S6000
G1 X90.079 Y84.546 E.00158
; LINE_WIDTH: 0.104216
G1 X89.956 Y84.712 E.00094
; WIPE_START
G1 X90.079 Y84.546 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-.893 J.827 P1  F42000
G1 X91.176 Y85.73 Z1.02
G1 Z.62
G1 E.8 F1800
; LINE_WIDTH: 0.10308
G1 F18000
M204 S6000
G1 X91.063 Y85.883 E.00085
; LINE_WIDTH: 0.148013
G1 X90.95 Y86.036 E.00141
; LINE_WIDTH: 0.192946
G1 X90.837 Y86.189 E.00197
M204 S10000
G1 X90.557 Y86.895 F42000
; LINE_WIDTH: 0.10308
G1 F18000
M204 S6000
G1 X90.444 Y87.048 E.00085
; LINE_WIDTH: 0.148013
G1 X90.33 Y87.201 E.00141
; LINE_WIDTH: 0.192946
G1 X90.217 Y87.354 E.00197
M204 S10000
G1 X89.937 Y88.06 F42000
; LINE_WIDTH: 0.10308
G1 F18000
M204 S6000
G1 X89.824 Y88.213 E.00085
; LINE_WIDTH: 0.148013
G1 X89.711 Y88.365 E.00141
; LINE_WIDTH: 0.192946
G1 X89.598 Y88.518 E.00197
M204 S10000
G1 X89.318 Y89.224 F42000
; LINE_WIDTH: 0.103767
G1 F18000
M204 S6000
G1 X89.197 Y89.388 E.00092
; LINE_WIDTH: 0.150073
G1 X89.076 Y89.551 E.00153
; WIPE_START
G1 X89.197 Y89.388 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I.505 J-1.107 P1  F42000
G1 X80.289 Y85.327 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F12000
M204 S5000
G1 X80.511 Y85.327 E.00498
G1 X80.511 Y85.549 E.00498
G1 X80.289 Y85.549 E.00498
G1 X80.289 Y85.387 E.00363
; CHANGE_LAYER
; Z_HEIGHT: 0.78
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X80.511 Y85.327 E-.20902
G1 X80.511 Y85.549 E-.20181
G1 X80.289 Y85.549 E-.20181
G1 X80.289 Y85.387 E-.14737
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/9
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.02 I.136 J-1.209 P1  F42000
G1 X75.398 Y84.837 Z1.02
G1 Z.78
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
M204 S6000
G1 X79.634 Y84.837 E.10649
G1 X79.557 Y84.913 E.00272
G1 X79.557 Y85.722 E.02035
G1 X75.572 Y85.722 E.10021
G1 X75.572 Y86.608 E.02227
G1 X87.114 Y86.608 E.29021
G1 X87.114 Y85.722 E.02227
G1 X81.243 Y85.722 E.14762
G1 X81.243 Y84.913 E.02035
G1 X81.166 Y84.837 E.00272
M73 P55 R1
G1 X87.288 Y84.837 E.15391
; WIPE_START
G1 X85.288 Y84.837 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I-.893 J.827 P1  F42000
G1 X87.75 Y87.494 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X75.572 Y87.494 E.30619
G1 X75.572 Y88.379 E.02227
G1 X87.083 Y88.379 E.28941
G1 X86.771 Y88.966 E.0167
G1 X86.863 Y89.265 E.00786
G1 X75.572 Y89.265 E.28387
G1 X75.572 Y90.151 E.02227
G1 X88.509 Y90.151 E.32527
G1 X89.074 Y90.451 E.01607
G1 X89.115 Y90.586 E.00356
G1 X89.962 Y91.036 E.02412
G1 X75.398 Y91.036 E.36616
; WIPE_START
G1 X77.398 Y91.036 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I.465 J1.125 P1  F42000
G1 X98.831 Y82.18 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X90 Y82.18 E.22202
G1 X90 Y83.065 E.02227
G1 X98.657 Y83.065 E.21766
G1 X98.657 Y83.951 E.02227
G1 X91.09 Y83.951 E.19025
G1 X92.212 Y84.548 E.03196
G1 X92.348 Y84.506 E.00356
G1 X92.969 Y84.837 E.01769
M73 P56 R1
G1 X104.428 Y84.837 E.28811
G1 X104.428 Y85.722 E.02227
G1 X93.689 Y85.722 E.27
G1 X93.218 Y86.608 E.02522
G1 X104.428 Y86.608 E.28184
G1 X104.428 Y87.494 E.02227
G1 X92.886 Y87.494 E.29021
G1 X92.886 Y88.379 E.02227
G1 X104.428 Y88.379 E.29021
G1 X104.428 Y89.265 E.02227
G1 X101.084 Y89.265 E.08408
G1 X102.75 Y90.151 E.04743
G1 X104.428 Y90.151 E.04221
G1 X104.428 Y91.036 E.02227
G1 X102.869 Y91.036 E.03921
G1 X102.398 Y91.922 E.02522
G1 X104.428 Y91.922 E.05105
G1 X104.428 Y92.808 E.02227
G1 X101.927 Y92.808 E.06289
G1 X101.456 Y93.693 E.02522
G1 X104.428 Y93.693 E.07473
G1 X104.428 Y94.579 E.02227
G1 X100.985 Y94.579 E.08657
G1 X100.514 Y95.465 E.02522
G1 X104.428 Y95.465 E.09841
G1 X104.428 Y96.35 E.02227
G1 X75.572 Y96.35 E.7255
G1 X75.572 Y95.465 E.02227
G1 X98.503 Y95.465 E.57654
G1 X97.661 Y95.016 E.024
G1 X97.525 Y95.058 E.00356
M73 P57 R1
G1 X96.625 Y94.579 E.02564
G1 X75.572 Y94.579 E.52931
G1 X75.572 Y93.693 E.02227
G1 X96.263 Y93.693 E.5202
G1 X96.734 Y92.808 E.02522
G1 X75.572 Y92.808 E.53204
G1 X75.572 Y91.922 E.02227
G1 X97.205 Y91.922 E.54388
G1 X97.675 Y91.036 E.02522
G1 X90.864 Y91.036 E.17126
G1 X91.335 Y90.151 E.02522
G1 X98.146 Y90.151 E.17126
G1 X98.617 Y89.265 E.02522
G1 X92.712 Y89.265 E.14847
; WIPE_START
G1 X94.712 Y89.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I-.764 J.948 P1  F42000
G1 X104.602 Y97.236 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X75.572 Y97.236 E.72987
M73 P58 R1
G1 X75.572 Y98.122 E.02227
G1 X104.428 Y98.122 E.7255
G1 X104.428 Y99.007 E.02227
G1 X75.572 Y99.007 E.7255
G1 X75.572 Y99.893 E.02227
G1 X104.428 Y99.893 E.7255
G1 X104.428 Y100.779 E.02227
G1 X75.572 Y100.779 E.7255
G1 X75.572 Y101.664 E.02227
G1 X104.602 Y101.664 E.72987
; WIPE_START
M73 P59 R1
G1 X102.602 Y101.664 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I1.039 J-.634 P1  F42000
G1 X98.149 Y94.366 Z1.18
G1 Z.78
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F12000
M204 S5000
G1 X99.572 Y95.122 E.03605
G1 X99.935 Y95.315 E.0092
G1 X99.831 Y95.512 E.00498
G1 X98.045 Y94.562 E.04525
G1 X98.121 Y94.419 E.00363
; WIPE_START
M204 S6000
G1 X99.572 Y95.122 E-.6127
G1 X99.914 Y95.304 E-.1473
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.533 Y89.883 Z1.18 F42000
G1 Z.78
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X100.638 Y89.686 E.00498
G1 X101.795 Y90.302 E.02934
G1 X102.423 Y90.636 E.01591
G1 X102.319 Y90.832 E.00498
G1 X100.586 Y89.911 E.04391
M204 S250
G1 X100.146 Y89.336 F42000
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X97.479 Y94.351 E.1428
G1 X96.791 Y93.984 E.01961
G1 X99.457 Y88.969 E.1428
G1 X100.093 Y89.307 E.0181
; WIPE_START
M204 S6000
G1 X99.173 Y91.083 E-.76
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

G1 X99.424 Y89.484
G1 Z.78
G1 E.8 F1800
; FEATURE: Top surface
G1 F11668.197
M204 S2000
G1 X99.687 Y89.747 E.00935
G1 X99.497 Y90.103
G1 X99.234 Y89.84 E.00935
G1 X99.045 Y90.196
G1 X99.308 Y90.46 E.00935
G1 X99.119 Y90.816
G1 X98.856 Y90.553 E.00935
G1 X98.666 Y90.909
G1 X98.929 Y91.172 E.00935
G1 X98.74 Y91.528
G1 X98.477 Y91.265 E.00935
G1 X98.288 Y91.621
G1 X98.551 Y91.884 E.00935
G1 X98.361 Y92.24
G1 X98.098 Y91.977 E.00935
G1 X97.909 Y92.333
G1 X98.172 Y92.596 E.00935
G1 X97.983 Y92.952
G1 X97.72 Y92.689 E.00935
G1 X97.53 Y93.045
G1 X97.793 Y93.308 E.00935
G1 X97.604 Y93.664
G1 X97.341 Y93.401 E.00935
; WIPE_START
M204 S6000
G1 X97.604 Y93.664 E-.14138
G1 X97.793 Y93.308 E-.15324
G1 X97.53 Y93.045 E-.14138
G1 X97.72 Y92.689 E-.15325
G1 X97.983 Y92.952 E-.14138
G1 X98.019 Y92.884 E-.02937
; WIPE_END
M73 P60 R1
G1 E-.04 F1800
M204 S10000
G1 X99.841 Y89.498 Z1.18 F42000
G1 Z.78
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.179679
G1 F18000
M204 S6000
G1 X99.718 Y89.406 E.00146
; LINE_WIDTH: 0.143414
G2 X99.558 Y89.298 I-.332 J.319 E.00138
; LINE_WIDTH: 0.123151
G1 X99.533 Y89.321 E.0002
; LINE_WIDTH: 0.0961681
G1 X99.456 Y89.424 E.00052
; WIPE_START
G1 X99.533 Y89.321 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I-.112 J-1.212 P1  F42000
G1 X89.727 Y90.229 Z1.18
G1 Z.78
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X92.394 Y85.214 E.1428
G1 X92.561 Y85.303 E.00478
G1 X93.082 Y85.58 E.01483
G1 X90.416 Y90.595 E.1428
G1 X89.78 Y90.257 E.0181
; WIPE_START
M204 S6000
G1 X90.7 Y88.481 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.635 Y85.969 Z1.18 F42000
G1 Z.78
G1 E.8 F1800
; FEATURE: Top surface
G1 F11668.197
M204 S2000
G1 X92.372 Y85.705 E.00935
G1 X92.183 Y86.062
G1 X92.446 Y86.325 E.00935
G1 X92.257 Y86.681
G1 X91.994 Y86.418 E.00935
G1 X91.804 Y86.774
G1 X92.067 Y87.037 E.00935
G1 X91.878 Y87.393
G1 X91.615 Y87.13 E.00935
G1 X91.426 Y87.486
G1 X91.689 Y87.749 E.00935
G1 X91.499 Y88.105
G1 X91.236 Y87.842 E.00935
G1 X91.047 Y88.198
G1 X91.31 Y88.461 E.00935
G1 X91.121 Y88.817
G1 X90.858 Y88.554 E.00935
G1 X90.668 Y88.91
G1 X90.931 Y89.173 E.00935
G1 X90.742 Y89.529
G1 X90.479 Y89.266 E.00935
G1 X90.29 Y89.622
G1 X90.553 Y89.885 E.00935
; WIPE_START
M204 S6000
G1 X90.29 Y89.622 E-.14138
G1 X90.479 Y89.266 E-.15325
G1 X90.742 Y89.529 E-.14138
G1 X90.931 Y89.173 E-.15325
G1 X90.668 Y88.91 E-.14138
G1 X90.705 Y88.842 E-.02936
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.784 Y85.73 Z1.18 F42000
G1 Z.78
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.15633
G1 F18000
M204 S6000
G1 X92.658 Y85.638 E.00124
; LINE_WIDTH: 0.118205
G2 X92.491 Y85.531 I-.243 J.197 E.00111
G1 X92.481 Y85.542 E.00008
; LINE_WIDTH: 0.0961686
G1 X92.405 Y85.645 E.00052
M204 S250
G1 X91.828 Y85.002 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F12000
M204 S5000
G1 X91.723 Y85.198 E.00498
G1 X89.938 Y84.249 E.04525
G1 X90.042 Y84.053 E.00498
G1 X90.085 Y84.076 E.0011
G1 X91.775 Y84.974 E.04281
; WIPE_START
M204 S6000
G1 X91.723 Y85.198 E-.08755
G1 X90.161 Y84.368 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.34 Y89.682 Z1.18 F42000
G1 Z.78
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X89.235 Y89.878 E.00498
G1 X87.45 Y88.929 E.04525
G1 X87.554 Y88.732 E.00498
G1 X88.977 Y89.489 E.03605
G1 X89.287 Y89.653 E.00786
; WIPE_START
M204 S6000
G1 X89.235 Y89.878 E-.08755
G1 X87.673 Y89.047 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I.548 J-1.087 P1  F42000
G1 X80.289 Y85.327 Z1.18
G1 Z.78
G1 E.8 F1800
M73 P61 R1
G1 F12000
M204 S5000
G1 X80.511 Y85.327 E.00498
G1 X80.511 Y85.549 E.00498
G1 X80.289 Y85.549 E.00498
G1 X80.289 Y85.387 E.00363
; CHANGE_LAYER
; Z_HEIGHT: 0.94
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X80.511 Y85.327 E-.20902
G1 X80.511 Y85.549 E-.20181
G1 X80.289 Y85.549 E-.20181
G1 X80.289 Y85.387 E-.14737
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/9
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S204
; OBJECT_ID: 15
M204 S250
M204 S10000
G17
G3 Z1.18 I1.217 J0 P1  F42000
G1 X80.289 Y85.327 Z1.18
M204 S10000
G1 Z.94
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X80.511 Y85.327 E.00498
G1 X80.511 Y85.549 E.00498
G1 X80.289 Y85.549 E.00498
G1 X80.289 Y85.387 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X80.511 Y85.327 E-.20902
G1 X80.511 Y85.549 E-.20181
G1 X80.289 Y85.549 E-.20181
G1 X80.289 Y85.387 E-.14737
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I-.017 J1.217 P1  F42000
G1 X92.215 Y85.549 Z1.34
G1 Z.94
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X92.394 Y85.214 E.00955
G1 X93.082 Y85.58 E.01961
G1 X92.904 Y85.915 E.00955
G1 X92.268 Y85.577 E.0181
M204 S250
G1 X91.828 Y85.002 F42000
; LINE_WIDTH: 0.377567
G1 F1200
M204 S5000
G1 X91.723 Y85.198 E.00498
G1 X89.938 Y84.249 E.04525
G1 X90.042 Y84.053 E.00498
G1 X90.153 Y84.111 E.0028
G1 X91.775 Y84.974 E.04111
; WIPE_START
G1 F12000
M204 S6000
G1 X91.723 Y85.198 E-.08755
G1 X90.161 Y84.368 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.34 Y89.682 Z1.34 F42000
G1 Z.94
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X89.235 Y89.878 E.00498
G1 X87.45 Y88.929 E.04525
G1 X87.554 Y88.732 E.00498
G1 X88.129 Y89.038 E.01457
G1 X89.287 Y89.653 E.02934
M204 S250
G1 X89.905 Y89.893 F42000
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X90.497 Y90.208 E.01684
G1 X90.594 Y90.259 E.00277
G1 X90.416 Y90.595 E.00955
G1 X89.727 Y90.229 E.01961
G1 X89.877 Y89.946 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X90.497 Y90.208 E-.25562
G1 X90.594 Y90.259 E-.04181
G1 X90.416 Y90.595 E-.1444
G1 X89.727 Y90.229 E-.29641
G1 X89.754 Y90.178 E-.02177
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I-.543 J1.089 P1  F42000
G1 X98.149 Y94.366 Z1.34
G1 Z.94
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1200
M204 S5000
G1 X98.724 Y94.672 E.01457
G1 X99.935 Y95.315 E.03068
G1 X99.831 Y95.512 E.00498
G1 X98.045 Y94.562 E.04525
G1 X98.121 Y94.419 E.00363
M204 S250
G1 X97.658 Y94.015 F42000
; LINE_WIDTH: 0.42
M73 P62 R1
G1 F1200
M204 S5000
G1 X97.479 Y94.351 E.00955
G1 X96.791 Y93.984 E.01961
G1 X96.969 Y93.649 E.00955
G1 X97.561 Y93.964 E.01684
G1 X97.605 Y93.987 E.00126
; WIPE_START
G1 F11668.197
M204 S6000
G1 X97.479 Y94.351 E-.1462
G1 X96.791 Y93.984 E-.29641
G1 X96.969 Y93.649 E-.14441
G1 X97.371 Y93.863 E-.17298
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.967 Y89.671 Z1.34 F42000
G1 Z.94
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X99.279 Y89.305 E.01961
G1 X99.457 Y88.969 E.00955
G1 X100.146 Y89.336 E.01961
G1 X99.996 Y89.618 E.00805
M204 S250
G1 X100.533 Y89.883 F42000
; LINE_WIDTH: 0.377567
G1 F1200
M204 S5000
G1 X100.638 Y89.686 E.00498
G1 X102.219 Y90.527 E.04008
G1 X102.423 Y90.636 E.00517
G1 X102.319 Y90.832 E.00498
G1 X100.586 Y89.911 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X100.638 Y89.686 E-.08755
G1 X102.2 Y90.517 E-.67245
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
G1 X97.423 Y94.457 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1980
M204 S6000
G1 X97.728 Y94.619 E.00936
G1 F1440
G1 X98.335 Y94.942 E.01865
G1 F960
G1 X98.943 Y95.266 E.01865
M106 S255
G1 F600
G1 X100.08 Y95.87 E.03491
M106 S183.6
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X101.326 Y96.533 E.03822
G1 X102.9 Y93.571 E.09088
G1 X103.089 Y93.619 E.00528
G1 X103.089 Y100.227 E.17907
G1 X100.061 Y100.227 E.08207
G1 X100.061 Y99.627 E.01626
M73 P63 R1
G1 X96.939 Y99.627 E.08458
G1 X96.939 Y100.227 E.01626
G1 X81.061 Y100.227 E.43027
G1 X81.061 Y99.627 E.01626
G1 X77.939 Y99.627 E.08458
M73 P64 R1
G1 X77.939 Y100.227 E.01626
G1 X76.911 Y100.227 E.02787
G1 X76.911 Y87.644 E.34098
G1 X79.366 Y87.644 E.06652
G1 X79.366 Y85.549 E.05677
M73 P65 R1
G1 X79.9 Y85.549 E.01448
M106 S183.6
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X80.283 Y85.549 E.01036
M106 S183.6
G1 F1065.078
G1 X80.518 Y85.549 E.00637
G1 F1432.233
G1 X80.668 Y85.549 E.00407
M106 S255
G1 F600
G1 X80.9 Y85.672 E.00712
M106 S183.6
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X87.013 Y88.922 E.18759
M106 S183.6
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X87.542 Y89.204 E.01626
M106 S183.6
G1 F960
G1 X88.15 Y89.527 E.01865
G1 F1440
G1 X88.758 Y89.85 E.01865
G1 F1980
G1 X89.895 Y90.455 E.03491
G1 X90.721 Y90.894 E.02535
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X96.372 Y93.899 E.17342
M106 S183.6
; FEATURE: Inner wall
G1 F1980
M204 S6000
G1 X97.37 Y94.429 E.03062
M204 S250
G1 X97.658 Y94.015 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1173.963
M204 S5000
G1 X97.611 Y94.103 E.00251
G1 X97.647 Y94.123 E.00103
M106 S255
G1 F600
G1 X98.122 Y94.375 E.01353
M106 S183.6
G1 F2725.645
G1 X98.475 Y94.563 E.01006
G1 F6387.29
G1 X98.828 Y94.751 E.01006
G1 F9201.644
G1 X99.181 Y94.939 E.01006
G1 F7492.141
G1 X99.589 Y95.156 E.01162
G1 F2975.226
G1 X99.943 Y95.343 E.01006
G1 F720
G1 X100.268 Y95.517 E.00928
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X101.16 Y95.991 E.02737
G1 X103.49 Y91.609 E.13447
G1 X103.49 Y100.628 E.24439
M73 P66 R1
G1 X99.66 Y100.628 E.10378
G1 X99.66 Y100.028 E.01626
G1 X97.34 Y100.028 E.06286
G1 X97.34 Y100.628 E.01626
G1 X80.66 Y100.628 E.45198
M73 P67 R1
G1 X80.66 Y100.028 E.01626
G1 X78.34 Y100.028 E.06286
G1 X78.34 Y100.628 E.01626
M73 P68 R1
G1 X76.51 Y100.628 E.04959
G1 X76.51 Y87.243 E.36269
G1 X78.965 Y87.243 E.06652
G1 X78.965 Y85.148 E.05677
G1 X79.9 Y85.148 E.02534
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P69 R1
G1 F960
G1 X80.768 Y85.148 E.02182
M106 S255
G1 F600
G1 X80.9 Y85.218 E.00376
M106 S183.6
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X87.201 Y88.568 E.19337
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
G1 X87.527 Y88.742 E.00928
G1 F2975.226
G1 X87.88 Y88.929 E.01006
G1 F6766.451
G1 X88.233 Y89.117 E.01006
G1 F9655.488
G1 X88.586 Y89.305 E.01006
G1 F7092.619
G1 X88.994 Y89.522 E.01162
G1 F2725.645
G1 X89.347 Y89.71 E.01006
M106 S255
G1 F600
G1 X89.822 Y89.962 E.01353
M106 S183.6
G1 F747.261
G1 X89.858 Y89.982 E.00103
G1 F1174.111
G1 X89.905 Y89.893 E.00251
G1 F3755.84
G1 X90.259 Y90.081 E.01006
G1 X90.594 Y90.259 E.00955
G1 X90.547 Y90.348 E.00251
M73 P69 R0
G1 X90.583 Y90.367 E.00103
G1 F720
G1 X90.909 Y90.54 E.00928
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X96.56 Y93.545 E.17342
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X96.886 Y93.718 E.00928
M106 S183.6
G1 F747.194
G1 X96.922 Y93.737 E.00103
G1 F1174.049
G1 X96.969 Y93.649 E.00251
G1 F3841.175
G1 X97.322 Y93.837 E.01006
G1 F7081.036
G1 X97.605 Y93.987 E.00805
; WIPE_START
M204 S6000
G1 X97.611 Y94.103 E-.04432
G1 X97.647 Y94.123 E-.01557
G1 X98.122 Y94.375 E-.20444
G1 X98.475 Y94.563 E-.152
G1 X98.828 Y94.751 E-.152
G1 X99.181 Y94.939 E-.152
G1 X99.274 Y94.988 E-.03968
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.991 J-.707 P1  F42000
G1 X92.089 Y84.915 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S6000
G1 X91.379 Y84.538 E.02179
M106 S183.6
M106 S255
G1 X91.426 Y84.349 E.00528
M106 S183.6
M106 S255
G1 X91.427 Y84.349 E.00002
M106 S183.6
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X92.089 Y84.349 E.01795
G1 X92.089 Y84.701 E.00954
M106 S183.6
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X92.089 Y84.855 E.00418
M106 S183.6
; WIPE_START
G1 X91.379 Y84.538 E-.29561
G1 X91.426 Y84.349 E-.07404
G1 X91.427 Y84.349 E-.00024
G1 X92.089 Y84.349 E-.2517
G1 X92.089 Y84.701 E-.13384
G1 X92.089 Y84.713 E-.00457
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.595 J1.062 P1  F42000
G1 X99.152 Y88.67 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X93.636 Y85.738 E.16927
G1 X93.683 Y85.549 E.00528
G1 X95.911 Y85.549 E.06036
M73 P70 R0
G1 X95.911 Y84.349 E.03252
G1 X97.089 Y84.349 E.03194
G1 X97.089 Y85.549 E.03252
M106 S183.6
M106 S255

G1 X103.089 Y85.549 E.16258
G1 X103.089 Y90.764 E.14132
G1 X102.86 Y90.642 E.00703
M106 S183.6
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X102.33 Y90.36 E.01626
M106 S183.6
M73 P71 R0
G1 F960
G1 X101.643 Y89.995 E.02109
G1 F1440
G1 X100.956 Y89.629 E.02109
G1 F1980
G1 X99.739 Y88.982 E.03735
G1 F1680
G1 X99.205 Y88.699 E.01638
; WIPE_START
G1 X97.439 Y87.76 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.568 J-1.076 P1  F42000
G1 X92.49 Y85.148 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
M204 S5000
G1 X93.143 Y85.148 E.01643
M106 S183.6
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X95.51 Y85.148 E.06413
G1 X95.51 Y83.948 E.03252
G1 X97.49 Y83.948 E.05365
G1 X97.49 Y85.148 E.03252
G1 X103.489 Y85.148 E.16256
G1 X103.49 Y91.431 E.17024
G1 X102.672 Y90.996 E.0251
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P72 R0
G1 F720
G1 X102.346 Y90.823 E.00928
G1 F2975.226
G1 X101.993 Y90.635 E.01006
G1 F6766.451
G1 X101.64 Y90.447 E.01006
G1 F9655.548
G1 X101.287 Y90.259 E.01006
G1 F7092.722
G1 X100.879 Y90.042 E.01162
G1 F2725.645
G1 X100.526 Y89.855 E.01006
M106 S255
G1 F600
G1 X100.051 Y89.602 E.01353
M106 S183.6
G1 F747.279
G1 X100.014 Y89.583 E.00103
G1 F1174.133
G1 X99.967 Y89.671 E.00251
G1 F3755.877
G1 X99.614 Y89.483 E.01006
G1 X99.279 Y89.305 E.00955
G1 X99.326 Y89.217 E.00251
G1 X99.29 Y89.197 E.00103
G1 F720
G1 X98.964 Y89.024 E.00928
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X93.313 Y86.019 E.17342
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
G1 X92.987 Y85.846 E.00928
G1 F880.565
G1 X92.951 Y85.827 E.00103
G1 F1339.82
G1 X92.904 Y85.915 E.00251
G1 F4047.804
G1 X92.551 Y85.728 E.01006
G1 F3671.302
G1 X92.215 Y85.549 E.00955
G1 X92.262 Y85.461 E.00251
G1 X92.226 Y85.442 E.00103
M106 S255
G1 F600
G1 X91.751 Y85.189 E.01353
M106 S183.6
G1 F2725.645
G1 X91.398 Y85.001 E.01006
G1 F6387.29
G1 X91.045 Y84.813 E.01006
G1 F11584.935
G1 X90.691 Y84.626 E.01006
G1 F11668.197
G1 X90.338 Y84.438 E.01006
G1 X89.966 Y84.24 E.01059
G1 F7456.214
G1 X90.051 Y84.081 E.00453
G1 F5457.8
G1 X90.51 Y84.325 E.01307
G1 F1433.159
G1 X90.51 Y84.279 E.00117
G1 F1200
G1 X90.51 Y83.948 E.00832
M106 S255
G1 F600
G1 X90.673 Y83.948 E.00411
M106 S183.6
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X92.49 Y83.948 E.04922
G1 X92.49 Y84.801 E.0231
M106 S183.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X92.49 Y85.088 E.00723
M106 S183.6
; WIPE_START
M204 S6000
G1 X93.143 Y85.148 E-.24932
G1 X94.487 Y85.148 E-.51068
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

G1 X94.322 Y85.716
M73 P73 R0
G1 Z1.1
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.421366
M106 S255
G1 F3000
M204 S6000
G1 X102.749 Y90.196 E.24081
G1 X102.749 Y89.758 E.01106
G1 X95.472 Y85.889 E.20792
G1 X96.251 Y85.889 E.01965
G1 X96.251 Y85.865 E.00061
G1 X102.749 Y89.32 E.18567
G1 X102.749 Y88.881 E.01106
G1 X96.251 Y85.427 E.18567
G1 X96.251 Y84.988 E.01106
G1 X96.749 Y85.253 E.01422
G1 X96.749 Y84.814 E.01106
G1 X96.187 Y84.516 E.01606
M106 S183.6
; WIPE_START
G1 X96.749 Y84.814 E-.24189
G1 X96.749 Y85.253 E-.16657
G1 X96.251 Y84.988 E-.21413
G1 X96.251 Y85.35 E-.13741
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.314 J1.176 P1  F42000
G1 X97.619 Y85.716 Z1.5
G1 Z1.1
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X102.749 Y88.443 E.14658
G1 X102.749 Y88.005 E.01106
G1 X98.77 Y85.889 E.11369
G1 X99.594 Y85.889 E.0208
G1 X102.749 Y87.566 E.09014
G1 X102.749 Y87.128 E.01106
G1 X100.419 Y85.889 E.06658
G1 X101.243 Y85.889 E.0208
G1 X102.749 Y86.69 E.04302
G1 X102.749 Y86.251 E.01106
G1 X101.741 Y85.716 E.02879
M106 S183.6
; WIPE_START
G1 X102.749 Y86.251 E-.43363
G1 X102.749 Y86.69 E-.16657
G1 X102.378 Y86.492 E-.1598
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.922 J-.795 P1  F42000
G1 X99.908 Y89.356 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.134247
G1 F18000
M204 S6000
G1 X99.573 Y89.178 E.00247
; WIPE_START
G1 X99.908 Y89.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.028 Y93.964 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.134245
M73 P74 R0
G1 F18000
M204 S6000
G1 X97.363 Y94.142 E.00247
; WIPE_START
G1 X97.028 Y93.964 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.216 J-.056 P1  F42000
G1 X96.772 Y99.496 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.423066
M106 S255
G1 F3000
M204 S6000
G1 X81.401 Y99.496 E.38952
G1 X81.401 Y99.885 E.00985
G1 X96.772 Y99.885 E.38952
M106 S183.6
; WIPE_START
G1 X94.772 Y99.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I0 J1.217 P1  F42000
G1 X102.922 Y99.885 Z1.5
G1 Z1.1
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X100.401 Y99.885 E.06389
G1 X100.401 Y99.496 E.00985
G1 X102.922 Y99.496 E.06389
M106 S183.6
; WIPE_START
G1 X100.922 Y99.496 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I1.077 J-.566 P1  F42000
G1 X93.515 Y85.394 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.271156
G1 F18000
M204 S6000
G1 X92.771 Y85.475 E.01155
; LINE_WIDTH: 0.273998
G1 X92.791 Y85.557 E.00133
; LINE_WIDTH: 0.247566
G1 X92.812 Y85.639 E.00118
; WIPE_START
G1 X92.791 Y85.557 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.3 Y90.386 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.134233
G1 F18000
M204 S6000
G1 X89.965 Y90.208 E.00247
; WIPE_START
G1 X90.3 Y90.386 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.528 J-1.097 P1  F42000
G1 X80.956 Y85.891 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.423066
M106 S255
G1 F3000
M204 S6000
M73 P75 R0
G1 X79.706 Y85.891 E.03166
G1 X79.706 Y86.279 E.00985
G1 X81.317 Y86.279 E.04082
G1 X82.048 Y86.668 E.02098
G1 X79.706 Y86.668 E.05935
G1 X79.706 Y87.057 E.00985
G1 X82.779 Y87.057 E.07787
G1 X83.51 Y87.446 E.02098
G1 X79.706 Y87.446 E.0964
G1 X79.706 Y87.834 E.00985
G1 X84.241 Y87.834 E.11493
G1 X84.972 Y88.223 E.02098
G1 X77.251 Y88.223 E.19567
G1 X77.251 Y88.612 E.00985
G1 X85.704 Y88.612 E.21419
G1 X86.435 Y89.001 E.02098
G1 X77.251 Y89.001 E.23272
G1 X77.251 Y89.389 E.00985
G1 X87.166 Y89.389 E.25125
G1 X87.897 Y89.778 E.02098
G1 X77.251 Y89.778 E.26977
G1 X77.251 Y90.167 E.00985
G1 X88.628 Y90.167 E.2883
G1 X89.359 Y90.555 E.02098
G1 X77.251 Y90.555 E.30683
G1 X77.251 Y90.944 E.00985
G1 X90.09 Y90.944 E.32535
M73 P76 R0
G1 X90.821 Y91.333 E.02098
G1 X77.251 Y91.333 E.34388
G1 X77.251 Y91.722 E.00985
G1 X91.552 Y91.722 E.36241
G1 X92.283 Y92.11 E.02098
G1 X77.251 Y92.11 E.38093
G1 X77.251 Y92.499 E.00985
G1 X93.014 Y92.499 E.39946
G1 X93.746 Y92.888 E.02098
G1 X77.251 Y92.888 E.41799
G1 X77.251 Y93.277 E.00985
G1 X94.477 Y93.277 E.43651
M73 P77 R0
G1 X95.208 Y93.665 E.02098
G1 X77.251 Y93.665 E.45504
G1 X77.251 Y94.054 E.00985
G1 X95.939 Y94.054 E.47357
G1 X96.67 Y94.443 E.02098
G1 X77.251 Y94.443 E.4921
G1 X77.251 Y94.831 E.00985
G1 X97.401 Y94.831 E.51062
G1 X98.132 Y95.22 E.02098
G1 X77.251 Y95.22 E.52915
M73 P78 R0
G1 X77.251 Y95.609 E.00985
G1 X98.863 Y95.609 E.54768
G1 X99.594 Y95.998 E.02098
G1 X77.251 Y95.998 E.5662
G1 X77.251 Y96.386 E.00985
G1 X100.695 Y96.386 E.5941
M106 S183.6
M204 S10000
G1 X101.593 Y96.386 F42000
M106 S255
G1 F3000
M204 S6000
G1 X102.749 Y96.386 E.0293
G1 X102.749 Y95.998 E.00985
G1 X101.996 Y95.998 E.01908
M73 P79 R0
G1 X102.203 Y95.609 E.01116
G1 X102.749 Y95.609 E.01384
G1 X102.749 Y95.22 E.00985
G1 X102.409 Y95.22 E.0086
G1 X102.616 Y94.831 E.01116
G1 X102.922 Y94.831 E.00776
M106 S183.6
; WIPE_START
G1 X102.616 Y94.831 E-.1164
G1 X102.409 Y95.22 E-.1673
G1 X102.749 Y95.22 E-.12899
G1 X102.749 Y95.609 E-.14772
G1 X102.224 Y95.609 E-.1996
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.044 J.626 P1  F42000
G1 X102.922 Y96.775 Z1.5
G1 Z1.1
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X77.251 Y96.775 E.65054
G1 X77.251 Y97.164 E.00985
G1 X102.749 Y97.164 E.64614
G1 X102.749 Y97.553 E.00985
G1 X77.251 Y97.553 E.64614
G1 X77.251 Y97.941 E.00985
G1 X102.749 Y97.941 E.64614
G1 X102.749 Y98.33 E.00985
M73 P80 R0
G1 X77.251 Y98.33 E.64614
G1 X77.251 Y98.719 E.00985
G1 X102.749 Y98.719 E.64614
G1 X102.749 Y99.108 E.00985
G1 X77.251 Y99.108 E.64614
G1 X77.251 Y99.496 E.00985
G1 X77.599 Y99.496 E.00881
M73 P81 R0
G1 X77.599 Y99.885 E.00985
G1 X77.078 Y99.885 E.01321
M106 S183.6
; CHANGE_LAYER
; Z_HEIGHT: 1.26
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
G1 X77.599 Y99.885 E-.19802
G1 X77.599 Y99.496 E-.14772
G1 X77.251 Y99.496 E-.13207
G1 X77.251 Y99.108 E-.14772
G1 X77.605 Y99.108 E-.13448
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
G3 Z1.5 I.16 J1.206 P1  F42000
G1 X101.16 Y95.991 Z1.5
G1 Z1.26
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8123
M204 S5000
G1 X103.49 Y91.609 E.12477
G1 X103.49 Y100.628 E.22675
G1 X99.66 Y100.628 E.09629
G1 X99.66 Y100.028 E.01508
G1 X97.34 Y100.028 E.05833
G1 X97.34 Y100.628 E.01508
G1 X80.66 Y100.628 E.41936
G1 X80.66 Y100.028 E.01508
G1 X78.34 Y100.028 E.05833
G1 X78.34 Y100.628 E.01508
G1 X76.51 Y100.628 E.04601
G1 X76.51 Y87.243 E.33651
G1 X78.965 Y87.243 E.06172
G1 X78.965 Y85.148 E.05267
G1 X80.768 Y85.148 E.04532
G1 X89.858 Y89.981 E.25885
G1 X89.905 Y89.893 E.00251
G1 X90.594 Y90.259 E.01961
G1 X90.547 Y90.348 E.00251
G1 X96.922 Y93.737 E.18152
G1 X96.969 Y93.649 E.00251
G1 X97.658 Y94.015 E.01961
G1 X97.611 Y94.103 E.00251
G1 X101.107 Y95.963 E.09956
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.067 Y94.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.836 J-.884 P1  F42000
G1 X92.49 Y85.148 Z1.66
G1 Z1.26
G1 E.8 F1800
G1 F8123
M204 S5000
G1 X95.51 Y85.148 E.07593
G1 X95.51 Y83.948 E.03017
G1 X97.49 Y83.948 E.04978
G1 X97.49 Y85.148 E.03017
G1 X103.489 Y85.148 E.15083
G1 X103.49 Y91.431 E.15795
G1 X100.014 Y89.583 E.09897
M73 P82 R0
G1 X99.967 Y89.671 E.00251
G1 X99.279 Y89.305 E.01961
G1 X99.326 Y89.217 E.00251
G1 X92.951 Y85.827 E.18152
G1 X92.904 Y85.915 E.00251
G1 X92.215 Y85.549 E.01961
G1 X92.262 Y85.461 E.00251
G1 X89.966 Y84.24 E.06537
G1 X90.051 Y84.081 E.00453
G1 X90.51 Y84.325 E.01307
G1 X90.51 Y83.948 E.00949
G1 X92.49 Y83.948 E.04978
G1 X92.49 Y85.088 E.02866
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.49 Y85.128 E-.76
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

G1 X91.689 Y84.916
G1 Z1.26
G1 E.8 F1800
; FEATURE: Top surface
G1 F8123
M204 S2000
G1 X92.278 Y84.328 E.02092
G1 X91.9 Y84.16
G1 X91.333 Y84.727 E.02015
G1 X90.977 Y84.537
G1 X91.355 Y84.16 E.01342
M204 S10000
G1 X90.871 Y84.141 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.128981
G1 F8123
M204 S6000
G1 X90.794 Y84.409 E.00172
G1 X90.813 Y84.428 E.00017
; LINE_WIDTH: 0.0961682
G1 X90.917 Y84.505 E.00052
M204 S10000
G1 X90.734 Y84.328 F42000
; LINE_WIDTH: 0.102104
G1 F8123
M204 S6000
G1 X90.756 Y84.148 E.0008
; WIPE_START
G1 F18000
G1 X90.734 Y84.328 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-.577 J1.072 P1  F42000
G1 X102.728 Y90.785 Z1.66
G1 Z1.26
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F8123
M204 S2000
G1 X103.278 Y90.235 E.01956
G1 X103.278 Y89.69
G1 X102.372 Y90.596 E.03222
G1 X102.016 Y90.407
G1 X103.278 Y89.144 E.04488
G1 X103.278 Y88.599
G1 X101.66 Y90.217 E.05754
G1 X101.303 Y90.028
G1 X103.278 Y88.054 E.0702
G1 X103.278 Y87.508
G1 X100.947 Y89.839 E.08286
G1 X100.591 Y89.649
G1 X103.278 Y86.963 E.09552
G1 X103.278 Y86.417
G1 X100.235 Y89.46 E.10818
G1 X99.805 Y89.345
G1 X103.278 Y85.872 E.12347
G1 X103.244 Y85.36
G1 X99.523 Y89.081 E.13231
G1 X99.167 Y88.892
G1 X102.699 Y85.36 E.12558
M73 P83 R0
G1 X102.154 Y85.36
G1 X98.811 Y88.703 E.11885
G1 X98.455 Y88.513
G1 X101.608 Y85.36 E.11212
G1 X101.063 Y85.36
G1 X98.099 Y88.324 E.10539
G1 X97.743 Y88.135
G1 X100.517 Y85.36 E.09865
G1 X99.972 Y85.36
G1 X97.387 Y87.945 E.09192
G1 X97.031 Y87.756
G1 X99.427 Y85.36 E.08519
G1 X98.881 Y85.36
G1 X96.674 Y87.567 E.07846
G1 X96.318 Y87.377
G1 X98.336 Y85.36 E.07173
G1 X97.79 Y85.36
G1 X95.962 Y87.188 E.06499
G1 X95.606 Y86.999
G1 X97.278 Y85.327 E.05944
G1 X97.278 Y84.782
G1 X95.25 Y86.809 E.0721
G1 X94.894 Y86.62
G1 X97.278 Y84.236 E.08476
G1 X96.809 Y84.16
G1 X95.722 Y85.247 E.03863
G1 X95.722 Y84.701
G1 X96.263 Y84.16 E.01924
; WIPE_START
G1 F11668.197
M204 S6000
G1 X95.722 Y84.701 E-.29085
G1 X95.722 Y85.247 E-.20725
G1 X96.209 Y84.759 E-.2619
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-.861 J-.861 P1  F42000
G1 X95.609 Y85.36 Z1.66
G1 Z1.26
G1 E.8 F1800
G1 F8123
M204 S2000
G1 X94.538 Y86.431 E.03807
G1 X94.182 Y86.241
G1 X95.063 Y85.36 E.03134
G1 X94.518 Y85.36
G1 X93.826 Y86.052 E.0246
G1 X93.47 Y85.863
G1 X93.973 Y85.36 E.01787
G1 X93.427 Y85.36
G1 X93.114 Y85.673 E.01114
; WIPE_START
M73 P84 R0
G1 F11668.197
M204 S6000
G1 X93.427 Y85.36 E-.1684
G1 X93.973 Y85.36 E-.20726
G1 X93.47 Y85.863 E-.27015
G1 X93.735 Y86.004 E-.1142
; WIPE_END
M73 P85 R0
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-1.026 J.654 P1  F42000
G1 X102.915 Y100.415 Z1.66
G1 Z1.26
G1 E.8 F1800
G1 F8123
M204 S2000
G1 X103.278 Y100.052 E.01291
G1 X103.278 Y99.507
G1 X102.369 Y100.416 E.0323
G1 X101.824 Y100.416
G1 X103.278 Y98.962 E.0517
G1 X103.278 Y98.416
G1 X101.279 Y100.416 E.07109
G1 X100.733 Y100.416
G1 X103.278 Y97.871 E.09048
G1 X103.278 Y97.325
G1 X100.188 Y100.416 E.10988
G1 X99.872 Y100.186
G1 X103.278 Y96.78 E.12109
G1 X103.278 Y96.235
G1 X99.697 Y99.816 E.12733
M73 P86 R0
G1 X99.151 Y99.816
G1 X103.278 Y95.689 E.14672
G1 X103.278 Y95.144
G1 X98.606 Y99.816 E.16611
G1 X98.06 Y99.816
G1 X103.278 Y94.598 E.18551
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.864 Y96.013 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.433 J-1.137 P1  F42000
G1 X101.469 Y95.862 Z1.66
G1 Z1.26
G1 E.8 F1800
G1 F8123
M204 S2000
G1 X103.278 Y94.053 E.06432
G1 X103.278 Y93.508
G1 X102.088 Y94.697 E.04231
; WIPE_START
G1 F11668.197
M204 S6000
G1 X103.278 Y93.508 E-.63943
G1 X103.278 Y93.825 E-.12057
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-.903 J-.816 P1  F42000
G1 X101.121 Y96.21 Z1.66
G1 Z1.26
G1 E.8 F1800
G1 F8123
M204 S2000
G1 X97.515 Y99.816 E.1282
; WIPE_START
G1 F11668.197
M204 S6000
G1 X98.929 Y98.402 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-.753 J-.956 P1  F42000
G1 X96.37 Y100.416 Z1.66
G1 Z1.26
G1 E.8 F1800
G1 F8123
M204 S2000
G1 X100.765 Y96.021 E.15627
G1 X100.409 Y95.831
G1 X95.824 Y100.416 E.163
G1 X95.279 Y100.416
G1 X100.053 Y95.642 E.16973
G1 X99.697 Y95.453
G1 X94.733 Y100.416 E.17646
G1 X94.188 Y100.416
G1 X99.34 Y95.263 E.1832
G1 X98.984 Y95.074
G1 X93.643 Y100.416 E.18993
M73 P87 R0
G1 X93.097 Y100.416
G1 X98.628 Y94.885 E.19666
G1 X98.272 Y94.695
G1 X92.552 Y100.416 E.20339
G1 X92.006 Y100.416
G1 X97.916 Y94.506 E.21012
G1 X97.56 Y94.317
G1 X91.461 Y100.416 E.21685
G1 X90.916 Y100.416
G1 X97.278 Y94.053 E.22621
G1 X96.848 Y93.938
G1 X90.37 Y100.416 E.23032
G1 X89.825 Y100.416
G1 X96.492 Y93.749 E.23705
G1 X96.136 Y93.559
G1 X89.279 Y100.416 E.24378
G1 X88.734 Y100.416
G1 X95.78 Y93.37 E.25051
G1 X95.424 Y93.181
G1 X88.189 Y100.416 E.25724
G1 X87.643 Y100.416
G1 X95.068 Y92.991 E.26398
G1 X94.711 Y92.802
G1 X87.098 Y100.416 E.27071
G1 X86.552 Y100.416
G1 X94.355 Y92.613 E.27744
M73 P88 R0
G1 X93.999 Y92.423
G1 X86.007 Y100.416 E.28417
G1 X85.462 Y100.416
G1 X93.643 Y92.234 E.2909
G1 X93.287 Y92.045
G1 X84.916 Y100.416 E.29763
G1 X84.371 Y100.416
G1 X92.931 Y91.855 E.30436
G1 X92.575 Y91.666
G1 X83.825 Y100.416 E.3111
G1 X83.28 Y100.416
G1 X92.219 Y91.477 E.31783
G1 X91.863 Y91.287
G1 X82.735 Y100.416 E.32456
G1 X82.189 Y100.416
G1 X91.507 Y91.098 E.33129
G1 X91.151 Y90.909
G1 X81.644 Y100.416 E.33802
G1 X81.098 Y100.416
G1 X90.795 Y90.72 E.34475
G1 X90.439 Y90.53
G1 X80.872 Y100.097 E.34014
M73 P89 R0
G1 X80.608 Y99.816
G1 X90.156 Y90.267 E.33951
G1 X89.726 Y90.152
G1 X80.062 Y99.816 E.34362
G1 X79.517 Y99.816
G1 X89.37 Y89.962 E.35035
G1 X89.014 Y89.773
G1 X78.971 Y99.816 E.35708
G1 X78.426 Y99.816
G1 X88.658 Y89.584 E.36381
G1 X88.302 Y89.394
G1 X77.281 Y100.416 E.39187
G1 X76.735 Y100.416
G1 X87.946 Y89.205 E.3986
G1 X87.59 Y89.016
G1 X76.722 Y99.883 E.38641
G1 X76.722 Y99.338
G1 X87.234 Y88.826 E.37375
G1 X86.878 Y88.637
G1 X76.722 Y98.793 E.36109
M73 P90 R0
G1 X76.722 Y98.247
G1 X86.522 Y88.448 E.34843
G1 X86.166 Y88.258
G1 X76.722 Y97.702 E.33577
G1 X76.722 Y97.156
G1 X85.81 Y88.069 E.32311
G1 X85.453 Y87.88
G1 X76.722 Y96.611 E.31045
G1 X76.722 Y96.066
G1 X85.097 Y87.69 E.29779
G1 X84.741 Y87.501
G1 X76.722 Y95.52 E.28513
G1 X76.722 Y94.975
G1 X84.385 Y87.312 E.27246
G1 X84.029 Y87.122
G1 X76.722 Y94.429 E.2598
G1 X76.722 Y93.884
G1 X83.673 Y86.933 E.24714
G1 X83.317 Y86.744
G1 X76.722 Y93.338 E.23448
G1 X76.722 Y92.793
G1 X82.961 Y86.554 E.22182
G1 X82.605 Y86.365
G1 X76.722 Y92.248 E.20916
M73 P91 R0
G1 X76.722 Y91.702
G1 X82.249 Y86.176 E.1965
G1 X81.893 Y85.986
G1 X76.722 Y91.157 E.18384
G1 X76.722 Y90.611
G1 X81.537 Y85.797 E.17118
G1 X81.181 Y85.608
G1 X76.722 Y90.066 E.15852
G1 X76.722 Y89.521
G1 X78.788 Y87.455 E.07344
G1 X78.242 Y87.455
G1 X76.722 Y88.975 E.05405
G1 X76.722 Y88.43
G1 X77.697 Y87.455 E.03466
G1 X77.152 Y87.455
G1 X76.722 Y87.884 E.01527
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.152 Y87.455 E-.23078
G1 X77.697 Y87.455 E-.20726
G1 X77.098 Y88.054 E-.32196
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I.522 J1.099 P1  F42000
G1 X79.177 Y87.066 Z1.66
G1 Z1.26
G1 E.8 F1800
G1 F8123
M204 S2000
G1 X80.824 Y85.418 E.05857
G1 X80.337 Y85.36
G1 X79.177 Y86.52 E.04125
G1 X79.177 Y85.975
G1 X79.792 Y85.36 E.02186
; WIPE_START
G1 F11668.197
M204 S6000
G1 X79.177 Y85.975 E-.33043
G1 X79.177 Y86.52 E-.20725
G1 X79.591 Y86.107 E-.22232
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.66 I-.351 J1.165 P1  F42000
G1 X103.099 Y93.178 Z1.66
G1 Z1.26
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.415246
G1 F8123
M204 S6000
G1 X103.061 Y93.215 E.00133
; LINE_WIDTH: 0.384009
G1 X103.023 Y93.253 E.00122
; LINE_WIDTH: 0.344419
G1 X102.925 Y93.387 E.00336
; LINE_WIDTH: 0.296455
G1 X102.826 Y93.52 E.00284
; LINE_WIDTH: 0.24849
G1 X102.727 Y93.654 E.00232
; LINE_WIDTH: 0.200525
G1 X102.628 Y93.787 E.0018
; LINE_WIDTH: 0.152561
G1 X102.529 Y93.921 E.00128
; LINE_WIDTH: 0.104596
G1 X102.431 Y94.054 E.00076
M204 S10000
G1 X102.151 Y94.76 F42000
; LINE_WIDTH: 0.192956
G1 F8123
M204 S6000
G1 X102.038 Y94.913 E.00197
; LINE_WIDTH: 0.148019
G1 X101.924 Y95.066 E.00141
; LINE_WIDTH: 0.103082
G1 X101.811 Y95.219 E.00085
M204 S10000
G1 X101.531 Y95.925 F42000
; LINE_WIDTH: 0.198735
G1 F8123
M204 S6000
G1 X101.446 Y96.04 E.00154
; LINE_WIDTH: 0.165374
G1 X101.361 Y96.155 E.00122
; LINE_WIDTH: 0.12952
G3 X101.257 Y96.289 I-.459 J-.251 E.00105
; LINE_WIDTH: 0.0920356
G3 X101.181 Y96.243 I.051 J-.169 E.00034
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F18000
G1 X101.257 Y96.289 E-.76
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
M73 P92 R0
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
M73 P93 R0
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

    G1 Z101.26 F600
M73 P94 R0
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


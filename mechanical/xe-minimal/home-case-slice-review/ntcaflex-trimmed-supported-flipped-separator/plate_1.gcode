; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 2m 40s; total estimated time: 2m 59s
; total layer number: 7
; total filament length [mm] : 152.24
; total filament volume [cm^3] : 366.19
; total filament weight [g] : 0.45
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
M73 P0 R2
G1 X10.1 Y20 Z0.28 F5000.0 ;Move to start position
M109 S205;
G1 X10.1 Y200.0 Z0.28 F1500.0 E15 ;Draw the first line
G1 X10.4 Y200.0 Z0.28 F5000.0 ;Move to side a little
G1 X10.4 Y20 Z0.28 F1500.0 E30 ;Draw the second line
G92 E0 ;Reset Extruder 
M73 P4 R2
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
; layer num/total_layer_count: 1/7
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
M73 P8 R2
G1 X81.518 Y84.709 F42000
M204 S6000
M73 P10 R2
G1 Z.4
G1 Z.14
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F3000
M204 S500
G1 X75.573 Y84.709 E.13225
G1 X75.573 Y85.594 E.0197
G1 X81.345 Y85.594 E.12839
G1 X81.345 Y86.48 E.0197
G1 X75.573 Y86.48 E.12839
G1 X75.573 Y87.366 E.0197
G1 X81.345 Y87.366 E.12839
G1 X81.345 Y88.251 E.0197
M73 P11 R2
G1 X75.573 Y88.251 E.12839
G1 X75.573 Y89.137 E.0197
G1 X81.345 Y89.137 E.12839
G1 X81.345 Y90.023 E.0197
G1 X75.573 Y90.023 E.12839
G1 X75.573 Y90.908 E.0197
G1 X81.345 Y90.908 E.12839
G1 X81.345 Y91.794 E.0197
G1 X75.573 Y91.794 E.12839
G1 X75.573 Y92.68 E.0197
G1 X81.345 Y92.68 E.12839
G1 X81.345 Y93.565 E.0197
G1 X78.458 Y93.565 E.0642
G1 X78.458 Y94.451 E.0197
G1 X81.345 Y94.451 E.0642
M73 P12 R2
G1 X81.345 Y95.337 E.0197
G1 X78.285 Y95.337 E.06806
; WIPE_START
G1 X80.285 Y95.337 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X85.512 Y89.775 Z.54 F42000
G1 X88.608 Y86.48 Z.54
G1 Z.14
G1 E.8 F1800
G1 F3000
M204 S500
G1 X87.115 Y86.48 E.03321
G1 X87.115 Y85.594 E.0197
G1 X89.795 Y85.594 E.05961
G1 X91.329 Y84.709 E.0394
G1 X87.115 Y84.709 E.09373
G1 X87.115 Y84.252 E.01017
G1 X84.23 Y84.252 E.06419
G1 X84.23 Y83.823 E.00953
G1 X95.773 Y83.823 E.25676
G1 X95.773 Y82.937 E.0197
G1 X84.23 Y82.937 E.25676
G1 X84.23 Y82.052 E.0197
G1 X95.773 Y82.052 E.25676
M73 P13 R2
G1 X95.773 Y81.366 E.01527
G1 X92.887 Y81.366 E.06419
G1 X92.887 Y81.166 E.00443
G1 X90.001 Y81.166 E.0642
G1 X90.001 Y80.28 E.0197
G1 X92.887 Y80.28 E.0642
G1 X92.887 Y79.395 E.0197
G1 X90.001 Y79.395 E.0642
G1 X90.001 Y78.509 E.0197
G1 X93.061 Y78.509 E.06806
; WIPE_START
G1 X91.061 Y78.509 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X95.785 Y84.504 Z.54 F42000
G1 X95.946 Y84.709 Z.54
G1 Z.14
G1 E.8 F1800
G1 F3000
M204 S500
G1 X92.66 Y84.709 E.07311
G1 X92.75 Y84.796 E.0028
G1 X92.326 Y85.594 E.02011
G1 X95.773 Y85.594 E.07668
G1 X95.773 Y86.48 E.0197
G1 X91.658 Y86.48 E.09152
M204 S6000
M73 P14 R2
G1 X94.701 Y80.711 F42000
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X94.701 Y79.846 E.0232
G1 X95.223 Y79.846 E.014
G1 X95.223 Y80.5 E.01753
G1 X95.745 Y80.5 E.014
G1 X95.745 Y79.846 E.01753
G1 X96.267 Y79.846 E.014
G1 X96.267 Y80.711 E.0232
M204 S6000
G1 X100.356 Y88.826 F42000
G1 F3000
M204 S500
G1 X100.713 Y88.717 E.00999
G1 X101.063 Y88.903 E.01063
G1 X103.161 Y90.018 E.0637
G1 X103.27 Y90.375 E.00999
G1 X100.325 Y95.913 E.16815
G1 X99.969 Y96.022 E.00999
G1 X98.96 Y95.486 E.03062
G3 X98.832 Y94.853 I.462 J-.423 E.01818
G1 X97.645 Y94.853 E.03179
G1 X97.383 Y94.417 E.01365
G1 X100.323 Y88.888 E.16787
; WIPE_START
G1 X99.384 Y90.654 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X103.03 Y97.359 Z.54 F42000
G1 X106.372 Y103.508 Z.54
G1 Z.14
G1 E.8 F1800
G1 F3000
M204 S500
G1 X73.63 Y103.508 E.87771
G1 X73.63 Y91.351 E.32588
G1 X75.13 Y91.351 E.04021
M73 P15 R2
G1 X75.13 Y93.351 E.05361
G1 X78.016 Y93.351 E.07735
G1 X78.016 Y96.237 E.07736
G1 X81.787 Y96.237 E.10111
G1 X81.787 Y88.08 E.21867
G1 X82.287 Y88.08 E.0134
G1 X82.287 Y85.194 E.07736
G1 X86.673 Y85.194 E.11756
M73 P16 R2
G1 X86.673 Y87.58 E.06395
G1 X87.428 Y87.58 E.02024
G1 X86.816 Y88.73 E.03493
G1 X86.925 Y89.087 E.00999
G1 X89.373 Y90.389 E.07433
G1 X89.73 Y90.28 E.00999
G1 X91.165 Y87.58 E.08196
G1 X96.216 Y87.58 E.13539
G1 X96.216 Y80.923 E.17846
G1 X94.216 Y80.923 E.05361
G1 X94.216 Y79.423 E.04021
G1 X106.372 Y79.423 E.32588
G1 X106.372 Y103.438 E.64376
M204 S6000
G1 X105.666 Y103.297 F42000
G1 F3000
M204 S500
M73 P17 R2
G1 X105.666 Y79.846 E.62864
G1 X105.144 Y79.846 E.014
G1 X105.144 Y103.085 E.62297
G1 X104.622 Y103.085 E.014
G1 X104.622 Y79.846 E.62297
G1 X104.1 Y79.846 E.014
G1 X104.1 Y103.085 E.62297
M73 P18 R2
G1 X103.578 Y103.085 E.014
G1 X103.578 Y79.846 E.62297
G1 X103.055 Y79.846 E.014
G1 X103.055 Y89.483 E.25834
G1 X102.533 Y89.206 E.01585
G1 X102.533 Y79.846 E.2509
G1 X102.011 Y79.846 E.014
G1 X102.011 Y88.928 E.24346
M73 P19 R2
G1 X101.489 Y88.65 E.01585
G1 X101.489 Y79.846 E.23602
G1 X100.967 Y79.846 E.014
G1 X100.967 Y88.373 E.22857
G1 X100.757 Y88.261 E.00638
G1 X100.445 Y88.356 E.00874
G1 X100.445 Y79.846 E.22813
G1 X99.922 Y79.846 E.014
G1 X99.922 Y88.74 E.23843
G1 X99.4 Y89.722 E.02982
G1 X99.4 Y79.846 E.26476
G1 X98.878 Y79.846 E.014
G1 X98.878 Y90.704 E.29108
M73 P20 R2
G1 X98.356 Y91.687 E.02982
G1 X98.356 Y79.846 E.31741
G1 X97.834 Y79.846 E.014
G1 X97.834 Y92.669 E.34374
G1 X97.312 Y93.651 E.02982
G1 X97.312 Y79.846 E.37006
G1 X96.789 Y79.846 E.014
G1 X96.789 Y103.085 E.62297
G1 X97.312 Y103.085 E.014
G1 X97.312 Y95.119 E.21355
M73 P21 R2
G1 X97.406 Y95.276 E.00492
G1 X97.834 Y95.276 E.01146
G1 X97.834 Y103.085 E.20933
G1 X98.356 Y103.085 E.014
G1 X98.356 Y95.276 E.20933
G1 X98.409 Y95.276 E.00141
G1 X98.409 Y95.389 E.00303
G1 X98.658 Y95.804 E.01298
G1 X98.878 Y95.922 E.00669
G1 X98.878 Y103.085 E.19203
G1 X99.4 Y103.085 E.014
G1 X99.4 Y96.199 E.18459
G1 X99.922 Y96.477 E.01585
G1 X99.922 Y103.085 E.17715
G1 X100.445 Y103.085 E.014
G1 X100.445 Y96.319 E.18138
M73 P22 R2
G1 X100.616 Y96.267 E.00481
G1 X100.967 Y95.607 E.02002
G1 X100.967 Y103.085 E.20046
G1 X101.489 Y103.085 E.014
G1 X101.489 Y94.625 E.22679
G1 X102.011 Y93.643 E.02982
G1 X102.011 Y103.085 E.25311
G1 X102.533 Y103.085 E.014
G1 X102.533 Y92.661 E.27944
G1 X103.055 Y91.679 E.02982
G1 X103.055 Y103.297 E.31143
M204 S6000
G1 X96.267 Y103.297 F42000
G1 F3000
M204 S500
G1 X96.267 Y88.003 E.40997
M73 P23 R2
G1 X95.745 Y88.003 E.014
G1 X95.745 Y103.085 E.4043
G1 X95.223 Y103.085 E.014
G1 X95.223 Y88.003 E.4043
G1 X94.701 Y88.003 E.014
G1 X94.701 Y103.085 E.4043
G1 X94.179 Y103.085 E.014
G1 X94.179 Y88.003 E.4043
G1 X93.656 Y88.003 E.014
G1 X93.656 Y103.085 E.4043
M73 P24 R2
G1 X93.134 Y103.085 E.014
G1 X93.134 Y88.003 E.4043
G1 X92.612 Y88.003 E.014
G1 X92.612 Y103.085 E.4043
G1 X92.09 Y103.085 E.014
G1 X92.09 Y88.003 E.4043
G1 X91.568 Y88.003 E.014
G1 X91.568 Y103.085 E.4043
M73 P25 R2
G1 X91.046 Y103.085 E.014
G1 X91.046 Y88.706 E.38547
G1 X90.523 Y89.688 E.02982
G1 X90.523 Y103.085 E.35915
G1 X90.001 Y103.085 E.014
G1 X90.001 Y90.639 E.33365
G1 X89.479 Y90.799 E.01464
G1 X89.479 Y103.085 E.32937
G1 X88.957 Y103.085 E.014
G1 X88.957 Y90.646 E.33345
M73 P26 R2
G1 X88.435 Y90.369 E.01585
G1 X88.435 Y103.085 E.34089
G1 X87.913 Y103.085 E.014
G1 X87.913 Y90.091 E.34833
G1 X87.39 Y89.813 E.01585
G1 X87.39 Y103.085 E.35577
G1 X86.868 Y103.085 E.014
G1 X86.868 Y89.536 E.36322
G1 X86.572 Y89.378 E.009
G1 X86.36 Y88.687 E.01939
M73 P27 R2
G1 X86.724 Y88.003 E.02075
G1 X86.346 Y88.003 E.01012
G1 X86.346 Y103.085 E.40431
G1 X85.824 Y103.085 E.014
G1 X85.824 Y85.617 E.46826
G1 X85.302 Y85.617 E.014
G1 X85.302 Y103.085 E.46826
G1 X84.78 Y103.085 E.014
G1 X84.78 Y85.617 E.46826
G1 X84.257 Y85.617 E.014
G1 X84.257 Y103.085 E.46826
M73 P28 R2
G1 X83.735 Y103.085 E.014
G1 X83.735 Y85.617 E.46826
G1 X83.213 Y85.617 E.014
G1 X83.213 Y103.085 E.46826
G1 X82.691 Y103.085 E.014
G1 X82.691 Y88.503 E.39091
G1 X82.21 Y88.503 E.01288
G1 X82.169 Y103.085 E.39091
M73 P29 R2
G1 X81.647 Y103.085 E.014
G1 X81.647 Y96.66 E.17224
G1 X81.124 Y96.66 E.014
G1 X81.124 Y103.085 E.17224
G1 X80.602 Y103.085 E.014
G1 X80.602 Y96.66 E.17224
G1 X80.08 Y96.66 E.014
G1 X80.08 Y103.085 E.17224
G1 X79.558 Y103.085 E.014
G1 X79.558 Y96.66 E.17224
G1 X79.036 Y96.66 E.014
G1 X79.036 Y103.085 E.17224
G1 X78.513 Y103.085 E.014
M73 P30 R2
G1 X78.513 Y96.66 E.17224
G1 X77.991 Y96.66 E.014
G1 X77.991 Y103.085 E.17224
G1 X77.469 Y103.085 E.014
G1 X77.469 Y93.774 E.24959
G1 X76.947 Y93.774 E.014
G1 X76.947 Y103.085 E.24959
G1 X76.425 Y103.085 E.014
G1 X76.425 Y93.774 E.24959
G1 X75.903 Y93.774 E.014
G1 X75.903 Y103.085 E.24959
G1 X75.38 Y103.085 E.014
G1 X75.38 Y93.774 E.24959
M73 P31 R2
G1 X74.858 Y93.774 E.014
G1 X74.858 Y103.085 E.24959
G1 X74.336 Y103.085 E.014
G1 X74.336 Y91.563 E.30888
; WIPE_START
G1 X74.336 Y93.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X81.968 Y93.599 Z.54 F42000
G1 X99.912 Y93.683 Z.54
G1 Z.14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X99.098 Y93.683 E.02181
G1 X100.964 Y90.175 E.10652
G1 X101.811 Y90.626 E.02574
G1 X100.186 Y93.683 E.09283
G1 X99.972 Y93.683 E.00573
; WIPE_START
G1 X99.098 Y93.683 E-.33196
G1 X99.627 Y92.689 E-.42804
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X99.912 Y95.199 Z.54 F42000
G1 Z.14
M73 P32 R2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X99.531 Y94.997 E.01155
G1 X99.531 Y94.153 E.02262
G1 X98.316 Y94.153 E.03258
G1 X100.769 Y89.539 E.14008
G1 X102.447 Y90.431 E.05093
G1 X99.94 Y95.146 E.14315
; WIPE_START
G1 X99.531 Y94.997 E-.16527
G1 X99.531 Y94.153 E-.32064
G1 X98.81 Y94.153 E-.2741
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

G1 X99.767 Y93.448
G1 Z.14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.520231
G1 F3000
M204 S500
G1 X101.277 Y90.608 E.08995
; WIPE_START
G1 X100.338 Y92.374 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X93.042 Y90.134 Z.54 F42000
G1 X89.122 Y88.93 Z.54
G1 Z.14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X88.274 Y88.479 E.02574
G1 X88.696 Y87.687 E.02406
G1 X89.931 Y86.974 E.03824
G1 X90.084 Y87.121 E.0057
G1 X89.15 Y88.877 E.05331
M204 S6000
G1 X89.316 Y89.566 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X87.639 Y88.674 E.05093
G1 X88.344 Y87.347 E.04027
G1 X91.449 Y85.555 E.09611
G1 X89.345 Y89.513 E.12017
; WIPE_START
M73 P33 R2
G1 X87.639 Y88.674 E-.72236
G1 X87.685 Y88.586 E-.03764
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X88.809 Y88.497 Z.54 F42000
G1 Z.14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.520222
G1 F3000
M204 S500
G1 X89.272 Y87.626 E.0276
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
G1 X88.809 Y88.497 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/7
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S198.9
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.54 I-.222 J1.197 P1  F42000
G1 X90.605 Y88.831 Z.54
G1 Z.3
G1 E.8 F1800
; FEATURE: Support transition
; LINE_WIDTH: 0.42
G1 F3000
M204 S6000
G1 X90.001 Y89.966 E.03234
G1 X90.001 Y101.566 E.29162
G1 X89.116 Y101.566 E.02227
G1 X89.116 Y90.357 E.2818
M73 P33 R1
G1 X88.23 Y89.886 E.02522
G1 X88.23 Y101.566 E.29364
G1 X87.344 Y101.566 E.02227
G1 X87.344 Y89.415 E.30548
G1 X86.847 Y89.151 E.01415
G1 X86.767 Y88.888 E.00691
M204 S10000
M73 P34 R1
G1 X86.767 Y88.625 F42000
G1 F3000
M204 S6000
G1 X87.344 Y87.539 E.03091
G1 X87.344 Y87.137 E.01011
G1 X86.459 Y87.137 E.02227
G1 X86.459 Y101.566 E.36276
G1 X85.573 Y101.566 E.02227
G1 X85.573 Y87.137 E.36276
G1 X84.687 Y87.137 E.02227
G1 X84.687 Y101.566 E.36276
G1 X83.802 Y101.566 E.02227
G1 X83.802 Y90.023 E.29021
G1 X82.916 Y90.023 E.02227
G1 X82.916 Y101.566 E.29021
G1 X82.03 Y101.566 E.02227
G1 X82.03 Y90.023 E.29021
G1 X81.73 Y90.023 E.00755
G1 X81.73 Y90.608 E.01471
; WIPE_START
M73 P35 R1
G1 X81.73 Y90.023 E-.22228
G1 X82.03 Y90.023 E-.11413
G1 X82.03 Y91.137 E-.42359
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I.914 J-.803 P1  F42000
G1 X75.831 Y84.078 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X75.831 Y92.909 E.22202
G1 X76.716 Y92.909 E.02227
G1 X76.716 Y84.251 E.21766
G1 X77.602 Y84.251 E.02227
G1 X77.602 Y92.909 E.21766
G1 X78.458 Y92.909 E.02153
G1 X78.458 Y95.794 E.07255
G1 X78.488 Y84.251 E.29021
G1 X79.373 Y84.251 E.02227
G1 X79.373 Y95.794 E.29021
G1 X80.259 Y95.794 E.02227
G1 X80.259 Y84.251 E.29021
G1 X81.145 Y84.251 E.02227
G1 X81.145 Y95.968 E.29457
M204 S10000
G1 X81.722 Y96.18 F42000
; FEATURE: Support transition
G1 F3000
M204 S6000
G1 X81.145 Y96.18 E.01451
G1 X81.145 Y101.566 E.13541
G1 X80.259 Y101.566 E.02227
G1 X80.259 Y96.18 E.13541
G1 X79.373 Y96.18 E.02227
G1 X79.373 Y101.566 E.13541
G1 X78.488 Y101.566 E.02227
M73 P36 R1
G1 X78.488 Y96.18 E.13541
G1 X78.073 Y96.18 E.01043
G1 X78.073 Y93.294 E.07255
G1 X77.602 Y93.294 E.01184
G1 X77.602 Y101.566 E.20796
G1 X76.716 Y101.566 E.02227
G1 X76.716 Y93.294 E.20796
G1 X75.831 Y93.294 E.02227
G1 X75.831 Y101.566 E.20796
G1 X75.573 Y101.566 E.00648
G1 X75.573 Y101.079 E.01223
; WIPE_START
G1 X75.573 Y101.566 E-.18478
G1 X75.831 Y101.566 E-.098
G1 X75.831 Y100.31 E-.47722
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I.748 J.96 P1  F42000
G1 X90.625 Y88.793 Z.7
G1 Z.3
G1 E.8 F1800
G1 F3000
M204 S6000
G1 X90.887 Y88.301 E.01402
G1 X90.887 Y101.566 E.3335
G1 X91.773 Y101.566 E.02227
G1 X91.773 Y87.523 E.35305
G1 X92.658 Y87.523 E.02227
G1 X92.658 Y101.566 E.35305
G1 X93.544 Y101.566 E.02227
M73 P37 R1
G1 X93.544 Y87.523 E.35305
G1 X94.43 Y87.523 E.02227
G1 X94.43 Y101.566 E.35305
G1 X95.315 Y101.566 E.02227
G1 X95.315 Y87.523 E.35305
G1 X95.892 Y87.523 E.01451
M204 S10000
G1 X95.315 Y87.311 F42000
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X95.315 Y81.366 E.14947
G1 X94.43 Y81.366 E.02227
G1 X94.43 Y87.137 E.14511
G1 X93.544 Y87.137 E.02227
G1 X93.544 Y81.366 E.14511
G1 X92.887 Y81.366 E.01651
G1 X92.887 Y78.48 E.07255
G1 X92.658 Y78.48 E.00575
G1 X92.658 Y87.137 E.21766
G1 X91.773 Y87.137 E.02227
G1 X91.773 Y86.265 E.02192
; WIPE_START
G1 X91.773 Y87.137 E-.33132
G1 X92.658 Y87.137 E-.33655
M73 P38 R1
G1 X92.658 Y86.895 E-.09213
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I1.132 J-.447 P1  F42000
G1 X91.773 Y84.653 Z.7
G1 Z.3
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X91.773 Y78.48 E.1552
G1 X90.887 Y78.48 E.02227
G1 X90.887 Y84.964 E.16302
G1 X90.05 Y85.447 E.0243
G1 X90.001 Y85.363 E.00245
G1 X90.001 Y78.306 E.17741
; WIPE_START
G1 X90.001 Y80.306 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-.205 J1.2 P1  F42000
G1 X96.201 Y81.366 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Support transition
G1 F3000
M204 S6000
G1 X96.201 Y101.566 E.50785
G1 X97.087 Y101.566 E.02227
G1 X97.087 Y81.366 E.50785
G1 X97.972 Y81.366 E.02227
G1 X97.972 Y93.112 E.29531
G1 X97.395 Y94.197 E.03091
M204 S10000
G1 X97.395 Y94.628 F42000
M73 P39 R1
G1 F3000
M204 S6000
G1 X97.443 Y94.784 E.00411
G1 X97.972 Y95.066 E.01507
G1 X97.972 Y101.566 E.16341
G1 X98.858 Y101.566 E.02227
G1 X98.858 Y95.537 E.15157
G1 X99.743 Y96.008 E.02522
G1 X99.743 Y101.566 E.13973
G1 X100.629 Y101.566 E.02227
G1 X100.629 Y95.539 E.15152
G1 X101.233 Y94.403 E.03234
M204 S10000
G1 X101.253 Y94.366 F42000
G1 F3000
M204 S6000
G1 X101.515 Y93.873 E.01402
G1 X101.515 Y101.566 E.1934
G1 X102.4 Y101.566 E.02227
G1 X102.4 Y92.207 E.23527
G1 X103.004 Y91.072 E.03234
; WIPE_START
G1 X102.4 Y92.207 E-.48883
G1 X102.4 Y92.921 E-.27117
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I.099 J-1.213 P1  F42000
G1 X98.254 Y92.582 Z.7
G1 Z.3
G1 E.8 F1800
G1 F3000
M204 S6000
G1 X98.658 Y91.821 E.02166
G1 X98.658 Y90.023 E.04521
G1 X98.858 Y90.023 E.00501
G1 X98.858 Y81.366 E.21766
G1 X99.743 Y81.366 E.02227
G1 X99.743 Y89.78 E.21156
G1 X99.615 Y90.023 E.00691
G1 X99.051 Y90.023 E.01418
M204 S10000
M73 P40 R1
G1 X100.025 Y89.25 F42000
G1 F3000
M204 S6000
G1 X100.292 Y88.748 E.01431
G1 X100.629 Y88.645 E.00885
G1 X100.629 Y81.366 E.18302
G1 X101.515 Y81.366 E.02227
G1 X101.515 Y89.038 E.19289
G1 X102.4 Y89.509 E.02522
G1 X102.4 Y81.366 E.20473
G1 X103.286 Y81.366 E.02227
G1 X103.286 Y90.111 E.21986
G3 X103.286 Y90.542 I-.216 J.216 E.01204
G1 X103.286 Y101.566 E.27715
G1 X104.172 Y101.566 E.02227
G1 X104.172 Y81.366 E.50785
G1 X104.43 Y81.366 E.00648
G1 X104.43 Y81.852 E.01223
; WIPE_START
G1 X104.43 Y81.366 E-.1848
G1 X104.172 Y81.366 E-.09801
G1 X104.172 Y82.621 E-.47719
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-1.143 J-.417 P1  F42000
G1 X99.763 Y94.712 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2961.771
M204 S6000
G1 X99.464 Y94.553 E.00917
G1 F960
G1 X98.84 Y94.221 E.01916
G1 F1617.919
G1 X98.722 Y94.158 E.00361
M73 P41 R1
G1 F4615.324
G1 X98.91 Y93.805 E.01084
G1 F9148.73
G1 X99.098 Y93.452 E.01084
G1 F10826.06
G1 X99.285 Y93.099 E.01084
G1 X100.918 Y90.027 E.09426
G1 X101.959 Y90.581 E.03194
G1 X99.791 Y94.659 E.12515
M204 S250
G1 X99.928 Y95.254 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3843.032
M204 S5000
G1 X99.45 Y94.999 E.01361
M106 S255
G1 F600
G1 X99.081 Y94.803 E.01051
M106 S198.9
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X98.706 Y94.603 E.01153
M106 S198.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X98.18 Y94.324 E.01496
M106 S198.9
G1 F993.661
G1 X98.228 Y94.234 E.00255
G1 F3508.808
G1 X98.416 Y93.881 E.01006
G1 F7559.956
G1 X98.603 Y93.528 E.01006
G1 F11668.197
G1 X98.791 Y93.175 E.01006
G1 X100.753 Y89.485 E.10506
G1 X101.15 Y89.697 E.01131
G1 X102.501 Y90.415 E.03847
G1 X99.957 Y95.201 E.13627
; WIPE_START
M204 S6000
G1 X99.45 Y94.999 E-.20692
G1 X99.081 Y94.803 E-.15881
G1 X98.706 Y94.603 E-.16175
G1 X98.18 Y94.324 E-.22618
G1 X98.188 Y94.309 E-.00634
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

G1 X99.261 Y93.993
G1 Z.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415846
G1 F11795.235
M204 S6000
G1 X99.598 Y94.173 E.00949
G1 X101.42 Y90.745 E.09654
G1 X101.083 Y90.566 E.00949
G1 X99.289 Y93.94 E.09504
; WIPE_START
G1 X100.228 Y92.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I.328 J-1.172 P1  F42000
G1 X89.167 Y89.078 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X88.127 Y88.525 E.03194
G1 X88.614 Y87.608 E.02813
G1 X90.245 Y86.666 E.05104
G1 X90.38 Y86.797 E.00509
G1 X89.196 Y89.025 E.06838
M204 S250
G1 X89.333 Y89.62 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X87.585 Y88.69 E.04978
G1 X88.314 Y87.319 E.03906
G1 X91.55 Y85.45 E.09394
G1 X89.361 Y89.567 E.11722
; WIPE_START
M204 S6000
G1 X87.585 Y88.69 E-.75275
G1 X87.594 Y88.673 E-.00725
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.003 Y88.539 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415846
G1 F11795.235
M204 S6000
G1 X89.536 Y87.536 E.02824
G1 X88.912 Y87.896 E.01791
G1 X88.666 Y88.36 E.01306
G1 X88.95 Y88.511 E.008
; CHANGE_LAYER
; Z_HEIGHT: 0.46
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11795.235
G1 X88.666 Y88.36 E-.12218
G1 X88.912 Y87.896 E-.19955
G1 X89.536 Y87.536 E-.27358
G1 X89.332 Y87.919 E-.1647
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/7
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.7 I-.974 J.73 P1  F42000
G1 X90.246 Y89.137 Z.7
G1 Z.46
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
M204 S6000
G1 X100.086 Y89.137 E.24739
M73 P42 R1
G1 X99.615 Y90.023 E.02522
G1 X89.971 Y90.023 E.24245
G1 X89.793 Y90.357 E.00952
G1 X89.364 Y90.489 E.0113
G1 X88.487 Y90.023 E.02495
G1 X78.835 Y90.023 E.24267
G1 X84.23 Y90.023 E.13563
G1 X84.23 Y89.137 E.02226
G1 X86.843 Y89.137 E.06571
G1 X86.716 Y88.721 E.01094
G1 X86.966 Y88.251 E.01337
G1 X84.23 Y88.251 E.06878
G1 X84.23 Y87.366 E.02227
G1 X87.633 Y87.366 E.08556
; WIPE_START
G1 X85.633 Y87.366 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I.651 J1.028 P1  F42000
G1 X89.828 Y84.709 Z.86
G1 Z.46
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X91.676 Y84.709 E.04647
M204 S10000
G1 X90.001 Y81.173 F42000
; FEATURE: Support
G1 F9000
M204 S6000
G1 X90.001 Y80.534 E.01606
G1 X90.481 Y81.366 E.02414
G1 X90.001 Y81.366 E.01207
G1 X90.001 Y83.866 E.06285
G1 X91.925 Y83.866 E.04836
G1 X90.578 Y81.533 E.06772
; WIPE_START
G1 X91.578 Y83.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I1.07 J.579 P1  F42000
G1 X92.501 Y81.559 Z.86
G1 Z.46
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X92.501 Y81.693 E.00337
G1 X92.312 Y81.366 E.00949
G1 X92.501 Y81.366 E.00475
G1 X92.501 Y80.98 E.0097
G1 X92.887 Y80.98 E.0097
G1 X92.887 Y78.48 E.06285
G1 X90.001 Y78.48 E.07255
; WIPE_START
G1 X92.001 Y78.48 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I-.514 J-1.103 P1  F42000
G1 X78.632 Y84.709 Z.86
G1 Z.46
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X75.573 Y84.709 E.07692
G1 X75.573 Y85.594 E.02227
G1 X78.632 Y85.594 E.07692
; WIPE_START
M73 P43 R1
G1 X76.632 Y85.594 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I-1.122 J.472 P1  F42000
G1 X78.123 Y89.137 Z.86
G1 Z.46
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X78.459 Y89.137 E.00843
G1 X78.459 Y88.251 E.02227
G1 X77.812 Y88.251 E.01625
G1 X77.301 Y87.366 E.02571
G1 X78.146 Y87.366 E.02124
G1 X77.79 Y87.139 E.01061
G1 X77.72 Y86.821 E.00818
G1 X77.937 Y86.48 E.01017
G1 X75.573 Y86.48 E.05944
G1 X75.573 Y87.366 E.02227
G1 X76.227 Y87.366 E.01645
G1 X75.859 Y87.578 E.01069
G1 X75.775 Y87.893 E.00818
G1 X75.982 Y88.251 E.01042
G1 X75.573 Y88.251 E.01028
G1 X75.573 Y89.137 E.02227
G1 X76.493 Y89.137 E.02314
G1 X77.004 Y90.023 E.02571
G1 X75.573 Y90.023 E.03599
G1 X75.573 Y90.908 E.02227
G1 X77.516 Y90.908 E.04885
G1 X78.027 Y91.794 E.02571
G1 X75.573 Y91.794 E.0617
G1 X75.573 Y92.68 E.02227
G1 X78.538 Y92.68 E.07456
G1 X79.05 Y93.565 E.02571
G1 X75.573 Y93.565 E.08742
G1 X75.573 Y94.451 E.02227
G1 X97.341 Y94.451 E.54728
G1 X97.443 Y94.784 E.00876
G1 X98.482 Y95.337 E.02958
G1 X75.573 Y95.337 E.57596
G1 X75.573 Y96.222 E.02227
G1 X104.43 Y96.222 E.7255
G1 X104.43 Y95.337 E.02227
G1 X100.737 Y95.337 E.09285
M73 P44 R1
G1 X101.208 Y94.451 E.02522
G1 X104.43 Y94.451 E.08101
G1 X104.43 Y93.565 E.02227
G1 X101.678 Y93.565 E.06917
G1 X102.149 Y92.68 E.02522
G1 X104.43 Y92.68 E.05733
G1 X104.43 Y91.794 E.02227
G1 X102.62 Y91.794 E.04549
G1 X103.091 Y90.908 E.02522
G1 X104.43 Y90.908 E.03365
G1 X104.43 Y90.023 E.02227
G1 X103.259 Y90.023 E.02943
G1 X103.238 Y89.954 E.0018
G1 X101.701 Y89.137 E.04377
G1 X104.43 Y89.137 E.0686
G1 X104.43 Y88.251 E.02227
G1 X90.913 Y88.251 E.33983
G1 X91.384 Y87.366 E.02522
G1 X104.43 Y87.366 E.32799
G1 X104.43 Y86.48 E.02227
G1 X91.855 Y86.48 E.31615
G1 X92.326 Y85.594 E.02522
G1 X92.923 Y85.594 E.01501
G1 X92.994 Y85.717 E.00356
G1 X93.308 Y85.801 E.00818
G1 X93.666 Y85.594 E.01039
G1 X104.43 Y85.594 E.27062
G1 X104.43 Y84.709 E.02227
G1 X94.242 Y84.709 E.25613
G1 X93.731 Y83.823 E.02571
G1 X104.43 Y83.823 E.26898
G1 X104.43 Y82.937 E.02227
G1 X93.22 Y82.937 E.28184
M73 P45 R1
G1 X92.887 Y82.361 E.01674
G1 X92.887 Y82.052 E.00777
G1 X104.603 Y82.052 E.29457
; WIPE_START
G1 X102.603 Y82.052 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I-1.12 J-.477 P1  F42000
G1 X98.832 Y90.908 Z.86
G1 Z.46
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X79.346 Y90.908 E.48989
G1 X79.858 Y91.794 E.02571
G1 X98.658 Y91.794 E.47267
G1 X98.202 Y92.68 E.02505
G1 X80.369 Y92.68 E.44834
G3 X80.426 Y93.238 I-.251 J.308 E.01568
G1 X79.86 Y93.565 E.01644
G1 X97.928 Y93.565 E.45425
; WIPE_START
G1 X95.928 Y93.565 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I-.46 J1.127 P1  F42000
G1 X104.603 Y97.108 Z.86
G1 Z.46
G1 E.8 F1800
M73 P46 R1
G1 F4800
M204 S6000
G1 X75.573 Y97.108 E.72987
G1 X75.573 Y97.994 E.02227
G1 X104.43 Y97.994 E.7255
G1 X104.43 Y98.879 E.02227
G1 X75.573 Y98.879 E.7255
G1 X75.573 Y99.765 E.02227
G1 X104.43 Y99.765 E.7255
G1 X104.43 Y100.651 E.02227
G1 X75.573 Y100.651 E.7255
G1 X75.573 Y101.536 E.02227
G1 X104.603 Y101.536 E.72987
; WIPE_START
M73 P47 R1
G1 X102.603 Y101.536 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I1.12 J-.477 P1  F42000
G1 X99.928 Y95.254 Z.86
G1 Z.46
G1 E.8 F1800
; FEATURE: Outer wall
G1 F11668.197
M204 S5000
G1 X98.18 Y94.324 E.04978
G1 X100.753 Y89.485 E.13778
G1 X101.574 Y89.922 E.02338
G1 X102.501 Y90.415 E.0264
G1 X99.957 Y95.201 E.13627
; WIPE_START
M204 S6000
G1 X98.18 Y94.324 E-.75275
G1 X98.189 Y94.307 E-.00726
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

G1 X100.683 Y90.069
G1 Z.46
G1 E.8 F1800
; FEATURE: Top surface
G1 F11668.197
M204 S2000
G1 X101.833 Y91.219 E.0409
G1 X101.644 Y91.575
G1 X100.493 Y90.425 E.0409
G1 X100.304 Y90.781
G1 X101.454 Y91.931 E.0409
G1 X101.265 Y92.288
G1 X100.115 Y91.137 E.0409
G1 X99.925 Y91.493
G1 X101.076 Y92.644 E.0409
G1 X100.887 Y93
G1 X99.736 Y91.849 E.0409
G1 X99.547 Y92.205
G1 X100.697 Y93.356 E.0409
G1 X100.508 Y93.712
G1 X99.357 Y92.561 E.0409
G1 X99.168 Y92.918
G1 X100.319 Y94.068 E.0409
M73 P48 R1
G1 X100.129 Y94.424
G1 X98.979 Y93.274 E.0409
G1 X98.789 Y93.63
G1 X99.94 Y94.78 E.0409
M204 S10000
G1 X99.331 Y94.472 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102633
G1 F18000
M204 S6000
G1 X99.186 Y94.365 E.0008
; LINE_WIDTH: 0.146671
G1 X99.041 Y94.257 E.00132
; LINE_WIDTH: 0.19071
G1 X98.896 Y94.15 E.00184
; LINE_WIDTH: 0.234748
G1 X98.75 Y94.042 E.00236
; LINE_WIDTH: 0.278786
G1 X98.605 Y93.935 E.00288
; WIPE_START
G1 X98.75 Y94.042 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.047 Y90.858 Z.86 F42000
G1 Z.46
G1 E.8 F1800
; LINE_WIDTH: 0.383604
G1 F12884.105
M204 S6000
G1 X101.896 Y90.746 E.00428
; LINE_WIDTH: 0.33699
G1 F14868.482
G1 X101.745 Y90.634 E.00371
; LINE_WIDTH: 0.290376
G1 F17575.403
G1 X101.594 Y90.522 E.00314
; LINE_WIDTH: 0.243762
G1 F18000
G1 X101.443 Y90.411 E.00257
; LINE_WIDTH: 0.197148
G1 X101.292 Y90.299 E.00199
; LINE_WIDTH: 0.150534
G1 X101.141 Y90.187 E.00142
; LINE_WIDTH: 0.10392
G1 X100.99 Y90.075 E.00085
; WIPE_START
G1 X101.141 Y90.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I.389 J-1.153 P1  F42000
G1 X89.904 Y86.401 Z.86
G1 Z.46
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X91.55 Y85.45 E.04778
G1 X89.333 Y89.62 E.11872
G1 X87.585 Y88.69 E.04978
G1 X88.314 Y87.319 E.03906
G1 X88.536 Y87.191 E.00644
G1 X88.882 Y86.991 E.01006
G1 F7241.769
G1 X89.229 Y86.791 E.01006
G1 F3293.127
G1 X89.575 Y86.591 E.01006
G1 F880.484
G1 X89.555 Y86.555 E.00103
G1 F720
G1 X89.37 Y86.235 E.00928
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X86.875 Y81.914 E.13521
G1 X87.204 Y81.724 E.0103
G1 X89.124 Y85.05 E.10405
M106 S201.45
M106 S255
G1 F3000
G1 X89.699 Y86.045 E.03116
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
G1 X89.874 Y86.349 E.0088
M204 S10000
M73 P49 R1
G1 X90.13 Y86.607 F42000
; FEATURE: Top surface
G1 F11668.197
M204 S2000
G1 X90.499 Y86.975 E.01311
G1 X90.31 Y87.331
G1 X89.784 Y86.806 E.01867
G1 X89.439 Y87.006
G1 X90.12 Y87.687 E.02423
G1 X89.931 Y88.044
G1 X89.035 Y87.147 E.03186
G1 X88.689 Y87.347
G1 X89.742 Y88.4 E.03742
G1 X89.552 Y88.756
G1 X88.402 Y87.605 E.0409
G1 X88.213 Y87.961
G1 X89.363 Y89.112 E.0409
M204 S10000
G1 X88.849 Y88.899 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.101751
G1 F18000
M204 S6000
G1 X88.711 Y88.796 E.00076
; LINE_WIDTH: 0.144025
G1 X88.572 Y88.694 E.00123
; LINE_WIDTH: 0.1863
G1 X88.434 Y88.592 E.00171
; LINE_WIDTH: 0.228574
G1 X88.296 Y88.489 E.00218
; LINE_WIDTH: 0.270848
G1 X88.157 Y88.387 E.00265
; LINE_WIDTH: 0.313123
G1 F16141.38
G1 X88.019 Y88.284 E.00313
M204 S10000
G1 X88.551 Y87.44 F42000
; LINE_WIDTH: 0.0899462
G1 F18000
M204 S6000
G2 X88.435 Y87.545 I.066 J.191 E.00058
M204 S10000
G1 X88.619 Y87.388 F42000
; LINE_WIDTH: 0.087913
G1 F18000
M204 S6000
G1 X88.551 Y87.44 E.0003
G1 X88.555 Y87.481 E.00014
M204 S10000
G1 X89.369 Y87.047 F42000
; LINE_WIDTH: 0.0885348
G1 F18000
M204 S6000
G1 X89.302 Y87.098 E.0003
G3 X89.224 Y87.016 I.071 J-.146 E.00041
M204 S10000
G1 X89.28 Y87.029 F42000
; LINE_WIDTH: 0.0989068
G1 F18000
M204 S6000
G1 X90.766 Y86.172 E.00722
G1 X90.801 Y86.169 E.00015
; LINE_WIDTH: 0.146776
G1 X90.837 Y86.167 E.00026
; LINE_WIDTH: 0.174632
G1 X90.929 Y86.192 E.00087
; CHANGE_LAYER
; Z_HEIGHT: 0.62
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X90.837 Y86.167 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/7
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.86 I1.035 J.639 P1  F42000
G1 X91.773 Y84.653 Z.86
G1 Z.62
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
M204 S6000
G1 X91.773 Y84.251 E.0101
G1 X90.887 Y84.251 E.02227
G1 X90.887 Y85.137 E.02227
G1 X90.255 Y85.502 E.01835
G1 X90.001 Y85.063 E.01275
G1 X90.001 Y84.078 E.02477
; WIPE_START
G1 X90.001 Y85.063 E-.37442
G1 X90.255 Y85.502 E-.19268
G1 X90.694 Y85.248 E-.1929
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I.398 J1.15 P1  F42000
G1 X102.4 Y81.192 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X102.4 Y89.509 E.2091
G1 X101.515 Y89.038 E.02522
G1 X101.515 Y81.366 E.1929
G1 X100.629 Y81.366 E.02227
G1 X100.629 Y88.645 E.18302
G1 X100.292 Y88.748 E.00885
G1 X99.8 Y89.675 E.02639
G3 X99.784 Y90.023 I-.182 J.166 E.00973
G1 X99.743 Y90.023 E.00103
G1 X99.743 Y81.366 E.21766
G1 X98.858 Y81.366 E.02227
G1 X98.858 Y90.023 E.21766
G1 X98.658 Y90.023 E.00501
G1 X98.658 Y92.141 E.05324
M73 P50 R1
G1 X97.972 Y93.376 E.03554
G1 X97.972 Y81.366 E.30197
G1 X97.087 Y81.366 E.02227
G1 X97.087 Y101.566 E.50785
G1 X97.972 Y101.566 E.02227
G1 X97.972 Y95.066 E.16341
G1 X98.858 Y95.537 E.02522
G1 X98.858 Y101.566 E.15157
G1 X99.743 Y101.566 E.02227
G1 X99.743 Y96.008 E.13973
G1 X99.959 Y96.122 E.00613
G1 X100.389 Y95.991 E.0113
G1 X100.629 Y95.539 E.01287
G1 X100.629 Y101.566 E.15152
G1 X101.515 Y101.566 E.02227
G1 X101.515 Y93.554 E.20143
G1 X102.4 Y91.888 E.04743
G1 X102.4 Y101.566 E.24331
G1 X103.286 Y101.566 E.02227
G1 X103.286 Y81.366 E.50785
G1 X104.172 Y81.366 E.02227
G1 X104.172 Y101.739 E.51222
; WIPE_START
G1 X104.172 Y99.739 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P51 R1
G3 Z1.02 I-.296 J-1.18 P1  F42000
G1 X96.201 Y101.739 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X96.201 Y81.366 E.51222
G1 X95.315 Y81.366 E.02227
G1 X95.315 Y101.566 E.50785
G1 X94.43 Y101.566 E.02227
G1 X94.43 Y81.366 E.50785
G1 X93.544 Y81.366 E.02227
G1 X93.544 Y83.499 E.05364
G1 X94.367 Y84.924 E.04137
G3 X93.993 Y85.405 I-.427 J.054 E.01701
G1 X93.544 Y85.665 E.01304
G1 X93.544 Y101.566 E.39976
G1 X92.658 Y101.566 E.02227
G1 X92.658 Y85.136 E.41306
G1 X92.612 Y85.056 E.00232
G1 X92.282 Y85.678 E.01769
G1 X92.079 Y85.74 E.00533
G1 X91.773 Y86.316 E.0164
G1 X91.773 Y101.566 E.38341
G1 X90.887 Y101.566 E.02227
G1 X90.887 Y87.981 E.34153
M73 P52 R1
G1 X90.224 Y89.228 E.03549
G1 X90.286 Y89.43 E.00533
G1 X90.001 Y89.966 E.01526
G1 X90.001 Y101.566 E.29162
G1 X89.116 Y101.566 E.02227
G1 X89.116 Y90.357 E.2818
G1 X88.23 Y89.886 E.02522
G1 X88.23 Y101.566 E.29364
G1 X87.344 Y101.566 E.02227
G1 X87.344 Y89.415 E.30548
G1 X86.847 Y89.151 E.01415
G1 X86.716 Y88.721 E.0113
G1 X87.209 Y87.794 E.02639
G1 X87.344 Y87.753 E.00356
G1 X87.344 Y87.137 E.01548
G1 X86.459 Y87.137 E.02227
G1 X86.459 Y101.566 E.36276
G1 X85.573 Y101.566 E.02227
G1 X85.573 Y87.137 E.36276
G1 X84.687 Y87.137 E.02227
G1 X84.687 Y101.566 E.36276
G1 X83.802 Y101.566 E.02227
G1 X83.802 Y90.023 E.29021
G1 X82.916 Y90.023 E.02227
M73 P53 R1
G1 X82.916 Y101.566 E.29021
G1 X82.03 Y101.566 E.02227
G1 X82.03 Y90.023 E.29021
G1 X81.145 Y90.023 E.02227
G1 X81.145 Y101.566 E.29021
G1 X80.259 Y101.566 E.02227
G1 X80.259 Y93.335 E.20693
G1 X79.451 Y93.801 E.02344
G1 X79.373 Y93.78 E.00203
G1 X79.373 Y101.566 E.19574
G1 X78.488 Y101.566 E.02227
G1 X78.488 Y92.592 E.22561
G1 X77.602 Y91.058 E.04453
G1 X77.602 Y101.566 E.26418
G1 X76.716 Y101.566 E.02227
G1 X76.716 Y89.177 E.31147
; WIPE_START
G1 X76.716 Y91.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.165 J.351 P1  F42000
G1 X77.602 Y88.234 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X77.602 Y84.251 E.10013
G1 X76.716 Y84.251 E.02227
G1 X76.716 Y87.284 E.07624
; WIPE_START
G1 X76.716 Y85.284 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P54 R1
G3 Z1.02 I.981 J-.72 P1  F42000
G1 X75.831 Y84.078 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X75.831 Y101.739 E.44403
; WIPE_START
G1 X75.831 Y99.739 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.024 J.657 P1  F42000
G1 X80.259 Y92.836 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X80.259 Y90.023 E.07073
G1 X79.373 Y90.023 E.02227
G1 X79.373 Y91.302 E.03217
; WIPE_START
G1 X79.373 Y90.023 E-.48619
G1 X80.094 Y90.023 E-.27381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-.312 J1.176 P1  F42000
G1 X99.937 Y95.282 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F12000
M204 S5000
G1 X98.151 Y94.333 E.04525
G1 X98.256 Y94.136 E.00498
G1 X99.467 Y94.78 E.03068
G1 X100.042 Y95.086 E.01457
G1 X99.965 Y95.229 E.00363
; WIPE_START
M204 S6000
G1 X98.172 Y94.343 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.744 Y89.457 Z1.02 F42000
G1 Z.62
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X102.008 Y90.129 E.03202
G1 X102.53 Y90.406 E.01323
G1 X102.425 Y90.603 E.00498
G1 X100.64 Y89.653 E.04525
G1 X100.716 Y89.51 E.00363
; WIPE_START
M204 S6000
G1 X102.008 Y90.129 E-.54434
G1 X102.509 Y90.395 E-.21566
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I.609 J-1.054 P1  F42000
G1 X93.329 Y85.093 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X90.339 Y79.914 E.16204
G1 X90.668 Y79.724 E.0103
G1 X91.524 Y81.207 E.04639
M73 P55 R1
G1 X93.658 Y84.903 E.11565
G1 X93.381 Y85.063 E.00867
M106 S201.45
; WIPE_START
M204 S6000
G1 X92.364 Y83.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-1.013 J-.675 P1  F42000
G1 X89.865 Y87.093 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X86.875 Y81.914 E.15035
G1 X87.204 Y81.724 E.00955
G1 X88.899 Y84.66 E.08523
G1 X90.194 Y86.903 E.06512
G1 X89.917 Y87.063 E.00804
; WIPE_START
M204 S6000
G1 X88.9 Y85.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.556 Y88.699 Z1.02 F42000
G1 Z.62
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F12000
M204 S5000
G1 X87.66 Y88.503 E.00498
G1 X88.871 Y89.146 E.03068
G1 X89.446 Y89.452 E.01457
G1 X89.342 Y89.649 E.00498
G1 X87.609 Y88.727 E.04391
; WIPE_START
M204 S6000
G1 X87.66 Y88.503 E-.08755
G1 X88.871 Y89.146 E-.52106
M73 P56 R1
G1 X89.223 Y89.333 E-.15139
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I.309 J-1.177 P1  F42000
G1 X78.816 Y86.597 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X78.587 Y86.957 E.01156
G1 X78.399 Y86.837 E.00603
G1 X78.552 Y86.597 E.00772
G1 X78.756 Y86.597 E.00552
M106 S201.45
; WIPE_START
M204 S6000
G1 X78.587 Y86.957 E-.27255
G1 X78.399 Y86.837 E-.15248
G1 X78.552 Y86.597 E-.19529
G1 X78.756 Y86.597 E-.13967
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-1.201 J.199 P1  F42000
G1 X79.802 Y92.903 Z1.02
G1 Z.62
G1 E.8 F1800
M106 S255
G1 F600
M204 S5000
G1 X79.473 Y93.093 E.0103
G1 X76.483 Y87.914 E.16204
G1 X76.812 Y87.724 E.0103
G1 X76.865 Y87.816 E.00287
G1 X79.772 Y92.851 E.15755
M106 S201.45
; WIPE_START
M204 S6000
G1 X79.473 Y93.093 E-.1462
G1 X78.665 Y91.694 E-.6138
; WIPE_END
M73 P57 R1
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
M106 S204
; OBJECT_ID: 15
G1 X99.937 Y95.282 F42000
G1 Z.78
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F1200
M204 S5000
G1 X98.151 Y94.333 E.04525
G1 X98.256 Y94.136 E.00498
G1 X98.619 Y94.329 E.0092
G1 X100.042 Y95.086 E.03605
G1 X99.965 Y95.229 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X98.172 Y94.343 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.64 Y89.653 Z1.18 F42000
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X100.744 Y89.457 E.00498
G1 X102.432 Y90.354 E.04276
G1 X102.53 Y90.406 E.00249
G1 X102.425 Y90.603 E.00498
G1 X100.693 Y89.681 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X100.744 Y89.457 E-.08755
G1 X102.307 Y90.287 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I.61 J-1.053 P1  F42000
G1 X93.329 Y85.093 Z1.18
G1 Z.78
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X90.339 Y79.914 E.15035
G1 X90.668 Y79.724 E.00955
G1 X92.806 Y83.426 E.10748
G1 X93.658 Y84.903 E.04287
G1 X93.381 Y85.063 E.00805
; WIPE_START
M73 P58 R1
G1 F11668.197
M204 S6000
G1 X92.364 Y83.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I-1.013 J-.675 P1  F42000
G1 X89.865 Y87.093 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X86.875 Y81.914 E.15035
G1 X87.204 Y81.724 E.00955
G1 X87.871 Y82.878 E.03351
G1 X90.194 Y86.903 E.11684
G1 X89.917 Y87.063 E.00804
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.9 Y85.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.556 Y88.699 Z1.18 F42000
G1 Z.78
G1 E.8 F1800
; LINE_WIDTH: 0.377567
G1 F1200
M204 S5000
G1 X87.66 Y88.503 E.00498
G1 X88.024 Y88.696 E.0092
G1 X89.446 Y89.452 E.03605
G1 X89.342 Y89.649 E.00498
G1 X87.609 Y88.727 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X87.66 Y88.503 E-.08755
G1 X88.024 Y88.696 E-.15627
G1 X89.223 Y89.333 E-.51619
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I.265 J-1.188 P1  F42000
G1 X78.587 Y86.957 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X78.399 Y86.837 E.00498
G1 X78.552 Y86.597 E.00637
G1 X78.816 Y86.597 E.0059
G1 X78.64 Y86.873 E.00733
G1 X78.619 Y86.906 E.00087
; WIPE_START
G1 F12000
M204 S6000
G1 X78.399 Y86.837 E-.15284
G1 X78.552 Y86.597 E-.18898
G1 X78.816 Y86.597 E-.17497
G1 X78.64 Y86.873 E-.21729
G1 X78.619 Y86.906 E-.02592
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P59 R1
G3 Z1.18 I-1.206 J.166 P1  F42000
G1 X79.473 Y93.093 Z1.18
G1 Z.78
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X76.483 Y87.914 E.15035
G1 X76.812 Y87.724 E.00955
G1 X77.075 Y88.18 E.01325
G1 X79.802 Y92.903 E.1371
G1 X79.525 Y93.063 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X78.507 Y91.341 E-.76
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
; layer num/total_layer_count: 6/7
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S186.15
; OBJECT_ID: 15
G1 X100.187 Y95.641 F42000
G1 Z.94
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
M204 S5000
G1 X101.432 Y96.303 E.03823
M106 S186.15
M106 S255
G1 F600
G1 X103.006 Y93.344 E.09082
G1 X103.195 Y93.391 E.00528
G1 X103.196 Y99.998 E.17903
G1 X100.167 Y99.998 E.08207
G1 X100.167 Y99.398 E.01626
M73 P60 R1
G1 X97.046 Y99.398 E.08458
G1 X97.046 Y99.998 E.01626
G1 X81.167 Y99.998 E.43027
G1 X81.167 Y99.398 E.01626
G1 X78.046 Y99.398 E.08458
M73 P61 R1
G1 X78.046 Y99.998 E.01626
G1 X77.017 Y99.998 E.02787
G1 X77.017 Y92.45 E.20451
G1 X77.202 Y92.401 E.00519
G1 X77.98 Y93.748 E.04215
M73 P62 R1
G1 X79.028 Y93.142 E.03281
M106 S186.15
; FEATURE: Inner wall
G1 F720
M204 S6000
G1 X79.359 Y92.951 E.01036
G1 F1755.732
G1 X79.736 Y92.734 E.01179
M106 S255
G1 F600
G1 X80.067 Y92.542 E.01036
M106 S186.15
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X80.475 Y92.307 E.01275
G2 X85.549 Y89.378 I1.126 J-3.909 E.17724
G1 X86.919 Y88.586 E.04289
G1 X87.119 Y88.693 E.00613
M106 S186.15
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X89.591 Y90.007 E.07587
M106 S186.15
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X97.715 Y94.326 E.24929
M106 S186.15
; FEATURE: Inner wall
M106 S255
M73 P63 R1
G1 F600
M204 S6000
G1 X100.134 Y95.613 E.07425
M106 S186.15
M204 S250
G1 X100.375 Y95.287 F42000
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X101.267 Y95.761 E.02737
M106 S186.15
M106 S255
G1 F600
G1 X103.595 Y91.382 E.1344
G1 X103.596 Y100.398 E.24432
G1 X99.766 Y100.398 E.10377
G1 X99.766 Y99.798 E.01626
M73 P64 R1
G1 X97.447 Y99.798 E.06286
G1 X97.447 Y100.398 E.01626
G1 X80.766 Y100.398 E.45198
G1 X80.766 Y99.798 E.01626
G1 X78.446 Y99.798 E.06286
M73 P65 R1
G1 X78.446 Y100.398 E.01626
G1 X76.617 Y100.398 E.04957
G1 X76.616 Y90.585 E.2659
G1 X78.126 Y93.201 E.08182
G1 X78.828 Y92.795 E.02195
M106 S186.15
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P66 R1
G1 F720
G1 X79.147 Y92.611 E.00928
G1 F1834.97
G1 X79.547 Y92.38 E.01162
M106 S255
G1 F600
G1 X79.867 Y92.195 E.00928
M106 S186.15
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X80.427 Y91.872 E.01753
G2 X85.196 Y89.119 I1.175 J-3.472 E.1688
G1 X86.911 Y88.128 E.05368
G1 X87.307 Y88.339 E.01215
M106 S186.15
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P66 R0
G1 F720
M73 P67 R0
G1 X87.633 Y88.512 E.00928
G1 F2975.226
G1 X87.986 Y88.7 E.01006
G1 F6766.451
G1 X88.339 Y88.888 E.01006
G1 F9655.548
G1 X88.693 Y89.075 E.01006
G1 F7092.722
G1 X89.101 Y89.292 E.01162
G1 F2725.645
G1 X89.454 Y89.48 E.01006
M106 S255
G1 F600
G1 X89.78 Y89.653 E.00928
M106 S186.15
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X97.903 Y93.973 E.24929
M106 S186.15
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X98.228 Y94.146 E.00928
M106 S186.15
G1 F2725.645
G1 X98.582 Y94.334 E.01006
G1 F6387.29
G1 X98.935 Y94.521 E.01006
G1 F9201.612
G1 X99.288 Y94.709 E.01006
G1 F7492.141
G1 X99.696 Y94.926 E.01162
G1 F2975.226
G1 X100.049 Y95.114 E.01006
G1 F720
G1 X100.322 Y95.259 E.00777
; WIPE_START
M204 S6000
G1 X101.267 Y95.761 E-.4066
G1 X101.703 Y94.94 E-.3534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I1.192 J-.247 P1  F42000
G1 X100.494 Y89.098 Z1.34
G1 Z.94
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X93.743 Y85.508 E.20721
G1 X93.79 Y85.319 E.00528
G1 X96.017 Y85.319 E.06036
G1 X96.017 Y84.119 E.03252
G1 X97.196 Y84.119 E.03194
M73 P68 R0
G1 X97.196 Y85.319 E.03252
G1 X100.217 Y85.319 E.08187
G1 X100.217 Y83.919 E.03794
G1 X100.996 Y83.919 E.0211
G1 X100.996 Y85.319 E.03793
M106 S186.15
M106 S255

G1 X103.194 Y85.32 E.05956
G1 X103.194 Y90.534 E.14128
G1 X102.967 Y90.413 E.00699
M106 S186.15
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X100.547 Y89.126 E.07425
M106 S186.15
; WIPE_START
M73 P69 R0
G1 X98.781 Y88.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I.613 J-1.051 P1  F42000
G1 X93.181 Y84.918 Z1.34
G1 Z.94
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3765.458
M204 S5000
G1 X93.713 Y84.918 E.01338
M106 S255
G1 F600
G1 X94.141 Y84.918 E.01075
M106 S186.15
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X95.616 Y84.918 E.03999
G1 X95.616 Y83.718 E.03252
G1 X97.597 Y83.718 E.05365
G1 X97.597 Y84.918 E.03252
G1 X99.816 Y84.918 E.06016
G1 X99.816 Y83.518 E.03794
G1 X101.397 Y83.518 E.04281
G1 X101.397 Y84.918 E.03793
M106 S186.15
M106 S255

G1 X103.594 Y84.919 E.05956
M73 P70 R0
G1 X103.595 Y91.201 E.1702
G1 X102.779 Y90.766 E.02506
M106 S186.15
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
G1 X102.453 Y90.593 E.00928
G1 F2975.226
G1 X102.1 Y90.405 E.01006
G1 F6766.451
G1 X101.746 Y90.218 E.01006
G1 F9655.576
G1 X101.393 Y90.03 E.01006
G1 F7491.979
G1 X100.985 Y89.813 E.01162
G1 F2975.226
G1 X100.632 Y89.625 E.01006
G1 F720
G1 X100.306 Y89.452 E.00928
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X92.183 Y85.133 E.24929
M106 S186.15
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X92.14 Y85.11 E.00123
G1 X92.22 Y85.063 E.00232
M106 S186.15
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X92.597 Y84.846 E.01178
G1 X92.597 Y84.918 E.00196
G1 X92.755 Y84.918 E.0043
M106 S186.15
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X93.121 Y84.918 E.0092
M106 S186.15
; WIPE_START
M204 S6000
G1 X93.713 Y84.918 E-.22502
G1 X94.141 Y84.918 E-.16242
G1 X95.121 Y84.918 E-.37257
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

G1 X94.428 Y85.486
G1 Z.94
M73 P71 R0
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.421226
M106 S255
G1 F3000
M204 S6000
G1 X102.854 Y89.966 E.24068
G1 X102.854 Y89.528 E.01105
G1 X95.578 Y85.66 E.20782
G1 X96.358 Y85.66 E.01965
G1 X96.358 Y85.636 E.0006
G1 X102.854 Y89.09 E.18556
G1 X102.854 Y88.652 E.01105
G1 X96.358 Y85.198 E.18555
G1 X96.358 Y84.759 E.01105
G1 X96.855 Y85.024 E.01421
G1 X96.855 Y84.586 E.01105
G1 X96.292 Y84.286 E.0161
M106 S186.15
; WIPE_START
G1 X96.855 Y84.586 E-.24261
G1 X96.855 Y85.024 E-.16651
G1 X96.358 Y84.759 E-.21413
G1 X96.358 Y85.119 E-.13675
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I-.315 J1.175 P1  F42000
G1 X97.724 Y85.486 Z1.34
G1 Z.94
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X102.854 Y88.213 E.14652
G1 X102.854 Y87.775 E.01105
G1 X98.875 Y85.66 E.11365
G1 X99.699 Y85.66 E.02079
G1 X102.853 Y87.337 E.09011
G1 X102.853 Y86.899 E.01105
G1 X100.914 Y85.867 E.05541
G1 X101.146 Y85.867 E.00586
G1 X101.146 Y85.659 E.00524
G1 X101.347 Y85.66 E.00507
G1 X102.853 Y86.46 E.04303
G1 X102.853 Y86.022 E.01105
G1 X101.845 Y85.486 E.0288
M106 S186.15
; WIPE_START
G1 X102.853 Y86.022 E-.43389
G1 X102.853 Y86.46 E-.16652
G1 X102.483 Y86.263 E-.15959
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I.445 J-1.133 P1  F42000
G1 X100.607 Y85.527 Z1.34
G1 Z.94
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397366
G1 F12395.67
M204 S6000
M73 P72 R0
G1 X100.607 Y84.127 E.03313
; WIPE_START
G1 X100.607 Y85.527 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I-1.175 J.317 P1  F42000
G1 X103.028 Y94.501 Z1.34
G1 Z.94
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.430566
M106 S255
G1 F3000
M204 S6000
G1 X102.776 Y94.501 E.0065
G1 X102.566 Y94.897 E.01159
G1 X102.855 Y94.897 E.00746
G1 X102.855 Y95.293 E.01023
G1 X102.355 Y95.293 E.01291
G1 X102.144 Y95.69 E.01159
G1 X102.855 Y95.69 E.01835
G1 X102.855 Y96.086 E.01023
G1 X101.934 Y96.086 E.02379
G1 X101.723 Y96.482 E.01159
G1 X102.855 Y96.482 E.02924
G1 X102.855 Y96.878 E.01023
G1 X77.358 Y96.878 E.65859
G1 X77.358 Y97.274 E.01023
G1 X102.855 Y97.274 E.6586
G1 X102.855 Y97.671 E.01023
G1 X77.358 Y97.671 E.6586
G1 X77.358 Y98.067 E.01023
G1 X102.855 Y98.067 E.6586
M73 P73 R0
G1 X102.855 Y98.463 E.01023
G1 X77.184 Y98.463 E.66308
M106 S186.15
; WIPE_START
G1 X79.184 Y98.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I-.622 J-1.046 P1  F42000
G1 X77.184 Y99.652 Z1.34
G1 Z.94
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X77.705 Y99.652 E.01346
G1 X77.705 Y99.256 E.01023
G1 X77.358 Y99.256 E.00898
G1 X77.358 Y98.859 E.01023
G1 X102.855 Y98.859 E.6586
G1 X102.855 Y99.256 E.01023
G1 X100.508 Y99.256 E.06063
M73 P74 R0
G1 X100.508 Y99.652 E.01023
G1 X103.029 Y99.652 E.06512
M106 S186.15
; WIPE_START
G1 X101.029 Y99.652 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I.755 J-.955 P1  F42000
G1 X88 Y89.35 Z1.34
G1 Z.94
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X86.278 Y89.35 E.04446
G1 X85.835 Y89.606 E.01323
G1 X85.791 Y89.746 E.00379
G1 X88.375 Y89.746 E.06674
G1 X89.12 Y90.142 E.0218
G1 X85.647 Y90.142 E.08972
G3 X85.448 Y90.539 I-1.71 J-.611 E.01148
G1 X89.865 Y90.539 E.11411
G1 X90.611 Y90.935 E.0218
G1 X85.21 Y90.935 E.1395
G3 X84.893 Y91.331 I-2.058 J-1.324 E.01314
G1 X91.356 Y91.331 E.16695
G1 X92.101 Y91.727 E.0218
G1 X84.484 Y91.727 E.19675
G3 X83.958 Y92.123 I-1.921 J-2.003 E.01705
G1 X92.846 Y92.123 E.22959
G1 X93.591 Y92.52 E.0218
G1 X83.168 Y92.52 E.26923
G3 X81.756 Y92.808 I-1.626 J-4.362 E.03738
G3 X80.525 Y92.671 I-.104 J-4.677 E.03208
M73 P75 R0
G1 X80.102 Y92.916 E.01263
G1 X94.337 Y92.916 E.36769
G1 X95.082 Y93.312 E.0218
G1 X79.415 Y93.312 E.40467
G1 X78.729 Y93.708 E.02047
G1 X95.827 Y93.708 E.44164
G1 X96.572 Y94.105 E.0218
G1 X77.358 Y94.105 E.49632
G1 X77.358 Y94.501 E.01023
G1 X97.317 Y94.501 E.51556
G1 X98.063 Y94.897 E.0218
G1 X77.358 Y94.897 E.53481
M73 P76 R0
G1 X77.358 Y95.293 E.01023
G1 X98.808 Y95.293 E.55406
G1 X99.553 Y95.69 E.0218
G1 X77.358 Y95.69 E.57331
G1 X77.358 Y96.086 E.01023
G1 X100.298 Y96.086 E.59256
G1 X101.043 Y96.482 E.0218
G1 X77.184 Y96.482 E.61629
M106 S186.15
; WIPE_START
M73 P77 R0
G1 X79.184 Y96.482 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I.987 J-.712 P1  F42000
G1 X77.184 Y93.708 Z1.34
G1 Z.94
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X77.764 Y93.708 E.01498
M106 S186.15
; WIPE_START
G1 X77.184 Y93.708 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I-.974 J.729 P1  F42000
G1 X81.334 Y99.256 Z1.34
G1 Z.94
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X96.705 Y99.256 E.39704
G1 X96.705 Y99.652 E.01023
G1 X81.334 Y99.652 E.39704
M106 S186.15
; WIPE_START
G1 X83.334 Y99.652 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P78 R0
G3 Z1.34 I1.074 J-.573 P1  F42000
G1 X77.017 Y87.813 Z1.34
G1 Z.94
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S6000
G1 X77.017 Y87.414 E.0108
M106 S186.15
M106 S255
G1 X77.106 Y87.414 E.00242
M106 S186.15
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X77.338 Y87.414 E.00627
G1 X77.387 Y87.599 E.00519
M106 S186.15
M106 S255
G1 F3000
G1 X77.257 Y87.674 E.00409
M106 S186.15
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X77.069 Y87.783 E.00587
M106 S186.15
M204 S250
G1 X76.737 Y88.437 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2700
M204 S5000
G1 X76.616 Y88.507 E.00351
G1 X76.616 Y88.227 E.00702
G1 F4506.827
G1 X76.616 Y87.789 E.01101
G1 F720
G1 X76.616 Y87.363 E.01071
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X76.616 Y87.013 E.00948
G1 X77.952 Y87.013 E.03618
M106 S186.15
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X78.223 Y87.013 E.00682
M106 S186.15
M106 S255
G1 X78.169 Y87.152 E.00374
M106 S186.15
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X78.168 Y87.153 E.00004
M106 S186.15
M106 S255
G1 F600
G2 X78.018 Y87.697 I4.497 J1.537 E.01531
G1 X77.457 Y88.021 E.01755
M106 S186.15
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X77.137 Y88.206 E.00928
M106 S186.15
G1 F2740.056
G1 X76.789 Y88.407 E.01011
; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F2740.056
M204 S6000
G1 X76.616 Y88.507 E-.07584
G1 X76.616 Y88.227 E-.10607
G1 X76.616 Y87.789 E-.16642
G1 X76.616 Y87.363 E-.16191
G1 X76.616 Y87.013 E-.133
G1 X76.924 Y87.013 E-.11676
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/7
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.34 I.111 J1.212 P1  F42000
G1 X99.816 Y84.918 Z1.34
G1 Z1.1
G1 E.8 F1800
G1 F8541
M204 S5000
G1 X99.816 Y83.518 E.0352
G1 X101.397 Y83.518 E.03972
G1 X101.397 Y84.918 E.0352
G1 X103.594 Y84.919 E.05526
G1 X103.595 Y91.201 E.15792
G1 X92.14 Y85.11 E.32618
G1 X92.597 Y84.846 E.01325
G1 X92.597 Y84.918 E.00182
G1 X95.616 Y84.918 E.07593
G1 X95.616 Y83.718 E.03017
G1 X97.597 Y83.718 E.04978
G1 X97.597 Y84.918 E.03017
G1 X99.756 Y84.918 E.05431
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.816 Y83.518 E-.53249
G1 X100.415 Y83.518 E-.22751
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.214 J.084 P1  F42000
G1 X101.267 Y95.761 Z1.5
G1 Z1.1
G1 E.8 F1800
M73 P79 R0
G1 F8541
M204 S5000
G1 X103.595 Y91.382 E.1247
G1 X103.596 Y100.398 E.22668
G1 X99.766 Y100.398 E.09628
G1 X99.766 Y99.798 E.01508
G1 X97.447 Y99.798 E.05833
G1 X97.447 Y100.398 E.01508
G1 X80.766 Y100.398 E.41936
G1 X80.766 Y99.798 E.01508
G1 X78.446 Y99.798 E.05833
G1 X78.446 Y100.398 E.01508
G1 X76.617 Y100.398 E.04599
G1 X76.616 Y90.585 E.24671
G1 X78.126 Y93.201 E.07592
G1 X80.427 Y91.872 E.0668
G2 X85.196 Y89.119 I1.175 J-3.472 E.15662
G1 X86.911 Y88.128 E.04981
G1 X101.214 Y95.733 E.40725
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.174 Y93.979 E-.76
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

G1 X103.383 Y93.315
G1 Z1.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F8541
M204 S2000
G1 X103.007 Y92.939 E.01336
G1 X102.818 Y93.295
G1 X103.383 Y93.86 E.0201
G1 X103.383 Y94.406
G1 X102.629 Y93.651 E.02683
G1 X102.439 Y94.007
G1 X103.384 Y94.951 E.03357
G1 X103.384 Y95.497
G1 X102.25 Y94.363 E.0403
G1 X102.061 Y94.719
G1 X103.384 Y96.042 E.04703
G1 X103.384 Y96.588
G1 X101.871 Y95.075 E.05377
G1 X101.682 Y95.432
G1 X103.384 Y97.133 E.0605
G1 X103.384 Y97.679
G1 X101.493 Y95.788 E.06723
G1 X101.041 Y95.882
M73 P80 R0
G1 X103.384 Y98.224 E.08328
G1 X103.384 Y98.77
G1 X99.877 Y95.262 E.1247
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.291 Y96.677 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.712 Y94.643 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
G1 F8541
M204 S2000
G1 X103.384 Y99.315 E.16611
G1 X103.384 Y99.86
G1 X97.547 Y94.024 E.20752
; WIPE_START
G1 F11668.197
M204 S6000
G1 X98.962 Y95.438 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.754 J-.956 P1  F42000
G1 X96.383 Y93.405 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F8541
M204 S2000
G1 X103.164 Y100.186 E.24111
G1 X102.619 Y100.186
G1 X95.218 Y92.785 E.26313
; WIPE_START
G1 F11668.197
M204 S6000
G1 X96.632 Y94.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.754 J-.956 P1  F42000
G1 X94.053 Y92.166 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F8541
M204 S2000
G1 X102.073 Y100.186 E.28515
G1 X101.528 Y100.186
G1 X92.889 Y91.547 E.30717
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.303 Y92.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.754 J-.956 P1  F42000
G1 X91.724 Y90.928 Z1.5
G1 Z1.1
M73 P81 R0
G1 E.8 F1800
G1 F8541
M204 S2000
G1 X100.983 Y100.186 E.32919
G1 X100.437 Y100.186
G1 X99.979 Y99.727 E.01631
G1 X99.837 Y99.586
G1 X90.559 Y90.308 E.32988
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.974 Y91.723 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.754 J-.956 P1  F42000
G1 X89.395 Y89.689 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F8541
M204 S2000
G1 X99.292 Y99.586 E.3519
G1 X98.747 Y99.586
G1 X88.23 Y89.07 E.37392
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.644 Y90.484 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.754 J-.956 P1  F42000
G1 X87.065 Y88.45 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F8541
M204 S2000
G1 X98.201 Y99.586 E.39594
G1 X97.656 Y99.586
G1 X86.614 Y88.545 E.39258
G1 X86.269 Y88.744
G1 X97.234 Y99.71 E.38989
G1 X97.165 Y100.186
G1 X85.923 Y88.944 E.39972
G1 X85.577 Y89.144
G1 X96.62 Y100.186 E.39262
M73 P82 R0
G1 X96.074 Y100.186
G1 X85.331 Y89.443 E.38197
G1 X85.195 Y89.853
G1 X95.529 Y100.186 E.36741
G1 X94.983 Y100.186
G1 X85.023 Y90.226 E.35416
G1 X84.819 Y90.567
G1 X94.438 Y100.186 E.34202
G1 X93.893 Y100.186
G1 X84.585 Y90.879 E.33092
G1 X84.325 Y91.164
G1 X93.347 Y100.186 E.32079
G1 X92.802 Y100.186
G1 X84.037 Y91.421 E.31164
G1 X83.715 Y91.645
G1 X92.256 Y100.186 E.30368
G1 X91.711 Y100.186
G1 X83.374 Y91.849 E.29644
G1 X82.997 Y92.018
M73 P83 R0
G1 X91.166 Y100.186 E.29043
G1 X90.62 Y100.186
G1 X82.585 Y92.151 E.28568
G1 X82.125 Y92.237
G1 X90.075 Y100.186 E.28265
G1 X89.529 Y100.186
G1 X81.621 Y92.278 E.28118
G1 X81.031 Y92.233
G1 X88.984 Y100.186 E.28277
G1 X88.438 Y100.186
G1 X80.39 Y92.138 E.28615
G1 X80.045 Y92.338
G1 X87.893 Y100.186 E.27905
G1 X87.348 Y100.186
G1 X79.699 Y92.537 E.27195
G1 X79.353 Y92.737
G1 X86.802 Y100.186 E.26486
G1 X86.257 Y100.186
G1 X79.007 Y92.937 E.25776
G1 X78.662 Y93.136
G1 X85.711 Y100.186 E.25066
M73 P84 R0
G1 X85.166 Y100.186
G1 X78.316 Y93.336 E.24356
; WIPE_START
G1 F11668.197
M204 S6000
G1 X79.73 Y94.75 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.767 J-.945 P1  F42000
G1 X76.829 Y92.394 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F8541
M204 S2000
G1 X84.621 Y100.186 E.27704
G1 X84.075 Y100.186
G1 X76.829 Y92.94 E.25765
G1 X76.829 Y93.485
G1 X83.53 Y100.186 E.23826
G1 X82.984 Y100.186
G1 X76.829 Y94.031 E.21886
G1 X76.829 Y94.576
G1 X82.439 Y100.186 E.19947
G1 X81.894 Y100.186
G1 X76.829 Y95.122 E.18008
G1 X76.829 Y95.667
G1 X80.748 Y99.586 E.13935
G1 X80.203 Y99.586
G1 X76.829 Y96.213 E.11995
G1 X76.829 Y96.758
G1 X79.657 Y99.586 E.10056
G1 X79.112 Y99.586
G1 X76.829 Y97.303 E.08117
G1 X76.829 Y97.849
G1 X78.567 Y99.586 E.06177
M73 P85 R0
G1 X78.234 Y99.799
G1 X76.829 Y98.394 E.04996
G1 X76.829 Y98.94
G1 X78.076 Y100.186 E.04432
G1 X77.53 Y100.186
G1 X76.829 Y99.485 E.02492
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.53 Y100.186 E-.3767
G1 X78.076 Y100.186 E-.20728
G1 X77.748 Y99.859 E-.17602
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.016 J1.217 P1  F42000
G1 X80.979 Y99.817 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F8541
M204 S2000
G1 X81.348 Y100.186 E.01314
M204 S10000
G1 X81.091 Y99.704 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.101222
G1 F8541
M204 S6000
G1 X80.861 Y99.474 E.00142
; WIPE_START
G1 F18000
G1 X81.091 Y99.704 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.21 J-1.199 P1  F42000
G1 X78.229 Y100.206 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.0829666
G1 F8541
M204 S6000
G1 X78.229 Y99.805 E.00127
; WIPE_START
G1 F18000
G1 X78.229 Y100.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I1.215 J-.072 P1  F42000
G1 X77.804 Y93.069 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.102118
G1 F8541
M204 S6000
G1 X77.702 Y92.935 E.00074
; LINE_WIDTH: 0.145136
G1 X77.6 Y92.802 E.00121
; LINE_WIDTH: 0.188153
G1 X77.497 Y92.669 E.00169
; LINE_WIDTH: 0.231171
G1 X77.395 Y92.535 E.00216
; LINE_WIDTH: 0.274188
G1 X77.293 Y92.402 E.00263
; LINE_WIDTH: 0.317206
G1 X77.19 Y92.268 E.0031
; LINE_WIDTH: 0.360224
G1 X77.088 Y92.135 E.00357
; LINE_WIDTH: 0.396117
G1 X77.05 Y92.098 E.00125
; LINE_WIDTH: 0.424904
G1 X77.012 Y92.061 E.00135
; LINE_WIDTH: 0.417045
G1 X76.971 Y92.109 E.00157
; LINE_WIDTH: 0.372539
G1 X76.931 Y92.157 E.00139
; LINE_WIDTH: 0.328034
G1 X76.89 Y92.206 E.00121
; LINE_WIDTH: 0.283528
G1 X76.85 Y92.254 E.00102
; LINE_WIDTH: 0.239022
G1 X76.809 Y92.302 E.00084
; WIPE_START
G1 F18000
G1 X76.85 Y92.254 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.015 J1.217 P1  F42000
G1 X80.96 Y92.305 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.113317
G1 F8541
M204 S6000
G1 X80.72 Y92.174 E.0014
; WIPE_START
G1 F18000
G1 X80.96 Y92.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.013 J1.217 P1  F42000
G1 X82.045 Y92.317 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.0933967
G1 F8541
M204 S6000
G1 X81.87 Y92.254 E.00072
; WIPE_START
G1 F18000
G1 X82.045 Y92.317 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.359 J1.163 P1  F42000
G1 X82.957 Y92.035 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.116632
G1 F8541
M204 S6000
G1 X82.861 Y92.095 E.00061
G1 X82.782 Y92.075 E.00044
; WIPE_START
G1 F18000
G1 X82.861 Y92.095 E-.31828
G1 X82.957 Y92.035 E-.44172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.907 J.812 P1  F42000
G1 X85.507 Y89.185 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.0960422
M73 P86 R0
G1 F8541
M204 S6000
G2 X85.399 Y89.273 I.216 J.376 E.00057
; LINE_WIDTH: 0.12353
G1 X85.398 Y89.306 E.00019
G1 X85.464 Y89.31 E.00039
; WIPE_START
G1 F18000
G1 X85.398 Y89.306 E-.50824
G1 X85.399 Y89.273 E-.25176
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.062 J1.215 P1  F42000
G1 X88.167 Y89.132 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.192946
G1 F8541
M204 S6000
G1 X88.014 Y89.019 E.00197
; LINE_WIDTH: 0.148013
G1 X87.862 Y88.906 E.00141
; LINE_WIDTH: 0.10308
G1 X87.709 Y88.793 E.00085
; WIPE_START
G1 F18000
G1 X87.862 Y88.906 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.332 Y89.752 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.192946
G1 F8541
M204 S6000
G1 X89.179 Y89.639 E.00197
; LINE_WIDTH: 0.148013
G1 X89.026 Y89.525 E.00141
; LINE_WIDTH: 0.10308
G1 X88.873 Y89.412 E.00085
; WIPE_START
G1 F18000
G1 X89.026 Y89.525 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.607 J1.055 P1  F42000
G1 X90.497 Y90.371 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.192946
G1 F8541
M204 S6000
G1 X90.344 Y90.258 E.00197
; LINE_WIDTH: 0.148013
G1 X90.191 Y90.145 E.00141
; LINE_WIDTH: 0.10308
G1 X90.038 Y90.032 E.00085
; WIPE_START
G1 F18000
G1 X90.191 Y90.145 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.607 J1.055 P1  F42000
G1 X91.661 Y90.99 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.192946
G1 F8541
M204 S6000
G1 X91.508 Y90.877 E.00197
; LINE_WIDTH: 0.148013
G1 X91.356 Y90.764 E.00141
; LINE_WIDTH: 0.10308
G1 X91.203 Y90.651 E.00085
; WIPE_START
G1 F18000
G1 X91.356 Y90.764 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.607 J1.055 P1  F42000
G1 X92.826 Y91.61 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.192956
G1 F8541
M204 S6000
G1 X92.673 Y91.496 E.00197
; LINE_WIDTH: 0.148019
G1 X92.52 Y91.383 E.00141
; LINE_WIDTH: 0.103082
G1 X92.367 Y91.27 E.00085
; WIPE_START
G1 F18000
G1 X92.52 Y91.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.607 J1.055 P1  F42000
G1 X93.991 Y92.229 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.192934
G1 F8541
M204 S6000
G1 X93.838 Y92.116 E.00197
; LINE_WIDTH: 0.148006
G1 X93.685 Y92.002 E.00141
; LINE_WIDTH: 0.103078
G1 X93.532 Y91.889 E.00085
; WIPE_START
G1 F18000
G1 X93.685 Y92.002 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.607 J1.055 P1  F42000
G1 X95.155 Y92.848 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.192956
G1 F8541
M204 S6000
G1 X95.002 Y92.735 E.00197
; LINE_WIDTH: 0.148019
G1 X94.85 Y92.622 E.00141
; LINE_WIDTH: 0.103082
G1 X94.697 Y92.509 E.00085
; WIPE_START
G1 F18000
G1 X94.85 Y92.622 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.607 J1.055 P1  F42000
G1 X96.32 Y93.467 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.192934
G1 F8541
M204 S6000
G1 X96.167 Y93.354 E.00197
; LINE_WIDTH: 0.148006
G1 X96.014 Y93.241 E.00141
; LINE_WIDTH: 0.103078
G1 X95.861 Y93.128 E.00085
; WIPE_START
G1 F18000
G1 X96.014 Y93.241 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.607 J1.055 P1  F42000
G1 X97.485 Y94.087 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.192956
G1 F8541
M204 S6000
G1 X97.332 Y93.973 E.00197
; LINE_WIDTH: 0.148019
M73 P87 R0
G1 X97.179 Y93.86 E.00141
; LINE_WIDTH: 0.103082
G1 X97.026 Y93.747 E.00085
; WIPE_START
G1 F18000
G1 X97.179 Y93.86 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.607 J1.055 P1  F42000
G1 X98.649 Y94.706 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.192934
G1 F8541
M204 S6000
G1 X98.497 Y94.593 E.00197
; LINE_WIDTH: 0.148006
G1 X98.344 Y94.48 E.00141
; LINE_WIDTH: 0.103078
G1 X98.191 Y94.366 E.00085
; WIPE_START
G1 F18000
G1 X98.344 Y94.48 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.814 Y95.325 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.192956
G1 F8541
M204 S6000
G1 X99.661 Y95.212 E.00197
; LINE_WIDTH: 0.148019
G1 X99.508 Y95.099 E.00141
; LINE_WIDTH: 0.103082
G1 X99.355 Y94.986 E.00085
; WIPE_START
G1 F18000
G1 X99.508 Y95.099 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.607 J1.055 P1  F42000
G1 X100.979 Y95.944 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.192946
G1 F8541
M204 S6000
G1 X100.826 Y95.831 E.00197
; LINE_WIDTH: 0.148013
G1 X100.673 Y95.718 E.00141
; LINE_WIDTH: 0.10308
G1 X100.52 Y95.605 E.00085
; WIPE_START
G1 F18000
G1 X100.673 Y95.718 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I1.192 J.244 P1  F42000
G1 X102.835 Y85.131 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F8541
M204 S2000
G1 X103.382 Y85.678 E.01945
G1 X103.382 Y86.224
G1 X102.29 Y85.131 E.03886
G1 X101.744 Y85.131
G1 X103.382 Y86.769 E.05826
G1 X103.383 Y87.315
G1 X101.198 Y85.13 E.07767
G1 X101.184 Y84.571
G1 X100.344 Y83.73 E.02989
G1 X100.029 Y83.961
G1 X101.184 Y85.117 E.04109
; WIPE_START
G1 F11668.197
M204 S6000
G1 X100.029 Y83.961 E-.62112
G1 X100.324 Y83.745 E-.13888
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.135 J-.44 P1  F42000
G1 X100.029 Y84.506 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F8541
M204 S2000
G1 X103.383 Y87.86 E.11925
G1 X103.383 Y88.406
G1 X100.029 Y85.052 E.11926
G1 X99.562 Y85.13
G1 X103.383 Y88.951 E.13584
G1 X103.383 Y89.497
G1 X99.017 Y85.13 E.15524
G1 X98.471 Y85.13
G1 X103.383 Y90.042 E.17463
M73 P88 R0
G1 X103.383 Y90.588
G1 X97.926 Y85.13 E.19403
G1 X97.384 Y84.589
G1 X96.726 Y83.93 E.02341
G1 X96.181 Y83.93
G1 X102.773 Y90.523 E.23441
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.359 Y89.109 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.609 Y89.904 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
G1 F8541
M204 S2000
G1 X95.829 Y84.124 E.20551
G1 X95.829 Y84.669
G1 X100.444 Y89.285 E.1641
; WIPE_START
G1 F11668.197
M204 S6000
G1 X99.03 Y87.871 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.161 J.364 P1  F42000
G1 X99.279 Y88.666 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F8541
M204 S2000
G1 X95.744 Y85.13 E.12569
G1 X95.199 Y85.13
G1 X98.115 Y88.046 E.10367
; WIPE_START
G1 F11668.197
M204 S6000
M73 P90 R0
G1 X96.701 Y86.632 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.161 J.364 P1  F42000
G1 X96.95 Y87.427 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F8541
M204 S2000
G1 X94.654 Y85.13 E.08166
G1 X94.108 Y85.13
G1 X95.785 Y86.808 E.05964
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.371 Y85.394 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.161 J.364 P1  F42000
G1 X94.621 Y86.189 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F8541
M204 S2000
G1 X93.563 Y85.13 E.03762
M204 S10000
G1 X93.481 Y85.111 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.237536
G1 F8541
M204 S6000
G1 X93.424 Y85.155 E.00095
; LINE_WIDTH: 0.279125
G1 X93.367 Y85.198 E.00115
; LINE_WIDTH: 0.320713
G1 X93.31 Y85.242 E.00134
; LINE_WIDTH: 0.353601
G1 X93.253 Y85.286 E.00149
G1 X93.328 Y85.365 E.00228
; LINE_WIDTH: 0.289475
G1 X93.458 Y85.461 E.00269
; LINE_WIDTH: 0.243061
G1 X93.588 Y85.558 E.0022
; LINE_WIDTH: 0.196648
G1 X93.718 Y85.654 E.00171
; LINE_WIDTH: 0.150234
G1 X93.848 Y85.75 E.00122
; LINE_WIDTH: 0.103821
G1 X93.978 Y85.846 E.00073
; WIPE_START
G1 F18000
G1 X93.848 Y85.75 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.747 J.961 P1  F42000
G1 X96.155 Y83.956 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.123788
G1 F8541
M204 S6000
G1 X95.809 Y83.956 E.00202
; WIPE_START
G1 F18000
G1 X96.155 Y83.956 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.832 J.888 P1  F42000
G1 X103.402 Y90.741 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.17372
G1 F8541
M204 S6000
G1 X103.342 Y90.75 E.00055
; LINE_WIDTH: 0.147133
G1 X103.282 Y90.759 E.00045
; LINE_WIDTH: 0.116954
G1 X103.223 Y90.747 E.00032
; LINE_WIDTH: 0.119293
G1 X103.094 Y90.652 E.00089
; LINE_WIDTH: 0.157741
G1 X102.965 Y90.556 E.00129
; LINE_WIDTH: 0.196188
G1 X102.836 Y90.461 E.00169
M204 S10000
G1 X102.13 Y90.181 F42000
; LINE_WIDTH: 0.10308
G1 F8541
M204 S6000
G1 X101.977 Y90.068 E.00085
; LINE_WIDTH: 0.148013
G1 X101.824 Y89.955 E.00141
; LINE_WIDTH: 0.192946
G1 X101.671 Y89.841 E.00197
M204 S10000
G1 X100.966 Y89.562 F42000
; LINE_WIDTH: 0.10308
G1 F8541
M204 S6000
G1 X100.813 Y89.448 E.00085
; LINE_WIDTH: 0.148013
G1 X100.66 Y89.335 E.00141
; LINE_WIDTH: 0.192946
G1 X100.507 Y89.222 E.00197
M204 S10000
G1 X99.801 Y88.942 F42000
; LINE_WIDTH: 0.103081
G1 F8541
M204 S6000
G1 X99.648 Y88.829 E.00085
; LINE_WIDTH: 0.148014
G1 X99.495 Y88.716 E.00141
; LINE_WIDTH: 0.192948
G1 X99.342 Y88.603 E.00197
M204 S10000
G1 X98.636 Y88.323 F42000
; LINE_WIDTH: 0.103083
G1 F8541
M204 S6000
G1 X98.483 Y88.21 E.00085
; LINE_WIDTH: 0.14802
G1 X98.33 Y88.097 E.00141
; LINE_WIDTH: 0.192958
G1 X98.177 Y87.984 E.00197
M204 S10000
G1 X97.472 Y87.704 F42000
; LINE_WIDTH: 0.103079
G1 F8541
M204 S6000
G1 X97.319 Y87.591 E.00085
; LINE_WIDTH: 0.148012
G1 X97.166 Y87.478 E.00141
; LINE_WIDTH: 0.192944
G1 X97.013 Y87.364 E.00197
M204 S10000
G1 X96.307 Y87.085 F42000
; LINE_WIDTH: 0.10308
G1 F8541
M204 S6000
G1 X96.154 Y86.971 E.00085
; LINE_WIDTH: 0.148013
M73 P91 R0
G1 X96.001 Y86.858 E.00141
; LINE_WIDTH: 0.192946
G1 X95.848 Y86.745 E.00197
M204 S10000
G1 X95.142 Y86.465 F42000
; LINE_WIDTH: 0.10308
G1 F8541
M204 S6000
G1 X94.989 Y86.352 E.00085
; LINE_WIDTH: 0.148013
G1 X94.836 Y86.239 E.00141
; LINE_WIDTH: 0.192946
G1 X94.683 Y86.126 E.00197
; WIPE_START
G1 F18000
G1 X94.836 Y86.239 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.057 J-1.216 P1  F42000
G1 X78.223 Y87.013 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8541
M204 S5000
G1 X78.167 Y87.157 E.00387
G2 X78.017 Y87.698 I4.993 J1.676 E.01413
G1 X76.616 Y88.507 E.04066
G1 X76.616 Y87.013 E.03754
G1 X78.163 Y87.013 E.03888
M204 S10000
G1 X77.589 Y87.7 F42000
; FEATURE: Top surface
G1 F8541
M204 S2000
G1 X77.114 Y87.225 E.01688
G1 X76.829 Y87.486
G1 X77.243 Y87.9 E.01473
M204 S10000
G1 X77.719 Y87.206 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193574
G1 F8541
M204 S6000
G1 X77.787 Y87.52 E.00334
; LINE_WIDTH: 0.165947
G1 X77.769 Y87.554 E.00033
; LINE_WIDTH: 0.12514
G1 X77.75 Y87.589 E.00023
; LINE_WIDTH: 0.0926921
G1 X77.658 Y87.659 E.00044
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F18000
G1 X77.75 Y87.589 E-.76
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
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

M73 P92 R0
G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
M73 P93 R0
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
M73 P94 R0
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


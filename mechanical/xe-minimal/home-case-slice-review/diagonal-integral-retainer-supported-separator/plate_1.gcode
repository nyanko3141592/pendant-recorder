; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 1m 45s; total estimated time: 2m 5s
; total layer number: 9
; total filament length [mm] : 96.27
; total filament volume [cm^3] : 231.57
; total filament weight [g] : 0.29
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
M73 P1 R2
G1 X10.1 Y200.0 Z0.28 F1500.0 E15 ;Draw the first line
G1 X10.4 Y200.0 Z0.28 F5000.0 ;Move to side a little
G1 X10.4 Y20 Z0.28 F1500.0 E30 ;Draw the second line
G92 E0 ;Reset Extruder 
M73 P7 R1
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
M73 P12 R1
G1 X86.215 Y78.873 F42000
M204 S6000
M73 P15 R1
G1 Z.4
G1 Z.14
G1 E.8 F1800
; FEATURE: Support transition
; LINE_WIDTH: 0.42
G1 F3000
M204 S500
G1 X85.692 Y79.151 E.01316
G1 X86.103 Y79.924 E.01947
M204 S6000
G1 X86.123 Y79.961 F42000
G1 F3000
M204 S500
G1 X86.385 Y80.454 E.0124
G1 X86.385 Y78.783 E.03716
G1 X87.271 Y78.312 E.02231
G1 X87.271 Y82.119 E.08469
G1 X87.009 Y81.627 E.0124
M204 S6000
G1 X88.392 Y84.229 F42000
G1 F3000
M204 S500
G1 X88.156 Y83.785 E.01118
G1 X88.156 Y77.841 E.13221
G1 X88.884 Y77.454 E.01833
G1 X89.042 Y77.751 E.00749
G1 X89.042 Y84.229 E.14408
G1 X89.928 Y84.229 E.0197
G1 X89.928 Y79.417 E.10703
M73 P16 R1
G1 X90.189 Y79.91 E.0124
M204 S6000
G1 X90.209 Y79.947 F42000
G1 F3000
M204 S500
G1 X90.813 Y81.083 E.02861
G1 X90.813 Y81.343 E.00579
G1 X90.236 Y81.343 E.01284
; WIPE_START
G1 X90.813 Y81.343 E-.21931
G1 X90.813 Y81.083 E-.09892
G1 X90.267 Y80.056 E-.44177
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X90.62 Y87.114 Z.54 F42000
G1 Z.14
G1 E.8 F1800
G1 F3000
M204 S500
G1 X89.928 Y87.114 E.01541
G1 X90.531 Y88.252 E.02866
M204 S6000
G1 X90.551 Y88.29 F42000
G1 F3000
M204 S500
G1 X90.813 Y88.782 E.0124
G1 X90.813 Y87.114 E.0371
G1 X91.699 Y87.114 E.0197
G1 X91.699 Y90.448 E.07415
G1 X91.437 Y89.955 E.0124
M204 S6000
G1 X92.323 Y91.621 F42000
G1 F3000
M204 S500
G1 X92.584 Y92.113 E.0124
G1 X92.584 Y87.114 E.1112
G1 X93.47 Y87.114 E.0197
G1 X93.47 Y92.886 E.12838
M73 P17 R1
G1 X94.356 Y92.886 E.0197
G1 X94.356 Y87.746 E.11434
G1 X94.618 Y88.238 E.0124
M204 S6000
G1 X94.638 Y88.275 F42000
G1 F3000
M204 S500
G1 X95.241 Y89.411 E.02861
G1 X95.241 Y92.886 E.07729
G1 X96.127 Y92.886 E.0197
G1 X96.127 Y90.821 E.04594
G1 X96.394 Y90.902 E.00622
G1 X97.013 Y90.573 E.01558
G1 X97.013 Y92.886 E.05144
G1 X97.898 Y92.886 E.0197
G1 X97.898 Y87.114 E.12838
G1 X98.585 Y87.114 E.01526
G1 X98.585 Y92.886 E.12838
M73 P18 R1
G1 X98.091 Y92.886 E.01097
; WIPE_START
G1 X98.585 Y92.886 E-.18748
G1 X98.585 Y91.379 E-.57252
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X94.627 Y94.04 Z.54 F42000
G1 Z.14
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X94.627 Y95.251 E.03248
G1 X95.149 Y96.234 E.02982
G1 X95.149 Y94.252 E.05313
G1 X95.671 Y94.252 E.014
G1 X95.671 Y97.216 E.07946
G1 X96.194 Y98.198 E.02982
G1 X96.194 Y94.252 E.10578
G1 X96.716 Y94.252 E.014
G1 X96.716 Y103.063 E.23619
G1 X97.238 Y103.063 E.014
G1 X97.238 Y94.252 E.23619
M73 P19 R1
G1 X97.76 Y94.252 E.014
G1 X97.76 Y103.063 E.23619
G1 X98.282 Y103.063 E.014
G1 X98.282 Y94.252 E.23619
G1 X98.804 Y94.252 E.014
G1 X98.804 Y103.063 E.23619
G1 X99.327 Y103.063 E.014
G1 X99.327 Y94.252 E.23619
M73 P20 R1
G1 X99.849 Y94.252 E.014
G1 X99.849 Y103.063 E.23619
G1 X100.371 Y103.063 E.014
G1 X100.371 Y94.252 E.23619
G1 X100.893 Y94.252 E.014
G1 X100.893 Y103.063 E.23619
G1 X101.415 Y103.063 E.014
G1 X101.415 Y94.252 E.23619
G1 X101.937 Y94.252 E.014
G1 X101.937 Y103.063 E.23619
M73 P21 R1
G1 X102.46 Y103.063 E.014
G1 X102.46 Y94.252 E.23619
G1 X102.982 Y94.252 E.014
G1 X102.982 Y103.274 E.24186
M204 S6000
G1 X103.413 Y103.415 F42000
G1 F3000
M204 S500
G1 X103.413 Y93.829 E.25698
G1 X93.756 Y93.829 E.25887
G1 X93.756 Y94.514 E.01838
M73 P22 R1
G1 X96.177 Y99.125 E.13959
G1 X96.177 Y101.431 E.06184
G1 X95.914 Y101.695 E.00999
G1 X94.082 Y101.695 E.04909
G1 X94.082 Y103.195 E.04021
G1 X95.986 Y103.195 E.05102
G1 X96.086 Y103.485 E.00824
G1 X103.413 Y103.485 E.19642
M204 S6000
G1 X96.194 Y103.15 F42000
G1 F3000
M204 S500
G1 X96.194 Y102.013 E.03046
G1 X96.089 Y102.118 E.00397
G1 X95.671 Y102.118 E.01119
G1 X95.671 Y102.772 E.01753
G1 X95.149 Y102.772 E.014
M73 P23 R1
G1 X95.149 Y102.118 E.01753
G1 X94.627 Y102.118 E.014
G1 X94.627 Y102.984 E.0232
; WIPE_START
G1 X94.627 Y102.118 E-.32892
G1 X95.149 Y102.118 E-.19842
G1 X95.149 Y102.73 E-.23265
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X95.038 Y95.099 Z.54 F42000
G1 X94.756 Y75.85 Z.54
G1 Z.14
G1 E.8 F1800
G1 F3000
M204 S500
G1 X85.099 Y75.85 E.25887
G1 X85.099 Y73.629 E.05954
G1 X94.756 Y73.629 E.25887
G1 X94.756 Y75.78 E.05765
M204 S6000
G1 X94.105 Y75.639 F42000
G1 F3000
M204 S500
M73 P24 R1
G1 X94.105 Y74.052 E.04254
G1 X93.583 Y74.052 E.014
G1 X93.583 Y75.427 E.03687
G1 X93.061 Y75.427 E.014
G1 X93.061 Y74.052 E.03687
G1 X92.538 Y74.052 E.014
G1 X92.538 Y75.427 E.03687
G1 X92.016 Y75.427 E.014
G1 X92.016 Y74.052 E.03687
G1 X91.494 Y74.052 E.014
G1 X91.494 Y75.427 E.03687
G1 X90.972 Y75.427 E.014
G1 X90.972 Y74.052 E.03687
G1 X90.45 Y74.052 E.014
G1 X90.45 Y75.427 E.03687
G1 X89.928 Y75.427 E.014
G1 X89.928 Y74.052 E.03687
G1 X89.405 Y74.052 E.014
G1 X89.405 Y75.427 E.03687
G1 X88.883 Y75.427 E.014
G1 X88.883 Y74.052 E.03687
G1 X88.361 Y74.052 E.014
G1 X88.361 Y75.427 E.03687
M73 P25 R1
G1 X87.839 Y75.427 E.014
G1 X87.839 Y74.052 E.03687
G1 X87.317 Y74.052 E.014
G1 X87.317 Y75.427 E.03687
G1 X86.794 Y75.427 E.014
G1 X86.794 Y74.052 E.03687
G1 X86.272 Y74.052 E.014
G1 X86.272 Y75.427 E.03687
G1 X85.75 Y75.427 E.014
G1 X85.75 Y73.84 E.04253
; WIPE_START
G1 X85.75 Y75.427 E-.60295
G1 X86.163 Y75.427 E-.15705
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X83.985 Y78.629 Z.54 F42000
G1 Z.14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X95.007 Y99.359 E.62939
G1 X95.007 Y100.525 E.03125
G1 X92.912 Y100.525 E.05616
M73 P26 R1
G1 X92.912 Y102.98 E.06581
G1 X80.547 Y102.98 E.33147
G1 X80.547 Y102.17 E.02172
G1 X81.147 Y102.17 E.01608
G1 X81.147 Y98.83 E.08953
G1 X80.547 Y98.83 E.01608
G1 X80.547 Y83.17 E.4198
G1 X81.147 Y83.17 E.01608
G1 X81.147 Y79.83 E.08953
M73 P27 R1
G1 X80.547 Y79.83 E.01608
G1 X80.547 Y77.02 E.07533
G1 X86.555 Y77.02 E.16107
G1 X86.609 Y77.234 E.0059
G1 X84.038 Y78.601 E.07806
M204 S6000
G1 X84.62 Y78.823 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X95.477 Y99.242 E.61993
G1 X95.477 Y100.995 E.04699
G1 X93.382 Y100.995 E.05616
M73 P28 R1
G1 X93.382 Y103.45 E.06581
G1 X80.077 Y103.45 E.35666
G1 X80.077 Y101.7 E.04691
G1 X80.677 Y101.7 E.01608
G1 X80.677 Y99.3 E.06434
G1 X80.077 Y99.3 E.01608
G1 X80.077 Y82.7 E.44499
G1 X80.677 Y82.7 E.01608
G1 X80.677 Y80.3 E.06434
M73 P29 R1
G1 X80.077 Y80.3 E.01608
G1 X80.077 Y76.55 E.10053
G1 X88.896 Y76.55 E.2364
G1 X84.673 Y78.795 E.1282
; WIPE_START
G1 X85.608 Y80.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X92.964 Y82.438 Z.54 F42000
G1 Z.14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X90.083 Y77.02 E.16449
G1 X95.007 Y77.02 E.132
G1 X95.007 Y83.02 E.16084
M73 P30 R1
G1 X96.207 Y83.02 E.03217
G1 X96.207 Y83.98 E.02574
G1 X95.007 Y83.98 E.03217
G1 X95.007 Y85.826 E.04948
G1 X94.793 Y85.879 E.00591
G1 X92.992 Y82.491 E.10287
; WIPE_START
G1 X92.053 Y80.725 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X95.376 Y87.596 Z.54 F42000
G1 X96.273 Y89.45 Z.54
G1 Z.14
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X96.53 Y89.933 E.01465
G1 X96.441 Y89.979 E.00268
G1 X89.301 Y76.55 E.40773
G1 X95.477 Y76.55 E.16556
G1 X95.477 Y82.55 E.16084
M73 P31 R1
G1 X96.677 Y82.55 E.03217
G1 X96.677 Y84.45 E.05093
G1 X95.477 Y84.45 E.03217
G1 X95.477 Y87.55 E.0831
G1 X96.677 Y87.55 E.03217
G1 X96.677 Y89.45 E.05093
G1 X96.333 Y89.45 E.00922
; WIPE_START
G1 X96.53 Y89.933 E-.19798
G1 X96.441 Y89.979 E-.038
G1 X95.794 Y88.762 E-.52402
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

M73 P32 R1
G1 X95.972 Y83.5
G1 Z.14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.520204
G1 F3000
M204 S500
G1 X94.772 Y83.5 E.03355
; WIPE_START
G1 X95.972 Y83.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X94.819 Y78.192 Z.54 F42000
G1 Z.14
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.516104
G1 F6300
M204 S500
G1 X94.046 Y77.419 E.0303
G1 X93.359 Y77.419 E.01906
G1 X94.608 Y78.668 E.04896
G1 X94.608 Y79.355 E.01906
G1 X92.672 Y77.419 E.07591
G1 X91.984 Y77.419 E.01906
G1 X94.608 Y80.043 E.10287
G1 X94.608 Y80.73 E.01906
G1 X91.297 Y77.419 E.12982
G1 X90.748 Y77.419 E.01523
G1 X90.904 Y77.714 E.00927
G1 X94.608 Y81.418 E.14521
M73 P33 R1
G1 X94.608 Y82.105 E.01906
G1 X91.685 Y79.182 E.1146
G1 X92.465 Y80.65 E.04609
G1 X94.608 Y82.793 E.084
G1 X94.608 Y82.84 E.00133
G1 X94.373 Y82.84 E.00651
G1 X94.373 Y83.245 E.01122
G1 X93.246 Y82.118 E.04419
G1 X94.026 Y83.586 E.04609
G1 X94.819 Y84.379 E.03109
; WIPE_START
G1 X94.026 Y83.586 E-.42612
G1 X93.614 Y82.81 E-.33388
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X87.138 Y78.77 Z.54 F42000
G1 X85.381 Y77.674 Z.54
G1 Z.14
G1 E.8 F1800
; LINE_WIDTH: 0.503734
G1 F6300
M204 S500
G1 X85.126 Y77.419 E.00973
G1 X84.456 Y77.419 E.0181
G1 X84.787 Y77.75 E.01264
G1 X84.349 Y77.983 E.01338
G1 X83.786 Y77.419 E.02153
G1 X83.116 Y77.419 E.0181
G1 X83.912 Y78.215 E.03041
G1 X83.475 Y78.448 E.01338
M73 P34 R1
G1 X82.446 Y77.419 E.0393
G1 X81.776 Y77.419 E.0181
G1 X84.153 Y79.795 E.0908
G1 X84.913 Y81.226 E.04378
G1 X81.106 Y77.419 E.14546
G1 X80.946 Y77.419 E.00432
G1 X80.946 Y77.929 E.01378
G1 X85.674 Y82.657 E.18064
G1 X86.434 Y84.087 E.04378
G1 X80.946 Y78.599 E.20971
G1 X80.946 Y79.269 E.0181
G1 X81.108 Y79.431 E.00618
G1 X81.546 Y79.431 E.01184
G1 X81.546 Y79.869 E.01184
G1 X87.195 Y85.518 E.21585
G1 X87.956 Y86.948 E.04378
G1 X81.546 Y80.539 E.24491
M73 P35 R1
G1 X81.546 Y81.209 E.0181
G1 X88.716 Y88.379 E.27398
G1 X89.477 Y89.809 E.04378
G1 X81.546 Y81.879 E.30304
G1 X81.546 Y82.549 E.0181
G1 X90.238 Y91.24 E.3321
G1 X90.998 Y92.67 E.04378
G1 X81.546 Y83.218 E.36117
G1 X81.546 Y83.569 E.00948
M73 P36 R1
G1 X81.227 Y83.569 E.00862
G1 X91.759 Y94.101 E.40243
G1 X92.519 Y95.531 E.04378
G1 X80.946 Y83.958 E.44223
G1 X80.946 Y84.628 E.0181
G1 X93.28 Y96.962 E.47129
G1 X94.041 Y98.392 E.04378
G1 X80.946 Y85.298 E.50036
M73 P37 R1
G1 X80.946 Y85.968 E.0181
G1 X94.608 Y99.629 E.52203
G1 X94.608 Y100.126 E.01341
G1 X94.434 Y100.126 E.00469
G1 X80.946 Y86.638 E.5154
G1 X80.946 Y87.308 E.0181
G1 X93.764 Y100.126 E.4898
M73 P38 R1
G1 X93.095 Y100.126 E.0181
G1 X80.946 Y87.978 E.4642
G1 X80.946 Y88.647 E.0181
G1 X92.513 Y100.214 E.44198
G1 X92.513 Y100.884 E.0181
G1 X80.946 Y89.317 E.44198
G1 X80.946 Y89.987 E.0181
G1 X92.513 Y101.554 E.44197
M73 P39 R1
G1 X92.513 Y102.224 E.0181
G1 X80.946 Y90.657 E.44197
G1 X80.946 Y91.327 E.0181
G1 X92.2 Y102.581 E.43002
G1 X91.53 Y102.581 E.0181
G1 X80.946 Y91.997 E.40442
M73 P40 R1
G1 X80.946 Y92.667 E.0181
G1 X90.86 Y102.581 E.37883
G1 X90.19 Y102.581 E.0181
G1 X80.946 Y93.337 E.35323
G1 X80.946 Y94.007 E.0181
G1 X89.52 Y102.581 E.32763
G1 X88.851 Y102.581 E.0181
G1 X80.946 Y94.677 E.30203
M73 P41 R1
G1 X80.946 Y95.346 E.0181
G1 X88.181 Y102.581 E.27643
G1 X87.511 Y102.581 E.0181
G1 X80.946 Y96.016 E.25084
G1 X80.946 Y96.686 E.0181
G1 X86.841 Y102.581 E.22524
G1 X86.171 Y102.581 E.0181
G1 X80.946 Y97.356 E.19964
M73 P42 R1
G1 X80.946 Y98.026 E.0181
G1 X85.501 Y102.581 E.17404
G1 X84.831 Y102.581 E.0181
G1 X81.546 Y99.296 E.12552
G1 X81.546 Y99.966 E.0181
G1 X84.161 Y102.581 E.09992
G1 X83.491 Y102.581 E.0181
G1 X81.546 Y100.636 E.07432
G1 X81.546 Y101.306 E.0181
G1 X82.821 Y102.581 E.04872
G1 X82.152 Y102.581 E.0181
G1 X81.546 Y101.976 E.02312
G1 X81.546 Y102.569 E.01604
M73 P43 R1
G1 X81.47 Y102.569 E.00206
G1 X81.693 Y102.792 E.00852
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6300
G1 X81.47 Y102.569 E-.11978
G1 X81.546 Y102.569 E-.02893
G1 X81.546 Y101.976 E-.22563
G1 X82.152 Y102.581 E-.32522
G1 X82.311 Y102.581 E-.06044
; WIPE_END
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
G3 Z.54 I1.211 J.121 P1  F42000
G1 X84.674 Y78.84 Z.54
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8052
M204 S5000
G1 X95.517 Y99.232 E.58066
G1 X95.517 Y101.035 E.04532
G1 X93.422 Y101.035 E.05267
G1 X93.422 Y103.49 E.06172
G1 X80.037 Y103.49 E.33651
G1 X80.037 Y101.66 E.046
G1 X80.637 Y101.66 E.01508
G1 X80.637 Y99.34 E.05833
G1 X80.037 Y99.34 E.01508
G1 X80.037 Y82.66 E.41936
G1 X80.637 Y82.66 E.01508
G1 X80.637 Y80.34 E.05833
G1 X80.037 Y80.34 E.01508
G1 X80.038 Y76.51 E.09628
M73 P44 R1
G1 X89.056 Y76.51 E.22673
G1 X84.727 Y78.812 E.12325
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.662 Y80.58 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-.787 J.928 P1  F42000
G1 X96.105 Y89.431 Z.7
G1 Z.3
G1 E.8 F1800
G1 F8052
M204 S5000
G1 X89.234 Y76.51 E.36793
G1 X95.517 Y76.51 E.15795
G1 X95.517 Y82.51 E.15084
G1 X96.717 Y82.51 E.03017
G1 X96.717 Y84.49 E.04978
G1 X95.517 Y84.49 E.03017
G1 X95.517 Y87.51 E.07593
G1 X96.717 Y87.51 E.03017
G1 X96.717 Y89.49 E.04978
G1 X96.34 Y89.49 E.00949
G1 X96.584 Y89.949 E.01307
G1 X96.425 Y90.034 E.00453
G1 X96.133 Y89.484 E.01564
; WIPE_START
G1 F11668.197
M204 S6000
G1 X95.194 Y87.718 E-.76
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

G1 X94.977 Y86.859
G1 Z.3
G1 E.8 F1800
; FEATURE: Top surface
G1 F8052
M204 S2000
G1 X95.305 Y86.531 E.01166
G1 X95.305 Y85.986
G1 X94.788 Y86.503 E.01839
G1 X94.599 Y86.147
G1 X95.305 Y85.441 E.02512
M73 P45 R1
G1 X95.305 Y84.895
G1 X94.409 Y85.791 E.03185
G1 X94.22 Y85.435
G1 X95.305 Y84.35 E.03858
G1 X95.922 Y84.278
G1 X96.505 Y83.695 E.02072
G1 X96.505 Y83.15
G1 X95.377 Y84.278 E.04011
; WIPE_START
G1 F11668.197
M204 S6000
G1 X96.505 Y83.15 E-.60629
G1 X96.505 Y83.554 E-.15371
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.387 Y82.722 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F8052
M204 S2000
G1 X94.031 Y85.079 E.08379
G1 X93.841 Y84.723
G1 X95.842 Y82.722 E.07113
G1 X95.305 Y82.713
G1 X93.652 Y84.367 E.05878
G1 X93.463 Y84.011
G1 X95.305 Y82.168 E.06551
G1 X95.305 Y81.623
G1 X93.273 Y83.654 E.07224
G1 X93.084 Y83.298
G1 X95.305 Y81.077 E.07897
G1 X95.305 Y80.532
G1 X92.895 Y82.942 E.0857
G1 X92.705 Y82.586
G1 X95.305 Y79.987 E.09243
G1 X95.305 Y79.441
G1 X92.516 Y82.23 E.09916
G1 X92.327 Y81.874
G1 X95.305 Y78.896 E.10589
M73 P46 R1
G1 X95.305 Y78.35
G1 X92.137 Y81.518 E.11262
G1 X91.948 Y81.162
G1 X95.305 Y77.805 E.11936
G1 X95.305 Y77.26
G1 X91.759 Y80.806 E.12609
G1 X91.569 Y80.45
G1 X95.297 Y76.722 E.13253
G1 X94.751 Y76.722
G1 X91.38 Y80.094 E.11987
G1 X91.191 Y79.738
G1 X94.206 Y76.722 E.10721
G1 X93.661 Y76.722
G1 X91.147 Y79.236 E.08937
G1 X90.958 Y78.88
G1 X93.115 Y76.722 E.07671
G1 X92.57 Y76.722
G1 X90.768 Y78.524 E.06405
G1 X90.579 Y78.168
G1 X92.024 Y76.722 E.05139
G1 X91.479 Y76.722
G1 X90.39 Y77.812 E.03873
G1 X90.2 Y77.455
G1 X90.934 Y76.722 E.02607
M73 P47 R1
G1 X90.388 Y76.722
G1 X89.865 Y77.245 E.01859
; WIPE_START
G1 F11668.197
M204 S6000
G1 X90.388 Y76.722 E-.28097
G1 X90.934 Y76.722 E-.20725
G1 X90.428 Y77.228 E-.27178
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.324 Y82.517 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0946865
G1 F8052
M204 S6000
G1 X95.294 Y82.494 E.00015
G1 X95.203 Y82.611 E.00059
; WIPE_START
G1 F18000
G1 X95.294 Y82.494 E-.60658
G1 X95.324 Y82.517 E-.15342
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.07 Y88.494 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F8052
M204 S2000
G1 X96.505 Y88.058 E.01548
G1 X96.296 Y87.722
G1 X95.88 Y88.138 E.01478
M204 S10000
G1 X96.524 Y88.82 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.225502
G1 F8052
M204 S6000
G1 X96.409 Y88.766 E.00159
; LINE_WIDTH: 0.17999
G1 X96.294 Y88.712 E.00121
; LINE_WIDTH: 0.134478
G1 X96.179 Y88.658 E.00083
; LINE_WIDTH: 0.0961594
G1 X96.102 Y88.554 E.00052
; WIPE_START
G1 F18000
G1 X96.179 Y88.658 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I-1.213 J-.092 P1  F42000
G1 X95.305 Y100.166 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F8052
M204 S2000
G1 X94.649 Y100.823 E.02334
G1 X94.103 Y100.823
G1 X95.305 Y99.621 E.04273
G1 X95.232 Y99.148
G1 X93.558 Y100.823 E.05954
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.972 Y99.409 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.21 Y102.807 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F8052
M204 S2000
G1 X92.739 Y103.278 E.01675
G1 X92.194 Y103.278
G1 X93.21 Y102.261 E.03614
G1 X93.21 Y101.716
G1 X91.648 Y103.278 E.05553
M73 P48 R1
G1 X91.103 Y103.278
G1 X93.21 Y101.171 E.07492
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.796 Y102.585 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.557 Y103.278 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F8052
M204 S2000
G1 X95.043 Y98.792 E.15949
G1 X94.854 Y98.436
G1 X90.012 Y103.278 E.17215
G1 X89.467 Y103.278
G1 X94.664 Y98.08 E.18481
G1 X94.475 Y97.724
G1 X88.921 Y103.278 E.19747
G1 X88.376 Y103.278
G1 X94.286 Y97.368 E.21013
G1 X94.096 Y97.012
G1 X87.83 Y103.278 E.22279
G1 X87.285 Y103.278
G1 X93.907 Y96.656 E.23545
G1 X93.718 Y96.3
G1 X86.74 Y103.278 E.24811
M73 P49 R1
G1 X86.194 Y103.278
G1 X93.528 Y95.944 E.26077
G1 X93.339 Y95.588
G1 X85.649 Y103.278 E.27343
G1 X85.103 Y103.278
G1 X93.15 Y95.232 E.28609
G1 X92.96 Y94.875
G1 X84.558 Y103.278 E.29875
G1 X84.013 Y103.278
G1 X92.771 Y94.519 E.31141
G1 X92.582 Y94.163
G1 X83.467 Y103.278 E.32407
G1 X82.922 Y103.278
G1 X92.392 Y93.807 E.33673
G1 X92.203 Y93.451
G1 X82.376 Y103.278 E.34939
M73 P50 R1
G1 X81.831 Y103.278
G1 X92.014 Y93.095 E.36205
G1 X91.824 Y92.739
G1 X81.285 Y103.278 E.37471
G1 X80.74 Y103.278
G1 X91.489 Y92.529 E.3822
G1 X91.3 Y92.172
G1 X80.249 Y103.223 E.39291
G1 X80.249 Y102.678
G1 X91.111 Y91.816 E.38618
G1 X90.921 Y91.46
G1 X80.849 Y101.533 E.35812
M73 P51 R1
G1 X80.849 Y100.987
G1 X90.732 Y91.104 E.35139
G1 X90.543 Y90.748
G1 X80.849 Y100.442 E.34466
G1 X80.849 Y99.896
G1 X90.499 Y90.246 E.3431
G1 X90.31 Y89.89
G1 X80.849 Y99.351 E.33637
G1 X80.527 Y99.128
G1 X90.12 Y89.534 E.3411
G1 X89.931 Y89.178
G1 X80.249 Y98.86 E.34424
G1 X80.249 Y98.315
G1 X89.742 Y88.822 E.33751
M73 P52 R1
G1 X89.552 Y88.466
G1 X80.249 Y97.769 E.33078
G1 X80.249 Y97.224
G1 X89.363 Y88.11 E.32405
G1 X89.174 Y87.754
G1 X80.249 Y96.678 E.31731
M73 P52 R0
G1 X80.249 Y96.133
G1 X88.984 Y87.398 E.31058
G1 X88.795 Y87.042
G1 X80.249 Y95.588 E.30385
G1 X80.249 Y95.042
G1 X88.606 Y86.686 E.29712
G1 X88.416 Y86.33
G1 X80.249 Y94.497 E.29039
M73 P53 R0
G1 X80.249 Y93.951
G1 X88.227 Y85.974 E.28366
G1 X88.038 Y85.617
G1 X80.249 Y93.406 E.27692
G1 X80.249 Y92.861
G1 X87.848 Y85.261 E.27019
G1 X87.659 Y84.905
G1 X80.249 Y92.315 E.26346
G1 X80.249 Y91.77
G1 X87.47 Y84.549 E.25673
G1 X87.28 Y84.193
G1 X80.249 Y91.224 E.25
G1 X80.249 Y90.679
G1 X87.091 Y83.837 E.24327
G1 X86.902 Y83.481
M73 P54 R0
G1 X80.249 Y90.134 E.23653
G1 X80.249 Y89.588
G1 X86.712 Y83.125 E.2298
G1 X86.523 Y82.769
G1 X80.249 Y89.043 E.22307
G1 X80.249 Y88.497
G1 X86.334 Y82.413 E.21634
G1 X85.999 Y82.202
G1 X80.249 Y87.952 E.20443
G1 X80.249 Y87.407
G1 X85.81 Y81.846 E.1977
G1 X85.62 Y81.49
G1 X80.249 Y86.861 E.19097
G1 X80.249 Y86.316
G1 X85.431 Y81.134 E.18423
G1 X85.242 Y80.778
G1 X80.249 Y85.77 E.1775
M73 P55 R0
G1 X80.249 Y85.225
G1 X85.052 Y80.422 E.17077
G1 X85.009 Y79.92
G1 X80.249 Y84.68 E.16922
G1 X80.249 Y84.134
G1 X84.819 Y79.564 E.16249
G1 X84.63 Y79.208
G1 X80.249 Y83.589 E.15575
; WIPE_START
G1 F11668.197
M204 S6000
G1 X81.663 Y82.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.849 Y82.443 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F8052
M204 S2000
G1 X84.441 Y78.852 E.12769
; WIPE_START
G1 F11668.197
M204 S6000
G1 X83.026 Y80.266 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.044 Y77.34 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F8052
M204 S2000
G1 X87.648 Y76.735 E.02149
G1 X87.116 Y76.722
G1 X85.879 Y77.959 E.04398
; WIPE_START
G1 F11668.197
M204 S6000
G1 X87.116 Y76.722 E-.66475
G1 X87.366 Y76.728 E-.09525
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.714 Y78.578 Z.7 F42000
G1 Z.3
G1 E.8 F1800
M73 P56 R0
G1 F8052
M204 S2000
G1 X86.57 Y76.722 E.066
G1 X86.025 Y76.722
G1 X80.849 Y81.898 E.18403
G1 X80.849 Y81.353
G1 X85.48 Y76.722 E.16463
G1 X84.934 Y76.722
G1 X80.849 Y80.807 E.14524
G1 X80.849 Y80.262
G1 X84.389 Y76.722 E.12585
G1 X83.843 Y76.722
G1 X80.438 Y80.128 E.12109
G1 X80.249 Y79.771
G1 X83.298 Y76.722 E.1084
G1 X82.753 Y76.722
G1 X80.249 Y79.226 E.08901
G1 X80.249 Y78.68
G1 X82.207 Y76.722 E.06962
G1 X81.662 Y76.722
G1 X80.249 Y78.135 E.05022
G1 X80.249 Y77.589
G1 X81.116 Y76.722 E.03083
; WIPE_START
G1 F11668.197
M204 S6000
G1 X80.249 Y77.589 E-.46602
G1 X80.249 Y78.135 E-.20726
G1 X80.411 Y77.973 E-.08673
; WIPE_END
M73 P57 R0
G1 E-.04 F1800
M204 S10000
G1 X85.816 Y77.896 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192957
G1 F8052
M204 S6000
G1 X85.663 Y78.01 E.00197
; LINE_WIDTH: 0.148018
G1 X85.51 Y78.123 E.00141
; LINE_WIDTH: 0.103079
G1 X85.357 Y78.236 E.00085
M204 S10000
G1 X84.651 Y78.516 F42000
; LINE_WIDTH: 0.19792
G1 F8052
M204 S6000
G1 X84.519 Y78.613 E.00175
; LINE_WIDTH: 0.162113
G1 X84.382 Y78.716 E.00143
; LINE_WIDTH: 0.128081
G1 X84.387 Y78.743 E.00017
; LINE_WIDTH: 0.0893314
G2 X84.408 Y78.791 I.062 J.002 E.00019
; WIPE_START
G1 F18000
G1 X84.387 Y78.743 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.981 Y77.277 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.192952
G1 F8052
M204 S6000
G1 X86.828 Y77.39 E.00197
; LINE_WIDTH: 0.148015
G1 X86.675 Y77.504 E.00141
; LINE_WIDTH: 0.103078
G1 X86.522 Y77.617 E.00085
; CHANGE_LAYER
; Z_HEIGHT: 0.38
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X86.675 Y77.504 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/9
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.7 I-1.212 J-.106 P1  F42000
G1 X86.385 Y80.823 Z.7
G1 Z.38
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F1206
M204 S6000
G1 X86.385 Y78.783 E.07352
G1 X87.271 Y78.312 E.03614
G1 X87.271 Y82.119 E.13719
G1 X88.156 Y83.785 E.06798
G1 X88.156 Y77.841 E.21418
G1 X88.884 Y77.454 E.02969
G1 X89.042 Y77.751 E.01213
M73 P58 R0
G1 X89.042 Y84.229 E.2334
G1 X89.928 Y84.229 E.03191
G1 X89.928 Y79.417 E.17338
G1 X90.813 Y81.083 E.06798
G1 X90.813 Y81.517 E.01563
; WIPE_START
G1 F4800
G1 X90.813 Y81.083 E-.16487
G1 X90.078 Y79.7 E-.59513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.78 I-1.217 J-.024 P1  F42000
G1 X89.928 Y87.486 Z.78
G1 Z.38
G1 E.8 F1800
G1 F1206
M204 S6000
G1 X89.928 Y87.114 E.0134
G1 X90.813 Y87.114 E.03191
G1 X90.813 Y88.782 E.0601
G1 X91.699 Y90.448 E.06798
G1 X91.699 Y87.114 E.12012
G1 X92.584 Y87.114 E.03191
M73 P59 R0
G1 X92.584 Y92.113 E.18014
G1 X92.995 Y92.886 E.03152
G1 X93.47 Y92.886 E.01711
G1 X93.47 Y87.114 E.20797
G1 X94.02 Y87.114 E.01982
G1 X94.356 Y87.746 E.02577
G1 X94.356 Y92.886 E.18522
G1 X95.241 Y92.886 E.03191
G1 X95.241 Y89.411 E.1252
G1 X95.964 Y90.771 E.05548
G1 X96.127 Y90.821 E.00613
M73 P60 R0
G1 X96.127 Y92.886 E.07442
G1 X97.013 Y92.886 E.03191
G1 X97.013 Y90.573 E.08332
G1 X97.321 Y90.41 E.01258
G1 X97.47 Y89.925 E.01827
G1 X97.47 Y87.114 E.10128
G1 X97.898 Y87.114 E.01544
G1 X97.898 Y93.059 E.21422
; WIPE_START
G1 F4800
G1 X97.898 Y91.059 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.78 I-.973 J.731 P1  F42000
G1 X101.441 Y95.771 Z.78
G1 Z.38
G1 E.8 F1800
; FEATURE: Support transition
G1 F1206
M204 S6000
G1 X101.441 Y101.543 E.20797
G1 X100.555 Y101.543 E.03191
G1 X100.555 Y95.771 E.20797
M73 P61 R0
G1 X99.67 Y95.771 E.03191
G1 X99.67 Y101.543 E.20797
G1 X98.784 Y101.543 E.03191
G1 X98.784 Y95.771 E.20797
G1 X97.898 Y95.771 E.03191
G1 X97.898 Y101.543 E.20797
G1 X97.013 Y101.543 E.03191
M73 P62 R0
G1 X97.013 Y95.771 E.20797
G1 X96.127 Y95.771 E.03191
G1 X96.127 Y98.776 E.10828
G3 X96.27 Y99.113 I-.605 J.455 E.01332
G1 X96.27 Y101.47 E.08492
G1 X96.197 Y101.543 E.00372
; WIPE_START
G1 F3000
G1 X96.27 Y101.47 E-.03924
G1 X96.27 Y99.573 E-.72077
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.78 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 0.46
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 4/9
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
G1 X85.35 Y80.065
G1 Z.46
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
; LAYER_HEIGHT: 0.16
G1 F1206
M204 S5000
G1 X86.162 Y81.594 E.03874
M73 P63 R0
G1 X86.299 Y81.851 E.00652
G1 X86.103 Y81.955 E.00498
G1 X85.153 Y80.169 E.04525
G1 X85.297 Y80.093 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X86.162 Y81.594 E-.65826
G1 X86.288 Y81.83 E-.10175
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I.925 J.791 P1  F42000
G1 X89.833 Y77.681 Z.86
G1 Z.46
G1 E.8 F1800
G1 F1206
M204 S5000
G1 X90.029 Y77.577 E.00498
G1 X90.955 Y79.317 E.04411
G1 X90.979 Y79.362 E.00115
G1 X90.782 Y79.467 E.00498
G1 X89.861 Y77.734 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X90.029 Y77.577 E-.08755
G1 X90.86 Y79.139 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.443 Y85.878 Z.86 F42000
G1 X96.151 Y89.09 Z.86
G1 Z.46
G1 E.8 F1800
G1 F1206
M204 S5000
G1 X96.428 Y89.61 E.01319
G1 X96.612 Y89.958 E.00881
G1 X96.416 Y90.062 E.00498
G1 X95.467 Y88.277 E.04525
G1 X95.663 Y88.172 E.00498
G1 X96.123 Y89.037 E.02192
; WIPE_START
G1 F12000
M204 S6000
G1 X96.428 Y89.61 E-.24678
G1 X96.612 Y89.958 E-.14956
G1 X96.416 Y90.062 E-.08453
G1 X96.071 Y89.414 E-.27913
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I-.29 J-1.182 P1  F42000
G1 X90.983 Y90.66 Z.86
G1 Z.46
G1 E.8 F1800
M73 P64 R0
G1 F1206
M204 S5000
G1 X91.796 Y92.189 E.03874
G1 X91.933 Y92.446 E.00652
G1 X91.736 Y92.55 E.00498
G1 X90.787 Y90.765 E.04525
G1 X90.93 Y90.688 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X91.796 Y92.189 E-.65827
G1 X91.922 Y92.425 E-.10173
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.245 Y99.296 Z.86 F42000
G1 X95.338 Y99.489 Z.86
G1 Z.46
G1 E.8 F1800
G1 F1206
M204 S5000
G1 X95.338 Y99.711 E.00498
G1 X95.116 Y99.711 E.00498
G1 X95.116 Y99.489 E.00498
G1 X95.278 Y99.489 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X95.338 Y99.711 E-.20902
G1 X95.116 Y99.711 E-.20181
G1 X95.116 Y99.489 E-.20181
G1 X95.278 Y99.489 E-.14737
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
; layer num/total_layer_count: 5/9
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
G1 X95.525 Y101.514 F42000
G1 Z.62
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F1225
M204 S6000
G1 X101.47 Y101.514 E.21423
G1 X101.47 Y100.628 E.03191
G1 X96.12 Y100.628 E.1928
G1 X96.12 Y99.742 E.03191
G1 X101.47 Y99.742 E.1928
M73 P65 R0
G1 X101.47 Y98.857 E.03191
G1 X96 Y98.857 E.19712
G1 X95.699 Y98.29 E.02313
G1 X95.699 Y97.971 E.01149
G1 X101.47 Y97.971 E.20798
G1 X101.47 Y97.085 E.03191
G1 X95.699 Y97.085 E.20798
G1 X95.699 Y96.2 E.03191
G1 X101.644 Y96.2 E.21423
; WIPE_START
M73 P66 R0
G1 F4800
G1 X99.644 Y96.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.181 J-.295 P1  F42000
G1 X98.758 Y92.657 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F1225
M204 S6000
G1 X92.715 Y92.657 E.21776
G1 X92.773 Y92.468 E.00713
G1 X92.402 Y91.771 E.02842
G1 X98.758 Y91.771 E.22902
; WIPE_START
G1 F4800
G1 X96.758 Y91.771 E-.76
; WIPE_END
M73 P67 R0
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.109 J.501 P1  F42000
G1 X98.758 Y87.343 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F1225
M204 S6000
G1 X97.32 Y87.343 E.05184
G1 X97.32 Y88.229 E.03191
G1 X98.585 Y88.229 E.04558
G1 X98.585 Y89.114 E.03191
G1 X97.32 Y89.114 E.04558
G1 X97.32 Y89.73 E.02219
G1 X97.446 Y90 E.01074
G1 X98.585 Y90 E.04103
G1 X98.585 Y90.886 E.03191
G1 X91.932 Y90.886 E.23974
G1 X91.461 Y90 E.03614
G1 X95.555 Y90 E.14752
G1 X95.084 Y89.114 E.03614
G1 X90.82 Y89.114 E.15364
M73 P68 R0
G1 X90.349 Y88.229 E.03614
G1 X94.635 Y88.229 E.15443
G1 X94.689 Y88.052 E.00666
G1 X94.312 Y87.343 E.02893
G1 X89.754 Y87.343 E.16424
; WIPE_START
G1 F4800
G1 X91.754 Y87.343 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.103 J-.514 P1  F42000
G1 X90.101 Y83.8 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F1225
M204 S6000
G1 X87.994 Y83.8 E.07592
G1 X87.523 Y82.915 E.03614
G1 X89.928 Y82.915 E.08663
G1 X89.928 Y82.029 E.03191
G1 X87.091 Y82.029 E.10221
M73 P69 R0
G1 X87.139 Y81.872 E.0059
G1 X86.752 Y81.143 E.02975
G1 X91.015 Y81.143 E.15364
G1 X90.544 Y80.258 E.03614
G1 X86.281 Y80.258 E.15364
G1 X85.804 Y79.372 E.03624
G1 X89.904 Y79.372 E.14772
G1 X89.433 Y78.486 E.03614
G1 X86.623 Y78.486 E.10126
G1 X87.042 Y78.457 E.01513
G1 X87.042 Y78.264 E.00697
G1 X88.288 Y77.601 E.05088
G1 X89.192 Y77.601 E.03258
; WIPE_START
G1 F4800
M73 P70 R0
G1 X88.288 Y77.601 E-.34356
G1 X87.321 Y78.115 E-.41644
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-.856 J-.865 P1  F42000
G1 X85.35 Y80.065 Z1.02
G1 Z.62
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
; LAYER_HEIGHT: 0.16
G1 F1225
M204 S5000
G1 X85.712 Y80.746 E.01726
G1 X86.299 Y81.851 E.028
G1 X86.103 Y81.955 E.00498
G1 X85.153 Y80.169 E.04525
G1 X85.297 Y80.093 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X85.712 Y80.746 E-.29395
G1 X86.288 Y81.829 E-.46605
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I.925 J.791 P1  F42000
G1 X89.833 Y77.681 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F1225
M204 S5000
G1 X90.029 Y77.577 E.00498
G1 X90.729 Y78.893 E.03337
G1 X90.979 Y79.362 E.01189
G1 X90.782 Y79.467 E.00498
G1 X89.861 Y77.734 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X90.029 Y77.577 E-.08755
G1 X90.729 Y78.893 E-.56666
G1 X90.86 Y79.139 E-.10579
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.296 Y85.955 Z1.02 F42000
G1 X95.467 Y88.277 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F1225
M204 S5000
G1 X95.663 Y88.172 E.00498
G1 X96.238 Y89.254 E.02741
G1 X96.612 Y89.958 E.01784
G1 X96.416 Y90.062 E.00498
G1 X95.495 Y88.33 E.04391
; WIPE_START
M73 P71 R0
G1 F12000
M204 S6000
G1 X95.663 Y88.172 E-.08756
G1 X96.238 Y89.254 E-.46548
G1 X96.494 Y89.735 E-.20696
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I-.202 J-1.2 P1  F42000
G1 X90.983 Y90.66 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F1225
M204 S5000
G1 X91.345 Y91.341 E.01726
G1 X91.933 Y92.446 E.028
G1 X91.736 Y92.55 E.00498
G1 X90.787 Y90.765 E.04525
G1 X90.93 Y90.688 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X91.345 Y91.341 E-.29396
G1 X91.921 Y92.424 E-.46604
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.245 Y99.295 Z1.02 F42000
G1 X95.338 Y99.489 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F1225
M204 S5000
G1 X95.338 Y99.711 E.00498
G1 X95.116 Y99.711 E.00498
G1 X95.116 Y99.489 E.00498
G1 X95.278 Y99.489 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X95.338 Y99.711 E-.20902
G1 X95.116 Y99.711 E-.20181
G1 X95.116 Y99.489 E-.20181
G1 X95.278 Y99.489 E-.14737
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
; layer num/total_layer_count: 6/9
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S204
; OBJECT_ID: 15
G1 X96.127 Y95.598 F42000
G1 Z.78
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F1200
M204 S6000
G1 X96.127 Y101.543 E.14947
G1 X97.013 Y101.543 E.02227
G1 X97.013 Y95.771 E.14511
M73 P72 R0
G1 X97.898 Y95.771 E.02227
G1 X97.898 Y101.543 E.14511
G1 X98.784 Y101.543 E.02227
G1 X98.784 Y95.771 E.14511
G1 X99.67 Y95.771 E.02227
G1 X99.67 Y101.543 E.14511
G1 X100.555 Y101.543 E.02227
G1 X100.555 Y95.771 E.14511
M73 P73 R0
G1 X101.441 Y95.771 E.02227
G1 X101.441 Y101.716 E.14947
; WIPE_START
G1 F4800
G1 X101.441 Y99.716 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I.942 J-.771 P1  F42000
G1 X85.35 Y80.065 Z1.18
G1 Z.78
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F1200
M204 S5000
G1 X86.299 Y81.851 E.04525
G1 X86.103 Y81.955 E.00498
G1 X85.153 Y80.169 E.04525
G1 X85.297 Y80.093 E.00364
; WIPE_START
G1 F12000
M204 S6000
M73 P74 R0
G1 X86.288 Y81.83 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I.914 J.804 P1  F42000
G1 X90.029 Y77.577 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X90.979 Y79.362 E.04525
G1 X90.782 Y79.467 E.00498
G1 X89.833 Y77.681 E.04525
G1 X89.976 Y77.605 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X90.967 Y79.342 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.4 Y86.159 Z1.18 F42000
G1 X95.467 Y88.277 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X95.663 Y88.172 E.00498
G1 X96.048 Y88.897 E.01837
G1 X96.612 Y89.958 E.02688
G1 X96.416 Y90.062 E.00498
G1 X95.495 Y88.33 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X95.663 Y88.172 E-.08756
G1 X96.048 Y88.897 E-.31199
G1 X96.494 Y89.735 E-.36045
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I-.202 J-1.2 P1  F42000
G1 X90.983 Y90.66 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X91.933 Y92.446 E.04525
G1 X91.736 Y92.55 E.00498
G1 X90.787 Y90.765 E.04525
G1 X90.93 Y90.688 E.00363
; WIPE_START
G1 F12000
M204 S6000
M73 P75 R0
G1 X91.921 Y92.426 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.245 Y99.296 Z1.18 F42000
G1 X95.338 Y99.489 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X95.338 Y99.711 E.00498
G1 X95.116 Y99.711 E.00498
G1 X95.116 Y99.489 E.00498
G1 X95.278 Y99.489 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X95.338 Y99.711 E-.20902
G1 X95.116 Y99.711 E-.20181
G1 X95.116 Y99.489 E-.20181
G1 X95.278 Y99.489 E-.14737
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
; layer num/total_layer_count: 7/9
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
G1 X85.724 Y80.344 F42000
G1 Z.94
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S6000
G1 X85.891 Y80.255 E.00513
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X89.688 Y78.236 E.11652
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X89.855 Y78.147 E.00513
M106 S204
M106 S255
G1 X90.408 Y79.188 E.03194
M106 S204
M106 S255
G1 X90.241 Y79.277 E.00513
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X86.444 Y81.296 E.11652
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X86.277 Y81.385 E.00513
M106 S204
M106 S255
G1 X85.752 Y80.397 E.03031
M106 S204
M204 S250
G1 X85.377 Y80.074 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
M204 S5000
G1 X85.703 Y79.901 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X89.5 Y77.882 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
G1 X89.825 Y77.709 E.00928
G1 F1200
G1 X90.021 Y77.605 E.00556
G1 X90.26 Y78.056 E.01282
G1 X90.448 Y78.409 E.01006
G1 X90.636 Y78.762 E.01006
M73 P76 R0
G1 X90.762 Y79.001 E.00679
G1 X90.95 Y79.354 E.01006
G1 X90.755 Y79.457 E.00556
M106 S255
G1 F600
G1 X90.429 Y79.631 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X86.633 Y81.649 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
G1 X86.307 Y81.823 E.00928
G1 F1200
G1 X86.112 Y81.926 E.00556
G1 X85.924 Y81.573 E.01006
G1 X85.736 Y81.22 E.01006
G1 X85.548 Y80.867 E.01006
G1 X85.182 Y80.178 E.01961
G1 X85.324 Y80.103 E.00405
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.703 Y79.901 E-.16302
G1 X87.09 Y79.164 E-.59698
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

G1 X89.88 Y78.551
G1 Z.94
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.475956
M106 S255
G1 F3000
M204 S6000
G1 X86.198 Y80.509 E.12008
G1 X86.405 Y80.899 E.01271
G1 X90.088 Y78.941 E.12008
M106 S204
; WIPE_START
G1 X88.322 Y79.88 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I-.946 J.765 P1  F42000
G1 X95.489 Y88.743 Z1.34
G1 Z.94
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S6000
G1 X96.042 Y89.783 E.03194
M106 S204
M106 S255
G1 X95.875 Y89.872 E.00513
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X92.078 Y91.891 E.11652
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X91.911 Y91.98 E.00513
M106 S204
M106 S255
G1 X91.358 Y90.939 E.03194
M106 S204
M106 S255
G1 X91.525 Y90.85 E.00513
M106 S204
; FEATURE: Overhang wall
M106 S255
M73 P77 R0
G1 F3000
M204 S5000
G1 X95.321 Y88.832 E.11652
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X95.436 Y88.771 E.00351
M106 S204
M204 S250
G1 X95.459 Y88.305 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X95.654 Y88.201 E.00556
G1 X95.84 Y88.55 E.00995
G1 X96.02 Y88.89 E.00966
G1 X96.208 Y89.243 E.01006
G1 X96.396 Y89.596 E.01006
G1 X96.584 Y89.949 E.01006
G1 X96.389 Y90.053 E.00556
M106 S255
G1 F600
G1 X96.063 Y90.226 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X92.266 Y92.245 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
G1 X91.94 Y92.418 E.00928
G1 F1200
G1 X91.745 Y92.522 E.00556
G1 X91.557 Y92.169 E.01006
G1 X91.37 Y91.815 E.01006
G1 X91.182 Y91.462 E.01006
G1 X91.003 Y91.127 E.00956
G1 X90.816 Y90.774 E.01006
G1 X91.011 Y90.67 E.00556
G1 F720
G1 X91.337 Y90.497 E.00928
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X95.133 Y88.478 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X95.406 Y88.333 E.00777
M106 S204
M204 S10000
M73 P80 R0
G1 X95.514 Y89.146 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.475946
M106 S255
G1 F3000
M204 S6000
G1 X91.831 Y91.105 E.12008
G1 X92.039 Y91.495 E.01271
G1 X95.721 Y89.536 E.12008
M106 S204
; WIPE_START
G1 X93.956 Y90.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I-1.203 J.185 P1  F42000
G1 X95.338 Y99.489 Z1.34
G1 Z.94
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F1200
M204 S5000
G1 X95.338 Y99.711 E.00498
G1 X95.116 Y99.711 E.00498
G1 X95.116 Y99.489 E.00498
G1 X95.278 Y99.489 E.00363
; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X95.338 Y99.711 E-.20902
G1 X95.116 Y99.711 E-.20181
G1 X95.116 Y99.489 E-.20181
G1 X95.278 Y99.489 E-.14737
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/9
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.34 I1.078 J-.564 P1  F42000
G1 X85.182 Y80.178 Z1.34
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X90.021 Y77.605 E.13778
G1 X90.035 Y77.632 E.00075
G1 X90.95 Y79.354 E.04903
G1 X86.112 Y81.926 E.13778
G1 X85.21 Y80.231 E.04827
; WIPE_START
G1 F11668.197
M204 S6000
M73 P81 R0
G1 X86.966 Y79.273 E-.76
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

G1 X90.372 Y78.719
G1 Z1.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X89.68 Y78.027 E.0246
G1 X89.324 Y78.216
G1 X90.475 Y79.366 E.0409
G1 X90.118 Y79.556
G1 X88.968 Y78.405 E.0409
G1 X88.612 Y78.595
G1 X89.762 Y79.745 E.0409
G1 X89.406 Y79.934
G1 X88.256 Y78.784 E.0409
G1 X87.9 Y78.973
G1 X89.05 Y80.124 E.0409
G1 X88.694 Y80.313
G1 X87.544 Y79.163 E.0409
G1 X87.188 Y79.352
G1 X88.338 Y80.502 E.0409
G1 X87.982 Y80.692
M73 P82 R0
G1 X86.832 Y79.541 E.0409
G1 X86.476 Y79.731
G1 X87.626 Y80.881 E.0409
G1 X87.27 Y81.07
G1 X86.12 Y79.92 E.0409
G1 X85.763 Y80.109
G1 X86.914 Y81.26 E.0409
G1 X86.558 Y81.449
G1 X85.576 Y80.467 E.03491
; WIPE_START
G1 F11668.197
M204 S6000
G1 X86.558 Y81.449 E-.52765
G1 X86.914 Y81.26 E-.15325
G1 X86.767 Y81.112 E-.0791
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.829 J.891 P1  F42000
G1 X90.03 Y78.075 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104057
G1 F1200
M204 S6000
G1 X89.894 Y77.891 E.00104
; WIPE_START
G1 F18000
G1 X90.03 Y78.075 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.535 Y79.334 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.0958175
G1 F1200
M204 S6000
G1 X90.638 Y79.256 E.00051
G2 X90.624 Y79.206 I-.061 J-.011 E.00022
; LINE_WIDTH: 0.107744
G1 X90.519 Y79.065 E.00084
; LINE_WIDTH: 0.150813
G1 X90.414 Y78.923 E.00134
; LINE_WIDTH: 0.193882
G1 X90.31 Y78.781 E.00183
; WIPE_START
G1 F18000
G1 X90.414 Y78.923 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.665 J-1.019 P1  F42000
G1 X86.29 Y81.613 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.20465
G1 F1200
M204 S6000
G1 X86.166 Y81.445 E.00231
; LINE_WIDTH: 0.155033
G1 X86.042 Y81.278 E.00164
; LINE_WIDTH: 0.105417
G1 X85.918 Y81.11 E.00097
; WIPE_START
G1 F18000
G1 X86.042 Y81.278 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.711 J.987 P1  F42000
M73 P83 R0
G1 X95.654 Y88.201 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X96.584 Y89.949 E.04978
G1 X91.745 Y92.522 E.13778
G1 X90.816 Y90.774 E.04978
G1 X95.601 Y88.229 E.13627
; WIPE_START
G1 F11668.197
M204 S6000
G1 X96.584 Y89.949 E-.75275
G1 X96.567 Y89.958 E-.00725
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.946 Y89.201 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X95.349 Y88.604 E.02123
G1 X94.992 Y88.793
G1 X96.143 Y89.943 E.0409
G1 X95.787 Y90.133
G1 X94.636 Y88.982 E.0409
G1 X94.28 Y89.172
M73 P84 R0
G1 X95.431 Y90.322 E.0409
G1 X95.075 Y90.511
G1 X93.924 Y89.361 E.0409
G1 X93.568 Y89.55
G1 X94.719 Y90.701 E.0409
G1 X94.362 Y90.89
G1 X93.212 Y89.74 E.0409
G1 X92.856 Y89.929
G1 X94.006 Y91.079 E.0409
G1 X93.65 Y91.269
G1 X92.5 Y90.118 E.0409
G1 X92.144 Y90.308
G1 X93.294 Y91.458 E.0409
G1 X92.938 Y91.647
G1 X91.788 Y90.497 E.0409
G1 X91.432 Y90.686
G1 X92.582 Y91.837 E.0409
G1 X92.226 Y92.026
G1 X91.149 Y90.949 E.03828
M204 S10000
G1 X91.291 Y90.779 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116893
G1 F1200
M204 S6000
G2 X91.105 Y90.907 I.174 J.449 E.00123
; WIPE_START
G1 F18000
G1 X91.291 Y90.779 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.255 J1.19 P1  F42000
G1 X96.222 Y89.722 Z1.5
G1 Z1.1
M73 P85 R0
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F1200
M204 S6000
G1 X96.109 Y89.569 E.00085
; LINE_WIDTH: 0.148013
G1 X95.996 Y89.416 E.00141
; LINE_WIDTH: 0.192949
G1 X95.883 Y89.263 E.00197
; WIPE_START
G1 F18000
G1 X95.996 Y89.416 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.689 J-1.003 P1  F42000
G1 X91.941 Y92.199 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.240057
G1 F1200
M204 S6000
G1 X91.829 Y92.048 E.00253
; LINE_WIDTH: 0.1945
G1 X91.716 Y91.896 E.00197
; LINE_WIDTH: 0.148944
G1 X91.604 Y91.744 E.00141
; LINE_WIDTH: 0.103388
G1 X91.492 Y91.592 E.00085
; WIPE_START
G1 F18000
G1 X91.604 Y91.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.88 Y98.638 Z1.5 F42000
G1 X95.295 Y99.51 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F833.52
M204 S5000
G1 X95.358 Y99.51 E.00159
M106 S255
G1 F600
G1 X95.727 Y99.51 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X96.707 Y99.51 E.02655
G1 X96.482 Y99.087 E.013
G1 X99.378 Y97.547 E.08888
G1 X99.448 Y97.679 E.00406
M106 S204
M106 S255

G1 X99.744 Y98.235 E.01707
G1 X96.848 Y99.775 E.08888
G1 X96.802 Y99.69 E.00262
G1 X95.727 Y99.69 E.02914
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
M73 P86 R0
G1 X95.358 Y99.69 E.00928
M106 S204
G1 F1200
G1 X95.137 Y99.69 E.00556
G1 X95.137 Y99.51 E.00453
G1 X95.235 Y99.51 E.00246
; WIPE_START
G1 F3487.639
M204 S6000
G1 X95.358 Y99.51 E-.0468
G1 X95.727 Y99.51 E-.14022
G1 X96.707 Y99.51 E-.37228
G1 X96.482 Y99.087 E-.18225
G1 X96.525 Y99.064 E-.01845
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.794 J.922 P1  F42000
G1 X96.842 Y99.337 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.413693
G1 F1200
M204 S6000
G1 X99.384 Y97.985 E.07121
; CHANGE_LAYER
; Z_HEIGHT: 1.26
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11862.173
G1 X97.618 Y98.924 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/9
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.5 I-.28 J-1.184 P1  F42000
G1 X95.137 Y99.51 Z1.5
G1 Z1.26
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X96.707 Y99.51 E.03946
G1 X96.482 Y99.087 E.01206
G1 X99.378 Y97.547 E.08246
G1 X99.673 Y98.103 E.01584
G1 X99.744 Y98.235 E.00377
G1 X96.848 Y99.775 E.08246
G1 X96.802 Y99.69 E.00243
M73 P87 R0
G1 X95.137 Y99.69 E.04187
G1 X95.137 Y99.57 E.00302
; WIPE_START
G1 F11668.197
M204 S6000
G1 X96.707 Y99.51 E-.59691
G1 X96.505 Y99.131 E-.16309
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

G1 X96.842 Y99.337
G1 Z1.26
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.413685
G1 F1200
M204 S6000
G1 X99.384 Y97.985 E.0712
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F11862.448
G1 X97.618 Y98.924 E-.76
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
M73 P88 R0
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
M73 P89 R0
G1 X65 F12000
M73 P90 R0
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
M73 P91 R0
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


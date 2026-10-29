; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 3m 8s; total estimated time: 3m 27s
; total layer number: 19
; total filament length [mm] : 123.81
; total filament volume [cm^3] : 297.79
; total filament weight [g] : 0.37
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 1.52
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
; initial_layer_print_height = 0.08
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
; layer_height = 0.08
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
; Z_HEIGHT: 0.08
; LAYER_HEIGHT: 0.08
G1 E-.8 F1800
; layer num/total_layer_count: 1/19
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
M73 P7 R3
G1 X85.558 Y73.752 F42000
M204 S6000
M73 P9 R3
G1 Z.4
G1 Z.08
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X85.558 Y75.416 E.02618
G1 X86.094 Y75.416 E.00844
G1 X86.094 Y73.969 E.02277
G1 X86.631 Y73.969 E.00844
G1 X86.631 Y75.416 E.02277
G1 X87.167 Y75.416 E.00844
G1 X87.167 Y73.969 E.02277
G1 X87.703 Y73.969 E.00844
G1 X87.703 Y75.416 E.02277
G1 X88.24 Y75.416 E.00844
G1 X88.24 Y73.969 E.02277
G1 X88.776 Y73.969 E.00844
G1 X88.776 Y75.416 E.02277
G1 X89.313 Y75.416 E.00844
G1 X89.313 Y73.969 E.02277
G1 X89.849 Y73.969 E.00844
G1 X89.849 Y75.416 E.02277
G1 X90.386 Y75.416 E.00844
G1 X90.386 Y73.969 E.02277
G1 X90.922 Y73.969 E.00844
G1 X90.922 Y75.633 E.02619
M204 S6000
G1 X91.801 Y75.778 F42000
G1 F3000
M204 S500
G1 X91.801 Y73.534 E.03531
G1 X84.995 Y73.534 E.10711
G1 X84.995 Y75.85 E.03644
G1 X91.801 Y75.85 E.10711
; WIPE_START
G1 X89.801 Y75.85 E-.76
; WIPE_END
M73 P10 R3
G1 E-.04 F1800
M204 S6000
G1 X85.558 Y79.883 Z.48 F42000
G1 Z.08
G1 E.8 F1800
G1 F3000
M204 S500
G1 X85.558 Y79.256 E.00987
G1 X86.094 Y78.971 E.00956
G1 X86.094 Y80.429 E.02295
G1 X86.631 Y81.438 E.01798
G1 X86.631 Y78.686 E.04332
G1 X87.167 Y78.401 E.00956
G1 X87.167 Y82.447 E.06369
G1 X87.703 Y83.456 E.01798
G1 X87.703 Y78.115 E.08406
G1 X88.077 Y77.916 E.00667
G1 X88.24 Y78.222 E.00545
G1 X88.24 Y84.465 E.09825
G1 X88.776 Y85.474 E.01798
G1 X88.776 Y79.231 E.09825
G1 X89.313 Y80.24 E.01798
G1 X89.313 Y86.483 E.09825
G1 X89.849 Y87.492 E.01798
G1 X89.849 Y81.249 E.09825
G1 X90.386 Y82.258 E.01798
G1 X90.386 Y88.501 E.09825
M73 P11 R3
G1 X90.922 Y89.51 E.01798
G1 X90.922 Y83.267 E.09825
G1 X91.366 Y84.102 E.01488
G1 X91.366 Y85.58 E.02327
G1 X91.459 Y85.58 E.00146
G1 X91.459 Y90.519 E.07772
G1 X91.995 Y91.528 E.01798
G1 X91.995 Y85.58 E.0936
G1 X92.152 Y85.58 E.00247
G1 X92.532 Y86.294 E.01271
G1 X92.532 Y92.537 E.09825
G1 X93.068 Y93.546 E.01798
G1 X93.068 Y87.303 E.09825
G1 X93.605 Y88.312 E.01798
G1 X93.605 Y94.42 E.09613
G1 X94.138 Y94.42 E.0084
G1 X94.141 Y95.564 E.018
G1 X94.141 Y89.321 E.09825
G1 X94.678 Y90.33 E.01798
G1 X94.678 Y96.573 E.09825
M73 P12 R3
G1 X95.214 Y97.582 E.01798
G1 X95.214 Y91.102 E.10197
G1 X95.751 Y91.266 E.00883
G1 X95.751 Y97.822 E.10318
G1 X96.287 Y97.822 E.00844
G1 X96.287 Y90.993 E.10748
G1 X96.823 Y90.708 E.00956
G1 X96.823 Y97.822 E.11197
G1 X97.36 Y97.822 E.00844
G1 X97.36 Y88.483 E.14698
G1 X97.896 Y88.483 E.00844
G1 X97.896 Y94.92 E.1013
G1 X98.433 Y94.92 E.00844
G1 X98.433 Y88.483 E.1013
G1 X98.969 Y88.483 E.00844
G1 X98.969 Y94.92 E.1013
G1 X99.506 Y94.92 E.00844
G1 X99.506 Y88.483 E.1013
M73 P13 R3
G1 X100.042 Y88.483 E.00844
G1 X100.042 Y94.637 E.09685
M204 S6000
G1 X96.823 Y86.918 F42000
G1 F3000
M204 S500
G1 X96.823 Y85.58 E.02105
G1 X96.287 Y85.585 E.00844
G1 X96.287 Y86.633 E.0165
; WIPE_START
G1 X96.287 Y85.585 E-.39832
G1 X96.823 Y85.58 E-.20386
G1 X96.823 Y85.996 E-.15782
; WIPE_END
M73 P13 R2
G1 E-.04 F1800
M204 S6000
G1 X91.801 Y83.993 Z.48 F42000
G1 Z.08
G1 E.8 F1800
G1 F3000
M204 S500
G1 X91.801 Y85.146 E.01814
G1 X92.414 Y85.146 E.00964
G1 X95.363 Y90.693 E.09888
G1 X95.72 Y90.802 E.00587
G1 X96.579 Y90.346 E.01531
G1 X96.712 Y89.886 E.00753
G1 X96.712 Y87.114 E.04364
G1 X96.449 Y86.85 E.00587
G1 X95.512 Y86.85 E.01474
G1 X95.512 Y85.15 E.02675
G1 X97.606 Y85.146 E.03296
G1 X97.606 Y88.049 E.04568
G1 X100.509 Y88.049 E.04568
G1 X100.509 Y94.854 E.10711
G1 X100.106 Y94.854 E.00634
G1 X100.106 Y95.354 E.00787
M73 P14 R2
G1 X98.106 Y95.354 E.03148
G1 X98.106 Y98.257 E.04568
G1 X95.203 Y98.257 E.04568
G1 X95.203 Y98.487 E.00362
G1 X93.704 Y95.666 E.05028
G1 X93.704 Y94.854 E.01278
G1 X93.272 Y94.854 E.0068
G1 X84.902 Y79.113 E.28058
G1 X88.257 Y77.329 E.0598
G1 X91.767 Y83.929 E.11765
; WIPE_START
G1 X90.828 Y82.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X93.446 Y89.333 Z.48 F42000
G1 X96.871 Y98.708 Z.48
G1 Z.08
G1 E.8 F1800
; FEATURE: Support transition
; LINE_WIDTH: 0.42
G1 F3000
M204 S500
G1 X96.169 Y98.708 E.00921
G1 X96.169 Y104.514 E.07623
G1 X95.655 Y104.514 E.00675
G1 X95.655 Y98.708 E.07623
M73 P15 R2
G1 X95.968 Y98.708 E.00411
M204 S6000
G1 X95.203 Y101.74 F42000
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X95.203 Y101.695 E.00071
G1 X93.417 Y101.695 E.02811
G1 X93.417 Y103.195 E.02361
G1 X93.949 Y103.195 E.00836
G1 X94.212 Y103.459 E.00587
G1 X94.212 Y103.563 E.00164
G1 X95.203 Y103.563 E.0156
G1 X95.203 Y101.813 E.02754
M204 S6000
G1 X94.678 Y103.345 F42000
G1 F3000
M204 S500
G1 X94.678 Y102.13 E.01914
G1 X94.141 Y102.13 E.00844
G1 X94.141 Y103.08 E.01496
M204 S6000
G1 X98.176 Y104.514 F42000
; FEATURE: Support transition
; LINE_WIDTH: 0.42
G1 F3000
M204 S500
G1 X98.558 Y104.514 E.00501
G1 X98.558 Y102.206 E.03031
G1 X97.975 Y102.516 E.00867
G1 X97.975 Y104.514 E.02624
G1 X97.072 Y104.514 E.01185
G1 X97.072 Y102.783 E.02274
G1 X96.89 Y102.727 E.0025
G1 X96.491 Y101.977 E.01115
M204 S6000
G1 X96.491 Y101.959 F42000
G1 F3000
M204 S500
G1 X96.621 Y101.534 E.00584
G1 X97.072 Y101.294 E.0067
G1 X97.072 Y98.708 E.03396
G1 X97.975 Y98.708 E.01185
G1 X97.975 Y100.814 E.02765
G1 X98.878 Y100.334 E.01343
G1 X98.878 Y95.806 E.05946
G1 X99.781 Y95.806 E.01185
G1 X99.781 Y99.854 E.05316
G1 X100.292 Y99.582 E.0076
G1 X100.683 Y99.702 E.00538
M73 P16 R2
G1 X100.683 Y95.806 E.05116
G1 X101.461 Y95.806 E.01021
G1 X101.461 Y101.611 E.07623
G1 X100.683 Y101.611 E.01021
G1 X100.683 Y101.076 E.00703
G1 X100.997 Y100.909 E.00467
G1 X101.131 Y100.472 E.006
G1 X100.801 Y99.852 E.00922
; WIPE_START
G1 X101.131 Y100.472 E-.26691
G1 X100.997 Y100.909 E-.17356
G1 X100.683 Y101.076 E-.13502
G1 X100.683 Y101.562 E-.18451
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X100.505 Y101.171 Z.48 F42000
G1 Z.08
G1 E.8 F1800
G1 F3000
M204 S500
G1 X99.781 Y101.556 E.01078
G1 X99.781 Y101.611 E.00073
G1 X100.482 Y101.611 E.00921
; WIPE_START
G1 X99.781 Y101.611 E-.33782
G1 X99.781 Y101.556 E-.0267
G1 X100.505 Y101.171 E-.39547
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X94.329 Y99.401 Z.48 F42000
G1 Z.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X94.329 Y100.512 E.01749
G1 X92.234 Y100.512 E.03297
G1 X92.234 Y102.967 E.03864
G1 X79.895 Y102.967 E.19419
G1 X79.895 Y102.183 E.01234
G1 X80.495 Y102.183 E.00944
G1 X80.495 Y98.817 E.05297
G1 X79.895 Y98.817 E.00944
G1 X79.895 Y83.183 E.24605
M73 P17 R2
G1 X80.495 Y83.183 E.00944
G1 X80.495 Y79.817 E.05297
G1 X79.895 Y79.817 E.00944
G1 X79.895 Y77.033 E.04382
G1 X85.826 Y77.033 E.09335
G1 X85.881 Y77.253 E.00356
G1 X83.302 Y78.624 E.04596
G1 X94.319 Y99.343 E.36931
M204 S6000
G1 X94.812 Y99.401 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X94.812 Y100.995 E.02509
G1 X92.717 Y100.995 E.03297
G1 X92.717 Y103.45 E.03864
G1 X79.412 Y103.45 E.20939
G1 X79.412 Y101.7 E.02754
G1 X80.012 Y101.7 E.00944
M73 P18 R2
G1 X80.012 Y99.3 E.03777
G1 X79.412 Y99.3 E.00944
G1 X79.412 Y82.7 E.26125
G1 X80.012 Y82.7 E.00944
G1 X80.012 Y80.3 E.03777
G1 X79.412 Y80.3 E.00944
G1 X79.412 Y76.55 E.05902
G1 X88.23 Y76.55 E.13878
G1 X83.955 Y78.823 E.0762
G1 X94.812 Y99.242 E.36395
G1 X94.812 Y99.341 E.00155
; WIPE_START
G1 X94.812 Y100.995 E-.62861
M73 P19 R2
G1 X94.466 Y100.995 E-.1314
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X93.567 Y93.416 Z.48 F42000
G1 X92.249 Y82.317 Z.48
G1 Z.08
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X89.44 Y77.033 E.09417
G1 X94.329 Y77.033 E.07695
G1 X94.329 Y83.033 E.09442
G1 X95.529 Y83.033 E.01889
G1 X95.529 Y83.967 E.0147
G1 X94.329 Y83.967 E.01889
G1 X94.329 Y85.762 E.02824
G1 X94.11 Y85.816 E.00356
G1 X92.277 Y82.37 E.06144
; WIPE_START
G1 X91.338 Y80.604 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X94.656 Y87.477 Z.48 F42000
G1 X95.608 Y89.45 Z.48
G1 Z.08
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X95.865 Y89.933 E.0086
G1 X95.776 Y89.979 E.00157
G1 X88.636 Y76.55 E.23937
G1 X94.812 Y76.55 E.0972
G1 X94.812 Y82.55 E.09442
G1 X96.012 Y82.55 E.01889
M73 P20 R2
G1 X96.012 Y84.45 E.0299
G1 X94.812 Y84.45 E.01889
G1 X94.812 Y87.55 E.04879
G1 X96.012 Y87.55 E.01889
G1 X96.012 Y89.45 E.0299
G1 X95.668 Y89.45 E.00541
; WIPE_START
G1 X95.865 Y89.933 E-.19798
G1 X95.776 Y89.979 E-.038
G1 X95.129 Y88.762 E-.52402
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.48 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X95.288 Y83.5
G1 Z.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.468688
G1 F3000
M204 S500
G1 X94.088 Y83.5 E.01766
; WIPE_START
G1 X95.288 Y83.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X94.136 Y78.29 Z.48 F42000
G1 Z.08
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.541478
G1 F6300
M204 S500
G1 X93.289 Y77.443 E.02047
G1 X92.548 Y77.443 E.01267
G1 X93.919 Y78.814 E.03314
G1 X93.919 Y79.556 E.01267
G1 X91.806 Y77.443 E.05106
G1 X91.065 Y77.443 E.01267
G1 X93.919 Y80.297 E.06898
G1 X93.919 Y81.039 E.01267
G1 X90.323 Y77.443 E.0869
G1 X90.122 Y77.443 E.00344
G1 X90.736 Y78.597 E.02234
M73 P21 R2
G1 X93.919 Y81.78 E.07693
G1 X93.919 Y82.522 E.01267
G1 X91.578 Y80.181 E.05658
G1 X92.42 Y81.764 E.03065
G1 X93.678 Y83.022 E.0304
G1 X93.678 Y83.764 E.01267
G1 X92.736 Y82.822 E.02275
; WIPE_START
G1 X93.678 Y83.764 E-.50595
G1 X93.678 Y83.095 E-.25405
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X87.175 Y79.099 Z.48 F42000
G1 X84.127 Y77.226 Z.48
G1 Z.08
G1 E.8 F1800
; LINE_WIDTH: 0.510228
G1 F6300
M204 S500
G1 X84.45 Y77.549 E.00734
G1 X83.994 Y77.791 E.00829
G1 X83.647 Y77.443 E.0079
G1 X82.949 Y77.443 E.01121
G1 X83.539 Y78.033 E.01341
G1 X83.084 Y78.275 E.00829
G1 X82.252 Y77.443 E.01891
G1 X81.555 Y77.443 E.01121
G1 X82.954 Y78.842 E.0318
G1 X83.745 Y80.331 E.0271
G1 X80.857 Y77.443 E.06564
G1 X80.305 Y77.443 E.00887
G1 X80.305 Y77.588 E.00233
G1 X84.537 Y81.82 E.09618
G1 X85.329 Y83.309 E.0271
G1 X80.305 Y78.286 E.11418
G1 X80.305 Y78.983 E.01121
G1 X86.121 Y84.798 E.13217
M73 P22 R2
G1 X86.912 Y86.287 E.0271
G1 X80.905 Y80.28 E.13653
G1 X80.905 Y80.977 E.01121
G1 X87.704 Y87.776 E.15452
G1 X88.496 Y89.265 E.0271
G1 X80.905 Y81.675 E.17252
G1 X80.905 Y82.372 E.01121
G1 X89.287 Y90.754 E.19051
G1 X90.079 Y92.243 E.0271
G1 X80.905 Y83.069 E.20851
G1 X80.905 Y83.593 E.00842
G1 X80.732 Y83.593 E.00279
G1 X90.871 Y93.732 E.23045
G1 X91.663 Y95.221 E.0271
G1 X80.305 Y83.864 E.25813
G1 X80.305 Y84.561 E.01121
M73 P23 R2
G1 X92.454 Y96.71 E.27613
G1 X93.246 Y98.199 E.0271
G1 X80.305 Y85.258 E.29412
G1 X80.305 Y85.956 E.01121
G1 X93.919 Y99.57 E.30942
G1 X93.919 Y100.102 E.00856
G1 X93.754 Y100.102 E.00265
G1 X80.305 Y86.653 E.30567
G1 X80.305 Y87.35 E.01121
G1 X93.057 Y100.102 E.28982
G1 X92.36 Y100.102 E.01121
G1 X80.305 Y88.048 E.27397
M73 P24 R2
G1 X80.305 Y88.745 E.01121
G1 X91.824 Y100.264 E.2618
G1 X91.824 Y100.961 E.01121
G1 X80.305 Y89.442 E.2618
G1 X80.305 Y90.14 E.01121
G1 X91.824 Y101.658 E.2618
G1 X91.824 Y102.356 E.01121
G1 X80.305 Y90.837 E.2618
G1 X80.305 Y91.534 E.01121
G1 X91.328 Y102.557 E.25053
G1 X90.631 Y102.557 E.01121
G1 X80.305 Y92.231 E.23468
M73 P25 R2
G1 X80.305 Y92.929 E.01121
G1 X89.933 Y102.557 E.21883
G1 X89.236 Y102.557 E.01121
G1 X80.305 Y93.626 E.20298
G1 X80.305 Y94.323 E.01121
G1 X88.539 Y102.557 E.18714
G1 X87.842 Y102.557 E.01121
G1 X80.305 Y95.021 E.17129
G1 X80.305 Y95.718 E.01121
G1 X87.144 Y102.557 E.15544
G1 X86.447 Y102.557 E.01121
G1 X80.305 Y96.415 E.13959
M73 P26 R2
G1 X80.305 Y97.112 E.01121
G1 X85.75 Y102.557 E.12374
G1 X85.052 Y102.557 E.01121
G1 X80.088 Y97.592 E.11283
; WIPE_START
G1 X81.502 Y99.007 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X80.688 Y98.89 Z.48 F42000
G1 Z.08
G1 E.8 F1800
G1 F6300
M204 S500
G1 X84.355 Y102.557 E.08335
G1 X83.658 Y102.557 E.01121
G1 X80.905 Y99.804 E.06256
G1 X80.905 Y100.502 E.01121
G1 X82.961 Y102.557 E.04671
G1 X82.263 Y102.557 E.01121
G1 X80.905 Y101.199 E.03087
G1 X80.905 Y101.896 E.01121
G1 X81.783 Y102.774 E.01996
; CHANGE_LAYER
; Z_HEIGHT: 0.16
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F6300
G1 X80.905 Y101.896 E-.47183
G1 X80.905 Y101.199 E-.26497
G1 X80.948 Y101.242 E-.0232
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/19
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.48 I.164 J1.206 P1  F42000
G1 X94.434 Y99.406 Z.48
G1 Z.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P27 R2
G1 F6958
M204 S6000
G1 X94.434 Y100.617 E.01708
G1 X92.339 Y100.617 E.02956
G1 X92.339 Y103.072 E.03464
G1 X79.79 Y103.072 E.17705
G1 X79.79 Y102.078 E.01403
G1 X80.39 Y102.078 E.00846
G1 X80.39 Y98.922 E.04452
G1 X79.79 Y98.922 E.00846
G1 X79.79 Y83.078 E.22353
G1 X80.39 Y83.078 E.00846
G1 X80.39 Y79.922 E.04452
G1 X79.79 Y79.922 E.00846
G1 X79.79 Y76.928 E.04224
G1 X86.296 Y76.928 E.09178
G1 X86.345 Y77.125 E.00286
G1 X83.444 Y78.667 E.04635
G1 X94.434 Y99.336 E.33026
G1 X94.434 Y99.346 E.00014
M204 S250
G1 X94.852 Y99.406 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6958
M204 S5000
G1 X94.852 Y101.035 E.02138
G1 X92.757 Y101.035 E.02751
G1 X92.757 Y103.49 E.03223
G1 X79.372 Y103.49 E.17575
G1 X79.372 Y101.66 E.02402
G1 X79.972 Y101.66 E.00788
G1 X79.972 Y99.34 E.03046
G1 X79.372 Y99.34 E.00788
G1 X79.372 Y82.66 E.21901
G1 X79.972 Y82.66 E.00788
G1 X79.972 Y80.34 E.03046
G1 X79.372 Y80.34 E.00788
G1 X79.373 Y76.51 E.05029
G1 X88.391 Y76.51 E.11841
G1 X84.009 Y78.84 E.06516
G1 X94.852 Y99.232 E.30325
G1 X94.852 Y99.346 E.0015
; WIPE_START
G1 F12000
M204 S6000
G1 X94.852 Y101.035 E-.64169
G1 X94.541 Y101.035 E-.11831
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P28 R2
G3 Z.56 I1.214 J.084 P1  F42000
G1 X95.411 Y88.488 Z.56
G1 Z.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6958
M204 S6000
G1 X95.113 Y87.928 E.00896
G1 X95.634 Y87.928 E.00735
G1 X95.634 Y88.488 E.00791
G1 X95.442 Y88.536 E.0028
; WIPE_START
G1 F18000
G1 X95.113 Y87.928 E-.26659
G1 X95.634 Y87.928 E-.20086
G1 X95.634 Y88.488 E-.21608
G1 X95.442 Y88.536 E-.07647
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.12 Y86.059 Z.56 F42000
G1 Z.16
G1 E.8 F1800
G1 F6958
M204 S6000
G1 X89.265 Y76.928 E.1459
G1 X94.434 Y76.928 E.07293
G1 X94.434 Y82.928 E.08465
G1 X95.634 Y82.928 E.01693
G1 X95.634 Y84.072 E.01614
G1 X94.434 Y84.072 E.01693
G1 X94.434 Y86.231 E.03046
G1 X94.237 Y86.28 E.00286
G1 X94.148 Y86.112 E.00269
; WIPE_START
G1 F18000
G1 X93.209 Y84.346 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.675 Y89.49 Z.56 F42000
G1 Z.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6958
M204 S5000
G1 X95.919 Y89.949 E.00683
G1 X95.76 Y90.034 E.00236
G1 X88.569 Y76.51 E.20111
G1 X94.852 Y76.51 E.08249
G1 X94.852 Y82.51 E.07878
G1 X96.052 Y82.51 E.01576
G1 X96.052 Y84.49 E.026
G1 X94.852 Y84.49 E.01576
G1 X94.852 Y87.51 E.03965
G1 X96.052 Y87.51 E.01576
G1 X96.052 Y89.49 E.026
G1 X95.735 Y89.49 E.00417
; WIPE_START
G1 F12000
M204 S6000
G1 X95.919 Y89.949 E-.18794
G1 X95.76 Y90.034 E-.0684
G1 X95.138 Y88.863 E-.50366
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.56 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X92.752 Y79.902
G1 Z.16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.532528
G1 F6958
M204 S6000
G1 X92.752 Y78.611 E.02169
G1 X92.065 Y78.611 E.01153
G1 X92.723 Y79.849 E.02356
M204 S10000
G1 X93.211 Y81.743 F42000
; LINE_WIDTH: 0.419998
G1 F6958
M204 S6000
G1 X93.211 Y78.152 E.04716
G1 X91.301 Y78.152 E.02507
G1 X93.183 Y81.69 E.05263
M204 S10000
G1 X93.671 Y83.435 F42000
; LINE_WIDTH: 0.422565
G1 F6958
M204 S6000
G1 X93.61 Y83.144 E.00392
G1 X93.613 Y77.749 E.0713
G1 X90.631 Y77.749 E.03942
G1 X93.641 Y83.383 E.08441
M204 S10000
M73 P29 R2
G1 X94.017 Y84.975 F42000
; LINE_WIDTH: 0.414618
G1 F6958
M204 S6000
G1 X94.017 Y83.856 E.0145
G1 X94.053 Y83.74 E.00157
G1 X94.218 Y83.678 E.00229
G1 X95.24 Y83.678 E.01324
G1 X95.24 Y83.322 E.00461
G1 X94.218 Y83.322 E.01324
G1 X94.053 Y83.26 E.00229
G1 X94.017 Y83.144 E.00157
G1 X94.016 Y77.346 E.07512
G1 X89.96 Y77.346 E.05255
G1 X93.988 Y84.922 E.11116
; WIPE_START
G1 F18000
G1 X93.049 Y83.156 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.56 I-.05 J-1.216 P1  F42000
G1 X79.964 Y83.697 Z.56
G1 Z.16
G1 E.8 F1800
; LINE_WIDTH: 0.425128
G1 F6958
M204 S6000
G1 X80.409 Y83.252 E.00838
; WIPE_START
G1 F18000
G1 X79.964 Y83.697 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.821 Y77.81 Z.56 F42000
G1 X85.405 Y77.102 Z.56
G1 Z.16
G1 E.8 F1800
G1 F6958
M204 S6000
G1 X84.709 Y77.798 E.01308
M204 S10000
G1 X79.964 Y77.928 F42000
G1 F6958
M204 S6000
G1 X80.608 Y77.283 E.01212
G1 X81.185 Y77.283 E.00767
G1 X80.145 Y78.323 E.01956
G1 X80.145 Y78.9 E.00767
G1 X81.762 Y77.283 E.03041
G1 X82.339 Y77.283 E.00767
G1 X80.145 Y79.477 E.04126
G1 X80.145 Y79.567 E.0012
G1 X80.632 Y79.567 E.00648
G1 X82.916 Y77.283 E.04295
G1 X83.493 Y77.283 E.00767
G1 X80.745 Y80.031 E.05168
G1 X80.745 Y80.608 E.00767
G1 X84.07 Y77.283 E.06253
G1 X84.647 Y77.283 E.00767
G1 X83.916 Y78.014 E.01375
G1 X82.964 Y78.52 E.01433
G1 X83.119 Y78.811 E.00438
G1 X80.745 Y81.185 E.04464
G1 X80.745 Y81.762 E.00767
G1 X83.319 Y79.188 E.04841
G1 X83.519 Y79.565 E.00567
G1 X80.745 Y82.339 E.05217
G1 X80.745 Y82.916 E.00767
G1 X83.72 Y79.941 E.05594
G1 X83.92 Y80.318 E.00567
G1 X80.145 Y84.093 E.07099
G1 X80.145 Y84.67 E.00767
G1 X84.12 Y80.695 E.07475
G1 X84.32 Y81.071 E.00567
G1 X80.145 Y85.247 E.07852
G1 X80.145 Y85.824 E.00767
G1 X84.521 Y81.448 E.08229
G1 X84.721 Y81.825 E.00567
G1 X80.145 Y86.401 E.08605
G1 X80.145 Y86.978 E.00767
G1 X84.921 Y82.201 E.08982
G1 X85.122 Y82.578 E.00567
G1 X80.145 Y87.554 E.09359
M73 P30 R2
G1 X80.145 Y88.131 E.00767
G1 X85.322 Y82.955 E.09735
G1 X85.522 Y83.331 E.00567
G1 X80.145 Y88.708 E.10112
G1 X80.145 Y89.285 E.00767
G1 X85.722 Y83.708 E.10488
G1 X85.923 Y84.085 E.00567
G1 X80.145 Y89.862 E.10865
G1 X80.145 Y90.439 E.00767
G1 X86.123 Y84.461 E.11242
G1 X86.323 Y84.838 E.00567
G1 X80.145 Y91.016 E.11618
G1 X80.145 Y91.593 E.00767
G1 X86.523 Y85.215 E.11995
G1 X86.724 Y85.591 E.00567
G1 X80.145 Y92.17 E.12372
G1 X80.145 Y92.747 E.00767
G1 X86.924 Y85.968 E.12748
G1 X87.124 Y86.345 E.00567
G1 X80.145 Y93.324 E.13125
G1 X80.145 Y93.901 E.00767
G1 X87.325 Y86.721 E.13502
G1 X87.525 Y87.098 E.00567
G1 X80.145 Y94.478 E.13878
G1 X80.145 Y95.055 E.00767
G1 X87.725 Y87.475 E.14255
G1 X87.925 Y87.851 E.00567
G1 X80.145 Y95.632 E.14631
G1 X80.145 Y96.209 E.00767
G1 X88.126 Y88.228 E.15008
G1 X88.326 Y88.605 E.00567
G1 X80.145 Y96.786 E.15385
G1 X80.145 Y97.362 E.00767
G1 X88.526 Y88.981 E.15761
G1 X88.727 Y89.358 E.00567
G1 X80.145 Y97.939 E.16138
M73 P31 R2
G1 X80.145 Y98.516 E.00767
G1 X88.927 Y89.735 E.16515
G1 X89.127 Y90.111 E.00567
G1 X80.671 Y98.567 E.15902
G1 X80.745 Y98.567 E.00098
G1 X80.745 Y99.07 E.00669
G1 X89.327 Y90.488 E.16139
G1 X89.528 Y90.865 E.00567
G1 X80.745 Y99.647 E.16516
G1 X80.745 Y100.224 E.00767
G1 X89.728 Y91.241 E.16893
G1 X89.928 Y91.618 E.00567
G1 X80.745 Y100.801 E.17269
G1 X80.745 Y101.378 E.00767
G1 X90.128 Y91.995 E.17646
G1 X90.329 Y92.371 E.00567
G1 X80.745 Y101.955 E.18023
G1 X80.745 Y102.433 E.00636
G1 X80.267 Y102.433 E.00636
G1 X80.145 Y102.555 E.00229
G1 X80.145 Y102.717 E.00216
G1 X80.56 Y102.717 E.00551
G1 X90.529 Y92.748 E.18748
G1 X90.729 Y93.125 E.00567
G1 X81.137 Y102.717 E.18039
G1 X81.714 Y102.717 E.00767
G1 X90.93 Y93.501 E.17331
G1 X91.13 Y93.878 E.00567
G1 X82.291 Y102.717 E.16623
G1 X82.867 Y102.717 E.00767
G1 X91.33 Y94.255 E.15914
G1 X91.53 Y94.631 E.00567
G1 X83.444 Y102.717 E.15206
G1 X84.021 Y102.717 E.00767
G1 X91.731 Y95.008 E.14498
M73 P32 R2
G1 X91.931 Y95.385 E.00567
G1 X84.598 Y102.717 E.13789
G1 X85.175 Y102.717 E.00767
G1 X92.131 Y95.761 E.13081
G1 X92.332 Y96.138 E.00567
G1 X85.752 Y102.717 E.12373
G1 X86.329 Y102.717 E.00767
G1 X92.532 Y96.515 E.11664
G1 X92.732 Y96.891 E.00567
G1 X86.906 Y102.717 E.10956
G1 X87.483 Y102.717 E.00767
G1 X92.932 Y97.268 E.10248
G1 X93.133 Y97.645 E.00567
G1 X88.06 Y102.717 E.09539
G1 X88.637 Y102.717 E.00767
G1 X93.333 Y98.021 E.08831
G1 X93.533 Y98.398 E.00567
G1 X89.214 Y102.717 E.08123
G1 X89.791 Y102.717 E.00767
G1 X93.733 Y98.775 E.07414
G1 X93.934 Y99.151 E.00567
G1 X92.823 Y100.262 E.02089
G1 X93.4 Y100.262 E.00767
G1 X94.079 Y99.583 E.01278
G1 X94.079 Y100.16 E.00767
G1 X93.795 Y100.443 E.00534
; WIPE_START
G1 F18000
G1 X94.079 Y100.16 E-.15259
G1 X94.079 Y99.583 E-.21924
G1 X93.4 Y100.262 E-.36522
G1 X93.339 Y100.262 E-.02295
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.166 Y100.919 Z.56 F42000
G1 Z.16
G1 E.8 F1800
G1 F6958
M204 S6000
G1 X90.368 Y102.717 E.03381
G1 X90.945 Y102.717 E.00767
G1 X91.984 Y101.678 E.01955
G1 X91.984 Y102.255 E.00767
G1 X91.34 Y102.898 E.01211
; WIPE_START
G1 F18000
G1 X91.984 Y102.255 E-.34605
G1 X91.984 Y101.678 E-.21924
G1 X91.622 Y102.04 E-.19471
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.56 I.223 J1.196 P1  F42000
G1 X100.271 Y100.43 Z.56
G1 Z.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F6958
M204 S5000
G1 X100.283 Y100.452 E.00028
G1 X99.996 Y100.604 E.00379
G1 X99.985 Y100.583 E.00028
G1 X100.218 Y100.459 E.00309
; WIPE_START
G1 F12000
M204 S6000
G1 X100.283 Y100.452 E-.07261
G1 X99.996 Y100.604 E-.36368
G1 X99.985 Y100.583 E-.02731
G1 X100.218 Y100.459 E-.2964
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.395 Y101.428 Z.56 F42000
G1 Z.16
G1 E.8 F1800
G1 F6958
M204 S5000
G1 X99.212 Y100.994 E.0108
G1 X99.223 Y101.015 E.00028
G1 X98.438 Y101.433 E.01038
M204 S250
G1 X97.622 Y101.839 F42000
G1 F6958
M204 S5000
G1 X97.634 Y101.86 E.00028
M73 P33 R2
G1 X97.347 Y102.013 E.00379
G1 X97.336 Y101.991 E.00028
G1 X97.569 Y101.867 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 0.24
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F12000
M204 S6000
G1 X97.634 Y101.86 E-.07261
G1 X97.347 Y102.013 E-.3637
G1 X97.336 Y101.991 E-.02728
G1 X97.569 Y101.867 E-.29641
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/19
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.56 I.041 J1.216 P1  F42000
G1 X99.781 Y101.793 Z.56
G1 Z.24
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.16
G1 F4800
M204 S6000
G1 X99.781 Y101.556 E.00595
G1 X100.683 Y101.076 E.02571
G1 X100.683 Y101.793 E.01802
; WIPE_START
G1 X100.683 Y101.076 E-.27568
G1 X99.781 Y101.556 E-.39328
G1 X99.781 Y101.793 E-.09105
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.64 I1.085 J.552 P1  F42000
G1 X100.683 Y100.017 Z.64
G1 Z.24
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X100.683 Y95.806 E.10589
G1 X99.781 Y95.806 E.0227
G1 X99.781 Y99.854 E.10179
G1 X98.878 Y100.334 E.02571
G1 X98.878 Y95.806 E.11386
G1 X98.558 Y95.806 E.00805
G1 X98.558 Y98.708 E.07298
G1 X97.975 Y98.708 E.01465
G1 X97.975 Y100.814 E.05295
G1 X97.072 Y101.294 E.02571
G1 X97.072 Y98.708 E.06502
G1 X96.169 Y98.708 E.0227
G1 X96.169 Y104.514 E.14597
G1 X97.072 Y104.514 E.0227
G1 X97.072 Y102.783 E.04353
G1 X97.327 Y102.861 E.0067
G1 X97.975 Y102.516 E.01845
G1 X97.975 Y104.696 E.0548
; WIPE_START
G1 X97.975 Y102.696 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.64 I1.15 J-.399 P1  F42000
G1 X95.655 Y96.007 Z.64
G1 Z.24
G1 E.8 F1800
; FEATURE: Support
G1 F8415
M204 S6000
G1 X95.655 Y98.306 E.05779
G1 X98.155 Y98.306 E.06285
G1 X98.155 Y95.806 E.06285
G1 X95.655 Y95.806 E.06285
; WIPE_START
G1 F9000
G1 X97.655 Y95.806 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.64 I.584 J-1.068 P1  F42000
G1 X92.349 Y92.903 Z.64
G1 Z.24
G1 E.8 F1800
G1 F8415
M204 S6000
G1 X98.558 Y92.903 E.1561
G1 X98.558 Y90 E.07298
G1 X96.79 Y90 E.04444
G1 X96.663 Y90.416 E.01092
G1 X95.73 Y90.912 E.02657
G1 X95.293 Y90.778 E.01148
G1 X94.88 Y90 E.02216
G1 X90.806 Y90 E.10243
G1 X89.849 Y88.201 E.05121
G1 X89.849 Y87.097 E.02776
G1 X93.336 Y87.097 E.08767
G1 X94.785 Y89.822 E.07759
; WIPE_START
G1 F9000
M73 P34 R2
G1 X93.846 Y88.056 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.64 I.798 J-.918 P1  F42000
G1 X86.27 Y81.469 Z.64
G1 Z.24
G1 E.8 F1800
G1 F8415
M204 S6000
G1 X87.719 Y84.194 E.07759
G1 X89.849 Y84.194 E.05357
G1 X89.849 Y81.442 E.0692
M204 S10000
G1 X90.249 Y81.292 F42000
G1 F8415
M204 S6000
G1 X86.175 Y81.292 E.10243
G1 X85.039 Y79.155 E.06084
G1 X86.48 Y78.389 E.04102
G1 X88.706 Y78.389 E.05597
G1 X88.215 Y77.466 E.02628
G1 X87.033 Y78.094 E.03366
; WIPE_START
G1 F9000
G1 X88.215 Y77.466 E-.50871
G1 X88.526 Y78.05 E-.25129
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.64 I-1.173 J.324 P1  F42000
G1 X94.434 Y99.414 Z.64
G1 Z.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.08
G1 F8415
M204 S6000
G1 X94.434 Y100.617 E.01698
G1 X92.339 Y100.617 E.02956
G1 X92.339 Y103.072 E.03464
G1 X79.79 Y103.072 E.17705
G1 X79.79 Y102.078 E.01403
G1 X80.39 Y102.078 E.00846
G1 X80.39 Y98.922 E.04452
G1 X79.79 Y98.922 E.00846
G1 X79.79 Y83.078 E.22353
G1 X80.39 Y83.078 E.00846
G1 X80.39 Y79.922 E.04452
G1 X79.79 Y79.922 E.00846
G1 X79.79 Y76.928 E.04224
G1 X86.296 Y76.928 E.09178
G1 X86.345 Y77.125 E.00286
G1 X83.444 Y78.667 E.04635
G1 X94.434 Y99.336 E.33026
G1 X94.434 Y99.354 E.00025
M204 S250
G1 X94.852 Y99.414 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8415
M204 S5000
G1 X94.852 Y101.035 E.02129
G1 X92.757 Y101.035 E.02751
G1 X92.757 Y103.49 E.03223
G1 X79.372 Y103.49 E.17575
G1 X79.372 Y101.66 E.02402
G1 X79.972 Y101.66 E.00788
G1 X79.972 Y99.34 E.03046
G1 X79.372 Y99.34 E.00788
M73 P35 R2
G1 X79.372 Y82.66 E.21901
G1 X79.972 Y82.66 E.00788
G1 X79.972 Y80.34 E.03046
G1 X79.372 Y80.34 E.00788
G1 X79.373 Y76.51 E.05029
G1 X88.391 Y76.51 E.11841
G1 X84.009 Y78.84 E.06516
G1 X94.852 Y99.232 E.30325
G1 X94.852 Y99.354 E.0016
; WIPE_START
G1 F12000
M204 S6000
G1 X94.852 Y101.035 E-.63882
G1 X94.533 Y101.035 E-.12118
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.64 I1.214 J.088 P1  F42000
G1 X95.437 Y88.537 Z.64
G1 Z.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8415
M204 S6000
G1 X95.113 Y87.928 E.00974
G1 X95.634 Y87.928 E.00735
G1 X95.634 Y88.488 E.00791
G1 X95.496 Y88.523 E.00202
; WIPE_START
G1 F18000
G1 X95.113 Y87.928 E-.27828
G1 X95.634 Y87.928 E-.20498
G1 X95.634 Y88.488 E-.22051
G1 X95.496 Y88.523 E-.05623
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.155 Y86.126 Z.64 F42000
G1 Z.24
G1 E.8 F1800
G1 F8415
M204 S6000
G1 X89.265 Y76.928 E.14697
G1 X94.434 Y76.928 E.07293
G1 X94.434 Y82.928 E.08465
G1 X95.634 Y82.928 E.01693
G1 X95.634 Y84.072 E.01614
G1 X94.434 Y84.072 E.01693
G1 X94.434 Y86.231 E.03046
G1 X94.237 Y86.28 E.00286
G1 X94.184 Y86.179 E.00162
; WIPE_START
G1 F18000
G1 X93.245 Y84.413 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.446 Y89.442 Z.64 F42000
G1 Z.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8415
M204 S5000
G1 X88.569 Y76.51 E.19232
G1 X94.852 Y76.51 E.08249
G1 X94.852 Y82.51 E.07878
G1 X96.052 Y82.51 E.01576
G1 X96.052 Y84.49 E.026
G1 X94.852 Y84.49 E.01576
G1 X94.852 Y87.51 E.03965
G1 X96.052 Y87.51 E.01576
G1 X96.052 Y89.49 E.026
G1 X95.675 Y89.49 E.00496
G1 X95.919 Y89.949 E.00683
M73 P36 R2
G1 X95.76 Y90.034 E.00236
G1 X95.474 Y89.495 E.008
; WIPE_START
G1 F12000
M204 S6000
G1 X94.535 Y87.73 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.64 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X88.113 Y87.818
G1 Z.24
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423448
G1 F8415
M204 S6000
G1 X80.745 Y80.45 E.13798
G1 X80.745 Y81.024 E.00761
G1 X88.327 Y88.606 E.14199
G1 X88.979 Y89.833 E.0184
G1 X80.745 Y81.599 E.15421
G1 X80.745 Y82.173 E.00761
G1 X89.632 Y91.06 E.16643
G1 X90.284 Y92.287 E.0184
G1 X80.745 Y82.748 E.17865
G1 X80.745 Y83.323 E.00761
G1 X90.936 Y93.514 E.19086
G1 X91.589 Y94.741 E.0184
G1 X80.281 Y83.433 E.21178
G1 X80.145 Y83.433 E.0018
G1 X80.145 Y83.872 E.00581
G1 X92.241 Y95.968 E.22654
G1 X92.894 Y97.195 E.0184
G1 X80.145 Y84.446 E.23875
G1 X80.145 Y85.021 E.00761
G1 X93.546 Y98.422 E.25097
G1 X94.079 Y99.425 E.01505
G1 X94.079 Y99.53 E.00139
G1 X80.145 Y85.595 E.26096
G1 X80.145 Y86.17 E.00761
G1 X94.079 Y100.104 E.26096
G1 X94.079 Y100.262 E.00209
G1 X93.663 Y100.262 E.00552
G1 X80.145 Y86.745 E.25316
G1 X80.145 Y87.319 E.00761
G1 X93.088 Y100.262 E.2424
M73 P37 R2
G1 X92.513 Y100.262 E.00761
G1 X80.145 Y87.894 E.23164
G1 X80.145 Y88.468 E.00761
G1 X91.984 Y100.308 E.22173
G1 X91.984 Y100.882 E.00761
G1 X80.145 Y89.043 E.22173
G1 X80.145 Y89.617 E.00761
G1 X91.984 Y101.457 E.22173
G1 X91.984 Y102.031 E.00761
G1 X80.145 Y90.192 E.22173
G1 X80.145 Y90.767 E.00761
G1 X91.984 Y102.606 E.22173
G1 X91.984 Y102.717 E.00147
G1 X91.521 Y102.717 E.00613
G1 X80.145 Y91.341 E.21305
G1 X80.145 Y91.916 E.00761
G1 X90.947 Y102.717 E.20229
G1 X90.372 Y102.717 E.00761
G1 X80.145 Y92.49 E.19153
G1 X80.145 Y93.065 E.00761
G1 X89.797 Y102.717 E.18077
G1 X89.223 Y102.717 E.00761
G1 X80.145 Y93.639 E.17001
G1 X80.145 Y94.214 E.00761
G1 X88.648 Y102.717 E.15925
G1 X88.074 Y102.717 E.00761
G1 X80.145 Y94.788 E.14849
M73 P38 R2
G1 X80.145 Y95.363 E.00761
G1 X87.499 Y102.717 E.13773
G1 X86.925 Y102.717 E.00761
G1 X80.145 Y95.938 E.12697
G1 X80.145 Y96.512 E.00761
G1 X86.35 Y102.717 E.11621
G1 X85.775 Y102.717 E.00761
G1 X80.145 Y97.087 E.10545
G1 X80.145 Y97.661 E.00761
G1 X85.201 Y102.717 E.09469
G1 X84.626 Y102.717 E.00761
G1 X79.964 Y98.055 E.08732
; WIPE_START
G1 F18000
G1 X81.378 Y99.469 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.139 Y102.252 Z.64 F42000
G1 Z.24
G1 E.8 F1800
G1 F8415
M204 S6000
G1 X80.604 Y102.717 E.00872
G1 X81.179 Y102.717 E.00761
G1 X80.745 Y102.283 E.00813
G1 X80.745 Y101.709 E.00761
G1 X81.753 Y102.717 E.01889
G1 X82.328 Y102.717 E.00761
G1 X80.745 Y101.134 E.02965
G1 X80.745 Y100.56 E.00761
G1 X82.903 Y102.717 E.04041
G1 X83.477 Y102.717 E.00761
G1 X80.745 Y99.985 E.05117
G1 X80.745 Y99.41 E.00761
G1 X84.233 Y102.898 E.06532
; WIPE_START
G1 F18000
G1 X82.819 Y101.484 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.853 Y93.913 Z.64 F42000
G1 X79.964 Y79.094 Z.64
G1 Z.24
G1 E.8 F1800
G1 F8415
M204 S6000
G1 X87.022 Y86.152 E.13219
G1 X86.37 Y84.925 E.0184
G1 X80.145 Y78.701 E.11658
G1 X80.145 Y78.126 E.00761
G1 X85.717 Y83.698 E.10436
G1 X85.065 Y82.471 E.0184
G1 X80.145 Y77.551 E.09214
G1 X80.145 Y77.283 E.00355
G1 X80.451 Y77.283 E.00406
G1 X84.413 Y81.244 E.07419
G1 X83.76 Y80.018 E.0184
G1 X81.026 Y77.283 E.05121
G1 X81.6 Y77.283 E.00761
G1 X83.108 Y78.791 E.02823
G1 X82.964 Y78.52 E.00405
G1 X83.257 Y78.365 E.00439
G1 X82.175 Y77.283 E.02026
G1 X82.749 Y77.283 E.00761
G1 X83.632 Y78.165 E.01652
G1 X84.007 Y77.966 E.00563
G1 X83.324 Y77.283 E.01279
M73 P39 R2
G1 X83.899 Y77.283 E.00761
G1 X84.382 Y77.766 E.00905
G1 X84.757 Y77.567 E.00563
G1 X84.473 Y77.283 E.00532
G1 X85.048 Y77.283 E.00761
G1 X85.266 Y77.502 E.00409
; WIPE_START
G1 F18000
G1 X85.048 Y77.283 E-.11741
G1 X84.473 Y77.283 E-.21833
G1 X84.757 Y77.567 E-.15257
G1 X84.382 Y77.766 E-.16144
G1 X84.177 Y77.561 E-.11024
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.64 I-.32 J1.174 P1  F42000
G1 X92.752 Y79.902 Z.64
G1 Z.24
G1 E.8 F1800
; LINE_WIDTH: 0.532528
G1 F8415
M204 S6000
G1 X92.752 Y78.611 E.02169
G1 X92.065 Y78.611 E.01153
G1 X92.723 Y79.849 E.02356
M204 S10000
G1 X93.211 Y81.743 F42000
; LINE_WIDTH: 0.419998
G1 F8415
M204 S6000
G1 X93.211 Y78.152 E.04716
G1 X91.301 Y78.152 E.02507
G1 X93.183 Y81.69 E.05263
M204 S10000
G1 X93.671 Y83.435 F42000
; LINE_WIDTH: 0.422565
G1 F8415
M204 S6000
G1 X93.61 Y83.144 E.00392
G1 X93.613 Y77.749 E.0713
G1 X90.631 Y77.749 E.03942
G1 X93.641 Y83.383 E.08441
M204 S10000
G1 X94.017 Y84.975 F42000
; LINE_WIDTH: 0.414618
G1 F8415
M204 S6000
G1 X94.017 Y83.856 E.0145
G1 X94.053 Y83.74 E.00157
G1 X94.218 Y83.678 E.00229
G1 X95.24 Y83.678 E.01324
G1 X95.24 Y83.322 E.00461
G1 X94.218 Y83.322 E.01324
G1 X94.053 Y83.26 E.00229
G1 X94.017 Y83.144 E.00157
G1 X94.016 Y77.346 E.07512
G1 X89.96 Y77.346 E.05255
G1 X93.988 Y84.922 E.11116
; WIPE_START
G1 F18000
G1 X93.049 Y83.156 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.64 I-1.123 J.469 P1  F42000
G1 X100.271 Y100.43 Z.64
G1 Z.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F8415
M204 S5000
G1 X100.283 Y100.452 E.00028
G1 X99.996 Y100.604 E.00379
G1 X99.985 Y100.583 E.00028
G1 X100.218 Y100.459 E.00309
; WIPE_START
G1 F12000
M204 S6000
G1 X100.283 Y100.452 E-.07261
G1 X99.996 Y100.604 E-.36368
G1 X99.985 Y100.583 E-.02731
G1 X100.218 Y100.459 E-.2964
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.395 Y101.428 Z.64 F42000
G1 Z.24
G1 E.8 F1800
G1 F8415
M204 S5000
G1 X99.212 Y100.994 E.0108
G1 X99.223 Y101.015 E.00028
G1 X98.438 Y101.433 E.01038
M204 S250
G1 X97.622 Y101.839 F42000
G1 F8415
M204 S5000
G1 X97.634 Y101.86 E.00028
G1 X97.347 Y102.013 E.00379
G1 X97.336 Y101.991 E.00028
G1 X97.569 Y101.867 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 0.32
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F12000
M204 S6000
G1 X97.634 Y101.86 E-.07261
G1 X97.347 Y102.013 E-.3637
G1 X97.336 Y101.991 E-.02728
G1 X97.569 Y101.867 E-.29641
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/19
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.64 I.748 J-.96 P1  F42000
G1 X94.434 Y99.422 Z.64
G1 Z.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6884
M204 S6000
G1 X94.434 Y100.617 E.01686
G1 X92.339 Y100.617 E.02956
G1 X92.339 Y103.072 E.03464
G1 X79.79 Y103.072 E.17705
G1 X79.79 Y102.078 E.01403
G1 X80.39 Y102.078 E.00846
M73 P40 R2
G1 X80.39 Y98.922 E.04452
G1 X79.79 Y98.922 E.00846
G1 X79.79 Y83.078 E.22353
G1 X80.39 Y83.078 E.00846
G1 X80.39 Y79.922 E.04452
G1 X79.79 Y79.922 E.00846
G1 X79.79 Y76.928 E.04224
G1 X86.296 Y76.928 E.09179
G1 X86.345 Y77.125 E.00286
G1 X83.444 Y78.667 E.04635
G1 X94.434 Y99.336 E.33026
G1 X94.434 Y99.362 E.00036
M204 S250
G1 X94.852 Y99.422 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6884
M204 S5000
G1 X94.852 Y101.035 E.02118
G1 X92.757 Y101.035 E.02751
G1 X92.757 Y103.49 E.03223
G1 X79.372 Y103.49 E.17575
G1 X79.372 Y101.66 E.02402
G1 X79.972 Y101.66 E.00788
G1 X79.972 Y99.34 E.03046
G1 X79.372 Y99.34 E.00788
G1 X79.372 Y82.66 E.21901
G1 X79.972 Y82.66 E.00788
G1 X79.972 Y80.34 E.03046
G1 X79.372 Y80.34 E.00788
G1 X79.373 Y76.51 E.05028
G1 X88.391 Y76.51 E.11842
G1 X84.009 Y78.84 E.06516
G1 X94.852 Y99.232 E.30325
G1 X94.852 Y99.362 E.0017
; WIPE_START
G1 F12000
M204 S6000
G1 X94.852 Y101.035 E-.63574
G1 X94.525 Y101.035 E-.12426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.72 I1.214 J.089 P1  F42000
G1 X95.437 Y88.537 Z.72
G1 Z.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6884
M204 S6000
G1 X95.113 Y87.928 E.00974
G1 X95.634 Y87.928 E.00735
G1 X95.634 Y88.488 E.00791
G1 X95.496 Y88.523 E.00202
; WIPE_START
M73 P41 R2
G1 F18000
G1 X95.113 Y87.928 E-.27828
G1 X95.634 Y87.928 E-.20498
G1 X95.634 Y88.488 E-.22051
G1 X95.496 Y88.523 E-.05623
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.194 Y86.198 Z.72 F42000
G1 Z.32
G1 E.8 F1800
G1 F6884
M204 S6000
G1 X89.265 Y76.928 E.14813
G1 X94.434 Y76.928 E.07293
G1 X94.434 Y82.928 E.08465
G1 X95.634 Y82.928 E.01693
G1 X95.634 Y84.072 E.01614
G1 X94.434 Y84.072 E.01693
G1 X94.434 Y86.231 E.03046
G1 X94.237 Y86.28 E.00286
G1 X94.222 Y86.251 E.00046
; WIPE_START
G1 F18000
G1 X93.283 Y84.485 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.41 Y89.376 Z.72 F42000
G1 Z.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6884
M204 S5000
G1 X88.569 Y76.51 E.19133
G1 X94.852 Y76.51 E.08249
G1 X94.852 Y82.51 E.07878
G1 X96.052 Y82.51 E.01576
G1 X96.052 Y84.49 E.026
G1 X94.852 Y84.49 E.01576
G1 X94.852 Y87.51 E.03965
G1 X96.052 Y87.51 E.01576
G1 X96.052 Y89.49 E.026
G1 X95.675 Y89.49 E.00496
G1 X95.919 Y89.949 E.00683
G1 X95.76 Y90.034 E.00236
G1 X95.438 Y89.429 E.00899
; WIPE_START
G1 F12000
M204 S6000
G1 X94.499 Y87.663 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.72 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X92.752 Y79.902
G1 Z.32
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.532548
G1 F6884
M204 S6000
G1 X92.752 Y78.61 E.02169
G1 X92.065 Y78.61 E.01153
G1 X92.723 Y79.849 E.02356
M204 S10000
G1 X93.211 Y81.743 F42000
; LINE_WIDTH: 0.419998
G1 F6884
M204 S6000
G1 X93.211 Y78.151 E.04716
G1 X91.301 Y78.151 E.02508
G1 X93.183 Y81.69 E.05263
M204 S10000
G1 X93.671 Y83.435 F42000
; LINE_WIDTH: 0.422565
G1 F6884
M204 S6000
G1 X93.61 Y83.144 E.00392
G1 X93.613 Y77.749 E.0713
G1 X90.631 Y77.749 E.03942
G1 X93.641 Y83.383 E.08442
M204 S10000
G1 X94.017 Y84.975 F42000
; LINE_WIDTH: 0.414618
G1 F6884
M204 S6000
G1 X94.017 Y83.856 E.0145
G1 X94.053 Y83.74 E.00157
G1 X94.218 Y83.678 E.00229
G1 X95.24 Y83.678 E.01324
G1 X95.24 Y83.322 E.00461
G1 X94.218 Y83.322 E.01324
G1 X94.053 Y83.26 E.00229
G1 X94.017 Y83.144 E.00157
G1 X94.016 Y77.346 E.07512
G1 X89.96 Y77.346 E.05255
G1 X93.988 Y84.922 E.11116
; WIPE_START
M73 P42 R2
G1 F18000
G1 X93.049 Y83.156 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.72 I-.05 J-1.216 P1  F42000
G1 X79.964 Y83.697 Z.72
G1 Z.32
G1 E.8 F1800
; LINE_WIDTH: 0.425128
G1 F6884
M204 S6000
G1 X80.409 Y83.252 E.00838
M204 S10000
G1 X80.564 Y80.789 F42000
G1 F6884
M204 S6000
G1 X84.07 Y77.283 E.06594
G1 X83.493 Y77.283 E.00767
G1 X80.745 Y80.031 E.05168
G1 X80.745 Y79.567 E.00617
G1 X80.632 Y79.567 E.0015
G1 X82.916 Y77.283 E.04295
G1 X82.339 Y77.283 E.00767
G1 X80.145 Y79.477 E.04126
G1 X80.145 Y78.9 E.00767
G1 X81.762 Y77.283 E.03041
G1 X81.185 Y77.283 E.00767
G1 X80.145 Y78.323 E.01956
M73 P42 R1
G1 X80.145 Y77.746 E.00767
G1 X80.79 Y77.102 E.01212
M204 S10000
G1 X84.709 Y77.798 F42000
G1 F6884
M204 S6000
G1 X85.224 Y77.283 E.00968
G1 X84.647 Y77.283 E.00767
G1 X83.916 Y78.014 E.01375
G1 X82.964 Y78.52 E.01433
G1 X83.119 Y78.811 E.00438
G1 X80.745 Y81.185 E.04464
G1 X80.745 Y81.762 E.00767
G1 X83.319 Y79.188 E.04841
G1 X83.519 Y79.565 E.00567
G1 X80.745 Y82.339 E.05217
G1 X80.745 Y82.916 E.00767
G1 X83.72 Y79.941 E.05594
G1 X83.92 Y80.318 E.00567
G1 X80.145 Y84.093 E.07099
G1 X80.145 Y84.67 E.00767
G1 X84.12 Y80.695 E.07475
G1 X84.32 Y81.071 E.00567
G1 X80.145 Y85.247 E.07852
G1 X80.145 Y85.824 E.00767
G1 X84.521 Y81.448 E.08229
G1 X84.721 Y81.825 E.00567
G1 X80.145 Y86.401 E.08605
G1 X80.145 Y86.978 E.00767
G1 X84.921 Y82.201 E.08982
G1 X85.122 Y82.578 E.00567
G1 X80.145 Y87.554 E.09359
G1 X80.145 Y88.131 E.00767
G1 X85.322 Y82.955 E.09735
G1 X85.522 Y83.331 E.00567
G1 X80.145 Y88.708 E.10112
G1 X80.145 Y89.285 E.00767
G1 X85.722 Y83.708 E.10488
G1 X85.923 Y84.085 E.00567
G1 X80.145 Y89.862 E.10865
M73 P43 R1
G1 X80.145 Y90.439 E.00767
G1 X86.123 Y84.461 E.11242
G1 X86.323 Y84.838 E.00567
G1 X80.145 Y91.016 E.11618
G1 X80.145 Y91.593 E.00767
G1 X86.523 Y85.215 E.11995
G1 X86.724 Y85.591 E.00567
G1 X80.145 Y92.17 E.12372
G1 X80.145 Y92.747 E.00767
G1 X86.924 Y85.968 E.12748
G1 X87.124 Y86.345 E.00567
G1 X80.145 Y93.324 E.13125
G1 X80.145 Y93.901 E.00767
G1 X87.325 Y86.721 E.13502
G1 X87.525 Y87.098 E.00567
G1 X80.145 Y94.478 E.13878
G1 X80.145 Y95.055 E.00767
G1 X87.725 Y87.475 E.14255
G1 X87.925 Y87.851 E.00567
G1 X80.145 Y95.632 E.14631
G1 X80.145 Y96.209 E.00767
G1 X88.126 Y88.228 E.15008
G1 X88.326 Y88.605 E.00567
G1 X80.145 Y96.786 E.15385
G1 X80.145 Y97.362 E.00767
G1 X88.526 Y88.981 E.15761
G1 X88.727 Y89.358 E.00567
G1 X80.145 Y97.939 E.16138
G1 X80.145 Y98.516 E.00767
G1 X88.927 Y89.735 E.16515
G1 X89.127 Y90.111 E.00567
G1 X80.671 Y98.567 E.15902
G1 X80.745 Y98.567 E.00098
G1 X80.745 Y99.07 E.00669
M73 P44 R1
G1 X89.327 Y90.488 E.16139
G1 X89.528 Y90.865 E.00567
G1 X80.745 Y99.647 E.16516
G1 X80.745 Y100.224 E.00767
G1 X89.728 Y91.241 E.16893
G1 X89.928 Y91.618 E.00567
G1 X80.745 Y100.801 E.17269
G1 X80.745 Y101.378 E.00767
G1 X90.128 Y91.995 E.17646
G1 X90.329 Y92.371 E.00567
G1 X80.745 Y101.955 E.18023
G1 X80.745 Y102.433 E.00636
G1 X80.267 Y102.433 E.00636
G1 X80.145 Y102.555 E.00229
G1 X80.145 Y102.717 E.00216
G1 X80.56 Y102.717 E.00551
G1 X90.529 Y92.748 E.18748
G1 X90.729 Y93.125 E.00567
G1 X81.137 Y102.717 E.18039
G1 X81.714 Y102.717 E.00767
G1 X90.93 Y93.501 E.17331
G1 X91.13 Y93.878 E.00567
G1 X82.291 Y102.717 E.16623
G1 X82.867 Y102.717 E.00767
G1 X91.33 Y94.255 E.15914
G1 X91.53 Y94.631 E.00567
G1 X83.444 Y102.717 E.15206
G1 X84.021 Y102.717 E.00767
G1 X91.731 Y95.008 E.14498
G1 X91.931 Y95.385 E.00567
G1 X84.598 Y102.717 E.13789
G1 X85.175 Y102.717 E.00767
G1 X92.131 Y95.761 E.13081
G1 X92.332 Y96.138 E.00567
G1 X85.752 Y102.717 E.12373
M73 P45 R1
G1 X86.329 Y102.717 E.00767
G1 X92.532 Y96.515 E.11664
G1 X92.732 Y96.891 E.00567
G1 X86.906 Y102.717 E.10956
G1 X87.483 Y102.717 E.00767
G1 X92.932 Y97.268 E.10248
G1 X93.133 Y97.645 E.00567
G1 X88.06 Y102.717 E.09539
G1 X88.637 Y102.717 E.00767
G1 X93.333 Y98.021 E.08831
G1 X93.533 Y98.398 E.00567
G1 X89.214 Y102.717 E.08123
G1 X89.791 Y102.717 E.00767
G1 X93.733 Y98.775 E.07414
G1 X93.934 Y99.151 E.00567
G1 X92.823 Y100.262 E.02089
G1 X93.4 Y100.262 E.00767
G1 X94.079 Y99.583 E.01278
G1 X94.079 Y100.16 E.00767
G1 X93.795 Y100.443 E.00534
; WIPE_START
G1 F18000
G1 X94.079 Y100.16 E-.15259
G1 X94.079 Y99.583 E-.21924
G1 X93.4 Y100.262 E-.36522
G1 X93.339 Y100.262 E-.02295
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.166 Y100.919 Z.72 F42000
G1 Z.32
G1 E.8 F1800
G1 F6884
M204 S6000
G1 X90.368 Y102.717 E.03381
G1 X90.945 Y102.717 E.00767
G1 X91.984 Y101.678 E.01955
G1 X91.984 Y102.255 E.00767
G1 X91.34 Y102.898 E.01211
; WIPE_START
G1 F18000
G1 X91.984 Y102.255 E-.34605
G1 X91.984 Y101.678 E-.21924
G1 X91.622 Y102.04 E-.19471
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.72 I.222 J1.197 P1  F42000
G1 X100.275 Y100.438 Z.72
G1 Z.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F6884
M204 S5000
G1 X100.283 Y100.452 E.00018
G1 X99.996 Y100.604 E.00379
G1 X99.985 Y100.583 E.00028
G1 X100.221 Y100.465 E.00309
; WIPE_START
G1 F12000
M204 S6000
G1 X100.283 Y100.452 E-.07025
G1 X99.996 Y100.604 E-.36488
G1 X99.985 Y100.583 E-.02737
G1 X100.221 Y100.465 E-.2975
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.395 Y101.428 Z.72 F42000
G1 Z.32
G1 E.8 F1800
G1 F6884
M204 S5000
G1 X99.212 Y100.994 E.0108
G1 X99.223 Y101.015 E.00028
G1 X98.438 Y101.433 E.01038
M204 S250
G1 X97.622 Y101.839 F42000
G1 F6884
M204 S5000
G1 X97.634 Y101.86 E.00028
G1 X97.347 Y102.013 E.00379
G1 X97.336 Y101.991 E.00028
G1 X97.569 Y101.867 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F12000
M204 S6000
G1 X97.634 Y101.86 E-.07261
G1 X97.347 Y102.013 E-.3637
G1 X97.336 Y101.991 E-.02728
G1 X97.569 Y101.867 E-.29641
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/19
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.72 I-1.108 J.503 P1  F42000
G1 X98.739 Y104.445 Z.72
G1 Z.4
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.16
G1 F4800
M204 S6000
G1 X95.655 Y104.445 E.07755
G1 X95.655 Y103.542 E.0227
G1 X98.558 Y103.542 E.07299
G1 X98.558 Y102.64 E.0227
G1 X97.743 Y102.64 E.0205
G1 X97.327 Y102.861 E.01184
M73 P46 R1
G1 X96.89 Y102.727 E.01148
G1 X96.844 Y102.64 E.00249
G1 X95.655 Y102.64 E.02989
G1 X95.655 Y101.737 E.0227
G1 X96.559 Y101.737 E.02274
G1 X96.621 Y101.534 E.00533
G1 X97.938 Y100.834 E.03748
G1 X95.655 Y100.834 E.0574
G1 X95.655 Y99.931 E.0227
G1 X100.022 Y99.931 E.10979
; WIPE_START
G1 X98.022 Y99.931 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I-.294 J1.181 P1  F42000
G1 X101.642 Y100.834 Z.8
G1 Z.4
G1 E.8 F1800
G1 F4800
M204 S6000
G1 X101.02 Y100.834 E.01564
G1 X101.131 Y100.472 E.00951
G1 X100.843 Y99.931 E.01541
G1 X101.461 Y99.931 E.01554
G1 X101.461 Y99.028 E.0227
G1 X95.655 Y99.028 E.14597
G1 X95.655 Y98.708 E.00804
G1 X98.558 Y98.708 E.07298
G1 X98.558 Y98.125 E.01465
G1 X101.461 Y98.125 E.07299
G1 X101.461 Y97.223 E.0227
G1 X98.558 Y97.223 E.07299
G1 X98.558 Y96.32 E.0227
G1 X101.642 Y96.32 E.07755
M204 S10000
G1 X95.655 Y96.007 F42000
; FEATURE: Support
G1 F9000
M204 S6000
G1 X95.655 Y98.306 E.05779
G1 X98.155 Y98.306 E.06285
G1 X98.155 Y95.806 E.06285
G1 X95.655 Y95.806 E.06285
; WIPE_START
G1 X97.655 Y95.806 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.204 J-.179 P1  F42000
G1 X96.79 Y90 Z.8
G1 Z.4
G1 E.8 F1800
G1 F9000
M204 S6000
G1 X98.558 Y90 E.04444
G1 X98.558 Y92.903 E.07298
G1 X96.058 Y92.903 E.06285
M204 S10000
G1 X95.468 Y92.903 F42000
; FEATURE: Support transition
G1 F3000
M204 S6000
G1 X95.655 Y92.903 E.00471
G1 X95.655 Y90.889 E.05064
G1 X95.266 Y90.727 E.01059
G1 X95.266 Y92.903 E.05471
G1 X94.364 Y92.903 E.0227
G1 X94.364 Y89.029 E.0974
G1 X93.755 Y87.885 E.03259
M204 S10000
G1 X93.734 Y87.845 F42000
G1 F3000
M204 S6000
G1 X93.461 Y87.331 E.01464
G1 X93.461 Y92.903 E.14009
G1 X92.558 Y92.903 E.0227
G1 X92.558 Y87.097 E.14597
G1 X91.655 Y87.097 E.0227
G1 X91.655 Y91.598 E.11315
G1 X91.382 Y91.083 E.01464
M204 S10000
G1 X90.479 Y89.385 F42000
M73 P47 R1
G1 F3000
M204 S6000
G1 X90.752 Y89.9 E.01464
G1 X90.752 Y87.097 E.07046
G1 X89.849 Y87.097 E.0227
G1 X89.849 Y88.202 E.02777
; WIPE_START
G1 X89.849 Y87.097 E-.4198
G1 X90.745 Y87.097 E-.3402
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.211 J-.125 P1  F42000
G1 X90.123 Y81.053 Z.8
G1 Z.4
G1 E.8 F1800
G1 F3000
M204 S6000
G1 X89.849 Y80.539 E.01464
G1 X89.849 Y84.195 E.0919
G1 X88.947 Y84.195 E.0227
G1 X88.947 Y78.841 E.13459
G1 X88.215 Y77.466 E.03916
G1 X88.044 Y77.557 E.00488
G1 X88.044 Y84.195 E.16688
G1 X87.719 Y84.195 E.00817
G1 X87.141 Y83.108 E.03094
G1 X87.141 Y78.037 E.12749
G1 X86.946 Y78.14 E.00554
G1 X86.946 Y78.389 E.00624
G2 X86.238 Y78.517 I-.233 J.73 E.01884
G1 X86.238 Y81.41 E.07273
G1 X85.965 Y80.896 E.01464
M204 S10000
G1 X85.157 Y79.092 F42000
G1 F3000
M204 S6000
G1 X85.039 Y79.155 E.00337
G1 X85.335 Y79.712 E.01587
G1 X85.335 Y78.997 E.01797
G1 X86.06 Y78.612 E.02064
; WIPE_START
G1 X85.335 Y78.997 E-.31202
G1 X85.335 Y79.712 E-.27163
G1 X85.117 Y79.302 E-.17635
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I-1.104 J.511 P1  F42000
G1 X94.434 Y99.431 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.08
G1 F10304
M204 S6000
G1 X94.434 Y100.617 E.01674
G1 X92.339 Y100.617 E.02956
G1 X92.339 Y103.072 E.03464
G1 X79.792 Y103.072 E.17702
G1 X79.791 Y102.078 E.01403
G1 X80.39 Y102.078 E.00846
G1 X80.39 Y98.922 E.04452
G1 X79.79 Y98.922 E.00846
G1 X79.79 Y83.078 E.22353
G1 X80.39 Y83.078 E.00846
G1 X80.39 Y79.922 E.04452
G1 X79.79 Y79.922 E.00846
G1 X79.79 Y76.928 E.04224
G1 X86.296 Y76.928 E.09179
G1 X86.345 Y77.125 E.00286
G1 X83.444 Y78.667 E.04635
M73 P48 R1
G1 X94.434 Y99.336 E.33026
G1 X94.434 Y99.371 E.00048
M204 S250
G1 X94.852 Y99.431 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10304
M204 S5000
G1 X94.852 Y101.035 E.02107
G1 X92.757 Y101.035 E.02751
G1 X92.757 Y103.49 E.03223
G1 X79.372 Y103.49 E.17575
G1 X79.372 Y101.66 E.02402
G1 X79.972 Y101.66 E.00788
G1 X79.972 Y99.34 E.03046
G1 X79.372 Y99.34 E.00788
G1 X79.372 Y82.66 E.21901
G1 X79.972 Y82.66 E.00788
G1 X79.972 Y80.34 E.03046
G1 X79.372 Y80.34 E.00788
G1 X79.373 Y76.511 E.05028
G1 X88.391 Y76.51 E.11841
G1 X84.009 Y78.84 E.06516
G1 X94.852 Y99.232 E.30325
G1 X94.852 Y99.371 E.00182
; WIPE_START
G1 F12000
M204 S6000
G1 X94.852 Y101.035 E-.63248
G1 X94.517 Y101.035 E-.12752
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.214 J.089 P1  F42000
G1 X95.437 Y88.537 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10304
M204 S6000
G1 X95.113 Y87.928 E.00974
G1 X95.634 Y87.928 E.00735
G1 X95.634 Y88.488 E.00791
G1 X95.496 Y88.523 E.00202
; WIPE_START
G1 F18000
G1 X95.113 Y87.928 E-.27828
G1 X95.634 Y87.928 E-.20498
G1 X95.634 Y88.488 E-.22051
G1 X95.496 Y88.523 E-.05623
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.235 Y86.275 Z.8 F42000
G1 Z.4
G1 E.8 F1800
G1 F10304
M204 S6000
G1 X89.265 Y76.928 E.14936
G1 X94.434 Y76.928 E.07293
G1 X94.434 Y82.928 E.08465
G1 X95.634 Y82.928 E.01693
G1 X95.634 Y84.072 E.01614
G1 X94.434 Y84.072 E.01693
G1 X94.434 Y86.231 E.03046
G1 X94.29 Y86.267 E.0021
; WIPE_START
G1 F18000
G1 X93.342 Y84.506 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.372 Y89.305 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10304
M204 S5000
G1 X88.569 Y76.51 E.19027
M73 P49 R1
G1 X94.852 Y76.51 E.08249
G1 X94.852 Y82.51 E.07878
G1 X96.052 Y82.51 E.01576
G1 X96.052 Y84.49 E.026
G1 X94.852 Y84.49 E.01576
G1 X94.852 Y87.51 E.03965
G1 X96.052 Y87.51 E.01576
G1 X96.052 Y89.49 E.026
G1 X95.675 Y89.49 E.00496
G1 X95.919 Y89.949 E.00683
G1 X95.76 Y90.034 E.00236
G1 X95.401 Y89.358 E.01005
; WIPE_START
G1 F12000
M204 S6000
G1 X94.462 Y87.592 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X88.112 Y87.816
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423428
G1 F10304
M204 S6000
G1 X80.745 Y80.449 E.13796
G1 X80.745 Y81.024 E.00761
G1 X88.326 Y88.604 E.14197
G1 X88.978 Y89.831 E.0184
G1 X80.745 Y81.598 E.15418
G1 X80.745 Y82.173 E.00761
G1 X89.631 Y91.058 E.1664
G1 X90.283 Y92.285 E.0184
G1 X80.745 Y82.747 E.17862
G1 X80.745 Y83.322 E.00761
G1 X90.935 Y93.512 E.19083
G1 X91.588 Y94.739 E.0184
G1 X80.282 Y83.433 E.21173
G1 X80.145 Y83.433 E.00181
G1 X80.145 Y83.871 E.0058
G1 X92.24 Y95.966 E.2265
G1 X92.892 Y97.193 E.0184
G1 X80.145 Y84.445 E.23872
G1 X80.145 Y85.02 E.00761
G1 X93.545 Y98.42 E.25094
G1 X94.079 Y99.425 E.01508
G1 X94.079 Y99.529 E.00137
G1 X80.145 Y85.594 E.26095
G1 X80.145 Y86.169 E.00761
G1 X94.079 Y100.103 E.26095
M73 P50 R1
G1 X94.079 Y100.262 E.00211
G1 X93.664 Y100.262 E.0055
G1 X80.145 Y86.743 E.25317
G1 X80.145 Y87.318 E.00761
G1 X93.089 Y100.262 E.24241
G1 X92.515 Y100.262 E.00761
G1 X80.145 Y87.893 E.23165
G1 X80.145 Y88.467 E.00761
G1 X91.984 Y100.306 E.22172
G1 X91.984 Y100.881 E.00761
G1 X80.145 Y89.042 E.22172
G1 X80.145 Y89.616 E.00761
G1 X91.984 Y101.455 E.22172
G1 X91.984 Y102.03 E.00761
G1 X80.145 Y90.191 E.22171
G1 X80.145 Y90.765 E.00761
G1 X91.984 Y102.605 E.22171
G1 X91.984 Y102.717 E.00149
G1 X91.522 Y102.717 E.00612
G1 X80.145 Y91.34 E.21307
G1 X80.145 Y91.914 E.00761
G1 X90.948 Y102.717 E.20231
G1 X90.373 Y102.717 E.00761
G1 X80.145 Y92.489 E.19155
G1 X80.145 Y93.063 E.00761
G1 X89.799 Y102.717 E.18079
G1 X89.224 Y102.717 E.00761
G1 X80.145 Y93.638 E.17003
G1 X80.145 Y94.212 E.00761
G1 X88.65 Y102.717 E.15927
G1 X88.075 Y102.717 E.00761
G1 X80.145 Y94.787 E.14851
M73 P51 R1
G1 X80.145 Y95.362 E.00761
G1 X87.501 Y102.717 E.13775
G1 X86.926 Y102.717 E.00761
G1 X80.145 Y95.936 E.12699
G1 X80.145 Y96.511 E.00761
G1 X86.352 Y102.717 E.11623
G1 X85.777 Y102.717 E.00761
G1 X80.145 Y97.085 E.10547
G1 X80.145 Y97.66 E.00761
G1 X85.203 Y102.717 E.09471
G1 X84.628 Y102.717 E.00761
G1 X79.964 Y98.053 E.08735
; WIPE_START
G1 F18000
G1 X81.378 Y99.467 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.141 Y102.252 Z.8 F42000
G1 Z.4
G1 E.8 F1800
G1 F10304
M204 S6000
G1 X80.606 Y102.717 E.00872
G1 X81.181 Y102.717 E.00761
G1 X80.745 Y102.281 E.00816
G1 X80.745 Y101.707 E.00761
G1 X81.755 Y102.717 E.01892
G1 X82.33 Y102.717 E.00761
G1 X80.745 Y101.132 E.02968
G1 X80.745 Y100.558 E.00761
G1 X82.904 Y102.717 E.04044
G1 X83.479 Y102.717 E.00761
G1 X80.745 Y99.983 E.0512
G1 X80.745 Y99.409 E.00761
G1 X84.235 Y102.898 E.06535
; WIPE_START
G1 F18000
G1 X82.82 Y101.484 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.855 Y93.913 Z.8 F42000
G1 X79.964 Y79.093 Z.8
G1 Z.4
G1 E.8 F1800
G1 F10304
M204 S6000
G1 X87.021 Y86.151 E.13217
G1 X86.369 Y84.924 E.0184
G1 X80.145 Y78.7 E.11655
G1 X80.145 Y78.125 E.00761
G1 X85.717 Y83.697 E.10434
G1 X85.064 Y82.47 E.0184
G1 X80.145 Y77.551 E.09212
G1 X80.145 Y77.283 E.00355
G1 X80.452 Y77.283 E.00406
G1 X84.412 Y81.243 E.07416
G1 X83.759 Y80.016 E.0184
G1 X81.026 Y77.283 E.05119
G1 X81.601 Y77.283 E.00761
G1 X83.107 Y78.789 E.02821
G1 X82.964 Y78.52 E.00403
G1 X83.257 Y78.365 E.00439
G1 X82.175 Y77.283 E.02026
G1 X82.75 Y77.283 E.00761
G1 X83.632 Y78.165 E.01652
G1 X84.007 Y77.966 E.00563
G1 X83.324 Y77.283 E.01279
M73 P52 R1
G1 X83.899 Y77.283 E.00761
G1 X84.382 Y77.766 E.00905
G1 X84.757 Y77.567 E.00563
G1 X84.473 Y77.283 E.00532
G1 X85.048 Y77.283 E.00761
G1 X85.266 Y77.501 E.00409
; WIPE_START
G1 F18000
G1 X85.048 Y77.283 E-.11741
G1 X84.473 Y77.283 E-.21833
G1 X84.757 Y77.567 E-.15256
G1 X84.382 Y77.766 E-.16143
G1 X84.177 Y77.561 E-.11026
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I-.32 J1.174 P1  F42000
G1 X92.752 Y79.902 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.532538
G1 F10304
M204 S6000
G1 X92.752 Y78.611 E.02169
G1 X92.065 Y78.611 E.01153
G1 X92.723 Y79.849 E.02356
M204 S10000
G1 X93.211 Y81.743 F42000
; LINE_WIDTH: 0.419998
G1 F10304
M204 S6000
G1 X93.211 Y78.151 E.04716
G1 X91.301 Y78.151 E.02507
G1 X93.183 Y81.69 E.05263
M204 S10000
G1 X93.671 Y83.435 F42000
; LINE_WIDTH: 0.422565
G1 F10304
M204 S6000
G1 X93.61 Y83.144 E.00392
G1 X93.613 Y77.749 E.0713
G1 X90.631 Y77.749 E.03942
G1 X93.641 Y83.383 E.08441
M204 S10000
G1 X94.017 Y84.975 F42000
; LINE_WIDTH: 0.414618
G1 F10304
M204 S6000
G1 X94.017 Y83.856 E.0145
G1 X94.053 Y83.74 E.00157
G1 X94.218 Y83.678 E.00229
G1 X95.24 Y83.678 E.01324
G1 X95.24 Y83.322 E.00461
G1 X94.218 Y83.322 E.01324
G1 X94.053 Y83.26 E.00229
G1 X94.017 Y83.144 E.00157
G1 X94.016 Y77.346 E.07512
G1 X89.96 Y77.346 E.05255
G1 X93.988 Y84.922 E.11116
; WIPE_START
G1 F18000
G1 X93.049 Y83.156 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I-1.123 J.469 P1  F42000
G1 X100.271 Y100.43 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F10304
M204 S5000
G1 X100.283 Y100.452 E.00028
G1 X99.996 Y100.604 E.00379
G1 X99.985 Y100.583 E.00028
G1 X100.218 Y100.459 E.00309
; WIPE_START
G1 F12000
M204 S6000
G1 X100.283 Y100.452 E-.07261
G1 X99.996 Y100.604 E-.36368
G1 X99.985 Y100.583 E-.02729
G1 X100.218 Y100.459 E-.29641
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.395 Y101.428 Z.8 F42000
G1 Z.4
G1 E.8 F1800
G1 F10304
M204 S5000
G1 X99.212 Y100.994 E.0108
G1 X99.223 Y101.015 E.00028
G1 X98.438 Y101.433 E.01038
M204 S250
G1 X97.622 Y101.839 F42000
G1 F10304
M204 S5000
G1 X97.634 Y101.86 E.00028
G1 X97.347 Y102.013 E.00379
G1 X97.336 Y101.991 E.00028
G1 X97.569 Y101.867 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 0.48
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F12000
M204 S6000
G1 X97.634 Y101.86 E-.0726
G1 X97.347 Y102.013 E-.36369
G1 X97.336 Y101.991 E-.0273
G1 X97.569 Y101.867 E-.29641
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/19
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.8 I.811 J-.908 P1  F42000
G1 X94.852 Y99.44 Z.8
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F7625
M204 S5000
G1 X94.852 Y101.035 E.02095
G1 X92.757 Y101.035 E.02751
G1 X92.757 Y103.49 E.03223
G1 X79.372 Y103.489 E.17575
G1 X79.372 Y101.66 E.02402
G1 X79.972 Y101.66 E.00788
M73 P53 R1
G1 X79.972 Y99.34 E.03046
G1 X79.372 Y99.34 E.00788
G1 X79.372 Y82.66 E.21901
G1 X79.972 Y82.66 E.00788
G1 X79.972 Y80.34 E.03046
G1 X79.372 Y80.34 E.00788
G1 X79.372 Y76.511 E.05028
G1 X88.391 Y76.51 E.11842
G1 X84.009 Y78.84 E.06516
G1 X94.852 Y99.232 E.30325
G1 X94.852 Y99.38 E.00193
; WIPE_START
G1 F12000
M204 S6000
G1 X94.852 Y101.035 E-.62906
G1 X94.508 Y101.035 E-.13094
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I1.214 J.085 P1  F42000
G1 X95.333 Y89.231 Z.88
G1 Z.48
G1 E.8 F1800
G1 F7625
M204 S5000
G1 X88.569 Y76.51 E.18917
G1 X94.852 Y76.51 E.08249
G1 X94.852 Y82.51 E.07878
G1 X96.052 Y82.51 E.01576
G1 X96.052 Y84.49 E.026
G1 X94.852 Y84.49 E.01576
G1 X94.852 Y87.51 E.03965
G1 X96.052 Y87.51 E.01576
G1 X96.052 Y89.49 E.026
G1 X95.675 Y89.49 E.00496
G1 X95.919 Y89.949 E.00683
G1 X95.76 Y90.034 E.00236
G1 X95.361 Y89.284 E.01115
; WIPE_START
G1 F12000
M204 S6000
G1 X94.422 Y87.518 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X94.631 Y86.073
G1 Z.48
G1 E.8 F1800
; FEATURE: Top surface
G1 F7625
M204 S2000
G1 X94.157 Y86.547 E.0088
G1 X93.959 Y86.175
G1 X94.631 Y85.504 E.01247
G1 X94.631 Y84.934
G1 X93.761 Y85.803 E.01614
G1 X93.564 Y85.431
G1 X94.631 Y84.364 E.01981
G1 X95.296 Y84.268
G1 X95.831 Y83.734 E.00993
G1 X95.831 Y83.164
G1 X94.726 Y84.268 E.02051
; WIPE_START
G1 F12000
M204 S6000
G1 X95.831 Y83.164 E-.59344
G1 X95.831 Y83.603 E-.16657
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P54 R1
G1 X95.694 Y82.732 Z.88 F42000
G1 Z.48
G1 E.8 F1800
G1 F7625
M204 S2000
G1 X93.366 Y85.059 E.04322
G1 X93.168 Y84.687
G1 X95.124 Y82.732 E.03632
G1 X94.631 Y82.655
G1 X92.97 Y84.315 E.03083
G1 X92.773 Y83.943
G1 X94.631 Y82.085 E.0345
G1 X94.631 Y81.516
G1 X92.575 Y83.571 E.03817
G1 X92.377 Y83.2
G1 X94.631 Y80.946 E.04184
G1 X94.631 Y80.376
G1 X92.179 Y82.828 E.04552
G1 X91.982 Y82.456
G1 X94.631 Y79.807 E.04919
G1 X94.63 Y79.237
G1 X91.784 Y82.084 E.05286
G1 X91.586 Y81.712
G1 X94.63 Y78.667 E.05653
G1 X94.63 Y78.098
G1 X91.388 Y81.34 E.0602
G1 X91.191 Y80.968
G1 X94.63 Y77.528 E.06387
G1 X94.63 Y76.958
G1 X90.993 Y80.596 E.06755
G1 X90.795 Y80.224
G1 X94.287 Y76.732 E.06485
G1 X93.718 Y76.732
G1 X90.597 Y79.852 E.05794
G1 X90.539 Y79.341
G1 X93.148 Y76.732 E.04845
G1 X92.578 Y76.732
G1 X90.341 Y78.969 E.04154
G1 X90.143 Y78.597
G1 X92.009 Y76.732 E.03464
G1 X91.439 Y76.732
G1 X89.946 Y78.225 E.02773
G1 X89.748 Y77.853
G1 X90.869 Y76.732 E.02082
G1 X90.3 Y76.732
G1 X89.55 Y77.481 E.01392
G1 X89.213 Y77.249
G1 X89.73 Y76.732 E.0096
; WIPE_START
M73 P55 R1
G1 F12000
M204 S6000
G1 X89.213 Y77.249 E-.27783
G1 X89.55 Y77.481 E-.15563
G1 X90.158 Y76.874 E-.32654
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.554 Y83.709 Z.88 F42000
G1 X95.831 Y88.291 Z.88
G1 Z.48
G1 E.8 F1800
G1 F7625
M204 S2000
G1 X95.483 Y88.639 E.00646
G1 X95.285 Y88.267
G1 X95.821 Y87.732 E.00995
; WIPE_START
G1 F12000
M204 S6000
G1 X95.285 Y88.267 E-.34462
G1 X95.483 Y88.639 E-.19164
G1 X95.831 Y88.291 E-.22374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-1.211 J-.121 P1  F42000
G1 X94.631 Y100.315 Z.88
G1 Z.48
G1 E.8 F1800
G1 F7625
M204 S2000
G1 X94.133 Y100.813 E.00925
G1 X93.563 Y100.813
G1 X94.631 Y99.746 E.01983
G1 X94.592 Y99.215
G1 X92.993 Y100.813 E.02969
; WIPE_START
G1 F12000
M204 S6000
G1 X94.407 Y99.399 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.536 Y102.41 Z.88 F42000
G1 Z.48
G1 E.8 F1800
G1 F7625
M204 S2000
G1 X91.678 Y103.268 E.01593
G1 X91.108 Y103.268
G1 X92.536 Y101.841 E.02651
G1 X92.536 Y101.271
G1 X90.538 Y103.268 E.03709
G1 X89.969 Y103.268
G1 X94.394 Y98.843 E.08218
G1 X94.196 Y98.471
G1 X89.399 Y103.268 E.08909
G1 X88.829 Y103.268
G1 X93.999 Y98.099 E.09599
G1 X93.801 Y97.727
G1 X88.259 Y103.268 E.1029
G1 X87.69 Y103.268
G1 X93.603 Y97.355 E.10981
G1 X93.405 Y96.983
G1 X87.12 Y103.268 E.11671
G1 X86.55 Y103.268
G1 X93.208 Y96.611 E.12362
G1 X93.01 Y96.239
G1 X85.981 Y103.268 E.13052
M73 P56 R1
G1 X85.411 Y103.268
G1 X92.812 Y95.867 E.13743
G1 X92.614 Y95.495
G1 X84.841 Y103.268 E.14434
G1 X84.272 Y103.268
G1 X92.417 Y95.124 E.15124
G1 X92.219 Y94.752
G1 X83.702 Y103.268 E.15815
G1 X83.132 Y103.268
G1 X92.021 Y94.38 E.16506
G1 X91.823 Y94.008
G1 X82.563 Y103.268 E.17196
G1 X81.993 Y103.268
G1 X91.626 Y93.636 E.17887
G1 X91.428 Y93.264
G1 X81.423 Y103.268 E.18578
G1 X80.854 Y103.268
G1 X91.23 Y92.892 E.19268
G1 X90.893 Y92.659
G1 X80.284 Y103.268 E.197
G1 X79.714 Y103.268
G1 X90.695 Y92.287 E.20391
G1 X90.497 Y91.915
G1 X79.594 Y102.819 E.20247
M73 P57 R1
G1 X79.594 Y102.249
G1 X79.962 Y101.882 E.00683
G1 X80.194 Y101.65
G1 X90.3 Y91.544 E.18766
G1 X90.102 Y91.172
G1 X80.194 Y101.08 E.18399
G1 X80.194 Y100.51
G1 X89.904 Y90.8 E.18031
G1 X89.846 Y90.288
G1 X80.194 Y99.94 E.17923
G1 X80.194 Y99.371
G1 X89.648 Y89.917 E.17556
G1 X89.45 Y89.545
G1 X79.876 Y99.118 E.17778
G1 X79.594 Y98.831
G1 X89.252 Y89.173 E.17935
G1 X89.055 Y88.801
G1 X79.594 Y98.262 E.17568
G1 X79.594 Y97.692
G1 X88.857 Y88.429 E.17201
G1 X88.659 Y88.057
G1 X79.594 Y97.122 E.16834
G1 X79.594 Y96.553
G1 X88.461 Y87.685 E.16466
M73 P58 R1
G1 X88.264 Y87.313
G1 X79.594 Y95.983 E.16099
G1 X79.594 Y95.413
G1 X88.066 Y86.941 E.15732
G1 X87.868 Y86.569
G1 X79.594 Y94.844 E.15365
G1 X79.594 Y94.274
G1 X87.67 Y86.197 E.14998
G1 X87.473 Y85.825
G1 X79.594 Y93.704 E.1463
G1 X79.594 Y93.135
G1 X87.275 Y85.453 E.14263
G1 X87.077 Y85.081
G1 X79.594 Y92.565 E.13896
G1 X79.594 Y91.995
G1 X86.879 Y84.71 E.13529
G1 X86.682 Y84.338
G1 X79.594 Y91.425 E.13161
G1 X79.594 Y90.856
G1 X86.484 Y83.966 E.12794
G1 X86.286 Y83.594
G1 X79.594 Y90.286 E.12427
G1 X79.594 Y89.716
G1 X86.088 Y83.222 E.1206
G1 X85.891 Y82.85
G1 X79.594 Y89.147 E.11693
M73 P59 R1
G1 X79.594 Y88.577
G1 X85.693 Y82.478 E.11325
G1 X85.377 Y82.224
G1 X79.594 Y88.007 E.1074
G1 X79.594 Y87.438
G1 X85.158 Y81.873 E.10332
G1 X84.96 Y81.501
G1 X79.594 Y86.868 E.09965
G1 X79.594 Y86.298
G1 X84.762 Y81.13 E.09598
G1 X84.565 Y80.758
G1 X79.594 Y85.729 E.09231
G1 X79.594 Y85.159
G1 X84.367 Y80.386 E.08863
G1 X84.308 Y79.874
G1 X79.594 Y84.589 E.08755
G1 X79.594 Y84.02
G1 X84.111 Y79.503 E.08388
G1 X83.913 Y79.131
G1 X80.194 Y82.85 E.06906
G1 X80.194 Y82.28
G1 X83.715 Y78.759 E.06539
; WIPE_START
G1 F12000
M204 S6000
G1 X82.301 Y80.173 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.177 Y77.436 Z.88 F42000
G1 Z.48
G1 E.8 F1800
G1 F7625
M204 S2000
G1 X86.882 Y76.732 E.01309
G1 X86.312 Y76.732
G1 X84.96 Y78.083 E.0251
; WIPE_START
G1 F12000
M204 S6000
G1 X86.312 Y76.732 E-.72639
G1 X86.4 Y76.732 E-.03361
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.744 Y78.73 Z.88 F42000
G1 Z.48
G1 E.8 F1800
G1 F7625
M204 S2000
G1 X85.742 Y76.732 E.03711
M73 P60 R1
G1 X85.173 Y76.732
G1 X80.194 Y81.71 E.09245
G1 X80.194 Y81.141
G1 X84.603 Y76.732 E.08187
G1 X84.033 Y76.732
G1 X80.194 Y80.571 E.07129
G1 X80.077 Y80.118
G1 X83.463 Y76.732 E.06289
G1 X82.894 Y76.732
G1 X79.594 Y80.032 E.06128
G1 X79.594 Y79.462
G1 X82.324 Y76.732 E.0507
G1 X81.754 Y76.732
G1 X79.594 Y78.892 E.04012
G1 X79.594 Y78.323
G1 X81.185 Y76.732 E.02954
G1 X80.615 Y76.732
G1 X79.594 Y77.753 E.01897
G1 X79.594 Y77.183
G1 X80.045 Y76.732 E.00839
; WIPE_START
G1 F12000
M204 S6000
G1 X79.594 Y77.183 E-.24274
G1 X79.594 Y77.753 E-.21648
G1 X80.153 Y77.193 E-.30078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.162 Y82.882 Z.88 F42000
G1 Z.48
G1 E.8 F1800
G1 F7625
M204 S2000
G1 X79.594 Y83.45 E.01055
; WIPE_START
G1 F12000
M204 S6000
G1 X80.162 Y82.882 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I.796 J.92 P1  F42000
G1 X86.997 Y76.969 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.082585
G1 F7625
M204 S6000
G1 X86.849 Y77.079 E.00039
M204 S10000
G1 X86.111 Y77.371 F42000
; LINE_WIDTH: 0.18285
G1 F7625
M204 S6000
G1 X85.952 Y77.489 E.00107
; LINE_WIDTH: 0.135913
G1 X85.792 Y77.607 E.00077
; LINE_WIDTH: 0.0889752
G1 X85.632 Y77.726 E.00047
M204 S10000
G1 X84.895 Y78.018 F42000
; LINE_WIDTH: 0.182847
G1 F7625
M204 S6000
G1 X84.735 Y78.136 E.00107
; LINE_WIDTH: 0.135911
G1 X84.575 Y78.254 E.00077
; LINE_WIDTH: 0.0889742
G1 X84.416 Y78.372 E.00047
; WIPE_START
G1 F18000
G1 X84.575 Y78.254 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I-.993 J.703 P1  F42000
G1 X100.271 Y100.43 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F7625
M204 S5000
G1 X100.283 Y100.452 E.00028
G1 X99.996 Y100.604 E.00379
G1 X99.985 Y100.583 E.00028
G1 X100.218 Y100.459 E.00309
; WIPE_START
G1 F12000
M204 S6000
G1 X100.283 Y100.452 E-.07261
G1 X99.996 Y100.604 E-.36368
G1 X99.985 Y100.583 E-.0273
G1 X100.218 Y100.459 E-.2964
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.395 Y101.428 Z.88 F42000
G1 Z.48
G1 E.8 F1800
G1 F7625
M204 S5000
G1 X99.212 Y100.994 E.0108
G1 X99.223 Y101.015 E.00028
G1 X98.438 Y101.433 E.01038
M204 S250
G1 X97.622 Y101.839 F42000
G1 F7625
M204 S5000
G1 X97.634 Y101.86 E.00028
G1 X97.347 Y102.013 E.00379
G1 X97.336 Y101.991 E.00028
G1 X97.569 Y101.867 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 0.56
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F12000
M204 S6000
G1 X97.634 Y101.86 E-.07261
G1 X97.347 Y102.013 E-.36369
G1 X97.336 Y101.991 E-.02729
M73 P61 R1
G1 X97.569 Y101.867 E-.29641
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/19
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.88 I.406 J-1.147 P1  F42000
G1 X96.169 Y101.371 Z.88
G1 Z.56
G1 E.8 F1800
; FEATURE: Support transition
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.16
G1 F1267
M204 S6000
G1 X96.169 Y101.611 E.00605
G1 X95.475 Y101.611 E.01744
G1 X95.613 Y101.473 E.00491
G1 X95.613 Y100.326 E.02885
G1 X96.075 Y101.193 E.0247
; WIPE_START
G1 F3000
G1 X95.613 Y100.326 E-.37327
G1 X95.613 Y101.344 E-.38673
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.96 I1.012 J.675 P1  F42000
G1 X96.799 Y99.567 Z.96
G1 Z.56
G1 E.8 F1800
G1 F1267
M204 S6000
G1 X97.072 Y100.082 E.01465
G1 X97.072 Y95.806 E.10751
G1 X96.169 Y95.806 E.0227
G1 X96.169 Y98.914 E.07814
G1 X96.069 Y98.883 E.00263
G1 X95.613 Y99.125 E.01297
G2 X95.436 Y98.708 I-.94 J.154 E.0115
G1 X95.655 Y98.708 E.00551
G1 X95.655 Y95.806 E.07298
G1 X95.968 Y95.806 E.00787
M204 S10000
G1 X100.482 Y95.806 F42000
G1 F1267
M204 S6000
G1 X99.781 Y95.806 E.01763
G1 X99.781 Y97.934 E.0535
G1 X99.508 Y97.42 E.01461
G1 X99.071 Y97.287 E.01148
G1 X98.878 Y97.39 E.0055
G1 X98.878 Y95.806 E.03983
G1 X97.975 Y95.806 E.0227
G1 X97.975 Y100.813 E.12589
G1 X98.878 Y100.334 E.0257
G1 X98.878 Y99.223 E.02793
G1 X98.297 Y98.131 E.03109
M204 S10000
G1 X98.972 Y99.401 F42000
G1 F1267
M204 S6000
G1 X99.338 Y100.089 E.0196
G1 X99.056 Y100.239 E.00805
; WIPE_START
G1 F3000
G1 X99.338 Y100.089 E-.2212
G1 X98.972 Y99.401 E-.5388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.96 I.236 J1.194 P1  F42000
M73 P62 R1
G1 X100.41 Y99.117 Z.96
G1 Z.56
G1 E.8 F1800
G1 F1267
M204 S6000
G1 X100.683 Y99.631 E.01465
G1 X100.683 Y95.806 E.09618
G1 X101.461 Y95.806 E.01955
G1 X101.461 Y101.611 E.14597
G1 X100.683 Y101.611 E.01955
G1 X100.683 Y101.076 E.01346
G1 X100.997 Y100.909 E.00893
G1 X101.131 Y100.472 E.01148
G1 X100.778 Y99.809 E.01889
; WIPE_START
G1 F3000
G1 X101.131 Y100.472 E-.28548
G1 X100.997 Y100.909 E-.17357
G1 X100.683 Y101.076 E-.135
G1 X100.683 Y101.513 E-.16596
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.96 I1.08 J-.561 P1  F42000
G1 X100.505 Y101.171 Z.96
G1 Z.56
G1 E.8 F1800
G1 F1267
M204 S6000
G1 X99.781 Y101.556 E.02064
G1 X99.781 Y101.611 E.00139
G1 X100.482 Y101.611 E.01763
; WIPE_START
G1 F3000
G1 X99.781 Y101.611 E-.33782
G1 X99.781 Y101.556 E-.02671
G1 X100.505 Y101.171 E-.39547
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.96 I1.155 J-.384 P1  F42000
G1 X96.79 Y90 Z.96
G1 Z.56
G1 E.8 F1800
; FEATURE: Support
G1 F1267
M204 S6000
G1 X98.558 Y90 E.04444
G1 X98.558 Y92.903 E.07298
G1 X96.058 Y92.903 E.06285
M204 S10000
G1 X95.266 Y93.084 F42000
; FEATURE: Support interface
G1 F1267
M204 S6000
G1 X95.266 Y90.727 E.05926
G1 X94.364 Y89.029 E.04835
G1 X94.364 Y92.903 E.0974
G1 X93.461 Y92.903 E.0227
G1 X93.461 Y87.331 E.14009
M73 P63 R1
G1 X93.336 Y87.097 E.00666
G1 X92.558 Y87.097 E.01957
G1 X92.558 Y92.903 E.14597
G1 X92.349 Y92.903 E.00525
G1 X91.655 Y91.598 E.03717
G1 X91.655 Y87.097 E.11315
G1 X90.752 Y87.097 E.0227
G1 X90.752 Y89.9 E.07046
G1 X89.849 Y88.202 E.04835
G1 X89.849 Y86.916 E.03233
; WIPE_START
G1 F4800
G1 X89.849 Y88.202 E-.48868
G1 X90.185 Y88.832 E-.27132
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.96 I1.214 J-.091 P1  F42000
G1 X89.849 Y84.376 Z.96
G1 Z.56
G1 E.8 F1800
G1 F1267
M204 S6000
G1 X89.849 Y80.539 E.09646
G1 X88.947 Y78.841 E.04835
G1 X88.947 Y84.195 E.13459
G1 X88.044 Y84.195 E.0227
G1 X88.044 Y77.557 E.16688
G1 X87.141 Y78.037 E.02571
M73 P64 R1
G1 X87.141 Y83.108 E.12749
G1 X86.238 Y81.41 E.04835
G1 X86.238 Y78.517 E.07273
G1 X85.335 Y78.997 E.02571
G1 X85.335 Y80.098 E.02768
M204 S250
G1 X84.685 Y80.064 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
; LAYER_HEIGHT: 0.08
G1 F1267
M204 S5000
G1 X85.636 Y81.851 E.02366
G1 X85.437 Y81.956 E.00262
G1 X84.487 Y80.169 E.02366
G1 X84.632 Y80.092 E.00192
; WIPE_START
G1 F12000
M204 S6000
G1 X85.623 Y81.829 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.96 I.925 J.79 P1  F42000
G1 X89.167 Y77.681 Z.96
G1 Z.56
G1 E.8 F1800
G1 F1267
M204 S5000
G1 X89.365 Y77.575 E.00262
G1 X90.315 Y79.363 E.02366
G1 X90.117 Y79.468 E.00262
G1 X89.195 Y77.734 E.02295
; WIPE_START
G1 F12000
M204 S6000
G1 X89.365 Y77.575 E-.08825
G1 X90.195 Y79.136 E-.67175
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.629 Y85.952 Z.96 F42000
G1 X94.8 Y88.276 Z.96
G1 Z.56
G1 E.8 F1800
G1 F1267
M204 S5000
G1 X94.998 Y88.171 E.00262
G1 X95.835 Y89.744 E.02082
G1 X95.949 Y89.958 E.00284
G1 X95.751 Y90.064 E.00262
G1 X94.828 Y88.329 E.02295
; WIPE_START
G1 F12000
M204 S6000
G1 X94.998 Y88.171 E-.08825
G1 X95.828 Y89.732 E-.67175
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.96 I-.202 J-1.2 P1  F42000
M73 P65 R1
G1 X90.319 Y90.659 Z.96
G1 Z.56
G1 E.8 F1800
G1 F1267
M204 S5000
G1 X91.269 Y92.446 E.02366
G1 X91.071 Y92.552 E.00262
G1 X90.121 Y90.764 E.02366
G1 X90.266 Y90.687 E.00192
; WIPE_START
G1 F12000
M204 S6000
G1 X91.257 Y92.425 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.32 Y99.415 Z.96 F42000
G1 X94.45 Y99.712 Z.96
G1 Z.56
G1 E.8 F1800
G1 F1267
M204 S5000
G1 X94.45 Y99.488 E.00262
G1 X94.674 Y99.488 E.00262
G1 X94.674 Y99.712 E.00262
G1 X94.51 Y99.712 E.00192
; WIPE_START
G1 F12000
M204 S6000
G1 X94.45 Y99.488 E-.20881
G1 X94.674 Y99.488 E-.20172
G1 X94.674 Y99.712 E-.20172
G1 X94.51 Y99.712 E-.14776
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.96 I-.688 J1.004 P1  F42000
G1 X97.619 Y101.841 Z.96
G1 Z.56
G1 E.8 F1800
G1 F1267
M204 S5000
G1 X97.625 Y101.853 E.00017
G1 X97.347 Y102.013 E.00374
G1 X97.336 Y101.991 E.00028
G1 X97.566 Y101.869 E.00304
M204 S250
G1 X98.399 Y101.426 F42000
G1 F1267
M204 S5000
G1 X99.208 Y100.996 E.01071
G1 X99.219 Y101.017 E.00028
G1 X98.442 Y101.431 E.01029
; WIPE_START
G1 F12000
M204 S6000
G1 X99.208 Y100.996 E-.3749
G1 X99.219 Y101.017 E-.01035
G1 X98.442 Y101.431 E-.37475
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.271 Y100.43 Z.96 F42000
G1 Z.56
G1 E.8 F1800
G1 F1267
M204 S5000
G1 X100.283 Y100.452 E.00028
G1 X100 Y100.602 E.00374
G1 X99.988 Y100.581 E.00028
G1 X100.218 Y100.459 E.00304
; WIPE_START
G1 F12000
M204 S6000
G1 X100.283 Y100.452 E-.0735
G1 X100 Y100.602 E-.3635
G1 X99.988 Y100.581 E-.02762
G1 X100.218 Y100.459 E-.29538
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.96 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 0.64
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 8/19
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S204
; OBJECT_ID: 15
G1 X98.382 Y101.435 F42000
G1 Z.64
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X99.225 Y100.987 E.01117
G1 X99.237 Y101.008 E.00028
G1 X98.424 Y101.44 E.01075
; WIPE_START
G1 F12000
M204 S6000
G1 X99.225 Y100.987 E-.37511
G1 X99.237 Y101.008 E-.00992
G1 X98.424 Y101.44 E-.37497
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.271 Y100.43 Z1.04 F42000
G1 Z.64
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X100.283 Y100.452 E.00028
G1 X99.983 Y100.611 E.00397
G1 X99.971 Y100.59 E.00028
G1 X100.218 Y100.459 E.00327
; WIPE_START
G1 F12000
M204 S6000
G1 X100.283 Y100.452 E-.06945
G1 X99.983 Y100.611 E-.3644
G1 X99.971 Y100.59 E-.0261
G1 X100.218 Y100.459 E-.30005
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.635 Y101.832 Z1.04 F42000
G1 Z.64
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X97.647 Y101.853 E.00028
G1 X97.347 Y102.013 E.00396
G1 X97.336 Y101.991 E.00028
G1 X97.582 Y101.86 E.00326
; WIPE_START
G1 F12000
M204 S6000
G1 X97.647 Y101.853 E-.06949
G1 X97.347 Y102.013 E-.36438
G1 X97.336 Y101.991 E-.02613
G1 X97.582 Y101.86 E-.3
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.04 I.688 J-1.004 P1  F42000
G1 X94.45 Y99.712 Z1.04
G1 Z.64
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X94.45 Y99.488 E.00262
G1 X94.674 Y99.488 E.00262
G1 X94.674 Y99.712 E.00262
G1 X94.51 Y99.712 E.00192
; WIPE_START
G1 F12000
M204 S6000
G1 X94.45 Y99.488 E-.20881
G1 X94.674 Y99.488 E-.20172
G1 X94.674 Y99.712 E-.20172
G1 X94.51 Y99.712 E-.14776
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.303 Y92.786 Z1.04 F42000
G1 X90.319 Y90.659 Z1.04
M73 P66 R1
G1 Z.64
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X91.076 Y92.082 E.01884
G1 X91.269 Y92.446 E.00482
G1 X91.071 Y92.552 E.00262
G1 X90.121 Y90.764 E.02366
G1 X90.266 Y90.687 E.00192
; WIPE_START
G1 F12000
M204 S6000
G1 X91.076 Y92.082 E-.61305
G1 X91.257 Y92.424 E-.14695
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.04 I.925 J.79 P1  F42000
G1 X94.8 Y88.276 Z1.04
G1 Z.64
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X94.998 Y88.171 E.00262
G1 X95.74 Y89.565 E.01846
G1 X95.949 Y89.958 E.0052
G1 X95.751 Y90.064 E.00262
G1 X94.828 Y88.329 E.02295
; WIPE_START
G1 F12000
M204 S6000
G1 X94.998 Y88.171 E-.08825
G1 X95.74 Y89.565 E-.60015
G1 X95.828 Y89.732 E-.07161
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.136 Y83.052 Z1.04 F42000
G1 X89.167 Y77.681 Z1.04
G1 Z.64
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X89.365 Y77.575 E.00262
G1 X90.262 Y79.264 E.02234
G1 X90.315 Y79.363 E.00131
G1 X90.117 Y79.468 E.00262
G1 X89.195 Y77.734 E.02295
; WIPE_START
G1 F12000
M204 S6000
G1 X89.365 Y77.575 E-.08825
G1 X90.195 Y79.136 E-.67176
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.04 I-.202 J-1.2 P1  F42000
G1 X84.685 Y80.064 Z1.04
G1 Z.64
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X85.442 Y81.487 E.01884
G1 X85.636 Y81.851 E.00482
G1 X85.437 Y81.956 E.00262
G1 X84.487 Y80.169 E.02366
G1 X84.632 Y80.092 E.00192
; WIPE_START
G1 F12000
M204 S6000
G1 X85.442 Y81.487 E-.61304
G1 X85.624 Y81.829 E-.14696
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.04 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 0.72
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 9/19
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
G1 X90.031 Y83.68 F42000
G1 Z.72
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.16
G1 F1200
M204 S6000
G1 X87.275 Y83.68 E.06928
G1 X86.795 Y82.777 E.02571
G1 X89.85 Y82.777 E.07679
G1 X89.85 Y81.875 E.0227
M73 P67 R1
G1 X86.482 Y81.875 E.08465
G1 X86.005 Y80.972 E.02568
G1 X90.249 Y80.972 E.10671
G1 X89.863 Y80.245 E.0207
G3 X89.599 Y80.069 I-.044 J-.22 E.00884
G1 X85.525 Y80.069 E.10244
G1 X85.154 Y79.37 E.01989
G3 X84.875 Y79.166 I.1 J-.428 E.00893
G1 X89.119 Y79.166 E.10671
G1 X88.639 Y78.263 E.02571
G1 X86.946 Y78.263 E.04257
G1 X86.946 Y77.97 E.00736
G1 X88.094 Y77.36 E.03267
G1 X88.535 Y77.36 E.01108
; WIPE_START
G1 F4800
G1 X88.094 Y77.36 E-.16752
G1 X86.946 Y77.97 E-.4938
G1 X86.946 Y78.23 E-.09868
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.12 I-1.152 J.392 P1  F42000
G1 X91.87 Y92.709 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X95.655 Y92.709 E.09516
G1 X95.655 Y91.806 E.0227
G1 X91.765 Y91.806 E.09779
G1 X91.285 Y90.903 E.02571
G1 X95.655 Y90.889 E.10986
M73 P68 R1
G1 X95.294 Y90.778 E.00951
G1 X94.88 Y90 E.02215
G1 X90.805 Y90 E.10244
G2 X90.573 Y89.883 I-.239 J.184 E.00677
G1 X90.155 Y89.097 E.02236
G1 X94.4 Y89.097 E.10671
G1 X93.952 Y88.256 E.02396
G1 X93.971 Y88.194 E.00161
G1 X89.849 Y88.194 E.10363
G1 X89.849 Y87.292 E.0227
G1 X93.815 Y87.292 E.09971
; WIPE_START
G1 F4800
G1 X91.815 Y87.292 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.12 I-.582 J1.069 P1  F42000
G1 X96.79 Y90 Z1.12
G1 Z.72
G1 E.8 F1800
; FEATURE: Support
G1 F1200
M204 S6000
G1 X98.558 Y90 E.04444
G1 X98.558 Y92.903 E.07298
G1 X96.058 Y92.903 E.06285
; WIPE_START
G1 F9000
G1 X98.058 Y92.903 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.12 I-1.149 J-.402 P1  F42000
G1 X95.282 Y100.834 Z1.12
G1 Z.72
G1 E.8 F1800
; FEATURE: Support interface
M73 P69 R1
G1 F1200
M204 S6000
G1 X96.089 Y100.834 E.02029
; WIPE_START
G1 F4800
G1 X95.282 Y100.834 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.12 I0 J1.217 P1  F42000
G1 X98.322 Y100.834 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X97.472 Y100.834 E.02137
G1 X96.992 Y99.931 E.02571
G1 X99.254 Y99.931 E.05688
G1 X98.774 Y99.028 E.02571
G1 X95.436 Y99.028 E.08393
G1 X95.266 Y98.708 E.00911
G1 X95.655 Y98.708 E.00978
G1 X95.655 Y98.125 E.01465
G1 X98.5 Y98.125 E.07152
; WIPE_START
G1 F4800
G1 X96.5 Y98.125 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.12 I.403 J1.148 P1  F42000
G1 X101.642 Y96.32 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X95.655 Y96.32 E.15053
G1 X95.655 Y97.223 E.0227
G1 X101.461 Y97.223 E.14598
G1 X101.461 Y98.125 E.0227
G1 X99.883 Y98.125 E.03968
G1 X100.363 Y99.028 E.02571
G1 X101.461 Y99.028 E.02761
G1 X101.461 Y99.931 E.0227
G1 X100.843 Y99.931 E.01554
M73 P70 R1
G1 X101.13 Y100.472 E.01541
G1 X101.02 Y100.834 E.00951
G1 X101.642 Y100.834 E.01565
; WIPE_START
G1 F4800
G1 X101.02 Y100.834 E-.23647
G1 X101.13 Y100.472 E-.14366
G1 X100.843 Y99.931 E-.23296
G1 X101.229 Y99.931 E-.1469
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.12 I.935 J-.779 P1  F42000
G1 X84.685 Y80.064 Z1.12
G1 Z.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
; LAYER_HEIGHT: 0.08
G1 F1200
M204 S5000
G1 X85.217 Y81.063 E.01323
G1 X85.636 Y81.851 E.01043
G1 X85.437 Y81.956 E.00262
G1 X84.487 Y80.169 E.02366
G1 X84.632 Y80.092 E.00192
; WIPE_START
G1 F12000
M204 S6000
G1 X85.217 Y81.063 E-.43083
G1 X85.623 Y81.828 E-.32918
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.12 I.925 J.791 P1  F42000
G1 X89.167 Y77.681 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X89.365 Y77.575 E.00262
G1 X90.15 Y79.052 E.01954
G1 X90.315 Y79.363 E.00412
G1 X90.117 Y79.468 E.00262
G1 X89.195 Y77.734 E.02295
; WIPE_START
G1 F12000
M204 S6000
G1 X89.365 Y77.575 E-.08825
G1 X90.15 Y79.052 E-.63543
G1 X90.195 Y79.136 E-.03633
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.629 Y85.952 Z1.12 F42000
G1 X94.8 Y88.276 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X94.998 Y88.171 E.00262
G1 X95.645 Y89.387 E.0161
G1 X95.949 Y89.958 E.00756
G1 X95.751 Y90.064 E.00262
G1 X94.828 Y88.329 E.02295
; WIPE_START
G1 F12000
M204 S6000
G1 X94.998 Y88.171 E-.08825
G1 X95.645 Y89.387 E-.5234
G1 X95.828 Y89.732 E-.14835
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.12 I-.623 J-1.046 P1  F42000
G1 X91.269 Y92.446 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X91.071 Y92.552 E.00262
G1 X90.121 Y90.764 E.02366
G1 X90.319 Y90.659 E.00262
G1 X90.85 Y91.659 E.01323
G1 X91.241 Y92.393 E.00972
; WIPE_START
G1 F12000
M204 S6000
G1 X91.071 Y92.552 E-.08825
G1 X90.241 Y90.991 E-.67175
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.558 Y97.865 Z1.12 F42000
G1 X94.45 Y99.712 Z1.12
G1 Z.72
G1 E.8 F1800
M73 P71 R1
G1 F1200
M204 S5000
G1 X94.45 Y99.488 E.00262
G1 X94.674 Y99.488 E.00262
G1 X94.674 Y99.712 E.00262
G1 X94.51 Y99.712 E.00192
; WIPE_START
G1 F12000
M204 S6000
G1 X94.45 Y99.488 E-.20881
G1 X94.674 Y99.488 E-.20172
G1 X94.674 Y99.712 E-.20172
G1 X94.51 Y99.712 E-.14776
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.12 I-.674 J1.013 P1  F42000
G1 X97.67 Y101.814 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X97.683 Y101.807 E.00018
G1 X97.694 Y101.828 E.00028
G1 X97.681 Y101.835 E.00018
G1 X97.347 Y102.013 E.00442
G1 X97.336 Y101.991 E.00028
G1 X97.617 Y101.842 E.00372
; WIPE_START
G1 F12000
M204 S6000
G1 X97.683 Y101.807 E-.06847
G1 X97.694 Y101.828 E-.022
G1 X97.681 Y101.835 E-.01383
G1 X97.347 Y102.013 E-.34409
G1 X97.336 Y101.991 E-.02207
G1 X97.617 Y101.842 E-.28953
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.271 Y100.43 Z1.12 F42000
G1 Z.72
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X100.283 Y100.452 E.00028
G1 X99.948 Y100.63 E.00442
G1 X99.935 Y100.637 E.00018
G1 X99.923 Y100.615 E.00028
G1 X99.937 Y100.608 E.00018
G1 X100.218 Y100.459 E.00372
; WIPE_START
G1 F12000
M204 S6000
G1 X100.283 Y100.452 E-.06026
G1 X99.948 Y100.63 E-.35228
G1 X99.935 Y100.637 E-.01419
G1 X99.923 Y100.615 E-.02264
G1 X99.937 Y100.608 E-.01419
G1 X100.218 Y100.459 E-.29644
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.347 Y101.453 Z1.12 F42000
G1 Z.72
G1 E.8 F1800
M73 P71 R0
G1 F1200
M204 S5000
G1 X98.906 Y101.156 E.0074
G1 X99.259 Y100.968 E.00467
G1 X99.273 Y100.961 E.00018
G1 X99.284 Y100.983 E.00028
G1 X99.271 Y100.99 E.00018
G1 X98.918 Y101.178 E.00467
G1 X98.363 Y101.472 E.00734
; WIPE_START
G1 F12000
M204 S6000
G1 X98.906 Y101.156 E-.23878
G1 X99.259 Y100.968 E-.152
G1 X99.273 Y100.961 E-.00579
G1 X99.284 Y100.983 E-.00925
G1 X99.271 Y100.99 E-.00579
G1 X98.918 Y101.178 E-.152
G1 X98.461 Y101.42 E-.19639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.12 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 10/19
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
G1 X89.167 Y77.681 F42000
G1 Z.8
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X89.365 Y77.575 E.00262
G1 X90.037 Y78.84 E.01674
G1 X90.315 Y79.363 E.00692
G1 X90.117 Y79.468 E.00262
G1 X89.195 Y77.734 E.02295
; WIPE_START
G1 F12000
M204 S6000
G1 X89.365 Y77.575 E-.08825
G1 X90.037 Y78.84 E-.54422
G1 X90.195 Y79.136 E-.12753
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.685 Y80.064 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X84.991 Y80.639 E.00762
G1 X85.636 Y81.851 E.01603
G1 X85.437 Y81.956 E.00262
G1 X84.487 Y80.169 E.02366
G1 X84.632 Y80.092 E.00192
; WIPE_START
G1 F12000
M204 S6000
G1 X84.991 Y80.639 E-.24887
G1 X85.623 Y81.827 E-.51113
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.206 Y88.566 Z1.2 F42000
G1 X91.269 Y92.446 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X91.071 Y92.552 E.00262
G1 X90.121 Y90.764 E.02366
G1 X90.319 Y90.659 E.00262
G1 X90.625 Y91.235 E.00762
G1 X91.241 Y92.393 E.01533
; WIPE_START
G1 F12000
M204 S6000
G1 X91.071 Y92.552 E-.08825
M73 P72 R0
G1 X90.241 Y90.991 E-.67175
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.8 Y88.276 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X94.998 Y88.171 E.00262
G1 X95.55 Y89.209 E.01374
G1 X95.949 Y89.958 E.00992
G1 X95.751 Y90.064 E.00262
G1 X94.828 Y88.329 E.02295
; WIPE_START
G1 F12000
M204 S6000
G1 X94.998 Y88.171 E-.08825
G1 X95.55 Y89.209 E-.44666
G1 X95.828 Y89.732 E-.2251
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I-1.208 J.149 P1  F42000
G1 X97.336 Y101.991 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X97.717 Y101.788 E.00505
M106 S255
G1 F600
G1 X98.3 Y101.479 E.00771
M106 S204
G1 F1200
G1 X98.653 Y101.291 E.00467
G1 X99.006 Y101.103 E.00467
G1 X99.307 Y100.943 E.00399
M106 S255
G1 F600
G1 X99.889 Y100.634 E.0077
M106 S204
G1 F1200
G1 X100.271 Y100.43 E.00506
G1 X100.283 Y100.452 E.00028
G1 X99.901 Y100.655 E.00505
M106 S255
G1 F600
G1 X99.319 Y100.964 E.0077
M106 S204
G1 F1200
G1 X98.965 Y101.152 E.00467
G1 X98.612 Y101.34 E.00467
G1 X98.311 Y101.5 E.00399
M106 S255
G1 F600
G1 X97.729 Y101.81 E.00771
M106 S204
G1 F1200
G1 X97.379 Y101.996 E.00463
; WIPE_START
G1 F2697.799
M204 S6000
G1 X97.717 Y101.788 E-.15085
G1 X98.3 Y101.479 E-.25064
G1 X98.653 Y101.291 E-.152
G1 X99.006 Y101.103 E-.152
G1 X99.133 Y101.036 E-.05451
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I.331 J-1.171 P1  F42000
G1 X94.45 Y99.712 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X94.45 Y99.488 E.00262
G1 X94.674 Y99.488 E.00262
G1 X94.674 Y99.712 E.00262
G1 X94.51 Y99.712 E.00192
; WIPE_START
G1 F12000
M204 S6000
G1 X94.45 Y99.488 E-.20881
G1 X94.674 Y99.488 E-.20172
G1 X94.674 Y99.712 E-.20172
G1 X94.51 Y99.712 E-.14776
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 0.88
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 11/19
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
G1 X89.167 Y77.681 F42000
G1 Z.88
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X89.365 Y77.575 E.00262
G1 X89.924 Y78.628 E.01393
G1 X90.315 Y79.363 E.00972
G1 X90.117 Y79.468 E.00262
G1 X89.195 Y77.734 E.02295
; WIPE_START
G1 F12000
M204 S6000
G1 X89.365 Y77.575 E-.08825
G1 X89.924 Y78.628 E-.45302
G1 X90.195 Y79.136 E-.21873
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.766 Y80.216 Z1.28 F42000
G1 Z.88
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X85.636 Y81.851 E.02164
M73 P73 R0
G1 X85.437 Y81.956 E.00262
G1 X84.487 Y80.169 E.02366
G1 X84.685 Y80.064 E.00262
G1 X84.738 Y80.163 E.00131
; WIPE_START
G1 F12000
M204 S6000
G1 X85.636 Y81.851 E-.72662
G1 X85.558 Y81.892 E-.03338
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.199 Y88.6 Z1.28 F42000
G1 X90.4 Y90.811 Z1.28
G1 Z.88
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X91.269 Y92.446 E.02164
G1 X91.071 Y92.552 E.00262
G1 X90.121 Y90.764 E.02366
G1 X90.319 Y90.659 E.00262
G1 X90.371 Y90.758 E.00131
; WIPE_START
G1 F12000
M204 S6000
G1 X91.269 Y92.446 E-.72662
G1 X91.192 Y92.488 E-.03338
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.8 Y88.276 Z1.28 F42000
G1 Z.88
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X94.998 Y88.171 E.00262
G1 X95.455 Y89.03 E.01138
G1 X95.949 Y89.958 E.01228
G1 X95.751 Y90.064 E.00262
G1 X94.829 Y88.329 E.02295
; WIPE_START
G1 F12000
M204 S6000
G1 X94.998 Y88.171 E-.08825
G1 X95.455 Y89.03 E-.36991
G1 X95.828 Y89.732 E-.30184
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.28 I-1.208 J.148 P1  F42000
G1 X97.335 Y101.989 Z1.28
G1 Z.88
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X100.271 Y100.431 E.03885
G1 X100.283 Y100.452 E.00028
G1 X97.377 Y101.997 E.03845
; WIPE_START
G1 F12000
M204 S6000
G1 X99.136 Y101.045 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.28 I.333 J-1.171 P1  F42000
G1 X94.45 Y99.712 Z1.28
G1 Z.88
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X94.45 Y99.488 E.00262
G1 X94.674 Y99.488 E.00262
G1 X94.674 Y99.712 E.00262
G1 X94.51 Y99.712 E.00192
; WIPE_START
G1 F12000
M204 S6000
G1 X94.45 Y99.488 E-.20881
G1 X94.674 Y99.488 E-.20172
G1 X94.674 Y99.712 E-.20172
G1 X94.51 Y99.712 E-.14776
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.28 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 0.96
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 12/19
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
G1 X95.266 Y98.527 F42000
G1 Z.96
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F1200
M204 S6000
G1 X95.266 Y101.793 E.11767
M204 S10000
G1 X96.169 Y101.793 F42000
G1 F1200
M204 S6000
M73 P74 R0
G1 X96.169 Y100.985 E.0291
; WIPE_START
G1 F4800
G1 X96.169 Y101.793 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.36 I1.006 J.685 P1  F42000
G1 X97.072 Y100.468 Z1.36
G1 Z.96
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X97.072 Y95.806 E.16799
G1 X96.169 Y95.806 E.03253
G1 X96.169 Y99.103 E.11882
; WIPE_START
G1 F4800
G1 X96.169 Y97.103 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.878 Y98.837 Z1.36 F42000
G1 Z.96
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X98.878 Y100.334 E.05393
G1 X97.975 Y100.813 E.03683
G1 X97.975 Y95.806 E.18043
G1 X98.878 Y95.806 E.03253
G1 X98.878 Y97.39 E.05708
G1 X99.071 Y97.287 E.00789
G1 X99.508 Y97.42 E.01646
G1 X99.781 Y97.933 E.02093
G1 X99.781 Y95.806 E.07667
G1 X100.683 Y95.806 E.03253
G1 X100.683 Y100.017 E.15177
; WIPE_START
G1 F4800
G1 X100.683 Y98.017 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.683 Y101.793 Z1.36 F42000
G1 Z.96
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X100.683 Y101.076 E.02583
G1 X99.781 Y101.556 E.03684
G1 X99.781 Y101.793 E.00853
; WIPE_START
M73 P75 R0
G1 F4800
G1 X99.781 Y101.556 E-.09105
G1 X100.683 Y101.076 E-.39328
G1 X100.683 Y101.793 E-.27568
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.36 I0 J-1.217 P1  F42000
G1 X94.364 Y101.793 Z1.36
G1 Z.96
G1 E.8 F1800
G1 F1200
M204 S6000
G1 X94.364 Y101.456 E.01212
G1 X93.461 Y101.456 E.03253
G1 X93.461 Y101.793 E.01212
; WIPE_START
G1 F4800
G1 X93.461 Y101.456 E-.16227
G1 X94.364 Y101.456 E-.43547
G1 X94.364 Y101.793 E-.16227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.728 Y94.337 Z1.36 F42000
G1 X89.183 Y78.171 Z1.36
G1 Z.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.08
M106 S255
G1 F600
M204 S6000
G1 X89.423 Y78.623 E.00723
M106 S204
M106 S255
G1 X89.72 Y79.181 E.00892
M106 S204
M106 S255
G1 X89.568 Y79.262 E.00243
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X85.771 Y81.281 E.06067
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X85.619 Y81.361 E.00243
M106 S204
M106 S255
G1 X85.082 Y80.351 E.01614
M106 S204
M106 S255
G1 X85.234 Y80.27 E.00243
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X89.031 Y78.251 E.06066
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X89.13 Y78.199 E.00158
M106 S204
M204 S250
G1 X89.16 Y77.709 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X89.356 Y77.605 E.0029
G1 X89.792 Y78.427 E.01221
G1 X89.91 Y78.647 E.00328
G1 X90.097 Y79.001 E.00525
G1 X90.285 Y79.354 E.00525
G1 X90.09 Y79.457 E.0029
M106 S255
G1 F600
G1 X89.764 Y79.631 E.00484
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X85.968 Y81.649 E.06067
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
G1 X85.642 Y81.823 E.00485
G1 F1200
G1 X85.447 Y81.926 E.0029
G1 X85.259 Y81.573 E.00525
G1 X85.071 Y81.22 E.00525
G1 X84.883 Y80.867 E.00525
G1 X84.705 Y80.531 E.00499
G1 X84.517 Y80.178 E.00525
G1 X84.712 Y80.074 E.0029
M106 S255
G1 F600
G1 X85.038 Y79.901 E.00485
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X88.835 Y77.882 E.06066
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
G1 X89.107 Y77.737 E.00406
; WIPE_START
M204 S6000
G1 X89.356 Y77.605 E-.10678
G1 X89.792 Y78.427 E-.35341
G1 X89.91 Y78.647 E-.09501
G1 X90.097 Y79.001 E-.152
G1 X90.163 Y79.123 E-.05281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.36 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X89.396 Y78.942
G1 Z.96
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.435608
M106 S255
G1 F3000
M204 S6000
G1 X85.763 Y80.874 E.05613
G1 X85.566 Y80.505 E.00571
G1 X89.2 Y78.573 E.05613
M106 S204
; WIPE_START
M73 P76 R0
G1 X87.434 Y79.512 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.36 I-.951 J.759 P1  F42000
G1 X94.816 Y88.766 Z1.36
G1 Z.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S6000
G1 X94.972 Y89.059 E.00468
M106 S204
M106 S255
G1 X95.354 Y89.776 E.01147
M106 S204
M106 S255
G1 X95.202 Y89.857 E.00243
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X91.405 Y91.876 E.06067
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X91.253 Y91.957 E.00243
M106 S204
M106 S255
G1 X90.716 Y90.946 E.01614
M106 S204
M106 S255
G1 X90.868 Y90.865 E.00243
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X94.664 Y88.847 E.06066
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X94.764 Y88.794 E.00158
M106 S204
M204 S250
G1 X94.794 Y88.305 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X94.989 Y88.201 E.0029
G1 X95.341 Y88.862 E.00984
G1 X95.543 Y89.243 E.00566
G1 X95.731 Y89.596 E.00525
G1 X95.919 Y89.949 E.00525
G1 X95.724 Y90.053 E.0029
M106 S255
G1 F600
G1 X95.398 Y90.226 E.00485
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X91.601 Y92.245 E.06067
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X91.275 Y92.418 E.00484
M106 S204
G1 F1200
G1 X91.08 Y92.522 E.0029
G1 X90.892 Y92.169 E.00525
G1 X90.705 Y91.815 E.00525
G1 X90.517 Y91.462 E.00525
G1 X90.338 Y91.127 E.00499
G1 X90.151 Y90.774 E.00525
G1 X90.346 Y90.67 E.0029
G1 F720
G1 X90.672 Y90.497 E.00485
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X94.468 Y88.478 E.06067
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X94.741 Y88.333 E.00406
M106 S204
; WIPE_START
M204 S6000
G1 X94.989 Y88.201 E-.10679
G1 X95.341 Y88.862 E-.28475
G1 X95.543 Y89.243 E-.16367
G1 X95.731 Y89.596 E-.152
G1 X95.796 Y89.719 E-.05281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.36 I-.359 J-1.163 P1  F42000
G1 X91.04 Y91.185 Z1.36
G1 Z.96
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.435608
M106 S255
G1 F3000
M204 S6000
G1 X94.673 Y89.253 E.05613
G1 X94.87 Y89.623 E.00571
G1 X91.236 Y91.555 E.05613
M106 S204
; WIPE_START
G1 X93.002 Y90.616 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.36 I-1.097 J.526 P1  F42000
M73 P77 R0
G1 X98.232 Y101.515 Z1.36
G1 Z.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F1200
M204 S5000
G1 X100.271 Y100.43 E.02699
G1 X100.283 Y100.452 E.00028
G1 X98.291 Y101.511 E.02636
; WIPE_START
G1 F12000
M204 S6000
G1 X100.046 Y100.553 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.36 I-.566 J-1.077 P1  F42000
G1 X97.331 Y101.981 Z1.36
G1 Z.96
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X97.405 Y101.982 E.00087
G1 X97.369 Y102.001 E.00048
; WIPE_START
G1 F12000
M204 S6000
G1 X97.405 Y101.982 E-.38
G1 X97.369 Y102.001 E-.38
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.36 I.751 J-.958 P1  F42000
G1 X94.45 Y99.712 Z1.36
G1 Z.96
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X94.45 Y99.488 E.00262
G1 X94.674 Y99.488 E.00262
G1 X94.674 Y99.712 E.00262
G1 X94.51 Y99.712 E.00192
; CHANGE_LAYER
; Z_HEIGHT: 1.04
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F12000
M204 S6000
G1 X94.45 Y99.488 E-.20881
G1 X94.674 Y99.488 E-.20172
G1 X94.674 Y99.712 E-.20172
G1 X94.51 Y99.712 E-.14776
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/19
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.36 I1.181 J-.292 P1  F42000
G1 X89.183 Y78.171 Z1.36
G1 Z1.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X89.311 Y78.411 E.00384
G1 X89.72 Y79.181 E.0123
G1 X85.619 Y81.361 E.06552
G1 X85.082 Y80.351 E.01614
G1 X89.13 Y78.199 E.06468
M204 S250
G1 X89.356 Y77.605 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X89.68 Y78.215 E.00906
G1 X90.285 Y79.354 E.01694
G1 X85.447 Y81.926 E.07195
G1 X84.517 Y80.178 E.026
G1 X89.303 Y77.634 E.07117
; WIPE_START
M73 P78 R0
G1 F12000
M204 S6000
G1 X89.68 Y78.215 E-.2632
G1 X90.285 Y79.354 E-.4902
G1 X90.27 Y79.362 E-.00661
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.44 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X85.782 Y80.828
G1 Z1.04
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.372938
G1 F1200
M204 S6000
G1 X89.187 Y79.018 E.04471
G1 X89.02 Y78.704 E.00413
G1 X85.615 Y80.514 E.04471
G1 X85.754 Y80.775 E.00343
; WIPE_START
G1 F18000
G1 X85.615 Y80.514 E-.1124
G1 X87.12 Y79.714 E-.6476
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.44 I-.927 J.788 P1  F42000
G1 X94.816 Y88.766 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X95.354 Y89.776 E.01614
G1 X91.253 Y91.957 E.06552
G1 X90.716 Y90.946 E.01614
G1 X94.764 Y88.794 E.06468
M204 S250
G1 X94.989 Y88.201 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X95.246 Y88.684 E.00719
G1 X95.919 Y89.949 E.01881
G1 X91.08 Y92.522 E.07195
G1 X90.151 Y90.774 E.026
G1 X94.936 Y88.229 E.07117
; WIPE_START
M73 P79 R0
G1 F12000
M204 S6000
G1 X95.246 Y88.684 E-.20925
G1 X95.919 Y89.949 E-.54441
G1 X95.904 Y89.957 E-.00635
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.44 I-.292 J-1.181 P1  F42000
G1 X91.249 Y91.109 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.372933
G1 F1200
M204 S6000
G1 X91.416 Y91.423 E.00413
G1 X94.82 Y89.613 E.04471
G1 X94.653 Y89.299 E.00413
G1 X91.302 Y91.081 E.04402
; WIPE_START
G1 F18000
G1 X93.068 Y90.142 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.44 I-1.096 J.529 P1  F42000
G1 X98.492 Y101.377 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F1200
M204 S5000
G1 X100.271 Y100.43 E.02355
G1 X100.283 Y100.452 E.00028
G1 X98.55 Y101.373 E.02292
; WIPE_START
G1 F12000
M204 S6000
G1 X100.271 Y100.43 E-.74551
G1 X100.283 Y100.452 E-.00925
G1 X100.27 Y100.458 E-.00524
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.44 I.155 J-1.207 P1  F42000
G1 X94.45 Y99.712 Z1.44
G1 Z1.04
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X94.45 Y99.488 E.00262
G1 X94.674 Y99.488 E.00262
G1 X94.674 Y99.712 E.00262
G1 X94.51 Y99.712 E.00192
; CHANGE_LAYER
; Z_HEIGHT: 1.12
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F12000
M204 S6000
G1 X94.45 Y99.488 E-.20881
G1 X94.674 Y99.488 E-.20172
G1 X94.674 Y99.712 E-.20172
G1 X94.51 Y99.712 E-.14776
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/19
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.44 I1.181 J-.292 P1  F42000
G1 X89.183 Y78.171 Z1.44
G1 Z1.12
M73 P80 R0
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X89.72 Y79.181 E.01614
G1 X85.619 Y81.361 E.06552
G1 X85.082 Y80.351 E.01614
G1 X89.13 Y78.199 E.06468
M204 S250
G1 X89.356 Y77.605 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X89.567 Y78.003 E.00591
G1 X90.285 Y79.354 E.02009
G1 X85.447 Y81.926 E.07195
G1 X84.517 Y80.178 E.026
G1 X89.303 Y77.634 E.07117
; WIPE_START
G1 F12000
M204 S6000
G1 X89.567 Y78.003 E-.17252
G1 X90.285 Y79.354 E-.5814
G1 X90.271 Y79.361 E-.00608
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.52 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X85.782 Y80.828
G1 Z1.12
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.372938
G1 F1200
M204 S6000
G1 X89.187 Y79.018 E.04471
G1 X89.02 Y78.704 E.00413
G1 X85.615 Y80.514 E.04471
G1 X85.754 Y80.775 E.00343
; WIPE_START
G1 F18000
M73 P81 R0
G1 X85.615 Y80.514 E-.1124
G1 X87.12 Y79.714 E-.6476
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.52 I-.927 J.788 P1  F42000
G1 X94.816 Y88.766 Z1.52
G1 Z1.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X95.354 Y89.776 E.01614
G1 X91.253 Y91.957 E.06552
G1 X90.716 Y90.946 E.01614
G1 X94.763 Y88.794 E.06468
M204 S250
G1 X94.989 Y88.201 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X95.151 Y88.506 E.00454
G1 X95.919 Y89.949 E.02146
G1 X91.08 Y92.522 E.07195
G1 X90.151 Y90.774 E.026
G1 X94.936 Y88.229 E.07117
; WIPE_START
G1 F12000
M204 S6000
G1 X95.151 Y88.506 E-.13322
G1 X95.919 Y89.949 E-.62115
G1 X95.906 Y89.956 E-.00563
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.52 I-.293 J-1.181 P1  F42000
G1 X91.249 Y91.109 Z1.52
G1 Z1.12
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.372928
G1 F1200
M204 S6000
G1 X91.416 Y91.423 E.00413
G1 X94.82 Y89.613 E.04471
G1 X94.653 Y89.299 E.00413
G1 X91.302 Y91.081 E.04402
; WIPE_START
M73 P82 R0
G1 F18000
G1 X93.068 Y90.142 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.52 I-1.204 J.174 P1  F42000
G1 X94.45 Y99.712 Z1.52
G1 Z1.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F1200
M204 S5000
G1 X94.45 Y99.488 E.00262
G1 X94.674 Y99.488 E.00262
G1 X94.674 Y99.712 E.00262
G1 X94.51 Y99.712 E.00192
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F12000
M204 S6000
G1 X94.45 Y99.488 E-.20881
G1 X94.674 Y99.488 E-.20172
G1 X94.674 Y99.712 E-.20172
G1 X94.51 Y99.712 E-.14776
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/19
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.52 I1.181 J-.292 P1  F42000
G1 X89.183 Y78.171 Z1.52
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X89.72 Y79.181 E.01614
G1 X85.619 Y81.361 E.06552
G1 X85.082 Y80.351 E.01614
G1 X89.13 Y78.199 E.06468
M204 S250
G1 X89.356 Y77.605 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X89.454 Y77.791 E.00276
G1 X90.285 Y79.354 E.02324
G1 X85.447 Y81.926 E.07195
G1 X84.517 Y80.178 E.026
G1 X89.303 Y77.634 E.07117
; WIPE_START
G1 F12000
M204 S6000
G1 X89.454 Y77.791 E-.083
M73 P83 R0
G1 X90.285 Y79.354 E-.6726
G1 X90.275 Y79.359 E-.0044
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X85.782 Y80.828
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.372938
G1 F1200
M204 S6000
G1 X89.187 Y79.018 E.04471
G1 X89.02 Y78.704 E.00413
G1 X85.615 Y80.514 E.04471
G1 X85.754 Y80.775 E.00343
; WIPE_START
G1 F18000
G1 X85.615 Y80.514 E-.1124
G1 X87.12 Y79.714 E-.6476
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I-.927 J.788 P1  F42000
G1 X94.816 Y88.766 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X95.354 Y89.776 E.01614
G1 X91.253 Y91.957 E.06552
G1 X90.716 Y90.946 E.01614
G1 X94.764 Y88.794 E.06468
M204 S250
G1 X94.989 Y88.201 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X95.057 Y88.327 E.00188
G1 X95.919 Y89.949 E.02411
G1 X91.08 Y92.522 E.07195
G1 X90.151 Y90.774 E.026
G1 X94.936 Y88.229 E.07117
; WIPE_START
G1 F12000
M204 S6000
M73 P84 R0
G1 X95.057 Y88.327 E-.05909
G1 X95.919 Y89.949 E-.6979
G1 X95.912 Y89.953 E-.00302
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I-.293 J-1.181 P1  F42000
G1 X91.249 Y91.109 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.372933
G1 F1200
M204 S6000
G1 X91.416 Y91.423 E.00413
G1 X94.82 Y89.613 E.04471
G1 X94.653 Y89.299 E.00413
G1 X91.302 Y91.081 E.04402
; WIPE_START
G1 F18000
G1 X93.068 Y90.142 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I-1.204 J.177 P1  F42000
G1 X94.472 Y99.69 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X94.472 Y99.51 E.00236
G1 X94.693 Y99.51 E.0029
M106 S255
G1 F600
G1 X95.062 Y99.51 E.00485
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X95.638 Y99.51 E.00812
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X96.042 Y99.51 E.0053
G1 X95.953 Y99.343 E.00249
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X95.817 Y99.087 E.00409
G1 X98.713 Y97.547 E.04627
G1 X98.849 Y97.803 E.00409
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X98.893 Y97.887 E.00125
M106 S204
M106 S255
G1 X99.079 Y98.235 E.00519
G1 X98.823 Y98.372 E.00381
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X96.439 Y99.639 E.03809
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X96.183 Y99.775 E.00381
G1 X96.138 Y99.69 E.00127
G1 X95.673 Y99.69 E.0061
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X95.062 Y99.69 E.00862
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X94.693 Y99.69 E.00485
M106 S204
G1 F1200
G1 X94.532 Y99.69 E.00211
; WIPE_START
G1 F1270.873
M204 S6000
G1 X94.472 Y99.51 E-.0721
G1 X94.693 Y99.51 E-.08398
G1 X95.062 Y99.51 E-.14022
G1 X95.638 Y99.51 E-.21881
G1 X96.042 Y99.51 E-.15347
G1 X95.953 Y99.343 E-.07205
G1 X95.929 Y99.298 E-.01938
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I-.166 J1.206 P1  F42000
G1 X96.184 Y99.333 Z1.6
M73 P85 R0
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378661
G1 F1200
M204 S6000
G1 X98.551 Y98.074 E.03159
G1 X98.554 Y97.868 E.00243
; CHANGE_LAYER
; Z_HEIGHT: 1.28
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X98.551 Y98.074 E-.07836
G1 X96.968 Y98.916 E-.68164
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/19
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.6 I1.146 J-.409 P1  F42000
G1 X89.356 Y77.605 Z1.6
G1 Z1.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X90.285 Y79.354 E.026
G1 X85.447 Y81.926 E.07195
G1 X84.517 Y80.178 E.026
G1 X89.303 Y77.634 E.07117
; WIPE_START
G1 F12000
M204 S6000
G1 X90.285 Y79.354 E-.75274
G1 X90.268 Y79.363 E-.00726
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X88.903 Y79.838
G1 Z1.28
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X89.809 Y78.931 E.01684
G1 X89.612 Y78.559
G1 X87.686 Y80.485 E.03576
; WIPE_START
G1 F12000
M204 S6000
G1 X89.1 Y79.071 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I-.751 J-.958 P1  F42000
G1 X86.469 Y81.132 Z1.68
G1 Z1.28
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X89.414 Y78.187 E.05468
G1 X88.97 Y78.061
G1 X85.492 Y81.54 E.06458
M73 P86 R0
G1 X85.294 Y81.168
G1 X87.753 Y78.708 E.04567
; WIPE_START
G1 F12000
M204 S6000
G1 X86.339 Y80.123 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I1.178 J.304 P1  F42000
G1 X86.537 Y79.355 Z1.68
G1 Z1.28
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X85.096 Y80.796 E.02675
; WIPE_START
G1 F12000
M204 S6000
G1 X86.511 Y79.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I.588 J1.065 P1  F42000
G1 X87.082 Y79.066 Z1.68
G1 Z1.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0889719
G1 F1200
M204 S6000
G1 X86.922 Y79.184 E.00047
; LINE_WIDTH: 0.135905
G1 X86.762 Y79.302 E.00077
; LINE_WIDTH: 0.182838
G1 X86.602 Y79.421 E.00107
M204 S10000
G1 X85.865 Y79.713 F42000
; LINE_WIDTH: 0.0870362
G1 F1200
M204 S6000
G1 X85.725 Y79.817 E.0004
; LINE_WIDTH: 0.130097
G1 X85.585 Y79.92 E.00064
; LINE_WIDTH: 0.173157
G1 X85.444 Y80.024 E.00089
; LINE_WIDTH: 0.216217
G1 X85.304 Y80.128 E.00113
; LINE_WIDTH: 0.259278
G1 X85.164 Y80.231 E.00138
; LINE_WIDTH: 0.302338
G1 X85.024 Y80.335 E.00162
; LINE_WIDTH: 0.345399
G1 X84.884 Y80.439 E.00187
; WIPE_START
G1 F18000
G1 X85.024 Y80.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I-.57 J1.075 P1  F42000
G1 X86.404 Y81.066 Z1.68
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.182849
G1 F1200
M204 S6000
G1 X86.244 Y81.184 E.00107
; LINE_WIDTH: 0.135912
G1 X86.085 Y81.302 E.00077
; LINE_WIDTH: 0.0889749
G1 X85.925 Y81.421 E.00047
; WIPE_START
G1 F18000
G1 X86.085 Y81.302 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I.607 J1.055 P1  F42000
G1 X87.621 Y80.419 Z1.68
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.182847
G1 F1200
M204 S6000
G1 X87.461 Y80.537 E.00107
; LINE_WIDTH: 0.135911
G1 X87.301 Y80.656 E.00077
; LINE_WIDTH: 0.0889742
G1 X87.141 Y80.774 E.00047
; WIPE_START
G1 F18000
G1 X87.301 Y80.656 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I.607 J1.055 P1  F42000
G1 X88.837 Y79.772 Z1.68
G1 Z1.28
M73 P88 R0
G1 E.8 F1800
; LINE_WIDTH: 0.18284
G1 F1200
M204 S6000
G1 X88.677 Y79.891 E.00107
; LINE_WIDTH: 0.135906
G1 X88.518 Y80.009 E.00077
; LINE_WIDTH: 0.0889727
G1 X88.358 Y80.127 E.00047
; WIPE_START
G1 F18000
G1 X88.518 Y80.009 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I.599 J1.059 P1  F42000
G1 X89.969 Y79.188 Z1.68
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.160302
G1 F1200
M204 S6000
G1 X89.837 Y79.285 E.00076
; LINE_WIDTH: 0.122384
G1 X89.706 Y79.383 E.00056
; LINE_WIDTH: 0.0844652
G1 X89.574 Y79.48 E.00036
; WIPE_START
G1 F18000
G1 X89.706 Y79.383 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I.687 J-1.004 P1  F42000
G1 X88.298 Y78.419 Z1.68
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.0889722
G1 F1200
M204 S6000
G1 X88.138 Y78.537 E.00047
; LINE_WIDTH: 0.135906
G1 X87.979 Y78.656 E.00077
; LINE_WIDTH: 0.182839
G1 X87.819 Y78.774 E.00107
; WIPE_START
G1 F18000
G1 X87.979 Y78.656 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I-.981 J.72 P1  F42000
G1 X94.989 Y88.201 Z1.68
G1 Z1.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X95.919 Y89.949 E.026
G1 X91.08 Y92.522 E.07195
G1 X90.151 Y90.774 E.026
G1 X94.936 Y88.229 E.07117
; WIPE_START
G1 F12000
M204 S6000
G1 X95.919 Y89.949 E-.75276
G1 X95.902 Y89.958 E-.00725
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.347 Y89.345 Z1.68 F42000
G1 Z1.28
G1 E.8 F1800
; FEATURE: Top surface
M73 P89 R0
G1 F1200
M204 S2000
G1 X93.943 Y90.749 E.02607
; WIPE_START
G1 F12000
M204 S6000
G1 X95.347 Y89.345 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I-.75 J-.958 P1  F42000
G1 X92.726 Y91.396 Z1.68
G1 Z1.28
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X95.149 Y88.973 E.04498
G1 X94.951 Y88.601
G1 X91.51 Y92.042 E.0639
G1 X91.029 Y91.954
G1 X94.01 Y88.972 E.05536
; WIPE_START
G1 F12000
M204 S6000
G1 X92.596 Y90.386 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I1.178 J.304 P1  F42000
G1 X92.794 Y89.619 Z1.68
G1 Z1.28
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X90.831 Y91.582 E.03644
G1 X90.634 Y91.21
G1 X91.577 Y90.266 E.01753
; WIPE_START
G1 F12000
M204 S6000
G1 X90.634 Y91.21 E-.5072
G1 X90.831 Y91.582 E-.16007
G1 X91.004 Y91.409 E-.09273
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I.298 J1.18 P1  F42000
G1 X93.877 Y90.683 Z1.68
G1 Z1.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.18284
G1 F1200
M204 S6000
G1 X93.718 Y90.801 E.00107
; LINE_WIDTH: 0.135906
G1 X93.558 Y90.92 E.00077
; LINE_WIDTH: 0.0889727
G1 X93.398 Y91.038 E.00047
M204 S10000
G1 X92.661 Y91.33 F42000
; LINE_WIDTH: 0.182849
G1 F1200
M204 S6000
G1 X92.501 Y91.448 E.00107
; LINE_WIDTH: 0.135912
G1 X92.341 Y91.566 E.00077
; LINE_WIDTH: 0.0889749
G1 X92.182 Y91.685 E.00047
; WIPE_START
G1 F18000
G1 X92.341 Y91.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I.668 J-1.017 P1  F42000
G1 X90.905 Y90.624 Z1.68
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.0866264
G1 F1200
M204 S6000
G1 X90.76 Y90.731 E.00041
; LINE_WIDTH: 0.128867
G1 X90.615 Y90.838 E.00066
; LINE_WIDTH: 0.171108
G1 X90.47 Y90.946 E.00091
; WIPE_START
G1 F18000
G1 X90.615 Y90.838 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I.604 J1.056 P1  F42000
G1 X92.122 Y89.977 Z1.68
G1 Z1.28
M73 P90 R0
G1 E.8 F1800
; LINE_WIDTH: 0.088973
G1 F1200
M204 S6000
G1 X91.962 Y90.095 E.00047
; LINE_WIDTH: 0.135907
G1 X91.803 Y90.213 E.00077
; LINE_WIDTH: 0.182841
G1 X91.643 Y90.331 E.00107
; WIPE_START
G1 F18000
G1 X91.803 Y90.213 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I.607 J1.055 P1  F42000
G1 X93.339 Y89.33 Z1.68
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.088973
G1 F1200
M204 S6000
G1 X93.179 Y89.448 E.00047
; LINE_WIDTH: 0.135907
G1 X93.019 Y89.566 E.00077
; LINE_WIDTH: 0.182841
G1 X92.859 Y89.685 E.00107
; WIPE_START
G1 F18000
G1 X93.019 Y89.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I.607 J1.055 P1  F42000
G1 X94.555 Y88.683 Z1.68
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.0889727
G1 F1200
M204 S6000
G1 X94.395 Y88.801 E.00047
; LINE_WIDTH: 0.135906
G1 X94.236 Y88.92 E.00077
; LINE_WIDTH: 0.18284
G1 X94.076 Y89.038 E.00107
; WIPE_START
G1 F18000
G1 X94.236 Y88.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I-.616 J1.049 P1  F42000
G1 X95.556 Y89.695 Z1.68
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.329932
G1 F1200
M204 S6000
G1 X95.399 Y89.811 E.00199
; LINE_WIDTH: 0.281855
G1 X95.242 Y89.927 E.00168
; LINE_WIDTH: 0.233777
G1 X95.085 Y90.043 E.00138
; LINE_WIDTH: 0.1857
G1 X94.928 Y90.159 E.00107
; LINE_WIDTH: 0.137622
G1 X94.772 Y90.275 E.00077
; LINE_WIDTH: 0.0895447
G1 X94.615 Y90.391 E.00046
; WIPE_START
G1 F18000
G1 X94.772 Y90.275 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.68 I-1.206 J.166 P1  F42000
G1 X96.042 Y99.51 Z1.68
G1 Z1.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X95.817 Y99.087 E.0063
G1 X98.713 Y97.547 E.04307
G1 X98.828 Y97.763 E.00322
G1 X99.079 Y98.235 E.00703
G1 X96.183 Y99.775 E.04307
G1 X96.138 Y99.69 E.00127
G1 X94.472 Y99.69 E.02187
G1 X94.472 Y99.51 E.00236
G1 X95.982 Y99.51 E.01982
M204 S10000
G1 X96.184 Y99.333 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.379363
G1 F1200
M204 S6000
G1 X98.711 Y97.989 E.03379
; CHANGE_LAYER
; Z_HEIGHT: 1.36
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X96.945 Y98.928 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/19
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.68 I-.659 J-1.023 P1  F42000
G1 X96.042 Y99.51 Z1.68
G1 Z1.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X95.817 Y99.087 E.0063
G1 X98.713 Y97.547 E.04307
G1 X98.762 Y97.639 E.00138
G1 X99.079 Y98.235 E.00886
M73 P91 R0
G1 X96.183 Y99.775 E.04307
G1 X96.137 Y99.69 E.00127
G1 X94.472 Y99.69 E.02187
G1 X94.472 Y99.51 E.00236
G1 X95.982 Y99.51 E.01982
; WIPE_START
G1 F12000
M204 S6000
G1 X95.817 Y99.087 E-.17272
G1 X97.181 Y98.361 E-.58728
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.76 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X96.184 Y99.333
G1 Z1.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.379364
G1 F1200
M204 S6000
G1 X98.711 Y97.989 E.03379
; CHANGE_LAYER
; Z_HEIGHT: 1.44
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X96.945 Y98.928 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/19
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.76 I-.659 J-1.023 P1  F42000
G1 X96.042 Y99.51 Z1.76
G1 Z1.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X95.817 Y99.087 E.0063
G1 X98.713 Y97.547 E.04307
G1 X99.079 Y98.235 E.01024
G1 X96.183 Y99.775 E.04307
G1 X96.138 Y99.69 E.00127
G1 X94.472 Y99.69 E.02187
G1 X94.472 Y99.51 E.00236
G1 X95.982 Y99.51 E.01982
; WIPE_START
G1 F12000
M204 S6000
G1 X95.817 Y99.087 E-.17274
G1 X97.181 Y98.361 E-.58726
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.84 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X96.184 Y99.333
G1 Z1.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.37935
G1 F1200
M204 S6000
G1 X98.711 Y97.989 E.03379
; CHANGE_LAYER
; Z_HEIGHT: 1.52
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X96.945 Y98.928 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/19
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.84 I-.659 J-1.023 P1  F42000
G1 X96.042 Y99.51 Z1.84
G1 Z1.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X95.817 Y99.087 E.0063
M73 P92 R0
G1 X98.713 Y97.547 E.04307
G1 X99.079 Y98.235 E.01024
G1 X96.183 Y99.775 E.04307
G1 X96.138 Y99.69 E.00127
G1 X94.472 Y99.69 E.02187
G1 X94.472 Y99.51 E.00236
G1 X95.982 Y99.51 E.01982
; WIPE_START
G1 F12000
M204 S6000
G1 X95.817 Y99.087 E-.17271
G1 X97.181 Y98.361 E-.58729
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.92 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X96.184 Y99.333
G1 Z1.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.379323
G1 F1200
M204 S6000
G1 X98.711 Y97.989 E.03379
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F18000
G1 X96.945 Y98.928 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.92 I1.217 J0 P1  F42000
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z2.02 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

M73 P93 R0
G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
M73 P94 R0
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

    G1 Z101.52 F600
    G1 Z99.52

M400 P100
M17 R ; restore z current

G90
M73 P95 R0
G1 X128 Y250 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END


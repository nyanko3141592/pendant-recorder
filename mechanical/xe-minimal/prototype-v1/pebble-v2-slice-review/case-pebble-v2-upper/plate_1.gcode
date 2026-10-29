; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 5m 59s; total estimated time: 6m 18s
; total layer number: 30
; total filament length [mm] : 374.46
; total filament volume [cm^3] : 900.68
; total filament weight [g] : 1.12
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
M73 P4 R6
G1 X84.65 Y87.465 F42000
M204 S6000
G1 Z.4
G1 Z.2
M73 P5 R6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X84.677 Y87.599 E.00509
G3 X82.057 Y85.69 I-2.205 J.275 E.38479
G1 X82.353 Y85.654 E.01109
G3 X84.579 Y87.168 I.119 J2.219 E.1077
M73 P5 R5
G1 X84.636 Y87.407 E.00915
M204 S6000
G1 X84.207 Y87.566 F42000
G1 F3000
M204 S500
G1 X84.224 Y87.656 E.00339
G3 X82.141 Y86.14 I-1.751 J.218 E.30551
G1 X82.38 Y86.111 E.00894
G3 X84.146 Y87.313 I.093 J1.762 E.08546
G1 X84.193 Y87.508 E.00745
M204 S6000
G1 X83.763 Y87.668 F42000
G1 F3000
M204 S500
G1 X83.77 Y87.712 E.00169
G3 X82.226 Y86.59 I-1.297 J.162 E.22623
G1 X82.407 Y86.569 E.0068
G3 X83.713 Y87.459 I.066 J1.306 E.06322
G1 X83.749 Y87.609 E.00576
M204 S6000
G1 X83.317 Y87.769 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X82.31 Y87.041 I-.843 J.105 E.14695
G1 X82.434 Y87.026 E.00465
G3 X83.308 Y87.71 I.04 J.849 E.04504
; WIPE_START
G1 X83.323 Y87.939 E-.08706
G1 X83.294 Y88.105 E-.06419
G1 X83.165 Y88.371 E-.11233
G1 X83.053 Y88.498 E-.06436
G1 X82.918 Y88.601 E-.06435
G1 X82.766 Y88.674 E-.06435
G1 X82.602 Y88.716 E-.06433
G1 X82.433 Y88.724 E-.06437
G1 X82.265 Y88.699 E-.06436
G1 X82.106 Y88.641 E-.0644
G1 X82.003 Y88.578 E-.04591
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X88.797 Y92.055 Z.6 F42000
G1 X101.329 Y98.467 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X102.216 Y98.467 E.03306
G3 X102.216 Y100.1 I-34.419 J.802 E.06085
G3 X101.76 Y100.516 I-.429 J-.013 E.02564
G1 X78.24 Y100.516 E.87602
G3 X77.785 Y100.101 I-.028 J-.426 E.02561
G1 X77.784 Y79.94 E.75093
G3 X78.24 Y79.484 I.429 J-.027 E.02716
G1 X101.801 Y79.485 E.87757
G3 X102.214 Y79.88 I-.008 J.421 E.02339
G1 X102.215 Y81.533 E.06156
G1 X101.329 Y81.533 E.03301
G1 X101.329 Y98.407 E.62846
M204 S6000
G1 X101.786 Y98.01 F42000
G1 F3000
M204 S500
M73 P6 R5
G1 X102.673 Y98.01 E.03306
G1 X102.673 Y100.086 E.07732
G3 X101.771 Y100.973 I-.881 J.007 E.05259
G1 X78.229 Y100.973 E.87686
G3 X77.328 Y100.114 I-.022 J-.879 E.0515
G1 X77.327 Y79.929 E.75184
G3 X78.229 Y79.027 I.881 J-.021 E.05311
G1 X101.814 Y79.028 E.87847
G3 X102.671 Y79.858 I-.026 J.884 E.04875
G1 X102.673 Y81.99 E.07943
G1 X101.786 Y81.99 E.03303
G1 X101.786 Y97.95 E.59442
M204 S6000
G1 X102.243 Y97.553 F42000
G1 F3000
M204 S500
G1 X103.131 Y97.553 E.03306
G1 X103.13 Y100.091 E.09454
G3 X101.782 Y101.43 I-1.34 J-.001 E.07866
G1 X78.218 Y101.43 E.8777
G3 X76.871 Y100.127 I-.008 J-1.339 E.07731
G1 X76.87 Y79.918 E.75273
G3 X78.218 Y78.57 I1.34 J-.008 E.07898
G1 X101.827 Y78.571 E.87937
G3 X103.128 Y79.835 I-.044 J1.346 E.07411
M73 P7 R5
G1 X103.13 Y82.447 E.09729
G1 X102.243 Y82.447 E.03304
G1 X102.243 Y97.493 E.56038
M204 S6000
G1 X102.7 Y97.096 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X103.588 Y97.096 E.03306
G1 X103.587 Y100.097 E.11177
G3 X101.794 Y101.887 I-1.799 J-.009 E.10474
G1 X78.206 Y101.887 E.87854
G3 X76.414 Y100.14 I.005 J-1.799 E.10311
G1 X76.413 Y79.906 E.75363
G3 X78.206 Y78.113 I1.799 J.006 E.10485
G1 X101.84 Y78.114 E.88027
G3 X103.585 Y79.812 I-.062 J1.809 E.09947
G1 X103.588 Y82.904 E.11516
G1 X102.7 Y82.904 E.03306
G1 X102.7 Y97.036 E.52633
; WIPE_START
G1 X103.588 Y97.096 E-.3381
G1 X103.588 Y98.206 E-.4219
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

G1 X102.031 Y80.103
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50575
M73 P8 R5
G1 F6300
M204 S500
G1 X101.812 Y79.884 E.01169
G1 X101.147 Y79.874 E.02508
G1 X101.826 Y80.552 E.03621
G1 X101.826 Y81.145 E.02234
G1 X101.764 Y81.145 E.00236
G1 X100.492 Y79.874 E.0678
G1 X99.838 Y79.874 E.02469
G1 X101.109 Y81.145 E.06781
G1 X100.94 Y81.145 E.00637
G1 X100.94 Y81.631 E.01832
G1 X99.183 Y79.873 E.09372
G1 X98.529 Y79.873 E.02469
G1 X100.94 Y82.285 E.12863
G1 X100.94 Y82.94 E.02469
G1 X97.874 Y79.873 E.16354
G1 X97.219 Y79.873 E.02469
G1 X100.94 Y83.594 E.19846
G1 X100.94 Y84.249 E.02469
G1 X96.565 Y79.873 E.23337
G1 X95.91 Y79.873 E.02469
G1 X100.94 Y84.903 E.26828
G1 X100.94 Y85.558 E.02469
G1 X95.256 Y79.873 E.30319
G1 X94.601 Y79.873 E.02469
G1 X100.94 Y86.212 E.33811
G1 X100.94 Y86.867 E.02469
G1 X93.947 Y79.873 E.37302
G1 X93.292 Y79.873 E.02469
G1 X100.94 Y87.521 E.40793
G1 X100.94 Y88.176 E.02469
G1 X92.637 Y79.873 E.44285
G1 X91.983 Y79.873 E.02469
G1 X100.94 Y88.831 E.47776
G1 X100.94 Y89.485 E.02469
G1 X91.328 Y79.873 E.51267
G1 X90.674 Y79.873 E.02469
G1 X100.94 Y90.14 E.54758
M73 P9 R5
G1 X100.94 Y90.794 E.02469
G1 X90.019 Y79.873 E.5825
G1 X89.365 Y79.873 E.02469
G1 X100.94 Y91.449 E.61741
G1 X100.94 Y92.103 E.02469
G1 X88.71 Y79.873 E.65232
G1 X88.055 Y79.873 E.02469
G1 X100.94 Y92.758 E.68724
G1 X100.94 Y93.412 E.02469
G1 X87.401 Y79.873 E.72215
G1 X86.746 Y79.873 E.02469
G1 X100.94 Y94.067 E.75706
G1 X100.94 Y94.721 E.02469
G1 X86.092 Y79.873 E.79197
G1 X85.437 Y79.873 E.02469
G1 X100.94 Y95.376 E.82689
G1 X100.94 Y96.03 E.02469
G1 X84.783 Y79.873 E.8618
G1 X84.128 Y79.873 E.02469
G1 X100.94 Y96.685 E.89671
M73 P10 R5
G1 X100.94 Y97.34 E.02469
G1 X83.473 Y79.873 E.93162
G1 X82.819 Y79.873 E.02469
G1 X101.146 Y98.2 E.97751
M204 S6000
G1 X101.596 Y98.649 F42000
G1 F6300
M204 S500
G1 X101.828 Y98.881 E.01237
G1 X101.827 Y99.536 E.02467
G1 X82.164 Y79.873 E1.04876
G1 X81.51 Y79.873 E.02469
G1 X101.76 Y100.123 E1.08011
G1 X101.11 Y100.128 E.02453
G1 X80.855 Y79.873 E1.08033
G1 X80.201 Y79.873 E.02469
G1 X100.456 Y100.128 E1.08034
G1 X99.801 Y100.128 E.02469
G1 X79.546 Y79.873 E1.08034
G1 X78.891 Y79.872 E.02469
G1 X99.147 Y100.128 E1.08034
M73 P11 R5
G1 X98.492 Y100.128 E.02469
G1 X78.24 Y79.875 E1.08018
G2 X78.186 Y79.893 I-.011 J.058 E.00224
G1 X78.172 Y80.463 E.02148
G1 X83.04 Y85.33 E.25962
G1 X83.12 Y85.342 E.00307
G1 X83.609 Y85.52 E.01961
G1 X84.053 Y85.792 E.01963
G1 X84.434 Y86.145 E.01962
G1 X84.738 Y86.568 E.01964
G1 X84.952 Y87.042 E.01962
G1 X85.012 Y87.302 E.01004
G1 X97.837 Y100.128 E.68408
G1 X97.183 Y100.128 E.02469
G1 X85.08 Y88.025 E.64552
G1 X84.988 Y88.587 E.02149
G1 X96.528 Y100.128 E.61553
G1 X95.874 Y100.128 E.02469
G1 X84.801 Y89.055 E.59057
G3 X84.548 Y89.456 I-2.124 J-1.061 E.01792
G1 X95.219 Y100.128 E.56917
G1 X94.565 Y100.128 E.02469
G1 X84.239 Y89.802 E.55076
G1 X83.866 Y90.084 E.01762
G1 X93.91 Y100.128 E.53571
G1 X93.256 Y100.128 E.02469
G1 X83.43 Y90.302 E.52408
M73 P12 R5
G1 X82.919 Y90.446 E.02001
G1 X92.601 Y100.128 E.5164
G1 X91.947 Y100.128 E.02469
G1 X82.052 Y90.233 E.52772
; WIPE_START
G1 X83.467 Y91.648 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X82.527 Y85.472 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X78.173 Y81.117 E.23226
G1 X78.173 Y81.772 E.02469
G1 X81.765 Y85.364 E.19159
G1 X81.296 Y85.55 E.01901
G1 X78.173 Y82.426 E.16659
G1 X78.173 Y83.081 E.02469
G1 X80.896 Y85.804 E.14525
G1 X80.795 Y85.873 E.00461
G1 X80.556 Y86.118 E.01293
G1 X78.173 Y83.735 E.12709
G1 X78.173 Y84.39 E.02469
G1 X80.273 Y86.491 E.11203
G2 X80.054 Y86.926 I.966 J.76 E.0185
G1 X78.173 Y85.045 E.10033
G1 X78.173 Y85.699 E.02469
G1 X79.911 Y87.438 E.09272
G2 X79.878 Y88.059 I1.519 J.393 E.02363
G1 X78.173 Y86.354 E.09096
G1 X78.173 Y87.008 E.02469
G1 X91.292 Y100.128 E.69973
G1 X90.637 Y100.128 E.02469
G1 X78.173 Y87.663 E.66482
G1 X78.173 Y88.318 E.02469
G1 X89.983 Y100.128 E.62991
M73 P13 R5
G1 X89.328 Y100.128 E.02469
G1 X78.173 Y88.972 E.59499
G1 X78.173 Y89.627 E.02469
G1 X88.674 Y100.128 E.56008
G1 X88.019 Y100.128 E.02469
G1 X78.173 Y90.281 E.52517
G1 X78.173 Y90.936 E.02469
G1 X87.365 Y100.128 E.49026
G1 X86.71 Y100.128 E.02469
G1 X78.173 Y91.59 E.45534
G1 X78.173 Y92.245 E.02469
G1 X86.056 Y100.128 E.42043
G1 X85.401 Y100.128 E.02469
G1 X78.173 Y92.9 E.38552
G1 X78.173 Y93.554 E.02469
G1 X84.747 Y100.128 E.3506
G1 X84.092 Y100.128 E.02469
G1 X78.173 Y94.209 E.31569
G1 X78.173 Y94.863 E.02469
G1 X83.438 Y100.128 E.28078
G1 X82.783 Y100.128 E.02469
G1 X78.173 Y95.518 E.24586
G1 X78.173 Y96.172 E.02469
G1 X82.128 Y100.128 E.21095
M73 P14 R5
G1 X81.474 Y100.128 E.02469
G1 X78.173 Y96.827 E.17604
G1 X78.173 Y97.482 E.02469
G1 X80.819 Y100.128 E.14113
G1 X80.165 Y100.128 E.02469
G1 X78.174 Y98.136 E.10621
G1 X78.174 Y98.791 E.02469
G1 X79.51 Y100.128 E.0713
G1 X78.856 Y100.128 E.02469
G1 X77.968 Y99.24 E.04736
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6300
G1 X78.856 Y100.128 E-.47715
G1 X79.51 Y100.128 E-.24873
G1 X79.447 Y100.064 E-.03413
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/30
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S196.35
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.6 I1.161 J.365 P1  F42000
G1 X83.767 Y86.303 Z.6
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X83.862 Y86.38 E.00332
G3 X82.095 Y85.865 I-1.394 J1.494 E.29609
G1 X82.377 Y85.833 E.0077
G3 X83.539 Y86.134 I.091 J2.041 E.03301
G1 X83.719 Y86.267 E.00607
M204 S10000
G1 X83.517 Y86.633 F42000
G1 F10826.06
M204 S6000
G1 X83.58 Y86.684 E.0022
G3 X82.17 Y86.275 I-1.11 J1.19 E.23573
G1 X82.4 Y86.249 E.00626
G3 X83.322 Y86.488 I.07 J1.625 E.02621
G1 X83.469 Y86.597 E.00494
M204 S10000
G1 X83.325 Y87.017 F42000
G1 F10826.06
M204 S6000
G1 X83.456 Y87.169 E.00544
G3 X82.245 Y86.685 I-.984 J.705 E.16884
G1 X82.422 Y86.665 E.00482
G3 X83.282 Y86.975 I.049 J1.21 E.02541
M204 S250
G1 X83.025 Y87.282 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X82.318 Y87.08 I-.552 J.593 E.10873
G1 X82.444 Y87.065 E.00319
G3 X82.98 Y87.243 I.029 J.809 E.01449
; WIPE_START
M204 S6000
G1 X83.133 Y87.402 E-.08385
G1 X83.214 Y87.542 E-.0614
G1 X83.279 Y87.774 E-.09187
G1 X83.283 Y87.936 E-.06123
G1 X83.255 Y88.094 E-.06106
G1 X83.133 Y88.348 E-.10723
G1 X83.026 Y88.469 E-.06123
G1 X82.897 Y88.566 E-.06139
G1 X82.752 Y88.636 E-.06132
G1 X82.596 Y88.676 E-.06123
G1 X82.469 Y88.683 E-.04819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.272 Y92.143 Z.76 F42000
G1 X101.508 Y98.369 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X102.73 Y98.369 E.03312
G3 X102.728 Y100.145 I-36.9 J.85 E.04815
G3 X101.782 Y101.03 I-.93 J-.047 E.03883
G1 X78.218 Y101.03 E.63849
G3 X77.27 Y100.082 I-.014 J-.934 E.04054
G1 X77.27 Y79.918 E.54637
G3 X78.219 Y78.97 I.932 J-.016 E.04057
G1 X101.831 Y78.972 E.63983
G3 X102.73 Y79.919 I-.033 J.931 E.0392
G1 X102.73 Y81.631 E.04641
G1 X101.508 Y81.631 E.03312
G1 X101.508 Y98.309 E.45191
M204 S10000
G1 X101.924 Y97.953 F42000
G1 F10826.06
M204 S6000
G1 X103.146 Y97.953 E.03312
G1 X103.146 Y100.087 E.05781
G3 X101.787 Y101.446 I-1.35 J.009 E.05794
G1 X78.213 Y101.446 E.63878
G3 X76.854 Y100.087 I-.008 J-1.35 E.05794
G1 X76.854 Y79.913 E.54665
G3 X78.213 Y78.554 I1.348 J-.011 E.05798
G1 X101.844 Y78.556 E.64032
G3 X103.146 Y79.913 I-.047 J1.348 E.05639
G1 X103.146 Y82.047 E.05781
G1 X101.924 Y82.047 E.03312
G1 X101.924 Y97.893 E.42938
M204 S10000
G1 X102.339 Y97.537 F42000
G1 F10826.06
M204 S6000
G1 X103.562 Y97.537 E.03312
G1 X103.561 Y100.092 E.06922
G3 X101.792 Y101.861 I-1.767 J.003 E.07534
G1 X78.208 Y101.861 E.63906
G3 X76.439 Y100.092 I-.002 J-1.767 E.07534
G1 X76.439 Y79.908 E.54693
M73 P15 R5
G3 X78.208 Y78.139 I1.763 J-.006 E.07539
G1 X101.857 Y78.141 E.6408
G3 X103.561 Y79.908 I-.061 J1.764 E.07359
G1 X103.562 Y82.463 E.06922
G1 X102.339 Y82.463 E.03312
G1 X102.339 Y97.477 E.40685
M204 S250
G1 X102.74 Y97.137 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9797.545
M204 S5000
G1 X103.269 Y97.137 E.01329
G1 F3888
G1 X103.669 Y97.137 E.01006
G1 F1200
G1 X103.962 Y97.137 E.00739
M106 S255
G1 F600
G1 X103.962 Y99.497 E.05934
G3 X103.869 Y100.727 I-4.216 J.299 E.03113
G3 X101.797 Y102.262 I-2.077 J-.638 E.06939
G1 X78.803 Y102.262 E.57811
G3 X77.572 Y102.169 I-.3 J-4.21 E.03113
G3 X76.038 Y100.097 I.638 J-2.077 E.06939
G1 X76.038 Y80.503 E.49263
G3 X76.131 Y79.273 I4.21 J-.3 E.03113
M73 P16 R5
G3 X78.203 Y77.738 I2.071 J.63 E.06943
G1 X101.869 Y77.74 E.59499
M106 S196.35
M106 S255
G3 X103.962 Y79.903 I-.074 J2.166 E.08365
M106 S196.35
M106 S255
G1 X103.962 Y80.503 E.01508
M106 S196.35
M106 S255
M73 P17 R5
G1 X103.962 Y82.863 E.05934
M106 S196.35
G1 F1200
G1 X103.668 Y82.863 E.00739
G1 F3888
G1 X103.269 Y82.863 E.01006
G1 F9794.802
G1 X102.74 Y82.863 E.01329
G1 F11668.197
G1 X102.74 Y83.263 E.01006
G1 X102.74 Y97.077 E.34729
; WIPE_START
M204 S6000
G1 X103.269 Y97.137 E-.2022
G1 X103.669 Y97.137 E-.152
G1 X103.962 Y97.137 E-.11164
G1 X103.962 Y97.911 E-.29417
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

G1 X101.873 Y100.856
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421616
G1 F11619.5
M204 S6000
G2 X102.322 Y100.366 I-1.505 J-1.829 E.01684
G1 X102.379 Y100.183 E.00483
G1 X102.381 Y99.8 E.00967
G1 X101.492 Y100.689 E.03175
G1 X100.945 Y100.689 E.01383
G1 X102.385 Y99.249 E.05142
G1 X102.388 Y98.709 E.01364
G1 X100.397 Y100.689 E.07089
G1 X99.849 Y100.689 E.01383
G1 X101.829 Y98.709 E.0707
G1 X101.282 Y98.709 E.01383
G1 X99.301 Y100.689 E.0707
G1 X98.754 Y100.689 E.01383
G1 X101.167 Y98.276 E.08618
G1 X101.167 Y97.728 E.01383
G1 X98.206 Y100.689 E.10573
G1 X97.658 Y100.689 E.01383
G1 X101.167 Y97.18 E.12529
G1 X101.167 Y96.633 E.01383
G1 X97.111 Y100.689 E.14485
G1 X96.563 Y100.689 E.01383
G1 X101.167 Y96.085 E.1644
G1 X101.167 Y95.537 E.01383
G1 X96.015 Y100.689 E.18396
G1 X95.468 Y100.689 E.01383
G1 X101.167 Y94.99 E.20351
G1 X101.167 Y94.442 E.01383
G1 X94.92 Y100.689 E.22307
G1 X94.372 Y100.689 E.01383
G1 X101.167 Y93.894 E.24262
G1 X101.167 Y93.347 E.01383
G1 X93.825 Y100.689 E.26218
G1 X93.277 Y100.689 E.01383
G1 X101.167 Y92.799 E.28173
G1 X101.167 Y92.251 E.01383
G1 X92.729 Y100.689 E.30129
G1 X92.181 Y100.689 E.01383
G1 X101.167 Y91.703 E.32084
G1 X101.167 Y91.156 E.01383
G1 X91.634 Y100.689 E.3404
G1 X91.086 Y100.689 E.01383
G1 X101.167 Y90.608 E.35995
G1 X101.167 Y90.06 E.01383
G1 X90.538 Y100.689 E.37951
G1 X89.991 Y100.689 E.01383
M73 P18 R5
G1 X101.167 Y89.513 E.39906
G1 X101.167 Y88.965 E.01383
G1 X89.443 Y100.689 E.41862
G1 X88.895 Y100.689 E.01383
G1 X101.167 Y88.417 E.43817
G1 X101.167 Y87.87 E.01383
G1 X88.348 Y100.689 E.45773
G1 X87.8 Y100.689 E.01383
G1 X101.167 Y87.322 E.47728
G1 X101.167 Y86.774 E.01383
G1 X87.252 Y100.689 E.49684
G1 X86.704 Y100.689 E.01383
G1 X101.167 Y86.226 E.51639
G1 X101.167 Y85.679 E.01383
G1 X86.157 Y100.689 E.53595
G1 X85.609 Y100.689 E.01383
G1 X101.167 Y85.131 E.5555
G1 X101.167 Y84.583 E.01383
G1 X85.061 Y100.689 E.57506
G1 X84.514 Y100.689 E.01383
G1 X101.167 Y84.036 E.59461
G1 X101.167 Y83.488 E.01383
G1 X83.966 Y100.689 E.61417
G1 X83.418 Y100.689 E.01383
G1 X101.167 Y82.94 E.63372
G1 X101.167 Y82.393 E.01383
G1 X82.871 Y100.689 E.65328
G1 X82.323 Y100.689 E.01383
G1 X101.341 Y81.671 E.67903
M204 S10000
G1 X101.548 Y81.464 F42000
G1 F11619.5
M204 S6000
G1 X102.389 Y80.624 E.03001
G1 X102.389 Y81.171 E.01381
G1 X102.096 Y81.464 E.01048
M204 S10000
G1 X78.127 Y79.144 F42000
G1 F11619.5
M204 S6000
G1 X77.803 Y79.467 E.01156
G2 X77.668 Y79.653 I.375 J.414 E.00584
G2 X77.611 Y80.208 I1.201 J.405 E.01419
G1 X78.508 Y79.311 E.03204
G1 X79.055 Y79.311 E.01383
G1 X77.611 Y80.756 E.05159
G1 X77.611 Y81.303 E.01383
G1 X79.603 Y79.311 E.07114
G1 X80.151 Y79.311 E.01383
G1 X77.611 Y81.851 E.0907
G1 X77.611 Y82.399 E.01383
G1 X80.698 Y79.311 E.11025
G1 X81.246 Y79.311 E.01383
G1 X77.611 Y82.946 E.1298
G1 X77.611 Y83.494 E.01383
G1 X81.794 Y79.311 E.14936
G1 X82.341 Y79.311 E.01383
G1 X77.611 Y84.042 E.16891
G1 X77.611 Y84.589 E.01383
G1 X82.889 Y79.311 E.18846
G1 X83.437 Y79.311 E.01383
G1 X77.611 Y85.137 E.20802
G1 X77.611 Y85.685 E.01383
G1 X83.984 Y79.311 E.22757
G1 X84.532 Y79.311 E.01383
G1 X77.611 Y86.232 E.24713
G1 X77.611 Y86.78 E.01383
G1 X85.08 Y79.311 E.26668
G1 X85.627 Y79.311 E.01383
G1 X77.611 Y87.328 E.28623
G1 X77.611 Y87.876 E.01383
G1 X86.175 Y79.311 E.30579
G1 X86.723 Y79.311 E.01383
G1 X77.611 Y88.423 E.32534
M73 P19 R5
G1 X77.611 Y88.971 E.01383
G1 X87.27 Y79.311 E.34489
G1 X87.818 Y79.311 E.01383
G1 X77.437 Y89.692 E.37064
M204 S10000
G1 X77.437 Y95.717 F42000
G1 F11619.5
M204 S6000
G1 X82.95 Y90.204 E.19683
G1 X82.831 Y90.234 E.0031
G1 X82.349 Y90.257 E.01217
G1 X77.611 Y94.996 E.16919
G1 X77.611 Y94.448 E.01383
G1 X81.875 Y90.183 E.15227
G1 X81.474 Y90.037 E.01079
G1 X77.611 Y93.9 E.13793
G1 X77.611 Y93.353 E.01383
G1 X81.128 Y89.835 E.12561
G3 X80.829 Y89.586 I.464 J-.865 E.00989
G1 X77.611 Y92.805 E.11491
G1 X77.611 Y92.257 E.01383
G1 X80.572 Y89.295 E.10574
G3 X80.36 Y88.96 I.723 J-.693 E.01009
G1 X77.611 Y91.709 E.09816
G1 X77.611 Y91.162 E.01383
G1 X80.199 Y88.573 E.09242
G1 X80.106 Y88.118 E.01172
G1 X77.611 Y90.614 E.0891
G1 X77.611 Y90.066 E.01383
G1 X80.334 Y87.343 E.09725
; WIPE_START
G1 X78.92 Y88.757 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.946 Y85.731 Z.76 F42000
G1 Z.36
G1 E.8 F1800
G1 F11619.5
M204 S6000
G1 X88.366 Y79.311 E.22921
G1 X88.913 Y79.311 E.01383
G1 X82.715 Y85.51 E.22132
G1 X83.064 Y85.563 E.00892
G1 X83.171 Y85.602 E.00287
G1 X89.461 Y79.311 E.22459
G1 X90.008 Y79.311 E.01383
G1 X83.563 Y85.757 E.23014
G1 X83.903 Y85.965 E.01006
G1 X90.556 Y79.312 E.23756
G1 X91.104 Y79.312 E.01383
G1 X84.189 Y86.226 E.24689
G3 X84.433 Y86.531 I-.631 J.755 E.0099
G1 X91.651 Y79.312 E.25775
G1 X92.199 Y79.312 E.01383
G1 X84.631 Y86.88 E.27022
G3 X84.775 Y87.283 I-.925 J.559 E.01089
G1 X92.747 Y79.312 E.28462
G1 X93.294 Y79.312 E.01383
G1 X84.847 Y87.759 E.30161
G3 X84.802 Y88.352 I-1.494 J.184 E.01511
G1 X93.842 Y79.312 E.32277
G1 X94.39 Y79.312 E.01383
G1 X77.611 Y96.091 E.59909
G1 X77.611 Y96.639 E.01383
G1 X94.937 Y79.312 E.61864
G1 X95.485 Y79.312 E.01383
G1 X77.611 Y97.186 E.6382
G1 X77.611 Y97.734 E.01383
G1 X96.033 Y79.312 E.65775
G1 X96.58 Y79.312 E.01383
G1 X77.611 Y98.282 E.6773
G1 X77.611 Y98.829 E.01383
G1 X97.128 Y79.312 E.69686
G1 X97.676 Y79.312 E.01383
G1 X77.611 Y99.377 E.71641
G1 X77.611 Y99.925 E.01383
G1 X98.223 Y79.312 E.73596
G1 X98.771 Y79.312 E.01383
G1 X77.691 Y100.392 E.75263
M73 P20 R5
G2 X77.985 Y100.646 I.532 J-.319 E.00997
G1 X99.319 Y79.312 E.76169
G1 X99.866 Y79.312 E.01383
G1 X78.489 Y100.689 E.76326
G1 X79.037 Y100.689 E.01383
G1 X100.414 Y79.312 E.76326
G1 X100.962 Y79.312 E.01383
G1 X79.584 Y100.689 E.76326
G1 X80.132 Y100.689 E.01383
G1 X101.509 Y79.312 E.76325
G3 X102.015 Y79.354 I.159 J1.155 E.01292
G1 X80.68 Y100.689 E.76176
G1 X81.227 Y100.689 E.01383
G1 X102.306 Y79.611 E.75258
G3 X102.388 Y80.077 I-.784 J.379 E.01208
G1 X81.602 Y100.863 E.74217
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11619.5
G1 X83.016 Y99.449 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/30
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M106 S198.9
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.76 I1.217 J-.031 P1  F42000
G1 X82.668 Y85.843 Z.76
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X82.753 Y85.849 E.00231
G3 X82.099 Y85.864 I-.278 J2.024 E.33008
G3 X82.427 Y85.829 I.373 J1.89 E.00897
G1 X82.608 Y85.84 E.00491
M204 S10000
G1 X82.79 Y86.285 F42000
G1 F10826.06
M204 S6000
G1 X83.033 Y86.341 E.00676
G3 X82.173 Y86.275 I-.552 J1.531 E.25341
G1 X82.437 Y86.246 E.0072
G3 X82.699 Y86.26 I.044 J1.627 E.00711
G1 X82.732 Y86.269 E.00095
M204 S10000
G1 X82.689 Y86.686 F42000
G1 F10826.06
M204 S6000
G1 X82.89 Y86.735 E.00559
G3 X82.247 Y86.685 I-.412 J1.137 E.18814
G1 X82.447 Y86.663 E.00545
G3 X82.631 Y86.672 I.031 J1.209 E.00501
M204 S250
G1 X82.592 Y87.073 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X82.319 Y87.08 I-.117 J.8 E.12079
G1 X82.457 Y87.065 E.00349
G3 X82.532 Y87.066 I.019 J.808 E.0019
; WIPE_START
M204 S6000
G1 X82.752 Y87.114 E-.08546
G1 X82.898 Y87.184 E-.06133
G1 X83.026 Y87.281 E-.06129
G1 X83.133 Y87.402 E-.06133
G1 X83.214 Y87.542 E-.06137
G1 X83.265 Y87.695 E-.06126
G1 X83.285 Y87.855 E-.06131
G1 X83.273 Y88.016 E-.06129
G1 X83.229 Y88.171 E-.06131
G1 X83.156 Y88.315 E-.06133
G1 X83.055 Y88.441 E-.06133
G1 X82.932 Y88.544 E-.06124
G1 X82.931 Y88.545 E-.00015
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.671 Y92.125 Z.92 F42000
G1 X101.508 Y98.414 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X102.919 Y98.414 E.03824
G3 X102.918 Y100.155 I-34.72 J.838 E.04718
G3 X101.781 Y101.219 I-1.119 J-.056 E.04664
G1 X78.219 Y101.219 E.63847
G3 X77.081 Y100.081 I-.014 J-1.124 E.04862
G1 X77.081 Y79.919 E.54634
G3 X78.219 Y78.781 I1.124 J-.014 E.04861
G1 X101.783 Y78.781 E.63853
G3 X102.919 Y79.919 I.012 J1.124 E.04855
G1 X102.919 Y81.586 E.04518
G1 X101.508 Y81.586 E.03824
G1 X101.508 Y98.354 E.45436
M204 S10000
G1 X101.924 Y97.998 F42000
G1 F10826.06
M204 S6000
G1 X103.335 Y97.998 E.03824
G1 X103.335 Y100.087 E.05659
G3 X101.786 Y101.635 I-1.54 J.008 E.066
G1 X78.213 Y101.635 E.63876
G3 X76.665 Y100.087 I-.008 J-1.54 E.066
G1 X76.665 Y79.913 E.54663
M73 P20 R4
G3 X78.213 Y78.365 I1.54 J-.008 E.066
G1 X101.788 Y78.365 E.63881
M73 P21 R4
G3 X103.335 Y79.913 I.006 J1.54 E.06595
G1 X103.335 Y82.002 E.05659
G1 X101.924 Y82.002 E.03824
G1 X101.924 Y97.938 E.43184
M204 S10000
G1 X102.339 Y97.583 F42000
G1 F10826.06
M204 S6000
G1 X103.75 Y97.583 E.03823
G1 X103.751 Y100.092 E.06799
G3 X101.792 Y102.051 I-1.957 J.002 E.08339
G1 X78.208 Y102.051 E.63905
G3 X76.249 Y100.092 I-.002 J-1.957 E.08339
G1 X76.249 Y79.908 E.54692
G3 X78.208 Y77.949 I1.957 J-.002 E.08339
G1 X101.794 Y77.949 E.6391
G3 X103.751 Y79.908 I0 J1.957 E.08335
G1 X103.75 Y82.417 E.06799
G1 X102.339 Y82.417 E.03823
G1 X102.339 Y97.523 E.40931
M204 S250
G1 X102.74 Y97.182 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X103.203 Y97.182 E.01165
G1 F9704.251
G1 X103.603 Y97.182 E.01006
G1 F5012.264
G1 X104.003 Y97.182 E.01006
G1 F1856.277
G1 X104.151 Y97.182 E.00371
G1 F1080
G1 X104.151 Y99.497 E.05821
G3 X104.081 Y100.671 I-4.809 J.3 E.02964
G3 X101.797 Y102.451 I-2.283 J-.574 E.0784
G1 X78.803 Y102.451 E.57811
G3 X77.517 Y102.35 I-.3 J-4.397 E.03253
G3 X75.849 Y100.097 I.694 J-2.259 E.07545
G1 X75.849 Y80.503 E.49263
G3 X75.95 Y79.217 I4.397 J-.3 E.03253
G3 X78.203 Y77.549 I2.259 J.694 E.07545
M73 P22 R4
G1 X101.799 Y77.549 E.59324
G3 X104.151 Y79.903 I-.006 J2.358 E.09288
G1 X104.151 Y82.818 E.07329
G1 F1856.277
G1 X104.003 Y82.818 E.00371
G1 F5012.264
G1 X103.603 Y82.818 E.01006
G1 F9704.251
G1 X103.203 Y82.818 E.01006
G1 F11668.197
G1 X102.74 Y82.818 E.01165
G1 X102.74 Y97.122 E.35962
; WIPE_START
M204 S6000
G1 X103.203 Y97.182 E-.17759
G1 X103.603 Y97.182 E-.152
G1 X104.003 Y97.182 E-.152
G1 X104.151 Y97.182 E-.05606
G1 X104.151 Y97.767 E-.22235
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

G1 X102.745 Y99.46
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421506
G1 F11622.802
M204 S6000
G1 X101.866 Y98.581 E.03136
M204 S10000
G1 X98.315 Y101.052 F42000
G1 F11622.802
M204 S6000
G1 X84.829 Y87.567 E.48136
G3 X84.837 Y88.122 I-1.371 J.298 E.01412
G1 X97.594 Y100.879 E.45533
G1 X97.046 Y100.879 E.01382
G1 X84.744 Y88.577 E.43912
G3 X84.584 Y88.965 I-1.039 J-.2 E.01066
G1 X96.499 Y100.879 E.42527
G1 X95.951 Y100.879 E.01382
G1 X84.374 Y89.302 E.41324
G1 X84.183 Y89.541 E.00773
G1 X84.119 Y89.595 E.0021
G1 X95.404 Y100.879 E.40278
G1 X94.856 Y100.879 E.01382
G1 X83.822 Y89.844 E.39387
G1 X83.468 Y90.038 E.01018
G1 X94.308 Y100.879 E.38696
G1 X93.761 Y100.879 E.01382
G1 X83.061 Y90.179 E.38193
G1 X82.947 Y90.214 E.003
M73 P23 R4
G1 X82.585 Y90.25 E.0092
G1 X93.213 Y100.879 E.37938
G1 X92.666 Y100.879 E.01382
G1 X81.738 Y89.95 E.39008
; WIPE_START
G1 X83.152 Y91.365 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.402 Y88.615 Z.92 F42000
G1 Z.52
G1 E.8 F1800
G1 F11622.802
M204 S6000
G1 X77.421 Y85.634 E.1064
G1 X77.421 Y85.087 E.01382
G1 X80.102 Y87.768 E.0957
G3 X80.173 Y87.291 I1.214 J-.064 E.01225
G1 X77.421 Y84.539 E.09822
G1 X77.421 Y83.992 E.01382
G1 X80.315 Y86.885 E.10328
G1 X80.509 Y86.532 E.01017
G1 X77.421 Y83.444 E.11022
G1 X77.421 Y82.896 E.01382
G1 X80.752 Y86.227 E.1189
G1 X81.047 Y85.974 E.0098
G1 X77.421 Y82.349 E.12941
G1 X77.421 Y81.801 E.01382
G1 X81.385 Y85.765 E.14148
G3 X81.775 Y85.607 I.579 J.868 E.01068
G1 X77.421 Y81.254 E.15539
G1 X77.421 Y80.706 E.01382
G1 X82.223 Y85.508 E.1714
G3 X82.771 Y85.509 I.273 J1.59 E.01389
G1 X77.421 Y80.159 E.19096
G3 X77.466 Y79.656 I1.514 J-.118 E.01279
G1 X98.689 Y100.879 E.75752
G1 X99.236 Y100.879 E.01382
G1 X77.681 Y79.323 E.76942
G3 X78.047 Y79.142 I.543 J.636 E.01042
G1 X99.784 Y100.879 E.77589
G1 X100.331 Y100.879 E.01382
G1 X78.574 Y79.121 E.77662
G1 X79.121 Y79.121 E.01382
G1 X100.879 Y100.879 E.77662
G1 X101.427 Y100.879 E.01382
G1 X79.669 Y79.121 E.77662
G1 X80.216 Y79.121 E.01382
G1 X101.954 Y100.858 E.77589
G2 X102.32 Y100.677 I-.177 J-.817 E.01042
G1 X80.764 Y79.121 E.76941
G1 X81.312 Y79.121 E.01382
G1 X102.535 Y100.345 E.75757
G1 X102.566 Y100.221 E.00323
G1 X102.569 Y99.831 E.00984
G1 X81.859 Y79.121 E.73922
G1 X82.407 Y79.121 E.01382
G1 X101.167 Y97.882 E.66965
G1 X101.167 Y97.335 E.01382
G1 X82.954 Y79.121 E.65011
G1 X83.502 Y79.121 E.01382
G1 X101.167 Y96.787 E.63056
G1 X101.167 Y96.239 E.01382
G1 X84.049 Y79.121 E.61102
M73 P24 R4
G1 X84.597 Y79.121 E.01382
G1 X101.167 Y95.692 E.59148
G1 X101.167 Y95.144 E.01382
G1 X85.144 Y79.121 E.57193
G1 X85.692 Y79.121 E.01382
G1 X101.167 Y94.597 E.55239
G1 X101.167 Y94.049 E.01382
G1 X86.239 Y79.121 E.53284
G1 X86.787 Y79.121 E.01382
G1 X101.167 Y93.502 E.5133
G1 X101.167 Y92.954 E.01382
G1 X87.335 Y79.121 E.49375
G1 X87.882 Y79.121 E.01382
G1 X101.167 Y92.407 E.47421
G1 X101.167 Y91.859 E.01382
G1 X88.43 Y79.121 E.45467
G1 X88.977 Y79.121 E.01382
G1 X101.167 Y91.312 E.43512
G1 X101.167 Y90.764 E.01382
G1 X89.525 Y79.121 E.41558
G1 X90.072 Y79.121 E.01382
G1 X101.167 Y90.216 E.39603
G1 X101.167 Y89.669 E.01382
G1 X90.62 Y79.121 E.37649
G1 X91.167 Y79.121 E.01382
G1 X101.167 Y89.121 E.35695
G1 X101.167 Y88.574 E.01382
G1 X91.715 Y79.121 E.3374
G1 X92.262 Y79.121 E.01382
G1 X101.167 Y88.026 E.31786
G1 X101.167 Y87.479 E.01382
G1 X92.81 Y79.121 E.29831
G1 X93.358 Y79.121 E.01382
G1 X101.167 Y86.931 E.27877
G1 X101.167 Y86.384 E.01382
G1 X93.905 Y79.121 E.25923
G1 X94.453 Y79.121 E.01382
G1 X101.167 Y85.836 E.23968
G1 X101.167 Y85.289 E.01382
G1 X95 Y79.121 E.22014
G1 X95.548 Y79.121 E.01382
G1 X101.167 Y84.741 E.20059
G1 X101.167 Y84.194 E.01382
G1 X96.095 Y79.121 E.18105
G1 X96.643 Y79.121 E.01382
G1 X101.167 Y83.646 E.16151
G1 X101.167 Y83.098 E.01382
G1 X97.19 Y79.121 E.14196
G1 X97.738 Y79.121 E.01382
G1 X101.167 Y82.551 E.12242
G1 X101.167 Y82.003 E.01382
G1 X98.285 Y79.121 E.10287
G1 X98.833 Y79.121 E.01382
G1 X101.167 Y81.456 E.08333
G1 X101.167 Y81.246 E.00531
G1 X101.505 Y81.245 E.00851
G1 X99.381 Y79.121 E.07582
G1 X99.928 Y79.121 E.01382
G1 X102.052 Y81.245 E.07582
G1 X102.578 Y81.245 E.01328
G1 X102.578 Y81.224 E.00054
G1 X100.476 Y79.121 E.07505
G1 X101.023 Y79.121 E.01382
G1 X102.578 Y80.676 E.05549
G1 X102.577 Y80.128 E.01383
G1 X101.571 Y79.121 E.03593
G3 X102.321 Y79.324 I.143 J.961 E.02019
G1 X102.732 Y79.735 E.01468
; WIPE_START
G1 X102.321 Y79.324 E-.22099
G1 X102.199 Y79.234 E-.0578
G1 X102.062 Y79.169 E-.05774
G1 X101.911 Y79.131 E-.05905
G1 X101.571 Y79.121 E-.12934
G1 X102.008 Y79.559 E-.23508
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.864 Y86.514 Z.92 F42000
G1 X92.292 Y101.052 Z.92
G1 Z.52
G1 E.8 F1800
M73 P25 R4
G1 F11622.802
M204 S6000
G1 X77.421 Y86.182 E.5308
G1 X77.421 Y86.729 E.01382
G1 X91.571 Y100.879 E.50506
G1 X91.023 Y100.879 E.01382
G1 X77.421 Y87.277 E.48551
G1 X77.421 Y87.824 E.01382
G1 X90.476 Y100.879 E.46597
G1 X89.928 Y100.879 E.01382
G1 X77.421 Y88.372 E.44642
G1 X77.421 Y88.919 E.01382
G1 X89.381 Y100.879 E.42688
G1 X88.833 Y100.879 E.01382
G1 X77.421 Y89.467 E.40734
G1 X77.421 Y90.014 E.01382
G1 X88.286 Y100.879 E.38779
G1 X87.738 Y100.879 E.01382
G1 X77.421 Y90.562 E.36825
G1 X77.421 Y91.11 E.01382
G1 X87.19 Y100.879 E.3487
G1 X86.643 Y100.879 E.01382
G1 X77.421 Y91.657 E.32916
G1 X77.421 Y92.205 E.01382
G1 X86.095 Y100.879 E.30962
G1 X85.548 Y100.879 E.01382
G1 X77.421 Y92.752 E.29007
G1 X77.421 Y93.3 E.01382
G1 X85 Y100.879 E.27053
G1 X84.453 Y100.879 E.01382
G1 X77.421 Y93.847 E.25098
G1 X77.421 Y94.395 E.01382
G1 X83.905 Y100.879 E.23144
G1 X83.358 Y100.879 E.01382
G1 X77.421 Y94.942 E.2119
G1 X77.421 Y95.49 E.01382
G1 X82.81 Y100.879 E.19235
G1 X82.263 Y100.879 E.01382
G1 X77.421 Y96.037 E.17281
G1 X77.421 Y96.585 E.01382
G1 X81.715 Y100.879 E.15326
G1 X81.168 Y100.879 E.01382
G1 X77.421 Y97.132 E.13372
G1 X77.421 Y97.68 E.01382
G1 X80.62 Y100.879 E.11418
G1 X80.072 Y100.879 E.01382
G1 X77.421 Y98.228 E.09463
G1 X77.421 Y98.775 E.01382
G1 X79.525 Y100.879 E.07509
G1 X78.977 Y100.879 E.01382
G1 X77.421 Y99.323 E.05554
G1 X77.421 Y99.87 E.01382
G1 X78.603 Y101.052 E.0422
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11622.802
G1 X77.421 Y99.87 E-.63529
G1 X77.421 Y99.542 E-.12472
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/30
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.92 I1.172 J.326 P1  F42000
G1 X81.076 Y86.397 Z.92
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X81.164 Y86.313 E.00332
G3 X82.269 Y85.842 I1.318 J1.561 E.03303
G1 X82.478 Y85.831 E.00566
G3 X80.881 Y86.604 I.004 J2.043 E.29805
G1 X81.035 Y86.441 E.00606
M204 S10000
G1 X81.372 Y86.686 F42000
G1 F10826.06
M204 S6000
G1 X81.431 Y86.63 E.0022
G3 X82.311 Y86.256 I1.049 J1.243 E.02632
G1 X82.475 Y86.247 E.00444
G3 X81.205 Y86.862 I.005 J1.627 E.23741
G1 X81.331 Y86.73 E.00494
M204 S10000
G1 X81.668 Y86.976 F42000
G1 F10826.06
M204 S6000
G1 X81.697 Y86.948 E.00108
G3 X82.353 Y86.67 I.78 J.926 E.0196
G1 X82.472 Y86.663 E.00321
G3 X81.529 Y87.121 I.005 J1.211 E.17677
G1 X81.627 Y87.019 E.00382
M204 S250
G1 X81.954 Y87.254 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X82.394 Y87.069 I.52 J.62 E.01218
G1 X82.469 Y87.065 E.00189
G3 X81.91 Y87.294 I.006 J.81 E.11233
; WIPE_START
M204 S6000
G1 X82.087 Y87.163 E-.08391
G1 X82.236 Y87.101 E-.06134
G1 X82.394 Y87.069 E-.06119
G1 X82.469 Y87.065 E-.02853
G1 X82.593 Y87.073 E-.04706
G1 X82.752 Y87.114 E-.06257
G1 X82.897 Y87.184 E-.06123
G1 X83.026 Y87.281 E-.06137
G1 X83.133 Y87.402 E-.06133
G1 X83.213 Y87.542 E-.06125
G1 X83.265 Y87.695 E-.06141
G1 X83.285 Y87.855 E-.06128
G1 X83.269 Y87.979 E-.04752
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.891 Y91.776 Z1.08 F42000
G1 X101.508 Y98.437 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X103.058 Y98.438 E.04199
G3 X103.056 Y100.162 I-35.006 J.822 E.04672
G3 X101.781 Y101.358 I-1.258 J-.063 E.05235
G1 X78.219 Y101.358 E.63848
G3 X76.942 Y100.081 I-.014 J-1.263 E.05449
G1 X76.942 Y79.918 E.54636
M73 P26 R4
G3 X78.219 Y78.642 I1.263 J-.013 E.05449
G1 X101.851 Y78.644 E.64035
G3 X103.058 Y79.918 I-.052 J1.258 E.05264
G1 X103.058 Y81.563 E.04455
G1 X101.508 Y81.563 E.04199
G1 X101.508 Y82.583 E.02764
G1 X98.883 Y82.583 E.07114
G1 X98.883 Y97.417 E.40198
G1 X101.508 Y97.417 E.07114
G1 X101.508 Y98.377 E.02601
M204 S10000
G1 X101.924 Y98.022 F42000
G1 F10826.06
M204 S6000
G1 X103.473 Y98.022 E.04199
G1 X103.473 Y100.087 E.05595
G3 X101.787 Y101.773 I-1.679 J.008 E.07189
G1 X78.213 Y101.773 E.63877
G3 X76.527 Y100.087 I-.008 J-1.679 E.07189
G1 X76.527 Y79.913 E.54664
G3 X78.213 Y78.227 I1.679 J-.007 E.07188
G1 X101.87 Y78.229 E.64103
G3 X103.473 Y79.913 I-.071 J1.673 E.06966
G1 X103.474 Y81.978 E.05595
G1 X101.924 Y81.978 E.04199
G1 X101.924 Y82.998 E.02764
G1 X99.298 Y82.998 E.07114
G1 X99.298 Y97.002 E.37945
G1 X101.924 Y97.002 E.07114
G1 X101.924 Y97.962 E.02601
M204 S10000
G1 X102.339 Y97.606 F42000
G1 F10826.06
M204 S6000
G1 X103.889 Y97.606 E.04199
G1 X103.889 Y100.092 E.06735
G3 X101.792 Y102.189 I-2.096 J.002 E.08928
G1 X78.208 Y102.189 E.63905
G3 X76.111 Y100.092 I-.002 J-2.096 E.08928
G1 X76.111 Y79.908 E.54692
G3 X78.208 Y77.811 I2.096 J-.001 E.08928
G1 X101.89 Y77.813 E.6417
G3 X103.889 Y79.908 I-.091 J2.088 E.08669
G1 X103.889 Y82.394 E.06735
G1 X102.339 Y82.394 E.04199
G1 X102.339 Y83.414 E.02764
G1 X99.714 Y83.414 E.07114
G1 X99.714 Y96.586 E.35692
G1 X102.339 Y96.586 E.07114
G1 X102.339 Y97.546 E.02602
M204 S250
G1 X102.74 Y97.205 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X102.992 Y97.206 E.00634
G1 X103.392 Y97.206 E.01006
G1 F10947.125
G1 X103.792 Y97.206 E.01006
G1 F5916.024
G1 X104.192 Y97.206 E.01006
G1 F2420.924
G1 X104.29 Y97.206 E.00246
G1 F1800
G1 X104.29 Y99.497 E.05761
G3 X104.218 Y100.691 I-4.99 J.3 E.03015
G3 X101.797 Y102.59 I-2.42 J-.594 E.08336
G1 X78.803 Y102.59 E.57811
G3 X77.595 Y102.515 I-.3 J-4.952 E.03051
G3 X75.71 Y100.097 I.608 J-2.417 E.08301
G1 X75.71 Y80.503 E.49263
G3 X75.785 Y79.295 I4.953 J-.3 E.0305
G3 X78.203 Y77.41 I2.417 J.608 E.08302
M73 P27 R4
G1 X101.197 Y77.41 E.57811
G3 X101.908 Y77.413 I.3 J14.51 E.01788
G3 X104.29 Y79.903 I-.11 J2.489 E.09566
G1 X104.29 Y82.794 E.07269
G1 F2420.992
G1 X104.192 Y82.794 E.00246
G1 F5916.131
G1 X103.792 Y82.794 E.01006
G1 F10947.27
G1 X103.392 Y82.794 E.01006
G1 F11668.197
G1 X102.992 Y82.794 E.01006
G1 X102.74 Y82.795 E.00634
G1 X102.74 Y97.145 E.3608
; WIPE_START
M204 S6000
G1 X102.992 Y97.206 E-.09844
G1 X103.392 Y97.206 E-.152
G1 X103.792 Y97.206 E-.152
G1 X104.192 Y97.206 E-.152
G1 X104.29 Y97.206 E-.03717
G1 X104.29 Y97.649 E-.1684
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

G1 X101.912 Y96.359
G1 Z.68
G1 E.8 F1800
; FEATURE: Top surface
G1 F11668.197
M204 S2000
G1 X102.528 Y95.743 E.02189
G1 X102.528 Y95.198
G1 X101.367 Y96.359 E.04128
G1 X100.821 Y96.359
G1 X102.528 Y94.652 E.06067
G1 X102.528 Y94.107
G1 X100.276 Y96.359 E.08007
G1 X99.941 Y96.148
G1 X102.528 Y93.561 E.09197
G1 X102.528 Y93.016
G1 X99.941 Y95.603 E.09197
G1 X99.941 Y95.057
G1 X102.528 Y92.471 E.09197
G1 X102.528 Y91.925
G1 X99.941 Y94.512 E.09197
G1 X99.941 Y93.967
G1 X102.528 Y91.38 E.09197
G1 X102.528 Y90.834
G1 X99.941 Y93.421 E.09197
G1 X99.941 Y92.876
G1 X102.528 Y90.289 E.09197
G1 X102.528 Y89.744
G1 X99.941 Y92.33 E.09197
G1 X99.941 Y91.785
G1 X102.528 Y89.198 E.09197
G1 X102.528 Y88.653
G1 X99.941 Y91.24 E.09197
G1 X99.941 Y90.694
G1 X102.528 Y88.107 E.09197
G1 X102.528 Y87.562
G1 X99.941 Y90.149 E.09197
G1 X99.941 Y89.603
G1 X102.528 Y87.017 E.09197
G1 X102.528 Y86.471
G1 X99.941 Y89.058 E.09197
G1 X99.941 Y88.513
G1 X102.528 Y85.926 E.09197
G1 X102.528 Y85.38
G1 X99.941 Y87.967 E.09197
G1 X99.941 Y87.422
M73 P28 R4
G1 X102.528 Y84.835 E.09197
G1 X102.528 Y84.29
G1 X99.941 Y86.876 E.09197
G1 X99.941 Y86.331
G1 X102.528 Y83.744 E.09197
G1 X102.085 Y83.641
G1 X99.941 Y85.785 E.07624
G1 X99.941 Y85.24
G1 X101.54 Y83.641 E.05685
G1 X100.995 Y83.641
G1 X99.941 Y84.695 E.03746
G1 X99.941 Y84.149
G1 X100.449 Y83.641 E.01806
; WIPE_START
M204 S6000
G1 X99.941 Y84.149 E-.27303
G1 X99.941 Y84.695 E-.20725
G1 X100.462 Y84.174 E-.27972
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.152 Y81.396 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420226
G1 F11661.354
M204 S6000
G1 X102.716 Y80.831 E.02008
G1 X102.716 Y80.286 E.01371
G1 X101.606 Y81.396 E.03948
M204 S10000
G1 X101.341 Y81.661 F42000
G1 F11661.354
M204 S6000
G1 X100.76 Y82.242 E.02068
G1 X100.214 Y82.242 E.01373
G1 X102.702 Y79.754 E.08852
G2 X102.542 Y79.368 I-.781 J.097 E.01063
G1 X99.668 Y82.242 E.10225
G1 X99.123 Y82.242 E.01373
G1 X102.256 Y79.109 E.11148
G2 X101.833 Y78.986 I-.462 J.804 E.01119
G1 X79.802 Y101.017 E.78378
G1 X80.347 Y101.017 E.01373
G1 X98.542 Y82.822 E.6473
G1 X98.542 Y83.368 E.01373
G1 X80.893 Y101.017 E.62789
G1 X81.439 Y101.017 E.01373
G1 X98.542 Y83.914 E.60847
G1 X98.542 Y84.46 E.01373
G1 X81.984 Y101.017 E.58906
G1 X82.53 Y101.017 E.01373
G1 X98.542 Y85.005 E.56964
G1 X98.542 Y85.551 E.01373
G1 X83.076 Y101.017 E.55023
G1 X83.622 Y101.017 E.01373
G1 X98.542 Y86.097 E.53081
G1 X98.542 Y86.643 E.01373
G1 X84.167 Y101.017 E.5114
G1 X84.713 Y101.017 E.01373
G1 X98.542 Y87.188 E.49198
G1 X98.542 Y87.734 E.01373
G1 X85.259 Y101.017 E.47257
G1 X85.805 Y101.017 E.01373
G1 X98.542 Y88.28 E.45315
G1 X98.542 Y88.825 E.01373
G1 X86.35 Y101.017 E.43374
G1 X86.896 Y101.017 E.01373
G1 X98.542 Y89.371 E.41432
G1 X98.542 Y89.917 E.01373
G1 X87.442 Y101.017 E.39491
G1 X87.988 Y101.017 E.01373
G1 X98.542 Y90.463 E.37549
G1 X98.542 Y91.008 E.01373
G1 X88.533 Y101.017 E.35608
G1 X89.079 Y101.017 E.01373
G1 X98.542 Y91.554 E.33666
G1 X98.542 Y92.1 E.01373
G1 X89.625 Y101.017 E.31725
M73 P29 R4
G1 X90.17 Y101.017 E.01373
G1 X98.542 Y92.646 E.29783
G1 X98.542 Y93.191 E.01373
G1 X90.716 Y101.017 E.27842
G1 X91.262 Y101.017 E.01373
G1 X98.542 Y93.737 E.259
G1 X98.542 Y94.283 E.01373
G1 X91.808 Y101.017 E.23959
G1 X92.353 Y101.017 E.01373
G1 X98.542 Y94.829 E.22017
G1 X98.542 Y95.374 E.01373
G1 X92.899 Y101.017 E.20076
G1 X93.445 Y101.017 E.01373
G1 X98.542 Y95.92 E.18134
G1 X98.542 Y96.466 E.01373
G1 X93.991 Y101.017 E.16193
G1 X94.536 Y101.017 E.01373
G1 X98.542 Y97.011 E.14251
G1 X98.542 Y97.557 E.01373
G1 X95.082 Y101.017 E.1231
G1 X95.628 Y101.017 E.01373
G1 X98.887 Y97.758 E.11595
G1 X99.433 Y97.758 E.01373
G1 X96.174 Y101.017 E.11596
G1 X96.719 Y101.017 E.01373
G1 X99.979 Y97.758 E.11596
G1 X100.524 Y97.758 E.01373
G1 X97.265 Y101.017 E.11596
G1 X97.811 Y101.017 E.01373
G1 X101.07 Y97.758 E.11596
G1 X101.168 Y97.758 E.00245
G1 X101.168 Y98.206 E.01128
G1 X98.356 Y101.017 E.10001
G1 X98.902 Y101.017 E.01373
G1 X101.168 Y98.752 E.08059
G1 X101.168 Y98.778 E.00065
G1 X101.687 Y98.778 E.01307
G1 X99.448 Y101.017 E.07967
G1 X99.994 Y101.017 E.01373
G1 X102.233 Y98.778 E.07967
G1 X102.717 Y98.778 E.01218
G1 X102.717 Y98.839 E.00154
G1 X100.539 Y101.017 E.07748
G1 X101.085 Y101.017 E.01373
G1 X102.717 Y99.385 E.05807
G1 X102.717 Y99.931 E.01373
G1 X101.457 Y101.191 E.04483
M204 S10000
G1 X79.082 Y101.191 F42000
G1 F11661.354
M204 S6000
G1 X101.289 Y78.984 E.79002
G1 X100.743 Y78.984 E.01373
G1 X78.71 Y101.017 E.78385
G3 X78.17 Y101.011 I-.238 J-2.891 E.0136
G1 X100.197 Y78.984 E.78363
G1 X99.652 Y78.984 E.01373
G1 X77.749 Y100.887 E.77922
G3 X77.46 Y100.631 I.402 J-.744 E.00981
G1 X99.106 Y78.984 E.77009
G1 X98.56 Y78.984 E.01373
G1 X77.298 Y100.247 E.75644
G3 X77.283 Y99.716 I3.097 J-.354 E.01337
G1 X98.015 Y78.984 E.73756
G1 X97.469 Y78.984 E.01373
G1 X77.283 Y99.17 E.71815
G1 X77.283 Y98.625 E.01373
G1 X96.923 Y78.984 E.69873
G1 X96.378 Y78.984 E.01373
G1 X77.283 Y98.079 E.67932
G1 X77.283 Y97.533 E.01373
G1 X95.832 Y78.984 E.65991
M73 P30 R4
G1 X95.286 Y78.984 E.01373
G1 X77.283 Y96.987 E.64049
G1 X77.283 Y96.442 E.01373
G1 X94.74 Y78.984 E.62108
G1 X94.195 Y78.984 E.01373
G1 X84.796 Y88.382 E.33436
G2 X84.848 Y87.785 I-1.451 J-.426 E.01518
G1 X93.649 Y78.984 E.31312
G1 X93.103 Y78.984 E.01373
G1 X84.78 Y87.307 E.2961
G2 X84.64 Y86.901 I-1.073 J.144 E.01087
G1 X92.558 Y78.984 E.28167
G1 X92.012 Y78.984 E.01373
G1 X84.446 Y86.55 E.26916
G1 X84.264 Y86.296 E.00785
G1 X84.207 Y86.243 E.00197
G1 X91.466 Y78.984 E.25826
G1 X90.921 Y78.984 E.01373
G1 X83.924 Y85.98 E.24892
G1 X83.587 Y85.772 E.00997
G1 X90.375 Y78.984 E.2415
G1 X89.829 Y78.984 E.01373
G1 X83.2 Y85.612 E.23583
G2 X82.759 Y85.508 I-.711 J2.025 E.01143
G1 X89.284 Y78.984 E.23212
G1 X88.738 Y78.983 E.01373
G1 X81.994 Y85.727 E.23991
; WIPE_START
G1 X83.409 Y84.313 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.325 Y87.397 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
G1 F11661.354
M204 S6000
G1 X77.283 Y90.439 E.10823
G1 X77.283 Y90.984 E.01373
G1 X80.107 Y88.16 E.10048
G1 X80.207 Y88.606 E.0115
G1 X77.283 Y91.53 E.10402
G1 X77.283 Y92.076 E.01373
G1 X80.372 Y88.987 E.1099
G2 X80.581 Y89.323 I2.062 J-1.05 E.00998
G1 X77.283 Y92.622 E.11735
G1 X77.283 Y93.167 E.01373
G1 X80.841 Y89.609 E.1266
G2 X81.15 Y89.845 I.956 J-.928 E.00983
G1 X77.283 Y93.713 E.13759
G1 X77.283 Y94.259 E.01373
G1 X81.501 Y90.041 E.15006
G2 X81.905 Y90.182 I.552 J-.93 E.01085
G1 X77.283 Y94.804 E.16445
G1 X77.283 Y95.35 E.01373
G1 X82.384 Y90.249 E.18147
G2 X82.984 Y90.194 I.164 J-1.513 E.01528
G1 X77.109 Y96.069 E.20902
M204 S10000
G1 X77.109 Y90.066 F42000
G1 F11661.354
M204 S6000
G1 X88.192 Y78.983 E.39429
G1 X87.646 Y78.983 E.01373
G1 X77.283 Y89.347 E.3687
G1 X77.283 Y88.801 E.01373
G1 X87.101 Y78.983 E.34929
G1 X86.555 Y78.983 E.01373
G1 X77.283 Y88.256 E.32987
G1 X77.283 Y87.71 E.01373
G1 X86.009 Y78.983 E.31046
G1 X85.464 Y78.983 E.01373
G1 X77.283 Y87.164 E.29105
G1 X77.283 Y86.618 E.01373
G1 X84.918 Y78.983 E.27163
G1 X84.372 Y78.983 E.01373
G1 X77.283 Y86.073 E.25222
G1 X77.283 Y85.527 E.01373
G1 X83.827 Y78.983 E.23281
G1 X83.281 Y78.983 E.01373
G1 X77.283 Y84.981 E.21339
G1 X77.283 Y84.436 E.01373
G1 X82.735 Y78.983 E.19398
G1 X82.19 Y78.983 E.01373
M73 P31 R4
G1 X77.283 Y83.89 E.17457
G1 X77.283 Y83.344 E.01373
G1 X81.644 Y78.983 E.15515
G1 X81.098 Y78.983 E.01373
G1 X77.283 Y82.798 E.13574
G1 X77.283 Y82.253 E.01373
G1 X80.552 Y78.983 E.11633
G1 X80.007 Y78.983 E.01373
G1 X77.283 Y81.707 E.09691
G1 X77.283 Y81.161 E.01373
G1 X79.461 Y78.983 E.0775
G1 X78.915 Y78.983 E.01373
G1 X77.283 Y80.615 E.05808
G1 X77.283 Y80.07 E.01373
G1 X78.543 Y78.809 E.04484
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11661.354
G1 X77.283 Y80.07 E-.67741
G1 X77.283 Y80.287 E-.08259
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/30
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.08 I-1.011 J.678 P1  F42000
G1 X81.955 Y87.254 Z1.08
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X82.395 Y87.069 I.521 J.62 E.01218
G1 X82.476 Y87.065 E.00204
G3 X81.91 Y87.295 I0 J.81 E.11219
; WIPE_START
M204 S6000
G1 X82.087 Y87.164 E-.08374
G1 X82.236 Y87.101 E-.0614
G1 X82.395 Y87.069 E-.06141
G1 X82.476 Y87.065 E-.03081
G1 X82.593 Y87.073 E-.04483
G1 X82.752 Y87.114 E-.06235
G1 X82.898 Y87.184 E-.06129
G1 X83.027 Y87.282 E-.06187
G1 X83.133 Y87.402 E-.06073
G1 X83.214 Y87.542 E-.06135
G1 X83.265 Y87.695 E-.06128
G1 X83.285 Y87.855 E-.06135
G1 X83.276 Y87.98 E-.04759
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.172 Y91.25 Z1.24 F42000
G1 X102.74 Y97.21 Z1.24
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S5000
G1 X103.531 Y97.21 E.01988
G1 X103.931 Y97.21 E.01006
G1 F7362.714
G1 X104.331 Y97.21 E.01006
G1 F3374.848
G1 X104.395 Y97.21 E.00161
G1 F2880
G1 X104.394 Y99.495 E.05746
G3 X104.331 Y100.667 I-5.236 J.302 E.02955
G3 X101.797 Y102.694 I-2.539 J-.576 E.08808
G1 X78.803 Y102.694 E.57811
G3 X77.57 Y102.616 I-.3 J-5.056 E.03115
G3 X75.606 Y100.097 I.642 J-2.526 E.08644
G1 X75.606 Y80.503 E.49263
G3 X75.684 Y79.27 I5.058 J-.3 E.03114
G3 X78.203 Y77.306 I2.526 J.642 E.08645
G1 X101.861 Y77.307 E.5948
G3 X104.394 Y79.903 I-.062 J2.594 E.10095
G1 X104.395 Y82.79 E.07259
G1 F3374.768
G1 X104.331 Y82.79 E.00161
G1 F7362.595
G1 X103.931 Y82.79 E.01006
G1 F11668.197
G1 X103.531 Y82.79 E.01006
G1 X102.74 Y82.79 E.01988
G1 X102.74 Y84.79 E.05028
G1 X101.09 Y84.79 E.04148
G1 X101.09 Y95.21 E.26197
G1 X102.74 Y95.21 E.04148
G1 X102.74 Y97.15 E.04877
; WIPE_START
M204 S6000
G1 X103.531 Y97.21 E-.30136
G1 X103.931 Y97.21 E-.152
G1 X104.331 Y97.21 E-.152
G1 X104.395 Y97.21 E-.02429
G1 X104.395 Y97.553 E-.13036
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

G1 X104.182 Y97.91
G1 Z.84
G1 E.8 F1800
; FEATURE: Top surface
G1 F11668.197
M204 S2000
G1 X103.694 Y97.422 E.01736
G1 X103.149 Y97.422
G1 X104.182 Y98.456 E.03675
G1 X104.182 Y99.001
G1 X102.603 Y97.422 E.05614
; WIPE_START
M204 S6000
G1 X104.018 Y98.836 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.694 Y95.422 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S2000
M73 P32 R4
G1 X102.528 Y96.256 E.02964
G1 X102.528 Y96.801
G1 X101.149 Y95.422 E.04903
; WIPE_START
M204 S6000
G1 X102.528 Y96.801 E-.74113
G1 X102.528 Y96.752 E-.01887
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.212 Y89.15 Z1.24 F42000
G1 X104.1 Y79.285 Z1.24
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X102.415 Y77.6 E.05991
G1 X101.79 Y77.52
G1 X104.182 Y79.912 E.08505
G1 X104.182 Y80.457
G1 X101.245 Y77.519 E.10445
G1 X100.699 Y77.519
G1 X104.182 Y81.003 E.12385
G1 X104.182 Y81.548
G1 X100.154 Y77.519 E.14324
G1 X99.608 Y77.519
G1 X104.182 Y82.094 E.16264
G1 X104.121 Y82.578
G1 X99.063 Y77.519 E.17986
G1 X98.517 Y77.519
G1 X103.576 Y82.578 E.17986
G1 X103.031 Y82.578
G1 X97.972 Y77.519 E.17986
G1 X97.426 Y77.519
G1 X102.528 Y82.621 E.18138
G1 X102.528 Y83.166
G1 X96.881 Y77.519 E.20078
G1 X96.336 Y77.519
G1 X102.528 Y83.711 E.22017
G1 X102.528 Y84.257
G1 X95.79 Y77.519 E.23956
G1 X95.245 Y77.519
G1 X102.304 Y84.578 E.25098
G1 X101.758 Y84.578
G1 X94.699 Y77.519 E.25098
G1 X94.154 Y77.519
G1 X101.213 Y84.578 E.25098
G1 X100.878 Y84.789
G1 X93.608 Y77.519 E.25847
G1 X93.063 Y77.519
G1 X100.878 Y85.334 E.27787
G1 X100.878 Y85.879
G1 X92.517 Y77.519 E.29726
G1 X91.972 Y77.519
G1 X100.878 Y86.425 E.31665
G1 X100.878 Y86.97
G1 X91.427 Y77.519 E.33605
G1 X90.881 Y77.519
G1 X100.878 Y87.516 E.35544
G1 X100.878 Y88.061
G1 X90.336 Y77.519 E.37483
G1 X89.79 Y77.519
G1 X100.878 Y88.606 E.39423
G1 X100.878 Y89.152
G1 X89.245 Y77.519 E.41362
M73 P33 R4
G1 X88.699 Y77.519
G1 X100.878 Y89.697 E.43301
G1 X100.878 Y90.243
G1 X88.154 Y77.519 E.45241
G1 X87.608 Y77.519
G1 X100.878 Y90.788 E.4718
G1 X100.878 Y91.333
G1 X87.063 Y77.518 E.49119
G1 X86.518 Y77.518
G1 X100.878 Y91.879 E.51059
G1 X100.878 Y92.424
G1 X85.972 Y77.518 E.52998
G1 X85.427 Y77.518
G1 X100.878 Y92.97 E.54937
G1 X100.878 Y93.515
G1 X84.881 Y77.518 E.56877
G1 X84.336 Y77.518
G1 X100.878 Y94.06 E.58816
G1 X100.878 Y94.606
G1 X83.79 Y77.518 E.60755
G1 X83.245 Y77.518
G1 X100.878 Y95.151 E.62695
; WIPE_START
M204 S6000
G1 X99.464 Y93.737 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.528 Y97.347 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X82.699 Y77.518 E.70501
G1 X82.154 Y77.518
G1 X104.182 Y99.546 E.78322
G1 X104.182 Y100.092
G1 X81.609 Y77.518 E.80261
G1 X81.063 Y77.518
G1 X104.13 Y100.585 E.82016
G1 X104.004 Y101.004
G1 X80.518 Y77.518 E.83505
M73 P34 R4
G1 X79.972 Y77.518
G1 X103.818 Y101.364 E.84785
G1 X103.585 Y101.676
G1 X79.427 Y77.518 E.85896
G1 X78.881 Y77.518
G1 X103.308 Y101.944 E.86848
G1 X102.984 Y102.166
G1 X78.336 Y77.518 E.87637
G1 X77.821 Y77.549
G1 X102.612 Y102.339 E.88143
G1 X102.178 Y102.451
G1 X77.388 Y77.661 E.88142
G1 X77.016 Y77.834
G1 X101.664 Y102.482 E.87637
G1 X101.119 Y102.482
G1 X76.692 Y78.056 E.86848
G1 X76.415 Y78.324
G1 X100.573 Y102.482 E.85896
G1 X100.028 Y102.482
G1 X76.182 Y78.636 E.84785
G1 X75.996 Y78.996
G1 X99.482 Y102.482 E.83505
G1 X98.937 Y102.482
G1 X75.869 Y79.414 E.8202
G1 X75.818 Y79.908
G1 X82.823 Y86.913 E.24906
M73 P35 R4
G1 X82.244 Y86.88
G1 X75.818 Y80.454 E.22848
G1 X75.818 Y80.999
G1 X81.87 Y87.052 E.2152
G1 X81.608 Y87.335
G1 X75.818 Y81.545 E.20586
G1 X75.818 Y82.09
G1 X81.463 Y87.735 E.20072
G1 X81.626 Y88.443
G1 X75.818 Y82.636 E.20649
; WIPE_START
M204 S6000
G1 X77.232 Y84.05 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.435 Y87.526 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X98.392 Y102.482 E.53178
G1 X97.846 Y102.482
G1 X83.47 Y88.106 E.51115
G1 X83.298 Y88.48
G1 X97.301 Y102.482 E.49786
G1 X96.755 Y102.482
G1 X83.015 Y88.742 E.48854
G1 X82.615 Y88.887
G1 X96.21 Y102.482 E.48338
G1 X95.665 Y102.482
G1 X81.908 Y88.725 E.48913
; WIPE_START
M204 S6000
G1 X83.322 Y90.14 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.725 Y84.95 Z1.24 F42000
G1 X75.818 Y83.181 Z1.24
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X95.119 Y102.482 E.68626
G1 X94.574 Y102.482
G1 X75.818 Y83.726 E.66687
G1 X75.818 Y84.272
G1 X94.028 Y102.482 E.64748
G1 X93.483 Y102.482
G1 X75.818 Y84.817 E.62808
G1 X75.818 Y85.363
G1 X92.937 Y102.482 E.60869
G1 X92.392 Y102.482
G1 X75.818 Y85.908 E.5893
M73 P36 R4
G1 X75.818 Y86.453
G1 X91.847 Y102.482 E.56991
G1 X91.301 Y102.482
G1 X75.818 Y86.999 E.55052
G1 X75.818 Y87.544
G1 X90.756 Y102.482 E.53112
G1 X90.21 Y102.482
G1 X75.818 Y88.09 E.51173
G1 X75.818 Y88.635
G1 X89.665 Y102.482 E.49234
G1 X89.12 Y102.482
G1 X75.818 Y89.18 E.47295
G1 X75.818 Y89.726
G1 X88.574 Y102.482 E.45356
G1 X88.029 Y102.482
G1 X75.818 Y90.271 E.43416
G1 X75.818 Y90.817
G1 X87.483 Y102.482 E.41477
G1 X86.938 Y102.482
G1 X75.818 Y91.362 E.39538
G1 X75.818 Y91.907
G1 X86.393 Y102.482 E.37599
G1 X85.847 Y102.482
G1 X75.818 Y92.453 E.3566
G1 X75.818 Y92.998
G1 X85.302 Y102.482 E.3372
G1 X84.756 Y102.482
G1 X75.818 Y93.544 E.31781
M73 P36 R3
G1 X75.818 Y94.089
G1 X84.211 Y102.482 E.29842
G1 X83.666 Y102.482
G1 X75.818 Y94.634 E.27903
G1 X75.818 Y95.18
G1 X83.12 Y102.482 E.25964
G1 X82.575 Y102.482
G1 X75.818 Y95.725 E.24024
G1 X75.818 Y96.271
G1 X82.029 Y102.482 E.22085
M73 P37 R3
G1 X81.484 Y102.482
G1 X75.818 Y96.816 E.20146
G1 X75.818 Y97.361
G1 X80.939 Y102.482 E.18207
G1 X80.393 Y102.482
G1 X75.818 Y97.907 E.16268
G1 X75.818 Y98.452
G1 X79.848 Y102.482 E.14328
G1 X79.302 Y102.482
G1 X75.818 Y98.998 E.12389
G1 X75.818 Y99.543
G1 X78.757 Y102.482 E.1045
G1 X78.212 Y102.482
G1 X75.818 Y100.088 E.08511
G1 X75.9 Y100.716
G1 X77.584 Y102.4 E.05991
; WIPE_START
M204 S6000
G1 X76.17 Y100.986 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.807 Y94.276 Z1.24 F42000
G1 X83.501 Y87.46 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.187649
G1 F18000
M204 S6000
G1 X83.34 Y87.249 E.00265
; LINE_WIDTH: 0.158435
G1 X83.033 Y86.955 E.00344
; LINE_WIDTH: 0.191726
G1 X82.959 Y86.899 E.00095
G1 X82.812 Y86.924 E.00153
; WIPE_START
G1 X82.959 Y86.899 E-.46878
G1 X83.033 Y86.955 E-.29122
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.845 Y88.788 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.217979
G1 F18000
M204 S6000
G1 X81.629 Y88.579 E.0036
G1 X81.636 Y88.432 E.00176
; WIPE_START
G1 X81.629 Y88.579 E-.24991
G1 X81.845 Y88.788 E-.51009
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.259 Y81.607 Z1.24 F42000
G1 X77.798 Y77.55 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.0936376
G1 F18000
M204 S6000
G1 X77.634 Y77.634 E.00071
; WIPE_START
G1 X77.798 Y77.55 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.422 Y77.912 Z1.24 F42000
G1 X103.907 Y78.79 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.0952939
G1 F18000
M204 S6000
G1 X103.827 Y78.685 E.00053
; LINE_WIDTH: 0.134151
G2 X103.68 Y78.506 I-3.736 J2.915 E.00151
; LINE_WIDTH: 0.168134
G2 X103.106 Y77.946 I-3.601 J3.116 E.00701
; LINE_WIDTH: 0.122873
G1 X103.015 Y77.873 E.00067
; LINE_WIDTH: 0.0953512
G1 X102.91 Y77.793 E.00053
; WIPE_START
G1 X103.015 Y77.873 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.45 Y83.096 Z1.24 F42000
G1 X77.09 Y102.207 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.0952589
G1 F18000
M204 S6000
G1 X76.985 Y102.127 E.00052
; LINE_WIDTH: 0.134057
G3 X76.806 Y101.98 I2.894 J-3.71 E.00151
; LINE_WIDTH: 0.168029
G3 X76.245 Y101.406 I3.117 J-3.601 E.007
; LINE_WIDTH: 0.122734
G1 X76.173 Y101.315 E.00067
; LINE_WIDTH: 0.0952493
G1 X76.093 Y101.21 E.00052
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X76.173 Y101.315 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/30
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.24 I.671 J1.015 P1  F42000
G1 X104.21 Y82.79 Z1.24
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1367
M204 S5000
G1 X104.21 Y79.636 E.07929
G1 X104.21 Y79.236 E.01006
G1 X104.21 Y78.836 E.01006
G1 X104.21 Y78.744 E.00231
G1 X104.217 Y78.757 E.00036
G3 X104.473 Y79.903 I-2.451 J1.151 E.02975
G1 X104.473 Y82.79 E.07259
G1 X104.436 Y82.79 E.00094
G1 X104.27 Y82.79 E.00417
; WIPE_START
G1 F5484.59
M204 S6000
G1 X104.232 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.864 Y77.49 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F1367
M204 S5000
G1 X77.937 Y77.49 E.6267
G1 X77.537 Y77.49 E.01006
G1 X77.137 Y77.49 E.01006
M73 P38 R3
G1 X77.044 Y77.49 E.00233
G1 X77.057 Y77.484 E.00036
G3 X78.203 Y77.227 I1.151 J2.451 E.02976
G1 X101.81 Y77.227 E.59351
G3 X102.956 Y77.49 I-.038 J2.797 E.02978
G1 X102.924 Y77.49 E.0008
; WIPE_START
G1 F3869.579
M204 S6000
G1 X100.924 Y77.49 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.178 Y85.019 Z1.4 F42000
G1 X104.21 Y97.21 Z1.4
G1 Z1
G1 E.8 F1800
G1 F1367
M204 S5000
G1 X104.436 Y97.21 E.00567
G1 X104.473 Y97.21 E.00094
G1 X104.473 Y100.097 E.07259
G3 X104.21 Y101.256 I-2.8 J-.027 E.03009
G1 X104.21 Y101.161 E.00237
G1 X104.21 Y100.761 E.01006
G1 X104.21 Y100.361 E.01006
G1 X104.21 Y97.27 E.07772
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.436 Y97.21 E-.08873
G1 X104.473 Y97.21 E-.01415
G1 X104.473 Y98.939 E-.65711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.905 Y99.928 Z1.4 F42000
G1 X77.137 Y102.51 Z1.4
G1 Z1
G1 E.8 F1800
G1 F1367
M204 S5000
G1 X102.064 Y102.51 E.6267
G1 X102.464 Y102.51 E.01006
G1 X102.864 Y102.51 E.01006
G1 X102.956 Y102.51 E.00231
G1 X102.943 Y102.517 E.00037
G3 X101.797 Y102.773 I-1.151 J-2.451 E.02975
G1 X78.803 Y102.773 E.57811
G3 X77.551 Y102.693 I-.3 J-5.136 E.03163
G3 X77.044 Y102.51 I.698 J-2.722 E.01356
M73 P39 R3
G1 X77.077 Y102.51 E.00082
; WIPE_START
G1 F3875.529
M204 S6000
G1 X79.077 Y102.51 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.031 Y94.95 Z1.4 F42000
G1 X75.79 Y78.744 Z1.4
G1 Z1
G1 E.8 F1800
G1 F1367
M204 S5000
G1 X75.79 Y78.836 E.00231
G1 X75.79 Y79.236 E.01006
G1 X75.79 Y100.364 E.53119
G1 X75.79 Y100.764 E.01006
G1 X75.79 Y101.164 E.01006
G1 X75.79 Y101.256 E.00231
G1 X75.784 Y101.243 E.00036
G3 X75.527 Y100.097 I2.451 J-1.151 E.02976
G1 X75.527 Y80.503 E.49263
G3 X75.607 Y79.25 I5.135 J-.3 E.03163
G3 X75.765 Y78.799 I2.719 J.697 E.01204
; WIPE_START
G1 F3600
M204 S6000
G1 X75.79 Y78.836 E-.0171
G1 X75.79 Y79.236 E-.152
G1 X75.79 Y80.791 E-.5909
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

; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 7/30
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
G1 X104.21 Y82.79 F42000
G1 Z1.16
G1 E.8 F1800
G1 F1369
M204 S5000
G1 X104.21 Y79.053 E.09395
G1 X104.21 Y78.653 E.01006
G1 X104.21 Y78.619 E.00087
G1 X104.268 Y78.733 E.00322
G3 X104.53 Y79.903 I-2.502 J1.175 E.03039
G1 X104.53 Y82.79 E.07259
G1 X104.514 Y82.79 E.0004
G1 X104.27 Y82.79 E.00613
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.238 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.047 Y77.49 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
M73 P40 R3
G1 F1369
M204 S5000
G1 X77.353 Y77.49 E.64598
G1 X76.953 Y77.49 E.01006
G1 X76.919 Y77.49 E.00087
G3 X77.127 Y77.391 I1.118 J2.08 E.00582
G1 X77.281 Y77.33 E.00416
G3 X78.203 Y77.17 I.929 J2.629 E.02363
G1 X101.829 Y77.171 E.59399
G3 X102.2 Y77.2 I-.044 J2.974 E.00936
G1 X102.362 Y77.23 E.00416
G3 X102.592 Y77.288 I-.477 J2.361 E.00594
G1 X102.748 Y77.341 E.00416
G3 X103.059 Y77.478 I-1.036 J2.764 E.00854
; WIPE_START
G1 F8640
M204 S6000
G1 X101.059 Y77.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.263 Y85.016 Z1.56 F42000
G1 X104.21 Y97.21 Z1.56
G1 Z1.16
G1 E.8 F1800
G1 F1369
M204 S5000
G1 X104.514 Y97.21 E.00764
G1 X104.53 Y97.21 E.0004
G1 X104.53 Y100.097 E.07259
G3 X104.5 Y100.5 I-3.078 J-.023 E.01016
G1 X104.47 Y100.662 E.00416
G3 X104.21 Y101.381 I-2.985 J-.675 E.01928
G1 X104.21 Y101.347 E.00087
G1 X104.21 Y100.947 E.01006
G1 X104.21 Y97.27 E.09244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.514 Y97.21 E-.11771
G1 X104.53 Y97.21 E-.00608
G1 X104.53 Y98.884 E-.63621
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.967 Y99.912 Z1.56 F42000
G1 X77.127 Y102.609 Z1.56
G1 Z1.16
G1 E.8 F1800
G1 F1369
M204 S5000
G3 X76.919 Y102.51 I.906 J-2.173 E.00582
G1 X76.953 Y102.51 E.00087
G1 X77.353 Y102.51 E.01006
G1 X102.647 Y102.51 E.63592
G1 X103.047 Y102.51 E.01006
G1 X103.081 Y102.51 E.00087
M73 P41 R3
G1 X102.967 Y102.567 E.00321
G3 X101.797 Y102.83 I-1.175 J-2.502 E.03039
G1 X78.803 Y102.83 E.57811
G3 X77.537 Y102.748 I-.3 J-5.193 E.03197
G3 X77.281 Y102.67 I.661 J-2.641 E.00672
G1 X77.183 Y102.632 E.00265
; WIPE_START
G1 F9480
M204 S6000
G1 X76.919 Y102.51 E-.11066
G1 X76.953 Y102.51 E-.0131
G1 X77.353 Y102.51 E-.152
G1 X78.627 Y102.51 E-.48423
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.726 Y94.931 Z1.56 F42000
G1 X75.79 Y78.653 Z1.56
G1 Z1.16
G1 E.8 F1800
G1 F1369
M204 S5000
G1 X75.79 Y100.947 E.5605
G1 X75.79 Y101.347 E.01006
G1 X75.79 Y101.381 E.00086
G1 X75.72 Y101.239 E.00398
G3 X75.47 Y100.097 I2.504 J-1.146 E.02962
G1 X75.47 Y80.503 E.49263
G3 X75.552 Y79.237 I5.192 J-.3 E.03197
G3 X75.778 Y78.641 I2.747 J.702 E.01605
; WIPE_START
M73 P42 R3
G1 F8640
M204 S6000
G1 X75.779 Y80.641 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 8/30
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
G1 X103.157 Y77.49 F42000
G1 Z1.32
G1 E.8 F1800
G1 F1356
M204 S5000
G1 X76.843 Y77.49 E.66159
G3 X78.203 Y77.133 I1.362 J2.422 E.03574
G1 X101.874 Y77.135 E.59512
G3 X103.105 Y77.462 I-.097 J2.849 E.03228
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.105 Y77.464 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
G1 F1356
M204 S5000
G1 X104.21 Y78.543 E.10678
G1 X104.24 Y78.596 E.00153
G3 X104.567 Y79.903 I-2.553 J1.333 E.0342
G1 X104.567 Y82.79 E.07259
G1 X104.27 Y82.79 E.00747
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z1.72 F42000
G1 X104.21 Y97.21 Z1.72
G1 Z1.32
G1 E.8 F1800
G1 F1356
M204 S5000
G1 X104.567 Y97.21 E.00897
G1 X104.567 Y100.097 E.07259
G3 X104.21 Y101.457 I-2.779 J-.002 E.03574
G1 X104.21 Y97.27 E.10528
; WIPE_START
G1 F11668.197
M204 S6000
M73 P43 R3
G1 X104.567 Y97.21 E-.13755
G1 X104.567 Y98.848 E-.62245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.007 Y99.898 Z1.72 F42000
G1 X77.142 Y102.655 Z1.72
G1 Z1.32
G1 E.8 F1800
G1 F1356
M204 S5000
G3 X76.843 Y102.51 I1.064 J-2.568 E.00836
G1 X103.157 Y102.51 E.66159
G1 X103.106 Y102.539 E.00149
G3 X101.797 Y102.867 I-1.334 J-2.552 E.03423
G1 X78.203 Y102.867 E.59319
G3 X77.197 Y102.678 I.002 J-2.779 E.02588
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.843 Y102.51 E-.14901
G1 X78.451 Y102.51 E-.61099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.608 Y94.924 Z1.72 F42000
G1 X75.79 Y78.543 Z1.72
G1 Z1.32
G1 E.8 F1800
G1 F1356
M204 S5000
G1 X75.79 Y101.457 E.57611
G3 X75.433 Y100.097 I2.422 J-1.362 E.03574
G1 X75.433 Y79.903 E.50771
M73 P44 R3
G3 X75.761 Y78.595 I2.78 J.002 E.03424
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.764 Y80.595 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 9/30
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
G1 X103.196 Y77.49 F42000
G1 Z1.48
G1 E.8 F1800
G1 F1361
M204 S5000
G1 X76.803 Y77.49 E.66355
G3 X78.203 Y77.114 I1.402 J2.424 E.03686
G1 X101.888 Y77.116 E.59547
G3 X103.144 Y77.46 I-.087 J2.779 E.03305
; WIPE_START
G1 F11668.197
M204 S6000
M73 P45 R3
G1 X101.144 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
G1 F1361
M204 S5000
G1 X104.21 Y78.503 E.10777
G1 X104.257 Y78.587 E.00241
G3 X104.586 Y79.903 I-2.571 J1.342 E.03443
G1 X104.586 Y82.79 E.07259
G1 X104.27 Y82.79 E.00795
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z1.88 F42000
G1 X104.21 Y97.21 Z1.88
G1 Z1.48
G1 E.8 F1800
G1 F1361
M204 S5000
G1 X104.586 Y97.21 E.00946
G1 X104.586 Y100.097 E.07259
G3 X104.21 Y101.495 I-2.791 J-.001 E.03683
G1 X104.21 Y97.27 E.10623
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.586 Y97.21 E-.14479
G1 X104.586 Y98.829 E-.61521
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.028 Y99.887 Z1.88 F42000
G1 X77.134 Y102.673 Z1.88
G1 Z1.48
G1 E.8 F1800
G1 F1361
M204 S5000
G3 X76.803 Y102.51 I1.071 J-2.588 E.00929
G1 X103.197 Y102.51 E.66357
G1 X103.114 Y102.557 E.0024
G3 X101.797 Y102.886 I-1.342 J-2.571 E.03444
G1 X78.203 Y102.886 E.59319
G3 X77.19 Y102.696 I.002 J-2.8 E.02606
; WIPE_START
G1 F11668.197
M204 S6000
M73 P46 R3
G1 X76.803 Y102.51 E-.16298
G1 X78.374 Y102.51 E-.59703
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.557 Y94.921 Z1.88 F42000
G1 X75.79 Y78.503 Z1.88
G1 Z1.48
G1 E.8 F1800
G1 F1361
M204 S5000
G1 X75.79 Y101.497 E.57809
G3 X75.414 Y100.097 I2.424 J-1.402 E.03686
G1 X75.414 Y79.903 E.50771
G3 X75.761 Y78.556 I2.801 J.003 E.03535
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.763 Y80.556 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 10/30
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
G1 X103.204 Y77.49 F42000
G1 Z1.64
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X76.796 Y77.49 E.66395
G3 X78.203 Y77.11 I1.41 J2.427 E.03707
G1 X101.934 Y77.113 E.59664
M73 P47 R3
G3 X103.152 Y77.461 I-.166 J2.891 E.03209
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.152 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.21 Y78.496 E.10797
G1 X104.26 Y78.585 E.00257
G3 X104.59 Y79.903 I-2.574 J1.344 E.03448
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z2.04 F42000
G1 X104.21 Y97.21 Z2.04
G1 Z1.64
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.806 J-.003 E.03707
G1 X104.21 Y97.27 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.032 Y99.886 Z2.04 F42000
G1 X77.133 Y102.677 Z2.04
G1 Z1.64
G1 E.8 F1800
G1 F1362
M204 S5000
G3 X76.796 Y102.51 I1.073 J-2.592 E.00946
G1 X103.204 Y102.51 E.66395
G1 X103.115 Y102.56 E.00257
G3 X101.797 Y102.89 I-1.344 J-2.574 E.03448
M73 P48 R3
G1 X78.203 Y102.89 E.59319
G3 X77.188 Y102.699 I.003 J-2.805 E.0261
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.796 Y102.51 E-.16563
G1 X78.36 Y102.51 E-.59437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.548 Y94.921 Z2.04 F42000
G1 X75.79 Y78.496 Z2.04
G1 Z1.64
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.425 J-1.41 E.03707
G1 X75.41 Y79.903 E.50772
G3 X75.76 Y78.548 I2.806 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.763 Y80.548 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 11/30
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
G1 X103.204 Y77.49 F42000
G1 Z1.8
G1 E.8 F1800
M73 P49 R3
G1 F1362
M204 S5000
G1 X76.796 Y77.49 E.66395
G3 X78.203 Y77.11 I1.41 J2.425 E.03707
G1 X101.928 Y77.113 E.59647
G3 X103.152 Y77.461 I-.158 J2.888 E.03226
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.152 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.21 Y78.496 E.10797
G1 X104.26 Y78.585 E.00257
G3 X104.59 Y79.903 I-2.574 J1.344 E.03448
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z2.2 F42000
G1 X104.21 Y97.21 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.805 J-.003 E.03706
G1 X104.21 Y97.27 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.032 Y99.886 Z2.2 F42000
G1 X77.133 Y102.677 Z2.2
G1 Z1.8
G1 E.8 F1800
M73 P50 R3
G1 F1362
M204 S5000
G3 X76.796 Y102.51 I1.073 J-2.592 E.00946
G1 X103.204 Y102.51 E.66395
G1 X103.115 Y102.561 E.00258
G3 X101.797 Y102.89 I-1.344 J-2.574 E.03447
G1 X78.203 Y102.89 E.59319
G3 X77.188 Y102.699 I.003 J-2.805 E.02611
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.796 Y102.51 E-.16559
G1 X78.36 Y102.51 E-.59441
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.548 Y94.921 Z2.2 F42000
G1 X75.79 Y78.496 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.425 J-1.41 E.03707
G1 X75.41 Y79.903 E.50772
G3 X75.76 Y78.548 I2.805 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
M73 P51 R3
G1 X75.763 Y80.548 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 12/30
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
G1 X103.204 Y77.49 F42000
G1 Z1.96
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X76.796 Y77.49 E.66395
G3 X78.203 Y77.11 I1.41 J2.425 E.03707
G1 X101.921 Y77.113 E.5963
G3 X103.152 Y77.461 I-.15 J2.884 E.03244
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.152 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.21 Y78.496 E.10797
G1 X104.26 Y78.585 E.00257
G3 X104.59 Y79.903 I-2.575 J1.344 E.03448
M73 P52 R3
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z2.36 F42000
G1 X104.21 Y97.21 Z2.36
G1 Z1.96
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.805 J-.003 E.03707
G1 X104.21 Y97.27 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.032 Y99.886 Z2.36 F42000
G1 X77.133 Y102.677 Z2.36
G1 Z1.96
G1 E.8 F1800
G1 F1362
M204 S5000
G3 X76.796 Y102.51 I1.073 J-2.592 E.00947
G1 X103.204 Y102.51 E.66395
G1 X103.115 Y102.561 E.00258
G3 X101.797 Y102.89 I-1.344 J-2.574 E.03447
M73 P52 R2
G1 X78.203 Y102.89 E.59319
G3 X77.189 Y102.699 I.003 J-2.805 E.0261
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.796 Y102.51 E-.16572
G1 X78.36 Y102.51 E-.59428
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.548 Y94.921 Z2.36 F42000
G1 X75.79 Y78.496 Z2.36
G1 Z1.96
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.425 J-1.41 E.03707
G1 X75.41 Y79.903 E.50771
M73 P53 R2
G3 X75.76 Y78.548 I2.805 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.763 Y80.548 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 13/30
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
G1 X103.204 Y77.49 F42000
G1 Z2.12
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X76.796 Y77.49 E.66395
G3 X78.203 Y77.11 I1.41 J2.425 E.03707
G1 X101.914 Y77.113 E.59612
G3 X103.152 Y77.461 I-.142 J2.882 E.03261
; WIPE_START
G1 F11668.197
M204 S6000
M73 P54 R2
G1 X101.152 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.21 Y78.496 E.10797
G1 X104.261 Y78.585 E.00258
G3 X104.59 Y79.903 I-2.575 J1.344 E.03448
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z2.52 F42000
G1 X104.21 Y97.21 Z2.52
G1 Z2.12
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.805 J-.003 E.03707
G1 X104.21 Y97.27 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.032 Y99.886 Z2.52 F42000
G1 X77.133 Y102.677 Z2.52
G1 Z2.12
G1 E.8 F1800
G1 F1362
M204 S5000
G3 X76.796 Y102.51 I1.073 J-2.592 E.00946
G1 X103.204 Y102.51 E.66395
G1 X103.115 Y102.561 E.00258
G3 X101.797 Y102.89 I-1.344 J-2.575 E.03448
G1 X78.203 Y102.89 E.59319
G3 X77.188 Y102.699 I.003 J-2.805 E.0261
; WIPE_START
G1 F11668.197
M204 S6000
M73 P55 R2
G1 X76.796 Y102.51 E-.16565
G1 X78.36 Y102.51 E-.59435
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.548 Y94.921 Z2.52 F42000
G1 X75.79 Y78.496 Z2.52
G1 Z2.12
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.425 J-1.41 E.03707
G1 X75.41 Y79.903 E.50771
G3 X75.76 Y78.548 I2.805 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.763 Y80.548 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 14/30
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
G1 X103.204 Y77.49 F42000
G1 Z2.28
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X76.796 Y77.49 E.66395
G3 X78.203 Y77.11 I1.41 J2.425 E.03707
G1 X101.907 Y77.113 E.59595
M73 P56 R2
G3 X103.152 Y77.461 I-.134 J2.879 E.03278
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.152 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.21 Y78.496 E.10797
G1 X104.261 Y78.585 E.00258
G3 X104.59 Y79.903 I-2.575 J1.344 E.03448
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z2.68 F42000
G1 X104.21 Y97.21 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.805 J-.003 E.03707
G1 X104.21 Y97.27 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.032 Y99.886 Z2.68 F42000
G1 X77.133 Y102.677 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F1362
M204 S5000
G3 X76.796 Y102.51 I1.073 J-2.592 E.00946
G1 X103.204 Y102.51 E.66395
G1 X103.115 Y102.56 E.00257
G3 X101.797 Y102.89 I-1.344 J-2.574 E.03448
M73 P57 R2
G1 X78.203 Y102.89 E.59319
G3 X77.188 Y102.699 I.003 J-2.805 E.02611
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.796 Y102.51 E-.16559
G1 X78.36 Y102.51 E-.59442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.548 Y94.921 Z2.68 F42000
G1 X75.79 Y78.496 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.426 J-1.41 E.03707
G1 X75.41 Y79.903 E.50771
G3 X75.76 Y78.548 I2.805 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
M73 P58 R2
G1 X75.763 Y80.548 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 15/30
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
G1 X103.204 Y77.49 F42000
G1 Z2.44
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X76.796 Y77.49 E.66395
G3 X78.203 Y77.11 I1.41 J2.425 E.03707
G1 X101.9 Y77.113 E.59578
G3 X103.152 Y77.461 I-.126 J2.878 E.03295
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.152 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.21 Y78.496 E.10797
G1 X104.26 Y78.585 E.00258
G3 X104.59 Y79.903 I-2.574 J1.344 E.03448
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z2.84 F42000
G1 X104.21 Y97.21 Z2.84
G1 Z2.44
G1 E.8 F1800
M73 P59 R2
G1 F1362
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.805 J-.003 E.03707
G1 X104.21 Y97.27 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.032 Y99.886 Z2.84 F42000
G1 X77.133 Y102.677 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F1362
M204 S5000
G3 X76.796 Y102.51 I1.073 J-2.592 E.00946
G1 X103.204 Y102.51 E.66395
G1 X103.115 Y102.56 E.00257
G3 X101.797 Y102.89 I-1.344 J-2.574 E.03448
G1 X78.203 Y102.89 E.59319
G3 X77.188 Y102.699 I.003 J-2.805 E.02611
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.796 Y102.51 E-.16559
G1 X78.36 Y102.51 E-.59442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.548 Y94.921 Z2.84 F42000
G1 X75.79 Y78.496 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.425 J-1.41 E.03707
G1 X75.41 Y79.903 E.50771
M73 P60 R2
G3 X75.76 Y78.548 I2.805 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.763 Y80.548 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 16/30
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
G1 X103.204 Y77.49 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X76.796 Y77.49 E.66395
G3 X78.203 Y77.11 I1.41 J2.425 E.03707
G1 X101.896 Y77.113 E.59567
G3 X103.152 Y77.461 I-.12 J2.874 E.03306
; WIPE_START
G1 F11668.197
M204 S6000
M73 P61 R2
G1 X101.152 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.21 Y78.496 E.10797
G1 X104.26 Y78.585 E.00258
G3 X104.59 Y79.903 I-2.575 J1.344 E.03448
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z3 F42000
G1 X104.21 Y97.21 Z3
G1 Z2.6
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.806 J-.003 E.03707
G1 X104.21 Y97.27 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.032 Y99.886 Z3 F42000
G1 X77.133 Y102.677 Z3
G1 Z2.6
G1 E.8 F1800
G1 F1362
M204 S5000
G3 X76.796 Y102.51 I1.073 J-2.592 E.00946
G1 X103.204 Y102.51 E.66395
G1 X103.115 Y102.56 E.00258
G3 X101.797 Y102.89 I-1.344 J-2.575 E.03448
G1 X78.203 Y102.89 E.59319
G3 X77.188 Y102.699 I.003 J-2.805 E.02611
; WIPE_START
G1 F11668.197
M204 S6000
M73 P62 R2
G1 X76.796 Y102.51 E-.16559
G1 X78.36 Y102.51 E-.59441
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.548 Y94.921 Z3 F42000
G1 X75.79 Y78.496 Z3
G1 Z2.6
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.425 J-1.41 E.03707
G1 X75.41 Y79.903 E.50771
G3 X75.76 Y78.548 I2.806 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.763 Y80.548 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 17/30
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
G1 X103.203 Y77.49 F42000
G1 Z2.76
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X76.796 Y77.49 E.66392
G3 X78.203 Y77.11 I1.41 J2.425 E.03707
G1 X101.889 Y77.112 E.5955
M73 P63 R2
G3 X103.151 Y77.46 I-.088 J2.781 E.03323
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.151 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.21 Y78.496 E.10797
G1 X104.26 Y78.585 E.00258
G3 X104.59 Y79.903 I-2.574 J1.344 E.03448
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z3.16 F42000
G1 X104.21 Y97.21 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.805 J-.003 E.03707
G1 X104.21 Y97.27 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.032 Y99.886 Z3.16 F42000
G1 X77.133 Y102.677 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F1362
M204 S5000
G3 X76.796 Y102.51 I1.073 J-2.592 E.00946
G1 X103.204 Y102.51 E.66395
G1 X103.116 Y102.56 E.00254
G3 X101.797 Y102.89 I-1.345 J-2.573 E.03451
M73 P64 R2
G1 X78.203 Y102.89 E.59319
G3 X77.188 Y102.699 I.003 J-2.805 E.02611
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.796 Y102.51 E-.16558
G1 X78.36 Y102.51 E-.59442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.548 Y94.921 Z3.16 F42000
G1 X75.79 Y78.496 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.425 J-1.41 E.03707
G1 X75.41 Y79.903 E.50771
G3 X75.76 Y78.548 I2.805 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.763 Y80.548 E-.76
; WIPE_END
M73 P65 R2
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

; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 18/30
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
G1 X103.203 Y77.49 F42000
G1 Z2.92
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X76.796 Y77.49 E.66391
G3 X78.203 Y77.11 I1.41 J2.425 E.03707
G1 X101.882 Y77.112 E.59533
G3 X103.151 Y77.46 I-.08 J2.776 E.03339
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.151 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.21 Y78.496 E.10797
G1 X104.26 Y78.585 E.00257
G3 X104.59 Y79.903 I-2.575 J1.344 E.03448
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z3.32 F42000
G1 X104.21 Y97.21 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.806 J-.003 E.03707
G1 X104.21 Y97.27 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
M73 P66 R2
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.032 Y99.886 Z3.32 F42000
G1 X77.133 Y102.677 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F1362
M204 S5000
G3 X76.796 Y102.51 I1.073 J-2.592 E.00946
G1 X103.204 Y102.51 E.66395
G1 X103.115 Y102.561 E.00258
G3 X101.797 Y102.89 I-1.344 J-2.574 E.03448
G1 X78.203 Y102.89 E.59319
G3 X77.188 Y102.699 I.003 J-2.805 E.0261
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.796 Y102.51 E-.16562
G1 X78.36 Y102.51 E-.59438
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.548 Y94.921 Z3.32 F42000
G1 X75.79 Y78.496 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.425 J-1.41 E.03707
G1 X75.41 Y79.903 E.50771
M73 P67 R2
G3 X75.76 Y78.548 I2.806 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.763 Y80.548 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 19/30
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
G1 X103.202 Y77.49 F42000
G1 Z3.08
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X76.796 Y77.49 E.6639
G3 X78.203 Y77.11 I1.41 J2.425 E.03707
G1 X101.875 Y77.112 E.59515
G3 X103.15 Y77.46 I-.072 J2.773 E.03356
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.15 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z3.48 F42000
M73 P68 R2
G1 Z3.08
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.21 Y78.496 E.10797
G1 X104.26 Y78.585 E.00257
G3 X104.59 Y79.903 I-2.575 J1.344 E.03448
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z3.48 F42000
G1 X104.21 Y97.21 Z3.48
G1 Z3.08
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.805 J-.003 E.03707
G1 X104.21 Y97.27 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.032 Y99.885 Z3.48 F42000
G1 X77.131 Y102.676 Z3.48
G1 Z3.08
G1 E.8 F1800
G1 F1362
M204 S5000
G3 X76.796 Y102.51 I1.074 J-2.591 E.00942
G1 X103.204 Y102.51 E.66395
G1 X103.115 Y102.56 E.00257
G3 X101.797 Y102.89 I-1.344 J-2.574 E.03448
M73 P68 R1
G1 X78.203 Y102.89 E.59319
G3 X77.187 Y102.698 I.003 J-2.805 E.02615
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.796 Y102.51 E-.16496
G1 X78.362 Y102.51 E-.59504
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.549 Y94.921 Z3.48 F42000
G1 X75.79 Y78.496 Z3.48
M73 P69 R1
G1 Z3.08
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.425 J-1.41 E.03707
G1 X75.41 Y79.903 E.50771
G3 X75.76 Y78.548 I2.805 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.763 Y80.548 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 20/30
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
G1 X103.204 Y77.49 F42000
G1 Z3.24
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X76.796 Y77.49 E.66395
G3 X78.203 Y77.11 I1.43 J2.499 E.03705
G1 X101.868 Y77.112 E.59498
G3 X103.152 Y77.46 I-.068 J2.791 E.03377
; WIPE_START
G1 F11668.197
M204 S6000
M73 P70 R1
G1 X101.152 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.21 Y78.499 E.10788
G1 X104.261 Y78.586 E.00254
G3 X104.59 Y79.903 I-2.574 J1.342 E.03443
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z3.64 F42000
G1 X104.21 Y97.21 Z3.64
G1 Z3.24
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.951 J-.042 E.03703
G1 X104.21 Y97.27 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.03 Y99.875 Z3.64 F42000
G1 X77.07 Y102.648 Z3.64
G1 Z3.24
G1 E.8 F1800
G1 F1362
M204 S5000
G3 X76.796 Y102.51 I1.156 J-2.638 E.00772
G1 X103.204 Y102.51 E.66395
G1 X103.115 Y102.561 E.00258
G3 X101.797 Y102.89 I-1.344 J-2.574 E.03447
G1 X78.203 Y102.89 E.59319
G3 X77.125 Y102.671 I.023 J-2.88 E.02782
; WIPE_START
G1 F11668.197
M204 S6000
M73 P71 R1
G1 X76.796 Y102.51 E-.13938
G1 X78.429 Y102.51 E-.62062
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.595 Y94.923 Z3.64 F42000
G1 X75.79 Y78.496 Z3.64
G1 Z3.24
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.425 J-1.41 E.03707
G1 X75.41 Y79.903 E.50771
G3 X75.76 Y78.548 I2.806 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.763 Y80.548 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 21/30
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
G1 X103.204 Y77.49 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X76.796 Y77.49 E.66395
G3 X78.203 Y77.11 I1.41 J2.425 E.03707
G1 X101.865 Y77.112 E.59489
M73 P72 R1
G3 X103.152 Y77.46 I-.065 J2.792 E.03387
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.152 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.21 Y78.498 E.10792
G1 X104.225 Y78.523 E.00074
G3 X104.59 Y79.903 I-2.438 J1.382 E.03628
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z3.8 F42000
G1 X104.21 Y97.21 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.848 J-.014 E.03706
G1 X104.21 Y97.27 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.032 Y99.885 Z3.8 F42000
G1 X77.133 Y102.677 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F1362
M204 S5000
G3 X76.796 Y102.51 I1.073 J-2.592 E.00946
G1 X103.204 Y102.51 E.66395
G1 X103.115 Y102.56 E.00257
G3 X101.797 Y102.89 I-1.344 J-2.574 E.03448
M73 P73 R1
G1 X78.203 Y102.89 E.59319
G3 X77.188 Y102.699 I.003 J-2.805 E.02611
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.796 Y102.51 E-.16554
G1 X78.36 Y102.51 E-.59446
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.548 Y94.921 Z3.8 F42000
G1 X75.79 Y78.496 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.425 J-1.41 E.03707
G1 X75.41 Y79.903 E.50771
G3 X75.76 Y78.548 I2.805 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
M73 P74 R1
G1 X75.763 Y80.548 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 22/30
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
G1 X103.204 Y77.49 F42000
G1 Z3.56
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X76.796 Y77.49 E.66395
G3 X78.203 Y77.11 I1.41 J2.425 E.03707
G1 X101.858 Y77.111 E.59471
G3 X103.152 Y77.46 I-.058 J2.792 E.03404
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.152 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.21 Y78.496 E.10797
G1 X104.261 Y78.585 E.00258
G3 X104.59 Y79.903 I-2.575 J1.344 E.03448
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
M73 P75 R1
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z3.96 F42000
G1 X104.21 Y97.21 Z3.96
G1 Z3.56
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.844 J-.013 E.03706
G1 X104.21 Y97.27 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.032 Y99.885 Z3.96 F42000
G1 X77.132 Y102.677 Z3.96
G1 Z3.56
G1 E.8 F1800
G1 F1362
M204 S5000
G3 X76.796 Y102.51 I1.073 J-2.592 E.00946
G1 X103.204 Y102.51 E.66395
G1 X103.115 Y102.56 E.00257
G3 X101.797 Y102.89 I-1.344 J-2.574 E.03448
G1 X78.203 Y102.89 E.59319
G3 X77.188 Y102.699 I.003 J-2.805 E.02611
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.796 Y102.51 E-.16552
G1 X78.36 Y102.51 E-.59448
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.548 Y94.921 Z3.96 F42000
G1 X75.79 Y78.496 Z3.96
G1 Z3.56
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.426 J-1.41 E.03707
G1 X75.41 Y79.903 E.50771
M73 P76 R1
G3 X75.76 Y78.548 I2.806 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.763 Y80.548 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 23/30
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
G1 X103.204 Y77.49 F42000
G1 Z3.72
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X76.796 Y77.49 E.66395
G3 X78.203 Y77.11 I1.41 J2.425 E.03707
G1 X101.851 Y77.111 E.59453
G3 X103.152 Y77.46 I-.051 J2.793 E.03422
; WIPE_START
G1 F11668.197
M204 S6000
M73 P77 R1
G1 X101.152 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.21 Y78.497 E.10794
G1 X104.219 Y78.511 E.00041
G3 X104.59 Y79.903 I-2.432 J1.394 E.03664
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z4.12 F42000
G1 X104.21 Y97.21 Z4.12
G1 Z3.72
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.839 J-.012 E.03706
G1 X104.21 Y97.27 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.031 Y99.878 Z4.12 F42000
G1 X77.085 Y102.657 Z4.12
G1 Z3.72
G1 E.8 F1800
G1 F1362
M204 S5000
G3 X76.796 Y102.51 I1.12 J-2.572 E.00816
G1 X103.204 Y102.51 E.66395
G1 X103.115 Y102.56 E.00257
G3 X101.797 Y102.89 I-1.344 J-2.574 E.03448
G1 X78.203 Y102.89 E.59319
G3 X77.14 Y102.68 I.003 J-2.805 E.0274
; WIPE_START
G1 F11668.197
M204 S6000
M73 P78 R1
G1 X76.796 Y102.51 E-.14602
G1 X78.411 Y102.51 E-.61398
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.583 Y94.923 Z4.12 F42000
G1 X75.79 Y78.496 Z4.12
G1 Z3.72
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.425 J-1.41 E.03707
G1 X75.41 Y79.903 E.50771
G3 X75.76 Y78.548 I2.805 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.763 Y80.548 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 24/30
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
G1 X103.204 Y77.49 F42000
G1 Z3.88
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X76.796 Y77.49 E.66395
G3 X78.203 Y77.11 I1.41 J2.425 E.03707
G1 X101.843 Y77.111 E.59436
M73 P79 R1
G3 X103.152 Y77.46 I-.045 J2.794 E.0344
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.152 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.21 Y78.496 E.10797
G1 X104.26 Y78.585 E.00257
G3 X104.59 Y79.903 I-2.574 J1.344 E.03448
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z4.28 F42000
G1 X104.21 Y97.21 Z4.28
G1 Z3.88
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.835 J-.011 E.03706
G1 X104.21 Y97.27 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.031 Y99.879 Z4.28 F42000
G1 X77.092 Y102.659 Z4.28
G1 Z3.88
G1 E.8 F1800
G1 F1362
M204 S5000
G3 X76.796 Y102.51 I1.114 J-2.575 E.00834
G1 X103.204 Y102.51 E.66395
G1 X103.115 Y102.56 E.00257
G3 X101.797 Y102.89 I-1.344 J-2.574 E.03448
M73 P80 R1
G1 X78.203 Y102.89 E.59319
G3 X77.147 Y102.683 I.003 J-2.806 E.02723
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.796 Y102.51 E-.14864
G1 X78.405 Y102.51 E-.61136
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.578 Y94.922 Z4.28 F42000
G1 X75.79 Y78.496 Z4.28
G1 Z3.88
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.425 J-1.41 E.03707
G1 X75.41 Y79.903 E.50771
G3 X75.76 Y78.548 I2.805 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
M73 P81 R1
G1 X75.763 Y80.548 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 25/30
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
G1 X103.204 Y77.49 F42000
G1 Z4.04
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X76.796 Y77.49 E.66395
G3 X78.203 Y77.11 I1.41 J2.425 E.03707
G1 X101.836 Y77.111 E.59418
G3 X103.152 Y77.46 I-.038 J2.795 E.03457
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.152 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.212 Y78.499 E.10788
G3 X104.59 Y79.903 I-2.426 J1.406 E.03698
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.243 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.228 Y88.423 Z4.44 F42000
G1 X104.21 Y97.21 Z4.44
G1 Z4.04
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.805 J-.003 E.03707
G1 X104.21 Y97.27 E.10646
; WIPE_START
M73 P82 R1
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.031 Y99.88 Z4.44 F42000
G1 X77.098 Y102.662 Z4.44
G1 Z4.04
G1 E.8 F1800
G1 F1362
M204 S5000
G3 X76.796 Y102.51 I1.108 J-2.578 E.00851
G1 X103.204 Y102.51 E.66395
G1 X103.115 Y102.56 E.00258
G3 X101.797 Y102.89 I-1.344 J-2.575 E.03448
G1 X78.203 Y102.89 E.59319
G3 X77.153 Y102.685 I.003 J-2.806 E.02706
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.796 Y102.51 E-.15127
G1 X78.398 Y102.51 E-.60873
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.574 Y94.922 Z4.44 F42000
G1 X75.79 Y78.496 Z4.44
G1 Z4.04
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X75.79 Y101.504 E.57846
G1 X75.788 Y101.501 E.00009
G3 X75.41 Y100.097 I2.426 J-1.406 E.03698
M73 P83 R1
G1 X75.41 Y79.903 E.50771
G3 X75.76 Y78.548 I2.805 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.763 Y80.548 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 26/30
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
G1 X98.361 Y102.1 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X98.361 Y101.911 E.00513
G1 X98.639 Y101.911 E.00755
G1 X98.639 Y102.1 E.00513
M106 S201.45
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X98.639 Y102.483 E.01036
M106 S201.45
G1 F623.509
G1 X98.639 Y102.489 E.00019
G1 F1182.642
G1 X98.361 Y102.483 E.00755
M106 S255
G1 F600
G1 X98.361 Y102.16 E.00874
M106 S201.45
; WIPE_START
G1 X98.361 Y101.911 E-.11094
G1 X98.639 Y101.911 E-.12401
G1 X98.639 Y102.1 E-.08425
G1 X98.639 Y102.483 E-.1702
G1 X98.639 Y102.489 E-.00305
G1 X98.361 Y102.483 E-.12405
G1 X98.361 Y102.16 E-.1435
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I.004 J-1.217 P1  F42000
G1 X79.639 Y102.1 Z4.6
G1 Z4.2
G1 E.8 F1800
M106 S255
G1 F600
M204 S6000
G1 X79.639 Y102.483 E.01036
M106 S201.45
G1 F623.509
G1 X79.639 Y102.489 E.00019
G1 F1182.642
G1 X79.361 Y102.483 E.00755
M106 S255
G1 F600
G1 X79.361 Y102.1 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X79.361 Y101.911 E.00513
G1 X79.639 Y101.911 E.00755
G1 X79.639 Y102.04 E.0035
M106 S201.45
; WIPE_START
M204 S6000
G1 X79.639 Y102.483 E-.1969
G1 X79.639 Y102.489 E-.00305
G1 X79.361 Y102.483 E-.12405
G1 X79.361 Y102.1 E-.1702
G1 X79.361 Y101.911 E-.08425
G1 X79.639 Y101.911 E-.12401
G1 X79.639 Y102.04 E-.05755
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I-.028 J1.217 P1  F42000
G1 X97.96 Y102.469 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
M204 S5000
G1 X97.96 Y102.1 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X97.96 Y101.51 E.01599
G1 X99.04 Y101.51 E.02927
G1 X99.04 Y102.1 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X99.04 Y102.469 E.00928
M106 S201.45
G1 F747.227
G1 X99.04 Y102.51 E.00103
G1 F2126
G1 X99.44 Y102.51 E.01006
G1 X99.84 Y102.51 E.01006
G1 X100.24 Y102.51 E.01006
G1 X103.204 Y102.51 E.07453
G3 X101.797 Y102.89 I-1.41 J-2.425 E.03707
G1 X78.203 Y102.89 E.59319
G3 X76.794 Y102.509 I.003 J-2.806 E.03711
G1 X77.76 Y102.51 E.02428
M73 P84 R1
G1 X78.16 Y102.51 E.01006
G1 X78.56 Y102.51 E.01006
G1 X78.96 Y102.51 E.01006
G1 F747.53
G1 X78.96 Y102.469 E.00103
M106 S255
G1 F600
G1 X78.96 Y102.1 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X78.96 Y101.51 E.01599
G1 X80.04 Y101.51 E.02927
G1 X80.04 Y102.1 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X80.04 Y102.469 E.00928
M106 S201.45
G1 F747.227
G1 X80.04 Y102.51 E.00103
G1 F2126
G1 X80.44 Y102.51 E.01006
G1 X80.84 Y102.51 E.01006
G1 X81.24 Y102.51 E.01006
G1 X97.941 Y102.51 E.41989
; WIPE_START
G1 F11668.197
M204 S6000
G1 X97.96 Y102.1 E-.15597
G1 X97.96 Y101.51 E-.2242
G1 X98.96 Y101.51 E-.37983
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I.771 J.942 P1  F42000
G1 X104.21 Y97.21 Z4.6
G1 Z4.2
M73 P84 R0
G1 E.8 F1800
G1 F2126
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.806 J-.003 E.03707
G1 X104.21 Y97.27 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.249 Y91.2 Z4.6 F42000
G1 X103.8 Y81.139 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X103.411 Y81.139 E.01055
G1 X103.411 Y80.861 E.00755
G1 X103.8 Y80.861 E.01055
M106 S201.45
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X104.183 Y80.861 E.01036
M106 S201.45
G1 F1182.642
G1 X104.189 Y81.139 E.00755
G1 F623.509
G1 X104.183 Y81.139 E.00019
M106 S255
G1 F600
G1 X103.86 Y81.139 E.00874
M106 S201.45
M204 S250
G1 X104.169 Y81.54 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
M204 S5000
G1 X103.8 Y81.54 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X103.01 Y81.54 E.02141
G1 X103.01 Y80.46 E.02927
G1 X103.8 Y80.46 E.02141
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X104.169 Y80.46 E.00928
M106 S201.45
G1 F747.227
G1 X104.21 Y80.46 E.00103
G1 F2126
G1 X104.21 Y80.06 E.01006
G1 X104.21 Y79.66 E.01006
G1 X104.21 Y79.26 E.01006
G1 X104.21 Y78.496 E.01922
G1 X104.26 Y78.585 E.00258
G3 X104.59 Y79.903 I-2.574 J1.344 E.03448
G1 X104.59 Y82.79 E.07259
G1 X104.21 Y82.79 E.00955
G1 X104.21 Y81.559 E.03095
; WIPE_START
G1 F11668.197
M204 S6000
G1 X103.8 Y81.54 E-.15597
G1 X103.01 Y81.54 E-.3002
G1 X103.01 Y80.74 E-.30383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I.207 J-1.199 P1  F42000
G1 X84.361 Y77.518 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1918.712
M204 S6000
G1 X84.639 Y77.518 E.00755
M106 S255
G1 F600
G1 X84.639 Y77.9 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X84.639 Y78.089 E.00513
M106 S201.45
M106 S255
G1 F600
G1 X84.361 Y78.089 E.00755
G1 X84.361 Y77.9 E.00513
M106 S201.45
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X84.361 Y77.578 E.00874
M106 S201.45
M204 S250
G1 X83.96 Y77.531 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2126
M204 S5000
G1 X83.96 Y77.49 E.00103
G1 X76.794 Y77.491 E.18016
G3 X78.203 Y77.11 I1.411 J2.425 E.03711
G1 X101.829 Y77.111 E.594
G3 X103.204 Y77.49 I-.032 J2.797 E.03626
G1 X86.24 Y77.49 E.42651
M73 P85 R0
G1 X85.84 Y77.49 E.01006
G1 X85.44 Y77.49 E.01006
G1 X85.04 Y77.49 E.01006
G1 F747.227
G1 X85.04 Y77.531 E.00103
M106 S255
G1 F600
G1 X85.04 Y77.9 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X85.04 Y78.49 E.01599
G1 X83.96 Y78.49 E.02927
G1 X83.96 Y77.9 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X83.96 Y77.591 E.00777
M106 S201.45
; WIPE_START
M204 S6000
G1 X83.96 Y77.49 E-.03839
G1 X82.061 Y77.49 E-.72161
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.79 Y78.496 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F2126
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.425 J-1.41 E.03707
G1 X75.41 Y79.903 E.50771
G3 X75.76 Y78.548 I2.805 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.763 Y80.548 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 27/30
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
G1 X80.04 Y102.51 F42000
G1 Z4.36
G1 E.8 F1800
G1 F1574
M204 S5000
G1 X97.96 Y102.51 E.45053
G1 X97.96 Y101.51 E.02514
G1 X99.04 Y101.51 E.02715
G1 X99.04 Y102.51 E.02514
G1 X103.204 Y102.51 E.1047
G3 X101.797 Y102.89 I-1.41 J-2.425 E.03707
G1 X78.203 Y102.89 E.59319
M73 P86 R0
G3 X76.794 Y102.509 I.003 J-2.806 E.03711
G1 X78.96 Y102.51 E.05445
G1 X78.96 Y101.51 E.02514
G1 X80.04 Y101.51 E.02715
G1 X80.04 Y102.45 E.02363
; WIPE_START
G1 F11668.197
M204 S6000
G1 X82.04 Y102.457 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.76 I1.178 J-.307 P1  F42000
G1 X75.79 Y78.496 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F1574
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.425 J-1.41 E.03707
G1 X75.41 Y79.903 E.50771
G3 X75.76 Y78.548 I2.805 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.763 Y80.548 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.349 Y84.405 Z4.76 F42000
G1 X104.21 Y97.21 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F1574
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.8 J-.002 E.03706
G1 X104.21 Y97.27 E.10644
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
M73 P87 R0
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.422 Y91.195 Z4.76 F42000
G1 X104.21 Y81.54 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F1574
M204 S5000
G1 X103.01 Y81.54 E.03017
G1 X103.01 Y80.46 E.02715
G1 X104.21 Y80.46 E.03017
G1 X104.21 Y78.496 E.04939
G1 X104.26 Y78.585 E.00257
G3 X104.59 Y79.903 I-2.575 J1.344 E.03448
G1 X104.59 Y82.79 E.07259
G1 X104.21 Y82.79 E.00955
G1 X104.21 Y81.6 E.02992
; WIPE_START
G1 F11668.197
M204 S6000
G1 X103.01 Y81.54 E-.45657
G1 X103.01 Y80.742 E-.30343
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.76 I.205 J-1.2 P1  F42000
G1 X83.96 Y77.49 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F1574
M204 S5000
G1 X76.794 Y77.491 E.18016
G3 X78.203 Y77.11 I1.411 J2.425 E.03711
G1 X101.822 Y77.111 E.59383
G3 X103.204 Y77.49 I-.025 J2.798 E.03643
G1 X85.04 Y77.49 E.45668
G1 X85.04 Y78.49 E.02514
G1 X83.96 Y78.49 E.02715
G1 X83.96 Y77.55 E.02363
; WIPE_START
G1 F11668.197
M204 S6000
G1 X81.96 Y77.533 E-.76
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

G1 X84.172 Y77.355
G1 Z4.36
G1 E.8 F1800
; FEATURE: Top surface
G1 F1574
M204 S2000
G1 X84.828 Y78.01 E.02332
G1 X84.55 Y78.278
G1 X84.172 Y77.9 E.01344
; WIPE_START
G1 F11668.197
M204 S6000
G1 X84.55 Y78.278 E-.21983
G1 X84.828 Y78.01 E-.15867
G1 X84.172 Y77.355 E-.3815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.76 I-.202 J1.2 P1  F42000
G1 X103.852 Y80.672 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F1574
M204 S2000
G1 X104.378 Y81.198 E.01871
G1 X103.962 Y81.328
G1 X103.306 Y80.672 E.02332
; WIPE_START
G1 F11668.197
M204 S6000
M73 P88 R0
G1 X103.962 Y81.328 E-.35243
G1 X104.378 Y81.198 E-.16549
G1 X103.927 Y80.748 E-.24209
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.76 I-1.174 J-.322 P1  F42000
G1 X98.177 Y101.722 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F1574
M204 S2000
G1 X98.828 Y102.373 E.02315
G1 X98.587 Y102.678
G1 X98.172 Y102.263 E.01476
; WIPE_START
G1 F11668.197
M204 S6000
G1 X98.587 Y102.678 E-.23534
G1 X98.828 Y102.373 E-.15564
G1 X98.177 Y101.722 E-.36901
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.545 Y101.756 Z4.76 F42000
G1 X79.172 Y101.807 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F1574
M204 S2000
G1 X79.828 Y102.462 E.02332
M204 S10000
G1 X79.847 Y102.592 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.15265
G1 F1574
M204 S6000
G1 X79.732 Y102.64 E.00096
G1 X79.153 Y102.64 E.00447
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X79.732 Y102.64 E-.62569
G1 X79.847 Y102.592 E-.13431
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/30
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.76 I.891 J.829 P1  F42000
G1 X103.204 Y77.49 Z4.76
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1369
M204 S5000
G1 X76.796 Y77.49 E.66395
G3 X78.203 Y77.11 I1.41 J2.425 E.03707
G1 X101.815 Y77.11 E.59365
G3 X103.152 Y77.46 I-.019 J2.799 E.03511
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.152 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.92 I-1.055 J.606 P1  F42000
G1 X104.21 Y82.79 Z4.92
G1 Z4.52
G1 E.8 F1800
G1 F1369
M204 S5000
G1 X104.21 Y78.496 E.10797
G1 X104.26 Y78.585 E.00258
G3 X104.59 Y79.903 I-2.575 J1.344 E.03448
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
M73 P89 R0
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z4.92 F42000
G1 X104.21 Y97.21 Z4.92
G1 Z4.52
G1 E.8 F1800
G1 F1369
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.802 J-.002 E.03706
G1 X104.21 Y97.27 E.10645
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.024 Y99.828 Z4.92 F42000
M73 P90 R0
G1 X76.796 Y102.51 Z4.92
G1 Z4.52
G1 E.8 F1800
G1 F1369
M204 S5000
G1 X103.204 Y102.51 E.66395
G1 X103.115 Y102.56 E.00257
G3 X101.797 Y102.89 I-1.344 J-2.574 E.03448
G1 X78.203 Y102.89 E.59319
G3 X76.848 Y102.54 I.003 J-2.805 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X78.848 Y102.537 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.885 Y94.966 Z4.92 F42000
G1 X75.79 Y78.496 Z4.92
G1 Z4.52
G1 E.8 F1800
G1 F1369
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.425 J-1.41 E.03707
G1 X75.41 Y79.903 E.50771
M73 P91 R0
G3 X75.76 Y78.548 I2.805 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.763 Y80.548 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 29/30
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
G1 X103.204 Y77.49 F42000
G1 Z4.68
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X76.796 Y77.49 E.66395
G3 X78.203 Y77.11 I1.41 J2.425 E.03707
G1 X101.808 Y77.11 E.59347
G3 X103.152 Y77.46 I-.012 J2.802 E.03528
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.152 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.21 Y78.496 E.10797
M73 P92 R0
G1 X104.261 Y78.585 E.00258
G3 X104.59 Y79.903 I-2.574 J1.344 E.03448
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z5.08 F42000
G1 X104.21 Y97.21 Z5.08
G1 Z4.68
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.805 J-.003 E.03707
G1 X104.21 Y97.27 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.024 Y99.828 Z5.08 F42000
G1 X76.796 Y102.51 Z5.08
G1 Z4.68
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X103.204 Y102.51 E.66395
G3 X101.797 Y102.89 I-1.41 J-2.425 E.03707
G1 X78.203 Y102.89 E.59319
G3 X76.848 Y102.54 I.003 J-2.805 E.03557
; WIPE_START
G1 F11668.197
M204 S6000
G1 X78.848 Y102.537 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.885 Y94.966 Z5.08 F42000
G1 X75.79 Y78.496 Z5.08
G1 Z4.68
G1 E.8 F1800
M73 P93 R0
G1 F1362
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.425 J-1.41 E.03707
G1 X75.41 Y79.903 E.50771
G3 X75.76 Y78.548 I2.805 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.763 Y80.548 E-.76
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

; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 30/30
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
G1 X103.204 Y77.49 F42000
G1 Z4.84
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X76.796 Y77.49 E.66395
G3 X78.203 Y77.11 I1.41 J2.425 E.03707
G1 X101.801 Y77.11 E.5933
G3 X103.152 Y77.46 I-.006 J2.804 E.03546
; WIPE_START
G1 F11668.197
M204 S6000
M73 P94 R0
G1 X101.152 Y77.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.21 Y82.79 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.21 Y78.496 E.10797
G1 X104.26 Y78.585 E.00257
G3 X104.59 Y79.903 I-2.574 J1.344 E.03448
G1 X104.59 Y82.79 E.07259
G1 X104.27 Y82.79 E.00805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.242 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.227 Y88.423 Z5.24 F42000
G1 X104.21 Y97.21 Z5.24
G1 Z4.84
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X104.59 Y97.21 E.00955
G1 X104.59 Y100.097 E.07259
G3 X104.21 Y101.504 I-2.808 J-.003 E.03707
G1 X104.21 Y97.27 E.10646
; WIPE_START
G1 F11668.197
M204 S6000
G1 X104.59 Y97.21 E-.14619
G1 X104.59 Y98.825 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.024 Y99.828 Z5.24 F42000
G1 X76.796 Y102.51 Z5.24
G1 Z4.84
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X103.204 Y102.51 E.66395
G1 X103.115 Y102.561 E.00258
G3 X101.797 Y102.89 I-1.344 J-2.574 E.03447
G1 X78.203 Y102.89 E.5932
G3 X76.848 Y102.54 I.003 J-2.805 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
M73 P95 R0
G1 X78.848 Y102.537 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.885 Y94.966 Z5.24 F42000
G1 X75.79 Y78.496 Z5.24
G1 Z4.84
G1 E.8 F1800
G1 F1362
M204 S5000
G1 X75.79 Y101.504 E.57847
G3 X75.41 Y100.097 I2.425 J-1.41 E.03707
G1 X75.41 Y79.903 E.50771
G3 X75.76 Y78.548 I2.805 J.003 E.03556
; WIPE_START
G1 F11668.197
M204 S6000
G1 X75.763 Y80.548 E-.76
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


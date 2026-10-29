; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 5m 35s; total estimated time: 5m 54s
; total layer number: 30
; total filament length [mm] : 413.71
; total filament volume [cm^3] : 995.10
; total filament weight [g] : 1.23
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
M73 P0 R5
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
M73 P2 R5
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
G1 X87.668 Y96.237 F42000
M204 S6000
M73 P5 R5
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X87.712 Y96.227 E.0017
G1 X87.842 Y96.217 E.00486
G3 X87.459 Y96.285 I.033 J1.307 E.29135
G1 X87.609 Y96.251 E.00575
M204 S6000
G1 X87.769 Y96.681 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X87.854 Y96.675 E.00316
G3 X87.71 Y96.691 I.021 J.85 E.19347
; WIPE_START
G1 X87.854 Y96.675 E-.05503
G1 X88.023 Y96.688 E-.06433
G1 X88.186 Y96.733 E-.06433
G1 X88.336 Y96.811 E-.06434
G1 X88.469 Y96.916 E-.06434
G1 X88.578 Y97.046 E-.06439
G1 X88.659 Y97.195 E-.06435
G1 X88.708 Y97.356 E-.06425
G1 X88.725 Y97.525 E-.06451
G1 X88.708 Y97.694 E-.06431
G1 X88.659 Y97.855 E-.0643
G1 X88.581 Y97.997 E-.06152
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X85.158 Y91.176 Z.6 F42000
G1 X77.784 Y76.48 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G3 X78.418 Y76.043 I.628 J.232 E.03054
G1 X101.626 Y76.044 E.86442
G3 X102.256 Y76.668 I-.035 J.665 E.03613
G1 X102.257 Y103.284 E.99135
G3 X101.583 Y103.957 I-.669 J.004 E.03952
G1 X78.416 Y103.957 E.86286
G3 X77.743 Y103.282 I-.011 J-.663 E.03964
G1 X77.743 Y76.716 E.98949
M73 P6 R5
G3 X77.766 Y76.537 I.669 J-.004 E.00676
M204 S6000
G1 X77.357 Y76.313 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X77.451 Y76.128 E.00773
G3 X78.406 Y75.586 I.965 J.589 E.04273
G1 X101.64 Y75.587 E.86538
G3 X102.713 Y76.645 I-.055 J1.128 E.06145
G1 X102.714 Y103.294 E.99257
G3 X101.594 Y104.414 I-1.131 J-.011 E.0654
G1 X78.406 Y104.414 E.86366
G3 X77.286 Y103.294 I.002 J-1.122 E.06553
G1 X77.286 Y76.706 E.99029
G3 X77.34 Y76.37 I1.131 J.01 E.01273
; WIPE_START
G1 X77.451 Y76.128 E-.10123
G1 X77.611 Y75.913 E-.10188
G1 X77.783 Y75.772 E-.08436
G1 X78.025 Y75.651 E-.10273
G1 X78.196 Y75.605 E-.06754
G1 X78.406 Y75.586 E-.08014
G1 X78.991 Y75.586 E-.22213
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

G1 X100.856 Y76.227
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50117
M73 P7 R5
G1 F6300
M204 S500
G1 X101.867 Y77.238 E.05343
G1 X101.867 Y77.886 E.0242
G1 X100.413 Y76.432 E.07679
G1 X99.765 Y76.432 E.0242
G1 X101.867 Y78.535 E.11102
G1 X101.867 Y79.183 E.0242
G1 X99.117 Y76.432 E.14525
G1 X98.469 Y76.432 E.0242
G1 X101.867 Y79.831 E.17947
G1 X101.867 Y80.479 E.0242
G1 X97.821 Y76.432 E.2137
G1 X97.173 Y76.432 E.0242
G1 X101.867 Y81.127 E.24793
G1 X101.868 Y81.775 E.0242
G1 X96.525 Y76.432 E.28216
G1 X95.876 Y76.432 E.0242
G1 X101.868 Y82.423 E.31638
G1 X101.868 Y83.071 E.0242
G1 X95.228 Y76.432 E.35061
G1 X94.58 Y76.432 E.0242
G1 X101.868 Y83.719 E.38484
G1 X101.868 Y84.367 E.0242
G1 X93.932 Y76.432 E.41907
G1 X93.284 Y76.432 E.0242
G1 X101.868 Y85.016 E.45329
G1 X101.868 Y85.664 E.0242
G1 X92.636 Y76.432 E.48752
G1 X91.988 Y76.432 E.0242
G1 X101.868 Y86.312 E.52175
G1 X101.868 Y86.96 E.0242
G1 X91.34 Y76.432 E.55598
M73 P8 R5
G1 X90.692 Y76.432 E.0242
G1 X101.868 Y87.608 E.5902
G1 X101.868 Y88.256 E.0242
G1 X90.044 Y76.432 E.62443
G1 X89.395 Y76.432 E.0242
G1 X101.868 Y88.904 E.65866
G1 X101.868 Y89.552 E.0242
G1 X88.747 Y76.432 E.69289
G1 X88.099 Y76.432 E.0242
G1 X101.868 Y90.2 E.72711
G1 X101.868 Y90.848 E.0242
G1 X87.451 Y76.432 E.76134
G1 X86.803 Y76.432 E.0242
G1 X101.868 Y91.497 E.79557
G1 X101.868 Y92.145 E.0242
G1 X86.155 Y76.432 E.82979
G1 X85.507 Y76.432 E.0242
G1 X101.868 Y92.793 E.86402
M73 P9 R5
G1 X101.868 Y93.441 E.0242
G1 X84.859 Y76.431 E.89825
G1 X84.211 Y76.431 E.0242
G1 X101.868 Y94.089 E.93248
G1 X101.868 Y94.737 E.0242
G1 X83.563 Y76.431 E.9667
G1 X82.915 Y76.431 E.0242
G1 X101.868 Y95.385 E1.00093
G1 X101.868 Y96.033 E.0242
G1 X82.266 Y76.431 E1.03516
G1 X81.618 Y76.431 E.0242
G1 X101.868 Y96.681 E1.06939
G1 X101.868 Y97.33 E.0242
G1 X80.97 Y76.431 E1.10361
M73 P10 R5
G1 X80.322 Y76.431 E.0242
G1 X101.869 Y97.978 E1.13784
G1 X101.869 Y98.626 E.0242
G1 X79.674 Y76.431 E1.17207
G1 X79.026 Y76.431 E.0242
G1 X101.869 Y99.274 E1.2063
G1 X101.869 Y99.922 E.0242
G1 X78.384 Y76.437 E1.2402
G2 X78.131 Y76.748 I.031 J.283 E.01659
G1 X78.131 Y76.833 E.00315
G1 X101.869 Y100.57 E1.25355
G1 X101.869 Y101.218 E.0242
G1 X78.131 Y77.481 E1.25356
G1 X78.131 Y78.129 E.0242
G1 X101.869 Y101.866 E1.25356
M73 P11 R5
G1 X101.869 Y102.514 E.0242
G1 X78.131 Y78.777 E1.25356
G1 X78.131 Y79.425 E.0242
G1 X101.869 Y103.162 E1.25356
G3 X101.764 Y103.509 I-.476 J.045 E.01385
G3 X101.62 Y103.562 I-.153 J-.192 E.00582
G1 X78.131 Y80.073 E1.24043
G1 X78.131 Y80.721 E.0242
G1 X100.979 Y103.569 E1.20658
G1 X100.331 Y103.569 E.0242
G1 X78.131 Y81.369 E1.17235
G1 X78.131 Y82.017 E.0242
G1 X99.683 Y103.569 E1.13813
G1 X99.035 Y103.569 E.0242
G1 X78.131 Y82.665 E1.10391
M73 P12 R5
G1 X78.131 Y83.313 E.0242
G1 X98.387 Y103.569 E1.06968
G1 X97.739 Y103.569 E.0242
G1 X78.131 Y83.961 E1.03546
G1 X78.131 Y84.609 E.0242
G1 X97.091 Y103.569 E1.00124
G1 X96.443 Y103.569 E.0242
G1 X78.131 Y85.257 E.96701
G1 X78.131 Y85.905 E.0242
G1 X88.069 Y95.843 E.5248
G3 X89.561 Y97.335 I-.207 J1.699 E.08488
G1 X95.795 Y103.569 E.3292
G1 X95.147 Y103.569 E.0242
G1 X89.516 Y97.938 E.29736
G1 X89.498 Y98.026 E.00335
G3 X89.328 Y98.398 I-1.321 J-.379 E.01534
M73 P13 R5
G1 X94.498 Y103.569 E.27306
G1 X93.85 Y103.569 E.0242
G1 X89.038 Y98.756 E.25416
G1 X88.724 Y98.996 E.01474
G1 X88.659 Y99.025 E.00267
G1 X93.202 Y103.569 E.23994
G1 X92.554 Y103.569 E.0242
G1 X87.992 Y99.007 E.24092
; WIPE_START
G1 X89.406 Y100.421 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X87.635 Y96.057 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X78.131 Y86.553 E.50189
G1 X78.131 Y87.202 E.0242
G1 X87.002 Y96.072 E.46844
G2 X86.645 Y96.364 I.833 J1.381 E.01726
G1 X78.131 Y87.85 E.44962
G1 X78.131 Y88.498 E.0242
G1 X86.372 Y96.739 E.43521
G2 X86.211 Y97.226 I1.124 J.642 E.01928
G1 X78.131 Y89.146 E.42671
G1 X78.131 Y89.794 E.0242
G1 X86.224 Y97.887 E.42737
G2 X87.515 Y99.178 I1.655 J-.364 E.07199
G1 X91.906 Y103.569 E.2319
G1 X91.258 Y103.569 E.0242
G1 X78.131 Y90.442 E.69322
G1 X78.131 Y91.09 E.0242
G1 X90.61 Y103.569 E.659
M73 P14 R5
G1 X89.962 Y103.569 E.0242
G1 X78.131 Y91.738 E.62478
G1 X78.131 Y92.386 E.0242
G1 X89.314 Y103.569 E.59055
G1 X88.666 Y103.569 E.0242
G1 X78.131 Y93.034 E.55633
G1 X78.131 Y93.682 E.0242
G1 X88.018 Y103.569 E.52211
G1 X87.37 Y103.569 E.0242
G1 X78.131 Y94.33 E.48788
G1 X78.131 Y94.978 E.0242
G1 X86.722 Y103.569 E.45366
G1 X86.074 Y103.569 E.0242
G1 X78.131 Y95.626 E.41944
G1 X78.131 Y96.274 E.0242
G1 X85.426 Y103.569 E.38521
G1 X84.778 Y103.569 E.0242
G1 X78.131 Y96.922 E.35099
G1 X78.131 Y97.571 E.0242
G1 X84.129 Y103.569 E.31677
M73 P15 R5
G1 X83.481 Y103.569 E.0242
G1 X78.131 Y98.219 E.28254
G1 X78.131 Y98.867 E.0242
G1 X82.833 Y103.569 E.24832
G1 X82.185 Y103.569 E.0242
G1 X78.131 Y99.515 E.21409
G1 X78.131 Y100.163 E.0242
G1 X81.537 Y103.569 E.17987
G1 X80.889 Y103.569 E.0242
G1 X78.131 Y100.811 E.14565
G1 X78.131 Y101.459 E.0242
G1 X80.241 Y103.569 E.11142
G1 X79.593 Y103.569 E.0242
M73 P15 R4
G1 X78.131 Y102.107 E.0772
G1 X78.131 Y102.755 E.0242
G1 X78.945 Y103.569 E.04298
G1 X78.448 Y103.569 E.01855
G3 X78.231 Y103.502 I-.016 J-.338 E.00866
G1 X77.925 Y103.197 E.01611
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6300
G1 X78.231 Y103.502 E-.16394
G1 X78.309 Y103.546 E-.0339
G1 X78.448 Y103.569 E-.05375
G1 X78.945 Y103.569 E-.18881
G1 X78.35 Y102.974 E-.31959
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
G3 Z.6 I.599 J1.06 P1  F42000
G1 X88.954 Y96.983 Z.6
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X89.032 Y97.168 E.00546
G3 X87.725 Y96.323 I-1.157 J.356 E.16029
G1 X87.845 Y96.314 E.00327
G3 X88.929 Y96.928 I.03 J1.21 E.03547
M204 S250
G1 X88.586 Y97.138 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X87.774 Y96.721 I-.711 J.387 E.10354
G1 X87.855 Y96.715 E.00203
G3 X88.556 Y97.086 I.02 J.809 E.02084
; WIPE_START
M204 S6000
G1 X88.649 Y97.286 E-.08401
G1 X88.681 Y97.444 E-.06105
G1 X88.66 Y97.725 E-.10716
G1 X88.605 Y97.876 E-.06123
G1 X88.521 Y98.014 E-.06137
G1 X88.411 Y98.132 E-.06126
G1 X88.28 Y98.227 E-.06134
G1 X88.133 Y98.293 E-.06133
G1 X87.976 Y98.329 E-.06138
G1 X87.814 Y98.333 E-.06121
G1 X87.656 Y98.305 E-.0613
G1 X87.613 Y98.288 E-.01735
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.435 Y91.349 Z.76 F42000
G1 X77.589 Y76.398 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X77.617 Y76.324 E.00215
G3 X78.415 Y75.829 I.789 J.382 E.02687
G1 X101.637 Y75.831 E.62925
G3 X102.469 Y76.657 I-.049 J.881 E.03476
G1 X102.471 Y103.292 E.72172
G3 X101.585 Y104.171 I-.877 J.002 E.03763
G1 X78.408 Y104.171 E.62802
G3 X77.529 Y103.285 I-.002 J-.877 E.03763
G1 X77.529 Y76.708 E.72015
G3 X77.556 Y76.489 I.877 J-.002 E.006
G1 X77.569 Y76.455 E.00098
M204 S250
G1 X77.214 Y76.248 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2340
M204 S5000
G1 X77.284 Y76.091 E.00433
M73 P16 R4
G1 F2520
G1 X77.343 Y75.994 E.00285
G1 F2340
G3 X77.456 Y75.848 I1.047 J.697 E.00465
G1 F2520
G3 X77.747 Y75.61 I1.09 J1.031 E.00946
G1 F2340
G3 X78.029 Y75.484 I.767 J1.344 E.00778
G1 F2520
G3 X78.276 Y75.435 I.384 J1.285 E.00635
G1 F2340
G3 X79.005 Y75.429 I.429 J7.415 E.01834
G1 X101.651 Y75.43 E.56933
G3 X102.87 Y76.638 I-.067 J1.287 E.04721
G1 X102.871 Y102.697 E.65517
G3 X102.87 Y103.36 I-13.547 J.301 E.01666
G1 F2520
G1 X102.857 Y103.487 E.0032
G1 F2340
G3 X102.722 Y103.898 I-1.805 J-.366 E.01091
G1 F2520
G3 X102.581 Y104.109 I-1.14 J-.609 E.00639
G1 F2340
G1 X102.544 Y104.152 E.00145
G1 F2520
G3 X102.254 Y104.39 I-1.089 J-1.03 E.00946
G1 F2340
G3 X101.971 Y104.516 I-.767 J-1.345 E.00778
G1 F2520
G3 X101.724 Y104.565 I-.384 J-1.284 E.00635
G1 F2340
G3 X100.995 Y104.572 I-.429 J-7.426 E.01835
G1 X79.003 Y104.572 E.5529
G3 X78.34 Y104.57 I-.3 J-13.584 E.01666
G1 F2520
G1 X78.214 Y104.557 E.0032
G1 F2340
G3 X77.802 Y104.422 I.366 J-1.804 E.01091
G1 F2520
G3 X77.591 Y104.281 I.61 J-1.141 E.00638
G1 F2340
G1 X77.548 Y104.244 E.00145
G1 F2520
G3 X77.379 Y104.057 I.906 J-.991 E.00635
G1 F2340
G3 X77.129 Y103.295 I1.053 J-.768 E.0205
G1 X77.129 Y77.303 E.65347
G3 X77.13 Y76.64 I13.584 J-.3 E.01666
G1 F2520
G1 X77.143 Y76.514 E.0032
G1 F2340
G3 X77.198 Y76.306 I1.805 J.371 E.00541
; WIPE_START
M204 S6000
G1 X77.284 Y76.091 E-.08792
G1 X77.343 Y75.994 E-.04311
G1 X77.456 Y75.848 E-.07026
G1 X77.643 Y75.679 E-.09582
G1 X77.747 Y75.61 E-.04715
G1 X78.029 Y75.484 E-.11739
G1 X78.276 Y75.435 E-.0958
G1 X78.809 Y75.43 E-.20254
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

G1 X78.906 Y75.996
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420136
G1 F11664.075
M204 S6000
G1 X77.87 Y77.033 E.03687
G1 X77.87 Y77.578 E.01372
G1 X79.278 Y76.17 E.0501
G1 X79.824 Y76.17 E.01372
G1 X77.87 Y78.124 E.06951
G1 X77.87 Y78.67 E.01372
G1 X80.369 Y76.17 E.08891
G1 X80.915 Y76.17 E.01372
G1 X77.87 Y79.215 E.10832
G1 X77.87 Y79.761 E.01372
G1 X81.461 Y76.17 E.12772
G1 X82.006 Y76.17 E.01372
G1 X77.87 Y80.306 E.14713
G1 X77.87 Y80.852 E.01372
G1 X82.552 Y76.17 E.16653
G1 X83.097 Y76.17 E.01372
G1 X77.87 Y81.398 E.18594
G1 X77.87 Y81.943 E.01372
G1 X83.643 Y76.17 E.20534
M73 P17 R4
G1 X84.188 Y76.17 E.01372
G1 X77.87 Y82.489 E.22475
G1 X77.87 Y83.034 E.01372
G1 X84.734 Y76.17 E.24415
G1 X85.28 Y76.17 E.01372
G1 X77.87 Y83.58 E.26355
G1 X77.87 Y84.126 E.01372
G1 X85.825 Y76.17 E.28296
G1 X86.371 Y76.17 E.01372
G1 X77.87 Y84.671 E.30236
G1 X77.87 Y85.217 E.01372
G1 X86.916 Y76.17 E.32177
G1 X87.462 Y76.17 E.01372
G1 X77.87 Y85.762 E.34117
G1 X77.87 Y86.308 E.01372
G1 X88.007 Y76.17 E.36058
G1 X88.553 Y76.17 E.01372
G1 X77.87 Y86.854 E.37998
G1 X77.87 Y87.399 E.01372
G1 X89.099 Y76.17 E.39939
G1 X89.644 Y76.17 E.01372
G1 X77.87 Y87.945 E.41879
G1 X77.87 Y88.49 E.01372
G1 X90.19 Y76.17 E.4382
G1 X90.735 Y76.17 E.01372
G1 X77.87 Y89.036 E.4576
G1 X77.87 Y89.582 E.01372
G1 X91.281 Y76.171 E.47701
G1 X91.826 Y76.171 E.01372
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
G1 X95.645 Y76.171 E.63224
G1 X96.191 Y76.171 E.01372
G1 X77.87 Y94.492 E.65165
G1 X77.87 Y95.038 E.01372
G1 X96.737 Y76.171 E.67105
G1 X97.282 Y76.171 E.01372
G1 X77.87 Y95.583 E.69046
G1 X77.87 Y96.129 E.01372
G1 X97.828 Y76.171 E.70986
M73 P18 R4
G1 X98.373 Y76.171 E.01372
G1 X77.87 Y96.675 E.72927
G1 X77.87 Y97.22 E.01372
G1 X98.919 Y76.171 E.74867
G1 X99.464 Y76.171 E.01372
G1 X77.87 Y97.766 E.76808
G1 X77.87 Y98.311 E.01372
G1 X100.01 Y76.171 E.78748
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
G1 X77.87 Y101.585 E.01372
G1 X102.129 Y77.326 E.86283
G1 X102.129 Y77.872 E.01372
G1 X77.87 Y102.131 E.86283
G1 X77.87 Y102.676 E.01372
G1 X102.129 Y78.417 E.86284
G1 X102.129 Y78.963 E.01372
G1 X77.87 Y103.222 E.86284
G2 X77.999 Y103.638 I.573 J.05 E.01124
G1 X102.129 Y79.508 E.85823
G1 X102.129 Y80.054 E.01372
G1 X78.357 Y103.826 E.8455
G2 X78.898 Y103.83 I.302 J-3.604 E.01362
G1 X102.129 Y80.6 E.82627
G1 X102.129 Y81.145 E.01372
G1 X79.27 Y104.004 E.81304
M204 S10000
M73 P19 R4
G1 X83.089 Y104.004 F42000
G1 F11664.075
M204 S6000
G1 X88.025 Y99.068 E.17557
G3 X87.516 Y99.032 I-.165 J-1.279 E.01293
G1 X82.717 Y103.83 E.17068
G1 X82.172 Y103.83 E.01372
G1 X87.123 Y98.879 E.17609
G3 X86.81 Y98.646 I.42 J-.888 E.00987
G1 X81.626 Y103.83 E.18439
G1 X81.08 Y103.83 E.01372
G1 X86.564 Y98.347 E.19504
G3 X86.39 Y97.975 I1.933 J-1.135 E.01033
G1 X80.535 Y103.83 E.20825
G1 X79.989 Y103.83 E.01372
G1 X86.521 Y97.298 E.23233
; WIPE_START
G1 X85.107 Y98.713 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.651 Y96.168 Z.76 F42000
G1 Z.36
G1 E.8 F1800
G1 F11664.075
M204 S6000
G1 X102.129 Y81.691 E.51494
G1 X102.129 Y82.236 E.01372
G1 X88.324 Y96.041 E.49099
G3 X88.696 Y96.215 I-.245 J1.005 E.01039
G1 X102.129 Y82.782 E.47778
G1 X102.129 Y83.327 E.01372
G1 X88.997 Y96.46 E.46708
G3 X89.232 Y96.77 I-.65 J.735 E.00986
G1 X102.129 Y83.873 E.45873
G1 X102.129 Y84.419 E.01372
G1 X89.38 Y97.168 E.45345
G3 X89.416 Y97.677 I-1.136 J.336 E.01295
G1 X102.129 Y84.964 E.45218
G1 X102.129 Y85.51 E.01372
G1 X83.808 Y103.83 E.65163
G1 X84.354 Y103.83 E.01372
G1 X102.129 Y86.055 E.63222
G1 X102.129 Y86.601 E.01372
G1 X84.9 Y103.83 E.61282
G1 X85.445 Y103.83 E.01372
G1 X102.129 Y87.146 E.59341
G1 X102.129 Y87.692 E.01372
G1 X85.991 Y103.83 E.57401
G1 X86.536 Y103.83 E.01372
G1 X102.129 Y88.237 E.5546
G1 X102.129 Y88.783 E.01372
G1 X87.082 Y103.83 E.5352
G1 X87.628 Y103.83 E.01372
G1 X102.129 Y89.329 E.51579
G1 X102.129 Y89.874 E.01372
G1 X88.173 Y103.83 E.49639
G1 X88.719 Y103.83 E.01372
G1 X102.129 Y90.42 E.47698
M73 P20 R4
G1 X102.129 Y90.965 E.01372
G1 X89.264 Y103.83 E.45758
G1 X89.81 Y103.83 E.01372
G1 X102.13 Y91.511 E.43817
G1 X102.13 Y92.056 E.01372
G1 X90.356 Y103.83 E.41877
G1 X90.901 Y103.83 E.01372
G1 X102.13 Y92.602 E.39937
G1 X102.13 Y93.148 E.01372
G1 X91.447 Y103.83 E.37996
G1 X91.993 Y103.83 E.01372
G1 X102.13 Y93.693 E.36056
G1 X102.13 Y94.239 E.01372
G1 X92.538 Y103.83 E.34115
G1 X93.084 Y103.83 E.01372
G1 X102.13 Y94.784 E.32175
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
G1 X97.994 Y103.83 E.14711
G1 X98.54 Y103.83 E.01372
G1 X102.13 Y100.24 E.1277
G1 X102.13 Y100.786 E.01372
G1 X99.085 Y103.83 E.1083
G1 X99.631 Y103.83 E.01372
G1 X102.13 Y101.331 E.08889
G1 X102.13 Y101.877 E.01372
G1 X100.177 Y103.83 E.06949
G1 X100.722 Y103.83 E.01372
G1 X102.13 Y102.422 E.05008
G1 X102.13 Y102.968 E.01372
G1 X101.094 Y104.004 E.03685
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11664.075
G1 X102.13 Y102.968 E-.55678
G1 X102.13 Y102.433 E-.20322
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
G3 Z.76 I.429 J-1.139 P1  F42000
G1 X86.975 Y96.719 Z.76
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X87.12 Y96.578 E.00545
G3 X87.724 Y96.323 I.755 J.944 E.01801
G1 X87.845 Y96.314 E.00327
G3 X86.935 Y96.763 I.03 J1.208 E.17737
M204 S250
G1 X87.255 Y97.005 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X87.774 Y96.721 I.62 J.518 E.01524
G1 X87.855 Y96.715 E.00203
G3 X87.218 Y97.052 I.02 J.808 E.1089
; WIPE_START
M204 S6000
G1 X87.37 Y96.892 E-.08397
G1 X87.505 Y96.804 E-.06134
G1 X87.774 Y96.721 E-.10695
G1 X87.855 Y96.715 E-.03069
G1 X88.016 Y96.727 E-.06129
G1 X88.171 Y96.771 E-.06131
G1 X88.315 Y96.844 E-.06133
G1 X88.441 Y96.945 E-.06133
G1 X88.587 Y97.137 E-.09172
G1 X88.649 Y97.286 E-.06134
G1 X88.681 Y97.444 E-.06137
G1 X88.681 Y97.49 E-.01736
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.129 Y90.735 Z.92 F42000
G1 X77.575 Y76.371 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X77.577 Y76.368 E.00012
G3 X78.415 Y75.811 I.829 J.339 E.02894
G1 X101.585 Y75.811 E.62785
G3 X102.488 Y76.65 I.002 J.902 E.03674
G1 X102.489 Y103.292 E.72193
G3 X101.585 Y104.189 I-.896 J.002 E.03841
G1 X78.415 Y104.189 E.62784
G3 X77.511 Y103.285 I-.008 J-.896 E.0386
G1 X77.511 Y76.715 E.71995
G3 X77.52 Y76.577 I.896 J-.009 E.00375
G1 X77.559 Y76.429 E.00414
M204 S250
M73 P21 R4
G1 X77.191 Y76.267 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X77.21 Y76.21 E.00151
G3 X78.405 Y75.41 I1.199 J.499 E.03833
G1 X101.595 Y75.41 E.58303
G3 X102.888 Y76.635 I-.012 J1.307 E.04926
G1 X102.89 Y103.297 E.67033
G3 X101.595 Y104.59 I-1.299 J-.006 E.05105
G1 X78.405 Y104.59 E.58303
G3 X77.11 Y103.295 I.004 J-1.299 E.05111
G1 X77.11 Y76.705 E.66849
G3 X77.125 Y76.513 I1.299 J.003 E.00484
G1 X77.176 Y76.325 E.0049
; WIPE_START
M204 S6000
G1 X77.21 Y76.21 E-.04566
G1 X77.328 Y75.983 E-.09712
G1 X77.489 Y75.786 E-.09681
G1 X77.737 Y75.594 E-.11923
G1 X77.966 Y75.486 E-.09606
G1 X78.146 Y75.435 E-.07106
G1 X78.405 Y75.41 E-.09906
G1 X78.76 Y75.41 E-.13499
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

G1 X102.321 Y77.193
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420556
G1 F11651.39
M204 S6000
G1 X101.279 Y76.151 E.0371
G1 X100.732 Y76.151 E.01375
G1 X102.147 Y77.566 E.05037
G1 X102.147 Y78.112 E.01375
G1 X100.186 Y76.151 E.06982
G1 X99.64 Y76.151 E.01375
G1 X102.147 Y78.658 E.08927
G1 X102.147 Y79.205 E.01375
G1 X99.094 Y76.151 E.10872
G1 X98.548 Y76.151 E.01375
G1 X102.147 Y79.751 E.12817
G1 X102.147 Y80.297 E.01375
G1 X98.001 Y76.151 E.14762
G1 X97.455 Y76.151 E.01375
G1 X102.147 Y80.843 E.16707
G1 X102.147 Y81.39 E.01375
G1 X96.909 Y76.151 E.18652
G1 X96.363 Y76.151 E.01375
G1 X102.147 Y81.936 E.20597
G1 X102.147 Y82.482 E.01375
G1 X95.817 Y76.151 E.22542
G1 X95.27 Y76.151 E.01375
G1 X102.147 Y83.028 E.24487
G1 X102.147 Y83.574 E.01375
G1 X94.724 Y76.151 E.26432
G1 X94.178 Y76.151 E.01375
G1 X102.148 Y84.121 E.28377
G1 X102.148 Y84.667 E.01375
G1 X93.632 Y76.151 E.30322
G1 X93.086 Y76.151 E.01375
G1 X102.148 Y85.213 E.32266
G1 X102.148 Y85.759 E.01375
G1 X92.539 Y76.151 E.34211
G1 X91.993 Y76.151 E.01375
G1 X102.148 Y86.306 E.36156
G1 X102.148 Y86.852 E.01375
G1 X91.447 Y76.151 E.38101
G1 X90.901 Y76.151 E.01375
G1 X102.148 Y87.398 E.40046
G1 X102.148 Y87.944 E.01375
G1 X90.355 Y76.151 E.41991
G1 X89.808 Y76.151 E.01375
G1 X102.148 Y88.491 E.43936
G1 X102.148 Y89.037 E.01375
G1 X89.262 Y76.151 E.45881
G1 X88.716 Y76.151 E.01375
G1 X102.148 Y89.583 E.47826
G1 X102.148 Y90.129 E.01375
G1 X88.17 Y76.151 E.49771
G1 X87.624 Y76.151 E.01375
G1 X102.148 Y90.676 E.51716
M73 P22 R4
G1 X102.148 Y91.222 E.01375
G1 X87.077 Y76.151 E.53661
G1 X86.531 Y76.151 E.01375
G1 X102.148 Y91.768 E.55606
G1 X102.148 Y92.314 E.01375
G1 X85.985 Y76.151 E.57551
G1 X85.439 Y76.151 E.01375
G1 X102.148 Y92.86 E.59496
G1 X102.148 Y93.407 E.01375
G1 X84.893 Y76.151 E.61441
G1 X84.346 Y76.151 E.01375
G1 X102.148 Y93.953 E.63386
G1 X102.148 Y94.499 E.01375
G1 X83.8 Y76.151 E.65331
G1 X83.254 Y76.151 E.01375
G1 X102.148 Y95.045 E.67276
G1 X102.148 Y95.592 E.01375
G1 X82.708 Y76.151 E.69221
G1 X82.162 Y76.151 E.01375
G1 X102.148 Y96.138 E.71166
G1 X102.148 Y96.684 E.01375
G1 X81.615 Y76.151 E.73111
G1 X81.069 Y76.151 E.01375
G1 X102.148 Y97.23 E.75056
G1 X102.148 Y97.777 E.01375
G1 X80.523 Y76.151 E.77001
G1 X79.977 Y76.151 E.01375
G1 X102.148 Y98.323 E.78945
G1 X102.149 Y98.869 E.01375
G1 X79.431 Y76.151 E.8089
G1 X78.884 Y76.151 E.01375
G1 X102.149 Y99.415 E.82835
G1 X102.149 Y99.962 E.01375
G1 X78.346 Y76.159 E.84751
G2 X77.987 Y76.346 I.037 J.512 E.01049
G1 X102.149 Y100.508 E.86032
G1 X102.149 Y101.054 E.01375
G1 X77.851 Y76.757 E.86515
M73 P23 R4
G1 X77.851 Y77.303 E.01375
G1 X102.149 Y101.6 E.86515
G1 X102.149 Y102.146 E.01375
G1 X77.851 Y77.849 E.86515
G1 X77.851 Y78.395 E.01375
G1 X102.149 Y102.693 E.86515
G1 X102.149 Y103.239 E.01375
G1 X77.851 Y78.941 E.86515
G1 X77.851 Y79.488 E.01375
G1 X102.016 Y103.652 E.86041
G3 X101.656 Y103.838 I-.458 J-.444 E.01038
G1 X77.851 Y80.034 E.84759
G1 X77.851 Y80.58 E.01375
G1 X101.12 Y103.849 E.82852
G1 X100.574 Y103.849 E.01375
G1 X77.851 Y81.126 E.80908
G1 X77.851 Y81.672 E.01375
G1 X100.028 Y103.849 E.78963
G1 X99.482 Y103.849 E.01375
G1 X77.851 Y82.219 E.77018
G1 X77.851 Y82.765 E.01375
G1 X98.935 Y103.849 E.75073
G1 X98.389 Y103.849 E.01375
G1 X77.851 Y83.311 E.73128
G1 X77.851 Y83.857 E.01375
G1 X97.843 Y103.849 E.71184
G1 X97.297 Y103.849 E.01375
G1 X77.851 Y84.403 E.69239
G1 X77.851 Y84.949 E.01375
G1 X96.751 Y103.849 E.67294
G1 X96.204 Y103.849 E.01375
G1 X77.851 Y85.496 E.65349
G1 X77.851 Y86.042 E.01375
G1 X87.79 Y95.981 E.35389
M73 P24 R4
G1 X87.678 Y95.983 E.00281
G1 X87.333 Y96.07 E.00896
G1 X77.851 Y86.588 E.33761
G1 X77.851 Y87.134 E.01375
G1 X86.98 Y96.263 E.32504
G2 X86.691 Y96.52 I.492 J.843 E.00981
G1 X77.851 Y87.68 E.31476
G1 X77.851 Y88.227 E.01375
G1 X86.48 Y96.855 E.30723
G2 X86.349 Y97.271 I.962 J.531 E.01104
G1 X77.851 Y88.773 E.30258
G1 X77.851 Y89.319 E.01375
G1 X86.359 Y97.827 E.30292
G2 X87.574 Y99.042 I1.517 J-.302 E.04587
G1 X92.381 Y103.849 E.17117
G1 X92.927 Y103.849 E.01375
G1 X88.131 Y99.052 E.17078
G2 X88.544 Y98.919 I-.123 J-1.088 E.011
G1 X93.473 Y103.849 E.17552
G1 X94.02 Y103.849 E.01375
G1 X88.873 Y98.702 E.18326
G2 X89.141 Y98.424 I-.47 J-.721 E.00981
G1 X94.566 Y103.849 E.19316
G1 X95.112 Y103.849 E.01375
G1 X89.326 Y98.063 E.20602
G1 X89.36 Y97.983 E.00219
G1 X89.421 Y97.612 E.00947
G1 X95.832 Y104.022 E.22826
M204 S10000
G1 X92.008 Y104.022 F42000
G1 F11651.39
M204 S6000
G1 X77.851 Y89.865 E.50408
G1 X77.851 Y90.411 E.01375
G1 X91.289 Y103.849 E.47846
G1 X90.742 Y103.849 E.01375
G1 X77.851 Y90.958 E.45901
G1 X77.851 Y91.504 E.01375
G1 X90.196 Y103.849 E.43956
G1 X89.65 Y103.849 E.01375
G1 X77.851 Y92.05 E.42011
G1 X77.851 Y92.596 E.01375
G1 X89.104 Y103.849 E.40066
G1 X88.558 Y103.849 E.01375
G1 X77.851 Y93.142 E.38122
G1 X77.851 Y93.689 E.01375
G1 X88.011 Y103.849 E.36177
G1 X87.465 Y103.849 E.01375
G1 X77.851 Y94.235 E.34232
G1 X77.851 Y94.781 E.01375
G1 X86.919 Y103.849 E.32287
G1 X86.373 Y103.849 E.01375
G1 X77.851 Y95.327 E.30342
G1 X77.851 Y95.873 E.01375
G1 X85.827 Y103.849 E.28398
G1 X85.28 Y103.849 E.01375
G1 X77.851 Y96.42 E.26453
G1 X77.851 Y96.966 E.01375
G1 X84.734 Y103.849 E.24508
G1 X84.188 Y103.849 E.01375
G1 X77.851 Y97.512 E.22563
G1 X77.851 Y98.058 E.01375
G1 X83.642 Y103.849 E.20618
G1 X83.096 Y103.849 E.01375
G1 X77.851 Y98.604 E.18673
G1 X77.851 Y99.151 E.01375
G1 X82.549 Y103.849 E.16729
G1 X82.003 Y103.849 E.01375
G1 X77.851 Y99.697 E.14784
G1 X77.851 Y100.243 E.01375
G1 X81.457 Y103.849 E.12839
M73 P25 R4
G1 X80.911 Y103.849 E.01375
G1 X77.851 Y100.789 E.10894
G1 X77.851 Y101.335 E.01375
G1 X80.365 Y103.849 E.08949
G1 X79.818 Y103.849 E.01375
G1 X77.851 Y101.882 E.07004
G1 X77.851 Y102.428 E.01375
G1 X79.272 Y103.849 E.0506
G1 X78.726 Y103.849 E.01375
G1 X77.851 Y102.974 E.03115
G2 X77.905 Y103.532 I1.263 J.159 E.01423
G2 X78.051 Y103.72 I.499 J-.236 E.00602
G1 X78.346 Y104.015 E.01051
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11651.39
G1 X78.051 Y103.72 E-.15866
G1 X77.96 Y103.623 E-.05038
G1 X77.905 Y103.532 E-.04032
G1 X77.864 Y103.404 E-.05114
G1 X77.851 Y102.974 E-.16345
G1 X78.402 Y103.525 E-.29606
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/30
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.92 I.708 J.989 P1  F42000
G1 X86.67 Y97.606 Z.92
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X86.671 Y97.404 E.00545
G3 X87.724 Y96.323 I1.205 J.12 E.04418
G1 X87.845 Y96.314 E.00327
G3 X86.673 Y97.665 I.031 J1.21 E.15158
M204 S250
G1 X87.069 Y97.606 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X87.774 Y96.721 I.806 J-.081 E.03148
G1 X87.855 Y96.715 E.00203
G3 X87.078 Y97.665 I.02 J.809 E.09289
; WIPE_START
M204 S6000
G1 X87.069 Y97.444 E-.08393
G1 X87.101 Y97.286 E-.06134
G1 X87.207 Y97.066 E-.09306
G1 X87.339 Y96.917 E-.07544
G1 X87.47 Y96.823 E-.06112
G1 X87.617 Y96.757 E-.06128
G1 X87.774 Y96.721 E-.06136
G1 X87.855 Y96.715 E-.03069
G1 X88.016 Y96.727 E-.06134
G1 X88.171 Y96.771 E-.06128
G1 X88.315 Y96.844 E-.06136
G1 X88.413 Y96.923 E-.0478
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.846 Y90.175 Z1.08 F42000
G1 X77.564 Y76.401 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G3 X78.415 Y75.811 I.842 J.306 E.02992
G1 X83.913 Y75.811 E.14897
G1 X83.913 Y79.787 E.10775
G1 X96.087 Y79.787 E.32989
G1 X96.087 Y75.811 E.10775
G1 X101.588 Y75.811 E.14905
G3 X102.488 Y76.656 I0 J.902 E.03686
G1 X102.489 Y103.292 E.72174
G3 X101.585 Y104.189 I-.896 J.002 E.03841
G1 X78.415 Y104.189 E.62783
G3 X77.511 Y103.285 I-.008 J-.896 E.0386
G1 X77.511 Y76.715 E.71995
G3 X77.546 Y76.458 I.896 J-.008 E.00706
M204 S250
G1 X77.201 Y76.233 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X77.296 Y76.038 E.00545
G3 X78.405 Y75.41 I1.112 J.67 E.03349
G1 X101.598 Y75.41 E.58309
G3 X102.888 Y76.637 I-.014 J1.307 E.04924
G1 X102.89 Y103.297 E.67028
G3 X101.595 Y104.59 I-1.299 J-.006 E.05106
G1 X78.405 Y104.59 E.58301
G3 X77.11 Y103.295 I.003 J-1.299 E.05112
G1 X77.11 Y76.705 E.66849
G3 X77.18 Y76.289 I1.299 J.003 E.01066
; WIPE_START
M204 S6000
G1 X77.296 Y76.038 E-.10511
G1 X77.49 Y75.786 E-.12081
G1 X77.737 Y75.594 E-.11907
G1 X77.966 Y75.486 E-.09601
G1 X78.21 Y75.424 E-.09591
G1 X78.405 Y75.41 E-.07428
G1 X78.797 Y75.41 E-.14882
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

G1 X77.678 Y77.197
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420556
G1 F11651.39
M204 S6000
G1 X78.719 Y76.156 E.03707
G1 X79.265 Y76.156 E.01377
G1 X77.851 Y77.57 E.05036
G1 X77.851 Y78.116 E.01375
G1 X79.812 Y76.155 E.06982
G1 X80.359 Y76.155 E.01377
G1 X77.851 Y78.662 E.08929
G1 X77.851 Y79.208 E.01375
G1 X80.906 Y76.154 E.10876
G1 X81.452 Y76.154 E.01377
G1 X77.851 Y79.755 E.12822
G1 X77.851 Y80.301 E.01375
G1 X81.999 Y76.153 E.14769
G1 X82.546 Y76.153 E.01377
G1 X77.851 Y80.847 E.16716
G1 X77.851 Y81.393 E.01375
G1 X83.092 Y76.152 E.18662
G1 X83.572 Y76.152 E.01208
G1 X83.572 Y76.218 E.00168
G1 X77.851 Y81.939 E.20371
G1 X77.851 Y82.486 E.01375
G1 X83.572 Y76.765 E.20371
G1 X83.572 Y77.311 E.01375
G1 X77.851 Y83.032 E.20371
G1 X77.851 Y83.578 E.01375
G1 X83.572 Y77.857 E.20371
M73 P26 R4
G1 X83.572 Y78.403 E.01375
G1 X77.851 Y84.124 E.20371
G1 X77.851 Y84.67 E.01375
G1 X83.572 Y78.949 E.2037
G1 X83.572 Y79.496 E.01375
G1 X77.851 Y85.217 E.2037
G1 X77.851 Y85.763 E.01375
G1 X83.572 Y80.042 E.20371
G1 X83.572 Y80.128 E.00216
G1 X84.032 Y80.128 E.01159
G1 X77.851 Y86.309 E.22009
G1 X77.851 Y86.855 E.01375
G1 X84.579 Y80.128 E.23954
G1 X85.125 Y80.128 E.01375
G1 X77.851 Y87.401 E.25899
G1 X77.851 Y87.948 E.01375
G1 X85.671 Y80.128 E.27844
G1 X86.217 Y80.128 E.01375
G1 X77.851 Y88.494 E.29789
G1 X77.851 Y89.04 E.01375
G1 X86.763 Y80.128 E.31734
G1 X87.31 Y80.128 E.01375
G1 X77.851 Y89.586 E.33678
G1 X77.851 Y90.132 E.01375
G1 X87.856 Y80.128 E.35623
G1 X88.402 Y80.128 E.01375
G1 X77.851 Y90.679 E.37568
G1 X77.851 Y91.225 E.01375
G1 X88.948 Y80.128 E.39513
G1 X89.494 Y80.128 E.01375
G1 X77.851 Y91.771 E.41458
G1 X77.851 Y92.317 E.01375
G1 X90.041 Y80.128 E.43402
G1 X90.587 Y80.128 E.01375
G1 X77.851 Y92.863 E.45347
G1 X77.851 Y93.41 E.01375
G1 X91.133 Y80.128 E.47292
G1 X91.679 Y80.128 E.01375
G1 X77.851 Y93.956 E.49237
G1 X77.851 Y94.502 E.01375
G1 X92.225 Y80.128 E.51182
G1 X92.772 Y80.128 E.01375
G1 X77.851 Y95.048 E.53127
G1 X77.851 Y95.594 E.01375
G1 X93.318 Y80.128 E.55071
G1 X93.864 Y80.128 E.01375
G1 X77.851 Y96.141 E.57016
G1 X77.851 Y96.687 E.01375
G1 X94.41 Y80.128 E.58961
G1 X94.956 Y80.128 E.01375
G1 X77.851 Y97.233 E.60906
G1 X77.851 Y97.779 E.01375
G1 X95.503 Y80.128 E.62851
G1 X96.049 Y80.128 E.01375
G1 X77.678 Y98.499 E.65413
M204 S10000
G1 X79.255 Y104.022 F42000
G1 F11651.39
M204 S6000
M73 P27 R4
G1 X102.147 Y81.13 E.81512
G1 X102.147 Y80.584 E.01375
G1 X78.882 Y103.849 E.82839
G1 X78.349 Y103.836 E.01342
G1 X102.147 Y80.038 E.84737
G1 X102.147 Y79.491 E.01375
G1 X77.987 Y103.652 E.86027
G3 X77.851 Y103.241 I.517 J-.398 E.0111
G1 X102.147 Y78.945 E.86509
G1 X102.147 Y78.399 E.01375
G1 X77.851 Y102.695 E.86509
G1 X77.851 Y102.149 E.01375
G1 X102.147 Y77.853 E.86509
G1 X102.147 Y77.307 E.01375
G1 X77.851 Y101.603 E.86509
G1 X77.851 Y101.056 E.01375
G1 X102.147 Y76.761 E.86509
G2 X102.013 Y76.349 I-.578 J-.039 E.01118
G1 X77.851 Y100.51 E.8603
G1 X77.851 Y99.964 E.01375
G1 X101.658 Y76.157 E.84768
G1 X101.113 Y76.156 E.01372
G1 X77.851 Y99.418 E.82828
G1 X77.851 Y98.872 E.01375
G1 X100.568 Y76.155 E.80885
G1 X100.022 Y76.155 E.01374
G1 X96.428 Y79.749 E.12797
G1 X96.428 Y79.203 E.01375
G1 X99.476 Y76.154 E.10854
G1 X98.93 Y76.154 E.01374
G1 X96.428 Y78.656 E.08911
G1 X96.428 Y78.11 E.01375
G1 X98.385 Y76.153 E.06968
G1 X97.839 Y76.153 E.01374
G1 X96.428 Y77.564 E.05025
G1 X96.428 Y77.018 E.01375
G1 X97.293 Y76.152 E.03082
G1 X96.748 Y76.152 E.01374
G1 X96.254 Y76.645 E.01757
; WIPE_START
G1 X96.748 Y76.152 E-.26511
G1 X97.293 Y76.152 E-.20737
G1 X96.758 Y76.687 E-.28752
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.86 Y78.959 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S2000
G1 X95.259 Y79.56 E.02138
G1 X94.713 Y79.56
G1 X95.86 Y78.413 E.04078
G1 X95.86 Y77.868
G1 X94.168 Y79.56 E.06017
M73 P28 R4
G1 X93.622 Y79.56
G1 X95.86 Y77.322 E.07956
G1 X95.86 Y76.777
G1 X93.077 Y79.56 E.09895
G1 X92.532 Y79.56
G1 X95.86 Y76.232 E.11834
G1 X95.86 Y75.686
G1 X91.986 Y79.56 E.13774
G1 X91.441 Y79.56
G1 X95.379 Y75.622 E.14001
G1 X94.833 Y75.622
G1 X90.895 Y79.56 E.14001
G1 X90.35 Y79.56
G1 X94.288 Y75.622 E.14001
G1 X93.742 Y75.622
G1 X89.805 Y79.56 E.14001
G1 X89.259 Y79.56
G1 X93.197 Y75.622 E.14001
G1 X92.652 Y75.622
G1 X88.714 Y79.56 E.14001
G1 X88.168 Y79.56
G1 X92.106 Y75.622 E.14001
G1 X91.561 Y75.622
G1 X87.623 Y79.56 E.14001
G1 X87.077 Y79.56
G1 X91.015 Y75.622 E.14001
G1 X90.47 Y75.622
G1 X86.532 Y79.56 E.14001
G1 X85.987 Y79.56
G1 X89.925 Y75.622 E.14001
G1 X89.379 Y75.622
G1 X85.441 Y79.56 E.14001
G1 X84.896 Y79.56
G1 X88.834 Y75.622 E.14001
G1 X88.288 Y75.622
G1 X84.35 Y79.56 E.14001
G1 X84.14 Y79.225
G1 X87.743 Y75.622 E.1281
G1 X87.198 Y75.622
G1 X84.14 Y78.68 E.10871
G1 X84.14 Y78.134
G1 X86.652 Y75.622 E.08932
G1 X86.107 Y75.622
G1 X84.14 Y77.589 E.06993
G1 X84.14 Y77.043
G1 X85.561 Y75.622 E.05054
G1 X85.016 Y75.622
G1 X84.14 Y76.498 E.03114
; WIPE_START
M204 S6000
G1 X85.016 Y75.622 E-.47072
G1 X85.561 Y75.622 E-.20725
G1 X85.409 Y75.775 E-.08203
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.245 Y83.361 Z1.08 F42000
G1 X87.656 Y96.167 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420556
G1 F11651.39
M204 S6000
G1 X102.147 Y81.676 E.51598
G1 X102.147 Y82.222 E.01375
G1 X88.328 Y96.042 E.49207
G3 X88.699 Y96.217 I-.247 J1.006 E.0104
G1 X102.147 Y82.768 E.47885
G1 X102.147 Y83.315 E.01375
G1 X89 Y96.462 E.46815
G3 X89.234 Y96.774 I-.654 J.736 E.00989
G1 X102.147 Y83.861 E.4598
M73 P29 R4
G1 X102.148 Y84.407 E.01375
G1 X89.381 Y97.173 E.45457
G3 X89.421 Y97.68 I-1.232 J.352 E.01287
G1 X102.148 Y84.953 E.45315
G1 X102.148 Y85.499 E.01375
G1 X83.798 Y103.849 E.65337
G1 X84.344 Y103.849 E.01375
G1 X102.148 Y86.045 E.63392
G1 X102.148 Y86.592 E.01375
G1 X84.89 Y103.849 E.61447
G1 X85.437 Y103.849 E.01375
G1 X102.148 Y87.138 E.59503
G1 X102.148 Y87.684 E.01375
G1 X85.983 Y103.849 E.57558
G1 X86.529 Y103.849 E.01375
G1 X102.148 Y88.23 E.55613
G1 X102.148 Y88.776 E.01375
G1 X87.075 Y103.849 E.53669
G1 X87.621 Y103.849 E.01375
G1 X102.148 Y89.322 E.51724
G1 X102.148 Y89.868 E.01375
G1 X88.168 Y103.849 E.49779
G1 X88.714 Y103.849 E.01375
G1 X102.148 Y90.415 E.47835
G1 X102.148 Y90.961 E.01375
G1 X89.26 Y103.849 E.4589
G1 X89.806 Y103.849 E.01375
G1 X102.148 Y91.507 E.43945
G1 X102.148 Y92.053 E.01375
G1 X90.352 Y103.849 E.42
G1 X90.899 Y103.849 E.01375
G1 X102.148 Y92.599 E.40056
G1 X102.148 Y93.145 E.01375
G1 X91.445 Y103.849 E.38111
G1 X91.991 Y103.849 E.01375
G1 X102.148 Y93.692 E.36166
G1 X102.148 Y94.238 E.01375
G1 X92.537 Y103.849 E.34222
G1 X93.083 Y103.849 E.01375
G1 X102.148 Y94.784 E.32277
G1 X102.148 Y95.33 E.01375
G1 X93.63 Y103.849 E.30332
G1 X94.176 Y103.849 E.01375
G1 X102.148 Y95.876 E.28388
G1 X102.148 Y96.422 E.01375
G1 X94.722 Y103.849 E.26443
G1 X95.268 Y103.849 E.01375
G1 X102.148 Y96.969 E.24498
G1 X102.148 Y97.515 E.01375
G1 X95.814 Y103.849 E.22554
M73 P30 R4
G1 X96.36 Y103.849 E.01375
G1 X102.148 Y98.061 E.20609
G1 X102.148 Y98.607 E.01375
G1 X96.907 Y103.849 E.18664
G1 X97.453 Y103.849 E.01375
G1 X102.149 Y99.153 E.16719
G1 X102.149 Y99.699 E.01375
G1 X97.999 Y103.849 E.14775
G1 X98.545 Y103.849 E.01375
G1 X102.149 Y100.246 E.1283
G1 X102.149 Y100.792 E.01375
G1 X99.091 Y103.849 E.10885
G1 X99.638 Y103.849 E.01375
G1 X102.149 Y101.338 E.08941
G1 X102.149 Y101.884 E.01375
G1 X100.184 Y103.849 E.06996
G1 X100.73 Y103.849 E.01375
G1 X102.149 Y102.43 E.05051
G1 X102.149 Y102.976 E.01375
G1 X101.103 Y104.022 E.03725
; WIPE_START
G1 X102.149 Y102.976 E-.56215
G1 X102.149 Y102.456 E-.19785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.9 Y100.066 Z1.08 F42000
G1 X86.52 Y97.304 Z1.08
G1 Z.68
G1 E.8 F1800
G1 F11651.39
M204 S6000
G1 X79.975 Y103.849 E.23304
G1 X80.521 Y103.849 E.01375
G1 X86.39 Y97.98 E.20897
G2 X86.566 Y98.35 I2.349 J-.894 E.01033
G1 X81.067 Y103.849 E.19581
G1 X81.613 Y103.849 E.01375
G1 X86.813 Y98.649 E.18515
G2 X87.126 Y98.882 I.733 J-.659 E.00989
G1 X82.159 Y103.849 E.17686
G1 X82.706 Y103.849 E.01375
G1 X87.522 Y99.033 E.17149
G2 X88.033 Y99.068 I.342 J-1.247 E.01299
G1 X83.078 Y104.022 E.17643
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11651.39
G1 X84.492 Y102.608 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/30
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.08 I1.082 J.557 P1  F42000
G1 X87.069 Y97.605 Z1.08
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X87.775 Y96.721 I.806 J-.081 E.03148
G1 X87.855 Y96.715 E.00203
G3 X87.078 Y97.665 I.02 J.809 E.09289
; WIPE_START
M204 S6000
G1 X87.069 Y97.445 E-.08376
G1 X87.101 Y97.286 E-.06144
G1 X87.207 Y97.067 E-.09262
G1 X87.339 Y96.917 E-.07578
G1 X87.47 Y96.823 E-.06124
G1 X87.617 Y96.757 E-.06135
G1 X87.775 Y96.721 E-.06139
G1 X87.855 Y96.715 E-.03063
G1 X88.015 Y96.727 E-.06118
G1 X88.171 Y96.771 E-.06145
G1 X88.315 Y96.844 E-.06133
G1 X88.413 Y96.923 E-.04784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.908 Y89.44 Z1.24 F42000
G1 X84.79 Y78.91 Z1.24
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S5000
G1 X95.21 Y78.91 E.26197
G1 X95.21 Y75.41 E.08799
G1 X101.595 Y75.41 E.16052
G3 X102.89 Y76.705 I.004 J1.291 E.05119
G1 X102.89 Y103.295 E.66849
G3 X101.595 Y104.59 I-1.299 J-.003 E.05112
G1 X78.405 Y104.59 E.58302
G3 X77.11 Y103.295 I.003 J-1.298 E.05112
G1 X77.11 Y76.705 E.6685
G3 X78.403 Y75.41 I1.294 J-.001 E.0511
G1 X84.79 Y75.41 E.16058
G1 X84.79 Y78.85 E.08649
; WIPE_START
M204 S6000
G1 X86.79 Y78.862 E-.76
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
G1 X102.678 Y76.771 E.04086
G1 X102.678 Y77.317
G1 X100.983 Y75.622 E.06025
G1 X100.438 Y75.622
G1 X102.678 Y77.862 E.07964
G1 X102.678 Y78.407
G1 X99.893 Y75.622 E.09903
G1 X99.347 Y75.622
G1 X102.678 Y78.953 E.11843
G1 X102.678 Y79.498
G1 X98.802 Y75.622 E.13782
M73 P31 R4
G1 X98.256 Y75.622
G1 X102.678 Y80.044 E.15721
G1 X102.678 Y80.589
G1 X97.711 Y75.622 E.1766
G1 X97.166 Y75.622
G1 X102.678 Y81.134 E.19599
G1 X102.678 Y81.68
G1 X96.62 Y75.622 E.21539
G1 X96.075 Y75.622
G1 X102.678 Y82.225 E.23478
G1 X102.678 Y82.771
G1 X95.529 Y75.622 E.25417
G1 X95.422 Y76.06
G1 X102.678 Y83.316 E.25798
G1 X102.678 Y83.861
G1 X95.422 Y76.606 E.25798
G1 X95.422 Y77.151
G1 X102.678 Y84.407 E.25798
G1 X102.678 Y84.952
G1 X95.422 Y77.697 E.25798
G1 X95.422 Y78.242
G1 X102.678 Y85.498 E.25798
G1 X102.678 Y86.043
G1 X95.422 Y78.787 E.25798
G1 X95.212 Y79.122
G1 X102.678 Y86.589 E.26547
G1 X102.678 Y87.134
G1 X94.666 Y79.122 E.28486
G1 X94.121 Y79.122
G1 X102.678 Y87.679 E.30425
G1 X102.678 Y88.225
G1 X93.575 Y79.122 E.32365
G1 X93.03 Y79.122
G1 X102.678 Y88.77 E.34304
G1 X102.678 Y89.316
G1 X92.484 Y79.122 E.36243
G1 X91.939 Y79.122
G1 X102.678 Y89.861 E.38182
G1 X102.678 Y90.406
G1 X91.394 Y79.122 E.40121
G1 X90.848 Y79.122
G1 X102.678 Y90.952 E.42061
G1 X102.678 Y91.497
G1 X90.303 Y79.122 E.44
M73 P32 R4
G1 X89.757 Y79.122
G1 X102.678 Y92.043 E.45939
G1 X102.678 Y92.588
G1 X89.212 Y79.122 E.47878
G1 X88.667 Y79.122
G1 X102.678 Y93.133 E.49817
G1 X102.678 Y93.679
G1 X88.121 Y79.122 E.51757
G1 X87.576 Y79.122
G1 X102.678 Y94.224 E.53696
G1 X102.678 Y94.77
G1 X87.03 Y79.122 E.55635
M73 P32 R3
G1 X86.485 Y79.122
G1 X102.678 Y95.315 E.57574
G1 X102.678 Y95.86
G1 X85.94 Y79.122 E.59513
G1 X85.394 Y79.122
G1 X102.678 Y96.406 E.61453
G1 X102.678 Y96.951
G1 X84.849 Y79.122 E.63392
; WIPE_START
M204 S6000
G1 X86.263 Y80.536 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.076 Y75.622 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X84.578 Y76.124 E.01785
G1 X84.578 Y76.67
G1 X83.53 Y75.622 E.03724
G1 X82.985 Y75.622
G1 X84.578 Y77.215 E.05664
G1 X84.578 Y77.76
G1 X82.44 Y75.622 E.07603
G1 X81.894 Y75.622
G1 X84.578 Y78.306 E.09542
G1 X84.578 Y78.851
G1 X81.349 Y75.622 E.11481
G1 X80.803 Y75.622
G1 X102.678 Y97.497 E.77775
G1 X102.678 Y98.042
G1 X80.258 Y75.622 E.79715
G1 X79.713 Y75.622
G1 X102.678 Y98.587 E.81654
M73 P33 R3
G1 X102.678 Y99.133
G1 X79.167 Y75.622 E.83593
G1 X78.622 Y75.622
G1 X102.678 Y99.678 E.85532
G1 X102.678 Y100.224
G1 X78.115 Y75.661 E.87334
G1 X77.75 Y75.841
G1 X102.678 Y100.769 E.88633
G1 X102.678 Y101.314
G1 X77.489 Y76.125 E.89561
G1 X77.339 Y76.521
G1 X102.678 Y101.86 E.90095
G1 X102.678 Y102.405
G1 X77.322 Y77.049 E.90153
G1 X77.322 Y77.595
G1 X102.678 Y102.951 E.90153
G1 X102.661 Y103.48
G1 X77.322 Y78.14 E.90094
G1 X77.322 Y78.686
G1 X102.511 Y103.874 E.89558
G1 X102.249 Y104.158
G1 X77.322 Y79.231 E.88629
G1 X77.322 Y79.776
G1 X101.885 Y104.339 E.87333
M73 P34 R3
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
G1 X88.879 Y97.333 E.25049
G1 X88.846 Y97.845
G1 X95.379 Y104.378 E.23229
G1 X94.833 Y104.378
G1 X88.648 Y98.193 E.2199
G1 X88.344 Y98.434
G1 X94.288 Y104.378 E.21135
M73 P35 R3
G1 X93.742 Y104.378
G1 X87.911 Y98.547 E.20734
; WIPE_START
M204 S6000
G1 X89.325 Y99.961 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.067 Y96.521 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X77.322 Y85.776 E.38205
G1 X77.322 Y86.321
G1 X87.555 Y96.554 E.36383
G1 X87.207 Y96.751
G1 X77.322 Y86.867 E.35145
G1 X77.322 Y87.412
G1 X86.967 Y97.057 E.34292
G1 X86.854 Y97.49
G1 X77.322 Y87.958 E.33891
G1 X77.322 Y88.503
G1 X93.197 Y104.378 E.56444
G1 X92.652 Y104.378
G1 X77.322 Y89.048 E.54504
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
M73 P36 R3
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
G1 X83.721 Y98.505 Z1.24 F42000
G1 X102.421 Y75.972 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0905952
G1 F18000
M204 S6000
G1 X101.856 Y75.652 E.00238
M204 S10000
G1 X102.657 Y76.442 F42000
; LINE_WIDTH: 0.164735
G1 F18000
M204 S6000
G2 X102.471 Y76.177 I-3.738 J2.433 E.00275
; LINE_WIDTH: 0.215361
G2 X102.122 Y75.828 I-1.705 J1.358 E.00583
; LINE_WIDTH: 0.164867
G2 X101.861 Y75.644 I-2.745 J3.612 E.00272
M204 S10000
G1 X102.65 Y76.446 F42000
; LINE_WIDTH: 0.0893686
G1 F18000
M204 S6000
G1 X102.313 Y75.869 E.0024
; WIPE_START
G1 X102.65 Y76.446 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.539 Y82.114 Z1.24 F42000
G1 X77.687 Y104.132 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.0907715
G1 F18000
M204 S6000
G1 X77.35 Y103.554 E.00246
M204 S10000
G1 X78.14 Y104.359 F42000
; LINE_WIDTH: 0.164427
G1 F18000
M204 S6000
G1 X77.918 Y104.202 E.00231
; LINE_WIDTH: 0.210381
G3 X77.494 Y103.777 I1.197 J-1.618 E.00691
; LINE_WIDTH: 0.174354
G1 X77.471 Y103.746 E.00036
; LINE_WIDTH: 0.145549
G1 X77.345 Y103.557 E.00164
M204 S10000
G1 X78.146 Y104.35 F42000
; LINE_WIDTH: 0.0893462
G1 F18000
M204 S6000
G1 X77.568 Y104.013 E.0024
; WIPE_START
G1 X78.146 Y104.35 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.774 Y104.086 Z1.24 F42000
G1 X102.661 Y103.503 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.0903649
G1 F18000
M204 S6000
G1 X102.573 Y103.664 E.00067
; WIPE_START
G1 X102.661 Y103.503 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.758 Y100.247 Z1.24 F42000
G1 X87.736 Y96.463 Z1.24
G1 Z.84
M73 P37 R3
G1 E.8 F1800
; LINE_WIDTH: 0.0986019
G1 F18000
M204 S6000
G2 X87.586 Y96.547 I1.538 J2.901 E.00072
M204 S10000
G1 X88.509 Y96.721 F42000
; LINE_WIDTH: 0.0969065
G1 F18000
M204 S6000
G1 X88.351 Y96.593 E.00083
; LINE_WIDTH: 0.150555
G2 X88.138 Y96.451 I-3.093 J4.383 E.00194
; WIPE_START
G1 X88.351 Y96.593 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.951 Y97.261 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.140971
G1 F18000
M204 S6000
G2 X88.789 Y97.025 I-5.466 J3.576 E.00199
; LINE_WIDTH: 0.0930533
G1 X88.678 Y96.89 E.00067
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X88.789 Y97.025 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/30
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.24 I1.069 J-.581 P1  F42000
G1 X77.555 Y76.364 Z1.24
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1469
M204 S5000
G1 X77.519 Y76.48 E.00304
G2 X77.49 Y76.695 I.893 J.232 E.00548
G1 X77.49 Y103.305 E.66901
G2 X78.392 Y104.21 I.926 J-.021 E.03544
G1 X101.606 Y104.21 E.58363
G2 X102.51 Y103.305 I-.016 J-.921 E.03556
G1 X102.51 Y76.695 E.66901
G2 X101.647 Y75.791 I-.922 J.016 E.03452
G1 X95.21 Y75.79 E.16184
M73 P38 R3
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.888 Y76.637 I-.068 J1.292 E.04771
G1 X102.888 Y103.363 E.67194
G3 X101.597 Y104.59 I-1.289 J-.064 E.04941
G1 X78.405 Y104.59 E.58307
G3 X77.11 Y103.297 I-.004 J-1.291 E.05114
G1 X77.112 Y76.637 E.67028
G3 X78.334 Y75.412 I1.293 J.068 E.04765
G1 X84.79 Y75.41 E.16231
M73 P39 R3
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16184
G2 X77.581 Y76.311 I.059 J.92 E.02451
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.519 Y76.48 E-.06846
G1 X77.49 Y76.695 E-.08259
G1 X77.49 Y78.298 E-.60895
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
G1 X77.544 Y76.391 F42000
G1 Z1.16
G1 E.8 F1800
G1 F1460
M204 S5000
G1 X77.549 Y76.396 E.00017
G2 X77.49 Y76.695 I.877 J.329 E.00771
G1 X77.49 Y103.308 E.66907
G2 X78.392 Y104.21 I.933 J-.031 E.03532
G1 X101.605 Y104.21 E.58361
G2 X102.51 Y103.305 I-.021 J-.926 E.03552
G1 X102.51 Y76.695 E.66901
M73 P40 R3
G2 X101.647 Y75.791 I-.936 J.029 E.0344
G1 X95.21 Y75.79 E.16184
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.888 Y76.637 I-.068 J1.292 E.04772
G1 X102.888 Y103.363 E.67193
G3 X101.595 Y104.59 I-1.297 J-.072 E.0494
G1 X78.406 Y104.59 E.58301
G3 X77.11 Y103.295 I0 J-1.295 E.05116
G1 X77.11 Y76.705 E.66849
M73 P41 R3
G3 X78.334 Y75.412 I1.306 J.01 E.04927
G1 X84.79 Y75.41 E.16231
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16184
G2 X77.65 Y76.2 I.073 J.933 E.02114
G1 X77.573 Y76.339 E.00399
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.549 Y76.396 E-.02356
G1 X77.49 Y76.695 E-.11595
G1 X77.49 Y78.328 E-.62049
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
G1 X77.545 Y76.389 F42000
G1 Z1.32
G1 E.8 F1800
G1 F1460
M204 S5000
G1 X77.549 Y76.396 E.00019
G2 X77.49 Y76.695 I.877 J.329 E.0077
G1 X77.49 Y103.305 E.66901
G2 X78.395 Y104.21 I.926 J-.021 E.03551
G1 X101.605 Y104.21 E.58354
M73 P42 R3
G2 X102.51 Y103.305 I-.021 J-.926 E.03553
G1 X102.51 Y76.695 E.66901
G2 X101.647 Y75.791 I-.936 J.029 E.0344
G1 X95.21 Y75.79 E.16185
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.89 Y76.705 I-.08 J1.304 E.04932
G1 X102.888 Y103.363 E.67022
G3 X101.597 Y104.59 I-1.305 J-.08 E.04926
G1 X78.406 Y104.59 E.58306
M73 P43 R3
G3 X77.11 Y103.295 I-.002 J-1.294 E.05118
G1 X77.112 Y76.637 E.67022
G3 X78.337 Y75.412 I1.308 J.083 E.04758
G1 X84.79 Y75.41 E.16224
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16185
G2 X77.651 Y76.199 I.074 J.934 E.02112
G1 X77.574 Y76.337 E.00396
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.549 Y76.396 E-.02432
G1 X77.49 Y76.695 E-.1159
G1 X77.49 Y78.326 E-.61978
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
G1 X77.553 Y76.368 F42000
G1 Z1.48
M73 P44 R3
G1 E.8 F1800
G1 F1460
M204 S5000
G1 X77.521 Y76.478 E.00289
G2 X77.49 Y76.693 I.897 J.239 E.00547
G1 X77.49 Y103.307 E.66912
G2 X78.395 Y104.21 I.926 J-.024 E.03546
G1 X101.605 Y104.21 E.58353
G2 X102.51 Y103.305 I-.015 J-.92 E.03558
G1 X102.51 Y76.693 E.66907
G2 X101.645 Y75.791 I-.928 J.024 E.03447
G1 X95.21 Y75.79 E.16178
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
M73 P45 R3
G3 X102.89 Y76.705 I-.072 J1.297 E.0494
G1 X102.888 Y103.363 E.67021
G3 X101.595 Y104.59 I-1.307 J-.082 E.04931
G1 X78.405 Y104.59 E.58302
G3 X77.11 Y103.295 I.004 J-1.299 E.05111
G1 X77.11 Y76.705 E.66849
G3 X78.337 Y75.412 I1.301 J.005 E.04938
G1 X84.79 Y75.41 E.16224
M73 P46 R3
G1 X84.79 Y75.79 E.00955
G1 X78.352 Y75.791 E.16186
G2 X77.581 Y76.315 I.066 J.926 E.02455
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.521 Y76.478 E-.06601
G1 X77.49 Y76.693 E-.08256
G1 X77.49 Y78.302 E-.61143
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
G1 X77.546 Y76.387 F42000
G1 Z1.64
G1 E.8 F1800
G1 F1460
M204 S5000
G1 X77.549 Y76.396 E.00024
G2 X77.49 Y76.695 I.877 J.329 E.00771
G1 X77.49 Y103.308 E.66907
G2 X78.392 Y104.21 I.928 J-.025 E.03537
G1 X101.608 Y104.21 E.58368
G2 X102.51 Y103.305 I-.024 J-.926 E.03545
G1 X102.51 Y76.695 E.66901
G2 X101.648 Y75.791 I-.936 J.029 E.03438
G1 X95.21 Y75.79 E.16186
M73 P47 R3
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.89 Y76.705 I-.08 J1.304 E.04932
G1 X102.888 Y103.363 E.67022
G3 X101.595 Y104.59 I-1.303 J-.079 E.04934
G1 X78.405 Y104.59 E.58301
G3 X77.11 Y103.295 I.005 J-1.301 E.0511
G1 X77.11 Y76.705 E.66849
M73 P48 R3
G3 X78.337 Y75.412 I1.294 J-.001 E.04944
G1 X84.79 Y75.41 E.16224
G1 X84.79 Y75.79 E.00955
G1 X78.352 Y75.791 E.16186
G2 X77.651 Y76.199 I.074 J.934 E.0211
G1 X77.576 Y76.334 E.00388
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.549 Y76.396 E-.02544
G1 X77.49 Y76.695 E-.11599
G1 X77.49 Y78.323 E-.61858
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
G1 X77.547 Y76.385 F42000
G1 Z1.8
G1 E.8 F1800
G1 F1460
M204 S5000
G1 X77.549 Y76.396 E.00027
G2 X77.49 Y76.695 I.877 J.329 E.00771
G1 X77.49 Y103.308 E.66907
G2 X78.395 Y104.21 I.928 J-.026 E.03544
G1 X101.605 Y104.21 E.58353
G2 X102.51 Y103.305 I-.021 J-.926 E.03553
G1 X102.51 Y76.693 E.66906
M73 P49 R3
G2 X101.647 Y75.791 I-.936 J.032 E.03434
G1 X95.21 Y75.79 E.16185
M73 P49 R2
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.89 Y76.705 I-.08 J1.304 E.04932
G1 X102.888 Y103.366 E.67027
G3 X101.595 Y104.59 I-1.304 J-.083 E.04927
G1 X78.405 Y104.59 E.58301
M73 P50 R2
G3 X77.11 Y103.295 I-.004 J-1.291 E.0512
G1 X77.11 Y76.705 E.66849
G3 X78.334 Y75.412 I1.299 J.004 E.04933
G1 X84.79 Y75.41 E.16231
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16185
G2 X77.651 Y76.199 I.073 J.934 E.02112
G1 X77.576 Y76.333 E.00384
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.549 Y76.396 E-.02607
G1 X77.49 Y76.695 E-.11596
G1 X77.49 Y78.321 E-.61797
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
G1 X77.555 Y76.364 F42000
G1 Z1.96
G1 E.8 F1800
G1 F1460
M204 S5000
G1 X77.521 Y76.477 E.00297
G2 X77.49 Y76.692 I.897 J.24 E.00548
G1 X77.49 Y103.308 E.66914
G2 X78.395 Y104.21 I.926 J-.024 E.03546
G1 X101.605 Y104.21 E.58353
M73 P51 R2
G2 X102.51 Y103.305 I-.021 J-.926 E.03552
G1 X102.51 Y76.693 E.66906
G2 X101.645 Y75.791 I-.938 J.034 E.03439
G1 X95.21 Y75.79 E.16178
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.89 Y76.705 I-.072 J1.297 E.04939
G1 X102.888 Y103.363 E.67022
M73 P52 R2
G3 X101.595 Y104.59 I-1.297 J-.072 E.04939
G1 X78.405 Y104.59 E.58301
G3 X77.11 Y103.295 I-.001 J-1.294 E.05117
G1 X77.11 Y76.705 E.6685
G3 X78.334 Y75.412 I1.295 J0 E.04937
G1 X84.79 Y75.41 E.16231
G1 X84.79 Y75.79 E.00955
G1 X78.355 Y75.791 E.16178
M73 P53 R2
G2 X77.583 Y76.311 I.063 J.926 E.02453
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.521 Y76.477 E-.06717
G1 X77.49 Y76.692 E-.08271
G1 X77.49 Y78.298 E-.61013
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
G1 X77.554 Y76.366 F42000
G1 Z2.12
G1 E.8 F1800
G1 F1460
M204 S5000
G1 X77.521 Y76.48 E.00299
G2 X77.49 Y76.695 I.898 J.237 E.00547
G1 X77.49 Y103.308 E.6691
G2 X78.395 Y104.21 I.929 J-.027 E.03542
G1 X101.605 Y104.21 E.58353
G2 X102.51 Y103.305 I-.015 J-.92 E.03558
G1 X102.51 Y76.695 E.66901
G2 X101.647 Y75.791 I-.939 J.032 E.03437
G1 X95.21 Y75.79 E.16185
M73 P54 R2
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.89 Y76.705 I-.08 J1.304 E.04932
G1 X102.888 Y103.366 E.67028
G3 X101.597 Y104.59 I-1.293 J-.07 E.04932
G1 X78.403 Y104.59 E.58313
G3 X77.11 Y103.295 I.001 J-1.293 E.05112
G1 X77.11 Y76.705 E.66849
G3 X78.336 Y75.412 I1.307 J.011 E.04929
G1 X84.79 Y75.41 E.16227
M73 P55 R2
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16185
G2 X77.582 Y76.313 I.066 J.926 E.02451
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.521 Y76.48 E-.06757
G1 X77.49 Y76.695 E-.08245
G1 X77.49 Y78.3 E-.60998
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
G1 X77.549 Y76.381 F42000
G1 Z2.28
G1 E.8 F1800
G1 F1460
M204 S5000
G1 X77.549 Y76.396 E.00038
G2 X77.49 Y76.695 I.877 J.329 E.00771
G1 X77.49 Y103.305 E.66901
G2 X78.392 Y104.21 I.926 J-.021 E.03546
G1 X101.605 Y104.21 E.58359
G2 X102.51 Y103.305 I-.019 J-.924 E.03554
G1 X102.51 Y76.693 E.66906
M73 P56 R2
G2 X101.647 Y75.791 I-.928 J.024 E.03442
G1 X95.21 Y75.79 E.16184
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.89 Y76.705 I-.072 J1.297 E.04939
G1 X102.888 Y103.366 E.67028
G3 X101.595 Y104.59 I-1.304 J-.083 E.04926
G1 X78.405 Y104.59 E.58301
G3 X77.11 Y103.295 I-.001 J-1.294 E.05117
G1 X77.11 Y76.705 E.66851
M73 P57 R2
G3 X78.334 Y75.412 I1.293 J-.002 E.04938
G1 X84.79 Y75.41 E.16231
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16184
G2 X77.651 Y76.199 I.074 J.934 E.02112
G1 X77.579 Y76.328 E.00371
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.549 Y76.396 E-.0279
G1 X77.49 Y76.695 E-.11597
G1 X77.49 Y78.316 E-.61614
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
G1 X77.55 Y76.379 F42000
G1 Z2.44
G1 E.8 F1800
G1 F1460
M204 S5000
G1 X77.549 Y76.396 E.00042
G2 X77.49 Y76.695 I.877 J.329 E.00769
G1 X77.49 Y103.308 E.66907
G2 X78.395 Y104.21 I.926 J-.024 E.03546
G1 X101.605 Y104.21 E.58353
M73 P58 R2
G2 X102.51 Y103.305 I-.021 J-.926 E.03552
G1 X102.51 Y76.695 E.66901
G2 X101.647 Y75.791 I-.922 J.016 E.03452
G1 X95.21 Y75.79 E.16184
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.888 Y76.637 I-.068 J1.292 E.04772
G1 X102.888 Y103.363 E.67194
G3 X101.595 Y104.59 I-1.293 J-.068 E.04944
G1 X78.405 Y104.59 E.58301
M73 P59 R2
G3 X77.11 Y103.295 I-.001 J-1.294 E.05117
G1 X77.11 Y76.705 E.66849
G3 X78.334 Y75.412 I1.295 J-.001 E.04938
G1 X84.79 Y75.41 E.16231
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16184
G2 X77.65 Y76.2 I.074 J.934 E.02115
G1 X77.579 Y76.327 E.00365
; WIPE_START
M73 P60 R2
G1 F11668.197
M204 S6000
G1 X77.549 Y76.396 E-.0287
G1 X77.49 Y76.695 E-.11574
G1 X77.49 Y78.315 E-.61556
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
G1 X77.554 Y76.365 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1461
M204 S5000
G1 X77.518 Y76.478 E.00299
G2 X77.49 Y76.693 I.885 J.225 E.00546
G1 X77.49 Y103.308 E.66914
G2 X78.395 Y104.21 I.926 J-.024 E.03545
G1 X101.605 Y104.21 E.58353
G2 X102.51 Y103.305 I-.019 J-.924 E.03555
G1 X102.51 Y76.693 E.66905
G2 X101.647 Y75.791 I-.928 J.024 E.03443
G1 X95.21 Y75.79 E.16184
M73 P61 R2
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.888 Y76.637 I-.068 J1.293 E.04771
G1 X102.888 Y103.364 E.67196
G3 X101.597 Y104.59 I-1.297 J-.073 E.04931
G1 X78.405 Y104.59 E.58307
G3 X77.11 Y103.295 I-.001 J-1.294 E.05117
G1 X77.11 Y76.705 E.66851
G3 X78.336 Y75.412 I1.294 J0 E.0494
G1 X84.79 Y75.41 E.16227
M73 P62 R2
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16184
G2 X77.579 Y76.31 I.05 J.912 E.02459
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.518 Y76.478 E-.06785
G1 X77.49 Y76.693 E-.08239
G1 X77.49 Y78.298 E-.60977
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
G1 X77.555 Y76.364 F42000
G1 Z2.76
G1 E.8 F1800
G1 F1461
M204 S5000
G1 X77.521 Y76.48 E.00302
G2 X77.49 Y76.695 I.898 J.237 E.00548
G1 X77.49 Y103.305 E.66901
G2 X78.395 Y104.21 I.93 J-.025 E.03549
G1 X101.605 Y104.21 E.58353
G2 X102.51 Y103.305 I-.007 J-.912 E.03567
G1 X102.51 Y76.693 E.66905
G2 X101.647 Y75.791 I-.916 J.012 E.03454
G1 X95.21 Y75.79 E.16184
M73 P63 R2
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.89 Y76.705 I-.072 J1.297 E.0494
G1 X102.888 Y103.366 E.67028
G3 X101.595 Y104.59 I-1.293 J-.07 E.04938
G1 X78.405 Y104.59 E.58301
G3 X77.11 Y103.295 I.003 J-1.299 E.05112
G1 X77.11 Y76.705 E.66849
M73 P64 R2
G3 X78.334 Y75.412 I1.307 J.011 E.04926
G1 X84.79 Y75.41 E.16231
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16184
G2 X77.583 Y76.312 I.065 J.926 E.02448
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.521 Y76.48 E-.06797
G1 X77.49 Y76.695 E-.08265
G1 X77.49 Y78.299 E-.60938
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

; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 18/30
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
G1 X77.55 Y76.377 F42000
G1 Z2.92
G1 E.8 F1800
G1 F1460
M204 S5000
G1 X77.549 Y76.397 E.0005
G2 X77.49 Y76.695 I.877 J.328 E.00768
G1 X77.49 Y103.308 E.66907
G2 X78.395 Y104.21 I.93 J-.028 E.03542
G1 X101.605 Y104.21 E.58353
G2 X102.51 Y103.308 I-.015 J-.92 E.03552
G1 X102.51 Y76.692 E.66914
M73 P65 R2
G2 X101.647 Y75.791 I-.916 J.013 E.03452
G1 X95.21 Y75.79 E.16184
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.89 Y76.705 I-.08 J1.304 E.04932
G1 X102.888 Y103.366 E.67028
G3 X101.595 Y104.59 I-1.297 J-.075 E.04933
G1 X78.405 Y104.59 E.58301
M73 P66 R2
G3 X77.11 Y103.295 I.003 J-1.299 E.0511
G1 X77.11 Y76.705 E.66853
M73 P66 R1
G3 X78.336 Y75.412 I1.307 J.012 E.04928
G1 X84.79 Y75.41 E.16226
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16184
G2 X77.605 Y76.274 I.073 J.933 E.02333
G1 X77.579 Y76.324 E.00141
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.549 Y76.397 E-.02994
G1 X77.49 Y76.695 E-.1156
G1 X77.49 Y78.312 E-.61446
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
G1 X77.555 Y76.363 F42000
G1 Z3.08
G1 E.8 F1800
G1 F1460
M204 S5000
G1 X77.522 Y76.479 E.00303
G2 X77.49 Y76.693 I.904 J.245 E.00545
G1 X77.49 Y103.308 E.66913
G2 X78.395 Y104.21 I.933 J-.031 E.03538
G1 X101.605 Y104.21 E.58353
M73 P67 R1
G2 X102.51 Y103.305 I-.015 J-.921 E.03557
G1 X102.51 Y76.693 E.66907
G2 X101.647 Y75.791 I-.916 J.012 E.03453
G1 X95.21 Y75.79 E.16184
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.89 Y76.705 I-.08 J1.304 E.04932
G1 X102.888 Y103.366 E.67028
M73 P68 R1
G3 X101.595 Y104.59 I-1.293 J-.07 E.04938
G1 X78.403 Y104.59 E.58307
G3 X77.11 Y103.295 I.002 J-1.294 E.0511
G1 X77.112 Y76.637 E.67022
G3 X78.334 Y75.412 I1.291 J.066 E.04767
G1 X84.79 Y75.41 E.16231
M73 P69 R1
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16184
G2 X77.585 Y76.313 I.073 J.934 E.02443
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.522 Y76.479 E-.06746
G1 X77.49 Y76.693 E-.08224
G1 X77.49 Y78.299 E-.6103
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
G1 X77.553 Y76.372 F42000
G1 Z3.24
G1 E.8 F1800
G1 F1460
M204 S5000
G1 X77.544 Y76.394 E.00059
G2 X77.49 Y76.695 I.861 J.311 E.00773
G1 X77.49 Y103.308 E.66907
G2 X78.395 Y104.21 I.926 J-.024 E.03546
G1 X101.605 Y104.21 E.58353
G2 X102.51 Y103.305 I-.007 J-.912 E.03567
G1 X102.51 Y76.695 E.66901
G2 X101.647 Y75.791 I-.928 J.022 E.03447
G1 X95.21 Y75.79 E.16184
M73 P70 R1
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.89 Y76.705 I-.08 J1.304 E.04932
G1 X102.888 Y103.363 E.67022
G3 X101.595 Y104.59 I-1.293 J-.068 E.04944
G1 X78.405 Y104.59 E.58301
G3 X77.11 Y103.295 I-.001 J-1.294 E.05117
G1 X77.11 Y76.705 E.66849
G3 X78.334 Y75.412 I1.307 J.011 E.04926
G1 X84.79 Y75.41 E.16231
M73 P71 R1
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16184
G2 X77.645 Y76.195 I.053 J.914 E.02124
G1 X77.581 Y76.319 E.0035
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.544 Y76.394 E-.03166
G1 X77.49 Y76.695 E-.11624
G1 X77.49 Y78.306 E-.6121
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
G1 X77.554 Y76.371 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1460
M204 S5000
G1 X77.549 Y76.396 E.00063
G2 X77.49 Y76.695 I.877 J.329 E.00771
G1 X77.49 Y103.305 E.66901
G2 X78.395 Y104.21 I.933 J-.028 E.03545
G1 X101.605 Y104.21 E.58353
G2 X102.51 Y103.309 I-.021 J-.926 E.03543
G1 X102.51 Y76.695 E.6691
M73 P72 R1
G2 X101.647 Y75.791 I-.936 J.029 E.0344
G1 X95.21 Y75.79 E.16184
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.888 Y76.637 I-.067 J1.292 E.04772
G1 X102.888 Y103.364 E.67197
G3 X101.595 Y104.59 I-1.305 J-.082 E.04929
G1 X78.403 Y104.59 E.58307
G3 X77.11 Y103.295 I.001 J-1.294 E.05111
G1 X77.112 Y76.637 E.67022
M73 P73 R1
G3 X78.336 Y75.412 I1.289 J.064 E.04774
G1 X84.79 Y75.41 E.16225
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16184
G2 X77.651 Y76.199 I.073 J.934 E.02112
G1 X77.584 Y76.319 E.00345
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.549 Y76.396 E-.03196
G1 X77.49 Y76.695 E-.11597
G1 X77.49 Y78.306 E-.61207
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
G1 X77.556 Y76.36 F42000
G1 Z3.56
G1 E.8 F1800
G1 F1460
M204 S5000
G1 X77.519 Y76.48 E.00315
G2 X77.49 Y76.695 I.893 J.232 E.00547
G1 X77.49 Y103.305 E.66903
G2 X78.395 Y104.21 I.931 J-.026 E.03547
G1 X101.605 Y104.21 E.58353
M73 P74 R1
G2 X102.51 Y103.309 I-.021 J-.926 E.03542
G1 X102.51 Y76.694 E.66915
G2 X101.647 Y75.791 I-.936 J.031 E.03436
G1 X95.21 Y75.79 E.16184
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.89 Y76.705 I-.072 J1.297 E.0494
G1 X102.888 Y103.366 E.67028
G3 X101.595 Y104.59 I-1.304 J-.083 E.04926
G1 X78.403 Y104.59 E.58307
M73 P75 R1
G3 X77.11 Y103.295 I.013 J-1.306 E.05099
G1 X77.11 Y76.705 E.66849
G3 X78.337 Y75.412 I1.292 J-.003 E.04946
G1 X84.79 Y75.41 E.16224
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16184
G2 X77.583 Y76.307 I.059 J.92 E.0244
; WIPE_START
G1 F11668.197
M204 S6000
M73 P76 R1
G1 X77.519 Y76.48 E-.07001
G1 X77.49 Y76.695 E-.08249
G1 X77.49 Y78.293 E-.60749
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
G1 X77.558 Y76.358 F42000
G1 Z3.72
G1 E.8 F1800
G1 F1460
M204 S5000
G1 X77.522 Y76.479 E.00317
G2 X77.49 Y76.695 I.904 J.245 E.0055
G1 X77.49 Y103.308 E.66907
G2 X78.395 Y104.21 I.933 J-.031 E.03539
G1 X101.605 Y104.21 E.58353
G2 X102.51 Y103.308 I-.015 J-.92 E.03549
G1 X102.51 Y76.695 E.6691
G2 X101.647 Y75.791 I-.928 J.022 E.03447
G1 X95.21 Y75.79 E.16184
M73 P77 R1
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.89 Y76.705 I-.08 J1.304 E.04933
G1 X102.888 Y103.362 E.67019
G3 X101.595 Y104.59 I-1.293 J-.067 E.04946
G1 X78.405 Y104.59 E.58301
G3 X77.11 Y103.295 I.001 J-1.296 E.05115
G1 X77.112 Y76.637 E.67022
G3 X78.334 Y75.412 I1.289 J.064 E.04769
G1 X84.79 Y75.41 E.1623
M73 P78 R1
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16184
G2 X77.588 Y76.307 I.073 J.933 E.02427
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.522 Y76.479 E-.06996
G1 X77.49 Y76.695 E-.0829
G1 X77.49 Y78.293 E-.60714
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
G1 X77.556 Y76.361 F42000
G1 Z3.88
G1 E.8 F1800
G1 F1460
M204 S5000
G1 X77.522 Y76.48 E.00311
G2 X77.49 Y76.695 I.904 J.244 E.00548
G1 X77.49 Y103.305 E.66901
G2 X78.395 Y104.21 I.926 J-.021 E.03552
G1 X101.605 Y104.21 E.58353
G2 X102.51 Y103.308 I-.021 J-.926 E.03546
G1 X102.51 Y76.695 E.66907
M73 P79 R1
G2 X101.647 Y75.791 I-.921 J.015 E.03453
G1 X95.21 Y75.79 E.16184
G1 X95.21 Y75.41 E.00955
G1 X101.666 Y75.412 E.1623
G3 X102.89 Y76.705 I-.083 J1.304 E.04927
G1 X102.888 Y103.363 E.67022
G3 X101.595 Y104.59 I-1.297 J-.072 E.04939
G1 X78.405 Y104.59 E.58302
G3 X77.11 Y103.295 I.001 J-1.296 E.05115
G1 X77.11 Y76.705 E.66849
M73 P80 R1
G3 X78.334 Y75.412 I1.295 J-.001 E.04938
G1 X84.79 Y75.41 E.1623
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16184
G2 X77.586 Y76.311 I.073 J.934 E.02439
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.522 Y76.48 E-.06849
G1 X77.49 Y76.695 E-.08259
G1 X77.49 Y78.297 E-.60892
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
G1 X77.556 Y76.361 F42000
G1 Z4.04
G1 E.8 F1800
G1 F1460
M204 S5000
G1 X77.523 Y76.478 E.00305
G2 X77.49 Y76.692 I.903 J.247 E.00547
G1 X77.49 Y103.308 E.66916
G2 X78.395 Y104.21 I.926 J-.024 E.03545
G1 X101.605 Y104.21 E.58353
M73 P81 R1
G2 X102.51 Y103.305 I-.021 J-.926 E.03552
G1 X102.51 Y76.692 E.66909
G2 X101.647 Y75.791 I-.921 J.018 E.03445
G1 X95.21 Y75.79 E.16184
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.89 Y76.705 I-.072 J1.297 E.0494
G1 X102.888 Y103.363 E.67022
G3 X101.597 Y104.59 I-1.297 J-.072 E.04933
G1 X78.405 Y104.59 E.58307
M73 P82 R1
G3 X77.11 Y103.295 I0 J-1.296 E.05115
G1 X77.11 Y76.705 E.66849
G3 X78.334 Y75.412 I1.295 J-.001 E.04938
G1 X84.79 Y75.41 E.1623
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16184
G2 X77.586 Y76.311 I.073 J.934 E.02438
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.523 Y76.478 E-.06762
G1 X77.49 Y76.692 E-.08242
G1 X77.49 Y78.297 E-.60996
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
G1 X77.9 Y95.639 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
M73 P83 R1
G1 F600
M204 S6000
G1 X77.518 Y95.639 E.01036
M106 S201.45
G1 F1166.154
G1 X77.518 Y95.361 E.00755
M106 S255
G1 F600
G1 X77.9 Y95.361 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X78.089 Y95.361 E.00513
G1 X78.089 Y95.639 E.00755
M106 S201.45
M106 S255
G1 F3000
G1 X77.96 Y95.639 E.0035
M106 S201.45
; WIPE_START
M204 S6000
G1 X77.518 Y95.639 E-.1977
G1 X77.518 Y95.361 E-.12451
G1 X77.9 Y95.361 E-.1709
G1 X78.089 Y95.361 E-.08459
G1 X78.089 Y95.639 E-.12451
G1 X77.96 Y95.639 E-.05778
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.201 J.196 P1  F42000
G1 X81.139 Y76.2 Z4.6
G1 Z4.2
G1 E.8 F1800
M106 S255
G1 F3000
M204 S5000
G1 X81.139 Y76.589 E.01054
M106 S201.45
M106 S255
G1 F600
G1 X80.861 Y76.589 E.00755
G1 X80.861 Y76.201 E.01054
M106 S201.45
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X80.861 Y75.818 E.01036
M106 S201.45
G1 F1166.154
G1 X81.139 Y75.818 E.00755
M106 S255
G1 F600
G1 X81.139 Y76.14 E.00874
M106 S201.45
; WIPE_START
G1 X81.139 Y76.589 E-.17056
G1 X80.861 Y76.589 E-.1059
G1 X80.861 Y76.201 E-.14774
M73 P83 R0
G1 X80.861 Y75.818 E-.14535
G1 X81.139 Y75.818 E-.1059
G1 X81.139 Y76.04 E-.08454
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I-.314 J1.176 P1  F42000
G1 X102.1 Y81.639 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X101.911 Y81.639 E.00513
G1 X101.911 Y81.361 E.00755
G1 X102.1 Y81.361 E.00513
M106 S201.45
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X102.483 Y81.361 E.01036
M106 S201.45
G1 F1181.715
G1 X102.489 Y81.639 E.00755
G1 F622.195
G1 X102.483 Y81.639 E.00018
M106 S255
G1 F600
G1 X102.16 Y81.639 E.00874
M106 S201.45
; WIPE_START
G1 X101.911 Y81.639 E-.11097
G1 X101.911 Y81.361 E-.12404
G1 X102.1 Y81.361 E-.08427
G1 X102.483 Y81.361 E-.17024
G1 X102.489 Y81.639 E-.12407
G1 X102.483 Y81.639 E-.00288
G1 X102.16 Y81.639 E-.14354
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I-1.217 J-.004 P1  F42000
G1 X102.1 Y100.639 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X101.911 Y100.639 E.00513
G1 X101.911 Y100.361 E.00755
G1 X102.1 Y100.361 E.00513
M106 S201.45
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X102.483 Y100.361 E.01036
M106 S201.45
G1 F1178.702
G1 X102.488 Y100.639 E.00755
G1 F617.917
G1 X102.483 Y100.639 E.00014
M106 S255
G1 F600
G1 X102.16 Y100.639 E.00874
M106 S201.45
; WIPE_START
G1 X101.911 Y100.639 E-.11105
G1 X101.911 Y100.361 E-.12413
G1 X102.1 Y100.361 E-.08433
G1 X102.483 Y100.361 E-.17037
G1 X102.488 Y100.639 E-.12415
G1 X102.483 Y100.639 E-.00233
G1 X102.16 Y100.639 E-.14364
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I.936 J-.778 P1  F42000
G1 X81.54 Y75.831 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
M204 S5000
G1 X81.54 Y76.2 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X81.54 Y76.99 E.02139
G1 X80.46 Y76.99 E.02927
G1 X80.46 Y76.201 E.02139
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X80.46 Y75.832 E.00928
M106 S201.45
G1 F749.426
G1 X80.46 Y75.79 E.00105
G1 F2352
G1 X80.06 Y75.79 E.01006
G1 X79.66 Y75.79 E.01006
G1 X79.26 Y75.79 E.01006
G1 X78.395 Y75.79 E.02175
G2 X77.49 Y76.694 I.028 J.933 E.03544
G1 X77.49 Y93.76 E.42905
G1 X77.49 Y94.16 E.01006
G1 X77.49 Y94.56 E.01006
G1 X77.49 Y94.96 E.01006
G1 F747.227
G1 X77.531 Y94.96 E.00103
M106 S255
G1 F600
G1 X77.9 Y94.96 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X78.49 Y94.96 E.01599
G1 X78.49 Y96.04 E.02927
G1 X77.9 Y96.04 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X77.531 Y96.04 E.00928
M106 S201.45
G1 F747.227
G1 X77.49 Y96.04 E.00103
G1 F2352
G1 X77.49 Y96.44 E.01006
G1 X77.49 Y96.84 E.01006
G1 X77.49 Y97.24 E.01006
G1 X77.49 Y103.305 E.15248
G2 X78.395 Y104.21 I.926 J-.021 E.03552
G1 X101.605 Y104.21 E.58353
M73 P84 R0
G2 X102.509 Y103.348 I-.007 J-.913 E.03459
G1 X102.51 Y102.24 E.02786
G1 X102.51 Y101.84 E.01006
G1 X102.51 Y101.44 E.01006
G1 X102.51 Y101.04 E.01006
G1 F747.53
G1 X102.469 Y101.04 E.00103
M106 S255
G1 F600
G1 X102.1 Y101.04 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X101.51 Y101.04 E.01599
G1 X101.51 Y99.96 E.02927
G1 X102.1 Y99.96 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X102.469 Y99.96 E.00928
M106 S201.45
G1 F747.227
G1 X102.51 Y99.96 E.00103
G1 F2352
G1 X102.51 Y99.56 E.01006
G1 X102.51 Y99.16 E.01006
G1 X102.51 Y98.76 E.01006
G1 X102.51 Y83.24 E.39019
G1 X102.51 Y82.84 E.01006
G1 X102.51 Y82.44 E.01006
G1 X102.51 Y82.04 E.01006
G1 F747.227
G1 X102.469 Y82.04 E.00103
M106 S255
G1 F600
G1 X102.1 Y82.04 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X101.51 Y82.04 E.01599
G1 X101.51 Y80.96 E.02927
G1 X102.1 Y80.96 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X102.469 Y80.96 E.00928
M106 S201.45
G1 F747.227
G1 X102.51 Y80.96 E.00103
G1 F2352
G1 X102.51 Y80.56 E.01006
G1 X102.51 Y80.16 E.01006
G1 X102.51 Y79.76 E.01006
G1 X102.51 Y76.695 E.07706
G2 X101.647 Y75.791 I-.936 J.029 E.0344
G1 X95.21 Y75.79 E.16184
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16225
G3 X102.89 Y76.705 I-.08 J1.304 E.04932
G1 X102.888 Y103.363 E.67022
G3 X101.595 Y104.59 I-1.304 J-.08 E.04932
G1 X78.405 Y104.59 E.58301
G3 X77.11 Y103.297 I0 J-1.295 E.05109
G1 X77.11 Y76.705 E.66856
M73 P85 R0
G3 X78.337 Y75.412 I1.307 J.011 E.04931
G1 X84.79 Y75.41 E.16225
G1 X84.79 Y75.79 E.00955
G1 X81.559 Y75.79 E.08124
; WIPE_START
G1 F11668.197
M204 S6000
G1 X81.54 Y76.2 E-.15613
G1 X81.54 Y76.99 E-.30003
G1 X80.74 Y76.99 E-.30384
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
G1 X80.46 Y75.79 F42000
G1 Z4.36
G1 E.8 F1800
G1 F1659
M204 S5000
G1 X78.395 Y75.79 E.05192
G2 X77.49 Y76.692 I.021 J.926 E.03545
G1 X77.49 Y94.96 E.45928
G1 X78.49 Y94.96 E.02514
G1 X78.49 Y96.04 E.02715
G1 X77.49 Y96.04 E.02514
G1 X77.49 Y103.308 E.18273
G2 X78.393 Y104.21 I.933 J-.031 E.03532
G1 X101.605 Y104.21 E.58359
G2 X102.509 Y103.348 I-.01 J-.916 E.03456
G1 X102.51 Y101.04 E.05803
G1 X101.51 Y101.04 E.02514
G1 X101.51 Y99.96 E.02715
M73 P86 R0
G1 X102.51 Y99.96 E.02514
G1 X102.51 Y82.04 E.45053
G1 X101.51 Y82.04 E.02514
G1 X101.51 Y80.96 E.02715
G1 X102.51 Y80.96 E.02514
G1 X102.51 Y76.692 E.1073
G2 X101.647 Y75.791 I-.928 J.025 E.03439
G1 X95.21 Y75.79 E.16184
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.89 Y76.705 I-.08 J1.304 E.04933
G1 X102.888 Y103.363 E.67022
G3 X101.595 Y104.59 I-1.298 J-.073 E.04938
G1 X78.403 Y104.59 E.58307
G3 X77.11 Y103.295 I.001 J-1.294 E.0511
G1 X77.112 Y76.637 E.67022
M73 P87 R0
G3 X78.334 Y75.412 I1.293 J.068 E.04765
G1 X84.79 Y75.41 E.1623
G1 X84.79 Y75.79 E.00955
G1 X81.54 Y75.79 E.08171
G1 X81.54 Y76.99 E.03017
G1 X80.46 Y76.99 E.02715
G1 X80.46 Y75.85 E.02866
; WIPE_START
G1 F11668.197
M204 S6000
G1 X78.461 Y75.792 E-.76
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

G1 X81.328 Y76.147
G1 Z4.36
G1 E.8 F1800
; FEATURE: Top surface
G1 F1659
M204 S2000
G1 X80.805 Y75.623 E.01861
G1 X80.672 Y76.036
G1 X81.328 Y76.692 E.02332
; WIPE_START
G1 F11668.197
M204 S6000
G1 X80.672 Y76.036 E-.35243
G1 X80.805 Y75.623 E-.1648
G1 X81.256 Y76.075 E-.24278
; WIPE_END
G1 E-.03999 F1800
M204 S10000
G17
G3 Z4.76 I-1.193 J-.238 P1  F42000
G1 X77.446 Y95.172 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F1659
M204 S2000
G1 X78.102 Y95.828 E.02332
M204 S10000
G1 X78.263 Y95.847 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102989
G1 F1659
M204 S6000
G1 X78.263 Y95.153 E.00311
; WIPE_START
G1 F18000
G1 X78.263 Y95.847 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.76 I-.24 J1.193 P1  F42000
G1 X102.676 Y100.767 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
M73 P88 R0
G1 F1659
M204 S2000
G1 X102.081 Y100.172 E.02117
G1 X101.722 Y100.359
G1 X102.191 Y100.828 E.01668
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.722 Y100.359 E-.26406
G1 X102.081 Y100.172 E-.16093
G1 X102.676 Y100.767 E-.33501
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.479 Y93.138 Z4.76 F42000
G1 X102.17 Y81.172 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F1659
M204 S2000
G1 X102.678 Y81.68 E.01804
G1 X102.281 Y81.828
G1 X101.722 Y81.269 E.01985
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.281 Y81.828 E-.31079
G1 X102.678 Y81.68 E-.1668
G1 X102.17 Y81.172 E-.28241
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/30
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.76 I-1.217 J-.01 P1  F42000
G1 X101.99 Y104.119 Z4.76
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1470
M204 S5000
G2 X102.51 Y103.305 I-.4 J-.829 E.02555
G1 X102.51 Y76.692 E.66909
G2 X101.647 Y75.791 I-.936 J.032 E.03433
G1 X95.21 Y75.79 E.16184
M73 P89 R0
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.89 Y76.705 I-.08 J1.304 E.04933
G1 X102.888 Y103.363 E.67022
G3 X101.595 Y104.59 I-1.293 J-.068 E.04944
G1 X78.405 Y104.59 E.58301
G3 X77.11 Y103.295 I-.001 J-1.294 E.05117
G1 X77.11 Y76.705 E.6685
G3 X78.334 Y75.412 I1.299 J.004 E.04933
G1 X84.79 Y75.41 E.1623
M73 P90 R0
G1 X84.79 Y75.79 E.00955
G1 X78.355 Y75.791 E.16178
G2 X77.49 Y76.692 I.07 J.934 E.03439
G1 X77.49 Y103.308 E.66916
G2 X78.395 Y104.21 I.926 J-.024 E.03545
G1 X101.605 Y104.21 E.58353
G2 X101.935 Y104.143 I-.015 J-.92 E.00852
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.1 Y104.061 E-.07018
G1 X102.244 Y103.944 E-.07032
G1 X102.357 Y103.806 E-.06773
G1 X102.457 Y103.607 E-.08468
G1 X102.492 Y103.48 E-.04999
G1 X102.51 Y103.305 E-.06678
G1 X102.51 Y102.383 E-.35033
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
M73 P91 R0
G1 X101.984 Y104.119 F42000
G1 Z4.68
G1 E.8 F1800
G1 F1460
M204 S5000
G2 X102.51 Y103.308 I-.4 J-.835 E.02557
G1 X102.51 Y76.695 E.66908
G2 X101.647 Y75.791 I-.928 J.022 E.03447
G1 X95.21 Y75.79 E.16184
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.89 Y76.701 I-.08 J1.304 E.04922
G1 X102.888 Y103.363 E.67033
G3 X101.595 Y104.59 I-1.293 J-.068 E.04944
G1 X78.403 Y104.59 E.58307
G3 X77.11 Y103.295 I.013 J-1.306 E.05098
G1 X77.112 Y76.637 E.67022
M73 P92 R0
G3 X78.334 Y75.412 I1.292 J.067 E.04766
G1 X84.79 Y75.41 E.1623
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16184
G2 X77.49 Y76.695 I.065 J.926 E.03446
G1 X77.49 Y103.305 E.66902
G2 X78.395 Y104.21 I.926 J-.022 E.03552
G1 X101.605 Y104.21 E.58353
M73 P93 R0
G2 X101.929 Y104.143 I-.021 J-.926 E.00837
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.144 Y104.03 E-.09238
G1 X102.242 Y103.946 E-.04896
G1 X102.357 Y103.806 E-.06879
G1 X102.456 Y103.609 E-.08369
G1 X102.501 Y103.433 E-.06898
G1 X102.51 Y103.308 E-.0478
G1 X102.51 Y102.388 E-.3494
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
G1 X102.209 Y103.968 F42000
G1 Z4.84
G1 E.8 F1800
G1 F1460
M204 S5000
G2 X102.51 Y103.305 I-.625 J-.684 E.0188
G1 X102.51 Y76.695 E.66903
G2 X101.645 Y75.791 I-.936 J.03 E.03445
G1 X95.21 Y75.79 E.16178
G1 X95.21 Y75.41 E.00955
G1 X101.663 Y75.412 E.16224
G3 X102.89 Y76.705 I-.08 J1.304 E.04933
G1 X102.888 Y103.363 E.67022
G3 X101.595 Y104.59 I-1.293 J-.068 E.04944
G1 X78.405 Y104.59 E.58301
M73 P94 R0
G3 X77.11 Y103.297 I-.001 J-1.294 E.0511
G1 X77.112 Y76.637 E.67028
G3 X78.334 Y75.412 I1.298 J.073 E.04761
G1 X84.79 Y75.41 E.1623
G1 X84.79 Y75.79 E.00955
G1 X78.353 Y75.791 E.16184
G2 X77.49 Y76.692 I.074 J.934 E.03432
G1 X77.49 Y103.308 E.66916
G2 X78.395 Y104.21 I.933 J-.031 E.03538
G1 X101.605 Y104.21 E.58353
M73 P95 R0
G2 X102.163 Y104.007 I-.021 J-.926 E.01521
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.302 Y103.879 E-.07159
G1 X102.404 Y103.727 E-.06976
G1 X102.492 Y103.48 E-.0995
G1 X102.51 Y103.305 E-.06677
G1 X102.51 Y102.115 E-.45237
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
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
M73 P96 R0
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


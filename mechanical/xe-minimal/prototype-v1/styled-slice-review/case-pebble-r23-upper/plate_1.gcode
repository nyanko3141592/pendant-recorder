; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 6m 3s; total estimated time: 6m 22s
; total layer number: 30
; total filament length [mm] : 441.51
; total filament volume [cm^3] : 1061.97
; total filament weight [g] : 1.32
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
G1 X76.602 Y91.746 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X76.6 Y91.747 E.00011
G3 X74.5 Y91.106 I-.95 J-.649 E.10862
G1 X74.5 Y88.89 E.08255
G3 X75.45 Y87.767 I1.15 J.009 E.05946
M73 P5 R6
G3 X76.8 Y88.893 I.197 J1.136 E.07448
G1 X76.8 Y91.11 E.08255
G3 X76.686 Y91.599 I-1.15 J-.011 E.01885
G1 X76.632 Y91.694 E.00407
; WIPE_START
G1 X76.6 Y91.747 E-.02375
G1 X76.496 Y91.88 E-.06412
G1 X76.319 Y92.036 E-.08943
G1 X76.175 Y92.124 E-.06428
G1 X76.016 Y92.191 E-.06537
G1 X75.85 Y92.233 E-.0652
G1 X75.682 Y92.25 E-.06421
G1 X75.451 Y92.233 E-.08812
G1 X75.23 Y92.171 E-.08716
G1 X75.026 Y92.066 E-.08707
G1 X74.9 Y91.966 E-.06129
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X82.27 Y89.982 Z.6 F42000
G1 X83.249 Y89.718 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X83.132 Y89.647 E.00509
G3 X84.057 Y85.69 I1.339 J-1.773 E.19096
G1 X84.352 Y85.654 E.01107
G3 X83.51 Y89.877 I.12 J2.219 E.30153
G1 X83.3 Y89.749 E.00915
M204 S6000
G1 X83.486 Y89.33 F42000
G1 F3000
M204 S500
G1 X83.409 Y89.282 E.0034
G3 X84.141 Y86.14 I1.064 J-1.408 E.15158
G1 X84.38 Y86.111 E.00894
G3 X83.709 Y89.465 I.093 J1.762 E.23939
G1 X83.538 Y89.361 E.00746
M204 S6000
G1 X83.652 Y88.887 F42000
G1 F3000
M204 S500
G1 X83.494 Y88.741 E.008
G3 X84.226 Y86.59 I.979 J-.866 E.10248
G1 X84.407 Y86.569 E.0068
G3 X83.697 Y88.926 I.067 J1.306 E.18642
M204 S6000
G1 X83.962 Y88.553 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X84.31 Y87.041 I.512 J-.678 E.0728
G1 X84.434 Y87.026 E.00466
G3 X84.011 Y88.587 I.04 J.849 E.11918
; WIPE_START
G1 X83.838 Y88.438 E-.08692
G1 X83.739 Y88.3 E-.06434
G1 X83.669 Y88.146 E-.06433
G1 X83.631 Y87.981 E-.06431
G1 X83.627 Y87.811 E-.06445
G1 X83.656 Y87.645 E-.06428
G1 X83.718 Y87.487 E-.06445
G1 X83.81 Y87.345 E-.06432
G1 X83.928 Y87.224 E-.06426
G1 X84.068 Y87.128 E-.0644
G1 X84.301 Y87.044 E-.09395
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X79.237 Y88.001 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X79.237 Y79.187 E.32827
G1 X79.252 Y79.111 E.00289
G1 X79.304 Y79.023 E.00382
G1 X79.439 Y78.943 E.00583
G3 X79.54 Y78.934 I.08 J.327 E.00378
G1 X104.515 Y78.936 E.93023
G1 X104.601 Y78.956 E.0033
G1 X104.686 Y79.014 E.00383
G3 X104.764 Y79.188 I-.191 J.189 E.00725
G1 X104.765 Y81.533 E.08736
G1 X103.329 Y81.533 E.05349
G1 X103.329 Y98.467 E.6307
G1 X104.766 Y98.467 E.05353
G1 X104.766 Y100.76 E.0854
M73 P5 R5
G3 X104.46 Y101.066 I-.275 J.031 E.01849
G1 X79.54 Y101.066 E.92817
G3 X79.237 Y100.819 I-.032 J-.271 E.01624
M73 P6 R5
G1 X79.237 Y88.061 E.4752
; WIPE_START
G1 X79.237 Y86.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X78.776 Y89.501 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X78.78 Y79.165 E.385
G3 X79.529 Y78.477 I.732 J.046 E.04185
G1 X104.529 Y78.479 E.93118
G3 X105.221 Y79.165 I-.04 J.732 E.03969
G1 X105.222 Y81.99 E.10523
G1 X103.786 Y81.99 E.0535
G1 X103.786 Y98.01 E.59666
G1 X105.223 Y98.01 E.05353
G1 X105.223 Y100.771 E.10284
G3 X104.471 Y101.523 I-.729 J.023 E.04437
G1 X79.529 Y101.523 E.929
G3 X78.78 Y100.853 I-.023 J-.729 E.0413
G1 X78.776 Y90.187 E.39728
G1 X77.714 Y91.311 E.0576
G1 X77.714 Y88.685 E.09779
G1 X78.776 Y89.806 E.05749
G1 X78.776 Y89.561 E.00909
; WIPE_START
G1 X78.777 Y87.561 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X78.319 Y91.336 Z.6 F42000
G1 Z.2
G1 E.8 F1800
M73 P7 R5
G1 F3000
M204 S500
G1 X76.963 Y92.772 E.07356
G3 X73.927 Y91.784 I-1.264 J-1.276 E.14653
G1 X74.158 Y91.703 E.00913
G2 X77.257 Y91.127 I1.491 J-.606 E.16401
G1 X77.257 Y88.882 E.08362
G2 X74.158 Y88.297 I-1.61 J.028 E.16397
G1 X73.927 Y88.216 E.00913
G3 X76.954 Y87.219 I1.773 J.288 E.14604
G1 X78.319 Y88.659 E.07392
G1 X78.322 Y79.142 E.35448
G3 X79.517 Y78.02 I1.193 J.074 E.06727
G1 X104.544 Y78.022 E.93213
G3 X105.678 Y79.142 I-.059 J1.194 E.065
G1 X105.68 Y82.447 E.12309
G1 X104.243 Y82.447 E.05351
G1 X104.243 Y97.553 E.56261
G1 X105.68 Y97.553 E.05353
G1 X105.68 Y100.782 E.12028
G3 X104.482 Y101.98 I-1.185 J.012 E.07026
G1 X79.518 Y101.98 E.92984
G3 X78.322 Y100.866 I-.001 J-1.197 E.06696
G1 X78.319 Y91.396 E.35274
; WIPE_START
G1 X76.963 Y92.772 E-.73407
G1 X76.912 Y92.817 E-.02593
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X77.863 Y92.485 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X77.197 Y93.179 I-6.315 J-5.387 E.03585
G3 X73.45 Y91.497 I-1.495 J-1.684 E.19261
G1 X73.45 Y88.503 E.1115
G3 X77.276 Y86.894 I2.25 J-.002 E.19674
G1 X77.863 Y87.513 E.03178
M73 P8 R5
G1 X77.865 Y79.12 E.31263
G3 X79.506 Y77.563 I1.655 J.102 E.09271
G1 X104.558 Y77.565 E.93308
G3 X106.135 Y79.12 I-.079 J1.657 E.09032
G1 X106.137 Y82.904 E.14096
G1 X104.7 Y82.904 E.05352
G1 X104.7 Y97.096 E.52857
G1 X106.137 Y97.096 E.05353
G1 X106.137 Y100.793 E.13773
G3 X104.494 Y102.437 I-1.642 J.001 E.09616
G1 X79.506 Y102.437 E.93068
G3 X77.865 Y100.883 I.015 J-1.659 E.09259
G1 X77.863 Y92.545 E.31057
; WIPE_START
G1 X77.197 Y93.179 E-.34945
G1 X77.015 Y93.325 E-.08844
G1 X76.721 Y93.505 E-.13117
G1 X76.411 Y93.635 E-.12756
G1 X76.249 Y93.675 E-.06338
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

G1 X76.507 Y92.781
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.162093
G1 F3000
M204 S500
G3 X75.138 Y92.911 I-.829 J-1.463 E.01376
; LINE_WIDTH: 0.116957
G3 X74.865 Y92.789 I.571 J-1.648 E.00181
; WIPE_START
G1 X75.138 Y92.911 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X73.985 Y91.521 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.636584
G1 F3000
M204 S500
G3 X73.975 Y88.881 I53.542 J-1.523 E.1277
G3 X73.99 Y88.481 I10.792 J.192 E.01941
; WIPE_START
G1 X73.975 Y88.881 E-.15247
G1 X73.981 Y90.48 E-.60753
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X74.859 Y87.214 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.121885
G1 F3000
M204 S500
G3 X75.214 Y87.067 I.731 J1.262 E.00248
; LINE_WIDTH: 0.164255
G3 X76.339 Y87.136 I.466 J1.598 E.01137
G1 X76.449 Y87.189 E.00121
; LINE_WIDTH: 0.126541
G3 X76.817 Y87.446 I-.829 J1.576 E.00306
M204 S6000
G1 X77.166 Y87.816 F42000
; LINE_WIDTH: 0.119988
G1 F3000
M204 S500
G1 X77.306 Y87.995 E.00143
; LINE_WIDTH: 0.157166
G1 X77.358 Y88.071 E.00086
; LINE_WIDTH: 0.184847
G1 X77.408 Y88.143 E.00101
; LINE_WIDTH: 0.177522
G1 X77.428 Y88.253 E.00123
; LINE_WIDTH: 0.141847
G1 X77.444 Y88.345 E.00075
; LINE_WIDTH: 0.114069
G1 X77.459 Y88.464 E.0007
; WIPE_START
G1 X77.444 Y88.345 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X77.459 Y91.532 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.113403
G1 F3000
M204 S500
G1 X77.445 Y91.657 E.00072
; LINE_WIDTH: 0.143375
G1 X77.426 Y91.756 E.00082
; LINE_WIDTH: 0.18182
G3 X77.36 Y91.929 I-.333 J-.028 E.00212
; LINE_WIDTH: 0.150914
G1 X77.269 Y92.051 E.00134
; LINE_WIDTH: 0.118911
G1 X77.178 Y92.173 E.00094
M204 S6000
M73 P9 R5
G1 X76.823 Y92.547 F42000
; LINE_WIDTH: 0.122945
G1 F3000
M204 S500
G1 X76.716 Y92.64 E.00093
G3 X76.507 Y92.781 I-2.486 J-3.449 E.00164
; WIPE_START
G1 X76.716 Y92.64 E-.48469
G1 X76.823 Y92.547 E-.27531
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X83.648 Y89.13 Z.6 F42000
G1 X103.647 Y79.119 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50441
G1 F6300
M204 S500
G1 X104.375 Y79.847 E.03873
G1 X104.376 Y80.5 E.02456
G1 X103.2 Y79.324 E.06252
G1 X102.548 Y79.324 E.02454
G1 X104.368 Y81.145 E.09681
G1 X103.715 Y81.145 E.02454
G1 X101.895 Y79.324 E.09682
G1 X101.242 Y79.324 E.02454
G1 X103.063 Y81.145 E.09683
G1 X102.94 Y81.145 E.00461
G1 X102.94 Y81.675 E.01994
G1 X100.589 Y79.324 E.12502
G1 X99.937 Y79.324 E.02454
G1 X102.94 Y82.328 E.15973
G1 X102.94 Y82.98 E.02454
G1 X99.284 Y79.324 E.19445
G1 X98.631 Y79.324 E.02454
G1 X102.94 Y83.633 E.22916
G1 X102.94 Y84.286 E.02454
G1 X97.979 Y79.324 E.26387
G1 X97.326 Y79.324 E.02454
G1 X102.94 Y84.938 E.29858
G1 X102.94 Y85.591 E.02454
G1 X96.673 Y79.324 E.33329
G1 X96.021 Y79.324 E.02454
G1 X102.94 Y86.244 E.368
G1 X102.94 Y86.896 E.02454
G1 X95.368 Y79.324 E.40271
G1 X94.715 Y79.324 E.02454
G1 X102.94 Y87.549 E.43743
G1 X102.94 Y88.201 E.02454
G1 X94.063 Y79.324 E.47214
G1 X93.41 Y79.324 E.02454
G1 X102.94 Y88.854 E.50685
M73 P10 R5
G1 X102.94 Y89.507 E.02454
G1 X92.757 Y79.324 E.54156
G1 X92.105 Y79.324 E.02454
G1 X102.94 Y90.159 E.57627
G1 X102.94 Y90.812 E.02454
G1 X91.452 Y79.324 E.61098
G1 X90.799 Y79.324 E.02454
G1 X102.94 Y91.465 E.64569
G1 X102.94 Y92.117 E.02454
G1 X90.146 Y79.324 E.68041
G1 X89.494 Y79.323 E.02454
G1 X102.94 Y92.77 E.71512
G1 X102.94 Y93.423 E.02454
G1 X88.841 Y79.323 E.74983
G1 X88.188 Y79.323 E.02454
G1 X102.94 Y94.075 E.78454
G1 X102.94 Y94.728 E.02454
G1 X87.536 Y79.323 E.81925
G1 X86.883 Y79.323 E.02454
G1 X102.94 Y95.381 E.85396
M73 P11 R5
G1 X102.94 Y96.033 E.02454
G1 X86.23 Y79.323 E.88867
G1 X85.578 Y79.323 E.02454
G1 X102.94 Y96.686 E.92339
G1 X102.94 Y97.339 E.02454
G1 X84.925 Y79.323 E.9581
G1 X84.272 Y79.323 E.02454
G1 X103.146 Y98.197 E1.00375
M204 S6000
G1 X103.599 Y98.65 F42000
G1 F6300
M204 S500
G1 X104.377 Y99.428 E.04141
G1 X104.377 Y100.081 E.02454
G1 X83.62 Y79.323 E1.10394
G1 X82.967 Y79.323 E.02454
G1 X104.321 Y100.677 E1.13566
G1 X103.668 Y100.677 E.02454
G1 X82.314 Y79.323 E1.13566
G1 X81.662 Y79.323 E.02454
G1 X103.016 Y100.677 E1.13567
M73 P12 R5
G1 X102.363 Y100.677 E.02454
G1 X81.009 Y79.323 E1.13567
G1 X80.356 Y79.323 E.02454
G1 X101.71 Y100.677 E1.13567
G1 X101.058 Y100.677 E.02454
G1 X79.703 Y79.323 E1.13567
G1 X79.625 Y79.323 E.00295
G1 X79.625 Y79.897 E.0216
G1 X85.061 Y85.333 E.28911
G1 X85.609 Y85.52 E.02176
G1 X86.053 Y85.792 E.01957
G1 X86.434 Y86.145 E.01956
G1 X86.739 Y86.568 E.01959
G1 X86.952 Y87.042 E.01954
G1 X87.006 Y87.278 E.00912
G1 X100.405 Y100.677 E.71258
G1 X99.753 Y100.677 E.02454
G1 X87.08 Y88.004 E.67397
G1 X86.993 Y88.571 E.02154
G1 X99.1 Y100.677 E.64386
G1 X98.447 Y100.677 E.02454
G1 X86.809 Y89.039 E.61894
G3 X86.56 Y89.443 I-2.235 J-1.1 E.01786
G1 X97.795 Y100.677 E.59748
M73 P13 R5
G1 X97.142 Y100.677 E.02454
G1 X86.254 Y89.789 E.57904
G1 X85.883 Y90.071 E.01752
G1 X96.489 Y100.677 E.56406
G1 X95.837 Y100.677 E.02454
G1 X85.451 Y90.292 E.55233
G1 X85.369 Y90.331 E.00343
G1 X84.946 Y90.439 E.01642
G1 X95.184 Y100.677 E.5445
G1 X94.531 Y100.677 E.02454
G1 X84.094 Y90.24 E.55509
; WIPE_START
G1 X85.508 Y91.654 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X84.547 Y85.472 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X79.625 Y80.55 E.26177
G1 X79.625 Y81.202 E.02454
G1 X83.782 Y85.359 E.22107
G1 X83.313 Y85.543 E.01895
G1 X79.625 Y81.855 E.19612
G1 X79.625 Y82.508 E.02454
G1 X82.911 Y85.794 E.17476
G2 X82.569 Y86.104 I.598 J1.001 E.01749
G1 X79.625 Y83.16 E.15657
G1 X79.625 Y83.813 E.02454
G1 X82.285 Y86.473 E.14145
G2 X82.063 Y86.903 I.952 J.764 E.01834
G1 X79.625 Y84.466 E.12964
G1 X79.625 Y85.118 E.02454
G1 X81.916 Y87.409 E.12185
M73 P14 R5
G2 X81.877 Y88.023 I1.497 J.403 E.02328
G1 X79.625 Y85.771 E.11978
G1 X79.625 Y86.424 E.02454
G1 X93.879 Y100.677 E.75804
G1 X93.226 Y100.677 E.02454
G1 X79.625 Y87.076 E.72333
G1 X79.625 Y87.729 E.02454
G1 X92.573 Y100.677 E.68862
G1 X91.921 Y100.677 E.02454
G1 X79.625 Y88.381 E.65391
G1 X79.625 Y89.034 E.02454
G1 X91.268 Y100.677 E.6192
G1 X90.615 Y100.677 E.02454
G1 X79.625 Y89.687 E.5845
G1 X79.625 Y90.339 E.02454
G1 X89.963 Y100.677 E.54979
G1 X89.31 Y100.677 E.02454
G1 X79.625 Y90.992 E.51508
G1 X79.625 Y91.645 E.02454
G1 X88.658 Y100.677 E.48037
G1 X88.005 Y100.677 E.02454
G1 X79.625 Y92.297 E.44566
G1 X79.625 Y92.95 E.02454
M73 P15 R5
G1 X87.352 Y100.677 E.41095
G1 X86.7 Y100.677 E.02454
G1 X79.625 Y93.603 E.37624
G1 X79.625 Y94.255 E.02454
G1 X86.047 Y100.677 E.34153
G1 X85.394 Y100.677 E.02454
G1 X79.625 Y94.908 E.30682
G1 X79.625 Y95.561 E.02454
G1 X84.742 Y100.677 E.27211
G1 X84.089 Y100.677 E.02454
G1 X79.625 Y96.213 E.2374
G1 X79.625 Y96.866 E.02454
G1 X83.436 Y100.677 E.20269
G1 X82.784 Y100.677 E.02454
G1 X79.625 Y97.519 E.16798
G1 X79.625 Y98.171 E.02454
G1 X82.131 Y100.677 E.13328
G1 X81.478 Y100.677 E.02454
G1 X79.625 Y98.824 E.09857
G1 X79.625 Y99.476 E.02454
G1 X80.826 Y100.677 E.06386
G1 X80.173 Y100.677 E.02454
G1 X79.419 Y99.923 E.04009
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6300
G1 X80.173 Y100.677 E-.40507
G1 X80.826 Y100.677 E-.24801
G1 X80.627 Y100.478 E-.10692
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
G3 Z.6 I1.116 J-.485 P1  F42000
G1 X76.915 Y91.926 Z.6
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X76.898 Y91.951 E.00081
G3 X74.139 Y91.115 I-1.248 J-.852 E.10363
G1 X74.139 Y88.878 E.06064
G3 X75.462 Y87.4 I1.507 J.019 E.05864
G3 X77.161 Y88.885 I.184 J1.503 E.06895
G1 X77.161 Y91.123 E.06065
G3 X77.011 Y91.755 I-1.511 J-.024 E.01776
G1 X76.944 Y91.874 E.00368
M204 S250
G1 X76.567 Y91.725 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X74.54 Y91.105 I-.917 J-.626 E.07078
G1 X74.54 Y88.892 E.05564
G3 X75.512 Y87.798 I1.109 J.006 E.04018
G3 X76.76 Y88.895 I.135 J1.104 E.04715
G1 X76.76 Y91.108 E.05564
G3 X76.599 Y91.674 I-1.11 J-.009 E.015
; WIPE_START
M204 S6000
G1 X76.464 Y91.855 E-.08578
G1 X76.342 Y91.968 E-.06308
G1 X76.205 Y92.062 E-.06304
G1 X76.056 Y92.134 E-.06315
G1 X75.899 Y92.182 E-.06217
G1 X75.678 Y92.21 E-.08489
G1 X75.457 Y92.193 E-.08401
G1 X75.244 Y92.134 E-.08399
G1 X75.048 Y92.033 E-.08398
G1 X74.875 Y91.895 E-.08407
G1 X74.872 Y91.891 E-.00184
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.233 Y89.873 Z.76 F42000
G1 X83.346 Y89.568 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X83.24 Y89.506 E.00334
G3 X84.095 Y85.865 I1.229 J-1.632 E.12799
G1 X84.377 Y85.833 E.0077
G3 X83.588 Y89.717 I.091 J2.041 E.20106
G1 X83.397 Y89.6 E.00608
M204 S10000
G1 X83.562 Y89.215 F42000
M73 P16 R5
G1 F10826.06
M204 S6000
G1 X83.491 Y89.174 E.00221
G3 X84.17 Y86.275 I.979 J-1.299 E.10186
G1 X84.4 Y86.249 E.00626
G3 X83.769 Y89.342 I.07 J1.625 E.16006
G1 X83.613 Y89.246 E.00496
M204 S10000
G1 X83.778 Y88.861 F42000
G1 F10826.06
M204 S6000
G1 X83.743 Y88.841 E.00109
G3 X84.245 Y86.685 I.729 J-.967 E.07572
G1 X84.422 Y86.665 E.00482
G3 X83.949 Y88.967 I.049 J1.21 E.11905
G1 X83.829 Y88.893 E.00383
M204 S250
G1 X83.986 Y88.521 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X84.318 Y87.08 I.488 J-.646 E.04688
G1 X84.444 Y87.065 E.00319
G3 X84.035 Y88.555 I.029 J.809 E.07634
; WIPE_START
M204 S6000
G1 X83.868 Y88.411 E-.08392
G1 X83.773 Y88.28 E-.06134
G1 X83.707 Y88.133 E-.06132
G1 X83.671 Y87.976 E-.06133
G1 X83.667 Y87.814 E-.06128
G1 X83.695 Y87.656 E-.06127
G1 X83.754 Y87.505 E-.06135
G1 X83.841 Y87.37 E-.06131
G1 X83.954 Y87.254 E-.06141
G1 X84.088 Y87.163 E-.06128
G1 X84.318 Y87.08 E-.09316
G1 X84.399 Y87.071 E-.03104
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.746 Y93.121 Z.76 F42000
G1 X78.834 Y94.307 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X78.834 Y90.273 E.10929
G1 X77.992 Y90.972 E.02965
G1 X77.992 Y89.028 E.05267
G1 X78.834 Y89.727 E.02965
G1 X78.834 Y79.219 E.28475
G1 X78.848 Y79.07 E.00404
G1 X78.881 Y78.958 E.00318
G3 X79.519 Y78.534 I.623 J.247 E.02208
G1 X104.503 Y78.535 E.677
G1 X104.693 Y78.563 E.00521
G1 X104.842 Y78.629 E.00442
G1 X104.971 Y78.73 E.00443
G1 X105.08 Y78.875 E.00493
G3 X105.163 Y79.151 I-.606 J.332 E.00785
G1 X105.165 Y81.631 E.06722
G1 X103.508 Y81.631 E.04489
G1 X103.508 Y98.369 E.45353
G1 X105.166 Y98.369 E.04492
G1 X105.166 Y100.782 E.06538
G1 X105.148 Y100.951 E.00463
G3 X104.482 Y101.466 I-.649 J-.153 E.02467
G1 X79.519 Y101.466 E.67642
G1 X79.288 Y101.43 E.00632
G3 X78.834 Y100.782 I.22 J-.637 E.02294
G1 X78.834 Y94.367 E.17383
M204 S10000
G1 X78.418 Y93.879 F42000
G1 F10826.06
M204 S6000
G1 X78.418 Y91.158 E.07374
G1 X77.635 Y91.808 E.02757
G1 X77.483 Y91.715 E.00484
G2 X77.576 Y91.138 I-1.862 J-.597 E.01588
G1 X77.576 Y88.874 E.06135
G2 X77.481 Y88.287 I-2.22 J.061 E.01615
G1 X77.634 Y88.191 E.00491
G1 X78.418 Y88.842 E.02763
G1 X78.419 Y79.213 E.26091
G3 X79.513 Y78.119 I1.085 J-.009 E.0467
G1 X104.514 Y78.12 E.67746
G3 X105.579 Y79.135 I-.014 J1.08 E.04385
G1 X105.581 Y82.047 E.0789
G1 X103.924 Y82.047 E.0449
G1 X103.924 Y97.953 E.43101
G1 X105.581 Y97.953 E.04492
G1 X105.581 Y100.787 E.07678
G3 X104.487 Y101.881 I-1.085 J.009 E.0467
G1 X79.513 Y101.881 E.6767
G3 X78.419 Y100.787 I-.012 J-1.083 E.04673
G1 X78.418 Y93.939 E.18554
; WIPE_START
G1 X78.418 Y91.939 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.79 Y93.04 Z.76 F42000
G1 Z.36
G1 E.8 F1800
G1 F10826.06
M204 S6000
G1 X76.721 Y93.09 E.00231
G3 X73.811 Y91.492 I-1.02 J-1.591 E.10982
G1 X73.811 Y88.508 E.08087
G3 X76.878 Y87.023 I1.89 J-.006 E.11506
G1 X78.003 Y87.957 E.03961
G1 X78.003 Y79.208 E.23706
G3 X79.508 Y77.703 I1.502 J-.003 E.0641
G1 X104.526 Y77.704 E.67791
G3 X105.994 Y79.12 I-.026 J1.496 E.0608
G1 X105.997 Y82.463 E.09059
G1 X104.339 Y82.463 E.04491
G1 X104.339 Y97.537 E.40848
G1 X105.997 Y97.537 E.04492
G1 X105.997 Y100.792 E.08819
G3 X104.492 Y102.297 I-1.502 J.003 E.0641
G1 X79.508 Y102.297 E.67699
G3 X78.003 Y100.792 I-.007 J-1.499 E.06414
G1 X78.003 Y92.043 E.23706
G1 X76.878 Y92.977 E.03961
G1 X76.839 Y93.005 E.0013
M204 S250
G1 X77.525 Y92.961 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X76.424 Y93.673 I-2.345 J-2.421 E.03316
G3 X73.41 Y91.497 I-.72 J-2.178 E.10893
G1 X73.41 Y88.503 E.07529
G3 X77.127 Y86.709 I2.291 J-.001 E.12919
G1 X77.525 Y87.04 E.01302
G1 F1139.391
G1 X77.602 Y87.103 E.00251
G1 F720
G1 X77.602 Y79.803 E.18355
G3 X77.684 Y78.649 I3.947 J-.3 E.02918
G3 X79.503 Y77.302 I1.823 J.56 E.06091
M73 P17 R5
G1 X104.537 Y77.303 E.6294
G3 X106.395 Y79.105 I-.038 J1.898 E.07158
G1 X106.398 Y82.863 E.0945
G1 F1543.138
G1 X106.218 Y82.863 E.00452
G1 F4488.412
G1 X105.818 Y82.863 E.01006
G1 F8969.685
G1 X105.418 Y82.863 E.01006
G1 F11668.197
G1 X105.018 Y82.863 E.01006
G1 X104.74 Y82.863 E.00699
G1 X104.74 Y97.137 E.35885
G1 X105.018 Y97.137 E.00699
G1 X105.418 Y97.137 E.01006
G1 F8969.292
G1 X105.818 Y97.137 E.01006
G1 F4488.133
G1 X106.218 Y97.137 E.01006
G1 F1542.975
G1 X106.398 Y97.137 E.00452
G1 F720
G1 X106.398 Y100.197 E.07694
G3 X106.341 Y101.26 I-4.37 J.3 E.02682
G3 X104.497 Y102.698 I-1.843 J-.462 E.06332
G1 X80.103 Y102.698 E.6133
G3 X78.949 Y102.616 I-.3 J-3.947 E.02918
M73 P18 R5
G3 X77.602 Y100.797 I.553 J-1.818 E.06095
G1 X77.602 Y92.897 E.19863
G1 F879.71
G1 X77.571 Y92.923 E.00103
; WIPE_START
M204 S6000
G1 X76.937 Y93.427 E-.30772
G1 X76.636 Y93.59 E-.12991
G1 X76.424 Y93.673 E-.08672
G1 X76.093 Y93.756 E-.12976
G1 X75.866 Y93.784 E-.08677
G1 X75.816 Y93.783 E-.01912
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

G1 X76.33 Y92.868
G1 Z.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.355672
G1 F14004.033
M204 S6000
G2 X77.126 Y92.277 I-1.015 J-2.202 E.02092
; LINE_WIDTH: 0.391768
G1 F12589.809
G1 X77.217 Y92.185 E.00301
; LINE_WIDTH: 0.428518
G1 F11416.053
G2 X77.434 Y91.929 I-3.314 J-3.034 E.00864
M204 S10000
G1 X76.33 Y92.868 F42000
; LINE_WIDTH: 0.389203
G1 F12680.803
M204 S6000
G3 X75.133 Y92.909 I-.652 J-1.552 E.02833
; LINE_WIDTH: 0.336279
G1 F14903.48
G3 X74.796 Y92.749 I.653 J-1.808 E.00734
; LINE_WIDTH: 0.294065
G1 F17325.749
G3 X74.611 Y92.617 I.744 J-1.243 E.00386
; LINE_WIDTH: 0.253453
G1 F18000
G1 X74.435 Y92.45 E.00345
; LINE_WIDTH: 0.207635
G1 X74.384 Y92.392 E.00088
G3 X74.29 Y92.269 I1.609 J-1.33 E.00174
; LINE_WIDTH: 0.161566
G1 X74.276 Y92.248 E.00021
G3 X74.185 Y92.095 I1.469 J-.978 E.00147
; LINE_WIDTH: 0.119822
G3 X74.111 Y91.936 I1.859 J-.959 E.00098
; LINE_WIDTH: 0.0929813
G1 X74.082 Y91.858 E.00032
M204 S10000
G1 X74.082 Y88.137 F42000
; LINE_WIDTH: 0.113164
G1 F18000
M204 S6000
G3 X74.184 Y87.905 I2.57 J.986 E.0013
; LINE_WIDTH: 0.162216
G3 X74.289 Y87.733 I1.556 J.834 E.00168
; LINE_WIDTH: 0.198502
G1 X74.383 Y87.61 E.00166
; LINE_WIDTH: 0.233676
G3 X74.505 Y87.477 I1.779 J1.509 E.00234
; LINE_WIDTH: 0.269722
G3 X74.672 Y87.336 I1.276 J1.337 E.00335
; LINE_WIDTH: 0.29877
G1 F17017.471
G1 X74.794 Y87.253 E.00255
; LINE_WIDTH: 0.332686
G1 F15082.996
G3 X74.956 Y87.163 I.958 J1.539 E.00362
G1 X75.073 Y87.114 E.00247
; LINE_WIDTH: 0.387366
G1 F12746.815
G3 X76.334 Y87.134 I.606 J1.56 E.02974
; LINE_WIDTH: 0.354424
G1 F14058.65
G3 X76.65 Y87.311 I-.651 J1.536 E.00758
G1 X77.088 Y87.683 E.01199
; LINE_WIDTH: 0.385558
G1 F12812.413
G1 X77.219 Y87.819 E.00433
; LINE_WIDTH: 0.428429
G1 F11418.621
G3 X77.437 Y88.069 I-4.864 J4.439 E.00852
; WIPE_START
G1 X77.219 Y87.819 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.479 Y89.946 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.531456
G1 F9052.141
M204 S6000
G2 X78.48 Y90.052 I-.026 J.053 E.00775
M204 S10000
G1 X79.001 Y90.166 F42000
; LINE_WIDTH: 0.420506
G1 F11652.899
M204 S6000
G1 X90.291 Y78.875 E.40196
G1 X89.745 Y78.875 E.01375
G1 X79.175 Y89.446 E.37634
M73 P19 R5
G1 X79.175 Y88.9 E.01375
G1 X89.199 Y78.875 E.35689
G1 X88.653 Y78.875 E.01375
G1 X79.175 Y88.354 E.33745
G1 X79.175 Y87.807 E.01375
G1 X88.107 Y78.875 E.31801
G1 X87.561 Y78.875 E.01375
G1 X79.175 Y87.261 E.29856
G1 X79.175 Y86.715 E.01375
G1 X87.015 Y78.875 E.27912
G1 X86.469 Y78.875 E.01375
G1 X79.175 Y86.169 E.25968
G1 X79.175 Y85.623 E.01375
G1 X85.922 Y78.875 E.24024
G1 X85.376 Y78.875 E.01375
G1 X79.175 Y85.077 E.22079
G1 X79.175 Y84.531 E.01375
G1 X84.83 Y78.875 E.20135
G1 X84.284 Y78.875 E.01375
G1 X79.175 Y83.984 E.18191
G1 X79.175 Y83.438 E.01375
G1 X83.738 Y78.875 E.16246
G1 X83.192 Y78.875 E.01375
G1 X79.175 Y82.892 E.14302
G1 X79.175 Y82.346 E.01375
G1 X82.646 Y78.875 E.12358
G1 X82.1 Y78.875 E.01375
G1 X79.175 Y81.8 E.10414
G1 X79.175 Y81.254 E.01375
G1 X81.554 Y78.875 E.08469
G1 X81.008 Y78.875 E.01375
G1 X79.175 Y80.708 E.06525
G1 X79.175 Y80.161 E.01375
G1 X80.461 Y78.875 E.04581
G1 X79.915 Y78.875 E.01375
G1 X79.001 Y79.789 E.03254
M204 S10000
G1 X79.001 Y96.173 F42000
G1 F11652.899
M204 S6000
G1 X84.977 Y90.197 E.21275
G1 X84.831 Y90.234 E.0038
G1 X84.371 Y90.257 E.0116
G1 X79.175 Y95.453 E.18498
G1 X79.175 Y94.907 E.01375
G1 X83.893 Y90.188 E.168
G1 X83.492 Y90.044 E.01074
G1 X79.175 Y94.361 E.1537
G1 X79.175 Y93.815 E.01375
G1 X83.145 Y89.844 E.14135
G3 X82.843 Y89.6 I.455 J-.869 E.00984
G1 X79.175 Y93.269 E.13062
G1 X79.175 Y92.723 E.01375
G1 X82.585 Y89.313 E.1214
G3 X82.37 Y88.981 I.711 J-.697 E.01001
G1 X79.175 Y92.176 E.11375
G1 X79.175 Y91.63 E.01375
G1 X82.205 Y88.6 E.1079
G1 X82.107 Y88.152 E.01154
G1 X79.175 Y91.084 E.10441
G1 X79.175 Y90.538 E.01375
G1 X82.327 Y87.386 E.11223
; WIPE_START
G1 X80.913 Y88.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.994 Y85.719 Z.76 F42000
G1 Z.36
G1 E.8 F1800
G1 F11652.899
M204 S6000
G1 X90.837 Y78.875 E.24365
G1 X91.383 Y78.875 E.01375
G1 X84.744 Y85.515 E.23637
G3 X85.195 Y85.61 I-.012 J1.163 E.01167
G1 X91.93 Y78.875 E.23978
G1 X92.476 Y78.875 E.01375
G1 X85.582 Y85.769 E.24543
G1 X85.92 Y85.977 E.00999
G1 X93.022 Y78.875 E.25284
G1 X93.568 Y78.875 E.01375
G1 X86.203 Y86.24 E.26219
G1 X86.264 Y86.296 E.00207
G1 X86.443 Y86.546 E.00775
G1 X94.114 Y78.875 E.27309
G1 X94.66 Y78.875 E.01375
G1 X86.638 Y86.897 E.28559
G3 X86.779 Y87.302 I-.931 J.551 E.01087
G1 X95.206 Y78.875 E.30001
G1 X95.752 Y78.875 E.01375
G1 X86.847 Y87.78 E.31703
G3 X86.797 Y88.377 I-1.504 J.174 E.01516
G1 X96.298 Y78.875 E.33825
G1 X96.845 Y78.876 E.01375
G1 X79.175 Y96.545 E.62908
G1 X79.175 Y97.091 E.01375
G1 X97.391 Y78.876 E.64852
M73 P20 R5
G1 X97.937 Y78.876 E.01375
G1 X79.175 Y97.638 E.66796
G1 X79.175 Y98.184 E.01375
G1 X98.483 Y78.876 E.68741
G1 X99.029 Y78.876 E.01375
G1 X79.175 Y98.73 E.70685
G1 X79.175 Y99.276 E.01375
G1 X99.575 Y78.876 E.72629
G1 X100.121 Y78.876 E.01375
G1 X79.175 Y99.822 E.74573
G1 X79.175 Y100.368 E.01375
G1 X100.667 Y78.876 E.76517
G1 X101.213 Y78.876 E.01375
G1 X79.194 Y100.895 E.78394
G2 X79.512 Y101.123 I.325 J-.118 E.01047
G1 X101.759 Y78.876 E.79206
G1 X102.306 Y78.876 E.01375
G1 X80.056 Y101.125 E.79212
G1 X80.602 Y101.125 E.01375
G1 X102.852 Y78.876 E.79212
G1 X103.398 Y78.876 E.01375
G1 X81.148 Y101.125 E.79212
G1 X81.694 Y101.125 E.01375
G1 X103.944 Y78.876 E.79212
G1 X104.473 Y78.876 E.01333
G1 X104.488 Y78.878 E.00036
G1 X82.241 Y101.125 E.79203
G1 X82.787 Y101.125 E.01375
G1 X104.803 Y79.109 E.78381
G1 X104.815 Y79.643 E.01345
G1 X83.333 Y101.125 E.7648
G1 X83.879 Y101.125 E.01375
G1 X103.168 Y81.837 E.68671
G1 X103.168 Y82.383 E.01375
G1 X84.425 Y101.125 E.66727
G1 X84.971 Y101.125 E.01375
G1 X103.168 Y82.929 E.64783
G1 X103.168 Y83.475 E.01375
G1 X85.517 Y101.125 E.62838
M73 P21 R5
G1 X86.063 Y101.125 E.01375
G1 X103.168 Y84.021 E.60894
G1 X103.168 Y84.567 E.01375
G1 X86.61 Y101.125 E.5895
G1 X87.156 Y101.125 E.01375
G1 X103.168 Y85.113 E.57005
G1 X103.168 Y85.659 E.01375
G1 X87.702 Y101.125 E.55061
G1 X88.248 Y101.125 E.01375
G1 X103.168 Y86.206 E.53117
G1 X103.168 Y86.752 E.01375
G1 X88.794 Y101.125 E.51173
G1 X89.34 Y101.125 E.01375
G1 X103.168 Y87.298 E.49228
G1 X103.168 Y87.844 E.01375
G1 X89.886 Y101.125 E.47284
G1 X90.432 Y101.125 E.01375
G1 X103.168 Y88.39 E.4534
G1 X103.168 Y88.936 E.01375
G1 X90.979 Y101.125 E.43395
G1 X91.525 Y101.125 E.01375
G1 X103.168 Y89.482 E.41451
G1 X103.168 Y90.028 E.01375
G1 X92.071 Y101.125 E.39507
G1 X92.617 Y101.125 E.01375
G1 X103.168 Y90.575 E.37562
G1 X103.168 Y91.121 E.01375
G1 X93.163 Y101.125 E.35618
G1 X93.709 Y101.125 E.01375
G1 X103.168 Y91.667 E.33674
G1 X103.168 Y92.213 E.01375
G1 X94.255 Y101.125 E.31729
G1 X94.801 Y101.125 E.01375
G1 X103.168 Y92.759 E.29785
M73 P21 R4
G1 X103.168 Y93.305 E.01375
G1 X95.348 Y101.125 E.27841
G1 X95.894 Y101.125 E.01375
G1 X103.168 Y93.851 E.25896
G1 X103.168 Y94.397 E.01375
G1 X96.44 Y101.125 E.23952
G1 X96.986 Y101.125 E.01375
G1 X103.168 Y94.944 E.22008
G1 X103.168 Y95.49 E.01375
G1 X97.532 Y101.125 E.20063
G1 X98.078 Y101.125 E.01375
G1 X103.168 Y96.036 E.18119
G1 X103.168 Y96.582 E.01375
G1 X98.624 Y101.125 E.16175
G1 X99.17 Y101.125 E.01375
G1 X103.168 Y97.128 E.14231
G1 X103.168 Y97.674 E.01375
G1 X99.717 Y101.125 E.12286
G1 X100.263 Y101.125 E.01375
G1 X103.168 Y98.22 E.10342
G1 X103.168 Y98.709 E.0123
G1 X103.225 Y98.709 E.00145
G1 X100.809 Y101.125 E.08602
G1 X101.355 Y101.125 E.01375
G1 X103.771 Y98.709 E.08602
G1 X104.317 Y98.709 E.01375
G1 X101.901 Y101.125 E.08602
G1 X102.447 Y101.125 E.01375
G1 X104.825 Y98.748 E.08464
G1 X104.824 Y99.295 E.01377
G1 X102.993 Y101.125 E.06517
G1 X103.54 Y101.125 E.01375
G1 X104.823 Y99.842 E.0457
G1 X104.822 Y100.389 E.01377
G1 X103.912 Y101.299 E.03241
; WIPE_START
G1 X104.822 Y100.389 E-.48915
G1 X104.823 Y99.842 E-.20784
M73 P22 R4
G1 X104.706 Y99.959 E-.06301
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.675 Y92.326 Z.76 F42000
G1 X104.632 Y81.464 Z.76
G1 Z.36
G1 E.8 F1800
G1 F11652.899
M204 S6000
G1 X104.823 Y81.274 E.00679
G1 X104.82 Y80.73 E.01368
G1 X104.259 Y81.291 E.01996
G1 X103.713 Y81.291 E.01375
G1 X104.99 Y80.014 E.04546
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11652.899
G1 X103.713 Y81.291 E-.68614
G1 X103.908 Y81.291 E-.07386
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
G3 Z.76 I-.446 J-1.132 P1  F42000
G1 X76.914 Y91.926 Z.76
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X76.898 Y91.951 E.00081
G3 X74.139 Y91.115 I-1.248 J-.852 E.10363
G1 X74.139 Y88.878 E.06064
G3 X75.387 Y87.411 I1.514 J.023 E.05657
G3 X77.161 Y88.884 I.258 J1.493 E.071
G1 X77.161 Y91.123 E.06065
G3 X77.011 Y91.756 I-1.511 J-.024 E.01777
G1 X76.944 Y91.874 E.00368
M204 S250
G1 X76.567 Y91.725 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X74.54 Y91.105 I-.916 J-.626 E.07078
G1 X74.54 Y88.892 E.05564
G3 X75.457 Y87.806 I1.111 J.008 E.03878
G3 X76.76 Y88.895 I.19 J1.097 E.04854
G1 X76.76 Y91.108 E.05564
G3 X76.599 Y91.675 I-1.11 J-.009 E.015
; WIPE_START
M204 S6000
G1 X76.464 Y91.856 E-.08584
G1 X76.341 Y91.969 E-.06365
G1 X76.154 Y92.089 E-.08426
G1 X76.004 Y92.153 E-.06217
G1 X75.843 Y92.194 E-.06307
G1 X75.68 Y92.21 E-.06206
G1 X75.457 Y92.193 E-.08498
G1 X75.244 Y92.134 E-.08404
G1 X75.048 Y92.033 E-.08398
G1 X74.875 Y91.895 E-.08407
G1 X74.872 Y91.891 E-.00189
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.32 Y90.226 Z.92 F42000
G1 X83.993 Y89.852 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X83.875 Y89.82 E.00331
G3 X84.099 Y85.864 I.609 J-1.95 E.14659
G1 X84.427 Y85.829 E.00896
G3 X84.272 Y89.902 I.057 J2.042 E.18119
G1 X84.052 Y89.863 E.00606
M204 S10000
G1 X84.075 Y89.446 F42000
G1 F10826.06
M204 S6000
G1 X83.998 Y89.42 E.00219
G3 X84.173 Y86.275 I.483 J-1.551 E.1166
G1 X84.437 Y86.246 E.0072
G3 X84.314 Y89.485 I.044 J1.624 E.14403
G1 X84.134 Y89.456 E.00493
M204 S10000
G1 X84.074 Y89.013 F42000
G1 F10826.06
M204 S6000
G1 X83.854 Y88.906 E.00663
G3 X84.247 Y86.685 I.624 J-1.035 E.07883
G1 X84.447 Y86.663 E.00545
G3 X84.132 Y89.029 I.031 J1.209 E.11328
M204 S250
G1 X84.237 Y88.645 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X84.319 Y87.08 I.238 J-.773 E.05381
G1 X84.457 Y87.065 E.00349
G3 X84.295 Y88.661 I.019 J.808 E.06888
; WIPE_START
M204 S6000
G1 X83.986 Y88.521 E-.12919
G1 X83.867 Y88.411 E-.06128
G1 X83.773 Y88.28 E-.06132
G1 X83.707 Y88.133 E-.06133
G1 X83.671 Y87.976 E-.06127
G1 X83.667 Y87.815 E-.06128
G1 X83.695 Y87.655 E-.06145
G1 X83.754 Y87.505 E-.06122
G1 X83.842 Y87.37 E-.06133
G1 X83.954 Y87.254 E-.06128
G1 X84.087 Y87.163 E-.06131
G1 X84.131 Y87.148 E-.01774
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.768 Y93.41 Z.92 F42000
G1 X78.728 Y94.904 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X78.728 Y90.556 E.11781
G1 X77.992 Y91.106 E.02489
G1 X77.992 Y88.893 E.05997
G1 X78.728 Y89.443 E.02489
G1 X78.728 Y79.219 E.27706
G3 X79.518 Y78.428 I.775 J-.015 E.03384
G1 X104.514 Y78.429 E.6773
G3 X105.272 Y79.219 I-.015 J.774 E.03297
G1 X105.272 Y81.586 E.06414
G1 X103.508 Y81.586 E.04781
G1 X103.508 Y98.414 E.45598
G1 X105.272 Y98.414 E.04781
G1 X105.272 Y100.782 E.06416
G3 X104.482 Y101.572 I-.774 J.016 E.03384
G1 X79.518 Y101.572 E.67643
G3 X78.728 Y100.781 I-.016 J-.774 E.03386
G1 X78.728 Y94.964 E.15763
M204 S10000
G1 X78.312 Y94.274 F42000
G1 F10826.06
M204 S6000
G1 X78.312 Y91.386 E.07826
G1 X77.586 Y91.929 E.02457
G1 X77.436 Y91.815 E.0051
G2 X77.576 Y91.138 I-1.865 J-.739 E.01882
G1 X77.576 Y88.874 E.06135
G2 X77.438 Y88.182 I-2.574 J.157 E.01918
G1 X77.587 Y88.071 E.00504
G1 X78.312 Y88.614 E.02454
G1 X78.312 Y79.213 E.25472
G3 X79.513 Y78.012 I1.192 J-.009 E.05123
G1 X104.526 Y78.014 E.67776
G3 X105.688 Y79.214 I-.028 J1.19 E.05018
G1 X105.688 Y82.002 E.07555
G1 X103.924 Y82.002 E.04781
G1 X103.924 Y97.998 E.43346
G1 X105.688 Y97.998 E.04781
G1 X105.688 Y100.787 E.07556
G3 X104.487 Y101.988 I-1.19 J.011 E.05125
G1 X79.513 Y101.988 E.67671
G3 X78.312 Y100.787 I-.011 J-1.19 E.05126
G1 X78.312 Y94.334 E.17483
M204 S10000
G1 X77.896 Y93.645 F42000
G1 F10826.06
M204 S6000
G1 X77.896 Y92.216 E.03872
G1 X76.799 Y93.036 E.03711
G3 X73.811 Y91.492 I-1.097 J-1.54 E.11233
G1 X73.811 Y88.508 E.08087
G3 X76.799 Y86.964 I1.891 J-.004 E.11232
G1 X77.896 Y87.784 E.03712
G1 X77.897 Y79.208 E.23238
G3 X79.508 Y77.596 I1.609 J-.003 E.06863
G1 X104.538 Y77.598 E.67823
G3 X106.104 Y79.208 I-.041 J1.607 E.06739
G1 X106.104 Y82.417 E.08696
M73 P23 R4
G1 X104.339 Y82.417 E.04781
G1 X104.339 Y97.583 E.41094
G1 X106.104 Y97.583 E.04781
G1 X106.104 Y100.792 E.08696
G3 X104.492 Y102.404 I-1.605 J.006 E.06867
G1 X79.508 Y102.404 E.67699
G3 X77.897 Y100.792 I-.006 J-1.605 E.06867
G1 X77.896 Y93.705 E.19204
M204 S250
G1 X77.496 Y93.038 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X77.496 Y93.016 E.00056
G3 X76.315 Y93.706 I-2.329 J-2.631 E.03459
G3 X73.41 Y91.497 I-.614 J-2.207 E.10614
G1 X73.41 Y88.503 E.07529
G3 X76.739 Y86.46 I2.292 J.002 E.11752
G1 X77.032 Y86.637 E.0086
G1 F8767.511
G1 X77.496 Y86.984 E.01456
G1 F2862.354
G1 X77.496 Y86.962 E.00056
G1 F2700
G1 X77.496 Y79.803 E.17998
G3 X77.582 Y78.618 I4.053 J-.3 E.02997
G3 X77.833 Y78.088 I2.144 J.689 E.01478
G1 F2880
G3 X78.016 Y77.853 I1.882 J1.279 E.00751
G1 F2700
G3 X79.503 Y77.196 I1.504 J1.393 E.04201
G1 X104.549 Y77.197 E.6297
G3 X106.504 Y79.203 I-.054 J2.008 E.07791
G1 X106.504 Y82.818 E.09088
G1 F3193.681
G1 X106.439 Y82.818 E.00165
G1 F7093.93
G1 X106.039 Y82.818 E.01006
G1 F11668.197
G1 X105.639 Y82.818 E.01006
G1 X104.74 Y82.818 E.02259
G1 X104.74 Y97.182 E.36113
G1 X105.639 Y97.182 E.0226
G1 X106.039 Y97.182 E.01006
G1 F7092.063
G1 X106.439 Y97.182 E.01006
G1 F3192.428
G1 X106.504 Y97.182 E.00165
G1 F2700
G1 X106.504 Y100.197 E.0758
G3 X106.444 Y101.285 I-4.477 J.3 E.02747
G3 X106.167 Y101.912 I-2.107 J-.557 E.0173
G1 F2880
G3 X105.984 Y102.147 I-1.881 J-1.279 E.00751
G1 F2700
G3 X104.497 Y102.804 I-1.504 J-1.392 E.04202
G1 X80.103 Y102.804 E.61331
G3 X79.015 Y102.744 I-.3 J-4.475 E.02747
G1 F2880
G1 X78.873 Y102.703 E.00372
G1 F2700
G3 X77.546 Y101.24 I.627 J-1.902 E.05192
G1 F2880
G1 X77.517 Y101.092 E.00378
G1 F2700
G3 X77.496 Y100.197 I5.709 J-.585 E.02254
G1 X77.496 Y93.098 E.17848
; WIPE_START
M204 S6000
G1 X77.496 Y93.016 E-.03126
G1 X76.84 Y93.486 E-.30667
G1 X76.531 Y93.634 E-.12984
G1 X76.315 Y93.706 E-.08663
G1 X75.98 Y93.773 E-.12996
G1 X75.781 Y93.787 E-.07563
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

G1 X76.242 Y92.903
G1 Z.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.364149
G1 F13644.095
M204 S6000
G2 X77.026 Y92.396 I-.877 J-2.217 E.0202
; LINE_WIDTH: 0.391469
G1 F12600.347
G2 X77.139 Y92.288 I-1.372 J-1.547 E.00364
; LINE_WIDTH: 0.427771
G1 F11437.717
G1 X77.232 Y92.197 E.00334
; LINE_WIDTH: 0.432862
G1 F11291.616
G1 X77.188 Y91.887 E.00814
M204 S10000
G1 X76.242 Y92.903 F42000
; LINE_WIDTH: 0.389507
G1 F12669.958
M204 S6000
G3 X75.133 Y92.909 I-.563 J-1.613 E.02615
; LINE_WIDTH: 0.33653
G1 F14891.135
G3 X74.796 Y92.75 I.693 J-1.905 E.00734
; LINE_WIDTH: 0.293723
G1 F17348.643
G3 X74.611 Y92.617 I.822 J-1.342 E.00386
; LINE_WIDTH: 0.260685
G1 F18000
G1 X74.493 Y92.511 E.00233
; LINE_WIDTH: 0.230051
G1 X74.379 Y92.388 E.00214
; LINE_WIDTH: 0.190728
G1 X74.246 Y92.202 E.00233
; LINE_WIDTH: 0.148154
G1 X74.165 Y92.057 E.00123
; LINE_WIDTH: 0.107078
G3 X74.082 Y91.858 I1.513 J-.748 E.00102
M204 S10000
G1 X74.082 Y88.137 F42000
; LINE_WIDTH: 0.113201
G1 F18000
M204 S6000
G3 X74.184 Y87.905 I2.628 J1.011 E.0013
; LINE_WIDTH: 0.161995
G3 X74.29 Y87.733 I1.475 J.785 E.00168
; LINE_WIDTH: 0.198123
G1 X74.381 Y87.612 E.00161
; LINE_WIDTH: 0.238906
G3 X74.502 Y87.48 I1.735 J1.469 E.00239
G1 X74.55 Y87.435 E.00088
; LINE_WIDTH: 0.286383
G1 F17853.833
G3 X74.791 Y87.254 I1.157 J1.284 E.00495
; LINE_WIDTH: 0.332108
G1 F15112.269
G3 X75.063 Y87.116 I1.359 J2.357 E.00593
G1 X75.073 Y87.113 E.00021
; LINE_WIDTH: 0.387127
G1 F12755.451
G3 X76.155 Y87.07 I.603 J1.569 E.02536
; LINE_WIDTH: 0.365975
G1 F13568.999
G3 X76.662 Y87.318 I-.53 J1.723 E.01225
G1 X76.959 Y87.547 E.0081
; LINE_WIDTH: 0.379224
G1 F13047.708
G1 X77.112 Y87.685 E.00464
; LINE_WIDTH: 0.422887
G1 F11581.511
G1 X77.235 Y87.807 E.00438
; LINE_WIDTH: 0.436585
G1 F11187.114
G1 X77.187 Y88.109 E.00802
; WIPE_START
G1 X77.235 Y87.807 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.817 Y90.281 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422886
G1 F11581.521
M204 S6000
G1 X78.333 Y89.797 E.01734
G1 X78.333 Y90.347 E.01392
G1 X78.502 Y90.516 E.00608
; WIPE_START
G1 X78.333 Y90.347 E-.12374
G1 X78.333 Y89.797 E-.2833
G1 X78.817 Y90.281 E-.35296
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.874 Y97.913 Z.92 F42000
G1 X78.896 Y100.801 Z.92
G1 Z.52
G1 E.8 F1800
G1 F11581.521
M204 S6000
G1 X79.201 Y101.106 E.01092
G2 X79.331 Y101.194 I.268 J-.255 E.00401
G2 X79.876 Y101.232 I.374 J-1.462 E.01391
G1 X79.068 Y100.424 E.02894
G1 X79.068 Y99.874 E.01392
G1 X80.426 Y101.232 E.04862
G1 X80.975 Y101.232 E.01392
G1 X79.068 Y99.325 E.06831
G1 X79.068 Y98.775 E.01392
G1 X81.525 Y101.232 E.08799
G1 X82.074 Y101.232 E.01392
G1 X79.068 Y98.226 E.10768
G1 X79.068 Y97.676 E.01392
M73 P24 R4
G1 X82.624 Y101.232 E.12736
G1 X83.173 Y101.232 E.01392
G1 X79.068 Y97.127 E.14704
G1 X79.068 Y96.577 E.01392
G1 X83.723 Y101.232 E.16673
G1 X84.272 Y101.232 E.01392
G1 X79.068 Y96.028 E.18641
G1 X79.068 Y95.478 E.01392
G1 X84.822 Y101.232 E.2061
G1 X85.371 Y101.232 E.01392
G1 X79.068 Y94.929 E.22578
G1 X79.068 Y94.379 E.01392
G1 X85.921 Y101.232 E.24546
G1 X86.47 Y101.232 E.01392
G1 X79.068 Y93.83 E.26515
G1 X79.068 Y93.28 E.01392
G1 X87.02 Y101.232 E.28483
G1 X87.569 Y101.232 E.01392
G1 X79.068 Y92.731 E.30452
G1 X79.068 Y92.181 E.01392
G1 X88.119 Y101.232 E.3242
G1 X88.668 Y101.232 E.01392
G1 X79.068 Y91.632 E.34388
G1 X79.068 Y91.082 E.01392
G1 X89.218 Y101.232 E.36357
G1 X89.767 Y101.232 E.01392
G1 X79.068 Y90.533 E.38325
G1 X79.068 Y89.983 E.01392
G1 X90.317 Y101.232 E.40294
G1 X90.866 Y101.232 E.01392
G1 X79.068 Y89.434 E.42262
G1 X79.068 Y88.884 E.01392
G1 X91.416 Y101.232 E.4423
G1 X91.965 Y101.232 E.01392
G1 X79.068 Y88.335 E.46199
G1 X79.068 Y87.785 E.01392
G1 X92.515 Y101.232 E.48167
G1 X93.064 Y101.232 E.01392
G1 X79.068 Y87.236 E.50135
G1 X79.068 Y86.686 E.01392
G1 X93.787 Y101.405 E.52725
M204 S10000
G1 X103.601 Y98.581 F42000
G1 F11581.521
M204 S6000
G1 X104.929 Y99.909 E.04757
G1 X104.93 Y99.36 E.01389
G1 X104.324 Y98.755 E.0217
G1 X104.874 Y98.755 E.01392
G1 X105.104 Y98.985 E.00825
; WIPE_START
G1 X104.874 Y98.755 E-.12384
G1 X104.324 Y98.755 E-.20883
G1 X104.93 Y99.36 E-.32556
G1 X104.93 Y99.628 E-.10176
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.994 Y91.996 Z.92 F42000
G1 X105.102 Y79.201 Z.92
G1 Z.52
G1 E.8 F1800
G1 F11581.521
M204 S6000
G1 X104.773 Y78.872 E.01177
G2 X104.483 Y78.77 I-.291 J.361 E.00795
G1 X104.121 Y78.77 E.00917
G1 X104.932 Y79.58 E.02903
G1 X104.932 Y80.13 E.01392
G1 X103.572 Y78.77 E.04872
G1 X103.022 Y78.77 E.01392
G1 X104.932 Y80.679 E.0684
G1 X104.932 Y81.229 E.01392
G1 X102.473 Y78.77 E.08809
G1 X101.923 Y78.77 E.01392
G1 X104.399 Y81.245 E.08869
G1 X103.85 Y81.246 E.01392
G1 X101.374 Y78.77 E.08869
G1 X100.824 Y78.77 E.01392
G1 X103.3 Y81.246 E.0887
G1 X103.168 Y81.246 E.00336
G1 X103.168 Y81.662 E.01056
G1 X100.275 Y78.77 E.10363
G1 X99.725 Y78.769 E.01392
G1 X103.168 Y82.212 E.12331
G1 X103.168 Y82.761 E.01392
G1 X99.176 Y78.769 E.143
G1 X98.626 Y78.769 E.01392
G1 X103.168 Y83.311 E.16268
G1 X103.168 Y83.86 E.01392
G1 X98.076 Y78.769 E.18237
G1 X97.527 Y78.769 E.01392
G1 X103.168 Y84.41 E.20205
G1 X103.168 Y84.959 E.01392
G1 X96.977 Y78.769 E.22174
G1 X96.428 Y78.769 E.01392
G1 X103.168 Y85.509 E.24142
G1 X103.168 Y86.058 E.01392
G1 X95.878 Y78.769 E.26111
M73 P25 R4
G1 X95.329 Y78.769 E.01392
G1 X103.168 Y86.608 E.28079
G1 X103.168 Y87.157 E.01392
G1 X94.779 Y78.769 E.30048
G1 X94.23 Y78.769 E.01392
G1 X103.168 Y87.707 E.32016
G1 X103.168 Y88.256 E.01392
G1 X93.68 Y78.769 E.33985
G1 X93.131 Y78.769 E.01392
G1 X103.168 Y88.806 E.35953
G1 X103.168 Y89.355 E.01392
G1 X92.581 Y78.769 E.37921
G1 X92.032 Y78.769 E.01392
G1 X103.168 Y89.905 E.3989
G1 X103.168 Y90.454 E.01392
G1 X91.482 Y78.769 E.41858
G1 X90.933 Y78.769 E.01392
G1 X103.168 Y91.004 E.43827
G1 X103.168 Y91.553 E.01392
G1 X90.383 Y78.769 E.45795
G1 X89.834 Y78.769 E.01392
G1 X103.168 Y92.103 E.47764
G1 X103.168 Y92.652 E.01392
G1 X89.284 Y78.769 E.49732
G1 X88.735 Y78.769 E.01392
G1 X103.168 Y93.202 E.51701
G1 X103.168 Y93.751 E.01392
G1 X88.185 Y78.769 E.53669
G1 X87.636 Y78.769 E.01392
G1 X103.168 Y94.301 E.55638
G1 X103.168 Y94.85 E.01392
G1 X87.086 Y78.769 E.57606
G1 X86.536 Y78.769 E.01392
G1 X103.168 Y95.4 E.59575
G1 X103.168 Y95.949 E.01392
G1 X85.987 Y78.769 E.61543
G1 X85.437 Y78.769 E.01392
G1 X103.168 Y96.499 E.63512
G1 X103.168 Y97.048 E.01392
G1 X84.888 Y78.769 E.6548
G1 X84.338 Y78.769 E.01392
G1 X103.168 Y97.598 E.67449
G1 X103.168 Y98.147 E.01392
G1 X83.789 Y78.769 E.69417
G1 X83.239 Y78.769 E.01392
G1 X104.928 Y100.457 E.77692
G1 X104.928 Y100.829 E.00941
G1 X104.889 Y100.968 E.00365
G1 X82.69 Y78.769 E.79521
G1 X82.14 Y78.769 E.01392
G1 X104.591 Y101.219 E.80422
G3 X104.054 Y101.232 I-.333 J-2.804 E.01363
G1 X81.591 Y78.768 E.80466
M73 P26 R4
G1 X81.041 Y78.768 E.01392
G1 X103.504 Y101.232 E.80466
G1 X102.955 Y101.232 E.01392
G1 X80.492 Y78.768 E.80466
G1 X79.942 Y78.768 E.01392
G1 X102.405 Y101.232 E.80466
G1 X101.856 Y101.232 E.01392
G1 X79.406 Y78.782 E.80419
G2 X79.106 Y79.031 I.103 J.43 E.01024
G1 X101.306 Y101.232 E.79527
G1 X100.757 Y101.232 E.01392
G1 X86.767 Y87.241 E.50115
G1 X86.801 Y87.344 E.00275
G1 X86.856 Y87.88 E.01363
G1 X100.208 Y101.232 E.47829
G1 X99.658 Y101.232 E.01392
G1 X86.801 Y88.375 E.46056
G1 X86.672 Y88.795 E.01113
G1 X99.109 Y101.232 E.44551
G1 X98.559 Y101.232 E.01392
G1 X86.485 Y89.158 E.4325
G1 X86.243 Y89.465 E.00991
G1 X98.01 Y101.232 E.42148
G1 X97.46 Y101.232 E.01392
G1 X85.958 Y89.73 E.41201
G3 X85.629 Y89.95 I-.709 J-.705 E.0101
G1 X96.911 Y101.232 E.40412
G1 X96.361 Y101.232 E.01392
G1 X85.25 Y90.121 E.39802
G3 X84.808 Y90.228 I-.486 J-1.041 E.0116
G1 X95.812 Y101.232 E.39417
G1 X95.262 Y101.232 E.01392
G1 X84.271 Y90.241 E.39371
G1 X84.002 Y90.214 E.00685
G1 X83.556 Y90.075 E.01182
G1 X94.713 Y101.232 E.39964
G1 X94.163 Y101.232 E.01392
G1 X79.068 Y86.137 E.54072
G1 X79.068 Y85.587 E.01392
G1 X82.281 Y88.8 E.1151
G3 X82.108 Y88.077 I1.702 J-.791 E.01896
G1 X79.068 Y85.038 E.10887
G1 X79.068 Y84.488 E.01392
G1 X82.119 Y87.539 E.10929
G1 X82.125 Y87.46 E.00201
G1 X82.227 Y87.098 E.00954
G1 X79.068 Y83.939 E.11316
G1 X79.068 Y83.389 E.01392
G1 X82.399 Y86.72 E.11931
G3 X82.621 Y86.392 I.922 J.384 E.01009
G1 X79.068 Y82.84 E.12725
G1 X79.068 Y82.29 E.01392
G1 X82.887 Y86.109 E.13677
G1 X83.196 Y85.868 E.00992
G1 X79.068 Y81.741 E.14785
G1 X79.068 Y81.191 E.01392
G1 X83.552 Y85.675 E.16061
G1 X83.973 Y85.547 E.01115
G1 X79.068 Y80.642 E.17569
M73 P27 R4
G1 X79.068 Y80.093 E.01392
G1 X84.466 Y85.49 E.19333
G3 X85.113 Y85.588 I.061 J1.783 E.0167
G1 X78.895 Y79.37 E.22276
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11581.521
G1 X80.309 Y80.784 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/30
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.92 I-1.164 J-.355 P1  F42000
G1 X76.915 Y91.926 Z.92
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X76.898 Y91.951 E.00081
G3 X74.139 Y91.115 I-1.248 J-.852 E.10363
G1 X74.139 Y88.877 E.06065
G3 X75.387 Y87.411 I1.551 J.056 E.05629
G3 X77.161 Y88.884 I.258 J1.493 E.071
G1 X77.161 Y91.123 E.06066
G3 X77.011 Y91.755 I-1.511 J-.024 E.01775
G1 X76.944 Y91.874 E.00368
M204 S250
G1 X76.567 Y91.725 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X74.54 Y91.105 I-.917 J-.626 E.07078
G1 X74.54 Y88.892 E.05565
G3 X75.457 Y87.806 I1.139 J.032 E.03858
G3 X76.76 Y88.895 I.19 J1.097 E.04854
G1 X76.76 Y91.108 E.05565
G3 X76.599 Y91.675 I-1.11 J-.009 E.01498
; WIPE_START
M204 S6000
G1 X76.466 Y91.853 E-.08477
G1 X76.296 Y92.003 E-.08598
G1 X76.157 Y92.088 E-.06211
G1 X76.004 Y92.153 E-.06303
G1 X75.843 Y92.194 E-.06313
G1 X75.68 Y92.21 E-.06207
G1 X75.457 Y92.193 E-.08495
G1 X75.244 Y92.133 E-.08413
G1 X75.048 Y92.033 E-.08395
G1 X74.875 Y91.895 E-.08401
G1 X74.872 Y91.891 E-.00188
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.298 Y90.127 Z1.08 F42000
G1 X83.759 Y89.78 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X83.5 Y89.665 E.00769
G3 X84.269 Y85.842 I.982 J-1.791 E.14036
G1 X84.478 Y85.831 E.00566
G3 X83.874 Y89.823 I.004 J2.043 E.19072
G1 X83.815 Y89.801 E.0017
M204 S10000
G1 X83.92 Y89.399 F42000
G1 F10826.06
M204 S6000
G1 X83.698 Y89.301 E.00657
G3 X84.311 Y86.256 I.781 J-1.427 E.11183
G1 X84.475 Y86.247 E.00444
G3 X83.996 Y89.427 I.005 J1.627 E.15189
G1 X83.976 Y89.42 E.00058
M204 S10000
G1 X84.081 Y89.017 F42000
G1 F10826.06
M204 S6000
G1 X83.897 Y88.937 E.00545
G3 X84.353 Y86.67 I.58 J-1.063 E.08331
G1 X84.472 Y86.663 E.00321
G3 X84.138 Y89.036 I.005 J1.211 E.11252
M204 S250
G1 X84.236 Y88.648 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X84.394 Y87.069 I.238 J-.774 E.05585
G1 X84.469 Y87.065 E.00189
G3 X84.294 Y88.664 I.006 J.81 E.06867
; WIPE_START
M204 S6000
G1 X84.087 Y88.587 E-.084
G1 X83.954 Y88.496 E-.06116
G1 X83.773 Y88.28 E-.10695
G1 X83.707 Y88.133 E-.06133
G1 X83.671 Y87.976 E-.06136
G1 X83.667 Y87.815 E-.06129
G1 X83.695 Y87.656 E-.06133
G1 X83.754 Y87.505 E-.06134
G1 X83.842 Y87.37 E-.06128
G1 X83.954 Y87.254 E-.0613
G1 X84.087 Y87.163 E-.0613
G1 X84.129 Y87.146 E-.01736
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.992 Y91.221 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X77.992 Y88.779 E.06615
G1 X78.667 Y89.238 E.02213
G1 X78.668 Y79.218 E.27151
G3 X79.519 Y78.367 I.836 J-.014 E.0364
G1 X104.498 Y78.368 E.67687
G1 X104.741 Y78.404 E.00667
G1 X104.962 Y78.508 E.00662
G1 X105.143 Y78.672 E.00661
G1 X105.264 Y78.87 E.00629
G3 X105.333 Y79.218 I-.819 J.342 E.00968
G1 X105.333 Y81.562 E.06352
G1 X103.508 Y81.563 E.04944
G1 X103.508 Y82.583 E.02764
G1 X100.883 Y82.583 E.07114
G1 X100.883 Y97.417 E.40198
G1 X103.508 Y97.417 E.07114
G1 X103.508 Y98.437 E.02764
G1 X105.333 Y98.438 E.04944
G1 X105.333 Y100.781 E.06351
G3 X104.481 Y101.633 I-.836 J.015 E.0364
G1 X79.519 Y101.633 E.67641
G3 X78.668 Y100.782 I-.015 J-.836 E.0364
G1 X78.667 Y90.762 E.27151
G1 X78.042 Y91.187 E.0205
M204 S10000
G1 X77.422 Y91.936 F42000
G1 F10826.06
M204 S6000
G1 X77.397 Y91.915 E.00089
G2 X77.576 Y91.139 I-1.909 J-.851 E.02174
G1 X77.576 Y88.874 E.06137
G2 X77.402 Y88.085 I-2.596 J.159 E.02199
G1 X77.545 Y87.973 E.00492
G1 X78.252 Y88.453 E.02315
G1 X78.252 Y79.213 E.25038
G3 X79.513 Y77.952 I1.253 J-.009 E.0538
G1 X104.503 Y77.952 E.67715
G3 X105.748 Y79.213 I-.007 J1.252 E.05335
G1 X105.748 Y81.978 E.07492
G1 X103.924 Y81.978 E.04944
G1 X103.924 Y82.998 E.02764
G1 X101.298 Y82.998 E.07114
G1 X101.298 Y97.002 E.37945
G1 X103.924 Y97.002 E.07114
G1 X103.924 Y98.022 E.02764
G1 X105.748 Y98.022 E.04944
G1 X105.748 Y100.787 E.07492
G3 X104.487 Y102.048 I-1.253 J.009 E.0538
G1 X79.513 Y102.048 E.6767
G3 X78.252 Y100.787 I-.009 J-1.253 E.0538
G1 X78.252 Y91.547 E.25038
G1 X77.54 Y92.03 E.02331
G1 X77.469 Y91.973 E.00247
M204 S10000
G1 X77.471 Y92.58 F42000
G1 F10826.06
M204 S6000
G1 X76.721 Y93.09 E.02459
G3 X73.811 Y91.492 I-1.02 J-1.591 E.10982
G1 X73.811 Y88.508 E.08087
G3 X76.721 Y86.91 I1.89 J-.007 E.10982
G1 X77.836 Y87.668 E.03654
G1 X77.836 Y79.208 E.22925
G3 X79.508 Y77.536 I1.669 J-.003 E.07119
G1 X104.508 Y77.537 E.67744
G3 X106.164 Y79.208 I-.013 J1.668 E.07074
G1 X106.164 Y82.394 E.08632
M73 P28 R4
G1 X104.339 Y82.394 E.04944
G1 X104.339 Y83.414 E.02764
G1 X101.714 Y83.414 E.07114
G1 X101.714 Y96.586 E.35692
G1 X104.339 Y96.586 E.07114
G1 X104.339 Y97.606 E.02764
G1 X106.164 Y97.606 E.04944
G1 X106.164 Y100.792 E.08632
G3 X104.492 Y102.464 I-1.669 J.003 E.0712
G1 X79.508 Y102.464 E.67699
G3 X77.836 Y100.792 I-.003 J-1.669 E.07119
G1 X77.836 Y92.332 E.22925
G1 X77.521 Y92.546 E.01032
M204 S250
G1 X77.435 Y93.112 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X77.435 Y93.088 E.0006
G3 X76.41 Y93.677 I-2.405 J-3.003 E.02984
G3 X73.41 Y91.497 I-.707 J-2.182 E.10857
G1 X73.41 Y88.503 E.07529
G3 X76.937 Y86.573 I2.291 J-.001 E.12334
G1 X77.105 Y86.687 E.00508
G1 X77.435 Y86.912 E.01006
G1 F8094.349
G1 X77.435 Y86.888 E.0006
G1 F7800
G1 X77.436 Y79.803 E.17812
G3 X77.524 Y78.601 I4.113 J-.3 E.03042
G3 X79.503 Y77.136 I1.983 J.61 E.06626
G1 X104.514 Y77.136 E.62881
G3 X106.564 Y79.203 I-.019 J2.07 E.08119
G1 X106.565 Y82.794 E.09029
G1 F8037.726
G1 X106.545 Y82.794 E.00048
G1 F11668.197
G1 X106.145 Y82.794 E.01006
G1 X104.74 Y82.795 E.03533
G1 X104.74 Y97.205 E.36231
G1 X106.145 Y97.206 E.03533
G1 X106.545 Y97.206 E.01006
G1 F8037.726
G1 X106.565 Y97.206 E.00048
G1 F7800
G1 X106.565 Y100.197 E.07521
G3 X106.476 Y101.399 I-4.114 J.3 E.03041
G3 X104.497 Y102.864 I-1.983 J-.609 E.06627
G1 X80.103 Y102.864 E.61331
G3 X78.901 Y102.775 I-.3 J-4.112 E.03042
G3 X77.436 Y100.797 I.61 J-1.983 E.06626
G1 X77.435 Y93.172 E.1917
; WIPE_START
M204 S6000
G1 X77.435 Y93.088 E-.03184
G1 X76.84 Y93.486 E-.27198
G1 X76.637 Y93.59 E-.08675
G1 X76.41 Y93.677 E-.09232
G1 X76.205 Y93.734 E-.08086
G1 X75.867 Y93.784 E-.12985
G1 X75.692 Y93.779 E-.06641
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

G1 X75.072 Y92.886
G1 Z.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.332674
G1 F15083.599
M204 S6000
G1 X74.96 Y92.838 E.00239
G3 X74.797 Y92.749 I1.835 J-3.566 E.00361
; LINE_WIDTH: 0.292981
G1 F17398.406
G3 X74.601 Y92.608 I.758 J-1.261 E.00407
; LINE_WIDTH: 0.259822
G1 F18000
G1 X74.495 Y92.513 E.0021
; LINE_WIDTH: 0.224147
G1 X74.338 Y92.334 E.00294
; LINE_WIDTH: 0.189965
G1 X74.276 Y92.249 E.00107
; LINE_WIDTH: 0.154817
G3 X74.167 Y92.06 I1.364 J-.914 E.00171
; LINE_WIDTH: 0.107344
G3 X74.082 Y91.858 I1.449 J-.724 E.00104
M204 S10000
G1 X75.072 Y92.886 F42000
; LINE_WIDTH: 0.380312
G1 F13006.697
M204 S6000
G2 X75.287 Y92.953 I.758 J-2.042 E.00507
G1 X75.426 Y92.98 E.0032
G2 X76.892 Y92.52 I.214 J-1.882 E.03568
; LINE_WIDTH: 0.387436
G1 F12744.26
G2 X77.064 Y92.379 I-6.75 J-8.415 E.00511
; LINE_WIDTH: 0.431319
G1 F11335.502
G1 X77.333 Y92.13 E.00947
; WIPE_START
G1 X77.064 Y92.379 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.159 Y90.882 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424296
G1 F11539.645
M204 S6000
G1 X90.332 Y78.708 E.43765
G1 X89.781 Y78.708 E.01402
G1 X78.333 Y90.157 E.41158
G1 X78.333 Y89.605 E.01402
G1 X78.566 Y89.371 E.0084
M204 S10000
G1 X78.834 Y89.103 F42000
G1 F11539.645
M204 S6000
G1 X89.229 Y78.708 E.37371
G1 X88.678 Y78.708 E.01402
G1 X79.008 Y88.378 E.34764
G1 X79.008 Y87.826 E.01402
G1 X88.126 Y78.708 E.32781
G1 X87.575 Y78.708 E.01402
G1 X79.008 Y87.275 E.30798
G1 X79.008 Y86.723 E.01402
G1 X87.023 Y78.708 E.28815
G1 X86.472 Y78.708 E.01402
G1 X79.008 Y86.172 E.26833
G1 X79.009 Y85.62 E.01402
G1 X85.921 Y78.708 E.2485
G1 X85.369 Y78.708 E.01402
G1 X79.009 Y85.069 E.22867
G1 X79.009 Y84.517 E.01402
G1 X84.818 Y78.708 E.20884
G1 X84.266 Y78.708 E.01402
G1 X79.009 Y83.965 E.18901
G1 X79.009 Y83.414 E.01402
G1 X83.715 Y78.708 E.16918
G1 X83.163 Y78.708 E.01402
G1 X79.009 Y82.862 E.14935
G1 X79.009 Y82.311 E.01402
G1 X82.612 Y78.708 E.12952
G1 X82.06 Y78.708 E.01402
G1 X79.009 Y81.759 E.10969
G1 X79.009 Y81.208 E.01402
G1 X81.509 Y78.708 E.08986
G1 X80.957 Y78.708 E.01402
G1 X79.009 Y80.656 E.07003
G1 X79.009 Y80.104 E.01402
M73 P29 R4
G1 X80.406 Y78.708 E.0502
G1 X79.854 Y78.708 E.01402
G1 X79.009 Y79.553 E.03037
G3 X79.026 Y79.078 I1.577 J-.184 E.01213
G3 X79.145 Y78.866 I.503 J.143 E.00622
G1 X79.473 Y78.538 E.0118
M204 S10000
G1 X83.832 Y85.76 F42000
G1 F11539.645
M204 S6000
G1 X90.884 Y78.708 E.25351
G1 X91.435 Y78.708 E.01402
G1 X84.643 Y85.5 E.24419
G3 X85.114 Y85.581 I-.138 J2.222 E.01217
G1 X91.987 Y78.708 E.24708
G1 X92.538 Y78.708 E.01402
G1 X85.517 Y85.729 E.25242
G1 X85.859 Y85.939 E.0102
G1 X93.09 Y78.708 E.25994
G1 X93.641 Y78.708 E.01402
G1 X86.155 Y86.195 E.26915
G3 X86.407 Y86.494 I-.616 J.773 E.01002
G1 X94.193 Y78.708 E.27992
G1 X94.744 Y78.708 E.01402
G1 X86.613 Y86.84 E.29234
G3 X86.765 Y87.239 I-.911 J.576 E.01093
G1 X95.296 Y78.708 E.30669
G1 X95.847 Y78.708 E.01402
G1 X86.846 Y87.71 E.32361
G3 X86.812 Y88.295 I-1.466 J.208 E.01501
G1 X96.399 Y78.708 E.34466
G1 X96.95 Y78.708 E.01402
G1 X79.008 Y96.65 E.64504
G1 X79.008 Y97.202 E.01402
G1 X97.502 Y78.708 E.66487
G1 X98.053 Y78.708 E.01402
G1 X79.008 Y97.753 E.68469
G1 X79.008 Y98.305 E.01402
G1 X98.604 Y78.708 E.70452
G1 X99.156 Y78.708 E.01402
G1 X79.008 Y98.856 E.72434
G1 X79.008 Y99.408 E.01402
G1 X99.707 Y78.708 E.74417
G1 X100.259 Y78.708 E.01402
G1 X79.008 Y99.959 E.764
G1 X79.008 Y100.511 E.01402
G1 X100.81 Y78.708 E.78382
G1 X101.362 Y78.708 E.01402
G1 X79.06 Y101.01 E.80178
G2 X79.356 Y101.266 I.459 J-.232 E.0102
G1 X101.913 Y78.708 E.81097
G1 X102.465 Y78.708 E.01402
G1 X79.881 Y101.292 E.81191
G1 X80.433 Y101.292 E.01402
G1 X103.016 Y78.708 E.81191
G1 X103.568 Y78.708 E.01402
G1 X80.811 Y101.466 E.81815
M204 S10000
G1 X78.834 Y96.272 F42000
G1 F11539.645
M204 S6000
M73 P30 R4
G1 X84.895 Y90.212 E.21787
G1 X84.712 Y90.249 E.00472
G1 X84.306 Y90.249 E.01033
G1 X79.008 Y95.547 E.19048
G1 X79.008 Y94.996 E.01402
G1 X83.836 Y90.168 E.17357
G1 X83.438 Y90.014 E.01084
G1 X79.008 Y94.444 E.15927
G1 X79.008 Y93.893 E.01402
G1 X83.094 Y89.807 E.1469
G3 X82.789 Y89.56 I.682 J-1.155 E.01
G1 X79.008 Y93.341 E.13594
G1 X79.008 Y92.79 E.01402
G1 X82.536 Y89.262 E.12682
G3 X82.337 Y88.909 I1.071 J-.835 E.01033
G1 X79.008 Y92.239 E.11969
G1 X79.008 Y91.687 E.01402
G1 X82.185 Y88.51 E.11421
G1 X82.107 Y88.171 E.00883
G1 X82.104 Y88.039 E.00336
G1 X79.008 Y91.136 E.11131
G1 X79.008 Y90.584 E.01402
G1 X82.365 Y87.227 E.12071
; WIPE_START
G1 X80.951 Y88.641 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.334 Y87.874 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.441188
G1 F11060.547
M204 S6000
G2 X77.11 Y87.662 I-4.405 J4.429 E.00818
; LINE_WIDTH: 0.403008
G1 F12205.989
G1 X76.966 Y87.539 E.00456
; LINE_WIDTH: 0.379839
G1 F13024.484
G1 X76.503 Y87.218 E.01268
G2 X75.074 Y87.112 I-.826 J1.461 E.03336
; LINE_WIDTH: 0.332467
G1 F15094.072
G1 X75.063 Y87.116 E.00023
G2 X74.793 Y87.251 I1.224 J2.786 E.00586
; LINE_WIDTH: 0.286688
G1 F17832.272
G2 X74.549 Y87.436 I1.377 J2.078 E.00504
; LINE_WIDTH: 0.23897
G1 F18000
G2 X74.382 Y87.609 I3.388 J3.444 E.00321
; LINE_WIDTH: 0.200008
G1 X74.291 Y87.731 E.00165
; LINE_WIDTH: 0.165855
G1 X74.204 Y87.87 E.0014
; LINE_WIDTH: 0.130133
G1 X74.132 Y88.015 E.00101
; LINE_WIDTH: 0.100336
G1 X74.082 Y88.139 E.00058
; WIPE_START
G1 X74.132 Y88.015 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.591 Y86.4 Z1.08 F42000
G1 X103.341 Y81.693 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424296
G1 F11539.645
M204 S6000
G1 X102.792 Y82.242 E.01975
G1 X102.24 Y82.242 E.01402
G1 X104.992 Y79.49 E.09893
G2 X104.934 Y78.997 I-.953 J-.139 E.01278
G1 X101.689 Y82.242 E.11668
G1 X101.137 Y82.242 E.01402
G1 X104.645 Y78.734 E.12612
G2 X104.119 Y78.708 I-.349 J1.773 E.01344
G1 X81.536 Y101.292 E.81191
G1 X82.087 Y101.292 E.01402
G1 X100.542 Y82.837 E.66348
G1 X100.542 Y83.389 E.01402
G1 X82.639 Y101.292 E.64365
G1 X83.19 Y101.292 E.01402
G1 X100.542 Y83.94 E.62383
G1 X100.542 Y84.492 E.01402
G1 X83.742 Y101.292 E.604
G1 X84.293 Y101.292 E.01402
G1 X100.542 Y85.043 E.58417
G1 X100.542 Y85.594 E.01402
G1 X84.845 Y101.292 E.56435
G1 X85.396 Y101.292 E.01402
G1 X100.542 Y86.146 E.54452
G1 X100.542 Y86.697 E.01402
G1 X85.948 Y101.292 E.52469
G1 X86.499 Y101.292 E.01402
G1 X100.542 Y87.249 E.50487
G1 X100.542 Y87.8 E.01402
G1 X87.051 Y101.292 E.48504
G1 X87.602 Y101.292 E.01402
G1 X100.542 Y88.352 E.46521
G1 X100.542 Y88.903 E.01402
G1 X88.154 Y101.292 E.44539
G1 X88.705 Y101.292 E.01402
G1 X100.542 Y89.455 E.42556
G1 X100.542 Y90.006 E.01402
G1 X89.257 Y101.292 E.40573
M73 P31 R4
G1 X89.808 Y101.292 E.01402
G1 X100.542 Y90.558 E.38591
G1 X100.542 Y91.109 E.01402
G1 X90.36 Y101.292 E.36608
G1 X90.911 Y101.292 E.01402
G1 X100.542 Y91.661 E.34625
G1 X100.542 Y92.212 E.01402
G1 X91.463 Y101.292 E.32643
G1 X92.014 Y101.292 E.01402
G1 X100.542 Y92.764 E.3066
G1 X100.542 Y93.315 E.01402
G1 X92.565 Y101.292 E.28677
G1 X93.117 Y101.292 E.01402
G1 X100.542 Y93.867 E.26695
G1 X100.542 Y94.418 E.01402
G1 X93.668 Y101.292 E.24712
G1 X94.22 Y101.292 E.01402
G1 X100.542 Y94.97 E.22729
G1 X100.542 Y95.521 E.01402
G1 X94.771 Y101.292 E.20747
G1 X95.323 Y101.292 E.01402
G1 X100.542 Y96.073 E.18764
G1 X100.542 Y96.624 E.01402
G1 X95.874 Y101.292 E.16781
G1 X96.426 Y101.292 E.01402
G1 X100.542 Y97.176 E.14799
G1 X100.542 Y97.727 E.01402
G1 X96.977 Y101.292 E.12816
G1 X97.529 Y101.292 E.01402
G1 X101.063 Y97.758 E.12705
G1 X101.614 Y97.758 E.01402
G1 X98.08 Y101.292 E.12705
G1 X98.632 Y101.292 E.01402
G1 X102.166 Y97.758 E.12705
G1 X102.717 Y97.758 E.01402
G1 X99.183 Y101.292 E.12705
G1 X99.735 Y101.292 E.01402
G1 X103.168 Y97.859 E.12341
G1 X103.168 Y98.411 E.01402
G1 X100.286 Y101.292 E.10358
G1 X100.838 Y101.292 E.01402
G1 X103.352 Y98.778 E.09039
G1 X103.903 Y98.778 E.01402
G1 X101.389 Y101.292 E.09039
G1 X101.941 Y101.292 E.01402
G1 X104.455 Y98.778 E.09038
G1 X104.991 Y98.778 E.01364
G1 X104.991 Y98.793 E.00038
G1 X102.492 Y101.292 E.08985
G1 X103.044 Y101.292 E.01402
G1 X104.99 Y99.345 E.06998
G1 X104.989 Y99.898 E.01405
G1 X103.595 Y101.292 E.05012
G1 X104.147 Y101.292 E.01402
G1 X104.988 Y100.45 E.03026
G1 X104.988 Y100.848 E.01011
G3 X104.877 Y101.113 I-.547 J-.072 E.00739
G1 X104.528 Y101.462 E.01254
; WIPE_START
G1 X104.877 Y101.113 E-.18747
G1 X104.932 Y101.031 E-.03761
G1 X104.988 Y100.848 E-.0726
G1 X104.988 Y100.45 E-.15109
G1 X104.409 Y101.03 E-.31123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.094 Y96.359 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S2000
G1 X104.528 Y95.925 E.01543
G1 X104.528 Y95.379
G1 X103.548 Y96.359 E.03483
G1 X103.003 Y96.359
G1 X104.528 Y94.834 E.05422
G1 X104.528 Y94.289
G1 X102.458 Y96.359 E.07361
G1 X101.941 Y96.33
G1 X104.528 Y93.743 E.09197
G1 X104.528 Y93.198
G1 X101.941 Y95.784 E.09197
G1 X101.941 Y95.239
G1 X104.528 Y92.652 E.09197
G1 X104.528 Y92.107
G1 X101.941 Y94.694 E.09197
G1 X101.941 Y94.148
G1 X104.528 Y91.561 E.09197
G1 X104.528 Y91.016
G1 X101.941 Y93.603 E.09197
G1 X101.941 Y93.057
G1 X104.528 Y90.471 E.09197
G1 X104.528 Y89.925
G1 X101.941 Y92.512 E.09197
G1 X101.941 Y91.967
G1 X104.528 Y89.38 E.09197
G1 X104.528 Y88.834
G1 X101.941 Y91.421 E.09197
G1 X101.941 Y90.876
G1 X104.528 Y88.289 E.09197
M73 P32 R4
G1 X104.528 Y87.744
G1 X101.941 Y90.33 E.09197
G1 X101.941 Y89.785
G1 X104.528 Y87.198 E.09197
G1 X104.528 Y86.653
G1 X101.941 Y89.24 E.09197
G1 X101.941 Y88.694
G1 X104.528 Y86.107 E.09197
G1 X104.528 Y85.562
G1 X101.941 Y88.149 E.09197
G1 X101.941 Y87.603
G1 X104.528 Y85.017 E.09197
G1 X104.528 Y84.471
G1 X101.941 Y87.058 E.09197
G1 X101.941 Y86.513
G1 X104.528 Y83.926 E.09197
G1 X104.267 Y83.641
G1 X101.941 Y85.967 E.0827
G1 X101.941 Y85.422
G1 X103.722 Y83.641 E.06331
G1 X103.176 Y83.641
G1 X101.941 Y84.876 E.04391
G1 X101.941 Y84.331
G1 X102.631 Y83.641 E.02452
; WIPE_START
M204 S6000
G1 X101.941 Y84.331 E-.37063
G1 X101.941 Y84.876 E-.20726
G1 X102.28 Y84.537 E-.18211
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.741 Y81.396 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424296
G1 F11539.645
M204 S6000
G1 X104.992 Y81.145 E.00902
G1 X104.992 Y80.593 E.01402
G1 X104.363 Y81.222 E.02261
G1 X103.812 Y81.222 E.01402
G1 X105.166 Y79.868 E.04868
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11539.645
G1 X103.812 Y81.222 E-.72764
G1 X103.897 Y81.222 E-.03236
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/30
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S198.9
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.08 I-.417 J-1.143 P1  F42000
G1 X83.955 Y88.495 Z1.08
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X84.395 Y87.069 I.52 J-.62 E.04771
G1 X84.475 Y87.065 E.00204
G3 X84.003 Y88.532 I0 J.81 E.07667
; WIPE_START
M204 S6000
G1 X83.842 Y88.38 E-.08394
G1 X83.754 Y88.245 E-.06139
G1 X83.671 Y87.976 E-.10692
G1 X83.667 Y87.815 E-.06114
G1 X83.695 Y87.655 E-.06189
G1 X83.754 Y87.505 E-.06112
G1 X83.842 Y87.37 E-.06122
G1 X83.954 Y87.254 E-.06132
G1 X84.087 Y87.164 E-.0611
G1 X84.236 Y87.101 E-.0614
G1 X84.395 Y87.069 E-.06141
G1 X84.44 Y87.066 E-.01716
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.085 Y91.294 Z1.24 F42000
G1 X76.414 Y92.406 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X76.414 Y93.25 E.02287
G3 X73.811 Y91.492 I-.712 J-1.752 E.10044
G1 X73.811 Y88.508 E.08087
G3 X75.839 Y86.616 I1.891 J-.006 E.08439
G3 X76.414 Y86.75 I-.21 J2.205 E.01604
G1 X76.414 Y87.589 E.02273
G2 X74.139 Y88.877 I-.755 J1.319 E.08527
G1 X74.139 Y91.115 E.06065
G2 X76.362 Y92.435 I1.52 J-.029 E.08371
M204 S250
G1 X76.567 Y91.725 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X74.54 Y91.105 I-.917 J-.626 E.07079
G1 X74.54 Y88.892 E.05565
G3 X75.457 Y87.806 I1.11 J.007 E.03878
G3 X76.76 Y88.895 I.19 J1.097 E.04854
G1 X76.76 Y91.108 E.05565
G3 X76.599 Y91.674 I-1.11 J-.009 E.01498
; WIPE_START
M204 S6000
G1 X76.464 Y91.855 E-.08583
G1 X76.343 Y91.968 E-.06303
G1 X76.205 Y92.062 E-.06317
G1 X76.058 Y92.133 E-.06201
G1 X75.84 Y92.194 E-.08606
G1 X75.68 Y92.21 E-.06107
G1 X75.457 Y92.193 E-.08495
G1 X75.244 Y92.134 E-.08405
G1 X75.048 Y92.033 E-.08405
G1 X74.875 Y91.895 E-.08394
G1 X74.872 Y91.891 E-.00184
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.411 Y93.106 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S5000
G3 X76.205 Y93.734 I-2.162 J-2.683 E.03441
G3 X73.41 Y91.497 I-.5 J-2.24 E.10322
G1 X73.41 Y88.503 E.07529
G3 X76.938 Y86.573 I2.291 J-.001 E.12334
G1 X77.411 Y86.894 E.01437
G1 X77.411 Y79.203 E.19337
G3 X79.503 Y77.111 I2.095 J.004 E.08257
G1 X104.6 Y77.114 E.63099
G3 X106.589 Y79.203 I-.102 J2.088 E.08002
G1 X106.589 Y82.79 E.09019
G1 X104.74 Y82.79 E.04648
G1 X104.74 Y84.79 E.05028
G1 X103.09 Y84.79 E.04148
G1 X103.09 Y95.21 E.26197
G1 X104.74 Y95.21 E.04148
G1 X104.74 Y97.21 E.05028
G1 X106.589 Y97.21 E.04648
G1 X106.589 Y100.797 E.09019
G3 X104.497 Y102.889 I-2.095 J-.004 E.08257
G1 X79.503 Y102.889 E.62839
G3 X77.411 Y100.797 I.003 J-2.095 E.08257
G1 X77.411 Y93.166 E.19186
; WIPE_START
M204 S6000
G1 X76.938 Y93.427 E-.20534
G1 X76.74 Y93.54 E-.08671
G1 X76.425 Y93.672 E-.12989
G1 X76.205 Y93.734 E-.08663
G1 X75.98 Y93.773 E-.08668
G1 X75.639 Y93.789 E-.12984
G1 X75.548 Y93.778 E-.03491
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

G1 X76.197 Y93.105
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387025
G1 F12759.12
M204 S6000
G1 X76.024 Y92.963 E.00515
M73 P33 R4
G1 X75.957 Y92.977 E.00157
G3 X75.075 Y92.887 I-.272 J-1.699 E.02061
; LINE_WIDTH: 0.332559
G1 F15089.381
G1 X74.96 Y92.838 E.00243
G3 X74.796 Y92.75 I2.778 J-5.364 E.00361
; LINE_WIDTH: 0.293591
G1 F17357.468
G3 X74.609 Y92.616 I1.432 J-2.19 E.00389
; LINE_WIDTH: 0.26084
G1 F18000
G1 X74.495 Y92.513 E.00227
; LINE_WIDTH: 0.231179
G1 X74.383 Y92.393 E.00211
; LINE_WIDTH: 0.196858
G3 X74.276 Y92.248 I1.205 J-1.01 E.00191
; LINE_WIDTH: 0.158869
G3 X74.185 Y92.096 I1.474 J-.981 E.00144
; LINE_WIDTH: 0.119779
G3 X74.111 Y91.936 I1.911 J-.983 E.00098
; LINE_WIDTH: 0.0928478
G1 X74.082 Y91.858 E.00032
; WIPE_START
G1 X74.111 Y91.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.617 Y92.096 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.0749546
G1 F18000
M204 S6000
G1 X76.639 Y92.068 E.00009
; LINE_WIDTH: 0.109006
G3 X76.642 Y92.025 I.019 J-.021 E.00025
G1 X76.715 Y91.899 E.00071
; WIPE_START
G1 X76.642 Y92.025 E-.58401
G1 X76.639 Y92.068 E-.17599
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.713 Y88.096 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.113023
G1 F18000
M204 S6000
G1 X76.627 Y87.954 E.00085
G1 X76.659 Y87.899 E.00033
; WIPE_START
G1 X76.627 Y87.954 E-.21032
G1 X76.713 Y88.096 E-.54968
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.196 Y86.895 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.388388
G1 F12710.025
M204 S6000
G1 X76.024 Y87.037 E.00516
G1 X75.971 Y87.026 E.00125
G2 X75.131 Y87.093 I-.294 J1.619 E.01968
; LINE_WIDTH: 0.337906
G1 F14823.596
G1 X75.042 Y87.125 E.00188
G2 X74.811 Y87.241 I1.173 J2.635 E.0051
; LINE_WIDTH: 0.29126
G1 F17514.945
G1 X74.793 Y87.251 E.00035
G2 X74.572 Y87.415 I2.564 J3.69 E.00461
; LINE_WIDTH: 0.241212
G1 F18000
G2 X74.382 Y87.609 I2.663 J2.809 E.00366
; LINE_WIDTH: 0.199773
G1 X74.29 Y87.733 E.00167
; LINE_WIDTH: 0.165277
G1 X74.203 Y87.871 E.00139
; LINE_WIDTH: 0.127081
G2 X74.115 Y88.054 I4 J2.053 E.00123
; LINE_WIDTH: 0.0941113
G1 X74.082 Y88.142 E.00036
; WIPE_START
G1 X74.115 Y88.054 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.413 Y90.287 Z1.24 F42000
G1 X106.377 Y97.923 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S2000
G1 X105.876 Y97.422 E.01781
G1 X105.33 Y97.422
G1 X106.377 Y98.469 E.03721
G1 X106.377 Y99.014
G1 X104.785 Y97.422 E.0566
; WIPE_START
M204 S6000
G1 X106.199 Y98.836 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.876 Y95.422 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X104.528 Y96.074 E.02319
G1 X104.528 Y96.62
G1 X103.33 Y95.422 E.04258
; WIPE_START
M204 S6000
G1 X104.528 Y96.62 E-.64353
G1 X104.528 Y96.313 E-.11647
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.309 Y88.721 Z1.24 F42000
G1 X106.33 Y78.787 Z1.24
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X104.913 Y77.37 E.0504
G1 X104.321 Y77.323
G1 X106.377 Y79.379 E.07311
G1 X106.377 Y79.925
G1 X103.775 Y77.323 E.0925
G1 X103.23 Y77.323
G1 X106.377 Y80.47 E.11189
G1 X106.377 Y81.016
G1 X102.684 Y77.323 E.13129
G1 X102.139 Y77.323
G1 X106.377 Y81.561 E.15068
G1 X106.377 Y82.106
G1 X101.594 Y77.323 E.17007
G1 X101.048 Y77.323
G1 X106.303 Y82.578 E.18684
G1 X105.758 Y82.578
G1 X100.503 Y77.323 E.18684
G1 X99.957 Y77.323
G1 X105.212 Y82.578 E.18684
G1 X104.667 Y82.578
G1 X99.412 Y77.323 E.18684
G1 X98.867 Y77.323
G1 X104.528 Y82.984 E.20129
G1 X104.528 Y83.53
G1 X98.321 Y77.323 E.22068
G1 X97.776 Y77.323
G1 X104.528 Y84.075 E.24007
G1 X104.485 Y84.578
G1 X97.23 Y77.323 E.25795
G1 X96.685 Y77.323
G1 X103.94 Y84.578 E.25795
G1 X103.394 Y84.578
G1 X96.14 Y77.323 E.25795
G1 X95.594 Y77.323
G1 X102.878 Y84.607 E.25898
G1 X102.878 Y85.152
G1 X95.049 Y77.323 E.27837
G1 X94.503 Y77.323
G1 X102.878 Y85.698 E.29776
M73 P34 R4
G1 X102.878 Y86.243
G1 X93.958 Y77.323 E.31715
G1 X93.413 Y77.323
G1 X102.878 Y86.789 E.33654
G1 X102.878 Y87.334
G1 X92.867 Y77.323 E.35594
G1 X92.322 Y77.323
G1 X102.878 Y87.879 E.37533
G1 X102.878 Y88.425
G1 X91.776 Y77.323 E.39472
G1 X91.231 Y77.323
G1 X102.878 Y88.97 E.41411
G1 X102.878 Y89.516
G1 X90.685 Y77.323 E.4335
G1 X90.14 Y77.323
G1 X102.878 Y90.061 E.4529
G1 X102.878 Y90.606
G1 X89.595 Y77.323 E.47229
G1 X89.049 Y77.323
G1 X102.878 Y91.152 E.49168
G1 X102.878 Y91.697
G1 X88.504 Y77.323 E.51107
G1 X87.958 Y77.323
G1 X102.878 Y92.243 E.53046
G1 X102.878 Y92.788
G1 X87.413 Y77.323 E.54986
G1 X86.868 Y77.323
G1 X102.878 Y93.333 E.56925
G1 X102.878 Y93.879
G1 X86.322 Y77.323 E.58864
G1 X85.777 Y77.323
G1 X102.878 Y94.424 E.60803
G1 X102.878 Y94.97
G1 X85.231 Y77.323 E.62743
G1 X84.686 Y77.323
G1 X104.528 Y97.165 E.70548
; WIPE_START
M204 S6000
M73 P35 R4
G1 X103.114 Y95.751 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.377 Y99.559 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X84.141 Y77.323 E.79062
G1 X83.595 Y77.323
G1 X106.377 Y100.105 E.81001
G1 X106.377 Y100.65
G1 X83.05 Y77.323 E.8294
G1 X82.504 Y77.323
G1 X106.342 Y101.16 E.84754
G1 X106.209 Y101.574
G1 X81.959 Y77.323 E.86223
G1 X81.414 Y77.323
G1 X106.008 Y101.917 E.87446
G1 X105.747 Y102.202
G1 X80.868 Y77.323 E.88458
G1 X80.323 Y77.323
G1 X105.429 Y102.43 E.89267
G1 X105.049 Y102.595
G1 X79.777 Y77.323 E.89853
G1 X79.249 Y77.341
G1 X104.584 Y102.675 E.90076
G1 X104.04 Y102.677
G1 X78.816 Y77.453 E.89685
G1 X78.457 Y77.639
G1 X103.495 Y102.677 E.89021
G1 X102.95 Y102.677
G1 X78.16 Y77.887 E.88141
M73 P36 R4
G1 X77.918 Y78.191
G1 X102.404 Y102.677 E.8706
G1 X101.859 Y102.677
G1 X77.738 Y78.556 E.85763
G1 X77.635 Y78.998
G1 X101.313 Y102.677 E.84191
G1 X100.768 Y102.677
G1 X77.623 Y79.532 E.82292
G1 X77.623 Y80.078
G1 X84.402 Y86.856 E.24101
G1 X83.98 Y86.98
G1 X77.623 Y80.623 E.22604
G1 X77.623 Y81.168
G1 X83.683 Y87.229 E.21547
G1 X83.495 Y87.585
G1 X77.623 Y81.714 E.20877
G1 X77.623 Y82.259
G1 X83.482 Y88.118 E.20832
; WIPE_START
M204 S6000
G1 X82.068 Y86.704 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.495 Y87.949 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X100.222 Y102.677 E.52364
G1 X99.677 Y102.677
G1 X85.369 Y88.369 E.50872
G1 X85.121 Y88.667
G1 X99.132 Y102.677 E.49814
G1 X98.586 Y102.677
G1 X84.765 Y88.855 E.49143
G1 X84.231 Y88.867
G1 X98.041 Y102.677 E.49102
G1 X97.495 Y102.677
G1 X77.623 Y82.805 E.70656
G1 X77.623 Y83.35
G1 X96.95 Y102.677 E.68717
G1 X96.405 Y102.677
G1 X77.623 Y83.895 E.66778
M73 P37 R4
G1 X77.623 Y84.441
G1 X95.859 Y102.677 E.64839
G1 X95.314 Y102.677
G1 X77.623 Y84.986 E.62899
G1 X77.623 Y85.532
G1 X94.768 Y102.677 E.6096
G1 X94.223 Y102.677
G1 X77.623 Y86.077 E.59021
G1 X77.623 Y86.622
G1 X93.678 Y102.677 E.57082
M73 P37 R3
G1 X93.132 Y102.677
G1 X77.623 Y87.168 E.55143
G1 X76.641 Y86.731
G1 X92.587 Y102.677 E.56695
G1 X92.041 Y102.677
G1 X76.641 Y87.277 E.54756
G1 X76.668 Y87.849
G1 X91.496 Y102.677 E.52721
G1 X90.951 Y102.677
G1 X76.953 Y88.679 E.4977
G1 X76.972 Y89.244
G1 X90.405 Y102.677 E.47762
G1 X89.86 Y102.677
G1 X76.972 Y89.789 E.45822
G1 X76.972 Y90.335
G1 X89.314 Y102.677 E.43883
G1 X88.769 Y102.677
G1 X76.972 Y90.88 E.41944
G1 X76.937 Y91.391
G1 X88.224 Y102.677 E.40129
G1 X87.678 Y102.677
G1 X76.799 Y91.798 E.38681
G1 X76.651 Y92.195
G1 X77.348 Y92.892 E.0248
M73 P38 R3
G1 X77.023 Y93.113
G1 X76.641 Y92.731 E.01358
G1 X77.623 Y93.167
G1 X87.133 Y102.677 E.33811
G1 X86.587 Y102.677
G1 X77.623 Y93.713 E.31872
G1 X77.623 Y94.258
G1 X86.042 Y102.677 E.29933
G1 X85.497 Y102.677
G1 X77.623 Y94.804 E.27994
G1 X77.623 Y95.349
G1 X84.951 Y102.677 E.26055
G1 X84.406 Y102.677
G1 X77.623 Y95.894 E.24115
G1 X77.623 Y96.44
G1 X83.86 Y102.677 E.22176
G1 X83.315 Y102.677
G1 X77.623 Y96.985 E.20237
G1 X77.623 Y97.531
G1 X82.77 Y102.677 E.18298
G1 X82.224 Y102.677
G1 X77.623 Y98.076 E.16359
G1 X77.623 Y98.621
G1 X81.679 Y102.677 E.1442
G1 X81.133 Y102.677
G1 X77.623 Y99.167 E.1248
G1 X77.623 Y99.712
G1 X80.588 Y102.677 E.10541
G1 X80.042 Y102.677
G1 X77.623 Y100.258 E.08602
G1 X77.623 Y100.803
G1 X79.497 Y102.677 E.06661
; WIPE_START
M204 S6000
G1 X78.083 Y101.262 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.216 Y94.303 Z1.24 F42000
G1 X84.601 Y86.783 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110622
G1 F18000
M204 S6000
G1 X84.387 Y86.87 E.00115
M204 S10000
G1 X84.67 Y86.875 F42000
; LINE_WIDTH: 0.095584
G1 F18000
M204 S6000
G2 X84.479 Y86.779 I-1.649 J3.018 E.00086
; WIPE_START
G1 X84.67 Y86.875 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.164 Y88.933 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.186539
G1 F18000
M204 S6000
G1 X84.054 Y88.863 E.00129
; LINE_WIDTH: 0.15754
G1 X83.966 Y88.8 E.00087
; LINE_WIDTH: 0.109982
G1 X83.735 Y88.599 E.00151
G1 X83.594 Y88.441 E.00104
; LINE_WIDTH: 0.13559
G1 X83.53 Y88.357 E.0007
; LINE_WIDTH: 0.18082
G1 X83.417 Y88.183 E.00197
; WIPE_START
G1 X83.53 Y88.357 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.029 Y88.602 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.0974731
G1 F18000
M204 S6000
G2 X76.835 Y88.316 I-5.475 J3.509 E.00142
M204 S10000
G1 X77.022 Y88.609 F42000
; LINE_WIDTH: 0.159488
G1 F18000
M204 S6000
G1 X76.843 Y88.31 E.00285
; WIPE_START
G1 X77.022 Y88.609 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.602 Y80.999 Z1.24 F42000
G1 X77.804 Y78.353 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.100082
G1 F18000
M204 S6000
G1 X77.817 Y78.419 E.00029
G1 X77.752 Y78.515 E.00049
; WIPE_START
G1 X77.817 Y78.419 E-.47969
G1 X77.804 Y78.353 E-.28031
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.437 Y78.34 Z1.24 F42000
G1 X106.148 Y78.304 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.0975457
G1 F18000
M204 S6000
G2 X106.043 Y78.169 I-2.793 J2.076 E.0007
; LINE_WIDTH: 0.139174
G2 X105.531 Y77.657 I-3.029 J2.517 E.00496
; LINE_WIDTH: 0.0975729
G2 X105.396 Y77.552 I-2.223 J2.705 E.0007
; WIPE_START
G1 X105.531 Y77.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.99 Y82.907 Z1.24 F42000
G1 X79.141 Y102.661 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.289177
G1 F17658.081
M204 S6000
G1 X78.747 Y102.392 E.00792
; LINE_WIDTH: 0.319095
G1 F15802.861
G1 X78.677 Y102.34 E.00162
; LINE_WIDTH: 0.355055
G1 F14030.971
G3 X78.541 Y102.235 I2.086 J-2.813 E.00359
; LINE_WIDTH: 0.396728
G1 F12417.501
G3 X78.065 Y101.758 I2.335 J-2.811 E.01594
; LINE_WIDTH: 0.354985
G1 F14034.031
G3 X77.96 Y101.623 I2.704 J-2.218 E.00358
; LINE_WIDTH: 0.319115
G1 F15801.766
G1 X77.909 Y101.553 E.00162
; LINE_WIDTH: 0.289096
G1 F17663.727
G1 X77.639 Y101.159 E.00792
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F17663.727
G1 X77.909 Y101.553 E-.76
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
G3 Z1.24 I1.211 J-.125 P1  F42000
G1 X76.915 Y91.926 Z1.24
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1886
M204 S6000
G1 X76.898 Y91.951 E.00081
M73 P39 R3
G3 X74.139 Y91.115 I-1.248 J-.852 E.10364
G1 X74.139 Y88.878 E.06064
G3 X75.387 Y87.411 I1.513 J.023 E.05657
G3 X77.161 Y88.884 I.258 J1.493 E.071
G1 X77.161 Y91.123 E.06065
G3 X77.011 Y91.755 I-1.511 J-.024 E.01775
G1 X76.944 Y91.874 E.00369
M204 S250
G1 X76.567 Y91.725 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1886
M204 S5000
G3 X74.54 Y91.105 I-.917 J-.626 E.07079
G1 X74.54 Y88.892 E.05564
G3 X75.457 Y87.806 I1.14 J.032 E.03859
G3 X76.76 Y88.895 I.19 J1.097 E.04854
G1 X76.76 Y91.108 E.05564
G3 X76.599 Y91.674 I-1.11 J-.009 E.01499
M204 S10000
G1 X77.506 Y92.021 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1886
M204 S6000
G1 X77.389 Y92.362 E.00978
G1 X77.389 Y92.637 E.00744
G3 X76.641 Y93.138 I-5.461 J-7.343 E.02443
G3 X73.811 Y91.492 I-.939 J-1.642 E.10722
G1 X73.811 Y88.508 E.08087
G3 X75.84 Y86.616 I1.891 J-.006 E.0844
G3 X76.721 Y86.911 I-.166 J1.962 E.02542
G1 X77.389 Y87.363 E.02186
G1 X77.389 Y87.638 E.00744
G3 X77.589 Y88.507 I-2.016 J.922 E.02433
G1 X77.587 Y91.591 E.08357
G3 X77.543 Y91.914 I-2.049 J-.114 E.00884
G1 X77.526 Y91.964 E.00144
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.362 E-.15994
G1 X77.389 Y92.637 E-.10429
G1 X76.641 Y93.138 E-.34247
G1 X76.387 Y93.26 E-.107
G1 X76.271 Y93.299 E-.0463
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.107 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1886
M204 S5000
G3 X76.205 Y93.734 I-2.16 J-2.68 E.03437
G3 X73.41 Y91.497 I-.5 J-2.24 E.10322
G1 X73.41 Y88.503 E.07529
G3 X76.938 Y86.573 I2.291 J0 E.12334
G1 X77.41 Y86.893 E.01434
G1 X77.41 Y79.203 E.19335
G3 X79.503 Y77.11 I2.096 J.003 E.08262
G1 X104.599 Y77.112 E.63096
G3 X106.59 Y79.203 I-.101 J2.089 E.08009
G1 X106.59 Y82.79 E.09019
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.1105
G2 X105.305 Y77.49 I-.915 J.01 E.03564
G1 X78.695 Y77.49 E.66901
G2 X77.79 Y78.394 I.007 J.912 E.03565
G1 X77.79 Y87.561 E.23045
M73 P40 R3
G3 X77.99 Y88.502 I-2.384 J.998 E.02435
G1 X77.988 Y91.605 E.078
G3 X77.79 Y92.439 I-2.357 J-.117 E.02168
G1 X77.791 Y101.645 E.23143
G2 X78.692 Y102.51 I.912 J-.047 E.03461
G1 X105.308 Y102.51 E.66914
G2 X106.21 Y101.605 I-.01 J-.912 E.0356
G1 X106.21 Y97.21 E.1105
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.096 J-.003 E.08261
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I.003 J-2.096 E.08261
G1 X77.41 Y93.167 E.19184
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.938 Y93.427 E-.20481
M73 P41 R3
G1 X76.74 Y93.54 E-.08668
G1 X76.532 Y93.633 E-.08658
G1 X76.205 Y93.734 E-.12992
G1 X75.753 Y93.789 E-.17312
G1 X75.546 Y93.779 E-.07889
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

G1 X75.075 Y92.887
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.332582
G1 F1886
M204 S6000
G1 X74.96 Y92.838 E.00244
G3 X74.796 Y92.75 I2.767 J-5.343 E.00361
; LINE_WIDTH: 0.293632
G3 X74.61 Y92.616 I1.434 J-2.192 E.00388
; LINE_WIDTH: 0.260836
G1 X74.495 Y92.513 E.00227
; LINE_WIDTH: 0.231149
G1 X74.383 Y92.392 E.00211
; LINE_WIDTH: 0.19686
G3 X74.276 Y92.248 I1.209 J-1.012 E.0019
; LINE_WIDTH: 0.158914
G3 X74.185 Y92.096 I1.464 J-.976 E.00144
; LINE_WIDTH: 0.119834
G3 X74.111 Y91.936 I1.911 J-.983 E.00098
; LINE_WIDTH: 0.0928784
G1 X74.082 Y91.858 E.00032
M204 S10000
G1 X75.075 Y92.887 F42000
; LINE_WIDTH: 0.380157
G1 F1886
M204 S6000
G2 X75.688 Y92.999 I.602 J-1.557 E.01414
G1 X75.735 Y92.999 E.00104
G2 X77.002 Y92.431 I-.183 J-2.108 E.03189
G1 X77.021 Y92.388 E.00106
; LINE_WIDTH: 0.331191
G1 X77.045 Y92.322 E.00136
; LINE_WIDTH: 0.280017
G3 X77.107 Y92.204 I.653 J.27 E.00215
; LINE_WIDTH: 0.245451
G1 X77.149 Y92.131 E.00116
; LINE_WIDTH: 0.220443
G1 X77.214 Y91.998 E.00179
; LINE_WIDTH: 0.191817
G1 X77.266 Y91.872 E.0014
; LINE_WIDTH: 0.153417
G2 X77.329 Y91.646 I-2.63 J-.85 E.00182
; LINE_WIDTH: 0.106178
G2 X77.355 Y91.448 I-1.367 J-.284 E.00093
M204 S10000
G1 X77.358 Y88.552 F42000
; LINE_WIDTH: 0.106532
G1 F1886
M204 S6000
G2 X77.328 Y88.353 I-2.064 J.208 E.00094
; LINE_WIDTH: 0.143794
G2 X77.29 Y88.205 I-3.169 J.734 E.00109
; LINE_WIDTH: 0.182531
G2 X77.218 Y88.008 I-2.272 J.721 E.00202
; LINE_WIDTH: 0.220824
G2 X77.151 Y87.871 I-3.357 J1.559 E.00186
; LINE_WIDTH: 0.258037
G1 X77.066 Y87.72 E.00253
; LINE_WIDTH: 0.296551
G3 X76.843 Y87.244 I3.637 J-1.99 E.00899
M204 S10000
G1 X77.209 Y87.746 F42000
; LINE_WIDTH: 0.382118
G1 F1886
M204 S6000
G2 X76.101 Y87.055 I-2.018 J2.003 E.02986
G1 X75.971 Y87.026 E.00301
G2 X75.127 Y87.094 I-.294 J1.619 E.01942
; LINE_WIDTH: 0.336572
G1 X75.042 Y87.125 E.00179
G2 X74.797 Y87.249 I1.188 J2.647 E.0054
; LINE_WIDTH: 0.293502
G2 X74.61 Y87.384 I1.553 J2.362 E.00391
; LINE_WIDTH: 0.255925
G2 X74.45 Y87.533 I1.342 J1.595 E.00315
; LINE_WIDTH: 0.215013
G2 X74.32 Y87.688 I1.921 J1.744 E.00239
; LINE_WIDTH: 0.172632
G2 X74.203 Y87.871 I2.537 J1.758 E.00196
; LINE_WIDTH: 0.128586
G1 X74.184 Y87.905 E.00024
G2 X74.124 Y88.035 I2.227 J1.093 E.00088
; LINE_WIDTH: 0.098804
G1 X74.082 Y88.137 E.00046
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X74.124 Y88.035 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/30
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.4 I-.989 J.709 P1  F42000
G1 X76.915 Y91.926 Z1.4
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1898
M204 S6000
G1 X76.898 Y91.951 E.00081
G3 X74.139 Y91.115 I-1.248 J-.852 E.10363
G1 X74.139 Y88.877 E.06065
G3 X75.388 Y87.411 I1.51 J.021 E.05658
G3 X77.161 Y88.884 I.258 J1.493 E.071
G1 X77.161 Y91.123 E.06066
G3 X77.011 Y91.755 I-1.511 J-.024 E.01774
G1 X76.944 Y91.874 E.00369
M204 S250
G1 X76.567 Y91.725 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1898
M204 S5000
G3 X74.54 Y91.105 I-.917 J-.626 E.07078
G1 X74.54 Y88.892 E.05565
G3 X75.457 Y87.806 I1.14 J.032 E.03858
G3 X76.76 Y88.895 I.19 J1.097 E.04854
G1 X76.76 Y91.108 E.05565
G3 X76.599 Y91.675 I-1.11 J-.009 E.01498
M204 S10000
G1 X77.507 Y92.021 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1898
M204 S6000
G1 X77.389 Y92.362 E.00979
G1 X77.389 Y92.637 E.00743
G3 X76.641 Y93.138 I-5.472 J-7.359 E.02442
G3 X73.811 Y91.492 I-.939 J-1.642 E.10724
G1 X73.811 Y88.508 E.08087
G3 X75.841 Y86.616 I1.891 J-.006 E.08442
G3 X76.722 Y86.911 I-.166 J1.961 E.02541
G1 X77.389 Y87.363 E.02185
G1 X77.389 Y87.638 E.00743
G3 X77.589 Y88.507 I-2.014 J.921 E.02434
G1 X77.587 Y91.592 E.08359
G3 X77.542 Y91.916 I-2.052 J-.115 E.00889
G1 X77.526 Y91.964 E.00137
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.362 E-.16007
G1 X77.389 Y92.637 E-.10423
G1 X76.641 Y93.138 E-.34238
G1 X76.387 Y93.26 E-.10715
G1 X76.271 Y93.298 E-.04616
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.107 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1898
M204 S5000
G3 X76.205 Y93.733 I-2.16 J-2.681 E.03437
G3 X73.41 Y91.497 I-.501 J-2.24 E.10323
G1 X73.41 Y88.503 E.07529
G3 X76.938 Y86.574 I2.291 J0 E.12334
G1 X77.41 Y86.893 E.01433
G1 X77.41 Y79.203 E.19335
G3 X79.503 Y77.11 I2.096 J.003 E.08261
G1 X104.595 Y77.112 E.63085
G3 X106.59 Y79.203 I-.097 J2.089 E.0802
G1 X106.59 Y82.79 E.09019
M73 P42 R3
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.11051
G2 X105.305 Y77.49 I-.915 J.01 E.03563
G1 X78.693 Y77.49 E.66907
G2 X77.79 Y78.395 I.01 J.912 E.03559
G1 X77.79 Y87.561 E.23044
G3 X77.99 Y88.503 I-2.379 J.997 E.02435
G1 X77.987 Y91.606 E.07802
G3 X77.79 Y92.439 I-2.36 J-.118 E.02166
G1 X77.791 Y101.645 E.23143
G2 X78.695 Y102.51 I.912 J-.048 E.03467
G1 X105.308 Y102.51 E.66907
G2 X106.21 Y101.605 I-.012 J-.915 E.03556
G1 X106.21 Y97.21 E.11051
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.096 J-.003 E.08261
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I.003 J-2.096 E.08262
G1 X77.41 Y93.167 E.19184
; WIPE_START
M73 P43 R3
G1 F11668.197
M204 S6000
G1 X76.938 Y93.426 E-.20468
G1 X76.74 Y93.54 E-.08674
G1 X76.532 Y93.633 E-.08664
G1 X76.205 Y93.733 E-.12987
G1 X75.981 Y93.773 E-.08666
G1 X75.639 Y93.789 E-.12988
G1 X75.547 Y93.777 E-.03553
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

G1 X75.076 Y92.887
G1 Z1.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.380166
G1 F1898
M204 S6000
G2 X75.698 Y92.999 I.604 J-1.566 E.01435
G2 X77.002 Y92.431 I-.122 J-2.06 E.03273
G1 X77.021 Y92.388 E.00106
; LINE_WIDTH: 0.331252
G1 X77.045 Y92.322 E.00136
; LINE_WIDTH: 0.295508
G1 X77.066 Y92.276 E.00086
; LINE_WIDTH: 0.258812
G1 X77.15 Y92.132 E.00245
; LINE_WIDTH: 0.227288
G1 X77.187 Y92.056 E.00107
; LINE_WIDTH: 0.199249
G2 X77.262 Y91.882 I-2.591 J-1.22 E.00203
G1 X77.266 Y91.872 E.00011
; LINE_WIDTH: 0.153486
G2 X77.329 Y91.647 I-2.694 J-.867 E.00182
; LINE_WIDTH: 0.106233
G2 X77.355 Y91.449 I-1.35 J-.282 E.00094
; WIPE_START
G1 F18000
G1 X77.329 Y91.647 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.076 Y92.887 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.332593
G1 F1898
M204 S6000
G1 X74.96 Y92.838 E.00245
G3 X74.796 Y92.75 I2.402 J-4.658 E.00362
; LINE_WIDTH: 0.286767
G3 X74.549 Y92.564 I.913 J-1.469 E.00509
; LINE_WIDTH: 0.238299
G1 X74.383 Y92.392 E.00318
; LINE_WIDTH: 0.196856
G3 X74.276 Y92.248 I1.203 J-1.008 E.0019
; LINE_WIDTH: 0.158899
G3 X74.185 Y92.096 I1.452 J-.968 E.00144
; LINE_WIDTH: 0.119826
G3 X74.111 Y91.936 I1.86 J-.96 E.00098
; LINE_WIDTH: 0.0929421
G1 X74.082 Y91.858 E.00032
M204 S10000
G1 X74.081 Y88.148 F42000
; LINE_WIDTH: 0.107792
G1 F1898
M204 S6000
G3 X74.141 Y87.993 I2.408 J.849 E.0008
G1 X74.168 Y87.939 E.00029
; LINE_WIDTH: 0.155288
G3 X74.234 Y87.818 I1.743 J.877 E.00108
G1 X74.277 Y87.752 E.00062
; LINE_WIDTH: 0.198307
G3 X74.381 Y87.609 I2.483 J1.702 E.0019
; LINE_WIDTH: 0.241205
G3 X74.572 Y87.415 I2.961 J2.723 E.00367
; LINE_WIDTH: 0.289783
G3 X74.793 Y87.251 I2.814 J3.565 E.00458
; LINE_WIDTH: 0.336003
G3 X75.042 Y87.125 I1.54 J2.734 E.00548
G1 X75.124 Y87.095 E.00172
; LINE_WIDTH: 0.382077
G3 X75.971 Y87.026 I.553 J1.549 E.01948
G1 X76.101 Y87.055 E.00302
G3 X77.209 Y87.746 I-.91 J2.693 E.02986
M204 S10000
G1 X76.843 Y87.244 F42000
; LINE_WIDTH: 0.296641
G1 F1898
M204 S6000
G2 X77.066 Y87.72 I3.835 J-1.503 E.00899
; LINE_WIDTH: 0.258086
G1 X77.151 Y87.871 E.00253
; LINE_WIDTH: 0.217244
G3 X77.23 Y88.035 I-2.694 J1.393 E.00217
; LINE_WIDTH: 0.179304
G3 X77.291 Y88.205 I-1.674 J.7 E.00171
; LINE_WIDTH: 0.14094
G3 X77.333 Y88.379 I-2.413 J.677 E.00124
; LINE_WIDTH: 0.103828
G3 X77.358 Y88.552 I-2.391 J.433 E.00079
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X77.333 Y88.379 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/30
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.56 I-1.209 J-.143 P1  F42000
G1 X76.915 Y91.926 Z1.56
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1897
M204 S6000
G1 X76.895 Y91.949 E.00081
G3 X74.139 Y91.115 I-1.245 J-.856 E.10335
G1 X74.139 Y88.877 E.06065
G3 X75.395 Y87.41 I1.511 J.022 E.05677
G3 X77.161 Y88.884 I.251 J1.493 E.07079
G1 X77.161 Y91.123 E.06066
G3 X77.008 Y91.754 I-1.511 J-.03 E.01773
G1 X76.943 Y91.873 E.00368
M204 S250
G1 X76.565 Y91.724 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1897
M204 S5000
G3 X74.54 Y91.105 I-.915 J-.629 E.07059
G1 X74.54 Y88.892 E.05565
G3 X75.46 Y87.806 I1.11 J.008 E.03884
G3 X76.76 Y88.895 I.188 J1.097 E.04848
G1 X76.76 Y91.108 E.05565
G3 X76.597 Y91.673 I-1.11 J-.013 E.01497
M204 S10000
G1 X77.516 Y92.016 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1897
M204 S6000
G1 X77.389 Y92.363 E.01
G1 X77.389 Y92.637 E.00743
G3 X76.641 Y93.138 I-5.496 J-7.395 E.02442
G3 X73.811 Y91.492 I-.939 J-1.642 E.10724
G1 X73.811 Y88.508 E.08087
G3 X75.841 Y86.616 I1.89 J-.006 E.08443
G3 X76.722 Y86.911 I-.167 J1.962 E.0254
G1 X77.389 Y87.363 E.02185
G1 X77.389 Y87.637 E.00743
G3 X77.589 Y88.507 I-2.011 J.92 E.02435
G1 X77.587 Y91.592 E.08359
G3 X77.532 Y91.958 I-2.084 J-.123 E.01005
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.363 E-.16298
G1 X77.389 Y92.637 E-.10422
G1 X76.641 Y93.138 E-.34234
G1 X76.473 Y93.224 E-.07144
G1 X76.278 Y93.294 E-.07902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.107 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1897
M204 S5000
G3 X76.205 Y93.733 I-2.161 J-2.682 E.03436
G3 X73.41 Y91.497 I-.501 J-2.239 E.10323
G1 X73.41 Y88.503 E.07529
G3 X76.938 Y86.574 I2.291 J0 E.12334
G1 X77.41 Y86.893 E.01433
G1 X77.41 Y79.203 E.19335
G3 X79.503 Y77.11 I2.096 J.003 E.08262
G1 X104.593 Y77.112 E.63081
M73 P44 R3
G3 X106.59 Y79.203 I-.094 J2.089 E.08024
G1 X106.59 Y82.79 E.09019
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.1105
G2 X105.305 Y77.49 I-.915 J.01 E.03564
G1 X78.695 Y77.49 E.66901
G2 X77.79 Y78.395 I.007 J.912 E.03567
G1 X77.79 Y87.561 E.23043
G3 X77.99 Y88.503 I-2.374 J.996 E.02436
G1 X77.987 Y91.606 E.07802
G3 X77.79 Y92.44 I-2.37 J-.121 E.02166
G1 X77.791 Y101.645 E.23144
G2 X78.695 Y102.51 I.911 J-.048 E.03467
G1 X105.308 Y102.51 E.66907
G2 X106.21 Y101.605 I-.01 J-.912 E.0356
G1 X106.21 Y97.21 E.1105
M73 P45 R3
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.096 J-.003 E.08262
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I.003 J-2.096 E.08262
G1 X77.41 Y93.167 E.19184
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.938 Y93.426 E-.20461
G1 X76.741 Y93.54 E-.08662
G1 X76.425 Y93.672 E-.13005
G1 X76.205 Y93.733 E-.08664
G1 X75.867 Y93.784 E-.12993
G1 X75.639 Y93.789 E-.08656
G1 X75.547 Y93.777 E-.03559
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

G1 X75.076 Y92.887
G1 Z1.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.380121
G1 F1897
M204 S6000
G2 X75.698 Y92.999 I.603 J-1.566 E.01434
G2 X77.002 Y92.431 I-.137 J-2.094 E.0327
G1 X77.021 Y92.388 E.00106
; LINE_WIDTH: 0.331267
G1 X77.045 Y92.323 E.00135
; LINE_WIDTH: 0.295621
G1 X77.066 Y92.276 E.00086
; LINE_WIDTH: 0.258869
G1 X77.15 Y92.132 E.00245
; LINE_WIDTH: 0.227223
G1 X77.188 Y92.055 E.00107
; LINE_WIDTH: 0.199538
G2 X77.262 Y91.883 I-2.539 J-1.201 E.00202
G1 X77.266 Y91.873 E.00011
; LINE_WIDTH: 0.153473
G2 X77.328 Y91.648 I-5.365 J-1.603 E.00181
; LINE_WIDTH: 0.106361
G2 X77.355 Y91.449 I-1.336 J-.282 E.00094
; WIPE_START
G1 F18000
G1 X77.328 Y91.648 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.076 Y92.887 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.33263
G1 F1897
M204 S6000
G1 X74.96 Y92.838 E.00245
G3 X74.796 Y92.75 I2.778 J-5.365 E.00361
; LINE_WIDTH: 0.293628
G3 X74.61 Y92.616 I1.433 J-2.191 E.00389
; LINE_WIDTH: 0.260972
G1 X74.496 Y92.514 E.00226
; LINE_WIDTH: 0.231251
G1 X74.383 Y92.392 E.00213
; LINE_WIDTH: 0.196826
G3 X74.276 Y92.248 I1.22 J-1.02 E.0019
; LINE_WIDTH: 0.158851
G3 X74.185 Y92.096 I1.45 J-.967 E.00144
; LINE_WIDTH: 0.119813
G3 X74.111 Y91.936 I1.875 J-.968 E.00098
; LINE_WIDTH: 0.0929261
G1 X74.082 Y91.858 E.00032
M204 S10000
G1 X74.082 Y88.137 F42000
; LINE_WIDTH: 0.0979652
G1 F1897
M204 S6000
G1 X74.121 Y88.042 E.00043
; LINE_WIDTH: 0.12783
G3 X74.184 Y87.905 I2.324 J.973 E.00092
G1 X74.203 Y87.87 E.00024
; LINE_WIDTH: 0.174794
G3 X74.326 Y87.68 I2.787 J1.66 E.00208
G1 X74.333 Y87.67 E.00011
; LINE_WIDTH: 0.224407
G3 X74.495 Y87.486 I2.621 J2.146 E.00304
; LINE_WIDTH: 0.261023
G1 X74.61 Y87.385 E.00226
; LINE_WIDTH: 0.294065
G1 X74.798 Y87.25 E.00391
; LINE_WIDTH: 0.33353
G3 X75.071 Y87.115 I.807 J1.285 E.00595
; LINE_WIDTH: 0.381301
G3 X75.971 Y87.026 I.608 J1.566 E.02072
G1 X76.101 Y87.055 E.00302
G3 X77.209 Y87.746 I-.91 J2.692 E.02979
M204 S10000
G1 X76.842 Y87.244 F42000
; LINE_WIDTH: 0.296622
G1 F1897
M204 S6000
G2 X77.066 Y87.72 I3.749 J-1.467 E.00901
; LINE_WIDTH: 0.258055
G1 X77.151 Y87.871 E.00252
; LINE_WIDTH: 0.217228
G3 X77.23 Y88.035 I-2.683 J1.387 E.00218
; LINE_WIDTH: 0.179361
G3 X77.291 Y88.205 I-1.69 J.707 E.0017
; LINE_WIDTH: 0.141007
G3 X77.333 Y88.378 I-2.43 J.681 E.00124
; LINE_WIDTH: 0.103866
G3 X77.358 Y88.552 I-2.37 J.431 E.00079
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X77.333 Y88.378 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/30
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.72 I-1.209 J-.143 P1  F42000
G1 X76.915 Y91.926 Z1.72
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1897
M204 S6000
G1 X76.898 Y91.951 E.00081
G3 X74.139 Y91.115 I-1.248 J-.852 E.10364
G1 X74.139 Y88.878 E.06064
G3 X75.387 Y87.411 I1.515 J.025 E.05655
G3 X77.161 Y88.884 I.258 J1.493 E.071
G1 X77.161 Y91.123 E.06065
G3 X77.011 Y91.755 I-1.511 J-.024 E.01776
G1 X76.944 Y91.874 E.00368
M204 S250
G1 X76.567 Y91.725 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1897
M204 S5000
G3 X74.54 Y91.105 I-.917 J-.626 E.07079
G1 X74.54 Y88.892 E.05564
G3 X75.457 Y87.806 I1.112 J.008 E.03878
G3 X76.76 Y88.895 I.19 J1.097 E.04854
G1 X76.76 Y91.108 E.05564
G3 X76.599 Y91.674 I-1.11 J-.009 E.01499
M204 S10000
G1 X77.516 Y92.016 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1897
M204 S6000
G1 X77.389 Y92.363 E.00999
G1 X77.389 Y92.637 E.00743
G3 X76.644 Y93.136 I-5.487 J-7.384 E.02432
G3 X73.811 Y91.492 I-.942 J-1.641 E.10732
G1 X73.811 Y88.508 E.08087
G3 X75.838 Y86.616 I1.891 J-.006 E.08435
G3 X76.722 Y86.911 I-.163 J1.959 E.02549
G1 X77.389 Y87.363 E.02184
M73 P46 R3
G1 X77.389 Y87.637 E.00743
G3 X77.589 Y88.507 I-2.008 J.92 E.02435
G1 X77.587 Y91.592 E.0836
G3 X77.532 Y91.959 I-2.085 J-.124 E.01005
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.363 E-.16285
G1 X77.389 Y92.637 E-.1042
G1 X76.644 Y93.136 E-.34095
G1 X76.474 Y93.223 E-.07256
G1 X76.277 Y93.294 E-.07944
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.107 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1897
M204 S5000
G3 X76.207 Y93.733 I-2.162 J-2.685 E.03433
G3 X73.41 Y91.497 I-.5 J-2.242 E.10322
G1 X73.41 Y88.503 E.07529
G3 X76.938 Y86.574 I2.291 J-.002 E.12338
G1 X77.41 Y86.893 E.01432
G1 X77.41 Y79.203 E.19334
G3 X79.503 Y77.11 I2.098 J.005 E.0826
G1 X104.589 Y77.112 E.6307
G3 X106.59 Y79.203 I-.09 J2.089 E.08035
G1 X106.59 Y82.79 E.09019
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.1105
G2 X105.305 Y77.49 I-.915 J.01 E.03563
G1 X78.695 Y77.49 E.66901
G2 X77.79 Y78.395 I.007 J.912 E.03567
G1 X77.79 Y87.56 E.23043
G3 X77.99 Y88.503 I-2.37 J.995 E.02436
G1 X77.987 Y91.606 E.07803
G3 X77.79 Y92.44 I-2.371 J-.122 E.02165
G1 X77.791 Y101.645 E.23143
G2 X78.695 Y102.51 I.911 J-.048 E.03467
G1 X105.308 Y102.51 E.66907
M73 P47 R3
G2 X106.21 Y101.605 I-.012 J-.915 E.03557
G1 X106.21 Y97.21 E.1105
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.096 J-.003 E.08262
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I.003 J-2.096 E.08262
G1 X77.41 Y93.167 E.19184
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.938 Y93.426 E-.20452
G1 X76.709 Y93.555 E-.09989
G1 X76.534 Y93.633 E-.07303
G1 X76.207 Y93.733 E-.12997
G1 X75.981 Y93.773 E-.087
G1 X75.719 Y93.789 E-.09993
G1 X75.546 Y93.779 E-.06567
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

G1 X75.071 Y92.885
G1 Z1.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.380142
G1 F1897
M204 S6000
G2 X75.5 Y92.99 I.637 J-1.68 E.00997
G1 X75.66 Y92.999 E.00363
G2 X77.002 Y92.431 I-.09 J-2.08 E.03355
G1 X77.021 Y92.388 E.00106
; LINE_WIDTH: 0.331334
G1 X77.045 Y92.323 E.00135
; LINE_WIDTH: 0.295749
G1 X77.066 Y92.277 E.00086
; LINE_WIDTH: 0.258927
G1 X77.15 Y92.132 E.00246
; LINE_WIDTH: 0.227154
G1 X77.188 Y92.054 E.00108
; LINE_WIDTH: 0.199435
G2 X77.262 Y91.882 I-2.532 J-1.196 E.00202
G1 X77.266 Y91.872 E.00011
; LINE_WIDTH: 0.153594
G2 X77.328 Y91.649 I-5.09 J-1.528 E.00181
; LINE_WIDTH: 0.106462
G2 X77.355 Y91.449 I-1.33 J-.282 E.00095
; WIPE_START
G1 F18000
G1 X77.328 Y91.649 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.071 Y92.885 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.332829
G1 F1897
M204 S6000
G1 X74.96 Y92.838 E.00235
G3 X74.796 Y92.75 I2.169 J-4.228 E.00361
; LINE_WIDTH: 0.293527
G3 X74.61 Y92.616 I1.511 J-2.299 E.00388
; LINE_WIDTH: 0.261068
G1 X74.496 Y92.515 E.00225
; LINE_WIDTH: 0.224588
G1 X74.34 Y92.336 E.00295
; LINE_WIDTH: 0.189145
G1 X74.272 Y92.243 E.00116
; LINE_WIDTH: 0.154571
G3 X74.168 Y92.062 I1.364 J-.907 E.00164
; LINE_WIDTH: 0.107561
G1 X74.082 Y91.858 E.00106
M204 S10000
G1 X74.082 Y88.137 F42000
; LINE_WIDTH: 0.11318
G1 F1897
M204 S6000
G3 X74.184 Y87.905 I2.568 J.985 E.0013
; LINE_WIDTH: 0.162631
G3 X74.292 Y87.729 I1.572 J.843 E.00173
; LINE_WIDTH: 0.199569
G1 X74.387 Y87.605 E.00168
; LINE_WIDTH: 0.232777
G1 X74.496 Y87.485 E.0021
; LINE_WIDTH: 0.261205
G1 X74.611 Y87.384 E.00227
; LINE_WIDTH: 0.294382
G3 X74.708 Y87.309 I1.046 J1.25 E.00208
G1 X74.799 Y87.249 E.00184
; LINE_WIDTH: 0.33245
G3 X75.054 Y87.12 I.95 J1.565 E.00556
G1 X75.073 Y87.113 E.00038
; LINE_WIDTH: 0.381311
G3 X75.971 Y87.026 I.604 J1.556 E.02067
G1 X76.104 Y87.056 E.00308
G3 X77.209 Y87.746 I-.915 J2.695 E.02973
M204 S10000
G1 X76.843 Y87.244 F42000
; LINE_WIDTH: 0.296772
G1 F1897
M204 S6000
G2 X77.066 Y87.72 I3.769 J-1.475 E.009
; LINE_WIDTH: 0.258153
G1 X77.151 Y87.871 E.00252
; LINE_WIDTH: 0.21725
G3 X77.229 Y88.035 I-2.708 J1.399 E.00218
; LINE_WIDTH: 0.179407
G3 X77.291 Y88.205 I-1.729 J.721 E.00171
; LINE_WIDTH: 0.140917
G3 X77.333 Y88.379 I-2.429 J.68 E.00124
; LINE_WIDTH: 0.10381
G3 X77.358 Y88.552 I-2.361 J.429 E.00079
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X77.333 Y88.379 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/30
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.88 I-1.209 J-.143 P1  F42000
G1 X76.915 Y91.926 Z1.88
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1902
M204 S6000
G1 X76.895 Y91.949 E.00081
G3 X74.139 Y91.115 I-1.245 J-.856 E.10336
G1 X74.139 Y88.877 E.06065
G3 X75.388 Y87.411 I1.513 J.023 E.05656
G3 X77.161 Y88.884 I.258 J1.493 E.071
G1 X77.161 Y91.123 E.06066
G3 X77.008 Y91.754 I-1.511 J-.03 E.01774
M73 P48 R3
G1 X76.943 Y91.873 E.00367
M204 S250
G1 X76.565 Y91.724 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1902
M204 S5000
G3 X74.54 Y91.105 I-.915 J-.629 E.07059
G1 X74.54 Y88.892 E.05565
G3 X75.457 Y87.806 I1.14 J.033 E.03858
G3 X76.76 Y88.895 I.19 J1.097 E.04854
G1 X76.76 Y91.108 E.05565
G3 X76.597 Y91.673 I-1.11 J-.013 E.01496
M204 S10000
G1 X77.508 Y92.017 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1902
M204 S6000
G1 X77.389 Y92.363 E.00991
G1 X77.389 Y92.635 E.00737
G3 X76.645 Y93.136 I-5.287 J-7.05 E.02434
G3 X73.811 Y91.492 I-.94 J-1.644 E.10725
G1 X73.811 Y88.508 E.08087
G3 X75.838 Y86.616 I1.895 J-.002 E.0843
G3 X76.721 Y86.911 I-.163 J1.959 E.02547
G1 X77.389 Y87.365 E.02189
G1 X77.389 Y87.637 E.00737
G3 X77.589 Y88.507 I-2.004 J.919 E.02434
G1 X77.589 Y91.493 E.08093
G3 X77.539 Y91.915 I-2.203 J-.049 E.01154
G1 X77.526 Y91.959 E.00125
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.363 E-.16178
G1 X77.389 Y92.635 E-.1033
G1 X76.645 Y93.136 E-.34118
G1 X76.385 Y93.26 E-.10948
G1 X76.273 Y93.294 E-.04425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.105 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1902
M204 S5000
G3 X76.205 Y93.733 I-2.145 J-2.645 E.0344
G3 X73.41 Y91.497 I-.494 J-2.247 E.10311
G1 X73.41 Y88.503 E.07529
G3 X76.938 Y86.574 I2.294 J.004 E.12325
G1 X77.41 Y86.895 E.01434
G1 X77.41 Y79.203 E.19338
G3 X79.503 Y77.11 I2.092 J-.001 E.08266
G1 X104.585 Y77.112 E.63059
G3 X106.59 Y79.203 I-.098 J2.101 E.08034
G1 X106.59 Y82.79 E.09019
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.11051
G2 X105.305 Y77.49 I-.915 J.01 E.03563
G1 X78.695 Y77.49 E.66901
G2 X77.79 Y78.392 I.007 J.912 E.03559
G1 X77.79 Y87.56 E.2305
M73 P49 R3
G3 X77.99 Y88.502 I-2.364 J.994 E.02435
G1 X77.99 Y91.498 E.07531
G3 X77.79 Y92.44 I-2.565 J-.053 E.02435
G1 X77.791 Y101.645 E.23143
G2 X78.695 Y102.51 I.912 J-.048 E.03467
G1 X105.308 Y102.51 E.66907
G2 X106.21 Y101.605 I-.012 J-.915 E.03556
G1 X106.21 Y97.21 E.11051
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.096 J-.003 E.08262
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I.003 J-2.096 E.08262
G1 X77.41 Y93.165 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.938 Y93.426 E-.20483
G1 X76.709 Y93.555 E-.10011
G1 X76.532 Y93.633 E-.07342
G1 X76.205 Y93.733 E-.12994
G1 X75.718 Y93.789 E-.18624
G1 X75.547 Y93.773 E-.06547
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

G1 X75.125 Y92.906
G1 Z1.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.38083
G1 F1902
M204 S6000
G2 X76.157 Y92.928 I.55 J-1.576 E.02369
G2 X77.205 Y92.265 I-1.05 J-2.817 E.02822
M204 S10000
G1 X76.892 Y92.722 F42000
; LINE_WIDTH: 0.337715
G1 F1902
M204 S6000
G1 X77.033 Y92.355 E.00778
; LINE_WIDTH: 0.305192
G3 X77.066 Y92.277 I.435 J.134 E.00149
; LINE_WIDTH: 0.258957
G1 X77.15 Y92.132 E.00246
; LINE_WIDTH: 0.227138
G1 X77.188 Y92.054 E.00108
; LINE_WIDTH: 0.199383
G2 X77.262 Y91.883 I-2.5 J-1.181 E.00201
G1 X77.266 Y91.873 E.00011
; LINE_WIDTH: 0.153717
G2 X77.328 Y91.649 I-4.849 J-1.463 E.0018
; LINE_WIDTH: 0.106118
G2 X77.358 Y91.438 I-1.625 J-.336 E.001
; WIPE_START
G1 F18000
G1 X77.328 Y91.649 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.125 Y92.906 Z2.04 F42000
M73 P50 R3
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.335249
G1 F1902
M204 S6000
G3 X74.79 Y92.746 I.61 J-1.711 E.00729
; LINE_WIDTH: 0.29715
G3 X74.645 Y92.645 I1.765 J-2.678 E.00303
; LINE_WIDTH: 0.265155
G3 X74.497 Y92.515 I1.233 J-1.564 E.00297
; LINE_WIDTH: 0.223561
G3 X74.334 Y92.329 I1.415 J-1.399 E.00305
; LINE_WIDTH: 0.188804
G1 X74.276 Y92.248 E.00101
; LINE_WIDTH: 0.154865
G3 X74.168 Y92.062 I1.313 J-.886 E.00169
; LINE_WIDTH: 0.107543
G1 X74.082 Y91.858 E.00106
M204 S10000
G1 X74.083 Y88.135 F42000
; LINE_WIDTH: 0.114576
G1 F1902
M204 S6000
G3 X74.184 Y87.905 I2.581 J.997 E.00131
G1 X74.188 Y87.899 E.00004
; LINE_WIDTH: 0.163607
G3 X74.293 Y87.728 I2.579 J1.47 E.00169
; LINE_WIDTH: 0.205996
G1 X74.424 Y87.561 E.00238
; LINE_WIDTH: 0.245036
G3 X74.55 Y87.436 I1.187 J1.068 E.00244
; LINE_WIDTH: 0.287243
G3 X74.8 Y87.248 I1.11 J1.209 E.00517
; LINE_WIDTH: 0.333422
G3 X75.041 Y87.125 I1.115 J1.904 E.00528
G1 X75.076 Y87.112 E.00073
; LINE_WIDTH: 0.380971
G3 X75.971 Y87.026 I.601 J1.561 E.02057
G1 X76.104 Y87.056 E.00307
G3 X77.21 Y87.748 I-.912 J2.687 E.02975
M204 S10000
G1 X76.843 Y87.245 F42000
; LINE_WIDTH: 0.296793
G1 F1902
M204 S6000
G2 X77.066 Y87.72 I3.728 J-1.455 E.00898
; LINE_WIDTH: 0.258163
G1 X77.151 Y87.871 E.00252
; LINE_WIDTH: 0.217214
G3 X77.229 Y88.035 I-2.672 J1.381 E.00217
; LINE_WIDTH: 0.179437
G3 X77.291 Y88.205 I-1.747 J.729 E.00171
; LINE_WIDTH: 0.140932
G3 X77.333 Y88.379 I-2.428 J.679 E.00124
; LINE_WIDTH: 0.103849
G3 X77.358 Y88.552 I-2.351 J.428 E.00079
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X77.333 Y88.379 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/30
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.04 I-1.209 J-.143 P1  F42000
G1 X76.915 Y91.926 Z2.04
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1888
M204 S6000
G1 X76.895 Y91.949 E.00081
G3 X74.139 Y91.115 I-1.245 J-.856 E.10335
G1 X74.139 Y88.877 E.06065
G3 X75.387 Y87.411 I1.551 J.056 E.05629
G3 X77.161 Y88.884 I.258 J1.493 E.071
G1 X77.161 Y91.123 E.06066
G3 X77.009 Y91.754 I-1.511 J-.03 E.01773
G1 X76.943 Y91.873 E.00368
M204 S250
G1 X76.565 Y91.724 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1888
M204 S5000
G3 X74.54 Y91.105 I-.915 J-.629 E.07059
G1 X74.54 Y88.892 E.05565
G3 X75.457 Y87.806 I1.139 J.032 E.03858
G3 X76.76 Y88.895 I.19 J1.097 E.04854
G1 X76.76 Y91.108 E.05565
G3 X76.597 Y91.673 I-1.11 J-.013 E.01497
M204 S10000
G1 X77.507 Y92.018 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1888
M204 S6000
G1 X77.389 Y92.363 E.00987
G1 X77.389 Y92.635 E.00738
G3 X76.641 Y93.138 I-5.376 J-7.194 E.02443
G3 X73.811 Y91.492 I-.938 J-1.644 E.10719
G1 X73.811 Y88.508 E.08087
G3 X75.836 Y86.616 I1.894 J-.002 E.08425
G3 X76.722 Y86.911 I-.151 J1.928 E.02554
G1 X77.389 Y87.365 E.02187
G1 X77.389 Y87.637 E.00738
G3 X77.589 Y88.507 I-2.001 J.918 E.02435
G1 X77.589 Y91.493 E.08092
G3 X77.539 Y91.913 I-2.201 J-.048 E.01148
G1 X77.525 Y91.961 E.00135
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.363 E-.1612
G1 X77.389 Y92.635 E-.10353
G1 X76.641 Y93.138 E-.34239
G1 X76.474 Y93.223 E-.07149
G1 X76.272 Y93.296 E-.08139
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.106 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1888
M204 S5000
G3 X76.206 Y93.733 I-2.153 J-2.662 E.03437
G3 X73.41 Y91.497 I-.501 J-2.239 E.10324
G1 X73.41 Y88.503 E.07529
G3 X76.939 Y86.574 I2.296 J.008 E.12318
G1 X77.41 Y86.894 E.01432
G1 X77.41 Y79.203 E.19337
G3 X79.503 Y77.11 I2.092 J-.001 E.08266
G1 X104.58 Y77.112 E.63048
G3 X106.59 Y79.203 I-.093 J2.1 E.08045
G1 X106.59 Y82.79 E.09019
G1 X106.21 Y82.79 E.00955
M73 P51 R3
G1 X106.21 Y78.395 E.1105
G2 X105.305 Y77.49 I-.915 J.01 E.03564
G1 X78.695 Y77.49 E.66901
G2 X77.79 Y78.395 I.007 J.912 E.03567
G1 X77.79 Y87.56 E.23043
G3 X77.99 Y88.502 I-2.361 J.993 E.02435
G1 X77.99 Y91.498 E.07531
G3 X77.79 Y92.44 I-2.56 J-.051 E.02436
G1 X77.791 Y101.645 E.23143
G2 X78.695 Y102.51 I.912 J-.048 E.03466
G1 X105.308 Y102.51 E.66907
G2 X106.21 Y101.605 I-.009 J-.912 E.0356
G1 X106.21 Y97.21 E.1105
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.092 J.001 E.08267
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I-.001 J-2.092 E.08267
G1 X77.41 Y93.166 E.19186
; WIPE_START
M73 P52 R3
G1 F11668.197
M204 S6000
G1 X76.939 Y93.426 E-.20453
G1 X76.741 Y93.54 E-.08667
G1 X76.533 Y93.633 E-.08677
G1 X76.206 Y93.733 E-.12994
G1 X75.754 Y93.789 E-.17309
G1 X75.546 Y93.784 E-.079
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

G1 X75.077 Y92.888
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.332938
G1 F1888
M204 S6000
G1 X74.96 Y92.838 E.00248
G3 X74.796 Y92.75 I1.072 J-2.19 E.00361
; LINE_WIDTH: 0.28679
G3 X74.549 Y92.564 I.916 J-1.473 E.00509
; LINE_WIDTH: 0.238389
G1 X74.497 Y92.516 E.00095
G3 X74.384 Y92.392 I1.785 J-1.746 E.00223
; LINE_WIDTH: 0.197155
G3 X74.276 Y92.248 I2.012 J-1.629 E.00191
; LINE_WIDTH: 0.153156
G3 X74.162 Y92.05 I2.036 J-1.3 E.00177
; LINE_WIDTH: 0.106504
G3 X74.083 Y91.861 I1.566 J-.765 E.00097
M204 S10000
G1 X75.077 Y92.888 F42000
; LINE_WIDTH: 0.380341
G1 F1888
M204 S6000
G2 X76.176 Y92.923 I.601 J-1.581 E.02525
G2 X77.205 Y92.265 I-1.1 J-2.855 E.02774
M204 S10000
G1 X76.892 Y92.722 F42000
; LINE_WIDTH: 0.337664
G1 F1888
M204 S6000
G1 X77.034 Y92.355 E.00779
; LINE_WIDTH: 0.305246
G3 X77.066 Y92.277 I.434 J.134 E.00149
; LINE_WIDTH: 0.259064
G1 X77.15 Y92.132 E.00246
; LINE_WIDTH: 0.227093
G1 X77.188 Y92.054 E.00109
; LINE_WIDTH: 0.200557
G2 X77.262 Y91.882 I-2.489 J-1.176 E.00202
; LINE_WIDTH: 0.15479
G2 X77.328 Y91.65 I-4.589 J-1.415 E.00189
; LINE_WIDTH: 0.10617
G2 X77.358 Y91.438 I-1.606 J-.334 E.001
M204 S10000
G1 X77.358 Y88.552 F42000
; LINE_WIDTH: 0.103799
G1 F1888
M204 S6000
G2 X77.333 Y88.379 I-2.362 J.253 E.00079
; LINE_WIDTH: 0.140879
G2 X77.291 Y88.205 I-2.498 J.511 E.00125
; LINE_WIDTH: 0.179463
G2 X77.23 Y88.035 I-1.849 J.574 E.0017
; LINE_WIDTH: 0.217205
G2 X77.151 Y87.871 I-2.755 J1.218 E.00218
; LINE_WIDTH: 0.258193
G1 X77.066 Y87.72 E.00252
; LINE_WIDTH: 0.296879
G3 X76.843 Y87.244 I3.529 J-1.945 E.009
M204 S10000
G1 X77.21 Y87.748 F42000
; LINE_WIDTH: 0.381652
G1 F1888
M204 S6000
G2 X76.154 Y87.069 I-2.073 J2.066 E.02863
G2 X75.122 Y87.096 I-.474 J1.63 E.02374
; LINE_WIDTH: 0.33523
G1 X75.042 Y87.126 E.00168
G2 X74.791 Y87.253 I1.265 J2.807 E.00553
; LINE_WIDTH: 0.286035
G2 X74.544 Y87.441 I1.187 J1.816 E.0051
; LINE_WIDTH: 0.239745
G2 X74.39 Y87.6 I2.978 J3.019 E.00296
; LINE_WIDTH: 0.196319
G2 X74.269 Y87.762 I2.201 J1.779 E.00213
; LINE_WIDTH: 0.154853
G2 X74.168 Y87.937 I2.47 J1.536 E.00159
; LINE_WIDTH: 0.10854
G1 X74.15 Y87.974 E.0002
G2 X74.085 Y88.133 I2.331 J1.038 E.00083
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X74.15 Y87.974 E-.61338
G1 X74.168 Y87.937 E-.14662
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/30
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.2 I-1.012 J.677 P1  F42000
G1 X76.873 Y91.981 Z2.2
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1903
M204 S6000
G1 X76.699 Y92.186 E.00729
G3 X74.139 Y91.115 I-1.049 J-1.087 E.09527
G1 X74.139 Y88.878 E.06064
G3 X75.388 Y87.411 I1.551 J.055 E.0563
G3 X77.161 Y88.884 I.258 J1.493 E.071
G1 X77.161 Y91.123 E.06065
G3 X76.909 Y91.933 I-1.511 J-.024 E.02332
M204 S250
G1 X76.568 Y91.725 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1903
M204 S5000
G1 X76.423 Y91.896 E.00564
G3 X74.54 Y91.105 I-.773 J-.797 E.06516
G1 X74.54 Y88.892 E.05564
G3 X75.457 Y87.806 I1.139 J.032 E.03859
G3 X76.76 Y88.895 I.19 J1.097 E.04854
G1 X76.76 Y91.108 E.05564
G3 X76.599 Y91.674 I-1.11 J-.009 E.01498
M204 S10000
G1 X77.507 Y92.018 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1903
M204 S6000
G1 X77.389 Y92.363 E.00988
G1 X77.389 Y92.635 E.00737
G3 X76.645 Y93.136 I-5.329 J-7.118 E.02431
G3 X73.811 Y91.487 I-.94 J-1.646 E.10739
G1 X73.811 Y88.513 E.08057
G3 X75.839 Y86.616 I1.891 J-.012 E.08451
G3 X76.722 Y86.911 I-.164 J1.959 E.02548
G1 X77.389 Y87.365 E.02187
G1 X77.389 Y87.637 E.00737
G3 X77.589 Y88.507 I-1.997 J.917 E.02436
G1 X77.589 Y91.493 E.08092
G3 X77.54 Y91.911 I-2.198 J-.047 E.01142
G1 X77.525 Y91.96 E.0014
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.363 E-.16139
G1 X77.389 Y92.635 E-.10335
G1 X76.645 Y93.136 E-.34082
G1 X76.386 Y93.26 E-.10929
G1 X76.272 Y93.295 E-.04514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.105 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1903
M204 S5000
G3 X76.206 Y93.733 I-2.149 J-2.653 E.03437
G3 X73.41 Y91.496 I-.499 J-2.242 E.10324
G1 X73.41 Y88.504 E.0752
G3 X76.939 Y86.574 I2.291 J-.003 E.12343
G1 X77.41 Y86.894 E.01433
G1 X77.41 Y79.203 E.19338
G3 X79.503 Y77.11 I2.096 J.003 E.08262
G1 X104.576 Y77.112 E.63037
G3 X106.59 Y79.203 I-.081 J2.093 E.08063
G1 X106.59 Y82.79 E.09019
M73 P53 R2
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.11051
G2 X105.305 Y77.49 I-.915 J.01 E.03563
G1 X78.693 Y77.49 E.66907
G2 X77.79 Y78.395 I.01 J.912 E.0356
G1 X77.79 Y87.56 E.23043
G3 X77.99 Y88.502 I-2.356 J.992 E.02436
G1 X77.99 Y91.498 E.07531
G3 X77.79 Y92.44 I-2.556 J-.05 E.02436
G1 X77.791 Y101.645 E.23143
G2 X78.695 Y102.51 I.911 J-.048 E.03466
G1 X105.308 Y102.51 E.66907
G2 X106.21 Y101.605 I-.01 J-.912 E.03559
G1 X106.21 Y97.21 E.11051
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
M73 P54 R2
G3 X104.497 Y102.89 I-2.092 J.001 E.08267
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I-.001 J-2.092 E.08267
G1 X77.41 Y93.165 E.19187
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.939 Y93.426 E-.20455
G1 X76.702 Y93.558 E-.10317
G1 X76.533 Y93.633 E-.07029
G1 X76.206 Y93.733 E-.12995
G1 X75.867 Y93.784 E-.12997
G1 X75.71 Y93.789 E-.05972
G1 X75.547 Y93.774 E-.06234
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

G1 X75.119 Y92.904
G1 Z1.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.381568
G1 F1903
M204 S6000
G2 X76.151 Y92.93 I.556 J-1.572 E.02374
G2 X77.21 Y92.252 I-1.045 J-2.799 E.02868
M204 S10000
G1 X76.843 Y92.755 F42000
; LINE_WIDTH: 0.297001
G1 F1903
M204 S6000
G3 X77.066 Y92.28 I3.698 J1.445 E.009
; LINE_WIDTH: 0.25686
G1 X77.156 Y92.12 E.00266
; LINE_WIDTH: 0.226043
G1 X77.189 Y92.053 E.00094
; LINE_WIDTH: 0.200485
G2 X77.262 Y91.883 I-2.451 J-1.157 E.00201
; LINE_WIDTH: 0.154901
G2 X77.328 Y91.65 I-4.524 J-1.399 E.0019
; LINE_WIDTH: 0.106219
G2 X77.358 Y91.438 I-1.6 J-.334 E.001
; WIPE_START
G1 F18000
G1 X77.328 Y91.65 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.119 Y92.904 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.334985
G1 F1903
M204 S6000
G3 X74.791 Y92.747 I.625 J-1.73 E.00714
; LINE_WIDTH: 0.297113
G3 X74.645 Y92.645 I2.14 J-3.219 E.00305
; LINE_WIDTH: 0.26535
G3 X74.498 Y92.516 I1.271 J-1.606 E.00295
; LINE_WIDTH: 0.223799
G3 X74.335 Y92.33 I1.365 J-1.358 E.00305
; LINE_WIDTH: 0.188255
G1 X74.273 Y92.244 E.00106
; LINE_WIDTH: 0.154544
G3 X74.168 Y92.063 I1.3 J-.874 E.00164
; LINE_WIDTH: 0.108058
G1 X74.086 Y91.866 E.00103
M204 S10000
G1 X74.082 Y88.139 F42000
; LINE_WIDTH: 0.107303
G1 F1903
M204 S6000
G3 X74.15 Y87.974 I2.485 J.914 E.00085
G1 X74.162 Y87.949 E.00013
; LINE_WIDTH: 0.152992
G3 X74.269 Y87.762 I2.861 J1.511 E.00167
; LINE_WIDTH: 0.196723
G3 X74.39 Y87.6 I2.224 J1.543 E.00213
; LINE_WIDTH: 0.240395
G3 X74.549 Y87.436 I3.163 J2.892 E.00307
; LINE_WIDTH: 0.286703
G3 X74.793 Y87.251 I1.627 J1.902 E.00504
; LINE_WIDTH: 0.33291
G3 X75.042 Y87.125 I1.127 J1.915 E.00542
G1 X75.077 Y87.111 E.00074
; LINE_WIDTH: 0.381057
G3 X75.783 Y87.004 I.618 J1.688 E.01625
G1 X76.104 Y87.056 E.00735
G3 X77.21 Y87.747 I-.914 J2.691 E.02974
M204 S10000
G1 X76.843 Y87.245 F42000
; LINE_WIDTH: 0.297022
G1 F1903
M204 S6000
G2 X77.066 Y87.72 I3.75 J-1.467 E.00899
; LINE_WIDTH: 0.258284
G1 X77.151 Y87.871 E.00253
; LINE_WIDTH: 0.227274
G1 X77.189 Y87.947 E.00107
; LINE_WIDTH: 0.196475
G1 X77.271 Y88.147 E.00228
; LINE_WIDTH: 0.150908
G3 X77.327 Y88.35 I-2.004 J.661 E.0016
; LINE_WIDTH: 0.106933
G3 X77.358 Y88.552 I-1.95 J.399 E.00097
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X77.327 Y88.35 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/30
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.36 I-1.209 J-.14 P1  F42000
G1 X76.915 Y91.926 Z2.36
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1898
M204 S6000
G1 X76.898 Y91.951 E.00081
G3 X74.139 Y91.115 I-1.248 J-.852 E.10364
G1 X74.139 Y88.877 E.06065
G3 X75.388 Y87.411 I1.511 J.021 E.05658
G3 X77.161 Y88.884 I.258 J1.493 E.071
G1 X77.161 Y91.123 E.06066
G3 X77.011 Y91.755 I-1.511 J-.024 E.01774
G1 X76.944 Y91.874 E.00369
M204 S250
G1 X76.567 Y91.725 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1898
M204 S5000
G3 X74.54 Y91.105 I-.917 J-.626 E.07079
G1 X74.54 Y88.892 E.05565
G3 X75.457 Y87.806 I1.11 J.007 E.03878
G3 X76.76 Y88.895 I.19 J1.097 E.04854
G1 X76.76 Y91.108 E.05565
G3 X76.599 Y91.674 I-1.11 J-.009 E.01498
M204 S10000
G1 X77.507 Y92.018 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1898
M204 S6000
G1 X77.389 Y92.363 E.00988
G1 X77.389 Y92.635 E.00737
G3 X76.642 Y93.138 I-5.362 J-7.168 E.02443
G3 X73.811 Y91.492 I-.938 J-1.645 E.10719
G1 X73.811 Y88.508 E.08087
G3 X75.838 Y86.616 I1.894 J-.003 E.08429
G3 X76.722 Y86.911 I-.153 J1.933 E.02552
G1 X77.389 Y87.365 E.02186
G1 X77.389 Y87.637 E.00737
G3 X77.589 Y88.507 I-1.995 J.917 E.02435
G1 X77.589 Y91.493 E.08093
G3 X77.541 Y91.909 I-2.195 J-.047 E.01136
G1 X77.525 Y91.961 E.00146
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.363 E-.16136
G1 X77.389 Y92.635 E-.10331
G1 X76.642 Y93.138 E-.34244
G1 X76.474 Y93.223 E-.07138
G1 X76.273 Y93.296 E-.08152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.106 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1898
M204 S5000
M73 P55 R2
G3 X76.206 Y93.733 I-2.152 J-2.658 E.03436
G3 X73.41 Y91.497 I-.502 J-2.239 E.10325
G1 X73.41 Y88.503 E.07529
G3 X76.939 Y86.574 I2.296 J.008 E.12319
G1 X77.41 Y86.894 E.01432
G1 X77.41 Y79.203 E.19338
G3 X79.503 Y77.11 I2.092 J-.001 E.08267
G1 X104.572 Y77.112 E.63026
G3 X106.59 Y79.203 I-.077 J2.094 E.08074
G1 X106.59 Y82.79 E.09019
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.1105
G2 X105.305 Y77.49 I-.915 J.01 E.03563
G1 X78.695 Y77.49 E.66903
G2 X77.79 Y78.395 I.008 J.912 E.03566
G1 X77.79 Y87.56 E.23042
G3 X77.99 Y88.502 I-2.351 J.991 E.02436
G1 X77.99 Y91.498 E.0753
G3 X77.79 Y92.44 I-2.552 J-.049 E.02436
G1 X77.791 Y101.645 E.23143
G2 X78.695 Y102.51 I.912 J-.048 E.03466
G1 X105.308 Y102.51 E.66907
G2 X106.21 Y101.605 I-.01 J-.912 E.0356
G1 X106.21 Y97.21 E.1105
M73 P56 R2
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.092 J.001 E.08267
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I-.001 J-2.092 E.08267
G1 X77.41 Y93.166 E.19187
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.939 Y93.426 E-.20444
G1 X76.741 Y93.539 E-.0867
G1 X76.426 Y93.672 E-.12993
G1 X76.206 Y93.733 E-.08672
G1 X75.982 Y93.773 E-.08661
G1 X75.64 Y93.789 E-.12997
G1 X75.547 Y93.777 E-.03564
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

G1 X75.078 Y92.888
G1 Z2.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.380042
G1 F1898
M204 S6000
G2 X75.698 Y92.999 I.601 J-1.567 E.0143
G2 X77.002 Y92.43 I-.138 J-2.093 E.03271
G1 X77.021 Y92.388 E.00103
; LINE_WIDTH: 0.331551
G1 X77.044 Y92.323 E.00134
; LINE_WIDTH: 0.296157
G1 X77.066 Y92.277 E.00086
; LINE_WIDTH: 0.259143
G1 X77.15 Y92.132 E.00247
; LINE_WIDTH: 0.226943
G1 X77.189 Y92.052 E.00111
; LINE_WIDTH: 0.200366
G2 X77.262 Y91.882 I-2.447 J-1.155 E.00201
; LINE_WIDTH: 0.154948
G2 X77.327 Y91.651 I-4.487 J-1.388 E.00189
; LINE_WIDTH: 0.106271
G2 X77.358 Y91.438 I-1.587 J-.333 E.00101
; WIPE_START
G1 F18000
G1 X77.327 Y91.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.078 Y92.888 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.333053
G1 F1898
M204 S6000
G1 X74.96 Y92.838 E.00249
G3 X74.797 Y92.75 I1.105 J-2.25 E.00361
; LINE_WIDTH: 0.286851
G3 X74.55 Y92.564 I.914 J-1.472 E.00509
; LINE_WIDTH: 0.238417
G1 X74.498 Y92.516 E.00094
G3 X74.384 Y92.392 I1.707 J-1.678 E.00224
; LINE_WIDTH: 0.197236
G3 X74.276 Y92.248 I2.029 J-1.639 E.00191
; LINE_WIDTH: 0.153253
G3 X74.163 Y92.051 I1.959 J-1.257 E.00176
; LINE_WIDTH: 0.106603
G3 X74.084 Y91.862 I1.55 J-.757 E.00097
M204 S10000
G1 X74.086 Y88.135 F42000
; LINE_WIDTH: 0.108491
G1 F1898
M204 S6000
G1 X74.17 Y87.937 E.00104
; LINE_WIDTH: 0.154404
G3 X74.227 Y87.828 I1.627 J.796 E.00096
G1 X74.272 Y87.759 E.00064
; LINE_WIDTH: 0.196616
G3 X74.382 Y87.61 I1.866 J1.253 E.00197
; LINE_WIDTH: 0.23834
G3 X74.544 Y87.44 I3.208 J2.912 E.00312
; LINE_WIDTH: 0.286176
G3 X74.791 Y87.253 I1.409 J1.597 E.0051
; LINE_WIDTH: 0.334934
G3 X75.042 Y87.126 I1.507 J2.664 E.0055
G1 X75.117 Y87.098 E.00156
; LINE_WIDTH: 0.381544
G3 X76.148 Y87.068 I.563 J1.598 E.02374
G3 X77.21 Y87.748 I-1.003 J2.735 E.02877
M204 S10000
G1 X76.842 Y87.244 F42000
; LINE_WIDTH: 0.297041
G1 F1898
M204 S6000
G2 X77.066 Y87.72 I3.702 J-1.449 E.00901
; LINE_WIDTH: 0.258253
G1 X77.151 Y87.871 E.00252
; LINE_WIDTH: 0.22724
G1 X77.189 Y87.947 E.00108
; LINE_WIDTH: 0.196217
G1 X77.272 Y88.149 E.0023
; LINE_WIDTH: 0.150788
G3 X77.327 Y88.349 I-1.987 J.654 E.00158
; LINE_WIDTH: 0.106985
G3 X77.358 Y88.552 I-1.947 J.399 E.00097
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X77.327 Y88.349 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/30
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.52 I-1.209 J-.139 P1  F42000
G1 X76.915 Y91.926 Z2.52
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1884
M204 S6000
G1 X76.898 Y91.951 E.00081
G3 X74.139 Y91.115 I-1.248 J-.852 E.10363
G1 X74.139 Y88.877 E.06065
G3 X75.462 Y87.4 I1.507 J.019 E.05862
G3 X77.161 Y88.884 I.185 J1.503 E.06896
G1 X77.161 Y91.123 E.06066
G3 X77.011 Y91.755 I-1.511 J-.024 E.01774
G1 X76.944 Y91.874 E.00368
M204 S250
G1 X76.567 Y91.725 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1884
M204 S5000
G3 X74.54 Y91.105 I-.917 J-.626 E.07078
G1 X74.54 Y88.892 E.05565
G3 X75.512 Y87.798 I1.109 J.007 E.04017
G3 X76.76 Y88.895 I.136 J1.104 E.04715
G1 X76.76 Y91.108 E.05565
M73 P57 R2
G3 X76.599 Y91.674 I-1.11 J-.009 E.01498
M204 S10000
G1 X77.51 Y92.016 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1884
M204 S6000
G1 X77.389 Y92.363 E.00995
G1 X77.389 Y92.635 E.00736
G3 X76.646 Y93.135 I-5.324 J-7.109 E.02429
G3 X73.811 Y91.487 I-.94 J-1.645 E.1074
G1 X73.811 Y88.513 E.08058
G3 X75.839 Y86.616 I1.891 J-.011 E.08451
G3 X76.722 Y86.911 I-.164 J1.958 E.02548
G1 X77.389 Y87.365 E.02187
G1 X77.389 Y87.637 E.00736
G3 X77.589 Y88.507 I-1.992 J.916 E.02436
G1 X77.589 Y91.493 E.08093
G3 X77.538 Y91.931 I-2.109 J-.027 E.01196
G1 X77.528 Y91.959 E.00081
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.363 E-.16227
G1 X77.389 Y92.635 E-.10322
G1 X76.646 Y93.135 E-.34055
G1 X76.387 Y93.26 E-.10921
G1 X76.274 Y93.294 E-.04475
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.105 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1884
M204 S5000
G3 X76.206 Y93.733 I-2.149 J-2.653 E.03436
G3 X73.41 Y91.495 I-.499 J-2.243 E.10325
G1 X73.41 Y88.505 E.0752
G3 X76.939 Y86.574 I2.291 J-.003 E.12344
G1 X77.41 Y86.895 E.01432
G1 X77.41 Y79.203 E.19338
G3 X79.503 Y77.11 I2.096 J.003 E.08262
G1 X104.567 Y77.112 E.63016
G3 X106.59 Y79.203 I-.073 J2.094 E.08085
G1 X106.59 Y82.79 E.09019
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.1105
G2 X105.305 Y77.49 I-.916 J.011 E.03563
G1 X78.695 Y77.49 E.66901
G2 X77.79 Y78.395 I.007 J.912 E.03567
G1 X77.79 Y87.56 E.23042
G3 X77.99 Y88.502 I-2.347 J.99 E.02436
M73 P58 R2
G1 X77.99 Y91.498 E.0753
G3 X77.79 Y92.44 I-2.45 J-.028 E.02437
G1 X77.791 Y101.645 E.23142
G2 X78.695 Y102.51 I.911 J-.047 E.03467
G1 X105.308 Y102.51 E.66907
G2 X106.21 Y101.605 I-.01 J-.912 E.0356
G1 X106.21 Y97.21 E.1105
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.092 J.001 E.08267
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I-.001 J-2.092 E.08266
G1 X77.41 Y93.165 E.19187
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.939 Y93.426 E-.20445
G1 X76.695 Y93.562 E-.10612
G1 X76.533 Y93.633 E-.06728
G1 X76.206 Y93.733 E-.12989
G1 X75.868 Y93.784 E-.12997
G1 X75.703 Y93.789 E-.0628
G1 X75.547 Y93.774 E-.0595
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

G1 X75.113 Y92.901
G1 Z2.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.33467
G1 F1884
M204 S6000
G3 X74.792 Y92.747 I.64 J-1.746 E.00698
; LINE_WIDTH: 0.296971
G3 X74.644 Y92.644 I2.657 J-3.96 E.00309
; LINE_WIDTH: 0.265371
G3 X74.498 Y92.517 I1.301 J-1.638 E.00291
; LINE_WIDTH: 0.224008
G3 X74.336 Y92.331 I1.322 J-1.321 E.00305
; LINE_WIDTH: 0.187482
G1 X74.269 Y92.238 E.00114
; LINE_WIDTH: 0.154
G3 X74.169 Y92.064 I1.281 J-.856 E.00157
; LINE_WIDTH: 0.108098
G1 X74.085 Y91.865 E.00104
M204 S10000
G1 X75.113 Y92.901 F42000
; LINE_WIDTH: 0.380494
G1 F1884
M204 S6000
G2 X75.688 Y92.999 I.576 J-1.642 E.01324
G2 X77.003 Y92.43 I-.106 J-2.046 E.03301
G1 X77.021 Y92.388 E.00103
; LINE_WIDTH: 0.331578
G1 X77.044 Y92.323 E.00134
; LINE_WIDTH: 0.296181
G1 X77.066 Y92.277 E.00086
; LINE_WIDTH: 0.259168
G1 X77.15 Y92.132 E.00247
; LINE_WIDTH: 0.226943
G1 X77.189 Y92.052 E.00111
; LINE_WIDTH: 0.200388
G2 X77.263 Y91.882 I-2.735 J-1.283 E.002
; LINE_WIDTH: 0.154865
G2 X77.328 Y91.651 I-2.576 J-.848 E.00189
; LINE_WIDTH: 0.106269
G2 X77.358 Y91.438 I-1.59 J-.333 E.00101
M204 S10000
G1 X77.358 Y88.552 F42000
; LINE_WIDTH: 0.107044
G1 F1884
M204 S6000
G2 X77.327 Y88.349 I-1.966 J.194 E.00097
; LINE_WIDTH: 0.150656
G2 X77.273 Y88.15 I-2.034 J.452 E.00156
; LINE_WIDTH: 0.195961
G1 X77.189 Y87.948 E.0023
; LINE_WIDTH: 0.227195
G1 X77.151 Y87.871 E.00109
; LINE_WIDTH: 0.258293
G1 X77.066 Y87.72 E.00252
; LINE_WIDTH: 0.297087
G3 X76.842 Y87.244 I3.502 J-1.937 E.00901
M204 S10000
G1 X77.21 Y87.748 F42000
; LINE_WIDTH: 0.380942
G1 F1884
M204 S6000
G2 X76.104 Y87.056 I-2.019 J1.996 E.02974
G1 X75.783 Y87.003 E.00736
G2 X75.078 Y87.113 I-.104 J1.659 E.01624
; LINE_WIDTH: 0.333916
G1 X74.956 Y87.163 E.00258
G2 X74.801 Y87.248 I1.192 J2.35 E.00346
; LINE_WIDTH: 0.299447
G1 X74.671 Y87.336 E.00272
; LINE_WIDTH: 0.269014
G2 X74.498 Y87.483 I1.261 J1.662 E.00347
; LINE_WIDTH: 0.224412
G2 X74.333 Y87.67 I2.718 J2.563 E.00309
; LINE_WIDTH: 0.179899
G1 X74.326 Y87.679 E.00012
G2 X74.227 Y87.831 I2.258 J1.574 E.00171
; LINE_WIDTH: 0.135475
G1 X74.184 Y87.905 E.00057
G2 X74.132 Y88.017 I1.614 J.822 E.00081
; LINE_WIDTH: 0.101292
G1 X74.082 Y88.137 E.00057
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X74.132 Y88.017 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/30
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.68 I-.991 J.706 P1  F42000
M73 P59 R2
G1 X76.915 Y91.926 Z2.68
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1903
M204 S6000
G1 X76.895 Y91.949 E.00082
G3 X74.139 Y91.115 I-1.245 J-.856 E.10336
G1 X74.139 Y88.878 E.06063
G3 X75.388 Y87.411 I1.513 J.023 E.05658
G3 X77.161 Y88.884 I.258 J1.493 E.071
G1 X77.161 Y91.123 E.06065
G3 X77.009 Y91.754 I-1.511 J-.03 E.01774
G1 X76.943 Y91.873 E.00368
M204 S250
G1 X76.565 Y91.724 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1903
M204 S5000
G3 X74.54 Y91.105 I-.915 J-.629 E.0706
G1 X74.54 Y88.892 E.05563
G3 X75.457 Y87.806 I1.14 J.032 E.03859
G3 X76.76 Y88.895 I.19 J1.097 E.04854
G1 X76.76 Y91.108 E.05564
G3 X76.597 Y91.673 I-1.11 J-.013 E.01498
M204 S10000
G1 X77.51 Y92.016 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1903
M204 S6000
G1 X77.389 Y92.363 E.00995
G1 X77.389 Y92.635 E.00736
G3 X76.646 Y93.135 I-5.338 J-7.13 E.02428
G3 X73.811 Y91.487 I-.941 J-1.645 E.1074
G1 X73.811 Y88.508 E.08073
G3 X75.839 Y86.616 I1.891 J-.006 E.08437
G3 X76.722 Y86.911 I-.164 J1.959 E.02549
G1 X77.389 Y87.365 E.02186
G1 X77.389 Y87.637 E.00736
G3 X77.589 Y88.507 I-1.988 J.915 E.02436
G1 X77.589 Y91.493 E.08092
G3 X77.537 Y91.933 I-2.11 J-.027 E.01202
G1 X77.528 Y91.959 E.00076
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.363 E-.16229
G1 X77.389 Y92.635 E-.10324
G1 X76.646 Y93.135 E-.34038
G1 X76.388 Y93.259 E-.109
G1 X76.274 Y93.294 E-.04509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.105 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1903
M204 S5000
G3 X76.207 Y93.733 I-2.15 J-2.655 E.03435
G3 X73.41 Y91.496 I-.499 J-2.243 E.10325
G1 X73.41 Y88.503 E.07525
G3 X76.939 Y86.575 I2.291 J-.001 E.1234
G1 X77.41 Y86.895 E.01431
G1 X77.41 Y79.203 E.19338
G3 X79.503 Y77.11 I2.102 J.009 E.08256
G1 X104.563 Y77.112 E.63004
G3 X106.59 Y79.203 I-.068 J2.094 E.08096
G1 X106.59 Y82.79 E.09019
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.11051
G2 X105.305 Y77.49 I-.915 J.01 E.03563
G1 X78.695 Y77.49 E.66901
G2 X77.79 Y78.395 I.007 J.912 E.03567
G1 X77.79 Y87.56 E.23042
M73 P60 R2
G3 X77.99 Y88.502 I-2.341 J.989 E.02436
G1 X77.99 Y91.498 E.0753
G3 X77.79 Y92.44 I-2.451 J-.028 E.02438
G1 X77.791 Y101.645 E.23142
G2 X78.695 Y102.51 I.912 J-.047 E.03467
G1 X105.308 Y102.51 E.66907
G2 X106.21 Y101.605 I-.01 J-.912 E.03559
G1 X106.21 Y97.21 E.11051
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.092 J.001 E.08267
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I-.001 J-2.092 E.08267
G1 X77.41 Y93.165 E.19187
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.939 Y93.425 E-.20429
M73 P61 R2
G1 X76.692 Y93.563 E-.10772
G1 X76.534 Y93.633 E-.06556
G1 X76.207 Y93.733 E-.13001
G1 X75.868 Y93.784 E-.13001
G1 X75.699 Y93.789 E-.06434
G1 X75.547 Y93.774 E-.05807
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

G1 X75.11 Y92.9
G1 Z2.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.380678
G1 F1903
M204 S6000
G2 X76.141 Y92.933 I.566 J-1.566 E.02369
G2 X77.205 Y92.265 I-1.014 J-2.796 E.02857
M204 S10000
G1 X76.892 Y92.722 F42000
; LINE_WIDTH: 0.33756
G1 F1903
M204 S6000
G1 X77.034 Y92.355 E.00778
; LINE_WIDTH: 0.30534
G3 X77.066 Y92.277 I.432 J.134 E.00148
; LINE_WIDTH: 0.259201
G1 X77.15 Y92.132 E.00246
; LINE_WIDTH: 0.226959
G1 X77.189 Y92.052 E.00112
; LINE_WIDTH: 0.200385
G2 X77.263 Y91.882 I-2.742 J-1.286 E.002
; LINE_WIDTH: 0.154948
G2 X77.327 Y91.652 I-2.568 J-.845 E.00189
; LINE_WIDTH: 0.10633
G2 X77.358 Y91.438 I-1.578 J-.332 E.00101
; WIPE_START
G1 F18000
G1 X77.327 Y91.652 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.11 Y92.9 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.334511
G1 F1903
M204 S6000
G3 X74.792 Y92.747 I.65 J-1.76 E.00691
; LINE_WIDTH: 0.296633
G3 X74.641 Y92.642 I2.347 J-3.509 E.00315
; LINE_WIDTH: 0.26516
G3 X74.499 Y92.517 I1.28 J-1.608 E.00285
; LINE_WIDTH: 0.224118
G3 X74.337 Y92.332 I1.292 J-1.295 E.00304
; LINE_WIDTH: 0.187128
G1 X74.268 Y92.235 E.00118
; LINE_WIDTH: 0.153688
G3 X74.169 Y92.064 I1.267 J-.846 E.00154
; LINE_WIDTH: 0.108055
G1 X74.085 Y91.865 E.00104
M204 S10000
G1 X74.084 Y88.134 F42000
; LINE_WIDTH: 0.114761
G1 F1903
M204 S6000
G3 X74.184 Y87.905 I2.543 J.977 E.00131
G1 X74.188 Y87.898 E.00004
; LINE_WIDTH: 0.163845
G3 X74.294 Y87.727 I2.628 J1.503 E.0017
; LINE_WIDTH: 0.20468
G1 X74.413 Y87.574 E.00215
; LINE_WIDTH: 0.243251
G3 X74.55 Y87.436 I1.208 J1.062 E.00265
; LINE_WIDTH: 0.287326
G3 X74.8 Y87.247 I1.11 J1.209 E.00517
; LINE_WIDTH: 0.33363
G3 X75.042 Y87.125 I1.111 J1.901 E.00528
G1 X75.078 Y87.111 E.00077
; LINE_WIDTH: 0.381048
G3 X75.783 Y87.003 I.634 J1.796 E.0162
G1 X76.104 Y87.056 E.00736
G3 X77.21 Y87.748 I-.913 J2.688 E.02974
M204 S10000
G1 X76.842 Y87.244 F42000
; LINE_WIDTH: 0.297078
G1 F1903
M204 S6000
G2 X77.066 Y87.72 I3.642 J-1.42 E.00901
; LINE_WIDTH: 0.258255
G1 X77.151 Y87.871 E.00252
; LINE_WIDTH: 0.217167
G3 X77.229 Y88.035 I-2.666 J1.376 E.00217
; LINE_WIDTH: 0.179625
G3 X77.291 Y88.205 I-1.902 J.788 E.00171
; LINE_WIDTH: 0.140847
G3 X77.333 Y88.379 I-2.888 J.787 E.00124
; LINE_WIDTH: 0.103848
G3 X77.358 Y88.552 I-2.283 J.419 E.00079
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X77.333 Y88.379 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/30
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.84 I-1.209 J-.143 P1  F42000
G1 X76.915 Y91.926 Z2.84
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1897
M204 S6000
G1 X76.895 Y91.949 E.00082
G3 X74.139 Y91.115 I-1.245 J-.856 E.10335
G1 X74.139 Y88.877 E.06065
G3 X75.395 Y87.41 I1.51 J.022 E.05677
G3 X77.161 Y88.884 I.251 J1.493 E.07079
G1 X77.161 Y91.123 E.06066
G3 X77.009 Y91.754 I-1.511 J-.03 E.01773
G1 X76.943 Y91.873 E.00368
M204 S250
G1 X76.565 Y91.724 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1897
M204 S5000
G3 X74.54 Y91.105 I-.915 J-.629 E.07059
G1 X74.54 Y88.892 E.05565
G3 X75.46 Y87.806 I1.11 J.008 E.03884
G3 X76.76 Y88.895 I.188 J1.097 E.04847
G1 X76.76 Y91.108 E.05565
G3 X76.597 Y91.673 I-1.11 J-.013 E.01497
M204 S10000
G1 X77.51 Y92.016 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1897
M204 S6000
G1 X77.389 Y92.363 E.00996
G1 X77.389 Y92.635 E.00736
G3 X76.642 Y93.137 I-5.357 J-7.157 E.0244
G3 X73.811 Y91.492 I-.938 J-1.645 E.1072
G1 X73.811 Y88.513 E.08074
G3 X75.839 Y86.616 I1.901 J.001 E.08436
G3 X76.723 Y86.912 I-.158 J1.941 E.02548
G1 X77.389 Y87.365 E.02185
G1 X77.389 Y87.637 E.00736
G3 X77.589 Y88.507 I-1.985 J.914 E.02437
G1 X77.589 Y91.493 E.08092
G3 X77.537 Y91.935 I-2.113 J-.027 E.01208
G1 X77.529 Y91.959 E.0007
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.363 E-.16249
G1 X77.389 Y92.635 E-.10316
G1 X76.642 Y93.137 E-.34209
G1 X76.388 Y93.26 E-.10735
G1 X76.276 Y93.297 E-.0449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.105 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1897
M204 S5000
G3 X76.207 Y93.733 I-2.152 J-2.657 E.03434
G3 X73.41 Y91.497 I-.502 J-2.239 E.10327
G1 X73.41 Y88.504 E.07525
G3 X76.939 Y86.575 I2.292 J-.001 E.1234
G1 X77.41 Y86.895 E.01431
G1 X77.41 Y79.203 E.19338
G3 X79.503 Y77.11 I2.096 J.003 E.08262
G1 X104.559 Y77.112 E.62994
G3 X106.59 Y79.203 I-.059 J2.09 E.08111
G1 X106.59 Y82.79 E.09019
M73 P62 R2
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.11049
G2 X105.305 Y77.49 I-.915 J.01 E.03563
G1 X78.695 Y77.49 E.66903
G2 X77.79 Y78.395 I.016 J.92 E.03557
G1 X77.79 Y87.56 E.23042
G3 X77.99 Y88.502 I-2.338 J.989 E.02437
G1 X77.99 Y91.498 E.0753
G3 X77.79 Y92.44 I-2.453 J-.028 E.02438
G1 X77.791 Y101.645 E.23142
G2 X78.695 Y102.51 I.92 J-.056 E.03459
G1 X105.308 Y102.51 E.66908
G2 X106.21 Y101.605 I-.018 J-.92 E.03552
G1 X106.21 Y97.21 E.11049
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.096 J-.003 E.08262
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I.003 J-2.096 E.08262
G1 X77.41 Y93.165 E.19187
; WIPE_START
M73 P63 R2
G1 F11668.197
M204 S6000
G1 X76.939 Y93.426 E-.20431
G1 X76.742 Y93.539 E-.08659
G1 X76.534 Y93.633 E-.08677
G1 X76.207 Y93.733 E-.12981
G1 X75.982 Y93.772 E-.08679
G1 X75.641 Y93.789 E-.12994
G1 X75.547 Y93.777 E-.03579
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

G1 X75.079 Y92.889
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.379999
G1 F1897
M204 S6000
G2 X75.699 Y92.999 I.599 J-1.564 E.01426
G2 X77.002 Y92.43 I-.136 J-2.089 E.03271
G1 X77.021 Y92.388 E.00103
; LINE_WIDTH: 0.33162
G1 X77.044 Y92.324 E.00133
; LINE_WIDTH: 0.296344
G1 X77.065 Y92.278 E.00086
; LINE_WIDTH: 0.259272
G1 X77.15 Y92.132 E.00247
; LINE_WIDTH: 0.226865
G1 X77.19 Y92.051 E.00113
; LINE_WIDTH: 0.200347
G2 X77.263 Y91.883 I-2.765 J-1.296 E.00199
; LINE_WIDTH: 0.155039
G2 X77.327 Y91.652 I-2.564 J-.844 E.00188
; LINE_WIDTH: 0.106392
G2 X77.358 Y91.438 I-1.564 J-.331 E.00102
; WIPE_START
G1 F18000
G1 X77.327 Y91.652 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.079 Y92.889 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.333121
G1 F1897
M204 S6000
G1 X74.96 Y92.838 E.00252
G3 X74.796 Y92.75 I1.132 J-2.297 E.00362
; LINE_WIDTH: 0.286829
G3 X74.55 Y92.564 I.915 J-1.472 E.00509
; LINE_WIDTH: 0.238371
G1 X74.499 Y92.517 E.00093
G3 X74.384 Y92.392 I1.57 J-1.555 E.00226
; LINE_WIDTH: 0.19727
G3 X74.276 Y92.248 I2.073 J-1.669 E.00191
; LINE_WIDTH: 0.153319
G3 X74.163 Y92.052 I1.828 J-1.183 E.00176
; LINE_WIDTH: 0.10672
G3 X74.084 Y91.863 I1.538 J-.751 E.00096
M204 S10000
G1 X74.085 Y88.133 F42000
; LINE_WIDTH: 0.109776
G1 F1897
M204 S6000
G3 X74.169 Y87.935 I3.001 J1.161 E.00106
; LINE_WIDTH: 0.15375
G3 X74.267 Y87.768 I1.078 J.52 E.00151
; LINE_WIDTH: 0.186809
G1 X74.336 Y87.667 E.00122
; LINE_WIDTH: 0.224942
G3 X74.498 Y87.482 I2.824 J2.33 E.00305
; LINE_WIDTH: 0.265449
G3 X74.64 Y87.361 I1.242 J1.307 E.0028
; LINE_WIDTH: 0.296361
G1 X74.793 Y87.253 E.00321
; LINE_WIDTH: 0.334924
G3 X75.107 Y87.101 I.836 J1.322 E.00685
; LINE_WIDTH: 0.381309
G3 X76.138 Y87.065 I.57 J1.565 E.02374
G3 X77.21 Y87.748 I-.981 J2.722 E.02898
M204 S10000
G1 X76.842 Y87.244 F42000
; LINE_WIDTH: 0.297199
G1 F1897
M204 S6000
G2 X77.066 Y87.72 I3.663 J-1.433 E.00902
; LINE_WIDTH: 0.258346
G1 X77.151 Y87.871 E.00252
; LINE_WIDTH: 0.227105
G1 X77.19 Y87.949 E.0011
; LINE_WIDTH: 0.195369
G1 X77.274 Y88.154 E.00233
; LINE_WIDTH: 0.150432
G3 X77.327 Y88.347 I-1.953 J.638 E.00152
; LINE_WIDTH: 0.107174
G3 X77.358 Y88.552 I-1.907 J.395 E.00098
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X77.327 Y88.347 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/30
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3 I-1.208 J-.148 P1  F42000
G1 X76.881 Y91.975 Z3
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1902
M204 S6000
G1 X76.759 Y92.119 E.0051
G3 X74.139 Y91.115 I-1.109 J-1.026 E.09745
G1 X74.139 Y88.877 E.06065
G3 X75.387 Y87.411 I1.513 J.023 E.05656
G3 X77.161 Y88.884 I.258 J1.493 E.071
G1 X77.161 Y91.123 E.06066
G3 X76.912 Y91.924 I-1.511 J-.03 E.02303
M204 S250
G1 X76.565 Y91.723 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1902
M204 S5000
G3 X74.54 Y91.105 I-.915 J-.629 E.0706
G1 X74.54 Y88.892 E.05565
G3 X75.457 Y87.806 I1.14 J.033 E.03858
G3 X76.76 Y88.895 I.19 J1.097 E.04854
G1 X76.76 Y91.108 E.05565
G3 X76.597 Y91.673 I-1.11 J-.013 E.01496
M204 S10000
G1 X77.507 Y92.026 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1902
M204 S6000
G1 X77.389 Y92.363 E.00967
G1 X77.389 Y92.635 E.00735
G3 X76.647 Y93.135 I-5.325 J-7.108 E.02426
G3 X73.811 Y91.492 I-.945 J-1.638 E.10743
G1 X73.811 Y88.512 E.08075
G3 X75.839 Y86.616 I1.894 J-.007 E.08445
G3 X76.723 Y86.912 I-.164 J1.958 E.02549
G1 X77.389 Y87.365 E.02185
G1 X77.389 Y87.637 E.00735
G3 X77.589 Y88.507 I-1.982 J.914 E.02437
G1 X77.589 Y91.493 E.08091
G3 X77.536 Y91.937 I-2.114 J-.028 E.01213
G1 X77.525 Y91.97 E.00093
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.363 E-.15838
G1 X77.389 Y92.635 E-.10308
G1 X76.647 Y93.135 E-.3401
G1 X76.389 Y93.259 E-.10891
G1 X76.264 Y93.297 E-.04953
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.105 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1902
M204 S5000
G3 X76.207 Y93.733 I-2.15 J-2.654 E.03434
G3 X73.41 Y91.497 I-.504 J-2.238 E.10329
G1 X73.41 Y88.504 E.07526
G3 X76.94 Y86.575 I2.293 J.001 E.12338
G1 X77.41 Y86.895 E.0143
G1 X77.41 Y79.203 E.19338
M73 P64 R2
G3 X79.503 Y77.11 I2.096 J.003 E.08262
G1 X104.554 Y77.111 E.62983
G3 X106.59 Y79.203 I-.055 J2.09 E.08122
G1 X106.59 Y82.79 E.09019
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.1105
G2 X105.305 Y77.49 I-.926 J.021 E.03552
G1 X78.695 Y77.49 E.66901
G2 X77.79 Y78.395 I.015 J.92 E.03558
G1 X77.79 Y87.56 E.23042
G3 X77.99 Y88.502 I-2.333 J.987 E.02437
G1 X77.99 Y91.498 E.0753
G3 X77.79 Y92.44 I-2.454 J-.028 E.02438
G1 X77.791 Y101.645 E.23142
G2 X78.695 Y102.51 I.92 J-.056 E.03459
G1 X105.308 Y102.51 E.66907
G2 X106.21 Y101.605 I-.01 J-.912 E.0356
G1 X106.21 Y97.21 E.1105
M73 P65 R2
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.092 J.001 E.08267
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I.003 J-2.096 E.08262
G1 X77.41 Y93.165 E.19187
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.844 Y93.484 E-.24681
G1 X76.534 Y93.632 E-.13049
G1 X76.207 Y93.733 E-.13005
G1 X75.869 Y93.784 E-.12995
G1 X75.692 Y93.789 E-.06748
G1 X75.547 Y93.774 E-.05521
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

G1 X75.104 Y92.898
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.380567
G1 F1902
M204 S6000
G2 X76.135 Y92.934 I.572 J-1.562 E.02368
G2 X77.205 Y92.264 I-1.001 J-2.788 E.02871
M204 S10000
G1 X76.892 Y92.722 F42000
; LINE_WIDTH: 0.337629
G1 F1902
M204 S6000
G1 X77.034 Y92.355 E.00778
; LINE_WIDTH: 0.305472
G3 X77.065 Y92.278 I.431 J.133 E.00148
; LINE_WIDTH: 0.259277
G1 X77.15 Y92.132 E.00248
; LINE_WIDTH: 0.226821
G1 X77.19 Y92.051 E.00113
; LINE_WIDTH: 0.200353
G2 X77.263 Y91.883 I-2.792 J-1.307 E.00198
; LINE_WIDTH: 0.155134
G2 X77.327 Y91.653 I-2.561 J-.842 E.00188
; LINE_WIDTH: 0.106495
G2 X77.358 Y91.438 I-1.554 J-.331 E.00102
; WIPE_START
G1 F18000
G1 X77.327 Y91.653 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.104 Y92.898 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.334241
G1 F1902
M204 S6000
G3 X74.793 Y92.748 I.667 J-1.782 E.00676
; LINE_WIDTH: 0.296048
G3 X74.636 Y92.637 I2.027 J-3.043 E.00327
; LINE_WIDTH: 0.264753
G3 X74.499 Y92.517 I1.303 J-1.627 E.00274
; LINE_WIDTH: 0.224311
G3 X74.337 Y92.333 I1.251 J-1.26 E.00304
; LINE_WIDTH: 0.186457
G1 X74.264 Y92.23 E.00126
; LINE_WIDTH: 0.153132
G3 X74.169 Y92.065 I1.245 J-.826 E.00147
; LINE_WIDTH: 0.108056
G1 X74.085 Y91.864 E.00105
M204 S10000
G1 X74.084 Y88.133 F42000
; LINE_WIDTH: 0.114784
G1 F1902
M204 S6000
G3 X74.184 Y87.905 I2.532 J.97 E.0013
G1 X74.188 Y87.898 E.00004
; LINE_WIDTH: 0.16386
G3 X74.294 Y87.726 I2.636 J1.509 E.00171
; LINE_WIDTH: 0.204133
G1 X74.409 Y87.579 E.00207
; LINE_WIDTH: 0.242533
G3 X74.55 Y87.436 I1.216 J1.06 E.00273
; LINE_WIDTH: 0.287328
G3 X74.8 Y87.247 I1.113 J1.213 E.00517
; LINE_WIDTH: 0.333667
G3 X75.042 Y87.125 I1.112 J1.903 E.00528
G1 X75.079 Y87.111 E.00078
; LINE_WIDTH: 0.381037
G3 X75.783 Y87.004 I.616 J1.688 E.0162
G1 X76.105 Y87.056 E.00736
G3 X77.21 Y87.748 I-.914 J2.688 E.02975
M204 S10000
G1 X76.842 Y87.244 F42000
; LINE_WIDTH: 0.297225
G1 F1902
M204 S6000
G2 X77.066 Y87.72 I3.672 J-1.438 E.00903
; LINE_WIDTH: 0.258318
G1 X77.151 Y87.871 E.00252
; LINE_WIDTH: 0.21976
G3 X77.222 Y88.018 I-3.449 J1.772 E.00197
; LINE_WIDTH: 0.182247
G3 X77.29 Y88.202 I-1.921 J.812 E.00189
; LINE_WIDTH: 0.144634
G1 X77.327 Y88.347 E.00108
; LINE_WIDTH: 0.107205
G3 X77.358 Y88.552 I-1.893 J.393 E.00098
; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X77.327 Y88.347 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/30
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.16 I-1.209 J-.139 P1  F42000
G1 X76.915 Y91.926 Z3.16
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1888
M204 S6000
G1 X76.895 Y91.949 E.00081
G3 X74.139 Y91.115 I-1.245 J-.856 E.10337
G1 X74.139 Y88.877 E.06064
G3 X75.387 Y87.411 I1.513 J.023 E.05656
G3 X77.161 Y88.885 I.258 J1.493 E.07101
G1 X77.161 Y91.123 E.06065
G3 X77.009 Y91.754 I-1.511 J-.03 E.01773
G1 X76.943 Y91.873 E.00367
M204 S250
G1 X76.565 Y91.724 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1888
M204 S5000
G3 X74.54 Y91.105 I-.915 J-.629 E.0706
G1 X74.54 Y88.892 E.05564
G3 X75.457 Y87.806 I1.14 J.033 E.03858
G3 X76.76 Y88.895 I.19 J1.097 E.04855
G1 X76.76 Y91.108 E.05564
G3 X76.597 Y91.673 I-1.11 J-.013 E.01496
M204 S10000
G1 X77.507 Y92.026 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1888
M204 S6000
G1 X77.389 Y92.364 E.00967
G1 X77.389 Y92.635 E.00735
G3 X76.647 Y93.134 I-5.356 J-7.155 E.02425
G3 X73.811 Y91.492 I-.946 J-1.638 E.10745
G1 X73.811 Y88.508 E.08087
G3 X75.839 Y86.616 I1.891 J-.006 E.08438
M73 P66 R2
G3 X76.723 Y86.912 I-.164 J1.959 E.02549
G1 X77.389 Y87.365 E.02184
G1 X77.389 Y87.636 E.00735
G3 X77.589 Y88.507 I-1.978 J.913 E.02438
G1 X77.589 Y91.493 E.0809
G3 X77.536 Y91.939 I-2.116 J-.028 E.01219
G1 X77.526 Y91.97 E.00088
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.364 E-.15842
G1 X77.389 Y92.635 E-.10307
G1 X76.647 Y93.134 E-.33996
G1 X76.389 Y93.259 E-.10874
G1 X76.264 Y93.297 E-.04981
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.105 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1888
M204 S5000
G3 X76.208 Y93.733 I-2.152 J-2.657 E.03432
G3 X73.41 Y91.497 I-.504 J-2.238 E.10331
G1 X73.41 Y88.503 E.07529
G3 X76.94 Y86.575 I2.291 J-.001 E.12342
G1 X77.41 Y86.895 E.0143
G1 X77.41 Y79.203 E.19338
G3 X79.503 Y77.11 I2.101 J.008 E.08257
G1 X104.55 Y77.111 E.62972
G3 X106.59 Y79.203 I-.05 J2.09 E.08133
G1 X106.59 Y82.79 E.09019
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.11051
G2 X105.305 Y77.49 I-.915 J.01 E.03563
G1 X78.695 Y77.49 E.66901
G2 X77.79 Y78.395 I.015 J.92 E.03558
G1 X77.79 Y87.56 E.23042
G3 X77.99 Y88.503 I-2.328 J.986 E.02437
G1 X77.99 Y91.497 E.0753
G3 X77.79 Y92.44 I-2.456 J-.029 E.02438
M73 P67 R2
G1 X77.791 Y101.645 E.23142
G2 X78.695 Y102.51 I.912 J-.047 E.03467
G1 X105.308 Y102.51 E.66907
G2 X106.21 Y101.605 I-.013 J-.916 E.03555
G1 X106.21 Y97.21 E.11051
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.096 J-.003 E.08262
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I.003 J-2.096 E.08262
G1 X77.41 Y93.165 E.19187
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.844 Y93.484 E-.2467
G1 X76.535 Y93.632 E-.1304
G1 X76.208 Y93.733 E-.13004
G1 X75.869 Y93.784 E-.13006
G1 X75.688 Y93.789 E-.06896
G1 X75.547 Y93.774 E-.05384
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

G1 X75.101 Y92.897
G1 Z2.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.334061
G1 F1888
M204 S6000
G3 X74.793 Y92.748 I.68 J-1.801 E.00668
; LINE_WIDTH: 0.286328
G3 X74.546 Y92.561 I.938 J-1.497 E.0051
; LINE_WIDTH: 0.237766
G1 X74.499 Y92.518 E.00084
G3 X74.384 Y92.392 I1.503 J-1.497 E.00227
; LINE_WIDTH: 0.193867
G3 X74.262 Y92.227 I1.967 J-1.575 E.00213
; LINE_WIDTH: 0.152838
G3 X74.169 Y92.065 I1.238 J-.819 E.00144
; LINE_WIDTH: 0.108047
G1 X74.085 Y91.864 E.00105
M204 S10000
G1 X75.101 Y92.897 F42000
; LINE_WIDTH: 0.380529
G1 F1888
M204 S6000
G2 X76.132 Y92.935 I.575 J-1.561 E.02368
G2 X77.205 Y92.265 I-1.008 J-2.806 E.02878
M204 S10000
G1 X76.892 Y92.722 F42000
; LINE_WIDTH: 0.337749
G1 F1888
M204 S6000
G1 X77.033 Y92.355 E.00778
; LINE_WIDTH: 0.305592
G3 X77.065 Y92.278 I.433 J.134 E.00148
; LINE_WIDTH: 0.259318
G1 X77.15 Y92.132 E.00248
; LINE_WIDTH: 0.226743
G1 X77.19 Y92.05 E.00114
; LINE_WIDTH: 0.200325
G2 X77.263 Y91.883 I-2.804 J-1.313 E.00198
; LINE_WIDTH: 0.155203
G2 X77.327 Y91.654 I-2.558 J-.841 E.00187
; LINE_WIDTH: 0.106543
G2 X77.358 Y91.438 I-1.539 J-.329 E.00103
M204 S10000
G1 X77.358 Y88.552 F42000
; LINE_WIDTH: 0.107327
G1 F1888
M204 S6000
G2 X77.326 Y88.346 I-1.921 J.188 E.00099
; LINE_WIDTH: 0.150248
G2 X77.275 Y88.158 I-1.968 J.435 E.00148
; LINE_WIDTH: 0.194863
G1 X77.19 Y87.95 E.00235
; LINE_WIDTH: 0.226968
G1 X77.151 Y87.871 E.00111
; LINE_WIDTH: 0.258369
G1 X77.066 Y87.72 E.00253
; LINE_WIDTH: 0.297332
G3 X76.842 Y87.244 I3.47 J-1.925 E.00903
M204 S10000
G1 X77.21 Y87.748 F42000
; LINE_WIDTH: 0.381055
G1 F1888
M204 S6000
G2 X76.105 Y87.056 I-2.019 J1.996 E.02974
G1 X75.783 Y87.003 E.00737
G2 X75.08 Y87.11 I-.07 J1.904 E.01618
; LINE_WIDTH: 0.333717
G1 X75.042 Y87.126 E.0008
G2 X74.8 Y87.247 I.869 J2.022 E.00528
; LINE_WIDTH: 0.287334
G2 X74.55 Y87.436 I.861 J1.4 E.00518
; LINE_WIDTH: 0.242145
G2 X74.407 Y87.582 I1.081 J1.209 E.00277
; LINE_WIDTH: 0.203868
G1 X74.294 Y87.726 E.00202
; LINE_WIDTH: 0.163904
G2 X74.188 Y87.898 I2.508 J1.669 E.00171
; LINE_WIDTH: 0.114822
G1 X74.184 Y87.905 E.00004
G2 X74.085 Y88.133 I2.418 J1.191 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X74.184 Y87.905 E-.73701
G1 X74.188 Y87.898 E-.02299
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/30
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.32 I-1.008 J.682 P1  F42000
G1 X76.915 Y91.926 Z3.32
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1884
M204 S6000
G1 X76.895 Y91.949 E.00082
G3 X74.139 Y91.115 I-1.245 J-.856 E.10335
G1 X74.139 Y88.877 E.06065
G3 X75.395 Y87.41 I1.51 J.022 E.05677
G3 X77.161 Y88.884 I.251 J1.493 E.07079
M73 P68 R2
G1 X77.161 Y91.123 E.06066
G3 X77.009 Y91.754 I-1.511 J-.03 E.01773
G1 X76.943 Y91.873 E.00368
M204 S250
G1 X76.565 Y91.724 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1884
M204 S5000
G3 X74.54 Y91.105 I-.915 J-.629 E.07059
G1 X74.54 Y88.892 E.05565
G3 X75.46 Y87.806 I1.11 J.008 E.03884
G3 X76.76 Y88.895 I.187 J1.097 E.04847
G1 X76.76 Y91.108 E.05565
G3 X76.597 Y91.673 I-1.11 J-.013 E.01497
M204 S10000
G1 X77.507 Y92.026 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1884
M204 S6000
G1 X77.389 Y92.364 E.00969
G1 X77.389 Y92.635 E.00734
G3 X76.648 Y93.134 I-5.318 J-7.096 E.02424
G3 X73.811 Y91.492 I-.946 J-1.637 E.10746
G1 X73.811 Y88.512 E.08076
G3 X75.839 Y86.616 I1.894 J-.006 E.08445
G3 X76.723 Y86.912 I-.164 J1.959 E.0255
G1 X77.389 Y87.365 E.02184
G1 X77.389 Y87.636 E.00734
G3 X77.589 Y88.507 I-1.975 J.912 E.02438
G1 X77.589 Y91.493 E.0809
G3 X77.535 Y91.942 I-2.119 J-.028 E.01228
G1 X77.526 Y91.969 E.00078
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.364 E-.15869
G1 X77.389 Y92.635 E-.10297
G1 X76.648 Y93.134 E-.33981
G1 X76.39 Y93.258 E-.10879
G1 X76.265 Y93.297 E-.04974
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.105 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1884
M204 S5000
G3 X76.208 Y93.733 I-2.151 J-2.655 E.03431
G3 X73.41 Y91.497 I-.504 J-2.238 E.10331
G1 X73.41 Y88.504 E.07526
G3 X76.94 Y86.575 I2.293 J.001 E.12339
G1 X77.41 Y86.895 E.01428
G1 X77.41 Y79.203 E.19338
G3 X79.503 Y77.11 I2.096 J.003 E.08262
G1 X104.546 Y77.111 E.62961
G3 X106.59 Y79.203 I-.051 J2.095 E.08139
G1 X106.59 Y82.79 E.09019
M73 P68 R1
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.1105
G2 X105.305 Y77.49 I-.934 J.029 E.03544
G1 X78.695 Y77.49 E.66903
G2 X77.79 Y78.395 I.007 J.912 E.03566
G1 X77.79 Y87.56 E.23042
M73 P69 R1
G3 X77.99 Y88.503 I-2.323 J.985 E.02437
G1 X77.99 Y91.497 E.0753
G3 X77.79 Y92.44 I-2.458 J-.029 E.02438
G1 X77.791 Y101.645 E.23142
G2 X78.695 Y102.51 I.912 J-.047 E.03466
G1 X105.308 Y102.51 E.6691
G2 X106.21 Y101.605 I-.031 J-.933 E.03538
G1 X106.21 Y97.21 E.1105
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.092 J.001 E.08267
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I-.001 J-2.092 E.08267
G1 X77.41 Y93.165 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.844 Y93.483 E-.24658
G1 X76.535 Y93.632 E-.13052
G1 X76.208 Y93.733 E-.12989
G1 X75.87 Y93.784 E-.13004
G1 X75.684 Y93.789 E-.07064
G1 X75.547 Y93.774 E-.05232
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

G1 X75.097 Y92.895
G1 Z3.08
M73 P70 R1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.333904
G1 F1884
M204 S6000
G3 X74.794 Y92.748 I.691 J-1.817 E.0066
; LINE_WIDTH: 0.286395
G3 X74.546 Y92.561 I.946 J-1.508 E.00511
; LINE_WIDTH: 0.237791
G1 X74.499 Y92.518 E.00085
G3 X74.384 Y92.392 I1.44 J-1.44 E.00227
; LINE_WIDTH: 0.193471
G3 X74.26 Y92.224 I1.945 J-1.555 E.00216
; LINE_WIDTH: 0.152524
G3 X74.169 Y92.065 I1.229 J-.811 E.00141
; LINE_WIDTH: 0.108004
G1 X74.085 Y91.863 E.00105
M204 S10000
G1 X75.097 Y92.895 F42000
; LINE_WIDTH: 0.380214
G1 F1884
M204 S6000
G2 X75.687 Y93 I.589 J-1.609 E.01357
G2 X77.003 Y92.43 I-.121 J-2.084 E.033
G1 X77.021 Y92.389 E.00102
; LINE_WIDTH: 0.331873
G1 X77.044 Y92.324 E.00133
; LINE_WIDTH: 0.296587
G1 X77.065 Y92.278 E.00087
; LINE_WIDTH: 0.259393
G1 X77.15 Y92.132 E.00248
; LINE_WIDTH: 0.226711
G1 X77.19 Y92.05 E.00115
; LINE_WIDTH: 0.200278
G2 X77.263 Y91.882 I-2.832 J-1.326 E.00197
; LINE_WIDTH: 0.155234
G2 X77.327 Y91.654 I-2.627 J-.859 E.00187
; LINE_WIDTH: 0.106616
G2 X77.358 Y91.438 I-1.532 J-.329 E.00103
M204 S10000
G1 X77.358 Y88.552 F42000
; LINE_WIDTH: 0.107397
G1 F1884
M204 S6000
G2 X77.326 Y88.345 I-1.898 J.185 E.001
; LINE_WIDTH: 0.15018
G2 X77.276 Y88.159 I-1.945 J.429 E.00145
; LINE_WIDTH: 0.194598
G1 X77.191 Y87.95 E.00236
; LINE_WIDTH: 0.226903
G1 X77.151 Y87.871 E.00112
; LINE_WIDTH: 0.258372
G1 X77.066 Y87.72 E.00252
; LINE_WIDTH: 0.297351
G3 X76.842 Y87.244 I3.395 J-1.89 E.00903
M204 S10000
G1 X77.21 Y87.748 F42000
; LINE_WIDTH: 0.380941
G1 F1884
M204 S6000
G2 X76.105 Y87.056 I-2.019 J1.995 E.02974
G1 X75.783 Y87.003 E.00737
G2 X75.08 Y87.111 I-.093 J1.74 E.01618
; LINE_WIDTH: 0.334119
G2 X74.801 Y87.248 I.54 J1.454 E.00609
; LINE_WIDTH: 0.299781
G1 X74.672 Y87.336 E.0027
; LINE_WIDTH: 0.269241
G2 X74.499 Y87.482 I1.281 J1.689 E.00347
; LINE_WIDTH: 0.224572
G2 X74.333 Y87.67 I2.706 J2.558 E.00311
; LINE_WIDTH: 0.177883
G1 X74.326 Y87.679 E.00011
G2 X74.219 Y87.846 I2.358 J1.641 E.00185
; LINE_WIDTH: 0.134482
G1 X74.184 Y87.905 E.00045
G2 X74.135 Y88.009 I1.606 J.813 E.00075
; LINE_WIDTH: 0.102549
G1 X74.085 Y88.132 E.00059
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X74.135 Y88.009 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/30
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.48 I-.993 J.704 P1  F42000
G1 X76.915 Y91.926 Z3.48
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1889
M204 S6000
G1 X76.895 Y91.949 E.00082
G3 X74.139 Y91.115 I-1.245 J-.856 E.10335
G1 X74.139 Y88.877 E.06065
G3 X75.388 Y87.411 I1.551 J.056 E.05629
G3 X77.161 Y88.884 I.258 J1.493 E.071
G1 X77.161 Y91.123 E.06066
G3 X77.009 Y91.754 I-1.511 J-.03 E.01773
G1 X76.943 Y91.873 E.00368
M204 S250
G1 X76.565 Y91.724 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1889
M204 S5000
G3 X74.54 Y91.105 I-.915 J-.629 E.07059
G1 X74.54 Y88.892 E.05565
G3 X75.457 Y87.806 I1.139 J.032 E.03858
G3 X76.76 Y88.895 I.19 J1.097 E.04854
G1 X76.76 Y91.108 E.05565
G3 X76.597 Y91.673 I-1.11 J-.013 E.01497
M204 S10000
G1 X77.511 Y92.015 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1889
M204 S6000
G1 X77.389 Y92.364 E.01001
G1 X77.389 Y92.635 E.00734
G3 X76.643 Y93.137 I-5.375 J-7.179 E.02439
G3 X73.811 Y91.488 I-.942 J-1.638 E.10746
G1 X73.811 Y88.508 E.08076
G3 X75.842 Y86.616 I1.892 J-.004 E.08442
G3 X76.723 Y86.912 I-.164 J1.951 E.02544
G1 X77.389 Y87.365 E.02183
G1 X77.389 Y87.636 E.00734
G3 X77.589 Y88.507 I-1.972 J.911 E.02439
G1 X77.589 Y91.493 E.0809
G3 X77.535 Y91.943 I-2.12 J-.028 E.01232
G1 X77.53 Y91.958 E.00043
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.364 E-.16313
G1 X77.389 Y92.635 E-.10292
G1 X76.643 Y93.137 E-.34196
G1 X76.389 Y93.259 E-.10715
G1 X76.277 Y93.297 E-.04485
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.105 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1889
M204 S5000
G3 X76.208 Y93.733 I-2.152 J-2.657 E.03433
G3 X73.41 Y91.496 I-.506 J-2.235 E.10339
G1 X73.41 Y88.503 E.07526
G3 X76.94 Y86.575 I2.296 J.009 E.12323
G1 X77.41 Y86.895 E.01428
G1 X77.41 Y79.203 E.19339
G3 X79.503 Y77.11 I2.092 J-.001 E.08267
G1 X104.541 Y77.111 E.6295
G3 X106.59 Y79.203 I-.046 J2.095 E.0815
G1 X106.59 Y82.79 E.09019
M73 P71 R1
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.1105
G2 X105.305 Y77.49 I-.915 J.01 E.03564
G1 X78.695 Y77.49 E.66901
G2 X77.79 Y78.395 I.018 J.923 E.03556
G1 X77.79 Y87.56 E.23042
G3 X77.99 Y88.503 I-2.318 J.984 E.02438
G1 X77.99 Y91.497 E.07529
G3 X77.79 Y92.44 I-2.458 J-.029 E.02439
G1 X77.791 Y101.645 E.23142
G2 X78.695 Y102.51 I.911 J-.047 E.03467
G1 X105.308 Y102.51 E.66907
G2 X106.21 Y101.605 I-.012 J-.915 E.03558
G1 X106.21 Y97.21 E.1105
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.092 J.001 E.08267
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I-.001 J-2.092 E.08267
G1 X77.41 Y93.165 E.19188
; WIPE_START
M73 P72 R1
G1 F11668.197
M204 S6000
G1 X76.94 Y93.425 E-.20391
G1 X76.743 Y93.539 E-.0867
G1 X76.535 Y93.632 E-.08667
G1 X76.208 Y93.733 E-.13002
G1 X75.755 Y93.789 E-.17321
G1 X75.546 Y93.779 E-.07949
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

G1 X75.08 Y92.889
G1 Z3.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.333203
G1 F1889
M204 S6000
G1 X74.954 Y92.836 E.00267
G3 X74.796 Y92.75 I1.13 J-2.276 E.00351
; LINE_WIDTH: 0.286854
G3 X74.55 Y92.565 I.916 J-1.473 E.00508
; LINE_WIDTH: 0.238267
G1 X74.384 Y92.392 E.00319
; LINE_WIDTH: 0.197306
G3 X74.276 Y92.248 I2.117 J-1.696 E.00191
; LINE_WIDTH: 0.153455
G3 X74.163 Y92.053 I1.674 J-1.096 E.00175
; LINE_WIDTH: 0.10691
G3 X74.085 Y91.865 I1.538 J-.75 E.00096
M204 S10000
G1 X75.08 Y92.889 F42000
; LINE_WIDTH: 0.380258
G1 F1889
M204 S6000
G2 X76.102 Y92.944 I.597 J-1.581 E.02344
G2 X77.205 Y92.264 I-.952 J-2.781 E.02946
M204 S10000
G1 X76.892 Y92.722 F42000
; LINE_WIDTH: 0.337574
G1 F1889
M204 S6000
G1 X77.034 Y92.355 E.00778
; LINE_WIDTH: 0.305613
G3 X77.065 Y92.278 I.431 J.133 E.00147
; LINE_WIDTH: 0.259449
G1 X77.15 Y92.132 E.00248
; LINE_WIDTH: 0.226693
G1 X77.191 Y92.049 E.00115
; LINE_WIDTH: 0.200273
G2 X77.263 Y91.883 I-2.849 J-1.333 E.00196
; LINE_WIDTH: 0.155287
G2 X77.327 Y91.655 I-2.695 J-.878 E.00187
; LINE_WIDTH: 0.106681
G2 X77.358 Y91.438 I-1.517 J-.328 E.00103
M204 S10000
G1 X77.358 Y88.552 F42000
; LINE_WIDTH: 0.107399
G1 F1889
M204 S6000
G2 X77.326 Y88.345 I-1.887 J.183 E.00099
; LINE_WIDTH: 0.145312
G1 X77.288 Y88.197 E.00111
; LINE_WIDTH: 0.182637
G2 X77.223 Y88.02 I-2.088 J.668 E.00182
; LINE_WIDTH: 0.21943
G2 X77.151 Y87.871 I-3.578 J1.649 E.002
; LINE_WIDTH: 0.258405
G1 X77.066 Y87.72 E.00253
; LINE_WIDTH: 0.297433
G3 X76.841 Y87.244 I3.391 J-1.89 E.00904
M204 S10000
G1 X77.21 Y87.748 F42000
; LINE_WIDTH: 0.381203
G1 F1889
M204 S6000
G2 X76.126 Y87.062 I-2.038 J2.019 E.02927
G2 X75.094 Y87.106 I-.448 J1.625 E.02372
; LINE_WIDTH: 0.333808
G1 X75.042 Y87.125 E.0011
G2 X74.793 Y87.251 I1.212 J2.701 E.00544
; LINE_WIDTH: 0.286617
G2 X74.547 Y87.438 I1.052 J1.645 E.00509
; LINE_WIDTH: 0.23987
G2 X74.39 Y87.6 I3.167 J3.219 E.00302
; LINE_WIDTH: 0.193977
G2 X74.258 Y87.779 I2.13 J1.705 E.00231
; LINE_WIDTH: 0.148928
G2 X74.152 Y87.969 I2.171 J1.334 E.00162
; LINE_WIDTH: 0.103899
G1 X74.15 Y87.974 E.00002
G2 X74.084 Y88.135 I2.347 J1.053 E.00079
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X74.15 Y87.974 E-.73712
G1 X74.152 Y87.969 E-.02288
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/30
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.64 I-.998 J.697 P1  F42000
G1 X76.915 Y91.926 Z3.64
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1884
M204 S6000
G1 X76.898 Y91.951 E.00081
G3 X74.139 Y91.115 I-1.248 J-.852 E.10365
G1 X74.139 Y88.877 E.06064
G3 X75.462 Y87.4 I1.507 J.019 E.05862
G3 X77.161 Y88.885 I.185 J1.503 E.06897
G1 X77.161 Y91.123 E.06065
G3 X77.011 Y91.755 I-1.511 J-.024 E.01774
G1 X76.944 Y91.874 E.00368
M204 S250
G1 X76.567 Y91.725 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1884
M204 S5000
G3 X74.54 Y91.105 I-.917 J-.626 E.07079
G1 X74.54 Y88.892 E.05564
G3 X75.512 Y87.798 I1.109 J.007 E.04017
G3 X76.76 Y88.895 I.135 J1.104 E.04716
G1 X76.76 Y91.108 E.05564
G3 X76.599 Y91.674 I-1.11 J-.009 E.01498
M204 S10000
G1 X77.511 Y92.015 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1884
M204 S6000
G1 X77.389 Y92.364 E.01001
G1 X77.389 Y92.635 E.00734
G3 X76.643 Y93.137 I-5.395 J-7.21 E.02438
G3 X73.811 Y91.492 I-.941 J-1.641 E.10729
G1 X73.811 Y88.508 E.08087
G3 X75.842 Y86.617 I1.897 J.001 E.08438
G3 X76.723 Y86.912 I-.165 J1.953 E.02542
G1 X77.389 Y87.365 E.02183
G1 X77.389 Y87.636 E.00734
G3 X77.589 Y88.507 I-1.968 J.91 E.02438
G1 X77.589 Y91.493 E.08093
G3 X77.534 Y91.945 I-2.122 J-.029 E.01237
G1 X77.53 Y91.958 E.00036
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.364 E-.16321
G1 X77.389 Y92.635 E-.10291
G1 X76.643 Y93.137 E-.3418
G1 X76.389 Y93.259 E-.10729
G1 X76.277 Y93.297 E-.0448
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.105 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1884
M204 S5000
G3 X76.208 Y93.733 I-2.152 J-2.657 E.03433
G3 X73.41 Y91.497 I-.503 J-2.239 E.10329
G1 X73.41 Y88.503 E.07529
G3 X76.941 Y86.575 I2.291 J-.001 E.12344
G1 X77.41 Y86.895 E.01428
G1 X77.41 Y79.203 E.19338
G3 X79.503 Y77.11 I2.096 J.003 E.08262
G1 X104.537 Y77.111 E.62939
G3 X106.59 Y79.203 I-.042 J2.095 E.08161
M73 P73 R1
G1 X106.59 Y82.79 E.09018
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.11051
G2 X105.305 Y77.49 I-.915 J.01 E.03563
G1 X78.691 Y77.49 E.6691
G2 X77.79 Y78.395 I.011 J.912 E.03557
G1 X77.79 Y87.56 E.23042
G3 X77.99 Y88.502 I-2.314 J.983 E.02437
G1 X77.99 Y91.498 E.07531
G3 X77.79 Y92.44 I-2.46 J-.03 E.02438
G1 X77.791 Y101.645 E.23142
G2 X78.695 Y102.51 I.911 J-.047 E.03467
G1 X105.308 Y102.51 E.66907
G2 X106.21 Y101.605 I-.01 J-.912 E.03559
G1 X106.21 Y97.21 E.11051
G1 X106.59 Y97.21 E.00955
M73 P74 R1
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.092 J.001 E.08267
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I-.001 J-2.092 E.08267
G1 X77.41 Y93.165 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.941 Y93.425 E-.20384
G1 X76.743 Y93.539 E-.08673
G1 X76.428 Y93.671 E-.12996
G1 X76.208 Y93.733 E-.08677
G1 X75.983 Y93.772 E-.08658
G1 X75.642 Y93.789 E-.13002
G1 X75.547 Y93.777 E-.0361
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

G1 X75.073 Y92.886
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.332965
G1 F1884
M204 S6000
G1 X74.96 Y92.838 E.0024
G3 X74.796 Y92.75 I1.184 J-2.383 E.00363
; LINE_WIDTH: 0.286939
G3 X74.551 Y92.565 I.912 J-1.468 E.00506
; LINE_WIDTH: 0.238181
G1 X74.507 Y92.525 E.00079
G3 X74.384 Y92.392 I1.529 J-1.542 E.00241
; LINE_WIDTH: 0.190693
G3 X74.245 Y92.2 I1.601 J-1.306 E.00241
; LINE_WIDTH: 0.147334
G1 X74.163 Y92.053 E.00124
; LINE_WIDTH: 0.106566
G3 X74.082 Y91.858 I1.499 J-.738 E.00099
M204 S10000
G1 X75.073 Y92.886 F42000
; LINE_WIDTH: 0.379954
G1 F1884
M204 S6000
G2 X75.698 Y92.999 I.606 J-1.567 E.0144
G2 X77.003 Y92.43 I-.138 J-2.093 E.03271
G1 X77.021 Y92.388 E.00102
; LINE_WIDTH: 0.33184
G1 X77.044 Y92.324 E.00132
; LINE_WIDTH: 0.281209
G3 X77.108 Y92.205 I.648 J.268 E.00218
; LINE_WIDTH: 0.246927
G1 X77.15 Y92.132 E.00117
; LINE_WIDTH: 0.226575
G1 X77.191 Y92.048 E.00116
; LINE_WIDTH: 0.200193
G2 X77.263 Y91.882 I-2.897 J-1.353 E.00195
; LINE_WIDTH: 0.155352
G2 X77.326 Y91.656 I-2.808 J-.909 E.00186
; LINE_WIDTH: 0.106743
G2 X77.358 Y91.438 I-1.516 J-.328 E.00104
M204 S10000
G1 X77.358 Y88.552 F42000
; LINE_WIDTH: 0.107533
G1 F1884
M204 S6000
G2 X77.326 Y88.344 I-1.887 J.183 E.001
; LINE_WIDTH: 0.149927
G2 X77.277 Y88.163 I-1.918 J.422 E.00141
; LINE_WIDTH: 0.194028
G1 X77.191 Y87.952 E.00238
; LINE_WIDTH: 0.226789
G1 X77.151 Y87.871 E.00114
; LINE_WIDTH: 0.258442
G1 X77.066 Y87.72 E.00252
; LINE_WIDTH: 0.297505
G3 X76.841 Y87.244 I3.383 J-1.887 E.00904
M204 S10000
G1 X77.21 Y87.749 F42000
; LINE_WIDTH: 0.381062
G1 F1884
M204 S6000
G2 X76.123 Y87.061 I-2.034 J2.014 E.02933
G2 X75.092 Y87.108 I-.444 J1.595 E.02371
; LINE_WIDTH: 0.334638
G1 X74.956 Y87.163 E.00287
G2 X74.797 Y87.251 I1.195 J2.352 E.00357
; LINE_WIDTH: 0.299044
G1 X74.672 Y87.336 E.0026
; LINE_WIDTH: 0.269627
G2 X74.505 Y87.477 I1.105 J1.474 E.00335
; LINE_WIDTH: 0.224981
G2 X74.332 Y87.671 I3.459 J3.256 E.00322
; LINE_WIDTH: 0.174294
G1 X74.326 Y87.68 E.0001
G2 X74.201 Y87.873 I2.745 J1.9 E.0021
; LINE_WIDTH: 0.129524
G1 X74.132 Y88.017 E.00099
; LINE_WIDTH: 0.101498
G1 X74.084 Y88.134 E.00056
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X74.132 Y88.017 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/30
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.8 I-.991 J.706 P1  F42000
G1 X76.915 Y91.926 Z3.8
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1889
M204 S6000
G1 X76.898 Y91.951 E.00081
G3 X74.139 Y91.115 I-1.248 J-.852 E.10363
G1 X74.139 Y88.877 E.06065
G3 X75.387 Y87.411 I1.511 J.021 E.05657
G3 X77.161 Y88.884 I.258 J1.493 E.07101
G1 X77.161 Y91.123 E.06066
G3 X77.011 Y91.755 I-1.511 J-.024 E.01774
G1 X76.944 Y91.874 E.00368
M204 S250
G1 X76.567 Y91.725 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1889
M204 S5000
G3 X74.54 Y91.105 I-.917 J-.626 E.07078
G1 X74.54 Y88.892 E.05565
G3 X75.457 Y87.806 I1.11 J.007 E.03878
G3 X76.76 Y88.895 I.19 J1.097 E.04854
G1 X76.76 Y91.108 E.05565
G3 X76.599 Y91.674 I-1.11 J-.009 E.01498
M204 S10000
G1 X77.512 Y92.015 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1889
M204 S6000
G1 X77.389 Y92.364 E.01003
G1 X77.389 Y92.634 E.00733
G3 X76.643 Y93.137 I-5.37 J-7.17 E.02438
G3 X73.811 Y91.489 I-.941 J-1.64 E.10741
G1 X73.811 Y88.511 E.08069
G3 X75.84 Y86.616 I1.891 J-.009 E.0845
G3 X76.724 Y86.912 I-.165 J1.959 E.02549
G1 X77.389 Y87.366 E.02182
G1 X77.389 Y87.636 E.00733
G3 X77.589 Y88.507 I-1.965 J.91 E.02438
G1 X77.589 Y91.493 E.08093
G3 X77.534 Y91.948 I-2.124 J-.03 E.01242
G1 X77.53 Y91.958 E.00029
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.364 E-.16344
G1 X77.389 Y92.634 E-.10281
G1 X76.643 Y93.137 E-.34177
G1 X76.386 Y93.26 E-.10847
G1 X76.276 Y93.294 E-.04351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.105 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P75 R1
G1 F1889
M204 S5000
G3 X76.207 Y93.733 I-2.151 J-2.654 E.03435
G3 X73.41 Y91.496 I-.502 J-2.239 E.10329
G1 X73.41 Y88.504 E.07524
G3 X76.941 Y86.575 I2.291 J-.003 E.12347
G1 X77.41 Y86.895 E.01427
G1 X77.41 Y79.203 E.19339
G3 X79.503 Y77.11 I2.092 J-.001 E.08267
G1 X104.532 Y77.111 E.62928
G3 X106.59 Y79.203 I-.033 J2.09 E.08177
G1 X106.59 Y82.79 E.09018
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.11049
G2 X105.305 Y77.49 I-.915 J.01 E.03563
G1 X78.695 Y77.49 E.66903
G2 X77.79 Y78.395 I.007 J.912 E.03566
G1 X77.79 Y87.56 E.23042
G3 X77.99 Y88.502 I-2.309 J.983 E.02437
G1 X77.99 Y91.498 E.07531
G3 X77.79 Y92.44 I-2.462 J-.03 E.02438
G1 X77.791 Y101.645 E.23142
G2 X78.695 Y102.51 I.911 J-.047 E.03466
G1 X105.308 Y102.51 E.66909
G2 X106.21 Y101.605 I-.013 J-.915 E.03557
G1 X106.21 Y97.21 E.11049
M73 P76 R1
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.096 J-.003 E.08262
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I.003 J-2.096 E.08262
G1 X77.41 Y93.165 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.941 Y93.425 E-.20376
G1 X76.743 Y93.539 E-.08676
G1 X76.428 Y93.671 E-.12995
G1 X76.207 Y93.733 E-.08716
G1 X75.756 Y93.789 E-.17281
G1 X75.546 Y93.784 E-.07956
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

G1 X75.133 Y92.909
G1 Z3.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.336469
G1 F1889
M204 S6000
G3 X74.796 Y92.75 I.645 J-1.804 E.00734
; LINE_WIDTH: 0.286529
G3 X74.548 Y92.562 I.919 J-1.476 E.00513
; LINE_WIDTH: 0.237742
G1 X74.507 Y92.524 E.00074
G3 X74.384 Y92.392 I1.56 J-1.57 E.00241
; LINE_WIDTH: 0.193894
G3 X74.261 Y92.225 I1.719 J-1.398 E.00215
; LINE_WIDTH: 0.156596
G3 X74.185 Y92.096 I1.41 J-.914 E.0012
; LINE_WIDTH: 0.119857
G3 X74.111 Y91.936 I1.802 J-.932 E.00098
; LINE_WIDTH: 0.0930479
G1 X74.084 Y91.862 E.0003
M204 S10000
G1 X75.133 Y92.909 F42000
; LINE_WIDTH: 0.380893
G1 F1889
M204 S6000
G2 X76.179 Y92.922 I.544 J-1.638 E.02401
G2 X77.205 Y92.264 I-1.182 J-2.972 E.02772
M204 S10000
G1 X76.892 Y92.722 F42000
; LINE_WIDTH: 0.336239
G1 F1889
M204 S6000
G2 X77.044 Y92.324 I-6.211 J-2.606 E.00838
; LINE_WIDTH: 0.281304
G3 X77.108 Y92.205 I.65 J.269 E.00218
; LINE_WIDTH: 0.246982
G1 X77.15 Y92.132 E.00117
; LINE_WIDTH: 0.226551
G1 X77.191 Y92.048 E.00117
; LINE_WIDTH: 0.20018
G2 X77.263 Y91.883 I-2.887 J-1.349 E.00195
; LINE_WIDTH: 0.155443
G2 X77.326 Y91.656 I-2.992 J-.96 E.00186
; LINE_WIDTH: 0.10682
G2 X77.358 Y91.438 I-1.507 J-.328 E.00104
M204 S10000
G1 X77.358 Y88.552 F42000
; LINE_WIDTH: 0.107636
G1 F1889
M204 S6000
G2 X77.326 Y88.343 I-1.875 J.181 E.00101
; LINE_WIDTH: 0.14986
G2 X77.278 Y88.165 I-1.904 J.419 E.00139
; LINE_WIDTH: 0.193801
G1 X77.191 Y87.952 E.00239
; LINE_WIDTH: 0.226738
G1 X77.151 Y87.871 E.00113
; LINE_WIDTH: 0.258448
G1 X77.066 Y87.72 E.00253
; LINE_WIDTH: 0.297571
G3 X76.841 Y87.244 I3.425 J-1.906 E.00904
M204 S10000
G1 X77.21 Y87.749 F42000
; LINE_WIDTH: 0.381697
G1 F1889
M204 S6000
G2 X76.106 Y87.056 I-2.021 J1.997 E.02979
G1 X75.783 Y87.003 E.0074
G2 X75.145 Y87.088 I-.089 J1.768 E.01466
; LINE_WIDTH: 0.342403
G1 X75.041 Y87.126 E.00221
G2 X74.861 Y87.213 I.771 J1.819 E.00404
; LINE_WIDTH: 0.305817
G1 X74.672 Y87.336 E.00399
; LINE_WIDTH: 0.274195
G1 X74.551 Y87.434 E.00244
; LINE_WIDTH: 0.240314
G2 X74.391 Y87.599 I1.545 J1.656 E.00309
; LINE_WIDTH: 0.192501
G1 X74.382 Y87.61 E.00014
G2 X74.245 Y87.8 I1.864 J1.494 E.00242
; LINE_WIDTH: 0.147567
G1 X74.165 Y87.947 E.00124
; LINE_WIDTH: 0.10695
G1 X74.082 Y88.142 E.001
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X74.165 Y87.947 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/30
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.96 I-1.009 J.68 P1  F42000
G1 X76.881 Y91.975 Z3.96
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1889
M204 S6000
G1 X76.759 Y92.119 E.00509
G3 X74.139 Y91.115 I-1.109 J-1.026 E.09745
G1 X74.139 Y88.877 E.06065
G3 X75.388 Y87.411 I1.514 J.024 E.05656
G3 X77.161 Y88.884 I.258 J1.493 E.071
G1 X77.161 Y91.123 E.06066
G3 X76.912 Y91.924 I-1.511 J-.03 E.02303
M204 S250
G1 X76.565 Y91.724 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1889
M204 S5000
G3 X74.54 Y91.105 I-.915 J-.629 E.07059
G1 X74.54 Y88.892 E.05565
G3 X75.457 Y87.806 I1.111 J.008 E.03877
G3 X76.76 Y88.895 I.19 J1.097 E.04854
G1 X76.76 Y91.108 E.05565
M73 P77 R1
G3 X76.597 Y91.673 I-1.11 J-.013 E.01496
M204 S10000
G1 X77.512 Y92.014 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1889
M204 S6000
G1 X77.389 Y92.364 E.01004
G1 X77.389 Y92.634 E.00733
G3 X76.643 Y93.137 I-5.408 J-7.226 E.02438
G3 X73.811 Y91.492 I-.941 J-1.641 E.1073
G1 X73.811 Y88.508 E.08087
G3 X75.837 Y86.616 I1.89 J-.006 E.08432
G3 X76.724 Y86.912 I-.156 J1.942 E.02558
G1 X77.389 Y87.366 E.02182
G1 X77.389 Y87.636 E.00733
G3 X77.589 Y88.507 I-1.962 J.909 E.02439
G1 X77.589 Y91.493 E.08092
G3 X77.533 Y91.95 I-2.125 J-.03 E.01249
G1 X77.531 Y91.957 E.00022
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.364 E-.16355
G1 X77.389 Y92.634 E-.10278
G1 X76.643 Y93.137 E-.34175
G1 X76.389 Y93.259 E-.10726
G1 X76.278 Y93.296 E-.04467
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.105 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1889
M204 S5000
G3 X76.208 Y93.733 I-2.152 J-2.656 E.03431
G3 X73.41 Y91.497 I-.504 J-2.239 E.10331
G1 X73.41 Y88.503 E.07529
G3 X76.941 Y86.575 I2.291 J-.001 E.12345
G1 X77.41 Y86.895 E.01427
G1 X77.41 Y79.203 E.19339
G3 X79.503 Y77.11 I2.096 J.003 E.08262
G1 X104.528 Y77.111 E.62916
G3 X106.59 Y79.203 I-.028 J2.09 E.08189
G1 X106.59 Y82.79 E.09018
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.1105
G2 X105.305 Y77.49 I-.915 J.01 E.03564
G1 X78.692 Y77.49 E.6691
G2 X77.79 Y78.395 I.011 J.912 E.03558
G1 X77.79 Y87.56 E.23041
G3 X77.99 Y88.502 I-2.305 J.982 E.02437
G1 X77.99 Y91.498 E.07531
M73 P78 R1
G3 X77.79 Y92.44 I-2.463 J-.03 E.02438
G1 X77.791 Y101.645 E.23141
G2 X78.684 Y102.51 I.911 J-.047 E.03439
G1 X105.308 Y102.51 E.66935
G2 X106.21 Y101.605 I-.012 J-.915 E.03557
G1 X106.21 Y97.21 E.1105
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.096 J-.003 E.08262
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I.003 J-2.096 E.08262
G1 X77.41 Y93.165 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.941 Y93.425 E-.20373
G1 X76.743 Y93.538 E-.08665
G1 X76.535 Y93.632 E-.08675
G1 X76.208 Y93.733 E-.12992
G1 X75.756 Y93.789 E-.17331
G1 X75.546 Y93.779 E-.07964
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

G1 X75.074 Y92.887
G1 Z3.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.333041
G1 F1889
M204 S6000
G1 X74.956 Y92.836 E.0025
G3 X74.796 Y92.75 I1.358 J-2.697 E.00353
; LINE_WIDTH: 0.293717
G3 X74.61 Y92.617 I1.443 J-2.206 E.00387
; LINE_WIDTH: 0.260735
G1 X74.493 Y92.512 E.00232
; LINE_WIDTH: 0.223437
G1 X74.334 Y92.329 E.00299
; LINE_WIDTH: 0.177264
G1 X74.217 Y92.153 E.00197
; LINE_WIDTH: 0.133759
G1 X74.185 Y92.096 E.00043
G3 X74.131 Y91.984 I1.842 J-.953 E.00081
; LINE_WIDTH: 0.097899
G1 X74.082 Y91.858 E.00056
M204 S10000
G1 X75.074 Y92.887 F42000
; LINE_WIDTH: 0.38016
G1 F1889
M204 S6000
G2 X76.177 Y92.923 I.604 J-1.574 E.02535
G2 X77.205 Y92.264 I-1.114 J-2.871 E.02772
M204 S10000
G1 X76.892 Y92.722 F42000
; LINE_WIDTH: 0.336147
G1 F1889
M204 S6000
G2 X77.044 Y92.324 I-6.196 J-2.601 E.00837
; LINE_WIDTH: 0.281335
G3 X77.108 Y92.205 I.649 J.269 E.00218
; LINE_WIDTH: 0.246974
G1 X77.15 Y92.132 E.00118
; LINE_WIDTH: 0.226515
G1 X77.191 Y92.048 E.00117
; LINE_WIDTH: 0.200209
G2 X77.263 Y91.883 I-2.941 J-1.373 E.00194
; LINE_WIDTH: 0.155514
G2 X77.326 Y91.657 I-3.193 J-1.016 E.00185
; LINE_WIDTH: 0.106883
G2 X77.358 Y91.438 I-1.506 J-.329 E.00105
M204 S10000
G1 X77.358 Y88.552 F42000
; LINE_WIDTH: 0.107689
G1 F1889
M204 S6000
G2 X77.326 Y88.343 I-1.868 J.18 E.00101
; LINE_WIDTH: 0.149714
G2 X77.278 Y88.167 I-1.882 J.413 E.00137
; LINE_WIDTH: 0.193491
G1 X77.192 Y87.952 E.0024
; LINE_WIDTH: 0.226671
G1 X77.151 Y87.871 E.00114
; LINE_WIDTH: 0.258455
G1 X77.066 Y87.72 E.00253
; LINE_WIDTH: 0.297602
G3 X76.841 Y87.244 I3.393 J-1.893 E.00905
M204 S10000
G1 X77.21 Y87.749 F42000
; LINE_WIDTH: 0.381905
G1 F1889
M204 S6000
G2 X76.156 Y87.07 I-2.073 J2.064 E.02864
G2 X75.145 Y87.088 I-.476 J1.61 E.02327
; LINE_WIDTH: 0.339446
G1 X75.042 Y87.126 E.00218
G2 X74.82 Y87.236 I1.308 J2.909 E.00493
; LINE_WIDTH: 0.29918
G1 X74.797 Y87.249 E.00046
G2 X74.645 Y87.356 I.804 J1.313 E.0032
; LINE_WIDTH: 0.264792
G2 X74.494 Y87.487 I1.526 J1.907 E.00301
; LINE_WIDTH: 0.22425
G2 X74.333 Y87.67 I3.617 J3.349 E.00302
; LINE_WIDTH: 0.174328
G1 X74.326 Y87.679 E.00011
G2 X74.202 Y87.873 I2.464 J1.718 E.0021
; LINE_WIDTH: 0.129542
G1 X74.132 Y88.017 E.00099
; LINE_WIDTH: 0.10142
G1 X74.084 Y88.135 E.00056
; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X74.132 Y88.017 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/30
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.12 I-.991 J.706 P1  F42000
M73 P79 R1
G1 X76.915 Y91.926 Z4.12
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1903
M204 S6000
G1 X76.895 Y91.949 E.00082
G3 X74.139 Y91.115 I-1.245 J-.856 E.10336
G1 X74.139 Y88.877 E.06064
G3 X75.388 Y87.411 I1.513 J.023 E.05657
G3 X77.161 Y88.885 I.258 J1.493 E.07101
G1 X77.161 Y91.123 E.06065
G3 X77.008 Y91.754 I-1.511 J-.03 E.01774
G1 X76.943 Y91.873 E.00367
M204 S250
G1 X76.565 Y91.724 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1903
M204 S5000
G3 X74.54 Y91.105 I-.915 J-.629 E.0706
G1 X74.54 Y88.892 E.05564
G3 X75.457 Y87.806 I1.14 J.032 E.03858
G3 X76.76 Y88.895 I.19 J1.097 E.04855
G1 X76.76 Y91.108 E.05564
G3 X76.597 Y91.673 I-1.11 J-.013 E.01497
M204 S10000
G1 X77.512 Y92.014 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1903
M204 S6000
G1 X77.389 Y92.364 E.01005
G1 X77.389 Y92.634 E.00733
G3 X76.644 Y93.137 I-5.391 J-7.2 E.02438
G3 X73.811 Y91.492 I-.942 J-1.64 E.10732
G1 X73.811 Y88.508 E.08087
G3 X75.84 Y86.616 I1.891 J-.006 E.08441
G3 X76.724 Y86.912 I-.165 J1.959 E.02549
G1 X77.389 Y87.366 E.02182
G1 X77.389 Y87.636 E.00733
G3 X77.589 Y88.507 I-1.958 J.908 E.02439
G1 X77.589 Y91.493 E.08092
G3 X77.533 Y91.952 I-2.128 J-.03 E.01255
G1 X77.531 Y91.957 E.00015
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.364 E-.16368
G1 X77.389 Y92.634 E-.10273
G1 X76.644 Y93.137 E-.3417
G1 X76.387 Y93.26 E-.10826
G1 X76.277 Y93.294 E-.04363
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.105 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1903
M204 S5000
G3 X76.208 Y93.733 I-2.151 J-2.655 E.03433
G3 X73.41 Y91.497 I-.503 J-2.239 E.10328
G1 X73.41 Y88.503 E.07529
G3 X76.941 Y86.576 I2.291 J-.001 E.12345
G1 X77.41 Y86.895 E.01426
G1 X77.41 Y79.203 E.19339
G3 X79.503 Y77.11 I2.093 J0 E.08265
G1 X104.524 Y77.111 E.62906
G3 X106.59 Y79.203 I-.037 J2.103 E.08186
G1 X106.59 Y82.79 E.09019
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.11051
G2 X105.305 Y77.49 I-.915 J.01 E.03563
G1 X78.692 Y77.49 E.66909
G2 X77.79 Y78.395 I.011 J.912 E.03558
G1 X77.79 Y87.56 E.23041
M73 P80 R1
G3 X77.99 Y88.502 I-2.3 J.981 E.02438
G1 X77.99 Y91.498 E.07531
G3 X77.79 Y92.44 I-2.465 J-.03 E.02438
G1 X77.791 Y101.645 E.23141
G2 X78.695 Y102.51 I.912 J-.047 E.03467
G1 X105.308 Y102.51 E.66907
G2 X106.21 Y101.605 I-.012 J-.915 E.03556
G1 X106.21 Y97.21 E.11051
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.092 J.001 E.08267
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I.003 J-2.096 E.08262
G1 X77.41 Y93.165 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.941 Y93.425 E-.20368
M73 P81 R1
G1 X76.743 Y93.538 E-.0867
G1 X76.428 Y93.671 E-.12998
G1 X76.208 Y93.733 E-.08704
G1 X75.756 Y93.789 E-.17293
G1 X75.546 Y93.784 E-.07967
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

G1 X75.133 Y92.909
G1 Z3.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.380846
G1 F1903
M204 S6000
G2 X76.179 Y92.922 I.545 J-1.638 E.02402
G2 X77.205 Y92.264 I-1.12 J-2.876 E.02772
M204 S10000
G1 X76.892 Y92.722 F42000
; LINE_WIDTH: 0.336244
G1 F1903
M204 S6000
G2 X77.044 Y92.325 I-6.168 J-2.59 E.00837
; LINE_WIDTH: 0.281437
G3 X77.107 Y92.205 I.651 J.27 E.00218
; LINE_WIDTH: 0.247091
G1 X77.15 Y92.132 E.00117
; LINE_WIDTH: 0.226518
G1 X77.192 Y92.047 E.00119
; LINE_WIDTH: 0.199457
G2 X77.262 Y91.882 I-2.078 J-.982 E.00192
; LINE_WIDTH: 0.155243
G2 X77.326 Y91.658 I-2.106 J-.723 E.00184
; LINE_WIDTH: 0.106959
G2 X77.358 Y91.438 I-1.496 J-.328 E.00105
; WIPE_START
G1 F18000
G1 X77.326 Y91.658 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.133 Y92.909 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.336496
G1 F1903
M204 S6000
G3 X74.797 Y92.75 I.657 J-1.829 E.00733
; LINE_WIDTH: 0.286569
G3 X74.547 Y92.562 I.921 J-1.48 E.00514
; LINE_WIDTH: 0.238292
G1 X74.384 Y92.392 E.00314
; LINE_WIDTH: 0.19756
G3 X74.276 Y92.248 I2.317 J-1.847 E.00191
; LINE_WIDTH: 0.158875
G3 X74.185 Y92.096 I1.463 J-.974 E.00144
; LINE_WIDTH: 0.119812
G3 X74.111 Y91.936 I1.798 J-.93 E.00098
; LINE_WIDTH: 0.0930036
G1 X74.084 Y91.861 E.0003
M204 S10000
G1 X74.082 Y88.137 F42000
; LINE_WIDTH: 0.113724
G1 F1903
M204 S6000
G3 X74.184 Y87.905 I2.843 J1.102 E.00131
; LINE_WIDTH: 0.162531
G3 X74.29 Y87.732 I2.372 J1.337 E.0017
; LINE_WIDTH: 0.209744
G3 X74.45 Y87.533 I1.132 J.746 E.00293
; LINE_WIDTH: 0.256188
G3 X74.611 Y87.383 I1.535 J1.483 E.00318
; LINE_WIDTH: 0.294047
G3 X74.801 Y87.247 I1.04 J1.254 E.00395
; LINE_WIDTH: 0.333773
G3 X75.042 Y87.125 I1.139 J1.957 E.00527
G1 X75.075 Y87.112 E.0007
; LINE_WIDTH: 0.381011
G3 X75.783 Y87.004 I.62 J1.692 E.0163
G1 X76.105 Y87.056 E.00738
G3 X77.21 Y87.749 I-.916 J2.69 E.02973
M204 S10000
G1 X76.841 Y87.244 F42000
; LINE_WIDTH: 0.297657
G1 F1903
M204 S6000
G2 X77.066 Y87.72 I3.594 J-1.405 E.00905
; LINE_WIDTH: 0.258513
G1 X77.151 Y87.871 E.00253
; LINE_WIDTH: 0.226634
G1 X77.192 Y87.953 E.00116
; LINE_WIDTH: 0.193202
G1 X77.279 Y88.169 E.00241
; LINE_WIDTH: 0.149613
G3 X77.326 Y88.342 I-1.826 J.583 E.00135
; LINE_WIDTH: 0.107759
G3 X77.358 Y88.552 I-1.841 J.391 E.00102
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X77.326 Y88.342 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/30
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.28 I-1.209 J-.139 P1  F42000
G1 X76.915 Y91.926 Z4.28
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1898
M204 S6000
G1 X76.898 Y91.951 E.00082
G3 X74.139 Y91.115 I-1.248 J-.852 E.10363
G1 X74.139 Y88.877 E.06065
G3 X75.395 Y87.41 I1.515 J.026 E.05673
G3 X77.161 Y88.885 I.251 J1.493 E.07079
G1 X77.161 Y91.123 E.06066
G3 X77.011 Y91.755 I-1.511 J-.024 E.01775
G1 X76.944 Y91.874 E.00368
M204 S250
G1 X76.567 Y91.725 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1898
M204 S5000
G3 X74.54 Y91.105 I-.917 J-.626 E.07078
G1 X74.54 Y88.892 E.05565
G3 X75.46 Y87.806 I1.112 J.009 E.03883
G3 X76.76 Y88.895 I.188 J1.097 E.04848
G1 X76.76 Y91.108 E.05565
G3 X76.599 Y91.675 I-1.11 J-.009 E.01498
M204 S10000
G1 X77.513 Y92.014 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1898
M204 S6000
G1 X77.389 Y92.364 E.01006
G1 X77.389 Y92.634 E.00732
G3 X76.644 Y93.137 I-5.38 J-7.183 E.02437
G3 X73.811 Y91.49 I-.941 J-1.641 E.10737
G1 X73.811 Y88.51 E.08076
G3 X75.838 Y86.616 I1.891 J-.008 E.08441
G3 X76.724 Y86.912 I-.159 J1.947 E.02556
G1 X77.389 Y87.366 E.02182
G1 X77.389 Y87.636 E.00732
G3 X77.589 Y88.507 I-1.956 J.908 E.0244
G1 X77.589 Y91.493 E.08091
G3 X77.532 Y91.954 I-2.129 J-.03 E.01261
G1 X77.531 Y91.957 E.00008
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.364 E-.16387
G1 X77.389 Y92.634 E-.10264
G1 X76.644 Y93.137 E-.34159
G1 X76.476 Y93.222 E-.07164
G1 X76.277 Y93.295 E-.08026
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.105 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1898
M204 S5000
G3 X76.209 Y93.733 I-2.152 J-2.656 E.03431
G3 X73.41 Y91.497 I-.504 J-2.239 E.10333
G1 X73.41 Y88.503 E.07526
G3 X76.941 Y86.576 I2.291 J-.002 E.12347
G1 X77.41 Y86.895 E.01426
G1 X77.41 Y79.203 E.19339
G3 X79.503 Y77.11 I2.092 J-.001 E.08266
G1 X104.519 Y77.111 E.62895
G3 X106.59 Y79.203 I-.02 J2.091 E.0821
G1 X106.59 Y82.79 E.09019
M73 P82 R1
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.1105
G2 X105.305 Y77.49 I-.915 J.01 E.03563
G1 X78.695 Y77.49 E.66903
G2 X77.79 Y78.395 I.007 J.912 E.03566
G1 X77.79 Y87.56 E.23041
G3 X77.99 Y88.502 I-2.297 J.98 E.02438
G1 X77.99 Y91.498 E.07531
G3 X77.79 Y92.44 I-2.466 J-.031 E.02438
G1 X77.791 Y101.645 E.23141
G2 X78.695 Y102.51 I.911 J-.047 E.03466
G1 X105.308 Y102.51 E.66909
G2 X106.21 Y101.605 I-.01 J-.912 E.03559
G1 X106.21 Y97.21 E.1105
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.096 J-.003 E.08262
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I-.001 J-2.092 E.08267
G1 X77.41 Y93.165 E.19188
; WIPE_START
M73 P83 R1
G1 F11668.197
M204 S6000
G1 X76.941 Y93.424 E-.20358
G1 X76.744 Y93.538 E-.08662
G1 X76.428 Y93.671 E-.13006
G1 X76.209 Y93.733 E-.08675
G1 X75.756 Y93.789 E-.17325
G1 X75.546 Y93.784 E-.07975
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

G1 X75.073 Y92.886
G1 Z4.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.379932
G1 F1898
M204 S6000
G2 X75.699 Y92.999 I.606 J-1.568 E.0144
G2 X77.003 Y92.43 I-.137 J-2.093 E.03271
G1 X77.021 Y92.388 E.00102
; LINE_WIDTH: 0.332052
G1 X77.044 Y92.325 E.00131
; LINE_WIDTH: 0.281537
G3 X77.107 Y92.205 I.652 J.27 E.00218
; LINE_WIDTH: 0.247086
G1 X77.15 Y92.132 E.00118
; LINE_WIDTH: 0.226405
G1 X77.192 Y92.046 E.00119
; LINE_WIDTH: 0.199382
G2 X77.262 Y91.882 I-2.096 J-.989 E.00192
; LINE_WIDTH: 0.155265
G2 X77.326 Y91.658 I-2.099 J-.72 E.00184
; LINE_WIDTH: 0.106991
G2 X77.358 Y91.438 I-1.476 J-.326 E.00105
; WIPE_START
G1 F18000
G1 X77.326 Y91.658 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.073 Y92.886 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.33301
G1 F1898
M204 S6000
G1 X74.95 Y92.833 E.00262
G3 X74.796 Y92.75 I1.37 J-2.704 E.0034
; LINE_WIDTH: 0.293679
G3 X74.61 Y92.617 I1.449 J-2.214 E.00387
; LINE_WIDTH: 0.260691
G1 X74.493 Y92.512 E.00232
; LINE_WIDTH: 0.223538
G1 X74.335 Y92.33 E.00297
; LINE_WIDTH: 0.176538
G1 X74.213 Y92.147 E.00204
; LINE_WIDTH: 0.132978
G1 X74.185 Y92.096 E.00037
G3 X74.131 Y91.984 I1.907 J-.982 E.0008
; LINE_WIDTH: 0.0979171
G1 X74.082 Y91.858 E.00056
M204 S10000
G1 X74.082 Y88.137 F42000
; LINE_WIDTH: 0.100894
G1 F1898
M204 S6000
G1 X74.131 Y88.019 E.00055
; LINE_WIDTH: 0.129592
G1 X74.204 Y87.87 E.00103
; LINE_WIDTH: 0.174906
G3 X74.326 Y87.68 I2.591 J1.531 E.00207
G1 X74.333 Y87.67 E.00011
; LINE_WIDTH: 0.224288
G3 X74.494 Y87.487 I3.58 J2.992 E.00301
; LINE_WIDTH: 0.268469
G3 X74.672 Y87.336 I1.318 J1.367 E.00357
; LINE_WIDTH: 0.299257
G1 X74.798 Y87.25 E.00264
; LINE_WIDTH: 0.3371
G3 X75.133 Y87.091 I.864 J1.388 E.00732
; LINE_WIDTH: 0.381723
G3 X76.156 Y87.07 I.544 J1.575 E.02355
G3 X77.211 Y87.749 I-1.018 J2.742 E.02863
M204 S10000
G1 X76.841 Y87.244 F42000
; LINE_WIDTH: 0.2978
G1 F1898
M204 S6000
G2 X77.066 Y87.72 I3.566 J-1.393 E.00906
; LINE_WIDTH: 0.258583
G1 X77.151 Y87.871 E.00253
; LINE_WIDTH: 0.226582
G1 X77.192 Y87.954 E.00116
; LINE_WIDTH: 0.192945
G1 X77.28 Y88.171 E.00242
; LINE_WIDTH: 0.14947
G3 X77.325 Y88.341 I-1.81 J.576 E.00133
; LINE_WIDTH: 0.107807
G3 X77.358 Y88.552 I-1.828 J.39 E.00102
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X77.325 Y88.341 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/30
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.44 I.922 J.794 P1  F42000
G1 X86.639 Y77.518 Z4.44
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S6000
G1 X86.639 Y77.9 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X86.639 Y78.089 E.00513
M106 S201.45
M106 S255
G1 F600
G1 X86.361 Y78.089 E.00755
G1 X86.361 Y77.9 E.00513
M106 S201.45
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X86.361 Y77.518 E.01036
M106 S201.45
G1 F1571.82
G1 X86.579 Y77.518 E.00593
; WIPE_START
G1 X86.639 Y77.9 E-.1788
G1 X86.639 Y78.089 E-.08743
G1 X86.361 Y78.089 E-.1287
G1 X86.361 Y77.9 E-.08743
G1 X86.361 Y77.518 E-.17664
G1 X86.579 Y77.518 E-.10099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I-1.011 J-.678 P1  F42000
G1 X76.915 Y91.926 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F3117
M204 S6000
G1 X76.895 Y91.949 E.00082
G3 X74.139 Y91.115 I-1.245 J-.856 E.10335
G1 X74.139 Y88.877 E.06065
G3 X75.387 Y87.411 I1.513 J.023 E.05656
G3 X77.161 Y88.884 I.258 J1.493 E.071
G1 X77.161 Y91.123 E.06066
G3 X77.008 Y91.754 I-1.511 J-.03 E.01773
G1 X76.943 Y91.873 E.00367
M204 S250
G1 X76.565 Y91.724 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3117
M204 S5000
G3 X74.54 Y91.105 I-.915 J-.629 E.07059
G1 X74.54 Y88.892 E.05565
G3 X75.457 Y87.806 I1.14 J.033 E.03858
G3 X76.76 Y88.895 I.19 J1.097 E.04854
G1 X76.76 Y91.108 E.05565
G3 X76.597 Y91.673 I-1.11 J-.013 E.01497
M204 S10000
G1 X77.513 Y92.014 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3117
M204 S6000
G1 X77.389 Y92.364 E.01007
G1 X77.389 Y92.634 E.00731
G3 X76.644 Y93.136 I-5.379 J-7.179 E.02437
G3 X73.811 Y91.49 I-.941 J-1.641 E.10737
G1 X73.811 Y88.508 E.08081
G3 X75.839 Y86.616 I1.891 J-.006 E.08437
G3 X76.724 Y86.913 I-.161 J1.949 E.02555
G1 X77.389 Y87.366 E.02181
G1 X77.389 Y87.636 E.00731
G3 X77.589 Y88.507 I-1.952 J.907 E.0244
G1 X77.589 Y91.493 E.08091
G3 X77.532 Y91.956 I-2.131 J-.03 E.01267
G1 X77.531 Y91.957 E.00001
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.364 E-.16407
G1 X77.389 Y92.634 E-.10257
G1 X76.644 Y93.136 E-.34159
G1 X76.476 Y93.222 E-.07154
G1 X76.278 Y93.294 E-.08022
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.247 Y99.814 Z4.6 F42000
G1 X81.639 Y102.1 Z4.6
G1 Z4.2
G1 E.8 F1800
M106 S255
G1 F600
M204 S6000
G1 X81.639 Y102.483 E.01036
M106 S201.45
G1 F623.509
G1 X81.639 Y102.489 E.00019
G1 F1182.642
G1 X81.361 Y102.483 E.00755
M106 S255
G1 F600
G1 X81.361 Y102.1 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X81.361 Y101.911 E.00513
G1 X81.639 Y101.911 E.00755
G1 X81.639 Y102.04 E.0035
M106 S201.45
; WIPE_START
M204 S6000
G1 X81.639 Y102.483 E-.1969
G1 X81.639 Y102.489 E-.00305
G1 X81.361 Y102.483 E-.12405
G1 X81.361 Y102.1 E-.1702
G1 X81.361 Y101.911 E-.08425
G1 X81.639 Y101.911 E-.12401
G1 X81.639 Y102.04 E-.05755
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I-.004 J1.217 P1  F42000
M73 P84 R1
G1 X100.639 Y102.1 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X100.639 Y102.483 E.01036
M106 S201.45
G1 F623.509
G1 X100.639 Y102.489 E.00019
G1 F1182.642
G1 X100.361 Y102.483 E.00755
M106 S255
G1 F600
G1 X100.361 Y102.1 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X100.361 Y101.911 E.00513
G1 X100.639 Y101.911 E.00755
G1 X100.639 Y102.04 E.0035
M106 S201.45
; WIPE_START
M204 S6000
G1 X100.639 Y102.483 E-.1969
G1 X100.639 Y102.489 E-.00305
G1 X100.361 Y102.483 E-.12405
G1 X100.361 Y102.1 E-.1702
G1 X100.361 Y101.911 E-.08425
G1 X100.639 Y101.911 E-.12401
G1 X100.639 Y102.04 E-.05755
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.177 J.308 P1  F42000
G1 X106.183 Y80.861 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1961.093
M204 S6000
G1 X106.189 Y81.139 E.00755
G1 F623.509
G1 X106.183 Y81.139 E.00019
M106 S255
G1 F600
G1 X105.8 Y81.139 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X105.411 Y81.139 E.01055
G1 X105.411 Y80.861 E.00755
G1 X105.8 Y80.861 E.01055
M106 S201.45
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X106.123 Y80.861 E.00874
M106 S201.45
; WIPE_START
G1 X106.189 Y81.139 E-.10891
G1 X106.183 Y81.139 E-.00261
G1 X105.8 Y81.139 E-.14535
G1 X105.411 Y81.139 E-.14795
G1 X105.411 Y80.861 E-.1059
G1 X105.8 Y80.861 E-.14795
G1 X106.067 Y80.861 E-.10134
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I-.478 J-1.119 P1  F42000
G1 X77.41 Y93.105 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3117
M204 S5000
G3 X76.209 Y93.733 I-2.152 J-2.655 E.0343
G3 X73.41 Y91.497 I-.504 J-2.239 E.10334
G1 X73.41 Y88.503 E.07527
G3 X76.942 Y86.576 I2.291 J-.001 E.12347
G1 X77.41 Y86.895 E.01425
G1 X77.41 Y79.203 E.19339
M73 P84 R0
G3 X79.503 Y77.11 I2.092 J-.001 E.08266
G1 X104.518 Y77.11 E.62891
G3 X106.59 Y79.203 I-.023 J2.095 E.0821
G1 X106.59 Y82.79 E.09019
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y82.34 E.01131
G1 X106.21 Y81.94 E.01006
G1 F3030.312
G1 X106.21 Y81.54 E.01006
G1 F747.227
G1 X106.169 Y81.54 E.00103
M106 S255
G1 F600
G1 X105.8 Y81.54 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X105.01 Y81.54 E.02141
G1 X105.01 Y80.46 E.02927
G1 X105.8 Y80.46 E.02141
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X106.169 Y80.46 E.00928
M106 S201.45
G1 F747.227
G1 X106.21 Y80.46 E.00103
G1 F3030.312
G1 X106.21 Y80.06 E.01006
G1 F3117
G1 X106.21 Y79.66 E.01006
G1 X106.21 Y79.26 E.01006
G1 X106.21 Y78.395 E.02175
G2 X105.305 Y77.49 I-.933 J.028 E.03545
G1 X88.24 Y77.49 E.42904
G1 X87.84 Y77.49 E.01006
G1 X87.44 Y77.49 E.01006
G1 F3030.312
G1 X87.04 Y77.49 E.01006
G1 F747.227
G1 X87.04 Y77.531 E.00103
M106 S255
G1 F600
G1 X87.04 Y77.9 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X87.04 Y78.49 E.01599
G1 X85.96 Y78.49 E.02927
G1 X85.96 Y77.9 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X85.96 Y77.531 E.00928
M106 S201.45
G1 F747.227
G1 X85.96 Y77.49 E.00103
G1 F3030.312
G1 X85.56 Y77.49 E.01006
G1 F3117
G1 X85.16 Y77.49 E.01006
G1 X84.76 Y77.49 E.01006
G1 X78.688 Y77.49 E.15265
G2 X77.79 Y78.395 I.014 J.912 E.0355
G1 X77.79 Y87.56 E.23041
G3 X77.99 Y88.502 I-2.291 J.979 E.02438
G1 X77.99 Y91.498 E.07531
M73 P85 R0
G3 X77.79 Y92.44 I-2.467 J-.031 E.02439
G1 X77.791 Y101.645 E.23141
G2 X78.652 Y102.509 I.922 J-.057 E.03351
G1 X79.76 Y102.51 E.02786
G1 X80.16 Y102.51 E.01006
G1 X80.56 Y102.51 E.01006
G1 F3030.923
G1 X80.96 Y102.51 E.01006
G1 F747.53
G1 X80.96 Y102.469 E.00103
M106 S255
G1 F600
G1 X80.96 Y102.1 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X80.96 Y101.51 E.01599
G1 X82.04 Y101.51 E.02927
G1 X82.04 Y102.1 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X82.04 Y102.469 E.00928
M106 S201.45
G1 F747.227
G1 X82.04 Y102.51 E.00103
G1 F3030.312
G1 X82.44 Y102.51 E.01006
G1 F3117
G1 X82.84 Y102.51 E.01006
G1 X83.24 Y102.51 E.01006
G1 X98.76 Y102.51 E.39019
G1 X99.16 Y102.51 E.01006
G1 X99.56 Y102.51 E.01006
G1 F3030.312
G1 X99.96 Y102.51 E.01006
G1 F747.227
G1 X99.96 Y102.469 E.00103
M106 S255
G1 F600
G1 X99.96 Y102.1 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X99.96 Y101.51 E.01599
G1 X101.04 Y101.51 E.02927
G1 X101.04 Y102.1 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X101.04 Y102.469 E.00928
M106 S201.45
G1 F747.227
G1 X101.04 Y102.51 E.00103
G1 F3030.312
G1 X101.44 Y102.51 E.01006
G1 F3117
G1 X101.84 Y102.51 E.01006
G1 X102.24 Y102.51 E.01006
G1 X105.308 Y102.51 E.07712
G2 X106.21 Y101.605 I-.01 J-.912 E.0356
G1 X106.21 Y97.21 E.11049
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.096 J-.003 E.08262
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I.003 J-2.096 E.08262
G1 X77.41 Y93.165 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.942 Y93.424 E-.20345
G1 X76.744 Y93.538 E-.08671
G1 X76.536 Y93.632 E-.08684
G1 X76.209 Y93.733 E-.12985
G1 X75.756 Y93.789 E-.17336
G1 X75.547 Y93.779 E-.07979
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

G1 X75.075 Y92.887
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.380141
G1 F3117
M204 S6000
G2 X76.103 Y92.944 I.602 J-1.573 E.02358
G2 X77.206 Y92.264 I-.952 J-2.777 E.02944
M204 S10000
G1 X76.892 Y92.722 F42000
; LINE_WIDTH: 0.336314
G1 F3117
M204 S6000
G2 X77.044 Y92.325 I-6.123 J-2.574 E.00837
; LINE_WIDTH: 0.28157
G3 X77.107 Y92.205 I.651 J.27 E.00218
; LINE_WIDTH: 0.247118
G1 X77.15 Y92.132 E.00118
; LINE_WIDTH: 0.226397
G1 X77.192 Y92.046 E.0012
; LINE_WIDTH: 0.199402
G2 X77.262 Y91.882 I-2.1 J-.991 E.00191
; LINE_WIDTH: 0.155433
G2 X77.325 Y91.659 I-2.086 J-.716 E.00183
; LINE_WIDTH: 0.10711
G2 X77.358 Y91.438 I-1.476 J-.327 E.00106
; WIPE_START
G1 F18000
G1 X77.325 Y91.659 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.075 Y92.887 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.333183
G1 F3117
M204 S6000
G1 X74.946 Y92.832 E.00274
G3 X74.796 Y92.75 I1.202 J-2.383 E.00333
; LINE_WIDTH: 0.293822
G3 X74.612 Y92.618 I.823 J-1.344 E.00384
; LINE_WIDTH: 0.260863
G1 X74.493 Y92.512 E.00234
; LINE_WIDTH: 0.223587
G1 X74.335 Y92.33 E.00297
; LINE_WIDTH: 0.176174
G1 X74.212 Y92.144 E.00207
; LINE_WIDTH: 0.132616
G1 X74.131 Y91.984 E.00114
; LINE_WIDTH: 0.0979193
G1 X74.082 Y91.858 E.00056
M204 S10000
G1 X74.082 Y88.137 F42000
; LINE_WIDTH: 0.113201
G1 F3117
M204 S6000
G3 X74.184 Y87.905 I2.713 J1.048 E.0013
; LINE_WIDTH: 0.162383
G3 X74.29 Y87.731 I1.587 J.853 E.0017
; LINE_WIDTH: 0.209849
G3 X74.45 Y87.533 I1.129 J.745 E.00292
; LINE_WIDTH: 0.258849
G3 X74.635 Y87.364 I2.111 J2.117 E.00366
; LINE_WIDTH: 0.297989
G3 X74.798 Y87.249 I1.027 J1.287 E.00344
G1 X74.82 Y87.236 E.00043
; LINE_WIDTH: 0.339497
G3 X75.042 Y87.126 I1.626 J2.995 E.00493
G1 X75.145 Y87.088 E.00219
; LINE_WIDTH: 0.381892
G3 X76.156 Y87.07 I.534 J1.587 E.02326
G3 X77.211 Y87.749 I-1.018 J2.74 E.02865
M204 S10000
G1 X76.841 Y87.243 F42000
; LINE_WIDTH: 0.2978
G1 F3117
M204 S6000
G2 X77.066 Y87.72 I3.591 J-1.406 E.00906
; LINE_WIDTH: 0.258519
G1 X77.151 Y87.871 E.00253
; LINE_WIDTH: 0.226493
G1 X77.192 Y87.954 E.00116
; LINE_WIDTH: 0.192763
G1 X77.28 Y88.172 E.00243
; LINE_WIDTH: 0.148217
G1 X77.325 Y88.341 E.0013
; LINE_WIDTH: 0.107832
G3 X77.358 Y88.552 I-1.82 J.389 E.00102
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X77.325 Y88.341 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/30
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.6 I-1.209 J-.139 P1  F42000
G1 X76.915 Y91.926 Z4.6
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2117
M204 S6000
G1 X76.895 Y91.949 E.00082
G3 X74.139 Y91.115 I-1.245 J-.856 E.10336
G1 X74.139 Y88.877 E.06064
G3 X75.388 Y87.411 I1.513 J.023 E.05656
G3 X77.161 Y88.885 I.258 J1.493 E.07101
G1 X77.161 Y91.123 E.06065
G3 X77.009 Y91.754 I-1.511 J-.03 E.01773
G1 X76.943 Y91.873 E.00368
M204 S250
G1 X76.565 Y91.724 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2117
M204 S5000
G3 X74.54 Y91.105 I-.915 J-.629 E.0706
G1 X74.54 Y88.892 E.05564
G3 X75.457 Y87.806 I1.14 J.032 E.03858
M73 P86 R0
G3 X76.76 Y88.895 I.19 J1.097 E.04855
G1 X76.76 Y91.108 E.05564
G3 X76.597 Y91.673 I-1.11 J-.013 E.01497
M204 S10000
G1 X77.513 Y92.014 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2117
M204 S6000
G1 X77.389 Y92.364 E.01008
G1 X77.389 Y92.634 E.00731
G3 X76.644 Y93.137 I-5.398 J-7.207 E.02437
G3 X73.811 Y91.49 I-.941 J-1.641 E.10736
G1 X73.811 Y88.51 E.08077
G3 X75.839 Y86.616 I1.891 J-.008 E.08443
G3 X76.724 Y86.913 I-.162 J1.951 E.02554
G1 X77.389 Y87.366 E.02181
G1 X77.389 Y87.636 E.00731
G3 X77.589 Y88.507 I-1.949 J.906 E.02441
G1 X77.589 Y91.493 E.0809
G3 X77.531 Y91.956 I-2.133 J-.031 E.01268
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.364 E-.16417
G1 X77.389 Y92.634 E-.10254
G1 X76.644 Y93.137 E-.34162
G1 X76.39 Y93.259 E-.10718
G1 X76.279 Y93.296 E-.04449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.105 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2117
M204 S5000
G3 X76.209 Y93.733 I-2.152 J-2.656 E.0343
G3 X73.41 Y91.497 I-.504 J-2.239 E.10333
G1 X73.41 Y88.503 E.07526
G3 X76.942 Y86.576 I2.291 J-.002 E.12348
G1 X77.41 Y86.895 E.01425
G1 X77.41 Y79.203 E.19339
G3 X79.503 Y77.11 I2.096 J.003 E.08262
G1 X104.513 Y77.11 E.62879
G3 X106.59 Y79.203 I-.02 J2.097 E.0822
G1 X106.59 Y82.79 E.09019
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y81.54 E.03143
G1 X105.01 Y81.54 E.03017
G1 X105.01 Y80.46 E.02715
G1 X106.21 Y80.46 E.03017
G1 X106.21 Y78.395 E.05192
G2 X105.305 Y77.49 I-.933 J.028 E.03544
G1 X87.04 Y77.49 E.45922
G1 X87.04 Y78.49 E.02514
G1 X85.96 Y78.49 E.02715
G1 X85.96 Y77.49 E.02514
G1 X78.695 Y77.49 E.18266
G2 X77.79 Y78.395 I.007 J.912 E.03566
G1 X77.79 Y87.56 E.23041
G3 X77.99 Y88.502 I-2.287 J.978 E.02438
G1 X77.99 Y91.498 E.07531
M73 P87 R0
G3 X77.79 Y92.44 I-2.468 J-.031 E.02439
G1 X77.791 Y101.645 E.23141
G2 X78.655 Y102.509 I.921 J-.057 E.03359
G1 X80.96 Y102.51 E.05795
G1 X80.96 Y101.51 E.02514
G1 X82.04 Y101.51 E.02715
G1 X82.04 Y102.51 E.02514
G1 X99.96 Y102.51 E.45053
G1 X99.96 Y101.51 E.02514
G1 X101.04 Y101.51 E.02715
G1 X101.04 Y102.51 E.02514
G1 X105.308 Y102.51 E.1073
G2 X106.21 Y101.605 I-.01 J-.912 E.03559
G1 X106.21 Y97.21 E.1105
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.096 J-.003 E.08262
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I.003 J-2.096 E.08262
G1 X77.41 Y93.165 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.942 Y93.424 E-.20343
G1 X76.744 Y93.538 E-.08668
G1 X76.536 Y93.632 E-.08672
G1 X76.209 Y93.733 E-.13006
G1 X75.87 Y93.784 E-.13003
G1 X75.642 Y93.789 E-.08669
G1 X75.547 Y93.777 E-.03639
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

G1 X75.074 Y92.887
G1 Z4.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.333074
G1 F2117
M204 S6000
G1 X74.944 Y92.83 E.00276
G3 X74.796 Y92.75 I1.229 J-2.426 E.00327
; LINE_WIDTH: 0.293824
G3 X74.612 Y92.618 I.823 J-1.344 E.00384
; LINE_WIDTH: 0.260878
G1 X74.493 Y92.512 E.00234
; LINE_WIDTH: 0.223685
G1 X74.335 Y92.331 E.00296
; LINE_WIDTH: 0.175929
G1 X74.21 Y92.141 E.0021
; LINE_WIDTH: 0.132317
G1 X74.131 Y91.984 E.00112
; LINE_WIDTH: 0.0979102
G1 X74.082 Y91.858 E.00056
M204 S10000
G1 X75.074 Y92.887 F42000
; LINE_WIDTH: 0.380123
G1 F2117
M204 S6000
G2 X76.18 Y92.922 I.603 J-1.561 E.02542
G2 X77.206 Y92.264 I-1.12 J-2.874 E.02766
M204 S10000
G1 X77.107 Y92.205 F42000
; LINE_WIDTH: 0.281616
G1 F2117
M204 S6000
G2 X77.044 Y92.325 I.589 J.389 E.00219
; LINE_WIDTH: 0.336289
G3 X76.892 Y92.722 I-6.32 J-2.194 E.00836
M204 S10000
G1 X77.107 Y92.205 F42000
; LINE_WIDTH: 0.247113
G1 F2117
M204 S6000
G1 X77.15 Y92.132 E.00118
; LINE_WIDTH: 0.226325
G1 X77.192 Y92.045 E.0012
; LINE_WIDTH: 0.199355
G2 X77.262 Y91.882 I-2.105 J-.994 E.00191
; LINE_WIDTH: 0.155469
G2 X77.325 Y91.66 I-2.082 J-.714 E.00183
; LINE_WIDTH: 0.107176
G2 X77.358 Y91.438 I-1.469 J-.326 E.00106
M204 S10000
G1 X77.358 Y88.552 F42000
; LINE_WIDTH: 0.107919
G1 F2117
M204 S6000
G2 X77.325 Y88.34 I-1.844 J.177 E.00103
; LINE_WIDTH: 0.148128
G1 X77.281 Y88.174 E.00128
; LINE_WIDTH: 0.184007
G1 X77.226 Y88.025 E.00155
; LINE_WIDTH: 0.218816
G2 X77.151 Y87.871 I-3.729 J1.716 E.00206
; LINE_WIDTH: 0.258525
G1 X77.066 Y87.72 E.00253
; LINE_WIDTH: 0.297842
G3 X76.84 Y87.243 I3.316 J-1.861 E.00907
M204 S10000
G1 X77.211 Y87.749 F42000
; LINE_WIDTH: 0.381894
G1 F2117
M204 S6000
G2 X76.155 Y87.07 I-2.073 J2.061 E.02865
G2 X75.146 Y87.088 I-.476 J1.604 E.02324
; LINE_WIDTH: 0.339524
G1 X75.042 Y87.126 E.0022
G2 X74.82 Y87.236 I1.441 J3.179 E.00493
; LINE_WIDTH: 0.298004
G1 X74.799 Y87.248 E.00042
G2 X74.635 Y87.364 I.871 J1.414 E.00345
; LINE_WIDTH: 0.258856
G2 X74.451 Y87.533 I1.921 J2.279 E.00366
; LINE_WIDTH: 0.209811
G2 X74.29 Y87.732 I.97 J.945 E.00293
; LINE_WIDTH: 0.162356
G2 X74.184 Y87.905 I1.445 J1.005 E.0017
; LINE_WIDTH: 0.113298
G2 X74.083 Y88.136 I2.396 J1.185 E.0013
; WIPE_START
G1 F18000
G1 X74.184 Y87.905 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.667 Y94.697 Z4.76 F42000
G1 X81.269 Y101.722 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2117
M204 S2000
G1 X81.828 Y102.281 E.01986
G1 X81.68 Y102.678
G1 X81.172 Y102.17 E.01805
; WIPE_START
G1 F11668.197
M204 S6000
G1 X81.68 Y102.678 E-.28242
G1 X81.828 Y102.281 E-.1668
G1 X81.269 Y101.722 E-.31078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.76 I-.029 J1.217 P1  F42000
G1 X100.828 Y102.192 Z4.76
G1 Z4.36
M73 P88 R0
G1 E.8 F1800
G1 F2117
M204 S2000
G1 X100.359 Y101.722 E.01669
G1 X100.172 Y102.081
G1 X100.769 Y102.678 E.02122
; WIPE_START
G1 F11668.197
M204 S6000
G1 X100.172 Y102.081 E-.33543
G1 X100.359 Y101.722 E-.16076
G1 X100.828 Y102.192 E-.26382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.76 I1.179 J.3 P1  F42000
G1 X106.144 Y81.328 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F2117
M204 S2000
G1 X105.488 Y80.672 E.02332
G1 X105.222 Y80.952
G1 X105.598 Y81.328 E.01338
M204 S10000
G1 X106.284 Y81.347 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.17327
G1 F2117
M204 S6000
G1 X106.329 Y81.24 E.00105
G1 X106.329 Y80.653 E.00532
; WIPE_START
G1 F18000
G1 X106.329 Y81.24 E-.63454
G1 X106.284 Y81.347 E-.12546
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.76 I.217 J-1.198 P1  F42000
G1 X86.828 Y77.829 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2117
M204 S2000
G1 X86.321 Y77.322 E.01801
G1 X86.172 Y77.718
G1 X86.732 Y78.278 E.01989
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.197
M204 S6000
G1 X86.172 Y77.718 E-.31142
G1 X86.321 Y77.322 E-.16662
G1 X86.828 Y77.829 E-.28196
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/30
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.76 I-.996 J-.7 P1  F42000
G1 X76.881 Y91.975 Z4.76
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1905
M204 S6000
G1 X76.757 Y92.127 E.0053
G3 X74.139 Y91.115 I-1.107 J-1.028 E.09752
G1 X74.139 Y88.877 E.06065
G3 X75.387 Y87.411 I1.517 J.027 E.05651
G3 X77.161 Y88.885 I.259 J1.493 E.07103
G1 X77.161 Y91.123 E.06066
G3 X76.914 Y91.926 I-1.511 J-.024 E.02305
M204 S250
G1 X76.567 Y91.725 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1905
M204 S5000
G3 X74.54 Y91.105 I-.917 J-.626 E.07078
G1 X74.54 Y88.892 E.05565
G3 X75.457 Y87.806 I1.113 J.01 E.03875
G3 X76.76 Y88.895 I.19 J1.097 E.04855
G1 X76.76 Y91.108 E.05565
G3 X76.599 Y91.675 I-1.11 J-.009 E.01498
M204 S10000
G1 X77.513 Y92.014 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1905
M204 S6000
G1 X77.389 Y92.365 E.01011
G1 X77.389 Y92.634 E.00728
G3 X76.644 Y93.136 I-5.38 J-7.179 E.02435
G3 X73.811 Y91.492 I-.942 J-1.64 E.10734
G1 X73.811 Y88.508 E.08087
G3 X75.841 Y86.616 I1.891 J-.006 E.08443
G3 X76.724 Y86.913 I-.166 J1.959 E.0255
G1 X77.389 Y87.366 E.0218
G1 X77.389 Y87.636 E.00731
G3 X77.589 Y88.507 I-1.944 J.905 E.0244
G1 X77.589 Y91.493 E.0809
G3 X77.532 Y91.956 I-2.142 J-.032 E.01269
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.365 E-.16457
G1 X77.389 Y92.634 E-.10211
G1 X76.644 Y93.136 E-.34135
G1 X76.389 Y93.259 E-.10787
G1 X76.278 Y93.293 E-.0441
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.105 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1905
M204 S5000
G3 X76.209 Y93.733 I-2.152 J-2.654 E.03431
G3 X73.41 Y91.497 I-.504 J-2.239 E.10331
G1 X73.41 Y88.503 E.07529
G3 X76.942 Y86.576 I2.291 J-.001 E.12347
G1 X77.41 Y86.895 E.01425
G1 X77.41 Y79.203 E.19339
G3 X79.503 Y77.11 I2.096 J.003 E.08262
G1 X104.509 Y77.11 E.62868
G3 X106.59 Y79.203 I-.015 J2.096 E.08232
G1 X106.59 Y82.79 E.09019
M73 P89 R0
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.11049
G2 X105.305 Y77.49 I-.915 J.01 E.03563
G1 X78.695 Y77.49 E.66903
G2 X77.79 Y78.395 I.007 J.912 E.03566
G1 X77.79 Y87.56 E.23041
G3 X77.99 Y88.502 I-2.282 J.977 E.02439
G1 X77.99 Y91.498 E.0753
G3 X77.79 Y92.441 I-2.472 J-.031 E.0244
G1 X77.791 Y101.645 E.2314
G2 X78.695 Y102.51 I.911 J-.047 E.03466
G1 X105.308 Y102.51 E.66909
G2 X106.21 Y101.605 I-.01 J-.912 E.03559
G1 X106.21 Y97.21 E.11049
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.096 J-.003 E.08262
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I.004 J-2.097 E.08261
M73 P90 R0
G1 X77.41 Y93.165 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.942 Y93.424 E-.20335
G1 X76.744 Y93.538 E-.08669
G1 X76.429 Y93.671 E-.13
G1 X76.209 Y93.733 E-.08692
G1 X75.757 Y93.789 E-.17315
G1 X75.546 Y93.784 E-.07989
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

G1 X75.133 Y92.909
G1 Z4.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.380633
G1 F1905
M204 S6000
G2 X75.698 Y92.999 I.563 J-1.701 E.01299
G2 X77.003 Y92.43 I-.136 J-2.088 E.03278
G1 X77.021 Y92.388 E.00103
; LINE_WIDTH: 0.332471
G1 X77.043 Y92.326 E.00128
; LINE_WIDTH: 0.298201
G1 X77.064 Y92.281 E.00086
; LINE_WIDTH: 0.273085
G1 X77.107 Y92.206 E.00134
; LINE_WIDTH: 0.24732
G1 X77.15 Y92.132 E.00119
; LINE_WIDTH: 0.225457
G1 X77.196 Y92.037 E.00131
; LINE_WIDTH: 0.198211
G1 X77.263 Y91.882 E.0018
; LINE_WIDTH: 0.155893
G2 X77.325 Y91.66 I-2.618 J-.855 E.00183
; LINE_WIDTH: 0.107228
G2 X77.358 Y91.438 I-1.462 J-.326 E.00107
; WIPE_START
G1 F18000
G1 X77.325 Y91.66 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.133 Y92.909 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.336509
G1 F1905
M204 S6000
G3 X74.796 Y92.75 I.674 J-1.865 E.00734
; LINE_WIDTH: 0.286852
G3 X74.55 Y92.565 I.913 J-1.469 E.00508
; LINE_WIDTH: 0.238549
G1 X74.507 Y92.525 E.00078
G3 X74.383 Y92.393 I1.774 J-1.789 E.00241
; LINE_WIDTH: 0.196902
G3 X74.276 Y92.249 I1.187 J-.998 E.00191
; LINE_WIDTH: 0.15896
G3 X74.185 Y92.096 I1.607 J-1.056 E.00144
; LINE_WIDTH: 0.11968
G3 X74.111 Y91.936 I1.787 J-.93 E.00098
; LINE_WIDTH: 0.092947
G1 X74.082 Y91.858 E.00032
M204 S10000
G1 X74.083 Y88.136 F42000
; LINE_WIDTH: 0.113255
G1 F1905
M204 S6000
G3 X74.184 Y87.905 I2.529 J.968 E.0013
; LINE_WIDTH: 0.162257
G3 X74.29 Y87.732 I1.557 J.835 E.00169
; LINE_WIDTH: 0.199354
G1 X74.388 Y87.604 E.00173
; LINE_WIDTH: 0.234456
G3 X74.505 Y87.477 I1.761 J1.503 E.00226
; LINE_WIDTH: 0.269804
G3 X74.672 Y87.335 I1.291 J1.355 E.00336
; LINE_WIDTH: 0.299677
G1 X74.8 Y87.249 E.00267
; LINE_WIDTH: 0.332098
G3 X75.049 Y87.122 I.998 J1.662 E.00544
G1 X75.067 Y87.115 E.00038
; LINE_WIDTH: 0.380886
G3 X76.156 Y87.07 I.61 J1.582 E.02505
G3 X77.211 Y87.749 I-1.018 J2.741 E.02857
M204 S10000
G1 X76.841 Y87.244 F42000
; LINE_WIDTH: 0.297969
G1 F1905
M204 S6000
G2 X77.066 Y87.72 I3.602 J-1.411 E.00906
; LINE_WIDTH: 0.258653
G1 X77.151 Y87.871 E.00253
; LINE_WIDTH: 0.218786
G3 X77.226 Y88.026 I-3.645 J1.866 E.00207
; LINE_WIDTH: 0.183801
G1 X77.281 Y88.175 E.00155
; LINE_WIDTH: 0.148084
G1 X77.325 Y88.34 E.00127
; LINE_WIDTH: 0.107953
G3 X77.358 Y88.552 I-1.813 J.389 E.00103
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X77.325 Y88.34 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/30
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.92 I-1.209 J-.138 P1  F42000
G1 X76.915 Y91.926 Z4.92
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1889
M204 S6000
G1 X76.898 Y91.951 E.00082
G3 X74.139 Y91.115 I-1.248 J-.852 E.10363
G1 X74.139 Y88.877 E.06065
G3 X75.387 Y87.411 I1.513 J.023 E.05656
G3 X77.161 Y88.885 I.258 J1.493 E.071
G1 X77.161 Y91.123 E.06066
G3 X77.011 Y91.755 I-1.511 J-.024 E.01775
G1 X76.944 Y91.874 E.00368
M204 S250
G1 X76.568 Y91.726 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1889
M204 S5000
G1 X76.567 Y91.725 E.00003
G3 X74.54 Y91.105 I-.917 J-.626 E.07078
G1 X74.54 Y88.892 E.05565
G3 X75.457 Y87.806 I1.139 J.032 E.03858
G3 X76.76 Y88.895 I.19 J1.097 E.04854
G1 X76.76 Y91.108 E.05565
G3 X76.65 Y91.581 I-1.11 J-.009 E.01232
G1 X76.597 Y91.673 E.00266
M204 S10000
G1 X77.514 Y92.013 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1889
M204 S6000
G1 X77.389 Y92.365 E.01012
G1 X77.389 Y92.634 E.00728
G3 X76.644 Y93.136 I-5.389 J-7.19 E.02436
G3 X73.811 Y91.492 I-.942 J-1.64 E.10733
G1 X73.811 Y88.508 E.08086
G3 X75.841 Y86.616 I1.891 J-.006 E.08442
G3 X76.725 Y86.913 I-.166 J1.959 E.02551
G1 X77.389 Y87.366 E.0218
G1 X77.389 Y87.636 E.0073
G3 X77.589 Y88.507 I-1.941 J.904 E.02441
G1 X77.589 Y91.493 E.08091
G3 X77.532 Y91.956 I-2.14 J-.032 E.01266
; WIPE_START
G1 F10826.06
G1 X77.389 Y92.365 E-.1647
G1 X77.389 Y92.634 E-.10215
G1 X76.644 Y93.136 E-.3415
G1 X76.389 Y93.259 E-.10755
G1 X76.278 Y93.293 E-.04409
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.105 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1889
M204 S5000
G3 X76.209 Y93.733 I-2.152 J-2.654 E.0343
G3 X73.41 Y91.497 I-.504 J-2.239 E.10333
G1 X73.41 Y88.503 E.07529
G3 X76.942 Y86.576 I2.291 J-.001 E.12349
M73 P91 R0
G1 X77.41 Y86.895 E.01424
G1 X77.41 Y79.203 E.1934
G3 X79.503 Y77.11 I2.096 J.003 E.08261
G1 X104.504 Y77.11 E.62857
G3 X106.59 Y79.203 I-.01 J2.096 E.08243
G1 X106.59 Y82.79 E.09019
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.11049
G2 X105.305 Y77.49 I-.915 J.01 E.03564
G1 X78.695 Y77.49 E.66901
G2 X77.79 Y78.395 I.007 J.912 E.03567
G1 X77.79 Y87.56 E.23041
G3 X77.99 Y88.502 I-2.277 J.976 E.02439
G1 X77.99 Y91.498 E.0753
G3 X77.79 Y92.441 I-2.471 J-.031 E.0244
G1 X77.791 Y101.645 E.2314
G2 X78.693 Y102.51 I.911 J-.047 E.03461
G1 X105.308 Y102.51 E.66914
G2 X106.21 Y101.605 I-.01 J-.912 E.03561
G1 X106.21 Y97.21 E.11049
M73 P92 R0
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.096 J-.003 E.08261
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I.003 J-2.096 E.08261
G1 X77.41 Y93.165 E.19189
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.942 Y93.424 E-.2032
G1 X76.745 Y93.538 E-.08668
G1 X76.536 Y93.632 E-.08699
G1 X76.209 Y93.733 E-.12993
G1 X75.757 Y93.789 E-.17321
G1 X75.546 Y93.784 E-.07999
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

G1 X75.133 Y92.909
G1 Z4.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.336521
G1 F1889
M204 S6000
G3 X74.796 Y92.75 I.679 J-1.875 E.00734
; LINE_WIDTH: 0.286757
G3 X74.549 Y92.564 I.919 J-1.477 E.00509
; LINE_WIDTH: 0.23842
G1 X74.383 Y92.392 E.00317
; LINE_WIDTH: 0.196737
G3 X74.276 Y92.249 I1.15 J-.972 E.0019
; LINE_WIDTH: 0.159029
G3 X74.185 Y92.096 I1.554 J-1.026 E.00144
; LINE_WIDTH: 0.119766
G3 X74.111 Y91.936 I1.828 J-.948 E.00098
; LINE_WIDTH: 0.0929305
G1 X74.082 Y91.858 E.00032
M204 S10000
G1 X75.133 Y92.909 F42000
; LINE_WIDTH: 0.380793
G1 F1889
M204 S6000
G2 X76.18 Y92.922 I.544 J-1.601 E.02405
G2 X77.206 Y92.263 I-1.19 J-2.982 E.02771
M204 S10000
G1 X76.892 Y92.721 F42000
; LINE_WIDTH: 0.337564
G1 F1889
M204 S6000
G1 X77.034 Y92.355 E.00777
; LINE_WIDTH: 0.306344
G3 X77.064 Y92.28 I.422 J.132 E.00143
; LINE_WIDTH: 0.272919
G1 X77.107 Y92.206 E.00133
; LINE_WIDTH: 0.247297
M73 P93 R0
G1 X77.15 Y92.132 E.00119
; LINE_WIDTH: 0.225773
G1 X77.195 Y92.04 E.00127
; LINE_WIDTH: 0.198572
G1 X77.263 Y91.883 E.00184
; LINE_WIDTH: 0.155942
G2 X77.325 Y91.661 I-2.598 J-.85 E.00183
; LINE_WIDTH: 0.107262
G2 X77.358 Y91.438 I-1.457 J-.326 E.00107
M204 S10000
G1 X77.358 Y88.552 F42000
; LINE_WIDTH: 0.108029
G1 F1889
M204 S6000
G2 X77.325 Y88.339 I-1.84 J.177 E.00103
; LINE_WIDTH: 0.148007
G1 X77.282 Y88.177 E.00124
; LINE_WIDTH: 0.183464
G1 X77.226 Y88.027 E.00156
; LINE_WIDTH: 0.218671
G2 X77.151 Y87.871 I-3.76 J1.728 E.00208
; LINE_WIDTH: 0.258677
G1 X77.066 Y87.72 E.00253
; LINE_WIDTH: 0.298008
G3 X76.841 Y87.243 I3.325 J-1.865 E.00907
M204 S10000
G1 X77.211 Y87.749 F42000
; LINE_WIDTH: 0.381732
G1 F1889
M204 S6000
G2 X76.156 Y87.07 I-2.073 J2.061 E.02864
G2 X75.146 Y87.088 I-.475 J1.655 E.02321
; LINE_WIDTH: 0.342789
G1 X75.042 Y87.125 E.00222
G2 X74.864 Y87.211 I.768 J1.813 E.00397
; LINE_WIDTH: 0.30049
G1 X74.793 Y87.252 E.00143
G2 X74.611 Y87.383 I1.654 J2.482 E.0039
; LINE_WIDTH: 0.253887
G1 X74.579 Y87.409 E.00058
G2 X74.444 Y87.54 I1.405 J1.589 E.00271
; LINE_WIDTH: 0.208047
G2 X74.29 Y87.732 I1.528 J1.382 E.00279
; LINE_WIDTH: 0.162264
G2 X74.184 Y87.905 I1.551 J1.067 E.00169
; LINE_WIDTH: 0.113083
G2 X74.082 Y88.137 I2.387 J1.184 E.0013
; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X74.184 Y87.905 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/30
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.08 I-1.032 J.644 P1  F42000
G1 X76.568 Y91.726 Z5.08
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2086
M204 S5000
G1 X76.567 Y91.725 E.00003
G3 X74.54 Y91.105 I-.917 J-.626 E.07079
G1 X74.54 Y88.892 E.05564
G3 X75.512 Y87.798 I1.109 J.007 E.04017
G3 X76.76 Y88.895 I.135 J1.104 E.04716
G1 X76.76 Y91.108 E.05564
G3 X76.65 Y91.581 I-1.11 J-.009 E.01232
G1 X76.597 Y91.673 E.00266
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.567 Y91.725 E-.02286
G1 X76.464 Y91.855 E-.06302
G1 X76.342 Y91.968 E-.06303
G1 X76.205 Y92.062 E-.06309
G1 X76.058 Y92.133 E-.06216
G1 X75.84 Y92.194 E-.08599
G1 X75.68 Y92.21 E-.06101
G1 X75.457 Y92.193 E-.08504
G1 X75.244 Y92.133 E-.08405
G1 X75.048 Y92.033 E-.08392
G1 X74.875 Y91.895 E-.08405
G1 X74.872 Y91.891 E-.00179
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.41 Y93.105 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
G1 F2086
M204 S5000
G3 X76.21 Y93.733 I-2.153 J-2.654 E.03429
G3 X73.41 Y91.497 I-.505 J-2.239 E.10335
G1 X73.41 Y88.503 E.07528
G3 X76.942 Y86.576 I2.291 J-.001 E.12349
G1 X77.41 Y86.895 E.01423
G1 X77.41 Y79.203 E.1934
G3 X79.503 Y77.11 I2.096 J.004 E.08261
G1 X104.5 Y77.11 E.62846
G3 X106.59 Y79.203 I-.006 J2.096 E.08255
G1 X106.59 Y82.79 E.09019
M73 P94 R0
G1 X106.21 Y82.79 E.00955
G1 X106.21 Y78.395 E.1105
G2 X105.305 Y77.49 I-.915 J.01 E.03563
G1 X78.695 Y77.49 E.66903
G2 X77.79 Y78.395 I.007 J.912 E.03566
G1 X77.79 Y87.559 E.23041
G3 X77.99 Y88.502 I-2.274 J.975 E.02439
G1 X77.99 Y91.498 E.0753
G3 X77.79 Y92.441 I-2.471 J-.031 E.02439
G1 X77.791 Y101.645 E.2314
G2 X78.695 Y102.51 I.912 J-.047 E.03466
G1 X105.308 Y102.51 E.66909
G2 X106.21 Y101.605 I-.013 J-.915 E.03557
G1 X106.21 Y97.21 E.1105
G1 X106.59 Y97.21 E.00955
G1 X106.59 Y100.797 E.09019
G3 X104.497 Y102.89 I-2.096 J-.004 E.08261
G1 X79.503 Y102.89 E.62839
G3 X77.41 Y100.797 I.004 J-2.096 E.08261
G1 X77.41 Y93.165 E.19189
; WIPE_START
M73 P95 R0
G1 F11668.197
M204 S6000
G1 X76.942 Y93.424 E-.2031
G1 X76.745 Y93.538 E-.08682
G1 X76.537 Y93.632 E-.08665
G1 X76.21 Y93.733 E-.13008
G1 X75.757 Y93.789 E-.17333
G1 X75.547 Y93.779 E-.08002
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

G1 X77.616 Y92.294
G1 Z4.84
G1 E.8 F1800
; FEATURE: Top surface
G1 F2086
M204 S2000
G1 X76.492 Y93.417 E.03995
G1 X75.8 Y93.565
G1 X77.775 Y91.589 E.07023
G1 X77.776 Y91.044
G1 X75.289 Y93.53 E.08841
G1 X74.877 Y93.397
G1 X75.869 Y92.404 E.03529
G1 X75.346 Y92.382
G1 X74.526 Y93.202 E.02914
G1 X74.23 Y92.953
G1 X74.958 Y92.225 E.02588
G1 X74.664 Y91.974
G1 X73.981 Y92.657 E.0243
G1 X73.786 Y92.306
G1 X74.447 Y91.645 E.02352
G1 X74.337 Y91.209
G1 X73.664 Y91.883 E.02394
G1 X73.632 Y91.369
G1 X74.328 Y90.673 E.02473
G1 X74.328 Y90.128
G1 X73.63 Y90.826 E.0248
G1 X73.628 Y90.282
G1 X74.328 Y89.583 E.02487
G1 X74.328 Y89.037
G1 X73.626 Y89.739 E.02494
G1 X73.625 Y89.195
G1 X74.434 Y88.385 E.0288
; WIPE_START
G1 F11668.197
M204 S6000
G1 X73.625 Y89.195 E-.43525
G1 X73.626 Y89.739 E-.20652
G1 X73.846 Y89.519 E-.11823
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.953 Y91.32 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
G1 F2086
M204 S2000
G1 X77.776 Y90.498 E.02926
G1 X77.777 Y89.952
G1 X76.972 Y90.756 E.0286
G1 X76.972 Y90.211
G1 X77.777 Y89.406 E.02862
G1 X77.778 Y88.86
G1 X76.972 Y89.665 E.02864
G1 X76.972 Y89.12
G1 X77.76 Y88.332 E.02801
G1 X77.678 Y87.869
G1 X76.932 Y88.615 E.02653
G1 X76.781 Y88.221
G1 X77.578 Y87.423 E.02835
G1 X77.347 Y87.109
G1 X76.534 Y87.922 E.02892
G1 X76.207 Y87.704
G1 X77.023 Y86.888 E.02901
G1 X76.69 Y86.675
G1 X75.779 Y87.586 E.03236
G1 X75.137 Y87.682
G1 X76.305 Y86.515 E.04151
G1 X75.846 Y86.429
G1 X73.623 Y88.652 E.07904
G1 X73.678 Y88.051
G1 X75.257 Y86.472 E.05615
; WIPE_START
G1 F11668.197
M204 S6000
G1 X73.843 Y87.886 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.237 Y92.282 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.107467
G1 F2086
M204 S6000
G3 X75.943 Y92.478 I-2.325 J-3.177 E.00169
; WIPE_START
G1 F18000
G1 X76.237 Y92.282 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.074 Y87.619 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.202696
G1 F2086
M204 S6000
G1 X74.954 Y87.705 E.00163
; LINE_WIDTH: 0.161337
G1 X74.656 Y87.971 E.00331
G1 X74.513 Y88.131 E.00177
; LINE_WIDTH: 0.191121
G1 X74.369 Y88.319 E.00242
; WIPE_START
G1 F18000
G1 X74.513 Y88.131 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X74.789 Y86.639 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.100573
G1 F2086
M204 S6000
G1 X74.673 Y86.722 E.00061
; LINE_WIDTH: 0.134797
G1 X74.555 Y86.819 E.001
; LINE_WIDTH: 0.174831
G2 X74.019 Y87.351 I2.771 J3.33 E.00693
; LINE_WIDTH: 0.136613
G1 X73.925 Y87.474 E.00103
; LINE_WIDTH: 0.0992787
G1 X73.83 Y87.597 E.00066
; WIPE_START
G1 F18000
G1 X73.925 Y87.474 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.023 Y91.39 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.159149
G1 F2086
M204 S6000
G1 X76.845 Y91.686 E.00281
; WIPE_START
G1 F18000
G1 X77.023 Y91.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.597 Y92.673 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.128214
G1 F2086
M204 S6000
G1 X77.435 Y92.806 E.00128
; LINE_WIDTH: 0.0964781
G1 X77.273 Y92.939 E.00085
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F18000
G1 X77.435 Y92.806 E-.76
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


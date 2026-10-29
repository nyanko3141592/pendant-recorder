; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 4m 49s; total estimated time: 5m 8s
; total layer number: 25
; total filament length [mm] : 443.02
; total filament volume [cm^3] : 1065.60
; total filament weight [g] : 1.32
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 4.04
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
M73 P2 R4
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
; layer num/total_layer_count: 1/25
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
M73 P5 R4
G1 X77.972 Y76.244 F42000
M204 S6000
M73 P6 R4
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X78.05 Y76.193 E.00348
G3 X78.381 Y76.108 I.362 J.719 E.01281
G1 X101.675 Y76.111 E.86762
G3 X102.391 Y76.86 I-.078 J.792 E.04205
G1 X102.392 Y103.111 E.97774
G3 X101.582 Y103.893 I-.795 J-.013 E.0466
G1 X78.389 Y103.892 E.86384
G3 X77.607 Y103.091 I.015 J-.797 E.04624
G1 X77.608 Y76.884 E.97611
G3 X77.85 Y76.336 I.805 J.028 E.02288
G1 X77.924 Y76.28 E.00345
M204 S6000
G1 X77.696 Y75.871 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X77.727 Y75.854 E.00133
G3 X78.369 Y75.65 I.69 J1.063 E.02538
G1 X101.723 Y75.656 E.86984
G3 X102.848 Y76.838 I-.128 J1.248 E.06615
G1 X102.85 Y103.128 E.97923
M73 P7 R4
G3 X101.593 Y104.35 I-1.252 J-.031 E.07229
G1 X78.372 Y104.35 E.8649
G3 X77.15 Y103.097 I.032 J-1.254 E.07214
G1 X77.15 Y76.87 E.97685
G3 X77.532 Y76.01 I1.266 J.047 E.03591
G1 X77.65 Y75.91 E.00578
; WIPE_START
G1 X77.727 Y75.854 E-.03623
G1 X77.855 Y75.775 E-.05692
G1 X78.092 Y75.689 E-.09577
G1 X78.369 Y75.65 E-.10644
G1 X79.592 Y75.651 E-.46464
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

G1 X100.915 Y76.294
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50103
G1 F6300
M204 S500
G1 X102.003 Y77.381 E.05741
G1 X102.003 Y78.029 E.02419
G1 X100.473 Y76.5 E.08076
G1 X99.825 Y76.499 E.02419
G1 X102.003 Y78.677 E.11497
G1 X102.003 Y79.325 E.02419
G1 X99.177 Y76.499 E.14918
G1 X98.529 Y76.499 E.02419
G1 X102.003 Y79.973 E.18339
G1 X102.003 Y80.621 E.02419
G1 X97.881 Y76.499 E.2176
M73 P8 R4
G1 X97.233 Y76.499 E.02419
G1 X102.003 Y81.269 E.25181
G1 X102.003 Y81.917 E.02419
G1 X96.585 Y76.499 E.28602
G1 X95.937 Y76.499 E.02419
G1 X102.003 Y82.565 E.32023
G1 X102.003 Y83.213 E.02419
G1 X95.289 Y76.499 E.35444
G1 X94.641 Y76.499 E.02419
G1 X102.003 Y83.86 E.38865
G1 X102.003 Y84.508 E.02419
G1 X93.993 Y76.499 E.42286
G1 X93.345 Y76.498 E.02419
G1 X102.003 Y85.156 E.45707
G1 X102.003 Y85.804 E.02419
G1 X92.697 Y76.498 E.49128
G1 X92.049 Y76.498 E.02419
G1 X102.003 Y86.452 E.52549
G1 X102.003 Y87.1 E.02419
G1 X91.401 Y76.498 E.5597
G1 X90.753 Y76.498 E.02419
M73 P9 R4
G1 X102.003 Y87.748 E.59391
G1 X102.003 Y88.396 E.02419
G1 X90.105 Y76.498 E.62812
G1 X89.457 Y76.498 E.02419
G1 X102.003 Y89.044 E.66233
G1 X102.003 Y89.692 E.02419
G1 X88.809 Y76.498 E.69654
G1 X88.161 Y76.498 E.02419
G1 X102.003 Y90.339 E.73075
G1 X102.003 Y90.987 E.02419
G1 X87.513 Y76.497 E.76496
G1 X86.866 Y76.497 E.02419
G1 X102.003 Y91.635 E.79917
G1 X102.003 Y92.283 E.02419
G1 X86.218 Y76.497 E.83338
M73 P10 R4
G1 X85.57 Y76.497 E.02419
G1 X102.003 Y92.931 E.86759
G1 X102.003 Y93.579 E.02419
G1 X84.922 Y76.497 E.9018
G1 X84.274 Y76.497 E.02419
G1 X102.003 Y94.227 E.93601
G1 X102.004 Y94.875 E.02419
G1 X83.626 Y76.497 E.97022
G1 X82.978 Y76.497 E.02419
G1 X102.004 Y95.523 E1.00443
G1 X102.004 Y96.171 E.02419
G1 X82.33 Y76.497 E1.03864
G1 X81.682 Y76.497 E.02419
G1 X102.004 Y96.818 E1.07285
M73 P11 R4
G1 X102.004 Y97.466 E.02419
G1 X81.034 Y76.496 E1.10706
G1 X80.386 Y76.496 E.02419
G1 X102.004 Y98.114 E1.14127
G1 X102.004 Y98.762 E.02419
G1 X79.738 Y76.496 E1.17548
G1 X79.09 Y76.496 E.02419
G1 X102.004 Y99.41 E1.20969
G1 X102.004 Y100.058 E.02419
G1 X78.442 Y76.496 E1.2439
G2 X78.037 Y76.739 I-.006 J.448 E.01856
G1 X102.004 Y100.706 E1.26527
M73 P12 R4
G1 X102.004 Y101.354 E.02419
G1 X77.996 Y77.346 E1.26744
G1 X77.996 Y77.994 E.02418
G1 X102.004 Y102.002 E1.26744
G1 X102.004 Y102.65 E.02419
G1 X77.996 Y78.642 E1.26744
G1 X77.996 Y79.289 E.02418
G1 X101.964 Y103.258 E1.26536
G3 X101.563 Y103.504 I-.376 J-.163 E.01873
G1 X77.996 Y79.937 E1.24417
G1 X77.996 Y80.585 E.02418
G1 X100.915 Y103.504 E1.20997
M73 P13 R4
G1 X100.267 Y103.504 E.02419
G1 X77.996 Y81.233 E1.17577
G1 X77.996 Y81.881 E.02418
G1 X99.619 Y103.504 E1.14157
G1 X98.972 Y103.504 E.02419
G1 X77.996 Y82.529 E1.10736
G1 X77.996 Y83.177 E.02418
G1 X98.324 Y103.504 E1.07316
G1 X97.676 Y103.504 E.02419
G1 X77.996 Y83.824 E1.03896
G1 X77.996 Y84.472 E.02418
G1 X97.028 Y103.504 E1.00476
M73 P14 R4
G1 X96.38 Y103.504 E.02419
G1 X77.996 Y85.12 E.97055
G1 X77.996 Y85.768 E.02418
G1 X95.732 Y103.504 E.93635
G1 X95.084 Y103.504 E.02419
G1 X77.996 Y86.416 E.90215
G1 X77.996 Y87.064 E.02418
G1 X94.436 Y103.504 E.86795
G1 X93.789 Y103.504 E.02419
G1 X77.996 Y87.712 E.83374
G1 X77.996 Y88.359 E.02418
G1 X93.141 Y103.504 E.79954
G1 X92.493 Y103.504 E.02419
M73 P15 R4
G1 X77.996 Y89.007 E.76534
G1 X77.996 Y89.655 E.02418
G1 X91.845 Y103.504 E.73113
G1 X91.197 Y103.504 E.02419
G1 X77.996 Y90.303 E.69693
G1 X77.996 Y90.951 E.02418
G1 X90.549 Y103.504 E.66273
G1 X89.901 Y103.504 E.02419
G1 X77.996 Y91.599 E.62853
G1 X77.996 Y92.247 E.02418
G1 X89.253 Y103.504 E.59432
G1 X88.606 Y103.504 E.02419
G1 X77.996 Y92.894 E.56012
G1 X77.996 Y93.542 E.02418
G1 X87.958 Y103.504 E.52592
M73 P16 R4
G1 X87.31 Y103.504 E.02419
G1 X77.996 Y94.19 E.49171
G1 X77.996 Y94.838 E.02418
G1 X86.662 Y103.504 E.45751
G1 X86.014 Y103.504 E.02419
G1 X77.996 Y95.486 E.42331
G1 X77.996 Y96.134 E.02418
G1 X85.366 Y103.504 E.38911
G1 X84.718 Y103.504 E.02419
G1 X77.996 Y96.782 E.3549
G1 X77.996 Y97.429 E.02418
G1 X84.07 Y103.504 E.3207
G1 X83.423 Y103.504 E.02419
G1 X77.996 Y98.077 E.2865
G1 X77.996 Y98.725 E.02418
G1 X82.775 Y103.504 E.2523
G1 X82.127 Y103.504 E.02419
G1 X77.996 Y99.373 E.21809
G1 X77.996 Y100.021 E.02418
G1 X81.479 Y103.504 E.18389
G1 X80.831 Y103.504 E.02419
G1 X77.996 Y100.669 E.14969
M73 P17 R4
G1 X77.996 Y101.316 E.02418
G1 X80.183 Y103.504 E.11549
G1 X79.535 Y103.504 E.02419
G1 X77.996 Y101.964 E.08128
G1 X77.996 Y102.612 E.02418
G1 X78.887 Y103.504 E.04708
G1 X78.424 Y103.504 E.01729
G3 X78.149 Y103.413 I-.009 J-.434 E.01104
G1 X77.79 Y103.054 E.01894
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6300
G1 X78.149 Y103.413 E-.19278
G1 X78.251 Y103.473 E-.04503
G1 X78.424 Y103.504 E-.0668
G1 X78.887 Y103.504 E-.17605
G1 X78.368 Y102.984 E-.27934
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/25
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.6 I1.217 J-.021 P1  F42000
G1 X77.899 Y76.17 Z.6
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X77.932 Y76.149 E.00105
G3 X78.386 Y76.011 I.48 J.763 E.013
G1 X101.685 Y76.015 E.63134
G3 X102.487 Y76.856 I-.089 J.888 E.03428
G1 X102.489 Y103.118 E.71164
G3 X101.584 Y103.989 I-.891 J-.021 E.03776
G1 X78.384 Y103.989 E.62865
G3 X77.511 Y103.084 I.018 J-.891 E.03782
G1 X77.511 Y76.885 E.70991
G3 X77.783 Y76.267 I.902 J.027 E.01875
G1 X77.853 Y76.208 E.00249
M204 S250
G1 X77.654 Y75.856 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X77.728 Y75.806 E.00227
G3 X78.371 Y75.61 I.689 J1.111 E.01708
G1 X101.727 Y75.617 E.58721
G3 X102.888 Y76.836 I-.132 J1.288 E.04607
G1 X102.89 Y103.131 E.6611
G3 X101.594 Y104.39 I-1.292 J-.033 E.05029
G1 X78.372 Y104.39 E.58385
G3 X77.11 Y103.094 I.031 J-1.292 E.05035
G1 X77.11 Y76.87 E.65931
G3 X77.504 Y75.981 I1.307 J.047 E.02504
G1 X77.608 Y75.895 E.0034
; WIPE_START
M204 S6000
G1 X77.728 Y75.806 E-.05698
G1 X77.959 Y75.688 E-.0984
G1 X78.143 Y75.636 E-.07272
G1 X78.371 Y75.61 E-.08712
G1 X79.541 Y75.611 E-.44478
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

G1 X77.683 Y76.849
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421626
G1 F11619.2
M204 S6000
G1 X78.047 Y76.485 E.013
G3 X78.164 Y76.407 I.236 J.229 E.00357
G3 X78.728 Y76.352 I.396 J1.125 E.01445
G1 X77.852 Y77.228 E.0313
G1 X77.852 Y77.776 E.01383
G1 X79.276 Y76.352 E.05085
G1 X79.823 Y76.352 E.01383
G1 X77.852 Y78.324 E.0704
G1 X77.852 Y78.871 E.01383
G1 X80.371 Y76.352 E.08995
G1 X80.919 Y76.352 E.01383
G1 X77.852 Y79.419 E.10951
G1 X77.852 Y79.967 E.01383
G1 X81.466 Y76.352 E.12906
G1 X82.014 Y76.352 E.01383
G1 X77.852 Y80.515 E.14861
G1 X77.852 Y81.062 E.01383
G1 X82.561 Y76.352 E.16817
M73 P18 R4
G1 X83.109 Y76.353 E.01383
G1 X77.852 Y81.61 E.18772
G1 X77.852 Y82.158 E.01383
G1 X83.657 Y76.353 E.20727
G1 X84.204 Y76.353 E.01383
G1 X77.852 Y82.705 E.22682
G1 X77.852 Y83.253 E.01383
G1 X84.752 Y76.353 E.24638
G1 X85.3 Y76.353 E.01383
G1 X77.852 Y83.801 E.26593
G1 X77.852 Y84.349 E.01383
G1 X85.847 Y76.353 E.28548
G1 X86.395 Y76.353 E.01383
G1 X77.852 Y84.896 E.30504
G1 X77.852 Y85.444 E.01383
G1 X86.942 Y76.353 E.32459
G1 X87.49 Y76.353 E.01383
G1 X77.852 Y85.992 E.34414
G1 X77.852 Y86.539 E.01383
G1 X88.038 Y76.353 E.3637
G1 X88.585 Y76.354 E.01383
G1 X77.852 Y87.087 E.38325
G1 X77.852 Y87.635 E.01383
G1 X89.133 Y76.354 E.4028
G1 X89.68 Y76.354 E.01383
G1 X77.851 Y88.183 E.42235
G1 X77.851 Y88.73 E.01383
G1 X90.228 Y76.354 E.44191
G1 X90.776 Y76.354 E.01383
G1 X77.851 Y89.278 E.46146
G1 X77.851 Y89.826 E.01383
G1 X91.323 Y76.354 E.48101
G1 X91.871 Y76.354 E.01383
G1 X77.851 Y90.374 E.50057
G1 X77.851 Y90.921 E.01383
G1 X92.418 Y76.354 E.52012
G1 X92.966 Y76.354 E.01383
G1 X77.851 Y91.469 E.53967
G1 X77.851 Y92.017 E.01383
G1 X93.514 Y76.354 E.55922
G1 X94.061 Y76.355 E.01383
G1 X77.851 Y92.564 E.57878
G1 X77.851 Y93.112 E.01383
G1 X94.609 Y76.355 E.59833
G1 X95.157 Y76.355 E.01383
G1 X77.851 Y93.66 E.61788
G1 X77.851 Y94.208 E.01383
G1 X95.704 Y76.355 E.63744
G1 X96.252 Y76.355 E.01383
G1 X77.851 Y94.755 E.65699
M73 P19 R4
G1 X77.851 Y95.303 E.01383
G1 X96.799 Y76.355 E.67654
G1 X97.347 Y76.355 E.01383
G1 X77.851 Y95.851 E.6961
G1 X77.851 Y96.398 E.01383
G1 X97.895 Y76.355 E.71565
G1 X98.442 Y76.355 E.01383
G1 X77.851 Y96.946 E.7352
G1 X77.851 Y97.494 E.01383
G1 X98.99 Y76.355 E.75475
G1 X99.537 Y76.356 E.01383
G1 X77.851 Y98.042 E.77431
G1 X77.851 Y98.589 E.01383
G1 X100.085 Y76.356 E.79386
G1 X100.633 Y76.356 E.01383
G1 X77.851 Y99.137 E.81341
G1 X77.851 Y99.685 E.01383
G1 X101.18 Y76.356 E.83297
G1 X101.643 Y76.356 E.01168
G1 X101.711 Y76.373 E.00177
G1 X77.851 Y100.233 E.8519
G1 X77.851 Y100.78 E.01383
G1 X102.046 Y76.586 E.86387
G3 X102.147 Y77.032 I-.529 J.355 E.01183
G1 X77.851 Y101.328 E.86748
G1 X77.851 Y101.876 E.01383
G1 X102.147 Y77.58 E.86748
G1 X102.147 Y78.128 E.01383
G1 X77.851 Y102.423 E.86749
G1 X77.851 Y102.971 E.01383
G1 X102.147 Y78.675 E.86749
M73 P20 R4
G1 X102.147 Y79.223 E.01383
G1 X77.956 Y103.414 E.86376
G2 X78.285 Y103.633 I.448 J-.317 E.0102
G1 X102.147 Y79.771 E.85201
G1 X102.147 Y80.318 E.01383
G1 X78.817 Y103.648 E.833
G1 X79.365 Y103.648 E.01383
G1 X102.147 Y80.866 E.81345
G1 X102.147 Y81.414 E.01383
G1 X79.912 Y103.648 E.79389
G1 X80.46 Y103.648 E.01383
G1 X102.147 Y81.961 E.77434
G1 X102.147 Y82.509 E.01383
G1 X81.008 Y103.648 E.75478
G1 X81.556 Y103.648 E.01383
G1 X102.147 Y83.057 E.73523
G1 X102.147 Y83.604 E.01383
G1 X82.103 Y103.648 E.71567
G1 X82.651 Y103.648 E.01383
G1 X102.147 Y84.152 E.69612
G1 X102.147 Y84.7 E.01383
G1 X83.199 Y103.648 E.67657
G1 X83.746 Y103.648 E.01383
G1 X102.147 Y85.247 E.65701
G1 X102.147 Y85.795 E.01383
G1 X84.294 Y103.648 E.63746
G1 X84.842 Y103.648 E.01383
G1 X102.147 Y86.343 E.6179
G1 X102.147 Y86.891 E.01383
G1 X85.389 Y103.649 E.59835
M73 P21 R4
G1 X85.937 Y103.649 E.01383
G1 X102.147 Y87.438 E.57879
G1 X102.148 Y87.986 E.01383
G1 X86.485 Y103.649 E.55924
G1 X87.033 Y103.649 E.01383
G1 X102.148 Y88.534 E.53968
G1 X102.148 Y89.081 E.01383
G1 X87.58 Y103.649 E.52013
G1 X88.128 Y103.649 E.01383
G1 X102.148 Y89.629 E.50057
G1 X102.148 Y90.177 E.01383
G1 X88.676 Y103.649 E.48102
G1 X89.223 Y103.649 E.01383
G1 X102.148 Y90.724 E.46146
G1 X102.148 Y91.272 E.01383
G1 X89.771 Y103.649 E.44191
G1 X90.319 Y103.649 E.01383
G1 X102.148 Y91.82 E.42235
G1 X102.148 Y92.367 E.01383
G1 X90.866 Y103.649 E.4028
G1 X91.414 Y103.649 E.01383
G1 X102.148 Y92.915 E.38324
G1 X102.148 Y93.463 E.01383
G1 X91.962 Y103.649 E.36369
G1 X92.51 Y103.649 E.01383
G1 X102.148 Y94.01 E.34414
G1 X102.148 Y94.558 E.01383
G1 X93.057 Y103.649 E.32458
G1 X93.605 Y103.649 E.01383
G1 X102.148 Y95.106 E.30503
G1 X102.148 Y95.653 E.01383
G1 X94.153 Y103.649 E.28547
G1 X94.7 Y103.649 E.01383
G1 X102.148 Y96.201 E.26592
G1 X102.148 Y96.749 E.01383
G1 X95.248 Y103.649 E.24636
G1 X95.796 Y103.649 E.01383
G1 X102.148 Y97.296 E.22681
G1 X102.148 Y97.844 E.01383
G1 X96.344 Y103.649 E.20725
G1 X96.891 Y103.649 E.01383
G1 X102.148 Y98.392 E.1877
G1 X102.148 Y98.94 E.01383
G1 X97.439 Y103.649 E.16814
G1 X97.987 Y103.649 E.01383
G1 X102.148 Y99.487 E.14859
G1 X102.148 Y100.035 E.01383
G1 X98.534 Y103.649 E.12903
G1 X99.082 Y103.649 E.01383
G1 X102.148 Y100.583 E.10948
G1 X102.148 Y101.13 E.01383
G1 X99.63 Y103.649 E.08992
M73 P22 R4
G1 X100.177 Y103.649 E.01383
G1 X102.148 Y101.678 E.07037
G1 X102.148 Y102.226 E.01383
G1 X100.725 Y103.649 E.05082
G1 X101.273 Y103.649 E.01383
G1 X102.148 Y102.773 E.03126
G1 X102.148 Y103.099 E.00822
G3 X102.011 Y103.458 I-.584 J-.017 E.0099
G1 X101.655 Y103.815 E.01272
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11619.2
G1 X102.011 Y103.458 E-.19152
G1 X102.112 Y103.29 E-.07471
G1 X102.148 Y103.099 E-.07377
G1 X102.148 Y102.773 E-.12371
G1 X101.597 Y103.325 E-.29629
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/25
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.76 I.916 J-.801 P1  F42000
G1 X77.861 Y76.2 Z.76
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X77.926 Y76.153 E.00218
G3 X78.386 Y76.011 I.487 J.76 E.0132
G1 X101.685 Y76.015 E.63134
G3 X102.487 Y76.856 I-.089 J.888 E.03428
G1 X102.489 Y103.114 E.71153
G3 X101.584 Y103.989 I-.891 J-.016 E.03786
G1 X78.382 Y103.989 E.62872
G3 X77.511 Y103.091 I.02 J-.891 E.03758
G1 X77.511 Y76.882 E.71018
M73 P22 R3
G3 X77.783 Y76.267 I.902 J.031 E.01867
G1 X77.815 Y76.239 E.00117
M204 S250
G1 X77.612 Y75.887 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X77.708 Y75.819 E.00295
G3 X78.371 Y75.61 I.709 J1.098 E.01769
G1 X101.727 Y75.617 E.58721
G3 X102.888 Y76.836 I-.132 J1.288 E.04607
G1 X102.89 Y103.13 E.66106
G3 X101.594 Y104.39 I-1.292 J-.032 E.05031
G1 X78.369 Y104.39 E.58391
G3 X77.11 Y103.097 I.033 J-1.292 E.05023
G1 X77.11 Y76.869 E.6594
G3 X77.504 Y75.981 I1.307 J.048 E.02502
G1 X77.567 Y75.926 E.0021
; WIPE_START
M204 S6000
G1 X77.708 Y75.819 E-.06727
G1 X77.838 Y75.739 E-.05798
G1 X78.108 Y75.644 E-.10882
G1 X78.371 Y75.61 E-.10074
G1 X79.49 Y75.611 E-.4252
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

G1 X102.317 Y76.844
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421656
G1 F11618.3
M204 S6000
G2 X101.912 Y76.451 I-2.239 J1.902 E.01426
G2 X101.643 Y76.356 I-.32 J.476 E.00729
G1 X101.281 Y76.356 E.00914
G1 X102.147 Y77.222 E.03093
G1 X102.147 Y77.77 E.01383
G1 X100.733 Y76.356 E.05049
G1 X100.185 Y76.356 E.01383
G1 X102.147 Y78.317 E.07005
G1 X102.147 Y78.865 E.01383
G1 X99.637 Y76.356 E.08962
G1 X99.089 Y76.355 E.01383
G1 X102.147 Y79.413 E.10918
G1 X102.147 Y79.961 E.01383
G1 X98.542 Y76.355 E.12874
G1 X97.994 Y76.355 E.01383
G1 X102.147 Y80.509 E.14831
G1 X102.147 Y81.056 E.01383
G1 X97.446 Y76.355 E.16787
G1 X96.898 Y76.355 E.01383
G1 X102.147 Y81.604 E.18744
G1 X102.147 Y82.152 E.01383
G1 X96.35 Y76.355 E.207
G1 X95.802 Y76.355 E.01383
G1 X102.147 Y82.7 E.22656
G1 X102.147 Y83.248 E.01383
G1 X95.254 Y76.355 E.24613
G1 X94.707 Y76.355 E.01383
G1 X102.147 Y83.795 E.26569
G1 X102.147 Y84.343 E.01383
G1 X94.159 Y76.355 E.28525
M73 P23 R3
G1 X93.611 Y76.354 E.01383
G1 X102.147 Y84.891 E.30482
G1 X102.147 Y85.439 E.01383
G1 X93.063 Y76.354 E.32438
G1 X92.515 Y76.354 E.01383
G1 X102.147 Y85.986 E.34395
G1 X102.147 Y86.534 E.01383
G1 X91.967 Y76.354 E.36351
G1 X91.42 Y76.354 E.01383
G1 X102.147 Y87.082 E.38307
G1 X102.147 Y87.63 E.01383
G1 X90.872 Y76.354 E.40264
G1 X90.324 Y76.354 E.01383
G1 X102.148 Y88.178 E.4222
G1 X102.148 Y88.725 E.01383
G1 X89.776 Y76.354 E.44176
G1 X89.228 Y76.354 E.01383
G1 X102.148 Y89.273 E.46133
G1 X102.148 Y89.821 E.01383
G1 X88.68 Y76.354 E.48089
G1 X88.132 Y76.353 E.01383
G1 X102.148 Y90.369 E.50046
G1 X102.148 Y90.916 E.01383
G1 X87.585 Y76.353 E.52002
G1 X87.037 Y76.353 E.01383
G1 X102.148 Y91.464 E.53958
G1 X102.148 Y92.012 E.01383
G1 X86.489 Y76.353 E.55915
G1 X85.941 Y76.353 E.01383
G1 X102.148 Y92.56 E.57871
G1 X102.148 Y93.108 E.01383
G1 X85.393 Y76.353 E.59827
G1 X84.845 Y76.353 E.01383
G1 X102.148 Y93.655 E.61784
G1 X102.148 Y94.203 E.01383
G1 X84.297 Y76.353 E.6374
G1 X83.75 Y76.353 E.01383
G1 X102.148 Y94.751 E.65697
G1 X102.148 Y95.299 E.01383
G1 X83.202 Y76.353 E.67653
G1 X82.654 Y76.352 E.01383
G1 X102.148 Y95.847 E.69609
G1 X102.148 Y96.394 E.01383
G1 X82.106 Y76.352 E.71566
M73 P24 R3
G1 X81.558 Y76.352 E.01383
G1 X102.148 Y96.942 E.73522
G1 X102.148 Y97.49 E.01383
G1 X81.01 Y76.352 E.75478
G1 X80.462 Y76.352 E.01383
G1 X102.148 Y98.038 E.77435
G1 X102.148 Y98.585 E.01383
G1 X79.915 Y76.352 E.79391
G1 X79.367 Y76.352 E.01383
G1 X102.148 Y99.133 E.81348
G1 X102.148 Y99.681 E.01383
G1 X78.819 Y76.352 E.83304
G2 X78.286 Y76.367 I-.206 J2.117 E.01349
G1 X102.148 Y100.229 E.85206
G1 X102.148 Y100.777 E.01383
G1 X77.96 Y76.589 E.8637
G2 X77.852 Y77.028 I.627 J.388 E.01161
G1 X102.148 Y101.324 E.86758
G1 X102.148 Y101.872 E.01383
G1 X77.852 Y77.576 E.86758
G1 X77.852 Y78.123 E.01383
G1 X102.148 Y102.42 E.86758
G1 X102.148 Y102.968 E.01383
G1 X77.852 Y78.671 E.86758
G1 X77.852 Y79.219 E.01383
G1 X102.042 Y103.409 E.86377
G3 X101.718 Y103.633 I-.426 J-.27 E.01021
G1 X77.852 Y79.767 E.85221
M73 P25 R3
G1 X77.852 Y80.314 E.01383
G1 X101.186 Y103.649 E.83323
G1 X100.638 Y103.649 E.01383
G1 X77.852 Y80.862 E.81367
G1 X77.852 Y81.41 E.01383
G1 X100.091 Y103.649 E.79411
G1 X99.543 Y103.649 E.01383
G1 X77.852 Y81.957 E.77455
G1 X77.852 Y82.505 E.01383
G1 X98.995 Y103.649 E.75499
G1 X98.447 Y103.649 E.01383
G1 X77.852 Y83.053 E.73543
G1 X77.852 Y83.601 E.01383
G1 X97.9 Y103.649 E.71587
G1 X97.352 Y103.649 E.01383
G1 X77.852 Y84.148 E.69631
G1 X77.852 Y84.696 E.01383
G1 X96.804 Y103.649 E.67676
G1 X96.256 Y103.649 E.01383
G1 X77.852 Y85.244 E.6572
G1 X77.852 Y85.792 E.01383
G1 X95.709 Y103.649 E.63764
G1 X95.161 Y103.649 E.01383
G1 X77.852 Y86.339 E.61808
G1 X77.852 Y86.887 E.01383
G1 X94.613 Y103.649 E.59852
G1 X94.065 Y103.649 E.01383
G1 X77.851 Y87.435 E.57896
G1 X77.851 Y87.983 E.01383
G1 X93.517 Y103.649 E.5594
G1 X92.97 Y103.649 E.01383
G1 X77.851 Y88.53 E.53984
M73 P26 R3
G1 X77.851 Y89.078 E.01383
G1 X92.422 Y103.649 E.52028
G1 X91.874 Y103.649 E.01383
G1 X77.851 Y89.626 E.50072
G1 X77.851 Y90.174 E.01383
G1 X91.326 Y103.649 E.48116
G1 X90.779 Y103.649 E.01383
G1 X77.851 Y90.721 E.4616
G1 X77.851 Y91.269 E.01383
G1 X90.231 Y103.649 E.44204
G1 X89.683 Y103.649 E.01383
G1 X77.851 Y91.817 E.42249
G1 X77.851 Y92.365 E.01383
G1 X89.135 Y103.649 E.40293
G1 X88.588 Y103.649 E.01383
G1 X77.851 Y92.912 E.38337
G1 X77.851 Y93.46 E.01383
G1 X88.04 Y103.649 E.36381
G1 X87.492 Y103.649 E.01383
G1 X77.851 Y94.008 E.34425
G1 X77.851 Y94.556 E.01383
G1 X86.944 Y103.648 E.32469
G1 X86.397 Y103.648 E.01383
G1 X77.851 Y95.103 E.30513
G1 X77.851 Y95.651 E.01383
G1 X85.849 Y103.648 E.28557
G1 X85.301 Y103.648 E.01383
G1 X77.851 Y96.199 E.26601
G1 X77.851 Y96.747 E.01383
G1 X84.753 Y103.648 E.24645
G1 X84.205 Y103.648 E.01383
G1 X77.851 Y97.294 E.22689
G1 X77.851 Y97.842 E.01383
G1 X83.658 Y103.648 E.20733
G1 X83.11 Y103.648 E.01383
G1 X77.851 Y98.39 E.18778
G1 X77.851 Y98.938 E.01383
G1 X82.562 Y103.648 E.16822
G1 X82.014 Y103.648 E.01383
G1 X77.851 Y99.485 E.14866
G1 X77.851 Y100.033 E.01383
G1 X81.467 Y103.648 E.1291
G1 X80.919 Y103.648 E.01383
G1 X77.851 Y100.581 E.10954
G1 X77.851 Y101.128 E.01383
G1 X80.371 Y103.648 E.08998
G1 X79.823 Y103.648 E.01383
G1 X77.851 Y101.676 E.07042
G1 X77.851 Y102.224 E.01383
G1 X79.276 Y103.648 E.05086
G1 X78.728 Y103.648 E.01383
G1 X77.851 Y102.772 E.0313
G2 X77.904 Y103.328 I1.29 J.159 E.01422
G2 X78.019 Y103.487 I.424 J-.186 E.00501
G1 X78.349 Y103.817 E.01177
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11618.3
G1 X78.019 Y103.487 E-.17712
G1 X77.904 Y103.328 E-.07487
G1 X77.868 Y103.223 E-.04192
G1 X77.851 Y103.072 E-.05788
G1 X77.851 Y102.772 E-.11413
G1 X78.398 Y103.319 E-.29408
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/25
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.92 I1.217 J-.025 P1  F42000
G1 X77.842 Y76.214 Z.92
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
M73 P27 R3
G1 X77.938 Y76.143 E.00324
G3 X78.386 Y76.011 I.468 J.764 E.01278
G1 X101.686 Y76.015 E.63136
G3 X102.487 Y76.856 I-.087 J.886 E.03429
G1 X102.489 Y103.117 E.71162
G3 X101.584 Y103.989 I-.891 J-.02 E.03778
G1 X78.382 Y103.989 E.62871
G3 X77.511 Y103.084 I.02 J-.891 E.03776
G1 X77.511 Y76.882 E.71001
G3 X77.787 Y76.26 I.895 J.025 E.0189
G1 X77.796 Y76.252 E.00033
M204 S250
G1 X77.599 Y75.899 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X77.73 Y75.802 E.00408
G3 X78.371 Y75.61 I.68 J1.107 E.01701
G1 X101.728 Y75.617 E.58723
G3 X102.888 Y76.836 I-.13 J1.286 E.04608
G1 X102.89 Y103.131 E.66109
G3 X101.594 Y104.39 I-1.292 J-.033 E.05029
G1 X78.369 Y104.39 E.58391
G3 X77.11 Y103.094 I.033 J-1.292 E.05029
G1 X77.11 Y76.869 E.65934
G3 X77.504 Y75.977 I1.299 J.04 E.02512
G1 X77.553 Y75.937 E.00159
; WIPE_START
M204 S6000
G1 X77.73 Y75.802 E-.08449
G1 X77.961 Y75.687 E-.09827
G1 X78.107 Y75.644 E-.05757
G1 X78.371 Y75.61 E-.10115
G1 X79.472 Y75.611 E-.41852
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

G1 X77.688 Y76.844
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421626
G1 F11619.2
M204 S6000
G1 X78.024 Y76.508 E.012
G3 X78.163 Y76.408 I.299 J.269 E.00434
G3 X78.728 Y76.352 I.405 J1.196 E.01448
G1 X77.852 Y77.228 E.0313
G1 X77.852 Y77.776 E.01383
G1 X79.276 Y76.352 E.05085
G1 X79.824 Y76.352 E.01383
G1 X77.852 Y78.324 E.0704
G1 X77.852 Y78.872 E.01383
G1 X80.371 Y76.352 E.08996
G1 X80.919 Y76.352 E.01383
G1 X77.852 Y79.419 E.10951
G1 X77.852 Y79.967 E.01383
G1 X81.466 Y76.352 E.12906
G1 X82.014 Y76.352 E.01383
G1 X77.852 Y80.515 E.14862
G1 X77.852 Y81.062 E.01383
G1 X82.562 Y76.352 E.16817
G1 X83.109 Y76.353 E.01383
G1 X77.852 Y81.61 E.18772
G1 X77.852 Y82.158 E.01383
G1 X83.657 Y76.353 E.20728
G1 X84.204 Y76.353 E.01383
G1 X77.852 Y82.706 E.22683
G1 X77.852 Y83.253 E.01383
G1 X84.752 Y76.353 E.24638
G1 X85.3 Y76.353 E.01383
G1 X77.852 Y83.801 E.26593
G1 X77.852 Y84.349 E.01383
G1 X85.847 Y76.353 E.28549
G1 X86.395 Y76.353 E.01383
G1 X77.852 Y84.896 E.30504
G1 X77.852 Y85.444 E.01383
G1 X86.942 Y76.353 E.32459
G1 X87.49 Y76.353 E.01383
G1 X77.852 Y85.992 E.34415
G1 X77.852 Y86.54 E.01383
G1 X88.038 Y76.353 E.3637
G1 X88.585 Y76.354 E.01383
G1 X77.852 Y87.087 E.38325
G1 X77.851 Y87.635 E.01383
M73 P28 R3
G1 X89.133 Y76.354 E.4028
G1 X89.68 Y76.354 E.01383
G1 X77.851 Y88.183 E.42236
G1 X77.851 Y88.73 E.01383
G1 X90.228 Y76.354 E.44191
G1 X90.776 Y76.354 E.01383
G1 X77.851 Y89.278 E.46146
G1 X77.851 Y89.826 E.01383
G1 X91.323 Y76.354 E.48102
G1 X91.871 Y76.354 E.01383
G1 X77.851 Y90.374 E.50057
G1 X77.851 Y90.921 E.01383
G1 X92.419 Y76.354 E.52012
G1 X92.966 Y76.354 E.01383
G1 X77.851 Y91.469 E.53967
G1 X77.851 Y92.017 E.01383
G1 X93.514 Y76.354 E.55923
G1 X94.061 Y76.355 E.01383
G1 X77.851 Y92.565 E.57878
G1 X77.851 Y93.112 E.01383
G1 X94.609 Y76.355 E.59833
G1 X95.157 Y76.355 E.01383
G1 X77.851 Y93.66 E.61789
G1 X77.851 Y94.208 E.01383
G1 X95.704 Y76.355 E.63744
G1 X96.252 Y76.355 E.01383
G1 X77.851 Y94.755 E.65699
G1 X77.851 Y95.303 E.01383
G1 X96.799 Y76.355 E.67654
G1 X97.347 Y76.355 E.01383
G1 X77.851 Y95.851 E.6961
G1 X77.851 Y96.399 E.01383
G1 X97.895 Y76.355 E.71565
G1 X98.442 Y76.355 E.01383
G1 X77.851 Y96.946 E.7352
G1 X77.851 Y97.494 E.01383
G1 X98.99 Y76.355 E.75476
G1 X99.537 Y76.356 E.01383
G1 X77.851 Y98.042 E.77431
M73 P29 R3
G1 X77.851 Y98.589 E.01383
G1 X100.085 Y76.356 E.79386
G1 X100.633 Y76.356 E.01383
G1 X77.851 Y99.137 E.81342
G1 X77.851 Y99.685 E.01383
G1 X101.18 Y76.356 E.83297
G1 X101.643 Y76.356 E.01168
G1 X101.711 Y76.373 E.00176
G1 X77.851 Y100.233 E.85191
G1 X77.851 Y100.78 E.01383
G1 X102.046 Y76.586 E.86388
G3 X102.147 Y77.032 I-.714 J.396 E.01172
G1 X77.851 Y101.328 E.86748
G1 X77.851 Y101.876 E.01383
G1 X102.147 Y77.58 E.86748
G1 X102.147 Y78.128 E.01383
G1 X77.851 Y102.424 E.86748
G1 X77.851 Y102.971 E.01383
G1 X102.147 Y78.675 E.86749
G1 X102.147 Y79.223 E.01383
G1 X77.956 Y103.414 E.86375
G2 X78.292 Y103.626 I.407 J-.274 E.01032
G1 X102.147 Y79.771 E.85175
G1 X102.147 Y80.318 E.01383
G1 X78.817 Y103.648 E.833
G1 X79.365 Y103.648 E.01383
G1 X102.147 Y80.866 E.81344
G1 X102.147 Y81.414 E.01383
G1 X79.913 Y103.648 E.79389
M73 P30 R3
G1 X80.46 Y103.648 E.01383
G1 X102.147 Y81.962 E.77433
G1 X102.147 Y82.509 E.01383
G1 X81.008 Y103.648 E.75478
G1 X81.556 Y103.648 E.01383
G1 X102.147 Y83.057 E.73522
G1 X102.147 Y83.605 E.01383
G1 X82.103 Y103.648 E.71567
G1 X82.651 Y103.648 E.01383
G1 X102.147 Y84.152 E.69611
G1 X102.147 Y84.7 E.01383
G1 X83.199 Y103.648 E.67656
G1 X83.747 Y103.648 E.01383
G1 X102.147 Y85.248 E.657
G1 X102.147 Y85.795 E.01383
G1 X84.294 Y103.648 E.63745
G1 X84.842 Y103.648 E.01383
G1 X102.147 Y86.343 E.6179
G1 X102.147 Y86.891 E.01383
G1 X85.39 Y103.648 E.59834
G1 X85.937 Y103.648 E.01383
G1 X102.147 Y87.438 E.57879
G1 X102.148 Y87.986 E.01383
G1 X86.485 Y103.648 E.55923
G1 X87.033 Y103.649 E.01383
G1 X102.148 Y88.534 E.53968
G1 X102.148 Y89.081 E.01383
G1 X87.58 Y103.649 E.52012
G1 X88.128 Y103.649 E.01383
G1 X102.148 Y89.629 E.50057
G1 X102.148 Y90.177 E.01383
G1 X88.676 Y103.649 E.48101
G1 X89.224 Y103.649 E.01383
G1 X102.148 Y90.724 E.46146
M73 P31 R3
G1 X102.148 Y91.272 E.01383
G1 X89.771 Y103.649 E.4419
G1 X90.319 Y103.649 E.01383
G1 X102.148 Y91.82 E.42235
G1 X102.148 Y92.367 E.01383
G1 X90.867 Y103.649 E.40279
G1 X91.414 Y103.649 E.01383
G1 X102.148 Y92.915 E.38324
G1 X102.148 Y93.463 E.01383
G1 X91.962 Y103.649 E.36369
G1 X92.51 Y103.649 E.01383
G1 X102.148 Y94.011 E.34413
G1 X102.148 Y94.558 E.01383
G1 X93.057 Y103.649 E.32458
G1 X93.605 Y103.649 E.01383
G1 X102.148 Y95.106 E.30502
G1 X102.148 Y95.654 E.01383
G1 X94.153 Y103.649 E.28547
G1 X94.701 Y103.649 E.01383
G1 X102.148 Y96.201 E.26591
G1 X102.148 Y96.749 E.01383
G1 X95.248 Y103.649 E.24636
G1 X95.796 Y103.649 E.01383
G1 X102.148 Y97.297 E.2268
G1 X102.148 Y97.844 E.01383
G1 X96.344 Y103.649 E.20725
G1 X96.891 Y103.649 E.01383
G1 X102.148 Y98.392 E.18769
G1 X102.148 Y98.94 E.01383
G1 X97.439 Y103.649 E.16814
G1 X97.987 Y103.649 E.01383
G1 X102.148 Y99.487 E.14858
G1 X102.148 Y100.035 E.01383
G1 X98.534 Y103.649 E.12903
G1 X99.082 Y103.649 E.01383
G1 X102.148 Y100.583 E.10948
G1 X102.148 Y101.13 E.01383
G1 X99.63 Y103.649 E.08992
G1 X100.178 Y103.649 E.01383
G1 X102.148 Y101.678 E.07037
G1 X102.148 Y102.226 E.01383
G1 X100.725 Y103.649 E.05081
G1 X101.273 Y103.649 E.01383
G1 X102.148 Y102.773 E.03126
G1 X102.148 Y103.098 E.0082
G3 X102.011 Y103.459 I-.585 J-.017 E.00993
G1 X101.656 Y103.814 E.01269
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11619.2
G1 X102.011 Y103.459 E-.19095
G1 X102.112 Y103.29 E-.07479
G1 X102.148 Y103.098 E-.07413
G1 X102.148 Y102.773 E-.12338
G1 X101.596 Y103.326 E-.29676
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/25
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.08 I.915 J-.803 P1  F42000
G1 X77.823 Y76.229 Z1.08
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X77.938 Y76.144 E.00389
G3 X78.386 Y76.011 I.472 J.765 E.0128
G1 X101.686 Y76.015 E.63137
G3 X102.487 Y76.855 I-.087 J.886 E.03428
G1 X102.489 Y103.114 E.71154
G3 X101.584 Y103.989 I-.89 J-.015 E.03787
G1 X78.382 Y103.989 E.62872
G3 X77.511 Y103.084 I.02 J-.891 E.03776
G1 X77.511 Y76.886 E.70991
G3 X77.778 Y76.27 I.899 J.024 E.01864
M204 S250
G1 X77.579 Y75.914 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P32 R3
G1 F11668.197
M204 S5000
G1 X77.73 Y75.803 E.00469
G3 X78.371 Y75.61 I.683 J1.11 E.01702
G1 X101.728 Y75.617 E.58723
G3 X102.888 Y76.835 I-.13 J1.286 E.04607
G1 X102.89 Y103.13 E.66107
G3 X101.594 Y104.39 I-1.291 J-.031 E.05033
G1 X78.369 Y104.39 E.58391
G3 X77.11 Y103.094 I.033 J-1.292 E.05029
G1 X77.11 Y76.87 E.6593
G3 X77.509 Y75.975 I1.303 J.043 E.02527
G1 X77.534 Y75.953 E.00084
; WIPE_START
M204 S6000
G1 X77.73 Y75.803 E-.09362
G1 X77.961 Y75.687 E-.09849
G1 X78.105 Y75.644 E-.05704
G1 X78.371 Y75.61 E-.10163
G1 X79.447 Y75.611 E-.40922
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

G1 X102.32 Y77.396
G1 Z.84
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421666
G1 F11618
M204 S6000
G1 X101.281 Y76.356 E.03713
G1 X100.733 Y76.356 E.01383
G1 X102.147 Y77.77 E.05049
G1 X102.147 Y78.318 E.01383
G1 X100.185 Y76.356 E.07006
G1 X99.637 Y76.356 E.01383
G1 X102.147 Y78.865 E.08962
G1 X102.147 Y79.413 E.01383
G1 X99.089 Y76.356 E.10919
G1 X98.541 Y76.355 E.01383
G1 X102.147 Y79.961 E.12875
G1 X102.147 Y80.509 E.01383
G1 X97.994 Y76.355 E.14832
G1 X97.446 Y76.355 E.01383
G1 X102.147 Y81.057 E.16788
G1 X102.147 Y81.604 E.01383
G1 X96.898 Y76.355 E.18745
G1 X96.35 Y76.355 E.01383
G1 X102.147 Y82.152 E.20701
G1 X102.147 Y82.7 E.01383
G1 X95.802 Y76.355 E.22658
G1 X95.254 Y76.355 E.01383
G1 X102.147 Y83.248 E.24614
G1 X102.147 Y83.796 E.01383
G1 X94.706 Y76.355 E.26571
G1 X94.159 Y76.355 E.01383
G1 X102.147 Y84.343 E.28527
G1 X102.147 Y84.891 E.01383
G1 X93.611 Y76.355 E.30484
G1 X93.063 Y76.354 E.01383
G1 X102.147 Y85.439 E.3244
G1 X102.147 Y85.987 E.01383
G1 X92.515 Y76.354 E.34397
G1 X91.967 Y76.354 E.01383
G1 X102.147 Y86.535 E.36353
G1 X102.147 Y87.082 E.01383
G1 X91.419 Y76.354 E.3831
G1 X90.871 Y76.354 E.01383
G1 X102.147 Y87.63 E.40266
G1 X102.148 Y88.178 E.01383
G1 X90.323 Y76.354 E.42222
G1 X89.776 Y76.354 E.01383
G1 X102.148 Y88.726 E.44179
G1 X102.148 Y89.274 E.01383
G1 X89.228 Y76.354 E.46135
G1 X88.68 Y76.354 E.01383
G1 X102.148 Y89.821 E.48092
M73 P33 R3
G1 X102.148 Y90.369 E.01383
G1 X88.132 Y76.353 E.50048
G1 X87.584 Y76.353 E.01383
G1 X102.148 Y90.917 E.52005
G1 X102.148 Y91.465 E.01383
G1 X87.036 Y76.353 E.53961
G1 X86.488 Y76.353 E.01383
G1 X102.148 Y92.013 E.55918
G1 X102.148 Y92.56 E.01383
G1 X85.94 Y76.353 E.57874
G1 X85.393 Y76.353 E.01383
G1 X102.148 Y93.108 E.59831
G1 X102.148 Y93.656 E.01383
G1 X84.845 Y76.353 E.61787
G1 X84.297 Y76.353 E.01383
G1 X102.148 Y94.204 E.63744
G1 X102.148 Y94.752 E.01383
G1 X83.749 Y76.353 E.657
G1 X83.201 Y76.353 E.01383
G1 X102.148 Y95.299 E.67657
G1 X102.148 Y95.847 E.01383
G1 X82.653 Y76.352 E.69613
G1 X82.105 Y76.352 E.01383
G1 X102.148 Y96.395 E.7157
G1 X102.148 Y96.943 E.01383
G1 X81.558 Y76.352 E.73526
G1 X81.01 Y76.352 E.01383
G1 X102.148 Y97.491 E.75483
G1 X102.148 Y98.038 E.01383
G1 X80.462 Y76.352 E.77439
G1 X79.914 Y76.352 E.01383
G1 X102.148 Y98.586 E.79396
G1 X102.148 Y99.134 E.01383
G1 X79.366 Y76.352 E.81352
M73 P34 R3
G1 X78.818 Y76.352 E.01383
G1 X102.148 Y99.682 E.83309
G1 X102.148 Y100.23 E.01383
G1 X78.286 Y76.367 E.8521
G2 X77.956 Y76.585 I.127 J.552 E.0102
G1 X102.148 Y100.777 E.86389
G1 X102.148 Y101.325 E.01383
G1 X77.852 Y77.029 E.8676
G1 X77.852 Y77.576 E.01383
G1 X102.148 Y101.873 E.8676
G1 X102.148 Y102.421 E.01383
G1 X77.852 Y78.124 E.86761
G1 X77.852 Y78.672 E.01383
G1 X102.148 Y102.968 E.86761
G3 X102.046 Y103.414 I-.631 J.089 E.01179
G1 X77.852 Y79.22 E.86394
G1 X77.852 Y79.767 E.01383
G1 X101.717 Y103.633 E.85222
G3 X101.185 Y103.649 I-.341 J-2.597 E.01346
G1 X77.852 Y80.315 E.83322
G1 X77.852 Y80.863 E.01383
G1 X100.638 Y103.649 E.81366
G1 X100.09 Y103.649 E.01383
G1 X77.852 Y81.411 E.7941
G1 X77.852 Y81.958 E.01383
G1 X99.542 Y103.649 E.77454
G1 X98.994 Y103.649 E.01383
G1 X77.852 Y82.506 E.75498
G1 X77.852 Y83.054 E.01383
G1 X98.446 Y103.649 E.73542
M73 P35 R3
G1 X97.899 Y103.649 E.01383
G1 X77.852 Y83.602 E.71586
G1 X77.852 Y84.149 E.01383
G1 X97.351 Y103.649 E.6963
G1 X96.803 Y103.649 E.01383
G1 X77.852 Y84.697 E.67674
G1 X77.852 Y85.245 E.01383
G1 X96.255 Y103.649 E.65718
G1 X95.708 Y103.649 E.01383
G1 X77.852 Y85.793 E.63762
G1 X77.852 Y86.34 E.01383
G1 X95.16 Y103.649 E.61806
G1 X94.612 Y103.649 E.01383
G1 X77.852 Y86.888 E.5985
G1 X77.851 Y87.436 E.01383
G1 X94.064 Y103.649 E.57894
G1 X93.516 Y103.649 E.01383
G1 X77.851 Y87.984 E.55938
G1 X77.851 Y88.531 E.01383
G1 X92.969 Y103.649 E.53982
G1 X92.421 Y103.649 E.01383
G1 X77.851 Y89.079 E.52026
G1 X77.851 Y89.627 E.01383
G1 X91.873 Y103.649 E.5007
G1 X91.325 Y103.649 E.01383
G1 X77.851 Y90.175 E.48114
G1 X77.851 Y90.722 E.01383
G1 X90.778 Y103.649 E.46158
G1 X90.23 Y103.649 E.01383
G1 X77.851 Y91.27 E.44202
G1 X77.851 Y91.818 E.01383
G1 X89.682 Y103.649 E.42246
G1 X89.134 Y103.649 E.01383
G1 X77.851 Y92.366 E.4029
G1 X77.851 Y92.914 E.01383
G1 X88.586 Y103.649 E.38334
M73 P36 R3
G1 X88.039 Y103.649 E.01383
G1 X77.851 Y93.461 E.36377
G1 X77.851 Y94.009 E.01383
G1 X87.491 Y103.649 E.34421
G1 X86.943 Y103.648 E.01383
G1 X77.851 Y94.557 E.32465
G1 X77.851 Y95.105 E.01383
G1 X86.395 Y103.648 E.30509
G1 X85.848 Y103.648 E.01383
G1 X77.851 Y95.652 E.28553
G1 X77.851 Y96.2 E.01383
G1 X85.3 Y103.648 E.26597
G1 X84.752 Y103.648 E.01383
G1 X77.851 Y96.748 E.24641
G1 X77.851 Y97.296 E.01383
G1 X84.204 Y103.648 E.22685
G1 X83.656 Y103.648 E.01383
G1 X77.851 Y97.843 E.20729
G1 X77.851 Y98.391 E.01383
G1 X83.109 Y103.648 E.18773
G1 X82.561 Y103.648 E.01383
G1 X77.851 Y98.939 E.16817
G1 X77.851 Y99.487 E.01383
G1 X82.013 Y103.648 E.14861
G1 X81.465 Y103.648 E.01383
G1 X77.851 Y100.034 E.12905
G1 X77.851 Y100.582 E.01383
G1 X80.918 Y103.648 E.10949
G1 X80.37 Y103.648 E.01383
G1 X77.851 Y101.13 E.08993
G1 X77.851 Y101.678 E.01383
G1 X79.822 Y103.648 E.07037
G1 X79.274 Y103.648 E.01383
G1 X77.851 Y102.225 E.05081
G1 X77.851 Y102.773 E.01383
G1 X78.726 Y103.648 E.03125
G3 X78.127 Y103.574 I-.151 J-1.236 E.01541
G1 X78.05 Y103.519 E.00239
G1 X77.685 Y103.155 E.01302
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11618
G1 X78.05 Y103.519 E-.19589
G1 X78.127 Y103.574 E-.03591
G1 X78.201 Y103.608 E-.03106
G1 X78.414 Y103.648 E-.08222
G1 X78.726 Y103.648 E-.11882
G1 X78.175 Y103.097 E-.2961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/25
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.24 I1.217 J-.027 P1  F42000
G1 X77.565 Y75.925 Z1.24
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X77.73 Y75.803 E.00516
G3 X78.368 Y75.61 I.683 J1.11 E.01695
G1 X101.727 Y75.617 E.58729
G3 X102.888 Y76.836 I-.132 J1.288 E.04607
G1 X102.89 Y103.131 E.66109
G3 X101.594 Y104.39 I-1.292 J-.033 E.05029
G1 X78.369 Y104.39 E.58391
G3 X77.11 Y103.094 I.033 J-1.292 E.05029
G1 X77.11 Y76.869 E.65934
G3 X77.51 Y75.974 I1.303 J.044 E.02527
G1 X77.52 Y75.965 E.00034
; WIPE_START
M204 S6000
G1 X77.73 Y75.803 E-.10078
G1 X77.959 Y75.688 E-.09742
G1 X78.209 Y75.624 E-.09813
G1 X78.368 Y75.61 E-.06053
G1 X79.429 Y75.611 E-.40313
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

G1 X102.667 Y103.24
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F11668.197
M204 S2000
G1 X101.74 Y104.167 E.03298
G1 X101.183 Y104.178
G1 X102.677 Y102.684 E.05312
G1 X102.677 Y102.139
G1 X100.638 Y104.178 E.07251
G1 X100.093 Y104.178
G1 X102.677 Y101.593 E.0919
M73 P37 R3
G1 X102.677 Y101.048
G1 X99.547 Y104.178 E.11129
G1 X99.002 Y104.178
G1 X102.677 Y100.502 E.13068
G1 X102.677 Y99.957
G1 X98.456 Y104.178 E.15007
G1 X97.911 Y104.178
G1 X102.677 Y99.412 E.16946
G1 X102.677 Y98.866
G1 X97.366 Y104.178 E.18885
G1 X96.82 Y104.178
G1 X102.677 Y98.321 E.20824
G1 X102.677 Y97.776
G1 X96.275 Y104.178 E.22764
G1 X95.729 Y104.178
G1 X102.677 Y97.23 E.24703
G1 X102.677 Y96.685
G1 X95.184 Y104.178 E.26642
G1 X94.639 Y104.178
G1 X102.677 Y96.139 E.28581
G1 X102.677 Y95.594
G1 X94.093 Y104.178 E.3052
G1 X93.548 Y104.178
G1 X102.677 Y95.049 E.32459
G1 X102.677 Y94.503
G1 X93.002 Y104.178 E.34398
G1 X92.457 Y104.178
G1 X102.677 Y93.958 E.36337
G1 X102.677 Y93.412
G1 X91.912 Y104.178 E.38276
G1 X91.366 Y104.178
G1 X102.677 Y92.867 E.40215
G1 X102.677 Y92.322
G1 X90.821 Y104.178 E.42154
G1 X90.276 Y104.178
G1 X102.677 Y91.776 E.44093
G1 X102.677 Y91.231
G1 X89.73 Y104.178 E.46032
G1 X89.185 Y104.178
M73 P38 R3
G1 X102.677 Y90.686 E.47971
G1 X102.677 Y90.14
G1 X88.639 Y104.178 E.4991
G1 X88.094 Y104.178
G1 X102.677 Y89.595 E.51849
G1 X102.677 Y89.049
G1 X87.549 Y104.178 E.53789
G1 X87.003 Y104.178
G1 X102.677 Y88.504 E.55728
G1 X102.677 Y87.959
G1 X86.458 Y104.178 E.57667
G1 X85.912 Y104.178
G1 X102.677 Y87.413 E.59606
G1 X102.677 Y86.868
G1 X85.367 Y104.178 E.61545
G1 X84.822 Y104.178
G1 X102.677 Y86.323 E.63484
G1 X102.677 Y85.777
G1 X84.276 Y104.178 E.65423
G1 X83.731 Y104.178
G1 X102.676 Y85.232 E.67362
G1 X102.676 Y84.686
G1 X83.185 Y104.178 E.69301
G1 X82.64 Y104.178
G1 X102.676 Y84.141 E.7124
G1 X102.676 Y83.596
G1 X82.095 Y104.178 E.73179
M73 P39 R3
G1 X81.549 Y104.178
G1 X102.676 Y83.05 E.75118
G1 X102.676 Y82.505
G1 X81.004 Y104.177 E.77057
G1 X80.458 Y104.177
G1 X102.676 Y81.96 E.78996
G1 X102.676 Y81.414
G1 X79.913 Y104.177 E.80935
G1 X79.368 Y104.177
G1 X102.676 Y80.869 E.82874
G1 X102.676 Y80.323
G1 X78.822 Y104.177 E.84813
G1 X78.284 Y104.171
G1 X102.676 Y79.778 E.86728
G1 X102.676 Y79.233
G1 X77.871 Y104.038 E.88197
G1 X77.574 Y103.79
G1 X102.676 Y78.687 E.89251
G1 X102.676 Y78.142
G1 X77.378 Y103.44 E.89948
G1 X77.322 Y102.951
G1 X102.676 Y77.597 E.90147
M73 P40 R3
G1 X102.676 Y77.051
G1 X77.322 Y102.405 E.90147
G1 X77.322 Y101.86
G1 X102.622 Y76.56 E.89954
G1 X102.427 Y76.21
G1 X77.322 Y101.314 E.89261
G1 X77.322 Y100.769
G1 X102.129 Y75.962 E.88201
G1 X101.716 Y75.829
G1 X77.322 Y100.223 E.86734
G1 X77.322 Y99.678
G1 X101.178 Y75.822 E.84819
G1 X100.632 Y75.822
G1 X77.322 Y99.133 E.8288
G1 X77.322 Y98.587
G1 X100.087 Y75.822 E.80941
G1 X99.542 Y75.822
G1 X77.322 Y98.042 E.79001
G1 X77.322 Y97.496
G1 X98.996 Y75.822 E.77062
M73 P41 R3
G1 X98.451 Y75.822
G1 X77.322 Y96.951 E.75123
G1 X77.322 Y96.406
G1 X97.905 Y75.822 E.73184
G1 X97.36 Y75.822
G1 X77.322 Y95.86 E.71244
G1 X77.322 Y95.315
G1 X96.814 Y75.822 E.69305
G1 X96.269 Y75.822
G1 X77.322 Y94.769 E.67366
G1 X77.322 Y94.224
G1 X95.724 Y75.822 E.65427
G1 X95.178 Y75.822
G1 X77.322 Y93.678 E.63487
G1 X77.322 Y93.133
G1 X94.633 Y75.823 E.61548
G1 X94.087 Y75.823
G1 X77.322 Y92.588 E.59609
G1 X77.322 Y92.042
G1 X93.542 Y75.823 E.5767
M73 P41 R2
G1 X92.997 Y75.823
G1 X77.322 Y91.497 E.5573
G1 X77.322 Y90.951
G1 X92.451 Y75.823 E.53791
G1 X91.906 Y75.823
G1 X77.322 Y90.406 E.51852
M73 P42 R2
G1 X77.322 Y89.861
G1 X91.36 Y75.823 E.49913
G1 X90.815 Y75.823
G1 X77.322 Y89.315 E.47973
G1 X77.322 Y88.77
G1 X90.27 Y75.823 E.46034
G1 X89.724 Y75.823
G1 X77.322 Y88.224 E.44095
G1 X77.322 Y87.679
G1 X89.179 Y75.823 E.42156
G1 X88.633 Y75.823
G1 X77.322 Y87.133 E.40216
G1 X77.322 Y86.588
G1 X88.088 Y75.823 E.38277
G1 X87.543 Y75.823
G1 X77.322 Y86.043 E.36338
G1 X77.322 Y85.497
G1 X86.997 Y75.823 E.34399
G1 X86.452 Y75.823
G1 X77.322 Y84.952 E.32459
G1 X77.322 Y84.406
G1 X85.906 Y75.823 E.3052
G1 X85.361 Y75.823
G1 X77.322 Y83.861 E.28581
G1 X77.322 Y83.316
G1 X84.815 Y75.823 E.26642
G1 X84.27 Y75.823
G1 X77.322 Y82.77 E.24702
G1 X77.322 Y82.225
G1 X83.725 Y75.823 E.22763
G1 X83.179 Y75.823
G1 X77.322 Y81.679 E.20824
M73 P43 R2
G1 X77.322 Y81.134
G1 X82.634 Y75.823 E.18885
G1 X82.088 Y75.823
G1 X77.323 Y80.589 E.16945
G1 X77.323 Y80.043
G1 X81.543 Y75.823 E.15006
G1 X80.998 Y75.823
G1 X77.323 Y79.498 E.13067
G1 X77.323 Y78.952
G1 X80.452 Y75.823 E.11128
G1 X79.907 Y75.823
G1 X77.323 Y78.407 E.09189
G1 X77.323 Y77.861
G1 X79.361 Y75.823 E.07249
G1 X78.816 Y75.823
G1 X77.323 Y77.316 E.0531
G1 X77.333 Y76.76
G1 X78.261 Y75.832 E.03301
M204 S10000
G1 X77.73 Y76.06 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0823431
G1 F18000
M204 S6000
G2 X77.563 Y76.225 I1.561 J1.74 E.00073
; WIPE_START
G1 X77.73 Y76.06 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.809 Y81.756 Z1.4 F42000
G1 X102.44 Y103.771 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0829532
G1 F18000
M204 S6000
G3 X102.283 Y103.928 I-1.51 J-1.348 E.0007
; WIPE_START
G1 X102.44 Y103.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.807 Y103.721 Z1.4 F42000
G1 X77.482 Y103.609 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0986051
G1 F18000
M204 S6000
G3 X77.389 Y103.478 I1.628 J-1.249 E.00067
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X77.482 Y103.609 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/25
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.4 I1.217 J.009 P1  F42000
G1 X77.682 Y76.346 Z1.4
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1610
M204 S5000
G1 X77.768 Y76.252 E.0032
G3 X78.396 Y75.99 I.643 J.66 E.01754
G1 X101.605 Y75.99 E.58349
G3 X102.51 Y76.894 I-.016 J.921 E.03556
G1 X102.51 Y103.105 E.65897
G3 X101.604 Y104.01 I-.923 J-.018 E.03558
G1 X78.395 Y104.01 E.5835
M73 P44 R2
G3 X77.49 Y103.106 I.013 J-.918 E.03559
G1 X77.49 Y76.874 E.65949
G3 X77.648 Y76.395 I.921 J.037 E.01285
M204 S250
G1 X77.835 Y75.748 F42000
G1 F1610
M204 S5000
G1 X77.96 Y75.69 E.00346
G3 X78.368 Y75.61 I.45 J1.219 E.0105
G1 X101.727 Y75.617 E.58729
G3 X102.888 Y76.835 I-.132 J1.288 E.04606
G1 X102.89 Y103.131 E.6611
M73 P45 R2
G3 X101.594 Y104.39 I-1.292 J-.033 E.05029
G1 X78.369 Y104.39 E.58391
G3 X77.11 Y103.094 I.032 J-1.291 E.0503
G1 X77.11 Y76.87 E.65933
G3 X77.729 Y75.802 I1.299 J.04 E.03233
G1 X77.782 Y75.775 E.00148
; WIPE_START
M73 P46 R2
G1 F11668.197
M204 S6000
G1 X77.96 Y75.69 E-.07502
G1 X78.209 Y75.624 E-.09806
G1 X78.368 Y75.61 E-.06047
G1 X79.753 Y75.611 E-.52645
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
; layer num/total_layer_count: 8/25
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
G1 X77.67 Y76.361 F42000
G1 Z1.32
G1 E.8 F1800
G1 F1600
M204 S5000
G1 X77.768 Y76.252 E.00367
G3 X78.395 Y75.99 I.643 J.66 E.0175
G1 X101.605 Y75.99 E.58353
G3 X102.51 Y76.895 I-.018 J.923 E.03556
G1 X102.51 Y103.105 E.65895
G3 X101.604 Y104.01 I-.921 J-.016 E.03561
G1 X78.395 Y104.01 E.5835
G3 X77.49 Y103.104 I.018 J-.923 E.03559
G1 X77.49 Y76.874 E.65944
M73 P47 R2
G3 X77.637 Y76.411 I.921 J.037 E.01237
M204 S250
G1 X77.83 Y75.751 F42000
G1 F1600
M204 S5000
G1 X77.96 Y75.692 E.0036
G3 X78.368 Y75.61 I.457 J1.225 E.01049
G1 X101.728 Y75.617 E.58729
G3 X102.888 Y76.835 I-.132 J1.288 E.04606
G1 X102.89 Y103.131 E.6611
G3 X101.594 Y104.39 I-1.292 J-.033 E.05029
G1 X78.369 Y104.39 E.58391
M73 P48 R2
G3 X77.11 Y103.094 I.033 J-1.292 E.05029
G1 X77.11 Y76.869 E.65933
G3 X77.714 Y75.815 I1.307 J.048 E.03175
G1 X77.777 Y75.78 E.00183
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.96 Y75.692 E-.07714
G1 X78.209 Y75.624 E-.09806
G1 X78.368 Y75.61 E-.06047
G1 X79.748 Y75.611 E-.52434
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
; layer num/total_layer_count: 9/25
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
G1 X77.658 Y76.376 F42000
G1 Z1.48
G1 E.8 F1800
G1 F1600
M204 S5000
G1 X77.768 Y76.252 E.00417
G3 X78.395 Y75.99 I.643 J.66 E.01751
G1 X101.605 Y75.99 E.58352
G3 X102.51 Y76.896 I-.016 J.921 E.03561
G1 X102.51 Y103.105 E.65892
M73 P49 R2
G3 X101.604 Y104.01 I-.923 J-.018 E.03559
G1 X78.395 Y104.01 E.58349
G3 X77.49 Y103.104 I.013 J-.918 E.03563
G1 X77.49 Y76.874 E.65944
G3 X77.627 Y76.427 I.921 J.037 E.01189
M204 S250
G1 X77.826 Y75.752 F42000
M73 P50 R2
G1 F1600
M204 S5000
G1 X77.959 Y75.69 E.0037
G3 X78.368 Y75.61 I.45 J1.219 E.01051
G1 X101.728 Y75.617 E.5873
G3 X102.888 Y76.836 I-.133 J1.288 E.04606
G1 X102.89 Y103.131 E.66109
G3 X101.594 Y104.39 I-1.292 J-.033 E.05029
G1 X78.369 Y104.39 E.58391
G3 X77.11 Y103.094 I.033 J-1.292 E.05029
G1 X77.11 Y76.869 E.65933
M73 P51 R2
G3 X77.729 Y75.802 I1.299 J.04 E.03232
G1 X77.772 Y75.78 E.00122
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.959 Y75.69 E-.07875
G1 X78.221 Y75.623 E-.10273
G1 X78.368 Y75.61 E-.05592
G1 X79.743 Y75.611 E-.52261
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
; layer num/total_layer_count: 10/25
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
G1 X77.651 Y76.39 F42000
G1 Z1.64
G1 E.8 F1800
G1 F1600
M204 S5000
G3 X78.395 Y75.99 I.76 J.522 E.02205
G1 X101.605 Y75.99 E.58353
G3 X102.51 Y76.896 I-.016 J.921 E.03561
G1 X102.51 Y103.105 E.65893
G3 X101.605 Y104.01 I-.921 J-.016 E.03558
G1 X78.395 Y104.01 E.58353
M73 P52 R2
G3 X77.49 Y103.104 I.016 J-.921 E.03561
G1 X77.49 Y76.875 E.65944
G3 X77.619 Y76.44 I.921 J.037 E.01151
M204 S250
G1 X77.821 Y75.749 F42000
G1 F1600
M204 S5000
G1 X77.842 Y75.739 E.00058
G3 X78.368 Y75.61 I.563 J1.166 E.01372
G1 X101.728 Y75.617 E.58729
G3 X102.888 Y76.836 I-.132 J1.288 E.04606
G1 X102.89 Y103.131 E.6611
M73 P53 R2
G3 X101.594 Y104.39 I-1.291 J-.032 E.0503
G1 X78.369 Y104.39 E.58391
G3 X77.11 Y103.094 I.037 J-1.296 E.05025
G1 X77.11 Y76.869 E.65933
G3 X77.711 Y75.811 I1.294 J.035 E.03185
G1 X77.769 Y75.779 E.00166
; WIPE_START
M73 P54 R2
G1 F11668.197
M204 S6000
G1 X77.842 Y75.739 E-.03156
G1 X78.082 Y75.65 E-.09713
G1 X78.368 Y75.61 E-.10989
G1 X79.74 Y75.611 E-.52143
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
; layer num/total_layer_count: 11/25
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
G1 X77.638 Y76.406 F42000
G1 Z1.8
G1 E.8 F1800
G1 F1600
M204 S5000
G1 X77.651 Y76.39 E.00052
G3 X78.395 Y75.99 I.76 J.521 E.02206
G1 X101.605 Y75.99 E.58352
G3 X102.51 Y76.896 I-.016 J.921 E.0356
G1 X102.51 Y103.105 E.65893
G3 X101.605 Y104.01 I-.921 J-.016 E.03559
G1 X78.395 Y104.01 E.58352
G3 X77.49 Y103.104 I.016 J-.921 E.0356
G1 X77.49 Y76.875 E.65944
M73 P55 R2
G3 X77.567 Y76.542 I.921 J.037 E.00863
G1 X77.61 Y76.459 E.00236
M204 S250
G1 X77.831 Y75.749 F42000
G1 F1600
M204 S5000
G1 X77.96 Y75.692 E.00355
G3 X78.369 Y75.61 I.457 J1.225 E.01052
G1 X101.728 Y75.617 E.58726
G3 X102.888 Y76.835 I-.133 J1.288 E.04606
G1 X102.89 Y103.131 E.6611
G3 X101.594 Y104.39 I-1.296 J-.037 E.05025
G1 X78.369 Y104.39 E.58391
M73 P56 R2
G3 X77.11 Y103.094 I.035 J-1.294 E.05027
G1 X77.11 Y76.869 E.65933
G3 X77.729 Y75.805 I1.307 J.048 E.03221
G1 X77.779 Y75.778 E.00143
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.96 Y75.692 E-.07643
G1 X78.21 Y75.624 E-.09839
G1 X78.369 Y75.61 E-.06061
G1 X79.75 Y75.611 E-.52459
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
; layer num/total_layer_count: 12/25
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
G1 X77.628 Y76.424 F42000
G1 Z1.96
G1 E.8 F1800
G1 F1600
M204 S5000
G1 X77.651 Y76.389 E.00106
G3 X78.395 Y75.99 I.759 J.522 E.02205
G1 X101.605 Y75.99 E.58352
G3 X102.51 Y76.896 I-.016 J.921 E.0356
G1 X102.51 Y103.105 E.65893
M73 P57 R2
G3 X101.605 Y104.01 I-.921 J-.016 E.03559
G1 X78.395 Y104.01 E.58352
G3 X77.49 Y103.104 I.016 J-.921 E.0356
G1 X77.49 Y76.875 E.65944
G3 X77.567 Y76.541 I.921 J.037 E.00865
G1 X77.6 Y76.478 E.0018
M204 S250
M73 P58 R2
G1 X77.826 Y75.752 F42000
G1 F1600
M204 S5000
G1 X77.959 Y75.689 E.0037
G3 X78.371 Y75.61 I.446 J1.215 E.01059
G1 X101.728 Y75.617 E.58723
G3 X102.888 Y76.836 I-.133 J1.288 E.04606
G1 X102.89 Y103.131 E.66109
G3 X101.594 Y104.39 I-1.295 J-.037 E.05025
G1 X78.369 Y104.39 E.58391
G3 X77.11 Y103.094 I.037 J-1.296 E.05025
G1 X77.11 Y76.869 E.65933
M73 P59 R2
G3 X77.727 Y75.801 I1.294 J.035 E.03231
G1 X77.772 Y75.779 E.00127
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.959 Y75.689 E-.0787
G1 X78.098 Y75.646 E-.05556
G1 X78.371 Y75.61 E-.1043
G1 X79.743 Y75.611 E-.52144
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
; layer num/total_layer_count: 13/25
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
G1 X77.617 Y76.444 F42000
G1 Z2.12
G1 E.8 F1800
G1 F1600
M204 S5000
G1 X77.651 Y76.39 E.00163
G3 X78.396 Y75.99 I.759 J.522 E.02208
G1 X101.605 Y75.99 E.58349
G3 X102.51 Y76.896 I-.016 J.921 E.03562
G1 X102.51 Y103.105 E.65893
G3 X101.604 Y104.01 I-.921 J-.016 E.0356
G1 X78.395 Y104.01 E.58349
M73 P60 R2
G3 X77.49 Y103.104 I.018 J-.923 E.03557
G1 X77.49 Y76.875 E.65944
G3 X77.564 Y76.548 I.921 J.037 E.00848
G1 X77.59 Y76.498 E.0014
M204 S250
G1 X77.811 Y75.754 F42000
G1 F1600
M204 S5000
G1 X77.842 Y75.739 E.00087
G3 X78.368 Y75.61 I.563 J1.166 E.01372
G1 X101.728 Y75.617 E.5873
G3 X102.888 Y76.835 I-.13 J1.286 E.04607
G1 X102.89 Y103.131 E.6611
M73 P61 R2
G3 X101.594 Y104.39 I-1.294 J-.035 E.05027
G1 X78.369 Y104.39 E.58391
M73 P61 R1
G3 X77.11 Y103.094 I.044 J-1.302 E.05018
G1 X77.11 Y76.869 E.65933
G3 X77.715 Y75.809 I1.294 J.035 E.03195
G1 X77.759 Y75.784 E.00127
; WIPE_START
M73 P62 R1
G1 F11668.197
M204 S6000
G1 X77.842 Y75.739 E-.03588
G1 X78.082 Y75.65 E-.0972
G1 X78.368 Y75.61 E-.10987
G1 X79.729 Y75.611 E-.51705
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
; layer num/total_layer_count: 14/25
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
G1 X77.606 Y76.464 F42000
G1 Z2.28
G1 E.8 F1800
G1 F1600
M204 S5000
G1 X77.651 Y76.39 E.00218
G3 X78.396 Y75.99 I.759 J.521 E.02208
G1 X101.605 Y75.99 E.58349
G3 X102.51 Y76.895 I-.015 J.92 E.03559
G1 X102.51 Y103.105 E.65895
G3 X101.604 Y104.01 I-.921 J-.016 E.03561
G1 X78.395 Y104.01 E.58349
G3 X77.49 Y103.104 I.015 J-.92 E.03562
G1 X77.49 Y76.875 E.65941
M73 P63 R1
G3 X77.564 Y76.548 I.921 J.036 E.00849
G1 X77.58 Y76.517 E.00086
M204 S250
G1 X77.813 Y75.758 F42000
G1 F1600
M204 S5000
G1 X77.959 Y75.689 E.00405
G3 X78.368 Y75.61 I.447 J1.217 E.01051
G1 X101.728 Y75.617 E.5873
G3 X102.888 Y76.835 I-.13 J1.286 E.04608
G1 X102.89 Y103.131 E.6611
G3 X101.594 Y104.39 I-1.296 J-.037 E.05025
G1 X78.369 Y104.39 E.58391
M73 P64 R1
G3 X77.11 Y103.094 I.037 J-1.295 E.05025
G1 X77.11 Y76.869 E.65933
G3 X77.728 Y75.801 I1.296 J.037 E.03233
G1 X77.76 Y75.785 E.00088
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.959 Y75.689 E-.08405
G1 X78.209 Y75.624 E-.0982
G1 X78.368 Y75.61 E-.06056
G1 X79.729 Y75.611 E-.51719
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
; layer num/total_layer_count: 15/25
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
G1 X77.597 Y76.48 F42000
G1 Z2.44
G1 E.8 F1800
G1 F1600
M204 S5000
G1 X77.651 Y76.39 E.00264
G3 X78.395 Y75.99 I.76 J.522 E.02205
G1 X101.605 Y75.99 E.58353
G3 X102.51 Y76.896 I-.015 J.92 E.03562
G1 X102.51 Y103.105 E.65892
M73 P65 R1
G3 X101.604 Y104.01 I-.921 J-.016 E.03561
G1 X78.395 Y104.01 E.58349
G3 X77.49 Y103.104 I.015 J-.92 E.03562
G1 X77.49 Y76.875 E.65943
G3 X77.568 Y76.538 I.921 J.037 E.00873
G1 X77.571 Y76.534 E.00013
M204 S250
M73 P66 R1
G1 X77.808 Y75.761 F42000
G1 F1600
M204 S5000
G1 X77.959 Y75.689 E.0042
G3 X78.371 Y75.61 I.446 J1.215 E.01059
G1 X101.728 Y75.617 E.58724
G3 X102.888 Y76.836 I-.13 J1.286 E.04608
G1 X102.89 Y103.131 E.66109
G3 X101.594 Y104.39 I-1.296 J-.037 E.05025
G1 X78.369 Y104.39 E.58391
G3 X77.11 Y103.094 I.032 J-1.291 E.0503
G1 X77.11 Y76.87 E.65931
M73 P67 R1
G3 X77.728 Y75.801 I1.294 J.034 E.03236
G1 X77.754 Y75.788 E.00073
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.959 Y75.689 E-.08635
G1 X78.094 Y75.647 E-.0539
G1 X78.371 Y75.61 E-.10589
G1 X79.723 Y75.611 E-.51386
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
; layer num/total_layer_count: 16/25
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
G1 X77.587 Y76.498 F42000
G1 Z2.6
G1 E.8 F1800
G1 F1600
M204 S5000
G1 X77.651 Y76.39 E.00315
G3 X78.395 Y75.99 I.76 J.521 E.02206
G1 X101.605 Y75.99 E.58353
G3 X102.51 Y76.896 I-.013 J.918 E.03564
G1 X102.51 Y103.105 E.65892
G3 X101.604 Y104.01 I-.919 J-.014 E.03563
G1 X78.395 Y104.01 E.58349
M73 P68 R1
G3 X77.49 Y103.104 I.014 J-.919 E.03563
G1 X77.49 Y76.875 E.65943
G3 X77.562 Y76.552 I.921 J.036 E.00835
M204 S250
G1 X77.793 Y75.764 F42000
G1 F1600
M204 S5000
G1 X77.841 Y75.739 E.00137
G3 X78.368 Y75.61 I.563 J1.166 E.01373
G1 X101.728 Y75.617 E.5873
G3 X102.888 Y76.836 I-.133 J1.288 E.04606
G1 X102.89 Y103.118 E.66076
M73 P69 R1
G3 X101.594 Y104.39 I-1.296 J-.024 E.05058
G1 X78.37 Y104.39 E.5839
G3 X77.11 Y103.094 I.033 J-1.292 E.0503
G1 X77.11 Y76.882 E.659
G3 X77.718 Y75.807 I1.294 J.022 E.03238
G1 X77.741 Y75.794 E.00066
; WIPE_START
M73 P70 R1
G1 F11668.197
M204 S6000
G1 X77.841 Y75.739 E-.04351
G1 X78.082 Y75.65 E-.09732
G1 X78.368 Y75.61 E-.10981
G1 X79.708 Y75.611 E-.50936
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
; layer num/total_layer_count: 17/25
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
G1 X77.577 Y76.515 F42000
G1 Z2.76
G1 E.8 F1800
G1 F1600
M204 S5000
G1 X77.651 Y76.39 E.00366
G3 X78.396 Y75.99 I.76 J.521 E.02209
G1 X101.605 Y75.99 E.58349
G3 X102.51 Y76.896 I-.016 J.921 E.03561
G1 X102.51 Y103.105 E.65892
G3 X101.604 Y104.01 I-.92 J-.014 E.03563
G1 X78.395 Y104.01 E.58349
G3 X77.49 Y103.104 I.018 J-.923 E.03559
G1 X77.49 Y76.875 E.65943
M73 P71 R1
G3 X77.555 Y76.571 I.921 J.037 E.00784
M204 S250
G1 X77.789 Y75.77 F42000
G1 F1600
M204 S5000
G1 X77.841 Y75.74 E.00152
G3 X78.371 Y75.61 I.565 J1.166 E.0138
G1 X101.728 Y75.617 E.58724
G3 X102.888 Y76.836 I-.133 J1.288 E.04606
G1 X102.89 Y103.119 E.66079
G3 X101.594 Y104.39 I-1.291 J-.02 E.0506
G1 X78.369 Y104.39 E.58391
M73 P72 R1
G3 X77.11 Y103.094 I.032 J-1.291 E.0503
G1 X77.11 Y76.881 E.65904
G3 X77.623 Y75.874 I1.296 J.025 E.02941
G1 X77.738 Y75.801 E.00342
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.841 Y75.74 E-.04572
G1 X78.094 Y75.647 E-.10243
G1 X78.371 Y75.61 E-.10588
G1 X79.702 Y75.611 E-.50597
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
; layer num/total_layer_count: 18/25
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
G1 X77.567 Y76.533 F42000
G1 Z2.92
G1 E.8 F1800
G1 F1600
M204 S5000
G1 X77.652 Y76.389 E.00418
G3 X78.395 Y75.99 I.759 J.522 E.02204
G1 X101.605 Y75.99 E.58353
G3 X102.51 Y76.896 I-.016 J.921 E.03561
G1 X102.51 Y103.105 E.65892
M73 P73 R1
G3 X101.604 Y104.01 I-.92 J-.015 E.03562
G1 X78.395 Y104.01 E.58349
G3 X77.49 Y103.104 I.015 J-.921 E.03562
G1 X77.49 Y76.875 E.65943
G3 X77.548 Y76.588 I.921 J.037 E.0074
M204 S250
G1 X77.782 Y75.772 F42000
M73 P74 R1
G1 F1600
M204 S5000
G1 X77.842 Y75.743 E.00169
G3 X78.368 Y75.61 I.575 J1.175 E.01372
G1 X101.728 Y75.617 E.5873
G3 X102.888 Y76.835 I-.133 J1.288 E.04605
G1 X102.89 Y103.12 E.66084
G3 X101.594 Y104.39 I-1.292 J-.022 E.05055
G1 X78.369 Y104.39 E.58391
G3 X77.11 Y103.094 I.033 J-1.292 E.05029
G1 X77.11 Y76.869 E.65933
G3 X77.678 Y75.839 I1.307 J.048 E.03068
M73 P75 R1
G1 X77.731 Y75.804 E.00159
; WIPE_START
M73 P76 R1
G1 F11668.197
M204 S6000
G1 X77.842 Y75.743 E-.04827
G1 X78.082 Y75.65 E-.09753
G1 X78.368 Y75.61 E-.10975
G1 X79.695 Y75.611 E-.50445
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
; layer num/total_layer_count: 19/25
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
G1 X77.561 Y76.551 F42000
G1 Z3.08
G1 E.8 F1800
G1 F1600
M204 S5000
G1 X77.57 Y76.534 E.00046
G3 X78.395 Y75.99 I.841 J.377 E.02623
G1 X101.605 Y75.99 E.58353
G3 X102.51 Y76.896 I-.014 J.919 E.03563
G1 X102.51 Y103.105 E.65892
G3 X101.604 Y104.01 I-.921 J-.016 E.0356
G1 X78.395 Y104.01 E.58351
M73 P77 R1
G3 X77.49 Y103.104 I.016 J-.921 E.03561
G1 X77.49 Y76.875 E.65943
G3 X77.515 Y76.698 I.921 J.037 E.0045
G1 X77.543 Y76.608 E.00237
M204 S250
G1 X77.77 Y75.779 F42000
G1 F1600
M204 S5000
G1 X77.959 Y75.689 E.00527
G3 X78.371 Y75.61 I.447 J1.216 E.01059
G1 X101.728 Y75.617 E.58723
G3 X102.888 Y76.836 I-.133 J1.288 E.04606
G1 X102.89 Y103.122 E.66086
G3 X101.594 Y104.39 I-1.292 J-.024 E.05052
G1 X78.369 Y104.39 E.58391
M73 P78 R1
G3 X77.11 Y103.094 I.033 J-1.292 E.05029
G1 X77.11 Y76.869 E.65933
G3 X77.717 Y75.808 I1.295 J.037 E.032
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.959 Y75.689 E-.10245
G1 X78.143 Y75.636 E-.07283
G1 X78.371 Y75.61 E-.08706
G1 X79.681 Y75.611 E-.49765
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
; layer num/total_layer_count: 20/25
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
G1 X77.552 Y76.574 F42000
G1 Z3.24
M73 P79 R1
G1 E.8 F1800
G1 F1600
M204 S5000
G1 X77.564 Y76.548 E.00074
G3 X78.395 Y75.99 I.847 J.364 E.02659
G1 X101.605 Y75.99 E.58353
G3 X102.51 Y76.895 I-.018 J.923 E.03556
G1 X102.51 Y103.105 E.65894
G3 X101.604 Y104.01 I-.919 J-.014 E.03562
G1 X78.395 Y104.01 E.5835
G3 X77.49 Y103.105 I.016 J-.921 E.03559
G1 X77.49 Y76.875 E.65945
G3 X77.514 Y76.699 I.921 J.036 E.00447
G1 X77.535 Y76.632 E.00177
M204 S250
M73 P80 R1
G1 X77.763 Y75.782 F42000
G1 F1600
M204 S5000
G1 X77.959 Y75.689 E.00545
G3 X78.371 Y75.61 I.446 J1.216 E.01058
G1 X101.728 Y75.617 E.58723
G3 X102.888 Y76.835 I-.133 J1.288 E.04604
G1 X102.89 Y103.13 E.66108
G3 X101.594 Y104.39 I-1.292 J-.032 E.05032
G1 X78.369 Y104.39 E.5839
M73 P80 R0
G3 X77.11 Y103.094 I.033 J-1.292 E.05029
G1 X77.11 Y76.871 E.6593
M73 P81 R0
G3 X77.711 Y75.812 I1.295 J.035 E.03186
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.959 Y75.689 E-.10505
G1 X78.144 Y75.636 E-.07292
G1 X78.371 Y75.61 E-.08689
G1 X79.674 Y75.611 E-.49514
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
; layer num/total_layer_count: 21/25
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
G1 X77.55 Y76.585 F42000
G1 Z3.4
G1 E.8 F1800
G1 F1600
M204 S5000
G1 X77.571 Y76.532 E.00143
G3 X78.395 Y75.99 I.84 J.379 E.02618
G1 X101.605 Y75.99 E.58352
G3 X102.51 Y76.895 I-.018 J.923 E.03557
G1 X102.51 Y103.105 E.65894
G3 X101.604 Y104.01 I-.921 J-.016 E.0356
M73 P82 R0
G1 X78.395 Y104.01 E.58351
G3 X77.49 Y103.105 I.016 J-.921 E.03558
G1 X77.49 Y76.875 E.65946
G3 X77.515 Y76.698 I.921 J.037 E.00449
G1 X77.532 Y76.643 E.00146
M204 S250
G1 X77.758 Y75.785 F42000
G1 F1600
M204 S5000
G1 X77.96 Y75.692 E.0056
G3 X78.37 Y75.61 I.457 J1.225 E.01056
G1 X101.728 Y75.617 E.58724
G3 X102.888 Y76.835 I-.133 J1.288 E.04605
G1 X102.89 Y103.131 E.6611
M73 P83 R0
G3 X101.594 Y104.39 I-1.291 J-.032 E.0503
G1 X78.369 Y104.39 E.58392
G3 X77.11 Y103.094 I.033 J-1.292 E.05029
G1 X77.11 Y76.869 E.65933
G3 X77.708 Y75.819 I1.307 J.048 E.03159
; WIPE_START
G1 F11668.197
M204 S6000
M73 P84 R0
G1 X77.96 Y75.692 E-.10718
G1 X78.177 Y75.63 E-.08568
G1 X78.37 Y75.61 E-.07394
G1 X79.668 Y75.611 E-.49321
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
; layer num/total_layer_count: 22/25
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
G1 X77.546 Y76.599 F42000
G1 Z3.56
G1 E.8 F1800
G1 F1600
M204 S5000
G1 X77.573 Y76.527 E.00195
G3 X78.395 Y75.99 I.836 J.382 E.02605
G1 X101.605 Y75.99 E.58352
G3 X102.51 Y76.896 I-.018 J.923 E.03559
G1 X102.51 Y103.105 E.65892
G3 X101.604 Y104.01 I-.921 J-.016 E.0356
G1 X78.395 Y104.01 E.5835
G3 X77.49 Y103.105 I.016 J-.921 E.03559
M73 P85 R0
G1 X77.49 Y76.875 E.65946
G3 X77.514 Y76.698 I.918 J.034 E.0045
G1 X77.527 Y76.657 E.00108
M204 S250
G1 X77.752 Y75.788 F42000
G1 F1600
M204 S5000
G1 X77.96 Y75.692 E.00575
G3 X78.37 Y75.61 I.458 J1.226 E.01056
G1 X101.728 Y75.617 E.58724
G3 X102.888 Y76.835 I-.133 J1.288 E.04603
G1 X102.89 Y103.131 E.66112
G3 X101.595 Y104.39 I-1.292 J-.033 E.05028
G1 X78.369 Y104.39 E.58392
M73 P86 R0
G3 X77.11 Y103.094 I.032 J-1.291 E.0503
G1 X77.11 Y76.869 E.65933
G3 X77.703 Y75.822 I1.307 J.049 E.03144
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.96 Y75.692 E-.10944
G1 X78.173 Y75.63 E-.08411
G1 X78.37 Y75.61 E-.07552
G1 X79.662 Y75.611 E-.49093
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
; layer num/total_layer_count: 23/25
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
G1 X77.54 Y76.615 F42000
G1 Z3.72
G1 E.8 F1800
G1 F1600
M204 S5000
G1 X77.573 Y76.527 E.00237
M73 P87 R0
G3 X78.394 Y75.99 I.838 J.384 E.02601
G1 X101.607 Y75.99 E.58359
G3 X102.51 Y76.896 I-.015 J.919 E.03559
G1 X102.51 Y103.105 E.65892
G3 X101.606 Y104.01 I-.918 J-.013 E.03559
G1 X78.393 Y104.01 E.58359
G3 X77.49 Y103.105 I.016 J-.919 E.03555
G1 X77.49 Y76.875 E.65945
G3 X77.515 Y76.698 I.921 J.036 E.00451
G1 X77.522 Y76.673 E.00067
M204 S250
M73 P88 R0
G1 X77.745 Y75.795 F42000
G1 F1600
M204 S5000
G1 X77.843 Y75.743 E.00278
G3 X78.368 Y75.61 I.575 J1.175 E.01371
G1 X101.728 Y75.617 E.58731
G3 X102.888 Y76.836 I-.133 J1.288 E.04605
G1 X102.89 Y103.129 E.66106
G3 X101.594 Y104.39 I-1.291 J-.031 E.05033
G1 X78.37 Y104.39 E.58388
G3 X77.11 Y103.097 I.032 J-1.292 E.05025
G1 X77.11 Y76.872 E.65932
M73 P89 R0
G3 X77.65 Y75.858 I1.307 J.045 E.02989
G1 X77.695 Y75.828 E.00137
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.843 Y75.743 E-.0648
G1 X78.082 Y75.65 E-.09734
G1 X78.368 Y75.61 E-.10973
G1 X79.652 Y75.611 E-.48814
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
; layer num/total_layer_count: 24/25
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
G1 X77.53 Y76.644 F42000
G1 Z3.88
G1 E.8 F1800
G1 F1600
M204 S5000
G1 X77.57 Y76.527 E.00311
G3 X78.31 Y75.994 I.832 J.375 E.02399
G1 X101.608 Y75.99 E.58574
G3 X102.51 Y76.895 I-.019 J.921 E.03551
G1 X102.51 Y103.105 E.65895
G3 X101.604 Y104.01 I-.923 J-.018 E.03557
G1 X78.395 Y104.01 E.58352
M73 P90 R0
G3 X77.49 Y103.105 I.019 J-.923 E.03554
G1 X77.49 Y76.875 E.65945
G3 X77.512 Y76.701 I.912 J.026 E.00442
M204 S250
G1 X77.743 Y75.792 F42000
G1 F1600
M204 S5000
G1 X77.96 Y75.692 E.00603
G3 X78.37 Y75.61 I.457 J1.225 E.01056
G1 X101.728 Y75.617 E.58725
G3 X102.888 Y76.836 I-.131 J1.286 E.04607
G1 X102.89 Y103.129 E.66106
M73 P91 R0
G3 X101.594 Y104.39 I-1.291 J-.03 E.05034
G1 X78.369 Y104.39 E.58391
G3 X77.11 Y103.094 I.033 J-1.292 E.05029
G1 X77.11 Y76.871 E.65929
G3 X77.694 Y75.828 I1.307 J.046 E.03122
; WIPE_START
G1 F11668.197
M204 S6000
M73 P92 R0
G1 X77.96 Y75.692 E-.11343
G1 X78.176 Y75.63 E-.08511
G1 X78.37 Y75.61 E-.07442
G1 X79.652 Y75.611 E-.48703
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
; layer num/total_layer_count: 25/25
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
G1 X77.531 Y76.644 F42000
G1 Z4.04
G1 E.8 F1800
G1 F1600
M204 S5000
G1 X77.573 Y76.527 E.00312
G3 X78.395 Y75.99 I.838 J.384 E.02603
G1 X101.605 Y75.99 E.58354
G3 X102.51 Y76.896 I-.013 J.918 E.03563
G1 X102.51 Y103.105 E.65892
G3 X101.605 Y104.01 I-.921 J-.016 E.03558
G1 X78.395 Y104.01 E.58354
G3 X77.49 Y103.104 I.013 J-.918 E.03563
G1 X77.49 Y76.875 E.65943
M73 P93 R0
G3 X77.514 Y76.702 I.921 J.036 E.0044
M204 S250
G1 X77.738 Y75.798 F42000
G1 F1600
M204 S5000
G1 X77.961 Y75.692 E.00621
G3 X78.369 Y75.61 I.457 J1.225 E.01051
G1 X101.762 Y75.62 E.58813
G3 X102.888 Y76.834 I-.167 J1.285 E.04517
G1 X102.89 Y103.131 E.66112
G3 X101.595 Y104.39 I-1.292 J-.033 E.05028
G1 X78.37 Y104.39 E.5839
M73 P94 R0
G3 X77.11 Y103.094 I.032 J-1.292 E.05031
G1 X77.11 Y76.869 E.65934
G3 X77.688 Y75.832 I1.307 J.048 E.03099
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.961 Y75.692 E-.11635
G1 X78.21 Y75.624 E-.09834
G1 X78.369 Y75.61 E-.0605
G1 X79.645 Y75.611 E-.48482
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
G1 Z4.54 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
M73 P95 R0
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
M73 P96 R0
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

    G1 Z104.04 F600
    G1 Z102.04

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


; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 59s; total estimated time: 1m 18s
; total layer number: 2
; total filament length [mm] : 83.02
; total filament volume [cm^3] : 199.68
; total filament weight [g] : 0.25
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 0.30
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
M73 P2 R1
G1 X10.4 Y20 Z0.28 F1500.0 E30 ;Draw the second line
G92 E0 ;Reset Extruder 
M73 P11 R1
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
; layer num/total_layer_count: 1/2
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
M73 P20 R1
G1 X79.83 Y97.23 F42000
M204 S6000
M73 P24 R0
G1 Z.4
G1 Z.14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X79.83 Y97.83 E.01608
G1 X77.02 Y97.83 E.07533
G1 X77.02 Y83.37 E.38763
G1 X83.02 Y83.37 E.16084
G1 X83.02 Y82.17 E.03217
M73 P25 R0
G1 X83.98 Y82.17 E.02574
G1 X83.98 Y83.37 E.03217
G1 X96.02 Y83.37 E.32275
G1 X96.02 Y82.17 E.03217
G1 X96.98 Y82.17 E.02574
G1 X96.98 Y83.37 E.03217
M73 P26 R0
G1 X100.525 Y83.37 E.09503
G1 X100.525 Y85.465 E.05616
G1 X102.98 Y85.465 E.06581
G1 X102.98 Y97.83 E.33147
G1 X102.17 Y97.83 E.02172
G1 X102.17 Y97.23 E.01608
M73 P27 R0
G1 X98.83 Y97.23 E.08953
G1 X98.83 Y97.83 E.01608
G1 X83.17 Y97.83 E.4198
G1 X83.17 Y97.23 E.01608
G1 X79.89 Y97.23 E.08792
M204 S6000
G1 X80.3 Y97.7 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
M73 P28 R0
G1 X80.3 Y98.3 E.01608
G1 X76.55 Y98.3 E.10053
G1 X76.55 Y82.9 E.41283
G1 X82.55 Y82.9 E.16084
G1 X82.55 Y81.7 E.03217
G1 X84.45 Y81.7 E.05093
M73 P29 R0
G1 X84.45 Y82.9 E.03217
G1 X95.55 Y82.9 E.29756
G1 X95.55 Y81.7 E.03217
G1 X97.45 Y81.7 E.05093
G1 X97.45 Y82.9 E.03217
G1 X100.995 Y82.9 E.09503
G1 X100.995 Y84.995 E.05616
M73 P30 R0
G1 X103.45 Y84.995 E.06581
G1 X103.45 Y98.3 E.35666
G1 X101.7 Y98.3 E.04691
G1 X101.7 Y97.7 E.01608
G1 X99.3 Y97.7 E.06434
G1 X99.3 Y98.3 E.01608
M73 P31 R0
G1 X82.7 Y98.3 E.44499
G1 X82.7 Y97.7 E.01608
G1 X80.36 Y97.7 E.06273
; WIPE_START
G1 X80.3 Y98.3 E-.22914
G1 X78.903 Y98.3 E-.53086
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

M73 P32 R0
G1 X83.5 Y83.605
G1 Z.14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.520204
G1 F3000
M204 S500
G1 X83.5 Y82.405 E.03355
; WIPE_START
G1 X83.5 Y83.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X91.1 Y82.903 Z.54 F42000
G1 X96.5 Y82.405 Z.54
G1 Z.14
G1 E.8 F1800
G1 F3000
M204 S500
G1 X96.5 Y83.605 E.03355
; WIPE_START
G1 X96.5 Y82.405 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X100.337 Y84.16 Z.54 F42000
G1 Z.14
M73 P33 R0
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.505664
G1 F6300
M204 S500
G1 X99.947 Y83.769 E.01498
G1 X99.274 Y83.769 E.01825
G1 X100.337 Y84.833 E.04079
; WIPE_START
G1 X99.274 Y83.769 E-.57135
G1 X99.77 Y83.769 E-.18865
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X101.83 Y85.653 Z.54 F42000
G1 Z.14
G1 E.8 F1800
G1 F6300
M204 S500
G1 X102.581 Y86.403 E.0288
G1 X102.581 Y87.076 E.01825
G1 X101.157 Y85.653 E.0546
; WIPE_START
G1 X102.572 Y87.067 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X102.792 Y87.96 Z.54 F42000
M73 P34 R0
G1 Z.14
G1 E.8 F1800
G1 F6300
M204 S500
G1 X100.696 Y85.864 E.08041
G1 X100.126 Y85.864 E.01548
G1 X100.126 Y85.294 E.01548
G1 X98.601 Y83.769 E.05848
G1 X97.929 Y83.769 E.01825
G1 X102.581 Y88.421 E.17848
G1 X102.581 Y89.094 E.01825
G1 X97.256 Y83.769 E.20429
G1 X97.16 Y83.769 E.00261
G1 X97.16 Y84.004 E.00637
M73 P35 R0
G1 X96.818 Y84.004 E.00926
G1 X102.581 Y89.767 E.22109
G1 X102.581 Y90.439 E.01825
G1 X96.146 Y84.004 E.24689
G1 X95.84 Y84.004 E.00828
G1 X95.84 Y83.769 E.00637
G1 X95.238 Y83.769 E.01634
G1 X102.581 Y91.112 E.28171
G1 X102.581 Y91.784 E.01825
G1 X94.566 Y83.769 E.30752
M73 P36 R0
G1 X93.893 Y83.769 E.01825
G1 X102.581 Y92.457 E.33333
G1 X102.581 Y93.13 E.01825
G1 X93.22 Y83.769 E.35913
G1 X92.548 Y83.769 E.01825
M73 P37 R0
G1 X102.581 Y93.802 E.38494
G1 X102.581 Y94.475 E.01825
G1 X91.875 Y83.769 E.41075
G1 X91.202 Y83.769 E.01825
G1 X102.581 Y95.148 E.43655
M73 P38 R0
G1 X102.581 Y95.82 E.01825
G1 X90.53 Y83.769 E.46236
G1 X89.857 Y83.769 E.01825
G1 X102.581 Y96.493 E.48817
M73 P39 R0
G1 X102.581 Y97.165 E.01825
G1 X89.185 Y83.769 E.51398
G1 X88.512 Y83.769 E.01825
G1 X101.573 Y96.831 E.50113
M73 P40 R0
G1 X100.901 Y96.831 E.01825
G1 X87.839 Y83.769 E.50113
G1 X87.167 Y83.769 E.01825
G1 X100.228 Y96.831 E.50113
M73 P41 R0
G1 X99.555 Y96.831 E.01825
G1 X86.494 Y83.769 E.50113
G1 X85.821 Y83.769 E.01825
G1 X98.883 Y96.831 E.50113
M73 P42 R0
G1 X98.431 Y96.831 E.01226
G1 X98.431 Y97.051 E.00599
G1 X85.149 Y83.769 E.50959
G1 X84.476 Y83.769 E.01825
G1 X98.137 Y97.431 E.52415
M73 P43 R0
G1 X97.465 Y97.431 E.01825
G1 X84.038 Y84.004 E.51514
G1 X83.366 Y84.004 E.01825
G1 X96.792 Y97.431 E.51514
M73 P44 R0
G1 X96.119 Y97.431 E.01825
G1 X82.458 Y83.769 E.52415
G1 X81.786 Y83.769 E.01825
G1 X95.447 Y97.431 E.52415
M73 P45 R0
G1 X94.774 Y97.431 E.01825
G1 X81.113 Y83.769 E.52415
G1 X80.44 Y83.769 E.01825
G1 X94.102 Y97.431 E.52415
M73 P46 R0
G1 X93.429 Y97.431 E.01825
G1 X79.768 Y83.769 E.52415
G1 X79.095 Y83.769 E.01825
G1 X92.756 Y97.431 E.52415
M73 P47 R0
G1 X92.084 Y97.431 E.01825
G1 X78.422 Y83.769 E.52415
G1 X77.75 Y83.769 E.01825
G1 X91.411 Y97.431 E.52415
M73 P48 R0
G1 X90.738 Y97.431 E.01825
G1 X77.419 Y84.112 E.51102
G1 X77.419 Y84.784 E.01825
G1 X90.066 Y97.431 E.48521
M73 P49 R0
G1 X89.393 Y97.431 E.01825
G1 X77.419 Y85.457 E.45941
G1 X77.419 Y86.129 E.01825
G1 X88.721 Y97.431 E.4336
M73 P50 R0
G1 X88.048 Y97.431 E.01825
G1 X77.419 Y86.802 E.40779
G1 X77.419 Y87.475 E.01825
G1 X87.375 Y97.431 E.38198
M73 P51 R0
G1 X86.703 Y97.431 E.01825
G1 X77.419 Y88.147 E.35618
G1 X77.419 Y88.82 E.01825
G1 X86.03 Y97.431 E.33037
G1 X85.357 Y97.431 E.01825
G1 X77.419 Y89.493 E.30456
M73 P52 R0
G1 X77.419 Y90.165 E.01825
G1 X84.685 Y97.431 E.27876
G1 X84.012 Y97.431 E.01825
G1 X77.419 Y90.838 E.25295
M73 P53 R0
G1 X77.419 Y91.51 E.01825
G1 X82.74 Y96.831 E.20412
G1 X82.067 Y96.831 E.01825
G1 X77.419 Y92.183 E.17831
G1 X77.419 Y92.856 E.01825
G1 X81.394 Y96.831 E.15251
M73 P54 R0
G1 X80.722 Y96.831 E.01825
G1 X77.419 Y93.528 E.1267
G1 X77.419 Y94.201 E.01825
G1 X80.049 Y96.831 E.10089
G1 X79.431 Y96.831 E.01678
G1 X79.431 Y96.885 E.00147
G1 X77.419 Y94.874 E.07716
G1 X77.419 Y95.546 E.01825
G1 X79.304 Y97.431 E.0723
M73 P55 R0
G1 X78.631 Y97.431 E.01825
G1 X77.419 Y96.219 E.04649
G1 X77.419 Y96.891 E.01825
G1 X78.17 Y97.642 E.0288
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6300
G1 X77.419 Y96.891 E-.40339
G1 X77.419 Y96.219 E-.2556
G1 X77.607 Y96.407 E-.10101
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/2
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.54 I-.534 J1.094 P1  F42000
G1 X80.34 Y97.74 Z.54
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9650
M204 S5000
G1 X80.34 Y98.34 E.01508
G1 X76.51 Y98.34 E.09628
G1 X76.51 Y82.86 E.38918
G1 X82.51 Y82.86 E.15084
G1 X82.51 Y81.66 E.03017
M73 P56 R0
G1 X84.49 Y81.66 E.04978
G1 X84.49 Y82.86 E.03017
G1 X95.51 Y82.86 E.27706
G1 X95.51 Y81.66 E.03017
G1 X97.49 Y81.66 E.04978
G1 X97.49 Y82.86 E.03017
G1 X101.035 Y82.86 E.08913
G1 X101.035 Y84.955 E.05267
G1 X103.49 Y84.955 E.06172
G1 X103.49 Y98.34 E.33651
G1 X101.66 Y98.34 E.04601
G1 X101.66 Y97.74 E.01508
G1 X99.34 Y97.74 E.05833
G1 X99.34 Y98.34 E.01508
G1 X82.66 Y98.34 E.41936
M73 P57 R0
G1 X82.66 Y97.74 E.01508
G1 X80.4 Y97.74 E.05682
; WIPE_START
G1 F11668.197
M204 S6000
G1 X80.34 Y98.34 E-.22914
G1 X78.943 Y98.34 E-.53086
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

G1 X102.87 Y98.128
G1 Z.3
G1 E.8 F1800
; FEATURE: Top surface
G1 F9650
M204 S2000
G1 X103.278 Y97.72 E.01449
G1 X103.278 Y97.175
G1 X102.325 Y98.128 E.03389
G1 X101.872 Y98.035
G1 X103.278 Y96.629 E.04998
G1 X103.278 Y96.084
G1 X101.834 Y97.528 E.05134
G1 X101.289 Y97.528
G1 X103.278 Y95.539 E.07073
G1 X103.278 Y94.993
M73 P58 R0
G1 X100.743 Y97.528 E.09013
G1 X100.198 Y97.528
G1 X103.278 Y94.448 E.10952
G1 X103.278 Y93.902
G1 X99.652 Y97.528 E.12891
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.067 Y96.114 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.507 Y98.128 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9650
M204 S2000
G1 X103.278 Y93.357 E.16963
G1 X103.278 Y92.811
G1 X97.961 Y98.128 E.18903
G1 X97.416 Y98.128
G1 X103.278 Y92.266 E.20842
M73 P59 R0
G1 X103.278 Y91.721
G1 X96.871 Y98.128 E.22781
G1 X96.325 Y98.128
G1 X103.278 Y91.175 E.2472
G1 X103.278 Y90.63
G1 X95.78 Y98.128 E.26659
G1 X95.234 Y98.128
G1 X103.278 Y90.084 E.28599
G1 X103.278 Y89.539
G1 X94.689 Y98.128 E.30538
M73 P60 R0
G1 X94.144 Y98.128
G1 X103.278 Y88.994 E.32477
G1 X103.278 Y88.448
G1 X93.598 Y98.128 E.34416
G1 X93.053 Y98.128
G1 X103.278 Y87.903 E.36355
G1 X103.278 Y87.357
G1 X92.507 Y98.128 E.38295
G1 X91.962 Y98.128
G1 X103.278 Y86.812 E.40234
M73 P61 R0
G1 X103.278 Y86.267
G1 X91.417 Y98.128 E.42173
G1 X90.871 Y98.128
G1 X103.278 Y85.721 E.44112
G1 X103.278 Y85.176
G1 X90.326 Y98.128 E.46052
G1 X89.78 Y98.128
G1 X102.741 Y85.167 E.46083
M73 P62 R0
G1 X102.196 Y85.167
G1 X89.235 Y98.128 E.46083
G1 X88.69 Y98.128
G1 X101.65 Y85.167 E.46083
G1 X101.105 Y85.167
G1 X88.144 Y98.128 E.46083
M73 P63 R0
G1 X87.599 Y98.128
G1 X100.823 Y84.904 E.47019
G1 X100.823 Y84.358
G1 X87.053 Y98.128 E.48958
G1 X86.508 Y98.128
G1 X100.823 Y83.813 E.50897
G1 X100.823 Y83.268
G1 X85.963 Y98.128 E.52836
M73 P64 R0
G1 X85.417 Y98.128
G1 X100.473 Y83.072 E.53531
G1 X99.928 Y83.072
G1 X84.872 Y98.128 E.53531
G1 X84.326 Y98.128
G1 X99.382 Y83.072 E.53531
M73 P65 R0
G1 X98.837 Y83.072
G1 X83.781 Y98.128 E.53531
G1 X83.236 Y98.128
G1 X98.291 Y83.072 E.53531
G1 X97.746 Y83.072
G1 X82.872 Y97.946 E.52884
G1 X82.745 Y97.528
G1 X97.278 Y82.995 E.51673
M73 P66 R0
G1 X97.278 Y82.449
G1 X82.199 Y97.528 E.53612
G1 X81.654 Y97.528
G1 X97.278 Y81.904 E.55551
G1 X96.764 Y81.872
G1 X95.722 Y82.914 E.03706
M73 P67 R0
G1 X95.722 Y82.369
G1 X96.219 Y81.872 E.01766
; WIPE_START
G1 F11668.197
M204 S6000
G1 X95.722 Y82.369 E-.26697
G1 X95.722 Y82.914 E-.20726
G1 X96.254 Y82.383 E-.28577
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.564 Y83.072 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9650
M204 S2000
G1 X81.109 Y97.528 E.51398
G1 X80.563 Y97.528
G1 X95.019 Y83.072 E.51398
G1 X94.474 Y83.072
G1 X79.418 Y98.128 E.53531
G1 X78.872 Y98.128
G1 X93.928 Y83.072 E.53531
M73 P68 R0
G1 X93.383 Y83.072
G1 X78.327 Y98.128 E.53531
G1 X77.781 Y98.128
G1 X92.837 Y83.072 E.53531
G1 X92.292 Y83.072
G1 X77.236 Y98.128 E.53531
M73 P69 R0
G1 X76.722 Y98.096
G1 X91.746 Y83.072 E.53418
G1 X91.201 Y83.072
G1 X76.722 Y97.551 E.51479
G1 X76.722 Y97.005
G1 X90.656 Y83.072 E.4954
M73 P70 R0
G1 X90.11 Y83.072
G1 X76.722 Y96.46 E.47601
G1 X76.722 Y95.914
G1 X89.565 Y83.072 E.45661
G1 X89.019 Y83.072
G1 X76.722 Y95.369 E.43722
G1 X76.722 Y94.824
G1 X88.474 Y83.072 E.41783
M73 P71 R0
G1 X87.929 Y83.072
G1 X76.722 Y94.278 E.39844
G1 X76.722 Y93.733
G1 X87.383 Y83.072 E.37905
G1 X86.838 Y83.072
G1 X76.722 Y93.187 E.35965
G1 X76.722 Y92.642
G1 X86.292 Y83.072 E.34026
M73 P72 R0
G1 X85.747 Y83.072
G1 X76.722 Y92.097 E.32087
G1 X76.722 Y91.551
G1 X85.202 Y83.072 E.30148
G1 X84.656 Y83.072
G1 X76.722 Y91.006 E.28209
G1 X76.722 Y90.46
G1 X84.278 Y82.905 E.26864
G1 X84.278 Y82.36
M73 P73 R0
G1 X76.722 Y89.915 E.26864
G1 X76.722 Y89.37
G1 X84.22 Y81.872 E.26658
G1 X83.675 Y81.872
G1 X82.722 Y82.825 E.03386
M73 P77 R0
G1 X82.722 Y82.279
G1 X83.129 Y81.872 E.01447
; WIPE_START
G1 F11668.197
M204 S6000
G1 X82.722 Y82.279 E-.21876
G1 X82.722 Y82.825 E-.20725
G1 X83.344 Y82.203 E-.33399
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.475 Y83.072 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9650
M204 S2000
G1 X76.722 Y88.824 E.20452
G1 X76.722 Y88.279
G1 X81.929 Y83.072 E.18513
G1 X81.384 Y83.072
G1 X76.722 Y87.733 E.16573
M73 P78 R0
G1 X76.722 Y87.188
G1 X80.838 Y83.072 E.14634
G1 X80.293 Y83.072
G1 X76.722 Y86.643 E.12694
G1 X76.722 Y86.097
G1 X79.747 Y83.072 E.10755
G1 X79.202 Y83.072
G1 X76.722 Y85.552 E.08816
G1 X76.722 Y85.006
G1 X78.656 Y83.072 E.06876
G1 X78.111 Y83.072
G1 X76.722 Y84.461 E.04937
G1 X76.722 Y83.916
G1 X77.566 Y83.072 E.02998
; WIPE_START
M73 P79 R0
G1 F11668.197
M204 S6000
G1 X76.722 Y83.916 E-.4531
G1 X76.722 Y84.461 E-.20726
G1 X76.908 Y84.276 E-.09964
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.531 Y83.901 Z.7 F42000
G1 X100.842 Y83.099 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126093
G1 F9650
M204 S6000
G1 X100.5 Y83.099 E.00205
; WIPE_START
G1 F18000
G1 X100.842 Y83.099 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.21 Y83.032 Z.7 F42000
G1 X82.84 Y82.942 Z.7
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.0870231
G1 F9650
M204 S6000
G1 X82.592 Y83.19 E.0012
; WIPE_START
G1 F18000
G1 X82.84 Y82.942 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.029 Y90.572 Z.7 F42000
G1 X83.217 Y98.109 Z.7
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.110288
G1 F9650
M204 S6000
G1 X82.853 Y98.109 E.0018
; close powerlost recovery
M1003 S0
; WIPE_START
M73 P80 R0
G1 F18000
G1 X83.217 Y98.109 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I1.217 J0 P1  F42000
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z0.8 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
M73 P81 R0
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
M73 P82 R0
G1 Y-3
T255
G1 X65 F12000
M73 P84 R0
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

    G1 Z100.3 F600
M73 P86 R0
    G1 Z98.3

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


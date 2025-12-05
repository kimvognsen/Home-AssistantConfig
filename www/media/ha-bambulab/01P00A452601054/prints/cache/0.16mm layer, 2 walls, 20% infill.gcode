; HEADER_BLOCK_START
; BambuStudio 02.03.01.51
; model printing time: 1h 3m 41s; total estimated time: 1h 10m 12s
; total layer number: 14
; total filament length [mm] : 13946.24
; total filament volume [cm^3] : 33544.63
; total filament weight [g] : 44.28
; model label id: 325,353,381,409,437,465
; filament_density: 1.32,1.24,1.32,1.32,1.24,1.26,1.32,1.32,1.27
; filament_diameter: 1.75,1.75,1.75,1.75,1.75,1.75,1.75,1.75,1.75
; max_z_height: 2.28
; filament: 3
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0,0,0,0,0,0,0,0
; additional_cooling_fan_speed = 70,70,70,70,70,70,70,70,0
; apply_scarf_seam_on_circles = 1
; apply_top_surface_compensation = 0
; auxiliary_fan = 1
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 4
; bottom_shell_layers = 4
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0,0,0,0,0,0,0,0,0
; change_filament_gcode = ;=P1S 20250822=\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if nozzle_temperature[previous_extruder] > 142 && next_extruder < 255}\nM104 S{nozzle_temperature[previous_extruder]}\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == "PETG"}\nM109 S260\n{elsif filament_type[next_extruder] == "PVA"}\nM109 S210\n{else}\nM109 S{flush_temperatures[next_extruder]}\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S{nozzle_temperature[next_extruder]}\nG1 E2 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200,200,200,200,200,200,200,200
; close_fan_the_first_x_layers = 1,1,1,1,1,1,1,1,3
; complete_print_exhaust_fan_speed = 70,70,70,70,70,70,70,70,70
; cool_plate_temp = 35,35,35,35,35,35,35,35,0
; cool_plate_temp_initial_layer = 35,35,35,35,35,35,35,35,0
; counter_coef_1 = 0,0,0,0,0,0,0,0,0
; counter_coef_2 = 0.008,0.008,0.008,0.008,0.008,0.008,0.008,0.008,0.008
; counter_coef_3 = -0.041,-0.041,-0.041,-0.041,-0.041,-0.041,-0.041,-0.041,-0.041
; counter_limit_max = 0.033,0.033,0.033,0.033,0.033,0.033,0.033,0.033,0.033
; counter_limit_min = -0.035,-0.035,-0.035,-0.035,-0.035,-0.035,-0.035,-0.035,-0.035
; curr_bed_type = High Temp Plate
; default_acceleration = 4000
; default_filament_colour = ;;;;;;;;
; default_filament_profile = "Bambu PLA Basic @BBL X1C"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50,50,50,50,50,50,50,50
; different_settings_to_system = flush_into_infill;sparse_infill_density;sparse_infill_pattern;;;;;;;;;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70,70,70,70,70,70,70,70
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1,1,1,1,1,1,1,1,1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0,0,0,0,0,0,0,0,0
; enable_prime_tower = 0
; enable_support = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0,0,0,0,0,0,0,0,70
; eng_plate_temp_initial_layer = 0,0,0,0,0,0,0,0,70
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;
; extruder_clearance_dist_to_rod = 33
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 34
; extruder_clearance_max_radius = 68
; extruder_colour = #018001
; extruder_offset = 0x2
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard,Direct Drive High Flow"
; fan_cooling_layer_time = 100,100,100,100,100,100,100,100,30
; fan_direction = left
; fan_max_speed = 100,100,100,100,100,100,100,100,90
; fan_min_speed = 100,100,100,100,100,100,100,100,40
; filament_adaptive_volumetric_speed = 0,0,0,0,0,0,0,0,0
; filament_adhesiveness_category = 100,100,100,100,100,100,100,100,300
; filament_change_length = 10,10,10,10,10,5,10,10,10
; filament_colour = #898989;#FF80C0;#161616;#E2E2E2;#0ACC38;#FFF144;#D3B7A7;#FFFFFF;#FFFFFF
; filament_colour_type = 0;0;0;0;;;;;
; filament_cost = 24.99,20,24.99,24.99,20,24.99,24.99,24.99,30
; filament_density = 1.32,1.24,1.32,1.32,1.24,1.26,1.32,1.32,1.27
; filament_diameter = 1.75,1.75,1.75,1.75,1.75,1.75,1.75,1.75,1.75
; filament_end_gcode = "; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 0.98,0.98,0.98,0.98,0.98,0.98,0.98,0.98,0.95
; filament_flush_temp = 0,0,0,0,0,0,0,0,0
; filament_flush_volumetric_speed = 0,0,0,0,0,0,0,0,0
; filament_ids = GFA01;GFL99;GFA01;GFA01;GFL99;GFA00;GFA01;GFA01;GFG99
; filament_is_support = 0,0,0,0,0,0,0,0,0
; filament_long_retractions_when_cut = 1,nil,1,1,nil,1,1,1,nil
; filament_map = 1,1,1,1,1,1,1,1,1
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 22,12,22,22,12,21,22,22,12
; filament_minimal_purge_on_wipe_tower = 15,15,15,15,15,15,15,15,15
; filament_multi_colour = #898989;#FF80C0;#161616;#E2E2E2;#0ACC38;#FFF144;#D3B7A7;#FFFFFF;#FFFFFF
; filament_notes = 
; filament_pre_cooling_temperature = 0,0,0,0,0,0,0,0,0
; filament_prime_volume = 45,45,45,45,45,30,45,45,45
; filament_printable = 3,3,3,3,3,3,3,3,3
; filament_ramming_travel_time = 0,0,0,0,0,0,0,0,0
; filament_ramming_volumetric_speed = -1,-1,-1,-1,-1,-1,-1,-1,-1
; filament_retraction_distances_when_cut = 18,nil,18,18,nil,18,18,18,nil
; filament_scarf_gap = 0%,15%,0%,0%,15%,0%,0%,0%,0%
; filament_scarf_height = 5%,10%,5%,5%,10%,10%,5%,5%,10%
; filament_scarf_length = 10,10,10,10,10,10,10,10,10
; filament_scarf_seam_type = none,none,none,none,none,none,none,none,none
; filament_self_index = 1,1,2,3,3,4,4,5,6,6,7,7,8,8,9
; filament_settings_id = "Bambu PLA Matte @BBL X1C";"Generic PLA";"Bambu PLA Matte @BBL X1C";"Bambu PLA Matte @BBL X1C";"Generic PLA";"Bambu PLA Basic @BBL X1C";"Bambu PLA Matte @BBL X1C";"Bambu PLA Matte @BBL X1C";"Generic PETG"
; filament_shrink = 100%,100%,100%,100%,100%,100%,100%,100%,100%
; filament_soluble = 0,0,0,0,0,0,0,0,0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA;PLA;PLA;PLA;PLA;PLA;PLA;PLA;PETG
; filament_velocity_adaptation_factor = 1,1,1,1,1,1,1,1,1
; filament_vendor = "Bambu Lab";Generic;"Bambu Lab";"Bambu Lab";Generic;"Bambu Lab";"Bambu Lab";"Bambu Lab";Generic
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0,0,0,0,0,0,0,0,0
; flush_into_infill = 1
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 208,286,167,213,228,333,271,389,389,227,531,227,369,313,438,261,432,432,427,519,0,542,484,513,501,588,588,123,186,127,0,254,183,123,185,185,309,491,202,507,0,542,451,561,561,237,268,183,231,278,0,206,315,315,123,161,143,229,259,306,0,301,301,123,192,136,123,260,236,123,0,123,167,236,180,167,304,280,167,167,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0,0,0,0,0,0,0,0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 
; hole_coef_1 = 0,0,0,0,0,0,0,0,0
; hole_coef_2 = -0.008,-0.008,-0.008,-0.008,-0.008,-0.008,-0.008,-0.008,-0.008
; hole_coef_3 = 0.23415,0.23415,0.23415,0.23415,0.23415,0.23415,0.23415,0.23415,0.23415
; hole_limit_max = 0.22,0.22,0.22,0.22,0.22,0.22,0.22,0.22,0.22
; hole_limit_min = 0.088,0.088,0.088,0.088,0.088,0.088,0.088,0.088,0.088
; host_type = octoprint
; hot_plate_temp = 55,55,55,55,55,55,55,55,70
; hot_plate_temp_initial_layer = 55,55,55,55,55,55,55,55,70
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 6.6,10,6.6,6.6,10,13.8,6.6,6.6,10
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
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
; inner_wall_speed = 150
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
; internal_solid_infill_speed = 200
; ironing_direction = 45
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
; long_retractions_when_ec = 0,0,0,0,0,0,0,0,0
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of "timelapse_record_flag"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,200
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0
; machine_min_travel_rate = 0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: P1S-0.4 ========================\n;===== date: 20250822 =====================\n;===== turn on the HB fan & MC board fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\nM710 A1 S255 ;turn on MC fan by default(P1S)\n;===== reset machine status =================\nM290 X40 Y40 Z2.6666666\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action : 2\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_extruder]A\nM620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== fmech mode fast check============================\n\n\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature_initial_layer[initial_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 28
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
; no_slow_down_for_cooling_on_outwalls = 0,0,0,0,0,0,0,0,0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.2
; nozzle_temperature = 220,220,220,220,220,220,220,220,255
; nozzle_temperature_initial_layer = 220,220,220,220,220,220,220,220,255
; nozzle_temperature_range_high = 240,240,240,240,240,240,240,240,270
; nozzle_temperature_range_low = 190,190,190,190,190,190,190,190,220
; nozzle_type = stainless_steel
; nozzle_volume = 107
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 2000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 60
; overhang_1_4_speed = 60
; overhang_2_4_speed = 30
; overhang_3_4_speed = 10
; overhang_4_4_speed = 10
; overhang_fan_speed = 100,100,100,100,100,100,100,100,90
; overhang_fan_threshold = 50%,50%,50%,50%,50%,50%,50%,50%,10%
; overhang_threshold_participating_cooling = 95%,95%,95%,95%,95%,95%,95%,95%,95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0,0,0,0,0,0,0,0,0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02
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
; print_compatible_printers = "Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.16mm High Quality @BBL X1C
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab P1S
; printer_notes = 
; printer_settings_id = Bambu Lab P1S 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1,1,1,1,1,1,1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3,3,3,3,3,3,3,3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0,0,0,0,0,0,0,0,0
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
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1,1,1,1,1,1,1,1
; slow_down_layer_time = 4,8,4,4,8,4,4,4,12
; slow_down_min_speed = 20,20,20,20,20,20,20,20,20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 150
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 20%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = cubic
; sparse_infill_speed = 200
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45,45,45,45,45,45,45,45,70
; supertack_plate_temp_initial_layer = 45,45,45,45,45,45,45,45,70
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.16
; support_chamber_temp_control = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
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
; temperature_vitrification = 45,45,45,45,45,45,45,45,70
; template_custom_gcode = 
; textured_plate_temp = 55,55,55,55,55,55,55,55,70
; textured_plate_temp_initial_layer = 55,55,55,55,55,55,55,55,70
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;========Date 20250206========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\nM1004 S5 P1  ; external shutter\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; SKIPPABLE_END
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 6
; top_one_wall_type = all top
; top_shell_layers = 6
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 150
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 1
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
; wipe_tower_x = 165,165,165,160.673,165,165
; wipe_tower_y = 214.804,214.804,214.804,207.914,214.804,214.804
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
M73 P0 R70
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: P1S-0.4 ========================
;===== date: 20250822 =====================
;===== turn on the HB fan & MC board fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
M710 A1 S255 ;turn on MC fan by default(P1S)
;===== reset machine status =================
M290 X40 Y40 Z2.6666666
G91
M17 Z0.4 ; lower the z-motor current
G380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed
G380 S2 Z-25 F300 ;
G1 Z5 F300;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first
M204 S10000 ; init ACC set to 10m/s^2

;===== heatbed preheat ====================
M1002 gcode_claim_action : 2
M140 S55 ;set bed temp
M190 S55 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S220 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
G1 X60 F12000
G1 Y245
G1 Y265 F3000
M620 M
M620 S2A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T2
    G1 X54 F12000
    G1 Y265
    M400
M621 S2A
M620.1 E F548.788 T240


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P0 R69
G1 E50 F200
M400
M104 S220
G92 E0
M73 P6 R65
G1 E50 F200
M400
M106 P1 S255
G92 E0
M73 P7 R65
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

M73 P7 R64
G1 X70 F9000
G1 X76 F15000
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S200
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
G1 Z10
M73 P8 R64
G1 F30000
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X39.7942 Y57.8777 I176.412 J140.245
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression


;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X230 Y15
G28 X ; re-home XY
;===== fmech mode fast check============================


;===== nozzle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S220
G1 Z0.2
G0 E2 F300
G0 X240 E15 F1480.95
G0 Y11 E0.700 F370.237
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F1480.95
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=High Temp Plate

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S150

M142 P1 R35 S40
;VT2
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/14
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S6000
G1 Z.4 F30000
; object ids of layer 1 start: 325,353,381,409,437,465
M624 PwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer1 end: 325,353,381,409,437,465
M625
; OBJECT_ID: 325
; start printing object, unique label id: 325
M624 AQAAAAAAAAA=
G1 X207.602 Y75.178
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X145.65 Y110.682 E2.65955
G1 X133.561 Y103.702 E.51993
G1 X132.626 Y56.969 E1.74098
G1 X136.898 Y58.007 E.16374
G1 X207.544 Y75.164 E2.70777
; WIPE_START
G1 X205.809 Y76.159 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X209.197 Y74.951 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X207.986 Y75.518 I-3.452 J-5.795 E.0499
G2 X207.082 Y75.991 I4.02 J8.783 E.03802
G1 X145.649 Y111.209 E2.63746
G1 X133.109 Y103.969 E.53932
G1 X132.157 Y56.385 E1.77269
G1 X137.006 Y57.563 E.18585
G1 X206.862 Y74.538 E2.67758
G2 X208.37 Y74.787 I2.103 J-8.049 E.05701
G3 X209.139 Y74.936 I-.704 J5.7 E.02921
M204 S6000
G1 X208.468 Y75.061 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.165797
G1 F3000
M204 S500
G2 X208.3 Y75.079 I.155 J2.202 E.00169
; LINE_WIDTH: 0.167801
G1 X208.276 Y75.103 E.00034
; LINE_WIDTH: 0.141383
G1 X208.253 Y75.126 E.00027
; LINE_WIDTH: 0.115562
G1 X208.065 Y75.214 E.00123
; WIPE_START
G1 X208.253 Y75.126 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X204.044 Y77.009 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X205.908 Y75.145 E.09817
G1 X203.543 Y74.571 E.09064
G1 X197.665 Y80.449 E.30965
G1 X190.78 Y84.395 E.29556
G1 X201.178 Y73.996 E.54774
G1 X198.813 Y73.422 E.09064
G1 X183.895 Y88.34 E.78582
M73 P8 R63
G1 X177.01 Y92.286 E.29556
M73 P9 R63
G1 X196.449 Y72.848 E1.0239
G1 X194.084 Y72.273 E.09064
G1 X170.125 Y96.232 E1.26198
G1 X163.241 Y100.177 E.29556
G1 X191.719 Y71.699 E1.50007
G1 X189.354 Y71.125 E.09064
G1 X156.356 Y104.123 E1.73815
G1 X149.471 Y108.069 E.29556
G1 X186.989 Y70.55 E1.97623
G1 X184.624 Y69.976 E.09064
G1 X144.821 Y109.779 E2.09657
G1 X142.958 Y108.703 E.08014
G1 X182.259 Y69.402 E2.07016
G1 X179.894 Y68.828 E.09064
G1 X141.095 Y107.627 E2.04374
G1 X139.231 Y106.551 E.08014
G1 X177.53 Y68.253 E2.01732
G1 X175.165 Y67.679 E.09064
G1 X137.368 Y105.476 E1.99091
G1 X135.505 Y104.4 E.08014
G1 X172.8 Y67.105 E1.96449
G1 X170.435 Y66.53 E.09064
G1 X133.916 Y103.049 E1.9236
G1 X133.858 Y100.168 E.10735
G1 X168.07 Y65.956 E1.80207
G1 X165.705 Y65.382 E.09064
G1 X133.801 Y97.286 E1.68054
G1 X133.743 Y94.405 E.10735
G1 X163.34 Y64.807 E1.55901
G1 X160.976 Y64.233 E.09064
G1 X133.685 Y91.523 E1.43748
G1 X133.628 Y88.642 E.10735
G1 X158.611 Y63.659 E1.31595
G1 X156.246 Y63.084 E.09064
G1 X133.57 Y85.76 E1.19442
G1 X133.513 Y82.879 E.10735
G1 X153.881 Y62.51 E1.07289
G1 X151.516 Y61.936 E.09064
G1 X133.455 Y79.997 E.95136
G1 X133.397 Y77.116 E.10735
G1 X149.151 Y61.362 E.82983
G1 X146.786 Y60.787 E.09064
G1 X133.34 Y74.234 E.7083
G1 X133.282 Y71.353 E.10735
G1 X144.421 Y60.213 E.58677
G1 X142.057 Y59.639 E.09064
G1 X133.224 Y68.471 E.46524
G1 X133.167 Y65.589 E.10735
G1 X139.692 Y59.064 E.34371
G1 X137.327 Y58.49 E.09064
G1 X133.109 Y62.708 E.22218
G1 X133.051 Y59.826 E.10735
G1 X135.117 Y57.761 E.10882
; OBJECT_ID: 353
; WIPE_START
G1 X133.703 Y59.175 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 325
M625
; start printing object, unique label id: 353
M624 AgAAAAAAAAA=
M204 S6000
G1 X138.207 Y65.337 Z.6 F30000
G1 X215.349 Y170.876 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X150.091 Y133.465 E2.8017
G1 X150.091 Y118.535 E.55609
G1 X215.349 Y81.124 E2.8017
G1 X215.349 Y170.816 E3.34072
M204 S6000
G1 X215.806 Y171.665 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X149.634 Y133.73 E2.84094
G1 X149.634 Y118.27 E.57582
G1 X215.806 Y80.335 E2.84094
G1 X215.806 Y171.605 E3.39949
; WIPE_START
G1 X214.07 Y170.612 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X213.563 Y169.645 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F3000
M204 S500
G1 X214.981 Y169.645 E.05281
G1 X214.981 Y167.566 E.07741
G1 X210.314 Y167.566 E.17382
G1 X206.689 Y165.488 E.15564
G1 X214.981 Y165.488 E.30885
G1 X214.981 Y163.41 E.07741
G1 X203.063 Y163.41 E.44388
G1 X199.438 Y161.331 E.15564
G1 X214.981 Y161.331 E.57891
M73 P10 R63
G1 X214.981 Y159.253 E.07741
G1 X195.813 Y159.253 E.71393
G1 X192.188 Y157.175 E.15564
G1 X214.981 Y157.175 E.84896
G1 X214.981 Y155.096 E.07741
G1 X188.562 Y155.096 E.98399
G1 X184.937 Y153.018 E.15564
G1 X214.981 Y153.018 E1.11901
G1 X214.981 Y150.94 E.07741
G1 X181.312 Y150.94 E1.25404
G1 X177.687 Y148.861 E.15564
G1 X214.981 Y148.861 E1.38907
G1 X214.981 Y146.783 E.07741
G1 X174.061 Y146.783 E1.5241
G1 X170.436 Y144.705 E.15564
G1 X214.981 Y144.705 E1.65912
G1 X214.981 Y142.626 E.07741
G1 X166.811 Y142.626 E1.79415
G1 X163.186 Y140.548 E.15564
G1 X214.981 Y140.548 E1.92918
G1 X214.981 Y138.47 E.07741
G1 X159.56 Y138.47 E2.0642
G1 X155.935 Y136.392 E.15564
G1 X214.981 Y136.392 E2.19923
G1 X214.981 Y134.313 E.07741
G1 X152.31 Y134.313 E2.33426
G1 X150.459 Y133.252 E.07948
G1 X150.459 Y132.235 E.03788
G1 X214.981 Y132.235 E2.40321
G1 X214.981 Y130.157 E.07741
G1 X150.459 Y130.157 E2.40321
G1 X150.459 Y128.078 E.07741
M73 P10 R62
G1 X214.981 Y128.078 E2.40321
G1 X214.981 Y126 E.07741
G1 X150.459 Y126 E2.40321
G1 X150.459 Y123.922 E.07741
G1 X214.981 Y123.922 E2.40321
G1 X214.981 Y121.843 E.07741
G1 X150.459 Y121.843 E2.40321
G1 X150.459 Y119.765 E.07741
G1 X214.981 Y119.765 E2.40321
G1 X214.981 Y117.687 E.07741
G1 X152.31 Y117.687 E2.33426
G1 X155.935 Y115.608 E.15564
G1 X214.981 Y115.608 E2.19923
G1 X214.981 Y113.53 E.07741
G1 X159.56 Y113.53 E2.0642
G1 X163.186 Y111.452 E.15564
G1 X214.981 Y111.452 E1.92918
G1 X214.981 Y109.374 E.07741
G1 X166.811 Y109.374 E1.79415
G1 X170.436 Y107.295 E.15564
G1 X214.981 Y107.295 E1.65912
G1 X214.981 Y105.217 E.07741
G1 X174.061 Y105.217 E1.5241
G1 X177.687 Y103.139 E.15564
G1 X214.981 Y103.139 E1.38907
G1 X214.981 Y101.06 E.07741
G1 X181.312 Y101.06 E1.25404
G1 X184.937 Y98.982 E.15564
G1 X214.981 Y98.982 E1.11901
G1 X214.981 Y96.904 E.07741
G1 X188.562 Y96.904 E.98399
G1 X192.188 Y94.825 E.15564
G1 X214.981 Y94.825 E.84896
G1 X214.981 Y92.747 E.07741
G1 X195.813 Y92.747 E.71393
G1 X199.438 Y90.669 E.15564
G1 X214.981 Y90.669 E.57891
G1 X214.981 Y88.59 E.07741
G1 X203.064 Y88.59 E.44388
G1 X206.689 Y86.512 E.15564
G1 X214.981 Y86.512 E.30885
G1 X214.981 Y84.434 E.07741
G1 X210.314 Y84.434 E.17382
G1 X213.939 Y82.355 E.15564
G1 X215.168 Y82.355 E.04576
; OBJECT_ID: 381
; WIPE_START
G1 X213.939 Y82.355 E-.4669
G1 X213.27 Y82.739 E-.2931
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 353
M625
; start printing object, unique label id: 381
M624 BAAAAAAAAAA=
M204 S6000
G1 X212.811 Y90.358 Z.6 F30000
G1 X207.602 Y176.822 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X132.626 Y195.031 E2.87374
G1 X133.561 Y148.298 E1.74098
G1 X145.65 Y141.318 E.51992
G1 X206.841 Y176.397 E2.62708
G1 X207.55 Y176.793 E.03023
; WIPE_START
G1 X205.607 Y177.266 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X209.197 Y177.049 Z.6 F30000
M73 P11 R62
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X207.865 Y177.258 I-1.748 J-6.788 E.05028
G2 X206.862 Y177.462 I1.481 J9.84 E.03817
G1 X132.157 Y195.615 E2.86342
G1 X133.109 Y148.031 E1.77269
G1 X145.649 Y140.791 E.53932
G1 X145.929 Y140.951 E.012
G1 X207.066 Y176 E2.62478
G2 X208.447 Y176.66 I4.292 J-7.199 E.05707
G3 X209.146 Y177.017 I-2.226 J5.217 E.02928
M204 S6000
G1 X208.463 Y176.95 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.16628
G1 F3000
M204 S500
G2 X208.299 Y176.921 I-.458 J2.15 E.00167
; LINE_WIDTH: 0.166875
G1 X208.276 Y176.898 E.00034
; LINE_WIDTH: 0.140546
G1 X208.252 Y176.875 E.00026
; LINE_WIDTH: 0.115154
G1 X208.064 Y176.786 E.00122
; WIPE_START
G1 X208.252 Y176.875 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X206.063 Y177.01 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X204.575 Y175.522 E.07836
G1 X197.687 Y171.574 E.29571
G1 X203.543 Y177.429 E.30845
G1 X201.178 Y178.004 E.09064
G1 X190.8 Y167.625 E.54669
G1 X183.912 Y163.676 E.29571
G1 X198.813 Y178.578 E.78493
G1 X196.449 Y179.152 E.09064
G1 X177.024 Y159.728 E1.02317
G1 X170.136 Y155.779 E.29571
G1 X194.084 Y179.727 E1.26141
G1 X191.719 Y180.301 E.09064
G1 X163.248 Y151.831 E1.49966
G1 X156.361 Y147.882 E.29571
G1 X189.354 Y180.875 E1.7379
G1 X186.989 Y181.45 E.09064
G1 X149.473 Y143.933 E1.97614
G1 X145.651 Y141.742 E.16409
G1 X144.822 Y142.221 E.03567
G1 X184.624 Y182.024 E2.09658
G1 X182.26 Y182.598 E.09064
G1 X142.958 Y143.297 E2.07016
G1 X141.095 Y144.373 E.08014
G1 X179.895 Y183.173 E2.04375
G1 X177.53 Y183.747 E.09064
G1 X139.231 Y145.449 E2.01733
G1 X137.368 Y146.524 E.08014
G1 X175.165 Y184.321 E1.99092
G1 X172.8 Y184.896 E.09064
G1 X135.505 Y147.6 E1.9645
G1 X133.925 Y148.512 E.06795
G1 X133.916 Y148.951 E.01633
G1 X170.435 Y185.47 E1.92362
G1 X168.07 Y186.044 E.09064
G1 X133.858 Y151.832 E1.80209
G1 X133.801 Y154.714 E.10735
G1 X165.706 Y186.619 E1.68056
G1 X163.341 Y187.193 E.09064
G1 X133.743 Y157.595 E1.55903
G1 X133.685 Y160.477 E.10735
G1 X160.976 Y187.767 E1.4375
G1 X158.611 Y188.342 E.09064
G1 X133.628 Y163.358 E1.31597
G1 X133.57 Y166.24 E.10735
G1 X156.246 Y188.916 E1.19444
G1 X153.881 Y189.49 E.09064
G1 X133.513 Y169.121 E1.07291
G1 X133.455 Y172.003 E.10735
G1 X151.516 Y190.065 E.95138
G1 X149.152 Y190.639 E.09064
G1 X133.397 Y174.884 E.82985
G1 X133.34 Y177.766 E.10735
G1 X146.787 Y191.213 E.70832
G1 X144.422 Y191.788 E.09064
G1 X133.282 Y180.647 E.58679
G1 X133.224 Y183.529 E.10735
G1 X142.057 Y192.362 E.46526
G1 X139.692 Y192.936 E.09064
G1 X133.167 Y186.411 E.34373
G1 X133.109 Y189.292 E.10735
G1 X137.327 Y193.511 E.2222
G1 X134.963 Y194.085 E.09064
G1 X132.868 Y191.99 E.11034
; OBJECT_ID: 409
; WIPE_START
G1 X134.282 Y193.404 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 381
M625
; start printing object, unique label id: 409
M624 CAAAAAAAAAA=
M204 S6000
G1 X126.788 Y191.957 Z.6 F30000
G1 X48.398 Y176.822 Z.6
M73 P11 R61
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X110.35 Y141.318 E2.65955
G1 X122.439 Y148.298 E.51993
G1 X123.374 Y195.031 E1.74098
G1 X48.456 Y176.836 E2.87152
; WIPE_START
G1 X50.191 Y175.841 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X46.803 Y177.049 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X48.014 Y176.482 I3.452 J5.794 E.0499
G2 X48.918 Y176.009 I-4.02 J-8.783 E.03802
G1 X110.351 Y140.791 E2.63746
G1 X110.626 Y140.95 E.01186
G1 X122.891 Y148.031 E.52746
G1 X123.843 Y195.615 E1.77269
G1 X49.138 Y177.462 E2.86342
G2 X47.63 Y177.213 I-2.103 J8.049 E.05701
G3 X46.861 Y177.064 I.704 J-5.701 E.02921
M204 S6000
G1 X47.724 Y176.897 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.158802
M73 P12 R61
G1 F3000
M204 S500
G1 X47.7 Y176.921 E.00031
G1 X47.759 Y176.953 E.00063
; LINE_WIDTH: 0.115284
G1 X47.964 Y176.985 E.00123
M204 S6000
G1 X47.935 Y176.786 F30000
; LINE_WIDTH: 0.11555
G1 F3000
M204 S500
G1 X47.747 Y176.874 E.00123
; LINE_WIDTH: 0.141403
G1 X47.724 Y176.897 E.00027
; WIPE_START
G1 X47.747 Y176.874 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X51.956 Y174.991 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X50.092 Y176.855 E.09817
G1 X52.457 Y177.429 E.09064
G1 X58.335 Y171.551 E.30965
G1 X65.22 Y167.605 E.29556
G1 X54.822 Y178.004 E.54774
G1 X57.187 Y178.578 E.09064
G1 X72.105 Y163.66 E.78582
G1 X78.99 Y159.714 E.29556
G1 X59.551 Y179.152 E1.0239
G1 X61.916 Y179.727 E.09064
G1 X85.875 Y155.768 E1.26199
G1 X92.759 Y151.823 E.29556
G1 X64.281 Y180.301 E1.50007
G1 X66.646 Y180.875 E.09064
G1 X99.644 Y147.877 E1.73816
G1 X106.529 Y143.931 E.29556
G1 X69.011 Y181.45 E1.97624
G1 X71.376 Y182.024 E.09064
G1 X111.179 Y142.221 E2.09658
G1 X113.042 Y143.297 E.08014
G1 X73.74 Y182.598 E2.07017
G1 X76.105 Y183.173 E.09064
G1 X114.905 Y144.373 E2.04375
G1 X116.769 Y145.449 E.08014
G1 X78.47 Y183.747 E2.01733
G1 X80.835 Y184.321 E.09064
G1 X118.632 Y146.524 E1.99092
G1 X120.495 Y147.6 E.08014
G1 X83.2 Y184.896 E1.9645
G1 X85.565 Y185.47 E.09064
G1 X122.084 Y148.951 E1.92361
G1 X122.142 Y151.832 E.10735
G1 X87.93 Y186.044 E1.80209
G1 X90.294 Y186.619 E.09064
G1 X122.199 Y154.714 E1.68056
G1 X122.257 Y157.595 E.10735
G1 X92.659 Y187.193 E1.55903
G1 X95.024 Y187.767 E.09064
G1 X122.315 Y160.477 E1.4375
G1 X122.372 Y163.358 E.10735
G1 X97.389 Y188.342 E1.31597
G1 X99.754 Y188.916 E.09064
G1 X122.43 Y166.24 E1.19444
G1 X122.487 Y169.121 E.10735
G1 X102.119 Y189.49 E1.07291
G1 X104.484 Y190.065 E.09064
G1 X122.545 Y172.003 E.95138
G1 X122.603 Y174.884 E.10735
G1 X106.848 Y190.639 E.82985
G1 X109.213 Y191.213 E.09064
G1 X122.66 Y177.766 E.70832
G1 X122.718 Y180.647 E.10735
G1 X111.578 Y191.788 E.58679
G1 X113.943 Y192.362 E.09064
G1 X122.776 Y183.529 E.46526
G1 X122.833 Y186.411 E.10735
G1 X116.308 Y192.936 E.34373
G1 X118.673 Y193.51 E.09064
G1 X122.891 Y189.292 E.2222
G1 X122.949 Y192.174 E.10735
G1 X120.883 Y194.24 E.10883
; OBJECT_ID: 437
; WIPE_START
G1 X122.297 Y192.825 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 409
M625
; start printing object, unique label id: 437
M624 EAAAAAAAAAA=
M204 S6000
G1 X118.237 Y186.362 Z.6 F30000
G1 X48.398 Y75.178 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X123.374 Y56.969 E2.87375
G1 X123.335 Y58.895 E.07175
G1 X122.439 Y103.702 E1.66924
G1 X110.35 Y110.682 E.51993
G1 X48.45 Y75.208 E2.65731
; WIPE_START
G1 X50.393 Y74.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X46.803 Y74.951 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X48.134 Y74.742 I1.748 J6.788 E.05028
G2 X49.138 Y74.538 I-1.481 J-9.839 E.03817
G1 X123.843 Y56.385 E2.86342
G1 X123.792 Y58.904 E.09385
G1 X122.891 Y103.969 E1.67884
G1 X110.351 Y111.209 E.53932
G1 X48.918 Y75.991 E2.63746
G2 X47.544 Y75.338 I-4.137 J6.931 E.05675
G3 X46.854 Y74.982 I2.435 J-5.568 E.02893
M204 S6000
G1 X47.729 Y75.063 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.158954
G1 F3000
M204 S500
G1 X47.7 Y75.079 E.00032
G1 X47.747 Y75.126 E.00063
; LINE_WIDTH: 0.115547
G1 X47.935 Y75.214 E.00123
M204 S6000
G1 X47.964 Y75.015 F30000
; LINE_WIDTH: 0.115282
G1 F3000
M204 S500
G1 X47.759 Y75.047 E.00123
; LINE_WIDTH: 0.140984
G1 X47.729 Y75.063 E.00027
; WIPE_START
G1 X47.759 Y75.047 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X49.937 Y74.99 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X51.451 Y76.504 E.07973
G1 X58.336 Y80.449 E.29556
G1 X52.457 Y74.571 E.30965
G1 X54.822 Y73.996 E.09064
G1 X65.22 Y84.395 E.54774
G1 X72.105 Y88.34 E.29556
M73 P13 R61
G1 X57.187 Y73.422 E.78582
G1 X59.551 Y72.848 E.09064
G1 X78.99 Y92.286 E1.0239
G1 X85.875 Y96.232 E.29556
G1 X61.916 Y72.273 E1.26199
G1 X64.281 Y71.699 E.09064
G1 X92.759 Y100.177 E1.50007
G1 X99.644 Y104.123 E.29556
G1 X66.646 Y71.125 E1.73816
G1 X69.011 Y70.55 E.09064
G1 X106.529 Y108.069 E1.97624
G1 X110.349 Y110.258 E.16399
G1 X111.179 Y109.779 E.03567
G1 X71.376 Y69.976 E2.09658
G1 X73.74 Y69.402 E.09064
M73 P13 R60
G1 X113.042 Y108.703 E2.07017
G1 X114.905 Y107.627 E.08014
G1 X76.105 Y68.827 E2.04375
G1 X78.47 Y68.253 E.09064
G1 X116.769 Y106.551 E2.01733
G1 X118.632 Y105.476 E.08014
G1 X80.835 Y67.679 E1.99092
G1 X83.2 Y67.104 E.09064
G1 X120.495 Y104.4 E1.9645
G1 X122.075 Y103.488 E.06795
G1 X122.084 Y103.049 E.01633
G1 X85.565 Y66.53 E1.92362
G1 X87.93 Y65.956 E.09064
G1 X122.142 Y100.168 E1.80209
G1 X122.199 Y97.286 E.10735
G1 X90.294 Y65.381 E1.68056
G1 X92.659 Y64.807 E.09064
G1 X122.257 Y94.405 E1.55903
G1 X122.315 Y91.523 E.10735
G1 X95.024 Y64.233 E1.4375
G1 X97.389 Y63.658 E.09064
G1 X122.372 Y88.642 E1.31597
G1 X122.43 Y85.76 E.10735
G1 X99.754 Y63.084 E1.19444
G1 X102.119 Y62.51 E.09064
G1 X122.487 Y82.879 E1.07291
G1 X122.545 Y79.997 E.10735
G1 X104.484 Y61.935 E.95138
G1 X106.848 Y61.361 E.09064
G1 X122.603 Y77.116 E.82985
G1 X122.66 Y74.234 E.10735
G1 X109.213 Y60.787 E.70832
G1 X111.578 Y60.212 E.09064
G1 X122.718 Y71.353 E.58679
G1 X122.776 Y68.471 E.10735
G1 X113.943 Y59.638 E.46526
G1 X116.308 Y59.064 E.09064
G1 X122.833 Y65.589 E.34373
G1 X122.891 Y62.708 E.10735
G1 X118.673 Y58.489 E.2222
G1 X121.037 Y57.915 E.09064
G1 X123.132 Y60.01 E.11034
; OBJECT_ID: 465
; WIPE_START
G1 X121.718 Y58.596 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 437
M625
; start printing object, unique label id: 465
M624 IAAAAAAAAAA=
M204 S6000
G1 X117.25 Y64.784 Z.6 F30000
G1 X40.651 Y170.876 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X40.651 Y81.124 E3.34296
G1 X105.909 Y118.535 E2.8017
G1 X105.909 Y133.465 E.55609
G1 X40.703 Y170.847 E2.79946
M204 S6000
G1 X40.194 Y171.665 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X40.194 Y80.335 E3.40172
G1 X106.366 Y118.27 E2.84094
G1 X106.366 Y133.73 E.57582
G1 X40.246 Y171.636 E2.83871
; WIPE_START
G1 X40.245 Y169.636 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X40.832 Y169.645 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F3000
M204 S500
G1 X42.061 Y169.645 E.04576
G1 X45.686 Y167.566 E.15564
G1 X41.019 Y167.566 E.17382
G1 X41.019 Y165.488 E.07741
G1 X49.311 Y165.488 E.30885
G1 X52.936 Y163.41 E.15564
G1 X41.019 Y163.41 E.44388
G1 X41.019 Y161.331 E.07741
G1 X56.562 Y161.331 E.57891
G1 X60.187 Y159.253 E.15564
G1 X41.019 Y159.253 E.71393
G1 X41.019 Y157.175 E.07741
G1 X63.812 Y157.175 E.84896
G1 X67.438 Y155.096 E.15564
G1 X41.019 Y155.096 E.98399
G1 X41.019 Y153.018 E.07741
G1 X71.063 Y153.018 E1.11901
G1 X74.688 Y150.94 E.15564
G1 X41.019 Y150.94 E1.25404
G1 X41.019 Y148.861 E.07741
G1 X78.313 Y148.861 E1.38907
G1 X81.939 Y146.783 E.15564
G1 X41.019 Y146.783 E1.5241
G1 X41.019 Y144.705 E.07741
G1 X85.564 Y144.705 E1.65912
G1 X89.189 Y142.626 E.15564
G1 X41.019 Y142.626 E1.79415
G1 X41.019 Y140.548 E.07741
G1 X92.814 Y140.548 E1.92918
G1 X96.44 Y138.47 E.15564
G1 X41.019 Y138.47 E2.0642
G1 X41.019 Y136.392 E.07741
G1 X100.065 Y136.392 E2.19923
G1 X103.69 Y134.313 E.15564
G1 X41.019 Y134.313 E2.33426
G1 X41.019 Y132.235 E.07741
G1 X105.541 Y132.235 E2.40321
G1 X105.541 Y130.157 E.07741
G1 X41.019 Y130.157 E2.40321
G1 X41.019 Y128.078 E.07741
G1 X105.541 Y128.078 E2.40321
M73 P14 R60
G1 X105.541 Y126 E.07741
G1 X41.019 Y126 E2.40321
G1 X41.019 Y123.922 E.07741
G1 X105.541 Y123.922 E2.40321
G1 X105.541 Y121.843 E.07741
G1 X41.019 Y121.843 E2.40321
G1 X41.019 Y119.765 E.07741
G1 X105.541 Y119.765 E2.40321
G1 X105.541 Y118.748 E.03788
G1 X103.69 Y117.687 E.07948
G1 X41.019 Y117.687 E2.33426
G1 X41.019 Y115.608 E.07741
G1 X100.065 Y115.608 E2.19923
G1 X96.44 Y113.53 E.15564
G1 X41.019 Y113.53 E2.0642
G1 X41.019 Y111.452 E.07741
G1 X92.814 Y111.452 E1.92918
G1 X89.189 Y109.374 E.15564
G1 X41.019 Y109.374 E1.79415
G1 X41.019 Y107.295 E.07741
G1 X85.564 Y107.295 E1.65912
G1 X81.939 Y105.217 E.15564
G1 X41.019 Y105.217 E1.5241
G1 X41.019 Y103.139 E.07741
G1 X78.313 Y103.139 E1.38907
G1 X74.688 Y101.06 E.15564
G1 X41.019 Y101.06 E1.25404
G1 X41.019 Y98.982 E.07741
G1 X71.063 Y98.982 E1.11901
G1 X67.438 Y96.904 E.15564
G1 X41.019 Y96.904 E.98399
G1 X41.019 Y94.825 E.07741
G1 X63.812 Y94.825 E.84896
G1 X60.187 Y92.747 E.15564
G1 X41.019 Y92.747 E.71393
G1 X41.019 Y90.669 E.07741
G1 X56.562 Y90.669 E.57891
G1 X52.937 Y88.59 E.15564
G1 X41.019 Y88.59 E.44388
G1 X41.019 Y86.512 E.07741
G1 X49.311 Y86.512 E.30885
G1 X45.686 Y84.434 E.15564
G1 X41.019 Y84.434 E.17382
G1 X41.019 Y82.355 E.07741
G1 X42.437 Y82.355 E.05281
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
G1 X41.019 Y82.355 E-.53874
G1 X41.019 Y82.938 E-.22126
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 465
M625
; layer num/total_layer_count: 2/14
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
M106 P2 S178
; open powerlost recovery
M1003 S1
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F30000
; object ids of layer 2 start: 325,353,381,409,437,465
M624 PwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer2 end: 325,353,381,409,437,465
M625
; OBJECT_ID: 325
; start printing object, unique label id: 325
M624 AQAAAAAAAAA=
M73 P14 R59
G1 X208.38 Y75.124
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M204 S4000
G1 X145.65 Y111.086 E1.95933
G1 X133.215 Y103.907 E.38907
G1 X132.269 Y56.629 E1.28136
G1 X208.322 Y75.11 E2.12078
; WIPE_START
G1 X206.587 Y76.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.362 Y74.95 Z.76 F30000
G1 Z.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X209.451 Y74.972 E.0023
G1 F2880
G1 X145.649 Y111.549 E1.84897
G1 X132.819 Y104.141 E.37247
G1 X131.858 Y56.117 E1.20764
G1 F3582.311
G1 X131.921 Y56.132 E.00164
G1 F3600
G1 X132.31 Y56.226 E.01006
G1 X209.304 Y74.936 E1.99206
; WIPE_START
M204 S4000
G1 X209.451 Y74.972 E-.05761
G1 X207.847 Y75.891 E-.7024
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.407 Y75.487 Z.76 F30000
G1 Z.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.099 Y75.178 E.01184
M73 P15 R59
G1 X206.319 Y74.989 E.02174
G1 X206.895 Y75.565 E.02209
G1 X206.52 Y75.78 E.01171
G1 X205.54 Y74.799 E.03758
G1 X204.76 Y74.61 E.02174
G1 X206.145 Y75.995 E.05308
G1 X205.77 Y76.21 E.01171
G1 X203.981 Y74.421 E.06858
G1 X203.201 Y74.231 E.02174
G1 X205.395 Y76.425 E.08408
G1 X205.02 Y76.64 E.01171
G1 X202.422 Y74.042 E.09958
G1 X201.642 Y73.852 E.02174
G1 X204.645 Y76.855 E.11508
G1 X204.27 Y77.07 E.01171
G1 X200.863 Y73.663 E.13057
G1 X200.083 Y73.474 E.02174
G1 X203.895 Y77.285 E.14607
G1 X203.52 Y77.5 E.01171
G1 X199.304 Y73.284 E.16157
G1 X198.524 Y73.095 E.02174
G1 X203.145 Y77.715 E.17707
G1 X202.77 Y77.93 E.01171
G1 X197.745 Y72.905 E.19257
G1 X196.965 Y72.716 E.02174
G1 X202.395 Y78.145 E.20807
G1 X202.02 Y78.36 E.01171
G1 X196.186 Y72.526 E.22356
G1 X195.406 Y72.337 E.02174
G1 X201.644 Y78.575 E.23906
G1 X201.269 Y78.79 E.01171
G1 X194.627 Y72.148 E.25456
G1 X193.847 Y71.958 E.02174
G1 X200.894 Y79.006 E.27006
G1 X200.519 Y79.221 E.01171
G1 X193.068 Y71.769 E.28556
G1 X192.288 Y71.579 E.02174
G1 X200.144 Y79.436 E.30106
G1 X199.769 Y79.651 E.01171
G1 X191.509 Y71.39 E.31656
G1 X190.729 Y71.201 E.02174
G1 X199.394 Y79.866 E.33205
G1 X199.019 Y80.081 E.01171
G1 X189.95 Y71.011 E.34755
G1 X189.17 Y70.822 E.02174
G1 X198.644 Y80.296 E.36305
G1 X198.269 Y80.511 E.01171
G1 X188.391 Y70.632 E.37855
G1 X187.611 Y70.443 E.02174
G1 X197.894 Y80.726 E.39405
G1 X197.519 Y80.941 E.01171
G1 X186.832 Y70.253 E.40955
G1 X186.052 Y70.064 E.02174
G1 X197.144 Y81.156 E.42504
G1 X196.769 Y81.371 E.01171
G1 X185.273 Y69.875 E.44054
G1 X184.493 Y69.685 E.02174
G1 X196.394 Y81.586 E.45604
G1 X196.019 Y81.801 E.01171
G1 X183.714 Y69.496 E.47154
G1 X182.934 Y69.306 E.02174
G1 X195.643 Y82.016 E.48704
G1 X195.268 Y82.231 E.01171
G1 X182.155 Y69.117 E.50254
G1 X181.375 Y68.928 E.02174
G1 X194.893 Y82.446 E.51803
G1 X194.518 Y82.661 E.01171
G1 X180.596 Y68.738 E.53353
G1 X179.816 Y68.549 E.02174
G1 X194.143 Y82.876 E.54903
G1 X193.768 Y83.091 E.01171
G1 X179.037 Y68.359 E.56453
G1 X178.257 Y68.17 E.02174
G1 X193.393 Y83.306 E.58003
G1 X193.018 Y83.521 E.01171
G1 X177.478 Y67.98 E.59553
G1 X176.698 Y67.791 E.02174
G1 X192.643 Y83.736 E.61103
G1 X192.268 Y83.951 E.01171
G1 X175.919 Y67.602 E.62652
G1 X175.139 Y67.412 E.02174
G1 X191.893 Y84.166 E.64202
G1 X191.518 Y84.381 E.01171
G1 X174.36 Y67.223 E.65752
G1 X173.58 Y67.033 E.02174
G1 X191.143 Y84.596 E.67302
G1 X190.768 Y84.811 E.01171
G1 X172.801 Y66.844 E.68852
G1 X172.021 Y66.654 E.02174
G1 X190.393 Y85.026 E.70402
G1 X190.018 Y85.241 E.01171
G1 X171.242 Y66.465 E.71951
G1 X170.462 Y66.276 E.02174
G1 X189.642 Y85.456 E.73501
G1 X189.267 Y85.671 E.01171
G1 X169.683 Y66.086 E.75051
G1 X168.903 Y65.897 E.02174
G1 X188.892 Y85.886 E.76601
G1 X188.517 Y86.101 E.01171
G1 X168.124 Y65.707 E.78151
G1 X167.344 Y65.518 E.02174
G1 X188.142 Y86.316 E.79701
G1 X187.767 Y86.531 E.01171
G1 X166.565 Y65.329 E.8125
G1 X165.785 Y65.139 E.02174
G1 X187.392 Y86.746 E.828
G1 X187.017 Y86.961 E.01171
G1 X165.006 Y64.95 E.8435
G1 X164.226 Y64.76 E.02174
G1 X186.642 Y87.176 E.859
G1 X186.267 Y87.391 E.01171
G1 X163.447 Y64.571 E.8745
G1 X162.667 Y64.381 E.02174
G1 X185.892 Y87.606 E.89
G1 X185.517 Y87.821 E.01171
G1 X161.888 Y64.192 E.9055
G1 X161.108 Y64.003 E.02174
G1 X185.142 Y88.036 E.92099
G1 X184.767 Y88.251 E.01171
G1 X160.329 Y63.813 E.93649
G1 X159.549 Y63.624 E.02174
G1 X184.392 Y88.466 E.95199
G1 X184.017 Y88.681 E.01171
G1 X158.77 Y63.434 E.96749
G1 X157.99 Y63.245 E.02174
G1 X183.641 Y88.896 E.98299
G1 X183.266 Y89.111 E.01171
G1 X157.211 Y63.056 E.99849
G1 X156.431 Y62.866 E.02174
G1 X182.891 Y89.326 E1.01398
G1 X182.516 Y89.541 E.01171
G1 X155.652 Y62.677 E1.02948
G1 X154.872 Y62.487 E.02174
G1 X182.141 Y89.756 E1.04498
G1 X181.766 Y89.971 E.01171
G1 X154.093 Y62.298 E1.06048
G1 X153.313 Y62.108 E.02174
G1 X181.391 Y90.186 E1.07598
G1 X181.016 Y90.401 E.01171
G1 X152.534 Y61.919 E1.09148
G1 X151.754 Y61.73 E.02174
G1 X180.641 Y90.616 E1.10697
G1 X180.266 Y90.831 E.01171
G1 X150.975 Y61.54 E1.12247
G1 X150.195 Y61.351 E.02174
G1 X179.891 Y91.047 E1.13797
G1 X179.516 Y91.262 E.01171
G1 X149.416 Y61.161 E1.15347
G1 X148.636 Y60.972 E.02174
G1 X179.141 Y91.477 E1.16897
G1 X178.766 Y91.692 E.01171
G1 X147.857 Y60.783 E1.18447
G1 X147.077 Y60.593 E.02174
G1 X178.391 Y91.907 E1.19997
G1 X178.016 Y92.122 E.01171
G1 X146.298 Y60.404 E1.21546
G1 X145.518 Y60.214 E.02174
G1 X177.64 Y92.337 E1.23096
G1 X177.265 Y92.552 E.01171
G1 X144.739 Y60.025 E1.24646
G1 X143.959 Y59.835 E.02174
G1 X176.89 Y92.767 E1.26196
G1 X176.515 Y92.982 E.01171
G1 X143.18 Y59.646 E1.27746
G1 X142.4 Y59.457 E.02174
G1 X176.14 Y93.197 E1.29296
G1 X175.765 Y93.412 E.01171
G1 X141.621 Y59.267 E1.30845
G1 X140.841 Y59.078 E.02174
G1 X175.39 Y93.627 E1.32395
G1 X175.015 Y93.842 E.01171
G1 X140.062 Y58.888 E1.33945
G1 X139.282 Y58.699 E.02174
G1 X174.64 Y94.057 E1.35495
G1 X174.265 Y94.272 E.01171
G1 X138.503 Y58.509 E1.37045
G1 X137.723 Y58.32 E.02174
G1 X173.89 Y94.487 E1.38595
G1 X173.515 Y94.702 E.01171
G1 X136.944 Y58.131 E1.40144
G1 X136.164 Y57.941 E.02174
G1 X173.14 Y94.917 E1.41694
G1 X172.765 Y95.132 E.01171
G1 X135.385 Y57.752 E1.43244
G1 X134.605 Y57.562 E.02174
G1 X172.39 Y95.347 E1.44794
G1 X172.015 Y95.562 E.01171
G1 X133.826 Y57.373 E1.46344
G1 X133.046 Y57.184 E.02174
G1 X171.639 Y95.777 E1.47894
G1 X171.264 Y95.992 E.01171
G1 X132.639 Y57.367 E1.48015
G1 X132.651 Y57.969 E.01632
G1 X170.889 Y96.207 E1.46532
G1 X170.514 Y96.422 E.01171
G1 X132.663 Y58.571 E1.45049
G1 X132.675 Y59.173 E.01632
G1 X170.139 Y96.637 E1.43565
G1 X169.764 Y96.852 E.01171
G1 X132.687 Y59.775 E1.42082
G1 X132.7 Y60.377 E.01632
G1 X169.389 Y97.067 E1.40598
G1 X169.014 Y97.282 E.01171
G1 X132.712 Y60.98 E1.39115
G1 X132.724 Y61.582 E.01632
G1 X168.639 Y97.497 E1.37631
G1 X168.264 Y97.712 E.01171
G1 X132.736 Y62.184 E1.36148
G1 X132.748 Y62.786 E.01632
G1 X167.889 Y97.927 E1.34664
G1 X167.514 Y98.142 E.01171
G1 X132.76 Y63.388 E1.33181
G1 X132.772 Y63.99 E.01632
G1 X167.139 Y98.357 E1.31698
G1 X166.764 Y98.572 E.01171
G1 X132.784 Y64.592 E1.30214
G1 X132.796 Y65.194 E.01632
G1 X166.389 Y98.787 E1.28731
G1 X166.014 Y99.002 E.01171
G1 X132.808 Y65.797 E1.27247
G1 X132.82 Y66.399 E.01632
G1 X165.638 Y99.217 E1.25764
G1 X165.263 Y99.432 E.01171
G1 X132.832 Y67.001 E1.2428
G1 X132.844 Y67.603 E.01632
G1 X164.888 Y99.647 E1.22797
G1 X164.513 Y99.862 E.01171
G1 X132.856 Y68.205 E1.21313
G1 X132.868 Y68.807 E.01632
G1 X164.138 Y100.077 E1.1983
G1 X163.763 Y100.292 E.01171
G1 X132.88 Y69.409 E1.18347
G1 X132.892 Y70.012 E.01632
G1 X163.388 Y100.507 E1.16863
G1 X163.013 Y100.722 E.01171
G1 X132.904 Y70.614 E1.1538
G1 X132.916 Y71.216 E.01632
G1 X162.638 Y100.937 E1.13896
G1 X162.263 Y101.152 E.01171
G1 X132.928 Y71.818 E1.12413
G1 X132.94 Y72.42 E.01632
G1 X161.888 Y101.367 E1.10929
G1 X161.513 Y101.582 E.01171
G1 X132.953 Y73.022 E1.09446
G1 X132.965 Y73.624 E.01632
G1 X161.138 Y101.797 E1.07962
G1 X160.763 Y102.012 E.01171
G1 X132.977 Y74.226 E1.06479
G1 X132.989 Y74.829 E.01632
G1 X160.388 Y102.227 E1.04995
G1 X160.013 Y102.442 E.01171
G1 X133.001 Y75.431 E1.03512
G1 X133.013 Y76.033 E.01632
G1 X159.637 Y102.657 E1.02029
G1 X159.262 Y102.873 E.01171
G1 X133.025 Y76.635 E1.00545
G1 X133.037 Y77.237 E.01632
G1 X158.887 Y103.088 E.99062
G1 X158.512 Y103.303 E.01171
G1 X133.049 Y77.839 E.97578
G1 X133.061 Y78.441 E.01632
G1 X158.137 Y103.518 E.96095
G1 X157.762 Y103.733 E.01171
G1 X133.073 Y79.043 E.94611
G1 X133.085 Y79.646 E.01632
G1 X157.387 Y103.948 E.93128
G1 X157.012 Y104.163 E.01171
G1 X133.097 Y80.248 E.91644
G1 X133.109 Y80.85 E.01632
G1 X156.637 Y104.378 E.90161
G1 X156.262 Y104.593 E.01171
G1 X133.121 Y81.452 E.88678
G1 X133.133 Y82.054 E.01632
G1 X155.887 Y104.808 E.87194
G1 X155.512 Y105.023 E.01171
G1 X133.145 Y82.656 E.85711
G1 X133.157 Y83.258 E.01632
G1 X155.137 Y105.238 E.84227
G1 X154.762 Y105.453 E.01171
G1 X133.169 Y83.86 E.82744
G1 X133.181 Y84.463 E.01632
G1 X154.387 Y105.668 E.8126
G1 X154.012 Y105.883 E.01171
G1 X133.193 Y85.065 E.79777
G1 X133.206 Y85.667 E.01632
G1 X153.636 Y106.098 E.78293
G1 X153.261 Y106.313 E.01171
G1 X133.218 Y86.269 E.7681
G1 X133.23 Y86.871 E.01632
G1 X152.886 Y106.528 E.75327
G1 X152.511 Y106.743 E.01171
G1 X133.242 Y87.473 E.73843
G1 X133.254 Y88.075 E.01632
G1 X152.136 Y106.958 E.7236
G1 X151.761 Y107.173 E.01171
G1 X133.266 Y88.677 E.70876
G1 X133.278 Y89.28 E.01632
G1 X151.386 Y107.388 E.69393
G1 X151.011 Y107.603 E.01171
G1 X133.29 Y89.882 E.67909
G1 X133.302 Y90.484 E.01632
G1 X150.636 Y107.818 E.66426
G1 X150.261 Y108.033 E.01171
G1 X133.314 Y91.086 E.64942
G1 X133.326 Y91.688 E.01632
G1 X149.886 Y108.248 E.63459
G1 X149.511 Y108.463 E.01171
G1 X133.338 Y92.29 E.61975
G1 X133.35 Y92.892 E.01632
G1 X149.136 Y108.678 E.60492
G1 X148.761 Y108.893 E.01171
G1 X133.362 Y93.495 E.59009
G1 X133.374 Y94.097 E.01632
G1 X148.386 Y109.108 E.57525
G1 X148.011 Y109.323 E.01171
G1 X133.386 Y94.699 E.56042
G1 X133.398 Y95.301 E.01632
G1 X147.635 Y109.538 E.54558
G1 X147.26 Y109.753 E.01171
G1 X133.41 Y95.903 E.53075
G1 X133.422 Y96.505 E.01632
G1 X146.885 Y109.968 E.51591
G1 X146.51 Y110.183 E.01171
G1 X133.434 Y97.107 E.50108
G1 X133.447 Y97.709 E.01632
G1 X146.135 Y110.398 E.48624
G1 X145.76 Y110.613 E.01171
G1 X133.459 Y98.312 E.47141
G1 X133.471 Y98.914 E.01632
G1 X144.663 Y110.106 E.42891
G1 X143.267 Y109.3 E.04368
G1 X133.483 Y99.516 E.37494
M73 P15 R58
G1 X133.495 Y100.118 E.01632
G1 X141.871 Y108.494 E.32098
G1 X140.475 Y107.688 E.04368
G1 X133.507 Y100.72 E.26702
G1 X133.519 Y101.322 E.01632
G1 X139.079 Y106.882 E.21305
G1 X137.682 Y106.076 E.04368
G1 X133.531 Y101.924 E.15909
M73 P16 R58
G1 X133.543 Y102.526 E.01632
G1 X136.286 Y105.27 E.10513
G1 X134.89 Y104.464 E.04368
G1 X133.364 Y102.938 E.05848
; OBJECT_ID: 353
; WIPE_START
G1 X134.778 Y104.352 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 325
M625
; start printing object, unique label id: 353
M624 AgAAAAAAAAA=
M204 S10000
G1 X140.652 Y109.226 Z.76 F30000
G1 X215.595 Y171.422 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X149.74 Y133.668 E2.05691
G1 X149.74 Y118.332 E.41557
G1 X215.595 Y80.578 E2.05691
G1 X215.595 Y171.362 E2.45997
M204 S10000
G1 X215.996 Y172.041 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X215.996 Y172.113 E.00183
G1 F2880
G1 X149.34 Y133.9 E1.93168
G1 X149.34 Y118.1 E.39725
G1 X215.996 Y79.887 E1.93168
G1 F3600
G1 X215.996 Y79.959 E.00183
G1 X215.996 Y171.981 E2.31354
; WIPE_START
M204 S4000
G1 X215.996 Y172.113 E-.05041
G1 X214.376 Y171.185 E-.70959
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X215.239 Y171.023 Z.76 F30000
G1 Z.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X215.239 Y81.193 E2.43414
G1 X214.821 Y81.432 E.01304
G1 X214.821 Y170.568 E2.41533
G1 X214.404 Y170.329 E.01304
G1 X214.404 Y81.671 E2.40236
G1 X213.986 Y81.911 E.01304
G1 X213.986 Y170.089 E2.38938
G1 X213.568 Y169.85 E.01304
G1 X213.568 Y82.15 E2.37641
G1 X213.151 Y82.389 E.01304
G1 X213.151 Y169.611 E2.36344
G1 X212.733 Y169.371 E.01304
G1 X212.733 Y82.629 E2.35046
G1 X212.316 Y82.868 E.01304
G1 X212.316 Y169.132 E2.33749
G1 X211.898 Y168.892 E.01304
G1 X211.898 Y83.108 E2.32452
G1 X211.481 Y83.347 E.01304
G1 X211.481 Y168.653 E2.31154
G1 X211.063 Y168.414 E.01304
G1 X211.063 Y83.586 E2.29857
G1 X210.645 Y83.826 E.01304
G1 X210.645 Y168.174 E2.2856
G1 X210.228 Y167.935 E.01304
G1 X210.228 Y84.065 E2.27262
G1 X209.81 Y84.305 E.01304
G1 X209.81 Y167.695 E2.25965
G1 X209.393 Y167.456 E.01304
G1 X209.393 Y84.544 E2.24668
G1 X208.975 Y84.783 E.01304
G1 X208.975 Y167.217 E2.2337
G1 X208.558 Y166.977 E.01304
G1 X208.558 Y85.023 E2.22073
G1 X208.14 Y85.262 E.01304
G1 X208.14 Y166.738 E2.20776
G1 X207.722 Y166.499 E.01304
G1 X207.722 Y85.501 E2.19478
G1 X207.305 Y85.741 E.01304
G1 X207.305 Y166.259 E2.18181
G1 X206.887 Y166.02 E.01304
G1 X206.887 Y85.98 E2.16884
G1 X206.47 Y86.22 E.01304
G1 X206.47 Y165.78 E2.15586
G1 X206.052 Y165.541 E.01304
G1 X206.052 Y86.459 E2.14289
G1 X205.635 Y86.698 E.01304
G1 X205.635 Y165.302 E2.12992
G1 X205.217 Y165.062 E.01304
G1 X205.217 Y86.938 E2.11694
G1 X204.799 Y87.177 E.01304
G1 X204.799 Y164.823 E2.10397
G1 X204.382 Y164.583 E.01304
G1 X204.382 Y87.417 E2.091
G1 X203.964 Y87.656 E.01304
G1 X203.964 Y164.344 E2.07802
G1 X203.547 Y164.105 E.01304
G1 X203.547 Y87.895 E2.06505
G1 X203.129 Y88.135 E.01304
G1 X203.129 Y163.865 E2.05208
G1 X202.712 Y163.626 E.01304
G1 X202.712 Y88.374 E2.0391
G1 X202.294 Y88.614 E.01304
G1 X202.294 Y163.386 E2.02613
G1 X201.876 Y163.147 E.01304
G1 X201.876 Y88.853 E2.01315
G1 X201.459 Y89.092 E.01304
G1 X201.459 Y162.908 E2.00018
G1 X201.041 Y162.668 E.01304
G1 X201.041 Y89.332 E1.98721
G1 X200.624 Y89.571 E.01304
G1 X200.624 Y162.429 E1.97423
G1 X200.206 Y162.19 E.01304
G1 X200.206 Y89.81 E1.96126
G1 X199.789 Y90.05 E.01304
G1 X199.789 Y161.95 E1.94829
G1 X199.371 Y161.711 E.01304
G1 X199.371 Y90.289 E1.93531
G1 X198.953 Y90.529 E.01304
G1 X198.953 Y161.471 E1.92234
G1 X198.536 Y161.232 E.01304
G1 X198.536 Y90.768 E1.90937
G1 X198.118 Y91.007 E.01304
G1 X198.118 Y160.993 E1.89639
G1 X197.701 Y160.753 E.01304
G1 X197.701 Y91.247 E1.88342
G1 X197.283 Y91.486 E.01304
G1 X197.283 Y160.514 E1.87045
G1 X196.866 Y160.274 E.01304
G1 X196.866 Y91.726 E1.85747
G1 X196.448 Y91.965 E.01304
G1 X196.448 Y160.035 E1.8445
G1 X196.03 Y159.796 E.01304
G1 X196.03 Y92.204 E1.83153
G1 X195.613 Y92.444 E.01304
G1 X195.613 Y159.556 E1.81855
G1 X195.195 Y159.317 E.01304
G1 X195.195 Y92.683 E1.80558
G1 X194.778 Y92.922 E.01304
G1 X194.778 Y159.078 E1.79261
G1 X194.36 Y158.838 E.01304
G1 X194.36 Y93.162 E1.77963
G1 X193.943 Y93.401 E.01304
G1 X193.943 Y158.599 E1.76666
G1 X193.525 Y158.359 E.01304
G1 X193.525 Y93.641 E1.75369
G1 X193.107 Y93.88 E.01304
G1 X193.107 Y158.12 E1.74071
G1 X192.69 Y157.881 E.01304
G1 X192.69 Y94.119 E1.72774
G1 X192.272 Y94.359 E.01304
G1 X192.272 Y157.641 E1.71477
G1 X191.855 Y157.402 E.01304
G1 X191.855 Y94.598 E1.70179
G1 X191.437 Y94.838 E.01304
G1 X191.437 Y157.162 E1.68882
G1 X191.02 Y156.923 E.01304
G1 X191.02 Y95.077 E1.67585
G1 X190.602 Y95.316 E.01304
G1 X190.602 Y156.684 E1.66287
G1 X190.184 Y156.444 E.01304
G1 X190.184 Y95.556 E1.6499
G1 X189.767 Y95.795 E.01304
G1 X189.767 Y156.205 E1.63693
G1 X189.349 Y155.965 E.01304
G1 X189.349 Y96.034 E1.62395
G1 X188.932 Y96.274 E.01304
G1 X188.932 Y155.726 E1.61098
G1 X188.514 Y155.487 E.01304
G1 X188.514 Y96.513 E1.59801
G1 X188.097 Y96.753 E.01304
G1 X188.097 Y155.247 E1.58503
G1 X187.679 Y155.008 E.01304
G1 X187.679 Y96.992 E1.57206
G1 X187.262 Y97.231 E.01304
G1 X187.262 Y154.769 E1.55909
G1 X186.844 Y154.529 E.01304
G1 X186.844 Y97.471 E1.54611
G1 X186.426 Y97.71 E.01304
G1 X186.426 Y154.29 E1.53314
G1 X186.009 Y154.05 E.01304
G1 X186.009 Y97.95 E1.52017
G1 X185.591 Y98.189 E.01304
G1 X185.591 Y153.811 E1.50719
G1 X185.174 Y153.572 E.01304
G1 X185.174 Y98.428 E1.49422
G1 X184.756 Y98.668 E.01304
G1 X184.756 Y153.332 E1.48125
G1 X184.339 Y153.093 E.01304
G1 X184.339 Y98.907 E1.46827
G1 X183.921 Y99.147 E.01304
G1 X183.921 Y152.853 E1.4553
G1 X183.503 Y152.614 E.01304
G1 X183.503 Y99.386 E1.44233
G1 X183.086 Y99.625 E.01304
G1 X183.086 Y152.375 E1.42935
G1 X182.668 Y152.135 E.01304
G1 X182.668 Y99.865 E1.41638
G1 X182.251 Y100.104 E.01304
G1 X182.251 Y151.896 E1.40341
G1 X181.833 Y151.657 E.01304
G1 X181.833 Y100.343 E1.39043
G1 X181.416 Y100.583 E.01304
G1 X181.416 Y151.417 E1.37746
G1 X180.998 Y151.178 E.01304
G1 X180.998 Y100.822 E1.36449
G1 X180.58 Y101.062 E.01304
G1 X180.58 Y150.938 E1.35151
G1 X180.163 Y150.699 E.01304
G1 X180.163 Y101.301 E1.33854
G1 X179.745 Y101.54 E.01304
G1 X179.745 Y150.46 E1.32557
G1 X179.328 Y150.22 E.01304
G1 X179.328 Y101.78 E1.31259
G1 X178.91 Y102.019 E.01304
G1 X178.91 Y149.981 E1.29962
G1 X178.493 Y149.741 E.01304
G1 X178.493 Y102.259 E1.28665
G1 X178.075 Y102.498 E.01304
G1 X178.075 Y149.502 E1.27367
G1 X177.657 Y149.263 E.01304
G1 X177.657 Y102.737 E1.2607
G1 X177.24 Y102.977 E.01304
G1 X177.24 Y149.023 E1.24773
G1 X176.822 Y148.784 E.01304
G1 X176.822 Y103.216 E1.23475
G1 X176.405 Y103.455 E.01304
G1 X176.405 Y148.545 E1.22178
G1 X175.987 Y148.305 E.01304
G1 X175.987 Y103.695 E1.20881
G1 X175.57 Y103.934 E.01304
G1 X175.57 Y148.066 E1.19583
G1 X175.152 Y147.826 E.01304
G1 X175.152 Y104.174 E1.18286
M73 P17 R58
G1 X174.734 Y104.413 E.01304
G1 X174.734 Y147.587 E1.16989
G1 X174.317 Y147.348 E.01304
G1 X174.317 Y104.652 E1.15691
G1 X173.899 Y104.892 E.01304
G1 X173.899 Y147.108 E1.14394
G1 X173.482 Y146.869 E.01304
G1 X173.482 Y105.131 E1.13097
G1 X173.064 Y105.371 E.01304
G1 X173.064 Y146.629 E1.11799
G1 X172.647 Y146.39 E.01304
G1 X172.647 Y105.61 E1.10502
G1 X172.229 Y105.849 E.01304
G1 X172.229 Y146.151 E1.09205
G1 X171.811 Y145.911 E.01304
G1 X171.811 Y106.089 E1.07907
G1 X171.394 Y106.328 E.01304
G1 X171.394 Y145.672 E1.0661
G1 X170.976 Y145.432 E.01304
G1 X170.976 Y106.568 E1.05313
G1 X170.559 Y106.807 E.01304
G1 X170.559 Y145.193 E1.04015
G1 X170.141 Y144.954 E.01304
G1 X170.141 Y107.046 E1.02718
G1 X169.724 Y107.286 E.01304
G1 X169.724 Y144.714 E1.01421
G1 X169.306 Y144.475 E.01304
G1 X169.306 Y107.525 E1.00123
G1 X168.888 Y107.764 E.01304
G1 X168.888 Y144.236 E.98826
G1 X168.471 Y143.996 E.01304
G1 X168.471 Y108.004 E.97529
G1 X168.053 Y108.243 E.01304
G1 X168.053 Y143.757 E.96231
G1 X167.636 Y143.517 E.01304
G1 X167.636 Y108.483 E.94934
G1 X167.218 Y108.722 E.01304
G1 X167.218 Y143.278 E.93637
G1 X166.801 Y143.039 E.01304
G1 X166.801 Y108.961 E.92339
G1 X166.383 Y109.201 E.01304
G1 X166.383 Y142.799 E.91042
G1 X165.965 Y142.56 E.01304
G1 X165.965 Y109.44 E.89745
G1 X165.548 Y109.68 E.01304
G1 X165.548 Y142.32 E.88447
G1 X165.13 Y142.081 E.01304
G1 X165.13 Y109.919 E.8715
G1 X164.713 Y110.158 E.01304
G1 X164.713 Y141.842 E.85853
G1 X164.295 Y141.602 E.01304
G1 X164.295 Y110.398 E.84555
G1 X163.878 Y110.637 E.01304
G1 X163.878 Y141.363 E.83258
G1 X163.46 Y141.124 E.01304
G1 X163.46 Y110.876 E.81961
G1 X163.042 Y111.116 E.01304
G1 X163.042 Y140.884 E.80663
G1 X162.625 Y140.645 E.01304
G1 X162.625 Y111.355 E.79366
G1 X162.207 Y111.595 E.01304
G1 X162.207 Y140.405 E.78069
G1 X161.79 Y140.166 E.01304
G1 X161.79 Y111.834 E.76771
G1 X161.372 Y112.073 E.01304
G1 X161.372 Y139.927 E.75474
G1 X160.955 Y139.687 E.01304
G1 X160.955 Y112.313 E.74177
G1 X160.537 Y112.552 E.01304
G1 X160.537 Y139.448 E.72879
G1 X160.119 Y139.208 E.01304
G1 X160.119 Y112.792 E.71582
G1 X159.702 Y113.031 E.01304
G1 X159.702 Y138.969 E.70285
G1 X159.284 Y138.73 E.01304
G1 X159.284 Y113.27 E.68987
G1 X158.867 Y113.51 E.01304
G1 X158.867 Y138.49 E.6769
G1 X158.449 Y138.251 E.01304
G1 X158.449 Y113.749 E.66393
G1 X158.032 Y113.989 E.01304
G1 X158.032 Y138.011 E.65095
G1 X157.614 Y137.772 E.01304
G1 X157.614 Y114.228 E.63798
G1 X157.196 Y114.467 E.01304
G1 X157.196 Y137.533 E.62501
G1 X156.779 Y137.293 E.01304
G1 X156.779 Y114.707 E.61203
G1 X156.361 Y114.946 E.01304
G1 X156.361 Y137.054 E.59906
G1 X155.944 Y136.815 E.01304
G1 X155.944 Y115.185 E.58609
G1 X155.526 Y115.425 E.01304
G1 X155.526 Y136.575 E.57311
G1 X155.109 Y136.336 E.01304
G1 X155.109 Y115.664 E.56014
G1 X154.691 Y115.904 E.01304
G1 X154.691 Y136.096 E.54716
G1 X154.273 Y135.857 E.01304
G1 X154.273 Y116.143 E.53419
G1 X153.856 Y116.382 E.01304
G1 X153.856 Y135.618 E.52122
G1 X153.438 Y135.378 E.01304
G1 X153.438 Y116.622 E.50824
G1 X153.021 Y116.861 E.01304
G1 X153.021 Y135.139 E.49527
G1 X152.603 Y134.899 E.01304
G1 X152.603 Y117.101 E.4823
G1 X152.186 Y117.34 E.01304
G1 X152.186 Y134.66 E.46932
G1 X151.768 Y134.421 E.01304
G1 X151.768 Y117.579 E.45635
G1 X151.35 Y117.819 E.01304
G1 X151.35 Y134.181 E.44338
G1 X150.933 Y133.942 E.01304
G1 X150.933 Y118.058 E.4304
G1 X150.515 Y118.297 E.01304
G1 X150.515 Y133.703 E.41743
G1 X150.098 Y133.463 E.01304
G1 X150.098 Y118.321 E.4103
; OBJECT_ID: 381
; WIPE_START
G1 X150.098 Y120.321 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 353
M625
; start printing object, unique label id: 381
M624 BAAAAAAAAAA=
M204 S10000
G1 X155.575 Y125.636 Z.76 F30000
G1 X208.38 Y176.876 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
M73 P17 R57
G1 X132.269 Y195.371 E2.12241
G1 X133.215 Y148.093 E1.28136
G1 X145.65 Y140.914 E.38907
G1 X208.328 Y176.846 E1.9577
; WIPE_START
G1 X206.385 Y177.32 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.362 Y177.05 Z.76 F30000
G1 Z.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X132.31 Y195.774 E1.99357
G1 X131.921 Y195.868 E.01006
G1 F3582.201
G1 X131.858 Y195.883 E.00164
G1 F2880
G1 X132.819 Y147.859 E1.20764
G1 X145.303 Y140.651 E.36241
G1 X145.649 Y140.451 E.01006
G1 F2700
G1 X145.674 Y140.466 E.00074
G1 F2880
G1 X209.451 Y177.028 E1.84824
G1 F3211.33
G1 X209.42 Y177.036 E.0008
; WIPE_START
M204 S4000
G1 X207.477 Y177.508 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X206.844 Y177.076 Z.76 F30000
G1 Z.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.27 Y176.65 E.01633
G1 X206.895 Y176.435 E.01171
G1 X206.319 Y177.011 E.02209
G1 X205.54 Y177.201 E.02174
G1 X206.52 Y176.22 E.03758
G1 X206.145 Y176.005 E.01171
G1 X204.76 Y177.39 E.05308
G1 X203.981 Y177.579 E.02174
G1 X205.77 Y175.79 E.06858
G1 X205.395 Y175.575 E.01171
G1 X203.201 Y177.769 E.08408
G1 X202.422 Y177.958 E.02174
G1 X205.02 Y175.36 E.09958
G1 X204.645 Y175.145 E.01171
G1 X201.642 Y178.148 E.11508
G1 X200.863 Y178.337 E.02174
G1 X204.27 Y174.93 E.13057
G1 X203.895 Y174.715 E.01171
G1 X200.083 Y178.526 E.14607
G1 X199.304 Y178.716 E.02174
G1 X203.52 Y174.5 E.16157
G1 X203.145 Y174.285 E.01171
G1 X198.524 Y178.905 E.17707
G1 X197.745 Y179.095 E.02174
G1 X202.77 Y174.07 E.19257
G1 X202.395 Y173.855 E.01171
G1 X196.965 Y179.284 E.20807
G1 X196.186 Y179.474 E.02174
G1 X202.02 Y173.64 E.22357
G1 X201.644 Y173.425 E.01171
G1 X195.406 Y179.663 E.23906
G1 X194.627 Y179.852 E.02174
G1 X201.269 Y173.21 E.25456
G1 X200.894 Y172.994 E.01171
G1 X193.847 Y180.042 E.27006
G1 X193.068 Y180.231 E.02174
G1 X200.519 Y172.779 E.28556
G1 X200.144 Y172.564 E.01171
G1 X192.288 Y180.421 E.30106
G1 X191.509 Y180.61 E.02174
G1 X199.769 Y172.349 E.31656
G1 X199.394 Y172.134 E.01171
G1 X190.729 Y180.799 E.33205
G1 X189.95 Y180.989 E.02174
G1 X199.019 Y171.919 E.34755
G1 X198.644 Y171.704 E.01171
G1 X189.17 Y181.178 E.36305
G1 X188.391 Y181.368 E.02174
G1 X198.269 Y171.489 E.37855
G1 X197.894 Y171.274 E.01171
G1 X187.611 Y181.557 E.39405
G1 X186.832 Y181.747 E.02174
G1 X197.519 Y171.059 E.40955
G1 X197.144 Y170.844 E.01171
G1 X186.052 Y181.936 E.42504
G1 X185.273 Y182.125 E.02174
G1 X196.769 Y170.629 E.44054
G1 X196.394 Y170.414 E.01171
G1 X184.493 Y182.315 E.45604
G1 X183.714 Y182.504 E.02174
G1 X196.019 Y170.199 E.47154
G1 X195.643 Y169.984 E.01171
G1 X182.934 Y182.694 E.48704
G1 X182.155 Y182.883 E.02174
G1 X195.268 Y169.769 E.50254
G1 X194.893 Y169.554 E.01171
G1 X181.375 Y183.073 E.51804
G1 X180.596 Y183.262 E.02174
G1 X194.518 Y169.339 E.53353
G1 X194.143 Y169.124 E.01171
G1 X179.816 Y183.451 E.54903
G1 X179.037 Y183.641 E.02174
G1 X193.768 Y168.909 E.56453
G1 X193.393 Y168.694 E.01171
G1 X178.257 Y183.83 E.58003
G1 X177.478 Y184.02 E.02174
G1 X193.018 Y168.479 E.59553
G1 X192.643 Y168.264 E.01171
G1 X176.698 Y184.209 E.61103
G1 X175.919 Y184.398 E.02174
G1 X192.268 Y168.049 E.62653
G1 X191.893 Y167.834 E.01171
G1 X175.139 Y184.588 E.64202
G1 X174.36 Y184.777 E.02174
G1 X191.518 Y167.619 E.65752
G1 X191.143 Y167.404 E.01171
G1 X173.58 Y184.967 E.67302
G1 X172.801 Y185.156 E.02174
G1 X190.768 Y167.189 E.68852
G1 X190.393 Y166.974 E.01171
G1 X172.021 Y185.346 E.70402
G1 X171.242 Y185.535 E.02174
G1 X190.018 Y166.759 E.71952
G1 X189.642 Y166.544 E.01171
G1 X170.462 Y185.724 E.73501
G1 X169.683 Y185.914 E.02174
G1 X189.267 Y166.329 E.75051
G1 X188.892 Y166.114 E.01171
G1 X168.903 Y186.103 E.76601
G1 X168.124 Y186.293 E.02174
G1 X188.517 Y165.899 E.78151
G1 X188.142 Y165.684 E.01171
G1 X167.344 Y186.482 E.79701
G1 X166.565 Y186.671 E.02174
G1 X187.767 Y165.469 E.81251
G1 X187.392 Y165.254 E.01171
G1 X165.785 Y186.861 E.828
G1 X165.006 Y187.05 E.02174
G1 X187.017 Y165.039 E.8435
G1 X186.642 Y164.824 E.01171
G1 X164.226 Y187.24 E.859
G1 X163.447 Y187.429 E.02174
G1 X186.267 Y164.609 E.8745
G1 X185.892 Y164.394 E.01171
G1 X162.667 Y187.619 E.89
G1 X161.888 Y187.808 E.02174
G1 X185.517 Y164.179 E.9055
G1 X185.142 Y163.964 E.01171
G1 X161.108 Y187.997 E.921
G1 X160.329 Y188.187 E.02174
G1 X184.767 Y163.749 E.93649
G1 X184.392 Y163.534 E.01171
G1 X159.549 Y188.376 E.95199
G1 X158.77 Y188.566 E.02174
G1 X184.017 Y163.319 E.96749
G1 X183.641 Y163.104 E.01171
G1 X157.99 Y188.755 E.98299
G1 X157.211 Y188.945 E.02174
G1 X183.266 Y162.889 E.99849
G1 X182.891 Y162.674 E.01171
G1 X156.431 Y189.134 E1.01399
G1 X155.652 Y189.323 E.02174
G1 X182.516 Y162.459 E1.02948
G1 X182.141 Y162.244 E.01171
G1 X154.872 Y189.513 E1.04498
G1 X154.093 Y189.702 E.02174
G1 X181.766 Y162.029 E1.06048
G1 X181.391 Y161.814 E.01171
G1 X153.313 Y189.892 E1.07598
G1 X152.534 Y190.081 E.02174
G1 X181.016 Y161.599 E1.09148
G1 X180.641 Y161.384 E.01171
G1 X151.754 Y190.27 E1.10698
G1 X150.975 Y190.46 E.02174
G1 X180.266 Y161.168 E1.12248
G1 X179.891 Y160.953 E.01171
G1 X150.195 Y190.649 E1.13797
G1 X149.416 Y190.839 E.02174
G1 X179.516 Y160.738 E1.15347
G1 X179.141 Y160.523 E.01171
G1 X148.636 Y191.028 E1.16897
G1 X147.857 Y191.218 E.02174
G1 X178.766 Y160.308 E1.18447
G1 X178.391 Y160.093 E.01171
G1 X147.077 Y191.407 E1.19997
G1 X146.298 Y191.596 E.02174
G1 X178.016 Y159.878 E1.21547
G1 X177.64 Y159.663 E.01171
G1 X145.518 Y191.786 E1.23096
G1 X144.739 Y191.975 E.02174
G1 X177.265 Y159.448 E1.24646
G1 X176.89 Y159.233 E.01171
G1 X143.959 Y192.165 E1.26196
G1 X143.18 Y192.354 E.02174
G1 X176.515 Y159.018 E1.27746
G1 X176.14 Y158.803 E.01171
G1 X142.4 Y192.543 E1.29296
G1 X141.621 Y192.733 E.02174
G1 X175.765 Y158.588 E1.30846
G1 X175.39 Y158.373 E.01171
G1 X140.841 Y192.922 E1.32396
G1 X140.062 Y193.112 E.02174
G1 X175.015 Y158.158 E1.33945
G1 X174.64 Y157.943 E.01171
G1 X139.282 Y193.301 E1.35495
G1 X138.503 Y193.491 E.02174
G1 X174.265 Y157.728 E1.37045
G1 X173.89 Y157.513 E.01171
G1 X137.723 Y193.68 E1.38595
G1 X136.944 Y193.869 E.02174
G1 X173.515 Y157.298 E1.40145
G1 X173.14 Y157.083 E.01171
G1 X136.164 Y194.059 E1.41695
G1 X135.385 Y194.248 E.02174
G1 X172.765 Y156.868 E1.43244
G1 X172.39 Y156.653 E.01171
G1 X134.605 Y194.438 E1.44794
G1 X133.826 Y194.627 E.02174
G1 X172.015 Y156.438 E1.46344
G1 X171.639 Y156.223 E.01171
G1 X133.046 Y194.817 E1.47894
G1 X132.634 Y194.917 E.0115
G1 X132.639 Y194.633 E.00768
G1 X171.264 Y156.008 E1.48015
G1 X170.889 Y155.793 E.01171
G1 X132.651 Y194.031 E1.46532
G1 X132.663 Y193.429 E.01632
G1 X170.514 Y155.578 E1.45049
G1 X170.139 Y155.363 E.01171
G1 X132.675 Y192.827 E1.43565
G1 X132.687 Y192.225 E.01632
G1 X169.764 Y155.148 E1.42082
G1 X169.389 Y154.933 E.01171
G1 X132.7 Y191.623 E1.40598
G1 X132.712 Y191.02 E.01632
G1 X169.014 Y154.718 E1.39115
G1 X168.639 Y154.503 E.01171
G1 X132.724 Y190.418 E1.37631
G1 X132.736 Y189.816 E.01632
G1 X168.264 Y154.288 E1.36148
G1 X167.889 Y154.073 E.01171
G1 X132.748 Y189.214 E1.34664
G1 X132.76 Y188.612 E.01632
G1 X167.514 Y153.858 E1.33181
G1 X167.139 Y153.643 E.01171
G1 X132.772 Y188.01 E1.31698
G1 X132.784 Y187.408 E.01632
M73 P18 R57
G1 X166.764 Y153.428 E1.30214
G1 X166.389 Y153.213 E.01171
G1 X132.796 Y186.806 E1.28731
G1 X132.808 Y186.203 E.01632
G1 X166.014 Y152.998 E1.27247
G1 X165.638 Y152.783 E.01171
G1 X132.82 Y185.601 E1.25764
G1 X132.832 Y184.999 E.01632
G1 X165.263 Y152.568 E1.2428
G1 X164.888 Y152.353 E.01171
G1 X132.844 Y184.397 E1.22797
G1 X132.856 Y183.795 E.01632
G1 X164.513 Y152.138 E1.21313
G1 X164.138 Y151.923 E.01171
G1 X132.868 Y183.193 E1.1983
G1 X132.88 Y182.591 E.01632
G1 X163.763 Y151.708 E1.18347
G1 X163.388 Y151.493 E.01171
G1 X132.892 Y181.988 E1.16863
G1 X132.904 Y181.386 E.01632
G1 X163.013 Y151.278 E1.1538
G1 X162.638 Y151.063 E.01171
G1 X132.916 Y180.784 E1.13896
G1 X132.928 Y180.182 E.01632
G1 X162.263 Y150.848 E1.12413
G1 X161.888 Y150.633 E.01171
G1 X132.94 Y179.58 E1.10929
G1 X132.953 Y178.978 E.01632
G1 X161.513 Y150.418 E1.09446
G1 X161.138 Y150.203 E.01171
G1 X132.965 Y178.376 E1.07962
G1 X132.977 Y177.774 E.01632
G1 X160.763 Y149.988 E1.06479
G1 X160.388 Y149.773 E.01171
G1 X132.989 Y177.171 E1.04995
G1 X133.001 Y176.569 E.01632
G1 X160.013 Y149.558 E1.03512
G1 X159.637 Y149.343 E.01171
G1 X133.013 Y175.967 E1.02029
G1 X133.025 Y175.365 E.01632
G1 X159.262 Y149.127 E1.00545
G1 X158.887 Y148.912 E.01171
G1 X133.037 Y174.763 E.99062
G1 X133.049 Y174.161 E.01632
G1 X158.512 Y148.697 E.97578
G1 X158.137 Y148.482 E.01171
G1 X133.061 Y173.559 E.96095
G1 X133.073 Y172.957 E.01632
G1 X157.762 Y148.267 E.94611
G1 X157.387 Y148.052 E.01171
G1 X133.085 Y172.354 E.93128
G1 X133.097 Y171.752 E.01632
G1 X157.012 Y147.837 E.91644
G1 X156.637 Y147.622 E.01171
G1 X133.109 Y171.15 E.90161
G1 X133.121 Y170.548 E.01632
G1 X156.262 Y147.407 E.88678
G1 X155.887 Y147.192 E.01171
G1 X133.133 Y169.946 E.87194
G1 X133.145 Y169.344 E.01632
G1 X155.512 Y146.977 E.85711
G1 X155.137 Y146.762 E.01171
G1 X133.157 Y168.742 E.84227
G1 X133.169 Y168.14 E.01632
G1 X154.762 Y146.547 E.82744
G1 X154.387 Y146.332 E.01171
G1 X133.181 Y167.537 E.8126
G1 X133.193 Y166.935 E.01632
G1 X154.012 Y146.117 E.79777
G1 X153.636 Y145.902 E.01171
G1 X133.206 Y166.333 E.78293
G1 X133.218 Y165.731 E.01632
G1 X153.261 Y145.687 E.7681
G1 X152.886 Y145.472 E.01171
G1 X133.23 Y165.129 E.75327
G1 X133.242 Y164.527 E.01632
G1 X152.511 Y145.257 E.73843
G1 X152.136 Y145.042 E.01171
G1 X133.254 Y163.925 E.7236
G1 X133.266 Y163.323 E.01632
G1 X151.761 Y144.827 E.70876
G1 X151.386 Y144.612 E.01171
G1 X133.278 Y162.72 E.69393
G1 X133.29 Y162.118 E.01632
G1 X151.011 Y144.397 E.67909
G1 X150.636 Y144.182 E.01171
G1 X133.302 Y161.516 E.66426
G1 X133.314 Y160.914 E.01632
G1 X150.261 Y143.967 E.64942
G1 X149.886 Y143.752 E.01171
G1 X133.326 Y160.312 E.63459
G1 X133.338 Y159.71 E.01632
G1 X149.511 Y143.537 E.61976
G1 X149.136 Y143.322 E.01171
G1 X133.35 Y159.108 E.60492
G1 X133.362 Y158.505 E.01632
G1 X148.761 Y143.107 E.59009
G1 X148.386 Y142.892 E.01171
G1 X133.374 Y157.903 E.57525
G1 X133.386 Y157.301 E.01632
G1 X148.011 Y142.677 E.56042
G1 X147.635 Y142.462 E.01171
G1 X133.398 Y156.699 E.54558
G1 X133.41 Y156.097 E.01632
G1 X147.26 Y142.247 E.53075
G1 X146.885 Y142.032 E.01171
G1 X133.422 Y155.495 E.51591
G1 X133.434 Y154.893 E.01632
G1 X146.51 Y141.817 E.50108
G1 X146.135 Y141.602 E.01171
G1 X133.447 Y154.291 E.48624
G1 X133.459 Y153.688 E.01632
G1 X145.76 Y141.387 E.47141
G1 X145.65 Y141.324 E.00343
G1 X144.663 Y141.894 E.03089
G1 X133.471 Y153.086 E.42891
G1 X133.483 Y152.484 E.01632
G1 X143.267 Y142.7 E.37495
G1 X141.871 Y143.506 E.04368
G1 X133.495 Y151.882 E.32098
G1 X133.507 Y151.28 E.01632
G1 X140.475 Y144.312 E.26702
G1 X139.079 Y145.118 E.04368
G1 X133.519 Y150.678 E.21305
G1 X133.531 Y150.076 E.01632
G1 X137.682 Y145.924 E.15909
G1 X136.286 Y146.73 E.04368
G1 X133.543 Y149.474 E.10513
G1 X133.555 Y148.871 E.01632
G1 X135.401 Y147.025 E.07075
; OBJECT_ID: 409
; WIPE_START
G1 X133.987 Y148.439 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 381
M625
; start printing object, unique label id: 409
M624 CAAAAAAAAAA=
M204 S10000
G1 X126.737 Y150.826 Z.76 F30000
G1 X47.62 Y176.876 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X110.35 Y140.914 E1.95933
G1 X122.785 Y148.093 E.38907
G1 X123.731 Y195.371 E1.28136
G1 X47.678 Y176.89 E2.12078
; WIPE_START
G1 X49.413 Y175.895 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.638 Y177.05 Z.76 F30000
G1 Z.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X46.549 Y177.028 E.0023
G1 F2880
G1 X110.004 Y140.65 E1.83892
G1 X110.351 Y140.451 E.01006
G1 F2700
G1 X110.376 Y140.466 E.00074
G1 F2880
G1 X123.181 Y147.859 E.37173
G1 X124.142 Y195.883 E1.20764
G1 F3582.311
G1 X124.079 Y195.868 E.00164
G1 F3600
G1 X123.69 Y195.774 E.01006
G1 X46.696 Y177.064 E1.99206
; WIPE_START
M204 S4000
G1 X46.549 Y177.028 E-.05762
G1 X48.152 Y176.109 E-.70238
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.593 Y176.512 Z.76 F30000
G1 Z.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.903 Y176.822 E.01187
G1 X49.682 Y177.011 E.02174
G1 X49.105 Y176.434 E.02211
G1 X49.48 Y176.219 E.01171
G1 X50.462 Y177.201 E.03761
G1 X51.241 Y177.39 E.02174
G1 X49.855 Y176.004 E.05311
G1 X50.231 Y175.789 E.01171
G1 X52.021 Y177.58 E.06861
G1 X52.8 Y177.769 E.02174
G1 X50.606 Y175.574 E.08411
G1 X50.981 Y175.359 E.01171
G1 X53.58 Y177.959 E.09961
G1 X54.359 Y178.148 E.02174
G1 X51.356 Y175.144 E.1151
G1 X51.731 Y174.929 E.01171
G1 X55.139 Y178.337 E.1306
G1 X55.918 Y178.527 E.02174
G1 X52.106 Y174.714 E.1461
G1 X52.481 Y174.499 E.01171
G1 X56.698 Y178.716 E.1616
G1 X57.477 Y178.906 E.02174
G1 X52.856 Y174.284 E.1771
G1 X53.231 Y174.069 E.01171
G1 X58.257 Y179.095 E.1926
G1 X59.036 Y179.284 E.02174
G1 X53.606 Y173.854 E.2081
G1 X53.981 Y173.639 E.01171
G1 X59.816 Y179.474 E.22359
G1 X60.595 Y179.663 E.02174
G1 X54.356 Y173.424 E.23909
G1 X54.731 Y173.209 E.01171
G1 X61.375 Y179.853 E.25459
G1 X62.154 Y180.042 E.02174
G1 X55.106 Y172.994 E.27009
G1 X55.481 Y172.779 E.01171
G1 X62.934 Y180.232 E.28559
G1 X63.713 Y180.421 E.02174
G1 X55.856 Y172.564 E.30109
G1 X56.232 Y172.349 E.01171
G1 X64.493 Y180.61 E.31658
G1 X65.272 Y180.8 E.02174
G1 X56.607 Y172.134 E.33208
G1 X56.982 Y171.919 E.01171
G1 X66.052 Y180.989 E.34758
G1 X66.831 Y181.179 E.02174
G1 X57.357 Y171.704 E.36308
G1 X57.732 Y171.489 E.01171
G1 X67.611 Y181.368 E.37858
G1 X68.39 Y181.557 E.02174
G1 X58.107 Y171.274 E.39408
G1 X58.482 Y171.059 E.01171
G1 X69.17 Y181.747 E.40957
G1 X69.949 Y181.936 E.02174
G1 X58.857 Y170.844 E.42507
G1 X59.232 Y170.629 E.01171
G1 X70.729 Y182.126 E.44057
G1 X71.508 Y182.315 E.02174
G1 X59.607 Y170.414 E.45607
G1 X59.982 Y170.199 E.01171
G1 X72.288 Y182.505 E.47157
G1 X73.067 Y182.694 E.02174
G1 X60.357 Y169.984 E.48707
G1 X60.732 Y169.769 E.01171
G1 X73.847 Y182.883 E.50257
G1 X74.626 Y183.073 E.02174
G1 X61.107 Y169.554 E.51806
G1 X61.482 Y169.339 E.01171
G1 X75.406 Y183.262 E.53356
G1 X76.185 Y183.452 E.02174
G1 X61.857 Y169.124 E.54906
G1 X62.233 Y168.909 E.01171
G1 X76.965 Y183.641 E.56456
G1 X77.744 Y183.831 E.02174
G1 X62.608 Y168.694 E.58006
G1 X62.983 Y168.479 E.01171
G1 X78.524 Y184.02 E.59556
G1 X79.303 Y184.209 E.02174
G1 X63.358 Y168.264 E.61105
G1 X63.733 Y168.049 E.01171
G1 X80.083 Y184.399 E.62655
G1 X80.862 Y184.588 E.02174
G1 X64.108 Y167.834 E.64205
G1 X64.483 Y167.619 E.01171
G1 X81.642 Y184.778 E.65755
G1 X82.421 Y184.967 E.02174
G1 X64.858 Y167.404 E.67305
G1 X65.233 Y167.189 E.01171
G1 X83.201 Y185.156 E.68855
G1 X83.98 Y185.346 E.02174
G1 X65.608 Y166.974 E.70404
G1 X65.983 Y166.759 E.01171
G1 X84.76 Y185.535 E.71954
G1 X85.539 Y185.725 E.02174
G1 X66.358 Y166.544 E.73504
G1 X66.733 Y166.329 E.01171
G1 X86.319 Y185.914 E.75054
G1 X87.098 Y186.104 E.02174
G1 X67.108 Y166.114 E.76604
G1 X67.483 Y165.898 E.01171
G1 X87.878 Y186.293 E.78154
G1 X88.657 Y186.482 E.02174
G1 X67.858 Y165.683 E.79703
G1 X68.234 Y165.468 E.01171
G1 X89.437 Y186.672 E.81253
G1 X90.216 Y186.861 E.02174
G1 X68.609 Y165.253 E.82803
G1 X68.984 Y165.038 E.01171
G1 X90.996 Y187.051 E.84353
G1 X91.775 Y187.24 E.02174
G1 X69.359 Y164.823 E.85903
G1 X69.734 Y164.608 E.01171
G1 X92.555 Y187.429 E.87453
G1 X93.334 Y187.619 E.02174
G1 X70.109 Y164.393 E.89003
G1 X70.484 Y164.178 E.01171
G1 X94.114 Y187.808 E.90552
G1 X94.893 Y187.998 E.02174
G1 X70.859 Y163.963 E.92102
G1 X71.234 Y163.748 E.01171
G1 X95.673 Y188.187 E.93652
G1 X96.452 Y188.377 E.02174
G1 X71.609 Y163.533 E.95202
G1 X71.984 Y163.318 E.01171
G1 X97.232 Y188.566 E.96752
G1 X98.011 Y188.755 E.02174
G1 X72.359 Y163.103 E.98302
G1 X72.734 Y162.888 E.01171
G1 X98.791 Y188.945 E.99851
G1 X99.57 Y189.134 E.02174
G1 X73.109 Y162.673 E1.01401
G1 X73.484 Y162.458 E.01171
G1 X100.35 Y189.324 E1.02951
G1 X101.129 Y189.513 E.02174
G1 X73.859 Y162.243 E1.04501
G1 X74.235 Y162.028 E.01171
G1 X101.909 Y189.702 E1.06051
G1 X102.688 Y189.892 E.02174
G1 X74.61 Y161.813 E1.07601
G1 X74.985 Y161.598 E.01171
G1 X103.468 Y190.081 E1.0915
G1 X104.247 Y190.271 E.02174
G1 X75.36 Y161.383 E1.107
G1 X75.735 Y161.168 E.01171
G1 X105.027 Y190.46 E1.1225
G1 X105.806 Y190.65 E.02174
G1 X76.11 Y160.953 E1.138
G1 X76.485 Y160.738 E.01171
G1 X106.586 Y190.839 E1.1535
G1 X107.365 Y191.028 E.02174
G1 X76.86 Y160.523 E1.169
M73 P18 R56
G1 X77.235 Y160.308 E.01171
G1 X108.145 Y191.218 E1.1845
G1 X108.924 Y191.407 E.02174
G1 X77.61 Y160.093 E1.19999
G1 X77.985 Y159.878 E.01171
G1 X109.704 Y191.597 E1.21549
G1 X110.483 Y191.786 E.02174
G1 X78.36 Y159.663 E1.23099
G1 X78.735 Y159.448 E.01171
G1 X111.263 Y191.975 E1.24649
G1 X112.042 Y192.165 E.02174
G1 X79.11 Y159.233 E1.26199
G1 X79.485 Y159.018 E.01171
G1 X112.822 Y192.354 E1.27749
G1 X113.601 Y192.544 E.02174
G1 X79.86 Y158.803 E1.29298
G1 X80.236 Y158.588 E.01171
G1 X114.381 Y192.733 E1.30848
G1 X115.16 Y192.923 E.02174
G1 X80.611 Y158.373 E1.32398
G1 X80.986 Y158.158 E.01171
G1 X115.94 Y193.112 E1.33948
G1 X116.719 Y193.301 E.02174
G1 X81.361 Y157.943 E1.35498
G1 X81.736 Y157.728 E.01171
G1 X117.499 Y193.491 E1.37048
G1 X118.278 Y193.68 E.02174
G1 X82.111 Y157.513 E1.38597
G1 X82.486 Y157.298 E.01171
G1 X119.058 Y193.87 E1.40147
G1 X119.837 Y194.059 E.02174
G1 X82.861 Y157.083 E1.41697
G1 X83.236 Y156.868 E.01171
G1 X120.617 Y194.249 E1.43247
G1 X121.396 Y194.438 E.02174
G1 X83.611 Y156.653 E1.44797
G1 X83.986 Y156.438 E.01171
G1 X122.176 Y194.627 E1.46347
G1 X122.955 Y194.817 E.02174
G1 X84.361 Y156.223 E1.47897
G1 X84.736 Y156.008 E.01171
G1 X123.361 Y194.632 E1.48013
G1 X123.349 Y194.03 E.01632
G1 X85.111 Y155.793 E1.46529
G1 X85.486 Y155.578 E.01171
G1 X123.337 Y193.428 E1.45046
G1 X123.325 Y192.826 E.01632
G1 X85.861 Y155.363 E1.43562
G1 X86.237 Y155.148 E.01171
G1 X123.313 Y192.224 E1.42079
G1 X123.3 Y191.621 E.01632
G1 X86.612 Y154.933 E1.40595
G1 X86.987 Y154.718 E.01171
G1 X123.288 Y191.019 E1.39112
G1 X123.276 Y190.417 E.01632
G1 X87.362 Y154.503 E1.37629
G1 X87.737 Y154.288 E.01171
G1 X123.264 Y189.815 E1.36145
M73 P19 R56
G1 X123.252 Y189.213 E.01632
G1 X88.112 Y154.072 E1.34662
G1 X88.487 Y153.857 E.01171
G1 X123.24 Y188.611 E1.33178
G1 X123.228 Y188.009 E.01632
G1 X88.862 Y153.642 E1.31695
G1 X89.237 Y153.427 E.01171
G1 X123.216 Y187.407 E1.30211
G1 X123.204 Y186.804 E.01632
G1 X89.612 Y153.212 E1.28728
G1 X89.987 Y152.997 E.01171
G1 X123.192 Y186.202 E1.27244
G1 X123.18 Y185.6 E.01632
G1 X90.362 Y152.782 E1.25761
G1 X90.737 Y152.567 E.01171
G1 X123.168 Y184.998 E1.24278
G1 X123.156 Y184.396 E.01632
G1 X91.112 Y152.352 E1.22794
G1 X91.487 Y152.137 E.01171
G1 X123.144 Y183.794 E1.21311
G1 X123.132 Y183.192 E.01632
G1 X91.862 Y151.922 E1.19827
G1 X92.238 Y151.707 E.01171
G1 X123.12 Y182.589 E1.18344
G1 X123.108 Y181.987 E.01632
G1 X92.613 Y151.492 E1.1686
G1 X92.988 Y151.277 E.01171
G1 X123.096 Y181.385 E1.15377
G1 X123.084 Y180.783 E.01632
G1 X93.363 Y151.062 E1.13893
G1 X93.738 Y150.847 E.01171
G1 X123.072 Y180.181 E1.1241
G1 X123.059 Y179.579 E.01632
G1 X94.113 Y150.632 E1.10927
G1 X94.488 Y150.417 E.01171
G1 X123.047 Y178.977 E1.09443
G1 X123.035 Y178.375 E.01632
G1 X94.863 Y150.202 E1.0796
G1 X95.238 Y149.987 E.01171
G1 X123.023 Y177.772 E1.06476
G1 X123.011 Y177.17 E.01632
G1 X95.613 Y149.772 E1.04993
G1 X95.988 Y149.557 E.01171
G1 X122.999 Y176.568 E1.03509
G1 X122.987 Y175.966 E.01632
G1 X96.363 Y149.342 E1.02026
G1 X96.738 Y149.127 E.01171
G1 X122.975 Y175.364 E1.00542
G1 X122.963 Y174.762 E.01632
G1 X97.113 Y148.912 E.99059
G1 X97.488 Y148.697 E.01171
G1 X122.951 Y174.16 E.97575
G1 X122.939 Y173.558 E.01632
G1 X97.863 Y148.482 E.96092
G1 X98.239 Y148.267 E.01171
G1 X122.927 Y172.955 E.94609
G1 X122.915 Y172.353 E.01632
G1 X98.614 Y148.052 E.93125
G1 X98.989 Y147.837 E.01171
G1 X122.903 Y171.751 E.91642
G1 X122.891 Y171.149 E.01632
G1 X99.364 Y147.622 E.90158
G1 X99.739 Y147.407 E.01171
G1 X122.879 Y170.547 E.88675
G1 X122.867 Y169.945 E.01632
G1 X100.114 Y147.192 E.87191
G1 X100.489 Y146.977 E.01171
G1 X122.855 Y169.343 E.85708
G1 X122.843 Y168.741 E.01632
G1 X100.864 Y146.762 E.84224
G1 X101.239 Y146.547 E.01171
G1 X122.831 Y168.138 E.82741
G1 X122.819 Y167.536 E.01632
G1 X101.614 Y146.332 E.81258
G1 X101.989 Y146.117 E.01171
G1 X122.806 Y166.934 E.79774
G1 X122.794 Y166.332 E.01632
G1 X102.364 Y145.902 E.78291
G1 X102.739 Y145.687 E.01171
G1 X122.782 Y165.73 E.76807
G1 X122.77 Y165.128 E.01632
G1 X103.114 Y145.472 E.75324
G1 X103.489 Y145.257 E.01171
G1 X122.758 Y164.526 E.7384
G1 X122.746 Y163.924 E.01632
G1 X103.864 Y145.042 E.72357
G1 X104.24 Y144.827 E.01171
G1 X122.734 Y163.321 E.70873
G1 X122.722 Y162.719 E.01632
G1 X104.615 Y144.612 E.6939
G1 X104.99 Y144.397 E.01171
G1 X122.71 Y162.117 E.67907
G1 X122.698 Y161.515 E.01632
G1 X105.365 Y144.182 E.66423
G1 X105.74 Y143.967 E.01171
G1 X122.686 Y160.913 E.6494
G1 X122.674 Y160.311 E.01632
G1 X106.115 Y143.752 E.63456
G1 X106.49 Y143.537 E.01171
G1 X122.662 Y159.709 E.61973
G1 X122.65 Y159.106 E.01632
G1 X106.865 Y143.322 E.60489
G1 X107.24 Y143.107 E.01171
G1 X122.638 Y158.504 E.59006
G1 X122.626 Y157.902 E.01632
G1 X107.615 Y142.892 E.57522
G1 X107.99 Y142.677 E.01171
G1 X122.614 Y157.3 E.56039
G1 X122.602 Y156.698 E.01632
G1 X108.365 Y142.462 E.54555
G1 X108.74 Y142.247 E.01171
G1 X122.59 Y156.096 E.53072
G1 X122.578 Y155.494 E.01632
G1 X109.115 Y142.031 E.51589
G1 X109.49 Y141.816 E.01171
G1 X122.566 Y154.892 E.50105
G1 X122.553 Y154.289 E.01632
G1 X109.865 Y141.601 E.48622
G1 X110.241 Y141.386 E.01171
G1 X122.541 Y153.687 E.47138
G1 X122.529 Y153.085 E.01632
G1 X111.339 Y141.895 E.42881
G1 X112.736 Y142.701 E.04368
G1 X122.517 Y152.483 E.37485
G1 X122.505 Y151.881 E.01632
G1 X114.132 Y143.507 E.32088
G1 X115.528 Y144.313 E.04368
G1 X122.493 Y151.279 E.26692
G1 X122.481 Y150.677 E.01632
G1 X116.924 Y145.12 E.21295
G1 X118.32 Y145.926 E.04368
G1 X122.469 Y150.075 E.15899
G1 X122.457 Y149.472 E.01632
G1 X119.716 Y146.732 E.10503
G1 X121.113 Y147.538 E.04368
G1 X122.636 Y149.061 E.05838
; OBJECT_ID: 437
; WIPE_START
G1 X121.222 Y147.647 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 409
M625
; start printing object, unique label id: 437
M624 EAAAAAAAAAA=
M204 S10000
G1 X115.785 Y142.29 Z.76 F30000
G1 X47.62 Y75.124 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X123.731 Y56.629 E2.12241
G1 X122.785 Y103.907 E1.28136
G1 X110.35 Y111.086 E.38907
G1 X47.672 Y75.154 E1.9577
; WIPE_START
G1 X49.615 Y74.68 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.638 Y74.95 Z.76 F30000
G1 Z.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X123.69 Y56.226 E1.99357
G1 X124.079 Y56.132 E.01006
G1 F3582.201
G1 X124.142 Y56.117 E.00164
G1 F2880
G1 X123.181 Y104.141 E1.20764
G1 X110.351 Y111.549 E.37247
G1 X46.549 Y74.972 E1.84897
G1 F3210.652
G1 X46.58 Y74.964 E.00079
; WIPE_START
M204 S4000
G1 X48.523 Y74.492 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X49.157 Y74.924 Z.76 F30000
G1 Z.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.73 Y75.351 E.01636
G1 X49.105 Y75.566 E.01171
G1 X49.682 Y74.989 E.02211
G1 X50.462 Y74.799 E.02174
G1 X49.48 Y75.781 E.03761
G1 X49.855 Y75.996 E.01171
G1 X51.241 Y74.61 E.05311
G1 X52.021 Y74.42 E.02174
G1 X50.231 Y76.211 E.06861
G1 X50.606 Y76.426 E.01171
G1 X52.8 Y74.231 E.08411
G1 X53.58 Y74.041 E.02174
G1 X50.981 Y76.641 E.09961
G1 X51.356 Y76.856 E.01171
G1 X54.359 Y73.852 E.1151
G1 X55.139 Y73.663 E.02174
G1 X51.731 Y77.071 E.1306
G1 X52.106 Y77.286 E.01171
G1 X55.918 Y73.473 E.1461
G1 X56.698 Y73.284 E.02174
G1 X52.481 Y77.501 E.1616
G1 X52.856 Y77.716 E.01171
G1 X57.477 Y73.094 E.1771
G1 X58.257 Y72.905 E.02174
G1 X53.231 Y77.931 E.1926
G1 X53.606 Y78.146 E.01171
G1 X59.036 Y72.716 E.20809
G1 X59.816 Y72.526 E.02174
G1 X53.981 Y78.361 E.22359
G1 X54.356 Y78.576 E.01171
G1 X60.595 Y72.337 E.23909
G1 X61.375 Y72.147 E.02174
G1 X54.731 Y78.791 E.25459
G1 X55.106 Y79.006 E.01171
G1 X62.154 Y71.958 E.27009
G1 X62.934 Y71.768 E.02174
G1 X55.481 Y79.221 E.28559
G1 X55.856 Y79.436 E.01171
G1 X63.713 Y71.579 E.30108
G1 X64.493 Y71.39 E.02174
G1 X56.232 Y79.651 E.31658
G1 X56.607 Y79.866 E.01171
G1 X65.272 Y71.2 E.33208
G1 X66.052 Y71.011 E.02174
G1 X56.982 Y80.081 E.34758
G1 X57.357 Y80.296 E.01171
G1 X66.831 Y70.821 E.36308
G1 X67.611 Y70.632 E.02174
G1 X57.732 Y80.511 E.37858
G1 X58.107 Y80.726 E.01171
G1 X68.39 Y70.443 E.39408
G1 X69.17 Y70.253 E.02174
G1 X58.482 Y80.941 E.40957
G1 X58.857 Y81.156 E.01171
G1 X69.949 Y70.064 E.42507
G1 X70.729 Y69.874 E.02174
G1 X59.232 Y81.371 E.44057
G1 X59.607 Y81.586 E.01171
G1 X71.508 Y69.685 E.45607
G1 X72.288 Y69.495 E.02174
G1 X59.982 Y81.801 E.47157
G1 X60.357 Y82.016 E.01171
G1 X73.067 Y69.306 E.48707
G1 X73.847 Y69.117 E.02174
G1 X60.732 Y82.231 E.50256
G1 X61.107 Y82.446 E.01171
G1 X74.626 Y68.927 E.51806
G1 X75.406 Y68.738 E.02174
G1 X61.482 Y82.661 E.53356
G1 X61.857 Y82.876 E.01171
G1 X76.185 Y68.548 E.54906
G1 X76.965 Y68.359 E.02174
G1 X62.233 Y83.091 E.56456
G1 X62.608 Y83.306 E.01171
G1 X77.744 Y68.169 E.58006
G1 X78.524 Y67.98 E.02174
G1 X62.983 Y83.521 E.59556
G1 X63.358 Y83.736 E.01171
G1 X79.303 Y67.791 E.61105
G1 X80.083 Y67.601 E.02174
G1 X63.733 Y83.951 E.62655
G1 X64.108 Y84.166 E.01171
G1 X80.862 Y67.412 E.64205
G1 X81.642 Y67.222 E.02174
G1 X64.483 Y84.381 E.65755
G1 X64.858 Y84.596 E.01171
G1 X82.421 Y67.033 E.67305
G1 X83.201 Y66.844 E.02174
G1 X65.233 Y84.811 E.68855
G1 X65.608 Y85.026 E.01171
G1 X83.98 Y66.654 E.70404
G1 X84.76 Y66.465 E.02174
G1 X65.983 Y85.241 E.71954
G1 X66.358 Y85.456 E.01171
G1 X85.539 Y66.275 E.73504
G1 X86.319 Y66.086 E.02174
G1 X66.733 Y85.671 E.75054
G1 X67.108 Y85.886 E.01171
G1 X87.098 Y65.896 E.76604
G1 X87.878 Y65.707 E.02174
G1 X67.483 Y86.101 E.78154
G1 X67.858 Y86.317 E.01171
G1 X88.657 Y65.518 E.79703
G1 X89.437 Y65.328 E.02174
G1 X68.234 Y86.532 E.81253
G1 X68.609 Y86.747 E.01171
G1 X90.216 Y65.139 E.82803
G1 X90.996 Y64.949 E.02174
G1 X68.984 Y86.962 E.84353
G1 X69.359 Y87.177 E.01171
G1 X91.775 Y64.76 E.85903
G1 X92.555 Y64.571 E.02174
G1 X69.734 Y87.392 E.87453
G1 X70.109 Y87.607 E.01171
G1 X93.334 Y64.381 E.89003
G1 X94.114 Y64.192 E.02174
G1 X70.484 Y87.822 E.90552
G1 X70.859 Y88.037 E.01171
G1 X94.893 Y64.002 E.92102
G1 X95.673 Y63.813 E.02174
G1 X71.234 Y88.252 E.93652
G1 X71.609 Y88.467 E.01171
G1 X96.452 Y63.623 E.95202
G1 X97.232 Y63.434 E.02174
G1 X71.984 Y88.682 E.96752
G1 X72.359 Y88.897 E.01171
G1 X98.011 Y63.245 E.98302
G1 X98.791 Y63.055 E.02174
G1 X72.734 Y89.112 E.99851
G1 X73.109 Y89.327 E.01171
G1 X99.57 Y62.866 E1.01401
G1 X100.35 Y62.676 E.02174
G1 X73.484 Y89.542 E1.02951
G1 X73.859 Y89.757 E.01171
G1 X101.129 Y62.487 E1.04501
G1 X101.909 Y62.298 E.02174
G1 X74.235 Y89.972 E1.06051
G1 X74.61 Y90.187 E.01171
G1 X102.688 Y62.108 E1.07601
G1 X103.468 Y61.919 E.02174
G1 X74.985 Y90.402 E1.0915
G1 X75.36 Y90.617 E.01171
G1 X104.247 Y61.729 E1.107
G1 X105.027 Y61.54 E.02174
G1 X75.735 Y90.832 E1.1225
G1 X76.11 Y91.047 E.01171
G1 X105.806 Y61.35 E1.138
G1 X106.586 Y61.161 E.02174
G1 X76.485 Y91.262 E1.1535
G1 X76.86 Y91.477 E.01171
G1 X107.365 Y60.972 E1.169
G1 X108.145 Y60.782 E.02174
G1 X77.235 Y91.692 E1.1845
G1 X77.61 Y91.907 E.01171
G1 X108.924 Y60.593 E1.19999
G1 X109.704 Y60.403 E.02174
G1 X77.985 Y92.122 E1.21549
G1 X78.36 Y92.337 E.01171
G1 X110.483 Y60.214 E1.23099
G1 X111.263 Y60.024 E.02174
G1 X78.735 Y92.552 E1.24649
G1 X79.11 Y92.767 E.01171
G1 X112.042 Y59.835 E1.26199
G1 X112.822 Y59.646 E.02174
G1 X79.485 Y92.982 E1.27749
G1 X79.86 Y93.197 E.01171
G1 X113.601 Y59.456 E1.29298
G1 X114.381 Y59.267 E.02174
G1 X80.236 Y93.412 E1.30848
G1 X80.611 Y93.627 E.01171
G1 X115.16 Y59.077 E1.32398
G1 X115.94 Y58.888 E.02174
G1 X80.986 Y93.842 E1.33948
G1 X81.361 Y94.057 E.01171
G1 X116.719 Y58.699 E1.35498
G1 X117.499 Y58.509 E.02174
G1 X81.736 Y94.272 E1.37048
G1 X82.111 Y94.487 E.01171
G1 X118.278 Y58.32 E1.38598
G1 X119.058 Y58.13 E.02174
G1 X82.486 Y94.702 E1.40147
G1 X82.861 Y94.917 E.01171
G1 X119.837 Y57.941 E1.41697
G1 X120.617 Y57.751 E.02174
G1 X83.236 Y95.132 E1.43247
G1 X83.611 Y95.347 E.01171
G1 X121.396 Y57.562 E1.44797
G1 X122.176 Y57.373 E.02174
G1 X83.986 Y95.562 E1.46347
G1 X84.361 Y95.777 E.01171
G1 X122.955 Y57.183 E1.47897
G1 X123.366 Y57.083 E.01146
G1 X123.361 Y57.368 E.00771
G1 X84.736 Y95.992 E1.48013
G1 X85.111 Y96.207 E.01171
G1 X123.349 Y57.97 E1.46529
G1 X123.337 Y58.572 E.01632
G1 X85.486 Y96.422 E1.45046
G1 X85.861 Y96.637 E.01171
G1 X123.325 Y59.174 E1.43562
G1 X123.312 Y59.776 E.01632
M73 P20 R56
G1 X86.237 Y96.852 E1.42079
G1 X86.612 Y97.067 E.01171
G1 X123.3 Y60.379 E1.40595
G1 X123.288 Y60.981 E.01632
G1 X86.987 Y97.282 E1.39112
G1 X87.362 Y97.497 E.01171
G1 X123.276 Y61.583 E1.37629
G1 X123.264 Y62.185 E.01632
G1 X87.737 Y97.712 E1.36145
G1 X88.112 Y97.927 E.01171
G1 X123.252 Y62.787 E1.34662
G1 X123.24 Y63.389 E.01632
G1 X88.487 Y98.143 E1.33178
G1 X88.862 Y98.358 E.01171
G1 X123.228 Y63.991 E1.31695
G1 X123.216 Y64.593 E.01632
G1 X89.237 Y98.573 E1.30211
G1 X89.612 Y98.788 E.01171
G1 X123.204 Y65.196 E1.28728
G1 X123.192 Y65.798 E.01632
G1 X89.987 Y99.003 E1.27244
G1 X90.362 Y99.218 E.01171
G1 X123.18 Y66.4 E1.25761
G1 X123.168 Y67.002 E.01632
G1 X90.737 Y99.433 E1.24278
G1 X91.112 Y99.648 E.01171
G1 X123.156 Y67.604 E1.22794
G1 X123.144 Y68.206 E.01632
G1 X91.487 Y99.863 E1.21311
G1 X91.862 Y100.078 E.01171
G1 X123.132 Y68.808 E1.19827
G1 X123.12 Y69.41 E.01632
G1 X92.238 Y100.293 E1.18344
G1 X92.613 Y100.508 E.01171
G1 X123.108 Y70.013 E1.1686
G1 X123.096 Y70.615 E.01632
G1 X92.988 Y100.723 E1.15377
G1 X93.363 Y100.938 E.01171
G1 X123.084 Y71.217 E1.13893
G1 X123.072 Y71.819 E.01632
G1 X93.738 Y101.153 E1.1241
G1 X94.113 Y101.368 E.01171
G1 X123.059 Y72.421 E1.10927
G1 X123.047 Y73.023 E.01632
G1 X94.488 Y101.583 E1.09443
G1 X94.863 Y101.798 E.01171
G1 X123.035 Y73.625 E1.0796
G1 X123.023 Y74.228 E.01632
G1 X95.238 Y102.013 E1.06476
G1 X95.613 Y102.228 E.01171
G1 X123.011 Y74.83 E1.04993
G1 X122.999 Y75.432 E.01632
G1 X95.988 Y102.443 E1.03509
G1 X96.363 Y102.658 E.01171
G1 X122.987 Y76.034 E1.02026
G1 X122.975 Y76.636 E.01632
G1 X96.738 Y102.873 E1.00542
G1 X97.113 Y103.088 E.01171
G1 X122.963 Y77.238 E.99059
G1 X122.951 Y77.84 E.01632
G1 X97.488 Y103.303 E.97575
G1 X97.863 Y103.518 E.01171
G1 X122.939 Y78.442 E.96092
G1 X122.927 Y79.045 E.01632
G1 X98.239 Y103.733 E.94609
G1 X98.614 Y103.948 E.01171
G1 X122.915 Y79.647 E.93125
G1 X122.903 Y80.249 E.01632
G1 X98.989 Y104.163 E.91642
M73 P20 R55
G1 X99.364 Y104.378 E.01171
G1 X122.891 Y80.851 E.90158
G1 X122.879 Y81.453 E.01632
G1 X99.739 Y104.593 E.88675
G1 X100.114 Y104.808 E.01171
G1 X122.867 Y82.055 E.87191
G1 X122.855 Y82.657 E.01632
G1 X100.489 Y105.023 E.85708
G1 X100.864 Y105.238 E.01171
G1 X122.843 Y83.259 E.84224
G1 X122.831 Y83.862 E.01632
G1 X101.239 Y105.453 E.82741
G1 X101.614 Y105.668 E.01171
G1 X122.819 Y84.464 E.81258
G1 X122.806 Y85.066 E.01632
G1 X101.989 Y105.883 E.79774
G1 X102.364 Y106.098 E.01171
G1 X122.794 Y85.668 E.78291
G1 X122.782 Y86.27 E.01632
G1 X102.739 Y106.313 E.76807
G1 X103.114 Y106.528 E.01171
G1 X122.77 Y86.872 E.75324
G1 X122.758 Y87.474 E.01632
G1 X103.489 Y106.743 E.7384
G1 X103.864 Y106.958 E.01171
G1 X122.746 Y88.076 E.72357
G1 X122.734 Y88.679 E.01632
G1 X104.24 Y107.173 E.70873
G1 X104.615 Y107.388 E.01171
G1 X122.722 Y89.281 E.6939
G1 X122.71 Y89.883 E.01632
G1 X104.99 Y107.603 E.67907
G1 X105.365 Y107.818 E.01171
G1 X122.698 Y90.485 E.66423
G1 X122.686 Y91.087 E.01632
G1 X105.74 Y108.033 E.6494
G1 X106.115 Y108.248 E.01171
G1 X122.674 Y91.689 E.63456
G1 X122.662 Y92.291 E.01632
G1 X106.49 Y108.463 E.61973
G1 X106.865 Y108.678 E.01171
G1 X122.65 Y92.894 E.60489
G1 X122.638 Y93.496 E.01632
G1 X107.24 Y108.893 E.59006
G1 X107.615 Y109.108 E.01171
G1 X122.626 Y94.098 E.57522
G1 X122.614 Y94.7 E.01632
G1 X107.99 Y109.323 E.56039
G1 X108.365 Y109.538 E.01171
G1 X122.602 Y95.302 E.54556
G1 X122.59 Y95.904 E.01632
G1 X108.74 Y109.753 E.53072
G1 X109.115 Y109.969 E.01171
G1 X122.578 Y96.506 E.51589
G1 X122.566 Y97.108 E.01632
G1 X109.49 Y110.184 E.50105
G1 X109.865 Y110.399 E.01171
G1 X122.553 Y97.711 E.48622
G1 X122.541 Y98.313 E.01632
G1 X110.241 Y110.614 E.47138
G1 X110.35 Y110.676 E.00341
G1 X111.339 Y110.105 E.03097
G1 X122.529 Y98.915 E.42881
G1 X122.517 Y99.517 E.01632
G1 X112.736 Y109.299 E.37485
G1 X114.132 Y108.493 E.04368
G1 X122.505 Y100.119 E.32088
G1 X122.493 Y100.721 E.01632
G1 X115.528 Y107.687 E.26692
G1 X116.924 Y106.88 E.04368
G1 X122.481 Y101.323 E.21295
G1 X122.469 Y101.925 E.01632
G1 X118.32 Y106.074 E.15899
G1 X119.716 Y105.268 E.04368
G1 X122.457 Y102.528 E.10503
G1 X122.445 Y103.13 E.01632
G1 X120.601 Y104.973 E.07065
; OBJECT_ID: 465
; WIPE_START
G1 X122.016 Y103.559 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 437
M625
; start printing object, unique label id: 465
M624 IAAAAAAAAAA=
M204 S10000
G1 X116.147 Y108.439 Z.76 F30000
G1 X40.405 Y171.422 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X40.405 Y80.578 E2.46159
G1 X106.26 Y118.332 E2.05691
G1 X106.26 Y133.668 E.41557
G1 X40.457 Y171.392 E2.05529
M204 S10000
G1 X40.004 Y172.041 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X40.004 Y79.959 E2.31505
G1 X40.004 Y79.887 E.00183
G1 F2880
G1 X106.66 Y118.1 E1.93168
G1 X106.66 Y133.9 E.39725
G1 X40.004 Y172.113 E1.93168
G1 F3010.559
G1 X40.004 Y172.101 E.00032
; WIPE_START
M204 S4000
G1 X40.004 Y170.101 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.684 Y166.409 Z.76 F30000
G1 X105.903 Y133.678 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X105.903 Y118.537 E.41028
G1 X105.485 Y118.298 E.01304
G1 X105.485 Y133.702 E.41741
G1 X105.068 Y133.941 E.01304
G1 X105.068 Y118.059 E.43038
G1 X104.65 Y117.819 E.01304
G1 X104.65 Y134.181 E.44335
G1 X104.233 Y134.42 E.01304
G1 X104.233 Y117.58 E.45633
G1 X103.815 Y117.34 E.01304
G1 X103.815 Y134.66 E.4693
G1 X103.398 Y134.899 E.01304
G1 X103.398 Y117.101 E.48227
G1 X102.98 Y116.862 E.01304
G1 X102.98 Y135.138 E.49525
G1 X102.562 Y135.378 E.01304
G1 X102.562 Y116.622 E.50822
G1 X102.145 Y116.383 E.01304
G1 X102.145 Y135.617 E.52119
G1 X101.727 Y135.857 E.01304
G1 X101.727 Y116.143 E.53417
G1 X101.31 Y115.904 E.01304
G1 X101.31 Y136.096 E.54714
G1 X100.892 Y136.335 E.01304
G1 X100.892 Y115.665 E.56011
G1 X100.475 Y115.425 E.01304
G1 X100.475 Y136.575 E.57309
G1 X100.057 Y136.814 E.01304
G1 X100.057 Y115.186 E.58606
G1 X99.639 Y114.947 E.01304
G1 X99.639 Y137.053 E.59903
G1 X99.222 Y137.293 E.01304
G1 X99.222 Y114.707 E.61201
G1 X98.804 Y114.468 E.01304
G1 X98.804 Y137.532 E.62498
G1 X98.387 Y137.772 E.01304
G1 X98.387 Y114.228 E.63795
G1 X97.969 Y113.989 E.01304
G1 X97.969 Y138.011 E.65093
G1 X97.552 Y138.25 E.01304
G1 X97.552 Y113.75 E.6639
G1 X97.134 Y113.51 E.01304
G1 X97.134 Y138.49 E.67687
G1 X96.716 Y138.729 E.01304
G1 X96.716 Y113.271 E.68985
G1 X96.299 Y113.031 E.01304
G1 X96.299 Y138.969 E.70282
G1 X95.881 Y139.208 E.01304
G1 X95.881 Y112.792 E.71579
G1 X95.464 Y112.553 E.01304
G1 X95.464 Y139.447 E.72877
G1 X95.046 Y139.687 E.01304
G1 X95.046 Y112.313 E.74174
G1 X94.629 Y112.074 E.01304
G1 X94.629 Y139.926 E.75471
G1 X94.211 Y140.166 E.01304
G1 X94.211 Y111.834 E.76769
G1 X93.793 Y111.595 E.01304
G1 X93.793 Y140.405 E.78066
G1 X93.376 Y140.644 E.01304
G1 X93.376 Y111.356 E.79363
G1 X92.958 Y111.116 E.01304
G1 X92.958 Y140.884 E.80661
G1 X92.541 Y141.123 E.01304
G1 X92.541 Y110.877 E.81958
G1 X92.123 Y110.638 E.01304
G1 X92.123 Y141.362 E.83255
G1 X91.706 Y141.602 E.01304
G1 X91.706 Y110.398 E.84553
G1 X91.288 Y110.159 E.01304
G1 X91.288 Y141.841 E.8585
G1 X90.871 Y142.081 E.01304
G1 X90.871 Y109.919 E.87147
G1 X90.453 Y109.68 E.01304
G1 X90.453 Y142.32 E.88445
G1 X90.035 Y142.559 E.01304
G1 X90.035 Y109.441 E.89742
G1 X89.618 Y109.201 E.01304
G1 X89.618 Y142.799 E.91039
G1 X89.2 Y143.038 E.01304
G1 X89.2 Y108.962 E.92337
G1 X88.783 Y108.722 E.01304
G1 X88.783 Y143.278 E.93634
G1 X88.365 Y143.517 E.01304
G1 X88.365 Y108.483 E.94931
G1 X87.948 Y108.244 E.01304
G1 X87.948 Y143.756 E.96229
G1 X87.53 Y143.996 E.01304
G1 X87.53 Y108.004 E.97526
G1 X87.112 Y107.765 E.01304
G1 X87.112 Y144.235 E.98823
G1 X86.695 Y144.474 E.01304
G1 X86.695 Y107.526 E1.00121
G1 X86.277 Y107.286 E.01304
G1 X86.277 Y144.714 E1.01418
G1 X85.86 Y144.953 E.01304
G1 X85.86 Y107.047 E1.02715
G1 X85.442 Y106.807 E.01304
G1 X85.442 Y145.193 E1.04013
G1 X85.025 Y145.432 E.01304
G1 X85.025 Y106.568 E1.0531
G1 X84.607 Y106.329 E.01304
G1 X84.607 Y145.671 E1.06607
G1 X84.189 Y145.911 E.01304
G1 X84.189 Y106.089 E1.07905
G1 X83.772 Y105.85 E.01304
G1 X83.772 Y146.15 E1.09202
G1 X83.354 Y146.39 E.01304
G1 X83.354 Y105.61 E1.10499
G1 X82.937 Y105.371 E.01304
G1 X82.937 Y146.629 E1.11797
G1 X82.519 Y146.868 E.01304
G1 X82.519 Y105.132 E1.13094
G1 X82.102 Y104.892 E.01304
G1 X82.102 Y147.108 E1.14391
G1 X81.684 Y147.347 E.01304
G1 X81.684 Y104.653 E1.15689
G1 X81.266 Y104.413 E.01304
G1 X81.266 Y147.586 E1.16986
G1 X80.849 Y147.826 E.01304
G1 X80.849 Y104.174 E1.18283
G1 X80.431 Y103.935 E.01304
G1 X80.431 Y148.065 E1.19581
G1 X80.014 Y148.305 E.01304
G1 X80.014 Y103.695 E1.20878
G1 X79.596 Y103.456 E.01304
G1 X79.596 Y148.544 E1.22175
G1 X79.179 Y148.783 E.01304
G1 X79.179 Y103.217 E1.23473
G1 X78.761 Y102.977 E.01304
G1 X78.761 Y149.023 E1.2477
G1 X78.343 Y149.262 E.01304
G1 X78.343 Y102.738 E1.26068
G1 X77.926 Y102.498 E.01304
G1 X77.926 Y149.502 E1.27365
G1 X77.508 Y149.741 E.01304
G1 X77.508 Y102.259 E1.28662
G1 X77.091 Y102.02 E.01304
G1 X77.091 Y149.98 E1.2996
G1 X76.673 Y150.22 E.01304
G1 X76.673 Y101.78 E1.31257
G1 X76.256 Y101.541 E.01304
G1 X76.256 Y150.459 E1.32554
G1 X75.838 Y150.699 E.01304
G1 X75.838 Y101.301 E1.33852
G1 X75.42 Y101.062 E.01304
G1 X75.42 Y150.938 E1.35149
G1 X75.003 Y151.177 E.01304
G1 X75.003 Y100.823 E1.36446
G1 X74.585 Y100.583 E.01304
G1 X74.585 Y151.417 E1.37744
G1 X74.168 Y151.656 E.01304
G1 X74.168 Y100.344 E1.39041
G1 X73.75 Y100.105 E.01304
G1 X73.75 Y151.895 E1.40338
M73 P21 R55
G1 X73.333 Y152.135 E.01304
G1 X73.333 Y99.865 E1.41636
G1 X72.915 Y99.626 E.01304
G1 X72.915 Y152.374 E1.42933
G1 X72.497 Y152.614 E.01304
G1 X72.497 Y99.386 E1.4423
G1 X72.08 Y99.147 E.01304
G1 X72.08 Y152.853 E1.45528
G1 X71.662 Y153.092 E.01304
G1 X71.662 Y98.908 E1.46825
G1 X71.245 Y98.668 E.01304
G1 X71.245 Y153.332 E1.48122
G1 X70.827 Y153.571 E.01304
G1 X70.827 Y98.429 E1.4942
G1 X70.41 Y98.189 E.01304
G1 X70.41 Y153.811 E1.50717
G1 X69.992 Y154.05 E.01304
G1 X69.992 Y97.95 E1.52014
G1 X69.574 Y97.711 E.01304
G1 X69.574 Y154.289 E1.53312
G1 X69.157 Y154.529 E.01304
G1 X69.157 Y97.471 E1.54609
G1 X68.739 Y97.232 E.01304
G1 X68.739 Y154.768 E1.55906
G1 X68.322 Y155.007 E.01304
G1 X68.322 Y96.992 E1.57204
G1 X67.904 Y96.753 E.01304
G1 X67.904 Y155.247 E1.58501
G1 X67.487 Y155.486 E.01304
G1 X67.487 Y96.514 E1.59798
G1 X67.069 Y96.274 E.01304
G1 X67.069 Y155.726 E1.61096
G1 X66.651 Y155.965 E.01304
G1 X66.651 Y96.035 E1.62393
G1 X66.234 Y95.796 E.01304
G1 X66.234 Y156.204 E1.6369
G1 X65.816 Y156.444 E.01304
G1 X65.816 Y95.556 E1.64988
G1 X65.399 Y95.317 E.01304
G1 X65.399 Y156.683 E1.66285
G1 X64.981 Y156.923 E.01304
G1 X64.981 Y95.077 E1.67582
G1 X64.564 Y94.838 E.01304
G1 X64.564 Y157.162 E1.6888
G1 X64.146 Y157.401 E.01304
G1 X64.146 Y94.599 E1.70177
G1 X63.728 Y94.359 E.01304
G1 X63.728 Y157.641 E1.71474
G1 X63.311 Y157.88 E.01304
G1 X63.311 Y94.12 E1.72772
G1 X62.893 Y93.88 E.01304
G1 X62.893 Y158.12 E1.74069
G1 X62.476 Y158.359 E.01304
G1 X62.476 Y93.641 E1.75366
G1 X62.058 Y93.402 E.01304
G1 X62.058 Y158.598 E1.76664
G1 X61.641 Y158.838 E.01304
G1 X61.641 Y93.162 E1.77961
G1 X61.223 Y92.923 E.01304
G1 X61.223 Y159.077 E1.79258
G1 X60.805 Y159.316 E.01304
G1 X60.805 Y92.684 E1.80556
G1 X60.388 Y92.444 E.01304
G1 X60.388 Y159.556 E1.81853
G1 X59.97 Y159.795 E.01304
G1 X59.97 Y92.205 E1.8315
G1 X59.553 Y91.965 E.01304
G1 X59.553 Y160.035 E1.84448
G1 X59.135 Y160.274 E.01304
G1 X59.135 Y91.726 E1.85745
G1 X58.718 Y91.487 E.01304
G1 X58.718 Y160.513 E1.87042
G1 X58.3 Y160.753 E.01304
G1 X58.3 Y91.247 E1.8834
G1 X57.882 Y91.008 E.01304
G1 X57.882 Y160.992 E1.89637
G1 X57.465 Y161.232 E.01304
G1 X57.465 Y90.768 E1.90934
G1 X57.047 Y90.529 E.01304
G1 X57.047 Y161.471 E1.92232
G1 X56.63 Y161.71 E.01304
G1 X56.63 Y90.29 E1.93529
G1 X56.212 Y90.05 E.01304
G1 X56.212 Y161.95 E1.94826
G1 X55.795 Y162.189 E.01304
G1 X55.795 Y89.811 E1.96124
G1 X55.377 Y89.572 E.01304
G1 X55.377 Y162.428 E1.97421
G1 X54.959 Y162.668 E.01304
G1 X54.959 Y89.332 E1.98718
G1 X54.542 Y89.093 E.01304
G1 X54.542 Y162.907 E2.00016
G1 X54.124 Y163.147 E.01304
G1 X54.124 Y88.853 E2.01313
G1 X53.707 Y88.614 E.01304
G1 X53.707 Y163.386 E2.0261
G1 X53.289 Y163.625 E.01304
G1 X53.289 Y88.375 E2.03908
G1 X52.872 Y88.135 E.01304
G1 X52.872 Y163.865 E2.05205
G1 X52.454 Y164.104 E.01304
G1 X52.454 Y87.896 E2.06502
G1 X52.036 Y87.656 E.01304
G1 X52.036 Y164.344 E2.078
G1 X51.619 Y164.583 E.01304
G1 X51.619 Y87.417 E2.09097
G1 X51.201 Y87.178 E.01304
G1 X51.201 Y164.822 E2.10394
G1 X50.784 Y165.062 E.01304
G1 X50.784 Y86.938 E2.11692
G1 X50.366 Y86.699 E.01304
G1 X50.366 Y165.301 E2.12989
G1 X49.949 Y165.541 E.01304
G1 X49.949 Y86.459 E2.14286
G1 X49.531 Y86.22 E.01304
G1 X49.531 Y165.78 E2.15584
G1 X49.114 Y166.019 E.01304
G1 X49.114 Y85.981 E2.16881
G1 X48.696 Y85.741 E.01304
G1 X48.696 Y166.259 E2.18178
G1 X48.278 Y166.498 E.01304
G1 X48.278 Y85.502 E2.19476
G1 X47.861 Y85.263 E.01304
G1 X47.861 Y166.737 E2.20773
G1 X47.443 Y166.977 E.01304
G1 X47.443 Y85.023 E2.2207
G1 X47.026 Y84.784 E.01304
G1 X47.026 Y167.216 E2.23368
G1 X46.608 Y167.456 E.01304
G1 X46.608 Y84.544 E2.24665
G1 X46.191 Y84.305 E.01304
G1 X46.191 Y167.695 E2.25962
G1 X45.773 Y167.934 E.01304
G1 X45.773 Y84.066 E2.2726
G1 X45.355 Y83.826 E.01304
G1 X45.355 Y168.174 E2.28557
G1 X44.938 Y168.413 E.01304
G1 X44.938 Y83.587 E2.29854
G1 X44.52 Y83.347 E.01304
G1 X44.52 Y168.653 E2.31152
G1 X44.103 Y168.892 E.01304
G1 X44.103 Y83.108 E2.32449
G1 X43.685 Y82.869 E.01304
G1 X43.685 Y169.131 E2.33746
G1 X43.268 Y169.371 E.01304
G1 X43.268 Y82.629 E2.35044
G1 X42.85 Y82.39 E.01304
G1 X42.85 Y169.61 E2.36341
G1 X42.432 Y169.849 E.01304
G1 X42.432 Y82.151 E2.37638
G1 X42.015 Y81.911 E.01304
G1 X42.015 Y170.089 E2.38936
G1 X41.597 Y170.328 E.01304
G1 X41.597 Y81.672 E2.40233
G1 X41.18 Y81.432 E.01304
G1 X41.18 Y170.568 E2.4153
G1 X40.762 Y170.807 E.01304
G1 X40.762 Y80.977 E2.43412
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X40.762 Y82.977 E-.76
; WIPE_END
M73 P21 R54
G1 E-.04 F1800
; stop printing object, unique label id: 465
M625
; layer num/total_layer_count: 3/14
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M204 S10000
G17
G3 Z.76 I1.217 J0 P1  F30000
; object ids of layer 3 start: 325,353,381,409,437,465
M624 PwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer3 end: 325,353,381,409,437,465
M625
; OBJECT_ID: 325
; start printing object, unique label id: 325
M624 AQAAAAAAAAA=
G1 X208.511 Y75.156
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X145.649 Y111.193 E1.96341
G1 X133.124 Y103.961 E.39192
G1 X132.176 Y56.606 E1.28343
G1 X208.452 Y75.141 E2.12701
; WIPE_START
G1 X206.718 Y76.137 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.509 Y74.986 Z.92 F30000
G1 Z.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X209.582 Y75.003 E.00188
G1 F3240
G1 X145.649 Y111.655 E1.85276
G1 X132.728 Y104.195 E.37511
G1 X131.766 Y56.145 E1.20829
G1 F3600
G1 X131.814 Y56.106 E.00156
G1 X131.817 Y56.107 E.00006
G1 X209.451 Y74.972 E2.00862
; WIPE_START
M204 S4000
G1 X209.582 Y75.003 E-.05118
G1 X207.963 Y75.931 E-.70882
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.54 Y75.518 Z.92 F30000
G1 Z.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.233 Y75.211 E.01176
G1 X206.456 Y75.022 E.02166
G1 X207.029 Y75.595 E.02196
G1 X206.655 Y75.809 E.01168
G1 X205.679 Y74.833 E.0374
G1 X204.902 Y74.645 E.02166
G1 X206.281 Y76.024 E.05285
G1 X205.907 Y76.238 E.01168
G1 X204.125 Y74.456 E.0683
G1 X203.348 Y74.267 E.02166
G1 X205.534 Y76.452 E.08374
G1 X205.16 Y76.667 E.01168
G1 X202.571 Y74.078 E.09919
G1 X201.795 Y73.889 E.02166
G1 X204.786 Y76.881 E.11464
G1 X204.412 Y77.095 E.01168
G1 X201.018 Y73.701 E.13008
G1 X200.241 Y73.512 E.02166
G1 X204.038 Y77.31 E.14553
G1 X203.665 Y77.524 E.01168
G1 X199.464 Y73.323 E.16098
G1 X198.687 Y73.134 E.02166
G1 X203.291 Y77.738 E.17642
G1 X202.917 Y77.952 E.01168
G1 X197.91 Y72.946 E.19187
G1 X197.133 Y72.757 E.02166
G1 X202.543 Y78.167 E.20732
G1 X202.169 Y78.381 E.01168
M73 P22 R54
G1 X196.356 Y72.568 E.22276
G1 X195.579 Y72.379 E.02166
G1 X201.796 Y78.595 E.23821
G1 X201.422 Y78.81 E.01168
G1 X194.802 Y72.19 E.25366
G1 X194.026 Y72.002 E.02166
G1 X201.048 Y79.024 E.26911
G1 X200.674 Y79.238 E.01168
G1 X193.249 Y71.813 E.28455
G1 X192.472 Y71.624 E.02166
G1 X200.3 Y79.453 E.3
G1 X199.926 Y79.667 E.01168
G1 X191.695 Y71.435 E.31545
G1 X190.918 Y71.246 E.02166
G1 X199.553 Y79.881 E.33089
G1 X199.179 Y80.095 E.01168
G1 X190.141 Y71.058 E.34634
G1 X189.364 Y70.869 E.02166
G1 X198.805 Y80.31 E.36179
G1 X198.431 Y80.524 E.01168
G1 X188.587 Y70.68 E.37723
G1 X187.81 Y70.491 E.02166
G1 X198.057 Y80.738 E.39268
G1 X197.684 Y80.953 E.01168
G1 X187.033 Y70.302 E.40813
G1 X186.257 Y70.114 E.02166
G1 X197.31 Y81.167 E.42357
G1 X196.936 Y81.381 E.01168
G1 X185.48 Y69.925 E.43902
G1 X184.703 Y69.736 E.02166
G1 X196.562 Y81.596 E.45447
G1 X196.188 Y81.81 E.01168
G1 X183.926 Y69.547 E.46991
G1 X183.149 Y69.359 E.02166
G1 X195.815 Y82.024 E.48536
G1 X195.441 Y82.238 E.01168
G1 X182.372 Y69.17 E.50081
G1 X181.595 Y68.981 E.02166
G1 X195.067 Y82.453 E.51625
G1 X194.693 Y82.667 E.01168
G1 X180.818 Y68.792 E.5317
G1 X180.041 Y68.603 E.02166
G1 X194.319 Y82.881 E.54715
G1 X193.945 Y83.096 E.01168
G1 X179.264 Y68.415 E.56259
G1 X178.487 Y68.226 E.02166
G1 X193.572 Y83.31 E.57804
G1 X193.198 Y83.524 E.01168
G1 X177.711 Y68.037 E.59349
G1 X176.934 Y67.848 E.02166
G1 X192.824 Y83.739 E.60893
G1 X192.45 Y83.953 E.01168
G1 X176.157 Y67.659 E.62438
G1 X175.38 Y67.471 E.02166
G1 X192.076 Y84.167 E.63983
G1 X191.703 Y84.381 E.01168
G1 X174.603 Y67.282 E.65527
G1 X173.826 Y67.093 E.02166
G1 X191.329 Y84.596 E.67072
G1 X190.955 Y84.81 E.01168
G1 X173.049 Y66.904 E.68617
G1 X172.272 Y66.716 E.02166
G1 X190.581 Y85.024 E.70161
G1 X190.207 Y85.239 E.01168
G1 X171.495 Y66.527 E.71706
G1 X170.718 Y66.338 E.02166
G1 X189.834 Y85.453 E.73251
G1 X189.46 Y85.667 E.01168
G1 X169.942 Y66.149 E.74796
G1 X169.165 Y65.96 E.02166
G1 X189.086 Y85.882 E.7634
G1 X188.712 Y86.096 E.01168
G1 X168.388 Y65.772 E.77885
G1 X167.611 Y65.583 E.02166
G1 X188.338 Y86.31 E.7943
G1 X187.964 Y86.525 E.01168
G1 X166.834 Y65.394 E.80974
G1 X166.057 Y65.205 E.02166
G1 X187.591 Y86.739 E.82519
G1 X187.217 Y86.953 E.01168
G1 X165.28 Y65.016 E.84064
G1 X164.503 Y64.828 E.02166
G1 X186.843 Y87.167 E.85608
G1 X186.469 Y87.382 E.01168
G1 X163.726 Y64.639 E.87153
G1 X162.949 Y64.45 E.02166
G1 X186.095 Y87.596 E.88698
G1 X185.722 Y87.81 E.01168
G1 X162.173 Y64.261 E.90242
G1 X161.396 Y64.073 E.02166
G1 X185.348 Y88.025 E.91787
G1 X184.974 Y88.239 E.01168
G1 X160.619 Y63.884 E.93332
G1 X159.842 Y63.695 E.02166
G1 X184.6 Y88.453 E.94876
G1 X184.226 Y88.668 E.01168
G1 X159.065 Y63.506 E.96421
G1 X158.288 Y63.317 E.02166
G1 X183.853 Y88.882 E.97966
G1 X183.479 Y89.096 E.01168
G1 X157.511 Y63.129 E.9951
G1 X156.734 Y62.94 E.02166
G1 X183.105 Y89.31 E1.01055
G1 X182.731 Y89.525 E.01168
G1 X155.957 Y62.751 E1.026
G1 X155.18 Y62.562 E.02166
G1 X182.357 Y89.739 E1.04144
G1 X181.983 Y89.953 E.01168
G1 X154.404 Y62.373 E1.05689
G1 X153.627 Y62.185 E.02166
G1 X181.61 Y90.168 E1.07234
G1 X181.236 Y90.382 E.01168
G1 X152.85 Y61.996 E1.08778
G1 X152.073 Y61.807 E.02166
G1 X180.862 Y90.596 E1.10323
G1 X180.488 Y90.811 E.01168
G1 X151.296 Y61.618 E1.11868
G1 X150.519 Y61.429 E.02166
G1 X180.114 Y91.025 E1.13412
G1 X179.741 Y91.239 E.01168
G1 X149.742 Y61.241 E1.14957
G1 X148.965 Y61.052 E.02166
G1 X179.367 Y91.453 E1.16502
G1 X178.993 Y91.668 E.01168
G1 X148.188 Y60.863 E1.18047
G1 X147.411 Y60.674 E.02166
G1 X178.619 Y91.882 E1.19591
G1 X178.245 Y92.096 E.01168
G1 X146.635 Y60.486 E1.21136
G1 X145.858 Y60.297 E.02166
G1 X177.872 Y92.311 E1.22681
G1 X177.498 Y92.525 E.01168
G1 X145.081 Y60.108 E1.24225
G1 X144.304 Y59.919 E.02166
G1 X177.124 Y92.739 E1.2577
G1 X176.75 Y92.954 E.01168
G1 X143.527 Y59.73 E1.27315
G1 X142.75 Y59.542 E.02166
G1 X176.376 Y93.168 E1.28859
G1 X176.002 Y93.382 E.01168
G1 X141.973 Y59.353 E1.30404
G1 X141.196 Y59.164 E.02166
G1 X175.629 Y93.596 E1.31949
G1 X175.255 Y93.811 E.01168
G1 X140.419 Y58.975 E1.33493
G1 X139.642 Y58.786 E.02166
G1 X174.881 Y94.025 E1.35038
G1 X174.507 Y94.239 E.01168
G1 X138.865 Y58.598 E1.36583
G1 X138.089 Y58.409 E.02166
G1 X174.133 Y94.454 E1.38127
G1 X173.76 Y94.668 E.01168
G1 X137.312 Y58.22 E1.39672
G1 X136.535 Y58.031 E.02166
G1 X173.386 Y94.882 E1.41217
G1 X173.012 Y95.097 E.01168
G1 X135.758 Y57.843 E1.42761
G1 X134.981 Y57.654 E.02166
G1 X172.638 Y95.311 E1.44306
G1 X172.264 Y95.525 E.01168
G1 X134.204 Y57.465 E1.45851
G1 X133.427 Y57.276 E.02166
G1 X171.89 Y95.739 E1.47395
G1 X171.517 Y95.954 E.01168
G1 X132.65 Y57.087 E1.4894
G1 X132.541 Y57.061 E.00305
G1 X132.551 Y57.576 E.01397
G1 X171.143 Y96.168 E1.47888
G1 X170.769 Y96.382 E.01168
G1 X132.563 Y58.176 E1.46409
G1 X132.575 Y58.777 E.01626
G1 X170.395 Y96.597 E1.44931
G1 X170.021 Y96.811 E.01168
G1 X132.587 Y59.377 E1.43452
G1 X132.599 Y59.977 E.01627
G1 X169.648 Y97.025 E1.41974
G1 X169.274 Y97.24 E.01168
G1 X132.611 Y60.577 E1.40495
G1 X132.623 Y61.177 E.01626
G1 X168.9 Y97.454 E1.39017
G1 X168.526 Y97.668 E.01168
G1 X132.635 Y61.777 E1.37538
G1 X132.647 Y62.377 E.01627
G1 X168.152 Y97.883 E1.3606
G1 X167.779 Y98.097 E.01168
G1 X132.659 Y62.977 E1.34581
G1 X132.671 Y63.578 E.01627
G1 X167.405 Y98.311 E1.33103
G1 X167.031 Y98.525 E.01168
G1 X132.683 Y64.178 E1.31624
G1 X132.695 Y64.778 E.01626
G1 X166.657 Y98.74 E1.30146
G1 X166.283 Y98.954 E.01168
G1 X132.707 Y65.378 E1.28667
G1 X132.719 Y65.978 E.01626
G1 X165.909 Y99.168 E1.27189
G1 X165.536 Y99.383 E.01168
G1 X132.731 Y66.578 E1.2571
G1 X132.743 Y67.178 E.01626
G1 X165.162 Y99.597 E1.24232
G1 X164.788 Y99.811 E.01168
G1 X132.755 Y67.778 E1.22753
G1 X132.767 Y68.379 E.01627
G1 X164.414 Y100.026 E1.21275
G1 X164.04 Y100.24 E.01168
G1 X132.779 Y68.979 E1.19796
G1 X132.791 Y69.579 E.01626
G1 X163.667 Y100.454 E1.18318
G1 X163.293 Y100.668 E.01168
G1 X132.803 Y70.179 E1.16839
G1 X132.815 Y70.779 E.01626
G1 X162.919 Y100.883 E1.15361
G1 X162.545 Y101.097 E.01168
G1 X132.827 Y71.379 E1.13882
G1 X132.839 Y71.979 E.01626
G1 X162.171 Y101.311 E1.12404
G1 X161.798 Y101.526 E.01168
G1 X132.851 Y72.579 E1.10925
G1 X132.863 Y73.179 E.01626
G1 X161.424 Y101.74 E1.09447
G1 X161.05 Y101.954 E.01168
G1 X132.875 Y73.78 E1.07968
G1 X132.887 Y74.38 E.01626
G1 X160.676 Y102.169 E1.0649
G1 X160.302 Y102.383 E.01168
G1 X132.899 Y74.98 E1.05011
G1 X132.911 Y75.58 E.01626
G1 X159.928 Y102.597 E1.03533
G1 X159.555 Y102.811 E.01168
G1 X132.923 Y76.18 E1.02054
G1 X132.935 Y76.78 E.01627
G1 X159.181 Y103.026 E1.00575
G1 X158.807 Y103.24 E.01168
G1 X132.947 Y77.38 E.99097
G1 X132.959 Y77.98 E.01626
G1 X158.433 Y103.454 E.97618
G1 X158.059 Y103.669 E.01168
G1 X132.971 Y78.581 E.9614
G1 X132.983 Y79.181 E.01626
G1 X157.686 Y103.883 E.94661
G1 X157.312 Y104.097 E.01168
G1 X132.995 Y79.781 E.93183
G1 X133.007 Y80.381 E.01626
G1 X156.938 Y104.312 E.91704
G1 X156.564 Y104.526 E.01168
G1 X133.019 Y80.981 E.90226
G1 X133.031 Y81.581 E.01626
G1 X156.19 Y104.74 E.88747
G1 X155.817 Y104.954 E.01168
G1 X133.043 Y82.181 E.87269
G1 X133.055 Y82.781 E.01626
G1 X155.443 Y105.169 E.8579
G1 X155.069 Y105.383 E.01168
G1 X133.067 Y83.382 E.84312
G1 X133.079 Y83.982 E.01627
G1 X154.695 Y105.597 E.82833
G1 X154.321 Y105.812 E.01168
G1 X133.091 Y84.582 E.81355
G1 X133.103 Y85.182 E.01626
G1 X153.947 Y106.026 E.79876
G1 X153.574 Y106.24 E.01168
G1 X133.115 Y85.782 E.78398
G1 X133.127 Y86.382 E.01627
G1 X153.2 Y106.455 E.76919
G1 X152.826 Y106.669 E.01168
G1 X133.139 Y86.982 E.75441
G1 X133.151 Y87.582 E.01627
G1 X152.452 Y106.883 E.73962
G1 X152.078 Y107.097 E.01168
G1 X133.163 Y88.183 E.72484
G1 X133.175 Y88.783 E.01626
G1 X151.705 Y107.312 E.71005
G1 X151.331 Y107.526 E.01168
G1 X133.188 Y89.383 E.69527
G1 X133.2 Y89.983 E.01626
G1 X150.957 Y107.74 E.68048
G1 X150.583 Y107.955 E.01168
G1 X133.212 Y90.583 E.6657
G1 X133.224 Y91.183 E.01626
G1 X150.209 Y108.169 E.65091
G1 X149.836 Y108.383 E.01168
G1 X133.236 Y91.783 E.63613
G1 X133.248 Y92.383 E.01627
G1 X149.462 Y108.598 E.62134
G1 X149.088 Y108.812 E.01168
G1 X133.26 Y92.984 E.60656
G1 X133.272 Y93.584 E.01627
G1 X148.714 Y109.026 E.59177
G1 X148.34 Y109.24 E.01168
G1 X133.284 Y94.184 E.57699
G1 X133.296 Y94.784 E.01626
G1 X147.966 Y109.455 E.5622
G1 X147.593 Y109.669 E.01168
G1 X133.308 Y95.384 E.54742
G1 X133.32 Y95.984 E.01626
G1 X147.219 Y109.883 E.53263
G1 X146.845 Y110.098 E.01168
G1 X133.332 Y96.584 E.51785
G1 X133.344 Y97.184 E.01627
G1 X146.471 Y110.312 E.50306
G1 X146.097 Y110.526 E.01168
G1 X133.356 Y97.785 E.48828
G1 X133.368 Y98.385 E.01627
G1 X145.724 Y110.741 E.47349
G1 X145.65 Y110.783 E.00229
G1 X144.532 Y110.137 E.03498
G1 X133.38 Y98.985 E.42737
G1 X133.392 Y99.585 E.01626
G1 X143.141 Y109.334 E.37359
G1 X141.749 Y108.53 E.04354
G1 X133.404 Y100.185 E.3198
G1 X133.416 Y100.785 E.01627
G1 X140.358 Y107.727 E.26602
G1 X138.966 Y106.924 E.04354
G1 X133.428 Y101.385 E.21224
G1 X133.44 Y101.985 E.01626
G1 X137.575 Y106.12 E.15845
G1 X136.183 Y105.317 E.04354
G1 X133.452 Y102.586 E.10467
G1 X133.464 Y103.186 E.01626
G1 X135.303 Y105.025 E.07047
; OBJECT_ID: 353
; WIPE_START
G1 X133.888 Y103.61 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 325
M625
; start printing object, unique label id: 353
M624 AgAAAAAAAAA=
M204 S10000
G1 X139.758 Y108.489 Z.92 F30000
G1 X215.595 Y171.528 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X149.648 Y133.722 E2.0598
G1 X149.648 Y118.278 E.41847
G1 X215.595 Y80.472 E2.0598
G1 X215.595 Y171.468 E2.46574
M204 S10000
G1 X215.996 Y172.161 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X215.996 Y172.22 E.00149
G1 F3240
G1 X149.247 Y133.954 E1.93436
G1 X149.247 Y118.046 E.39994
G1 X215.996 Y79.78 E1.93436
G1 F3600
G1 X215.996 Y79.839 E.00149
G1 X215.996 Y172.101 E2.31957
; WIPE_START
M204 S4000
G1 X215.996 Y172.22 E-.04531
G1 X214.364 Y171.284 E-.71469
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X215.238 Y171.129 Z.92 F30000
G1 Z.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X215.238 Y81.086 E2.43991
G1 X214.82 Y81.326 E.01306
G1 X214.82 Y170.674 E2.42107
G1 X214.402 Y170.434 E.01306
G1 X214.402 Y81.566 E2.40808
G1 X213.984 Y81.805 E.01306
G1 X213.984 Y170.195 E2.39509
G1 X213.566 Y169.955 E.01306
G1 X213.566 Y82.045 E2.3821
G1 X213.148 Y82.285 E.01306
G1 X213.148 Y169.715 E2.36911
G1 X212.729 Y169.475 E.01306
G1 X212.729 Y82.525 E2.35611
G1 X212.311 Y82.764 E.01306
G1 X212.311 Y169.236 E2.34312
G1 X211.893 Y168.996 E.01306
G1 X211.893 Y83.004 E2.33013
G1 X211.475 Y83.244 E.01306
G1 X211.475 Y168.756 E2.31714
G1 X211.057 Y168.517 E.01306
G1 X211.057 Y83.483 E2.30415
G1 X210.639 Y83.723 E.01306
G1 X210.639 Y168.277 E2.29116
G1 X210.221 Y168.037 E.01306
G1 X210.221 Y83.963 E2.27816
G1 X209.802 Y84.203 E.01306
G1 X209.802 Y167.797 E2.26517
M73 P23 R54
G1 X209.384 Y167.558 E.01306
G1 X209.384 Y84.442 E2.25218
G1 X208.966 Y84.682 E.01306
G1 X208.966 Y167.318 E2.23919
G1 X208.548 Y167.078 E.01306
G1 X208.548 Y84.922 E2.2262
G1 X208.13 Y85.162 E.01306
G1 X208.13 Y166.838 E2.21321
G1 X207.712 Y166.599 E.01306
G1 X207.712 Y85.401 E2.20021
G1 X207.293 Y85.641 E.01306
G1 X207.293 Y166.359 E2.18722
G1 X206.875 Y166.119 E.01306
M73 P23 R53
G1 X206.875 Y85.881 E2.17423
G1 X206.457 Y86.12 E.01306
G1 X206.457 Y165.88 E2.16124
G1 X206.039 Y165.64 E.01306
G1 X206.039 Y86.36 E2.14825
G1 X205.621 Y86.6 E.01306
G1 X205.621 Y165.4 E2.13526
G1 X205.203 Y165.16 E.01306
G1 X205.203 Y86.84 E2.12226
G1 X204.784 Y87.079 E.01306
G1 X204.784 Y164.921 E2.10927
G1 X204.366 Y164.681 E.01306
G1 X204.366 Y87.319 E2.09628
G1 X203.948 Y87.559 E.01306
G1 X203.948 Y164.441 E2.08329
G1 X203.53 Y164.202 E.01306
G1 X203.53 Y87.798 E2.0703
G1 X203.112 Y88.038 E.01306
G1 X203.112 Y163.962 E2.05731
G1 X202.694 Y163.722 E.01306
G1 X202.694 Y88.278 E2.04431
G1 X202.275 Y88.518 E.01306
G1 X202.275 Y163.482 E2.03132
G1 X201.857 Y163.243 E.01306
G1 X201.857 Y88.757 E2.01833
G1 X201.439 Y88.997 E.01306
G1 X201.439 Y163.003 E2.00534
G1 X201.021 Y162.763 E.01306
G1 X201.021 Y89.237 E1.99235
G1 X200.603 Y89.477 E.01306
G1 X200.603 Y162.523 E1.97936
G1 X200.185 Y162.284 E.01306
G1 X200.185 Y89.716 E1.96636
G1 X199.767 Y89.956 E.01306
G1 X199.767 Y162.044 E1.95337
G1 X199.348 Y161.804 E.01306
G1 X199.348 Y90.196 E1.94038
G1 X198.93 Y90.435 E.01306
G1 X198.93 Y161.565 E1.92739
G1 X198.512 Y161.325 E.01306
G1 X198.512 Y90.675 E1.9144
G1 X198.094 Y90.915 E.01306
G1 X198.094 Y161.085 E1.90141
G1 X197.676 Y160.845 E.01306
G1 X197.676 Y91.155 E1.88841
G1 X197.258 Y91.394 E.01306
G1 X197.258 Y160.606 E1.87542
G1 X196.839 Y160.366 E.01306
G1 X196.839 Y91.634 E1.86243
G1 X196.421 Y91.874 E.01306
G1 X196.421 Y160.126 E1.84944
G1 X196.003 Y159.886 E.01306
G1 X196.003 Y92.114 E1.83645
G1 X195.585 Y92.353 E.01306
G1 X195.585 Y159.647 E1.82346
G1 X195.167 Y159.407 E.01306
G1 X195.167 Y92.593 E1.81046
G1 X194.749 Y92.833 E.01306
G1 X194.749 Y159.167 E1.79747
G1 X194.33 Y158.928 E.01306
G1 X194.33 Y93.072 E1.78448
G1 X193.912 Y93.312 E.01306
G1 X193.912 Y158.688 E1.77149
G1 X193.494 Y158.448 E.01306
G1 X193.494 Y93.552 E1.7585
G1 X193.076 Y93.792 E.01306
G1 X193.076 Y158.208 E1.74551
G1 X192.658 Y157.969 E.01306
G1 X192.658 Y94.031 E1.73251
G1 X192.24 Y94.271 E.01306
G1 X192.24 Y157.729 E1.71952
G1 X191.821 Y157.489 E.01306
G1 X191.821 Y94.511 E1.70653
G1 X191.403 Y94.751 E.01306
G1 X191.403 Y157.249 E1.69354
G1 X190.985 Y157.01 E.01306
G1 X190.985 Y94.99 E1.68055
G1 X190.567 Y95.23 E.01306
G1 X190.567 Y156.77 E1.66755
G1 X190.149 Y156.53 E.01306
G1 X190.149 Y95.47 E1.65456
G1 X189.731 Y95.709 E.01306
G1 X189.731 Y156.291 E1.64157
G1 X189.313 Y156.051 E.01306
G1 X189.313 Y95.949 E1.62858
G1 X188.894 Y96.189 E.01306
G1 X188.894 Y155.811 E1.61559
G1 X188.476 Y155.571 E.01306
G1 X188.476 Y96.429 E1.6026
G1 X188.058 Y96.668 E.01306
G1 X188.058 Y155.332 E1.5896
G1 X187.64 Y155.092 E.01306
G1 X187.64 Y96.908 E1.57661
G1 X187.222 Y97.148 E.01306
G1 X187.222 Y154.852 E1.56362
G1 X186.804 Y154.613 E.01306
G1 X186.804 Y97.387 E1.55063
G1 X186.385 Y97.627 E.01306
G1 X186.385 Y154.373 E1.53764
G1 X185.967 Y154.133 E.01306
G1 X185.967 Y97.867 E1.52465
G1 X185.549 Y98.107 E.01306
G1 X185.549 Y153.893 E1.51165
G1 X185.131 Y153.654 E.01306
G1 X185.131 Y98.346 E1.49866
G1 X184.713 Y98.586 E.01306
G1 X184.713 Y153.414 E1.48567
G1 X184.295 Y153.174 E.01306
G1 X184.295 Y98.826 E1.47268
G1 X183.876 Y99.066 E.01306
G1 X183.876 Y152.934 E1.45969
G1 X183.458 Y152.695 E.01306
G1 X183.458 Y99.305 E1.4467
G1 X183.04 Y99.545 E.01306
G1 X183.04 Y152.455 E1.4337
G1 X182.622 Y152.215 E.01306
G1 X182.622 Y99.785 E1.42071
G1 X182.204 Y100.024 E.01306
G1 X182.204 Y151.976 E1.40772
G1 X181.786 Y151.736 E.01306
G1 X181.786 Y100.264 E1.39473
G1 X181.367 Y100.504 E.01306
G1 X181.367 Y151.496 E1.38174
G1 X180.949 Y151.256 E.01306
G1 X180.949 Y100.744 E1.36875
G1 X180.531 Y100.983 E.01306
G1 X180.531 Y151.017 E1.35575
G1 X180.113 Y150.777 E.01306
G1 X180.113 Y101.223 E1.34276
G1 X179.695 Y101.463 E.01306
G1 X179.695 Y150.537 E1.32977
G1 X179.277 Y150.297 E.01306
G1 X179.277 Y101.703 E1.31678
G1 X178.859 Y101.942 E.01306
G1 X178.859 Y150.058 E1.30379
G1 X178.44 Y149.818 E.01306
G1 X178.44 Y102.182 E1.2908
G1 X178.022 Y102.422 E.01306
G1 X178.022 Y149.578 E1.2778
G1 X177.604 Y149.339 E.01306
G1 X177.604 Y102.661 E1.26481
G1 X177.186 Y102.901 E.01306
G1 X177.186 Y149.099 E1.25182
G1 X176.768 Y148.859 E.01306
G1 X176.768 Y103.141 E1.23883
G1 X176.35 Y103.381 E.01306
G1 X176.35 Y148.619 E1.22584
G1 X175.931 Y148.38 E.01306
G1 X175.931 Y103.62 E1.21285
G1 X175.513 Y103.86 E.01306
G1 X175.513 Y148.14 E1.19985
G1 X175.095 Y147.9 E.01306
G1 X175.095 Y104.1 E1.18686
G1 X174.677 Y104.34 E.01306
G1 X174.677 Y147.66 E1.17387
G1 X174.259 Y147.421 E.01306
G1 X174.259 Y104.579 E1.16088
G1 X173.841 Y104.819 E.01306
G1 X173.841 Y147.181 E1.14789
G1 X173.422 Y146.941 E.01306
G1 X173.422 Y105.059 E1.1349
G1 X173.004 Y105.298 E.01306
G1 X173.004 Y146.702 E1.1219
G1 X172.586 Y146.462 E.01306
G1 X172.586 Y105.538 E1.10891
G1 X172.168 Y105.778 E.01306
G1 X172.168 Y146.222 E1.09592
G1 X171.75 Y145.982 E.01306
G1 X171.75 Y106.018 E1.08293
G1 X171.332 Y106.257 E.01306
G1 X171.332 Y145.743 E1.06994
G1 X170.913 Y145.503 E.01306
G1 X170.913 Y106.497 E1.05695
G1 X170.495 Y106.737 E.01306
G1 X170.495 Y145.263 E1.04395
G1 X170.077 Y145.023 E.01306
G1 X170.077 Y106.976 E1.03096
G1 X169.659 Y107.216 E.01306
G1 X169.659 Y144.784 E1.01797
G1 X169.241 Y144.544 E.01306
G1 X169.241 Y107.456 E1.00498
G1 X168.823 Y107.696 E.01306
G1 X168.823 Y144.304 E.99199
M73 P24 R53
G1 X168.405 Y144.065 E.01306
G1 X168.405 Y107.935 E.979
G1 X167.986 Y108.175 E.01306
G1 X167.986 Y143.825 E.966
G1 X167.568 Y143.585 E.01306
G1 X167.568 Y108.415 E.95301
G1 X167.15 Y108.655 E.01306
G1 X167.15 Y143.345 E.94002
G1 X166.732 Y143.106 E.01306
G1 X166.732 Y108.894 E.92703
G1 X166.314 Y109.134 E.01306
G1 X166.314 Y142.866 E.91404
G1 X165.896 Y142.626 E.01306
G1 X165.896 Y109.374 E.90105
G1 X165.477 Y109.613 E.01306
G1 X165.477 Y142.387 E.88805
G1 X165.059 Y142.147 E.01306
G1 X165.059 Y109.853 E.87506
G1 X164.641 Y110.093 E.01306
G1 X164.641 Y141.907 E.86207
G1 X164.223 Y141.667 E.01306
G1 X164.223 Y110.333 E.84908
G1 X163.805 Y110.572 E.01306
G1 X163.805 Y141.428 E.83609
G1 X163.387 Y141.188 E.01306
G1 X163.387 Y110.812 E.82309
G1 X162.968 Y111.052 E.01306
G1 X162.968 Y140.948 E.8101
G1 X162.55 Y140.708 E.01306
G1 X162.55 Y111.292 E.79711
G1 X162.132 Y111.531 E.01306
G1 X162.132 Y140.469 E.78412
G1 X161.714 Y140.229 E.01306
G1 X161.714 Y111.771 E.77113
G1 X161.296 Y112.011 E.01306
G1 X161.296 Y139.989 E.75814
G1 X160.878 Y139.75 E.01306
G1 X160.878 Y112.25 E.74514
G1 X160.459 Y112.49 E.01306
G1 X160.459 Y139.51 E.73215
G1 X160.041 Y139.27 E.01306
G1 X160.041 Y112.73 E.71916
G1 X159.623 Y112.97 E.01306
G1 X159.623 Y139.03 E.70617
G1 X159.205 Y138.791 E.01306
G1 X159.205 Y113.209 E.69318
G1 X158.787 Y113.449 E.01306
G1 X158.787 Y138.551 E.68019
G1 X158.369 Y138.311 E.01306
G1 X158.369 Y113.689 E.66719
G1 X157.951 Y113.929 E.01306
G1 X157.951 Y138.071 E.6542
G1 X157.532 Y137.832 E.01306
G1 X157.532 Y114.168 E.64121
G1 X157.114 Y114.408 E.01306
G1 X157.114 Y137.592 E.62822
G1 X156.696 Y137.352 E.01306
G1 X156.696 Y114.648 E.61523
G1 X156.278 Y114.887 E.01306
G1 X156.278 Y137.113 E.60224
G1 X155.86 Y136.873 E.01306
G1 X155.86 Y115.127 E.58924
G1 X155.442 Y115.367 E.01306
G1 X155.442 Y136.633 E.57625
G1 X155.023 Y136.393 E.01306
G1 X155.023 Y115.607 E.56326
G1 X154.605 Y115.846 E.01306
G1 X154.605 Y136.154 E.55027
G1 X154.187 Y135.914 E.01306
G1 X154.187 Y116.086 E.53728
G1 X153.769 Y116.326 E.01306
G1 X153.769 Y135.674 E.52429
G1 X153.351 Y135.434 E.01306
G1 X153.351 Y116.566 E.51129
G1 X152.933 Y116.805 E.01306
G1 X152.933 Y135.195 E.4983
G1 X152.514 Y134.955 E.01306
G1 X152.514 Y117.045 E.48531
G1 X152.096 Y117.285 E.01306
G1 X152.096 Y134.715 E.47232
G1 X151.678 Y134.476 E.01306
G1 X151.678 Y117.524 E.45933
G1 X151.26 Y117.764 E.01306
G1 X151.26 Y134.236 E.44634
G1 X150.842 Y133.996 E.01306
G1 X150.842 Y118.004 E.43334
G1 X150.424 Y118.244 E.01306
G1 X150.424 Y133.756 E.42035
G1 X150.005 Y133.517 E.01306
G1 X150.005 Y118.268 E.4132
; OBJECT_ID: 381
; WIPE_START
G1 X150.005 Y120.268 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 353
M625
; start printing object, unique label id: 381
M624 BAAAAAAAAAA=
M204 S10000
G1 X155.492 Y125.573 Z.92 F30000
G1 X208.511 Y176.844 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X132.176 Y195.394 E2.12864
G1 X133.124 Y148.039 E1.28343
G1 X145.649 Y140.807 E.39192
G1 X208.459 Y176.815 E1.96178
; WIPE_START
G1 X206.515 Y177.288 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.509 Y177.014 Z.92 F30000
G1 Z.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X131.817 Y195.893 E2.01013
G1 X131.814 Y195.894 E.00006
G1 X131.766 Y195.855 E.00156
G1 F3240
G1 X132.728 Y147.805 E1.20829
G1 X145.649 Y140.345 E.37511
G1 X145.749 Y140.403 E.00292
G1 X209.582 Y176.997 E1.84984
G1 F3600
G1 X209.567 Y177 E.00037
; WIPE_START
M204 S4000
G1 X207.624 Y177.472 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X206.979 Y177.043 Z.92 F30000
G1 Z.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.403 Y176.619 E.01625
G1 X207.029 Y176.405 E.01168
G1 X206.456 Y176.978 E.02196
G1 X205.679 Y177.167 E.02166
G1 X206.655 Y176.191 E.0374
G1 X206.281 Y175.976 E.01168
G1 X204.902 Y177.355 E.05285
G1 X204.125 Y177.544 E.02166
G1 X205.907 Y175.762 E.0683
G1 X205.534 Y175.548 E.01168
G1 X203.348 Y177.733 E.08374
G1 X202.571 Y177.922 E.02166
G1 X205.16 Y175.333 E.09919
G1 X204.786 Y175.119 E.01168
G1 X201.795 Y178.111 E.11464
G1 X201.018 Y178.299 E.02166
G1 X204.412 Y174.905 E.13008
G1 X204.038 Y174.69 E.01168
G1 X200.241 Y178.488 E.14553
G1 X199.464 Y178.677 E.02166
G1 X203.665 Y174.476 E.16098
G1 X203.291 Y174.262 E.01168
G1 X198.687 Y178.866 E.17642
G1 X197.91 Y179.054 E.02166
G1 X202.917 Y174.048 E.19187
G1 X202.543 Y173.833 E.01168
G1 X197.133 Y179.243 E.20732
G1 X196.356 Y179.432 E.02166
G1 X202.169 Y173.619 E.22276
G1 X201.796 Y173.405 E.01168
G1 X195.579 Y179.621 E.23821
G1 X194.802 Y179.81 E.02166
G1 X201.422 Y173.19 E.25366
G1 X201.048 Y172.976 E.01168
G1 X194.026 Y179.998 E.2691
G1 X193.249 Y180.187 E.02166
G1 X200.674 Y172.762 E.28455
G1 X200.3 Y172.547 E.01168
G1 X192.472 Y180.376 E.3
G1 X191.695 Y180.565 E.02166
G1 X199.926 Y172.333 E.31545
G1 X199.553 Y172.119 E.01168
G1 X190.918 Y180.754 E.33089
G1 X190.141 Y180.942 E.02166
G1 X199.179 Y171.905 E.34634
G1 X198.805 Y171.69 E.01168
G1 X189.364 Y181.131 E.36179
G1 X188.587 Y181.32 E.02166
G1 X198.431 Y171.476 E.37723
G1 X198.057 Y171.262 E.01168
G1 X187.81 Y181.509 E.39268
G1 X187.033 Y181.698 E.02166
G1 X197.684 Y171.047 E.40813
G1 X197.31 Y170.833 E.01168
G1 X186.256 Y181.886 E.42357
G1 X185.48 Y182.075 E.02166
G1 X196.936 Y170.619 E.43902
G1 X196.562 Y170.404 E.01168
G1 X184.703 Y182.264 E.45447
G1 X183.926 Y182.453 E.02166
M73 P24 R52
G1 X196.188 Y170.19 E.46991
G1 X195.815 Y169.976 E.01168
G1 X183.149 Y182.641 E.48536
G1 X182.372 Y182.83 E.02166
G1 X195.441 Y169.762 E.50081
G1 X195.067 Y169.547 E.01168
G1 X181.595 Y183.019 E.51625
G1 X180.818 Y183.208 E.02166
G1 X194.693 Y169.333 E.5317
G1 X194.319 Y169.119 E.01168
G1 X180.041 Y183.397 E.54715
G1 X179.264 Y183.585 E.02166
G1 X193.945 Y168.904 E.56259
G1 X193.572 Y168.69 E.01168
G1 X178.487 Y183.774 E.57804
G1 X177.711 Y183.963 E.02166
G1 X193.198 Y168.476 E.59349
G1 X192.824 Y168.261 E.01168
G1 X176.934 Y184.152 E.60893
G1 X176.157 Y184.341 E.02166
G1 X192.45 Y168.047 E.62438
G1 X192.076 Y167.833 E.01168
G1 X175.38 Y184.529 E.63983
G1 X174.603 Y184.718 E.02166
G1 X191.703 Y167.618 E.65527
G1 X191.329 Y167.404 E.01168
G1 X173.826 Y184.907 E.67072
G1 X173.049 Y185.096 E.02166
G1 X190.955 Y167.19 E.68617
G1 X190.581 Y166.976 E.01168
G1 X172.272 Y185.284 E.70161
G1 X171.495 Y185.473 E.02166
G1 X190.207 Y166.761 E.71706
G1 X189.834 Y166.547 E.01168
G1 X170.718 Y185.662 E.73251
G1 X169.942 Y185.851 E.02166
G1 X189.46 Y166.333 E.74796
G1 X189.086 Y166.118 E.01168
G1 X169.165 Y186.04 E.7634
G1 X168.388 Y186.228 E.02166
G1 X188.712 Y165.904 E.77885
G1 X188.338 Y165.69 E.01168
G1 X167.611 Y186.417 E.7943
G1 X166.834 Y186.606 E.02166
G1 X187.964 Y165.475 E.80974
G1 X187.591 Y165.261 E.01168
G1 X166.057 Y186.795 E.82519
G1 X165.28 Y186.984 E.02166
G1 X187.217 Y165.047 E.84064
G1 X186.843 Y164.833 E.01168
G1 X164.503 Y187.172 E.85608
G1 X163.726 Y187.361 E.02166
G1 X186.469 Y164.618 E.87153
G1 X186.095 Y164.404 E.01168
G1 X162.949 Y187.55 E.88698
G1 X162.173 Y187.739 E.02166
G1 X185.722 Y164.19 E.90242
G1 X185.348 Y163.975 E.01168
G1 X161.396 Y187.927 E.91787
G1 X160.619 Y188.116 E.02166
G1 X184.974 Y163.761 E.93332
G1 X184.6 Y163.547 E.01168
G1 X159.842 Y188.305 E.94876
G1 X159.065 Y188.494 E.02166
G1 X184.226 Y163.332 E.96421
G1 X183.853 Y163.118 E.01168
G1 X158.288 Y188.683 E.97966
G1 X157.511 Y188.871 E.02166
G1 X183.479 Y162.904 E.9951
G1 X183.105 Y162.69 E.01168
G1 X156.734 Y189.06 E1.01055
G1 X155.957 Y189.249 E.02166
G1 X182.731 Y162.475 E1.026
G1 X182.357 Y162.261 E.01168
G1 X155.18 Y189.438 E1.04144
G1 X154.404 Y189.627 E.02166
G1 X181.983 Y162.047 E1.05689
G1 X181.61 Y161.832 E.01168
G1 X153.627 Y189.815 E1.07234
G1 X152.85 Y190.004 E.02166
G1 X181.236 Y161.618 E1.08778
G1 X180.862 Y161.404 E.01168
G1 X152.073 Y190.193 E1.10323
G1 X151.296 Y190.382 E.02166
G1 X180.488 Y161.189 E1.11868
G1 X180.114 Y160.975 E.01168
G1 X150.519 Y190.571 E1.13413
G1 X149.742 Y190.759 E.02166
G1 X179.741 Y160.761 E1.14957
G1 X179.367 Y160.547 E.01168
G1 X148.965 Y190.948 E1.16502
G1 X148.188 Y191.137 E.02166
G1 X178.993 Y160.332 E1.18047
G1 X178.619 Y160.118 E.01168
G1 X147.411 Y191.326 E1.19591
G1 X146.634 Y191.514 E.02166
G1 X178.245 Y159.904 E1.21136
G1 X177.871 Y159.689 E.01168
G1 X145.858 Y191.703 E1.22681
G1 X145.081 Y191.892 E.02166
G1 X177.498 Y159.475 E1.24225
G1 X177.124 Y159.261 E.01168
G1 X144.304 Y192.081 E1.2577
G1 X143.527 Y192.27 E.02166
G1 X176.75 Y159.046 E1.27315
G1 X176.376 Y158.832 E.01168
G1 X142.75 Y192.458 E1.28859
G1 X141.973 Y192.647 E.02166
G1 X176.002 Y158.618 E1.30404
G1 X175.629 Y158.404 E.01168
G1 X141.196 Y192.836 E1.31949
G1 X140.419 Y193.025 E.02166
G1 X175.255 Y158.189 E1.33493
G1 X174.881 Y157.975 E.01168
G1 X139.642 Y193.214 E1.35038
G1 X138.865 Y193.402 E.02166
G1 X174.507 Y157.761 E1.36583
G1 X174.133 Y157.546 E.01168
G1 X138.089 Y193.591 E1.38127
G1 X137.312 Y193.78 E.02166
G1 X173.76 Y157.332 E1.39672
G1 X173.386 Y157.118 E.01168
G1 X136.535 Y193.969 E1.41217
G1 X135.758 Y194.157 E.02166
G1 X173.012 Y156.903 E1.42761
G1 X172.638 Y156.689 E.01168
G1 X134.981 Y194.346 E1.44306
G1 X134.204 Y194.535 E.02166
G1 X172.264 Y156.475 E1.45851
G1 X171.89 Y156.261 E.01168
G1 X133.427 Y194.724 E1.47395
G1 X132.65 Y194.913 E.02166
G1 X171.517 Y156.046 E1.4894
G1 X171.143 Y155.832 E.01168
G1 X132.551 Y194.424 E1.47888
G1 X132.563 Y193.824 E.01627
G1 X170.769 Y155.618 E1.46409
G1 X170.395 Y155.403 E.01168
G1 X132.575 Y193.223 E1.44931
G1 X132.587 Y192.623 E.01626
G1 X170.021 Y155.189 E1.43452
G1 X169.648 Y154.975 E.01168
G1 X132.599 Y192.023 E1.41974
G1 X132.611 Y191.423 E.01627
G1 X169.274 Y154.76 E1.40495
G1 X168.9 Y154.546 E.01168
G1 X132.623 Y190.823 E1.39017
G1 X132.635 Y190.223 E.01626
G1 X168.526 Y154.332 E1.37538
G1 X168.152 Y154.117 E.01168
G1 X132.647 Y189.623 E1.3606
G1 X132.659 Y189.023 E.01627
G1 X167.779 Y153.903 E1.34581
G1 X167.405 Y153.689 E.01168
G1 X132.671 Y188.422 E1.33103
G1 X132.683 Y187.822 E.01627
G1 X167.031 Y153.475 E1.31624
G1 X166.657 Y153.26 E.01168
G1 X132.695 Y187.222 E1.30146
G1 X132.707 Y186.622 E.01626
G1 X166.283 Y153.046 E1.28667
G1 X165.909 Y152.832 E.01168
G1 X132.719 Y186.022 E1.27189
G1 X132.731 Y185.422 E.01626
G1 X165.536 Y152.617 E1.2571
G1 X165.162 Y152.403 E.01168
G1 X132.743 Y184.822 E1.24232
G1 X132.755 Y184.222 E.01626
G1 X164.788 Y152.189 E1.22753
G1 X164.414 Y151.974 E.01168
G1 X132.767 Y183.621 E1.21275
G1 X132.779 Y183.021 E.01626
G1 X164.04 Y151.76 E1.19796
G1 X163.667 Y151.546 E.01168
G1 X132.791 Y182.421 E1.18317
G1 X132.803 Y181.821 E.01626
G1 X163.293 Y151.332 E1.16839
G1 X162.919 Y151.117 E.01168
G1 X132.815 Y181.221 E1.1536
G1 X132.827 Y180.621 E.01626
G1 X162.545 Y150.903 E1.13882
G1 X162.171 Y150.689 E.01168
G1 X132.839 Y180.021 E1.12403
G1 X132.851 Y179.421 E.01626
G1 X161.798 Y150.474 E1.10925
G1 X161.424 Y150.26 E.01168
G1 X132.863 Y178.82 E1.09446
G1 X132.875 Y178.22 E.01626
G1 X161.05 Y150.046 E1.07968
M73 P25 R52
G1 X160.676 Y149.831 E.01168
G1 X132.887 Y177.62 E1.06489
G1 X132.899 Y177.02 E.01626
G1 X160.302 Y149.617 E1.05011
G1 X159.928 Y149.403 E.01168
G1 X132.911 Y176.42 E1.03532
G1 X132.923 Y175.82 E.01627
G1 X159.555 Y149.189 E1.02054
G1 X159.181 Y148.974 E.01168
G1 X132.935 Y175.22 E1.00575
G1 X132.947 Y174.62 E.01626
G1 X158.807 Y148.76 E.99097
G1 X158.433 Y148.546 E.01168
G1 X132.959 Y174.019 E.97618
G1 X132.971 Y173.419 E.01626
G1 X158.059 Y148.331 E.9614
G1 X157.686 Y148.117 E.01168
G1 X132.983 Y172.819 E.94661
G1 X132.995 Y172.219 E.01627
G1 X157.312 Y147.903 E.93183
G1 X156.938 Y147.688 E.01168
G1 X133.007 Y171.619 E.91704
G1 X133.019 Y171.019 E.01627
G1 X156.564 Y147.474 E.90226
G1 X156.19 Y147.26 E.01168
G1 X133.031 Y170.419 E.88747
G1 X133.043 Y169.819 E.01626
G1 X155.817 Y147.046 E.87269
G1 X155.443 Y146.831 E.01168
G1 X133.055 Y169.219 E.8579
G1 X133.067 Y168.618 E.01626
G1 X155.069 Y146.617 E.84312
G1 X154.695 Y146.403 E.01168
G1 X133.079 Y168.018 E.82833
G1 X133.091 Y167.418 E.01626
G1 X154.321 Y146.188 E.81355
G1 X153.947 Y145.974 E.01168
G1 X133.103 Y166.818 E.79876
G1 X133.115 Y166.218 E.01627
G1 X153.574 Y145.76 E.78398
G1 X153.2 Y145.545 E.01168
G1 X133.127 Y165.618 E.76919
G1 X133.139 Y165.018 E.01626
G1 X152.826 Y145.331 E.75441
G1 X152.452 Y145.117 E.01168
G1 X133.151 Y164.418 E.73962
G1 X133.163 Y163.817 E.01627
G1 X152.078 Y144.903 E.72484
G1 X151.705 Y144.688 E.01168
G1 X133.175 Y163.217 E.71005
G1 X133.188 Y162.617 E.01626
G1 X151.331 Y144.474 E.69527
G1 X150.957 Y144.26 E.01168
G1 X133.2 Y162.017 E.68048
G1 X133.212 Y161.417 E.01626
G1 X150.583 Y144.045 E.6657
G1 X150.209 Y143.831 E.01168
G1 X133.224 Y160.817 E.65091
G1 X133.236 Y160.217 E.01626
G1 X149.836 Y143.617 E.63613
G1 X149.462 Y143.402 E.01168
G1 X133.248 Y159.617 E.62134
G1 X133.26 Y159.016 E.01626
G1 X149.088 Y143.188 E.60656
G1 X148.714 Y142.974 E.01168
G1 X133.272 Y158.416 E.59177
G1 X133.284 Y157.816 E.01626
G1 X148.34 Y142.76 E.57699
G1 X147.966 Y142.545 E.01168
G1 X133.296 Y157.216 E.5622
G1 X133.308 Y156.616 E.01626
G1 X147.593 Y142.331 E.54742
G1 X147.219 Y142.117 E.01168
G1 X133.32 Y156.016 E.53263
G1 X133.332 Y155.416 E.01626
G1 X146.845 Y141.902 E.51785
G1 X146.471 Y141.688 E.01168
G1 X133.344 Y154.816 E.50306
G1 X133.356 Y154.215 E.01626
G1 X146.097 Y141.474 E.48828
G1 X145.724 Y141.259 E.01168
G1 X133.368 Y153.615 E.47349
G1 X133.38 Y153.015 E.01626
G1 X144.532 Y141.863 E.42737
G1 X143.141 Y142.666 E.04354
G1 X133.392 Y152.415 E.37359
G1 X133.404 Y151.815 E.01627
G1 X141.749 Y143.47 E.3198
G1 X140.358 Y144.273 E.04354
G1 X133.416 Y151.215 E.26602
G1 X133.428 Y150.615 E.01626
G1 X138.966 Y145.076 E.21224
G1 X137.575 Y145.88 E.04354
G1 X133.44 Y150.015 E.15845
G1 X133.452 Y149.414 E.01627
G1 X136.183 Y146.683 E.10467
G1 X134.792 Y147.487 E.04354
G1 X133.273 Y149.005 E.0582
; OBJECT_ID: 409
; WIPE_START
G1 X134.687 Y147.591 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 381
M625
; start printing object, unique label id: 409
M624 CAAAAAAAAAA=
M204 S10000
G1 X127.451 Y150.019 Z.92 F30000
G1 X47.489 Y176.844 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X110.351 Y140.807 E1.96341
G1 X122.876 Y148.039 E.39192
G1 X123.824 Y195.394 E1.28343
G1 X47.548 Y176.859 E2.12701
; WIPE_START
G1 X49.282 Y175.863 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.491 Y177.014 Z.92 F30000
G1 Z.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X46.418 Y176.997 E.00188
G1 F3240
G1 X110.351 Y140.345 E1.85276
G1 X110.452 Y140.403 E.00292
G1 X123.272 Y147.805 E.3722
G1 X124.234 Y195.855 E1.20829
G1 F3600
G1 X124.186 Y195.894 E.00156
G1 X124.183 Y195.893 E.00006
G1 X46.549 Y177.028 E2.00862
; WIPE_START
M204 S4000
G1 X46.418 Y176.997 E-.05118
G1 X48.037 Y176.069 E-.70882
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X49.023 Y177.044 Z.92 F30000
G1 Z.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.598 Y176.619 E.01628
G1 X48.972 Y176.405 E.01168
G1 X49.545 Y176.978 E.02198
G1 X50.322 Y177.167 E.02166
G1 X49.346 Y176.19 E.03743
G1 X49.719 Y175.976 E.01168
G1 X51.099 Y177.356 E.05288
G1 X51.876 Y177.545 E.02166
G1 X50.093 Y175.762 E.06832
G1 X50.467 Y175.547 E.01168
G1 X52.653 Y177.733 E.08377
G1 X53.43 Y177.922 E.02166
G1 X50.841 Y175.333 E.09922
G1 X51.215 Y175.119 E.01168
G1 X54.207 Y178.111 E.11466
G1 X54.984 Y178.3 E.02166
G1 X51.588 Y174.904 E.13011
G1 X51.962 Y174.69 E.01168
G1 X55.761 Y178.488 E.14556
G1 X56.537 Y178.677 E.02166
G1 X52.336 Y174.476 E.161
G1 X52.71 Y174.261 E.01168
G1 X57.314 Y178.866 E.17645
G1 X58.091 Y179.055 E.02166
G1 X53.084 Y174.047 E.1919
G1 X53.457 Y173.833 E.01168
G1 X58.868 Y179.244 E.20734
G1 X59.645 Y179.432 E.02166
G1 X53.831 Y173.619 E.22279
G1 X54.205 Y173.404 E.01168
G1 X60.422 Y179.621 E.23824
G1 X61.199 Y179.81 E.02166
G1 X54.579 Y173.19 E.25368
G1 X54.953 Y172.976 E.01168
G1 X61.976 Y179.999 E.26913
G1 X62.753 Y180.188 E.02166
G1 X55.327 Y172.761 E.28458
G1 X55.7 Y172.547 E.01168
G1 X63.53 Y180.376 E.30002
G1 X64.307 Y180.565 E.02166
G1 X56.074 Y172.333 E.31547
G1 X56.448 Y172.118 E.01168
G1 X65.083 Y180.754 E.33092
G1 X65.86 Y180.943 E.02166
G1 X56.822 Y171.904 E.34637
G1 X57.196 Y171.69 E.01168
G1 X66.637 Y181.131 E.36181
G1 X67.414 Y181.32 E.02166
G1 X57.569 Y171.476 E.37726
G1 X57.943 Y171.261 E.01168
G1 X68.191 Y181.509 E.39271
G1 X68.968 Y181.698 E.02166
G1 X58.317 Y171.047 E.40815
G1 X58.691 Y170.833 E.01168
G1 X69.745 Y181.887 E.4236
G1 X70.522 Y182.075 E.02166
G1 X59.065 Y170.618 E.43905
G1 X59.438 Y170.404 E.01168
G1 X71.299 Y182.264 E.45449
G1 X72.076 Y182.453 E.02166
G1 X59.812 Y170.19 E.46994
G1 X60.186 Y169.975 E.01168
G1 X72.852 Y182.642 E.48539
G1 X73.629 Y182.831 E.02166
G1 X60.56 Y169.761 E.50083
G1 X60.934 Y169.547 E.01168
G1 X74.406 Y183.019 E.51628
G1 X75.183 Y183.208 E.02166
G1 X61.308 Y169.333 E.53173
G1 X61.681 Y169.118 E.01168
G1 X75.96 Y183.397 E.54717
G1 X76.737 Y183.586 E.02166
G1 X62.055 Y168.904 E.56262
G1 X62.429 Y168.69 E.01168
G1 X77.514 Y183.774 E.57807
G1 X78.291 Y183.963 E.02166
G1 X62.803 Y168.475 E.59351
G1 X63.177 Y168.261 E.01168
G1 X79.068 Y184.152 E.60896
G1 X79.845 Y184.341 E.02166
G1 X63.55 Y168.047 E.62441
G1 X63.924 Y167.832 E.01168
G1 X80.621 Y184.53 E.63985
G1 X81.398 Y184.718 E.02166
G1 X64.298 Y167.618 E.6553
G1 X64.672 Y167.404 E.01168
G1 X82.175 Y184.907 E.67075
G1 X82.952 Y185.096 E.02166
G1 X65.046 Y167.19 E.68619
G1 X65.419 Y166.975 E.01168
G1 X83.729 Y185.285 E.70164
G1 X84.506 Y185.474 E.02166
G1 X65.793 Y166.761 E.71709
G1 X66.167 Y166.547 E.01168
G1 X85.283 Y185.662 E.73253
G1 X86.06 Y185.851 E.02166
G1 X66.541 Y166.332 E.74798
G1 X66.915 Y166.118 E.01168
G1 X86.837 Y186.04 E.76343
G1 X87.614 Y186.229 E.02166
G1 X67.289 Y165.904 E.77888
G1 X67.662 Y165.689 E.01168
G1 X88.39 Y186.418 E.79432
G1 X89.167 Y186.606 E.02166
G1 X68.036 Y165.475 E.80977
G1 X68.41 Y165.261 E.01168
G1 X89.944 Y186.795 E.82522
G1 X90.721 Y186.984 E.02166
G1 X68.784 Y165.047 E.84066
G1 X69.158 Y164.832 E.01168
G1 X91.498 Y187.173 E.85611
G1 X92.275 Y187.361 E.02166
G1 X69.531 Y164.618 E.87156
G1 X69.905 Y164.404 E.01168
G1 X93.052 Y187.55 E.887
G1 X93.829 Y187.739 E.02166
G1 X70.279 Y164.189 E.90245
G1 X70.653 Y163.975 E.01168
G1 X94.606 Y187.928 E.9179
G1 X95.383 Y188.117 E.02166
G1 X71.027 Y163.761 E.93334
G1 X71.401 Y163.546 E.01168
G1 X96.159 Y188.305 E.94879
G1 X96.936 Y188.494 E.02166
G1 X71.774 Y163.332 E.96424
G1 X72.148 Y163.118 E.01168
G1 X97.713 Y188.683 E.97968
G1 X98.49 Y188.872 E.02166
G1 X72.522 Y162.904 E.99513
G1 X72.896 Y162.689 E.01168
G1 X99.267 Y189.061 E1.01058
G1 X100.044 Y189.249 E.02166
G1 X73.27 Y162.475 E1.02602
G1 X73.643 Y162.261 E.01168
G1 X100.821 Y189.438 E1.04147
G1 X101.598 Y189.627 E.02166
G1 X74.017 Y162.046 E1.05692
G1 X74.391 Y161.832 E.01168
G1 X102.375 Y189.816 E1.07236
G1 X103.152 Y190.004 E.02166
G1 X74.765 Y161.618 E1.08781
G1 X75.139 Y161.403 E.01168
G1 X103.929 Y190.193 E1.10326
G1 X104.705 Y190.382 E.02166
G1 X75.512 Y161.189 E1.1187
G1 X75.886 Y160.975 E.01168
G1 X105.482 Y190.571 E1.13415
G1 X106.259 Y190.76 E.02166
G1 X76.26 Y160.76 E1.1496
G1 X76.634 Y160.546 E.01168
G1 X107.036 Y190.948 E1.16504
G1 X107.813 Y191.137 E.02166
G1 X77.008 Y160.332 E1.18049
G1 X77.382 Y160.118 E.01168
G1 X108.59 Y191.326 E1.19594
G1 X109.367 Y191.515 E.02166
G1 X77.755 Y159.903 E1.21139
G1 X78.129 Y159.689 E.01168
G1 X110.144 Y191.704 E1.22683
G1 X110.921 Y191.892 E.02166
G1 X78.503 Y159.475 E1.24228
G1 X78.877 Y159.26 E.01168
G1 X111.698 Y192.081 E1.25773
G1 X112.474 Y192.27 E.02166
G1 X79.251 Y159.046 E1.27317
G1 X79.624 Y158.832 E.01168
G1 X113.251 Y192.459 E1.28862
G1 X114.028 Y192.647 E.02166
G1 X79.998 Y158.617 E1.30407
G1 X80.372 Y158.403 E.01168
G1 X114.805 Y192.836 E1.31951
G1 X115.582 Y193.025 E.02166
G1 X80.746 Y158.189 E1.33496
G1 X81.12 Y157.975 E.01168
G1 X116.359 Y193.214 E1.35041
G1 X117.136 Y193.403 E.02166
G1 X81.493 Y157.76 E1.36585
G1 X81.867 Y157.546 E.01168
G1 X117.913 Y193.591 E1.3813
G1 X118.69 Y193.78 E.02166
G1 X82.241 Y157.332 E1.39675
G1 X82.615 Y157.117 E.01168
G1 X119.467 Y193.969 E1.41219
G1 X120.243 Y194.158 E.02166
G1 X82.989 Y156.903 E1.42764
G1 X83.363 Y156.689 E.01168
G1 X121.02 Y194.347 E1.44309
G1 X121.797 Y194.535 E.02166
G1 X83.736 Y156.474 E1.45853
G1 X84.11 Y156.26 E.01168
G1 X122.574 Y194.724 E1.47398
G1 X123.351 Y194.913 E.02166
G1 X84.484 Y156.046 E1.48943
G1 X84.858 Y155.832 E.01168
G1 X123.449 Y194.423 E1.47885
G1 X123.437 Y193.823 E.01626
G1 X85.232 Y155.617 E1.46407
G1 X85.605 Y155.403 E.01168
G1 X123.425 Y193.222 E1.44928
G1 X123.413 Y192.622 E.01626
G1 X85.979 Y155.189 E1.4345
G1 X86.353 Y154.974 E.01168
G1 X123.401 Y192.022 E1.41971
G1 X123.389 Y191.422 E.01626
G1 X86.727 Y154.76 E1.40493
G1 X87.101 Y154.546 E.01168
G1 X123.377 Y190.822 E1.39014
G1 X123.365 Y190.222 E.01626
G1 X87.474 Y154.331 E1.37536
G1 X87.848 Y154.117 E.01168
G1 X123.353 Y189.622 E1.36057
G1 X123.341 Y189.022 E.01626
G1 X88.222 Y153.903 E1.34579
G1 X88.596 Y153.689 E.01168
G1 X123.329 Y188.421 E1.331
G1 X123.317 Y187.821 E.01626
G1 X88.97 Y153.474 E1.31622
G1 X89.344 Y153.26 E.01168
G1 X123.305 Y187.221 E1.30143
G1 X123.293 Y186.621 E.01626
G1 X89.717 Y153.046 E1.28665
G1 X90.091 Y152.831 E.01168
G1 X123.281 Y186.021 E1.27186
G1 X123.269 Y185.421 E.01627
G1 X90.465 Y152.617 E1.25708
G1 X90.839 Y152.403 E.01168
G1 X123.257 Y184.821 E1.24229
G1 X123.245 Y184.221 E.01626
G1 X91.213 Y152.188 E1.22751
M73 P25 R51
G1 X91.586 Y151.974 E.01168
G1 X123.233 Y183.62 E1.21272
G1 X123.221 Y183.02 E.01627
G1 X91.96 Y151.76 E1.19793
G1 X92.334 Y151.546 E.01168
G1 X123.209 Y182.42 E1.18315
G1 X123.197 Y181.82 E.01626
G1 X92.708 Y151.331 E1.16837
G1 X93.082 Y151.117 E.01168
G1 X123.185 Y181.22 E1.15358
G1 X123.173 Y180.62 E.01627
G1 X93.455 Y150.903 E1.1388
G1 X93.829 Y150.688 E.01168
G1 X123.161 Y180.02 E1.12401
M73 P26 R51
G1 X123.149 Y179.42 E.01627
G1 X94.203 Y150.474 E1.10922
G1 X94.577 Y150.26 E.01168
G1 X123.137 Y178.819 E1.09444
G1 X123.125 Y178.219 E.01626
G1 X94.951 Y150.045 E1.07965
G1 X95.325 Y149.831 E.01168
G1 X123.113 Y177.619 E1.06487
G1 X123.101 Y177.019 E.01626
G1 X95.698 Y149.617 E1.05008
G1 X96.072 Y149.402 E.01168
G1 X123.089 Y176.419 E1.0353
G1 X123.077 Y175.819 E.01626
G1 X96.446 Y149.188 E1.02051
G1 X96.82 Y148.974 E.01168
G1 X123.065 Y175.219 E1.00573
G1 X123.053 Y174.619 E.01626
G1 X97.194 Y148.76 E.99094
G1 X97.567 Y148.545 E.01168
G1 X123.041 Y174.018 E.97616
G1 X123.029 Y173.418 E.01626
G1 X97.941 Y148.331 E.96137
G1 X98.315 Y148.117 E.01168
G1 X123.017 Y172.818 E.94659
G1 X123.005 Y172.218 E.01626
G1 X98.689 Y147.902 E.9318
G1 X99.063 Y147.688 E.01168
G1 X122.993 Y171.618 E.91702
G1 X122.981 Y171.018 E.01627
G1 X99.436 Y147.474 E.90223
G1 X99.81 Y147.259 E.01168
G1 X122.969 Y170.418 E.88745
G1 X122.957 Y169.818 E.01626
G1 X100.184 Y147.045 E.87266
G1 X100.558 Y146.831 E.01168
G1 X122.945 Y169.218 E.85788
G1 X122.933 Y168.617 E.01626
G1 X100.932 Y146.617 E.84309
G1 X101.306 Y146.402 E.01168
G1 X122.921 Y168.017 E.82831
G1 X122.909 Y167.417 E.01627
G1 X101.679 Y146.188 E.81352
G1 X102.053 Y145.974 E.01168
G1 X122.897 Y166.817 E.79874
G1 X122.885 Y166.217 E.01626
G1 X102.427 Y145.759 E.78395
G1 X102.801 Y145.545 E.01168
G1 X122.873 Y165.617 E.76917
G1 X122.861 Y165.017 E.01626
G1 X103.175 Y145.331 E.75438
G1 X103.548 Y145.116 E.01168
G1 X122.849 Y164.417 E.7396
G1 X122.836 Y163.816 E.01627
G1 X103.922 Y144.902 E.72481
G1 X104.296 Y144.688 E.01168
G1 X122.824 Y163.216 E.71003
G1 X122.812 Y162.616 E.01627
G1 X104.67 Y144.474 E.69524
G1 X105.044 Y144.259 E.01168
G1 X122.8 Y162.016 E.68046
G1 X122.788 Y161.416 E.01626
G1 X105.417 Y144.045 E.66567
G1 X105.791 Y143.831 E.01168
G1 X122.776 Y160.816 E.65089
G1 X122.764 Y160.216 E.01626
G1 X106.165 Y143.616 E.6361
G1 X106.539 Y143.402 E.01168
G1 X122.752 Y159.616 E.62132
G1 X122.74 Y159.015 E.01627
G1 X106.913 Y143.188 E.60653
G1 X107.287 Y142.973 E.01168
G1 X122.728 Y158.415 E.59175
G1 X122.716 Y157.815 E.01627
G1 X107.66 Y142.759 E.57696
G1 X108.034 Y142.545 E.01168
G1 X122.704 Y157.215 E.56218
G1 X122.692 Y156.615 E.01626
G1 X108.408 Y142.331 E.54739
G1 X108.782 Y142.116 E.01168
G1 X122.68 Y156.015 E.53261
G1 X122.668 Y155.415 E.01627
G1 X109.156 Y141.902 E.51782
G1 X109.529 Y141.688 E.01168
G1 X122.656 Y154.815 E.50304
G1 X122.644 Y154.214 E.01626
G1 X109.903 Y141.473 E.48825
G1 X110.277 Y141.259 E.01168
G1 X122.632 Y153.614 E.47347
G1 X122.62 Y153.014 E.01626
G1 X111.47 Y141.864 E.42728
G1 X112.862 Y142.668 E.04354
G1 X122.608 Y152.414 E.3735
G1 X122.596 Y151.814 E.01626
G1 X114.253 Y143.471 E.31971
G1 X115.645 Y144.274 E.04354
G1 X122.584 Y151.214 E.26593
G1 X122.572 Y150.614 E.01626
G1 X117.036 Y145.078 E.21215
G1 X118.428 Y145.881 E.04354
G1 X122.56 Y150.014 E.15836
G1 X122.548 Y149.413 E.01626
G1 X119.819 Y146.684 E.10458
G1 X121.211 Y147.488 E.04354
G1 X122.727 Y149.004 E.05811
; OBJECT_ID: 437
; WIPE_START
G1 X121.313 Y147.59 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 409
M625
; start printing object, unique label id: 437
M624 EAAAAAAAAAA=
M204 S10000
G1 X115.865 Y142.245 Z.92 F30000
G1 X47.489 Y75.156 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X123.824 Y56.606 E2.12864
G1 X122.876 Y103.961 E1.28343
G1 X110.351 Y111.193 E.39192
G1 X47.541 Y75.185 E1.96178
; WIPE_START
G1 X49.485 Y74.712 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.491 Y74.986 Z.92 F30000
G1 Z.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X124.183 Y56.107 E2.01013
G1 X124.186 Y56.106 E.00006
G1 X124.234 Y56.145 E.00156
G1 F3240
G1 X123.272 Y104.195 E1.20829
G1 X110.351 Y111.655 E.37511
G1 X46.418 Y75.003 E1.85276
G1 F3600
G1 X46.433 Y75 E.00037
; WIPE_START
M204 S4000
G1 X48.376 Y74.528 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.461 Y75.518 Z.92 F30000
G1 Z.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.768 Y75.211 E.01179
G1 X49.545 Y75.022 E.02166
G1 X48.972 Y75.595 E.02198
G1 X49.346 Y75.81 E.01168
G1 X50.322 Y74.833 E.03743
G1 X51.099 Y74.644 E.02166
G1 X49.719 Y76.024 E.05288
G1 X50.093 Y76.238 E.01168
G1 X51.876 Y74.456 E.06832
G1 X52.653 Y74.267 E.02166
G1 X50.467 Y76.453 E.08377
G1 X50.841 Y76.667 E.01168
G1 X53.43 Y74.078 E.09922
G1 X54.207 Y73.889 E.02166
G1 X51.215 Y76.881 E.11466
G1 X51.588 Y77.096 E.01168
G1 X54.984 Y73.7 E.13011
G1 X55.761 Y73.512 E.02166
G1 X51.962 Y77.31 E.14556
G1 X52.336 Y77.524 E.01168
G1 X56.537 Y73.323 E.161
G1 X57.314 Y73.134 E.02166
G1 X52.71 Y77.738 E.17645
G1 X53.084 Y77.953 E.01168
G1 X58.091 Y72.945 E.1919
G1 X58.868 Y72.756 E.02166
G1 X53.457 Y78.167 E.20734
G1 X53.831 Y78.381 E.01168
G1 X59.645 Y72.568 E.22279
G1 X60.422 Y72.379 E.02166
G1 X54.205 Y78.596 E.23824
G1 X54.579 Y78.81 E.01168
G1 X61.199 Y72.19 E.25368
G1 X61.976 Y72.001 E.02166
G1 X54.953 Y79.024 E.26913
G1 X55.327 Y79.239 E.01168
G1 X62.753 Y71.812 E.28458
G1 X63.53 Y71.624 E.02166
G1 X55.7 Y79.453 E.30002
G1 X56.074 Y79.667 E.01168
G1 X64.306 Y71.435 E.31547
G1 X65.083 Y71.246 E.02166
G1 X56.448 Y79.882 E.33092
G1 X56.822 Y80.096 E.01168
G1 X65.86 Y71.057 E.34636
G1 X66.637 Y70.869 E.02166
G1 X57.196 Y80.31 E.36181
G1 X57.569 Y80.524 E.01168
G1 X67.414 Y70.68 E.37726
G1 X68.191 Y70.491 E.02166
G1 X57.943 Y80.739 E.3927
G1 X58.317 Y80.953 E.01168
G1 X68.968 Y70.302 E.40815
G1 X69.745 Y70.113 E.02166
G1 X58.691 Y81.167 E.4236
G1 X59.065 Y81.382 E.01168
G1 X70.522 Y69.925 E.43904
G1 X71.299 Y69.736 E.02166
G1 X59.438 Y81.596 E.45449
G1 X59.812 Y81.81 E.01168
G1 X72.075 Y69.547 E.46994
G1 X72.852 Y69.358 E.02166
G1 X60.186 Y82.025 E.48539
G1 X60.56 Y82.239 E.01168
G1 X73.629 Y69.169 E.50083
G1 X74.406 Y68.981 E.02166
G1 X60.934 Y82.453 E.51628
G1 X61.308 Y82.667 E.01168
G1 X75.183 Y68.792 E.53173
G1 X75.96 Y68.603 E.02166
G1 X61.681 Y82.882 E.54717
G1 X62.055 Y83.096 E.01168
G1 X76.737 Y68.414 E.56262
G1 X77.514 Y68.226 E.02166
G1 X62.429 Y83.31 E.57807
G1 X62.803 Y83.525 E.01168
G1 X78.291 Y68.037 E.59351
G1 X79.068 Y67.848 E.02166
G1 X63.177 Y83.739 E.60896
G1 X63.55 Y83.953 E.01168
G1 X79.845 Y67.659 E.62441
G1 X80.621 Y67.47 E.02166
G1 X63.924 Y84.168 E.63985
G1 X64.298 Y84.382 E.01168
G1 X81.398 Y67.282 E.6553
G1 X82.175 Y67.093 E.02166
G1 X64.672 Y84.596 E.67075
G1 X65.046 Y84.81 E.01168
G1 X82.952 Y66.904 E.68619
G1 X83.729 Y66.715 E.02166
G1 X65.419 Y85.025 E.70164
G1 X65.793 Y85.239 E.01168
G1 X84.506 Y66.526 E.71709
G1 X85.283 Y66.338 E.02166
G1 X66.167 Y85.453 E.73253
G1 X66.541 Y85.668 E.01168
G1 X86.06 Y66.149 E.74798
G1 X86.837 Y65.96 E.02166
G1 X66.915 Y85.882 E.76343
G1 X67.289 Y86.096 E.01168
G1 X87.614 Y65.771 E.77887
G1 X88.39 Y65.583 E.02166
G1 X67.662 Y86.311 E.79432
G1 X68.036 Y86.525 E.01168
G1 X89.167 Y65.394 E.80977
G1 X89.944 Y65.205 E.02166
G1 X68.41 Y86.739 E.82521
G1 X68.784 Y86.953 E.01168
G1 X90.721 Y65.016 E.84066
G1 X91.498 Y64.827 E.02166
G1 X69.158 Y87.168 E.85611
G1 X69.531 Y87.382 E.01168
G1 X92.275 Y64.639 E.87155
G1 X93.052 Y64.45 E.02166
G1 X69.905 Y87.596 E.887
G1 X70.279 Y87.811 E.01168
G1 X93.829 Y64.261 E.90245
G1 X94.606 Y64.072 E.02166
G1 X70.653 Y88.025 E.9179
G1 X71.027 Y88.239 E.01168
G1 X95.383 Y63.883 E.93334
G1 X96.159 Y63.695 E.02166
G1 X71.4 Y88.454 E.94879
G1 X71.774 Y88.668 E.01168
G1 X96.936 Y63.506 E.96424
G1 X97.713 Y63.317 E.02166
G1 X72.148 Y88.882 E.97968
G1 X72.522 Y89.096 E.01168
G1 X98.49 Y63.128 E.99513
G1 X99.267 Y62.939 E.02166
G1 X72.896 Y89.311 E1.01058
G1 X73.27 Y89.525 E.01168
G1 X100.044 Y62.751 E1.02602
G1 X100.821 Y62.562 E.02166
G1 X73.643 Y89.739 E1.04147
G1 X74.017 Y89.954 E.01168
G1 X101.598 Y62.373 E1.05692
G1 X102.375 Y62.184 E.02166
G1 X74.391 Y90.168 E1.07236
G1 X74.765 Y90.382 E.01168
G1 X103.152 Y61.996 E1.08781
G1 X103.928 Y61.807 E.02166
G1 X75.139 Y90.597 E1.10326
G1 X75.512 Y90.811 E.01168
G1 X104.705 Y61.618 E1.1187
G1 X105.482 Y61.429 E.02166
G1 X75.886 Y91.025 E1.13415
G1 X76.26 Y91.24 E.01168
G1 X106.259 Y61.24 E1.1496
G1 X107.036 Y61.052 E.02166
G1 X76.634 Y91.454 E1.16504
G1 X77.008 Y91.668 E.01168
G1 X107.813 Y60.863 E1.18049
G1 X108.59 Y60.674 E.02166
G1 X77.381 Y91.882 E1.19594
G1 X77.755 Y92.097 E.01168
G1 X109.367 Y60.485 E1.21138
G1 X110.144 Y60.296 E.02166
G1 X78.129 Y92.311 E1.22683
G1 X78.503 Y92.525 E.01168
G1 X110.921 Y60.108 E1.24228
G1 X111.697 Y59.919 E.02166
G1 X78.877 Y92.74 E1.25772
G1 X79.251 Y92.954 E.01168
G1 X112.474 Y59.73 E1.27317
G1 X113.251 Y59.541 E.02166
G1 X79.624 Y93.168 E1.28862
G1 X79.998 Y93.383 E.01168
G1 X114.028 Y59.353 E1.30407
G1 X114.805 Y59.164 E.02166
G1 X80.372 Y93.597 E1.31951
G1 X80.746 Y93.811 E.01168
G1 X115.582 Y58.975 E1.33496
G1 X116.359 Y58.786 E.02166
G1 X81.12 Y94.025 E1.35041
G1 X81.493 Y94.24 E.01168
G1 X117.136 Y58.597 E1.36585
G1 X117.913 Y58.409 E.02166
G1 X81.867 Y94.454 E1.3813
G1 X82.241 Y94.668 E.01168
G1 X118.69 Y58.22 E1.39675
G1 X119.467 Y58.031 E.02166
G1 X82.615 Y94.883 E1.41219
G1 X82.989 Y95.097 E.01168
G1 X120.243 Y57.842 E1.42764
G1 X121.02 Y57.653 E.02166
G1 X83.363 Y95.311 E1.44309
G1 X83.736 Y95.526 E.01168
G1 X121.797 Y57.465 E1.45853
G1 X122.574 Y57.276 E.02166
G1 X84.11 Y95.74 E1.47398
G1 X84.484 Y95.954 E.01168
G1 X123.351 Y57.087 E1.48943
G1 X123.459 Y57.061 E.00302
G1 X123.449 Y57.577 E.014
G1 X84.858 Y96.168 E1.47885
G1 X85.232 Y96.383 E.01168
G1 X123.437 Y58.177 E1.46407
G1 X123.425 Y58.778 E.01626
G1 X85.605 Y96.597 E1.44928
G1 X85.979 Y96.811 E.01168
G1 X123.413 Y59.378 E1.4345
G1 X123.401 Y59.978 E.01626
G1 X86.353 Y97.026 E1.41971
G1 X86.727 Y97.24 E.01168
G1 X123.389 Y60.578 E1.40493
G1 X123.377 Y61.178 E.01627
G1 X87.101 Y97.454 E1.39014
G1 X87.474 Y97.669 E.01168
G1 X123.365 Y61.778 E1.37536
G1 X123.353 Y62.378 E.01626
G1 X87.848 Y97.883 E1.36057
G1 X88.222 Y98.097 E.01168
G1 X123.341 Y62.978 E1.34579
G1 X123.329 Y63.579 E.01626
G1 X88.596 Y98.311 E1.331
G1 X88.97 Y98.526 E.01168
G1 X123.317 Y64.179 E1.31622
G1 X123.305 Y64.779 E.01626
G1 X89.344 Y98.74 E1.30143
G1 X89.717 Y98.954 E.01168
G1 X123.293 Y65.379 E1.28665
G1 X123.281 Y65.979 E.01626
G1 X90.091 Y99.169 E1.27186
G1 X90.465 Y99.383 E.01168
G1 X123.269 Y66.579 E1.25708
G1 X123.257 Y67.179 E.01627
G1 X90.839 Y99.597 E1.24229
G1 X91.213 Y99.812 E.01168
G1 X123.245 Y67.779 E1.22751
G1 X123.233 Y68.38 E.01626
G1 X91.586 Y100.026 E1.21272
G1 X91.96 Y100.24 E.01168
G1 X123.221 Y68.98 E1.19794
G1 X123.209 Y69.58 E.01626
M73 P27 R51
G1 X92.334 Y100.454 E1.18315
G1 X92.708 Y100.669 E.01168
G1 X123.197 Y70.18 E1.16837
G1 X123.185 Y70.78 E.01626
G1 X93.082 Y100.883 E1.15358
G1 X93.455 Y101.097 E.01168
G1 X123.173 Y71.38 E1.1388
G1 X123.161 Y71.98 E.01627
G1 X93.829 Y101.312 E1.12401
G1 X94.203 Y101.526 E.01168
G1 X123.149 Y72.58 E1.10923
G1 X123.137 Y73.181 E.01627
G1 X94.577 Y101.74 E1.09444
G1 X94.951 Y101.955 E.01168
G1 X123.125 Y73.781 E1.07966
G1 X123.113 Y74.381 E.01626
G1 X95.325 Y102.169 E1.06487
G1 X95.698 Y102.383 E.01168
G1 X123.101 Y74.981 E1.05008
G1 X123.089 Y75.581 E.01626
G1 X96.072 Y102.597 E1.0353
G1 X96.446 Y102.812 E.01168
G1 X123.077 Y76.181 E1.02052
G1 X123.065 Y76.781 E.01627
G1 X96.82 Y103.026 E1.00573
G1 X97.194 Y103.24 E.01168
G1 X123.053 Y77.381 E.99095
G1 X123.041 Y77.981 E.01626
G1 X97.567 Y103.455 E.97616
G1 X97.941 Y103.669 E.01168
G1 X123.029 Y78.582 E.96137
G1 X123.017 Y79.182 E.01626
G1 X98.315 Y103.883 E.94659
G1 X98.689 Y104.098 E.01168
G1 X123.005 Y79.782 E.9318
G1 X122.993 Y80.382 E.01626
G1 X99.063 Y104.312 E.91702
G1 X99.436 Y104.526 E.01168
G1 X122.981 Y80.982 E.90223
G1 X122.969 Y81.582 E.01626
G1 X99.81 Y104.741 E.88745
G1 X100.184 Y104.955 E.01168
G1 X122.957 Y82.182 E.87266
G1 X122.945 Y82.782 E.01626
G1 X100.558 Y105.169 E.85788
G1 X100.932 Y105.383 E.01168
G1 X122.933 Y83.383 E.84309
G1 X122.921 Y83.983 E.01626
G1 X101.306 Y105.598 E.82831
G1 X101.679 Y105.812 E.01168
G1 X122.909 Y84.583 E.81352
G1 X122.897 Y85.183 E.01627
G1 X102.053 Y106.026 E.79874
G1 X102.427 Y106.241 E.01168
G1 X122.885 Y85.783 E.78395
G1 X122.873 Y86.383 E.01626
G1 X102.801 Y106.455 E.76917
G1 X103.175 Y106.669 E.01168
G1 X122.861 Y86.983 E.75438
G1 X122.849 Y87.583 E.01626
G1 X103.548 Y106.884 E.7396
G1 X103.922 Y107.098 E.01168
G1 X122.836 Y88.184 E.72481
G1 X122.824 Y88.784 E.01627
G1 X104.296 Y107.312 E.71003
G1 X104.67 Y107.526 E.01168
G1 X122.812 Y89.384 E.69524
G1 X122.8 Y89.984 E.01627
G1 X105.044 Y107.741 E.68046
G1 X105.417 Y107.955 E.01168
G1 X122.788 Y90.584 E.66567
G1 X122.776 Y91.184 E.01626
G1 X105.791 Y108.169 E.65089
G1 X106.165 Y108.384 E.01168
G1 X122.764 Y91.784 E.6361
G1 X122.752 Y92.384 E.01626
G1 X106.539 Y108.598 E.62132
G1 X106.913 Y108.812 E.01168
G1 X122.74 Y92.985 E.60653
G1 X122.728 Y93.585 E.01626
G1 X107.287 Y109.027 E.59175
G1 X107.66 Y109.241 E.01168
G1 X122.716 Y94.185 E.57696
G1 X122.704 Y94.785 E.01627
G1 X108.034 Y109.455 E.56218
G1 X108.408 Y109.669 E.01168
G1 X122.692 Y95.385 E.54739
G1 X122.68 Y95.985 E.01626
G1 X108.782 Y109.884 E.53261
G1 X109.156 Y110.098 E.01168
G1 X122.668 Y96.585 E.51782
G1 X122.656 Y97.185 E.01626
G1 X109.529 Y110.312 E.50304
G1 X109.903 Y110.527 E.01168
G1 X122.644 Y97.786 E.48825
G1 X122.632 Y98.386 E.01626
G1 X110.277 Y110.741 E.47347
G1 X110.35 Y110.783 E.00227
G1 X111.47 Y110.136 E.03506
G1 X122.62 Y98.986 E.42728
G1 X122.608 Y99.586 E.01626
G1 X112.862 Y109.332 E.3735
G1 X114.253 Y108.529 E.04354
G1 X122.596 Y100.186 E.31971
G1 X122.584 Y100.786 E.01626
G1 X115.645 Y107.726 E.26593
G1 X117.036 Y106.922 E.04354
G1 X122.572 Y101.386 E.21215
G1 X122.56 Y101.986 E.01626
G1 X118.428 Y106.119 E.15836
G1 X119.819 Y105.316 E.04354
G1 X122.548 Y102.587 E.10458
G1 X122.536 Y103.187 E.01626
G1 X120.7 Y105.023 E.07038
; OBJECT_ID: 465
; WIPE_START
G1 X122.114 Y103.609 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 437
M625
; start printing object, unique label id: 465
M624 IAAAAAAAAAA=
M204 S10000
G1 X116.244 Y108.488 Z.92 F30000
G1 X40.405 Y171.528 Z.92
G1 Z.52
M73 P27 R50
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X40.405 Y80.472 E2.46736
G1 X106.352 Y118.278 E2.0598
G1 X106.352 Y133.722 E.41847
G1 X40.457 Y171.498 E2.05817
M204 S10000
G1 X40.004 Y172.161 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X40.004 Y79.839 E2.32108
G1 X40.004 Y79.78 E.00149
G1 F3240
G1 X106.753 Y118.046 E1.93436
G1 X106.753 Y133.954 E.39994
G1 X40.005 Y172.219 E1.93434
; WIPE_START
M204 S4000
G1 X40.005 Y170.219 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.684 Y166.526 Z.92 F30000
G1 X105.995 Y133.732 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X105.995 Y118.484 E.41318
G1 X105.577 Y118.244 E.01306
G1 X105.577 Y133.756 E.42033
G1 X105.159 Y133.996 E.01306
G1 X105.159 Y118.004 E.43333
G1 X104.741 Y117.764 E.01306
G1 X104.741 Y134.236 E.44632
G1 X104.322 Y134.475 E.01306
G1 X104.322 Y117.525 E.45931
G1 X103.904 Y117.285 E.01306
G1 X103.904 Y134.715 E.4723
G1 X103.486 Y134.955 E.01306
G1 X103.486 Y117.045 E.48529
G1 X103.068 Y116.806 E.01306
G1 X103.068 Y135.194 E.49828
G1 X102.65 Y135.434 E.01306
G1 X102.65 Y116.566 E.51128
G1 X102.232 Y116.326 E.01306
G1 X102.232 Y135.674 E.52427
G1 X101.814 Y135.914 E.01306
G1 X101.814 Y116.086 E.53726
G1 X101.395 Y115.847 E.01306
G1 X101.395 Y136.153 E.55025
G1 X100.977 Y136.393 E.01306
G1 X100.977 Y115.607 E.56324
G1 X100.559 Y115.367 E.01306
G1 X100.559 Y136.633 E.57623
G1 X100.141 Y136.873 E.01306
G1 X100.141 Y115.127 E.58923
G1 X99.723 Y114.888 E.01306
G1 X99.723 Y137.112 E.60222
G1 X99.305 Y137.352 E.01306
G1 X99.305 Y114.648 E.61521
G1 X98.886 Y114.408 E.01306
G1 X98.886 Y137.592 E.6282
G1 X98.468 Y137.831 E.01306
G1 X98.468 Y114.169 E.64119
G1 X98.05 Y113.929 E.01306
G1 X98.05 Y138.071 E.65418
G1 X97.632 Y138.311 E.01306
G1 X97.632 Y113.689 E.66718
G1 X97.214 Y113.449 E.01306
G1 X97.214 Y138.551 E.68017
G1 X96.796 Y138.79 E.01306
G1 X96.796 Y113.21 E.69316
G1 X96.377 Y112.97 E.01306
G1 X96.377 Y139.03 E.70615
G1 X95.959 Y139.27 E.01306
G1 X95.959 Y112.73 E.71914
G1 X95.541 Y112.491 E.01306
G1 X95.541 Y139.509 E.73213
G1 X95.123 Y139.749 E.01306
G1 X95.123 Y112.251 E.74513
G1 X94.705 Y112.011 E.01306
G1 X94.705 Y139.989 E.75812
G1 X94.287 Y140.229 E.01306
G1 X94.287 Y111.771 E.77111
G1 X93.868 Y111.532 E.01306
G1 X93.868 Y140.468 E.7841
G1 X93.45 Y140.708 E.01306
G1 X93.45 Y111.292 E.79709
G1 X93.032 Y111.052 E.01306
G1 X93.032 Y140.948 E.81009
G1 X92.614 Y141.188 E.01306
G1 X92.614 Y110.812 E.82308
G1 X92.196 Y110.573 E.01306
G1 X92.196 Y141.427 E.83607
G1 X91.778 Y141.667 E.01306
G1 X91.778 Y110.333 E.84906
G1 X91.36 Y110.093 E.01306
G1 X91.36 Y141.907 E.86205
G1 X90.941 Y142.146 E.01306
G1 X90.941 Y109.854 E.87504
G1 X90.523 Y109.614 E.01306
G1 X90.523 Y142.386 E.88804
G1 X90.105 Y142.626 E.01306
G1 X90.105 Y109.374 E.90103
G1 X89.687 Y109.134 E.01306
G1 X89.687 Y142.866 E.91402
G1 X89.269 Y143.105 E.01306
G1 X89.269 Y108.895 E.92701
G1 X88.851 Y108.655 E.01306
G1 X88.851 Y143.345 E.94
G1 X88.432 Y143.585 E.01306
G1 X88.432 Y108.415 E.95299
G1 X88.014 Y108.175 E.01306
G1 X88.014 Y143.825 E.96599
G1 X87.596 Y144.064 E.01306
G1 X87.596 Y107.936 E.97898
G1 X87.178 Y107.696 E.01306
G1 X87.178 Y144.304 E.99197
G1 X86.76 Y144.544 E.01306
G1 X86.76 Y107.456 E1.00496
G1 X86.342 Y107.217 E.01306
G1 X86.342 Y144.783 E1.01795
G1 X85.923 Y145.023 E.01306
G1 X85.923 Y106.977 E1.03094
G1 X85.505 Y106.737 E.01306
G1 X85.505 Y145.263 E1.04394
G1 X85.087 Y145.503 E.01306
G1 X85.087 Y106.497 E1.05693
G1 X84.669 Y106.258 E.01306
G1 X84.669 Y145.742 E1.06992
G1 X84.251 Y145.982 E.01306
G1 X84.251 Y106.018 E1.08291
G1 X83.833 Y105.778 E.01306
G1 X83.833 Y146.222 E1.0959
G1 X83.414 Y146.462 E.01306
G1 X83.414 Y105.538 E1.10889
G1 X82.996 Y105.299 E.01306
G1 X82.996 Y146.701 E1.12189
G1 X82.578 Y146.941 E.01306
G1 X82.578 Y105.059 E1.13488
G1 X82.16 Y104.819 E.01306
G1 X82.16 Y147.181 E1.14787
G1 X81.742 Y147.42 E.01306
G1 X81.742 Y104.58 E1.16086
G1 X81.324 Y104.34 E.01306
G1 X81.324 Y147.66 E1.17385
G1 X80.906 Y147.9 E.01306
G1 X80.906 Y104.1 E1.18684
G1 X80.487 Y103.86 E.01306
G1 X80.487 Y148.14 E1.19984
G1 X80.069 Y148.379 E.01306
G1 X80.069 Y103.621 E1.21283
G1 X79.651 Y103.381 E.01306
G1 X79.651 Y148.619 E1.22582
G1 X79.233 Y148.859 E.01306
G1 X79.233 Y103.141 E1.23881
G1 X78.815 Y102.902 E.01306
G1 X78.815 Y149.098 E1.2518
G1 X78.397 Y149.338 E.01306
G1 X78.397 Y102.662 E1.26479
G1 X77.978 Y102.422 E.01306
G1 X77.978 Y149.578 E1.27779
G1 X77.56 Y149.818 E.01306
G1 X77.56 Y102.182 E1.29078
G1 X77.142 Y101.943 E.01306
G1 X77.142 Y150.057 E1.30377
G1 X76.724 Y150.297 E.01306
G1 X76.724 Y101.703 E1.31676
G1 X76.306 Y101.463 E.01306
G1 X76.306 Y150.537 E1.32975
G1 X75.888 Y150.777 E.01306
G1 X75.888 Y101.223 E1.34274
G1 X75.469 Y100.984 E.01306
G1 X75.469 Y151.016 E1.35574
G1 X75.051 Y151.256 E.01306
G1 X75.051 Y100.744 E1.36873
G1 X74.633 Y100.504 E.01306
G1 X74.633 Y151.496 E1.38172
G1 X74.215 Y151.735 E.01306
G1 X74.215 Y100.265 E1.39471
G1 X73.797 Y100.025 E.01306
G1 X73.797 Y151.975 E1.4077
G1 X73.379 Y152.215 E.01306
G1 X73.379 Y99.785 E1.42069
G1 X72.96 Y99.545 E.01306
G1 X72.96 Y152.455 E1.43369
G1 X72.542 Y152.694 E.01306
G1 X72.542 Y99.306 E1.44668
G1 X72.124 Y99.066 E.01306
G1 X72.124 Y152.934 E1.45967
G1 X71.706 Y153.174 E.01306
G1 X71.706 Y98.826 E1.47266
G1 X71.288 Y98.586 E.01306
G1 X71.288 Y153.414 E1.48565
G1 X70.87 Y153.653 E.01306
G1 X70.87 Y98.347 E1.49864
G1 X70.452 Y98.107 E.01306
G1 X70.452 Y153.893 E1.51164
G1 X70.033 Y154.133 E.01306
G1 X70.033 Y97.867 E1.52463
G1 X69.615 Y97.628 E.01306
G1 X69.615 Y154.372 E1.53762
G1 X69.197 Y154.612 E.01306
G1 X69.197 Y97.388 E1.55061
G1 X68.779 Y97.148 E.01306
G1 X68.779 Y154.852 E1.5636
G1 X68.361 Y155.092 E.01306
G1 X68.361 Y96.908 E1.5766
G1 X67.943 Y96.669 E.01306
G1 X67.943 Y155.331 E1.58959
G1 X67.524 Y155.571 E.01306
G1 X67.524 Y96.429 E1.60258
G1 X67.106 Y96.189 E.01306
G1 X67.106 Y155.811 E1.61557
G1 X66.688 Y156.051 E.01306
G1 X66.688 Y95.949 E1.62856
G1 X66.27 Y95.71 E.01306
G1 X66.27 Y156.29 E1.64155
M73 P28 R50
G1 X65.852 Y156.53 E.01306
G1 X65.852 Y95.47 E1.65455
G1 X65.434 Y95.23 E.01306
G1 X65.434 Y156.77 E1.66754
G1 X65.015 Y157.009 E.01306
G1 X65.015 Y94.991 E1.68053
G1 X64.597 Y94.751 E.01306
G1 X64.597 Y157.249 E1.69352
G1 X64.179 Y157.489 E.01306
G1 X64.179 Y94.511 E1.70651
G1 X63.761 Y94.271 E.01306
G1 X63.761 Y157.729 E1.7195
G1 X63.343 Y157.968 E.01306
G1 X63.343 Y94.032 E1.7325
G1 X62.925 Y93.792 E.01306
G1 X62.925 Y158.208 E1.74549
G1 X62.506 Y158.448 E.01306
G1 X62.506 Y93.552 E1.75848
G1 X62.088 Y93.312 E.01306
G1 X62.088 Y158.688 E1.77147
G1 X61.67 Y158.927 E.01306
G1 X61.67 Y93.073 E1.78446
G1 X61.252 Y92.833 E.01306
G1 X61.252 Y159.167 E1.79745
G1 X60.834 Y159.407 E.01306
G1 X60.834 Y92.593 E1.81045
G1 X60.416 Y92.354 E.01306
G1 X60.416 Y159.646 E1.82344
G1 X59.998 Y159.886 E.01306
G1 X59.998 Y92.114 E1.83643
G1 X59.579 Y91.874 E.01306
G1 X59.579 Y160.126 E1.84942
G1 X59.161 Y160.366 E.01306
G1 X59.161 Y91.634 E1.86241
G1 X58.743 Y91.395 E.01306
G1 X58.743 Y160.605 E1.8754
G1 X58.325 Y160.845 E.01306
G1 X58.325 Y91.155 E1.8884
G1 X57.907 Y90.915 E.01306
G1 X57.907 Y161.085 E1.90139
G1 X57.489 Y161.324 E.01306
G1 X57.489 Y90.676 E1.91438
G1 X57.07 Y90.436 E.01306
G1 X57.07 Y161.564 E1.92737
G1 X56.652 Y161.804 E.01306
G1 X56.652 Y90.196 E1.94036
G1 X56.234 Y89.956 E.01306
G1 X56.234 Y162.044 E1.95335
G1 X55.816 Y162.283 E.01306
G1 X55.816 Y89.717 E1.96635
G1 X55.398 Y89.477 E.01306
G1 X55.398 Y162.523 E1.97934
G1 X54.98 Y162.763 E.01306
G1 X54.98 Y89.237 E1.99233
G1 X54.561 Y88.997 E.01306
G1 X54.561 Y163.003 E2.00532
G1 X54.143 Y163.242 E.01306
G1 X54.143 Y88.758 E2.01831
G1 X53.725 Y88.518 E.01306
G1 X53.725 Y163.482 E2.0313
G1 X53.307 Y163.722 E.01306
G1 X53.307 Y88.278 E2.0443
G1 X52.889 Y88.039 E.01306
G1 X52.889 Y163.961 E2.05729
G1 X52.471 Y164.201 E.01306
G1 X52.471 Y87.799 E2.07028
G1 X52.052 Y87.559 E.01306
G1 X52.052 Y164.441 E2.08327
G1 X51.634 Y164.681 E.01306
G1 X51.634 Y87.319 E2.09626
G1 X51.216 Y87.08 E.01306
G1 X51.216 Y164.92 E2.10925
G1 X50.798 Y165.16 E.01306
G1 X50.798 Y86.84 E2.12225
G1 X50.38 Y86.6 E.01306
G1 X50.38 Y165.4 E2.13524
G1 X49.962 Y165.64 E.01306
G1 X49.962 Y86.36 E2.14823
G1 X49.544 Y86.121 E.01306
G1 X49.544 Y165.879 E2.16122
G1 X49.125 Y166.119 E.01306
G1 X49.125 Y85.881 E2.17421
G1 X48.707 Y85.641 E.01306
G1 X48.707 Y166.359 E2.1872
G1 X48.289 Y166.598 E.01306
G1 X48.289 Y85.402 E2.2002
G1 X47.871 Y85.162 E.01306
G1 X47.871 Y166.838 E2.21319
G1 X47.453 Y167.078 E.01306
G1 X47.453 Y84.922 E2.22618
G1 X47.035 Y84.682 E.01306
G1 X47.035 Y167.318 E2.23917
G1 X46.616 Y167.557 E.01306
G1 X46.616 Y84.443 E2.25216
G1 X46.198 Y84.203 E.01306
G1 X46.198 Y167.797 E2.26515
G1 X45.78 Y168.037 E.01306
G1 X45.78 Y83.963 E2.27815
G1 X45.362 Y83.723 E.01306
G1 X45.362 Y168.277 E2.29114
G1 X44.944 Y168.516 E.01306
G1 X44.944 Y83.484 E2.30413
G1 X44.526 Y83.244 E.01306
G1 X44.526 Y168.756 E2.31712
G1 X44.107 Y168.996 E.01306
G1 X44.107 Y83.004 E2.33011
G1 X43.689 Y82.765 E.01306
G1 X43.689 Y169.235 E2.34311
G1 X43.271 Y169.475 E.01306
G1 X43.271 Y82.525 E2.3561
G1 X42.853 Y82.285 E.01306
G1 X42.853 Y169.715 E2.36909
G1 X42.435 Y169.955 E.01306
G1 X42.435 Y82.045 E2.38208
G1 X42.017 Y81.806 E.01306
G1 X42.017 Y170.194 E2.39507
G1 X41.598 Y170.434 E.01306
G1 X41.598 Y81.566 E2.40806
G1 X41.18 Y81.326 E.01306
G1 X41.18 Y170.674 E2.42106
G1 X40.762 Y170.913 E.01306
G1 X40.762 Y80.871 E2.43989
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X40.762 Y82.871 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 465
M625
; layer num/total_layer_count: 4/14
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M204 S10000
G17
G3 Z.92 I1.217 J0 P1  F30000
; object ids of layer 4 start: 325,353,381,409,437,465
M624 PwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer4 end: 325,353,381,409,437,465
M625
; OBJECT_ID: 325
; start printing object, unique label id: 325
M624 AQAAAAAAAAA=
G1 X208.641 Y75.187
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X145.649 Y111.3 E1.96749
G1 X133.032 Y104.015 E.39478
G1 X132.083 Y56.584 E1.28551
G1 X208.583 Y75.173 E2.13324
; WIPE_START
G1 X206.848 Y76.169 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.639 Y75.017 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X209.712 Y75.035 E.00188
G1 F3240
G1 X145.776 Y111.689 E1.85285
G1 F3600
G1 X145.673 Y111.689 E.00259
G1 X145.625 Y111.689 E.00121
G1 X145.522 Y111.688 E.00259
G1 F3240
G1 X132.763 Y104.322 E.3704
G1 F3600
G1 X132.71 Y104.232 E.00263
G1 X132.686 Y104.193 E.00115
G1 X132.633 Y104.103 E.00263
G1 F3240
G1 X131.675 Y56.218 E1.20413
G1 F3600
G1 X131.726 Y56.177 E.00163
G1 X131.815 Y56.106 E.00286
G1 X209.581 Y75.003 E2.01206
; WIPE_START
M204 S4000
G1 X209.712 Y75.035 E-.05118
G1 X208.094 Y75.963 E-.70882
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.669 Y75.55 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
M73 P28 R49
G1 X207.361 Y75.242 E.01182
G1 X206.582 Y75.053 E.02172
G1 X207.157 Y75.628 E.02205
G1 X206.782 Y75.843 E.0117
G1 X205.803 Y74.864 E.03753
G1 X205.024 Y74.674 E.02172
G1 X206.408 Y76.058 E.05301
G1 X206.033 Y76.273 E.0117
G1 X204.246 Y74.485 E.0685
G1 X203.467 Y74.296 E.02172
G1 X205.658 Y76.487 E.08398
G1 X205.284 Y76.702 E.0117
G1 X202.688 Y74.107 E.09946
G1 X201.909 Y73.917 E.02172
G1 X204.909 Y76.917 E.11495
G1 X204.534 Y77.132 E.0117
G1 X201.131 Y73.728 E.13043
G1 X200.352 Y73.539 E.02172
G1 X204.16 Y77.347 E.14591
G1 X203.785 Y77.561 E.0117
G1 X199.573 Y73.35 E.1614
G1 X198.794 Y73.16 E.02172
G1 X203.41 Y77.776 E.17688
G1 X203.036 Y77.991 E.0117
G1 X198.016 Y72.971 E.19236
G1 X197.237 Y72.782 E.02172
G1 X202.661 Y78.206 E.20785
G1 X202.286 Y78.421 E.0117
G1 X196.458 Y72.593 E.22333
G1 X195.68 Y72.403 E.02172
G1 X201.911 Y78.635 E.23881
G1 X201.537 Y78.85 E.0117
G1 X194.901 Y72.214 E.25429
G1 X194.122 Y72.025 E.02172
G1 X201.162 Y79.065 E.26978
G1 X200.787 Y79.28 E.0117
G1 X193.343 Y71.836 E.28526
G1 X192.565 Y71.647 E.02172
G1 X200.413 Y79.495 E.30074
G1 X200.038 Y79.709 E.0117
G1 X191.786 Y71.457 E.31623
G1 X191.007 Y71.268 E.02172
G1 X199.663 Y79.924 E.33171
G1 X199.289 Y80.139 E.0117
G1 X190.228 Y71.079 E.34719
G1 X189.45 Y70.89 E.02172
G1 X198.914 Y80.354 E.36268
G1 X198.539 Y80.569 E.0117
G1 X188.671 Y70.7 E.37816
G1 X187.892 Y70.511 E.02172
G1 X198.165 Y80.783 E.39364
G1 X197.79 Y80.998 E.0117
G1 X187.114 Y70.322 E.40913
G1 X186.335 Y70.133 E.02172
G1 X197.415 Y81.213 E.42461
G1 X197.04 Y81.428 E.0117
G1 X185.556 Y69.943 E.44009
G1 X184.777 Y69.754 E.02172
G1 X196.666 Y81.643 E.45558
G1 X196.291 Y81.857 E.0117
G1 X183.999 Y69.565 E.47106
G1 X183.22 Y69.376 E.02172
G1 X195.916 Y82.072 E.48654
G1 X195.542 Y82.287 E.0117
G1 X182.441 Y69.187 E.50203
M73 P29 R49
G1 X181.662 Y68.997 E.02172
G1 X195.167 Y82.502 E.51751
G1 X194.792 Y82.717 E.0117
G1 X180.884 Y68.808 E.53299
G1 X180.105 Y68.619 E.02172
G1 X194.418 Y82.932 E.54848
G1 X194.043 Y83.146 E.0117
G1 X179.326 Y68.43 E.56396
G1 X178.547 Y68.24 E.02172
G1 X193.668 Y83.361 E.57944
G1 X193.293 Y83.576 E.0117
G1 X177.769 Y68.051 E.59493
G1 X176.99 Y67.862 E.02172
G1 X192.919 Y83.791 E.61041
G1 X192.544 Y84.006 E.0117
G1 X176.211 Y67.673 E.62589
G1 X175.433 Y67.483 E.02172
G1 X192.169 Y84.22 E.64137
G1 X191.795 Y84.435 E.0117
G1 X174.654 Y67.294 E.65686
G1 X173.875 Y67.105 E.02172
G1 X191.42 Y84.65 E.67234
G1 X191.045 Y84.865 E.0117
G1 X173.096 Y66.916 E.68782
G1 X172.318 Y66.727 E.02172
G1 X190.671 Y85.08 E.70331
G1 X190.296 Y85.294 E.0117
G1 X171.539 Y66.537 E.71879
G1 X170.76 Y66.348 E.02172
G1 X189.921 Y85.509 E.73427
G1 X189.547 Y85.724 E.0117
G1 X169.981 Y66.159 E.74976
G1 X169.203 Y65.97 E.02172
G1 X189.172 Y85.939 E.76524
G1 X188.797 Y86.154 E.0117
G1 X168.424 Y65.78 E.78072
G1 X167.645 Y65.591 E.02172
G1 X188.422 Y86.368 E.79621
G1 X188.048 Y86.583 E.0117
G1 X166.866 Y65.402 E.81169
G1 X166.088 Y65.213 E.02172
G1 X187.673 Y86.798 E.82717
G1 X187.298 Y87.013 E.0117
G1 X165.309 Y65.023 E.84266
G1 X164.53 Y64.834 E.02172
G1 X186.924 Y87.228 E.85814
G1 X186.549 Y87.442 E.0117
G1 X163.752 Y64.645 E.87362
G1 X162.973 Y64.456 E.02172
G1 X186.174 Y87.657 E.88911
G1 X185.8 Y87.872 E.0117
G1 X162.194 Y64.267 E.90459
G1 X161.415 Y64.077 E.02172
G1 X185.425 Y88.087 E.92007
G1 X185.05 Y88.302 E.0117
G1 X160.637 Y63.888 E.93556
G1 X159.858 Y63.699 E.02172
G1 X184.676 Y88.516 E.95104
G1 X184.301 Y88.731 E.0117
G1 X159.079 Y63.51 E.96652
G1 X158.3 Y63.32 E.02172
G1 X183.926 Y88.946 E.98201
G1 X183.551 Y89.161 E.0117
G1 X157.522 Y63.131 E.99749
G1 X156.743 Y62.942 E.02172
G1 X183.177 Y89.376 E1.01297
G1 X182.802 Y89.591 E.0117
G1 X155.964 Y62.753 E1.02845
G1 X155.185 Y62.563 E.02172
G1 X182.427 Y89.805 E1.04394
G1 X182.053 Y90.02 E.0117
G1 X154.407 Y62.374 E1.05942
G1 X153.628 Y62.185 E.02172
G1 X181.678 Y90.235 E1.0749
G1 X181.303 Y90.45 E.0117
G1 X152.849 Y61.996 E1.09039
G1 X152.071 Y61.807 E.02172
G1 X180.929 Y90.665 E1.10587
G1 X180.554 Y90.879 E.0117
G1 X151.292 Y61.617 E1.12135
G1 X150.513 Y61.428 E.02172
G1 X180.179 Y91.094 E1.13684
G1 X179.804 Y91.309 E.0117
G1 X149.734 Y61.239 E1.15232
G1 X148.956 Y61.05 E.02172
G1 X179.43 Y91.524 E1.1678
G1 X179.055 Y91.739 E.0117
G1 X148.177 Y60.86 E1.18329
G1 X147.398 Y60.671 E.02172
G1 X178.68 Y91.953 E1.19877
G1 X178.306 Y92.168 E.0117
G1 X146.619 Y60.482 E1.21425
G1 X145.841 Y60.293 E.02172
G1 X177.931 Y92.383 E1.22974
G1 X177.556 Y92.598 E.0117
G1 X145.062 Y60.103 E1.24522
G1 X144.283 Y59.914 E.02172
G1 X177.182 Y92.813 E1.2607
G1 X176.807 Y93.027 E.0117
G1 X143.504 Y59.725 E1.27619
G1 X142.726 Y59.536 E.02172
G1 X176.432 Y93.242 E1.29167
G1 X176.058 Y93.457 E.0117
G1 X141.947 Y59.346 E1.30715
G1 X141.168 Y59.157 E.02172
G1 X175.683 Y93.672 E1.32264
G1 X175.308 Y93.887 E.0117
G1 X140.39 Y58.968 E1.33812
G1 X139.611 Y58.779 E.02172
G1 X174.933 Y94.101 E1.3536
G1 X174.559 Y94.316 E.0117
G1 X138.832 Y58.59 E1.36908
G1 X138.053 Y58.4 E.02172
G1 X174.184 Y94.531 E1.38457
G1 X173.809 Y94.746 E.0117
G1 X137.275 Y58.211 E1.40005
G1 X136.496 Y58.022 E.02172
G1 X173.435 Y94.961 E1.41553
G1 X173.06 Y95.176 E.0117
G1 X135.717 Y57.833 E1.43102
G1 X134.938 Y57.643 E.02172
G1 X172.685 Y95.39 E1.4465
G1 X172.311 Y95.605 E.0117
G1 X134.16 Y57.454 E1.46198
G1 X133.381 Y57.265 E.02172
G1 X171.936 Y95.82 E1.47747
G1 X171.561 Y96.035 E.0117
G1 X132.602 Y57.076 E1.49295
G1 X132.448 Y57.038 E.0043
G1 X132.458 Y57.521 E.01307
G1 X171.187 Y96.25 E1.48413
G1 X170.812 Y96.464 E.0117
G1 X132.47 Y58.122 E1.46931
G1 X132.482 Y58.724 E.0163
G1 X170.437 Y96.679 E1.45449
G1 X170.062 Y96.894 E.0117
G1 X132.494 Y59.325 E1.43967
G1 X132.506 Y59.927 E.0163
G1 X169.688 Y97.109 E1.42485
G1 X169.313 Y97.324 E.0117
G1 X132.518 Y60.528 E1.41003
G1 X132.53 Y61.13 E.0163
G1 X168.938 Y97.538 E1.39521
G1 X168.564 Y97.753 E.0117
G1 X132.542 Y61.731 E1.38039
G1 X132.554 Y62.333 E.0163
G1 X168.189 Y97.968 E1.36557
G1 X167.814 Y98.183 E.0117
G1 X132.566 Y62.934 E1.35075
G1 X132.578 Y63.536 E.0163
G1 X167.44 Y98.398 E1.33593
G1 X167.065 Y98.612 E.0117
G1 X132.59 Y64.137 E1.32112
G1 X132.602 Y64.739 E.0163
G1 X166.69 Y98.827 E1.30629
G1 X166.316 Y99.042 E.0117
G1 X132.614 Y65.341 E1.29148
G1 X132.626 Y65.942 E.0163
G1 X165.941 Y99.257 E1.27666
G1 X165.566 Y99.472 E.0117
G1 X132.638 Y66.544 E1.26184
G1 X132.65 Y67.145 E.0163
G1 X165.191 Y99.686 E1.24702
G1 X164.817 Y99.901 E.0117
G1 X132.662 Y67.747 E1.2322
G1 X132.674 Y68.348 E.0163
G1 X164.442 Y100.116 E1.21738
G1 X164.067 Y100.331 E.0117
G1 X132.686 Y68.95 E1.20256
G1 X132.698 Y69.551 E.0163
G1 X163.693 Y100.546 E1.18774
G1 X163.318 Y100.76 E.0117
G1 X132.71 Y70.153 E1.17292
G1 X132.722 Y70.754 E.0163
G1 X162.943 Y100.975 E1.1581
G1 X162.569 Y101.19 E.0117
G1 X132.734 Y71.356 E1.14328
G1 X132.746 Y71.957 E.0163
G1 X162.194 Y101.405 E1.12846
G1 X161.819 Y101.62 E.0117
G1 X132.758 Y72.559 E1.11364
G1 X132.771 Y73.161 E.0163
G1 X161.444 Y101.835 E1.09882
G1 X161.07 Y102.049 E.0117
G1 X132.783 Y73.762 E1.084
G1 X132.795 Y74.364 E.0163
G1 X160.695 Y102.264 E1.06918
G1 X160.32 Y102.479 E.0117
G1 X132.807 Y74.965 E1.05436
G1 X132.819 Y75.567 E.0163
G1 X159.946 Y102.694 E1.03954
G1 X159.571 Y102.909 E.0117
G1 X132.831 Y76.168 E1.02472
G1 X132.843 Y76.77 E.0163
G1 X159.196 Y103.123 E1.0099
G1 X158.822 Y103.338 E.0117
G1 X132.855 Y77.371 E.99508
G1 X132.867 Y77.973 E.0163
G1 X158.447 Y103.553 E.98026
G1 X158.072 Y103.768 E.0117
G1 X132.879 Y78.574 E.96544
G1 X132.891 Y79.176 E.0163
G1 X157.698 Y103.983 E.95062
G1 X157.323 Y104.197 E.0117
G1 X132.903 Y79.777 E.9358
G1 X132.915 Y80.379 E.0163
G1 X156.948 Y104.412 E.92098
G1 X156.573 Y104.627 E.0117
G1 X132.927 Y80.981 E.90616
G1 X132.939 Y81.582 E.0163
G1 X156.199 Y104.842 E.89134
G1 X155.824 Y105.057 E.0117
G1 X132.951 Y82.184 E.87652
G1 X132.963 Y82.785 E.0163
G1 X155.449 Y105.271 E.8617
G1 X155.075 Y105.486 E.0117
G1 X132.975 Y83.387 E.84688
G1 X132.987 Y83.988 E.0163
G1 X154.7 Y105.701 E.83206
G1 X154.325 Y105.916 E.0117
G1 X132.999 Y84.59 E.81724
G1 X133.011 Y85.191 E.0163
G1 X153.951 Y106.131 E.80242
G1 X153.576 Y106.345 E.0117
G1 X133.023 Y85.793 E.7876
G1 X133.035 Y86.394 E.0163
G1 X153.201 Y106.56 E.77278
G1 X152.827 Y106.775 E.0117
G1 X133.047 Y86.996 E.75796
G1 X133.059 Y87.597 E.0163
G1 X152.452 Y106.99 E.74314
G1 X152.077 Y107.205 E.0117
G1 X133.071 Y88.199 E.72832
G1 X133.083 Y88.8 E.0163
G1 X151.702 Y107.419 E.7135
G1 X151.328 Y107.634 E.0117
G1 X133.095 Y89.402 E.69868
G1 X133.108 Y90.004 E.0163
G1 X150.953 Y107.849 E.68386
G1 X150.578 Y108.064 E.0117
G1 X133.12 Y90.605 E.66904
G1 X133.132 Y91.207 E.0163
G1 X150.204 Y108.279 E.65422
G1 X149.829 Y108.494 E.0117
G1 X133.144 Y91.808 E.6394
G1 X133.156 Y92.41 E.0163
G1 X149.454 Y108.708 E.62458
G1 X149.08 Y108.923 E.0117
G1 X133.168 Y93.011 E.60976
G1 X133.18 Y93.613 E.0163
G1 X148.705 Y109.138 E.59494
G1 X148.33 Y109.353 E.0117
G1 X133.192 Y94.214 E.58012
G1 X133.204 Y94.816 E.0163
G1 X147.956 Y109.568 E.5653
G1 X147.581 Y109.782 E.0117
G1 X133.216 Y95.417 E.55048
G1 X133.228 Y96.019 E.0163
G1 X147.206 Y109.997 E.53566
G1 X146.831 Y110.212 E.0117
G1 X133.24 Y96.62 E.52084
G1 X133.252 Y97.222 E.0163
G1 X146.457 Y110.427 E.50602
G1 X146.082 Y110.642 E.0117
G1 X133.264 Y97.824 E.4912
G1 X133.276 Y98.425 E.0163
G1 X145.707 Y110.856 E.47638
G1 X145.65 Y110.889 E.00179
G1 X144.469 Y110.207 E.03696
G1 X133.288 Y99.027 E.42846
G1 X133.3 Y99.628 E.0163
G1 X143.074 Y109.402 E.37455
G1 X141.679 Y108.597 E.04364
G1 X133.312 Y100.23 E.32063
G1 X133.324 Y100.831 E.0163
G1 X140.284 Y107.791 E.26672
G1 X138.89 Y106.986 E.04364
G1 X133.336 Y101.433 E.21281
G1 X133.348 Y102.034 E.0163
G1 X137.495 Y106.181 E.1589
G1 X136.1 Y105.376 E.04364
G1 X133.36 Y102.636 E.10499
G1 X133.372 Y103.237 E.0163
G1 X135.216 Y105.081 E.07066
; OBJECT_ID: 353
; WIPE_START
G1 X133.802 Y103.667 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 325
M625
; start printing object, unique label id: 353
M624 AgAAAAAAAAA=
M204 S10000
G1 X139.672 Y108.545 Z1.08 F30000
G1 X215.595 Y171.635 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X149.556 Y133.775 E2.06269
G1 X149.556 Y118.225 E.42137
G1 X215.595 Y80.365 E2.06268
G1 X215.595 Y171.575 E2.47151
M204 S10000
G1 X215.991 Y172.264 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X215.94 Y172.294 E.00149
G1 F3240
G1 X149.282 Y134.08 E1.93171
G1 F3600
G1 X149.231 Y133.992 E.00258
G1 X149.206 Y133.949 E.00124
G1 X149.155 Y133.86 E.00258
G1 F3240
G1 X149.155 Y118.14 E.39524
G1 F3600
G1 X149.206 Y118.051 E.00258
G1 X149.231 Y118.008 E.00124
G1 X149.282 Y117.92 E.00258
G1 F3240
G1 X215.94 Y79.706 E1.93171
G1 F3600
G1 X215.991 Y79.736 E.00149
G1 X215.996 Y79.739 E.00014
G1 X215.991 Y172.204 E2.32471
; WIPE_START
M204 S4000
G1 X215.94 Y172.294 E-.03931
G1 X214.294 Y171.351 E-.72069
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X215.239 Y171.236 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X215.239 Y80.979 E2.44571
G1 X214.823 Y81.218 E.013
G1 X214.823 Y170.782 E2.42694
G1 X214.407 Y170.544 E.013
G1 X214.407 Y81.456 E2.41401
G1 X213.991 Y81.695 E.013
G1 X213.991 Y170.305 E2.40108
G1 X213.575 Y170.067 E.013
G1 X213.575 Y81.933 E2.38815
G1 X213.159 Y82.172 E.013
G1 X213.159 Y169.828 E2.37523
G1 X212.743 Y169.59 E.013
G1 X212.743 Y82.41 E2.3623
G1 X212.327 Y82.649 E.013
G1 X212.327 Y169.351 E2.34937
G1 X211.911 Y169.113 E.013
G1 X211.911 Y82.888 E2.33644
G1 X211.495 Y83.126 E.013
G1 X211.495 Y168.874 E2.32352
G1 X211.078 Y168.635 E.013
G1 X211.078 Y83.365 E2.31059
G1 X210.662 Y83.603 E.013
G1 X210.662 Y168.397 E2.29766
G1 X210.246 Y168.158 E.013
G1 X210.246 Y83.842 E2.28473
G1 X209.83 Y84.08 E.013
G1 X209.83 Y167.92 E2.27181
G1 X209.414 Y167.681 E.013
G1 X209.414 Y84.319 E2.25888
G1 X208.998 Y84.557 E.013
G1 X208.998 Y167.443 E2.24595
G1 X208.582 Y167.204 E.013
G1 X208.582 Y84.796 E2.23302
G1 X208.166 Y85.034 E.013
G1 X208.166 Y166.966 E2.22009
G1 X207.75 Y166.727 E.013
G1 X207.75 Y85.273 E2.20717
G1 X207.334 Y85.511 E.013
G1 X207.334 Y166.489 E2.19424
M73 P30 R49
G1 X206.917 Y166.25 E.013
G1 X206.917 Y85.75 E2.18131
G1 X206.501 Y85.989 E.013
G1 X206.501 Y166.011 E2.16838
G1 X206.085 Y165.773 E.013
G1 X206.085 Y86.227 E2.15546
G1 X205.669 Y86.466 E.013
G1 X205.669 Y165.534 E2.14253
G1 X205.253 Y165.296 E.013
G1 X205.253 Y86.704 E2.1296
G1 X204.837 Y86.943 E.013
G1 X204.837 Y165.057 E2.11667
G1 X204.421 Y164.819 E.013
G1 X204.421 Y87.181 E2.10375
G1 X204.005 Y87.42 E.013
G1 X204.005 Y164.58 E2.09082
G1 X203.589 Y164.342 E.013
G1 X203.589 Y87.658 E2.07789
G1 X203.173 Y87.897 E.013
G1 X203.173 Y164.103 E2.06496
G1 X202.756 Y163.865 E.013
G1 X202.756 Y88.135 E2.05203
G1 X202.34 Y88.374 E.013
G1 X202.34 Y163.626 E2.03911
G1 X201.924 Y163.387 E.013
G1 X201.924 Y88.613 E2.02618
G1 X201.508 Y88.851 E.013
G1 X201.508 Y163.149 E2.01325
G1 X201.092 Y162.91 E.013
G1 X201.092 Y89.09 E2.00032
G1 X200.676 Y89.328 E.013
G1 X200.676 Y162.672 E1.9874
G1 X200.26 Y162.433 E.013
G1 X200.26 Y89.567 E1.97447
G1 X199.844 Y89.805 E.013
G1 X199.844 Y162.195 E1.96154
G1 X199.428 Y161.956 E.013
G1 X199.428 Y90.044 E1.94861
G1 X199.012 Y90.282 E.013
G1 X199.012 Y161.718 E1.93569
G1 X198.595 Y161.479 E.013
G1 X198.595 Y90.521 E1.92276
M73 P30 R48
G1 X198.179 Y90.759 E.013
G1 X198.179 Y161.241 E1.90983
G1 X197.763 Y161.002 E.013
G1 X197.763 Y90.998 E1.8969
G1 X197.347 Y91.237 E.013
G1 X197.347 Y160.763 E1.88397
G1 X196.931 Y160.525 E.013
G1 X196.931 Y91.475 E1.87105
G1 X196.515 Y91.714 E.013
G1 X196.515 Y160.286 E1.85812
G1 X196.099 Y160.048 E.013
G1 X196.099 Y91.952 E1.84519
G1 X195.683 Y92.191 E.013
G1 X195.683 Y159.809 E1.83226
G1 X195.267 Y159.571 E.013
G1 X195.267 Y92.429 E1.81934
G1 X194.851 Y92.668 E.013
G1 X194.851 Y159.332 E1.80641
G1 X194.434 Y159.094 E.013
G1 X194.434 Y92.906 E1.79348
G1 X194.018 Y93.145 E.013
G1 X194.018 Y158.855 E1.78055
G1 X193.602 Y158.617 E.013
G1 X193.602 Y93.383 E1.76763
G1 X193.186 Y93.622 E.013
G1 X193.186 Y158.378 E1.7547
G1 X192.77 Y158.139 E.013
G1 X192.77 Y93.861 E1.74177
G1 X192.354 Y94.099 E.013
G1 X192.354 Y157.901 E1.72884
G1 X191.938 Y157.662 E.013
G1 X191.938 Y94.338 E1.71592
G1 X191.522 Y94.576 E.013
G1 X191.522 Y157.424 E1.70299
G1 X191.106 Y157.185 E.013
G1 X191.106 Y94.815 E1.69006
G1 X190.69 Y95.053 E.013
G1 X190.69 Y156.947 E1.67713
G1 X190.273 Y156.708 E.013
G1 X190.273 Y95.292 E1.6642
G1 X189.857 Y95.53 E.013
G1 X189.857 Y156.47 E1.65128
G1 X189.441 Y156.231 E.013
G1 X189.441 Y95.769 E1.63835
G1 X189.025 Y96.007 E.013
G1 X189.025 Y155.993 E1.62542
G1 X188.609 Y155.754 E.013
G1 X188.609 Y96.246 E1.61249
G1 X188.193 Y96.485 E.013
G1 X188.193 Y155.515 E1.59957
G1 X187.777 Y155.277 E.013
G1 X187.777 Y96.723 E1.58664
G1 X187.361 Y96.962 E.013
G1 X187.361 Y155.038 E1.57371
G1 X186.945 Y154.8 E.013
G1 X186.945 Y97.2 E1.56078
G1 X186.529 Y97.439 E.013
G1 X186.529 Y154.561 E1.54785
G1 X186.112 Y154.323 E.013
G1 X186.112 Y97.677 E1.53493
G1 X185.696 Y97.916 E.013
G1 X185.696 Y154.084 E1.522
G1 X185.28 Y153.846 E.013
G1 X185.28 Y98.154 E1.50907
G1 X184.864 Y98.393 E.013
G1 X184.864 Y153.607 E1.49614
G1 X184.448 Y153.369 E.013
G1 X184.448 Y98.631 E1.48322
G1 X184.032 Y98.87 E.013
G1 X184.032 Y153.13 E1.47029
G1 X183.616 Y152.891 E.013
G1 X183.616 Y99.108 E1.45736
G1 X183.2 Y99.347 E.013
G1 X183.2 Y152.653 E1.44443
G1 X182.784 Y152.414 E.013
G1 X182.784 Y99.586 E1.43151
G1 X182.368 Y99.824 E.013
G1 X182.368 Y152.176 E1.41858
G1 X181.951 Y151.937 E.013
G1 X181.951 Y100.063 E1.40565
G1 X181.535 Y100.301 E.013
G1 X181.535 Y151.699 E1.39272
G1 X181.119 Y151.46 E.013
G1 X181.119 Y100.54 E1.3798
G1 X180.703 Y100.778 E.013
G1 X180.703 Y151.222 E1.36687
G1 X180.287 Y150.983 E.013
G1 X180.287 Y101.017 E1.35394
G1 X179.871 Y101.255 E.013
G1 X179.871 Y150.745 E1.34101
G1 X179.455 Y150.506 E.013
G1 X179.455 Y101.494 E1.32808
G1 X179.039 Y101.732 E.013
G1 X179.039 Y150.268 E1.31516
G1 X178.623 Y150.029 E.013
G1 X178.623 Y101.971 E1.30223
G1 X178.207 Y102.21 E.013
G1 X178.207 Y149.79 E1.2893
G1 X177.79 Y149.552 E.013
G1 X177.79 Y102.448 E1.27637
G1 X177.374 Y102.687 E.013
G1 X177.374 Y149.313 E1.26345
G1 X176.958 Y149.075 E.013
G1 X176.958 Y102.925 E1.25052
G1 X176.542 Y103.164 E.013
G1 X176.542 Y148.836 E1.23759
G1 X176.126 Y148.598 E.013
G1 X176.126 Y103.402 E1.22466
G1 X175.71 Y103.641 E.013
G1 X175.71 Y148.359 E1.21174
G1 X175.294 Y148.121 E.013
G1 X175.294 Y103.879 E1.19881
G1 X174.878 Y104.118 E.013
G1 X174.878 Y147.882 E1.18588
G1 X174.462 Y147.644 E.013
G1 X174.462 Y104.356 E1.17295
G1 X174.046 Y104.595 E.013
G1 X174.046 Y147.405 E1.16002
G1 X173.629 Y147.166 E.013
G1 X173.629 Y104.834 E1.1471
G1 X173.213 Y105.072 E.013
G1 X173.213 Y146.928 E1.13417
G1 X172.797 Y146.689 E.013
G1 X172.797 Y105.311 E1.12124
G1 X172.381 Y105.549 E.013
G1 X172.381 Y146.451 E1.10831
G1 X171.965 Y146.212 E.013
G1 X171.965 Y105.788 E1.09539
G1 X171.549 Y106.026 E.013
G1 X171.549 Y145.974 E1.08246
G1 X171.133 Y145.735 E.013
G1 X171.133 Y106.265 E1.06953
G1 X170.717 Y106.503 E.013
G1 X170.717 Y145.497 E1.0566
G1 X170.301 Y145.258 E.013
G1 X170.301 Y106.742 E1.04368
G1 X169.885 Y106.98 E.013
G1 X169.885 Y145.02 E1.03075
G1 X169.468 Y144.781 E.013
G1 X169.468 Y107.219 E1.01782
G1 X169.052 Y107.458 E.013
G1 X169.052 Y144.542 E1.00489
G1 X168.636 Y144.304 E.013
G1 X168.636 Y107.696 E.99196
G1 X168.22 Y107.935 E.013
G1 X168.22 Y144.065 E.97904
G1 X167.804 Y143.827 E.013
G1 X167.804 Y108.173 E.96611
G1 X167.388 Y108.412 E.013
G1 X167.388 Y143.588 E.95318
G1 X166.972 Y143.35 E.013
G1 X166.972 Y108.65 E.94025
G1 X166.556 Y108.889 E.013
G1 X166.556 Y143.111 E.92733
G1 X166.14 Y142.873 E.013
G1 X166.14 Y109.127 E.9144
G1 X165.724 Y109.366 E.013
G1 X165.724 Y142.634 E.90147
G1 X165.307 Y142.396 E.013
G1 X165.307 Y109.604 E.88854
G1 X164.891 Y109.843 E.013
G1 X164.891 Y142.157 E.87561
G1 X164.475 Y141.918 E.013
G1 X164.475 Y110.082 E.86269
G1 X164.059 Y110.32 E.013
G1 X164.059 Y141.68 E.84976
G1 X163.643 Y141.441 E.013
G1 X163.643 Y110.559 E.83683
G1 X163.227 Y110.797 E.013
G1 X163.227 Y141.203 E.8239
G1 X162.811 Y140.964 E.013
G1 X162.811 Y111.036 E.81098
G1 X162.395 Y111.274 E.013
G1 X162.395 Y140.726 E.79805
M73 P31 R48
G1 X161.979 Y140.487 E.013
G1 X161.979 Y111.513 E.78512
G1 X161.563 Y111.751 E.013
G1 X161.563 Y140.249 E.77219
G1 X161.146 Y140.01 E.013
G1 X161.146 Y111.99 E.75927
G1 X160.73 Y112.228 E.013
G1 X160.73 Y139.772 E.74634
G1 X160.314 Y139.533 E.013
G1 X160.314 Y112.467 E.73341
G1 X159.898 Y112.706 E.013
G1 X159.898 Y139.294 E.72048
G1 X159.482 Y139.056 E.013
G1 X159.482 Y112.944 E.70755
G1 X159.066 Y113.183 E.013
G1 X159.066 Y138.817 E.69463
G1 X158.65 Y138.579 E.013
G1 X158.65 Y113.421 E.6817
G1 X158.234 Y113.66 E.013
G1 X158.234 Y138.34 E.66877
G1 X157.818 Y138.102 E.013
G1 X157.818 Y113.898 E.65584
G1 X157.402 Y114.137 E.013
G1 X157.402 Y137.863 E.64292
G1 X156.985 Y137.625 E.013
G1 X156.985 Y114.375 E.62999
G1 X156.569 Y114.614 E.013
G1 X156.569 Y137.386 E.61706
G1 X156.153 Y137.148 E.013
G1 X156.153 Y114.852 E.60413
G1 X155.737 Y115.091 E.013
G1 X155.737 Y136.909 E.59121
G1 X155.321 Y136.67 E.013
G1 X155.321 Y115.329 E.57828
G1 X154.905 Y115.568 E.013
G1 X154.905 Y136.432 E.56535
G1 X154.489 Y136.193 E.013
G1 X154.489 Y115.807 E.55242
G1 X154.073 Y116.045 E.013
G1 X154.073 Y135.955 E.5395
G1 X153.657 Y135.716 E.013
G1 X153.657 Y116.284 E.52657
G1 X153.241 Y116.522 E.013
G1 X153.241 Y135.478 E.51364
G1 X152.824 Y135.239 E.013
G1 X152.824 Y116.761 E.50071
G1 X152.408 Y116.999 E.013
G1 X152.408 Y135.001 E.48778
G1 X151.992 Y134.762 E.013
G1 X151.992 Y117.238 E.47486
G1 X151.576 Y117.476 E.013
G1 X151.576 Y134.524 E.46193
G1 X151.16 Y134.285 E.013
G1 X151.16 Y117.715 E.449
G1 X150.744 Y117.953 E.013
G1 X150.744 Y134.047 E.43607
G1 X150.328 Y133.808 E.013
G1 X150.328 Y118.192 E.42315
G1 X149.912 Y118.431 E.013
G1 X149.912 Y133.785 E.41606
; OBJECT_ID: 381
; WIPE_START
G1 X149.912 Y131.785 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 353
M625
; start printing object, unique label id: 381
M624 BAAAAAAAAAA=
M204 S10000
G1 X155.969 Y136.429 Z1.08 F30000
G1 X208.641 Y176.813 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X132.083 Y195.416 E2.13486
G1 X133.032 Y147.985 E1.28551
G1 X145.649 Y140.7 E.39478
G1 X208.589 Y176.783 E1.96586
; WIPE_START
G1 X206.646 Y177.256 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.639 Y176.983 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X131.815 Y195.894 E2.01356
G1 X131.726 Y195.823 E.00286
G1 X131.675 Y195.782 E.00163
G1 F3240
G1 X132.633 Y147.897 E1.20413
G1 F3600
G1 X132.686 Y147.807 E.00263
G1 X132.71 Y147.768 E.00115
G1 X132.763 Y147.678 E.00263
G1 F3240
G1 X145.522 Y140.312 E.3704
G1 F3600
G1 X145.625 Y140.311 E.00259
G1 X145.673 Y140.311 E.00121
G1 X145.776 Y140.311 E.00259
G1 F3240
G1 X145.824 Y140.339 E.00141
G1 X209.712 Y176.965 E1.85145
G1 F3600
G1 X209.698 Y176.968 E.00037
; WIPE_START
M204 S4000
G1 X207.754 Y177.441 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.106 Y177.012 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.532 Y176.587 E.01631
G1 X207.157 Y176.372 E.0117
G1 X206.582 Y176.947 E.02205
G1 X205.803 Y177.137 E.02172
G1 X206.782 Y176.157 E.03753
G1 X206.408 Y175.942 E.0117
G1 X205.024 Y177.326 E.05301
G1 X204.246 Y177.515 E.02172
G1 X206.033 Y175.728 E.0685
G1 X205.658 Y175.513 E.0117
G1 X203.467 Y177.704 E.08398
G1 X202.688 Y177.893 E.02172
G1 X205.284 Y175.298 E.09946
G1 X204.909 Y175.083 E.0117
G1 X201.909 Y178.083 E.11495
G1 X201.131 Y178.272 E.02172
G1 X204.534 Y174.868 E.13043
G1 X204.16 Y174.653 E.0117
G1 X200.352 Y178.461 E.14591
G1 X199.573 Y178.65 E.02172
G1 X203.785 Y174.439 E.1614
G1 X203.41 Y174.224 E.0117
G1 X198.795 Y178.84 E.17688
G1 X198.016 Y179.029 E.02172
G1 X203.036 Y174.009 E.19236
G1 X202.661 Y173.794 E.0117
G1 X197.237 Y179.218 E.20785
G1 X196.458 Y179.407 E.02172
G1 X202.286 Y173.579 E.22333
G1 X201.911 Y173.365 E.0117
G1 X195.68 Y179.597 E.23881
G1 X194.901 Y179.786 E.02172
G1 X201.537 Y173.15 E.2543
G1 X201.162 Y172.935 E.0117
G1 X194.122 Y179.975 E.26978
G1 X193.343 Y180.164 E.02172
G1 X200.787 Y172.72 E.28526
G1 X200.413 Y172.505 E.0117
G1 X192.565 Y180.353 E.30075
G1 X191.786 Y180.543 E.02172
G1 X200.038 Y172.291 E.31623
G1 X199.663 Y172.076 E.0117
G1 X191.007 Y180.732 E.33171
G1 X190.228 Y180.921 E.02172
G1 X199.289 Y171.861 E.34719
G1 X198.914 Y171.646 E.0117
G1 X189.45 Y181.11 E.36268
G1 X188.671 Y181.3 E.02172
G1 X198.539 Y171.431 E.37816
G1 X198.165 Y171.217 E.0117
G1 X187.892 Y181.489 E.39364
G1 X187.114 Y181.678 E.02172
G1 X197.79 Y171.002 E.40913
G1 X197.415 Y170.787 E.0117
G1 X186.335 Y181.867 E.42461
G1 X185.556 Y182.057 E.02172
G1 X197.04 Y170.572 E.44009
G1 X196.666 Y170.357 E.0117
G1 X184.777 Y182.246 E.45558
G1 X183.999 Y182.435 E.02172
G1 X196.291 Y170.143 E.47106
G1 X195.916 Y169.928 E.0117
G1 X183.22 Y182.624 E.48654
G1 X182.441 Y182.813 E.02172
G1 X195.542 Y169.713 E.50203
G1 X195.167 Y169.498 E.0117
G1 X181.662 Y183.003 E.51751
G1 X180.884 Y183.192 E.02172
G1 X194.792 Y169.283 E.53299
G1 X194.418 Y169.069 E.0117
G1 X180.105 Y183.381 E.54848
G1 X179.326 Y183.57 E.02172
G1 X194.043 Y168.854 E.56396
G1 X193.668 Y168.639 E.0117
G1 X178.547 Y183.76 E.57944
G1 X177.769 Y183.949 E.02172
G1 X193.294 Y168.424 E.59493
G1 X192.919 Y168.209 E.0117
G1 X176.99 Y184.138 E.61041
G1 X176.211 Y184.327 E.02172
G1 X192.544 Y167.994 E.62589
G1 X192.169 Y167.78 E.0117
G1 X175.433 Y184.517 E.64138
G1 X174.654 Y184.706 E.02172
G1 X191.795 Y167.565 E.65686
G1 X191.42 Y167.35 E.0117
G1 X173.875 Y184.895 E.67234
G1 X173.096 Y185.084 E.02172
G1 X191.045 Y167.135 E.68783
G1 X190.671 Y166.92 E.0117
G1 X172.318 Y185.274 E.70331
G1 X171.539 Y185.463 E.02172
G1 X190.296 Y166.706 E.71879
G1 X189.921 Y166.491 E.0117
G1 X170.76 Y185.652 E.73427
G1 X169.981 Y185.841 E.02172
G1 X189.547 Y166.276 E.74976
G1 X189.172 Y166.061 E.0117
G1 X169.203 Y186.03 E.76524
G1 X168.424 Y186.22 E.02172
G1 X188.797 Y165.846 E.78072
G1 X188.422 Y165.632 E.0117
G1 X167.645 Y186.409 E.79621
G1 X166.866 Y186.598 E.02172
G1 X188.048 Y165.417 E.81169
G1 X187.673 Y165.202 E.0117
G1 X166.088 Y186.787 E.82717
G1 X165.309 Y186.977 E.02172
G1 X187.298 Y164.987 E.84266
G1 X186.924 Y164.772 E.0117
G1 X164.53 Y187.166 E.85814
G1 X163.752 Y187.355 E.02172
G1 X186.549 Y164.558 E.87362
G1 X186.174 Y164.343 E.0117
G1 X162.973 Y187.544 E.88911
G1 X162.194 Y187.734 E.02172
G1 X185.8 Y164.128 E.90459
G1 X185.425 Y163.913 E.0117
G1 X161.415 Y187.923 E.92007
G1 X160.637 Y188.112 E.02172
G1 X185.05 Y163.698 E.93556
G1 X184.676 Y163.484 E.0117
G1 X159.858 Y188.301 E.95104
G1 X159.079 Y188.49 E.02172
G1 X184.301 Y163.269 E.96652
G1 X183.926 Y163.054 E.0117
G1 X158.3 Y188.68 E.98201
G1 X157.522 Y188.869 E.02172
G1 X183.551 Y162.839 E.99749
G1 X183.177 Y162.624 E.0117
G1 X156.743 Y189.058 E1.01297
G1 X155.964 Y189.247 E.02172
G1 X182.802 Y162.409 E1.02846
G1 X182.427 Y162.195 E.0117
G1 X155.185 Y189.437 E1.04394
G1 X154.407 Y189.626 E.02172
G1 X182.053 Y161.98 E1.05942
G1 X181.678 Y161.765 E.0117
G1 X153.628 Y189.815 E1.07491
G1 X152.849 Y190.004 E.02172
G1 X181.303 Y161.55 E1.09039
G1 X180.929 Y161.335 E.0117
G1 X152.071 Y190.194 E1.10587
G1 X151.292 Y190.383 E.02172
G1 X180.554 Y161.121 E1.12135
G1 X180.179 Y160.906 E.0117
G1 X150.513 Y190.572 E1.13684
G1 X149.734 Y190.761 E.02172
G1 X179.805 Y160.691 E1.15232
G1 X179.43 Y160.476 E.0117
G1 X148.956 Y190.95 E1.1678
G1 X148.177 Y191.14 E.02172
G1 X179.055 Y160.261 E1.18329
G1 X178.68 Y160.047 E.0117
G1 X147.398 Y191.329 E1.19877
G1 X146.619 Y191.518 E.02172
G1 X178.306 Y159.832 E1.21425
G1 X177.931 Y159.617 E.0117
G1 X145.841 Y191.707 E1.22974
G1 X145.062 Y191.897 E.02172
G1 X177.556 Y159.402 E1.24522
G1 X177.182 Y159.187 E.0117
G1 X144.283 Y192.086 E1.2607
G1 X143.504 Y192.275 E.02172
G1 X176.807 Y158.973 E1.27619
G1 X176.432 Y158.758 E.0117
G1 X142.726 Y192.464 E1.29167
G1 X141.947 Y192.654 E.02172
G1 X176.058 Y158.543 E1.30715
G1 X175.683 Y158.328 E.0117
G1 X141.168 Y192.843 E1.32264
G1 X140.39 Y193.032 E.02172
G1 X175.308 Y158.113 E1.33812
G1 X174.933 Y157.899 E.0117
G1 X139.611 Y193.221 E1.3536
G1 X138.832 Y193.41 E.02172
G1 X174.559 Y157.684 E1.36909
G1 X174.184 Y157.469 E.0117
G1 X138.053 Y193.6 E1.38457
M73 P31 R47
G1 X137.275 Y193.789 E.02172
G1 X173.809 Y157.254 E1.40005
G1 X173.435 Y157.039 E.0117
G1 X136.496 Y193.978 E1.41554
G1 X135.717 Y194.167 E.02172
G1 X173.06 Y156.825 E1.43102
G1 X172.685 Y156.61 E.0117
G1 X134.938 Y194.357 E1.4465
G1 X134.16 Y194.546 E.02172
G1 X172.311 Y156.395 E1.46199
G1 X171.936 Y156.18 E.0117
G1 X133.381 Y194.735 E1.47747
G1 X132.602 Y194.924 E.02172
G1 X171.561 Y155.965 E1.49295
G1 X171.187 Y155.75 E.0117
G1 X132.458 Y194.479 E1.48413
G1 X132.47 Y193.878 E.0163
G1 X170.812 Y155.536 E1.46931
G1 X170.437 Y155.321 E.0117
G1 X132.482 Y193.276 E1.45449
G1 X132.494 Y192.675 E.0163
G1 X170.062 Y155.106 E1.43967
G1 X169.688 Y154.891 E.0117
G1 X132.506 Y192.073 E1.42485
G1 X132.518 Y191.472 E.0163
G1 X169.313 Y154.676 E1.41003
G1 X168.938 Y154.462 E.0117
G1 X132.53 Y190.87 E1.39522
G1 X132.542 Y190.269 E.0163
G1 X168.564 Y154.247 E1.3804
G1 X168.189 Y154.032 E.0117
G1 X132.554 Y189.667 E1.36558
G1 X132.566 Y189.066 E.0163
G1 X167.814 Y153.817 E1.35076
G1 X167.44 Y153.602 E.0117
G1 X132.578 Y188.464 E1.33594
G1 X132.59 Y187.863 E.0163
G1 X167.065 Y153.388 E1.32112
G1 X166.69 Y153.173 E.0117
G1 X132.602 Y187.261 E1.3063
G1 X132.614 Y186.659 E.0163
G1 X166.316 Y152.958 E1.29148
G1 X165.941 Y152.743 E.0117
G1 X132.626 Y186.058 E1.27666
G1 X132.638 Y185.456 E.0163
G1 X165.566 Y152.528 E1.26184
G1 X165.191 Y152.314 E.0117
G1 X132.65 Y184.855 E1.24702
G1 X132.662 Y184.253 E.0163
G1 X164.817 Y152.099 E1.2322
G1 X164.442 Y151.884 E.0117
G1 X132.674 Y183.652 E1.21738
G1 X132.686 Y183.05 E.0163
G1 X164.067 Y151.669 E1.20256
G1 X163.693 Y151.454 E.0117
G1 X132.698 Y182.449 E1.18774
G1 X132.71 Y181.847 E.0163
G1 X163.318 Y151.24 E1.17292
G1 X162.943 Y151.025 E.0117
G1 X132.722 Y181.246 E1.1581
G1 X132.734 Y180.644 E.0163
G1 X162.569 Y150.81 E1.14328
G1 X162.194 Y150.595 E.0117
G1 X132.746 Y180.043 E1.12846
G1 X132.758 Y179.441 E.0163
G1 X161.819 Y150.38 E1.11364
G1 X161.445 Y150.166 E.0117
G1 X132.771 Y178.84 E1.09882
G1 X132.783 Y178.238 E.0163
G1 X161.07 Y149.951 E1.084
G1 X160.695 Y149.736 E.0117
G1 X132.795 Y177.636 E1.06918
G1 X132.807 Y177.035 E.0163
G1 X160.32 Y149.521 E1.05436
G1 X159.946 Y149.306 E.0117
G1 X132.819 Y176.433 E1.03954
G1 X132.831 Y175.832 E.0163
G1 X159.571 Y149.091 E1.02472
G1 X159.196 Y148.877 E.0117
G1 X132.843 Y175.23 E1.0099
G1 X132.855 Y174.629 E.0163
G1 X158.822 Y148.662 E.99508
G1 X158.447 Y148.447 E.0117
G1 X132.867 Y174.027 E.98026
G1 X132.879 Y173.426 E.0163
G1 X158.072 Y148.232 E.96544
G1 X157.698 Y148.017 E.0117
G1 X132.891 Y172.824 E.95062
G1 X132.903 Y172.223 E.0163
G1 X157.323 Y147.803 E.9358
G1 X156.948 Y147.588 E.0117
G1 X132.915 Y171.621 E.92098
G1 X132.927 Y171.02 E.0163
G1 X156.573 Y147.373 E.90616
G1 X156.199 Y147.158 E.0117
G1 X132.939 Y170.418 E.89134
G1 X132.951 Y169.816 E.0163
G1 X155.824 Y146.943 E.87652
M73 P32 R47
G1 X155.449 Y146.729 E.0117
G1 X132.963 Y169.215 E.8617
G1 X132.975 Y168.613 E.0163
G1 X155.075 Y146.514 E.84688
G1 X154.7 Y146.299 E.0117
G1 X132.987 Y168.012 E.83206
G1 X132.999 Y167.41 E.0163
G1 X154.325 Y146.084 E.81724
G1 X153.951 Y145.869 E.0117
G1 X133.011 Y166.809 E.80242
G1 X133.023 Y166.207 E.0163
G1 X153.576 Y145.655 E.7876
G1 X153.201 Y145.44 E.0117
G1 X133.035 Y165.606 E.77278
G1 X133.047 Y165.004 E.0163
G1 X152.827 Y145.225 E.75796
G1 X152.452 Y145.01 E.0117
G1 X133.059 Y164.403 E.74314
G1 X133.071 Y163.801 E.0163
G1 X152.077 Y144.795 E.72832
G1 X151.702 Y144.581 E.0117
G1 X133.083 Y163.2 E.7135
G1 X133.095 Y162.598 E.0163
G1 X151.328 Y144.366 E.69868
G1 X150.953 Y144.151 E.0117
G1 X133.108 Y161.996 E.68386
G1 X133.12 Y161.395 E.0163
G1 X150.578 Y143.936 E.66904
G1 X150.204 Y143.721 E.0117
G1 X133.132 Y160.793 E.65422
G1 X133.144 Y160.192 E.0163
G1 X149.829 Y143.507 E.6394
G1 X149.454 Y143.292 E.0117
G1 X133.156 Y159.59 E.62458
G1 X133.168 Y158.989 E.0163
G1 X149.08 Y143.077 E.60976
G1 X148.705 Y142.862 E.0117
G1 X133.18 Y158.387 E.59494
G1 X133.192 Y157.786 E.0163
G1 X148.33 Y142.647 E.58012
G1 X147.956 Y142.432 E.0117
G1 X133.204 Y157.184 E.5653
G1 X133.216 Y156.583 E.0163
G1 X147.581 Y142.218 E.55048
G1 X147.206 Y142.003 E.0117
G1 X133.228 Y155.981 E.53566
G1 X133.24 Y155.38 E.0163
G1 X146.831 Y141.788 E.52084
G1 X146.457 Y141.573 E.0117
G1 X133.252 Y154.778 E.50602
G1 X133.264 Y154.176 E.0163
G1 X146.082 Y141.358 E.4912
G1 X145.707 Y141.144 E.0117
G1 X133.276 Y153.575 E.47638
G1 X133.288 Y152.973 E.0163
G1 X144.469 Y141.793 E.42846
G1 X143.074 Y142.598 E.04364
G1 X133.3 Y152.372 E.37455
G1 X133.312 Y151.77 E.0163
G1 X141.679 Y143.403 E.32064
G1 X140.285 Y144.208 E.04364
G1 X133.324 Y151.169 E.26673
G1 X133.336 Y150.567 E.0163
G1 X138.89 Y145.014 E.21282
G1 X137.495 Y145.819 E.04364
G1 X133.348 Y149.966 E.15891
G1 X133.36 Y149.364 E.0163
G1 X136.1 Y146.624 E.105
G1 X134.705 Y147.43 E.04364
G1 X133.181 Y148.954 E.0584
; OBJECT_ID: 409
; WIPE_START
G1 X134.596 Y147.539 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 381
M625
; start printing object, unique label id: 409
M624 CAAAAAAAAAA=
M204 S10000
G1 X127.36 Y149.967 Z1.08 F30000
G1 X47.359 Y176.813 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X110.351 Y140.7 E1.96749
G1 X122.968 Y147.985 E.39478
G1 X123.917 Y195.416 E1.28551
G1 X47.417 Y176.827 E2.13324
; WIPE_START
G1 X49.152 Y175.831 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.361 Y176.983 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X46.288 Y176.965 E.00188
G1 F3240
G1 X110.224 Y140.311 E1.85285
G1 F3600
G1 X110.273 Y140.311 E.00122
G1 X110.327 Y140.311 E.00137
G1 X110.375 Y140.311 E.00121
G1 X110.478 Y140.312 E.00259
G1 F3240
G1 X123.237 Y147.678 E.3704
G1 F3600
G1 X123.29 Y147.768 E.00263
G1 X123.314 Y147.807 E.00115
G1 X123.367 Y147.897 E.00263
G1 F3240
G1 X124.325 Y195.782 E1.20413
G1 F3600
G1 X124.274 Y195.823 E.00163
G1 X124.186 Y195.894 E.00286
G1 X46.419 Y176.997 E2.01206
; WIPE_START
M204 S4000
G1 X46.288 Y176.965 E-.05118
G1 X47.906 Y176.037 E-.70882
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.895 Y177.013 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.469 Y176.586 E.01634
G1 X48.844 Y176.372 E.0117
G1 X49.42 Y176.948 E.02207
G1 X50.198 Y177.137 E.02172
G1 X49.218 Y176.157 E.03756
G1 X49.593 Y175.942 E.0117
G1 X50.977 Y177.326 E.05304
G1 X51.756 Y177.515 E.02172
G1 X49.968 Y175.727 E.06852
G1 X50.342 Y175.512 E.0117
G1 X52.534 Y177.705 E.08401
G1 X53.313 Y177.894 E.02172
G1 X50.717 Y175.298 E.09949
G1 X51.092 Y175.083 E.0117
G1 X54.092 Y178.083 E.11497
G1 X54.871 Y178.272 E.02172
G1 X51.466 Y174.868 E.13046
G1 X51.841 Y174.653 E.0117
G1 X55.649 Y178.461 E.14594
G1 X56.428 Y178.651 E.02172
G1 X52.216 Y174.438 E.16142
G1 X52.59 Y174.223 E.0117
G1 X57.207 Y178.84 E.17691
G1 X57.986 Y179.029 E.02172
G1 X52.965 Y174.009 E.19239
G1 X53.34 Y173.794 E.0117
G1 X58.764 Y179.218 E.20787
G1 X59.543 Y179.408 E.02172
G1 X53.715 Y173.579 E.22336
G1 X54.089 Y173.364 E.0117
G1 X60.322 Y179.597 E.23884
G1 X61.101 Y179.786 E.02172
G1 X54.464 Y173.149 E.25432
G1 X54.839 Y172.935 E.0117
G1 X61.879 Y179.975 E.26981
G1 X62.658 Y180.165 E.02172
G1 X55.213 Y172.72 E.28529
G1 X55.588 Y172.505 E.0117
G1 X63.437 Y180.354 E.30077
G1 X64.215 Y180.543 E.02172
G1 X55.963 Y172.29 E.31626
G1 X56.337 Y172.075 E.0117
G1 X64.994 Y180.732 E.33174
G1 X65.773 Y180.921 E.02172
G1 X56.712 Y171.861 E.34722
G1 X57.087 Y171.646 E.0117
G1 X66.552 Y181.111 E.36271
G1 X67.33 Y181.3 E.02172
G1 X57.461 Y171.431 E.37819
G1 X57.836 Y171.216 E.0117
G1 X68.109 Y181.489 E.39367
G1 X68.888 Y181.678 E.02172
G1 X58.211 Y171.001 E.40915
G1 X58.586 Y170.787 E.0117
G1 X69.667 Y181.868 E.42464
G1 X70.445 Y182.057 E.02172
G1 X58.96 Y170.572 E.44012
G1 X59.335 Y170.357 E.0117
G1 X71.224 Y182.246 E.4556
G1 X72.003 Y182.435 E.02172
G1 X59.71 Y170.142 E.47109
G1 X60.084 Y169.927 E.0117
G1 X72.782 Y182.625 E.48657
G1 X73.56 Y182.814 E.02172
G1 X60.459 Y169.713 E.50205
G1 X60.834 Y169.498 E.0117
G1 X74.339 Y183.003 E.51754
G1 X75.118 Y183.192 E.02172
G1 X61.208 Y169.283 E.53302
G1 X61.583 Y169.068 E.0117
G1 X75.896 Y183.381 E.5485
G1 X76.675 Y183.571 E.02172
G1 X61.958 Y168.853 E.56399
G1 X62.332 Y168.638 E.0117
G1 X77.454 Y183.76 E.57947
G1 X78.233 Y183.949 E.02172
G1 X62.707 Y168.424 E.59495
G1 X63.082 Y168.209 E.0117
G1 X79.011 Y184.138 E.61044
G1 X79.79 Y184.328 E.02172
G1 X63.457 Y167.994 E.62592
G1 X63.831 Y167.779 E.0117
G1 X80.569 Y184.517 E.6414
G1 X81.348 Y184.706 E.02172
G1 X64.206 Y167.564 E.65689
G1 X64.581 Y167.35 E.0117
G1 X82.126 Y184.895 E.67237
G1 X82.905 Y185.085 E.02172
G1 X64.955 Y167.135 E.68785
G1 X65.33 Y166.92 E.0117
G1 X83.684 Y185.274 E.70334
G1 X84.463 Y185.463 E.02172
G1 X65.705 Y166.705 E.71882
G1 X66.079 Y166.49 E.0117
G1 X85.241 Y185.652 E.7343
G1 X86.02 Y185.842 E.02172
G1 X66.454 Y166.276 E.74979
G1 X66.829 Y166.061 E.0117
G1 X86.799 Y186.031 E.76527
G1 X87.578 Y186.22 E.02172
G1 X67.204 Y165.846 E.78075
G1 X67.578 Y165.631 E.0117
G1 X88.356 Y186.409 E.79624
G1 X89.135 Y186.598 E.02172
G1 X67.953 Y165.416 E.81172
G1 X68.328 Y165.202 E.0117
G1 X89.914 Y186.788 E.8272
G1 X90.692 Y186.977 E.02172
G1 X68.702 Y164.987 E.84269
G1 X69.077 Y164.772 E.0117
G1 X91.471 Y187.166 E.85817
G1 X92.25 Y187.355 E.02172
G1 X69.452 Y164.557 E.87365
G1 X69.826 Y164.342 E.0117
G1 X93.029 Y187.545 E.88913
G1 X93.807 Y187.734 E.02172
G1 X70.201 Y164.128 E.90462
G1 X70.576 Y163.913 E.0117
G1 X94.586 Y187.923 E.9201
G1 X95.365 Y188.112 E.02172
G1 X70.95 Y163.698 E.93558
G1 X71.325 Y163.483 E.0117
G1 X96.144 Y188.302 E.95107
G1 X96.922 Y188.491 E.02172
G1 X71.7 Y163.268 E.96655
G1 X72.075 Y163.054 E.0117
G1 X97.701 Y188.68 E.98203
G1 X98.48 Y188.869 E.02172
G1 X72.449 Y162.839 E.99752
G1 X72.824 Y162.624 E.0117
G1 X99.259 Y189.058 E1.013
G1 X100.037 Y189.248 E.02172
G1 X73.199 Y162.409 E1.02848
G1 X73.573 Y162.194 E.0117
G1 X100.816 Y189.437 E1.04397
G1 X101.595 Y189.626 E.02172
G1 X73.948 Y161.979 E1.05945
G1 X74.323 Y161.765 E.0117
G1 X102.373 Y189.815 E1.07493
G1 X103.152 Y190.005 E.02172
G1 X74.697 Y161.55 E1.09042
G1 X75.072 Y161.335 E.0117
G1 X103.931 Y190.194 E1.1059
G1 X104.71 Y190.383 E.02172
G1 X75.447 Y161.12 E1.12138
G1 X75.821 Y160.905 E.0117
G1 X105.488 Y190.572 E1.13687
G1 X106.267 Y190.762 E.02172
G1 X76.196 Y160.691 E1.15235
G1 X76.571 Y160.476 E.0117
G1 X107.046 Y190.951 E1.16783
G1 X107.825 Y191.14 E.02172
G1 X76.946 Y160.261 E1.18332
G1 X77.32 Y160.046 E.0117
G1 X108.603 Y191.329 E1.1988
G1 X109.382 Y191.519 E.02172
G1 X77.695 Y159.831 E1.21428
G1 X78.07 Y159.617 E.0117
G1 X110.161 Y191.708 E1.22977
G1 X110.94 Y191.897 E.02172
G1 X78.444 Y159.402 E1.24525
G1 X78.819 Y159.187 E.0117
G1 X111.718 Y192.086 E1.26073
G1 X112.497 Y192.275 E.02172
G1 X79.194 Y158.972 E1.27622
G1 X79.568 Y158.757 E.0117
G1 X113.276 Y192.465 E1.2917
G1 X114.054 Y192.654 E.02172
G1 X79.943 Y158.543 E1.30718
G1 X80.318 Y158.328 E.0117
G1 X114.833 Y192.843 E1.32266
G1 X115.612 Y193.032 E.02172
G1 X80.692 Y158.113 E1.33815
G1 X81.067 Y157.898 E.0117
G1 X116.391 Y193.222 E1.35363
G1 X117.169 Y193.411 E.02172
G1 X81.442 Y157.683 E1.36911
G1 X81.817 Y157.469 E.0117
G1 X117.948 Y193.6 E1.3846
G1 X118.727 Y193.789 E.02172
G1 X82.191 Y157.254 E1.40008
G1 X82.566 Y157.039 E.0117
G1 X119.506 Y193.979 E1.41556
G1 X120.284 Y194.168 E.02172
G1 X82.941 Y156.824 E1.43105
G1 X83.315 Y156.609 E.0117
G1 X121.063 Y194.357 E1.44653
G1 X121.842 Y194.546 E.02172
G1 X83.69 Y156.395 E1.46201
G1 X84.065 Y156.18 E.0117
G1 X122.621 Y194.735 E1.4775
G1 X123.399 Y194.925 E.02172
G1 X84.439 Y155.965 E1.49298
G1 X84.814 Y155.75 E.0117
G1 X123.542 Y194.478 E1.48411
G1 X123.53 Y193.877 E.0163
G1 X85.189 Y155.535 E1.46929
G1 X85.564 Y155.32 E.0117
G1 X123.518 Y193.275 E1.45447
G1 X123.506 Y192.674 E.0163
G1 X85.938 Y155.106 E1.43965
G1 X86.313 Y154.891 E.0117
G1 X123.494 Y192.072 E1.42483
G1 X123.482 Y191.471 E.0163
G1 X86.688 Y154.676 E1.41001
G1 X87.062 Y154.461 E.0117
G1 X123.47 Y190.869 E1.39519
G1 X123.458 Y190.268 E.0163
G1 X87.437 Y154.246 E1.38037
G1 X87.812 Y154.032 E.0117
G1 X123.446 Y189.666 E1.36555
G1 X123.434 Y189.065 E.0163
G1 X88.186 Y153.817 E1.35073
G1 X88.561 Y153.602 E.0117
G1 X123.422 Y188.463 E1.33591
G1 X123.41 Y187.861 E.0163
G1 X88.936 Y153.387 E1.32109
G1 X89.31 Y153.172 E.0117
G1 X123.398 Y187.26 E1.30627
G1 X123.386 Y186.658 E.0163
G1 X89.685 Y152.958 E1.29145
G1 X90.06 Y152.743 E.0117
G1 X123.374 Y186.057 E1.27663
G1 X123.362 Y185.455 E.0163
G1 X90.435 Y152.528 E1.26181
G1 X90.809 Y152.313 E.0117
G1 X123.35 Y184.854 E1.24699
G1 X123.338 Y184.252 E.0163
G1 X91.184 Y152.098 E1.23217
G1 X91.559 Y151.884 E.0117
G1 X123.326 Y183.651 E1.21735
G1 X123.314 Y183.049 E.0163
G1 X91.933 Y151.669 E1.20253
G1 X92.308 Y151.454 E.0117
G1 X123.302 Y182.448 E1.18771
G1 X123.29 Y181.846 E.0163
G1 X92.683 Y151.239 E1.17289
G1 X93.057 Y151.024 E.0117
G1 X123.278 Y181.245 E1.15807
G1 X123.266 Y180.643 E.0163
G1 X93.432 Y150.81 E1.14325
G1 X93.807 Y150.595 E.0117
G1 X123.254 Y180.041 E1.12843
G1 X123.242 Y179.44 E.0163
G1 X94.181 Y150.38 E1.11361
G1 X94.556 Y150.165 E.0117
G1 X123.229 Y178.838 E1.09879
G1 X123.217 Y178.237 E.0163
G1 X94.931 Y149.95 E1.08397
G1 X95.306 Y149.735 E.0117
G1 X123.205 Y177.635 E1.06915
G1 X123.193 Y177.034 E.0163
G1 X95.68 Y149.521 E1.05433
G1 X96.055 Y149.306 E.0117
G1 X123.181 Y176.432 E1.03951
G1 X123.169 Y175.831 E.0163
G1 X96.43 Y149.091 E1.02469
G1 X96.804 Y148.876 E.0117
G1 X123.157 Y175.229 E1.00987
G1 X123.145 Y174.628 E.0163
G1 X97.179 Y148.661 E.99505
G1 X97.554 Y148.447 E.0117
G1 X123.133 Y174.026 E.98023
G1 X123.121 Y173.425 E.0163
G1 X97.928 Y148.232 E.96541
G1 X98.303 Y148.017 E.0117
G1 X123.109 Y172.823 E.95059
G1 X123.097 Y172.221 E.0163
G1 X98.678 Y147.802 E.93577
M73 P33 R47
G1 X99.053 Y147.587 E.0117
G1 X123.085 Y171.62 E.92095
G1 X123.073 Y171.018 E.0163
G1 X99.427 Y147.373 E.90613
G1 X99.802 Y147.158 E.0117
G1 X123.061 Y170.417 E.89131
G1 X123.049 Y169.815 E.0163
G1 X100.177 Y146.943 E.87649
G1 X100.551 Y146.728 E.0117
G1 X123.037 Y169.214 E.86167
G1 X123.025 Y168.612 E.0163
G1 X100.926 Y146.513 E.84685
G1 X101.301 Y146.299 E.0117
G1 X123.013 Y168.011 E.83203
G1 X123.001 Y167.409 E.0163
G1 X101.675 Y146.084 E.81721
G1 X102.05 Y145.869 E.0117
G1 X122.989 Y166.808 E.80239
G1 X122.977 Y166.206 E.0163
G1 X102.425 Y145.654 E.78757
M73 P33 R46
G1 X102.799 Y145.439 E.0117
G1 X122.965 Y165.605 E.77275
G1 X122.953 Y165.003 E.0163
G1 X103.174 Y145.225 E.75793
G1 X103.549 Y145.01 E.0117
G1 X122.941 Y164.402 E.74311
G1 X122.929 Y163.8 E.0163
G1 X103.924 Y144.795 E.72829
G1 X104.298 Y144.58 E.0117
G1 X122.917 Y163.198 E.71347
G1 X122.904 Y162.597 E.0163
G1 X104.673 Y144.365 E.69865
G1 X105.048 Y144.151 E.0117
G1 X122.892 Y161.995 E.68383
G1 X122.88 Y161.394 E.0163
G1 X105.422 Y143.936 E.66901
G1 X105.797 Y143.721 E.0117
G1 X122.868 Y160.792 E.65419
G1 X122.856 Y160.191 E.0163
G1 X106.172 Y143.506 E.63937
G1 X106.546 Y143.291 E.0117
G1 X122.844 Y159.589 E.62455
G1 X122.832 Y158.988 E.0163
G1 X106.921 Y143.076 E.60973
G1 X107.296 Y142.862 E.0117
G1 X122.82 Y158.386 E.59491
G1 X122.808 Y157.785 E.0163
G1 X107.67 Y142.647 E.58009
G1 X108.045 Y142.432 E.0117
G1 X122.796 Y157.183 E.56527
G1 X122.784 Y156.582 E.0163
G1 X108.42 Y142.217 E.55045
G1 X108.795 Y142.002 E.0117
G1 X122.772 Y155.98 E.53563
G1 X122.76 Y155.378 E.0163
G1 X109.169 Y141.788 E.52081
G1 X109.544 Y141.573 E.0117
G1 X122.748 Y154.777 E.50599
G1 X122.736 Y154.175 E.0163
G1 X109.919 Y141.358 E.49117
G1 X110.293 Y141.143 E.0117
G1 X122.724 Y153.574 E.47635
G1 X122.712 Y152.972 E.0163
G1 X111.534 Y141.794 E.42836
G1 X112.928 Y142.599 E.04364
G1 X122.7 Y152.371 E.37445
G1 X122.688 Y151.769 E.0163
G1 X114.323 Y143.405 E.32054
G1 X115.718 Y144.21 E.04364
G1 X122.676 Y151.168 E.26663
G1 X122.664 Y150.566 E.0163
G1 X117.113 Y145.015 E.21272
G1 X118.508 Y145.821 E.04364
G1 X122.652 Y149.965 E.15881
G1 X122.64 Y149.363 E.0163
G1 X119.902 Y146.626 E.1049
G1 X121.297 Y147.431 E.04364
G1 X122.819 Y148.952 E.0583
; OBJECT_ID: 437
; WIPE_START
G1 X121.404 Y147.538 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 409
M625
; start printing object, unique label id: 437
M624 EAAAAAAAAAA=
M204 S10000
G1 X115.945 Y142.204 Z1.08 F30000
G1 X47.359 Y75.187 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X123.917 Y56.584 E2.13486
G1 X122.968 Y104.015 E1.28551
G1 X110.351 Y111.3 E.39478
G1 X47.411 Y75.217 E1.96586
; WIPE_START
G1 X49.354 Y74.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.361 Y75.017 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X124.186 Y56.106 E2.01357
G1 X124.274 Y56.177 E.00286
G1 X124.325 Y56.218 E.00163
G1 F3240
G1 X123.367 Y104.103 E1.20413
G1 F3600
G1 X123.314 Y104.193 E.00263
G1 X123.29 Y104.232 E.00115
G1 X123.237 Y104.322 E.00263
G1 F3240
G1 X110.478 Y111.688 E.3704
G1 F3600
G1 X110.375 Y111.689 E.00259
G1 X110.327 Y111.689 E.00121
G1 X110.224 Y111.689 E.00259
G1 F3240
G1 X46.288 Y75.035 E1.85285
G1 F3600
G1 X46.302 Y75.032 E.00037
; WIPE_START
M204 S4000
G1 X48.246 Y74.559 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.332 Y75.551 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.641 Y75.242 E.01184
G1 X49.42 Y75.052 E.02172
G1 X48.844 Y75.628 E.02208
G1 X49.218 Y75.843 E.0117
G1 X50.198 Y74.863 E.03756
G1 X50.977 Y74.674 E.02172
G1 X49.593 Y76.058 E.05304
G1 X49.968 Y76.273 E.0117
G1 X51.756 Y74.485 E.06852
G1 X52.534 Y74.295 E.02172
G1 X50.342 Y76.488 E.08401
G1 X50.717 Y76.703 E.0117
G1 X53.313 Y74.106 E.09949
G1 X54.092 Y73.917 E.02172
G1 X51.092 Y76.917 E.11497
G1 X51.466 Y77.132 E.0117
G1 X54.871 Y73.728 E.13046
G1 X55.649 Y73.539 E.02172
G1 X51.841 Y77.347 E.14594
G1 X52.216 Y77.562 E.0117
G1 X56.428 Y73.349 E.16142
G1 X57.207 Y73.16 E.02172
G1 X52.59 Y77.777 E.17691
G1 X52.965 Y77.991 E.0117
G1 X57.986 Y72.971 E.19239
G1 X58.764 Y72.782 E.02172
G1 X53.34 Y78.206 E.20787
G1 X53.715 Y78.421 E.0117
G1 X59.543 Y72.592 E.22336
G1 X60.322 Y72.403 E.02172
G1 X54.089 Y78.636 E.23884
G1 X54.464 Y78.851 E.0117
G1 X61.101 Y72.214 E.25432
G1 X61.879 Y72.025 E.02172
G1 X54.839 Y79.065 E.26981
G1 X55.213 Y79.28 E.0117
G1 X62.658 Y71.835 E.28529
G1 X63.437 Y71.646 E.02172
G1 X55.588 Y79.495 E.30077
G1 X55.963 Y79.71 E.0117
G1 X64.215 Y71.457 E.31626
G1 X64.994 Y71.268 E.02172
G1 X56.337 Y79.925 E.33174
G1 X56.712 Y80.139 E.0117
G1 X65.773 Y71.079 E.34722
G1 X66.552 Y70.889 E.02172
G1 X57.087 Y80.354 E.36271
G1 X57.461 Y80.569 E.0117
G1 X67.33 Y70.7 E.37819
G1 X68.109 Y70.511 E.02172
G1 X57.836 Y80.784 E.39367
G1 X58.211 Y80.999 E.0117
G1 X68.888 Y70.322 E.40915
G1 X69.667 Y70.132 E.02172
G1 X58.586 Y81.213 E.42464
G1 X58.96 Y81.428 E.0117
G1 X70.445 Y69.943 E.44012
G1 X71.224 Y69.754 E.02172
G1 X59.335 Y81.643 E.4556
G1 X59.71 Y81.858 E.0117
G1 X72.003 Y69.565 E.47109
G1 X72.782 Y69.375 E.02172
G1 X60.084 Y82.073 E.48657
G1 X60.459 Y82.287 E.0117
G1 X73.56 Y69.186 E.50205
G1 X74.339 Y68.997 E.02172
G1 X60.834 Y82.502 E.51754
G1 X61.208 Y82.717 E.0117
G1 X75.118 Y68.808 E.53302
G1 X75.896 Y68.619 E.02172
G1 X61.583 Y82.932 E.5485
G1 X61.958 Y83.147 E.0117
G1 X76.675 Y68.429 E.56399
G1 X77.454 Y68.24 E.02172
G1 X62.332 Y83.362 E.57947
G1 X62.707 Y83.576 E.0117
G1 X78.233 Y68.051 E.59495
G1 X79.011 Y67.862 E.02172
G1 X63.082 Y83.791 E.61044
G1 X63.457 Y84.006 E.0117
G1 X79.79 Y67.672 E.62592
G1 X80.569 Y67.483 E.02172
G1 X63.831 Y84.221 E.6414
G1 X64.206 Y84.436 E.0117
G1 X81.348 Y67.294 E.65689
G1 X82.126 Y67.105 E.02172
G1 X64.581 Y84.65 E.67237
G1 X64.955 Y84.865 E.0117
G1 X82.905 Y66.915 E.68785
G1 X83.684 Y66.726 E.02172
G1 X65.33 Y85.08 E.70333
G1 X65.705 Y85.295 E.0117
G1 X84.463 Y66.537 E.71882
G1 X85.241 Y66.348 E.02172
G1 X66.079 Y85.51 E.7343
G1 X66.454 Y85.724 E.0117
G1 X86.02 Y66.159 E.74978
G1 X86.799 Y65.969 E.02172
G1 X66.829 Y85.939 E.76527
G1 X67.204 Y86.154 E.0117
G1 X87.577 Y65.78 E.78075
G1 X88.356 Y65.591 E.02172
G1 X67.578 Y86.369 E.79623
G1 X67.953 Y86.584 E.0117
G1 X89.135 Y65.402 E.81172
G1 X89.914 Y65.212 E.02172
G1 X68.328 Y86.798 E.8272
G1 X68.702 Y87.013 E.0117
G1 X90.692 Y65.023 E.84268
G1 X91.471 Y64.834 E.02172
G1 X69.077 Y87.228 E.85817
G1 X69.452 Y87.443 E.0117
G1 X92.25 Y64.645 E.87365
G1 X93.029 Y64.455 E.02172
G1 X69.826 Y87.658 E.88913
G1 X70.201 Y87.872 E.0117
G1 X93.807 Y64.266 E.90462
G1 X94.586 Y64.077 E.02172
G1 X70.576 Y88.087 E.9201
G1 X70.95 Y88.302 E.0117
G1 X95.365 Y63.888 E.93558
G1 X96.144 Y63.699 E.02172
G1 X71.325 Y88.517 E.95107
G1 X71.7 Y88.732 E.0117
G1 X96.922 Y63.509 E.96655
G1 X97.701 Y63.32 E.02172
G1 X72.075 Y88.946 E.98203
G1 X72.449 Y89.161 E.0117
G1 X98.48 Y63.131 E.99752
G1 X99.258 Y62.942 E.02172
G1 X72.824 Y89.376 E1.013
G1 X73.199 Y89.591 E.0117
G1 X100.037 Y62.752 E1.02848
G1 X100.816 Y62.563 E.02172
G1 X73.573 Y89.806 E1.04397
G1 X73.948 Y90.021 E.0117
G1 X101.595 Y62.374 E1.05945
G1 X102.373 Y62.185 E.02172
G1 X74.323 Y90.235 E1.07493
G1 X74.697 Y90.45 E.0117
G1 X103.152 Y61.995 E1.09041
G1 X103.931 Y61.806 E.02172
G1 X75.072 Y90.665 E1.1059
G1 X75.447 Y90.88 E.0117
G1 X104.71 Y61.617 E1.12138
G1 X105.488 Y61.428 E.02172
G1 X75.821 Y91.095 E1.13686
G1 X76.196 Y91.309 E.0117
G1 X106.267 Y61.238 E1.15235
G1 X107.046 Y61.049 E.02172
G1 X76.571 Y91.524 E1.16783
G1 X76.946 Y91.739 E.0117
G1 X107.825 Y60.86 E1.18331
G1 X108.603 Y60.671 E.02172
G1 X77.32 Y91.954 E1.1988
G1 X77.695 Y92.169 E.0117
G1 X109.382 Y60.482 E1.21428
G1 X110.161 Y60.292 E.02172
G1 X78.07 Y92.383 E1.22976
G1 X78.444 Y92.598 E.0117
G1 X110.939 Y60.103 E1.24525
G1 X111.718 Y59.914 E.02172
G1 X78.819 Y92.813 E1.26073
G1 X79.194 Y93.028 E.0117
G1 X112.497 Y59.725 E1.27621
G1 X113.276 Y59.535 E.02172
G1 X79.568 Y93.243 E1.2917
G1 X79.943 Y93.457 E.0117
G1 X114.054 Y59.346 E1.30718
G1 X114.833 Y59.157 E.02172
G1 X80.318 Y93.672 E1.32266
G1 X80.693 Y93.887 E.0117
G1 X115.612 Y58.968 E1.33815
G1 X116.391 Y58.778 E.02172
G1 X81.067 Y94.102 E1.35363
G1 X81.442 Y94.317 E.0117
G1 X117.169 Y58.589 E1.36911
G1 X117.948 Y58.4 E.02172
G1 X81.817 Y94.531 E1.3846
G1 X82.191 Y94.746 E.0117
G1 X118.727 Y58.211 E1.40008
G1 X119.506 Y58.022 E.02172
G1 X82.566 Y94.961 E1.41556
G1 X82.941 Y95.176 E.0117
G1 X120.284 Y57.832 E1.43104
G1 X121.063 Y57.643 E.02172
G1 X83.315 Y95.391 E1.44653
G1 X83.69 Y95.605 E.0117
G1 X121.842 Y57.454 E1.46201
G1 X122.62 Y57.265 E.02172
G1 X84.065 Y95.82 E1.47749
G1 X84.439 Y96.035 E.0117
G1 X123.399 Y57.075 E1.49298
G1 X123.552 Y57.038 E.00426
G1 X123.542 Y57.522 E.0131
G1 X84.814 Y96.25 E1.48411
G1 X85.189 Y96.465 E.0117
G1 X123.53 Y58.123 E1.46929
G1 X123.518 Y58.725 E.0163
G1 X85.564 Y96.68 E1.45447
G1 X85.938 Y96.894 E.0117
G1 X123.506 Y59.326 E1.43965
G1 X123.494 Y59.928 E.0163
G1 X86.313 Y97.109 E1.42483
G1 X86.688 Y97.324 E.0117
G1 X123.482 Y60.529 E1.41001
G1 X123.47 Y61.131 E.0163
G1 X87.062 Y97.539 E1.39519
G1 X87.437 Y97.754 E.0117
G1 X123.458 Y61.732 E1.38037
G1 X123.446 Y62.334 E.0163
G1 X87.812 Y97.968 E1.36555
G1 X88.186 Y98.183 E.0117
G1 X123.434 Y62.935 E1.35073
G1 X123.422 Y63.537 E.0163
G1 X88.561 Y98.398 E1.33591
G1 X88.936 Y98.613 E.0117
G1 X123.41 Y64.139 E1.32109
G1 X123.398 Y64.74 E.0163
G1 X89.31 Y98.828 E1.30627
G1 X89.685 Y99.042 E.0117
G1 X123.386 Y65.342 E1.29145
G1 X123.374 Y65.943 E.0163
G1 X90.06 Y99.257 E1.27663
G1 X90.435 Y99.472 E.0117
G1 X123.362 Y66.545 E1.26181
G1 X123.35 Y67.146 E.0163
G1 X90.809 Y99.687 E1.24699
G1 X91.184 Y99.902 E.0117
G1 X123.338 Y67.748 E1.23217
G1 X123.326 Y68.349 E.0163
G1 X91.559 Y100.116 E1.21735
G1 X91.933 Y100.331 E.0117
G1 X123.314 Y68.951 E1.20253
G1 X123.302 Y69.552 E.0163
G1 X92.308 Y100.546 E1.18771
G1 X92.683 Y100.761 E.0117
G1 X123.29 Y70.154 E1.17289
G1 X123.278 Y70.755 E.0163
G1 X93.057 Y100.976 E1.15807
G1 X93.432 Y101.19 E.0117
G1 X123.266 Y71.357 E1.14325
G1 X123.254 Y71.959 E.0163
G1 X93.807 Y101.405 E1.12843
G1 X94.181 Y101.62 E.0117
G1 X123.242 Y72.56 E1.11361
G1 X123.229 Y73.162 E.0163
G1 X94.556 Y101.835 E1.09879
G1 X94.931 Y102.05 E.0117
G1 X123.217 Y73.763 E1.08397
G1 X123.205 Y74.365 E.0163
G1 X95.306 Y102.265 E1.06915
G1 X95.68 Y102.479 E.0117
G1 X123.193 Y74.966 E1.05433
G1 X123.181 Y75.568 E.0163
G1 X96.055 Y102.694 E1.03951
G1 X96.43 Y102.909 E.0117
G1 X123.169 Y76.169 E1.02469
G1 X123.157 Y76.771 E.0163
G1 X96.804 Y103.124 E1.00987
G1 X97.179 Y103.339 E.0117
G1 X123.145 Y77.372 E.99505
M73 P34 R46
G1 X123.133 Y77.974 E.0163
G1 X97.554 Y103.553 E.98023
G1 X97.928 Y103.768 E.0117
G1 X123.121 Y78.575 E.96541
G1 X123.109 Y79.177 E.0163
G1 X98.303 Y103.983 E.95059
G1 X98.678 Y104.198 E.0117
G1 X123.097 Y79.779 E.93577
G1 X123.085 Y80.38 E.0163
G1 X99.053 Y104.413 E.92095
G1 X99.427 Y104.627 E.0117
G1 X123.073 Y80.982 E.90613
G1 X123.061 Y81.583 E.0163
G1 X99.802 Y104.842 E.89131
G1 X100.177 Y105.057 E.0117
G1 X123.049 Y82.185 E.87649
G1 X123.037 Y82.786 E.0163
G1 X100.551 Y105.272 E.86167
G1 X100.926 Y105.487 E.0117
G1 X123.025 Y83.388 E.84685
G1 X123.013 Y83.989 E.0163
G1 X101.301 Y105.701 E.83203
G1 X101.675 Y105.916 E.0117
G1 X123.001 Y84.591 E.81721
G1 X122.989 Y85.192 E.0163
G1 X102.05 Y106.131 E.80239
G1 X102.425 Y106.346 E.0117
G1 X122.977 Y85.794 E.78757
G1 X122.965 Y86.395 E.0163
G1 X102.799 Y106.561 E.77275
G1 X103.174 Y106.775 E.0117
G1 X122.953 Y86.997 E.75793
G1 X122.941 Y87.599 E.0163
G1 X103.549 Y106.99 E.74311
G1 X103.924 Y107.205 E.0117
G1 X122.929 Y88.2 E.72829
G1 X122.917 Y88.802 E.0163
G1 X104.298 Y107.42 E.71347
G1 X104.673 Y107.635 E.0117
G1 X122.904 Y89.403 E.69865
G1 X122.892 Y90.005 E.0163
G1 X105.048 Y107.849 E.68383
G1 X105.422 Y108.064 E.0117
G1 X122.88 Y90.606 E.66901
G1 X122.868 Y91.208 E.0163
G1 X105.797 Y108.279 E.65419
G1 X106.172 Y108.494 E.0117
G1 X122.856 Y91.809 E.63937
G1 X122.844 Y92.411 E.0163
G1 X106.546 Y108.709 E.62455
G1 X106.921 Y108.924 E.0117
G1 X122.832 Y93.012 E.60973
G1 X122.82 Y93.614 E.0163
G1 X107.296 Y109.138 E.59491
G1 X107.67 Y109.353 E.0117
G1 X122.808 Y94.215 E.58009
G1 X122.796 Y94.817 E.0163
G1 X108.045 Y109.568 E.56527
G1 X108.42 Y109.783 E.0117
G1 X122.784 Y95.418 E.55045
G1 X122.772 Y96.02 E.0163
G1 X108.795 Y109.998 E.53563
G1 X109.169 Y110.212 E.0117
G1 X122.76 Y96.622 E.52081
G1 X122.748 Y97.223 E.0163
G1 X109.544 Y110.427 E.50599
G1 X109.919 Y110.642 E.0117
G1 X122.736 Y97.825 E.49117
G1 X122.724 Y98.426 E.0163
G1 X110.293 Y110.857 E.47635
G1 X110.35 Y110.889 E.00177
G1 X111.534 Y110.206 E.03704
G1 X122.712 Y99.028 E.42836
G1 X122.7 Y99.629 E.0163
G1 X112.929 Y109.401 E.37445
G1 X114.323 Y108.595 E.04364
G1 X122.688 Y100.231 E.32054
G1 X122.676 Y100.832 E.0163
G1 X115.718 Y107.79 E.26663
G1 X117.113 Y106.985 E.04364
G1 X122.664 Y101.434 E.21272
G1 X122.652 Y102.035 E.0163
G1 X118.508 Y106.18 E.15881
G1 X119.902 Y105.374 E.04364
G1 X122.64 Y102.637 E.1049
G1 X122.628 Y103.238 E.0163
G1 X120.786 Y105.08 E.07057
; OBJECT_ID: 465
; WIPE_START
G1 X122.2 Y103.666 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 437
M625
; start printing object, unique label id: 465
M624 IAAAAAAAAAA=
M204 S10000
G1 X116.33 Y108.544 Z1.08 F30000
G1 X40.405 Y171.635 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X40.405 Y80.365 E2.47313
G1 X106.444 Y118.225 E2.06269
G1 X106.444 Y133.775 E.42137
G1 X40.457 Y171.605 E2.06106
M204 S10000
G1 X40.009 Y172.264 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X40.009 Y79.736 E2.32629
G1 X40.06 Y79.706 E.00149
G1 F3240
G1 X106.718 Y117.92 E1.93171
G1 F3600
G1 X106.769 Y118.008 E.00258
G1 X106.794 Y118.051 E.00124
G1 X106.845 Y118.14 E.00258
G1 F3240
G1 X106.845 Y133.86 E.39524
G1 F3600
G1 X106.794 Y133.949 E.00258
G1 X106.769 Y133.992 E.00124
G1 X106.718 Y134.08 E.00258
G1 F3240
G1 X40.061 Y172.294 E1.9317
; WIPE_START
M204 S4000
G1 X40.06 Y170.294 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X40.761 Y171.236 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X40.761 Y80.979 E2.4457
G1 X41.177 Y81.218 E.013
G1 X41.177 Y170.782 E2.42693
G1 X41.593 Y170.544 E.013
G1 X41.593 Y81.456 E2.414
G1 X42.009 Y81.695 E.013
G1 X42.009 Y170.305 E2.40108
G1 X42.425 Y170.067 E.013
G1 X42.425 Y81.933 E2.38815
G1 X42.841 Y82.172 E.013
G1 X42.841 Y169.828 E2.37522
G1 X43.257 Y169.589 E.013
G1 X43.257 Y82.411 E2.36229
G1 X43.674 Y82.649 E.013
G1 X43.674 Y169.351 E2.34936
G1 X44.09 Y169.112 E.013
G1 X44.09 Y82.888 E2.33644
G1 X44.506 Y83.126 E.013
G1 X44.506 Y168.874 E2.32351
G1 X44.922 Y168.635 E.013
G1 X44.922 Y83.365 E2.31058
G1 X45.338 Y83.603 E.013
G1 X45.338 Y168.397 E2.29765
G1 X45.754 Y168.158 E.013
G1 X45.754 Y83.842 E2.28473
G1 X46.17 Y84.08 E.013
G1 X46.17 Y167.92 E2.2718
G1 X46.586 Y167.681 E.013
G1 X46.586 Y84.319 E2.25887
G1 X47.002 Y84.557 E.013
G1 X47.002 Y167.443 E2.24594
G1 X47.418 Y167.204 E.013
G1 X47.418 Y84.796 E2.23302
G1 X47.835 Y85.035 E.013
G1 X47.835 Y166.965 E2.22009
G1 X48.251 Y166.727 E.013
G1 X48.251 Y85.273 E2.20716
G1 X48.667 Y85.512 E.013
G1 X48.667 Y166.488 E2.19423
G1 X49.083 Y166.25 E.013
G1 X49.083 Y85.75 E2.1813
G1 X49.499 Y85.989 E.013
G1 X49.499 Y166.011 E2.16838
G1 X49.915 Y165.773 E.013
M73 P34 R45
G1 X49.915 Y86.227 E2.15545
G1 X50.331 Y86.466 E.013
G1 X50.331 Y165.534 E2.14252
G1 X50.747 Y165.296 E.013
G1 X50.747 Y86.704 E2.12959
G1 X51.163 Y86.943 E.013
G1 X51.163 Y165.057 E2.11667
G1 X51.579 Y164.819 E.013
G1 X51.579 Y87.181 E2.10374
G1 X51.996 Y87.42 E.013
G1 X51.996 Y164.58 E2.09081
G1 X52.412 Y164.341 E.013
G1 X52.412 Y87.658 E2.07788
G1 X52.828 Y87.897 E.013
G1 X52.828 Y164.103 E2.06496
G1 X53.244 Y163.864 E.013
G1 X53.244 Y88.136 E2.05203
G1 X53.66 Y88.374 E.013
G1 X53.66 Y163.626 E2.0391
G1 X54.076 Y163.387 E.013
G1 X54.076 Y88.613 E2.02617
G1 X54.492 Y88.851 E.013
G1 X54.492 Y163.149 E2.01324
G1 X54.908 Y162.91 E.013
G1 X54.908 Y89.09 E2.00032
G1 X55.324 Y89.328 E.013
G1 X55.324 Y162.672 E1.98739
G1 X55.74 Y162.433 E.013
G1 X55.74 Y89.567 E1.97446
G1 X56.157 Y89.805 E.013
G1 X56.157 Y162.195 E1.96153
G1 X56.573 Y161.956 E.013
G1 X56.573 Y90.044 E1.94861
G1 X56.989 Y90.282 E.013
G1 X56.989 Y161.717 E1.93568
G1 X57.405 Y161.479 E.013
G1 X57.405 Y90.521 E1.92275
G1 X57.821 Y90.76 E.013
G1 X57.821 Y161.24 E1.90982
G1 X58.237 Y161.002 E.013
G1 X58.237 Y90.998 E1.8969
G1 X58.653 Y91.237 E.013
G1 X58.653 Y160.763 E1.88397
G1 X59.069 Y160.525 E.013
G1 X59.069 Y91.475 E1.87104
G1 X59.485 Y91.714 E.013
G1 X59.485 Y160.286 E1.85811
G1 X59.901 Y160.048 E.013
G1 X59.901 Y91.952 E1.84518
G1 X60.318 Y92.191 E.013
G1 X60.318 Y159.809 E1.83226
G1 X60.734 Y159.571 E.013
G1 X60.734 Y92.429 E1.81933
G1 X61.15 Y92.668 E.013
G1 X61.15 Y159.332 E1.8064
G1 X61.566 Y159.094 E.013
G1 X61.566 Y92.906 E1.79347
G1 X61.982 Y93.145 E.013
G1 X61.982 Y158.855 E1.78055
G1 X62.398 Y158.616 E.013
G1 X62.398 Y93.384 E1.76762
G1 X62.814 Y93.622 E.013
G1 X62.814 Y158.378 E1.75469
G1 X63.23 Y158.139 E.013
G1 X63.23 Y93.861 E1.74176
G1 X63.646 Y94.099 E.013
G1 X63.646 Y157.901 E1.72884
G1 X64.062 Y157.662 E.013
G1 X64.062 Y94.338 E1.71591
G1 X64.479 Y94.576 E.013
G1 X64.479 Y157.424 E1.70298
G1 X64.895 Y157.185 E.013
G1 X64.895 Y94.815 E1.69005
G1 X65.311 Y95.053 E.013
G1 X65.311 Y156.947 E1.67712
G1 X65.727 Y156.708 E.013
G1 X65.727 Y95.292 E1.6642
G1 X66.143 Y95.53 E.013
G1 X66.143 Y156.47 E1.65127
G1 X66.559 Y156.231 E.013
G1 X66.559 Y95.769 E1.63834
G1 X66.975 Y96.008 E.013
G1 X66.975 Y155.992 E1.62541
G1 X67.391 Y155.754 E.013
G1 X67.391 Y96.246 E1.61249
G1 X67.807 Y96.485 E.013
G1 X67.807 Y155.515 E1.59956
G1 X68.223 Y155.277 E.013
G1 X68.223 Y96.723 E1.58663
G1 X68.64 Y96.962 E.013
G1 X68.64 Y155.038 E1.5737
G1 X69.056 Y154.8 E.013
G1 X69.056 Y97.2 E1.56078
M73 P35 R45
G1 X69.472 Y97.439 E.013
G1 X69.472 Y154.561 E1.54785
G1 X69.888 Y154.323 E.013
G1 X69.888 Y97.677 E1.53492
G1 X70.304 Y97.916 E.013
G1 X70.304 Y154.084 E1.52199
G1 X70.72 Y153.846 E.013
G1 X70.72 Y98.154 E1.50906
G1 X71.136 Y98.393 E.013
G1 X71.136 Y153.607 E1.49614
G1 X71.552 Y153.368 E.013
G1 X71.552 Y98.632 E1.48321
G1 X71.968 Y98.87 E.013
G1 X71.968 Y153.13 E1.47028
G1 X72.384 Y152.891 E.013
G1 X72.384 Y99.109 E1.45735
G1 X72.801 Y99.347 E.013
G1 X72.801 Y152.653 E1.44443
G1 X73.217 Y152.414 E.013
G1 X73.217 Y99.586 E1.4315
G1 X73.633 Y99.824 E.013
G1 X73.633 Y152.176 E1.41857
G1 X74.049 Y151.937 E.013
G1 X74.049 Y100.063 E1.40564
G1 X74.465 Y100.301 E.013
G1 X74.465 Y151.699 E1.39272
G1 X74.881 Y151.46 E.013
G1 X74.881 Y100.54 E1.37979
G1 X75.297 Y100.778 E.013
G1 X75.297 Y151.222 E1.36686
G1 X75.713 Y150.983 E.013
G1 X75.713 Y101.017 E1.35393
G1 X76.129 Y101.256 E.013
G1 X76.129 Y150.744 E1.341
G1 X76.545 Y150.506 E.013
G1 X76.545 Y101.494 E1.32808
G1 X76.962 Y101.733 E.013
G1 X76.962 Y150.267 E1.31515
G1 X77.378 Y150.029 E.013
G1 X77.378 Y101.971 E1.30222
G1 X77.794 Y102.21 E.013
G1 X77.794 Y149.79 E1.28929
G1 X78.21 Y149.552 E.013
G1 X78.21 Y102.448 E1.27637
G1 X78.626 Y102.687 E.013
G1 X78.626 Y149.313 E1.26344
G1 X79.042 Y149.075 E.013
G1 X79.042 Y102.925 E1.25051
G1 X79.458 Y103.164 E.013
G1 X79.458 Y148.836 E1.23758
G1 X79.874 Y148.598 E.013
G1 X79.874 Y103.402 E1.22466
G1 X80.29 Y103.641 E.013
G1 X80.29 Y148.359 E1.21173
G1 X80.706 Y148.12 E.013
G1 X80.706 Y103.88 E1.1988
G1 X81.123 Y104.118 E.013
G1 X81.123 Y147.882 E1.18587
G1 X81.539 Y147.643 E.013
G1 X81.539 Y104.357 E1.17294
G1 X81.955 Y104.595 E.013
G1 X81.955 Y147.405 E1.16002
G1 X82.371 Y147.166 E.013
G1 X82.371 Y104.834 E1.14709
G1 X82.787 Y105.072 E.013
G1 X82.787 Y146.928 E1.13416
G1 X83.203 Y146.689 E.013
G1 X83.203 Y105.311 E1.12123
G1 X83.619 Y105.549 E.013
G1 X83.619 Y146.451 E1.10831
G1 X84.035 Y146.212 E.013
G1 X84.035 Y105.788 E1.09538
G1 X84.451 Y106.026 E.013
G1 X84.451 Y145.974 E1.08245
G1 X84.867 Y145.735 E.013
G1 X84.867 Y106.265 E1.06952
G1 X85.284 Y106.503 E.013
G1 X85.284 Y145.496 E1.0566
G1 X85.7 Y145.258 E.013
G1 X85.7 Y106.742 E1.04367
G1 X86.116 Y106.981 E.013
G1 X86.116 Y145.019 E1.03074
G1 X86.532 Y144.781 E.013
G1 X86.532 Y107.219 E1.01781
G1 X86.948 Y107.458 E.013
G1 X86.948 Y144.542 E1.00488
G1 X87.364 Y144.304 E.013
G1 X87.364 Y107.696 E.99196
G1 X87.78 Y107.935 E.013
G1 X87.78 Y144.065 E.97903
G1 X88.196 Y143.827 E.013
G1 X88.196 Y108.173 E.9661
G1 X88.612 Y108.412 E.013
G1 X88.612 Y143.588 E.95317
G1 X89.028 Y143.35 E.013
G1 X89.028 Y108.65 E.94025
G1 X89.445 Y108.889 E.013
G1 X89.445 Y143.111 E.92732
G1 X89.861 Y142.873 E.013
G1 X89.861 Y109.127 E.91439
G1 X90.277 Y109.366 E.013
G1 X90.277 Y142.634 E.90146
G1 X90.693 Y142.395 E.013
G1 X90.693 Y109.605 E.88854
G1 X91.109 Y109.843 E.013
G1 X91.109 Y142.157 E.87561
G1 X91.525 Y141.918 E.013
G1 X91.525 Y110.082 E.86268
G1 X91.941 Y110.32 E.013
G1 X91.941 Y141.68 E.84975
G1 X92.357 Y141.441 E.013
G1 X92.357 Y110.559 E.83682
G1 X92.773 Y110.797 E.013
G1 X92.773 Y141.203 E.8239
G1 X93.189 Y140.964 E.013
G1 X93.189 Y111.036 E.81097
G1 X93.606 Y111.274 E.013
G1 X93.606 Y140.726 E.79804
G1 X94.022 Y140.487 E.013
G1 X94.022 Y111.513 E.78511
G1 X94.438 Y111.751 E.013
G1 X94.438 Y140.249 E.77219
G1 X94.854 Y140.01 E.013
G1 X94.854 Y111.99 E.75926
G1 X95.27 Y112.229 E.013
G1 X95.27 Y139.771 E.74633
G1 X95.686 Y139.533 E.013
G1 X95.686 Y112.467 E.7334
G1 X96.102 Y112.706 E.013
G1 X96.102 Y139.294 E.72048
G1 X96.518 Y139.056 E.013
G1 X96.518 Y112.944 E.70755
G1 X96.934 Y113.183 E.013
G1 X96.934 Y138.817 E.69462
G1 X97.35 Y138.579 E.013
G1 X97.35 Y113.421 E.68169
G1 X97.767 Y113.66 E.013
G1 X97.767 Y138.34 E.66876
G1 X98.183 Y138.102 E.013
G1 X98.183 Y113.898 E.65584
G1 X98.599 Y114.137 E.013
G1 X98.599 Y137.863 E.64291
G1 X99.015 Y137.625 E.013
G1 X99.015 Y114.375 E.62998
G1 X99.431 Y114.614 E.013
G1 X99.431 Y137.386 E.61705
G1 X99.847 Y137.147 E.013
G1 X99.847 Y114.853 E.60413
G1 X100.263 Y115.091 E.013
G1 X100.263 Y136.909 E.5912
G1 X100.679 Y136.67 E.013
G1 X100.679 Y115.33 E.57827
G1 X101.095 Y115.568 E.013
G1 X101.095 Y136.432 E.56534
G1 X101.511 Y136.193 E.013
G1 X101.511 Y115.807 E.55242
G1 X101.928 Y116.045 E.013
G1 X101.928 Y135.955 E.53949
G1 X102.344 Y135.716 E.013
G1 X102.344 Y116.284 E.52656
G1 X102.76 Y116.522 E.013
G1 X102.76 Y135.478 E.51363
G1 X103.176 Y135.239 E.013
G1 X103.176 Y116.761 E.5007
G1 X103.592 Y116.999 E.013
G1 X103.592 Y135.001 E.48778
G1 X104.008 Y134.762 E.013
G1 X104.008 Y117.238 E.47485
G1 X104.424 Y117.477 E.013
G1 X104.424 Y134.523 E.46192
G1 X104.84 Y134.285 E.013
G1 X104.84 Y117.715 E.44899
G1 X105.256 Y117.954 E.013
G1 X105.256 Y134.046 E.43607
G1 X105.672 Y133.808 E.013
G1 X105.672 Y118.192 E.42314
G1 X106.089 Y118.431 E.013
G1 X106.089 Y133.785 E.41605
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X106.089 Y131.785 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 465
M625
; layer num/total_layer_count: 5/14
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M204 S10000
G17
G3 Z1.08 I1.217 J0 P1  F30000
; object ids of layer 5 start: 325,353,381,409,437,465
M624 PwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer5 end: 325,353,381,409,437,465
M625
; OBJECT_ID: 325
; start printing object, unique label id: 325
M624 AQAAAAAAAAA=
G1 X208.756 Y75.215
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X145.833 Y111.288 E1.96535
G1 X145.466 Y111.288 E.00995
G1 X133.139 Y104.171 E.3857
G1 X132.947 Y103.847 E.01019
G1 X132.001 Y56.564 E1.28149
G1 X208.698 Y75.201 E2.13873
; WIPE_START
G1 X206.963 Y76.197 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.77 Y75.049 Z1.24 F30000
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X209.812 Y75.059 E.00108
G1 X209.813 Y75.071 E.0003
G1 X145.939 Y111.689 E1.85105
G1 X145.858 Y111.689 E.00204
G1 X145.439 Y111.688 E.01053
G1 X145.358 Y111.688 E.00204
G1 X132.847 Y104.465 E.3632
G1 X132.805 Y104.394 E.00207
G1 X132.591 Y104.031 E.0106
G1 X132.549 Y103.96 E.00207
G1 X131.595 Y56.282 E1.19892
G1 X131.635 Y56.25 E.00129
G1 X131.814 Y56.106 E.00579
G1 X209.712 Y75.035 E2.01543
; WIPE_START
M204 S4000
G1 X209.812 Y75.059 E-.03913
G1 X209.813 Y75.071 E-.00449
G1 X208.178 Y76.009 E-.71638
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.783 Y75.579 Z1.24 F30000
G1 Z.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.474 Y75.27 E.01185
G1 X206.694 Y75.08 E.02175
G1 X207.271 Y75.657 E.0221
G1 X206.896 Y75.872 E.01172
G1 X205.914 Y74.891 E.03761
G1 X205.134 Y74.701 E.02175
G1 X206.52 Y76.087 E.05312
G1 X206.145 Y76.302 E.01172
G1 X204.354 Y74.512 E.06862
G1 X203.575 Y74.322 E.02175
G1 X205.77 Y76.517 E.08413
G1 X205.395 Y76.732 E.01172
G1 X202.795 Y74.132 E.09963
G1 X202.015 Y73.943 E.02175
G1 X205.019 Y76.948 E.11514
G1 X204.644 Y77.163 E.01172
G1 X201.235 Y73.753 E.13064
G1 X200.455 Y73.564 E.02175
G1 X204.269 Y77.378 E.14615
G1 X203.894 Y77.593 E.01172
G1 X199.675 Y73.374 E.16166
G1 X198.895 Y73.185 E.02175
G1 X203.518 Y77.808 E.17716
G1 X203.143 Y78.023 E.01172
G1 X198.116 Y72.995 E.19267
G1 X197.336 Y72.806 E.02175
G1 X202.768 Y78.238 E.20817
G1 X202.393 Y78.453 E.01172
G1 X196.556 Y72.616 E.22368
G1 X195.776 Y72.427 E.02175
G1 X202.018 Y78.669 E.23919
G1 X201.642 Y78.884 E.01172
G1 X194.996 Y72.237 E.25469
G1 X194.216 Y72.048 E.02175
G1 X201.267 Y79.099 E.2702
G1 X200.892 Y79.314 E.01172
G1 X193.436 Y71.858 E.2857
G1 X192.656 Y71.669 E.02175
G1 X200.517 Y79.529 E.30121
G1 X200.141 Y79.744 E.01172
G1 X191.877 Y71.479 E.31671
G1 X191.097 Y71.29 E.02175
G1 X199.766 Y79.959 E.33222
G1 X199.391 Y80.174 E.01172
G1 X190.317 Y71.1 E.34773
G1 X189.537 Y70.911 E.02175
G1 X199.016 Y80.39 E.36323
G1 X198.64 Y80.605 E.01172
G1 X188.757 Y70.721 E.37874
G1 X187.977 Y70.532 E.02175
G1 X198.265 Y80.82 E.39424
G1 X197.89 Y81.035 E.01172
G1 X187.197 Y70.342 E.40975
G1 X186.417 Y70.153 E.02175
G1 X197.515 Y81.25 E.42526
G1 X197.139 Y81.465 E.01172
G1 X185.638 Y69.963 E.44076
G1 X184.858 Y69.774 E.02175
G1 X196.764 Y81.68 E.45627
G1 X196.389 Y81.895 E.01172
G1 X184.078 Y69.584 E.47177
G1 X183.298 Y69.395 E.02175
G1 X196.014 Y82.11 E.48728
G1 X195.638 Y82.326 E.01172
G1 X182.518 Y69.205 E.50279
G1 X181.738 Y69.016 E.02175
G1 X195.263 Y82.541 E.51829
G1 X194.888 Y82.756 E.01172
G1 X180.958 Y68.826 E.5338
G1 X180.178 Y68.637 E.02175
G1 X194.513 Y82.971 E.5493
G1 X194.137 Y83.186 E.01172
G1 X179.399 Y68.447 E.56481
G1 X178.619 Y68.258 E.02175
G1 X193.762 Y83.401 E.58031
G1 X193.387 Y83.616 E.01172
G1 X177.839 Y68.068 E.59582
G1 X177.059 Y67.879 E.02175
G1 X193.012 Y83.831 E.61133
G1 X192.636 Y84.047 E.01172
G1 X176.279 Y67.689 E.62683
G1 X175.499 Y67.5 E.02175
G1 X192.261 Y84.262 E.64234
M73 P35 R44
G1 X191.886 Y84.477 E.01172
G1 X174.719 Y67.31 E.65784
G1 X173.939 Y67.121 E.02175
G1 X191.511 Y84.692 E.67335
G1 X191.135 Y84.907 E.01172
G1 X173.16 Y66.931 E.68886
G1 X172.38 Y66.742 E.02175
G1 X190.76 Y85.122 E.70436
G1 X190.385 Y85.337 E.01172
G1 X171.6 Y66.552 E.71987
G1 X170.82 Y66.363 E.02175
G1 X190.01 Y85.552 E.73537
G1 X189.635 Y85.768 E.01172
G1 X170.04 Y66.173 E.75088
G1 X169.26 Y65.984 E.02175
G1 X189.259 Y85.983 E.76638
G1 X188.884 Y86.198 E.01172
G1 X168.48 Y65.794 E.78189
G1 X167.7 Y65.605 E.02175
G1 X188.509 Y86.413 E.7974
G1 X188.134 Y86.628 E.01172
G1 X166.921 Y65.415 E.8129
G1 X166.141 Y65.226 E.02175
G1 X187.758 Y86.843 E.82841
G1 X187.383 Y87.058 E.01172
G1 X165.361 Y65.036 E.84391
G1 X164.581 Y64.847 E.02175
G1 X187.008 Y87.273 E.85942
G1 X186.633 Y87.488 E.01172
G1 X163.801 Y64.657 E.87493
G1 X163.021 Y64.468 E.02175
G1 X186.257 Y87.704 E.89043
G1 X185.882 Y87.919 E.01172
G1 X162.241 Y64.278 E.90594
G1 X161.461 Y64.089 E.02175
G1 X185.507 Y88.134 E.92144
G1 X185.132 Y88.349 E.01172
G1 X160.682 Y63.899 E.93695
G1 X159.902 Y63.709 E.02175
G1 X184.756 Y88.564 E.95245
G1 X184.381 Y88.779 E.01172
G1 X159.122 Y63.52 E.96796
G1 X158.342 Y63.33 E.02175
G1 X184.006 Y88.994 E.98347
G1 X183.631 Y89.209 E.01172
G1 X157.562 Y63.141 E.99897
G1 X156.782 Y62.951 E.02175
M73 P36 R44
G1 X183.255 Y89.425 E1.01448
G1 X182.88 Y89.64 E.01172
G1 X156.002 Y62.762 E1.02998
G1 X155.223 Y62.572 E.02175
G1 X182.505 Y89.855 E1.04549
G1 X182.13 Y90.07 E.01172
G1 X154.443 Y62.383 E1.061
G1 X153.663 Y62.193 E.02175
G1 X181.754 Y90.285 E1.0765
G1 X181.379 Y90.5 E.01172
G1 X152.883 Y62.004 E1.09201
G1 X152.103 Y61.814 E.02175
G1 X181.004 Y90.715 E1.10751
G1 X180.629 Y90.93 E.01172
G1 X151.323 Y61.625 E1.12302
G1 X150.543 Y61.435 E.02175
G1 X180.253 Y91.146 E1.13853
G1 X179.878 Y91.361 E.01172
G1 X149.763 Y61.246 E1.15403
G1 X148.984 Y61.056 E.02175
G1 X179.503 Y91.576 E1.16954
G1 X179.128 Y91.791 E.01172
G1 X148.204 Y60.867 E1.18504
G1 X147.424 Y60.677 E.02175
G1 X178.752 Y92.006 E1.20055
G1 X178.377 Y92.221 E.01172
G1 X146.644 Y60.488 E1.21605
G1 X145.864 Y60.298 E.02175
G1 X178.002 Y92.436 E1.23156
G1 X177.627 Y92.651 E.01172
G1 X145.084 Y60.109 E1.24707
G1 X144.304 Y59.919 E.02175
G1 X177.252 Y92.867 E1.26257
G1 X176.876 Y93.082 E.01172
G1 X143.524 Y59.73 E1.27808
G1 X142.745 Y59.54 E.02175
G1 X176.501 Y93.297 E1.29358
G1 X176.126 Y93.512 E.01172
G1 X141.965 Y59.351 E1.30909
G1 X141.185 Y59.161 E.02175
G1 X175.751 Y93.727 E1.32459
G1 X175.375 Y93.942 E.01172
G1 X140.405 Y58.972 E1.3401
G1 X139.625 Y58.782 E.02175
G1 X175 Y94.157 E1.35561
G1 X174.625 Y94.372 E.01172
G1 X138.845 Y58.593 E1.37111
G1 X138.065 Y58.403 E.02175
G1 X174.25 Y94.587 E1.38662
G1 X173.874 Y94.803 E.01172
G1 X137.285 Y58.214 E1.40212
G1 X136.506 Y58.024 E.02175
G1 X173.499 Y95.018 E1.41763
G1 X173.124 Y95.233 E.01172
G1 X135.726 Y57.835 E1.43314
G1 X134.946 Y57.645 E.02175
G1 X172.749 Y95.448 E1.44864
G1 X172.373 Y95.663 E.01172
G1 X134.166 Y57.456 E1.46415
G1 X133.386 Y57.266 E.02175
G1 X171.998 Y95.878 E1.47965
G1 X171.623 Y96.093 E.01172
G1 X132.606 Y57.077 E1.49516
G1 X132.366 Y57.018 E.0067
G1 X132.374 Y57.435 E.0113
G1 X171.248 Y96.308 E1.48967
G1 X170.872 Y96.524 E.01172
G1 X132.386 Y58.038 E1.47482
G1 X132.398 Y58.64 E.01633
G1 X170.497 Y96.739 E1.45998
G1 X170.122 Y96.954 E.01172
G1 X132.41 Y59.242 E1.44514
G1 X132.423 Y59.845 E.01633
G1 X169.747 Y97.169 E1.4303
G1 X169.371 Y97.384 E.01172
G1 X132.435 Y60.447 E1.41546
G1 X132.447 Y61.05 E.01633
G1 X168.996 Y97.599 E1.40062
G1 X168.621 Y97.814 E.01172
G1 X132.459 Y61.652 E1.38577
G1 X132.471 Y62.254 E.01633
G1 X168.246 Y98.029 E1.37093
G1 X167.87 Y98.245 E.01172
G1 X132.483 Y62.857 E1.35609
G1 X132.495 Y63.459 E.01633
G1 X167.495 Y98.46 E1.34125
G1 X167.12 Y98.675 E.01172
G1 X132.507 Y64.062 E1.32641
G1 X132.519 Y64.664 E.01633
G1 X166.745 Y98.89 E1.31157
G1 X166.369 Y99.105 E.01172
G1 X132.531 Y65.267 E1.29672
G1 X132.543 Y65.869 E.01633
G1 X165.994 Y99.32 E1.28188
G1 X165.619 Y99.535 E.01172
G1 X132.555 Y66.471 E1.26704
G1 X132.567 Y67.074 E.01633
G1 X165.244 Y99.75 E1.2522
G1 X164.869 Y99.966 E.01172
G1 X132.579 Y67.676 E1.23736
G1 X132.591 Y68.279 E.01633
G1 X164.493 Y100.181 E1.22252
G1 X164.118 Y100.396 E.01172
G1 X132.603 Y68.881 E1.20767
G1 X132.615 Y69.484 E.01633
G1 X163.743 Y100.611 E1.19283
G1 X163.368 Y100.826 E.01172
G1 X132.627 Y70.086 E1.17799
G1 X132.64 Y70.688 E.01633
G1 X162.992 Y101.041 E1.16315
G1 X162.617 Y101.256 E.01172
G1 X132.652 Y71.291 E1.14831
G1 X132.664 Y71.893 E.01633
G1 X162.242 Y101.471 E1.13347
G1 X161.867 Y101.686 E.01172
G1 X132.676 Y72.496 E1.11863
G1 X132.688 Y73.098 E.01633
G1 X161.491 Y101.902 E1.10378
G1 X161.116 Y102.117 E.01172
G1 X132.7 Y73.7 E1.08894
G1 X132.712 Y74.303 E.01633
G1 X160.741 Y102.332 E1.0741
G1 X160.366 Y102.547 E.01172
G1 X132.724 Y74.905 E1.05926
G1 X132.736 Y75.508 E.01633
G1 X159.99 Y102.762 E1.04442
G1 X159.615 Y102.977 E.01172
G1 X132.748 Y76.11 E1.02958
G1 X132.76 Y76.713 E.01633
G1 X159.24 Y103.192 E1.01473
G1 X158.865 Y103.407 E.01172
G1 X132.772 Y77.315 E.99989
G1 X132.784 Y77.917 E.01633
G1 X158.489 Y103.623 E.98505
G1 X158.114 Y103.838 E.01172
G1 X132.796 Y78.52 E.97021
G1 X132.808 Y79.122 E.01633
G1 X157.739 Y104.053 E.95537
G1 X157.364 Y104.268 E.01172
G1 X132.82 Y79.725 E.94053
G1 X132.832 Y80.327 E.01633
G1 X156.988 Y104.483 E.92568
G1 X156.613 Y104.698 E.01172
G1 X132.844 Y80.929 E.91084
G1 X132.856 Y81.532 E.01633
G1 X156.238 Y104.913 E.896
G1 X155.863 Y105.128 E.01172
G1 X132.869 Y82.134 E.88116
G1 X132.881 Y82.737 E.01633
G1 X155.487 Y105.344 E.86632
G1 X155.112 Y105.559 E.01172
G1 X132.893 Y83.339 E.85148
G1 X132.905 Y83.942 E.01633
G1 X154.737 Y105.774 E.83664
G1 X154.362 Y105.989 E.01172
G1 X132.917 Y84.544 E.82179
G1 X132.929 Y85.146 E.01633
G1 X153.986 Y106.204 E.80695
G1 X153.611 Y106.419 E.01172
G1 X132.941 Y85.749 E.79211
G1 X132.953 Y86.351 E.01633
G1 X153.236 Y106.634 E.77727
G1 X152.861 Y106.849 E.01172
G1 X132.965 Y86.954 E.76243
G1 X132.977 Y87.556 E.01633
G1 X152.486 Y107.065 E.74759
G1 X152.11 Y107.28 E.01172
G1 X132.989 Y88.158 E.73274
G1 X133.001 Y88.761 E.01633
G1 X151.735 Y107.495 E.7179
G1 X151.36 Y107.71 E.01172
G1 X133.013 Y89.363 E.70306
G1 X133.025 Y89.966 E.01633
G1 X150.985 Y107.925 E.68822
G1 X150.609 Y108.14 E.01172
G1 X133.037 Y90.568 E.67338
G1 X133.049 Y91.171 E.01633
G1 X150.234 Y108.355 E.65854
G1 X149.859 Y108.57 E.01172
G1 X133.061 Y91.773 E.64369
G1 X133.073 Y92.375 E.01633
G1 X149.484 Y108.785 E.62885
G1 X149.108 Y109.001 E.01172
G1 X133.086 Y92.978 E.61401
G1 X133.098 Y93.58 E.01633
G1 X148.733 Y109.216 E.59917
G1 X148.358 Y109.431 E.01172
G1 X133.11 Y94.183 E.58433
G1 X133.122 Y94.785 E.01633
G1 X147.983 Y109.646 E.56949
G1 X147.607 Y109.861 E.01172
G1 X133.134 Y95.387 E.55464
G1 X133.146 Y95.99 E.01633
G1 X147.232 Y110.076 E.5398
G1 X146.857 Y110.291 E.01172
G1 X133.158 Y96.592 E.52496
G1 X133.17 Y97.195 E.01633
G1 X146.482 Y110.506 E.51012
G1 X146.106 Y110.722 E.01172
G1 X133.182 Y97.797 E.49528
G1 X133.194 Y98.4 E.01633
G1 X145.727 Y110.932 E.48028
G1 X145.561 Y110.932 E.00449
G1 X144.556 Y110.352 E.03146
G1 X133.206 Y99.002 E.43493
G1 X133.218 Y99.604 E.01633
G1 X143.159 Y109.545 E.38094
G1 X141.762 Y108.739 E.0437
G1 X133.23 Y100.207 E.32696
G1 X133.242 Y100.809 E.01633
G1 X140.365 Y107.932 E.27297
G1 X138.969 Y107.126 E.04371
G1 X133.254 Y101.412 E.21898
G1 X133.266 Y102.014 E.01633
G1 X137.572 Y106.319 E.16499
G1 X136.175 Y105.513 E.04371
G1 X133.278 Y102.616 E.111
G1 X133.29 Y103.219 E.01633
G1 X135.289 Y105.218 E.07659
; OBJECT_ID: 353
; WIPE_START
G1 X133.875 Y103.803 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 325
M625
; start printing object, unique label id: 353
M624 AgAAAAAAAAA=
M204 S10000
G1 X139.745 Y108.682 Z1.24 F30000
G1 X215.595 Y171.729 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X149.657 Y133.927 E2.05953
G1 X149.474 Y133.612 E.00986
G1 X149.474 Y118.388 E.41253
G1 X149.657 Y118.073 E.00986
G1 X215.595 Y80.271 E2.05953
G1 X215.595 Y171.669 E2.4766
M204 S10000
G1 X215.996 Y172.261 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X215.899 Y172.318 E.00282
G1 X215.858 Y172.341 E.00118
G1 X149.364 Y134.221 E1.92699
G1 X149.323 Y134.151 E.00203
G1 X149.114 Y133.79 E.0105
G1 X149.073 Y133.72 E.00203
G1 X149.073 Y118.28 E.38817
G1 X149.114 Y118.21 E.00203
G1 X149.323 Y117.849 E.0105
G1 X149.364 Y117.779 E.00203
G1 X215.858 Y79.659 E1.92699
G1 X215.899 Y79.682 E.00118
G1 X215.996 Y79.739 E.00282
G1 X215.996 Y172.201 E2.32465
; WIPE_START
M204 S4000
G1 X215.899 Y172.318 E-.05758
G1 X215.858 Y172.341 E-.0178
G1 X214.295 Y171.445 E-.68462
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X215.239 Y171.33 Z1.24 F30000
G1 Z.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X215.239 Y80.885 E2.45079
G1 X214.823 Y81.124 E.01301
G1 X214.823 Y170.876 E2.43201
G1 X214.406 Y170.637 E.01301
G1 X214.406 Y81.363 E2.41906
G1 X213.989 Y81.602 E.01301
G1 X213.989 Y170.398 E2.40612
G1 X213.573 Y170.159 E.01301
G1 X213.573 Y81.841 E2.39318
G1 X213.156 Y82.079 E.01301
G1 X213.156 Y169.92 E2.38023
G1 X212.74 Y169.682 E.01301
G1 X212.74 Y82.318 E2.36729
G1 X212.323 Y82.557 E.01301
G1 X212.323 Y169.443 E2.35435
G1 X211.906 Y169.204 E.01301
G1 X211.906 Y82.796 E2.3414
G1 X211.49 Y83.035 E.01301
G1 X211.49 Y168.965 E2.32846
G1 X211.073 Y168.726 E.01301
G1 X211.073 Y83.274 E2.31552
G1 X210.656 Y83.513 E.01301
G1 X210.656 Y168.487 E2.30257
G1 X210.24 Y168.249 E.01301
G1 X210.24 Y83.751 E2.28963
G1 X209.823 Y83.99 E.01301
G1 X209.823 Y168.01 E2.27668
G1 X209.407 Y167.771 E.01301
G1 X209.407 Y84.229 E2.26374
G1 X208.99 Y84.468 E.01301
G1 X208.99 Y167.532 E2.2508
G1 X208.573 Y167.293 E.01301
G1 X208.573 Y84.707 E2.23785
G1 X208.157 Y84.946 E.01301
G1 X208.157 Y167.054 E2.22491
G1 X207.74 Y166.816 E.01301
G1 X207.74 Y85.184 E2.21197
G1 X207.324 Y85.423 E.01301
G1 X207.324 Y166.577 E2.19902
G1 X206.907 Y166.338 E.01301
G1 X206.907 Y85.662 E2.18608
G1 X206.49 Y85.901 E.01301
G1 X206.49 Y166.099 E2.17314
G1 X206.074 Y165.86 E.01301
G1 X206.074 Y86.14 E2.16019
G1 X205.657 Y86.379 E.01301
G1 X205.657 Y165.621 E2.14725
G1 X205.241 Y165.383 E.01301
G1 X205.241 Y86.617 E2.13431
G1 X204.824 Y86.856 E.01301
G1 X204.824 Y165.144 E2.12136
G1 X204.407 Y164.905 E.01301
G1 X204.407 Y87.095 E2.10842
G1 X203.991 Y87.334 E.01301
G1 X203.991 Y164.666 E2.09548
G1 X203.574 Y164.427 E.01301
G1 X203.574 Y87.573 E2.08253
G1 X203.157 Y87.812 E.01301
G1 X203.157 Y164.188 E2.06959
G1 X202.741 Y163.95 E.01301
G1 X202.741 Y88.05 E2.05664
M73 P37 R44
G1 X202.324 Y88.289 E.01301
G1 X202.324 Y163.711 E2.0437
G1 X201.908 Y163.472 E.01301
G1 X201.908 Y88.528 E2.03076
G1 X201.491 Y88.767 E.01301
G1 X201.491 Y163.233 E2.01781
G1 X201.074 Y162.994 E.01301
G1 X201.074 Y89.006 E2.00487
G1 X200.658 Y89.245 E.01301
G1 X200.658 Y162.755 E1.99193
G1 X200.241 Y162.517 E.01301
G1 X200.241 Y89.483 E1.97898
G1 X199.825 Y89.722 E.01301
G1 X199.825 Y162.278 E1.96604
G1 X199.408 Y162.039 E.01301
G1 X199.408 Y89.961 E1.9531
G1 X198.991 Y90.2 E.01301
G1 X198.991 Y161.8 E1.94015
G1 X198.575 Y161.561 E.01301
G1 X198.575 Y90.439 E1.92721
G1 X198.158 Y90.678 E.01301
G1 X198.158 Y161.322 E1.91427
G1 X197.742 Y161.084 E.01301
G1 X197.742 Y90.916 E1.90132
G1 X197.325 Y91.155 E.01301
G1 X197.325 Y160.845 E1.88838
G1 X196.908 Y160.606 E.01301
G1 X196.908 Y91.394 E1.87543
G1 X196.492 Y91.633 E.01301
G1 X196.492 Y160.367 E1.86249
G1 X196.075 Y160.128 E.01301
G1 X196.075 Y91.872 E1.84955
G1 X195.659 Y92.111 E.01301
G1 X195.659 Y159.889 E1.8366
G1 X195.242 Y159.651 E.01301
G1 X195.242 Y92.349 E1.82366
G1 X194.825 Y92.588 E.01301
G1 X194.825 Y159.412 E1.81072
G1 X194.409 Y159.173 E.01301
G1 X194.409 Y92.827 E1.79777
G1 X193.992 Y93.066 E.01301
G1 X193.992 Y158.934 E1.78483
G1 X193.575 Y158.695 E.01301
G1 X193.575 Y93.305 E1.77189
G1 X193.159 Y93.544 E.01301
G1 X193.159 Y158.456 E1.75894
G1 X192.742 Y158.217 E.01301
G1 X192.742 Y93.782 E1.746
G1 X192.326 Y94.021 E.01301
G1 X192.326 Y157.979 E1.73306
G1 X191.909 Y157.74 E.01301
G1 X191.909 Y94.26 E1.72011
G1 X191.492 Y94.499 E.01301
G1 X191.492 Y157.501 E1.70717
G1 X191.076 Y157.262 E.01301
G1 X191.076 Y94.738 E1.69423
G1 X190.659 Y94.977 E.01301
G1 X190.659 Y157.023 E1.68128
G1 X190.243 Y156.784 E.01301
G1 X190.243 Y95.216 E1.66834
G1 X189.826 Y95.454 E.01301
G1 X189.826 Y156.546 E1.65539
M73 P37 R43
G1 X189.409 Y156.307 E.01301
G1 X189.409 Y95.693 E1.64245
G1 X188.993 Y95.932 E.01301
G1 X188.993 Y156.068 E1.62951
G1 X188.576 Y155.829 E.01301
G1 X188.576 Y96.171 E1.61656
G1 X188.16 Y96.41 E.01301
G1 X188.16 Y155.59 E1.60362
G1 X187.743 Y155.351 E.01301
G1 X187.743 Y96.649 E1.59068
G1 X187.326 Y96.887 E.01301
G1 X187.326 Y155.113 E1.57773
G1 X186.91 Y154.874 E.01301
G1 X186.91 Y97.126 E1.56479
G1 X186.493 Y97.365 E.01301
G1 X186.493 Y154.635 E1.55185
G1 X186.076 Y154.396 E.01301
G1 X186.076 Y97.604 E1.5389
G1 X185.66 Y97.843 E.01301
G1 X185.66 Y154.157 E1.52596
G1 X185.243 Y153.918 E.01301
G1 X185.243 Y98.082 E1.51302
G1 X184.827 Y98.32 E.01301
G1 X184.827 Y153.68 E1.50007
G1 X184.41 Y153.441 E.01301
G1 X184.41 Y98.559 E1.48713
G1 X183.993 Y98.798 E.01301
G1 X183.993 Y153.202 E1.47418
G1 X183.577 Y152.963 E.01301
G1 X183.577 Y99.037 E1.46124
G1 X183.16 Y99.276 E.01301
G1 X183.16 Y152.724 E1.4483
G1 X182.744 Y152.485 E.01301
G1 X182.744 Y99.515 E1.43535
G1 X182.327 Y99.753 E.01301
G1 X182.327 Y152.247 E1.42241
G1 X181.91 Y152.008 E.01301
G1 X181.91 Y99.992 E1.40947
G1 X181.494 Y100.231 E.01301
G1 X181.494 Y151.769 E1.39652
G1 X181.077 Y151.53 E.01301
G1 X181.077 Y100.47 E1.38358
G1 X180.661 Y100.709 E.01301
G1 X180.661 Y151.291 E1.37064
G1 X180.244 Y151.052 E.01301
G1 X180.244 Y100.948 E1.35769
G1 X179.827 Y101.186 E.01301
G1 X179.827 Y150.814 E1.34475
G1 X179.411 Y150.575 E.01301
G1 X179.411 Y101.425 E1.33181
G1 X178.994 Y101.664 E.01301
G1 X178.994 Y150.336 E1.31886
G1 X178.577 Y150.097 E.01301
G1 X178.577 Y101.903 E1.30592
G1 X178.161 Y102.142 E.01301
G1 X178.161 Y149.858 E1.29298
G1 X177.744 Y149.619 E.01301
G1 X177.744 Y102.381 E1.28003
G1 X177.328 Y102.619 E.01301
G1 X177.328 Y149.381 E1.26709
G1 X176.911 Y149.142 E.01301
G1 X176.911 Y102.858 E1.25414
G1 X176.494 Y103.097 E.01301
G1 X176.494 Y148.903 E1.2412
G1 X176.078 Y148.664 E.01301
G1 X176.078 Y103.336 E1.22826
G1 X175.661 Y103.575 E.01301
G1 X175.661 Y148.425 E1.21531
G1 X175.245 Y148.186 E.01301
G1 X175.245 Y103.814 E1.20237
G1 X174.828 Y104.052 E.01301
G1 X174.828 Y147.948 E1.18943
G1 X174.411 Y147.709 E.01301
G1 X174.411 Y104.291 E1.17648
G1 X173.995 Y104.53 E.01301
G1 X173.995 Y147.47 E1.16354
G1 X173.578 Y147.231 E.01301
G1 X173.578 Y104.769 E1.1506
G1 X173.162 Y105.008 E.01301
G1 X173.162 Y146.992 E1.13765
G1 X172.745 Y146.753 E.01301
G1 X172.745 Y105.247 E1.12471
G1 X172.328 Y105.485 E.01301
G1 X172.328 Y146.515 E1.11177
G1 X171.912 Y146.276 E.01301
G1 X171.912 Y105.724 E1.09882
G1 X171.495 Y105.963 E.01301
G1 X171.495 Y146.037 E1.08588
G1 X171.079 Y145.798 E.01301
G1 X171.079 Y106.202 E1.07294
G1 X170.662 Y106.441 E.01301
G1 X170.662 Y145.559 E1.05999
G1 X170.245 Y145.32 E.01301
G1 X170.245 Y106.68 E1.04705
G1 X169.829 Y106.918 E.01301
G1 X169.829 Y145.081 E1.0341
G1 X169.412 Y144.843 E.01301
G1 X169.412 Y107.157 E1.02116
G1 X168.995 Y107.396 E.01301
G1 X168.995 Y144.604 E1.00822
G1 X168.579 Y144.365 E.01301
G1 X168.579 Y107.635 E.99527
G1 X168.162 Y107.874 E.01301
G1 X168.162 Y144.126 E.98233
G1 X167.746 Y143.887 E.01301
G1 X167.746 Y108.113 E.96939
G1 X167.329 Y108.352 E.01301
G1 X167.329 Y143.648 E.95644
G1 X166.912 Y143.41 E.01301
G1 X166.912 Y108.59 E.9435
G1 X166.496 Y108.829 E.01301
G1 X166.496 Y143.171 E.93056
G1 X166.079 Y142.932 E.01301
G1 X166.079 Y109.068 E.91761
G1 X165.663 Y109.307 E.01301
G1 X165.663 Y142.693 E.90467
G1 X165.246 Y142.454 E.01301
G1 X165.246 Y109.546 E.89173
G1 X164.829 Y109.785 E.01301
G1 X164.829 Y142.215 E.87878
G1 X164.413 Y141.977 E.01301
G1 X164.413 Y110.023 E.86584
G1 X163.996 Y110.262 E.01301
G1 X163.996 Y141.738 E.85289
G1 X163.58 Y141.499 E.01301
G1 X163.58 Y110.501 E.83995
G1 X163.163 Y110.74 E.01301
G1 X163.163 Y141.26 E.82701
G1 X162.746 Y141.021 E.01301
G1 X162.746 Y110.979 E.81406
G1 X162.33 Y111.218 E.01301
G1 X162.33 Y140.782 E.80112
G1 X161.913 Y140.544 E.01301
G1 X161.913 Y111.456 E.78818
G1 X161.496 Y111.695 E.01301
G1 X161.496 Y140.305 E.77523
G1 X161.08 Y140.066 E.01301
G1 X161.08 Y111.934 E.76229
G1 X160.663 Y112.173 E.01301
G1 X160.663 Y139.827 E.74935
G1 X160.247 Y139.588 E.01301
G1 X160.247 Y112.412 E.7364
G1 X159.83 Y112.651 E.01301
G1 X159.83 Y139.349 E.72346
G1 X159.413 Y139.111 E.01301
G1 X159.413 Y112.889 E.71052
G1 X158.997 Y113.128 E.01301
G1 X158.997 Y138.872 E.69757
G1 X158.58 Y138.633 E.01301
G1 X158.58 Y113.367 E.68463
G1 X158.164 Y113.606 E.01301
G1 X158.164 Y138.394 E.67169
G1 X157.747 Y138.155 E.01301
G1 X157.747 Y113.845 E.65874
G1 X157.33 Y114.084 E.01301
G1 X157.33 Y137.916 E.6458
G1 X156.914 Y137.678 E.01301
G1 X156.914 Y114.322 E.63285
G1 X156.497 Y114.561 E.01301
G1 X156.497 Y137.439 E.61991
G1 X156.081 Y137.2 E.01301
G1 X156.081 Y114.8 E.60697
G1 X155.664 Y115.039 E.01301
G1 X155.664 Y136.961 E.59402
G1 X155.247 Y136.722 E.01301
G1 X155.247 Y115.278 E.58108
G1 X154.831 Y115.517 E.01301
G1 X154.831 Y136.483 E.56814
M73 P38 R43
G1 X154.414 Y136.245 E.01301
G1 X154.414 Y115.755 E.55519
G1 X153.998 Y115.994 E.01301
G1 X153.998 Y136.006 E.54225
G1 X153.581 Y135.767 E.01301
G1 X153.581 Y116.233 E.52931
G1 X153.164 Y116.472 E.01301
G1 X153.164 Y135.528 E.51636
G1 X152.748 Y135.289 E.01301
G1 X152.748 Y116.711 E.50342
G1 X152.331 Y116.95 E.01301
G1 X152.331 Y135.05 E.49048
G1 X151.914 Y134.812 E.01301
G1 X151.914 Y117.188 E.47753
G1 X151.498 Y117.427 E.01301
G1 X151.498 Y134.573 E.46459
G1 X151.081 Y134.334 E.01301
G1 X151.081 Y117.666 E.45164
G1 X150.665 Y117.905 E.01301
G1 X150.665 Y134.095 E.4387
G1 X150.248 Y133.856 E.01301
G1 X150.248 Y118.144 E.42576
G2 X149.831 Y118.481 I.082 J.528 E.01521
G1 X149.831 Y133.833 E.416
; OBJECT_ID: 381
; WIPE_START
G1 X149.831 Y131.833 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 353
M625
; start printing object, unique label id: 381
M624 BAAAAAAAAAA=
M204 S10000
G1 X155.9 Y136.462 Z1.24 F30000
G1 X208.756 Y176.785 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X132.001 Y195.436 E2.14036
G1 X132.947 Y148.153 E1.28149
G1 X133.139 Y147.829 E.01019
G1 X145.466 Y140.712 E.3857
G1 X145.833 Y140.712 E.00995
G1 X147.207 Y141.499 E.0429
G1 X208.704 Y176.755 E1.92082
; WIPE_START
G1 X206.761 Y177.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.77 Y176.951 Z1.24 F30000
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X131.815 Y195.894 E2.01694
G1 X131.635 Y195.75 E.00579
G1 X131.595 Y195.718 E.00129
G1 X132.549 Y148.04 E1.19892
G1 X132.591 Y147.969 E.00207
G1 X132.805 Y147.606 E.0106
G1 X132.847 Y147.535 E.00207
G1 X145.358 Y140.312 E.3632
G1 X145.439 Y140.312 E.00204
G1 X145.858 Y140.311 E.01053
G1 X145.939 Y140.311 E.00204
G1 X147.406 Y141.152 E.0425
G1 X209.809 Y176.926 E1.80842
; WIPE_START
M204 S4000
G1 X207.865 Y177.399 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.22 Y176.985 Z1.24 F30000
G1 Z.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.646 Y176.558 E.01634
G1 X207.271 Y176.343 E.01172
G1 X206.694 Y176.92 E.0221
G1 X205.914 Y177.109 E.02175
G1 X206.896 Y176.128 E.03761
G1 X206.52 Y175.913 E.01172
G1 X205.134 Y177.299 E.05312
G1 X204.355 Y177.489 E.02175
G1 X206.145 Y175.698 E.06862
G1 X205.77 Y175.483 E.01172
G1 X203.575 Y177.678 E.08413
G1 X202.795 Y177.868 E.02175
G1 X205.395 Y175.268 E.09963
G1 X205.019 Y175.052 E.01172
G1 X202.015 Y178.057 E.11514
G1 X201.235 Y178.247 E.02175
G1 X204.644 Y174.837 E.13064
G1 X204.269 Y174.622 E.01172
G1 X200.455 Y178.436 E.14615
G1 X199.675 Y178.626 E.02175
G1 X203.894 Y174.407 E.16166
G1 X203.519 Y174.192 E.01172
G1 X198.895 Y178.815 E.17716
G1 X198.116 Y179.005 E.02175
G1 X203.143 Y173.977 E.19267
G1 X202.768 Y173.762 E.01172
G1 X197.336 Y179.194 E.20817
G1 X196.556 Y179.384 E.02175
G1 X202.393 Y173.547 E.22368
G1 X202.018 Y173.331 E.01172
G1 X195.776 Y179.573 E.23919
G1 X194.996 Y179.763 E.02175
G1 X201.642 Y173.116 E.25469
G1 X201.267 Y172.901 E.01172
G1 X194.216 Y179.952 E.2702
G1 X193.436 Y180.142 E.02175
G1 X200.892 Y172.686 E.2857
G1 X200.517 Y172.471 E.01172
G1 X192.656 Y180.331 E.30121
G1 X191.877 Y180.521 E.02175
G1 X200.141 Y172.256 E.31671
G1 X199.766 Y172.041 E.01172
G1 X191.097 Y180.71 E.33222
G1 X190.317 Y180.9 E.02175
G1 X199.391 Y171.826 E.34773
G1 X199.016 Y171.611 E.01172
G1 X189.537 Y181.089 E.36323
G1 X188.757 Y181.279 E.02175
G1 X198.64 Y171.395 E.37874
G1 X198.265 Y171.18 E.01172
G1 X187.977 Y181.468 E.39424
G1 X187.197 Y181.658 E.02175
G1 X197.89 Y170.965 E.40975
G1 X197.515 Y170.75 E.01172
G1 X186.417 Y181.847 E.42526
G1 X185.638 Y182.037 E.02175
G1 X197.139 Y170.535 E.44076
G1 X196.764 Y170.32 E.01172
G1 X184.858 Y182.226 E.45627
G1 X184.078 Y182.416 E.02175
G1 X196.389 Y170.105 E.47177
G1 X196.014 Y169.89 E.01172
G1 X183.298 Y182.605 E.48728
G1 X182.518 Y182.795 E.02175
G1 X195.638 Y169.674 E.50279
G1 X195.263 Y169.459 E.01172
G1 X181.738 Y182.984 E.51829
G1 X180.958 Y183.174 E.02175
G1 X194.888 Y169.244 E.5338
G1 X194.513 Y169.029 E.01172
G1 X180.178 Y183.363 E.5493
G1 X179.399 Y183.553 E.02175
G1 X194.137 Y168.814 E.56481
G1 X193.762 Y168.599 E.01172
G1 X178.619 Y183.742 E.58031
G1 X177.839 Y183.932 E.02175
G1 X193.387 Y168.384 E.59582
G1 X193.012 Y168.169 E.01172
G1 X177.059 Y184.121 E.61133
G1 X176.279 Y184.311 E.02175
G1 X192.636 Y167.953 E.62683
G1 X192.261 Y167.738 E.01172
G1 X175.499 Y184.5 E.64234
G1 X174.719 Y184.69 E.02175
G1 X191.886 Y167.523 E.65784
G1 X191.511 Y167.308 E.01172
G1 X173.939 Y184.879 E.67335
G1 X173.16 Y185.069 E.02175
G1 X191.136 Y167.093 E.68886
G1 X190.76 Y166.878 E.01172
G1 X172.38 Y185.258 E.70436
G1 X171.6 Y185.448 E.02175
G1 X190.385 Y166.663 E.71987
G1 X190.01 Y166.448 E.01172
G1 X170.82 Y185.637 E.73537
G1 X170.04 Y185.827 E.02175
G1 X189.635 Y166.232 E.75088
G1 X189.259 Y166.017 E.01172
G1 X169.26 Y186.016 E.76639
G1 X168.48 Y186.206 E.02175
G1 X188.884 Y165.802 E.78189
G1 X188.509 Y165.587 E.01172
G1 X167.7 Y186.395 E.7974
G1 X166.921 Y186.585 E.02175
G1 X188.134 Y165.372 E.8129
G1 X187.758 Y165.157 E.01172
G1 X166.141 Y186.774 E.82841
G1 X165.361 Y186.964 E.02175
G1 X187.383 Y164.942 E.84391
G1 X187.008 Y164.727 E.01172
G1 X164.581 Y187.153 E.85942
G1 X163.801 Y187.343 E.02175
G1 X186.633 Y164.512 E.87493
G1 X186.257 Y164.296 E.01172
G1 X163.021 Y187.533 E.89043
G1 X162.241 Y187.722 E.02175
G1 X185.882 Y164.081 E.90594
G1 X185.507 Y163.866 E.01172
G1 X161.461 Y187.912 E.92144
G1 X160.682 Y188.101 E.02175
G1 X185.132 Y163.651 E.93695
G1 X184.756 Y163.436 E.01172
G1 X159.902 Y188.291 E.95246
G1 X159.122 Y188.48 E.02175
G1 X184.381 Y163.221 E.96796
G1 X184.006 Y163.006 E.01172
G1 X158.342 Y188.67 E.98347
G1 X157.562 Y188.859 E.02175
G1 X183.631 Y162.791 E.99897
G1 X183.255 Y162.575 E.01172
G1 X156.782 Y189.049 E1.01448
G1 X156.002 Y189.238 E.02175
G1 X182.88 Y162.36 E1.02998
G1 X182.505 Y162.145 E.01172
G1 X155.223 Y189.428 E1.04549
G1 X154.443 Y189.617 E.02175
G1 X182.13 Y161.93 E1.061
G1 X181.754 Y161.715 E.01172
G1 X153.663 Y189.807 E1.0765
G1 X152.883 Y189.996 E.02175
G1 X181.379 Y161.5 E1.09201
G1 X181.004 Y161.285 E.01172
G1 X152.103 Y190.186 E1.10751
G1 X151.323 Y190.375 E.02175
G1 X180.629 Y161.07 E1.12302
G1 X180.253 Y160.854 E.01172
G1 X150.543 Y190.565 E1.13853
G1 X149.763 Y190.754 E.02175
G1 X179.878 Y160.639 E1.15403
G1 X179.503 Y160.424 E.01172
G1 X148.984 Y190.944 E1.16954
G1 X148.204 Y191.133 E.02175
G1 X179.128 Y160.209 E1.18504
G1 X178.753 Y159.994 E.01172
G1 X147.424 Y191.323 E1.20055
G1 X146.644 Y191.512 E.02175
G1 X178.377 Y159.779 E1.21605
G1 X178.002 Y159.564 E.01172
G1 X145.864 Y191.702 E1.23156
G1 X145.084 Y191.891 E.02175
G1 X177.627 Y159.349 E1.24707
G1 X177.252 Y159.133 E.01172
G1 X144.304 Y192.081 E1.26257
G1 X143.524 Y192.27 E.02175
G1 X176.876 Y158.918 E1.27808
G1 X176.501 Y158.703 E.01172
G1 X142.745 Y192.46 E1.29358
G1 X141.965 Y192.649 E.02175
G1 X176.126 Y158.488 E1.30909
G1 X175.751 Y158.273 E.01172
G1 X141.185 Y192.839 E1.3246
G1 X140.405 Y193.028 E.02175
G1 X175.375 Y158.058 E1.3401
G1 X175 Y157.843 E.01172
G1 X139.625 Y193.218 E1.35561
G1 X138.845 Y193.407 E.02175
G1 X174.625 Y157.628 E1.37111
G1 X174.25 Y157.413 E.01172
G1 X138.065 Y193.597 E1.38662
G1 X137.285 Y193.786 E.02175
G1 X173.874 Y157.197 E1.40213
G1 X173.499 Y156.982 E.01172
G1 X136.506 Y193.976 E1.41763
G1 X135.726 Y194.165 E.02175
G1 X173.124 Y156.767 E1.43314
G1 X172.749 Y156.552 E.01172
G1 X134.946 Y194.355 E1.44864
G1 X134.166 Y194.544 E.02175
G1 X172.373 Y156.337 E1.46415
G1 X171.998 Y156.122 E.01172
G1 X133.386 Y194.734 E1.47965
G1 X132.606 Y194.923 E.02175
G1 X171.623 Y155.907 E1.49516
G1 X171.248 Y155.692 E.01172
G1 X132.374 Y194.565 E1.48967
G1 X132.386 Y193.962 E.01633
G1 X170.872 Y155.476 E1.47482
G1 X170.497 Y155.261 E.01172
G1 X132.398 Y193.36 E1.45998
G1 X132.41 Y192.758 E.01633
G1 X170.122 Y155.046 E1.44514
G1 X169.747 Y154.831 E.01172
G1 X132.423 Y192.155 E1.4303
G1 X132.435 Y191.553 E.01633
G1 X169.371 Y154.616 E1.41546
G1 X168.996 Y154.401 E.01172
G1 X132.447 Y190.95 E1.40062
G1 X132.459 Y190.348 E.01633
G1 X168.621 Y154.186 E1.38578
G1 X168.246 Y153.971 E.01172
G1 X132.471 Y189.746 E1.37093
G1 X132.483 Y189.143 E.01633
G1 X167.87 Y153.755 E1.35609
G1 X167.495 Y153.54 E.01172
G1 X132.495 Y188.541 E1.34125
G1 X132.507 Y187.938 E.01633
G1 X167.12 Y153.325 E1.32641
G1 X166.745 Y153.11 E.01172
G1 X132.519 Y187.336 E1.31157
G1 X132.531 Y186.733 E.01633
G1 X166.37 Y152.895 E1.29673
G1 X165.994 Y152.68 E.01172
G1 X132.543 Y186.131 E1.28188
G1 X132.555 Y185.529 E.01633
G1 X165.619 Y152.465 E1.26704
G1 X165.244 Y152.25 E.01172
G1 X132.567 Y184.926 E1.2522
G1 X132.579 Y184.324 E.01633
G1 X164.869 Y152.034 E1.23736
G1 X164.493 Y151.819 E.01172
G1 X132.591 Y183.721 E1.22252
G1 X132.603 Y183.119 E.01633
G1 X164.118 Y151.604 E1.20768
G1 X163.743 Y151.389 E.01172
G1 X132.615 Y182.517 E1.19283
G1 X132.627 Y181.914 E.01633
G1 X163.368 Y151.174 E1.17799
G1 X162.992 Y150.959 E.01172
G1 X132.64 Y181.312 E1.16315
G1 X132.652 Y180.709 E.01633
G1 X162.617 Y150.744 E1.14831
G1 X162.242 Y150.529 E.01172
G1 X132.664 Y180.107 E1.13347
G1 X132.676 Y179.504 E.01633
G1 X161.867 Y150.314 E1.11863
M73 P38 R42
G1 X161.491 Y150.098 E.01172
G1 X132.688 Y178.902 E1.10378
G1 X132.7 Y178.3 E.01633
G1 X161.116 Y149.883 E1.08894
G1 X160.741 Y149.668 E.01172
G1 X132.712 Y177.697 E1.0741
G1 X132.724 Y177.095 E.01633
G1 X160.366 Y149.453 E1.05926
G1 X159.99 Y149.238 E.01172
G1 X132.736 Y176.492 E1.04442
G1 X132.748 Y175.89 E.01633
G1 X159.615 Y149.023 E1.02958
G1 X159.24 Y148.808 E.01172
G1 X132.76 Y175.288 E1.01474
G1 X132.772 Y174.685 E.01633
G1 X158.865 Y148.593 E.99989
G1 X158.489 Y148.377 E.01172
G1 X132.784 Y174.083 E.98505
G1 X132.796 Y173.48 E.01633
G1 X158.114 Y148.162 E.97021
G1 X157.739 Y147.947 E.01172
G1 X132.808 Y172.878 E.95537
G1 X132.82 Y172.275 E.01633
G1 X157.364 Y147.732 E.94053
G1 X156.988 Y147.517 E.01172
G1 X132.832 Y171.673 E.92569
G1 X132.844 Y171.071 E.01633
G1 X156.613 Y147.302 E.91084
G1 X156.238 Y147.087 E.01172
G1 X132.856 Y170.468 E.896
G1 X132.869 Y169.866 E.01633
G1 X155.863 Y146.872 E.88116
G1 X155.487 Y146.656 E.01172
G1 X132.881 Y169.263 E.86632
G1 X132.893 Y168.661 E.01633
G1 X155.112 Y146.441 E.85148
G1 X154.737 Y146.226 E.01172
G1 X132.905 Y168.059 E.83664
G1 X132.917 Y167.456 E.01633
G1 X154.362 Y146.011 E.82179
G1 X153.987 Y145.796 E.01172
G1 X132.929 Y166.854 E.80695
G1 X132.941 Y166.251 E.01633
G1 X153.611 Y145.581 E.79211
G1 X153.236 Y145.366 E.01172
G1 X132.953 Y165.649 E.77727
G1 X132.965 Y165.046 E.01633
G1 X152.861 Y145.151 E.76243
G1 X152.486 Y144.936 E.01172
G1 X132.977 Y164.444 E.74759
G1 X132.989 Y163.842 E.01633
G1 X152.11 Y144.72 E.73274
G1 X151.735 Y144.505 E.01172
G1 X133.001 Y163.239 E.7179
G1 X133.013 Y162.637 E.01633
G1 X151.36 Y144.29 E.70306
G1 X150.985 Y144.075 E.01172
G1 X133.025 Y162.034 E.68822
G1 X133.037 Y161.432 E.01633
G1 X150.609 Y143.86 E.67338
G1 X150.234 Y143.645 E.01172
G1 X133.049 Y160.83 E.65854
G1 X133.061 Y160.227 E.01633
G1 X149.859 Y143.43 E.6437
G1 X149.484 Y143.215 E.01172
G1 X133.073 Y159.625 E.62885
M73 P39 R42
G1 X133.086 Y159.022 E.01633
G1 X149.108 Y142.999 E.61401
G1 X148.733 Y142.784 E.01172
G1 X133.098 Y158.42 E.59917
G1 X133.11 Y157.817 E.01633
G1 X148.358 Y142.569 E.58433
G1 X147.983 Y142.354 E.01172
G1 X133.122 Y157.215 E.56949
G1 X133.134 Y156.613 E.01633
G1 X147.607 Y142.139 E.55465
G1 X147.232 Y141.924 E.01172
G1 X133.146 Y156.01 E.5398
G1 X133.158 Y155.408 E.01633
G1 X146.857 Y141.709 E.52496
G1 X146.482 Y141.494 E.01172
G1 X133.17 Y154.805 E.51012
G1 X133.182 Y154.203 E.01633
G1 X146.106 Y141.278 E.49528
G1 X145.727 Y141.068 E.01176
G1 X133.194 Y153.601 E.48028
G1 X133.206 Y152.998 E.01633
G1 X144.556 Y141.648 E.43494
G1 X143.159 Y142.455 E.0437
G1 X133.218 Y152.396 E.38095
G1 X133.23 Y151.793 E.01633
G1 X141.762 Y143.261 E.32696
G1 X140.365 Y144.068 E.04371
G1 X133.242 Y151.191 E.27297
G1 X133.254 Y150.588 E.01633
G1 X138.969 Y144.874 E.21898
G1 X137.572 Y145.68 E.0437
G1 X133.266 Y149.986 E.16499
G1 X133.278 Y149.384 E.01633
G1 X136.175 Y146.487 E.111
G1 X134.778 Y147.293 E.04371
G1 X133.1 Y148.972 E.06433
; OBJECT_ID: 409
; WIPE_START
G1 X134.514 Y147.558 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 381
M625
; start printing object, unique label id: 409
M624 CAAAAAAAAAA=
M204 S10000
G1 X127.276 Y149.982 Z1.24 F30000
G1 X47.244 Y176.785 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X110.167 Y140.712 E1.96535
G1 X110.534 Y140.712 E.00995
G1 X122.861 Y147.829 E.3857
G1 X123.053 Y148.153 E.01019
G1 X123.999 Y195.436 E1.28149
G1 X47.302 Y176.799 E2.13873
; WIPE_START
G1 X49.037 Y175.803 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.23 Y176.951 Z1.24 F30000
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X46.188 Y176.941 E.00108
G1 X46.187 Y176.929 E.0003
G1 X110.061 Y140.311 E1.85105
G1 X110.142 Y140.311 E.00204
G1 X110.561 Y140.312 E.01053
G1 X110.642 Y140.312 E.00204
G1 X123.153 Y147.535 E.3632
G1 X123.195 Y147.606 E.00207
G1 X123.409 Y147.969 E.0106
G1 X123.451 Y148.04 E.00207
G1 X124.405 Y195.718 E1.19892
G1 X124.365 Y195.75 E.00129
G1 X124.186 Y195.894 E.00579
G1 X46.288 Y176.965 E2.01543
; WIPE_START
M204 S4000
G1 X46.188 Y176.941 E-.03913
G1 X46.187 Y176.929 E-.00448
G1 X47.822 Y175.991 E-.71639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.783 Y176.985 Z1.24 F30000
G1 Z.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.355 Y176.558 E.01639
G1 X48.73 Y176.342 E.01172
G1 X49.308 Y176.921 E.02215
G1 X50.088 Y177.11 E.02175
G1 X49.106 Y176.127 E.03766
G1 X49.481 Y175.912 E.01172
G1 X50.868 Y177.3 E.05316
G1 X51.648 Y177.489 E.02175
G1 X49.856 Y175.697 E.06867
G1 X50.231 Y175.482 E.01172
G1 X52.428 Y177.679 E.08418
G1 X53.208 Y177.868 E.02175
G1 X50.606 Y175.267 E.09968
G1 X50.982 Y175.052 E.01172
G1 X53.988 Y178.058 E.11519
G1 X54.767 Y178.247 E.02175
G1 X51.357 Y174.837 E.13069
G1 X51.732 Y174.622 E.01172
G1 X55.547 Y178.437 E.1462
G1 X56.327 Y178.626 E.02175
G1 X52.107 Y174.406 E.1617
G1 X52.483 Y174.191 E.01172
G1 X57.107 Y178.816 E.17721
G1 X57.887 Y179.005 E.02175
G1 X52.858 Y173.976 E.19272
G1 X53.233 Y173.761 E.01172
G1 X58.667 Y179.195 E.20822
G1 X59.447 Y179.384 E.02175
G1 X53.608 Y173.546 E.22373
G1 X53.984 Y173.331 E.01172
G1 X60.227 Y179.574 E.23923
G1 X61.006 Y179.763 E.02175
G1 X54.359 Y173.116 E.25474
G1 X54.734 Y172.901 E.01172
G1 X61.786 Y179.953 E.27025
G1 X62.566 Y180.142 E.02175
G1 X55.109 Y172.685 E.28575
G1 X55.485 Y172.47 E.01172
G1 X63.346 Y180.332 E.30126
G1 X64.126 Y180.521 E.02175
G1 X55.86 Y172.255 E.31676
G1 X56.235 Y172.04 E.01172
G1 X64.906 Y180.711 E.33227
G1 X65.686 Y180.9 E.02175
G1 X56.61 Y171.825 E.34777
G1 X56.986 Y171.61 E.01172
G1 X66.466 Y181.09 E.36328
G1 X67.245 Y181.279 E.02175
G1 X57.361 Y171.395 E.37879
G1 X57.736 Y171.18 E.01172
G1 X68.025 Y181.469 E.39429
G1 X68.805 Y181.658 E.02175
G1 X58.111 Y170.964 E.4098
G1 X58.487 Y170.749 E.01172
G1 X69.585 Y181.848 E.4253
G1 X70.365 Y182.037 E.02175
G1 X58.862 Y170.534 E.44081
G1 X59.237 Y170.319 E.01172
G1 X71.145 Y182.227 E.45632
G1 X71.925 Y182.416 E.02175
G1 X59.612 Y170.104 E.47182
G1 X59.988 Y169.889 E.01172
G1 X72.705 Y182.606 E.48733
G1 X73.484 Y182.795 E.02175
G1 X60.363 Y169.674 E.50283
G1 X60.738 Y169.459 E.01172
G1 X74.264 Y182.985 E.51834
G1 X75.044 Y183.174 E.02175
G1 X61.113 Y169.243 E.53385
G1 X61.489 Y169.028 E.01172
G1 X75.824 Y183.364 E.54935
G1 X76.604 Y183.553 E.02175
G1 X61.864 Y168.813 E.56486
G1 X62.239 Y168.598 E.01172
G1 X77.384 Y183.743 E.58036
G1 X78.164 Y183.932 E.02175
G1 X62.614 Y168.383 E.59587
G1 X62.989 Y168.168 E.01172
G1 X78.944 Y184.122 E.61137
G1 X79.723 Y184.311 E.02175
G1 X63.365 Y167.953 E.62688
G1 X63.74 Y167.738 E.01172
G1 X80.503 Y184.501 E.64239
G1 X81.283 Y184.69 E.02175
G1 X64.115 Y167.523 E.65789
G1 X64.49 Y167.307 E.01172
G1 X82.063 Y184.88 E.6734
G1 X82.843 Y185.069 E.02175
G1 X64.866 Y167.092 E.6889
G1 X65.241 Y166.877 E.01172
G1 X83.623 Y185.259 E.70441
G1 X84.403 Y185.448 E.02175
G1 X65.616 Y166.662 E.71992
G1 X65.991 Y166.447 E.01172
G1 X85.182 Y185.638 E.73542
G1 X85.962 Y185.827 E.02175
G1 X66.367 Y166.232 E.75093
G1 X66.742 Y166.017 E.01172
G1 X86.742 Y186.017 E.76643
G1 X87.522 Y186.207 E.02175
G1 X67.117 Y165.802 E.78194
G1 X67.492 Y165.586 E.01172
G1 X88.302 Y186.396 E.79744
G1 X89.082 Y186.586 E.02175
G1 X67.868 Y165.371 E.81295
G1 X68.243 Y165.156 E.01172
G1 X89.862 Y186.775 E.82846
G1 X90.642 Y186.965 E.02175
G1 X68.618 Y164.941 E.84396
G1 X68.993 Y164.726 E.01172
G1 X91.421 Y187.154 E.85947
G1 X92.201 Y187.344 E.02175
G1 X69.369 Y164.511 E.87497
G1 X69.744 Y164.296 E.01172
G1 X92.981 Y187.533 E.89048
G1 X93.761 Y187.723 E.02175
G1 X70.119 Y164.081 E.90599
G1 X70.494 Y163.865 E.01172
G1 X94.541 Y187.912 E.92149
G1 X95.321 Y188.102 E.02175
G1 X70.87 Y163.65 E.937
G1 X71.245 Y163.435 E.01172
G1 X96.101 Y188.291 E.9525
G1 X96.881 Y188.481 E.02175
G1 X71.62 Y163.22 E.96801
G1 X71.995 Y163.005 E.01172
G1 X97.66 Y188.67 E.98351
G1 X98.44 Y188.86 E.02175
G1 X72.371 Y162.79 E.99902
G1 X72.746 Y162.575 E.01172
G1 X99.22 Y189.049 E1.01453
G1 X100 Y189.239 E.02175
G1 X73.121 Y162.36 E1.03003
G1 X73.496 Y162.144 E.01172
G1 X100.78 Y189.428 E1.04554
G1 X101.56 Y189.618 E.02175
G1 X73.872 Y161.929 E1.06104
G1 X74.247 Y161.714 E.01172
G1 X102.34 Y189.807 E1.07655
G1 X103.12 Y189.997 E.02175
G1 X74.622 Y161.499 E1.09206
G1 X74.997 Y161.284 E.01172
G1 X103.899 Y190.186 E1.10756
G1 X104.679 Y190.376 E.02175
G1 X75.372 Y161.069 E1.12307
G1 X75.748 Y160.854 E.01172
G1 X105.459 Y190.565 E1.13857
G1 X106.239 Y190.755 E.02175
G1 X76.123 Y160.639 E1.15408
G1 X76.498 Y160.424 E.01172
G1 X107.019 Y190.944 E1.16959
G1 X107.799 Y191.134 E.02175
G1 X76.873 Y160.208 E1.18509
G1 X77.249 Y159.993 E.01172
G1 X108.579 Y191.323 E1.2006
G1 X109.359 Y191.513 E.02175
G1 X77.624 Y159.778 E1.2161
G1 X77.999 Y159.563 E.01172
G1 X110.138 Y191.702 E1.23161
G1 X110.918 Y191.892 E.02175
G1 X78.374 Y159.348 E1.24712
G1 X78.75 Y159.133 E.01172
G1 X111.698 Y192.081 E1.26262
G1 X112.478 Y192.271 E.02175
G1 X79.125 Y158.918 E1.27813
G1 X79.5 Y158.703 E.01172
G1 X113.258 Y192.46 E1.29363
G1 X114.038 Y192.65 E.02175
G1 X79.875 Y158.487 E1.30914
G1 X80.251 Y158.272 E.01172
G1 X114.818 Y192.839 E1.32464
G1 X115.598 Y193.029 E.02175
G1 X80.626 Y158.057 E1.34015
G1 X81.001 Y157.842 E.01172
G1 X116.377 Y193.218 E1.35566
G1 X117.157 Y193.408 E.02175
G1 X81.376 Y157.627 E1.37116
G1 X81.752 Y157.412 E.01172
G1 X117.937 Y193.597 E1.38667
G1 X118.717 Y193.787 E.02175
G1 X82.127 Y157.197 E1.40217
G1 X82.502 Y156.982 E.01172
G1 X119.497 Y193.976 E1.41768
G1 X120.277 Y194.166 E.02175
G1 X82.877 Y156.766 E1.43318
G1 X83.253 Y156.551 E.01172
G1 X121.057 Y194.355 E1.44869
G1 X121.837 Y194.545 E.02175
G1 X83.628 Y156.336 E1.4642
G1 X84.003 Y156.121 E.01172
G1 X122.616 Y194.734 E1.4797
G1 X123.396 Y194.924 E.02175
G1 X84.378 Y155.906 E1.49521
G1 X84.754 Y155.691 E.01172
G1 X123.626 Y194.563 E1.48962
G1 X123.614 Y193.961 E.01633
G1 X85.129 Y155.476 E1.47478
G1 X85.504 Y155.261 E.01172
G1 X123.602 Y193.358 E1.45994
G1 X123.589 Y192.756 E.01633
G1 X85.879 Y155.045 E1.44509
G1 X86.255 Y154.83 E.01172
G1 X123.577 Y192.153 E1.43025
G1 X123.565 Y191.551 E.01633
G1 X86.63 Y154.615 E1.41541
G1 X87.005 Y154.4 E.01172
G1 X123.553 Y190.948 E1.40057
G1 X123.541 Y190.346 E.01633
G1 X87.38 Y154.185 E1.38573
G1 X87.755 Y153.97 E.01172
G1 X123.529 Y189.744 E1.37089
G1 X123.517 Y189.141 E.01633
G1 X88.131 Y153.755 E1.35604
G1 X88.506 Y153.54 E.01172
G1 X123.505 Y188.539 E1.3412
G1 X123.493 Y187.936 E.01633
G1 X88.881 Y153.325 E1.32636
G1 X89.256 Y153.109 E.01172
G1 X123.481 Y187.334 E1.31152
G1 X123.469 Y186.732 E.01633
G1 X89.632 Y152.894 E1.29668
G1 X90.007 Y152.679 E.01172
G1 X123.457 Y186.129 E1.28184
G1 X123.445 Y185.527 E.01633
G1 X90.382 Y152.464 E1.267
G1 X90.757 Y152.249 E.01172
G1 X123.433 Y184.924 E1.25215
G1 X123.421 Y184.322 E.01633
G1 X91.133 Y152.034 E1.23731
G1 X91.508 Y151.819 E.01172
G1 X123.409 Y183.719 E1.22247
G1 X123.397 Y183.117 E.01633
G1 X91.883 Y151.604 E1.20763
G1 X92.258 Y151.388 E.01172
G1 X123.385 Y182.515 E1.19279
G1 X123.372 Y181.912 E.01633
G1 X92.634 Y151.173 E1.17795
G1 X93.009 Y150.958 E.01172
G1 X123.36 Y181.31 E1.1631
G1 X123.348 Y180.707 E.01633
G1 X93.384 Y150.743 E1.14826
G1 X93.759 Y150.528 E.01172
G1 X123.336 Y180.105 E1.13342
G1 X123.324 Y179.503 E.01633
G1 X94.135 Y150.313 E1.11858
G1 X94.51 Y150.098 E.01172
G1 X123.312 Y178.9 E1.10374
G1 X123.3 Y178.298 E.01633
G1 X94.885 Y149.883 E1.0889
G1 X95.26 Y149.667 E.01172
G1 X123.288 Y177.695 E1.07405
G1 X123.276 Y177.093 E.01633
G1 X95.636 Y149.452 E1.05921
G1 X96.011 Y149.237 E.01172
G1 X123.264 Y176.49 E1.04437
G1 X123.252 Y175.888 E.01633
G1 X96.386 Y149.022 E1.02953
G1 X96.761 Y148.807 E.01172
G1 X123.24 Y175.286 E1.01469
G1 X123.228 Y174.683 E.01633
G1 X97.137 Y148.592 E.99985
G1 X97.512 Y148.377 E.01172
G1 X123.216 Y174.081 E.985
G1 X123.204 Y173.478 E.01633
G1 X97.887 Y148.162 E.97016
G1 X98.262 Y147.946 E.01172
G1 X123.192 Y172.876 E.95532
G1 X123.18 Y172.274 E.01633
G1 X98.638 Y147.731 E.94048
G1 X99.013 Y147.516 E.01172
G1 X123.168 Y171.671 E.92564
G1 X123.156 Y171.069 E.01633
G1 X99.388 Y147.301 E.9108
G1 X99.763 Y147.086 E.01172
G1 X123.143 Y170.466 E.89596
G1 X123.131 Y169.864 E.01633
G1 X100.138 Y146.871 E.88111
G1 X100.514 Y146.656 E.01172
G1 X123.119 Y169.261 E.86627
G1 X123.107 Y168.659 E.01633
G1 X100.889 Y146.441 E.85143
G1 X101.264 Y146.226 E.01172
G1 X123.095 Y168.057 E.83659
G1 X123.083 Y167.454 E.01633
G1 X101.639 Y146.01 E.82175
G1 X102.015 Y145.795 E.01172
G1 X123.071 Y166.852 E.80691
G1 X123.059 Y166.249 E.01633
G1 X102.39 Y145.58 E.79206
G1 X102.765 Y145.365 E.01172
G1 X123.047 Y165.647 E.77722
G1 X123.035 Y165.045 E.01633
G1 X103.14 Y145.15 E.76238
G1 X103.516 Y144.935 E.01172
G1 X123.023 Y164.442 E.74754
G1 X123.011 Y163.84 E.01633
G1 X103.891 Y144.72 E.7327
G1 X104.266 Y144.505 E.01172
G1 X122.999 Y163.237 E.71786
G1 X122.987 Y162.635 E.01633
G1 X104.641 Y144.289 E.70301
G1 X105.017 Y144.074 E.01172
G1 X122.975 Y162.032 E.68817
M73 P40 R42
G1 X122.963 Y161.43 E.01633
G1 X105.392 Y143.859 E.67333
G1 X105.767 Y143.644 E.01172
G1 X122.951 Y160.828 E.65849
G1 X122.939 Y160.225 E.01633
G1 X106.142 Y143.429 E.64365
G1 X106.518 Y143.214 E.01172
G1 X122.927 Y159.623 E.62881
G1 X122.914 Y159.02 E.01633
G1 X106.893 Y142.999 E.61396
G1 X107.268 Y142.784 E.01172
G1 X122.902 Y158.418 E.59912
G1 X122.89 Y157.815 E.01633
G1 X107.643 Y142.568 E.58428
G1 X108.019 Y142.353 E.01172
G1 X122.878 Y157.213 E.56944
G1 X122.866 Y156.611 E.01633
G1 X108.394 Y142.138 E.5546
G1 X108.769 Y141.923 E.01172
G1 X122.854 Y156.008 E.53976
G1 X122.842 Y155.406 E.01633
G1 X109.144 Y141.708 E.52492
G1 X109.52 Y141.493 E.01172
G1 X122.83 Y154.803 E.51007
G1 X122.818 Y154.201 E.01633
G1 X109.895 Y141.278 E.49523
G1 X110.275 Y141.068 E.01177
G1 X122.806 Y153.599 E.4802
G1 X122.794 Y152.996 E.01633
G1 X111.449 Y141.651 E.43476
G1 X112.845 Y142.457 E.0437
G1 X122.782 Y152.394 E.38077
G1 X122.77 Y151.791 E.01633
G1 X114.242 Y143.264 E.32679
G1 X115.639 Y144.07 E.0437
G1 X122.758 Y151.189 E.2728
G1 X122.746 Y150.586 E.01633
G1 X117.036 Y144.877 E.21881
G1 X118.433 Y145.683 E.04371
G1 X122.734 Y149.984 E.16482
G1 X122.722 Y149.382 E.01633
G1 X119.829 Y146.49 E.11083
G1 X121.226 Y147.296 E.0437
G1 X122.9 Y148.97 E.06415
; OBJECT_ID: 437
; WIPE_START
G1 X121.486 Y147.556 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 409
M625
; start printing object, unique label id: 437
M624 EAAAAAAAAAA=
M204 S10000
G1 X116.02 Y142.229 Z1.24 F30000
G1 X47.244 Y75.215 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X123.999 Y56.564 E2.14036
G1 X123.053 Y103.847 E1.28149
G1 X122.861 Y104.171 E.01019
G1 X110.534 Y111.288 E.3857
G1 X110.167 Y111.288 E.00995
G1 X47.296 Y75.245 E1.96372
; WIPE_START
G1 X49.239 Y74.772 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.23 Y75.049 Z1.24 F30000
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X124.186 Y56.106 E2.01694
G1 X124.284 Y56.185 E.00317
G1 X124.365 Y56.25 E.00262
G1 X124.405 Y56.282 E.00129
G1 X123.451 Y103.96 E1.19892
G1 X123.409 Y104.031 E.00207
G1 X123.195 Y104.394 E.0106
G1 X123.153 Y104.465 E.00207
G1 X110.642 Y111.688 E.3632
G1 X110.561 Y111.688 E.00204
G1 X110.142 Y111.689 E.01053
G1 X110.061 Y111.689 E.00204
G1 X46.191 Y75.074 E1.85092
; WIPE_START
M204 S4000
G1 X48.135 Y74.601 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P40 R41
G1 X48.218 Y75.579 Z1.24 F30000
G1 Z.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.529 Y75.269 E.0119
G1 X49.308 Y75.079 E.02175
G1 X48.73 Y75.658 E.02215
G1 X49.106 Y75.873 E.01172
G1 X50.088 Y74.89 E.03766
G1 X50.868 Y74.7 E.02175
G1 X49.481 Y76.088 E.05317
G1 X49.856 Y76.303 E.01172
G1 X51.648 Y74.511 E.06867
G1 X52.428 Y74.321 E.02175
G1 X50.231 Y76.518 E.08418
G1 X50.606 Y76.733 E.01172
G1 X53.208 Y74.132 E.09968
G1 X53.988 Y73.942 E.02175
G1 X50.982 Y76.948 E.11519
G1 X51.357 Y77.163 E.01172
G1 X54.767 Y73.753 E.13069
G1 X55.547 Y73.563 E.02175
G1 X51.732 Y77.378 E.1462
G1 X52.107 Y77.594 E.01172
G1 X56.327 Y73.374 E.16171
G1 X57.107 Y73.184 E.02175
G1 X52.483 Y77.809 E.17721
G1 X52.858 Y78.024 E.01172
G1 X57.887 Y72.995 E.19272
G1 X58.667 Y72.805 E.02175
G1 X53.233 Y78.239 E.20822
G1 X53.608 Y78.454 E.01172
G1 X59.447 Y72.616 E.22373
G1 X60.227 Y72.426 E.02175
G1 X53.984 Y78.669 E.23924
G1 X54.359 Y78.884 E.01172
G1 X61.006 Y72.237 E.25474
G1 X61.786 Y72.047 E.02175
G1 X54.734 Y79.099 E.27025
G1 X55.109 Y79.315 E.01172
G1 X62.566 Y71.858 E.28575
G1 X63.346 Y71.668 E.02175
G1 X55.485 Y79.53 E.30126
G1 X55.86 Y79.745 E.01172
G1 X64.126 Y71.479 E.31676
G1 X64.906 Y71.289 E.02175
G1 X56.235 Y79.96 E.33227
G1 X56.61 Y80.175 E.01172
G1 X65.686 Y71.1 E.34778
G1 X66.466 Y70.91 E.02175
G1 X56.986 Y80.39 E.36328
G1 X57.361 Y80.605 E.01172
G1 X67.245 Y70.721 E.37879
G1 X68.025 Y70.531 E.02175
G1 X57.736 Y80.82 E.39429
G1 X58.111 Y81.036 E.01172
G1 X68.805 Y70.342 E.4098
G1 X69.585 Y70.152 E.02175
G1 X58.487 Y81.251 E.42531
G1 X58.862 Y81.466 E.01172
G1 X70.365 Y69.963 E.44081
G1 X71.145 Y69.773 E.02175
G1 X59.237 Y81.681 E.45632
G1 X59.612 Y81.896 E.01172
G1 X71.925 Y69.584 E.47182
G1 X72.705 Y69.394 E.02175
G1 X59.988 Y82.111 E.48733
G1 X60.363 Y82.326 E.01172
G1 X73.484 Y69.205 E.50283
G1 X74.264 Y69.015 E.02175
G1 X60.738 Y82.541 E.51834
G1 X61.113 Y82.757 E.01172
G1 X75.044 Y68.826 E.53385
G1 X75.824 Y68.636 E.02175
G1 X61.489 Y82.972 E.54935
G1 X61.864 Y83.187 E.01172
G1 X76.604 Y68.447 E.56486
G1 X77.384 Y68.257 E.02175
G1 X62.239 Y83.402 E.58036
G1 X62.614 Y83.617 E.01172
G1 X78.164 Y68.068 E.59587
G1 X78.944 Y67.878 E.02175
G1 X62.989 Y83.832 E.61138
G1 X63.365 Y84.047 E.01172
G1 X79.723 Y67.689 E.62688
G1 X80.503 Y67.499 E.02175
G1 X63.74 Y84.262 E.64239
G1 X64.115 Y84.477 E.01172
G1 X81.283 Y67.31 E.65789
G1 X82.063 Y67.12 E.02175
G1 X64.49 Y84.693 E.6734
G1 X64.866 Y84.908 E.01172
G1 X82.843 Y66.931 E.68891
G1 X83.623 Y66.741 E.02175
G1 X65.241 Y85.123 E.70441
G1 X65.616 Y85.338 E.01172
G1 X84.403 Y66.552 E.71992
G1 X85.183 Y66.362 E.02175
G1 X65.991 Y85.553 E.73542
G1 X66.367 Y85.768 E.01172
G1 X85.962 Y66.172 E.75093
G1 X86.742 Y65.983 E.02175
G1 X66.742 Y85.983 E.76643
G1 X67.117 Y86.198 E.01172
G1 X87.522 Y65.793 E.78194
G1 X88.302 Y65.604 E.02175
G1 X67.492 Y86.414 E.79745
G1 X67.868 Y86.629 E.01172
G1 X89.082 Y65.414 E.81295
G1 X89.862 Y65.225 E.02175
G1 X68.243 Y86.844 E.82846
G1 X68.618 Y87.059 E.01172
G1 X90.642 Y65.035 E.84396
G1 X91.422 Y64.846 E.02175
G1 X68.993 Y87.274 E.85947
G1 X69.369 Y87.489 E.01172
G1 X92.201 Y64.656 E.87497
G1 X92.981 Y64.467 E.02175
G1 X69.744 Y87.704 E.89048
G1 X70.119 Y87.919 E.01172
G1 X93.761 Y64.277 E.90599
G1 X94.541 Y64.088 E.02175
G1 X70.494 Y88.135 E.92149
G1 X70.87 Y88.35 E.01172
G1 X95.321 Y63.898 E.937
G1 X96.101 Y63.709 E.02175
G1 X71.245 Y88.565 E.9525
G1 X71.62 Y88.78 E.01172
G1 X96.881 Y63.519 E.96801
G1 X97.66 Y63.33 E.02175
G1 X71.995 Y88.995 E.98352
G1 X72.371 Y89.21 E.01172
G1 X98.44 Y63.14 E.99902
G1 X99.22 Y62.951 E.02175
G1 X72.746 Y89.425 E1.01453
G1 X73.121 Y89.64 E.01172
G1 X100 Y62.761 E1.03003
G1 X100.78 Y62.572 E.02175
G1 X73.496 Y89.856 E1.04554
G1 X73.872 Y90.071 E.01172
G1 X101.56 Y62.382 E1.06105
G1 X102.34 Y62.193 E.02175
G1 X74.247 Y90.286 E1.07655
G1 X74.622 Y90.501 E.01172
G1 X103.12 Y62.003 E1.09206
G1 X103.899 Y61.814 E.02175
G1 X74.997 Y90.716 E1.10756
G1 X75.372 Y90.931 E.01172
G1 X104.679 Y61.624 E1.12307
G1 X105.459 Y61.435 E.02175
G1 X75.748 Y91.146 E1.13857
G1 X76.123 Y91.361 E.01172
G1 X106.239 Y61.245 E1.15408
G1 X107.019 Y61.056 E.02175
G1 X76.498 Y91.576 E1.16959
G1 X76.873 Y91.792 E.01172
G1 X107.799 Y60.866 E1.18509
G1 X108.579 Y60.677 E.02175
G1 X77.249 Y92.007 E1.2006
G1 X77.624 Y92.222 E.01172
G1 X109.359 Y60.487 E1.2161
G1 X110.138 Y60.298 E.02175
G1 X77.999 Y92.437 E1.23161
G1 X78.374 Y92.652 E.01172
G1 X110.918 Y60.108 E1.24712
G1 X111.698 Y59.919 E.02175
G1 X78.75 Y92.867 E1.26262
G1 X79.125 Y93.082 E.01172
G1 X112.478 Y59.729 E1.27813
G1 X113.258 Y59.54 E.02175
G1 X79.5 Y93.297 E1.29363
G1 X79.875 Y93.513 E.01172
G1 X114.038 Y59.35 E1.30914
G1 X114.818 Y59.161 E.02175
G1 X80.251 Y93.728 E1.32464
G1 X80.626 Y93.943 E.01172
G1 X115.598 Y58.971 E1.34015
G1 X116.377 Y58.782 E.02175
G1 X81.001 Y94.158 E1.35566
G1 X81.376 Y94.373 E.01172
G1 X117.157 Y58.592 E1.37116
G1 X117.937 Y58.403 E.02175
G1 X81.752 Y94.588 E1.38667
G1 X82.127 Y94.803 E.01172
G1 X118.717 Y58.213 E1.40217
G1 X119.497 Y58.024 E.02175
G1 X82.502 Y95.018 E1.41768
G1 X82.877 Y95.234 E.01172
G1 X120.277 Y57.834 E1.43319
G1 X121.057 Y57.645 E.02175
G1 X83.253 Y95.449 E1.44869
G1 X83.628 Y95.664 E.01172
G1 X121.837 Y57.455 E1.4642
G1 X122.616 Y57.266 E.02175
G1 X84.003 Y95.879 E1.4797
G1 X84.378 Y96.094 E.01172
G1 X123.396 Y57.076 E1.49521
G1 X123.634 Y57.018 E.00663
G1 X123.626 Y57.437 E.01135
G1 X84.754 Y96.309 E1.48962
G1 X85.129 Y96.524 E.01172
G1 X123.614 Y58.039 E1.47478
G1 X123.602 Y58.642 E.01633
G1 X85.504 Y96.739 E1.45994
G1 X85.879 Y96.955 E.01172
G1 X123.589 Y59.244 E1.44509
G1 X123.577 Y59.847 E.01633
G1 X86.255 Y97.17 E1.43025
G1 X86.63 Y97.385 E.01172
G1 X123.565 Y60.449 E1.41541
G1 X123.553 Y61.052 E.01633
G1 X87.005 Y97.6 E1.40057
G1 X87.38 Y97.815 E.01172
G1 X123.541 Y61.654 E1.38573
G1 X123.529 Y62.256 E.01633
G1 X87.755 Y98.03 E1.37089
G1 X88.131 Y98.245 E.01172
G1 X123.517 Y62.859 E1.35604
G1 X123.505 Y63.461 E.01633
G1 X88.506 Y98.46 E1.3412
G1 X88.881 Y98.675 E.01172
G1 X123.493 Y64.064 E1.32636
G1 X123.481 Y64.666 E.01633
G1 X89.256 Y98.891 E1.31152
G1 X89.632 Y99.106 E.01172
G1 X123.469 Y65.268 E1.29668
G1 X123.457 Y65.871 E.01633
G1 X90.007 Y99.321 E1.28184
G1 X90.382 Y99.536 E.01172
G1 X123.445 Y66.473 E1.26699
G1 X123.433 Y67.076 E.01633
G1 X90.757 Y99.751 E1.25215
G1 X91.133 Y99.966 E.01172
G1 X123.421 Y67.678 E1.23731
G1 X123.409 Y68.281 E.01633
G1 X91.508 Y100.181 E1.22247
G1 X91.883 Y100.396 E.01172
G1 X123.397 Y68.883 E1.20763
G1 X123.385 Y69.485 E.01633
G1 X92.258 Y100.612 E1.19279
G1 X92.634 Y100.827 E.01172
G1 X123.373 Y70.088 E1.17794
G1 X123.36 Y70.69 E.01633
G1 X93.009 Y101.042 E1.1631
G1 X93.384 Y101.257 E.01172
G1 X123.348 Y71.293 E1.14826
G1 X123.336 Y71.895 E.01633
G1 X93.759 Y101.472 E1.13342
G1 X94.135 Y101.687 E.01172
G1 X123.324 Y72.497 E1.11858
G1 X123.312 Y73.1 E.01633
G1 X94.51 Y101.902 E1.10374
G1 X94.885 Y102.117 E.01172
G1 X123.3 Y73.702 E1.0889
G1 X123.288 Y74.305 E.01633
G1 X95.26 Y102.333 E1.07405
G1 X95.636 Y102.548 E.01172
G1 X123.276 Y74.907 E1.05921
G1 X123.264 Y75.51 E.01633
G1 X96.011 Y102.763 E1.04437
G1 X96.386 Y102.978 E.01172
G1 X123.252 Y76.112 E1.02953
G1 X123.24 Y76.714 E.01633
G1 X96.761 Y103.193 E1.01469
G1 X97.137 Y103.408 E.01172
G1 X123.228 Y77.317 E.99985
G1 X123.216 Y77.919 E.01633
G1 X97.512 Y103.623 E.985
G1 X97.887 Y103.838 E.01172
G1 X123.204 Y78.522 E.97016
G1 X123.192 Y79.124 E.01633
G1 X98.262 Y104.054 E.95532
G1 X98.638 Y104.269 E.01172
G1 X123.18 Y79.727 E.94048
G1 X123.168 Y80.329 E.01633
G1 X99.013 Y104.484 E.92564
G1 X99.388 Y104.699 E.01172
G1 X123.156 Y80.931 E.9108
G1 X123.143 Y81.534 E.01633
G1 X99.763 Y104.914 E.89595
G1 X100.138 Y105.129 E.01172
G1 X123.131 Y82.136 E.88111
G1 X123.119 Y82.739 E.01633
G1 X100.514 Y105.344 E.86627
G1 X100.889 Y105.559 E.01172
G1 X123.107 Y83.341 E.85143
G1 X123.095 Y83.943 E.01633
G1 X101.264 Y105.774 E.83659
G1 X101.639 Y105.99 E.01172
G1 X123.083 Y84.546 E.82175
G1 X123.071 Y85.148 E.01633
G1 X102.015 Y106.205 E.80691
G1 X102.39 Y106.42 E.01172
G1 X123.059 Y85.751 E.79206
G1 X123.047 Y86.353 E.01633
G1 X102.765 Y106.635 E.77722
G1 X103.14 Y106.85 E.01172
G1 X123.035 Y86.956 E.76238
G1 X123.023 Y87.558 E.01633
M73 P41 R41
G1 X103.516 Y107.065 E.74754
G1 X103.891 Y107.28 E.01172
G1 X123.011 Y88.16 E.7327
G1 X122.999 Y88.763 E.01633
G1 X104.266 Y107.495 E.71786
G1 X104.641 Y107.711 E.01172
G1 X122.987 Y89.365 E.70301
G1 X122.975 Y89.968 E.01633
G1 X105.017 Y107.926 E.68817
G1 X105.392 Y108.141 E.01172
G1 X122.963 Y90.57 E.67333
G1 X122.951 Y91.172 E.01633
G1 X105.767 Y108.356 E.65849
G1 X106.142 Y108.571 E.01172
G1 X122.939 Y91.775 E.64365
G1 X122.927 Y92.377 E.01633
G1 X106.518 Y108.786 E.62881
G1 X106.893 Y109.001 E.01172
G1 X122.914 Y92.98 E.61396
G1 X122.902 Y93.582 E.01633
G1 X107.268 Y109.216 E.59912
G1 X107.643 Y109.432 E.01172
G1 X122.89 Y94.185 E.58428
G1 X122.878 Y94.787 E.01633
G1 X108.019 Y109.647 E.56944
G1 X108.394 Y109.862 E.01172
G1 X122.866 Y95.389 E.5546
G1 X122.854 Y95.992 E.01633
G1 X108.769 Y110.077 E.53976
G1 X109.144 Y110.292 E.01172
G1 X122.842 Y96.594 E.52491
G1 X122.83 Y97.197 E.01633
G1 X109.52 Y110.507 E.51007
G1 X109.895 Y110.722 E.01172
G1 X122.818 Y97.799 E.49523
G1 X122.806 Y98.401 E.01633
G1 X110.275 Y110.932 E.4802
G1 X110.439 Y110.932 E.00444
G1 X111.449 Y110.349 E.0316
G1 X122.794 Y99.004 E.43476
G1 X122.782 Y99.606 E.01633
G1 X112.845 Y109.543 E.38077
G1 X114.242 Y108.736 E.0437
G1 X122.77 Y100.209 E.32678
G1 X122.758 Y100.811 E.01633
G1 X115.639 Y107.93 E.2728
G1 X117.036 Y107.123 E.0437
G1 X122.746 Y101.414 E.21881
G1 X122.734 Y102.016 E.01633
G1 X118.433 Y106.317 E.16482
G1 X119.83 Y105.51 E.04371
G1 X122.722 Y102.618 E.11083
G1 X122.71 Y103.221 E.01633
G1 X120.715 Y105.215 E.07642
; OBJECT_ID: 465
; WIPE_START
G1 X122.129 Y103.801 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 437
M625
; start printing object, unique label id: 465
M624 IAAAAAAAAAA=
M204 S10000
G1 X116.26 Y108.68 Z1.24 F30000
G1 X40.405 Y171.729 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X40.405 Y80.271 E2.47823
G1 X104.909 Y117.251 E2.01473
G1 X106.343 Y118.073 E.0448
G1 X106.526 Y118.388 E.00986
G1 X106.526 Y133.612 E.41253
G1 X106.343 Y133.927 E.00986
G1 X40.457 Y171.699 E2.0579
M204 S10000
G1 X40.004 Y172.261 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X40.004 Y79.739 E2.32615
G1 X40.101 Y79.682 E.00282
G1 X40.142 Y79.659 E.00118
G1 X105.108 Y116.903 E1.88272
G1 X106.636 Y117.779 E.04427
G1 X106.677 Y117.849 E.00203
G1 X106.886 Y118.21 E.0105
G1 X106.927 Y118.28 E.00203
G1 X106.927 Y133.72 E.38817
G1 X106.886 Y133.79 E.00203
G1 X106.677 Y134.151 E.0105
G1 X106.636 Y134.221 E.00203
G1 X40.142 Y172.341 E1.92699
G1 X40.101 Y172.318 E.00118
G1 X40.056 Y172.292 E.00131
; WIPE_START
M204 S4000
G1 X40.055 Y170.292 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X40.762 Y171.33 Z1.24 F30000
G1 Z.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X40.762 Y80.886 E2.45076
G1 X41.179 Y81.125 E.01301
G1 X41.179 Y170.875 E2.43197
G1 X41.595 Y170.636 E.01301
G1 X41.595 Y81.364 E2.41903
G1 X42.012 Y81.602 E.01301
G1 X42.012 Y170.397 E2.40608
G1 X42.428 Y170.159 E.01301
G1 X42.428 Y81.841 E2.39314
G1 X42.845 Y82.08 E.01301
G1 X42.845 Y169.92 E2.3802
G1 X43.262 Y169.681 E.01301
G1 X43.262 Y82.319 E2.36725
G1 X43.678 Y82.558 E.01301
G1 X43.678 Y169.442 E2.35431
G1 X44.095 Y169.203 E.01301
G1 X44.095 Y82.797 E2.34137
G1 X44.512 Y83.036 E.01301
G1 X44.512 Y168.964 E2.32842
G1 X44.928 Y168.726 E.01301
G1 X44.928 Y83.274 E2.31548
G1 X45.345 Y83.513 E.01301
G1 X45.345 Y168.487 E2.30254
G1 X45.761 Y168.248 E.01301
G1 X45.761 Y83.752 E2.28959
G1 X46.178 Y83.991 E.01301
G1 X46.178 Y168.009 E2.27665
G1 X46.595 Y167.77 E.01301
G1 X46.595 Y84.23 E2.2637
G1 X47.011 Y84.469 E.01301
G1 X47.011 Y167.531 E2.25076
G1 X47.428 Y167.293 E.01301
G1 X47.428 Y84.707 E2.23782
G1 X47.844 Y84.946 E.01301
G1 X47.844 Y167.054 E2.22487
G1 X48.261 Y166.815 E.01301
G1 X48.261 Y85.185 E2.21193
G1 X48.678 Y85.424 E.01301
G1 X48.678 Y166.576 E2.19899
G1 X49.094 Y166.337 E.01301
G1 X49.094 Y85.663 E2.18604
G1 X49.511 Y85.902 E.01301
G1 X49.511 Y166.098 E2.1731
G1 X49.927 Y165.86 E.01301
G1 X49.927 Y86.14 E2.16016
G1 X50.344 Y86.379 E.01301
G1 X50.344 Y165.621 E2.14721
G1 X50.761 Y165.382 E.01301
G1 X50.761 Y86.618 E2.13427
G1 X51.177 Y86.857 E.01301
G1 X51.177 Y165.143 E2.12133
G1 X51.594 Y164.904 E.01301
G1 X51.594 Y87.096 E2.10838
G1 X52.01 Y87.335 E.01301
G1 X52.01 Y164.665 E2.09544
G1 X52.427 Y164.427 E.01301
G1 X52.427 Y87.573 E2.0825
G1 X52.844 Y87.812 E.01301
G1 X52.844 Y164.188 E2.06955
G1 X53.26 Y163.949 E.01301
G1 X53.26 Y88.051 E2.05661
G1 X53.677 Y88.29 E.01301
G1 X53.677 Y163.71 E2.04366
G1 X54.094 Y163.471 E.01301
G1 X54.094 Y88.529 E2.03072
G1 X54.51 Y88.768 E.01301
G1 X54.51 Y163.232 E2.01778
G1 X54.927 Y162.994 E.01301
G1 X54.927 Y89.006 E2.00483
G1 X55.343 Y89.245 E.01301
G1 X55.343 Y162.755 E1.99189
G1 X55.76 Y162.516 E.01301
G1 X55.76 Y89.484 E1.97895
G1 X56.177 Y89.723 E.01301
G1 X56.177 Y162.277 E1.966
G1 X56.593 Y162.038 E.01301
G1 X56.593 Y89.962 E1.95306
G1 X57.01 Y90.201 E.01301
G1 X57.01 Y161.799 E1.94012
G1 X57.426 Y161.561 E.01301
G1 X57.426 Y90.439 E1.92717
G1 X57.843 Y90.678 E.01301
G1 X57.843 Y161.322 E1.91423
G1 X58.26 Y161.083 E.01301
G1 X58.26 Y90.917 E1.90129
G1 X58.676 Y91.156 E.01301
G1 X58.676 Y160.844 E1.88834
M73 P41 R40
G1 X59.093 Y160.605 E.01301
G1 X59.093 Y91.395 E1.8754
G1 X59.509 Y91.634 E.01301
G1 X59.509 Y160.366 E1.86245
G1 X59.926 Y160.128 E.01301
G1 X59.926 Y91.872 E1.84951
G1 X60.343 Y92.111 E.01301
G1 X60.343 Y159.889 E1.83657
G1 X60.759 Y159.65 E.01301
G1 X60.759 Y92.35 E1.82362
G1 X61.176 Y92.589 E.01301
G1 X61.176 Y159.411 E1.81068
G1 X61.593 Y159.172 E.01301
G1 X61.593 Y92.828 E1.79774
G1 X62.009 Y93.067 E.01301
G1 X62.009 Y158.933 E1.78479
G1 X62.426 Y158.695 E.01301
G1 X62.426 Y93.305 E1.77185
G1 X62.842 Y93.544 E.01301
G1 X62.842 Y158.456 E1.75891
G1 X63.259 Y158.217 E.01301
G1 X63.259 Y93.783 E1.74596
G1 X63.676 Y94.022 E.01301
G1 X63.676 Y157.978 E1.73302
G1 X64.092 Y157.739 E.01301
G1 X64.092 Y94.261 E1.72008
G1 X64.509 Y94.5 E.01301
G1 X64.509 Y157.5 E1.70713
G1 X64.925 Y157.261 E.01301
G1 X64.925 Y94.739 E1.69419
G1 X65.342 Y94.977 E.01301
G1 X65.342 Y157.023 E1.68125
G1 X65.759 Y156.784 E.01301
G1 X65.759 Y95.216 E1.6683
G1 X66.175 Y95.455 E.01301
G1 X66.175 Y156.545 E1.65536
G1 X66.592 Y156.306 E.01301
G1 X66.592 Y95.694 E1.64241
G1 X67.008 Y95.933 E.01301
G1 X67.008 Y156.067 E1.62947
G1 X67.425 Y155.828 E.01301
G1 X67.425 Y96.172 E1.61653
G1 X67.842 Y96.41 E.01301
G1 X67.842 Y155.59 E1.60358
G1 X68.258 Y155.351 E.01301
G1 X68.258 Y96.649 E1.59064
G1 X68.675 Y96.888 E.01301
G1 X68.675 Y155.112 E1.5777
G1 X69.091 Y154.873 E.01301
G1 X69.091 Y97.127 E1.56475
G1 X69.508 Y97.366 E.01301
G1 X69.508 Y154.634 E1.55181
G1 X69.925 Y154.395 E.01301
G1 X69.925 Y97.605 E1.53887
G1 X70.341 Y97.843 E.01301
G1 X70.341 Y154.157 E1.52592
G1 X70.758 Y153.918 E.01301
G1 X70.758 Y98.082 E1.51298
G1 X71.175 Y98.321 E.01301
G1 X71.175 Y153.679 E1.50004
G1 X71.591 Y153.44 E.01301
G1 X71.591 Y98.56 E1.48709
G1 X72.008 Y98.799 E.01301
G1 X72.008 Y153.201 E1.47415
G1 X72.424 Y152.962 E.01301
G1 X72.424 Y99.038 E1.46121
G1 X72.841 Y99.276 E.01301
G1 X72.841 Y152.724 E1.44826
G1 X73.258 Y152.485 E.01301
G1 X73.258 Y99.515 E1.43532
G1 X73.674 Y99.754 E.01301
G1 X73.674 Y152.246 E1.42237
G1 X74.091 Y152.007 E.01301
G1 X74.091 Y99.993 E1.40943
M73 P42 R40
G1 X74.507 Y100.232 E.01301
G1 X74.507 Y151.768 E1.39649
G1 X74.924 Y151.529 E.01301
G1 X74.924 Y100.471 E1.38354
G1 X75.341 Y100.709 E.01301
G1 X75.341 Y151.291 E1.3706
G1 X75.757 Y151.052 E.01301
G1 X75.757 Y100.948 E1.35766
G1 X76.174 Y101.187 E.01301
G1 X76.174 Y150.813 E1.34471
G1 X76.59 Y150.574 E.01301
G1 X76.59 Y101.426 E1.33177
G1 X77.007 Y101.665 E.01301
G1 X77.007 Y150.335 E1.31883
G1 X77.424 Y150.096 E.01301
G1 X77.424 Y101.904 E1.30588
G1 X77.84 Y102.142 E.01301
G1 X77.84 Y149.858 E1.29294
G1 X78.257 Y149.619 E.01301
G1 X78.257 Y102.381 E1.28
G1 X78.674 Y102.62 E.01301
G1 X78.674 Y149.38 E1.26705
G1 X79.09 Y149.141 E.01301
G1 X79.09 Y102.859 E1.25411
G1 X79.507 Y103.098 E.01301
G1 X79.507 Y148.902 E1.24117
G1 X79.923 Y148.663 E.01301
G1 X79.923 Y103.337 E1.22822
G1 X80.34 Y103.575 E.01301
G1 X80.34 Y148.425 E1.21528
G1 X80.757 Y148.186 E.01301
G1 X80.757 Y103.814 E1.20233
G1 X81.173 Y104.053 E.01301
G1 X81.173 Y147.947 E1.18939
G1 X81.59 Y147.708 E.01301
G1 X81.59 Y104.292 E1.17645
G1 X82.006 Y104.531 E.01301
G1 X82.006 Y147.469 E1.1635
G1 X82.423 Y147.23 E.01301
G1 X82.423 Y104.77 E1.15056
G1 X82.84 Y105.008 E.01301
G1 X82.84 Y146.992 E1.13762
G1 X83.256 Y146.753 E.01301
G1 X83.256 Y105.247 E1.12467
G1 X83.673 Y105.486 E.01301
G1 X83.673 Y146.514 E1.11173
G1 X84.089 Y146.275 E.01301
G1 X84.089 Y105.725 E1.09879
G1 X84.506 Y105.964 E.01301
G1 X84.506 Y146.036 E1.08584
G1 X84.923 Y145.797 E.01301
G1 X84.923 Y106.203 E1.0729
G1 X85.339 Y106.441 E.01301
G1 X85.339 Y145.558 E1.05996
G1 X85.756 Y145.32 E.01301
G1 X85.756 Y106.68 E1.04701
G1 X86.173 Y106.919 E.01301
G1 X86.173 Y145.081 E1.03407
G1 X86.589 Y144.842 E.01301
G1 X86.589 Y107.158 E1.02113
G1 X87.006 Y107.397 E.01301
G1 X87.006 Y144.603 E1.00818
G1 X87.422 Y144.364 E.01301
G1 X87.422 Y107.636 E.99524
G1 X87.839 Y107.875 E.01301
G1 X87.839 Y144.125 E.98229
G1 X88.256 Y143.887 E.01301
G1 X88.256 Y108.113 E.96935
G1 X88.672 Y108.352 E.01301
G1 X88.672 Y143.648 E.95641
G1 X89.089 Y143.409 E.01301
G1 X89.089 Y108.591 E.94346
G1 X89.505 Y108.83 E.01301
G1 X89.505 Y143.17 E.93052
G1 X89.922 Y142.931 E.01301
G1 X89.922 Y109.069 E.91758
G1 X90.339 Y109.308 E.01301
G1 X90.339 Y142.692 E.90463
G1 X90.755 Y142.454 E.01301
G1 X90.755 Y109.546 E.89169
G1 X91.172 Y109.785 E.01301
G1 X91.172 Y142.215 E.87875
G1 X91.588 Y141.976 E.01301
G1 X91.588 Y110.024 E.8658
G1 X92.005 Y110.263 E.01301
G1 X92.005 Y141.737 E.85286
G1 X92.422 Y141.498 E.01301
G1 X92.422 Y110.502 E.83992
G1 X92.838 Y110.741 E.01301
G1 X92.838 Y141.259 E.82697
G1 X93.255 Y141.021 E.01301
G1 X93.255 Y110.979 E.81403
G1 X93.671 Y111.218 E.01301
G1 X93.671 Y140.782 E.80108
G1 X94.088 Y140.543 E.01301
G1 X94.088 Y111.457 E.78814
G1 X94.505 Y111.696 E.01301
G1 X94.505 Y140.304 E.7752
G1 X94.921 Y140.065 E.01301
G1 X94.921 Y111.935 E.76225
G1 X95.338 Y112.174 E.01301
G1 X95.338 Y139.826 E.74931
G1 X95.755 Y139.588 E.01301
G1 X95.755 Y112.412 E.73637
G1 X96.171 Y112.651 E.01301
G1 X96.171 Y139.349 E.72342
G1 X96.588 Y139.11 E.01301
G1 X96.588 Y112.89 E.71048
G1 X97.004 Y113.129 E.01301
G1 X97.004 Y138.871 E.69754
G1 X97.421 Y138.632 E.01301
G1 X97.421 Y113.368 E.68459
G1 X97.838 Y113.607 E.01301
G1 X97.838 Y138.393 E.67165
G1 X98.254 Y138.155 E.01301
G1 X98.254 Y113.845 E.65871
G1 X98.671 Y114.084 E.01301
G1 X98.671 Y137.916 E.64576
G1 X99.087 Y137.677 E.01301
G1 X99.087 Y114.323 E.63282
G1 X99.504 Y114.562 E.01301
G1 X99.504 Y137.438 E.61988
G1 X99.921 Y137.199 E.01301
G1 X99.921 Y114.801 E.60693
G1 X100.337 Y115.04 E.01301
G1 X100.337 Y136.96 E.59399
G1 X100.754 Y136.722 E.01301
G1 X100.754 Y115.278 E.58104
G1 X101.17 Y115.517 E.01301
G1 X101.17 Y136.483 E.5681
G1 X101.587 Y136.244 E.01301
G1 X101.587 Y115.756 E.55516
G1 X102.004 Y115.995 E.01301
G1 X102.004 Y136.005 E.54221
G1 X102.42 Y135.766 E.01301
G1 X102.42 Y116.234 E.52927
G1 X102.837 Y116.473 E.01301
G1 X102.837 Y135.527 E.51633
G1 X103.254 Y135.289 E.01301
G1 X103.254 Y116.711 E.50338
G1 X103.67 Y116.95 E.01301
G1 X103.67 Y135.05 E.49044
G1 X104.087 Y134.811 E.01301
G1 X104.087 Y117.189 E.4775
G1 X104.503 Y117.428 E.01301
G1 X104.503 Y134.572 E.46455
G1 X104.92 Y134.333 E.01301
G1 X104.92 Y117.667 E.45161
G1 X105.337 Y117.906 E.01301
G1 X105.337 Y134.094 E.43867
G1 X105.753 Y133.856 E.01301
G1 X105.753 Y118.144 E.42572
G3 X106.17 Y118.483 I-.084 J.529 E.01523
G1 X106.17 Y133.832 E.41593
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X106.17 Y131.832 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 465
M625
; layer num/total_layer_count: 6/14
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M204 S10000
G17
G3 Z1.24 I1.217 J0 P1  F30000
; object ids of layer 6 start: 325,353,381,409,437,465
M624 PwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer6 end: 325,353,381,409,437,465
M625
; OBJECT_ID: 325
; start printing object, unique label id: 325
M624 AQAAAAAAAAA=
G1 X208.756 Y75.215
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X145.833 Y111.288 E1.96534
G1 X145.466 Y111.288 E.00995
G1 X133.139 Y104.171 E.3857
G1 X132.947 Y103.847 E.01019
G1 X132.001 Y56.564 E1.28148
G1 X208.698 Y75.201 E2.13872
; WIPE_START
G1 X206.963 Y76.197 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.812 Y75.059 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X145.939 Y111.689 E1.85116
G1 X145.358 Y111.688 E.01461
G1 X132.847 Y104.465 E.3632
G1 X132.549 Y103.96 E.01475
G1 X131.595 Y56.282 E1.19892
G1 X131.814 Y56.106 E.00708
G1 X209.753 Y75.045 E2.01651
; WIPE_START
M204 S4000
G1 X208.019 Y76.041 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.783 Y75.579 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.474 Y75.27 E.01185
G1 X206.694 Y75.08 E.02175
G1 X207.271 Y75.657 E.0221
G1 X206.895 Y75.872 E.01172
G1 X205.914 Y74.891 E.03761
G1 X205.134 Y74.701 E.02175
G1 X206.52 Y76.087 E.05312
G1 X206.145 Y76.302 E.01172
G1 X204.354 Y74.512 E.06862
G1 X203.574 Y74.322 E.02175
G1 X205.77 Y76.517 E.08413
G1 X205.394 Y76.732 E.01172
G1 X202.794 Y74.133 E.09963
G1 X202.015 Y73.943 E.02175
G1 X205.019 Y76.948 E.11514
G1 X204.644 Y77.163 E.01172
G1 X201.235 Y73.754 E.13064
G1 X200.455 Y73.564 E.02175
G1 X204.269 Y77.378 E.14615
G1 X203.893 Y77.593 E.01172
G1 X199.675 Y73.374 E.16166
G1 X198.895 Y73.185 E.02175
G1 X203.518 Y77.808 E.17716
G1 X203.143 Y78.023 E.01172
G1 X198.115 Y72.995 E.19267
G1 X197.335 Y72.806 E.02175
G1 X202.768 Y78.238 E.20817
G1 X202.392 Y78.453 E.01172
G1 X196.555 Y72.616 E.22368
G1 X195.776 Y72.427 E.02175
G1 X202.017 Y78.669 E.23919
G1 X201.642 Y78.884 E.01172
G1 X194.996 Y72.237 E.25469
G1 X194.216 Y72.048 E.02175
G1 X201.267 Y79.099 E.2702
G1 X200.892 Y79.314 E.01172
G1 X193.436 Y71.858 E.2857
G1 X192.656 Y71.669 E.02175
G1 X200.516 Y79.529 E.30121
G1 X200.141 Y79.744 E.01172
G1 X191.876 Y71.479 E.31671
G1 X191.096 Y71.29 E.02175
G1 X199.766 Y79.959 E.33222
G1 X199.391 Y80.174 E.01172
G1 X190.316 Y71.1 E.34773
G1 X189.537 Y70.911 E.02175
G1 X199.015 Y80.39 E.36323
G1 X198.64 Y80.605 E.01172
G1 X188.757 Y70.721 E.37874
G1 X187.977 Y70.532 E.02175
G1 X198.265 Y80.82 E.39424
G1 X197.89 Y81.035 E.01172
G1 X187.197 Y70.342 E.40975
G1 X186.417 Y70.153 E.02175
G1 X197.514 Y81.25 E.42526
G1 X197.139 Y81.465 E.01172
G1 X185.637 Y69.963 E.44076
G1 X184.857 Y69.774 E.02175
G1 X196.764 Y81.68 E.45627
G1 X196.389 Y81.895 E.01172
G1 X184.078 Y69.584 E.47177
G1 X183.298 Y69.395 E.02175
G1 X196.013 Y82.111 E.48728
G1 X195.638 Y82.326 E.01172
G1 X182.518 Y69.205 E.50278
G1 X181.738 Y69.016 E.02175
G1 X195.263 Y82.541 E.51829
G1 X194.888 Y82.756 E.01172
G1 X180.958 Y68.826 E.5338
G1 X180.178 Y68.637 E.02175
G1 X194.512 Y82.971 E.5493
G1 X194.137 Y83.186 E.01172
G1 X179.398 Y68.447 E.56481
G1 X178.618 Y68.258 E.02175
G1 X193.762 Y83.401 E.58031
G1 X193.387 Y83.616 E.01172
G1 X177.839 Y68.068 E.59582
G1 X177.059 Y67.879 E.02175
G1 X193.011 Y83.831 E.61133
G1 X192.636 Y84.047 E.01172
G1 X176.279 Y67.689 E.62683
G1 X175.499 Y67.5 E.02175
G1 X192.261 Y84.262 E.64234
G1 X191.886 Y84.477 E.01172
G1 X174.719 Y67.31 E.65784
G1 X173.939 Y67.121 E.02175
G1 X191.51 Y84.692 E.67335
G1 X191.135 Y84.907 E.01172
G1 X173.159 Y66.931 E.68886
G1 X172.379 Y66.742 E.02175
G1 X190.76 Y85.122 E.70436
G1 X190.385 Y85.337 E.01172
G1 X171.6 Y66.552 E.71987
G1 X170.82 Y66.363 E.02175
G1 X190.009 Y85.552 E.73537
G1 X189.634 Y85.768 E.01172
G1 X170.04 Y66.173 E.75088
G1 X169.26 Y65.984 E.02175
G1 X189.259 Y85.983 E.76638
G1 X188.884 Y86.198 E.01172
G1 X168.48 Y65.794 E.78189
G1 X167.7 Y65.605 E.02175
G1 X188.509 Y86.413 E.7974
G1 X188.133 Y86.628 E.01172
G1 X166.92 Y65.415 E.8129
G1 X166.14 Y65.226 E.02175
G1 X187.758 Y86.843 E.82841
G1 X187.383 Y87.058 E.01172
G1 X165.361 Y65.036 E.84391
G1 X164.581 Y64.847 E.02175
G1 X187.008 Y87.273 E.85942
G1 X186.632 Y87.489 E.01172
G1 X163.801 Y64.657 E.87493
G1 X163.021 Y64.468 E.02175
G1 X186.257 Y87.704 E.89043
G1 X185.882 Y87.919 E.01172
G1 X162.241 Y64.278 E.90594
G1 X161.461 Y64.089 E.02175
G1 X185.507 Y88.134 E.92144
G1 X185.131 Y88.349 E.01172
G1 X160.681 Y63.899 E.93695
G1 X159.901 Y63.71 E.02175
G1 X184.756 Y88.564 E.95245
G1 X184.381 Y88.779 E.01172
G1 X159.122 Y63.52 E.96796
G1 X158.342 Y63.331 E.02175
G1 X184.006 Y88.994 E.98347
G1 X183.63 Y89.21 E.01172
G1 X157.562 Y63.141 E.99897
G1 X156.782 Y62.951 E.02175
G1 X183.255 Y89.425 E1.01448
G1 X182.88 Y89.64 E.01172
G1 X156.002 Y62.762 E1.02998
G1 X155.222 Y62.572 E.02175
G1 X182.505 Y89.855 E1.04549
G1 X182.129 Y90.07 E.01172
G1 X154.442 Y62.383 E1.061
G1 X153.662 Y62.193 E.02175
G1 X181.754 Y90.285 E1.0765
G1 X181.379 Y90.5 E.01172
G1 X152.883 Y62.004 E1.09201
G1 X152.103 Y61.814 E.02175
G1 X181.004 Y90.715 E1.10751
G1 X180.628 Y90.93 E.01172
G1 X151.323 Y61.625 E1.12302
G1 X150.543 Y61.435 E.02175
G1 X180.253 Y91.146 E1.13852
G1 X179.878 Y91.361 E.01172
G1 X149.763 Y61.246 E1.15403
G1 X148.983 Y61.056 E.02175
G1 X179.503 Y91.576 E1.16954
G1 X179.127 Y91.791 E.01172
G1 X148.203 Y60.867 E1.18504
G1 X147.424 Y60.677 E.02175
G1 X178.752 Y92.006 E1.20055
G1 X178.377 Y92.221 E.01172
G1 X146.644 Y60.488 E1.21605
G1 X145.864 Y60.298 E.02175
G1 X178.002 Y92.436 E1.23156
G1 X177.626 Y92.651 E.01172
G1 X145.084 Y60.109 E1.24707
G1 X144.304 Y59.919 E.02175
G1 X177.251 Y92.867 E1.26257
G1 X176.876 Y93.082 E.01172
G1 X143.524 Y59.73 E1.27808
G1 X142.744 Y59.54 E.02175
G1 X176.501 Y93.297 E1.29358
G1 X176.126 Y93.512 E.01172
G1 X141.964 Y59.351 E1.30909
G1 X141.185 Y59.161 E.02175
G1 X175.75 Y93.727 E1.32459
G1 X175.375 Y93.942 E.01172
G1 X140.405 Y58.972 E1.3401
G1 X139.625 Y58.782 E.02175
G1 X175 Y94.157 E1.35561
G1 X174.625 Y94.372 E.01172
G1 X138.845 Y58.593 E1.37111
M73 P43 R40
G1 X138.065 Y58.403 E.02175
G1 X174.249 Y94.588 E1.38662
G1 X173.874 Y94.803 E.01172
G1 X137.285 Y58.214 E1.40212
G1 X136.505 Y58.024 E.02175
G1 X173.499 Y95.018 E1.41763
G1 X173.124 Y95.233 E.01172
G1 X135.725 Y57.835 E1.43314
G1 X134.946 Y57.645 E.02175
G1 X172.748 Y95.448 E1.44864
G1 X172.373 Y95.663 E.01172
G1 X134.166 Y57.456 E1.46415
M73 P43 R39
G1 X133.386 Y57.266 E.02175
G1 X171.998 Y95.878 E1.47965
G1 X171.623 Y96.093 E.01172
G1 X132.606 Y57.077 E1.49516
G1 X132.366 Y57.018 E.00669
G1 X132.374 Y57.436 E.01131
G1 X171.247 Y96.309 E1.48965
G1 X170.872 Y96.524 E.01172
G1 X132.386 Y58.038 E1.47481
G1 X132.399 Y58.64 E.01633
G1 X170.497 Y96.739 E1.45997
G1 X170.122 Y96.954 E.01172
G1 X132.411 Y59.243 E1.44513
G1 X132.423 Y59.845 E.01633
G1 X169.746 Y97.169 E1.43028
G1 X169.371 Y97.384 E.01172
G1 X132.435 Y60.448 E1.41544
G1 X132.447 Y61.05 E.01633
G1 X168.996 Y97.599 E1.4006
G1 X168.621 Y97.814 E.01172
G1 X132.459 Y61.653 E1.38576
G1 X132.471 Y62.255 E.01633
G1 X168.245 Y98.029 E1.37092
G1 X167.87 Y98.245 E.01172
G1 X132.483 Y62.857 E1.35608
G1 X132.495 Y63.46 E.01633
G1 X167.495 Y98.46 E1.34123
G1 X167.12 Y98.675 E.01172
G1 X132.507 Y64.062 E1.32639
G1 X132.519 Y64.665 E.01633
G1 X166.744 Y98.89 E1.31155
G1 X166.369 Y99.105 E.01172
G1 X132.531 Y65.267 E1.29671
G1 X132.543 Y65.869 E.01633
G1 X165.994 Y99.32 E1.28187
G1 X165.619 Y99.535 E.01172
G1 X132.555 Y66.472 E1.26703
G1 X132.567 Y67.074 E.01633
G1 X165.243 Y99.75 E1.25219
G1 X164.868 Y99.966 E.01172
G1 X132.579 Y67.677 E1.23734
G1 X132.591 Y68.279 E.01633
G1 X164.493 Y100.181 E1.2225
G1 X164.118 Y100.396 E.01172
G1 X132.603 Y68.882 E1.20766
G1 X132.616 Y69.484 E.01633
G1 X163.743 Y100.611 E1.19282
G1 X163.367 Y100.826 E.01172
G1 X132.628 Y70.086 E1.17798
G1 X132.64 Y70.689 E.01633
G1 X162.992 Y101.041 E1.16314
G1 X162.617 Y101.256 E.01172
G1 X132.652 Y71.291 E1.14829
G1 X132.664 Y71.894 E.01633
G1 X162.242 Y101.471 E1.13345
G1 X161.866 Y101.687 E.01172
G1 X132.676 Y72.496 E1.11861
G1 X132.688 Y73.098 E.01633
G1 X161.491 Y101.902 E1.10377
G1 X161.116 Y102.117 E.01172
G1 X132.7 Y73.701 E1.08893
G1 X132.712 Y74.303 E.01633
G1 X160.741 Y102.332 E1.07409
G1 X160.365 Y102.547 E.01172
G1 X132.724 Y74.906 E1.05924
G1 X132.736 Y75.508 E.01633
G1 X159.99 Y102.762 E1.0444
G1 X159.615 Y102.977 E.01172
G1 X132.748 Y76.111 E1.02956
G1 X132.76 Y76.713 E.01633
G1 X159.24 Y103.192 E1.01472
G1 X158.864 Y103.408 E.01172
G1 X132.772 Y77.315 E.99988
G1 X132.784 Y77.918 E.01633
G1 X158.489 Y103.623 E.98504
G1 X158.114 Y103.838 E.01172
G1 X132.796 Y78.52 E.97019
G1 X132.808 Y79.123 E.01633
G1 X157.739 Y104.053 E.95535
G1 X157.363 Y104.268 E.01172
G1 X132.82 Y79.725 E.94051
G1 X132.832 Y80.327 E.01633
G1 X156.988 Y104.483 E.92567
G1 X156.613 Y104.698 E.01172
G1 X132.845 Y80.93 E.91083
G1 X132.857 Y81.532 E.01633
G1 X156.238 Y104.913 E.89599
G1 X155.862 Y105.128 E.01172
G1 X132.869 Y82.135 E.88115
G1 X132.881 Y82.737 E.01633
G1 X155.487 Y105.344 E.8663
G1 X155.112 Y105.559 E.01172
G1 X132.893 Y83.34 E.85146
G1 X132.905 Y83.942 E.01633
G1 X154.737 Y105.774 E.83662
G1 X154.361 Y105.989 E.01172
G1 X132.917 Y84.544 E.82178
G1 X132.929 Y85.147 E.01633
G1 X153.986 Y106.204 E.80694
G1 X153.611 Y106.419 E.01172
G1 X132.941 Y85.749 E.7921
G1 X132.953 Y86.352 E.01633
G1 X153.236 Y106.634 E.77725
G1 X152.86 Y106.849 E.01172
G1 X132.965 Y86.954 E.76241
G1 X132.977 Y87.556 E.01633
G1 X152.485 Y107.065 E.74757
G1 X152.11 Y107.28 E.01172
G1 X132.989 Y88.159 E.73273
G1 X133.001 Y88.761 E.01633
G1 X151.735 Y107.495 E.71789
G1 X151.36 Y107.71 E.01172
G1 X133.013 Y89.364 E.70305
G1 X133.025 Y89.966 E.01633
G1 X150.984 Y107.925 E.6882
G1 X150.609 Y108.14 E.01172
G1 X133.037 Y90.569 E.67336
G1 X133.049 Y91.171 E.01633
G1 X150.234 Y108.355 E.65852
G1 X149.859 Y108.57 E.01172
G1 X133.062 Y91.773 E.64368
G1 X133.074 Y92.376 E.01633
G1 X149.483 Y108.786 E.62884
G1 X149.108 Y109.001 E.01172
G1 X133.086 Y92.978 E.614
G1 X133.098 Y93.581 E.01633
G1 X148.733 Y109.216 E.59915
G1 X148.358 Y109.431 E.01172
G1 X133.11 Y94.183 E.58431
G1 X133.122 Y94.785 E.01633
G1 X147.982 Y109.646 E.56947
G1 X147.607 Y109.861 E.01172
G1 X133.134 Y95.388 E.55463
G1 X133.146 Y95.99 E.01633
G1 X147.232 Y110.076 E.53979
G1 X146.857 Y110.291 E.01172
G1 X133.158 Y96.593 E.52495
G1 X133.17 Y97.195 E.01633
G1 X146.481 Y110.506 E.51011
G1 X146.106 Y110.722 E.01172
G1 X133.182 Y97.798 E.49526
G1 X133.194 Y98.4 E.01633
G1 X145.727 Y110.932 E.48025
G1 X145.561 Y110.932 E.00448
G1 X144.555 Y110.351 E.03149
G1 X133.206 Y99.002 E.43489
G1 X133.218 Y99.605 E.01633
G1 X143.158 Y109.545 E.3809
G1 X141.761 Y108.738 E.04371
G1 X133.23 Y100.207 E.32691
G1 X133.242 Y100.81 E.01633
G1 X140.364 Y107.932 E.27292
G1 X138.967 Y107.125 E.0437
G1 X133.254 Y101.412 E.21893
G1 X133.266 Y102.014 E.01633
G1 X137.571 Y106.319 E.16494
G1 X136.174 Y105.512 E.04371
G1 X133.278 Y102.617 E.11095
G1 X133.291 Y103.219 E.01633
G1 X135.288 Y105.217 E.07655
; OBJECT_ID: 353
; WIPE_START
G1 X133.874 Y103.803 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 325
M625
; start printing object, unique label id: 353
M624 AgAAAAAAAAA=
M204 S10000
G1 X139.743 Y108.681 Z1.4 F30000
G1 X215.595 Y171.729 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X149.657 Y133.927 E2.05953
G1 X149.474 Y133.612 E.00986
G1 X149.474 Y118.388 E.41253
G1 X149.657 Y118.073 E.00986
G1 X215.595 Y80.271 E2.05953
G1 X215.595 Y171.669 E2.4766
M204 S10000
G1 X215.996 Y172.261 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X215.858 Y172.341 E.004
G1 X149.364 Y134.221 E1.92699
G1 X149.073 Y133.72 E.01457
G1 X149.073 Y118.28 E.38817
G1 X149.364 Y117.779 E.01457
G1 X215.858 Y79.659 E1.92699
G1 X215.996 Y79.739 E.004
G1 X215.996 Y172.201 E2.32465
; WIPE_START
M204 S4000
G1 X215.858 Y172.341 E-.07455
G1 X214.293 Y171.444 E-.68545
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X215.239 Y171.33 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X215.239 Y80.885 E2.45079
G1 X214.823 Y81.124 E.01301
G1 X214.823 Y170.876 E2.43201
G1 X214.406 Y170.637 E.01301
G1 X214.406 Y81.363 E2.41906
G1 X213.989 Y81.602 E.01301
G1 X213.989 Y170.398 E2.40612
G1 X213.573 Y170.159 E.01301
G1 X213.573 Y81.841 E2.39318
G1 X213.156 Y82.079 E.01301
G1 X213.156 Y169.92 E2.38023
G1 X212.74 Y169.682 E.01301
G1 X212.74 Y82.318 E2.36729
G1 X212.323 Y82.557 E.01301
G1 X212.323 Y169.443 E2.35435
G1 X211.906 Y169.204 E.01301
G1 X211.906 Y82.796 E2.3414
G1 X211.49 Y83.035 E.01301
G1 X211.49 Y168.965 E2.32846
G1 X211.073 Y168.726 E.01301
G1 X211.073 Y83.274 E2.31552
G1 X210.656 Y83.513 E.01301
G1 X210.656 Y168.487 E2.30257
G1 X210.24 Y168.249 E.01301
G1 X210.24 Y83.751 E2.28963
G1 X209.823 Y83.99 E.01301
G1 X209.823 Y168.01 E2.27668
G1 X209.407 Y167.771 E.01301
G1 X209.407 Y84.229 E2.26374
G1 X208.99 Y84.468 E.01301
G1 X208.99 Y167.532 E2.2508
G1 X208.573 Y167.293 E.01301
G1 X208.573 Y84.707 E2.23785
G1 X208.157 Y84.946 E.01301
G1 X208.157 Y167.054 E2.22491
G1 X207.74 Y166.816 E.01301
G1 X207.74 Y85.184 E2.21197
G1 X207.324 Y85.423 E.01301
G1 X207.324 Y166.577 E2.19902
G1 X206.907 Y166.338 E.01301
G1 X206.907 Y85.662 E2.18608
G1 X206.49 Y85.901 E.01301
G1 X206.49 Y166.099 E2.17314
G1 X206.074 Y165.86 E.01301
G1 X206.074 Y86.14 E2.16019
G1 X205.657 Y86.379 E.01301
G1 X205.657 Y165.621 E2.14725
G1 X205.241 Y165.383 E.01301
G1 X205.241 Y86.617 E2.13431
G1 X204.824 Y86.856 E.01301
G1 X204.824 Y165.144 E2.12136
G1 X204.407 Y164.905 E.01301
G1 X204.407 Y87.095 E2.10842
G1 X203.991 Y87.334 E.01301
G1 X203.991 Y164.666 E2.09548
G1 X203.574 Y164.427 E.01301
G1 X203.574 Y87.573 E2.08253
G1 X203.157 Y87.812 E.01301
G1 X203.157 Y164.188 E2.06959
G1 X202.741 Y163.95 E.01301
G1 X202.741 Y88.05 E2.05664
G1 X202.324 Y88.289 E.01301
G1 X202.324 Y163.711 E2.0437
G1 X201.908 Y163.472 E.01301
G1 X201.908 Y88.528 E2.03076
G1 X201.491 Y88.767 E.01301
G1 X201.491 Y163.233 E2.01781
G1 X201.074 Y162.994 E.01301
G1 X201.074 Y89.006 E2.00487
G1 X200.658 Y89.245 E.01301
G1 X200.658 Y162.755 E1.99193
G1 X200.241 Y162.517 E.01301
G1 X200.241 Y89.483 E1.97898
G1 X199.825 Y89.722 E.01301
G1 X199.825 Y162.278 E1.96604
G1 X199.408 Y162.039 E.01301
G1 X199.408 Y89.961 E1.9531
G1 X198.991 Y90.2 E.01301
G1 X198.991 Y161.8 E1.94015
G1 X198.575 Y161.561 E.01301
G1 X198.575 Y90.439 E1.92721
M73 P44 R39
G1 X198.158 Y90.678 E.01301
G1 X198.158 Y161.322 E1.91427
G1 X197.742 Y161.084 E.01301
G1 X197.742 Y90.916 E1.90132
G1 X197.325 Y91.155 E.01301
G1 X197.325 Y160.845 E1.88838
G1 X196.908 Y160.606 E.01301
G1 X196.908 Y91.394 E1.87543
G1 X196.492 Y91.633 E.01301
G1 X196.492 Y160.367 E1.86249
G1 X196.075 Y160.128 E.01301
G1 X196.075 Y91.872 E1.84955
G1 X195.659 Y92.111 E.01301
G1 X195.659 Y159.889 E1.8366
G1 X195.242 Y159.651 E.01301
G1 X195.242 Y92.349 E1.82366
G1 X194.825 Y92.588 E.01301
G1 X194.825 Y159.412 E1.81072
G1 X194.409 Y159.173 E.01301
G1 X194.409 Y92.827 E1.79777
G1 X193.992 Y93.066 E.01301
G1 X193.992 Y158.934 E1.78483
G1 X193.575 Y158.695 E.01301
G1 X193.575 Y93.305 E1.77189
G1 X193.159 Y93.544 E.01301
G1 X193.159 Y158.456 E1.75894
G1 X192.742 Y158.217 E.01301
G1 X192.742 Y93.782 E1.746
G1 X192.326 Y94.021 E.01301
G1 X192.326 Y157.979 E1.73306
G1 X191.909 Y157.74 E.01301
G1 X191.909 Y94.26 E1.72011
G1 X191.492 Y94.499 E.01301
G1 X191.492 Y157.501 E1.70717
G1 X191.076 Y157.262 E.01301
G1 X191.076 Y94.738 E1.69423
G1 X190.659 Y94.977 E.01301
G1 X190.659 Y157.023 E1.68128
G1 X190.243 Y156.784 E.01301
G1 X190.243 Y95.216 E1.66834
G1 X189.826 Y95.454 E.01301
G1 X189.826 Y156.546 E1.65539
G1 X189.409 Y156.307 E.01301
G1 X189.409 Y95.693 E1.64245
G1 X188.993 Y95.932 E.01301
G1 X188.993 Y156.068 E1.62951
G1 X188.576 Y155.829 E.01301
G1 X188.576 Y96.171 E1.61656
G1 X188.16 Y96.41 E.01301
G1 X188.16 Y155.59 E1.60362
G1 X187.743 Y155.351 E.01301
G1 X187.743 Y96.649 E1.59068
G1 X187.326 Y96.887 E.01301
G1 X187.326 Y155.113 E1.57773
G1 X186.91 Y154.874 E.01301
G1 X186.91 Y97.126 E1.56479
G1 X186.493 Y97.365 E.01301
G1 X186.493 Y154.635 E1.55185
G1 X186.076 Y154.396 E.01301
G1 X186.076 Y97.604 E1.5389
G1 X185.66 Y97.843 E.01301
G1 X185.66 Y154.157 E1.52596
G1 X185.243 Y153.918 E.01301
G1 X185.243 Y98.082 E1.51302
G1 X184.827 Y98.32 E.01301
G1 X184.827 Y153.68 E1.50007
G1 X184.41 Y153.441 E.01301
G1 X184.41 Y98.559 E1.48713
G1 X183.993 Y98.798 E.01301
G1 X183.993 Y153.202 E1.47418
G1 X183.577 Y152.963 E.01301
G1 X183.577 Y99.037 E1.46124
G1 X183.16 Y99.276 E.01301
G1 X183.16 Y152.724 E1.4483
G1 X182.744 Y152.485 E.01301
G1 X182.744 Y99.515 E1.43535
G1 X182.327 Y99.753 E.01301
G1 X182.327 Y152.247 E1.42241
G1 X181.91 Y152.008 E.01301
G1 X181.91 Y99.992 E1.40947
G1 X181.494 Y100.231 E.01301
G1 X181.494 Y151.769 E1.39652
G1 X181.077 Y151.53 E.01301
G1 X181.077 Y100.47 E1.38358
G1 X180.661 Y100.709 E.01301
G1 X180.661 Y151.291 E1.37064
G1 X180.244 Y151.052 E.01301
G1 X180.244 Y100.948 E1.35769
G1 X179.827 Y101.186 E.01301
G1 X179.827 Y150.814 E1.34475
G1 X179.411 Y150.575 E.01301
G1 X179.411 Y101.425 E1.33181
M73 P44 R38
G1 X178.994 Y101.664 E.01301
G1 X178.994 Y150.336 E1.31886
G1 X178.577 Y150.097 E.01301
G1 X178.577 Y101.903 E1.30592
G1 X178.161 Y102.142 E.01301
G1 X178.161 Y149.858 E1.29298
G1 X177.744 Y149.619 E.01301
G1 X177.744 Y102.381 E1.28003
G1 X177.328 Y102.619 E.01301
G1 X177.328 Y149.381 E1.26709
G1 X176.911 Y149.142 E.01301
G1 X176.911 Y102.858 E1.25414
G1 X176.494 Y103.097 E.01301
G1 X176.494 Y148.903 E1.2412
G1 X176.078 Y148.664 E.01301
G1 X176.078 Y103.336 E1.22826
G1 X175.661 Y103.575 E.01301
G1 X175.661 Y148.425 E1.21531
G1 X175.245 Y148.186 E.01301
G1 X175.245 Y103.814 E1.20237
G1 X174.828 Y104.052 E.01301
G1 X174.828 Y147.948 E1.18943
G1 X174.411 Y147.709 E.01301
G1 X174.411 Y104.291 E1.17648
G1 X173.995 Y104.53 E.01301
G1 X173.995 Y147.47 E1.16354
G1 X173.578 Y147.231 E.01301
G1 X173.578 Y104.769 E1.1506
G1 X173.162 Y105.008 E.01301
G1 X173.162 Y146.992 E1.13765
G1 X172.745 Y146.753 E.01301
G1 X172.745 Y105.247 E1.12471
G1 X172.328 Y105.485 E.01301
G1 X172.328 Y146.515 E1.11177
G1 X171.912 Y146.276 E.01301
G1 X171.912 Y105.724 E1.09882
G1 X171.495 Y105.963 E.01301
G1 X171.495 Y146.037 E1.08588
G1 X171.079 Y145.798 E.01301
G1 X171.079 Y106.202 E1.07294
G1 X170.662 Y106.441 E.01301
G1 X170.662 Y145.559 E1.05999
G1 X170.245 Y145.32 E.01301
G1 X170.245 Y106.68 E1.04705
G1 X169.829 Y106.919 E.01301
G1 X169.829 Y145.081 E1.0341
G1 X169.412 Y144.843 E.01301
G1 X169.412 Y107.157 E1.02116
G1 X168.995 Y107.396 E.01301
G1 X168.995 Y144.604 E1.00822
G1 X168.579 Y144.365 E.01301
G1 X168.579 Y107.635 E.99527
G1 X168.162 Y107.874 E.01301
G1 X168.162 Y144.126 E.98233
G1 X167.746 Y143.887 E.01301
G1 X167.746 Y108.113 E.96939
G1 X167.329 Y108.352 E.01301
G1 X167.329 Y143.648 E.95644
G1 X166.912 Y143.41 E.01301
G1 X166.912 Y108.59 E.9435
G1 X166.496 Y108.829 E.01301
G1 X166.496 Y143.171 E.93056
G1 X166.079 Y142.932 E.01301
G1 X166.079 Y109.068 E.91761
G1 X165.663 Y109.307 E.01301
G1 X165.663 Y142.693 E.90467
G1 X165.246 Y142.454 E.01301
G1 X165.246 Y109.546 E.89173
G1 X164.829 Y109.785 E.01301
G1 X164.829 Y142.215 E.87878
G1 X164.413 Y141.977 E.01301
G1 X164.413 Y110.023 E.86584
G1 X163.996 Y110.262 E.01301
G1 X163.996 Y141.738 E.85289
G1 X163.58 Y141.499 E.01301
G1 X163.58 Y110.501 E.83995
G1 X163.163 Y110.74 E.01301
G1 X163.163 Y141.26 E.82701
G1 X162.746 Y141.021 E.01301
G1 X162.746 Y110.979 E.81406
G1 X162.33 Y111.218 E.01301
G1 X162.33 Y140.782 E.80112
G1 X161.913 Y140.544 E.01301
G1 X161.913 Y111.456 E.78818
G1 X161.496 Y111.695 E.01301
G1 X161.496 Y140.305 E.77523
G1 X161.08 Y140.066 E.01301
G1 X161.08 Y111.934 E.76229
G1 X160.663 Y112.173 E.01301
G1 X160.663 Y139.827 E.74935
G1 X160.247 Y139.588 E.01301
G1 X160.247 Y112.412 E.7364
G1 X159.83 Y112.651 E.01301
G1 X159.83 Y139.349 E.72346
G1 X159.413 Y139.111 E.01301
G1 X159.413 Y112.889 E.71052
G1 X158.997 Y113.128 E.01301
G1 X158.997 Y138.872 E.69757
G1 X158.58 Y138.633 E.01301
G1 X158.58 Y113.367 E.68463
G1 X158.164 Y113.606 E.01301
G1 X158.164 Y138.394 E.67169
G1 X157.747 Y138.155 E.01301
G1 X157.747 Y113.845 E.65874
G1 X157.33 Y114.084 E.01301
G1 X157.33 Y137.916 E.6458
G1 X156.914 Y137.678 E.01301
G1 X156.914 Y114.322 E.63285
G1 X156.497 Y114.561 E.01301
G1 X156.497 Y137.439 E.61991
G1 X156.081 Y137.2 E.01301
G1 X156.081 Y114.8 E.60697
G1 X155.664 Y115.039 E.01301
G1 X155.664 Y136.961 E.59402
G1 X155.247 Y136.722 E.01301
G1 X155.247 Y115.278 E.58108
G1 X154.831 Y115.517 E.01301
G1 X154.831 Y136.483 E.56814
G1 X154.414 Y136.245 E.01301
G1 X154.414 Y115.755 E.55519
G1 X153.998 Y115.994 E.01301
G1 X153.998 Y136.006 E.54225
G1 X153.581 Y135.767 E.01301
G1 X153.581 Y116.233 E.52931
G1 X153.164 Y116.472 E.01301
G1 X153.164 Y135.528 E.51636
G1 X152.748 Y135.289 E.01301
G1 X152.748 Y116.711 E.50342
G1 X152.331 Y116.95 E.01301
G1 X152.331 Y135.05 E.49048
G1 X151.914 Y134.812 E.01301
G1 X151.914 Y117.188 E.47753
G1 X151.498 Y117.427 E.01301
G1 X151.498 Y134.573 E.46459
G1 X151.081 Y134.334 E.01301
G1 X151.081 Y117.666 E.45164
G1 X150.665 Y117.905 E.01301
G1 X150.665 Y134.095 E.4387
G1 X150.248 Y133.856 E.01301
G1 X150.248 Y118.144 E.42576
G2 X149.831 Y118.481 I.082 J.528 E.01521
G1 X149.831 Y133.833 E.416
; OBJECT_ID: 381
; WIPE_START
G1 X149.831 Y131.833 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 353
M625
; start printing object, unique label id: 381
M624 BAAAAAAAAAA=
M204 S10000
G1 X155.9 Y136.462 Z1.4 F30000
G1 X208.756 Y176.785 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X132.001 Y195.436 E2.14036
G1 X132.947 Y148.153 E1.28149
G1 X133.139 Y147.829 E.01019
G1 X145.466 Y140.712 E.3857
G1 X145.833 Y140.712 E.00995
G1 X208.704 Y176.755 E1.96372
; WIPE_START
G1 X206.761 Y177.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.813 Y176.929 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X131.814 Y195.894 E2.01813
G1 X131.595 Y195.718 E.00708
G1 X132.549 Y148.04 E1.19892
G1 X132.847 Y147.535 E.01475
G1 X145.358 Y140.312 E.3632
G1 X145.939 Y140.311 E.01461
G1 X209.761 Y176.899 E1.84954
; WIPE_START
M204 S4000
M73 P45 R38
G1 X207.818 Y177.373 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.22 Y176.985 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.646 Y176.558 E.01634
G1 X207.271 Y176.343 E.01172
G1 X206.694 Y176.92 E.0221
G1 X205.914 Y177.109 E.02175
G1 X206.896 Y176.128 E.03761
G1 X206.52 Y175.913 E.01172
G1 X205.134 Y177.299 E.05312
G1 X204.354 Y177.488 E.02175
G1 X206.145 Y175.698 E.06862
G1 X205.77 Y175.483 E.01172
G1 X203.575 Y177.678 E.08413
G1 X202.795 Y177.868 E.02175
G1 X205.395 Y175.268 E.09963
G1 X205.019 Y175.052 E.01172
G1 X202.015 Y178.057 E.11514
G1 X201.235 Y178.247 E.02175
G1 X204.644 Y174.837 E.13064
G1 X204.269 Y174.622 E.01172
G1 X200.455 Y178.436 E.14615
G1 X199.675 Y178.626 E.02175
G1 X203.894 Y174.407 E.16166
G1 X203.518 Y174.192 E.01172
G1 X198.895 Y178.815 E.17716
G1 X198.115 Y179.005 E.02175
G1 X203.143 Y173.977 E.19267
G1 X202.768 Y173.762 E.01172
G1 X197.336 Y179.194 E.20817
G1 X196.556 Y179.384 E.02175
G1 X202.393 Y173.547 E.22368
G1 X202.018 Y173.331 E.01172
G1 X195.776 Y179.573 E.23919
G1 X194.996 Y179.763 E.02175
G1 X201.642 Y173.116 E.25469
G1 X201.267 Y172.901 E.01172
G1 X194.216 Y179.952 E.2702
G1 X193.436 Y180.142 E.02175
G1 X200.892 Y172.686 E.2857
G1 X200.517 Y172.471 E.01172
G1 X192.656 Y180.331 E.30121
G1 X191.877 Y180.521 E.02175
G1 X200.141 Y172.256 E.31671
G1 X199.766 Y172.041 E.01172
G1 X191.097 Y180.71 E.33222
G1 X190.317 Y180.9 E.02175
G1 X199.391 Y171.826 E.34773
G1 X199.016 Y171.61 E.01172
G1 X189.537 Y181.089 E.36323
G1 X188.757 Y181.279 E.02175
G1 X198.64 Y171.395 E.37874
G1 X198.265 Y171.18 E.01172
G1 X187.977 Y181.468 E.39424
G1 X187.197 Y181.658 E.02175
G1 X197.89 Y170.965 E.40975
G1 X197.515 Y170.75 E.01172
G1 X186.417 Y181.847 E.42526
G1 X185.638 Y182.037 E.02175
G1 X197.139 Y170.535 E.44076
G1 X196.764 Y170.32 E.01172
G1 X184.858 Y182.226 E.45627
G1 X184.078 Y182.416 E.02175
G1 X196.389 Y170.105 E.47177
G1 X196.014 Y169.89 E.01172
G1 X183.298 Y182.605 E.48728
G1 X182.518 Y182.795 E.02175
G1 X195.638 Y169.674 E.50279
G1 X195.263 Y169.459 E.01172
G1 X181.738 Y182.984 E.51829
G1 X180.958 Y183.174 E.02175
G1 X194.888 Y169.244 E.5338
G1 X194.513 Y169.029 E.01172
G1 X180.178 Y183.363 E.5493
G1 X179.399 Y183.553 E.02175
G1 X194.137 Y168.814 E.56481
G1 X193.762 Y168.599 E.01172
G1 X178.619 Y183.742 E.58031
G1 X177.839 Y183.932 E.02175
G1 X193.387 Y168.384 E.59582
G1 X193.012 Y168.169 E.01172
G1 X177.059 Y184.121 E.61133
G1 X176.279 Y184.311 E.02175
G1 X192.636 Y167.953 E.62683
G1 X192.261 Y167.738 E.01172
G1 X175.499 Y184.5 E.64234
G1 X174.719 Y184.69 E.02175
G1 X191.886 Y167.523 E.65784
G1 X191.511 Y167.308 E.01172
G1 X173.939 Y184.879 E.67335
G1 X173.16 Y185.069 E.02175
G1 X191.135 Y167.093 E.68886
G1 X190.76 Y166.878 E.01172
G1 X172.38 Y185.258 E.70436
G1 X171.6 Y185.448 E.02175
G1 X190.385 Y166.663 E.71987
G1 X190.01 Y166.448 E.01172
G1 X170.82 Y185.637 E.73537
G1 X170.04 Y185.827 E.02175
G1 X189.635 Y166.232 E.75088
G1 X189.259 Y166.017 E.01172
G1 X169.26 Y186.016 E.76638
G1 X168.48 Y186.206 E.02175
G1 X188.884 Y165.802 E.78189
G1 X188.509 Y165.587 E.01172
G1 X167.7 Y186.395 E.7974
G1 X166.921 Y186.585 E.02175
G1 X188.134 Y165.372 E.8129
G1 X187.758 Y165.157 E.01172
G1 X166.141 Y186.774 E.82841
G1 X165.361 Y186.964 E.02175
G1 X187.383 Y164.942 E.84391
G1 X187.008 Y164.727 E.01172
G1 X164.581 Y187.153 E.85942
G1 X163.801 Y187.343 E.02175
G1 X186.633 Y164.511 E.87493
G1 X186.257 Y164.296 E.01172
G1 X163.021 Y187.532 E.89043
G1 X162.241 Y187.722 E.02175
G1 X185.882 Y164.081 E.90594
G1 X185.507 Y163.866 E.01172
G1 X161.461 Y187.911 E.92144
G1 X160.682 Y188.101 E.02175
G1 X185.132 Y163.651 E.93695
G1 X184.756 Y163.436 E.01172
G1 X159.902 Y188.291 E.95246
G1 X159.122 Y188.48 E.02175
G1 X184.381 Y163.221 E.96796
G1 X184.006 Y163.006 E.01172
G1 X158.342 Y188.67 E.98347
G1 X157.562 Y188.859 E.02175
G1 X183.631 Y162.791 E.99897
G1 X183.255 Y162.575 E.01172
G1 X156.782 Y189.049 E1.01448
G1 X156.002 Y189.238 E.02175
G1 X182.88 Y162.36 E1.02998
G1 X182.505 Y162.145 E.01172
G1 X155.222 Y189.428 E1.04549
G1 X154.443 Y189.617 E.02175
G1 X182.13 Y161.93 E1.061
G1 X181.754 Y161.715 E.01172
G1 X153.663 Y189.807 E1.0765
G1 X152.883 Y189.996 E.02175
G1 X181.379 Y161.5 E1.09201
G1 X181.004 Y161.285 E.01172
G1 X152.103 Y190.186 E1.10751
G1 X151.323 Y190.375 E.02175
G1 X180.629 Y161.07 E1.12302
G1 X180.253 Y160.854 E.01172
G1 X150.543 Y190.565 E1.13853
G1 X149.763 Y190.754 E.02175
G1 X179.878 Y160.639 E1.15403
G1 X179.503 Y160.424 E.01172
G1 X148.984 Y190.944 E1.16954
G1 X148.204 Y191.133 E.02175
G1 X179.128 Y160.209 E1.18504
G1 X178.752 Y159.994 E.01172
G1 X147.424 Y191.323 E1.20055
G1 X146.644 Y191.512 E.02175
G1 X178.377 Y159.779 E1.21605
G1 X178.002 Y159.564 E.01172
G1 X145.864 Y191.702 E1.23156
G1 X145.084 Y191.891 E.02175
G1 X177.627 Y159.349 E1.24707
G1 X177.252 Y159.133 E.01172
G1 X144.304 Y192.081 E1.26257
G1 X143.524 Y192.27 E.02175
G1 X176.876 Y158.918 E1.27808
G1 X176.501 Y158.703 E.01172
G1 X142.745 Y192.46 E1.29358
G1 X141.965 Y192.649 E.02175
G1 X176.126 Y158.488 E1.30909
G1 X175.751 Y158.273 E.01172
G1 X141.185 Y192.839 E1.3246
G1 X140.405 Y193.028 E.02175
G1 X175.375 Y158.058 E1.3401
G1 X175 Y157.843 E.01172
G1 X139.625 Y193.218 E1.35561
G1 X138.845 Y193.407 E.02175
G1 X174.625 Y157.628 E1.37111
G1 X174.25 Y157.412 E.01172
G1 X138.065 Y193.597 E1.38662
G1 X137.285 Y193.786 E.02175
G1 X173.874 Y157.197 E1.40212
G1 X173.499 Y156.982 E.01172
G1 X136.506 Y193.976 E1.41763
G1 X135.726 Y194.165 E.02175
G1 X173.124 Y156.767 E1.43314
G1 X172.749 Y156.552 E.01172
G1 X134.946 Y194.355 E1.44864
G1 X134.166 Y194.544 E.02175
G1 X172.373 Y156.337 E1.46415
G1 X171.998 Y156.122 E.01172
G1 X133.386 Y194.734 E1.47965
G1 X132.606 Y194.923 E.02175
G1 X171.623 Y155.907 E1.49516
G1 X171.248 Y155.692 E.01172
G1 X132.374 Y194.565 E1.48966
G1 X132.386 Y193.962 E.01633
G1 X170.872 Y155.476 E1.47482
G1 X170.497 Y155.261 E.01172
G1 X132.398 Y193.36 E1.45998
G1 X132.41 Y192.758 E.01633
G1 X170.122 Y155.046 E1.44514
G1 X169.747 Y154.831 E.01172
G1 X132.423 Y192.155 E1.4303
G1 X132.435 Y191.553 E.01633
G1 X169.371 Y154.616 E1.41546
G1 X168.996 Y154.401 E.01172
G1 X132.447 Y190.95 E1.40062
G1 X132.459 Y190.348 E.01633
G1 X168.621 Y154.186 E1.38577
G1 X168.246 Y153.971 E.01172
G1 X132.471 Y189.745 E1.37093
G1 X132.483 Y189.143 E.01633
G1 X167.87 Y153.755 E1.35609
G1 X167.495 Y153.54 E.01172
G1 X132.495 Y188.541 E1.34125
G1 X132.507 Y187.938 E.01633
G1 X167.12 Y153.325 E1.32641
G1 X166.745 Y153.11 E.01172
G1 X132.519 Y187.336 E1.31157
G1 X132.531 Y186.733 E.01633
G1 X166.369 Y152.895 E1.29672
G1 X165.994 Y152.68 E.01172
G1 X132.543 Y186.131 E1.28188
G1 X132.555 Y185.529 E.01633
G1 X165.619 Y152.465 E1.26704
G1 X165.244 Y152.25 E.01172
G1 X132.567 Y184.926 E1.2522
G1 X132.579 Y184.324 E.01633
G1 X164.869 Y152.034 E1.23736
G1 X164.493 Y151.819 E.01172
G1 X132.591 Y183.721 E1.22252
G1 X132.603 Y183.119 E.01633
G1 X164.118 Y151.604 E1.20767
G1 X163.743 Y151.389 E.01172
G1 X132.615 Y182.516 E1.19283
G1 X132.627 Y181.914 E.01633
G1 X163.368 Y151.174 E1.17799
G1 X162.992 Y150.959 E.01172
G1 X132.64 Y181.312 E1.16315
G1 X132.652 Y180.709 E.01633
G1 X162.617 Y150.744 E1.14831
G1 X162.242 Y150.529 E.01172
G1 X132.664 Y180.107 E1.13347
G1 X132.676 Y179.504 E.01633
G1 X161.867 Y150.314 E1.11863
G1 X161.491 Y150.098 E.01172
G1 X132.688 Y178.902 E1.10378
G1 X132.7 Y178.3 E.01633
G1 X161.116 Y149.883 E1.08894
G1 X160.741 Y149.668 E.01172
G1 X132.712 Y177.697 E1.0741
G1 X132.724 Y177.095 E.01633
G1 X160.366 Y149.453 E1.05926
G1 X159.99 Y149.238 E.01172
G1 X132.736 Y176.492 E1.04442
G1 X132.748 Y175.89 E.01633
G1 X159.615 Y149.023 E1.02958
G1 X159.24 Y148.808 E.01172
G1 X132.76 Y175.287 E1.01473
G1 X132.772 Y174.685 E.01633
G1 X158.865 Y148.593 E.99989
G1 X158.489 Y148.377 E.01172
G1 X132.784 Y174.083 E.98505
G1 X132.796 Y173.48 E.01633
G1 X158.114 Y148.162 E.97021
G1 X157.739 Y147.947 E.01172
G1 X132.808 Y172.878 E.95537
G1 X132.82 Y172.275 E.01633
G1 X157.364 Y147.732 E.94053
G1 X156.988 Y147.517 E.01172
G1 X132.832 Y171.673 E.92568
G1 X132.844 Y171.071 E.01633
G1 X156.613 Y147.302 E.91084
G1 X156.238 Y147.087 E.01172
G1 X132.856 Y170.468 E.896
G1 X132.869 Y169.866 E.01633
G1 X155.863 Y146.872 E.88116
G1 X155.487 Y146.656 E.01172
G1 X132.881 Y169.263 E.86632
G1 X132.893 Y168.661 E.01633
G1 X155.112 Y146.441 E.85148
G1 X154.737 Y146.226 E.01172
G1 X132.905 Y168.058 E.83664
G1 X132.917 Y167.456 E.01633
G1 X154.362 Y146.011 E.82179
G1 X153.986 Y145.796 E.01172
G1 X132.929 Y166.854 E.80695
G1 X132.941 Y166.251 E.01633
G1 X153.611 Y145.581 E.79211
G1 X153.236 Y145.366 E.01172
G1 X132.953 Y165.649 E.77727
G1 X132.965 Y165.046 E.01633
G1 X152.861 Y145.151 E.76243
G1 X152.486 Y144.935 E.01172
G1 X132.977 Y164.444 E.74759
G1 X132.989 Y163.842 E.01633
G1 X152.11 Y144.72 E.73274
G1 X151.735 Y144.505 E.01172
G1 X133.001 Y163.239 E.7179
G1 X133.013 Y162.637 E.01633
G1 X151.36 Y144.29 E.70306
G1 X150.985 Y144.075 E.01172
G1 X133.025 Y162.034 E.68822
G1 X133.037 Y161.432 E.01633
G1 X150.609 Y143.86 E.67338
G1 X150.234 Y143.645 E.01172
G1 X133.049 Y160.829 E.65854
G1 X133.061 Y160.227 E.01633
G1 X149.859 Y143.43 E.64369
G1 X149.484 Y143.215 E.01172
G1 X133.073 Y159.625 E.62885
G1 X133.086 Y159.022 E.01633
G1 X149.108 Y142.999 E.61401
M73 P45 R37
G1 X148.733 Y142.784 E.01172
G1 X133.098 Y158.42 E.59917
G1 X133.11 Y157.817 E.01633
G1 X148.358 Y142.569 E.58433
G1 X147.983 Y142.354 E.01172
G1 X133.122 Y157.215 E.56949
G1 X133.134 Y156.613 E.01633
G1 X147.607 Y142.139 E.55464
G1 X147.232 Y141.924 E.01172
G1 X133.146 Y156.01 E.5398
G1 X133.158 Y155.408 E.01633
G1 X146.857 Y141.709 E.52496
G1 X146.482 Y141.494 E.01172
G1 X133.17 Y154.805 E.51012
G1 X133.182 Y154.203 E.01633
G1 X146.106 Y141.278 E.49528
G1 X145.727 Y141.068 E.01176
G1 X133.194 Y153.6 E.48027
G1 X133.206 Y152.998 E.01633
G1 X144.556 Y141.648 E.43493
G1 X143.159 Y142.455 E.04371
G1 X133.218 Y152.396 E.38094
G1 X133.23 Y151.793 E.01633
G1 X141.762 Y143.261 E.32695
G1 X140.365 Y144.068 E.04371
G1 X133.242 Y151.191 E.27296
G1 X133.254 Y150.588 E.01633
G1 X138.968 Y144.874 E.21897
G1 X137.572 Y145.681 E.04371
G1 X133.266 Y149.986 E.16499
G1 X133.278 Y149.384 E.01633
G1 X136.175 Y146.487 E.111
G1 X134.778 Y147.294 E.0437
G1 X133.1 Y148.972 E.06432
; OBJECT_ID: 409
; WIPE_START
G1 X134.514 Y147.558 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 381
M625
; start printing object, unique label id: 409
M624 CAAAAAAAAAA=
M204 S10000
G1 X127.276 Y149.982 Z1.4 F30000
G1 X47.244 Y176.785 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X110.167 Y140.712 E1.96535
G1 X110.534 Y140.712 E.00995
G1 X122.861 Y147.829 E.3857
M73 P46 R37
G1 X123.053 Y148.153 E.01019
G1 X123.999 Y195.436 E1.28149
G1 X47.302 Y176.799 E2.13873
; WIPE_START
G1 X49.037 Y175.803 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.188 Y176.941 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X110.061 Y140.311 E1.85116
G1 X110.542 Y140.312 E.0121
G1 X110.642 Y140.312 E.00251
G1 X123.153 Y147.535 E.3632
G1 X123.451 Y148.04 E.01475
G1 X124.405 Y195.718 E1.19892
G1 X124.186 Y195.894 E.00708
G1 X46.247 Y176.955 E2.01651
; WIPE_START
M204 S4000
G1 X47.981 Y175.959 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.783 Y176.985 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.355 Y176.558 E.01639
G1 X48.73 Y176.342 E.01172
G1 X49.308 Y176.921 E.02215
G1 X50.088 Y177.11 E.02175
G1 X49.106 Y176.127 E.03766
G1 X49.481 Y175.912 E.01172
G1 X50.868 Y177.3 E.05316
G1 X51.648 Y177.489 E.02175
G1 X49.856 Y175.697 E.06867
G1 X50.231 Y175.482 E.01172
G1 X52.428 Y177.679 E.08418
G1 X53.208 Y177.868 E.02175
G1 X50.606 Y175.267 E.09968
G1 X50.982 Y175.052 E.01172
G1 X53.988 Y178.058 E.11519
G1 X54.767 Y178.247 E.02175
G1 X51.357 Y174.837 E.13069
G1 X51.732 Y174.622 E.01172
G1 X55.547 Y178.437 E.1462
G1 X56.327 Y178.626 E.02175
G1 X52.107 Y174.406 E.1617
G1 X52.483 Y174.191 E.01172
G1 X57.107 Y178.816 E.17721
G1 X57.887 Y179.005 E.02175
G1 X52.858 Y173.976 E.19272
G1 X53.233 Y173.761 E.01172
G1 X58.667 Y179.195 E.20822
G1 X59.447 Y179.384 E.02175
G1 X53.608 Y173.546 E.22373
G1 X53.984 Y173.331 E.01172
G1 X60.227 Y179.574 E.23923
G1 X61.006 Y179.763 E.02175
G1 X54.359 Y173.116 E.25474
G1 X54.734 Y172.901 E.01172
G1 X61.786 Y179.953 E.27025
G1 X62.566 Y180.142 E.02175
G1 X55.109 Y172.685 E.28575
G1 X55.485 Y172.47 E.01172
G1 X63.346 Y180.332 E.30126
G1 X64.126 Y180.521 E.02175
G1 X55.86 Y172.255 E.31676
G1 X56.235 Y172.04 E.01172
G1 X64.906 Y180.711 E.33227
G1 X65.686 Y180.9 E.02175
G1 X56.61 Y171.825 E.34777
G1 X56.986 Y171.61 E.01172
G1 X66.466 Y181.09 E.36328
G1 X67.245 Y181.279 E.02175
G1 X57.361 Y171.395 E.37879
G1 X57.736 Y171.18 E.01172
G1 X68.025 Y181.469 E.39429
G1 X68.805 Y181.658 E.02175
G1 X58.111 Y170.964 E.4098
G1 X58.487 Y170.749 E.01172
G1 X69.585 Y181.848 E.4253
G1 X70.365 Y182.037 E.02175
G1 X58.862 Y170.534 E.44081
G1 X59.237 Y170.319 E.01172
G1 X71.145 Y182.227 E.45632
G1 X71.925 Y182.416 E.02175
G1 X59.612 Y170.104 E.47182
G1 X59.988 Y169.889 E.01172
G1 X72.705 Y182.606 E.48733
G1 X73.484 Y182.795 E.02175
G1 X60.363 Y169.674 E.50283
G1 X60.738 Y169.459 E.01172
G1 X74.264 Y182.985 E.51834
G1 X75.044 Y183.174 E.02175
G1 X61.113 Y169.243 E.53384
G1 X61.489 Y169.028 E.01172
G1 X75.824 Y183.364 E.54935
G1 X76.604 Y183.553 E.02175
G1 X61.864 Y168.813 E.56486
G1 X62.239 Y168.598 E.01172
G1 X77.384 Y183.743 E.58036
G1 X78.164 Y183.932 E.02175
G1 X62.614 Y168.383 E.59587
G1 X62.989 Y168.168 E.01172
G1 X78.943 Y184.122 E.61137
G1 X79.723 Y184.311 E.02175
G1 X63.365 Y167.953 E.62688
G1 X63.74 Y167.738 E.01172
G1 X80.503 Y184.501 E.64239
G1 X81.283 Y184.69 E.02175
G1 X64.115 Y167.523 E.65789
G1 X64.49 Y167.307 E.01172
G1 X82.063 Y184.88 E.6734
G1 X82.843 Y185.069 E.02175
G1 X64.866 Y167.092 E.6889
G1 X65.241 Y166.877 E.01172
G1 X83.623 Y185.259 E.70441
G1 X84.403 Y185.448 E.02175
G1 X65.616 Y166.662 E.71991
G1 X65.991 Y166.447 E.01172
G1 X85.182 Y185.638 E.73542
G1 X85.962 Y185.827 E.02175
G1 X66.367 Y166.232 E.75093
G1 X66.742 Y166.017 E.01172
G1 X86.742 Y186.017 E.76643
G1 X87.522 Y186.206 E.02175
G1 X67.117 Y165.802 E.78194
G1 X67.492 Y165.586 E.01172
G1 X88.302 Y186.396 E.79744
G1 X89.082 Y186.586 E.02175
G1 X67.868 Y165.371 E.81295
G1 X68.243 Y165.156 E.01172
G1 X89.862 Y186.775 E.82846
G1 X90.642 Y186.965 E.02175
G1 X68.618 Y164.941 E.84396
G1 X68.993 Y164.726 E.01172
G1 X91.421 Y187.154 E.85947
G1 X92.201 Y187.344 E.02175
G1 X69.369 Y164.511 E.87497
G1 X69.744 Y164.296 E.01172
G1 X92.981 Y187.533 E.89048
G1 X93.761 Y187.723 E.02175
G1 X70.119 Y164.081 E.90599
G1 X70.494 Y163.865 E.01172
G1 X94.541 Y187.912 E.92149
G1 X95.321 Y188.102 E.02175
G1 X70.87 Y163.65 E.937
G1 X71.245 Y163.435 E.01172
G1 X96.101 Y188.291 E.9525
G1 X96.881 Y188.481 E.02175
G1 X71.62 Y163.22 E.96801
G1 X71.995 Y163.005 E.01172
G1 X97.66 Y188.67 E.98351
G1 X98.44 Y188.86 E.02175
G1 X72.371 Y162.79 E.99902
G1 X72.746 Y162.575 E.01172
G1 X99.22 Y189.049 E1.01453
G1 X100 Y189.239 E.02175
G1 X73.121 Y162.36 E1.03003
G1 X73.496 Y162.144 E.01172
G1 X100.78 Y189.428 E1.04554
G1 X101.56 Y189.618 E.02175
G1 X73.872 Y161.929 E1.06104
G1 X74.247 Y161.714 E.01172
G1 X102.34 Y189.807 E1.07655
G1 X103.12 Y189.997 E.02175
G1 X74.622 Y161.499 E1.09206
G1 X74.997 Y161.284 E.01172
G1 X103.899 Y190.186 E1.10756
G1 X104.679 Y190.376 E.02175
G1 X75.372 Y161.069 E1.12307
G1 X75.748 Y160.854 E.01172
G1 X105.459 Y190.565 E1.13857
G1 X106.239 Y190.755 E.02175
G1 X76.123 Y160.639 E1.15408
G1 X76.498 Y160.424 E.01172
G1 X107.019 Y190.944 E1.16958
G1 X107.799 Y191.134 E.02175
G1 X76.873 Y160.208 E1.18509
G1 X77.249 Y159.993 E.01172
G1 X108.579 Y191.323 E1.2006
G1 X109.359 Y191.513 E.02175
G1 X77.624 Y159.778 E1.2161
G1 X77.999 Y159.563 E.01172
G1 X110.138 Y191.702 E1.23161
G1 X110.918 Y191.892 E.02175
G1 X78.374 Y159.348 E1.24711
G1 X78.75 Y159.133 E.01172
G1 X111.698 Y192.081 E1.26262
G1 X112.478 Y192.271 E.02175
G1 X79.125 Y158.918 E1.27813
G1 X79.5 Y158.703 E.01172
G1 X113.258 Y192.46 E1.29363
G1 X114.038 Y192.65 E.02175
G1 X79.875 Y158.487 E1.30914
G1 X80.251 Y158.272 E.01172
G1 X114.818 Y192.839 E1.32464
G1 X115.597 Y193.029 E.02175
G1 X80.626 Y158.057 E1.34015
G1 X81.001 Y157.842 E.01172
G1 X116.377 Y193.218 E1.35565
G1 X117.157 Y193.408 E.02175
G1 X81.376 Y157.627 E1.37116
G1 X81.752 Y157.412 E.01172
G1 X117.937 Y193.597 E1.38667
G1 X118.717 Y193.787 E.02175
G1 X82.127 Y157.197 E1.40217
G1 X82.502 Y156.982 E.01172
G1 X119.497 Y193.976 E1.41768
G1 X120.277 Y194.166 E.02175
G1 X82.877 Y156.766 E1.43318
G1 X83.253 Y156.551 E.01172
G1 X121.057 Y194.355 E1.44869
G1 X121.836 Y194.545 E.02175
G1 X83.628 Y156.336 E1.4642
G1 X84.003 Y156.121 E.01172
G1 X122.616 Y194.734 E1.4797
G1 X123.396 Y194.924 E.02175
G1 X84.378 Y155.906 E1.49521
G1 X84.754 Y155.691 E.01172
G1 X123.626 Y194.563 E1.48962
G1 X123.614 Y193.961 E.01633
G1 X85.129 Y155.476 E1.47478
G1 X85.504 Y155.261 E.01172
G1 X123.602 Y193.358 E1.45994
G1 X123.59 Y192.756 E.01633
G1 X85.879 Y155.045 E1.4451
G1 X86.255 Y154.83 E.01172
G1 X123.577 Y192.153 E1.43025
G1 X123.565 Y191.551 E.01633
G1 X86.63 Y154.615 E1.41541
G1 X87.005 Y154.4 E.01172
G1 X123.553 Y190.948 E1.40057
G1 X123.541 Y190.346 E.01633
G1 X87.38 Y154.185 E1.38573
G1 X87.755 Y153.97 E.01172
G1 X123.529 Y189.744 E1.37089
G1 X123.517 Y189.141 E.01633
G1 X88.131 Y153.755 E1.35605
G1 X88.506 Y153.54 E.01172
G1 X123.505 Y188.539 E1.3412
G1 X123.493 Y187.936 E.01633
G1 X88.881 Y153.325 E1.32636
G1 X89.256 Y153.109 E.01172
G1 X123.481 Y187.334 E1.31152
G1 X123.469 Y186.732 E.01633
G1 X89.632 Y152.894 E1.29668
G1 X90.007 Y152.679 E.01172
G1 X123.457 Y186.129 E1.28184
G1 X123.445 Y185.527 E.01633
G1 X90.382 Y152.464 E1.267
G1 X90.757 Y152.249 E.01172
G1 X123.433 Y184.924 E1.25215
G1 X123.421 Y184.322 E.01633
G1 X91.133 Y152.034 E1.23731
G1 X91.508 Y151.819 E.01172
G1 X123.409 Y183.719 E1.22247
G1 X123.397 Y183.117 E.01633
G1 X91.883 Y151.604 E1.20763
G1 X92.258 Y151.388 E.01172
G1 X123.385 Y182.515 E1.19279
G1 X123.373 Y181.912 E.01633
G1 X92.634 Y151.173 E1.17795
G1 X93.009 Y150.958 E.01172
G1 X123.36 Y181.31 E1.1631
G1 X123.348 Y180.707 E.01633
G1 X93.384 Y150.743 E1.14826
G1 X93.759 Y150.528 E.01172
G1 X123.336 Y180.105 E1.13342
G1 X123.324 Y179.503 E.01633
G1 X94.135 Y150.313 E1.11858
G1 X94.51 Y150.098 E.01172
G1 X123.312 Y178.9 E1.10374
G1 X123.3 Y178.298 E.01633
G1 X94.885 Y149.883 E1.0889
G1 X95.26 Y149.667 E.01172
G1 X123.288 Y177.695 E1.07406
G1 X123.276 Y177.093 E.01633
G1 X95.636 Y149.452 E1.05921
G1 X96.011 Y149.237 E.01172
G1 X123.264 Y176.49 E1.04437
G1 X123.252 Y175.888 E.01633
G1 X96.386 Y149.022 E1.02953
G1 X96.761 Y148.807 E.01172
G1 X123.24 Y175.286 E1.01469
G1 X123.228 Y174.683 E.01633
G1 X97.137 Y148.592 E.99985
G1 X97.512 Y148.377 E.01172
G1 X123.216 Y174.081 E.98501
G1 X123.204 Y173.478 E.01633
G1 X97.887 Y148.162 E.97016
G1 X98.262 Y147.946 E.01172
G1 X123.192 Y172.876 E.95532
G1 X123.18 Y172.274 E.01633
G1 X98.638 Y147.731 E.94048
G1 X99.013 Y147.516 E.01172
G1 X123.168 Y171.671 E.92564
G1 X123.156 Y171.069 E.01633
G1 X99.388 Y147.301 E.9108
G1 X99.763 Y147.086 E.01172
G1 X123.144 Y170.466 E.89596
G1 X123.131 Y169.864 E.01633
G1 X100.138 Y146.871 E.88111
G1 X100.514 Y146.656 E.01172
G1 X123.119 Y169.261 E.86627
G1 X123.107 Y168.659 E.01633
G1 X100.889 Y146.441 E.85143
G1 X101.264 Y146.226 E.01172
G1 X123.095 Y168.057 E.83659
G1 X123.083 Y167.454 E.01633
G1 X101.639 Y146.01 E.82175
G1 X102.015 Y145.795 E.01172
G1 X123.071 Y166.852 E.80691
G1 X123.059 Y166.249 E.01633
G1 X102.39 Y145.58 E.79206
G1 X102.765 Y145.365 E.01172
G1 X123.047 Y165.647 E.77722
G1 X123.035 Y165.045 E.01633
G1 X103.14 Y145.15 E.76238
G1 X103.516 Y144.935 E.01172
G1 X123.023 Y164.442 E.74754
G1 X123.011 Y163.84 E.01633
G1 X103.891 Y144.72 E.7327
G1 X104.266 Y144.505 E.01172
G1 X122.999 Y163.237 E.71786
G1 X122.987 Y162.635 E.01633
G1 X104.641 Y144.289 E.70302
G1 X105.017 Y144.074 E.01172
G1 X122.975 Y162.032 E.68817
G1 X122.963 Y161.43 E.01633
G1 X105.392 Y143.859 E.67333
G1 X105.767 Y143.644 E.01172
G1 X122.951 Y160.828 E.65849
G1 X122.939 Y160.225 E.01633
G1 X106.142 Y143.429 E.64365
G1 X106.518 Y143.214 E.01172
G1 X122.927 Y159.623 E.62881
G1 X122.914 Y159.02 E.01633
G1 X106.893 Y142.999 E.61397
G1 X107.268 Y142.784 E.01172
G1 X122.902 Y158.418 E.59912
G1 X122.89 Y157.816 E.01633
G1 X107.643 Y142.568 E.58428
G1 X108.019 Y142.353 E.01172
G1 X122.878 Y157.213 E.56944
G1 X122.866 Y156.611 E.01633
G1 X108.394 Y142.138 E.5546
G1 X108.769 Y141.923 E.01172
G1 X122.854 Y156.008 E.53976
G1 X122.842 Y155.406 E.01633
G1 X109.144 Y141.708 E.52492
G1 X109.52 Y141.493 E.01172
G1 X122.83 Y154.803 E.51007
G1 X122.818 Y154.201 E.01633
G1 X109.895 Y141.278 E.49523
G1 X110.275 Y141.068 E.01177
G1 X122.806 Y153.599 E.4802
G1 X122.794 Y152.996 E.01633
G1 X111.449 Y141.651 E.43477
G1 X112.845 Y142.457 E.04371
G1 X122.782 Y152.394 E.38078
G1 X122.77 Y151.791 E.01633
G1 X114.242 Y143.264 E.32679
G1 X115.639 Y144.07 E.04371
G1 X122.758 Y151.189 E.2728
G1 X122.746 Y150.586 E.01633
G1 X117.036 Y144.877 E.21881
G1 X118.433 Y145.683 E.04371
G1 X122.734 Y149.984 E.16482
G1 X122.722 Y149.382 E.01633
G1 X119.829 Y146.49 E.11083
M73 P47 R37
G1 X121.226 Y147.296 E.04371
G1 X122.9 Y148.97 E.06415
; OBJECT_ID: 437
; WIPE_START
G1 X121.486 Y147.556 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 409
M625
; start printing object, unique label id: 437
M624 EAAAAAAAAAA=
M204 S10000
G1 X116.02 Y142.229 Z1.4 F30000
G1 X47.244 Y75.215 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X123.999 Y56.564 E2.14036
G1 X123.053 Y103.847 E1.28149
G1 X122.861 Y104.171 E.01019
G1 X110.534 Y111.288 E.3857
G1 X110.167 Y111.288 E.00995
G1 X47.296 Y75.245 E1.96372
; WIPE_START
G1 X49.239 Y74.772 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.187 Y75.071 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X124.186 Y56.106 E2.01813
G1 X124.325 Y56.218 E.00451
G1 X124.405 Y56.282 E.00257
G1 X123.451 Y103.96 E1.19892
G1 X123.153 Y104.465 E.01475
G1 X110.642 Y111.688 E.3632
G1 X110.061 Y111.689 E.01461
G1 X46.239 Y75.101 E1.84954
; WIPE_START
M204 S4000
G1 X48.182 Y74.627 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.218 Y75.579 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.528 Y75.269 E.0119
G1 X49.308 Y75.079 E.02175
G1 X48.73 Y75.658 E.02215
G1 X49.106 Y75.873 E.01172
G1 X50.088 Y74.89 E.03766
G1 X50.868 Y74.7 E.02175
G1 X49.481 Y76.088 E.05316
G1 X49.856 Y76.303 E.01172
G1 X51.648 Y74.511 E.06867
G1 X52.428 Y74.321 E.02175
G1 X50.231 Y76.518 E.08418
G1 X50.606 Y76.733 E.01172
G1 X53.208 Y74.132 E.09968
G1 X53.988 Y73.942 E.02175
G1 X50.982 Y76.948 E.11519
G1 X51.357 Y77.163 E.01172
G1 X54.767 Y73.753 E.13069
G1 X55.547 Y73.563 E.02175
G1 X51.732 Y77.378 E.1462
G1 X52.107 Y77.594 E.01172
G1 X56.327 Y73.374 E.16171
G1 X57.107 Y73.184 E.02175
G1 X52.483 Y77.809 E.17721
G1 X52.858 Y78.024 E.01172
G1 X57.887 Y72.995 E.19272
G1 X58.667 Y72.805 E.02175
G1 X53.233 Y78.239 E.20822
G1 X53.608 Y78.454 E.01172
G1 X59.447 Y72.616 E.22373
G1 X60.227 Y72.426 E.02175
G1 X53.984 Y78.669 E.23923
G1 X54.359 Y78.884 E.01172
G1 X61.006 Y72.237 E.25474
G1 X61.786 Y72.047 E.02175
G1 X54.734 Y79.099 E.27025
G1 X55.109 Y79.315 E.01172
G1 X62.566 Y71.858 E.28575
G1 X63.346 Y71.668 E.02175
G1 X55.485 Y79.53 E.30126
G1 X55.86 Y79.745 E.01172
G1 X64.126 Y71.479 E.31676
G1 X64.906 Y71.289 E.02175
G1 X56.235 Y79.96 E.33227
G1 X56.61 Y80.175 E.01172
G1 X65.686 Y71.1 E.34778
G1 X66.466 Y70.91 E.02175
G1 X56.986 Y80.39 E.36328
G1 X57.361 Y80.605 E.01172
G1 X67.245 Y70.721 E.37879
G1 X68.025 Y70.531 E.02175
G1 X57.736 Y80.82 E.39429
G1 X58.111 Y81.036 E.01172
G1 X68.805 Y70.342 E.4098
G1 X69.585 Y70.152 E.02175
G1 X58.487 Y81.251 E.4253
G1 X58.862 Y81.466 E.01172
G1 X70.365 Y69.963 E.44081
G1 X71.145 Y69.773 E.02175
G1 X59.237 Y81.681 E.45632
G1 X59.612 Y81.896 E.01172
G1 X71.925 Y69.584 E.47182
G1 X72.705 Y69.394 E.02175
G1 X59.988 Y82.111 E.48733
G1 X60.363 Y82.326 E.01172
G1 X73.484 Y69.205 E.50283
G1 X74.264 Y69.015 E.02175
G1 X60.738 Y82.541 E.51834
G1 X61.113 Y82.757 E.01172
G1 X75.044 Y68.826 E.53385
G1 X75.824 Y68.636 E.02175
G1 X61.489 Y82.972 E.54935
G1 X61.864 Y83.187 E.01172
G1 X76.604 Y68.447 E.56486
G1 X77.384 Y68.257 E.02175
G1 X62.239 Y83.402 E.58036
G1 X62.614 Y83.617 E.01172
G1 X78.164 Y68.068 E.59587
G1 X78.944 Y67.878 E.02175
G1 X62.989 Y83.832 E.61138
G1 X63.365 Y84.047 E.01172
G1 X79.723 Y67.689 E.62688
G1 X80.503 Y67.499 E.02175
G1 X63.74 Y84.262 E.64239
G1 X64.115 Y84.477 E.01172
G1 X81.283 Y67.31 E.65789
G1 X82.063 Y67.12 E.02175
G1 X64.49 Y84.693 E.6734
G1 X64.866 Y84.908 E.01172
G1 X82.843 Y66.931 E.6889
G1 X83.623 Y66.741 E.02175
G1 X65.241 Y85.123 E.70441
G1 X65.616 Y85.338 E.01172
G1 X84.403 Y66.552 E.71992
G1 X85.182 Y66.362 E.02175
G1 X65.991 Y85.553 E.73542
G1 X66.367 Y85.768 E.01172
G1 X85.962 Y66.172 E.75093
G1 X86.742 Y65.983 E.02175
G1 X66.742 Y85.983 E.76643
G1 X67.117 Y86.198 E.01172
G1 X87.522 Y65.793 E.78194
G1 X88.302 Y65.604 E.02175
G1 X67.492 Y86.414 E.79745
G1 X67.868 Y86.629 E.01172
G1 X89.082 Y65.414 E.81295
G1 X89.862 Y65.225 E.02175
G1 X68.243 Y86.844 E.82846
G1 X68.618 Y87.059 E.01172
G1 X90.642 Y65.035 E.84396
G1 X91.421 Y64.846 E.02175
M73 P47 R36
G1 X68.993 Y87.274 E.85947
G1 X69.369 Y87.489 E.01172
G1 X92.201 Y64.656 E.87497
G1 X92.981 Y64.467 E.02175
G1 X69.744 Y87.704 E.89048
G1 X70.119 Y87.919 E.01172
G1 X93.761 Y64.277 E.90599
G1 X94.541 Y64.088 E.02175
G1 X70.494 Y88.135 E.92149
G1 X70.87 Y88.35 E.01172
G1 X95.321 Y63.898 E.937
G1 X96.101 Y63.709 E.02175
G1 X71.245 Y88.565 E.9525
G1 X71.62 Y88.78 E.01172
G1 X96.881 Y63.519 E.96801
G1 X97.66 Y63.33 E.02175
G1 X71.995 Y88.995 E.98352
G1 X72.371 Y89.21 E.01172
G1 X98.44 Y63.14 E.99902
G1 X99.22 Y62.951 E.02175
G1 X72.746 Y89.425 E1.01453
G1 X73.121 Y89.64 E.01172
G1 X100 Y62.761 E1.03003
G1 X100.78 Y62.572 E.02175
G1 X73.496 Y89.856 E1.04554
G1 X73.872 Y90.071 E.01172
G1 X101.56 Y62.382 E1.06105
G1 X102.34 Y62.193 E.02175
G1 X74.247 Y90.286 E1.07655
G1 X74.622 Y90.501 E.01172
G1 X103.12 Y62.003 E1.09206
G1 X103.899 Y61.814 E.02175
G1 X74.997 Y90.716 E1.10756
G1 X75.372 Y90.931 E.01172
G1 X104.679 Y61.624 E1.12307
G1 X105.459 Y61.435 E.02175
G1 X75.748 Y91.146 E1.13857
G1 X76.123 Y91.361 E.01172
G1 X106.239 Y61.245 E1.15408
G1 X107.019 Y61.056 E.02175
G1 X76.498 Y91.576 E1.16959
G1 X76.873 Y91.792 E.01172
G1 X107.799 Y60.866 E1.18509
G1 X108.579 Y60.677 E.02175
G1 X77.249 Y92.007 E1.2006
G1 X77.624 Y92.222 E.01172
G1 X109.359 Y60.487 E1.2161
G1 X110.138 Y60.298 E.02175
G1 X77.999 Y92.437 E1.23161
G1 X78.374 Y92.652 E.01172
G1 X110.918 Y60.108 E1.24712
G1 X111.698 Y59.919 E.02175
G1 X78.75 Y92.867 E1.26262
G1 X79.125 Y93.082 E.01172
G1 X112.478 Y59.729 E1.27813
G1 X113.258 Y59.54 E.02175
G1 X79.5 Y93.297 E1.29363
G1 X79.875 Y93.513 E.01172
G1 X114.038 Y59.35 E1.30914
G1 X114.818 Y59.161 E.02175
G1 X80.251 Y93.728 E1.32464
G1 X80.626 Y93.943 E.01172
G1 X115.598 Y58.971 E1.34015
G1 X116.377 Y58.782 E.02175
G1 X81.001 Y94.158 E1.35566
G1 X81.376 Y94.373 E.01172
G1 X117.157 Y58.592 E1.37116
G1 X117.937 Y58.403 E.02175
G1 X81.752 Y94.588 E1.38667
G1 X82.127 Y94.803 E.01172
G1 X118.717 Y58.213 E1.40217
G1 X119.497 Y58.024 E.02175
G1 X82.502 Y95.018 E1.41768
G1 X82.877 Y95.234 E.01172
G1 X120.277 Y57.834 E1.43319
G1 X121.057 Y57.645 E.02175
G1 X83.253 Y95.449 E1.44869
G1 X83.628 Y95.664 E.01172
G1 X121.837 Y57.455 E1.4642
G1 X122.616 Y57.266 E.02175
G1 X84.003 Y95.879 E1.4797
G1 X84.378 Y96.094 E.01172
G1 X123.396 Y57.076 E1.49521
G1 X123.634 Y57.018 E.00663
G1 X123.626 Y57.437 E.01135
G1 X84.754 Y96.309 E1.48962
G1 X85.129 Y96.524 E.01172
G1 X123.614 Y58.039 E1.47478
G1 X123.602 Y58.642 E.01633
G1 X85.504 Y96.739 E1.45994
G1 X85.879 Y96.955 E.01172
G1 X123.589 Y59.244 E1.44509
G1 X123.577 Y59.847 E.01633
G1 X86.255 Y97.17 E1.43025
G1 X86.63 Y97.385 E.01172
G1 X123.565 Y60.449 E1.41541
G1 X123.553 Y61.052 E.01633
G1 X87.005 Y97.6 E1.40057
G1 X87.38 Y97.815 E.01172
G1 X123.541 Y61.654 E1.38573
G1 X123.529 Y62.256 E.01633
G1 X87.755 Y98.03 E1.37089
G1 X88.131 Y98.245 E.01172
G1 X123.517 Y62.859 E1.35605
G1 X123.505 Y63.461 E.01633
G1 X88.506 Y98.46 E1.3412
G1 X88.881 Y98.675 E.01172
G1 X123.493 Y64.064 E1.32636
G1 X123.481 Y64.666 E.01633
G1 X89.256 Y98.891 E1.31152
G1 X89.632 Y99.106 E.01172
G1 X123.469 Y65.268 E1.29668
G1 X123.457 Y65.871 E.01633
G1 X90.007 Y99.321 E1.28184
G1 X90.382 Y99.536 E.01172
G1 X123.445 Y66.473 E1.267
G1 X123.433 Y67.076 E.01633
G1 X90.757 Y99.751 E1.25215
G1 X91.133 Y99.966 E.01172
G1 X123.421 Y67.678 E1.23731
G1 X123.409 Y68.281 E.01633
G1 X91.508 Y100.181 E1.22247
G1 X91.883 Y100.396 E.01172
G1 X123.397 Y68.883 E1.20763
G1 X123.385 Y69.485 E.01633
G1 X92.258 Y100.612 E1.19279
G1 X92.634 Y100.827 E.01172
G1 X123.373 Y70.088 E1.17795
G1 X123.36 Y70.69 E.01633
G1 X93.009 Y101.042 E1.1631
G1 X93.384 Y101.257 E.01172
G1 X123.348 Y71.293 E1.14826
G1 X123.336 Y71.895 E.01633
G1 X93.759 Y101.472 E1.13342
G1 X94.135 Y101.687 E.01172
G1 X123.324 Y72.497 E1.11858
G1 X123.312 Y73.1 E.01633
G1 X94.51 Y101.902 E1.10374
G1 X94.885 Y102.117 E.01172
G1 X123.3 Y73.702 E1.0889
G1 X123.288 Y74.305 E.01633
G1 X95.26 Y102.333 E1.07405
G1 X95.636 Y102.548 E.01172
G1 X123.276 Y74.907 E1.05921
G1 X123.264 Y75.51 E.01633
G1 X96.011 Y102.763 E1.04437
G1 X96.386 Y102.978 E.01172
G1 X123.252 Y76.112 E1.02953
G1 X123.24 Y76.714 E.01633
G1 X96.761 Y103.193 E1.01469
G1 X97.137 Y103.408 E.01172
G1 X123.228 Y77.317 E.99985
G1 X123.216 Y77.919 E.01633
G1 X97.512 Y103.623 E.98501
G1 X97.887 Y103.838 E.01172
G1 X123.204 Y78.522 E.97016
G1 X123.192 Y79.124 E.01633
G1 X98.262 Y104.054 E.95532
G1 X98.637 Y104.269 E.01172
G1 X123.18 Y79.726 E.94048
G1 X123.168 Y80.329 E.01633
G1 X99.013 Y104.484 E.92564
G1 X99.388 Y104.699 E.01172
G1 X123.156 Y80.931 E.9108
G1 X123.143 Y81.534 E.01633
G1 X99.763 Y104.914 E.89596
G1 X100.138 Y105.129 E.01172
G1 X123.131 Y82.136 E.88111
G1 X123.119 Y82.739 E.01633
G1 X100.514 Y105.344 E.86627
G1 X100.889 Y105.559 E.01172
G1 X123.107 Y83.341 E.85143
G1 X123.095 Y83.943 E.01633
G1 X101.264 Y105.774 E.83659
G1 X101.639 Y105.99 E.01172
G1 X123.083 Y84.546 E.82175
G1 X123.071 Y85.148 E.01633
G1 X102.015 Y106.205 E.80691
G1 X102.39 Y106.42 E.01172
G1 X123.059 Y85.751 E.79206
G1 X123.047 Y86.353 E.01633
G1 X102.765 Y106.635 E.77722
G1 X103.14 Y106.85 E.01172
G1 X123.035 Y86.955 E.76238
G1 X123.023 Y87.558 E.01633
G1 X103.516 Y107.065 E.74754
G1 X103.891 Y107.28 E.01172
G1 X123.011 Y88.16 E.7327
G1 X122.999 Y88.763 E.01633
G1 X104.266 Y107.495 E.71786
G1 X104.641 Y107.711 E.01172
G1 X122.987 Y89.365 E.70302
G1 X122.975 Y89.968 E.01633
G1 X105.017 Y107.926 E.68817
G1 X105.392 Y108.141 E.01172
G1 X122.963 Y90.57 E.67333
G1 X122.951 Y91.172 E.01633
G1 X105.767 Y108.356 E.65849
G1 X106.142 Y108.571 E.01172
G1 X122.939 Y91.775 E.64365
G1 X122.927 Y92.377 E.01633
G1 X106.518 Y108.786 E.62881
G1 X106.893 Y109.001 E.01172
G1 X122.914 Y92.98 E.61397
G1 X122.902 Y93.582 E.01633
G1 X107.268 Y109.216 E.59912
G1 X107.643 Y109.432 E.01172
G1 X122.89 Y94.185 E.58428
G1 X122.878 Y94.787 E.01633
G1 X108.019 Y109.647 E.56944
G1 X108.394 Y109.862 E.01172
G1 X122.866 Y95.389 E.5546
G1 X122.854 Y95.992 E.01633
G1 X108.769 Y110.077 E.53976
G1 X109.144 Y110.292 E.01172
G1 X122.842 Y96.594 E.52492
G1 X122.83 Y97.197 E.01633
G1 X109.52 Y110.507 E.51007
G1 X109.895 Y110.722 E.01172
G1 X122.818 Y97.799 E.49523
G1 X122.806 Y98.401 E.01633
G1 X110.275 Y110.932 E.4802
G1 X110.439 Y110.932 E.00444
G1 X111.449 Y110.349 E.0316
G1 X122.794 Y99.004 E.43476
M73 P48 R36
G1 X122.782 Y99.606 E.01633
G1 X112.845 Y109.543 E.38078
G1 X114.242 Y108.736 E.04371
G1 X122.77 Y100.209 E.32679
G1 X122.758 Y100.811 E.01633
G1 X115.639 Y107.93 E.2728
G1 X117.036 Y107.123 E.0437
G1 X122.746 Y101.414 E.21881
G1 X122.734 Y102.016 E.01633
G1 X118.433 Y106.317 E.16482
G1 X119.829 Y105.51 E.04371
G1 X122.722 Y102.618 E.11083
G1 X122.71 Y103.221 E.01633
G1 X120.715 Y105.215 E.07642
; OBJECT_ID: 465
; WIPE_START
G1 X122.129 Y103.801 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 437
M625
; start printing object, unique label id: 465
M624 IAAAAAAAAAA=
M204 S10000
G1 X116.26 Y108.68 Z1.4 F30000
G1 X40.405 Y171.729 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X40.405 Y80.271 E2.47823
G1 X106.343 Y118.073 E2.05953
G1 X106.526 Y118.388 E.00986
G1 X106.526 Y133.612 E.41253
G1 X106.343 Y133.927 E.00986
G1 X40.457 Y171.699 E2.05791
M204 S10000
G1 X40.004 Y172.261 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X40.004 Y79.739 E2.32615
G1 X40.142 Y79.659 E.004
G1 X106.636 Y117.779 E1.92699
G1 X106.927 Y118.28 E.01457
G1 X106.927 Y133.72 E.38817
G1 X106.636 Y134.221 E.01457
G1 X40.142 Y172.341 E1.92699
G1 X40.056 Y172.292 E.00249
; WIPE_START
M204 S4000
G1 X40.055 Y170.292 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X40.762 Y171.33 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X40.762 Y80.886 E2.45076
G1 X41.179 Y81.125 E.01301
G1 X41.179 Y170.875 E2.43197
G1 X41.595 Y170.636 E.01301
G1 X41.595 Y81.364 E2.41903
G1 X42.012 Y81.602 E.01301
G1 X42.012 Y170.398 E2.40608
G1 X42.428 Y170.159 E.01301
G1 X42.428 Y81.841 E2.39314
G1 X42.845 Y82.08 E.01301
G1 X42.845 Y169.92 E2.3802
G1 X43.262 Y169.681 E.01301
G1 X43.262 Y82.319 E2.36725
G1 X43.678 Y82.558 E.01301
G1 X43.678 Y169.442 E2.35431
G1 X44.095 Y169.203 E.01301
G1 X44.095 Y82.797 E2.34137
G1 X44.512 Y83.036 E.01301
G1 X44.512 Y168.965 E2.32842
G1 X44.928 Y168.726 E.01301
G1 X44.928 Y83.274 E2.31548
G1 X45.345 Y83.513 E.01301
G1 X45.345 Y168.487 E2.30254
G1 X45.761 Y168.248 E.01301
G1 X45.761 Y83.752 E2.28959
G1 X46.178 Y83.991 E.01301
G1 X46.178 Y168.009 E2.27665
G1 X46.595 Y167.77 E.01301
G1 X46.595 Y84.23 E2.26371
G1 X47.011 Y84.469 E.01301
G1 X47.011 Y167.531 E2.25076
G1 X47.428 Y167.293 E.01301
G1 X47.428 Y84.707 E2.23782
G1 X47.844 Y84.946 E.01301
G1 X47.844 Y167.054 E2.22487
G1 X48.261 Y166.815 E.01301
G1 X48.261 Y85.185 E2.21193
G1 X48.678 Y85.424 E.01301
G1 X48.678 Y166.576 E2.19899
G1 X49.094 Y166.337 E.01301
G1 X49.094 Y85.663 E2.18604
G1 X49.511 Y85.902 E.01301
G1 X49.511 Y166.098 E2.1731
G1 X49.927 Y165.86 E.01301
G1 X49.927 Y86.14 E2.16016
G1 X50.344 Y86.379 E.01301
G1 X50.344 Y165.621 E2.14721
G1 X50.761 Y165.382 E.01301
G1 X50.761 Y86.618 E2.13427
G1 X51.177 Y86.857 E.01301
G1 X51.177 Y165.143 E2.12133
G1 X51.594 Y164.904 E.01301
G1 X51.594 Y87.096 E2.10838
G1 X52.01 Y87.335 E.01301
G1 X52.01 Y164.665 E2.09544
G1 X52.427 Y164.427 E.01301
G1 X52.427 Y87.573 E2.0825
G1 X52.844 Y87.812 E.01301
G1 X52.844 Y164.188 E2.06955
G1 X53.26 Y163.949 E.01301
G1 X53.26 Y88.051 E2.05661
G1 X53.677 Y88.29 E.01301
G1 X53.677 Y163.71 E2.04367
G1 X54.094 Y163.471 E.01301
G1 X54.094 Y88.529 E2.03072
G1 X54.51 Y88.768 E.01301
G1 X54.51 Y163.232 E2.01778
G1 X54.927 Y162.994 E.01301
G1 X54.927 Y89.006 E2.00483
G1 X55.343 Y89.245 E.01301
G1 X55.343 Y162.755 E1.99189
G1 X55.76 Y162.516 E.01301
G1 X55.76 Y89.484 E1.97895
G1 X56.177 Y89.723 E.01301
G1 X56.177 Y162.277 E1.966
G1 X56.593 Y162.038 E.01301
G1 X56.593 Y89.962 E1.95306
G1 X57.01 Y90.201 E.01301
G1 X57.01 Y161.799 E1.94012
G1 X57.426 Y161.561 E.01301
G1 X57.426 Y90.439 E1.92717
G1 X57.843 Y90.678 E.01301
G1 X57.843 Y161.322 E1.91423
G1 X58.26 Y161.083 E.01301
G1 X58.26 Y90.917 E1.90129
G1 X58.676 Y91.156 E.01301
G1 X58.676 Y160.844 E1.88834
G1 X59.093 Y160.605 E.01301
G1 X59.093 Y91.395 E1.8754
G1 X59.509 Y91.634 E.01301
G1 X59.509 Y160.366 E1.86246
G1 X59.926 Y160.128 E.01301
G1 X59.926 Y91.872 E1.84951
G1 X60.343 Y92.111 E.01301
G1 X60.343 Y159.889 E1.83657
G1 X60.759 Y159.65 E.01301
G1 X60.759 Y92.35 E1.82363
G1 X61.176 Y92.589 E.01301
G1 X61.176 Y159.411 E1.81068
G1 X61.593 Y159.172 E.01301
G1 X61.593 Y92.828 E1.79774
G1 X62.009 Y93.067 E.01301
G1 X62.009 Y158.933 E1.78479
G1 X62.426 Y158.695 E.01301
G1 X62.426 Y93.305 E1.77185
G1 X62.842 Y93.544 E.01301
G1 X62.842 Y158.456 E1.75891
G1 X63.259 Y158.217 E.01301
G1 X63.259 Y93.783 E1.74596
G1 X63.676 Y94.022 E.01301
G1 X63.676 Y157.978 E1.73302
G1 X64.092 Y157.739 E.01301
G1 X64.092 Y94.261 E1.72008
G1 X64.509 Y94.5 E.01301
G1 X64.509 Y157.5 E1.70713
G1 X64.925 Y157.262 E.01301
G1 X64.925 Y94.739 E1.69419
G1 X65.342 Y94.977 E.01301
G1 X65.342 Y157.023 E1.68125
G1 X65.759 Y156.784 E.01301
G1 X65.759 Y95.216 E1.6683
G1 X66.175 Y95.455 E.01301
G1 X66.175 Y156.545 E1.65536
G1 X66.592 Y156.306 E.01301
G1 X66.592 Y95.694 E1.64242
G1 X67.008 Y95.933 E.01301
G1 X67.008 Y156.067 E1.62947
G1 X67.425 Y155.828 E.01301
G1 X67.425 Y96.172 E1.61653
G1 X67.842 Y96.41 E.01301
G1 X67.842 Y155.59 E1.60359
M73 P48 R35
G1 X68.258 Y155.351 E.01301
G1 X68.258 Y96.649 E1.59064
G1 X68.675 Y96.888 E.01301
G1 X68.675 Y155.112 E1.5777
G1 X69.091 Y154.873 E.01301
G1 X69.091 Y97.127 E1.56475
G1 X69.508 Y97.366 E.01301
G1 X69.508 Y154.634 E1.55181
G1 X69.925 Y154.395 E.01301
G1 X69.925 Y97.605 E1.53887
G1 X70.341 Y97.843 E.01301
G1 X70.341 Y154.157 E1.52592
G1 X70.758 Y153.918 E.01301
G1 X70.758 Y98.082 E1.51298
G1 X71.175 Y98.321 E.01301
G1 X71.175 Y153.679 E1.50004
G1 X71.591 Y153.44 E.01301
G1 X71.591 Y98.56 E1.48709
G1 X72.008 Y98.799 E.01301
G1 X72.008 Y153.201 E1.47415
G1 X72.424 Y152.962 E.01301
G1 X72.424 Y99.038 E1.46121
G1 X72.841 Y99.276 E.01301
G1 X72.841 Y152.724 E1.44826
G1 X73.258 Y152.485 E.01301
G1 X73.258 Y99.515 E1.43532
G1 X73.674 Y99.754 E.01301
G1 X73.674 Y152.246 E1.42238
G1 X74.091 Y152.007 E.01301
G1 X74.091 Y99.993 E1.40943
G1 X74.507 Y100.232 E.01301
G1 X74.507 Y151.768 E1.39649
G1 X74.924 Y151.529 E.01301
G1 X74.924 Y100.471 E1.38354
G1 X75.341 Y100.709 E.01301
G1 X75.341 Y151.291 E1.3706
G1 X75.757 Y151.052 E.01301
G1 X75.757 Y100.948 E1.35766
G1 X76.174 Y101.187 E.01301
G1 X76.174 Y150.813 E1.34471
G1 X76.59 Y150.574 E.01301
G1 X76.59 Y101.426 E1.33177
G1 X77.007 Y101.665 E.01301
G1 X77.007 Y150.335 E1.31883
G1 X77.424 Y150.096 E.01301
G1 X77.424 Y101.904 E1.30588
G1 X77.84 Y102.142 E.01301
G1 X77.84 Y149.858 E1.29294
G1 X78.257 Y149.619 E.01301
G1 X78.257 Y102.381 E1.28
G1 X78.674 Y102.62 E.01301
G1 X78.674 Y149.38 E1.26705
G1 X79.09 Y149.141 E.01301
G1 X79.09 Y102.859 E1.25411
G1 X79.507 Y103.098 E.01301
G1 X79.507 Y148.902 E1.24117
G1 X79.923 Y148.663 E.01301
G1 X79.923 Y103.337 E1.22822
M73 P49 R35
G1 X80.34 Y103.575 E.01301
G1 X80.34 Y148.425 E1.21528
G1 X80.757 Y148.186 E.01301
G1 X80.757 Y103.814 E1.20234
G1 X81.173 Y104.053 E.01301
G1 X81.173 Y147.947 E1.18939
G1 X81.59 Y147.708 E.01301
G1 X81.59 Y104.292 E1.17645
G1 X82.006 Y104.531 E.01301
G1 X82.006 Y147.469 E1.1635
G1 X82.423 Y147.23 E.01301
G1 X82.423 Y104.77 E1.15056
G1 X82.84 Y105.008 E.01301
G1 X82.84 Y146.992 E1.13762
G1 X83.256 Y146.753 E.01301
G1 X83.256 Y105.247 E1.12467
G1 X83.673 Y105.486 E.01301
G1 X83.673 Y146.514 E1.11173
G1 X84.089 Y146.275 E.01301
G1 X84.089 Y105.725 E1.09879
G1 X84.506 Y105.964 E.01301
G1 X84.506 Y146.036 E1.08584
G1 X84.923 Y145.797 E.01301
G1 X84.923 Y106.203 E1.0729
G1 X85.339 Y106.441 E.01301
G1 X85.339 Y145.559 E1.05996
G1 X85.756 Y145.32 E.01301
G1 X85.756 Y106.68 E1.04701
G1 X86.173 Y106.919 E.01301
G1 X86.173 Y145.081 E1.03407
G1 X86.589 Y144.842 E.01301
G1 X86.589 Y107.158 E1.02113
G1 X87.006 Y107.397 E.01301
G1 X87.006 Y144.603 E1.00818
G1 X87.422 Y144.364 E.01301
G1 X87.422 Y107.636 E.99524
G1 X87.839 Y107.875 E.01301
G1 X87.839 Y144.125 E.98229
G1 X88.256 Y143.887 E.01301
G1 X88.256 Y108.113 E.96935
G1 X88.672 Y108.352 E.01301
G1 X88.672 Y143.648 E.95641
G1 X89.089 Y143.409 E.01301
G1 X89.089 Y108.591 E.94346
G1 X89.505 Y108.83 E.01301
G1 X89.505 Y143.17 E.93052
G1 X89.922 Y142.931 E.01301
G1 X89.922 Y109.069 E.91758
G1 X90.339 Y109.308 E.01301
G1 X90.339 Y142.692 E.90463
G1 X90.755 Y142.454 E.01301
G1 X90.755 Y109.546 E.89169
G1 X91.172 Y109.785 E.01301
G1 X91.172 Y142.215 E.87875
G1 X91.588 Y141.976 E.01301
G1 X91.588 Y110.024 E.8658
G1 X92.005 Y110.263 E.01301
G1 X92.005 Y141.737 E.85286
G1 X92.422 Y141.498 E.01301
G1 X92.422 Y110.502 E.83992
G1 X92.838 Y110.741 E.01301
G1 X92.838 Y141.259 E.82697
G1 X93.255 Y141.021 E.01301
G1 X93.255 Y110.979 E.81403
G1 X93.671 Y111.218 E.01301
G1 X93.671 Y140.782 E.80109
G1 X94.088 Y140.543 E.01301
G1 X94.088 Y111.457 E.78814
G1 X94.505 Y111.696 E.01301
G1 X94.505 Y140.304 E.7752
G1 X94.921 Y140.065 E.01301
G1 X94.921 Y111.935 E.76225
G1 X95.338 Y112.174 E.01301
G1 X95.338 Y139.826 E.74931
G1 X95.755 Y139.588 E.01301
G1 X95.755 Y112.412 E.73637
G1 X96.171 Y112.651 E.01301
G1 X96.171 Y139.349 E.72342
G1 X96.588 Y139.11 E.01301
G1 X96.588 Y112.89 E.71048
G1 X97.004 Y113.129 E.01301
G1 X97.004 Y138.871 E.69754
G1 X97.421 Y138.632 E.01301
G1 X97.421 Y113.368 E.68459
G1 X97.838 Y113.607 E.01301
G1 X97.838 Y138.393 E.67165
G1 X98.254 Y138.155 E.01301
G1 X98.254 Y113.845 E.65871
G1 X98.671 Y114.084 E.01301
G1 X98.671 Y137.916 E.64576
G1 X99.087 Y137.677 E.01301
G1 X99.087 Y114.323 E.63282
G1 X99.504 Y114.562 E.01301
G1 X99.504 Y137.438 E.61988
G1 X99.921 Y137.199 E.01301
G1 X99.921 Y114.801 E.60693
G1 X100.337 Y115.04 E.01301
G1 X100.337 Y136.96 E.59399
G1 X100.754 Y136.722 E.01301
G1 X100.754 Y115.278 E.58105
G1 X101.17 Y115.517 E.01301
G1 X101.17 Y136.483 E.5681
G1 X101.587 Y136.244 E.01301
G1 X101.587 Y115.756 E.55516
G1 X102.004 Y115.995 E.01301
G1 X102.004 Y136.005 E.54221
G1 X102.42 Y135.766 E.01301
G1 X102.42 Y116.234 E.52927
G1 X102.837 Y116.473 E.01301
G1 X102.837 Y135.527 E.51633
G1 X103.254 Y135.289 E.01301
G1 X103.254 Y116.711 E.50338
G1 X103.67 Y116.95 E.01301
G1 X103.67 Y135.05 E.49044
G1 X104.087 Y134.811 E.01301
G1 X104.087 Y117.189 E.4775
G1 X104.503 Y117.428 E.01301
G1 X104.503 Y134.572 E.46455
G1 X104.92 Y134.333 E.01301
G1 X104.92 Y117.667 E.45161
G1 X105.337 Y117.906 E.01301
G1 X105.337 Y134.094 E.43867
G1 X105.753 Y133.856 E.01301
G1 X105.753 Y118.144 E.42572
G3 X106.17 Y118.483 I-.083 J.529 E.01523
G1 X106.17 Y133.832 E.41593
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X106.17 Y131.832 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 465
M625
; layer num/total_layer_count: 7/14
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F30000
; object ids of layer 7 start: 325,353,381,409,437,465
M624 PwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer7 end: 325,353,381,409,437,465
M625
; OBJECT_ID: 325
; start printing object, unique label id: 325
M624 AQAAAAAAAAA=
G1 X208.756 Y75.215
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X145.833 Y111.288 E1.96534
G1 X145.466 Y111.288 E.00995
G1 X133.139 Y104.171 E.3857
G1 X132.947 Y103.847 E.01019
G1 X132.001 Y56.564 E1.28148
G1 X208.698 Y75.201 E2.13872
; WIPE_START
G1 X206.963 Y76.197 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.812 Y75.059 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X145.939 Y111.689 E1.85116
G1 X145.358 Y111.688 E.01461
G1 X132.847 Y104.465 E.3632
G1 X132.549 Y103.96 E.01475
G1 X131.595 Y56.282 E1.19892
G1 X131.814 Y56.106 E.00708
G1 X209.753 Y75.045 E2.01651
; WIPE_START
M204 S4000
G1 X208.019 Y76.041 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.783 Y75.579 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.474 Y75.27 E.01185
G1 X206.694 Y75.08 E.02175
G1 X207.271 Y75.657 E.0221
G1 X206.895 Y75.872 E.01172
G1 X205.914 Y74.891 E.03761
G1 X205.134 Y74.701 E.02175
G1 X206.52 Y76.087 E.05312
G1 X206.145 Y76.302 E.01172
G1 X204.354 Y74.512 E.06862
G1 X203.574 Y74.322 E.02175
G1 X205.77 Y76.517 E.08413
G1 X205.394 Y76.732 E.01172
G1 X202.794 Y74.133 E.09963
G1 X202.015 Y73.943 E.02175
G1 X205.019 Y76.948 E.11514
G1 X204.644 Y77.163 E.01172
G1 X201.235 Y73.754 E.13064
G1 X200.455 Y73.564 E.02175
G1 X204.269 Y77.378 E.14615
G1 X203.893 Y77.593 E.01172
G1 X199.675 Y73.374 E.16166
G1 X198.895 Y73.185 E.02175
G1 X203.518 Y77.808 E.17716
G1 X203.143 Y78.023 E.01172
G1 X198.115 Y72.995 E.19267
G1 X197.335 Y72.806 E.02175
G1 X202.768 Y78.238 E.20817
G1 X202.393 Y78.453 E.01172
G1 X196.556 Y72.616 E.22368
G1 X195.776 Y72.427 E.02175
G1 X202.017 Y78.669 E.23919
G1 X201.642 Y78.884 E.01172
G1 X194.996 Y72.237 E.25469
G1 X194.216 Y72.048 E.02175
G1 X201.267 Y79.099 E.2702
G1 X200.892 Y79.314 E.01172
G1 X193.436 Y71.858 E.2857
G1 X192.656 Y71.669 E.02175
G1 X200.516 Y79.529 E.30121
G1 X200.141 Y79.744 E.01172
G1 X191.876 Y71.479 E.31671
G1 X191.096 Y71.29 E.02175
G1 X199.766 Y79.959 E.33222
G1 X199.391 Y80.174 E.01172
G1 X190.317 Y71.1 E.34773
G1 X189.537 Y70.911 E.02175
G1 X199.015 Y80.39 E.36323
G1 X198.64 Y80.605 E.01172
G1 X188.757 Y70.721 E.37874
G1 X187.977 Y70.532 E.02175
G1 X198.265 Y80.82 E.39424
G1 X197.89 Y81.035 E.01172
G1 X187.197 Y70.342 E.40975
G1 X186.417 Y70.153 E.02175
G1 X197.514 Y81.25 E.42526
G1 X197.139 Y81.465 E.01172
G1 X185.637 Y69.963 E.44076
G1 X184.857 Y69.774 E.02175
G1 X196.764 Y81.68 E.45627
G1 X196.389 Y81.895 E.01172
G1 X184.078 Y69.584 E.47177
G1 X183.298 Y69.395 E.02175
G1 X196.013 Y82.111 E.48728
G1 X195.638 Y82.326 E.01172
G1 X182.518 Y69.205 E.50278
G1 X181.738 Y69.016 E.02175
G1 X195.263 Y82.541 E.51829
G1 X194.888 Y82.756 E.01172
G1 X180.958 Y68.826 E.5338
G1 X180.178 Y68.637 E.02175
G1 X194.512 Y82.971 E.5493
G1 X194.137 Y83.186 E.01172
G1 X179.398 Y68.447 E.56481
G1 X178.618 Y68.258 E.02175
G1 X193.762 Y83.401 E.58031
G1 X193.387 Y83.616 E.01172
G1 X177.839 Y68.068 E.59582
G1 X177.059 Y67.879 E.02175
G1 X193.011 Y83.831 E.61133
G1 X192.636 Y84.047 E.01172
G1 X176.279 Y67.689 E.62683
G1 X175.499 Y67.5 E.02175
G1 X192.261 Y84.262 E.64234
G1 X191.886 Y84.477 E.01172
G1 X174.719 Y67.31 E.65784
G1 X173.939 Y67.121 E.02175
G1 X191.51 Y84.692 E.67335
G1 X191.135 Y84.907 E.01172
G1 X173.159 Y66.931 E.68885
G1 X172.379 Y66.742 E.02175
G1 X190.76 Y85.122 E.70436
G1 X190.385 Y85.337 E.01172
G1 X171.6 Y66.552 E.71987
G1 X170.82 Y66.363 E.02175
G1 X190.01 Y85.552 E.73537
G1 X189.634 Y85.768 E.01172
G1 X170.04 Y66.173 E.75088
G1 X169.26 Y65.984 E.02175
G1 X189.259 Y85.983 E.76638
G1 X188.884 Y86.198 E.01172
G1 X168.48 Y65.794 E.78189
G1 X167.7 Y65.605 E.02175
G1 X188.509 Y86.413 E.7974
G1 X188.133 Y86.628 E.01172
G1 X166.92 Y65.415 E.8129
G1 X166.14 Y65.226 E.02175
G1 X187.758 Y86.843 E.82841
G1 X187.383 Y87.058 E.01172
G1 X165.361 Y65.036 E.84391
G1 X164.581 Y64.847 E.02175
G1 X187.008 Y87.273 E.85942
G1 X186.632 Y87.489 E.01172
G1 X163.801 Y64.657 E.87493
G1 X163.021 Y64.468 E.02175
G1 X186.257 Y87.704 E.89043
G1 X185.882 Y87.919 E.01172
G1 X162.241 Y64.278 E.90594
G1 X161.461 Y64.089 E.02175
G1 X185.507 Y88.134 E.92144
G1 X185.131 Y88.349 E.01172
G1 X160.681 Y63.899 E.93695
G1 X159.902 Y63.71 E.02175
G1 X184.756 Y88.564 E.95245
G1 X184.381 Y88.779 E.01172
G1 X159.122 Y63.52 E.96796
G1 X158.342 Y63.331 E.02175
G1 X184.006 Y88.994 E.98347
G1 X183.63 Y89.21 E.01172
G1 X157.562 Y63.141 E.99897
G1 X156.782 Y62.952 E.02175
G1 X183.255 Y89.425 E1.01448
G1 X182.88 Y89.64 E.01172
G1 X156.002 Y62.762 E1.02998
G1 X155.222 Y62.572 E.02175
G1 X182.505 Y89.855 E1.04549
G1 X182.129 Y90.07 E.01172
G1 X154.442 Y62.383 E1.061
G1 X153.663 Y62.193 E.02175
G1 X181.754 Y90.285 E1.0765
G1 X181.379 Y90.5 E.01172
G1 X152.883 Y62.004 E1.09201
G1 X152.103 Y61.814 E.02175
G1 X181.004 Y90.715 E1.10751
G1 X180.628 Y90.93 E.01172
G1 X151.323 Y61.625 E1.12302
G1 X150.543 Y61.435 E.02175
G1 X180.253 Y91.146 E1.13852
G1 X179.878 Y91.361 E.01172
G1 X149.763 Y61.246 E1.15403
G1 X148.983 Y61.056 E.02175
G1 X179.503 Y91.576 E1.16954
G1 X179.127 Y91.791 E.01172
G1 X148.203 Y60.867 E1.18504
G1 X147.424 Y60.677 E.02175
G1 X178.752 Y92.006 E1.20055
G1 X178.377 Y92.221 E.01172
G1 X146.644 Y60.488 E1.21605
G1 X145.864 Y60.298 E.02175
G1 X178.002 Y92.436 E1.23156
G1 X177.627 Y92.651 E.01172
G1 X145.084 Y60.109 E1.24707
G1 X144.304 Y59.919 E.02175
G1 X177.251 Y92.867 E1.26257
G1 X176.876 Y93.082 E.01172
G1 X143.524 Y59.73 E1.27808
G1 X142.744 Y59.54 E.02175
G1 X176.501 Y93.297 E1.29358
G1 X176.126 Y93.512 E.01172
G1 X141.964 Y59.351 E1.30909
G1 X141.185 Y59.161 E.02175
G1 X175.75 Y93.727 E1.32459
G1 X175.375 Y93.942 E.01172
G1 X140.405 Y58.972 E1.3401
G1 X139.625 Y58.782 E.02175
G1 X175 Y94.157 E1.35561
G1 X174.625 Y94.372 E.01172
G1 X138.845 Y58.593 E1.37111
G1 X138.065 Y58.403 E.02175
G1 X174.249 Y94.588 E1.38662
G1 X173.874 Y94.803 E.01172
G1 X137.285 Y58.214 E1.40212
G1 X136.505 Y58.024 E.02175
G1 X173.499 Y95.018 E1.41763
G1 X173.124 Y95.233 E.01172
G1 X135.725 Y57.835 E1.43314
G1 X134.946 Y57.645 E.02175
G1 X172.748 Y95.448 E1.44864
G1 X172.373 Y95.663 E.01172
G1 X134.166 Y57.456 E1.46415
G1 X133.386 Y57.266 E.02175
G1 X171.998 Y95.878 E1.47965
G1 X171.623 Y96.093 E.01172
G1 X132.606 Y57.077 E1.49516
G1 X132.366 Y57.018 E.00669
G1 X132.374 Y57.436 E.0113
G1 X171.247 Y96.309 E1.48965
G1 X170.872 Y96.524 E.01172
G1 X132.386 Y58.038 E1.47481
G1 X132.399 Y58.64 E.01633
G1 X170.497 Y96.739 E1.45997
G1 X170.122 Y96.954 E.01172
G1 X132.411 Y59.243 E1.44513
G1 X132.423 Y59.845 E.01633
G1 X169.746 Y97.169 E1.43028
G1 X169.371 Y97.384 E.01172
G1 X132.435 Y60.448 E1.41544
G1 X132.447 Y61.05 E.01633
G1 X168.996 Y97.599 E1.4006
G1 X168.621 Y97.814 E.01172
G1 X132.459 Y61.652 E1.38576
G1 X132.471 Y62.255 E.01633
G1 X168.245 Y98.029 E1.37092
G1 X167.87 Y98.245 E.01172
M73 P50 R35
G1 X132.483 Y62.857 E1.35608
G1 X132.495 Y63.46 E.01633
G1 X167.495 Y98.46 E1.34124
G1 X167.12 Y98.675 E.01172
G1 X132.507 Y64.062 E1.32639
G1 X132.519 Y64.665 E.01633
G1 X166.744 Y98.89 E1.31155
G1 X166.369 Y99.105 E.01172
G1 X132.531 Y65.267 E1.29671
G1 X132.543 Y65.869 E.01633
G1 X165.994 Y99.32 E1.28187
G1 X165.619 Y99.535 E.01172
G1 X132.555 Y66.472 E1.26703
G1 X132.567 Y67.074 E.01633
G1 X165.244 Y99.75 E1.25219
G1 X164.868 Y99.966 E.01172
G1 X132.579 Y67.677 E1.23734
G1 X132.591 Y68.279 E.01633
G1 X164.493 Y100.181 E1.2225
G1 X164.118 Y100.396 E.01172
G1 X132.603 Y68.881 E1.20766
G1 X132.616 Y69.484 E.01633
G1 X163.743 Y100.611 E1.19282
G1 X163.367 Y100.826 E.01172
G1 X132.628 Y70.086 E1.17798
G1 X132.64 Y70.689 E.01633
G1 X162.992 Y101.041 E1.16314
G1 X162.617 Y101.256 E.01172
G1 X132.652 Y71.291 E1.14829
G1 X132.664 Y71.894 E.01633
G1 X162.242 Y101.471 E1.13345
G1 X161.866 Y101.687 E.01172
G1 X132.676 Y72.496 E1.11861
G1 X132.688 Y73.098 E.01633
G1 X161.491 Y101.902 E1.10377
G1 X161.116 Y102.117 E.01172
G1 X132.7 Y73.701 E1.08893
G1 X132.712 Y74.303 E.01633
G1 X160.741 Y102.332 E1.07409
G1 X160.365 Y102.547 E.01172
G1 X132.724 Y74.906 E1.05925
G1 X132.736 Y75.508 E.01633
G1 X159.99 Y102.762 E1.0444
M73 P50 R34
G1 X159.615 Y102.977 E.01172
G1 X132.748 Y76.11 E1.02956
G1 X132.76 Y76.713 E.01633
G1 X159.24 Y103.192 E1.01472
G1 X158.864 Y103.408 E.01172
G1 X132.772 Y77.315 E.99988
G1 X132.784 Y77.918 E.01633
G1 X158.489 Y103.623 E.98504
G1 X158.114 Y103.838 E.01172
G1 X132.796 Y78.52 E.9702
G1 X132.808 Y79.123 E.01633
G1 X157.739 Y104.053 E.95535
G1 X157.363 Y104.268 E.01172
G1 X132.82 Y79.725 E.94051
G1 X132.832 Y80.327 E.01633
G1 X156.988 Y104.483 E.92567
G1 X156.613 Y104.698 E.01172
G1 X132.845 Y80.93 E.91083
G1 X132.857 Y81.532 E.01633
G1 X156.238 Y104.913 E.89599
G1 X155.862 Y105.128 E.01172
G1 X132.869 Y82.135 E.88115
G1 X132.881 Y82.737 E.01633
G1 X155.487 Y105.344 E.8663
G1 X155.112 Y105.559 E.01172
G1 X132.893 Y83.339 E.85146
G1 X132.905 Y83.942 E.01633
G1 X154.737 Y105.774 E.83662
G1 X154.361 Y105.989 E.01172
G1 X132.917 Y84.544 E.82178
G1 X132.929 Y85.147 E.01633
G1 X153.986 Y106.204 E.80694
G1 X153.611 Y106.419 E.01172
G1 X132.941 Y85.749 E.7921
G1 X132.953 Y86.352 E.01633
G1 X153.236 Y106.634 E.77725
G1 X152.861 Y106.849 E.01172
G1 X132.965 Y86.954 E.76241
G1 X132.977 Y87.556 E.01633
G1 X152.485 Y107.065 E.74757
G1 X152.11 Y107.28 E.01172
G1 X132.989 Y88.159 E.73273
G1 X133.001 Y88.761 E.01633
G1 X151.735 Y107.495 E.71789
G1 X151.36 Y107.71 E.01172
G1 X133.013 Y89.364 E.70305
G1 X133.025 Y89.966 E.01633
G1 X150.984 Y107.925 E.68821
G1 X150.609 Y108.14 E.01172
G1 X133.037 Y90.569 E.67336
G1 X133.049 Y91.171 E.01633
G1 X150.234 Y108.355 E.65852
G1 X149.859 Y108.57 E.01172
G1 X133.062 Y91.773 E.64368
G1 X133.074 Y92.376 E.01633
G1 X149.483 Y108.786 E.62884
G1 X149.108 Y109.001 E.01172
G1 X133.086 Y92.978 E.614
G1 X133.098 Y93.581 E.01633
G1 X148.733 Y109.216 E.59916
G1 X148.358 Y109.431 E.01172
G1 X133.11 Y94.183 E.58431
G1 X133.122 Y94.785 E.01633
G1 X147.982 Y109.646 E.56947
G1 X147.607 Y109.861 E.01172
G1 X133.134 Y95.388 E.55463
G1 X133.146 Y95.99 E.01633
G1 X147.232 Y110.076 E.53979
G1 X146.857 Y110.291 E.01172
G1 X133.158 Y96.593 E.52495
G1 X133.17 Y97.195 E.01633
G1 X146.481 Y110.506 E.51011
G1 X146.106 Y110.722 E.01172
G1 X133.182 Y97.798 E.49526
G1 X133.194 Y98.4 E.01633
G1 X145.727 Y110.932 E.48026
G1 X145.561 Y110.932 E.00448
G1 X144.555 Y110.351 E.03149
G1 X133.206 Y99.002 E.43489
G1 X133.218 Y99.605 E.01633
G1 X143.158 Y109.545 E.3809
G1 X141.761 Y108.738 E.04371
G1 X133.23 Y100.207 E.32691
G1 X133.242 Y100.81 E.01633
G1 X140.364 Y107.932 E.27292
G1 X138.968 Y107.125 E.04371
G1 X133.254 Y101.412 E.21893
G1 X133.266 Y102.014 E.01633
G1 X137.571 Y106.319 E.16495
G1 X136.174 Y105.512 E.04371
G1 X133.278 Y102.617 E.11096
G1 X133.291 Y103.219 E.01633
G1 X135.288 Y105.217 E.07655
; OBJECT_ID: 353
; WIPE_START
G1 X133.874 Y103.803 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 325
M625
; start printing object, unique label id: 353
M624 AgAAAAAAAAA=
M204 S10000
G1 X139.744 Y108.681 Z1.56 F30000
G1 X215.595 Y171.729 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X149.657 Y133.927 E2.05953
G1 X149.474 Y133.612 E.00986
G1 X149.474 Y118.388 E.41253
G1 X149.657 Y118.073 E.00986
G1 X215.595 Y80.271 E2.05953
G1 X215.595 Y171.669 E2.4766
M204 S10000
G1 X215.996 Y172.261 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X215.858 Y172.341 E.004
G1 X149.364 Y134.221 E1.92699
G1 X149.073 Y133.72 E.01457
G1 X149.073 Y118.28 E.38817
G1 X149.364 Y117.779 E.01457
G1 X215.858 Y79.659 E1.92699
G1 X215.996 Y79.739 E.004
G1 X215.996 Y172.201 E2.32465
; WIPE_START
M204 S4000
G1 X215.858 Y172.341 E-.07455
G1 X214.293 Y171.444 E-.68545
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X215.239 Y171.33 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X215.239 Y80.885 E2.45079
G1 X214.823 Y81.124 E.01301
G1 X214.823 Y170.876 E2.43201
G1 X214.406 Y170.637 E.01301
G1 X214.406 Y81.363 E2.41906
G1 X213.989 Y81.602 E.01301
G1 X213.989 Y170.398 E2.40612
G1 X213.573 Y170.159 E.01301
G1 X213.573 Y81.841 E2.39318
G1 X213.156 Y82.079 E.01301
G1 X213.156 Y169.92 E2.38023
G1 X212.74 Y169.682 E.01301
G1 X212.74 Y82.318 E2.36729
G1 X212.323 Y82.557 E.01301
G1 X212.323 Y169.443 E2.35435
G1 X211.906 Y169.204 E.01301
G1 X211.906 Y82.796 E2.3414
G1 X211.49 Y83.035 E.01301
G1 X211.49 Y168.965 E2.32846
G1 X211.073 Y168.726 E.01301
G1 X211.073 Y83.274 E2.31552
G1 X210.656 Y83.512 E.01301
G1 X210.656 Y168.487 E2.30257
G1 X210.24 Y168.249 E.01301
G1 X210.24 Y83.751 E2.28963
G1 X209.823 Y83.99 E.01301
G1 X209.823 Y168.01 E2.27669
G1 X209.407 Y167.771 E.01301
G1 X209.407 Y84.229 E2.26374
G1 X208.99 Y84.468 E.01301
G1 X208.99 Y167.532 E2.2508
G1 X208.573 Y167.293 E.01301
G1 X208.573 Y84.707 E2.23785
G1 X208.157 Y84.946 E.01301
G1 X208.157 Y167.054 E2.22491
G1 X207.74 Y166.816 E.01301
G1 X207.74 Y85.184 E2.21197
G1 X207.324 Y85.423 E.01301
G1 X207.324 Y166.577 E2.19902
G1 X206.907 Y166.338 E.01301
G1 X206.907 Y85.662 E2.18608
G1 X206.49 Y85.901 E.01301
G1 X206.49 Y166.099 E2.17314
G1 X206.074 Y165.86 E.01301
G1 X206.074 Y86.14 E2.16019
G1 X205.657 Y86.379 E.01301
G1 X205.657 Y165.621 E2.14725
G1 X205.241 Y165.383 E.01301
G1 X205.241 Y86.617 E2.13431
G1 X204.824 Y86.856 E.01301
G1 X204.824 Y165.144 E2.12136
G1 X204.407 Y164.905 E.01301
G1 X204.407 Y87.095 E2.10842
G1 X203.991 Y87.334 E.01301
G1 X203.991 Y164.666 E2.09548
G1 X203.574 Y164.427 E.01301
G1 X203.574 Y87.573 E2.08253
G1 X203.157 Y87.812 E.01301
G1 X203.157 Y164.188 E2.06959
G1 X202.741 Y163.95 E.01301
G1 X202.741 Y88.05 E2.05664
G1 X202.324 Y88.289 E.01301
G1 X202.324 Y163.711 E2.0437
G1 X201.908 Y163.472 E.01301
G1 X201.908 Y88.528 E2.03076
G1 X201.491 Y88.767 E.01301
G1 X201.491 Y163.233 E2.01781
G1 X201.074 Y162.994 E.01301
G1 X201.074 Y89.006 E2.00487
G1 X200.658 Y89.245 E.01301
G1 X200.658 Y162.755 E1.99193
G1 X200.241 Y162.517 E.01301
G1 X200.241 Y89.483 E1.97898
G1 X199.825 Y89.722 E.01301
G1 X199.825 Y162.278 E1.96604
G1 X199.408 Y162.039 E.01301
G1 X199.408 Y89.961 E1.9531
G1 X198.991 Y90.2 E.01301
G1 X198.991 Y161.8 E1.94015
G1 X198.575 Y161.561 E.01301
G1 X198.575 Y90.439 E1.92721
G1 X198.158 Y90.678 E.01301
G1 X198.158 Y161.322 E1.91427
G1 X197.742 Y161.084 E.01301
G1 X197.742 Y90.916 E1.90132
G1 X197.325 Y91.155 E.01301
G1 X197.325 Y160.845 E1.88838
G1 X196.908 Y160.606 E.01301
G1 X196.908 Y91.394 E1.87544
G1 X196.492 Y91.633 E.01301
G1 X196.492 Y160.367 E1.86249
G1 X196.075 Y160.128 E.01301
G1 X196.075 Y91.872 E1.84955
G1 X195.659 Y92.111 E.01301
G1 X195.659 Y159.889 E1.8366
G1 X195.242 Y159.651 E.01301
G1 X195.242 Y92.349 E1.82366
G1 X194.825 Y92.588 E.01301
G1 X194.825 Y159.412 E1.81072
G1 X194.409 Y159.173 E.01301
G1 X194.409 Y92.827 E1.79777
M73 P51 R34
G1 X193.992 Y93.066 E.01301
G1 X193.992 Y158.934 E1.78483
G1 X193.575 Y158.695 E.01301
G1 X193.575 Y93.305 E1.77189
G1 X193.159 Y93.544 E.01301
G1 X193.159 Y158.456 E1.75894
G1 X192.742 Y158.217 E.01301
G1 X192.742 Y93.782 E1.746
G1 X192.326 Y94.021 E.01301
G1 X192.326 Y157.979 E1.73306
G1 X191.909 Y157.74 E.01301
G1 X191.909 Y94.26 E1.72011
G1 X191.492 Y94.499 E.01301
G1 X191.492 Y157.501 E1.70717
G1 X191.076 Y157.262 E.01301
G1 X191.076 Y94.738 E1.69423
G1 X190.659 Y94.977 E.01301
G1 X190.659 Y157.023 E1.68128
G1 X190.243 Y156.784 E.01301
G1 X190.243 Y95.215 E1.66834
G1 X189.826 Y95.454 E.01301
G1 X189.826 Y156.546 E1.6554
G1 X189.409 Y156.307 E.01301
G1 X189.409 Y95.693 E1.64245
G1 X188.993 Y95.932 E.01301
G1 X188.993 Y156.068 E1.62951
G1 X188.576 Y155.829 E.01301
G1 X188.576 Y96.171 E1.61656
G1 X188.16 Y96.41 E.01301
G1 X188.16 Y155.59 E1.60362
G1 X187.743 Y155.351 E.01301
G1 X187.743 Y96.649 E1.59068
G1 X187.326 Y96.887 E.01301
G1 X187.326 Y155.113 E1.57773
G1 X186.91 Y154.874 E.01301
G1 X186.91 Y97.126 E1.56479
G1 X186.493 Y97.365 E.01301
G1 X186.493 Y154.635 E1.55185
G1 X186.076 Y154.396 E.01301
G1 X186.076 Y97.604 E1.5389
G1 X185.66 Y97.843 E.01301
G1 X185.66 Y154.157 E1.52596
G1 X185.243 Y153.918 E.01301
G1 X185.243 Y98.082 E1.51302
G1 X184.827 Y98.32 E.01301
G1 X184.827 Y153.68 E1.50007
G1 X184.41 Y153.441 E.01301
G1 X184.41 Y98.559 E1.48713
G1 X183.993 Y98.798 E.01301
G1 X183.993 Y153.202 E1.47419
G1 X183.577 Y152.963 E.01301
G1 X183.577 Y99.037 E1.46124
G1 X183.16 Y99.276 E.01301
G1 X183.16 Y152.724 E1.4483
G1 X182.744 Y152.485 E.01301
G1 X182.744 Y99.515 E1.43535
G1 X182.327 Y99.753 E.01301
G1 X182.327 Y152.247 E1.42241
G1 X181.91 Y152.008 E.01301
G1 X181.91 Y99.992 E1.40947
G1 X181.494 Y100.231 E.01301
G1 X181.494 Y151.769 E1.39652
G1 X181.077 Y151.53 E.01301
G1 X181.077 Y100.47 E1.38358
G1 X180.661 Y100.709 E.01301
G1 X180.661 Y151.291 E1.37064
G1 X180.244 Y151.052 E.01301
G1 X180.244 Y100.948 E1.35769
G1 X179.827 Y101.186 E.01301
G1 X179.827 Y150.814 E1.34475
G1 X179.411 Y150.575 E.01301
G1 X179.411 Y101.425 E1.33181
G1 X178.994 Y101.664 E.01301
G1 X178.994 Y150.336 E1.31886
G1 X178.577 Y150.097 E.01301
G1 X178.577 Y101.903 E1.30592
G1 X178.161 Y102.142 E.01301
G1 X178.161 Y149.858 E1.29298
G1 X177.744 Y149.619 E.01301
G1 X177.744 Y102.381 E1.28003
G1 X177.328 Y102.619 E.01301
G1 X177.328 Y149.381 E1.26709
G1 X176.911 Y149.142 E.01301
G1 X176.911 Y102.858 E1.25414
G1 X176.494 Y103.097 E.01301
G1 X176.494 Y148.903 E1.2412
G1 X176.078 Y148.664 E.01301
G1 X176.078 Y103.336 E1.22826
G1 X175.661 Y103.575 E.01301
G1 X175.661 Y148.425 E1.21531
G1 X175.245 Y148.186 E.01301
G1 X175.245 Y103.814 E1.20237
G1 X174.828 Y104.052 E.01301
G1 X174.828 Y147.948 E1.18943
G1 X174.411 Y147.709 E.01301
G1 X174.411 Y104.291 E1.17648
G1 X173.995 Y104.53 E.01301
G1 X173.995 Y147.47 E1.16354
G1 X173.578 Y147.231 E.01301
G1 X173.578 Y104.769 E1.1506
G1 X173.162 Y105.008 E.01301
G1 X173.162 Y146.992 E1.13765
G1 X172.745 Y146.753 E.01301
G1 X172.745 Y105.247 E1.12471
G1 X172.328 Y105.485 E.01301
G1 X172.328 Y146.515 E1.11177
G1 X171.912 Y146.276 E.01301
G1 X171.912 Y105.724 E1.09882
G1 X171.495 Y105.963 E.01301
G1 X171.495 Y146.037 E1.08588
G1 X171.079 Y145.798 E.01301
G1 X171.079 Y106.202 E1.07294
G1 X170.662 Y106.441 E.01301
G1 X170.662 Y145.559 E1.05999
G1 X170.245 Y145.32 E.01301
G1 X170.245 Y106.68 E1.04705
G1 X169.829 Y106.918 E.01301
G1 X169.829 Y145.081 E1.0341
G1 X169.412 Y144.843 E.01301
G1 X169.412 Y107.157 E1.02116
G1 X168.995 Y107.396 E.01301
G1 X168.995 Y144.604 E1.00822
G1 X168.579 Y144.365 E.01301
G1 X168.579 Y107.635 E.99527
G1 X168.162 Y107.874 E.01301
G1 X168.162 Y144.126 E.98233
G1 X167.746 Y143.887 E.01301
G1 X167.746 Y108.113 E.96939
G1 X167.329 Y108.352 E.01301
G1 X167.329 Y143.648 E.95644
G1 X166.912 Y143.41 E.01301
G1 X166.912 Y108.59 E.9435
M73 P51 R33
G1 X166.496 Y108.829 E.01301
G1 X166.496 Y143.171 E.93056
G1 X166.079 Y142.932 E.01301
G1 X166.079 Y109.068 E.91761
G1 X165.663 Y109.307 E.01301
G1 X165.663 Y142.693 E.90467
G1 X165.246 Y142.454 E.01301
G1 X165.246 Y109.546 E.89173
G1 X164.829 Y109.785 E.01301
G1 X164.829 Y142.215 E.87878
G1 X164.413 Y141.977 E.01301
G1 X164.413 Y110.023 E.86584
G1 X163.996 Y110.262 E.01301
G1 X163.996 Y141.738 E.85289
G1 X163.58 Y141.499 E.01301
G1 X163.58 Y110.501 E.83995
G1 X163.163 Y110.74 E.01301
G1 X163.163 Y141.26 E.82701
G1 X162.746 Y141.021 E.01301
G1 X162.746 Y110.979 E.81406
G1 X162.33 Y111.218 E.01301
G1 X162.33 Y140.782 E.80112
G1 X161.913 Y140.544 E.01301
G1 X161.913 Y111.456 E.78818
G1 X161.496 Y111.695 E.01301
G1 X161.496 Y140.305 E.77523
G1 X161.08 Y140.066 E.01301
G1 X161.08 Y111.934 E.76229
G1 X160.663 Y112.173 E.01301
G1 X160.663 Y139.827 E.74935
G1 X160.247 Y139.588 E.01301
G1 X160.247 Y112.412 E.7364
G1 X159.83 Y112.651 E.01301
G1 X159.83 Y139.349 E.72346
G1 X159.413 Y139.111 E.01301
G1 X159.413 Y112.889 E.71052
G1 X158.997 Y113.128 E.01301
G1 X158.997 Y138.872 E.69757
G1 X158.58 Y138.633 E.01301
G1 X158.58 Y113.367 E.68463
G1 X158.164 Y113.606 E.01301
G1 X158.164 Y138.394 E.67169
G1 X157.747 Y138.155 E.01301
G1 X157.747 Y113.845 E.65874
G1 X157.33 Y114.084 E.01301
G1 X157.33 Y137.916 E.6458
G1 X156.914 Y137.678 E.01301
G1 X156.914 Y114.322 E.63285
G1 X156.497 Y114.561 E.01301
G1 X156.497 Y137.439 E.61991
G1 X156.081 Y137.2 E.01301
G1 X156.081 Y114.8 E.60697
G1 X155.664 Y115.039 E.01301
G1 X155.664 Y136.961 E.59402
G1 X155.247 Y136.722 E.01301
G1 X155.247 Y115.278 E.58108
G1 X154.831 Y115.517 E.01301
G1 X154.831 Y136.483 E.56814
G1 X154.414 Y136.245 E.01301
G1 X154.414 Y115.755 E.55519
G1 X153.998 Y115.994 E.01301
G1 X153.998 Y136.006 E.54225
G1 X153.581 Y135.767 E.01301
G1 X153.581 Y116.233 E.52931
G1 X153.164 Y116.472 E.01301
G1 X153.164 Y135.528 E.51636
G1 X152.748 Y135.289 E.01301
G1 X152.748 Y116.711 E.50342
G1 X152.331 Y116.95 E.01301
G1 X152.331 Y135.05 E.49048
G1 X151.914 Y134.812 E.01301
G1 X151.914 Y117.188 E.47753
G1 X151.498 Y117.427 E.01301
G1 X151.498 Y134.573 E.46459
G1 X151.081 Y134.334 E.01301
G1 X151.081 Y117.666 E.45164
G1 X150.665 Y117.905 E.01301
G1 X150.665 Y134.095 E.4387
G1 X150.248 Y133.856 E.01301
G1 X150.248 Y118.144 E.42576
G2 X149.831 Y118.481 I.082 J.528 E.01521
G1 X149.831 Y133.833 E.416
; OBJECT_ID: 381
; WIPE_START
G1 X149.831 Y131.833 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 353
M625
; start printing object, unique label id: 381
M624 BAAAAAAAAAA=
M204 S10000
G1 X155.9 Y136.462 Z1.56 F30000
G1 X208.756 Y176.785 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X132.001 Y195.436 E2.14036
G1 X132.947 Y148.153 E1.28149
G1 X133.139 Y147.829 E.01019
G1 X145.466 Y140.712 E.3857
G1 X145.833 Y140.712 E.00995
G1 X208.704 Y176.755 E1.96372
; WIPE_START
G1 X206.761 Y177.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.813 Y176.929 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X131.814 Y195.894 E2.01813
G1 X131.595 Y195.718 E.00708
G1 X132.549 Y148.04 E1.19892
G1 X132.847 Y147.535 E.01475
G1 X145.358 Y140.312 E.3632
G1 X145.939 Y140.311 E.01461
G1 X209.761 Y176.899 E1.84954
; WIPE_START
M204 S4000
G1 X207.818 Y177.373 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.22 Y176.985 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.646 Y176.558 E.01634
G1 X207.271 Y176.343 E.01172
G1 X206.694 Y176.92 E.0221
G1 X205.914 Y177.109 E.02175
G1 X206.896 Y176.128 E.03761
G1 X206.52 Y175.913 E.01172
G1 X205.134 Y177.299 E.05312
G1 X204.354 Y177.488 E.02175
G1 X206.145 Y175.698 E.06862
G1 X205.77 Y175.483 E.01172
G1 X203.575 Y177.678 E.08413
G1 X202.795 Y177.868 E.02175
G1 X205.395 Y175.268 E.09963
G1 X205.019 Y175.052 E.01172
G1 X202.015 Y178.057 E.11514
G1 X201.235 Y178.247 E.02175
G1 X204.644 Y174.837 E.13064
G1 X204.269 Y174.622 E.01172
G1 X200.455 Y178.436 E.14615
G1 X199.675 Y178.626 E.02175
G1 X203.894 Y174.407 E.16166
G1 X203.518 Y174.192 E.01172
G1 X198.895 Y178.815 E.17716
G1 X198.116 Y179.005 E.02175
G1 X203.143 Y173.977 E.19267
G1 X202.768 Y173.762 E.01172
G1 X197.336 Y179.194 E.20817
G1 X196.556 Y179.384 E.02175
G1 X202.393 Y173.547 E.22368
G1 X202.018 Y173.331 E.01172
G1 X195.776 Y179.573 E.23919
G1 X194.996 Y179.763 E.02175
G1 X201.642 Y173.116 E.25469
G1 X201.267 Y172.901 E.01172
G1 X194.216 Y179.952 E.2702
G1 X193.436 Y180.142 E.02175
G1 X200.892 Y172.686 E.2857
G1 X200.517 Y172.471 E.01172
M73 P52 R33
G1 X192.656 Y180.331 E.30121
G1 X191.877 Y180.521 E.02175
G1 X200.141 Y172.256 E.31671
G1 X199.766 Y172.041 E.01172
G1 X191.097 Y180.71 E.33222
G1 X190.317 Y180.9 E.02175
G1 X199.391 Y171.826 E.34773
G1 X199.016 Y171.61 E.01172
G1 X189.537 Y181.089 E.36323
G1 X188.757 Y181.279 E.02175
G1 X198.64 Y171.395 E.37874
G1 X198.265 Y171.18 E.01172
G1 X187.977 Y181.468 E.39424
G1 X187.197 Y181.658 E.02175
G1 X197.89 Y170.965 E.40975
G1 X197.515 Y170.75 E.01172
G1 X186.417 Y181.847 E.42526
G1 X185.638 Y182.037 E.02175
G1 X197.139 Y170.535 E.44076
G1 X196.764 Y170.32 E.01172
G1 X184.858 Y182.226 E.45627
G1 X184.078 Y182.416 E.02175
G1 X196.389 Y170.105 E.47177
G1 X196.014 Y169.89 E.01172
G1 X183.298 Y182.605 E.48728
G1 X182.518 Y182.795 E.02175
G1 X195.638 Y169.674 E.50279
G1 X195.263 Y169.459 E.01172
G1 X181.738 Y182.984 E.51829
G1 X180.958 Y183.174 E.02175
G1 X194.888 Y169.244 E.5338
G1 X194.513 Y169.029 E.01172
G1 X180.178 Y183.363 E.5493
G1 X179.399 Y183.553 E.02175
G1 X194.137 Y168.814 E.56481
G1 X193.762 Y168.599 E.01172
G1 X178.619 Y183.742 E.58031
G1 X177.839 Y183.932 E.02175
G1 X193.387 Y168.384 E.59582
G1 X193.012 Y168.169 E.01172
G1 X177.059 Y184.121 E.61133
G1 X176.279 Y184.311 E.02175
G1 X192.636 Y167.953 E.62683
G1 X192.261 Y167.738 E.01172
G1 X175.499 Y184.5 E.64234
G1 X174.719 Y184.69 E.02175
G1 X191.886 Y167.523 E.65784
G1 X191.511 Y167.308 E.01172
G1 X173.939 Y184.879 E.67335
G1 X173.16 Y185.069 E.02175
G1 X191.135 Y167.093 E.68886
G1 X190.76 Y166.878 E.01172
G1 X172.38 Y185.258 E.70436
G1 X171.6 Y185.448 E.02175
G1 X190.385 Y166.663 E.71987
G1 X190.01 Y166.448 E.01172
G1 X170.82 Y185.637 E.73537
G1 X170.04 Y185.827 E.02175
G1 X189.635 Y166.232 E.75088
G1 X189.259 Y166.017 E.01172
G1 X169.26 Y186.016 E.76638
G1 X168.48 Y186.206 E.02175
G1 X188.884 Y165.802 E.78189
G1 X188.509 Y165.587 E.01172
G1 X167.7 Y186.395 E.7974
G1 X166.921 Y186.585 E.02175
G1 X188.134 Y165.372 E.8129
G1 X187.758 Y165.157 E.01172
G1 X166.141 Y186.774 E.82841
G1 X165.361 Y186.964 E.02175
G1 X187.383 Y164.942 E.84391
G1 X187.008 Y164.727 E.01172
G1 X164.581 Y187.153 E.85942
G1 X163.801 Y187.343 E.02175
G1 X186.633 Y164.511 E.87493
G1 X186.257 Y164.296 E.01172
G1 X163.021 Y187.532 E.89043
G1 X162.241 Y187.722 E.02175
G1 X185.882 Y164.081 E.90594
G1 X185.507 Y163.866 E.01172
G1 X161.461 Y187.911 E.92144
G1 X160.682 Y188.101 E.02175
G1 X185.132 Y163.651 E.93695
G1 X184.756 Y163.436 E.01172
G1 X159.902 Y188.291 E.95245
G1 X159.122 Y188.48 E.02175
G1 X184.381 Y163.221 E.96796
G1 X184.006 Y163.006 E.01172
G1 X158.342 Y188.67 E.98347
G1 X157.562 Y188.859 E.02175
G1 X183.631 Y162.791 E.99897
G1 X183.255 Y162.575 E.01172
G1 X156.782 Y189.049 E1.01448
G1 X156.002 Y189.238 E.02175
G1 X182.88 Y162.36 E1.02998
G1 X182.505 Y162.145 E.01172
G1 X155.223 Y189.428 E1.04549
G1 X154.443 Y189.617 E.02175
G1 X182.13 Y161.93 E1.061
G1 X181.754 Y161.715 E.01172
G1 X153.663 Y189.807 E1.0765
G1 X152.883 Y189.996 E.02175
G1 X181.379 Y161.5 E1.09201
G1 X181.004 Y161.285 E.01172
G1 X152.103 Y190.186 E1.10751
G1 X151.323 Y190.375 E.02175
G1 X180.629 Y161.07 E1.12302
G1 X180.253 Y160.854 E.01172
G1 X150.543 Y190.565 E1.13853
G1 X149.763 Y190.754 E.02175
G1 X179.878 Y160.639 E1.15403
G1 X179.503 Y160.424 E.01172
G1 X148.984 Y190.944 E1.16954
G1 X148.204 Y191.133 E.02175
G1 X179.128 Y160.209 E1.18504
G1 X178.752 Y159.994 E.01172
G1 X147.424 Y191.323 E1.20055
G1 X146.644 Y191.512 E.02175
G1 X178.377 Y159.779 E1.21605
G1 X178.002 Y159.564 E.01172
G1 X145.864 Y191.702 E1.23156
G1 X145.084 Y191.891 E.02175
G1 X177.627 Y159.349 E1.24707
G1 X177.252 Y159.133 E.01172
G1 X144.304 Y192.081 E1.26257
G1 X143.524 Y192.27 E.02175
G1 X176.876 Y158.918 E1.27808
G1 X176.501 Y158.703 E.01172
G1 X142.745 Y192.46 E1.29358
G1 X141.965 Y192.649 E.02175
G1 X176.126 Y158.488 E1.30909
G1 X175.751 Y158.273 E.01172
G1 X141.185 Y192.839 E1.3246
G1 X140.405 Y193.028 E.02175
G1 X175.375 Y158.058 E1.3401
G1 X175 Y157.843 E.01172
G1 X139.625 Y193.218 E1.35561
G1 X138.845 Y193.407 E.02175
G1 X174.625 Y157.628 E1.37111
G1 X174.25 Y157.413 E.01172
G1 X138.065 Y193.597 E1.38662
G1 X137.285 Y193.786 E.02175
G1 X173.874 Y157.197 E1.40212
G1 X173.499 Y156.982 E.01172
G1 X136.506 Y193.976 E1.41763
G1 X135.726 Y194.165 E.02175
G1 X173.124 Y156.767 E1.43314
G1 X172.749 Y156.552 E.01172
G1 X134.946 Y194.355 E1.44864
G1 X134.166 Y194.544 E.02175
G1 X172.373 Y156.337 E1.46415
G1 X171.998 Y156.122 E.01172
G1 X133.386 Y194.734 E1.47965
G1 X132.606 Y194.923 E.02175
G1 X171.623 Y155.907 E1.49516
G1 X171.248 Y155.692 E.01172
G1 X132.374 Y194.565 E1.48967
G1 X132.386 Y193.962 E.01633
G1 X170.872 Y155.476 E1.47482
G1 X170.497 Y155.261 E.01172
G1 X132.398 Y193.36 E1.45998
G1 X132.41 Y192.758 E.01633
G1 X170.122 Y155.046 E1.44514
G1 X169.747 Y154.831 E.01172
G1 X132.423 Y192.155 E1.4303
G1 X132.435 Y191.553 E.01633
G1 X169.371 Y154.616 E1.41546
G1 X168.996 Y154.401 E.01172
G1 X132.447 Y190.95 E1.40062
G1 X132.459 Y190.348 E.01633
G1 X168.621 Y154.186 E1.38577
G1 X168.246 Y153.971 E.01172
G1 X132.471 Y189.745 E1.37093
G1 X132.483 Y189.143 E.01633
G1 X167.87 Y153.755 E1.35609
G1 X167.495 Y153.54 E.01172
G1 X132.495 Y188.541 E1.34125
G1 X132.507 Y187.938 E.01633
G1 X167.12 Y153.325 E1.32641
G1 X166.745 Y153.11 E.01172
G1 X132.519 Y187.336 E1.31157
G1 X132.531 Y186.733 E.01633
G1 X166.369 Y152.895 E1.29672
G1 X165.994 Y152.68 E.01172
G1 X132.543 Y186.131 E1.28188
G1 X132.555 Y185.529 E.01633
G1 X165.619 Y152.465 E1.26704
G1 X165.244 Y152.25 E.01172
G1 X132.567 Y184.926 E1.2522
G1 X132.579 Y184.324 E.01633
G1 X164.869 Y152.034 E1.23736
G1 X164.493 Y151.819 E.01172
G1 X132.591 Y183.721 E1.22252
G1 X132.603 Y183.119 E.01633
G1 X164.118 Y151.604 E1.20768
G1 X163.743 Y151.389 E.01172
G1 X132.615 Y182.516 E1.19283
G1 X132.627 Y181.914 E.01633
G1 X163.368 Y151.174 E1.17799
G1 X162.992 Y150.959 E.01172
G1 X132.64 Y181.312 E1.16315
G1 X132.652 Y180.709 E.01633
G1 X162.617 Y150.744 E1.14831
G1 X162.242 Y150.529 E.01172
G1 X132.664 Y180.107 E1.13347
G1 X132.676 Y179.504 E.01633
G1 X161.867 Y150.314 E1.11863
G1 X161.491 Y150.098 E.01172
G1 X132.688 Y178.902 E1.10378
G1 X132.7 Y178.3 E.01633
G1 X161.116 Y149.883 E1.08894
G1 X160.741 Y149.668 E.01172
G1 X132.712 Y177.697 E1.0741
G1 X132.724 Y177.095 E.01633
G1 X160.366 Y149.453 E1.05926
G1 X159.99 Y149.238 E.01172
G1 X132.736 Y176.492 E1.04442
G1 X132.748 Y175.89 E.01633
G1 X159.615 Y149.023 E1.02958
G1 X159.24 Y148.808 E.01172
G1 X132.76 Y175.287 E1.01473
G1 X132.772 Y174.685 E.01633
G1 X158.865 Y148.593 E.99989
G1 X158.489 Y148.377 E.01172
G1 X132.784 Y174.083 E.98505
G1 X132.796 Y173.48 E.01633
G1 X158.114 Y148.162 E.97021
G1 X157.739 Y147.947 E.01172
G1 X132.808 Y172.878 E.95537
G1 X132.82 Y172.275 E.01633
G1 X157.364 Y147.732 E.94053
G1 X156.988 Y147.517 E.01172
G1 X132.832 Y171.673 E.92568
G1 X132.844 Y171.071 E.01633
G1 X156.613 Y147.302 E.91084
G1 X156.238 Y147.087 E.01172
G1 X132.856 Y170.468 E.896
G1 X132.869 Y169.866 E.01633
G1 X155.863 Y146.872 E.88116
G1 X155.487 Y146.656 E.01172
G1 X132.881 Y169.263 E.86632
G1 X132.893 Y168.661 E.01633
G1 X155.112 Y146.441 E.85148
G1 X154.737 Y146.226 E.01172
G1 X132.905 Y168.058 E.83664
G1 X132.917 Y167.456 E.01633
G1 X154.362 Y146.011 E.82179
G1 X153.986 Y145.796 E.01172
G1 X132.929 Y166.854 E.80695
G1 X132.941 Y166.251 E.01633
G1 X153.611 Y145.581 E.79211
G1 X153.236 Y145.366 E.01172
G1 X132.953 Y165.649 E.77727
G1 X132.965 Y165.046 E.01633
G1 X152.861 Y145.151 E.76243
G1 X152.486 Y144.935 E.01172
G1 X132.977 Y164.444 E.74759
G1 X132.989 Y163.842 E.01633
G1 X152.11 Y144.72 E.73274
G1 X151.735 Y144.505 E.01172
G1 X133.001 Y163.239 E.7179
G1 X133.013 Y162.637 E.01633
G1 X151.36 Y144.29 E.70306
G1 X150.985 Y144.075 E.01172
G1 X133.025 Y162.034 E.68822
G1 X133.037 Y161.432 E.01633
G1 X150.609 Y143.86 E.67338
G1 X150.234 Y143.645 E.01172
G1 X133.049 Y160.829 E.65854
G1 X133.061 Y160.227 E.01633
G1 X149.859 Y143.43 E.64369
G1 X149.484 Y143.215 E.01172
G1 X133.073 Y159.625 E.62885
G1 X133.086 Y159.022 E.01633
G1 X149.108 Y142.999 E.61401
G1 X148.733 Y142.784 E.01172
G1 X133.098 Y158.42 E.59917
G1 X133.11 Y157.817 E.01633
G1 X148.358 Y142.569 E.58433
G1 X147.983 Y142.354 E.01172
G1 X133.122 Y157.215 E.56949
G1 X133.134 Y156.613 E.01633
G1 X147.607 Y142.139 E.55465
G1 X147.232 Y141.924 E.01172
G1 X133.146 Y156.01 E.5398
G1 X133.158 Y155.408 E.01633
G1 X146.857 Y141.709 E.52496
G1 X146.482 Y141.494 E.01172
G1 X133.17 Y154.805 E.51012
G1 X133.182 Y154.203 E.01633
G1 X146.106 Y141.278 E.49528
G1 X145.727 Y141.068 E.01176
G1 X133.194 Y153.6 E.48027
G1 X133.206 Y152.998 E.01633
G1 X144.556 Y141.648 E.43493
G1 X143.159 Y142.455 E.04371
G1 X133.218 Y152.396 E.38094
G1 X133.23 Y151.793 E.01633
G1 X141.762 Y143.261 E.32695
G1 X140.365 Y144.068 E.0437
G1 X133.242 Y151.191 E.27297
G1 X133.254 Y150.588 E.01633
G1 X138.969 Y144.874 E.21898
G1 X137.572 Y145.681 E.0437
G1 X133.266 Y149.986 E.16499
G1 X133.278 Y149.384 E.01633
G1 X136.175 Y146.487 E.111
G1 X134.778 Y147.293 E.0437
G1 X133.1 Y148.972 E.06432
; OBJECT_ID: 409
; WIPE_START
G1 X134.514 Y147.558 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 381
M625
; start printing object, unique label id: 409
M624 CAAAAAAAAAA=
M204 S10000
G1 X127.276 Y149.982 Z1.56 F30000
G1 X47.244 Y176.785 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X110.167 Y140.712 E1.96535
G1 X110.534 Y140.712 E.00995
G1 X122.861 Y147.829 E.3857
G1 X123.053 Y148.153 E.01019
G1 X123.999 Y195.436 E1.28149
G1 X47.302 Y176.799 E2.13873
; WIPE_START
G1 X49.037 Y175.803 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.188 Y176.941 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X110.061 Y140.311 E1.85116
G1 X110.642 Y140.312 E.01462
G1 X123.153 Y147.535 E.3632
G1 X123.451 Y148.04 E.01475
G1 X124.405 Y195.718 E1.19892
G1 X124.186 Y195.894 E.00708
G1 X46.247 Y176.955 E2.01651
; WIPE_START
M204 S4000
G1 X47.981 Y175.959 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.783 Y176.985 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.355 Y176.558 E.01639
G1 X48.73 Y176.342 E.01172
G1 X49.308 Y176.921 E.02215
G1 X50.088 Y177.11 E.02175
G1 X49.106 Y176.127 E.03766
G1 X49.481 Y175.912 E.01172
G1 X50.868 Y177.3 E.05316
G1 X51.648 Y177.489 E.02175
G1 X49.856 Y175.697 E.06867
G1 X50.231 Y175.482 E.01172
G1 X52.428 Y177.679 E.08418
G1 X53.208 Y177.868 E.02175
G1 X50.606 Y175.267 E.09968
G1 X50.982 Y175.052 E.01172
G1 X53.988 Y178.058 E.11519
G1 X54.767 Y178.247 E.02175
G1 X51.357 Y174.837 E.13069
G1 X51.732 Y174.622 E.01172
G1 X55.547 Y178.437 E.1462
G1 X56.327 Y178.626 E.02175
G1 X52.107 Y174.406 E.1617
G1 X52.483 Y174.191 E.01172
G1 X57.107 Y178.816 E.17721
G1 X57.887 Y179.005 E.02175
G1 X52.858 Y173.976 E.19272
G1 X53.233 Y173.761 E.01172
G1 X58.667 Y179.195 E.20822
G1 X59.447 Y179.384 E.02175
G1 X53.608 Y173.546 E.22373
G1 X53.984 Y173.331 E.01172
G1 X60.227 Y179.574 E.23923
M73 P53 R33
G1 X61.006 Y179.763 E.02175
G1 X54.359 Y173.116 E.25474
G1 X54.734 Y172.901 E.01172
G1 X61.786 Y179.953 E.27025
G1 X62.566 Y180.142 E.02175
G1 X55.109 Y172.685 E.28575
G1 X55.485 Y172.47 E.01172
M73 P53 R32
G1 X63.346 Y180.332 E.30126
G1 X64.126 Y180.521 E.02175
G1 X55.86 Y172.255 E.31676
G1 X56.235 Y172.04 E.01172
G1 X64.906 Y180.711 E.33227
G1 X65.686 Y180.9 E.02175
G1 X56.61 Y171.825 E.34777
G1 X56.986 Y171.61 E.01172
G1 X66.466 Y181.09 E.36328
G1 X67.245 Y181.279 E.02175
G1 X57.361 Y171.395 E.37879
G1 X57.736 Y171.18 E.01172
G1 X68.025 Y181.469 E.39429
G1 X68.805 Y181.658 E.02175
G1 X58.111 Y170.964 E.4098
G1 X58.487 Y170.749 E.01172
G1 X69.585 Y181.848 E.4253
G1 X70.365 Y182.037 E.02175
G1 X58.862 Y170.534 E.44081
G1 X59.237 Y170.319 E.01172
G1 X71.145 Y182.227 E.45632
G1 X71.925 Y182.416 E.02175
G1 X59.612 Y170.104 E.47182
G1 X59.988 Y169.889 E.01172
G1 X72.705 Y182.606 E.48733
G1 X73.484 Y182.795 E.02175
G1 X60.363 Y169.674 E.50283
G1 X60.738 Y169.459 E.01172
G1 X74.264 Y182.985 E.51834
G1 X75.044 Y183.174 E.02175
G1 X61.113 Y169.243 E.53385
G1 X61.489 Y169.028 E.01172
G1 X75.824 Y183.364 E.54935
G1 X76.604 Y183.553 E.02175
G1 X61.864 Y168.813 E.56486
G1 X62.239 Y168.598 E.01172
G1 X77.384 Y183.743 E.58036
G1 X78.164 Y183.932 E.02175
G1 X62.614 Y168.383 E.59587
G1 X62.989 Y168.168 E.01172
G1 X78.944 Y184.122 E.61137
G1 X79.723 Y184.311 E.02175
G1 X63.365 Y167.953 E.62688
G1 X63.74 Y167.738 E.01172
G1 X80.503 Y184.501 E.64239
G1 X81.283 Y184.69 E.02175
G1 X64.115 Y167.523 E.65789
G1 X64.49 Y167.307 E.01172
G1 X82.063 Y184.88 E.6734
G1 X82.843 Y185.069 E.02175
G1 X64.866 Y167.092 E.6889
G1 X65.241 Y166.877 E.01172
G1 X83.623 Y185.259 E.70441
G1 X84.403 Y185.448 E.02175
G1 X65.616 Y166.662 E.71992
G1 X65.991 Y166.447 E.01172
G1 X85.182 Y185.638 E.73542
G1 X85.962 Y185.827 E.02175
G1 X66.367 Y166.232 E.75093
G1 X66.742 Y166.017 E.01172
G1 X86.742 Y186.017 E.76643
G1 X87.522 Y186.207 E.02175
G1 X67.117 Y165.802 E.78194
G1 X67.492 Y165.586 E.01172
G1 X88.302 Y186.396 E.79744
G1 X89.082 Y186.586 E.02175
G1 X67.868 Y165.371 E.81295
G1 X68.243 Y165.156 E.01172
G1 X89.862 Y186.775 E.82846
G1 X90.642 Y186.965 E.02175
G1 X68.618 Y164.941 E.84396
G1 X68.993 Y164.726 E.01172
G1 X91.421 Y187.154 E.85947
G1 X92.201 Y187.344 E.02175
G1 X69.369 Y164.511 E.87497
G1 X69.744 Y164.296 E.01172
G1 X92.981 Y187.533 E.89048
G1 X93.761 Y187.723 E.02175
G1 X70.119 Y164.081 E.90599
G1 X70.494 Y163.865 E.01172
G1 X94.541 Y187.912 E.92149
G1 X95.321 Y188.102 E.02175
G1 X70.87 Y163.65 E.937
G1 X71.245 Y163.435 E.01172
G1 X96.101 Y188.291 E.9525
G1 X96.881 Y188.481 E.02175
G1 X71.62 Y163.22 E.96801
G1 X71.995 Y163.005 E.01172
G1 X97.66 Y188.67 E.98352
G1 X98.44 Y188.86 E.02175
G1 X72.371 Y162.79 E.99902
G1 X72.746 Y162.575 E.01172
G1 X99.22 Y189.049 E1.01453
G1 X100 Y189.239 E.02175
G1 X73.121 Y162.36 E1.03003
G1 X73.496 Y162.144 E.01172
G1 X100.78 Y189.428 E1.04554
G1 X101.56 Y189.618 E.02175
G1 X73.872 Y161.929 E1.06104
G1 X74.247 Y161.714 E.01172
G1 X102.34 Y189.807 E1.07655
G1 X103.12 Y189.997 E.02175
G1 X74.622 Y161.499 E1.09206
G1 X74.997 Y161.284 E.01172
G1 X103.899 Y190.186 E1.10756
G1 X104.679 Y190.376 E.02175
G1 X75.372 Y161.069 E1.12307
G1 X75.748 Y160.854 E.01172
G1 X105.459 Y190.565 E1.13857
G1 X106.239 Y190.755 E.02175
G1 X76.123 Y160.639 E1.15408
G1 X76.498 Y160.424 E.01172
G1 X107.019 Y190.944 E1.16959
G1 X107.799 Y191.134 E.02175
G1 X76.873 Y160.208 E1.18509
G1 X77.249 Y159.993 E.01172
G1 X108.579 Y191.323 E1.2006
G1 X109.359 Y191.513 E.02175
G1 X77.624 Y159.778 E1.2161
G1 X77.999 Y159.563 E.01172
G1 X110.138 Y191.702 E1.23161
G1 X110.918 Y191.892 E.02175
G1 X78.374 Y159.348 E1.24712
G1 X78.75 Y159.133 E.01172
G1 X111.698 Y192.081 E1.26262
G1 X112.478 Y192.271 E.02175
G1 X79.125 Y158.918 E1.27813
G1 X79.5 Y158.703 E.01172
G1 X113.258 Y192.46 E1.29363
G1 X114.038 Y192.65 E.02175
G1 X79.875 Y158.487 E1.30914
G1 X80.251 Y158.272 E.01172
G1 X114.818 Y192.839 E1.32464
G1 X115.598 Y193.029 E.02175
G1 X80.626 Y158.057 E1.34015
G1 X81.001 Y157.842 E.01172
G1 X116.377 Y193.218 E1.35566
G1 X117.157 Y193.408 E.02175
G1 X81.376 Y157.627 E1.37116
G1 X81.752 Y157.412 E.01172
G1 X117.937 Y193.597 E1.38667
G1 X118.717 Y193.787 E.02175
G1 X82.127 Y157.197 E1.40217
G1 X82.502 Y156.982 E.01172
G1 X119.497 Y193.976 E1.41768
G1 X120.277 Y194.166 E.02175
G1 X82.877 Y156.766 E1.43319
G1 X83.253 Y156.551 E.01172
G1 X121.057 Y194.355 E1.44869
G1 X121.837 Y194.545 E.02175
G1 X83.628 Y156.336 E1.4642
G1 X84.003 Y156.121 E.01172
G1 X122.616 Y194.734 E1.4797
G1 X123.396 Y194.924 E.02175
G1 X84.378 Y155.906 E1.49521
G1 X84.754 Y155.691 E.01172
G1 X123.626 Y194.563 E1.48962
G1 X123.614 Y193.961 E.01633
G1 X85.129 Y155.476 E1.47478
G1 X85.504 Y155.261 E.01172
G1 X123.602 Y193.358 E1.45994
G1 X123.589 Y192.756 E.01633
G1 X85.879 Y155.045 E1.44509
G1 X86.254 Y154.83 E.01172
G1 X123.577 Y192.153 E1.43025
G1 X123.565 Y191.551 E.01633
G1 X86.63 Y154.615 E1.41541
G1 X87.005 Y154.4 E.01172
G1 X123.553 Y190.948 E1.40057
G1 X123.541 Y190.346 E.01633
G1 X87.38 Y154.185 E1.38573
G1 X87.755 Y153.97 E.01172
G1 X123.529 Y189.744 E1.37089
G1 X123.517 Y189.141 E.01633
G1 X88.131 Y153.755 E1.35605
G1 X88.506 Y153.54 E.01172
G1 X123.505 Y188.539 E1.3412
G1 X123.493 Y187.936 E.01633
G1 X88.881 Y153.325 E1.32636
G1 X89.256 Y153.109 E.01172
G1 X123.481 Y187.334 E1.31152
G1 X123.469 Y186.732 E.01633
G1 X89.632 Y152.894 E1.29668
G1 X90.007 Y152.679 E.01172
G1 X123.457 Y186.129 E1.28184
G1 X123.445 Y185.527 E.01633
G1 X90.382 Y152.464 E1.267
G1 X90.757 Y152.249 E.01172
G1 X123.433 Y184.924 E1.25215
G1 X123.421 Y184.322 E.01633
G1 X91.133 Y152.034 E1.23731
G1 X91.508 Y151.819 E.01172
G1 X123.409 Y183.719 E1.22247
G1 X123.397 Y183.117 E.01633
G1 X91.883 Y151.604 E1.20763
G1 X92.258 Y151.388 E.01172
G1 X123.385 Y182.515 E1.19279
G1 X123.373 Y181.912 E.01633
G1 X92.634 Y151.173 E1.17795
G1 X93.009 Y150.958 E.01172
G1 X123.36 Y181.31 E1.1631
G1 X123.348 Y180.707 E.01633
G1 X93.384 Y150.743 E1.14826
G1 X93.759 Y150.528 E.01172
G1 X123.336 Y180.105 E1.13342
G1 X123.324 Y179.503 E.01633
G1 X94.135 Y150.313 E1.11858
G1 X94.51 Y150.098 E.01172
G1 X123.312 Y178.9 E1.10374
G1 X123.3 Y178.298 E.01633
G1 X94.885 Y149.883 E1.0889
G1 X95.26 Y149.667 E.01172
G1 X123.288 Y177.695 E1.07406
G1 X123.276 Y177.093 E.01633
G1 X95.636 Y149.452 E1.05921
G1 X96.011 Y149.237 E.01172
G1 X123.264 Y176.49 E1.04437
G1 X123.252 Y175.888 E.01633
G1 X96.386 Y149.022 E1.02953
G1 X96.761 Y148.807 E.01172
G1 X123.24 Y175.286 E1.01469
G1 X123.228 Y174.683 E.01633
G1 X97.137 Y148.592 E.99985
G1 X97.512 Y148.377 E.01172
G1 X123.216 Y174.081 E.98501
G1 X123.204 Y173.478 E.01633
G1 X97.887 Y148.162 E.97016
G1 X98.262 Y147.946 E.01172
G1 X123.192 Y172.876 E.95532
G1 X123.18 Y172.274 E.01633
G1 X98.637 Y147.731 E.94048
G1 X99.013 Y147.516 E.01172
G1 X123.168 Y171.671 E.92564
G1 X123.156 Y171.069 E.01633
G1 X99.388 Y147.301 E.9108
G1 X99.763 Y147.086 E.01172
G1 X123.143 Y170.466 E.89596
G1 X123.131 Y169.864 E.01633
G1 X100.138 Y146.871 E.88111
G1 X100.514 Y146.656 E.01172
G1 X123.119 Y169.261 E.86627
G1 X123.107 Y168.659 E.01633
G1 X100.889 Y146.441 E.85143
G1 X101.264 Y146.226 E.01172
G1 X123.095 Y168.057 E.83659
G1 X123.083 Y167.454 E.01633
G1 X101.639 Y146.01 E.82175
G1 X102.015 Y145.795 E.01172
G1 X123.071 Y166.852 E.80691
G1 X123.059 Y166.249 E.01633
G1 X102.39 Y145.58 E.79207
G1 X102.765 Y145.365 E.01172
G1 X123.047 Y165.647 E.77722
G1 X123.035 Y165.045 E.01633
G1 X103.14 Y145.15 E.76238
G1 X103.516 Y144.935 E.01172
G1 X123.023 Y164.442 E.74754
G1 X123.011 Y163.84 E.01633
G1 X103.891 Y144.72 E.7327
G1 X104.266 Y144.505 E.01172
G1 X122.999 Y163.237 E.71786
G1 X122.987 Y162.635 E.01633
G1 X104.641 Y144.289 E.70302
G1 X105.017 Y144.074 E.01172
G1 X122.975 Y162.032 E.68817
G1 X122.963 Y161.43 E.01633
G1 X105.392 Y143.859 E.67333
G1 X105.767 Y143.644 E.01172
G1 X122.951 Y160.828 E.65849
G1 X122.939 Y160.225 E.01633
G1 X106.142 Y143.429 E.64365
G1 X106.518 Y143.214 E.01172
G1 X122.927 Y159.623 E.62881
G1 X122.914 Y159.02 E.01633
G1 X106.893 Y142.999 E.61397
G1 X107.268 Y142.784 E.01172
G1 X122.902 Y158.418 E.59912
G1 X122.89 Y157.815 E.01633
G1 X107.643 Y142.568 E.58428
G1 X108.019 Y142.353 E.01172
G1 X122.878 Y157.213 E.56944
G1 X122.866 Y156.611 E.01633
G1 X108.394 Y142.138 E.5546
G1 X108.769 Y141.923 E.01172
G1 X122.854 Y156.008 E.53976
G1 X122.842 Y155.406 E.01633
G1 X109.144 Y141.708 E.52492
G1 X109.52 Y141.493 E.01172
G1 X122.83 Y154.803 E.51007
G1 X122.818 Y154.201 E.01633
G1 X109.895 Y141.278 E.49523
G1 X110.275 Y141.068 E.01177
G1 X122.806 Y153.599 E.4802
G1 X122.794 Y152.996 E.01633
G1 X111.449 Y141.651 E.43476
G1 X112.845 Y142.457 E.04371
G1 X122.782 Y152.394 E.38077
G1 X122.77 Y151.791 E.01633
G1 X114.242 Y143.264 E.32679
G1 X115.639 Y144.07 E.0437
G1 X122.758 Y151.189 E.2728
G1 X122.746 Y150.586 E.01633
G1 X117.036 Y144.877 E.21881
G1 X118.433 Y145.683 E.04371
G1 X122.734 Y149.984 E.16482
G1 X122.722 Y149.382 E.01633
G1 X119.829 Y146.49 E.11083
G1 X121.226 Y147.296 E.04371
G1 X122.9 Y148.97 E.06415
; OBJECT_ID: 437
; WIPE_START
G1 X121.486 Y147.556 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 409
M625
; start printing object, unique label id: 437
M624 EAAAAAAAAAA=
M204 S10000
G1 X116.02 Y142.229 Z1.56 F30000
G1 X47.244 Y75.215 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X123.999 Y56.564 E2.14036
G1 X123.053 Y103.847 E1.28149
G1 X122.861 Y104.171 E.01019
G1 X110.534 Y111.288 E.3857
G1 X110.167 Y111.288 E.00995
G1 X47.296 Y75.245 E1.96372
; WIPE_START
G1 X49.239 Y74.772 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.187 Y75.071 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X124.186 Y56.106 E2.01813
G1 X124.405 Y56.282 E.00708
G1 X123.451 Y103.96 E1.19892
G1 X123.153 Y104.465 E.01475
G1 X110.642 Y111.688 E.3632
G1 X110.061 Y111.689 E.01461
G1 X46.239 Y75.101 E1.84954
; WIPE_START
M204 S4000
G1 X48.182 Y74.627 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.218 Y75.579 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.528 Y75.269 E.0119
G1 X49.308 Y75.079 E.02175
G1 X48.73 Y75.658 E.02215
G1 X49.106 Y75.873 E.01172
G1 X50.088 Y74.89 E.03766
G1 X50.868 Y74.7 E.02175
G1 X49.481 Y76.088 E.05316
G1 X49.856 Y76.303 E.01172
G1 X51.648 Y74.511 E.06867
G1 X52.428 Y74.321 E.02175
G1 X50.231 Y76.518 E.08418
G1 X50.606 Y76.733 E.01172
G1 X53.208 Y74.132 E.09968
G1 X53.988 Y73.942 E.02175
G1 X50.982 Y76.948 E.11519
G1 X51.357 Y77.163 E.01172
G1 X54.767 Y73.753 E.13069
G1 X55.547 Y73.563 E.02175
G1 X51.732 Y77.378 E.1462
G1 X52.107 Y77.594 E.01172
G1 X56.327 Y73.374 E.1617
G1 X57.107 Y73.184 E.02175
G1 X52.483 Y77.809 E.17721
G1 X52.858 Y78.024 E.01172
G1 X57.887 Y72.995 E.19272
G1 X58.667 Y72.805 E.02175
M73 P54 R32
G1 X53.233 Y78.239 E.20822
G1 X53.608 Y78.454 E.01172
G1 X59.447 Y72.616 E.22373
G1 X60.227 Y72.426 E.02175
G1 X53.984 Y78.669 E.23923
G1 X54.359 Y78.884 E.01172
G1 X61.006 Y72.237 E.25474
G1 X61.786 Y72.047 E.02175
G1 X54.734 Y79.099 E.27025
G1 X55.109 Y79.315 E.01172
G1 X62.566 Y71.858 E.28575
G1 X63.346 Y71.668 E.02175
G1 X55.485 Y79.53 E.30126
G1 X55.86 Y79.745 E.01172
G1 X64.126 Y71.479 E.31676
G1 X64.906 Y71.289 E.02175
G1 X56.235 Y79.96 E.33227
G1 X56.61 Y80.175 E.01172
G1 X65.686 Y71.1 E.34777
G1 X66.466 Y70.91 E.02175
G1 X56.986 Y80.39 E.36328
G1 X57.361 Y80.605 E.01172
G1 X67.245 Y70.721 E.37879
G1 X68.025 Y70.531 E.02175
G1 X57.736 Y80.82 E.39429
G1 X58.111 Y81.036 E.01172
G1 X68.805 Y70.342 E.4098
G1 X69.585 Y70.152 E.02175
G1 X58.487 Y81.251 E.4253
G1 X58.862 Y81.466 E.01172
G1 X70.365 Y69.963 E.44081
G1 X71.145 Y69.773 E.02175
G1 X59.237 Y81.681 E.45632
G1 X59.612 Y81.896 E.01172
G1 X71.925 Y69.584 E.47182
G1 X72.705 Y69.394 E.02175
G1 X59.988 Y82.111 E.48733
G1 X60.363 Y82.326 E.01172
G1 X73.484 Y69.205 E.50283
G1 X74.264 Y69.015 E.02175
G1 X60.738 Y82.541 E.51834
G1 X61.113 Y82.757 E.01172
G1 X75.044 Y68.826 E.53384
G1 X75.824 Y68.636 E.02175
G1 X61.489 Y82.972 E.54935
G1 X61.864 Y83.187 E.01172
G1 X76.604 Y68.447 E.56486
G1 X77.384 Y68.257 E.02175
G1 X62.239 Y83.402 E.58036
G1 X62.614 Y83.617 E.01172
G1 X78.164 Y68.068 E.59587
G1 X78.943 Y67.878 E.02175
G1 X62.989 Y83.832 E.61137
G1 X63.365 Y84.047 E.01172
G1 X79.723 Y67.689 E.62688
G1 X80.503 Y67.499 E.02175
G1 X63.74 Y84.262 E.64239
G1 X64.115 Y84.477 E.01172
G1 X81.283 Y67.31 E.65789
G1 X82.063 Y67.12 E.02175
G1 X64.49 Y84.693 E.6734
G1 X64.866 Y84.908 E.01172
G1 X82.843 Y66.931 E.6889
G1 X83.623 Y66.741 E.02175
G1 X65.241 Y85.123 E.70441
G1 X65.616 Y85.338 E.01172
G1 X84.403 Y66.552 E.71992
G1 X85.182 Y66.362 E.02175
G1 X65.991 Y85.553 E.73542
G1 X66.367 Y85.768 E.01172
G1 X85.962 Y66.173 E.75093
G1 X86.742 Y65.983 E.02175
G1 X66.742 Y85.983 E.76643
G1 X67.117 Y86.198 E.01172
G1 X87.522 Y65.793 E.78194
G1 X88.302 Y65.604 E.02175
G1 X67.492 Y86.414 E.79744
G1 X67.868 Y86.629 E.01172
G1 X89.082 Y65.414 E.81295
G1 X89.862 Y65.225 E.02175
G1 X68.243 Y86.844 E.82846
G1 X68.618 Y87.059 E.01172
G1 X90.642 Y65.035 E.84396
G1 X91.421 Y64.846 E.02175
G1 X68.993 Y87.274 E.85947
G1 X69.369 Y87.489 E.01172
G1 X92.201 Y64.656 E.87497
G1 X92.981 Y64.467 E.02175
G1 X69.744 Y87.704 E.89048
G1 X70.119 Y87.919 E.01172
G1 X93.761 Y64.277 E.90599
G1 X94.541 Y64.088 E.02175
G1 X70.494 Y88.135 E.92149
G1 X70.87 Y88.35 E.01172
G1 X95.321 Y63.898 E.937
G1 X96.101 Y63.709 E.02175
G1 X71.245 Y88.565 E.9525
G1 X71.62 Y88.78 E.01172
G1 X96.881 Y63.519 E.96801
G1 X97.66 Y63.33 E.02175
G1 X71.995 Y88.995 E.98351
G1 X72.371 Y89.21 E.01172
G1 X98.44 Y63.14 E.99902
G1 X99.22 Y62.951 E.02175
G1 X72.746 Y89.425 E1.01453
G1 X73.121 Y89.64 E.01172
G1 X100 Y62.761 E1.03003
G1 X100.78 Y62.572 E.02175
G1 X73.496 Y89.856 E1.04554
G1 X73.872 Y90.071 E.01172
G1 X101.56 Y62.382 E1.06104
G1 X102.34 Y62.193 E.02175
G1 X74.247 Y90.286 E1.07655
G1 X74.622 Y90.501 E.01172
G1 X103.12 Y62.003 E1.09206
G1 X103.899 Y61.814 E.02175
G1 X74.997 Y90.716 E1.10756
G1 X75.372 Y90.931 E.01172
G1 X104.679 Y61.624 E1.12307
G1 X105.459 Y61.435 E.02175
G1 X75.748 Y91.146 E1.13857
G1 X76.123 Y91.361 E.01172
G1 X106.239 Y61.245 E1.15408
G1 X107.019 Y61.056 E.02175
G1 X76.498 Y91.576 E1.16959
G1 X76.873 Y91.792 E.01172
G1 X107.799 Y60.866 E1.18509
G1 X108.579 Y60.677 E.02175
G1 X77.249 Y92.007 E1.2006
G1 X77.624 Y92.222 E.01172
G1 X109.359 Y60.487 E1.2161
G1 X110.138 Y60.298 E.02175
G1 X77.999 Y92.437 E1.23161
G1 X78.374 Y92.652 E.01172
G1 X110.918 Y60.108 E1.24711
G1 X111.698 Y59.919 E.02175
G1 X78.75 Y92.867 E1.26262
G1 X79.125 Y93.082 E.01172
G1 X112.478 Y59.729 E1.27813
G1 X113.258 Y59.54 E.02175
G1 X79.5 Y93.297 E1.29363
G1 X79.875 Y93.513 E.01172
G1 X114.038 Y59.35 E1.30914
G1 X114.818 Y59.161 E.02175
G1 X80.251 Y93.728 E1.32464
G1 X80.626 Y93.943 E.01172
G1 X115.598 Y58.971 E1.34015
G1 X116.377 Y58.782 E.02175
G1 X81.001 Y94.158 E1.35566
G1 X81.376 Y94.373 E.01172
G1 X117.157 Y58.592 E1.37116
G1 X117.937 Y58.403 E.02175
G1 X81.752 Y94.588 E1.38667
G1 X82.127 Y94.803 E.01172
G1 X118.717 Y58.213 E1.40217
G1 X119.497 Y58.024 E.02175
G1 X82.502 Y95.018 E1.41768
G1 X82.877 Y95.234 E.01172
G1 X120.277 Y57.834 E1.43318
G1 X121.057 Y57.645 E.02175
G1 X83.253 Y95.449 E1.44869
G1 X83.628 Y95.664 E.01172
G1 X121.837 Y57.455 E1.4642
G1 X122.616 Y57.266 E.02175
G1 X84.003 Y95.879 E1.4797
G1 X84.378 Y96.094 E.01172
G1 X123.396 Y57.076 E1.49521
G1 X123.634 Y57.018 E.00663
G1 X123.626 Y57.437 E.01135
G1 X84.754 Y96.309 E1.48962
G1 X85.129 Y96.524 E.01172
G1 X123.614 Y58.039 E1.47478
G1 X123.602 Y58.642 E.01633
G1 X85.504 Y96.739 E1.45994
G1 X85.879 Y96.955 E.01172
G1 X123.589 Y59.244 E1.44509
G1 X123.577 Y59.847 E.01633
M73 P54 R31
G1 X86.255 Y97.17 E1.43025
G1 X86.63 Y97.385 E.01172
G1 X123.565 Y60.449 E1.41541
G1 X123.553 Y61.052 E.01633
G1 X87.005 Y97.6 E1.40057
G1 X87.38 Y97.815 E.01172
G1 X123.541 Y61.654 E1.38573
G1 X123.529 Y62.256 E.01633
G1 X87.755 Y98.03 E1.37089
G1 X88.131 Y98.245 E.01172
G1 X123.517 Y62.859 E1.35604
G1 X123.505 Y63.461 E.01633
G1 X88.506 Y98.46 E1.3412
G1 X88.881 Y98.675 E.01172
G1 X123.493 Y64.064 E1.32636
G1 X123.481 Y64.666 E.01633
G1 X89.256 Y98.891 E1.31152
G1 X89.632 Y99.106 E.01172
G1 X123.469 Y65.268 E1.29668
G1 X123.457 Y65.871 E.01633
G1 X90.007 Y99.321 E1.28184
G1 X90.382 Y99.536 E.01172
G1 X123.445 Y66.473 E1.267
G1 X123.433 Y67.076 E.01633
G1 X90.757 Y99.751 E1.25215
G1 X91.133 Y99.966 E.01172
G1 X123.421 Y67.678 E1.23731
G1 X123.409 Y68.281 E.01633
G1 X91.508 Y100.181 E1.22247
G1 X91.883 Y100.396 E.01172
G1 X123.397 Y68.883 E1.20763
G1 X123.385 Y69.485 E.01633
G1 X92.258 Y100.612 E1.19279
G1 X92.634 Y100.827 E.01172
G1 X123.373 Y70.088 E1.17795
G1 X123.36 Y70.69 E.01633
G1 X93.009 Y101.042 E1.1631
G1 X93.384 Y101.257 E.01172
G1 X123.348 Y71.293 E1.14826
G1 X123.336 Y71.895 E.01633
G1 X93.759 Y101.472 E1.13342
G1 X94.135 Y101.687 E.01172
G1 X123.324 Y72.497 E1.11858
G1 X123.312 Y73.1 E.01633
G1 X94.51 Y101.902 E1.10374
G1 X94.885 Y102.117 E.01172
G1 X123.3 Y73.702 E1.0889
G1 X123.288 Y74.305 E.01633
G1 X95.26 Y102.333 E1.07405
G1 X95.636 Y102.548 E.01172
G1 X123.276 Y74.907 E1.05921
G1 X123.264 Y75.51 E.01633
G1 X96.011 Y102.763 E1.04437
G1 X96.386 Y102.978 E.01172
G1 X123.252 Y76.112 E1.02953
G1 X123.24 Y76.714 E.01633
G1 X96.761 Y103.193 E1.01469
G1 X97.137 Y103.408 E.01172
G1 X123.228 Y77.317 E.99985
G1 X123.216 Y77.919 E.01633
G1 X97.512 Y103.623 E.985
G1 X97.887 Y103.838 E.01172
G1 X123.204 Y78.522 E.97016
G1 X123.192 Y79.124 E.01633
G1 X98.262 Y104.053 E.95532
G1 X98.638 Y104.269 E.01172
G1 X123.18 Y79.726 E.94048
G1 X123.168 Y80.329 E.01633
G1 X99.013 Y104.484 E.92564
G1 X99.388 Y104.699 E.01172
G1 X123.156 Y80.931 E.9108
G1 X123.143 Y81.534 E.01633
G1 X99.763 Y104.914 E.89596
G1 X100.138 Y105.129 E.01172
G1 X123.131 Y82.136 E.88111
G1 X123.119 Y82.739 E.01633
G1 X100.514 Y105.344 E.86627
G1 X100.889 Y105.559 E.01172
G1 X123.107 Y83.341 E.85143
G1 X123.095 Y83.943 E.01633
G1 X101.264 Y105.774 E.83659
G1 X101.639 Y105.99 E.01172
G1 X123.083 Y84.546 E.82175
G1 X123.071 Y85.148 E.01633
G1 X102.015 Y106.205 E.80691
G1 X102.39 Y106.42 E.01172
G1 X123.059 Y85.751 E.79206
G1 X123.047 Y86.353 E.01633
G1 X102.765 Y106.635 E.77722
G1 X103.14 Y106.85 E.01172
G1 X123.035 Y86.955 E.76238
G1 X123.023 Y87.558 E.01633
G1 X103.516 Y107.065 E.74754
G1 X103.891 Y107.28 E.01172
G1 X123.011 Y88.16 E.7327
G1 X122.999 Y88.763 E.01633
G1 X104.266 Y107.495 E.71786
G1 X104.641 Y107.711 E.01172
G1 X122.987 Y89.365 E.70301
G1 X122.975 Y89.968 E.01633
G1 X105.017 Y107.926 E.68817
G1 X105.392 Y108.141 E.01172
G1 X122.963 Y90.57 E.67333
G1 X122.951 Y91.172 E.01633
G1 X105.767 Y108.356 E.65849
G1 X106.142 Y108.571 E.01172
G1 X122.939 Y91.775 E.64365
G1 X122.927 Y92.377 E.01633
G1 X106.518 Y108.786 E.62881
G1 X106.893 Y109.001 E.01172
G1 X122.914 Y92.98 E.61396
G1 X122.902 Y93.582 E.01633
G1 X107.268 Y109.216 E.59912
G1 X107.643 Y109.432 E.01172
G1 X122.89 Y94.185 E.58428
G1 X122.878 Y94.787 E.01633
G1 X108.019 Y109.647 E.56944
G1 X108.394 Y109.862 E.01172
G1 X122.866 Y95.389 E.5546
G1 X122.854 Y95.992 E.01633
G1 X108.769 Y110.077 E.53976
G1 X109.144 Y110.292 E.01172
G1 X122.842 Y96.594 E.52492
G1 X122.83 Y97.197 E.01633
G1 X109.52 Y110.507 E.51007
G1 X109.895 Y110.722 E.01172
G1 X122.818 Y97.799 E.49523
G1 X122.806 Y98.401 E.01633
G1 X110.275 Y110.932 E.4802
G1 X110.439 Y110.932 E.00444
G1 X111.449 Y110.349 E.0316
G1 X122.794 Y99.004 E.43476
G1 X122.782 Y99.606 E.01633
G1 X112.845 Y109.543 E.38078
G1 X114.242 Y108.736 E.04371
G1 X122.77 Y100.209 E.32679
G1 X122.758 Y100.811 E.01633
G1 X115.639 Y107.93 E.2728
G1 X117.036 Y107.123 E.0437
G1 X122.746 Y101.414 E.21881
G1 X122.734 Y102.016 E.01633
G1 X118.433 Y106.317 E.16482
G1 X119.829 Y105.51 E.04371
G1 X122.722 Y102.618 E.11083
G1 X122.71 Y103.221 E.01633
G1 X120.715 Y105.215 E.07642
; OBJECT_ID: 465
; WIPE_START
G1 X122.129 Y103.801 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 437
M625
; start printing object, unique label id: 465
M624 IAAAAAAAAAA=
M204 S10000
G1 X116.26 Y108.68 Z1.56 F30000
G1 X40.405 Y171.729 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X40.405 Y80.271 E2.47823
G1 X106.343 Y118.073 E2.05953
G1 X106.526 Y118.388 E.00986
G1 X106.526 Y133.612 E.41253
G1 X106.343 Y133.927 E.00986
G1 X40.457 Y171.699 E2.05791
M204 S10000
G1 X40.004 Y172.261 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X40.004 Y79.739 E2.32615
G1 X40.142 Y79.659 E.004
G1 X106.636 Y117.779 E1.92699
G1 X106.927 Y118.28 E.01457
G1 X106.927 Y133.72 E.38817
G1 X106.636 Y134.221 E.01457
G1 X40.142 Y172.341 E1.92699
G1 X40.056 Y172.292 E.00249
; WIPE_START
M204 S4000
G1 X40.055 Y170.292 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X40.762 Y171.33 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X40.762 Y80.886 E2.45076
G1 X41.179 Y81.125 E.01301
G1 X41.179 Y170.875 E2.43197
G1 X41.595 Y170.636 E.01301
G1 X41.595 Y81.364 E2.41903
G1 X42.012 Y81.602 E.01301
G1 X42.012 Y170.398 E2.40608
G1 X42.428 Y170.159 E.01301
G1 X42.428 Y81.841 E2.39314
G1 X42.845 Y82.08 E.01301
G1 X42.845 Y169.92 E2.3802
G1 X43.262 Y169.681 E.01301
G1 X43.262 Y82.319 E2.36725
M73 P55 R31
G1 X43.678 Y82.558 E.01301
G1 X43.678 Y169.442 E2.35431
G1 X44.095 Y169.203 E.01301
G1 X44.095 Y82.797 E2.34137
G1 X44.512 Y83.036 E.01301
G1 X44.512 Y168.965 E2.32842
G1 X44.928 Y168.726 E.01301
G1 X44.928 Y83.274 E2.31548
G1 X45.345 Y83.513 E.01301
G1 X45.345 Y168.487 E2.30254
G1 X45.761 Y168.248 E.01301
G1 X45.761 Y83.752 E2.28959
G1 X46.178 Y83.991 E.01301
G1 X46.178 Y168.009 E2.27665
G1 X46.595 Y167.77 E.01301
G1 X46.595 Y84.23 E2.26371
G1 X47.011 Y84.469 E.01301
G1 X47.011 Y167.531 E2.25076
G1 X47.428 Y167.293 E.01301
G1 X47.428 Y84.707 E2.23782
G1 X47.844 Y84.946 E.01301
G1 X47.844 Y167.054 E2.22487
G1 X48.261 Y166.815 E.01301
G1 X48.261 Y85.185 E2.21193
G1 X48.678 Y85.424 E.01301
G1 X48.678 Y166.576 E2.19899
G1 X49.094 Y166.337 E.01301
G1 X49.094 Y85.663 E2.18604
G1 X49.511 Y85.902 E.01301
G1 X49.511 Y166.098 E2.1731
G1 X49.927 Y165.86 E.01301
G1 X49.927 Y86.14 E2.16016
G1 X50.344 Y86.379 E.01301
G1 X50.344 Y165.621 E2.14721
G1 X50.761 Y165.382 E.01301
G1 X50.761 Y86.618 E2.13427
G1 X51.177 Y86.857 E.01301
G1 X51.177 Y165.143 E2.12133
G1 X51.594 Y164.904 E.01301
G1 X51.594 Y87.096 E2.10838
G1 X52.01 Y87.335 E.01301
G1 X52.01 Y164.665 E2.09544
G1 X52.427 Y164.427 E.01301
G1 X52.427 Y87.573 E2.0825
G1 X52.844 Y87.812 E.01301
G1 X52.844 Y164.188 E2.06955
G1 X53.26 Y163.949 E.01301
G1 X53.26 Y88.051 E2.05661
G1 X53.677 Y88.29 E.01301
G1 X53.677 Y163.71 E2.04367
G1 X54.094 Y163.471 E.01301
G1 X54.094 Y88.529 E2.03072
G1 X54.51 Y88.768 E.01301
G1 X54.51 Y163.232 E2.01778
G1 X54.927 Y162.994 E.01301
G1 X54.927 Y89.006 E2.00483
G1 X55.343 Y89.245 E.01301
G1 X55.343 Y162.755 E1.99189
G1 X55.76 Y162.516 E.01301
G1 X55.76 Y89.484 E1.97895
G1 X56.177 Y89.723 E.01301
G1 X56.177 Y162.277 E1.966
G1 X56.593 Y162.038 E.01301
G1 X56.593 Y89.962 E1.95306
G1 X57.01 Y90.201 E.01301
G1 X57.01 Y161.799 E1.94012
G1 X57.426 Y161.561 E.01301
G1 X57.426 Y90.439 E1.92717
G1 X57.843 Y90.678 E.01301
G1 X57.843 Y161.322 E1.91423
G1 X58.26 Y161.083 E.01301
G1 X58.26 Y90.917 E1.90129
G1 X58.676 Y91.156 E.01301
G1 X58.676 Y160.844 E1.88834
G1 X59.093 Y160.605 E.01301
G1 X59.093 Y91.395 E1.8754
G1 X59.509 Y91.634 E.01301
G1 X59.509 Y160.366 E1.86246
G1 X59.926 Y160.128 E.01301
G1 X59.926 Y91.872 E1.84951
G1 X60.343 Y92.111 E.01301
G1 X60.343 Y159.889 E1.83657
G1 X60.759 Y159.65 E.01301
G1 X60.759 Y92.35 E1.82363
G1 X61.176 Y92.589 E.01301
G1 X61.176 Y159.411 E1.81068
G1 X61.593 Y159.172 E.01301
G1 X61.593 Y92.828 E1.79774
G1 X62.009 Y93.067 E.01301
G1 X62.009 Y158.933 E1.78479
G1 X62.426 Y158.695 E.01301
G1 X62.426 Y93.305 E1.77185
G1 X62.842 Y93.544 E.01301
G1 X62.842 Y158.456 E1.75891
G1 X63.259 Y158.217 E.01301
G1 X63.259 Y93.783 E1.74596
G1 X63.676 Y94.022 E.01301
G1 X63.676 Y157.978 E1.73302
G1 X64.092 Y157.739 E.01301
G1 X64.092 Y94.261 E1.72008
G1 X64.509 Y94.5 E.01301
G1 X64.509 Y157.5 E1.70713
G1 X64.925 Y157.262 E.01301
G1 X64.925 Y94.739 E1.69419
G1 X65.342 Y94.977 E.01301
G1 X65.342 Y157.023 E1.68125
G1 X65.759 Y156.784 E.01301
G1 X65.759 Y95.216 E1.6683
G1 X66.175 Y95.455 E.01301
G1 X66.175 Y156.545 E1.65536
G1 X66.592 Y156.306 E.01301
G1 X66.592 Y95.694 E1.64242
G1 X67.008 Y95.933 E.01301
G1 X67.008 Y156.067 E1.62947
G1 X67.425 Y155.828 E.01301
G1 X67.425 Y96.172 E1.61653
G1 X67.842 Y96.41 E.01301
G1 X67.842 Y155.59 E1.60358
G1 X68.258 Y155.351 E.01301
G1 X68.258 Y96.649 E1.59064
G1 X68.675 Y96.888 E.01301
G1 X68.675 Y155.112 E1.5777
G1 X69.091 Y154.873 E.01301
G1 X69.091 Y97.127 E1.56475
G1 X69.508 Y97.366 E.01301
G1 X69.508 Y154.634 E1.55181
G1 X69.925 Y154.395 E.01301
G1 X69.925 Y97.605 E1.53887
G1 X70.341 Y97.843 E.01301
G1 X70.341 Y154.157 E1.52592
G1 X70.758 Y153.918 E.01301
G1 X70.758 Y98.082 E1.51298
G1 X71.175 Y98.321 E.01301
G1 X71.175 Y153.679 E1.50004
G1 X71.591 Y153.44 E.01301
G1 X71.591 Y98.56 E1.48709
G1 X72.008 Y98.799 E.01301
G1 X72.008 Y153.201 E1.47415
G1 X72.424 Y152.962 E.01301
G1 X72.424 Y99.038 E1.46121
G1 X72.841 Y99.276 E.01301
G1 X72.841 Y152.724 E1.44826
G1 X73.258 Y152.485 E.01301
G1 X73.258 Y99.515 E1.43532
G1 X73.674 Y99.754 E.01301
G1 X73.674 Y152.246 E1.42238
G1 X74.091 Y152.007 E.01301
G1 X74.091 Y99.993 E1.40943
G1 X74.507 Y100.232 E.01301
G1 X74.507 Y151.768 E1.39649
G1 X74.924 Y151.529 E.01301
G1 X74.924 Y100.471 E1.38354
G1 X75.341 Y100.709 E.01301
G1 X75.341 Y151.291 E1.3706
G1 X75.757 Y151.052 E.01301
G1 X75.757 Y100.948 E1.35766
G1 X76.174 Y101.187 E.01301
G1 X76.174 Y150.813 E1.34471
G1 X76.59 Y150.574 E.01301
G1 X76.59 Y101.426 E1.33177
G1 X77.007 Y101.665 E.01301
G1 X77.007 Y150.335 E1.31883
G1 X77.424 Y150.096 E.01301
G1 X77.424 Y101.904 E1.30588
G1 X77.84 Y102.142 E.01301
G1 X77.84 Y149.858 E1.29294
G1 X78.257 Y149.619 E.01301
G1 X78.257 Y102.381 E1.28
G1 X78.674 Y102.62 E.01301
G1 X78.674 Y149.38 E1.26705
M73 P55 R30
G1 X79.09 Y149.141 E.01301
G1 X79.09 Y102.859 E1.25411
G1 X79.507 Y103.098 E.01301
G1 X79.507 Y148.902 E1.24117
G1 X79.923 Y148.663 E.01301
G1 X79.923 Y103.337 E1.22822
G1 X80.34 Y103.575 E.01301
G1 X80.34 Y148.425 E1.21528
G1 X80.757 Y148.186 E.01301
G1 X80.757 Y103.814 E1.20234
G1 X81.173 Y104.053 E.01301
G1 X81.173 Y147.947 E1.18939
G1 X81.59 Y147.708 E.01301
G1 X81.59 Y104.292 E1.17645
G1 X82.006 Y104.531 E.01301
G1 X82.006 Y147.469 E1.1635
G1 X82.423 Y147.23 E.01301
G1 X82.423 Y104.77 E1.15056
G1 X82.84 Y105.008 E.01301
G1 X82.84 Y146.992 E1.13762
G1 X83.256 Y146.753 E.01301
G1 X83.256 Y105.247 E1.12467
G1 X83.673 Y105.486 E.01301
G1 X83.673 Y146.514 E1.11173
G1 X84.089 Y146.275 E.01301
G1 X84.089 Y105.725 E1.09879
G1 X84.506 Y105.964 E.01301
G1 X84.506 Y146.036 E1.08584
G1 X84.923 Y145.797 E.01301
G1 X84.923 Y106.203 E1.0729
G1 X85.339 Y106.441 E.01301
G1 X85.339 Y145.559 E1.05996
G1 X85.756 Y145.32 E.01301
G1 X85.756 Y106.68 E1.04701
M73 P56 R30
G1 X86.173 Y106.919 E.01301
G1 X86.173 Y145.081 E1.03407
G1 X86.589 Y144.842 E.01301
G1 X86.589 Y107.158 E1.02113
G1 X87.006 Y107.397 E.01301
G1 X87.006 Y144.603 E1.00818
G1 X87.422 Y144.364 E.01301
G1 X87.422 Y107.636 E.99524
G1 X87.839 Y107.875 E.01301
G1 X87.839 Y144.125 E.98229
G1 X88.256 Y143.887 E.01301
G1 X88.256 Y108.113 E.96935
G1 X88.672 Y108.352 E.01301
G1 X88.672 Y143.648 E.95641
G1 X89.089 Y143.409 E.01301
G1 X89.089 Y108.591 E.94346
G1 X89.505 Y108.83 E.01301
G1 X89.505 Y143.17 E.93052
G1 X89.922 Y142.931 E.01301
G1 X89.922 Y109.069 E.91758
G1 X90.339 Y109.308 E.01301
G1 X90.339 Y142.692 E.90463
G1 X90.755 Y142.454 E.01301
G1 X90.755 Y109.546 E.89169
G1 X91.172 Y109.785 E.01301
G1 X91.172 Y142.215 E.87875
G1 X91.588 Y141.976 E.01301
G1 X91.588 Y110.024 E.8658
G1 X92.005 Y110.263 E.01301
G1 X92.005 Y141.737 E.85286
G1 X92.422 Y141.498 E.01301
G1 X92.422 Y110.502 E.83992
G1 X92.838 Y110.741 E.01301
G1 X92.838 Y141.259 E.82697
G1 X93.255 Y141.021 E.01301
G1 X93.255 Y110.979 E.81403
G1 X93.671 Y111.218 E.01301
G1 X93.671 Y140.782 E.80109
G1 X94.088 Y140.543 E.01301
G1 X94.088 Y111.457 E.78814
G1 X94.505 Y111.696 E.01301
G1 X94.505 Y140.304 E.7752
G1 X94.921 Y140.065 E.01301
G1 X94.921 Y111.935 E.76225
G1 X95.338 Y112.174 E.01301
G1 X95.338 Y139.826 E.74931
G1 X95.755 Y139.588 E.01301
G1 X95.755 Y112.412 E.73637
G1 X96.171 Y112.651 E.01301
G1 X96.171 Y139.349 E.72342
G1 X96.588 Y139.11 E.01301
G1 X96.588 Y112.89 E.71048
G1 X97.004 Y113.129 E.01301
G1 X97.004 Y138.871 E.69754
G1 X97.421 Y138.632 E.01301
G1 X97.421 Y113.368 E.68459
G1 X97.838 Y113.607 E.01301
G1 X97.838 Y138.393 E.67165
G1 X98.254 Y138.155 E.01301
G1 X98.254 Y113.845 E.65871
G1 X98.671 Y114.084 E.01301
G1 X98.671 Y137.916 E.64576
G1 X99.087 Y137.677 E.01301
G1 X99.087 Y114.323 E.63282
G1 X99.504 Y114.562 E.01301
G1 X99.504 Y137.438 E.61988
G1 X99.921 Y137.199 E.01301
G1 X99.921 Y114.801 E.60693
G1 X100.337 Y115.04 E.01301
G1 X100.337 Y136.96 E.59399
G1 X100.754 Y136.722 E.01301
G1 X100.754 Y115.278 E.58105
G1 X101.17 Y115.517 E.01301
G1 X101.17 Y136.483 E.5681
G1 X101.587 Y136.244 E.01301
G1 X101.587 Y115.756 E.55516
G1 X102.004 Y115.995 E.01301
G1 X102.004 Y136.005 E.54221
G1 X102.42 Y135.766 E.01301
G1 X102.42 Y116.234 E.52927
G1 X102.837 Y116.473 E.01301
G1 X102.837 Y135.527 E.51633
G1 X103.254 Y135.289 E.01301
G1 X103.254 Y116.711 E.50338
G1 X103.67 Y116.95 E.01301
G1 X103.67 Y135.05 E.49044
G1 X104.087 Y134.811 E.01301
G1 X104.087 Y117.189 E.4775
G1 X104.503 Y117.428 E.01301
G1 X104.503 Y134.572 E.46455
G1 X104.92 Y134.333 E.01301
G1 X104.92 Y117.667 E.45161
G1 X105.337 Y117.906 E.01301
G1 X105.337 Y134.094 E.43867
G1 X105.753 Y133.856 E.01301
G1 X105.753 Y118.144 E.42572
G3 X106.17 Y118.483 I-.083 J.529 E.01523
G1 X106.17 Y133.832 E.41593
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X106.17 Y131.832 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 465
M625
; layer num/total_layer_count: 8/14
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M204 S10000
G17
G3 Z1.56 I1.217 J0 P1  F30000
; object ids of layer 8 start: 325,353,381,409,437,465
M624 PwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer8 end: 325,353,381,409,437,465
M625
; OBJECT_ID: 325
; start printing object, unique label id: 325
M624 AQAAAAAAAAA=
G1 X208.756 Y75.215
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X145.833 Y111.288 E1.96535
G1 X145.466 Y111.288 E.00995
G1 X133.139 Y104.171 E.3857
G1 X132.947 Y103.847 E.01019
G1 X132.001 Y56.564 E1.28149
G1 X208.698 Y75.201 E2.13873
; WIPE_START
G1 X206.963 Y76.197 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.812 Y75.059 Z1.72 F30000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X145.939 Y111.689 E1.85116
G1 X145.358 Y111.688 E.01461
G1 X132.847 Y104.465 E.3632
G1 X132.549 Y103.96 E.01475
G1 X131.595 Y56.282 E1.19892
G1 X131.814 Y56.106 E.00708
G1 X209.753 Y75.045 E2.01651
; WIPE_START
M204 S4000
G1 X208.019 Y76.041 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.783 Y75.579 Z1.72 F30000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.474 Y75.27 E.01185
G1 X206.694 Y75.08 E.02175
G1 X207.271 Y75.657 E.0221
G1 X206.896 Y75.872 E.01172
G1 X205.914 Y74.891 E.03761
G1 X205.134 Y74.701 E.02175
G1 X206.52 Y76.087 E.05312
G1 X206.145 Y76.302 E.01172
G1 X204.354 Y74.512 E.06862
G1 X203.575 Y74.322 E.02175
G1 X205.77 Y76.517 E.08413
G1 X205.395 Y76.732 E.01172
G1 X202.795 Y74.132 E.09963
G1 X202.015 Y73.943 E.02175
G1 X205.019 Y76.948 E.11514
G1 X204.644 Y77.163 E.01172
G1 X201.235 Y73.753 E.13064
G1 X200.455 Y73.564 E.02175
G1 X204.269 Y77.378 E.14615
G1 X203.894 Y77.593 E.01172
G1 X199.675 Y73.374 E.16166
G1 X198.895 Y73.185 E.02175
G1 X203.518 Y77.808 E.17716
G1 X203.143 Y78.023 E.01172
G1 X198.116 Y72.995 E.19267
G1 X197.336 Y72.806 E.02175
G1 X202.768 Y78.238 E.20817
G1 X202.393 Y78.453 E.01172
G1 X196.556 Y72.616 E.22368
G1 X195.776 Y72.427 E.02175
G1 X202.018 Y78.669 E.23919
G1 X201.642 Y78.884 E.01172
G1 X194.996 Y72.237 E.25469
G1 X194.216 Y72.048 E.02175
G1 X201.267 Y79.099 E.2702
G1 X200.892 Y79.314 E.01172
G1 X193.436 Y71.858 E.2857
G1 X192.656 Y71.669 E.02175
G1 X200.517 Y79.529 E.30121
G1 X200.141 Y79.744 E.01172
G1 X191.877 Y71.479 E.31671
G1 X191.097 Y71.29 E.02175
G1 X199.766 Y79.959 E.33222
G1 X199.391 Y80.174 E.01172
G1 X190.317 Y71.1 E.34773
G1 X189.537 Y70.911 E.02175
G1 X199.016 Y80.39 E.36323
G1 X198.64 Y80.605 E.01172
G1 X188.757 Y70.721 E.37874
G1 X187.977 Y70.532 E.02175
G1 X198.265 Y80.82 E.39424
G1 X197.89 Y81.035 E.01172
G1 X187.197 Y70.342 E.40975
G1 X186.417 Y70.153 E.02175
G1 X197.515 Y81.25 E.42526
G1 X197.139 Y81.465 E.01172
G1 X185.638 Y69.963 E.44076
G1 X184.858 Y69.774 E.02175
G1 X196.764 Y81.68 E.45627
G1 X196.389 Y81.895 E.01172
G1 X184.078 Y69.584 E.47177
G1 X183.298 Y69.395 E.02175
G1 X196.014 Y82.11 E.48728
G1 X195.638 Y82.326 E.01172
G1 X182.518 Y69.205 E.50278
G1 X181.738 Y69.016 E.02175
G1 X195.263 Y82.541 E.51829
G1 X194.888 Y82.756 E.01172
G1 X180.958 Y68.826 E.5338
G1 X180.178 Y68.637 E.02175
G1 X194.513 Y82.971 E.5493
G1 X194.137 Y83.186 E.01172
G1 X179.399 Y68.447 E.56481
G1 X178.619 Y68.258 E.02175
G1 X193.762 Y83.401 E.58031
G1 X193.387 Y83.616 E.01172
G1 X177.839 Y68.068 E.59582
G1 X177.059 Y67.879 E.02175
G1 X193.012 Y83.831 E.61133
G1 X192.636 Y84.047 E.01172
G1 X176.279 Y67.689 E.62683
G1 X175.499 Y67.5 E.02175
G1 X192.261 Y84.262 E.64234
G1 X191.886 Y84.477 E.01172
G1 X174.719 Y67.31 E.65784
G1 X173.939 Y67.121 E.02175
G1 X191.511 Y84.692 E.67335
G1 X191.135 Y84.907 E.01172
G1 X173.16 Y66.931 E.68885
G1 X172.38 Y66.742 E.02175
G1 X190.76 Y85.122 E.70436
G1 X190.385 Y85.337 E.01172
G1 X171.6 Y66.552 E.71987
G1 X170.82 Y66.363 E.02175
G1 X190.01 Y85.552 E.73537
G1 X189.635 Y85.768 E.01172
G1 X170.04 Y66.173 E.75088
G1 X169.26 Y65.984 E.02175
G1 X189.259 Y85.983 E.76638
G1 X188.884 Y86.198 E.01172
G1 X168.48 Y65.794 E.78189
G1 X167.7 Y65.605 E.02175
G1 X188.509 Y86.413 E.7974
G1 X188.134 Y86.628 E.01172
G1 X166.921 Y65.415 E.8129
G1 X166.141 Y65.226 E.02175
G1 X187.758 Y86.843 E.82841
G1 X187.383 Y87.058 E.01172
G1 X165.361 Y65.036 E.84391
G1 X164.581 Y64.847 E.02175
G1 X187.008 Y87.273 E.85942
G1 X186.633 Y87.488 E.01172
G1 X163.801 Y64.657 E.87493
G1 X163.021 Y64.468 E.02175
G1 X186.257 Y87.704 E.89043
G1 X185.882 Y87.919 E.01172
G1 X162.241 Y64.278 E.90594
G1 X161.461 Y64.089 E.02175
G1 X185.507 Y88.134 E.92144
G1 X185.132 Y88.349 E.01172
G1 X160.682 Y63.899 E.93695
G1 X159.902 Y63.709 E.02175
G1 X184.756 Y88.564 E.95245
G1 X184.381 Y88.779 E.01172
G1 X159.122 Y63.52 E.96796
G1 X158.342 Y63.33 E.02175
G1 X184.006 Y88.994 E.98347
G1 X183.631 Y89.209 E.01172
G1 X157.562 Y63.141 E.99897
G1 X156.782 Y62.951 E.02175
G1 X183.255 Y89.425 E1.01448
G1 X182.88 Y89.64 E.01172
G1 X156.002 Y62.762 E1.02998
G1 X155.223 Y62.572 E.02175
G1 X182.505 Y89.855 E1.04549
G1 X182.13 Y90.07 E.01172
G1 X154.443 Y62.383 E1.061
G1 X153.663 Y62.193 E.02175
G1 X181.754 Y90.285 E1.0765
G1 X181.379 Y90.5 E.01172
G1 X152.883 Y62.004 E1.09201
G1 X152.103 Y61.814 E.02175
G1 X181.004 Y90.715 E1.10751
G1 X180.629 Y90.93 E.01172
G1 X151.323 Y61.625 E1.12302
G1 X150.543 Y61.435 E.02175
G1 X180.253 Y91.146 E1.13852
G1 X179.878 Y91.361 E.01172
G1 X149.763 Y61.246 E1.15403
G1 X148.984 Y61.056 E.02175
G1 X179.503 Y91.576 E1.16954
G1 X179.128 Y91.791 E.01172
G1 X148.204 Y60.867 E1.18504
G1 X147.424 Y60.677 E.02175
G1 X178.752 Y92.006 E1.20055
G1 X178.377 Y92.221 E.01172
G1 X146.644 Y60.488 E1.21605
G1 X145.864 Y60.298 E.02175
G1 X178.002 Y92.436 E1.23156
G1 X177.627 Y92.651 E.01172
G1 X145.084 Y60.109 E1.24707
G1 X144.304 Y59.919 E.02175
G1 X177.252 Y92.867 E1.26257
G1 X176.876 Y93.082 E.01172
G1 X143.524 Y59.73 E1.27808
G1 X142.745 Y59.54 E.02175
G1 X176.501 Y93.297 E1.29358
G1 X176.126 Y93.512 E.01172
G1 X141.965 Y59.351 E1.30909
G1 X141.185 Y59.161 E.02175
G1 X175.751 Y93.727 E1.32459
G1 X175.375 Y93.942 E.01172
G1 X140.405 Y58.972 E1.3401
G1 X139.625 Y58.782 E.02175
G1 X175 Y94.157 E1.35561
G1 X174.625 Y94.372 E.01172
G1 X138.845 Y58.593 E1.37111
G1 X138.065 Y58.403 E.02175
G1 X174.25 Y94.587 E1.38662
G1 X173.874 Y94.803 E.01172
G1 X137.285 Y58.214 E1.40212
G1 X136.506 Y58.024 E.02175
G1 X173.499 Y95.018 E1.41763
G1 X173.124 Y95.233 E.01172
G1 X135.726 Y57.835 E1.43314
G1 X134.946 Y57.645 E.02175
G1 X172.749 Y95.448 E1.44864
G1 X172.373 Y95.663 E.01172
G1 X134.166 Y57.456 E1.46415
G1 X133.386 Y57.266 E.02175
G1 X171.998 Y95.878 E1.47965
G1 X171.623 Y96.093 E.01172
G1 X132.606 Y57.077 E1.49516
G1 X132.366 Y57.018 E.0067
G1 X132.374 Y57.435 E.0113
G1 X171.248 Y96.308 E1.48967
G1 X170.872 Y96.524 E.01172
G1 X132.386 Y58.038 E1.47482
G1 X132.398 Y58.64 E.01633
G1 X170.497 Y96.739 E1.45998
G1 X170.122 Y96.954 E.01172
G1 X132.41 Y59.242 E1.44514
G1 X132.423 Y59.845 E.01633
G1 X169.747 Y97.169 E1.4303
G1 X169.371 Y97.384 E.01172
G1 X132.435 Y60.447 E1.41546
G1 X132.447 Y61.05 E.01633
G1 X168.996 Y97.599 E1.40062
G1 X168.621 Y97.814 E.01172
G1 X132.459 Y61.652 E1.38577
G1 X132.471 Y62.254 E.01633
G1 X168.246 Y98.029 E1.37093
G1 X167.87 Y98.245 E.01172
G1 X132.483 Y62.857 E1.35609
G1 X132.495 Y63.459 E.01633
G1 X167.495 Y98.46 E1.34125
G1 X167.12 Y98.675 E.01172
G1 X132.507 Y64.062 E1.32641
G1 X132.519 Y64.664 E.01633
G1 X166.745 Y98.89 E1.31157
G1 X166.369 Y99.105 E.01172
G1 X132.531 Y65.267 E1.29672
G1 X132.543 Y65.869 E.01633
G1 X165.994 Y99.32 E1.28188
G1 X165.619 Y99.535 E.01172
G1 X132.555 Y66.471 E1.26704
G1 X132.567 Y67.074 E.01633
G1 X165.244 Y99.75 E1.2522
G1 X164.869 Y99.966 E.01172
G1 X132.579 Y67.676 E1.23736
G1 X132.591 Y68.279 E.01633
G1 X164.493 Y100.181 E1.22252
G1 X164.118 Y100.396 E.01172
G1 X132.603 Y68.881 E1.20767
G1 X132.615 Y69.484 E.01633
G1 X163.743 Y100.611 E1.19283
G1 X163.368 Y100.826 E.01172
G1 X132.627 Y70.086 E1.17799
G1 X132.64 Y70.688 E.01633
G1 X162.992 Y101.041 E1.16315
G1 X162.617 Y101.256 E.01172
G1 X132.652 Y71.291 E1.14831
G1 X132.664 Y71.893 E.01633
M73 P57 R30
G1 X162.242 Y101.471 E1.13347
G1 X161.867 Y101.686 E.01172
G1 X132.676 Y72.496 E1.11863
G1 X132.688 Y73.098 E.01633
G1 X161.491 Y101.902 E1.10378
G1 X161.116 Y102.117 E.01172
G1 X132.7 Y73.7 E1.08894
G1 X132.712 Y74.303 E.01633
G1 X160.741 Y102.332 E1.0741
G1 X160.366 Y102.547 E.01172
G1 X132.724 Y74.905 E1.05926
G1 X132.736 Y75.508 E.01633
G1 X159.99 Y102.762 E1.04442
G1 X159.615 Y102.977 E.01172
G1 X132.748 Y76.11 E1.02958
G1 X132.76 Y76.713 E.01633
G1 X159.24 Y103.192 E1.01473
G1 X158.865 Y103.407 E.01172
G1 X132.772 Y77.315 E.99989
G1 X132.784 Y77.917 E.01633
G1 X158.489 Y103.623 E.98505
G1 X158.114 Y103.838 E.01172
G1 X132.796 Y78.52 E.97021
G1 X132.808 Y79.122 E.01633
G1 X157.739 Y104.053 E.95537
G1 X157.364 Y104.268 E.01172
G1 X132.82 Y79.725 E.94053
G1 X132.832 Y80.327 E.01633
G1 X156.988 Y104.483 E.92568
G1 X156.613 Y104.698 E.01172
G1 X132.844 Y80.929 E.91084
G1 X132.856 Y81.532 E.01633
G1 X156.238 Y104.913 E.896
G1 X155.863 Y105.128 E.01172
G1 X132.869 Y82.134 E.88116
G1 X132.881 Y82.737 E.01633
G1 X155.487 Y105.344 E.86632
G1 X155.112 Y105.559 E.01172
G1 X132.893 Y83.339 E.85148
G1 X132.905 Y83.942 E.01633
G1 X154.737 Y105.774 E.83664
G1 X154.362 Y105.989 E.01172
G1 X132.917 Y84.544 E.82179
G1 X132.929 Y85.146 E.01633
G1 X153.986 Y106.204 E.80695
G1 X153.611 Y106.419 E.01172
G1 X132.941 Y85.749 E.79211
G1 X132.953 Y86.351 E.01633
G1 X153.236 Y106.634 E.77727
G1 X152.861 Y106.849 E.01172
G1 X132.965 Y86.954 E.76243
G1 X132.977 Y87.556 E.01633
G1 X152.486 Y107.065 E.74759
G1 X152.11 Y107.28 E.01172
G1 X132.989 Y88.158 E.73274
G1 X133.001 Y88.761 E.01633
G1 X151.735 Y107.495 E.7179
G1 X151.36 Y107.71 E.01172
G1 X133.013 Y89.363 E.70306
G1 X133.025 Y89.966 E.01633
G1 X150.985 Y107.925 E.68822
G1 X150.609 Y108.14 E.01172
G1 X133.037 Y90.568 E.67338
G1 X133.049 Y91.171 E.01633
G1 X150.234 Y108.355 E.65854
G1 X149.859 Y108.57 E.01172
G1 X133.061 Y91.773 E.64369
G1 X133.073 Y92.375 E.01633
G1 X149.484 Y108.785 E.62885
G1 X149.108 Y109.001 E.01172
G1 X133.086 Y92.978 E.61401
G1 X133.098 Y93.58 E.01633
G1 X148.733 Y109.216 E.59917
G1 X148.358 Y109.431 E.01172
G1 X133.11 Y94.183 E.58433
G1 X133.122 Y94.785 E.01633
G1 X147.983 Y109.646 E.56949
G1 X147.607 Y109.861 E.01172
G1 X133.134 Y95.387 E.55464
G1 X133.146 Y95.99 E.01633
G1 X147.232 Y110.076 E.5398
G1 X146.857 Y110.291 E.01172
G1 X133.158 Y96.592 E.52496
G1 X133.17 Y97.195 E.01633
G1 X146.482 Y110.506 E.51012
M73 P57 R29
G1 X146.106 Y110.722 E.01172
G1 X133.182 Y97.797 E.49528
G1 X133.194 Y98.4 E.01633
G1 X145.727 Y110.932 E.48028
G1 X145.561 Y110.932 E.00449
G1 X144.556 Y110.352 E.03146
G1 X133.206 Y99.002 E.43493
G1 X133.218 Y99.604 E.01633
G1 X143.159 Y109.545 E.38095
G1 X141.762 Y108.739 E.0437
G1 X133.23 Y100.207 E.32696
G1 X133.242 Y100.809 E.01633
G1 X140.365 Y107.932 E.27297
G1 X138.969 Y107.126 E.0437
G1 X133.254 Y101.412 E.21898
G1 X133.266 Y102.014 E.01633
G1 X137.572 Y106.32 E.16499
G1 X136.175 Y105.513 E.0437
G1 X133.278 Y102.616 E.111
G1 X133.29 Y103.219 E.01633
G1 X135.289 Y105.218 E.0766
; OBJECT_ID: 353
; WIPE_START
G1 X133.875 Y103.803 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 325
M625
; start printing object, unique label id: 353
M624 AgAAAAAAAAA=
M204 S10000
G1 X139.745 Y108.682 Z1.72 F30000
G1 X215.595 Y171.729 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X149.657 Y133.927 E2.05953
G1 X149.474 Y133.612 E.00987
G1 X149.474 Y118.388 E.41253
G1 X149.657 Y118.073 E.00986
G1 X215.595 Y80.271 E2.05953
G1 X215.595 Y171.669 E2.4766
M204 S10000
G1 X215.996 Y172.261 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X215.858 Y172.341 E.004
G1 X149.364 Y134.221 E1.92699
G1 X149.073 Y133.72 E.01457
G1 X149.073 Y118.28 E.38817
G1 X149.364 Y117.779 E.01457
G1 X215.858 Y79.659 E1.92699
G1 X215.996 Y79.739 E.004
G1 X215.996 Y172.201 E2.32465
; WIPE_START
M204 S4000
G1 X215.858 Y172.341 E-.07455
G1 X214.293 Y171.444 E-.68545
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X215.239 Y171.33 Z1.72 F30000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X215.239 Y80.885 E2.45079
G1 X214.823 Y81.124 E.01301
G1 X214.823 Y170.876 E2.43201
G1 X214.406 Y170.637 E.01301
G1 X214.406 Y81.363 E2.41906
G1 X213.989 Y81.602 E.01301
G1 X213.989 Y170.398 E2.40612
G1 X213.573 Y170.159 E.01301
G1 X213.573 Y81.841 E2.39318
G1 X213.156 Y82.079 E.01301
G1 X213.156 Y169.92 E2.38023
G1 X212.74 Y169.682 E.01301
G1 X212.74 Y82.318 E2.36729
G1 X212.323 Y82.557 E.01301
G1 X212.323 Y169.443 E2.35435
G1 X211.906 Y169.204 E.01301
G1 X211.906 Y82.796 E2.3414
G1 X211.49 Y83.035 E.01301
G1 X211.49 Y168.965 E2.32846
G1 X211.073 Y168.726 E.01301
G1 X211.073 Y83.274 E2.31552
G1 X210.656 Y83.513 E.01301
G1 X210.656 Y168.487 E2.30257
G1 X210.24 Y168.249 E.01301
G1 X210.24 Y83.751 E2.28963
G1 X209.823 Y83.99 E.01301
G1 X209.823 Y168.01 E2.27668
G1 X209.407 Y167.771 E.01301
G1 X209.407 Y84.229 E2.26374
G1 X208.99 Y84.468 E.01301
G1 X208.99 Y167.532 E2.2508
G1 X208.573 Y167.293 E.01301
G1 X208.573 Y84.707 E2.23785
G1 X208.157 Y84.946 E.01301
G1 X208.157 Y167.054 E2.22491
G1 X207.74 Y166.816 E.01301
G1 X207.74 Y85.184 E2.21197
G1 X207.324 Y85.423 E.01301
G1 X207.324 Y166.577 E2.19902
G1 X206.907 Y166.338 E.01301
G1 X206.907 Y85.662 E2.18608
G1 X206.49 Y85.901 E.01301
G1 X206.49 Y166.099 E2.17314
G1 X206.074 Y165.86 E.01301
G1 X206.074 Y86.14 E2.16019
G1 X205.657 Y86.379 E.01301
G1 X205.657 Y165.621 E2.14725
G1 X205.241 Y165.383 E.01301
G1 X205.241 Y86.617 E2.13431
G1 X204.824 Y86.856 E.01301
G1 X204.824 Y165.144 E2.12136
G1 X204.407 Y164.905 E.01301
G1 X204.407 Y87.095 E2.10842
G1 X203.991 Y87.334 E.01301
G1 X203.991 Y164.666 E2.09548
G1 X203.574 Y164.427 E.01301
G1 X203.574 Y87.573 E2.08253
G1 X203.157 Y87.812 E.01301
G1 X203.157 Y164.188 E2.06959
G1 X202.741 Y163.95 E.01301
G1 X202.741 Y88.05 E2.05664
G1 X202.324 Y88.289 E.01301
G1 X202.324 Y163.711 E2.0437
G1 X201.908 Y163.472 E.01301
G1 X201.908 Y88.528 E2.03076
G1 X201.491 Y88.767 E.01301
G1 X201.491 Y163.233 E2.01781
G1 X201.074 Y162.994 E.01301
G1 X201.074 Y89.006 E2.00487
G1 X200.658 Y89.245 E.01301
G1 X200.658 Y162.755 E1.99193
G1 X200.241 Y162.517 E.01301
G1 X200.241 Y89.483 E1.97898
G1 X199.825 Y89.722 E.01301
G1 X199.825 Y162.278 E1.96604
G1 X199.408 Y162.039 E.01301
G1 X199.408 Y89.961 E1.9531
G1 X198.991 Y90.2 E.01301
G1 X198.991 Y161.8 E1.94015
G1 X198.575 Y161.561 E.01301
G1 X198.575 Y90.439 E1.92721
G1 X198.158 Y90.678 E.01301
G1 X198.158 Y161.322 E1.91427
G1 X197.742 Y161.084 E.01301
G1 X197.742 Y90.916 E1.90132
G1 X197.325 Y91.155 E.01301
G1 X197.325 Y160.845 E1.88838
G1 X196.908 Y160.606 E.01301
G1 X196.908 Y91.394 E1.87543
G1 X196.492 Y91.633 E.01301
G1 X196.492 Y160.367 E1.86249
G1 X196.075 Y160.128 E.01301
G1 X196.075 Y91.872 E1.84955
G1 X195.659 Y92.111 E.01301
G1 X195.659 Y159.889 E1.8366
G1 X195.242 Y159.651 E.01301
G1 X195.242 Y92.349 E1.82366
G1 X194.825 Y92.588 E.01301
G1 X194.825 Y159.412 E1.81072
G1 X194.409 Y159.173 E.01301
G1 X194.409 Y92.827 E1.79777
G1 X193.992 Y93.066 E.01301
G1 X193.992 Y158.934 E1.78483
G1 X193.575 Y158.695 E.01301
G1 X193.575 Y93.305 E1.77189
G1 X193.159 Y93.544 E.01301
G1 X193.159 Y158.456 E1.75894
G1 X192.742 Y158.217 E.01301
G1 X192.742 Y93.782 E1.746
G1 X192.326 Y94.021 E.01301
G1 X192.326 Y157.979 E1.73306
G1 X191.909 Y157.74 E.01301
G1 X191.909 Y94.26 E1.72011
G1 X191.492 Y94.499 E.01301
G1 X191.492 Y157.501 E1.70717
G1 X191.076 Y157.262 E.01301
G1 X191.076 Y94.738 E1.69423
G1 X190.659 Y94.977 E.01301
G1 X190.659 Y157.023 E1.68128
G1 X190.243 Y156.784 E.01301
G1 X190.243 Y95.216 E1.66834
G1 X189.826 Y95.454 E.01301
G1 X189.826 Y156.546 E1.65539
M73 P58 R29
G1 X189.409 Y156.307 E.01301
G1 X189.409 Y95.693 E1.64245
G1 X188.993 Y95.932 E.01301
G1 X188.993 Y156.068 E1.62951
G1 X188.576 Y155.829 E.01301
G1 X188.576 Y96.171 E1.61656
G1 X188.16 Y96.41 E.01301
G1 X188.16 Y155.59 E1.60362
G1 X187.743 Y155.351 E.01301
G1 X187.743 Y96.649 E1.59068
G1 X187.326 Y96.887 E.01301
G1 X187.326 Y155.113 E1.57773
G1 X186.91 Y154.874 E.01301
G1 X186.91 Y97.126 E1.56479
G1 X186.493 Y97.365 E.01301
G1 X186.493 Y154.635 E1.55185
G1 X186.076 Y154.396 E.01301
G1 X186.076 Y97.604 E1.5389
G1 X185.66 Y97.843 E.01301
G1 X185.66 Y154.157 E1.52596
G1 X185.243 Y153.918 E.01301
G1 X185.243 Y98.082 E1.51302
G1 X184.827 Y98.32 E.01301
G1 X184.827 Y153.68 E1.50007
G1 X184.41 Y153.441 E.01301
G1 X184.41 Y98.559 E1.48713
G1 X183.993 Y98.798 E.01301
G1 X183.993 Y153.202 E1.47418
G1 X183.577 Y152.963 E.01301
G1 X183.577 Y99.037 E1.46124
G1 X183.16 Y99.276 E.01301
G1 X183.16 Y152.724 E1.4483
G1 X182.744 Y152.485 E.01301
G1 X182.744 Y99.515 E1.43535
G1 X182.327 Y99.753 E.01301
G1 X182.327 Y152.247 E1.42241
G1 X181.91 Y152.008 E.01301
G1 X181.91 Y99.992 E1.40947
G1 X181.494 Y100.231 E.01301
G1 X181.494 Y151.769 E1.39652
G1 X181.077 Y151.53 E.01301
G1 X181.077 Y100.47 E1.38358
G1 X180.661 Y100.709 E.01301
G1 X180.661 Y151.291 E1.37064
G1 X180.244 Y151.052 E.01301
G1 X180.244 Y100.948 E1.35769
G1 X179.827 Y101.186 E.01301
G1 X179.827 Y150.814 E1.34475
G1 X179.411 Y150.575 E.01301
G1 X179.411 Y101.425 E1.33181
G1 X178.994 Y101.664 E.01301
G1 X178.994 Y150.336 E1.31886
G1 X178.577 Y150.097 E.01301
G1 X178.577 Y101.903 E1.30592
G1 X178.161 Y102.142 E.01301
G1 X178.161 Y149.858 E1.29298
G1 X177.744 Y149.619 E.01301
G1 X177.744 Y102.381 E1.28003
G1 X177.328 Y102.619 E.01301
G1 X177.328 Y149.381 E1.26709
G1 X176.911 Y149.142 E.01301
G1 X176.911 Y102.858 E1.25414
G1 X176.494 Y103.097 E.01301
G1 X176.494 Y148.903 E1.2412
G1 X176.078 Y148.664 E.01301
G1 X176.078 Y103.336 E1.22826
G1 X175.661 Y103.575 E.01301
G1 X175.661 Y148.425 E1.21531
G1 X175.245 Y148.186 E.01301
G1 X175.245 Y103.814 E1.20237
G1 X174.828 Y104.052 E.01301
G1 X174.828 Y147.948 E1.18943
G1 X174.411 Y147.709 E.01301
G1 X174.411 Y104.291 E1.17648
G1 X173.995 Y104.53 E.01301
G1 X173.995 Y147.47 E1.16354
G1 X173.578 Y147.231 E.01301
G1 X173.578 Y104.769 E1.1506
G1 X173.162 Y105.008 E.01301
G1 X173.162 Y146.992 E1.13765
G1 X172.745 Y146.753 E.01301
G1 X172.745 Y105.247 E1.12471
G1 X172.328 Y105.485 E.01301
G1 X172.328 Y146.515 E1.11177
G1 X171.912 Y146.276 E.01301
G1 X171.912 Y105.724 E1.09882
G1 X171.495 Y105.963 E.01301
G1 X171.495 Y146.037 E1.08588
G1 X171.079 Y145.798 E.01301
G1 X171.079 Y106.202 E1.07294
G1 X170.662 Y106.441 E.01301
G1 X170.662 Y145.559 E1.05999
G1 X170.245 Y145.32 E.01301
G1 X170.245 Y106.68 E1.04705
G1 X169.829 Y106.918 E.01301
G1 X169.829 Y145.081 E1.0341
G1 X169.412 Y144.843 E.01301
G1 X169.412 Y107.157 E1.02116
G1 X168.995 Y107.396 E.01301
G1 X168.995 Y144.604 E1.00822
G1 X168.579 Y144.365 E.01301
G1 X168.579 Y107.635 E.99527
G1 X168.162 Y107.874 E.01301
G1 X168.162 Y144.126 E.98233
G1 X167.746 Y143.887 E.01301
G1 X167.746 Y108.113 E.96939
G1 X167.329 Y108.352 E.01301
G1 X167.329 Y143.648 E.95644
G1 X166.912 Y143.41 E.01301
G1 X166.912 Y108.59 E.9435
G1 X166.496 Y108.829 E.01301
G1 X166.496 Y143.171 E.93056
G1 X166.079 Y142.932 E.01301
G1 X166.079 Y109.068 E.91761
G1 X165.663 Y109.307 E.01301
G1 X165.663 Y142.693 E.90467
G1 X165.246 Y142.454 E.01301
G1 X165.246 Y109.546 E.89173
G1 X164.829 Y109.785 E.01301
G1 X164.829 Y142.215 E.87878
G1 X164.413 Y141.977 E.01301
G1 X164.413 Y110.023 E.86584
G1 X163.996 Y110.262 E.01301
G1 X163.996 Y141.738 E.85289
G1 X163.58 Y141.499 E.01301
G1 X163.58 Y110.501 E.83995
G1 X163.163 Y110.74 E.01301
G1 X163.163 Y141.26 E.82701
G1 X162.746 Y141.021 E.01301
G1 X162.746 Y110.979 E.81406
G1 X162.33 Y111.218 E.01301
G1 X162.33 Y140.782 E.80112
G1 X161.913 Y140.544 E.01301
G1 X161.913 Y111.456 E.78818
G1 X161.496 Y111.695 E.01301
G1 X161.496 Y140.305 E.77523
G1 X161.08 Y140.066 E.01301
G1 X161.08 Y111.934 E.76229
G1 X160.663 Y112.173 E.01301
G1 X160.663 Y139.827 E.74935
G1 X160.247 Y139.588 E.01301
G1 X160.247 Y112.412 E.7364
G1 X159.83 Y112.651 E.01301
G1 X159.83 Y139.349 E.72346
G1 X159.413 Y139.111 E.01301
G1 X159.413 Y112.889 E.71052
G1 X158.997 Y113.128 E.01301
G1 X158.997 Y138.872 E.69757
G1 X158.58 Y138.633 E.01301
G1 X158.58 Y113.367 E.68463
G1 X158.164 Y113.606 E.01301
G1 X158.164 Y138.394 E.67169
G1 X157.747 Y138.155 E.01301
G1 X157.747 Y113.845 E.65874
G1 X157.33 Y114.084 E.01301
G1 X157.33 Y137.916 E.6458
G1 X156.914 Y137.678 E.01301
G1 X156.914 Y114.322 E.63285
G1 X156.497 Y114.561 E.01301
G1 X156.497 Y137.439 E.61991
G1 X156.081 Y137.2 E.01301
G1 X156.081 Y114.8 E.60697
G1 X155.664 Y115.039 E.01301
G1 X155.664 Y136.961 E.59402
G1 X155.247 Y136.722 E.01301
G1 X155.247 Y115.278 E.58108
G1 X154.831 Y115.517 E.01301
G1 X154.831 Y136.483 E.56814
G1 X154.414 Y136.245 E.01301
G1 X154.414 Y115.755 E.55519
G1 X153.998 Y115.994 E.01301
G1 X153.998 Y136.006 E.54225
G1 X153.581 Y135.767 E.01301
G1 X153.581 Y116.233 E.52931
G1 X153.164 Y116.472 E.01301
G1 X153.164 Y135.528 E.51636
G1 X152.748 Y135.289 E.01301
G1 X152.748 Y116.711 E.50342
G1 X152.331 Y116.95 E.01301
G1 X152.331 Y135.05 E.49048
G1 X151.914 Y134.812 E.01301
G1 X151.914 Y117.188 E.47753
G1 X151.498 Y117.427 E.01301
G1 X151.498 Y134.573 E.46459
G1 X151.081 Y134.334 E.01301
G1 X151.081 Y117.666 E.45164
G1 X150.665 Y117.905 E.01301
G1 X150.665 Y134.095 E.4387
G1 X150.248 Y133.856 E.01301
G1 X150.248 Y118.144 E.42576
M73 P58 R28
G2 X149.831 Y118.481 I.082 J.528 E.01521
G1 X149.831 Y133.833 E.416
; OBJECT_ID: 381
; WIPE_START
G1 X149.831 Y131.833 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 353
M625
; start printing object, unique label id: 381
M624 BAAAAAAAAAA=
M204 S10000
G1 X155.9 Y136.462 Z1.72 F30000
G1 X208.756 Y176.785 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X132.001 Y195.436 E2.14036
G1 X132.947 Y148.153 E1.28149
G1 X133.139 Y147.829 E.01019
G1 X145.466 Y140.712 E.3857
G1 X145.833 Y140.712 E.00995
G1 X208.704 Y176.755 E1.96372
; WIPE_START
G1 X206.761 Y177.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.813 Y176.929 Z1.72 F30000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X131.814 Y195.894 E2.01813
G1 X131.595 Y195.718 E.00708
G1 X132.549 Y148.04 E1.19892
G1 X132.847 Y147.535 E.01475
G1 X145.358 Y140.312 E.3632
G1 X145.939 Y140.311 E.01461
G1 X209.761 Y176.899 E1.84954
; WIPE_START
M204 S4000
G1 X207.818 Y177.373 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.22 Y176.985 Z1.72 F30000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.646 Y176.558 E.01634
G1 X207.271 Y176.343 E.01172
G1 X206.694 Y176.92 E.0221
G1 X205.914 Y177.109 E.02175
G1 X206.896 Y176.128 E.03761
G1 X206.52 Y175.913 E.01172
G1 X205.134 Y177.299 E.05312
G1 X204.354 Y177.488 E.02175
G1 X206.145 Y175.698 E.06862
G1 X205.77 Y175.483 E.01172
G1 X203.575 Y177.678 E.08413
G1 X202.795 Y177.868 E.02175
G1 X205.395 Y175.268 E.09963
G1 X205.019 Y175.052 E.01172
G1 X202.015 Y178.057 E.11514
G1 X201.235 Y178.247 E.02175
G1 X204.644 Y174.837 E.13064
G1 X204.269 Y174.622 E.01172
G1 X200.455 Y178.436 E.14615
G1 X199.675 Y178.626 E.02175
G1 X203.894 Y174.407 E.16166
G1 X203.518 Y174.192 E.01172
G1 X198.895 Y178.815 E.17716
G1 X198.116 Y179.005 E.02175
G1 X203.143 Y173.977 E.19267
G1 X202.768 Y173.762 E.01172
G1 X197.336 Y179.194 E.20817
G1 X196.556 Y179.384 E.02175
G1 X202.393 Y173.547 E.22368
G1 X202.018 Y173.331 E.01172
G1 X195.776 Y179.573 E.23919
G1 X194.996 Y179.763 E.02175
G1 X201.642 Y173.116 E.25469
G1 X201.267 Y172.901 E.01172
G1 X194.216 Y179.952 E.2702
G1 X193.436 Y180.142 E.02175
G1 X200.892 Y172.686 E.2857
G1 X200.517 Y172.471 E.01172
G1 X192.656 Y180.331 E.30121
G1 X191.877 Y180.521 E.02175
G1 X200.141 Y172.256 E.31671
G1 X199.766 Y172.041 E.01172
G1 X191.097 Y180.71 E.33222
G1 X190.317 Y180.9 E.02175
G1 X199.391 Y171.826 E.34773
G1 X199.016 Y171.61 E.01172
G1 X189.537 Y181.089 E.36323
G1 X188.757 Y181.279 E.02175
G1 X198.64 Y171.395 E.37874
G1 X198.265 Y171.18 E.01172
G1 X187.977 Y181.468 E.39424
G1 X187.197 Y181.658 E.02175
G1 X197.89 Y170.965 E.40975
G1 X197.515 Y170.75 E.01172
G1 X186.417 Y181.847 E.42526
G1 X185.638 Y182.037 E.02175
G1 X197.139 Y170.535 E.44076
G1 X196.764 Y170.32 E.01172
G1 X184.858 Y182.226 E.45627
G1 X184.078 Y182.416 E.02175
G1 X196.389 Y170.105 E.47177
G1 X196.014 Y169.89 E.01172
G1 X183.298 Y182.605 E.48728
G1 X182.518 Y182.795 E.02175
G1 X195.638 Y169.674 E.50279
G1 X195.263 Y169.459 E.01172
G1 X181.738 Y182.984 E.51829
G1 X180.958 Y183.174 E.02175
G1 X194.888 Y169.244 E.5338
G1 X194.513 Y169.029 E.01172
G1 X180.178 Y183.363 E.5493
G1 X179.399 Y183.553 E.02175
G1 X194.137 Y168.814 E.56481
G1 X193.762 Y168.599 E.01172
G1 X178.619 Y183.742 E.58031
G1 X177.839 Y183.932 E.02175
G1 X193.387 Y168.384 E.59582
G1 X193.012 Y168.169 E.01172
G1 X177.059 Y184.121 E.61133
G1 X176.279 Y184.311 E.02175
G1 X192.636 Y167.953 E.62683
G1 X192.261 Y167.738 E.01172
G1 X175.499 Y184.5 E.64234
G1 X174.719 Y184.69 E.02175
G1 X191.886 Y167.523 E.65784
G1 X191.511 Y167.308 E.01172
G1 X173.939 Y184.879 E.67335
G1 X173.16 Y185.069 E.02175
G1 X191.135 Y167.093 E.68886
G1 X190.76 Y166.878 E.01172
G1 X172.38 Y185.258 E.70436
G1 X171.6 Y185.448 E.02175
G1 X190.385 Y166.663 E.71987
M73 P59 R28
G1 X190.01 Y166.448 E.01172
G1 X170.82 Y185.637 E.73537
G1 X170.04 Y185.827 E.02175
G1 X189.635 Y166.232 E.75088
G1 X189.259 Y166.017 E.01172
G1 X169.26 Y186.016 E.76638
G1 X168.48 Y186.206 E.02175
G1 X188.884 Y165.802 E.78189
G1 X188.509 Y165.587 E.01172
G1 X167.7 Y186.395 E.7974
G1 X166.921 Y186.585 E.02175
G1 X188.134 Y165.372 E.8129
G1 X187.758 Y165.157 E.01172
G1 X166.141 Y186.774 E.82841
G1 X165.361 Y186.964 E.02175
G1 X187.383 Y164.942 E.84391
G1 X187.008 Y164.727 E.01172
G1 X164.581 Y187.153 E.85942
G1 X163.801 Y187.343 E.02175
G1 X186.633 Y164.511 E.87493
G1 X186.257 Y164.296 E.01172
G1 X163.021 Y187.532 E.89043
G1 X162.241 Y187.722 E.02175
G1 X185.882 Y164.081 E.90594
G1 X185.507 Y163.866 E.01172
G1 X161.461 Y187.911 E.92144
G1 X160.682 Y188.101 E.02175
G1 X185.132 Y163.651 E.93695
G1 X184.756 Y163.436 E.01172
G1 X159.902 Y188.291 E.95245
G1 X159.122 Y188.48 E.02175
G1 X184.381 Y163.221 E.96796
G1 X184.006 Y163.006 E.01172
G1 X158.342 Y188.67 E.98347
G1 X157.562 Y188.859 E.02175
G1 X183.631 Y162.791 E.99897
G1 X183.255 Y162.575 E.01172
G1 X156.782 Y189.049 E1.01448
G1 X156.002 Y189.238 E.02175
G1 X182.88 Y162.36 E1.02998
G1 X182.505 Y162.145 E.01172
G1 X155.223 Y189.428 E1.04549
G1 X154.443 Y189.617 E.02175
G1 X182.13 Y161.93 E1.061
G1 X181.754 Y161.715 E.01172
G1 X153.663 Y189.807 E1.0765
G1 X152.883 Y189.996 E.02175
G1 X181.379 Y161.5 E1.09201
G1 X181.004 Y161.285 E.01172
G1 X152.103 Y190.186 E1.10751
G1 X151.323 Y190.375 E.02175
G1 X180.629 Y161.07 E1.12302
G1 X180.253 Y160.854 E.01172
G1 X150.543 Y190.565 E1.13853
G1 X149.763 Y190.754 E.02175
G1 X179.878 Y160.639 E1.15403
G1 X179.503 Y160.424 E.01172
G1 X148.984 Y190.944 E1.16954
G1 X148.204 Y191.133 E.02175
G1 X179.128 Y160.209 E1.18504
G1 X178.752 Y159.994 E.01172
G1 X147.424 Y191.323 E1.20055
G1 X146.644 Y191.512 E.02175
G1 X178.377 Y159.779 E1.21605
G1 X178.002 Y159.564 E.01172
G1 X145.864 Y191.702 E1.23156
G1 X145.084 Y191.891 E.02175
G1 X177.627 Y159.349 E1.24707
G1 X177.252 Y159.133 E.01172
G1 X144.304 Y192.081 E1.26257
G1 X143.524 Y192.27 E.02175
G1 X176.876 Y158.918 E1.27808
G1 X176.501 Y158.703 E.01172
G1 X142.745 Y192.46 E1.29358
G1 X141.965 Y192.649 E.02175
G1 X176.126 Y158.488 E1.30909
G1 X175.751 Y158.273 E.01172
G1 X141.185 Y192.839 E1.3246
G1 X140.405 Y193.028 E.02175
G1 X175.375 Y158.058 E1.3401
G1 X175 Y157.843 E.01172
G1 X139.625 Y193.218 E1.35561
G1 X138.845 Y193.407 E.02175
G1 X174.625 Y157.628 E1.37111
G1 X174.25 Y157.413 E.01172
G1 X138.065 Y193.597 E1.38662
G1 X137.285 Y193.786 E.02175
G1 X173.874 Y157.197 E1.40212
G1 X173.499 Y156.982 E.01172
G1 X136.506 Y193.976 E1.41763
G1 X135.726 Y194.165 E.02175
G1 X173.124 Y156.767 E1.43314
G1 X172.749 Y156.552 E.01172
G1 X134.946 Y194.355 E1.44864
G1 X134.166 Y194.544 E.02175
G1 X172.373 Y156.337 E1.46415
G1 X171.998 Y156.122 E.01172
G1 X133.386 Y194.734 E1.47965
G1 X132.606 Y194.923 E.02175
G1 X171.623 Y155.907 E1.49516
G1 X171.248 Y155.692 E.01172
G1 X132.374 Y194.565 E1.48967
G1 X132.386 Y193.962 E.01633
G1 X170.872 Y155.476 E1.47483
G1 X170.497 Y155.261 E.01172
G1 X132.398 Y193.36 E1.45998
G1 X132.41 Y192.758 E.01633
G1 X170.122 Y155.046 E1.44514
G1 X169.747 Y154.831 E.01172
G1 X132.423 Y192.155 E1.4303
G1 X132.435 Y191.553 E.01633
G1 X169.371 Y154.616 E1.41546
G1 X168.996 Y154.401 E.01172
G1 X132.447 Y190.95 E1.40062
G1 X132.459 Y190.348 E.01633
G1 X168.621 Y154.186 E1.38578
G1 X168.246 Y153.971 E.01172
G1 X132.471 Y189.746 E1.37093
G1 X132.483 Y189.143 E.01633
G1 X167.87 Y153.755 E1.35609
G1 X167.495 Y153.54 E.01172
G1 X132.495 Y188.541 E1.34125
G1 X132.507 Y187.938 E.01633
G1 X167.12 Y153.325 E1.32641
G1 X166.745 Y153.11 E.01172
G1 X132.519 Y187.336 E1.31157
G1 X132.531 Y186.733 E.01633
G1 X166.369 Y152.895 E1.29673
G1 X165.994 Y152.68 E.01172
G1 X132.543 Y186.131 E1.28188
G1 X132.555 Y185.529 E.01633
G1 X165.619 Y152.465 E1.26704
G1 X165.244 Y152.25 E.01172
G1 X132.567 Y184.926 E1.2522
G1 X132.579 Y184.324 E.01633
G1 X164.869 Y152.034 E1.23736
G1 X164.493 Y151.819 E.01172
G1 X132.591 Y183.721 E1.22252
G1 X132.603 Y183.119 E.01633
G1 X164.118 Y151.604 E1.20768
G1 X163.743 Y151.389 E.01172
G1 X132.615 Y182.517 E1.19283
G1 X132.627 Y181.914 E.01633
G1 X163.368 Y151.174 E1.17799
G1 X162.992 Y150.959 E.01172
G1 X132.639 Y181.312 E1.16315
G1 X132.652 Y180.709 E.01633
G1 X162.617 Y150.744 E1.14831
G1 X162.242 Y150.529 E.01172
G1 X132.664 Y180.107 E1.13347
G1 X132.676 Y179.504 E.01633
G1 X161.867 Y150.314 E1.11863
G1 X161.491 Y150.098 E.01172
G1 X132.688 Y178.902 E1.10378
G1 X132.7 Y178.3 E.01633
G1 X161.116 Y149.883 E1.08894
G1 X160.741 Y149.668 E.01172
G1 X132.712 Y177.697 E1.0741
G1 X132.724 Y177.095 E.01633
G1 X160.366 Y149.453 E1.05926
G1 X159.99 Y149.238 E.01172
G1 X132.736 Y176.492 E1.04442
G1 X132.748 Y175.89 E.01633
G1 X159.615 Y149.023 E1.02958
G1 X159.24 Y148.808 E.01172
G1 X132.76 Y175.288 E1.01473
G1 X132.772 Y174.685 E.01633
G1 X158.865 Y148.593 E.99989
G1 X158.489 Y148.377 E.01172
G1 X132.784 Y174.083 E.98505
G1 X132.796 Y173.48 E.01633
G1 X158.114 Y148.162 E.97021
G1 X157.739 Y147.947 E.01172
G1 X132.808 Y172.878 E.95537
G1 X132.82 Y172.275 E.01633
G1 X157.364 Y147.732 E.94053
G1 X156.988 Y147.517 E.01172
G1 X132.832 Y171.673 E.92569
G1 X132.844 Y171.071 E.01633
G1 X156.613 Y147.302 E.91084
G1 X156.238 Y147.087 E.01172
G1 X132.856 Y170.468 E.896
G1 X132.869 Y169.866 E.01633
G1 X155.863 Y146.872 E.88116
G1 X155.487 Y146.656 E.01172
G1 X132.881 Y169.263 E.86632
G1 X132.893 Y168.661 E.01633
G1 X155.112 Y146.441 E.85148
G1 X154.737 Y146.226 E.01172
G1 X132.905 Y168.058 E.83664
G1 X132.917 Y167.456 E.01633
G1 X154.362 Y146.011 E.82179
G1 X153.986 Y145.796 E.01172
G1 X132.929 Y166.854 E.80695
G1 X132.941 Y166.251 E.01633
G1 X153.611 Y145.581 E.79211
G1 X153.236 Y145.366 E.01172
G1 X132.953 Y165.649 E.77727
G1 X132.965 Y165.046 E.01633
G1 X152.861 Y145.151 E.76243
G1 X152.486 Y144.935 E.01172
G1 X132.977 Y164.444 E.74759
G1 X132.989 Y163.842 E.01633
G1 X152.11 Y144.72 E.73275
G1 X151.735 Y144.505 E.01172
G1 X133.001 Y163.239 E.7179
G1 X133.013 Y162.637 E.01633
G1 X151.36 Y144.29 E.70306
G1 X150.985 Y144.075 E.01172
G1 X133.025 Y162.034 E.68822
G1 X133.037 Y161.432 E.01633
G1 X150.609 Y143.86 E.67338
G1 X150.234 Y143.645 E.01172
G1 X133.049 Y160.829 E.65854
G1 X133.061 Y160.227 E.01633
G1 X149.859 Y143.43 E.64369
G1 X149.484 Y143.215 E.01172
G1 X133.073 Y159.625 E.62885
G1 X133.085 Y159.022 E.01633
G1 X149.108 Y142.999 E.61401
G1 X148.733 Y142.784 E.01172
G1 X133.098 Y158.42 E.59917
G1 X133.11 Y157.817 E.01633
G1 X148.358 Y142.569 E.58433
G1 X147.983 Y142.354 E.01172
G1 X133.122 Y157.215 E.56949
G1 X133.134 Y156.613 E.01633
G1 X147.607 Y142.139 E.55465
G1 X147.232 Y141.924 E.01172
G1 X133.146 Y156.01 E.5398
G1 X133.158 Y155.408 E.01633
G1 X146.857 Y141.709 E.52496
G1 X146.482 Y141.494 E.01172
G1 X133.17 Y154.805 E.51012
G1 X133.182 Y154.203 E.01633
G1 X146.106 Y141.278 E.49528
G1 X145.727 Y141.068 E.01176
G1 X133.194 Y153.6 E.48027
G1 X133.206 Y152.998 E.01633
G1 X144.556 Y141.648 E.43493
G1 X143.159 Y142.455 E.04371
G1 X133.218 Y152.396 E.38094
G1 X133.23 Y151.793 E.01633
G1 X141.762 Y143.261 E.32695
G1 X140.365 Y144.068 E.0437
G1 X133.242 Y151.191 E.27297
G1 X133.254 Y150.588 E.01633
G1 X138.969 Y144.874 E.21898
G1 X137.572 Y145.681 E.0437
G1 X133.266 Y149.986 E.16499
G1 X133.278 Y149.384 E.01633
G1 X136.175 Y146.487 E.111
G1 X134.778 Y147.293 E.0437
G1 X133.1 Y148.972 E.06432
; OBJECT_ID: 409
; WIPE_START
G1 X134.514 Y147.558 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 381
M625
; start printing object, unique label id: 409
M624 CAAAAAAAAAA=
M204 S10000
G1 X127.276 Y149.982 Z1.72 F30000
G1 X47.244 Y176.785 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X110.167 Y140.712 E1.96535
G1 X110.262 Y140.712 E.00258
G1 X110.534 Y140.712 E.00737
G1 X122.861 Y147.829 E.3857
G1 X123.053 Y148.153 E.01019
G1 X123.999 Y195.436 E1.28149
G1 X47.302 Y176.799 E2.13873
; WIPE_START
G1 X49.037 Y175.803 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.188 Y176.941 Z1.72 F30000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X110.061 Y140.311 E1.85116
G1 X110.263 Y140.311 E.00508
G1 X110.642 Y140.312 E.00953
G1 X123.153 Y147.535 E.3632
G1 X123.451 Y148.04 E.01475
G1 X124.405 Y195.718 E1.19892
G1 X124.186 Y195.894 E.00708
G1 X46.247 Y176.955 E2.01651
; WIPE_START
M204 S4000
G1 X47.981 Y175.959 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.783 Y176.985 Z1.72 F30000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.355 Y176.558 E.01639
G1 X48.73 Y176.342 E.01172
G1 X49.308 Y176.921 E.02215
G1 X50.088 Y177.11 E.02175
G1 X49.106 Y176.127 E.03766
G1 X49.481 Y175.912 E.01172
G1 X50.868 Y177.3 E.05316
G1 X51.648 Y177.489 E.02175
G1 X49.856 Y175.697 E.06867
G1 X50.231 Y175.482 E.01172
G1 X52.428 Y177.679 E.08418
G1 X53.208 Y177.868 E.02175
G1 X50.606 Y175.267 E.09968
G1 X50.982 Y175.052 E.01172
G1 X53.988 Y178.058 E.11519
G1 X54.767 Y178.247 E.02175
G1 X51.357 Y174.837 E.13069
G1 X51.732 Y174.622 E.01172
G1 X55.547 Y178.437 E.1462
G1 X56.327 Y178.626 E.02175
G1 X52.107 Y174.406 E.1617
G1 X52.483 Y174.191 E.01172
G1 X57.107 Y178.816 E.17721
G1 X57.887 Y179.005 E.02175
G1 X52.858 Y173.976 E.19272
G1 X53.233 Y173.761 E.01172
G1 X58.667 Y179.195 E.20822
G1 X59.447 Y179.384 E.02175
G1 X53.608 Y173.546 E.22373
G1 X53.984 Y173.331 E.01172
G1 X60.227 Y179.574 E.23923
G1 X61.006 Y179.763 E.02175
G1 X54.359 Y173.116 E.25474
G1 X54.734 Y172.901 E.01172
G1 X61.786 Y179.953 E.27025
G1 X62.566 Y180.142 E.02175
G1 X55.109 Y172.685 E.28575
G1 X55.485 Y172.47 E.01172
G1 X63.346 Y180.332 E.30126
G1 X64.126 Y180.521 E.02175
G1 X55.86 Y172.255 E.31676
G1 X56.235 Y172.04 E.01172
G1 X64.906 Y180.711 E.33227
G1 X65.686 Y180.9 E.02175
G1 X56.61 Y171.825 E.34777
G1 X56.986 Y171.61 E.01172
G1 X66.466 Y181.09 E.36328
G1 X67.245 Y181.279 E.02175
G1 X57.361 Y171.395 E.37879
G1 X57.736 Y171.18 E.01172
G1 X68.025 Y181.469 E.39429
G1 X68.805 Y181.658 E.02175
G1 X58.111 Y170.964 E.4098
G1 X58.487 Y170.749 E.01172
G1 X69.585 Y181.848 E.4253
G1 X70.365 Y182.037 E.02175
G1 X58.862 Y170.534 E.44081
G1 X59.237 Y170.319 E.01172
G1 X71.145 Y182.227 E.45632
G1 X71.925 Y182.416 E.02175
G1 X59.612 Y170.104 E.47182
G1 X59.988 Y169.889 E.01172
G1 X72.705 Y182.606 E.48733
G1 X73.484 Y182.795 E.02175
G1 X60.363 Y169.674 E.50283
G1 X60.738 Y169.459 E.01172
G1 X74.264 Y182.985 E.51834
G1 X75.044 Y183.174 E.02175
G1 X61.113 Y169.243 E.53385
G1 X61.489 Y169.028 E.01172
G1 X75.824 Y183.364 E.54935
M73 P60 R28
G1 X76.604 Y183.553 E.02175
G1 X61.864 Y168.813 E.56486
G1 X62.239 Y168.598 E.01172
G1 X77.384 Y183.743 E.58036
G1 X78.164 Y183.932 E.02175
G1 X62.614 Y168.383 E.59587
G1 X62.989 Y168.168 E.01172
G1 X78.944 Y184.122 E.61137
G1 X79.723 Y184.311 E.02175
G1 X63.365 Y167.953 E.62688
G1 X63.74 Y167.738 E.01172
G1 X80.503 Y184.501 E.64239
G1 X81.283 Y184.69 E.02175
G1 X64.115 Y167.523 E.65789
G1 X64.49 Y167.307 E.01172
G1 X82.063 Y184.88 E.6734
G1 X82.843 Y185.069 E.02175
G1 X64.866 Y167.092 E.6889
G1 X65.241 Y166.877 E.01172
G1 X83.623 Y185.259 E.70441
G1 X84.403 Y185.448 E.02175
G1 X65.616 Y166.662 E.71992
G1 X65.991 Y166.447 E.01172
G1 X85.182 Y185.638 E.73542
G1 X85.962 Y185.827 E.02175
G1 X66.367 Y166.232 E.75093
G1 X66.742 Y166.017 E.01172
G1 X86.742 Y186.017 E.76643
G1 X87.522 Y186.207 E.02175
G1 X67.117 Y165.802 E.78194
G1 X67.492 Y165.586 E.01172
G1 X88.302 Y186.396 E.79744
G1 X89.082 Y186.586 E.02175
G1 X67.868 Y165.371 E.81295
G1 X68.243 Y165.156 E.01172
G1 X89.862 Y186.775 E.82846
G1 X90.642 Y186.965 E.02175
G1 X68.618 Y164.941 E.84396
G1 X68.993 Y164.726 E.01172
G1 X91.421 Y187.154 E.85947
G1 X92.201 Y187.344 E.02175
G1 X69.369 Y164.511 E.87497
G1 X69.744 Y164.296 E.01172
G1 X92.981 Y187.533 E.89048
G1 X93.761 Y187.723 E.02175
G1 X70.119 Y164.081 E.90599
G1 X70.494 Y163.865 E.01172
G1 X94.541 Y187.912 E.92149
G1 X95.321 Y188.102 E.02175
G1 X70.87 Y163.65 E.937
G1 X71.245 Y163.435 E.01172
G1 X96.101 Y188.291 E.9525
G1 X96.881 Y188.481 E.02175
G1 X71.62 Y163.22 E.96801
G1 X71.995 Y163.005 E.01172
G1 X97.66 Y188.67 E.98351
G1 X98.44 Y188.86 E.02175
G1 X72.371 Y162.79 E.99902
G1 X72.746 Y162.575 E.01172
G1 X99.22 Y189.049 E1.01453
G1 X100 Y189.239 E.02175
G1 X73.121 Y162.36 E1.03003
G1 X73.496 Y162.145 E.01172
G1 X100.78 Y189.428 E1.04554
G1 X101.56 Y189.618 E.02175
G1 X73.872 Y161.929 E1.06104
G1 X74.247 Y161.714 E.01172
G1 X102.34 Y189.807 E1.07655
G1 X103.12 Y189.997 E.02175
G1 X74.622 Y161.499 E1.09206
G1 X74.997 Y161.284 E.01172
G1 X103.899 Y190.186 E1.10756
G1 X104.679 Y190.376 E.02175
G1 X75.372 Y161.069 E1.12307
G1 X75.748 Y160.854 E.01172
G1 X105.459 Y190.565 E1.13857
M73 P60 R27
G1 X106.239 Y190.755 E.02175
G1 X76.123 Y160.639 E1.15408
G1 X76.498 Y160.424 E.01172
G1 X107.019 Y190.944 E1.16959
G1 X107.799 Y191.134 E.02175
G1 X76.873 Y160.208 E1.18509
G1 X77.249 Y159.993 E.01172
G1 X108.579 Y191.323 E1.2006
G1 X109.359 Y191.513 E.02175
G1 X77.624 Y159.778 E1.2161
G1 X77.999 Y159.563 E.01172
G1 X110.138 Y191.702 E1.23161
G1 X110.918 Y191.892 E.02175
G1 X78.374 Y159.348 E1.24711
G1 X78.75 Y159.133 E.01172
G1 X111.698 Y192.081 E1.26262
G1 X112.478 Y192.271 E.02175
G1 X79.125 Y158.918 E1.27813
G1 X79.5 Y158.703 E.01172
G1 X113.258 Y192.46 E1.29363
G1 X114.038 Y192.65 E.02175
G1 X79.875 Y158.487 E1.30914
G1 X80.251 Y158.272 E.01172
G1 X114.818 Y192.839 E1.32464
G1 X115.598 Y193.029 E.02175
G1 X80.626 Y158.057 E1.34015
G1 X81.001 Y157.842 E.01172
G1 X116.377 Y193.218 E1.35566
G1 X117.157 Y193.408 E.02175
G1 X81.376 Y157.627 E1.37116
G1 X81.752 Y157.412 E.01172
G1 X117.937 Y193.597 E1.38667
G1 X118.717 Y193.787 E.02175
G1 X82.127 Y157.197 E1.40217
G1 X82.502 Y156.982 E.01172
G1 X119.497 Y193.976 E1.41768
G1 X120.277 Y194.166 E.02175
G1 X82.877 Y156.766 E1.43318
G1 X83.253 Y156.551 E.01172
G1 X121.057 Y194.355 E1.44869
G1 X121.837 Y194.545 E.02175
G1 X83.628 Y156.336 E1.4642
G1 X84.003 Y156.121 E.01172
G1 X122.616 Y194.734 E1.4797
G1 X123.396 Y194.924 E.02175
G1 X84.378 Y155.906 E1.49521
G1 X84.754 Y155.691 E.01172
G1 X123.626 Y194.563 E1.48962
G1 X123.614 Y193.961 E.01633
G1 X85.129 Y155.476 E1.47478
G1 X85.504 Y155.261 E.01172
G1 X123.602 Y193.358 E1.45994
G1 X123.589 Y192.756 E.01633
G1 X85.879 Y155.046 E1.44509
G1 X86.255 Y154.83 E.01172
G1 X123.577 Y192.153 E1.43025
G1 X123.565 Y191.551 E.01633
G1 X86.63 Y154.615 E1.41541
G1 X87.005 Y154.4 E.01172
G1 X123.553 Y190.948 E1.40057
G1 X123.541 Y190.346 E.01633
G1 X87.38 Y154.185 E1.38573
G1 X87.755 Y153.97 E.01172
G1 X123.529 Y189.744 E1.37089
G1 X123.517 Y189.141 E.01633
G1 X88.131 Y153.755 E1.35604
G1 X88.506 Y153.54 E.01172
G1 X123.505 Y188.539 E1.3412
G1 X123.493 Y187.936 E.01633
G1 X88.881 Y153.325 E1.32636
G1 X89.256 Y153.109 E.01172
G1 X123.481 Y187.334 E1.31152
G1 X123.469 Y186.732 E.01633
G1 X89.632 Y152.894 E1.29668
G1 X90.007 Y152.679 E.01172
G1 X123.457 Y186.129 E1.28184
G1 X123.445 Y185.527 E.01633
G1 X90.382 Y152.464 E1.26699
G1 X90.757 Y152.249 E.01172
G1 X123.433 Y184.924 E1.25215
G1 X123.421 Y184.322 E.01633
G1 X91.133 Y152.034 E1.23731
G1 X91.508 Y151.819 E.01172
G1 X123.409 Y183.719 E1.22247
G1 X123.397 Y183.117 E.01633
G1 X91.883 Y151.604 E1.20763
G1 X92.258 Y151.388 E.01172
G1 X123.385 Y182.515 E1.19279
G1 X123.373 Y181.912 E.01633
G1 X92.634 Y151.173 E1.17795
G1 X93.009 Y150.958 E.01172
G1 X123.36 Y181.31 E1.1631
G1 X123.348 Y180.707 E.01633
G1 X93.384 Y150.743 E1.14826
G1 X93.759 Y150.528 E.01172
G1 X123.336 Y180.105 E1.13342
G1 X123.324 Y179.503 E.01633
G1 X94.135 Y150.313 E1.11858
G1 X94.51 Y150.098 E.01172
G1 X123.312 Y178.9 E1.10374
G1 X123.3 Y178.298 E.01633
G1 X94.885 Y149.883 E1.0889
G1 X95.26 Y149.667 E.01172
G1 X123.288 Y177.695 E1.07405
G1 X123.276 Y177.093 E.01633
G1 X95.636 Y149.452 E1.05921
G1 X96.011 Y149.237 E.01172
G1 X123.264 Y176.49 E1.04437
G1 X123.252 Y175.888 E.01633
G1 X96.386 Y149.022 E1.02953
G1 X96.761 Y148.807 E.01172
G1 X123.24 Y175.286 E1.01469
G1 X123.228 Y174.683 E.01633
G1 X97.137 Y148.592 E.99985
G1 X97.512 Y148.377 E.01172
G1 X123.216 Y174.081 E.985
G1 X123.204 Y173.478 E.01633
G1 X97.887 Y148.162 E.97016
G1 X98.262 Y147.947 E.01172
G1 X123.192 Y172.876 E.95532
G1 X123.18 Y172.274 E.01633
G1 X98.638 Y147.731 E.94048
G1 X99.013 Y147.516 E.01172
G1 X123.168 Y171.671 E.92564
G1 X123.156 Y171.069 E.01633
G1 X99.388 Y147.301 E.9108
G1 X99.763 Y147.086 E.01172
G1 X123.143 Y170.466 E.89595
G1 X123.131 Y169.864 E.01633
G1 X100.138 Y146.871 E.88111
G1 X100.514 Y146.656 E.01172
G1 X123.119 Y169.261 E.86627
G1 X123.107 Y168.659 E.01633
G1 X100.889 Y146.441 E.85143
G1 X101.264 Y146.226 E.01172
G1 X123.095 Y168.057 E.83659
G1 X123.083 Y167.454 E.01633
G1 X101.639 Y146.01 E.82175
G1 X102.015 Y145.795 E.01172
G1 X123.071 Y166.852 E.80691
G1 X123.059 Y166.249 E.01633
G1 X102.39 Y145.58 E.79206
G1 X102.765 Y145.365 E.01172
G1 X123.047 Y165.647 E.77722
G1 X123.035 Y165.045 E.01633
G1 X103.14 Y145.15 E.76238
G1 X103.516 Y144.935 E.01172
G1 X123.023 Y164.442 E.74754
G1 X123.011 Y163.84 E.01633
G1 X103.891 Y144.72 E.7327
G1 X104.266 Y144.505 E.01172
G1 X122.999 Y163.237 E.71786
G1 X122.987 Y162.635 E.01633
G1 X104.641 Y144.289 E.70301
G1 X105.017 Y144.074 E.01172
G1 X122.975 Y162.032 E.68817
G1 X122.963 Y161.43 E.01633
G1 X105.392 Y143.859 E.67333
G1 X105.767 Y143.644 E.01172
G1 X122.951 Y160.828 E.65849
G1 X122.939 Y160.225 E.01633
G1 X106.142 Y143.429 E.64365
G1 X106.518 Y143.214 E.01172
G1 X122.927 Y159.623 E.62881
G1 X122.914 Y159.02 E.01633
G1 X106.893 Y142.999 E.61396
G1 X107.268 Y142.784 E.01172
G1 X122.902 Y158.418 E.59912
G1 X122.89 Y157.815 E.01633
G1 X107.643 Y142.568 E.58428
G1 X108.019 Y142.353 E.01172
G1 X122.878 Y157.213 E.56944
G1 X122.866 Y156.611 E.01633
G1 X108.394 Y142.138 E.5546
G1 X108.769 Y141.923 E.01172
G1 X122.854 Y156.008 E.53976
G1 X122.842 Y155.406 E.01633
G1 X109.144 Y141.708 E.52491
G1 X109.52 Y141.493 E.01172
G1 X122.83 Y154.803 E.51007
G1 X122.818 Y154.201 E.01633
G1 X109.895 Y141.278 E.49523
G1 X110.275 Y141.068 E.01177
G1 X122.806 Y153.599 E.4802
G1 X122.794 Y152.996 E.01633
G1 X111.448 Y141.651 E.43477
G1 X112.845 Y142.457 E.04371
G1 X122.782 Y152.394 E.38078
G1 X122.77 Y151.791 E.01633
G1 X114.242 Y143.264 E.32679
G1 X115.639 Y144.07 E.04371
G1 X122.758 Y151.189 E.2728
G1 X122.746 Y150.586 E.01633
G1 X117.036 Y144.877 E.21881
G1 X118.433 Y145.683 E.04371
G1 X122.734 Y149.984 E.16482
G1 X122.722 Y149.382 E.01633
G1 X119.829 Y146.49 E.11083
G1 X121.226 Y147.296 E.04371
G1 X122.9 Y148.97 E.06415
; OBJECT_ID: 437
; WIPE_START
G1 X121.486 Y147.556 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 409
M625
; start printing object, unique label id: 437
M624 EAAAAAAAAAA=
M204 S10000
G1 X116.02 Y142.229 Z1.72 F30000
G1 X47.244 Y75.215 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X123.999 Y56.564 E2.14036
G1 X123.053 Y103.847 E1.28149
G1 X122.861 Y104.171 E.01019
G1 X110.534 Y111.288 E.3857
G1 X110.167 Y111.288 E.00995
G1 X47.296 Y75.245 E1.96372
; WIPE_START
G1 X49.239 Y74.772 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.187 Y75.071 Z1.72 F30000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X124.186 Y56.106 E2.01813
G1 X124.405 Y56.282 E.00708
G1 X123.451 Y103.96 E1.19892
G1 X123.153 Y104.465 E.01475
G1 X110.642 Y111.688 E.3632
G1 X110.061 Y111.689 E.01461
G1 X46.239 Y75.101 E1.84954
; WIPE_START
M204 S4000
G1 X48.182 Y74.627 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.218 Y75.579 Z1.72 F30000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.529 Y75.269 E.0119
G1 X49.308 Y75.079 E.02175
G1 X48.73 Y75.658 E.02215
G1 X49.106 Y75.873 E.01172
G1 X50.088 Y74.89 E.03766
G1 X50.868 Y74.7 E.02175
G1 X49.481 Y76.088 E.05316
G1 X49.856 Y76.303 E.01172
G1 X51.648 Y74.511 E.06867
G1 X52.428 Y74.321 E.02175
G1 X50.231 Y76.518 E.08418
G1 X50.607 Y76.733 E.01172
G1 X53.208 Y74.132 E.09968
G1 X53.988 Y73.942 E.02175
G1 X50.982 Y76.948 E.11519
G1 X51.357 Y77.163 E.01172
G1 X54.767 Y73.753 E.13069
G1 X55.547 Y73.563 E.02175
G1 X51.732 Y77.378 E.1462
G1 X52.107 Y77.594 E.01172
G1 X56.327 Y73.374 E.16171
G1 X57.107 Y73.184 E.02175
G1 X52.483 Y77.809 E.17721
G1 X52.858 Y78.024 E.01172
G1 X57.887 Y72.995 E.19272
G1 X58.667 Y72.805 E.02175
G1 X53.233 Y78.239 E.20822
G1 X53.608 Y78.454 E.01172
G1 X59.447 Y72.616 E.22373
G1 X60.227 Y72.426 E.02175
G1 X53.984 Y78.669 E.23923
G1 X54.359 Y78.884 E.01172
G1 X61.006 Y72.237 E.25474
G1 X61.786 Y72.047 E.02175
G1 X54.734 Y79.099 E.27025
G1 X55.109 Y79.315 E.01172
G1 X62.566 Y71.858 E.28575
G1 X63.346 Y71.668 E.02175
G1 X55.485 Y79.53 E.30126
G1 X55.86 Y79.745 E.01172
G1 X64.126 Y71.479 E.31676
G1 X64.906 Y71.289 E.02175
G1 X56.235 Y79.96 E.33227
G1 X56.61 Y80.175 E.01172
M73 P61 R27
G1 X65.686 Y71.1 E.34777
G1 X66.466 Y70.91 E.02175
G1 X56.986 Y80.39 E.36328
G1 X57.361 Y80.605 E.01172
G1 X67.245 Y70.721 E.37879
G1 X68.025 Y70.531 E.02175
G1 X57.736 Y80.82 E.39429
G1 X58.111 Y81.036 E.01172
G1 X68.805 Y70.342 E.4098
G1 X69.585 Y70.152 E.02175
G1 X58.487 Y81.251 E.4253
G1 X58.862 Y81.466 E.01172
G1 X70.365 Y69.963 E.44081
G1 X71.145 Y69.773 E.02175
G1 X59.237 Y81.681 E.45632
G1 X59.612 Y81.896 E.01172
G1 X71.925 Y69.584 E.47182
G1 X72.705 Y69.394 E.02175
G1 X59.988 Y82.111 E.48733
G1 X60.363 Y82.326 E.01172
G1 X73.484 Y69.205 E.50283
G1 X74.264 Y69.015 E.02175
G1 X60.738 Y82.541 E.51834
G1 X61.113 Y82.757 E.01172
G1 X75.044 Y68.826 E.53385
G1 X75.824 Y68.636 E.02175
G1 X61.489 Y82.972 E.54935
G1 X61.864 Y83.187 E.01172
G1 X76.604 Y68.447 E.56486
G1 X77.384 Y68.257 E.02175
G1 X62.239 Y83.402 E.58036
G1 X62.614 Y83.617 E.01172
G1 X78.164 Y68.068 E.59587
G1 X78.944 Y67.878 E.02175
G1 X62.99 Y83.832 E.61137
G1 X63.365 Y84.047 E.01172
G1 X79.723 Y67.689 E.62688
G1 X80.503 Y67.499 E.02175
G1 X63.74 Y84.262 E.64239
G1 X64.115 Y84.477 E.01172
G1 X81.283 Y67.31 E.65789
G1 X82.063 Y67.12 E.02175
G1 X64.49 Y84.693 E.6734
G1 X64.866 Y84.908 E.01172
G1 X82.843 Y66.931 E.6889
G1 X83.623 Y66.741 E.02175
G1 X65.241 Y85.123 E.70441
G1 X65.616 Y85.338 E.01172
G1 X84.403 Y66.552 E.71992
G1 X85.183 Y66.362 E.02175
G1 X65.991 Y85.553 E.73542
G1 X66.367 Y85.768 E.01172
G1 X85.962 Y66.173 E.75093
G1 X86.742 Y65.983 E.02175
G1 X66.742 Y85.983 E.76643
G1 X67.117 Y86.198 E.01172
G1 X87.522 Y65.794 E.78194
G1 X88.302 Y65.604 E.02175
G1 X67.492 Y86.414 E.79744
G1 X67.868 Y86.629 E.01172
G1 X89.082 Y65.415 E.81295
G1 X89.862 Y65.225 E.02175
G1 X68.243 Y86.844 E.82846
G1 X68.618 Y87.059 E.01172
G1 X90.642 Y65.035 E.84396
G1 X91.421 Y64.846 E.02175
G1 X68.993 Y87.274 E.85947
G1 X69.369 Y87.489 E.01172
G1 X92.201 Y64.656 E.87497
G1 X92.981 Y64.467 E.02175
G1 X69.744 Y87.704 E.89048
G1 X70.119 Y87.919 E.01172
G1 X93.761 Y64.277 E.90598
G1 X94.541 Y64.088 E.02175
G1 X70.494 Y88.135 E.92149
G1 X70.87 Y88.35 E.01172
G1 X95.321 Y63.898 E.937
G1 X96.101 Y63.709 E.02175
G1 X71.245 Y88.565 E.9525
G1 X71.62 Y88.78 E.01172
G1 X96.881 Y63.519 E.96801
G1 X97.66 Y63.33 E.02175
G1 X71.995 Y88.995 E.98351
G1 X72.371 Y89.21 E.01172
G1 X98.44 Y63.14 E.99902
G1 X99.22 Y62.951 E.02175
G1 X72.746 Y89.425 E1.01453
G1 X73.121 Y89.64 E.01172
G1 X100 Y62.761 E1.03003
G1 X100.78 Y62.572 E.02175
G1 X73.496 Y89.856 E1.04554
G1 X73.872 Y90.071 E.01172
G1 X101.56 Y62.382 E1.06104
G1 X102.34 Y62.193 E.02175
G1 X74.247 Y90.286 E1.07655
G1 X74.622 Y90.501 E.01172
G1 X103.12 Y62.003 E1.09205
G1 X103.899 Y61.814 E.02175
G1 X74.997 Y90.716 E1.10756
G1 X75.373 Y90.931 E.01172
G1 X104.679 Y61.624 E1.12307
G1 X105.459 Y61.435 E.02175
G1 X75.748 Y91.146 E1.13857
G1 X76.123 Y91.361 E.01172
G1 X106.239 Y61.245 E1.15408
G1 X107.019 Y61.056 E.02175
G1 X76.498 Y91.576 E1.16958
G1 X76.873 Y91.792 E.01172
G1 X107.799 Y60.866 E1.18509
G1 X108.579 Y60.677 E.02175
G1 X77.249 Y92.007 E1.2006
G1 X77.624 Y92.222 E.01172
G1 X109.359 Y60.487 E1.2161
G1 X110.138 Y60.298 E.02175
G1 X77.999 Y92.437 E1.23161
G1 X78.374 Y92.652 E.01172
G1 X110.918 Y60.108 E1.24711
G1 X111.698 Y59.919 E.02175
G1 X78.75 Y92.867 E1.26262
G1 X79.125 Y93.082 E.01172
G1 X112.478 Y59.729 E1.27813
G1 X113.258 Y59.54 E.02175
G1 X79.5 Y93.297 E1.29363
G1 X79.875 Y93.513 E.01172
G1 X114.038 Y59.35 E1.30914
G1 X114.818 Y59.161 E.02175
G1 X80.251 Y93.728 E1.32464
G1 X80.626 Y93.943 E.01172
G1 X115.598 Y58.971 E1.34015
G1 X116.377 Y58.782 E.02175
G1 X81.001 Y94.158 E1.35565
G1 X81.376 Y94.373 E.01172
G1 X117.157 Y58.592 E1.37116
G1 X117.937 Y58.403 E.02175
G1 X81.752 Y94.588 E1.38667
G1 X82.127 Y94.803 E.01172
G1 X118.717 Y58.213 E1.40217
G1 X119.497 Y58.024 E.02175
G1 X82.502 Y95.018 E1.41768
G1 X82.877 Y95.234 E.01172
G1 X120.277 Y57.834 E1.43318
G1 X121.057 Y57.645 E.02175
G1 X83.253 Y95.449 E1.44869
G1 X83.628 Y95.664 E.01172
G1 X121.836 Y57.455 E1.46419
G1 X122.616 Y57.266 E.02175
G1 X84.003 Y95.879 E1.4797
G1 X84.378 Y96.094 E.01172
G1 X123.396 Y57.076 E1.49521
G1 X123.634 Y57.018 E.00663
G1 X123.626 Y57.437 E.01135
G1 X84.754 Y96.309 E1.48962
G1 X85.129 Y96.524 E.01172
G1 X123.614 Y58.04 E1.47478
G1 X123.602 Y58.642 E.01633
G1 X85.504 Y96.739 E1.45993
G1 X85.879 Y96.955 E.01172
G1 X123.589 Y59.244 E1.44509
G1 X123.577 Y59.847 E.01633
G1 X86.255 Y97.17 E1.43025
G1 X86.63 Y97.385 E.01172
G1 X123.565 Y60.449 E1.41541
G1 X123.553 Y61.052 E.01633
G1 X87.005 Y97.6 E1.40057
G1 X87.38 Y97.815 E.01172
G1 X123.541 Y61.654 E1.38573
G1 X123.529 Y62.256 E.01633
G1 X87.756 Y98.03 E1.37089
G1 X88.131 Y98.245 E.01172
G1 X123.517 Y62.859 E1.35604
G1 X123.505 Y63.461 E.01633
G1 X88.506 Y98.46 E1.3412
G1 X88.881 Y98.675 E.01172
G1 X123.493 Y64.064 E1.32636
G1 X123.481 Y64.666 E.01633
G1 X89.256 Y98.891 E1.31152
G1 X89.632 Y99.106 E.01172
G1 X123.469 Y65.269 E1.29668
G1 X123.457 Y65.871 E.01633
G1 X90.007 Y99.321 E1.28184
G1 X90.382 Y99.536 E.01172
G1 X123.445 Y66.473 E1.26699
G1 X123.433 Y67.076 E.01633
G1 X90.757 Y99.751 E1.25215
G1 X91.133 Y99.966 E.01172
G1 X123.421 Y67.678 E1.23731
G1 X123.409 Y68.281 E.01633
G1 X91.508 Y100.181 E1.22247
G1 X91.883 Y100.396 E.01172
G1 X123.397 Y68.883 E1.20763
G1 X123.385 Y69.485 E.01633
G1 X92.258 Y100.612 E1.19279
G1 X92.634 Y100.827 E.01172
G1 X123.373 Y70.088 E1.17794
G1 X123.36 Y70.69 E.01633
G1 X93.009 Y101.042 E1.1631
G1 X93.384 Y101.257 E.01172
G1 X123.348 Y71.293 E1.14826
G1 X123.336 Y71.895 E.01633
G1 X93.759 Y101.472 E1.13342
G1 X94.135 Y101.687 E.01172
G1 X123.324 Y72.498 E1.11858
G1 X123.312 Y73.1 E.01633
G1 X94.51 Y101.902 E1.10374
G1 X94.885 Y102.117 E.01172
G1 X123.3 Y73.702 E1.08889
G1 X123.288 Y74.305 E.01633
G1 X95.26 Y102.333 E1.07405
G1 X95.636 Y102.548 E.01172
G1 X123.276 Y74.907 E1.05921
G1 X123.264 Y75.51 E.01633
G1 X96.011 Y102.763 E1.04437
G1 X96.386 Y102.978 E.01172
G1 X123.252 Y76.112 E1.02953
G1 X123.24 Y76.714 E.01633
G1 X96.761 Y103.193 E1.01469
G1 X97.137 Y103.408 E.01172
G1 X123.228 Y77.317 E.99984
G1 X123.216 Y77.919 E.01633
G1 X97.512 Y103.623 E.985
G1 X97.887 Y103.838 E.01172
G1 X123.204 Y78.522 E.97016
M73 P61 R26
G1 X123.192 Y79.124 E.01633
G1 X98.262 Y104.054 E.95532
G1 X98.638 Y104.269 E.01172
G1 X123.18 Y79.727 E.94048
G1 X123.168 Y80.329 E.01633
G1 X99.013 Y104.484 E.92564
G1 X99.388 Y104.699 E.01172
G1 X123.156 Y80.931 E.9108
G1 X123.143 Y81.534 E.01633
G1 X99.763 Y104.914 E.89595
G1 X100.139 Y105.129 E.01172
G1 X123.131 Y82.136 E.88111
G1 X123.119 Y82.739 E.01633
G1 X100.514 Y105.344 E.86627
G1 X100.889 Y105.559 E.01172
G1 X123.107 Y83.341 E.85143
G1 X123.095 Y83.943 E.01633
G1 X101.264 Y105.774 E.83659
G1 X101.639 Y105.99 E.01172
G1 X123.083 Y84.546 E.82175
G1 X123.071 Y85.148 E.01633
G1 X102.015 Y106.205 E.8069
G1 X102.39 Y106.42 E.01172
G1 X123.059 Y85.751 E.79206
G1 X123.047 Y86.353 E.01633
G1 X102.765 Y106.635 E.77722
G1 X103.14 Y106.85 E.01172
G1 X123.035 Y86.956 E.76238
G1 X123.023 Y87.558 E.01633
G1 X103.516 Y107.065 E.74754
G1 X103.891 Y107.28 E.01172
G1 X123.011 Y88.16 E.7327
G1 X122.999 Y88.763 E.01633
G1 X104.266 Y107.495 E.71785
G1 X104.641 Y107.711 E.01172
G1 X122.987 Y89.365 E.70301
G1 X122.975 Y89.968 E.01633
G1 X105.017 Y107.926 E.68817
G1 X105.392 Y108.141 E.01172
G1 X122.963 Y90.57 E.67333
G1 X122.951 Y91.172 E.01633
G1 X105.767 Y108.356 E.65849
G1 X106.142 Y108.571 E.01172
G1 X122.939 Y91.775 E.64365
G1 X122.927 Y92.377 E.01633
G1 X106.518 Y108.786 E.62881
G1 X106.893 Y109.001 E.01172
G1 X122.914 Y92.98 E.61396
G1 X122.902 Y93.582 E.01633
G1 X107.268 Y109.216 E.59912
G1 X107.643 Y109.432 E.01172
G1 X122.89 Y94.185 E.58428
G1 X122.878 Y94.787 E.01633
G1 X108.019 Y109.647 E.56944
G1 X108.394 Y109.862 E.01172
G1 X122.866 Y95.389 E.5546
G1 X122.854 Y95.992 E.01633
G1 X108.769 Y110.077 E.53976
G1 X109.144 Y110.292 E.01172
G1 X122.842 Y96.594 E.52491
G1 X122.83 Y97.197 E.01633
G1 X109.52 Y110.507 E.51007
G1 X109.895 Y110.722 E.01172
G1 X122.818 Y97.799 E.49523
G1 X122.806 Y98.401 E.01633
G1 X110.275 Y110.932 E.4802
G1 X110.439 Y110.932 E.00444
G1 X111.449 Y110.349 E.0316
G1 X122.794 Y99.004 E.43476
G1 X122.782 Y99.606 E.01633
G1 X112.845 Y109.543 E.38077
G1 X114.242 Y108.736 E.0437
G1 X122.77 Y100.209 E.32678
G1 X122.758 Y100.811 E.01633
G1 X115.639 Y107.93 E.2728
G1 X117.036 Y107.123 E.0437
G1 X122.746 Y101.414 E.21881
G1 X122.734 Y102.016 E.01633
G1 X118.433 Y106.317 E.16482
G1 X119.829 Y105.51 E.0437
G1 X122.722 Y102.618 E.11083
G1 X122.71 Y103.221 E.01633
G1 X120.715 Y105.215 E.07642
; OBJECT_ID: 465
; WIPE_START
G1 X122.129 Y103.801 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 437
M625
; start printing object, unique label id: 465
M624 IAAAAAAAAAA=
M204 S10000
G1 X116.26 Y108.68 Z1.72 F30000
G1 X40.405 Y171.729 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X40.405 Y80.271 E2.47823
G1 X106.343 Y118.073 E2.05953
G1 X106.526 Y118.388 E.00986
G1 X106.526 Y133.612 E.41253
G1 X106.343 Y133.927 E.00986
G1 X40.457 Y171.699 E2.05791
M204 S10000
G1 X40.004 Y172.261 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X40.004 Y79.739 E2.32615
G1 X40.142 Y79.659 E.004
G1 X40.388 Y79.8 E.00712
G1 X106.636 Y117.779 E1.91987
G1 X106.927 Y118.28 E.01457
G1 X106.927 Y133.72 E.38817
G1 X106.636 Y134.221 E.01457
G1 X40.142 Y172.341 E1.92699
G1 X40.056 Y172.292 E.00249
; WIPE_START
M204 S4000
G1 X40.055 Y170.292 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X40.762 Y171.33 Z1.72 F30000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X40.762 Y80.886 E2.45076
G1 X41.179 Y81.125 E.01301
G1 X41.179 Y170.875 E2.43197
G1 X41.595 Y170.636 E.01301
G1 X41.595 Y81.364 E2.41903
G1 X42.012 Y81.602 E.01301
G1 X42.012 Y170.397 E2.40608
G1 X42.428 Y170.159 E.01301
G1 X42.428 Y81.841 E2.39314
G1 X42.845 Y82.08 E.01301
G1 X42.845 Y169.92 E2.3802
G1 X43.262 Y169.681 E.01301
G1 X43.262 Y82.319 E2.36725
G1 X43.678 Y82.558 E.01301
G1 X43.678 Y169.442 E2.35431
G1 X44.095 Y169.203 E.01301
G1 X44.095 Y82.797 E2.34137
G1 X44.512 Y83.036 E.01301
G1 X44.512 Y168.964 E2.32842
G1 X44.928 Y168.726 E.01301
G1 X44.928 Y83.274 E2.31548
G1 X45.345 Y83.513 E.01301
G1 X45.345 Y168.487 E2.30254
G1 X45.761 Y168.248 E.01301
G1 X45.761 Y83.752 E2.28959
G1 X46.178 Y83.991 E.01301
G1 X46.178 Y168.009 E2.27665
G1 X46.595 Y167.77 E.01301
G1 X46.595 Y84.23 E2.2637
G1 X47.011 Y84.469 E.01301
G1 X47.011 Y167.531 E2.25076
G1 X47.428 Y167.293 E.01301
G1 X47.428 Y84.707 E2.23782
G1 X47.844 Y84.946 E.01301
G1 X47.844 Y167.054 E2.22487
G1 X48.261 Y166.815 E.01301
G1 X48.261 Y85.185 E2.21193
G1 X48.678 Y85.424 E.01301
G1 X48.678 Y166.576 E2.19899
M73 P62 R26
G1 X49.094 Y166.337 E.01301
G1 X49.094 Y85.663 E2.18604
G1 X49.511 Y85.902 E.01301
G1 X49.511 Y166.098 E2.1731
G1 X49.927 Y165.86 E.01301
G1 X49.927 Y86.14 E2.16016
G1 X50.344 Y86.379 E.01301
G1 X50.344 Y165.621 E2.14721
G1 X50.761 Y165.382 E.01301
G1 X50.761 Y86.618 E2.13427
G1 X51.177 Y86.857 E.01301
G1 X51.177 Y165.143 E2.12133
G1 X51.594 Y164.904 E.01301
G1 X51.594 Y87.096 E2.10838
G1 X52.01 Y87.335 E.01301
G1 X52.01 Y164.665 E2.09544
G1 X52.427 Y164.427 E.01301
G1 X52.427 Y87.573 E2.0825
G1 X52.844 Y87.812 E.01301
G1 X52.844 Y164.188 E2.06955
G1 X53.26 Y163.949 E.01301
G1 X53.26 Y88.051 E2.05661
G1 X53.677 Y88.29 E.01301
G1 X53.677 Y163.71 E2.04366
G1 X54.094 Y163.471 E.01301
G1 X54.094 Y88.529 E2.03072
G1 X54.51 Y88.768 E.01301
G1 X54.51 Y163.232 E2.01778
G1 X54.927 Y162.994 E.01301
G1 X54.927 Y89.006 E2.00483
G1 X55.343 Y89.245 E.01301
G1 X55.343 Y162.755 E1.99189
G1 X55.76 Y162.516 E.01301
G1 X55.76 Y89.484 E1.97895
G1 X56.177 Y89.723 E.01301
G1 X56.177 Y162.277 E1.966
G1 X56.593 Y162.038 E.01301
G1 X56.593 Y89.962 E1.95306
G1 X57.01 Y90.201 E.01301
G1 X57.01 Y161.799 E1.94012
G1 X57.426 Y161.561 E.01301
G1 X57.426 Y90.439 E1.92717
G1 X57.843 Y90.678 E.01301
G1 X57.843 Y161.322 E1.91423
G1 X58.26 Y161.083 E.01301
G1 X58.26 Y90.917 E1.90129
G1 X58.676 Y91.156 E.01301
G1 X58.676 Y160.844 E1.88834
G1 X59.093 Y160.605 E.01301
G1 X59.093 Y91.395 E1.8754
G1 X59.509 Y91.634 E.01301
G1 X59.509 Y160.366 E1.86246
G1 X59.926 Y160.128 E.01301
G1 X59.926 Y91.872 E1.84951
G1 X60.343 Y92.111 E.01301
G1 X60.343 Y159.889 E1.83657
G1 X60.759 Y159.65 E.01301
G1 X60.759 Y92.35 E1.82362
G1 X61.176 Y92.589 E.01301
G1 X61.176 Y159.411 E1.81068
G1 X61.593 Y159.172 E.01301
G1 X61.593 Y92.828 E1.79774
G1 X62.009 Y93.067 E.01301
G1 X62.009 Y158.933 E1.78479
G1 X62.426 Y158.695 E.01301
G1 X62.426 Y93.305 E1.77185
G1 X62.842 Y93.544 E.01301
G1 X62.842 Y158.456 E1.75891
G1 X63.259 Y158.217 E.01301
G1 X63.259 Y93.783 E1.74596
G1 X63.676 Y94.022 E.01301
G1 X63.676 Y157.978 E1.73302
G1 X64.092 Y157.739 E.01301
G1 X64.092 Y94.261 E1.72008
G1 X64.509 Y94.5 E.01301
G1 X64.509 Y157.5 E1.70713
G1 X64.925 Y157.261 E.01301
G1 X64.925 Y94.739 E1.69419
G1 X65.342 Y94.977 E.01301
G1 X65.342 Y157.023 E1.68125
G1 X65.759 Y156.784 E.01301
G1 X65.759 Y95.216 E1.6683
G1 X66.175 Y95.455 E.01301
G1 X66.175 Y156.545 E1.65536
G1 X66.592 Y156.306 E.01301
G1 X66.592 Y95.694 E1.64242
G1 X67.008 Y95.933 E.01301
G1 X67.008 Y156.067 E1.62947
G1 X67.425 Y155.828 E.01301
G1 X67.425 Y96.172 E1.61653
G1 X67.842 Y96.41 E.01301
G1 X67.842 Y155.59 E1.60358
G1 X68.258 Y155.351 E.01301
G1 X68.258 Y96.649 E1.59064
G1 X68.675 Y96.888 E.01301
G1 X68.675 Y155.112 E1.5777
G1 X69.091 Y154.873 E.01301
G1 X69.091 Y97.127 E1.56475
G1 X69.508 Y97.366 E.01301
G1 X69.508 Y154.634 E1.55181
G1 X69.925 Y154.395 E.01301
G1 X69.925 Y97.605 E1.53887
G1 X70.341 Y97.843 E.01301
G1 X70.341 Y154.157 E1.52592
G1 X70.758 Y153.918 E.01301
G1 X70.758 Y98.082 E1.51298
G1 X71.175 Y98.321 E.01301
G1 X71.175 Y153.679 E1.50004
G1 X71.591 Y153.44 E.01301
G1 X71.591 Y98.56 E1.48709
G1 X72.008 Y98.799 E.01301
G1 X72.008 Y153.201 E1.47415
G1 X72.424 Y152.962 E.01301
G1 X72.424 Y99.038 E1.46121
G1 X72.841 Y99.276 E.01301
G1 X72.841 Y152.724 E1.44826
G1 X73.258 Y152.485 E.01301
G1 X73.258 Y99.515 E1.43532
G1 X73.674 Y99.754 E.01301
G1 X73.674 Y152.246 E1.42238
G1 X74.091 Y152.007 E.01301
G1 X74.091 Y99.993 E1.40943
G1 X74.507 Y100.232 E.01301
G1 X74.507 Y151.768 E1.39649
G1 X74.924 Y151.529 E.01301
G1 X74.924 Y100.471 E1.38354
G1 X75.341 Y100.709 E.01301
G1 X75.341 Y151.291 E1.3706
G1 X75.757 Y151.052 E.01301
G1 X75.757 Y100.948 E1.35766
G1 X76.174 Y101.187 E.01301
G1 X76.174 Y150.813 E1.34471
G1 X76.59 Y150.574 E.01301
G1 X76.59 Y101.426 E1.33177
G1 X77.007 Y101.665 E.01301
G1 X77.007 Y150.335 E1.31883
G1 X77.424 Y150.096 E.01301
G1 X77.424 Y101.904 E1.30588
G1 X77.84 Y102.142 E.01301
G1 X77.84 Y149.858 E1.29294
G1 X78.257 Y149.619 E.01301
G1 X78.257 Y102.381 E1.28
G1 X78.674 Y102.62 E.01301
G1 X78.674 Y149.38 E1.26705
G1 X79.09 Y149.141 E.01301
G1 X79.09 Y102.859 E1.25411
G1 X79.507 Y103.098 E.01301
G1 X79.507 Y148.902 E1.24117
G1 X79.923 Y148.663 E.01301
G1 X79.923 Y103.337 E1.22822
G1 X80.34 Y103.575 E.01301
G1 X80.34 Y148.425 E1.21528
G1 X80.757 Y148.186 E.01301
G1 X80.757 Y103.814 E1.20234
G1 X81.173 Y104.053 E.01301
G1 X81.173 Y147.947 E1.18939
G1 X81.59 Y147.708 E.01301
G1 X81.59 Y104.292 E1.17645
G1 X82.006 Y104.531 E.01301
G1 X82.006 Y147.469 E1.1635
G1 X82.423 Y147.23 E.01301
G1 X82.423 Y104.77 E1.15056
G1 X82.84 Y105.008 E.01301
G1 X82.84 Y146.992 E1.13762
G1 X83.256 Y146.753 E.01301
G1 X83.256 Y105.247 E1.12467
G1 X83.673 Y105.486 E.01301
G1 X83.673 Y146.514 E1.11173
G1 X84.089 Y146.275 E.01301
G1 X84.089 Y105.725 E1.09879
G1 X84.506 Y105.964 E.01301
G1 X84.506 Y146.036 E1.08584
G1 X84.923 Y145.797 E.01301
G1 X84.923 Y106.203 E1.0729
G1 X85.339 Y106.441 E.01301
G1 X85.339 Y145.559 E1.05996
G1 X85.756 Y145.32 E.01301
G1 X85.756 Y106.68 E1.04701
G1 X86.173 Y106.919 E.01301
G1 X86.173 Y145.081 E1.03407
G1 X86.589 Y144.842 E.01301
G1 X86.589 Y107.158 E1.02113
G1 X87.006 Y107.397 E.01301
G1 X87.006 Y144.603 E1.00818
G1 X87.422 Y144.364 E.01301
G1 X87.422 Y107.636 E.99524
G1 X87.839 Y107.875 E.01301
G1 X87.839 Y144.125 E.98229
G1 X88.256 Y143.887 E.01301
G1 X88.256 Y108.113 E.96935
G1 X88.672 Y108.352 E.01301
G1 X88.672 Y143.648 E.95641
G1 X89.089 Y143.409 E.01301
G1 X89.089 Y108.591 E.94346
G1 X89.505 Y108.83 E.01301
G1 X89.505 Y143.17 E.93052
G1 X89.922 Y142.931 E.01301
G1 X89.922 Y109.069 E.91758
G1 X90.339 Y109.308 E.01301
G1 X90.339 Y142.692 E.90463
G1 X90.755 Y142.454 E.01301
G1 X90.755 Y109.546 E.89169
G1 X91.172 Y109.785 E.01301
G1 X91.172 Y142.215 E.87875
G1 X91.588 Y141.976 E.01301
G1 X91.588 Y110.024 E.8658
M73 P62 R25
G1 X92.005 Y110.263 E.01301
G1 X92.005 Y141.737 E.85286
G1 X92.422 Y141.498 E.01301
G1 X92.422 Y110.502 E.83992
G1 X92.838 Y110.741 E.01301
G1 X92.838 Y141.259 E.82697
M73 P63 R25
G1 X93.255 Y141.021 E.01301
G1 X93.255 Y110.979 E.81403
G1 X93.671 Y111.218 E.01301
G1 X93.671 Y140.782 E.80109
G1 X94.088 Y140.543 E.01301
G1 X94.088 Y111.457 E.78814
G1 X94.505 Y111.696 E.01301
G1 X94.505 Y140.304 E.7752
G1 X94.921 Y140.065 E.01301
G1 X94.921 Y111.935 E.76225
G1 X95.338 Y112.174 E.01301
G1 X95.338 Y139.826 E.74931
G1 X95.755 Y139.588 E.01301
G1 X95.755 Y112.412 E.73637
G1 X96.171 Y112.651 E.01301
G1 X96.171 Y139.349 E.72342
G1 X96.588 Y139.11 E.01301
G1 X96.588 Y112.89 E.71048
G1 X97.004 Y113.129 E.01301
G1 X97.004 Y138.871 E.69754
G1 X97.421 Y138.632 E.01301
G1 X97.421 Y113.368 E.68459
G1 X97.838 Y113.607 E.01301
G1 X97.838 Y138.393 E.67165
G1 X98.254 Y138.155 E.01301
G1 X98.254 Y113.845 E.65871
G1 X98.671 Y114.084 E.01301
G1 X98.671 Y137.916 E.64576
G1 X99.087 Y137.677 E.01301
G1 X99.087 Y114.323 E.63282
G1 X99.504 Y114.562 E.01301
G1 X99.504 Y137.438 E.61988
G1 X99.921 Y137.199 E.01301
G1 X99.921 Y114.801 E.60693
G1 X100.337 Y115.04 E.01301
G1 X100.337 Y136.96 E.59399
G1 X100.754 Y136.722 E.01301
G1 X100.754 Y115.278 E.58105
G1 X101.17 Y115.517 E.01301
G1 X101.17 Y136.483 E.5681
G1 X101.587 Y136.244 E.01301
G1 X101.587 Y115.756 E.55516
G1 X102.004 Y115.995 E.01301
G1 X102.004 Y136.005 E.54221
G1 X102.42 Y135.766 E.01301
G1 X102.42 Y116.234 E.52927
G1 X102.837 Y116.473 E.01301
G1 X102.837 Y135.527 E.51633
G1 X103.254 Y135.289 E.01301
G1 X103.254 Y116.711 E.50338
G1 X103.67 Y116.95 E.01301
G1 X103.67 Y135.05 E.49044
G1 X104.087 Y134.811 E.01301
G1 X104.087 Y117.189 E.4775
G1 X104.503 Y117.428 E.01301
G1 X104.503 Y134.572 E.46455
G1 X104.92 Y134.333 E.01301
G1 X104.92 Y117.667 E.45161
G1 X105.337 Y117.906 E.01301
G1 X105.337 Y134.094 E.43867
G1 X105.753 Y133.856 E.01301
G1 X105.753 Y118.144 E.42572
G3 X106.17 Y118.483 I-.083 J.529 E.01523
G1 X106.17 Y133.832 E.41593
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X106.17 Y131.832 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 465
M625
; layer num/total_layer_count: 9/14
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M204 S10000
G17
G3 Z1.72 I1.217 J0 P1  F30000
; object ids of layer 9 start: 325,353,381,409,437,465
M624 PwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer9 end: 325,353,381,409,437,465
M625
; OBJECT_ID: 325
; start printing object, unique label id: 325
M624 AQAAAAAAAAA=
G1 X208.756 Y75.215
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X145.833 Y111.288 E1.96535
G1 X145.466 Y111.288 E.00995
G1 X133.139 Y104.171 E.3857
G1 X132.947 Y103.847 E.01019
G1 X132.001 Y56.564 E1.28149
G1 X208.698 Y75.201 E2.13873
; WIPE_START
G1 X206.963 Y76.197 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.812 Y75.059 Z1.88 F30000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X145.939 Y111.689 E1.85116
G1 X145.358 Y111.688 E.01461
G1 X132.847 Y104.465 E.3632
G1 X132.549 Y103.96 E.01475
G1 X131.595 Y56.282 E1.19892
G1 X131.814 Y56.106 E.00708
G1 X209.753 Y75.045 E2.01651
; WIPE_START
M204 S4000
G1 X208.019 Y76.041 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.783 Y75.579 Z1.88 F30000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.474 Y75.27 E.01185
G1 X206.694 Y75.08 E.02175
G1 X207.271 Y75.657 E.0221
G1 X206.896 Y75.872 E.01172
G1 X205.914 Y74.891 E.03761
G1 X205.134 Y74.701 E.02175
G1 X206.52 Y76.087 E.05312
G1 X206.145 Y76.302 E.01172
G1 X204.354 Y74.512 E.06862
G1 X203.575 Y74.322 E.02175
G1 X205.77 Y76.517 E.08413
G1 X205.395 Y76.732 E.01172
G1 X202.795 Y74.132 E.09963
G1 X202.015 Y73.943 E.02175
G1 X205.019 Y76.948 E.11514
G1 X204.644 Y77.163 E.01172
G1 X201.235 Y73.753 E.13064
G1 X200.455 Y73.564 E.02175
G1 X204.269 Y77.378 E.14615
G1 X203.894 Y77.593 E.01172
G1 X199.675 Y73.374 E.16166
G1 X198.895 Y73.185 E.02175
G1 X203.518 Y77.808 E.17716
G1 X203.143 Y78.023 E.01172
G1 X198.116 Y72.995 E.19267
G1 X197.336 Y72.806 E.02175
G1 X202.768 Y78.238 E.20817
G1 X202.393 Y78.453 E.01172
G1 X196.556 Y72.616 E.22368
G1 X195.776 Y72.427 E.02175
G1 X202.018 Y78.669 E.23919
G1 X201.642 Y78.884 E.01172
G1 X194.996 Y72.237 E.25469
G1 X194.216 Y72.048 E.02175
G1 X201.267 Y79.099 E.2702
G1 X200.892 Y79.314 E.01172
G1 X193.436 Y71.858 E.2857
G1 X192.656 Y71.669 E.02175
G1 X200.517 Y79.529 E.30121
G1 X200.141 Y79.744 E.01172
G1 X191.877 Y71.479 E.31671
G1 X191.097 Y71.29 E.02175
G1 X199.766 Y79.959 E.33222
G1 X199.391 Y80.174 E.01172
G1 X190.317 Y71.1 E.34773
G1 X189.537 Y70.911 E.02175
G1 X199.016 Y80.39 E.36323
G1 X198.64 Y80.605 E.01172
G1 X188.757 Y70.721 E.37874
G1 X187.977 Y70.532 E.02175
G1 X198.265 Y80.82 E.39424
G1 X197.89 Y81.035 E.01172
G1 X187.197 Y70.342 E.40975
G1 X186.417 Y70.153 E.02175
G1 X197.515 Y81.25 E.42526
G1 X197.139 Y81.465 E.01172
G1 X185.638 Y69.963 E.44076
G1 X184.858 Y69.774 E.02175
G1 X196.764 Y81.68 E.45627
G1 X196.389 Y81.895 E.01172
G1 X184.078 Y69.584 E.47177
G1 X183.298 Y69.395 E.02175
G1 X196.014 Y82.11 E.48728
G1 X195.638 Y82.326 E.01172
G1 X182.518 Y69.205 E.50279
G1 X181.738 Y69.016 E.02175
G1 X195.263 Y82.541 E.51829
G1 X194.888 Y82.756 E.01172
G1 X180.958 Y68.826 E.5338
G1 X180.178 Y68.637 E.02175
G1 X194.513 Y82.971 E.5493
G1 X194.137 Y83.186 E.01172
G1 X179.399 Y68.447 E.56481
G1 X178.619 Y68.258 E.02175
G1 X193.762 Y83.401 E.58031
G1 X193.387 Y83.616 E.01172
G1 X177.839 Y68.068 E.59582
G1 X177.059 Y67.879 E.02175
G1 X193.012 Y83.831 E.61133
G1 X192.636 Y84.047 E.01172
G1 X176.279 Y67.689 E.62683
G1 X175.499 Y67.5 E.02175
G1 X192.261 Y84.262 E.64234
G1 X191.886 Y84.477 E.01172
G1 X174.719 Y67.31 E.65784
G1 X173.939 Y67.121 E.02175
G1 X191.511 Y84.692 E.67335
G1 X191.136 Y84.907 E.01172
G1 X173.16 Y66.931 E.68886
G1 X172.38 Y66.742 E.02175
G1 X190.76 Y85.122 E.70436
G1 X190.385 Y85.337 E.01172
G1 X171.6 Y66.552 E.71987
G1 X170.82 Y66.363 E.02175
G1 X190.01 Y85.552 E.73537
G1 X189.635 Y85.768 E.01172
G1 X170.04 Y66.173 E.75088
G1 X169.26 Y65.984 E.02175
G1 X189.259 Y85.983 E.76638
G1 X188.884 Y86.198 E.01172
G1 X168.48 Y65.794 E.78189
G1 X167.7 Y65.605 E.02175
G1 X188.509 Y86.413 E.7974
G1 X188.134 Y86.628 E.01172
G1 X166.921 Y65.415 E.8129
G1 X166.141 Y65.226 E.02175
G1 X187.758 Y86.843 E.82841
G1 X187.383 Y87.058 E.01172
G1 X165.361 Y65.036 E.84391
G1 X164.581 Y64.847 E.02175
G1 X187.008 Y87.273 E.85942
G1 X186.633 Y87.488 E.01172
G1 X163.801 Y64.657 E.87493
G1 X163.021 Y64.468 E.02175
G1 X186.257 Y87.704 E.89043
G1 X185.882 Y87.919 E.01172
G1 X162.241 Y64.278 E.90594
G1 X161.462 Y64.089 E.02175
G1 X185.507 Y88.134 E.92144
G1 X185.132 Y88.349 E.01172
G1 X160.682 Y63.899 E.93695
G1 X159.902 Y63.709 E.02175
G1 X184.756 Y88.564 E.95245
G1 X184.381 Y88.779 E.01172
G1 X159.122 Y63.52 E.96796
G1 X158.342 Y63.33 E.02175
G1 X184.006 Y88.994 E.98347
G1 X183.631 Y89.209 E.01172
G1 X157.562 Y63.141 E.99897
G1 X156.782 Y62.951 E.02175
G1 X183.255 Y89.425 E1.01448
G1 X182.88 Y89.64 E.01172
G1 X156.002 Y62.762 E1.02998
G1 X155.223 Y62.572 E.02175
G1 X182.505 Y89.855 E1.04549
G1 X182.13 Y90.07 E.01172
G1 X154.443 Y62.383 E1.061
G1 X153.663 Y62.193 E.02175
G1 X181.754 Y90.285 E1.0765
G1 X181.379 Y90.5 E.01172
G1 X152.883 Y62.004 E1.09201
G1 X152.103 Y61.814 E.02175
G1 X181.004 Y90.715 E1.10751
G1 X180.629 Y90.93 E.01172
G1 X151.323 Y61.625 E1.12302
G1 X150.543 Y61.435 E.02175
G1 X180.253 Y91.146 E1.13852
G1 X179.878 Y91.361 E.01172
G1 X149.763 Y61.246 E1.15403
G1 X148.984 Y61.056 E.02175
G1 X179.503 Y91.576 E1.16954
G1 X179.128 Y91.791 E.01172
G1 X148.204 Y60.867 E1.18504
G1 X147.424 Y60.677 E.02175
G1 X178.753 Y92.006 E1.20055
G1 X178.377 Y92.221 E.01172
G1 X146.644 Y60.488 E1.21605
G1 X145.864 Y60.298 E.02175
G1 X178.002 Y92.436 E1.23156
G1 X177.627 Y92.651 E.01172
G1 X145.084 Y60.109 E1.24707
G1 X144.304 Y59.919 E.02175
G1 X177.252 Y92.867 E1.26257
G1 X176.876 Y93.082 E.01172
G1 X143.524 Y59.73 E1.27808
G1 X142.745 Y59.54 E.02175
G1 X176.501 Y93.297 E1.29358
G1 X176.126 Y93.512 E.01172
G1 X141.965 Y59.351 E1.30909
G1 X141.185 Y59.161 E.02175
G1 X175.751 Y93.727 E1.3246
G1 X175.375 Y93.942 E.01172
G1 X140.405 Y58.972 E1.3401
G1 X139.625 Y58.782 E.02175
G1 X175 Y94.157 E1.35561
G1 X174.625 Y94.372 E.01172
G1 X138.845 Y58.593 E1.37111
G1 X138.065 Y58.403 E.02175
G1 X174.25 Y94.587 E1.38662
G1 X173.874 Y94.803 E.01172
G1 X137.285 Y58.214 E1.40212
G1 X136.506 Y58.024 E.02175
G1 X173.499 Y95.018 E1.41763
G1 X173.124 Y95.233 E.01172
G1 X135.726 Y57.835 E1.43314
G1 X134.946 Y57.645 E.02175
G1 X172.749 Y95.448 E1.44864
G1 X172.373 Y95.663 E.01172
G1 X134.166 Y57.456 E1.46415
G1 X133.386 Y57.266 E.02175
G1 X171.998 Y95.878 E1.47965
G1 X171.623 Y96.093 E.01172
G1 X132.606 Y57.077 E1.49516
G1 X132.366 Y57.018 E.0067
G1 X132.374 Y57.435 E.0113
G1 X171.248 Y96.308 E1.48967
G1 X170.872 Y96.524 E.01172
G1 X132.386 Y58.038 E1.47483
G1 X132.398 Y58.64 E.01633
G1 X170.497 Y96.739 E1.45998
G1 X170.122 Y96.954 E.01172
G1 X132.41 Y59.242 E1.44514
G1 X132.423 Y59.845 E.01633
G1 X169.747 Y97.169 E1.4303
G1 X169.371 Y97.384 E.01172
G1 X132.435 Y60.447 E1.41546
G1 X132.447 Y61.05 E.01633
G1 X168.996 Y97.599 E1.40062
G1 X168.621 Y97.814 E.01172
G1 X132.459 Y61.652 E1.38578
G1 X132.471 Y62.254 E.01633
G1 X168.246 Y98.029 E1.37093
G1 X167.87 Y98.245 E.01172
G1 X132.483 Y62.857 E1.35609
G1 X132.495 Y63.459 E.01633
G1 X167.495 Y98.46 E1.34125
G1 X167.12 Y98.675 E.01172
G1 X132.507 Y64.062 E1.32641
G1 X132.519 Y64.664 E.01633
G1 X166.745 Y98.89 E1.31157
G1 X166.37 Y99.105 E.01172
G1 X132.531 Y65.267 E1.29673
G1 X132.543 Y65.869 E.01633
G1 X165.994 Y99.32 E1.28188
G1 X165.619 Y99.535 E.01172
G1 X132.555 Y66.471 E1.26704
G1 X132.567 Y67.074 E.01633
G1 X165.244 Y99.75 E1.2522
G1 X164.869 Y99.966 E.01172
G1 X132.579 Y67.676 E1.23736
G1 X132.591 Y68.279 E.01633
G1 X164.493 Y100.181 E1.22252
G1 X164.118 Y100.396 E.01172
G1 X132.603 Y68.881 E1.20768
G1 X132.615 Y69.483 E.01633
G1 X163.743 Y100.611 E1.19283
G1 X163.368 Y100.826 E.01172
G1 X132.627 Y70.086 E1.17799
G1 X132.639 Y70.688 E.01633
G1 X162.992 Y101.041 E1.16315
G1 X162.617 Y101.256 E.01172
G1 X132.652 Y71.291 E1.14831
G1 X132.664 Y71.893 E.01633
G1 X162.242 Y101.471 E1.13347
G1 X161.867 Y101.686 E.01172
G1 X132.676 Y72.496 E1.11863
G1 X132.688 Y73.098 E.01633
G1 X161.491 Y101.902 E1.10379
G1 X161.116 Y102.117 E.01172
G1 X132.7 Y73.7 E1.08894
G1 X132.712 Y74.303 E.01633
G1 X160.741 Y102.332 E1.0741
G1 X160.366 Y102.547 E.01172
G1 X132.724 Y74.905 E1.05926
G1 X132.736 Y75.508 E.01633
G1 X159.99 Y102.762 E1.04442
G1 X159.615 Y102.977 E.01172
G1 X132.748 Y76.11 E1.02958
G1 X132.76 Y76.712 E.01633
G1 X159.24 Y103.192 E1.01474
G1 X158.865 Y103.407 E.01172
G1 X132.772 Y77.315 E.99989
G1 X132.784 Y77.917 E.01633
G1 X158.489 Y103.623 E.98505
G1 X158.114 Y103.838 E.01172
G1 X132.796 Y78.52 E.97021
G1 X132.808 Y79.122 E.01633
G1 X157.739 Y104.053 E.95537
G1 X157.364 Y104.268 E.01172
G1 X132.82 Y79.725 E.94053
G1 X132.832 Y80.327 E.01633
G1 X156.988 Y104.483 E.92569
G1 X156.613 Y104.698 E.01172
G1 X132.844 Y80.929 E.91084
M73 P64 R25
G1 X132.856 Y81.532 E.01633
G1 X156.238 Y104.913 E.896
G1 X155.863 Y105.128 E.01172
G1 X132.869 Y82.134 E.88116
G1 X132.881 Y82.737 E.01633
G1 X155.487 Y105.344 E.86632
G1 X155.112 Y105.559 E.01172
G1 X132.893 Y83.339 E.85148
G1 X132.905 Y83.941 E.01633
G1 X154.737 Y105.774 E.83664
G1 X154.362 Y105.989 E.01172
G1 X132.917 Y84.544 E.82179
G1 X132.929 Y85.146 E.01633
G1 X153.987 Y106.204 E.80695
G1 X153.611 Y106.419 E.01172
G1 X132.941 Y85.749 E.79211
G1 X132.953 Y86.351 E.01633
G1 X153.236 Y106.634 E.77727
G1 X152.861 Y106.849 E.01172
G1 X132.965 Y86.954 E.76243
G1 X132.977 Y87.556 E.01633
G1 X152.486 Y107.065 E.74759
G1 X152.11 Y107.28 E.01172
G1 X132.989 Y88.158 E.73275
G1 X133.001 Y88.761 E.01633
G1 X151.735 Y107.495 E.7179
G1 X151.36 Y107.71 E.01172
G1 X133.013 Y89.363 E.70306
G1 X133.025 Y89.966 E.01633
G1 X150.985 Y107.925 E.68822
G1 X150.609 Y108.14 E.01172
G1 X133.037 Y90.568 E.67338
G1 X133.049 Y91.17 E.01633
G1 X150.234 Y108.355 E.65854
G1 X149.859 Y108.57 E.01172
G1 X133.061 Y91.773 E.6437
G1 X133.073 Y92.375 E.01633
G1 X149.484 Y108.785 E.62885
G1 X149.108 Y109.001 E.01172
G1 X133.086 Y92.978 E.61401
G1 X133.098 Y93.58 E.01633
G1 X148.733 Y109.216 E.59917
G1 X148.358 Y109.431 E.01172
G1 X133.11 Y94.183 E.58433
G1 X133.122 Y94.785 E.01633
G1 X147.983 Y109.646 E.56949
G1 X147.607 Y109.861 E.01172
G1 X133.134 Y95.387 E.55465
G1 X133.146 Y95.99 E.01633
G1 X147.232 Y110.076 E.5398
G1 X146.857 Y110.291 E.01172
G1 X133.158 Y96.592 E.52496
G1 X133.17 Y97.195 E.01633
G1 X146.482 Y110.506 E.51012
G1 X146.106 Y110.722 E.01172
G1 X133.182 Y97.797 E.49528
G1 X133.194 Y98.4 E.01633
G1 X145.727 Y110.932 E.48028
G1 X145.561 Y110.932 E.00449
G1 X144.556 Y110.352 E.03146
G1 X133.206 Y99.002 E.43494
G1 X133.218 Y99.604 E.01633
G1 X143.159 Y109.545 E.38095
G1 X141.762 Y108.739 E.04371
G1 X133.23 Y100.207 E.32696
G1 X133.242 Y100.809 E.01633
G1 X140.365 Y107.932 E.27297
G1 X138.969 Y107.126 E.04371
G1 X133.254 Y101.412 E.21898
G1 X133.266 Y102.014 E.01633
G1 X137.572 Y106.319 E.16499
G1 X136.175 Y105.513 E.04371
G1 X133.278 Y102.616 E.111
G1 X133.29 Y103.219 E.01633
G1 X135.289 Y105.218 E.07659
; OBJECT_ID: 353
; WIPE_START
G1 X133.875 Y103.803 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 325
M625
; start printing object, unique label id: 353
M624 AgAAAAAAAAA=
M204 S10000
G1 X139.745 Y108.682 Z1.88 F30000
G1 X215.595 Y171.728 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X149.657 Y133.927 E2.05953
G1 X149.474 Y133.612 E.00986
G1 X149.474 Y118.388 E.41253
G1 X149.657 Y118.073 E.00986
G1 X215.595 Y80.272 E2.05953
G1 X215.595 Y171.668 E2.47659
M204 S10000
G1 X215.996 Y172.261 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X215.858 Y172.341 E.004
G1 X149.364 Y134.221 E1.92699
G1 X149.074 Y133.72 E.01457
G1 X149.074 Y118.28 E.38817
G1 X149.364 Y117.779 E.01457
G1 X215.858 Y79.659 E1.92699
G1 X215.917 Y79.693 E.00172
G1 X215.996 Y79.739 E.00228
G1 X215.996 Y172.201 E2.32464
; WIPE_START
M204 S4000
G1 X215.858 Y172.341 E-.07451
G1 X214.293 Y171.444 E-.68549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X215.239 Y171.33 Z1.88 F30000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X215.239 Y80.885 E2.45078
G1 X214.822 Y81.124 E.01301
G1 X214.822 Y170.876 E2.432
G1 X214.406 Y170.637 E.01301
G1 X214.406 Y81.363 E2.41905
G1 X213.989 Y81.602 E.01301
G1 X213.989 Y170.398 E2.40611
G1 X213.573 Y170.159 E.01301
G1 X213.573 Y81.841 E2.39317
G1 X213.156 Y82.08 E.01301
G1 X213.156 Y169.92 E2.38022
G1 X212.739 Y169.681 E.01301
G1 X212.739 Y82.319 E2.36728
G1 X212.323 Y82.557 E.01301
G1 X212.323 Y169.443 E2.35434
G1 X211.906 Y169.204 E.01301
G1 X211.906 Y82.796 E2.34139
G1 X211.49 Y83.035 E.01301
G1 X211.49 Y168.965 E2.32845
G1 X211.073 Y168.726 E.01301
G1 X211.073 Y83.274 E2.31551
G1 X210.656 Y83.513 E.01301
G1 X210.656 Y168.487 E2.30256
G1 X210.24 Y168.248 E.01301
G1 X210.24 Y83.752 E2.28962
G1 X209.823 Y83.99 E.01301
G1 X209.823 Y168.01 E2.27667
G1 X209.407 Y167.771 E.01301
G1 X209.407 Y84.229 E2.26373
G1 X208.99 Y84.468 E.01301
G1 X208.99 Y167.532 E2.25079
G1 X208.573 Y167.293 E.01301
G1 X208.573 Y84.707 E2.23784
G1 X208.157 Y84.946 E.01301
G1 X208.157 Y167.054 E2.2249
G1 X207.74 Y166.815 E.01301
G1 X207.74 Y85.185 E2.21196
G1 X207.323 Y85.423 E.01301
G1 X207.323 Y166.577 E2.19901
G1 X206.907 Y166.338 E.01301
M73 P64 R24
G1 X206.907 Y85.662 E2.18607
G1 X206.49 Y85.901 E.01301
G1 X206.49 Y166.099 E2.17313
G1 X206.074 Y165.86 E.01301
G1 X206.074 Y86.14 E2.16018
G1 X205.657 Y86.379 E.01301
G1 X205.657 Y165.621 E2.14724
G1 X205.24 Y165.382 E.01301
G1 X205.24 Y86.618 E2.1343
G1 X204.824 Y86.856 E.01301
G1 X204.824 Y165.144 E2.12135
G1 X204.407 Y164.905 E.01301
G1 X204.407 Y87.095 E2.10841
G1 X203.991 Y87.334 E.01301
G1 X203.991 Y164.666 E2.09547
G1 X203.574 Y164.427 E.01301
G1 X203.574 Y87.573 E2.08252
G1 X203.157 Y87.812 E.01301
G1 X203.157 Y164.188 E2.06958
G1 X202.741 Y163.949 E.01301
G1 X202.741 Y88.051 E2.05663
G1 X202.324 Y88.289 E.01301
G1 X202.324 Y163.711 E2.04369
G1 X201.908 Y163.472 E.01301
G1 X201.908 Y88.528 E2.03075
G1 X201.491 Y88.767 E.01301
G1 X201.491 Y163.233 E2.0178
G1 X201.074 Y162.994 E.01301
G1 X201.074 Y89.006 E2.00486
G1 X200.658 Y89.245 E.01301
G1 X200.658 Y162.755 E1.99192
G1 X200.241 Y162.516 E.01301
G1 X200.241 Y89.484 E1.97897
G1 X199.825 Y89.722 E.01301
G1 X199.825 Y162.278 E1.96603
G1 X199.408 Y162.039 E.01301
G1 X199.408 Y89.961 E1.95309
G1 X198.991 Y90.2 E.01301
G1 X198.991 Y161.8 E1.94014
G1 X198.575 Y161.561 E.01301
G1 X198.575 Y90.439 E1.9272
G1 X198.158 Y90.678 E.01301
G1 X198.158 Y161.322 E1.91426
G1 X197.741 Y161.083 E.01301
G1 X197.741 Y90.917 E1.90131
G1 X197.325 Y91.155 E.01301
G1 X197.325 Y160.845 E1.88837
G1 X196.908 Y160.606 E.01301
G1 X196.908 Y91.394 E1.87543
G1 X196.492 Y91.633 E.01301
G1 X196.492 Y160.367 E1.86248
G1 X196.075 Y160.128 E.01301
G1 X196.075 Y91.872 E1.84954
G1 X195.658 Y92.111 E.01301
G1 X195.658 Y159.889 E1.83659
G1 X195.242 Y159.65 E.01301
G1 X195.242 Y92.35 E1.82365
G1 X194.825 Y92.588 E.01301
G1 X194.825 Y159.412 E1.81071
G1 X194.409 Y159.173 E.01301
G1 X194.409 Y92.827 E1.79776
G1 X193.992 Y93.066 E.01301
G1 X193.992 Y158.934 E1.78482
G1 X193.575 Y158.695 E.01301
G1 X193.575 Y93.305 E1.77188
G1 X193.159 Y93.544 E.01301
G1 X193.159 Y158.456 E1.75893
G1 X192.742 Y158.217 E.01301
G1 X192.742 Y93.783 E1.74599
G1 X192.326 Y94.021 E.01301
G1 X192.326 Y157.978 E1.73305
G1 X191.909 Y157.74 E.01301
G1 X191.909 Y94.26 E1.7201
G1 X191.492 Y94.499 E.01301
G1 X191.492 Y157.501 E1.70716
G1 X191.076 Y157.262 E.01301
G1 X191.076 Y94.738 E1.69422
G1 X190.659 Y94.977 E.01301
G1 X190.659 Y157.023 E1.68127
G1 X190.242 Y156.784 E.01301
G1 X190.242 Y95.216 E1.66833
G1 X189.826 Y95.455 E.01301
G1 X189.826 Y156.545 E1.65539
G1 X189.409 Y156.307 E.01301
G1 X189.409 Y95.693 E1.64244
G1 X188.993 Y95.932 E.01301
G1 X188.993 Y156.068 E1.6295
G1 X188.576 Y155.829 E.01301
G1 X188.576 Y96.171 E1.61655
G1 X188.159 Y96.41 E.01301
G1 X188.159 Y155.59 E1.60361
G1 X187.743 Y155.351 E.01301
G1 X187.743 Y96.649 E1.59067
G1 X187.326 Y96.888 E.01301
G1 X187.326 Y155.112 E1.57772
G1 X186.91 Y154.874 E.01301
G1 X186.91 Y97.126 E1.56478
G1 X186.493 Y97.365 E.01301
G1 X186.493 Y154.635 E1.55184
G1 X186.076 Y154.396 E.01301
G1 X186.076 Y97.604 E1.53889
G1 X185.66 Y97.843 E.01301
G1 X185.66 Y154.157 E1.52595
G1 X185.243 Y153.918 E.01301
G1 X185.243 Y98.082 E1.51301
G1 X184.827 Y98.321 E.01301
G1 X184.827 Y153.679 E1.50006
M73 P65 R24
G1 X184.41 Y153.441 E.01301
G1 X184.41 Y98.559 E1.48712
G1 X183.993 Y98.798 E.01301
G1 X183.993 Y153.202 E1.47418
G1 X183.577 Y152.963 E.01301
G1 X183.577 Y99.037 E1.46123
G1 X183.16 Y99.276 E.01301
G1 X183.16 Y152.724 E1.44829
G1 X182.743 Y152.485 E.01301
G1 X182.743 Y99.515 E1.43535
G1 X182.327 Y99.754 E.01301
G1 X182.327 Y152.246 E1.4224
G1 X181.91 Y152.008 E.01301
G1 X181.91 Y99.992 E1.40946
G1 X181.494 Y100.231 E.01301
G1 X181.494 Y151.769 E1.39651
G1 X181.077 Y151.53 E.01301
G1 X181.077 Y100.47 E1.38357
G1 X180.66 Y100.709 E.01301
G1 X180.66 Y151.291 E1.37063
G1 X180.244 Y151.052 E.01301
G1 X180.244 Y100.948 E1.35768
G1 X179.827 Y101.187 E.01301
G1 X179.827 Y150.813 E1.34474
G1 X179.411 Y150.575 E.01301
G1 X179.411 Y101.425 E1.3318
G1 X178.994 Y101.664 E.01301
G1 X178.994 Y150.336 E1.31885
G1 X178.577 Y150.097 E.01301
G1 X178.577 Y101.903 E1.30591
G1 X178.161 Y102.142 E.01301
G1 X178.161 Y149.858 E1.29297
G1 X177.744 Y149.619 E.01301
G1 X177.744 Y102.381 E1.28002
G1 X177.328 Y102.62 E.01301
G1 X177.328 Y149.38 E1.26708
G1 X176.911 Y149.142 E.01301
G1 X176.911 Y102.858 E1.25414
G1 X176.494 Y103.097 E.01301
G1 X176.494 Y148.903 E1.24119
G1 X176.078 Y148.664 E.01301
G1 X176.078 Y103.336 E1.22825
G1 X175.661 Y103.575 E.01301
G1 X175.661 Y148.425 E1.21531
G1 X175.245 Y148.186 E.01301
G1 X175.245 Y103.814 E1.20236
G1 X174.828 Y104.053 E.01301
G1 X174.828 Y147.947 E1.18942
G1 X174.411 Y147.709 E.01301
G1 X174.411 Y104.291 E1.17647
G1 X173.995 Y104.53 E.01301
G1 X173.995 Y147.47 E1.16353
G1 X173.578 Y147.231 E.01301
G1 X173.578 Y104.769 E1.15059
G1 X173.161 Y105.008 E.01301
G1 X173.161 Y146.992 E1.13764
G1 X172.745 Y146.753 E.01301
G1 X172.745 Y105.247 E1.1247
G1 X172.328 Y105.486 E.01301
G1 X172.328 Y146.514 E1.11176
G1 X171.912 Y146.275 E.01301
G1 X171.912 Y105.724 E1.09881
G1 X171.495 Y105.963 E.01301
G1 X171.495 Y146.037 E1.08587
G1 X171.078 Y145.798 E.01301
G1 X171.078 Y106.202 E1.07293
G1 X170.662 Y106.441 E.01301
G1 X170.662 Y145.559 E1.05998
G1 X170.245 Y145.32 E.01301
G1 X170.245 Y106.68 E1.04704
G1 X169.829 Y106.919 E.01301
G1 X169.829 Y145.081 E1.0341
G1 X169.412 Y144.842 E.01301
G1 X169.412 Y107.157 E1.02115
G1 X168.995 Y107.396 E.01301
G1 X168.995 Y144.604 E1.00821
G1 X168.579 Y144.365 E.01301
G1 X168.579 Y107.635 E.99527
G1 X168.162 Y107.874 E.01301
G1 X168.162 Y144.126 E.98232
G1 X167.746 Y143.887 E.01301
G1 X167.746 Y108.113 E.96938
G1 X167.329 Y108.352 E.01301
G1 X167.329 Y143.648 E.95643
G1 X166.912 Y143.409 E.01301
G1 X166.912 Y108.591 E.94349
G1 X166.496 Y108.829 E.01301
G1 X166.496 Y143.171 E.93055
G1 X166.079 Y142.932 E.01301
G1 X166.079 Y109.068 E.9176
G1 X165.662 Y109.307 E.01301
G1 X165.662 Y142.693 E.90466
G1 X165.246 Y142.454 E.01301
G1 X165.246 Y109.546 E.89172
G1 X164.829 Y109.785 E.01301
G1 X164.829 Y142.215 E.87877
G1 X164.413 Y141.976 E.01301
G1 X164.413 Y110.024 E.86583
G1 X163.996 Y110.262 E.01301
G1 X163.996 Y141.738 E.85289
G1 X163.579 Y141.499 E.01301
G1 X163.579 Y110.501 E.83994
G1 X163.163 Y110.74 E.01301
G1 X163.163 Y141.26 E.827
G1 X162.746 Y141.021 E.01301
G1 X162.746 Y110.979 E.81406
G1 X162.33 Y111.218 E.01301
G1 X162.33 Y140.782 E.80111
G1 X161.913 Y140.543 E.01301
G1 X161.913 Y111.457 E.78817
G1 X161.496 Y111.695 E.01301
G1 X161.496 Y140.305 E.77522
G1 X161.08 Y140.066 E.01301
G1 X161.08 Y111.934 E.76228
G1 X160.663 Y112.173 E.01301
G1 X160.663 Y139.827 E.74934
G1 X160.247 Y139.588 E.01301
G1 X160.247 Y112.412 E.73639
G1 X159.83 Y112.651 E.01301
G1 X159.83 Y139.349 E.72345
G1 X159.413 Y139.11 E.01301
G1 X159.413 Y112.89 E.71051
G1 X158.997 Y113.128 E.01301
G1 X158.997 Y138.872 E.69756
G1 X158.58 Y138.633 E.01301
G1 X158.58 Y113.367 E.68462
G1 X158.164 Y113.606 E.01301
G1 X158.164 Y138.394 E.67168
G1 X157.747 Y138.155 E.01301
G1 X157.747 Y113.845 E.65873
G1 X157.33 Y114.084 E.01301
G1 X157.33 Y137.916 E.64579
G1 X156.914 Y137.677 E.01301
G1 X156.914 Y114.323 E.63285
G1 X156.497 Y114.561 E.01301
G1 X156.497 Y137.439 E.6199
G1 X156.08 Y137.2 E.01301
G1 X156.08 Y114.8 E.60696
G1 X155.664 Y115.039 E.01301
G1 X155.664 Y136.961 E.59402
G1 X155.247 Y136.722 E.01301
G1 X155.247 Y115.278 E.58107
G1 X154.831 Y115.517 E.01301
G1 X154.831 Y136.483 E.56813
G1 X154.414 Y136.244 E.01301
G1 X154.414 Y115.756 E.55518
G1 X153.997 Y115.994 E.01301
G1 X153.997 Y136.006 E.54224
G1 X153.581 Y135.767 E.01301
G1 X153.581 Y116.233 E.5293
G1 X153.164 Y116.472 E.01301
G1 X153.164 Y135.528 E.51635
G1 X152.748 Y135.289 E.01301
G1 X152.748 Y116.711 E.50341
G1 X152.331 Y116.95 E.01301
G1 X152.331 Y135.05 E.49047
G1 X151.914 Y134.811 E.01301
G1 X151.914 Y117.189 E.47752
G1 X151.498 Y117.427 E.01301
G1 X151.498 Y134.572 E.46458
G1 X151.081 Y134.334 E.01301
G1 X151.081 Y117.666 E.45164
G1 X150.665 Y117.905 E.01301
G1 X150.665 Y134.095 E.43869
G1 X150.248 Y133.856 E.01301
G1 X150.248 Y118.144 E.42575
G2 X149.831 Y118.481 I.083 J.528 E.01521
G1 X149.831 Y133.833 E.41599
; OBJECT_ID: 381
; WIPE_START
G1 X149.831 Y131.833 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 353
M625
; start printing object, unique label id: 381
M624 BAAAAAAAAAA=
M204 S10000
G1 X155.9 Y136.462 Z1.88 F30000
G1 X208.756 Y176.785 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X132.001 Y195.436 E2.14036
G1 X132.947 Y148.153 E1.28149
G1 X133.139 Y147.829 E.01019
G1 X145.466 Y140.712 E.3857
G1 X145.833 Y140.712 E.00995
G1 X202.307 Y173.088 E1.76391
G1 X208.704 Y176.755 E.19981
; WIPE_START
G1 X206.761 Y177.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.812 Y176.941 Z1.88 F30000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X131.814 Y195.894 E2.01802
G1 X131.595 Y195.718 E.00708
G1 X132.549 Y148.04 E1.19892
G1 X132.847 Y147.535 E.01475
G1 X145.358 Y140.312 E.3632
G1 X145.939 Y140.311 E.01461
G1 X202.506 Y172.74 E1.6393
G1 X209.76 Y176.911 E.21036
; WIPE_START
M204 S4000
G1 X207.816 Y177.384 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.22 Y176.985 Z1.88 F30000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.646 Y176.558 E.01634
G1 X207.271 Y176.343 E.01172
G1 X206.694 Y176.92 E.0221
G1 X205.914 Y177.109 E.02175
G1 X206.896 Y176.128 E.03761
G1 X206.52 Y175.913 E.01172
G1 X205.134 Y177.299 E.05312
G1 X204.354 Y177.488 E.02175
G1 X206.145 Y175.698 E.06862
G1 X205.77 Y175.483 E.01172
G1 X203.575 Y177.678 E.08413
G1 X202.795 Y177.868 E.02175
G1 X205.395 Y175.268 E.09963
G1 X205.019 Y175.052 E.01172
G1 X202.015 Y178.057 E.11514
G1 X201.235 Y178.247 E.02175
G1 X204.644 Y174.837 E.13064
G1 X204.269 Y174.622 E.01172
G1 X200.455 Y178.436 E.14615
G1 X199.675 Y178.626 E.02175
G1 X203.894 Y174.407 E.16166
G1 X203.518 Y174.192 E.01172
G1 X198.895 Y178.815 E.17716
G1 X198.116 Y179.005 E.02175
G1 X203.143 Y173.977 E.19267
G1 X202.768 Y173.762 E.01172
G1 X197.336 Y179.194 E.20817
G1 X196.556 Y179.384 E.02175
G1 X202.393 Y173.547 E.22368
G1 X202.018 Y173.331 E.01172
G1 X195.776 Y179.573 E.23919
G1 X194.996 Y179.763 E.02175
G1 X201.642 Y173.116 E.25469
G1 X201.267 Y172.901 E.01172
G1 X194.216 Y179.952 E.2702
G1 X193.436 Y180.142 E.02175
G1 X200.892 Y172.686 E.2857
G1 X200.517 Y172.471 E.01172
G1 X192.656 Y180.331 E.30121
G1 X191.877 Y180.521 E.02175
G1 X200.141 Y172.256 E.31671
G1 X199.766 Y172.041 E.01172
G1 X191.097 Y180.71 E.33222
M73 P65 R23
G1 X190.317 Y180.9 E.02175
G1 X199.391 Y171.826 E.34773
G1 X199.016 Y171.611 E.01172
G1 X189.537 Y181.089 E.36323
G1 X188.757 Y181.279 E.02175
G1 X198.64 Y171.395 E.37874
G1 X198.265 Y171.18 E.01172
G1 X187.977 Y181.468 E.39424
G1 X187.197 Y181.658 E.02175
G1 X197.89 Y170.965 E.40975
G1 X197.515 Y170.75 E.01172
G1 X186.417 Y181.847 E.42526
G1 X185.638 Y182.037 E.02175
G1 X197.139 Y170.535 E.44076
G1 X196.764 Y170.32 E.01172
G1 X184.858 Y182.226 E.45627
G1 X184.078 Y182.416 E.02175
G1 X196.389 Y170.105 E.47177
G1 X196.014 Y169.89 E.01172
G1 X183.298 Y182.605 E.48728
G1 X182.518 Y182.795 E.02175
G1 X195.638 Y169.674 E.50278
G1 X195.263 Y169.459 E.01172
G1 X181.738 Y182.984 E.51829
G1 X180.958 Y183.174 E.02175
G1 X194.888 Y169.244 E.5338
G1 X194.513 Y169.029 E.01172
G1 X180.178 Y183.363 E.5493
G1 X179.399 Y183.553 E.02175
G1 X194.137 Y168.814 E.56481
G1 X193.762 Y168.599 E.01172
G1 X178.619 Y183.742 E.58031
G1 X177.839 Y183.932 E.02175
G1 X193.387 Y168.384 E.59582
G1 X193.012 Y168.169 E.01172
G1 X177.059 Y184.121 E.61133
G1 X176.279 Y184.311 E.02175
G1 X192.636 Y167.953 E.62683
G1 X192.261 Y167.738 E.01172
G1 X175.499 Y184.5 E.64234
G1 X174.719 Y184.69 E.02175
G1 X191.886 Y167.523 E.65784
G1 X191.511 Y167.308 E.01172
G1 X173.939 Y184.879 E.67335
G1 X173.16 Y185.069 E.02175
G1 X191.135 Y167.093 E.68885
G1 X190.76 Y166.878 E.01172
G1 X172.38 Y185.258 E.70436
G1 X171.6 Y185.448 E.02175
G1 X190.385 Y166.663 E.71987
G1 X190.01 Y166.448 E.01172
G1 X170.82 Y185.637 E.73537
G1 X170.04 Y185.827 E.02175
G1 X189.635 Y166.232 E.75088
G1 X189.259 Y166.017 E.01172
G1 X169.26 Y186.016 E.76638
G1 X168.48 Y186.206 E.02175
G1 X188.884 Y165.802 E.78189
G1 X188.509 Y165.587 E.01172
G1 X167.7 Y186.395 E.7974
G1 X166.921 Y186.585 E.02175
G1 X188.134 Y165.372 E.8129
G1 X187.758 Y165.157 E.01172
G1 X166.141 Y186.774 E.82841
G1 X165.361 Y186.964 E.02175
G1 X187.383 Y164.942 E.84391
G1 X187.008 Y164.727 E.01172
G1 X164.581 Y187.153 E.85942
G1 X163.801 Y187.343 E.02175
G1 X186.633 Y164.512 E.87493
G1 X186.257 Y164.296 E.01172
G1 X163.021 Y187.532 E.89043
G1 X162.241 Y187.722 E.02175
G1 X185.882 Y164.081 E.90594
G1 X185.507 Y163.866 E.01172
G1 X161.461 Y187.911 E.92144
G1 X160.682 Y188.101 E.02175
G1 X185.132 Y163.651 E.93695
G1 X184.756 Y163.436 E.01172
G1 X159.902 Y188.291 E.95245
G1 X159.122 Y188.48 E.02175
G1 X184.381 Y163.221 E.96796
G1 X184.006 Y163.006 E.01172
G1 X158.342 Y188.67 E.98347
G1 X157.562 Y188.859 E.02175
G1 X183.631 Y162.791 E.99897
G1 X183.255 Y162.575 E.01172
G1 X156.782 Y189.049 E1.01448
G1 X156.002 Y189.238 E.02175
G1 X182.88 Y162.36 E1.02998
G1 X182.505 Y162.145 E.01172
G1 X155.223 Y189.428 E1.04549
G1 X154.443 Y189.617 E.02175
G1 X182.13 Y161.93 E1.061
G1 X181.754 Y161.715 E.01172
G1 X153.663 Y189.807 E1.0765
G1 X152.883 Y189.996 E.02175
G1 X181.379 Y161.5 E1.09201
G1 X181.004 Y161.285 E.01172
G1 X152.103 Y190.186 E1.10751
G1 X151.323 Y190.375 E.02175
G1 X180.629 Y161.07 E1.12302
G1 X180.253 Y160.854 E.01172
G1 X150.543 Y190.565 E1.13852
G1 X149.763 Y190.754 E.02175
G1 X179.878 Y160.639 E1.15403
G1 X179.503 Y160.424 E.01172
G1 X148.984 Y190.944 E1.16954
M73 P66 R23
G1 X148.204 Y191.133 E.02175
G1 X179.128 Y160.209 E1.18504
G1 X178.752 Y159.994 E.01172
G1 X147.424 Y191.323 E1.20055
G1 X146.644 Y191.512 E.02175
G1 X178.377 Y159.779 E1.21605
G1 X178.002 Y159.564 E.01172
G1 X145.864 Y191.702 E1.23156
G1 X145.084 Y191.891 E.02175
G1 X177.627 Y159.349 E1.24707
G1 X177.252 Y159.133 E.01172
G1 X144.304 Y192.081 E1.26257
G1 X143.524 Y192.27 E.02175
G1 X176.876 Y158.918 E1.27808
G1 X176.501 Y158.703 E.01172
G1 X142.745 Y192.46 E1.29358
G1 X141.965 Y192.649 E.02175
G1 X176.126 Y158.488 E1.30909
G1 X175.751 Y158.273 E.01172
G1 X141.185 Y192.839 E1.3246
G1 X140.405 Y193.028 E.02175
G1 X175.375 Y158.058 E1.3401
G1 X175 Y157.843 E.01172
G1 X139.625 Y193.218 E1.35561
G1 X138.845 Y193.407 E.02175
G1 X174.625 Y157.628 E1.37111
G1 X174.25 Y157.413 E.01172
G1 X138.065 Y193.597 E1.38662
G1 X137.285 Y193.786 E.02175
G1 X173.874 Y157.197 E1.40212
G1 X173.499 Y156.982 E.01172
G1 X136.506 Y193.976 E1.41763
G1 X135.726 Y194.165 E.02175
G1 X173.124 Y156.767 E1.43314
G1 X172.749 Y156.552 E.01172
G1 X134.946 Y194.355 E1.44864
G1 X134.166 Y194.544 E.02175
G1 X172.373 Y156.337 E1.46415
G1 X171.998 Y156.122 E.01172
G1 X133.386 Y194.734 E1.47965
G1 X132.606 Y194.923 E.02175
G1 X171.623 Y155.907 E1.49516
G1 X171.248 Y155.692 E.01172
G1 X132.374 Y194.565 E1.48966
G1 X132.386 Y193.962 E.01633
G1 X170.872 Y155.476 E1.47482
G1 X170.497 Y155.261 E.01172
G1 X132.398 Y193.36 E1.45998
G1 X132.41 Y192.758 E.01633
G1 X170.122 Y155.046 E1.44514
G1 X169.747 Y154.831 E.01172
G1 X132.423 Y192.155 E1.4303
G1 X132.435 Y191.553 E.01633
G1 X169.371 Y154.616 E1.41546
G1 X168.996 Y154.401 E.01172
G1 X132.447 Y190.95 E1.40062
G1 X132.459 Y190.348 E.01633
G1 X168.621 Y154.186 E1.38577
G1 X168.246 Y153.971 E.01172
G1 X132.471 Y189.745 E1.37093
G1 X132.483 Y189.143 E.01633
G1 X167.87 Y153.755 E1.35609
G1 X167.495 Y153.54 E.01172
G1 X132.495 Y188.541 E1.34125
G1 X132.507 Y187.938 E.01633
G1 X167.12 Y153.325 E1.32641
G1 X166.745 Y153.11 E.01172
G1 X132.519 Y187.336 E1.31157
G1 X132.531 Y186.733 E.01633
G1 X166.369 Y152.895 E1.29672
G1 X165.994 Y152.68 E.01172
G1 X132.543 Y186.131 E1.28188
G1 X132.555 Y185.529 E.01633
G1 X165.619 Y152.465 E1.26704
G1 X165.244 Y152.25 E.01172
G1 X132.567 Y184.926 E1.2522
G1 X132.579 Y184.324 E.01633
G1 X164.869 Y152.034 E1.23736
G1 X164.493 Y151.819 E.01172
G1 X132.591 Y183.721 E1.22252
G1 X132.603 Y183.119 E.01633
G1 X164.118 Y151.604 E1.20768
G1 X163.743 Y151.389 E.01172
G1 X132.615 Y182.516 E1.19283
G1 X132.627 Y181.914 E.01633
G1 X163.368 Y151.174 E1.17799
G1 X162.992 Y150.959 E.01172
G1 X132.64 Y181.312 E1.16315
G1 X132.652 Y180.709 E.01633
G1 X162.617 Y150.744 E1.14831
G1 X162.242 Y150.529 E.01172
G1 X132.664 Y180.107 E1.13347
G1 X132.676 Y179.504 E.01633
G1 X161.867 Y150.314 E1.11863
G1 X161.491 Y150.098 E.01172
G1 X132.688 Y178.902 E1.10378
G1 X132.7 Y178.3 E.01633
G1 X161.116 Y149.883 E1.08894
G1 X160.741 Y149.668 E.01172
G1 X132.712 Y177.697 E1.0741
G1 X132.724 Y177.095 E.01633
G1 X160.366 Y149.453 E1.05926
G1 X159.99 Y149.238 E.01172
G1 X132.736 Y176.492 E1.04442
G1 X132.748 Y175.89 E.01633
G1 X159.615 Y149.023 E1.02958
G1 X159.24 Y148.808 E.01172
G1 X132.76 Y175.287 E1.01473
G1 X132.772 Y174.685 E.01633
G1 X158.865 Y148.593 E.99989
G1 X158.489 Y148.377 E.01172
G1 X132.784 Y174.083 E.98505
G1 X132.796 Y173.48 E.01633
G1 X158.114 Y148.162 E.97021
G1 X157.739 Y147.947 E.01172
G1 X132.808 Y172.878 E.95537
G1 X132.82 Y172.275 E.01633
G1 X157.364 Y147.732 E.94053
G1 X156.988 Y147.517 E.01172
G1 X132.832 Y171.673 E.92568
G1 X132.844 Y171.071 E.01633
G1 X156.613 Y147.302 E.91084
G1 X156.238 Y147.087 E.01172
G1 X132.856 Y170.468 E.896
G1 X132.869 Y169.866 E.01633
G1 X155.863 Y146.872 E.88116
G1 X155.487 Y146.656 E.01172
G1 X132.881 Y169.263 E.86632
G1 X132.893 Y168.661 E.01633
G1 X155.112 Y146.441 E.85148
G1 X154.737 Y146.226 E.01172
G1 X132.905 Y168.058 E.83663
G1 X132.917 Y167.456 E.01633
G1 X154.362 Y146.011 E.82179
G1 X153.986 Y145.796 E.01172
G1 X132.929 Y166.854 E.80695
G1 X132.941 Y166.251 E.01633
G1 X153.611 Y145.581 E.79211
G1 X153.236 Y145.366 E.01172
G1 X132.953 Y165.649 E.77727
G1 X132.965 Y165.046 E.01633
G1 X152.861 Y145.151 E.76243
G1 X152.486 Y144.935 E.01172
G1 X132.977 Y164.444 E.74759
G1 X132.989 Y163.842 E.01633
G1 X152.11 Y144.72 E.73274
G1 X151.735 Y144.505 E.01172
G1 X133.001 Y163.239 E.7179
G1 X133.013 Y162.637 E.01633
G1 X151.36 Y144.29 E.70306
G1 X150.985 Y144.075 E.01172
G1 X133.025 Y162.034 E.68822
G1 X133.037 Y161.432 E.01633
G1 X150.609 Y143.86 E.67338
G1 X150.234 Y143.645 E.01172
G1 X133.049 Y160.829 E.65854
G1 X133.061 Y160.227 E.01633
G1 X149.859 Y143.43 E.64369
G1 X149.484 Y143.215 E.01172
G1 X133.073 Y159.625 E.62885
G1 X133.086 Y159.022 E.01633
G1 X149.108 Y142.999 E.61401
G1 X148.733 Y142.784 E.01172
G1 X133.098 Y158.42 E.59917
G1 X133.11 Y157.817 E.01633
G1 X148.358 Y142.569 E.58433
G1 X147.983 Y142.354 E.01172
G1 X133.122 Y157.215 E.56949
G1 X133.134 Y156.613 E.01633
G1 X147.607 Y142.139 E.55465
G1 X147.232 Y141.924 E.01172
G1 X133.146 Y156.01 E.5398
G1 X133.158 Y155.408 E.01633
G1 X146.857 Y141.709 E.52496
G1 X146.482 Y141.494 E.01172
G1 X133.17 Y154.805 E.51012
G1 X133.182 Y154.203 E.01633
G1 X146.106 Y141.278 E.49528
G1 X145.727 Y141.068 E.01176
G1 X133.194 Y153.6 E.48028
G1 X133.206 Y152.998 E.01633
G1 X144.556 Y141.648 E.43493
G1 X143.159 Y142.455 E.04371
G1 X133.218 Y152.396 E.38094
G1 X133.23 Y151.793 E.01633
G1 X141.762 Y143.261 E.32695
G1 X140.365 Y144.068 E.0437
G1 X133.242 Y151.191 E.27297
G1 X133.254 Y150.588 E.01633
G1 X138.969 Y144.874 E.21898
G1 X137.572 Y145.681 E.0437
G1 X133.266 Y149.986 E.16499
G1 X133.278 Y149.384 E.01633
G1 X136.175 Y146.487 E.111
G1 X134.778 Y147.293 E.0437
G1 X133.1 Y148.972 E.06432
; OBJECT_ID: 409
; WIPE_START
G1 X134.514 Y147.558 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 381
M625
; start printing object, unique label id: 409
M624 CAAAAAAAAAA=
M204 S10000
G1 X127.276 Y149.982 Z1.88 F30000
G1 X47.244 Y176.785 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X110.167 Y140.712 E1.96535
G1 X110.534 Y140.712 E.00995
G1 X122.861 Y147.829 E.3857
G1 X123.053 Y148.153 E.01019
G1 X123.999 Y195.436 E1.28149
G1 X47.302 Y176.799 E2.13873
; WIPE_START
G1 X49.037 Y175.803 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.188 Y176.941 Z1.88 F30000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X110.061 Y140.311 E1.85116
G1 X110.123 Y140.311 E.00158
G1 X110.642 Y140.312 E.01304
G1 X123.153 Y147.535 E.3632
G1 X123.451 Y148.04 E.01475
G1 X124.405 Y195.718 E1.19892
G1 X124.186 Y195.894 E.00708
G1 X46.247 Y176.955 E2.01651
; WIPE_START
M204 S4000
G1 X47.981 Y175.959 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.783 Y176.985 Z1.88 F30000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.355 Y176.558 E.01639
G1 X48.73 Y176.342 E.01172
G1 X49.308 Y176.921 E.02215
G1 X50.088 Y177.11 E.02175
G1 X49.106 Y176.127 E.03766
G1 X49.481 Y175.912 E.01172
G1 X50.868 Y177.3 E.05316
G1 X51.648 Y177.489 E.02175
G1 X49.856 Y175.697 E.06867
G1 X50.231 Y175.482 E.01172
G1 X52.428 Y177.679 E.08418
G1 X53.208 Y177.868 E.02175
G1 X50.606 Y175.267 E.09968
G1 X50.982 Y175.052 E.01172
G1 X53.988 Y178.058 E.11519
G1 X54.767 Y178.247 E.02175
G1 X51.357 Y174.837 E.13069
G1 X51.732 Y174.622 E.01172
G1 X55.547 Y178.437 E.1462
G1 X56.327 Y178.626 E.02175
G1 X52.107 Y174.406 E.1617
G1 X52.483 Y174.191 E.01172
G1 X57.107 Y178.816 E.17721
G1 X57.887 Y179.005 E.02175
G1 X52.858 Y173.976 E.19272
G1 X53.233 Y173.761 E.01172
G1 X58.667 Y179.195 E.20822
G1 X59.447 Y179.384 E.02175
G1 X53.608 Y173.546 E.22373
G1 X53.984 Y173.331 E.01172
G1 X60.227 Y179.574 E.23923
G1 X61.006 Y179.763 E.02175
G1 X54.359 Y173.116 E.25474
G1 X54.734 Y172.901 E.01172
G1 X61.786 Y179.953 E.27025
G1 X62.566 Y180.142 E.02175
G1 X55.109 Y172.685 E.28575
G1 X55.485 Y172.47 E.01172
G1 X63.346 Y180.332 E.30126
G1 X64.126 Y180.521 E.02175
G1 X55.86 Y172.255 E.31676
G1 X56.235 Y172.04 E.01172
G1 X64.906 Y180.711 E.33227
G1 X65.686 Y180.9 E.02175
G1 X56.61 Y171.825 E.34777
G1 X56.986 Y171.61 E.01172
G1 X66.466 Y181.09 E.36328
G1 X67.245 Y181.279 E.02175
G1 X57.361 Y171.395 E.37879
G1 X57.736 Y171.18 E.01172
G1 X68.025 Y181.469 E.39429
G1 X68.805 Y181.658 E.02175
G1 X58.111 Y170.964 E.4098
G1 X58.487 Y170.749 E.01172
G1 X69.585 Y181.848 E.4253
G1 X70.365 Y182.037 E.02175
G1 X58.862 Y170.534 E.44081
G1 X59.237 Y170.319 E.01172
G1 X71.145 Y182.227 E.45632
G1 X71.925 Y182.416 E.02175
G1 X59.612 Y170.104 E.47182
G1 X59.988 Y169.889 E.01172
G1 X72.705 Y182.606 E.48733
G1 X73.484 Y182.795 E.02175
G1 X60.363 Y169.674 E.50283
G1 X60.738 Y169.459 E.01172
G1 X74.264 Y182.985 E.51834
G1 X75.044 Y183.174 E.02175
G1 X61.113 Y169.243 E.53385
G1 X61.489 Y169.028 E.01172
G1 X75.824 Y183.364 E.54935
G1 X76.604 Y183.553 E.02175
G1 X61.864 Y168.813 E.56486
G1 X62.239 Y168.598 E.01172
G1 X77.384 Y183.743 E.58036
G1 X78.164 Y183.932 E.02175
G1 X62.614 Y168.383 E.59587
G1 X62.989 Y168.168 E.01172
G1 X78.944 Y184.122 E.61137
G1 X79.723 Y184.311 E.02175
G1 X63.365 Y167.953 E.62688
G1 X63.74 Y167.738 E.01172
G1 X80.503 Y184.501 E.64239
G1 X81.283 Y184.69 E.02175
G1 X64.115 Y167.523 E.65789
G1 X64.49 Y167.307 E.01172
G1 X82.063 Y184.88 E.6734
G1 X82.843 Y185.069 E.02175
G1 X64.866 Y167.092 E.6889
G1 X65.241 Y166.877 E.01172
G1 X83.623 Y185.259 E.70441
G1 X84.403 Y185.448 E.02175
G1 X65.616 Y166.662 E.71992
G1 X65.991 Y166.447 E.01172
G1 X85.182 Y185.638 E.73542
G1 X85.962 Y185.827 E.02175
G1 X66.367 Y166.232 E.75093
G1 X66.742 Y166.017 E.01172
G1 X86.742 Y186.017 E.76643
G1 X87.522 Y186.207 E.02175
G1 X67.117 Y165.802 E.78194
G1 X67.492 Y165.586 E.01172
G1 X88.302 Y186.396 E.79744
G1 X89.082 Y186.586 E.02175
G1 X67.868 Y165.371 E.81295
G1 X68.243 Y165.156 E.01172
G1 X89.862 Y186.775 E.82846
G1 X90.642 Y186.965 E.02175
G1 X68.618 Y164.941 E.84396
G1 X68.993 Y164.726 E.01172
G1 X91.421 Y187.154 E.85947
G1 X92.201 Y187.344 E.02175
G1 X69.369 Y164.511 E.87497
G1 X69.744 Y164.296 E.01172
G1 X92.981 Y187.533 E.89048
G1 X93.761 Y187.723 E.02175
G1 X70.119 Y164.081 E.90599
G1 X70.494 Y163.865 E.01172
G1 X94.541 Y187.912 E.92149
G1 X95.321 Y188.102 E.02175
G1 X70.87 Y163.65 E.937
G1 X71.245 Y163.435 E.01172
G1 X96.101 Y188.291 E.9525
G1 X96.881 Y188.481 E.02175
G1 X71.62 Y163.22 E.96801
G1 X71.995 Y163.005 E.01172
G1 X97.66 Y188.67 E.98352
G1 X98.44 Y188.86 E.02175
G1 X72.371 Y162.79 E.99902
G1 X72.746 Y162.575 E.01172
G1 X99.22 Y189.049 E1.01453
G1 X100 Y189.239 E.02175
G1 X73.121 Y162.36 E1.03003
G1 X73.496 Y162.144 E.01172
G1 X100.78 Y189.428 E1.04554
G1 X101.56 Y189.618 E.02175
G1 X73.872 Y161.929 E1.06104
G1 X74.247 Y161.714 E.01172
G1 X102.34 Y189.807 E1.07655
M73 P67 R23
G1 X103.12 Y189.997 E.02175
G1 X74.622 Y161.499 E1.09206
G1 X74.997 Y161.284 E.01172
G1 X103.899 Y190.186 E1.10756
G1 X104.679 Y190.376 E.02175
G1 X75.372 Y161.069 E1.12307
G1 X75.748 Y160.854 E.01172
G1 X105.459 Y190.565 E1.13857
G1 X106.239 Y190.755 E.02175
G1 X76.123 Y160.639 E1.15408
G1 X76.498 Y160.424 E.01172
G1 X107.019 Y190.944 E1.16959
G1 X107.799 Y191.134 E.02175
G1 X76.873 Y160.208 E1.18509
G1 X77.249 Y159.993 E.01172
G1 X108.579 Y191.323 E1.2006
G1 X109.359 Y191.513 E.02175
G1 X77.624 Y159.778 E1.2161
G1 X77.999 Y159.563 E.01172
G1 X110.138 Y191.702 E1.23161
G1 X110.918 Y191.892 E.02175
G1 X78.374 Y159.348 E1.24712
G1 X78.75 Y159.133 E.01172
G1 X111.698 Y192.081 E1.26262
G1 X112.478 Y192.271 E.02175
G1 X79.125 Y158.918 E1.27813
G1 X79.5 Y158.703 E.01172
G1 X113.258 Y192.46 E1.29363
G1 X114.038 Y192.65 E.02175
G1 X79.875 Y158.487 E1.30914
G1 X80.251 Y158.272 E.01172
G1 X114.818 Y192.839 E1.32464
G1 X115.598 Y193.029 E.02175
G1 X80.626 Y158.057 E1.34015
G1 X81.001 Y157.842 E.01172
G1 X116.377 Y193.218 E1.35566
G1 X117.157 Y193.408 E.02175
G1 X81.376 Y157.627 E1.37116
G1 X81.752 Y157.412 E.01172
G1 X117.937 Y193.597 E1.38667
G1 X118.717 Y193.787 E.02175
G1 X82.127 Y157.197 E1.40217
G1 X82.502 Y156.982 E.01172
G1 X119.497 Y193.976 E1.41768
G1 X120.277 Y194.166 E.02175
G1 X82.877 Y156.766 E1.43319
G1 X83.253 Y156.551 E.01172
G1 X121.057 Y194.355 E1.44869
G1 X121.837 Y194.545 E.02175
G1 X83.628 Y156.336 E1.4642
G1 X84.003 Y156.121 E.01172
G1 X122.616 Y194.734 E1.4797
G1 X123.396 Y194.924 E.02175
G1 X84.378 Y155.906 E1.49521
G1 X84.754 Y155.691 E.01172
G1 X123.626 Y194.563 E1.48962
G1 X123.614 Y193.961 E.01633
G1 X85.129 Y155.476 E1.47478
G1 X85.504 Y155.261 E.01172
G1 X123.602 Y193.358 E1.45994
G1 X123.589 Y192.756 E.01633
G1 X85.879 Y155.045 E1.44509
G1 X86.254 Y154.83 E.01172
G1 X123.577 Y192.153 E1.43025
G1 X123.565 Y191.551 E.01633
G1 X86.63 Y154.615 E1.41541
G1 X87.005 Y154.4 E.01172
G1 X123.553 Y190.948 E1.40057
G1 X123.541 Y190.346 E.01633
G1 X87.38 Y154.185 E1.38573
G1 X87.755 Y153.97 E.01172
G1 X123.529 Y189.744 E1.37089
G1 X123.517 Y189.141 E.01633
G1 X88.131 Y153.755 E1.35605
G1 X88.506 Y153.54 E.01172
G1 X123.505 Y188.539 E1.3412
G1 X123.493 Y187.936 E.01633
G1 X88.881 Y153.325 E1.32636
G1 X89.256 Y153.109 E.01172
G1 X123.481 Y187.334 E1.31152
G1 X123.469 Y186.732 E.01633
G1 X89.632 Y152.894 E1.29668
G1 X90.007 Y152.679 E.01172
G1 X123.457 Y186.129 E1.28184
G1 X123.445 Y185.527 E.01633
M73 P67 R22
G1 X90.382 Y152.464 E1.267
G1 X90.757 Y152.249 E.01172
G1 X123.433 Y184.924 E1.25215
G1 X123.421 Y184.322 E.01633
G1 X91.133 Y152.034 E1.23731
G1 X91.508 Y151.819 E.01172
G1 X123.409 Y183.719 E1.22247
G1 X123.397 Y183.117 E.01633
G1 X91.883 Y151.604 E1.20763
G1 X92.258 Y151.388 E.01172
G1 X123.385 Y182.515 E1.19279
G1 X123.373 Y181.912 E.01633
G1 X92.634 Y151.173 E1.17795
G1 X93.009 Y150.958 E.01172
G1 X123.36 Y181.31 E1.1631
G1 X123.348 Y180.707 E.01633
G1 X93.384 Y150.743 E1.14826
G1 X93.759 Y150.528 E.01172
G1 X123.336 Y180.105 E1.13342
G1 X123.324 Y179.503 E.01633
G1 X94.135 Y150.313 E1.11858
G1 X94.51 Y150.098 E.01172
G1 X123.312 Y178.9 E1.10374
G1 X123.3 Y178.298 E.01633
G1 X94.885 Y149.883 E1.0889
G1 X95.26 Y149.667 E.01172
G1 X123.288 Y177.695 E1.07406
G1 X123.276 Y177.093 E.01633
G1 X95.636 Y149.452 E1.05921
G1 X96.011 Y149.237 E.01172
G1 X123.264 Y176.49 E1.04437
G1 X123.252 Y175.888 E.01633
G1 X96.386 Y149.022 E1.02953
G1 X96.761 Y148.807 E.01172
G1 X123.24 Y175.286 E1.01469
G1 X123.228 Y174.683 E.01633
G1 X97.137 Y148.592 E.99985
G1 X97.512 Y148.377 E.01172
G1 X123.216 Y174.081 E.98501
G1 X123.204 Y173.478 E.01633
G1 X97.887 Y148.162 E.97016
G1 X98.262 Y147.946 E.01172
G1 X123.192 Y172.876 E.95532
G1 X123.18 Y172.274 E.01633
G1 X98.637 Y147.731 E.94048
G1 X99.013 Y147.516 E.01172
G1 X123.168 Y171.671 E.92564
G1 X123.156 Y171.069 E.01633
G1 X99.388 Y147.301 E.9108
G1 X99.763 Y147.086 E.01172
G1 X123.143 Y170.466 E.89596
G1 X123.131 Y169.864 E.01633
G1 X100.138 Y146.871 E.88111
G1 X100.514 Y146.656 E.01172
G1 X123.119 Y169.261 E.86627
G1 X123.107 Y168.659 E.01633
G1 X100.889 Y146.441 E.85143
G1 X101.264 Y146.226 E.01172
G1 X123.095 Y168.057 E.83659
G1 X123.083 Y167.454 E.01633
G1 X101.639 Y146.01 E.82175
G1 X102.015 Y145.795 E.01172
G1 X123.071 Y166.852 E.80691
G1 X123.059 Y166.249 E.01633
G1 X102.39 Y145.58 E.79207
G1 X102.765 Y145.365 E.01172
G1 X123.047 Y165.647 E.77722
G1 X123.035 Y165.045 E.01633
G1 X103.14 Y145.15 E.76238
G1 X103.516 Y144.935 E.01172
G1 X123.023 Y164.442 E.74754
G1 X123.011 Y163.84 E.01633
G1 X103.891 Y144.72 E.7327
G1 X104.266 Y144.505 E.01172
G1 X122.999 Y163.237 E.71786
G1 X122.987 Y162.635 E.01633
G1 X104.641 Y144.289 E.70302
G1 X105.017 Y144.074 E.01172
G1 X122.975 Y162.032 E.68817
G1 X122.963 Y161.43 E.01633
G1 X105.392 Y143.859 E.67333
G1 X105.767 Y143.644 E.01172
G1 X122.951 Y160.828 E.65849
G1 X122.939 Y160.225 E.01633
G1 X106.142 Y143.429 E.64365
G1 X106.518 Y143.214 E.01172
G1 X122.927 Y159.623 E.62881
G1 X122.914 Y159.02 E.01633
G1 X106.893 Y142.999 E.61397
G1 X107.268 Y142.784 E.01172
G1 X122.902 Y158.418 E.59912
G1 X122.89 Y157.815 E.01633
G1 X107.643 Y142.568 E.58428
G1 X108.019 Y142.353 E.01172
G1 X122.878 Y157.213 E.56944
G1 X122.866 Y156.611 E.01633
G1 X108.394 Y142.138 E.5546
G1 X108.769 Y141.923 E.01172
G1 X122.854 Y156.008 E.53976
G1 X122.842 Y155.406 E.01633
G1 X109.144 Y141.708 E.52492
G1 X109.52 Y141.493 E.01172
G1 X122.83 Y154.803 E.51007
G1 X122.818 Y154.201 E.01633
G1 X109.895 Y141.278 E.49523
G1 X110.275 Y141.068 E.01177
G1 X122.806 Y153.599 E.4802
G1 X122.794 Y152.996 E.01633
G1 X111.449 Y141.651 E.43476
G1 X112.845 Y142.457 E.04371
G1 X122.782 Y152.394 E.38077
G1 X122.77 Y151.791 E.01633
G1 X114.242 Y143.264 E.32679
G1 X115.639 Y144.07 E.04371
G1 X122.758 Y151.189 E.2728
G1 X122.746 Y150.586 E.01633
G1 X117.036 Y144.877 E.21881
G1 X118.433 Y145.683 E.04371
G1 X122.734 Y149.984 E.16482
G1 X122.722 Y149.382 E.01633
G1 X119.829 Y146.49 E.11083
G1 X121.226 Y147.296 E.04371
G1 X122.9 Y148.97 E.06415
; OBJECT_ID: 437
; WIPE_START
G1 X121.486 Y147.556 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 409
M625
; start printing object, unique label id: 437
M624 EAAAAAAAAAA=
M204 S10000
G1 X116.02 Y142.229 Z1.88 F30000
G1 X47.244 Y75.215 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X123.999 Y56.564 E2.14036
G1 X123.053 Y103.847 E1.28149
G1 X122.861 Y104.171 E.01019
G1 X110.534 Y111.288 E.3857
G1 X110.167 Y111.288 E.00995
G1 X47.296 Y75.245 E1.96372
; WIPE_START
G1 X49.239 Y74.772 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.187 Y75.071 Z1.88 F30000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X124.186 Y56.106 E2.01813
G1 X124.405 Y56.282 E.00708
G1 X123.451 Y103.96 E1.19892
G1 X123.153 Y104.465 E.01475
G1 X110.642 Y111.688 E.3632
G1 X110.061 Y111.689 E.01461
G1 X46.239 Y75.101 E1.84954
; WIPE_START
M204 S4000
G1 X48.182 Y74.627 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.218 Y75.579 Z1.88 F30000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.528 Y75.269 E.0119
G1 X49.308 Y75.079 E.02175
G1 X48.73 Y75.658 E.02215
G1 X49.106 Y75.873 E.01172
G1 X50.088 Y74.89 E.03766
G1 X50.868 Y74.7 E.02175
G1 X49.481 Y76.088 E.05316
G1 X49.856 Y76.303 E.01172
G1 X51.648 Y74.511 E.06867
G1 X52.428 Y74.321 E.02175
G1 X50.231 Y76.518 E.08418
G1 X50.606 Y76.733 E.01172
G1 X53.208 Y74.132 E.09968
G1 X53.988 Y73.942 E.02175
G1 X50.982 Y76.948 E.11519
G1 X51.357 Y77.163 E.01172
G1 X54.767 Y73.753 E.13069
G1 X55.547 Y73.563 E.02175
G1 X51.732 Y77.378 E.1462
G1 X52.107 Y77.594 E.01172
G1 X56.327 Y73.374 E.1617
G1 X57.107 Y73.184 E.02175
G1 X52.483 Y77.809 E.17721
G1 X52.858 Y78.024 E.01172
G1 X57.887 Y72.995 E.19272
G1 X58.667 Y72.805 E.02175
G1 X53.233 Y78.239 E.20822
G1 X53.608 Y78.454 E.01172
G1 X59.447 Y72.616 E.22373
G1 X60.227 Y72.426 E.02175
G1 X53.984 Y78.669 E.23923
G1 X54.359 Y78.884 E.01172
G1 X61.006 Y72.237 E.25474
G1 X61.786 Y72.047 E.02175
G1 X54.734 Y79.099 E.27025
G1 X55.109 Y79.315 E.01172
G1 X62.566 Y71.858 E.28575
G1 X63.346 Y71.668 E.02175
G1 X55.485 Y79.53 E.30126
G1 X55.86 Y79.745 E.01172
G1 X64.126 Y71.479 E.31676
G1 X64.906 Y71.289 E.02175
G1 X56.235 Y79.96 E.33227
G1 X56.61 Y80.175 E.01172
G1 X65.686 Y71.1 E.34778
G1 X66.466 Y70.91 E.02175
G1 X56.986 Y80.39 E.36328
G1 X57.361 Y80.605 E.01172
G1 X67.245 Y70.721 E.37879
G1 X68.025 Y70.531 E.02175
G1 X57.736 Y80.82 E.39429
G1 X58.111 Y81.036 E.01172
G1 X68.805 Y70.342 E.4098
G1 X69.585 Y70.152 E.02175
G1 X58.487 Y81.251 E.4253
G1 X58.862 Y81.466 E.01172
G1 X70.365 Y69.963 E.44081
G1 X71.145 Y69.773 E.02175
G1 X59.237 Y81.681 E.45632
G1 X59.612 Y81.896 E.01172
G1 X71.925 Y69.584 E.47182
G1 X72.705 Y69.394 E.02175
G1 X59.988 Y82.111 E.48733
G1 X60.363 Y82.326 E.01172
G1 X73.484 Y69.205 E.50283
G1 X74.264 Y69.015 E.02175
G1 X60.738 Y82.541 E.51834
G1 X61.113 Y82.757 E.01172
G1 X75.044 Y68.826 E.53385
G1 X75.824 Y68.636 E.02175
G1 X61.489 Y82.972 E.54935
G1 X61.864 Y83.187 E.01172
G1 X76.604 Y68.447 E.56486
G1 X77.384 Y68.257 E.02175
G1 X62.239 Y83.402 E.58036
G1 X62.614 Y83.617 E.01172
G1 X78.164 Y68.068 E.59587
G1 X78.943 Y67.878 E.02175
G1 X62.989 Y83.832 E.61137
G1 X63.365 Y84.047 E.01172
G1 X79.723 Y67.689 E.62688
G1 X80.503 Y67.499 E.02175
G1 X63.74 Y84.262 E.64239
G1 X64.115 Y84.477 E.01172
G1 X81.283 Y67.31 E.65789
G1 X82.063 Y67.12 E.02175
G1 X64.49 Y84.693 E.6734
G1 X64.866 Y84.908 E.01172
G1 X82.843 Y66.931 E.6889
G1 X83.623 Y66.741 E.02175
G1 X65.241 Y85.123 E.70441
G1 X65.616 Y85.338 E.01172
G1 X84.403 Y66.552 E.71992
G1 X85.182 Y66.362 E.02175
G1 X65.991 Y85.553 E.73542
G1 X66.367 Y85.768 E.01172
G1 X85.962 Y66.173 E.75093
G1 X86.742 Y65.983 E.02175
G1 X66.742 Y85.983 E.76643
G1 X67.117 Y86.198 E.01172
G1 X87.522 Y65.794 E.78194
G1 X88.302 Y65.604 E.02175
G1 X67.492 Y86.414 E.79744
G1 X67.868 Y86.629 E.01172
G1 X89.082 Y65.414 E.81295
G1 X89.862 Y65.225 E.02175
G1 X68.243 Y86.844 E.82846
G1 X68.618 Y87.059 E.01172
G1 X90.642 Y65.035 E.84396
G1 X91.421 Y64.846 E.02175
G1 X68.993 Y87.274 E.85947
G1 X69.369 Y87.489 E.01172
G1 X92.201 Y64.656 E.87497
G1 X92.981 Y64.467 E.02175
G1 X69.744 Y87.704 E.89048
G1 X70.119 Y87.919 E.01172
G1 X93.761 Y64.277 E.90599
G1 X94.541 Y64.088 E.02175
G1 X70.494 Y88.135 E.92149
G1 X70.87 Y88.35 E.01172
G1 X95.321 Y63.898 E.937
G1 X96.101 Y63.709 E.02175
G1 X71.245 Y88.565 E.9525
G1 X71.62 Y88.78 E.01172
G1 X96.881 Y63.519 E.96801
G1 X97.66 Y63.33 E.02175
G1 X71.995 Y88.995 E.98351
M73 P68 R22
G1 X72.371 Y89.21 E.01172
G1 X98.44 Y63.14 E.99902
G1 X99.22 Y62.951 E.02175
G1 X72.746 Y89.425 E1.01453
G1 X73.121 Y89.64 E.01172
G1 X100 Y62.761 E1.03003
G1 X100.78 Y62.572 E.02175
G1 X73.496 Y89.856 E1.04554
G1 X73.872 Y90.071 E.01172
G1 X101.56 Y62.382 E1.06104
G1 X102.34 Y62.193 E.02175
G1 X74.247 Y90.286 E1.07655
G1 X74.622 Y90.501 E.01172
G1 X103.12 Y62.003 E1.09206
G1 X103.899 Y61.814 E.02175
G1 X74.997 Y90.716 E1.10756
G1 X75.372 Y90.931 E.01172
G1 X104.679 Y61.624 E1.12307
G1 X105.459 Y61.435 E.02175
G1 X75.748 Y91.146 E1.13857
G1 X76.123 Y91.361 E.01172
G1 X106.239 Y61.245 E1.15408
G1 X107.019 Y61.056 E.02175
G1 X76.498 Y91.576 E1.16959
G1 X76.873 Y91.792 E.01172
G1 X107.799 Y60.866 E1.18509
G1 X108.579 Y60.677 E.02175
G1 X77.249 Y92.007 E1.2006
G1 X77.624 Y92.222 E.01172
G1 X109.359 Y60.487 E1.2161
G1 X110.138 Y60.298 E.02175
G1 X77.999 Y92.437 E1.23161
G1 X78.374 Y92.652 E.01172
G1 X110.918 Y60.108 E1.24711
G1 X111.698 Y59.919 E.02175
G1 X78.75 Y92.867 E1.26262
G1 X79.125 Y93.082 E.01172
G1 X112.478 Y59.729 E1.27813
G1 X113.258 Y59.54 E.02175
G1 X79.5 Y93.297 E1.29363
G1 X79.875 Y93.513 E.01172
G1 X114.038 Y59.35 E1.30914
G1 X114.818 Y59.161 E.02175
G1 X80.251 Y93.728 E1.32464
G1 X80.626 Y93.943 E.01172
G1 X115.598 Y58.971 E1.34015
G1 X116.377 Y58.782 E.02175
G1 X81.001 Y94.158 E1.35565
G1 X81.376 Y94.373 E.01172
G1 X117.157 Y58.592 E1.37116
G1 X117.937 Y58.403 E.02175
G1 X81.752 Y94.588 E1.38667
G1 X82.127 Y94.803 E.01172
G1 X118.717 Y58.213 E1.40217
G1 X119.497 Y58.024 E.02175
G1 X82.502 Y95.018 E1.41768
G1 X82.877 Y95.234 E.01172
G1 X120.277 Y57.834 E1.43318
G1 X121.057 Y57.645 E.02175
G1 X83.253 Y95.449 E1.44869
G1 X83.628 Y95.664 E.01172
G1 X121.836 Y57.455 E1.4642
G1 X122.616 Y57.266 E.02175
G1 X84.003 Y95.879 E1.4797
G1 X84.378 Y96.094 E.01172
G1 X123.396 Y57.076 E1.49521
G1 X123.634 Y57.018 E.00663
G1 X123.626 Y57.437 E.01135
G1 X84.754 Y96.309 E1.48962
G1 X85.129 Y96.524 E.01172
G1 X123.614 Y58.039 E1.47478
G1 X123.602 Y58.642 E.01633
G1 X85.504 Y96.739 E1.45994
G1 X85.879 Y96.955 E.01172
G1 X123.59 Y59.244 E1.4451
G1 X123.577 Y59.847 E.01633
G1 X86.255 Y97.17 E1.43025
G1 X86.63 Y97.385 E.01172
G1 X123.565 Y60.449 E1.41541
G1 X123.553 Y61.052 E.01633
G1 X87.005 Y97.6 E1.40057
G1 X87.38 Y97.815 E.01172
G1 X123.541 Y61.654 E1.38573
G1 X123.529 Y62.256 E.01633
G1 X87.755 Y98.03 E1.37089
G1 X88.131 Y98.245 E.01172
G1 X123.517 Y62.859 E1.35605
G1 X123.505 Y63.461 E.01633
G1 X88.506 Y98.46 E1.3412
G1 X88.881 Y98.675 E.01172
G1 X123.493 Y64.064 E1.32636
G1 X123.481 Y64.666 E.01633
G1 X89.256 Y98.891 E1.31152
G1 X89.632 Y99.106 E.01172
G1 X123.469 Y65.268 E1.29668
G1 X123.457 Y65.871 E.01633
G1 X90.007 Y99.321 E1.28184
G1 X90.382 Y99.536 E.01172
G1 X123.445 Y66.473 E1.267
G1 X123.433 Y67.076 E.01633
G1 X90.757 Y99.751 E1.25215
G1 X91.133 Y99.966 E.01172
G1 X123.421 Y67.678 E1.23731
G1 X123.409 Y68.281 E.01633
G1 X91.508 Y100.181 E1.22247
G1 X91.883 Y100.396 E.01172
G1 X123.397 Y68.883 E1.20763
G1 X123.385 Y69.485 E.01633
G1 X92.258 Y100.612 E1.19279
G1 X92.634 Y100.827 E.01172
G1 X123.373 Y70.088 E1.17795
G1 X123.36 Y70.69 E.01633
G1 X93.009 Y101.042 E1.1631
G1 X93.384 Y101.257 E.01172
G1 X123.348 Y71.293 E1.14826
G1 X123.336 Y71.895 E.01633
G1 X93.759 Y101.472 E1.13342
G1 X94.135 Y101.687 E.01172
G1 X123.324 Y72.497 E1.11858
G1 X123.312 Y73.1 E.01633
G1 X94.51 Y101.902 E1.10374
G1 X94.885 Y102.117 E.01172
G1 X123.3 Y73.702 E1.0889
G1 X123.288 Y74.305 E.01633
G1 X95.26 Y102.333 E1.07406
G1 X95.636 Y102.548 E.01172
G1 X123.276 Y74.907 E1.05921
G1 X123.264 Y75.51 E.01633
G1 X96.011 Y102.763 E1.04437
G1 X96.386 Y102.978 E.01172
G1 X123.252 Y76.112 E1.02953
G1 X123.24 Y76.714 E.01633
G1 X96.761 Y103.193 E1.01469
G1 X97.137 Y103.408 E.01172
G1 X123.228 Y77.317 E.99985
G1 X123.216 Y77.919 E.01633
G1 X97.512 Y103.623 E.98501
G1 X97.887 Y103.838 E.01172
G1 X123.204 Y78.522 E.97016
G1 X123.192 Y79.124 E.01633
G1 X98.262 Y104.053 E.95532
G1 X98.638 Y104.269 E.01172
G1 X123.18 Y79.726 E.94048
G1 X123.168 Y80.329 E.01633
G1 X99.013 Y104.484 E.92564
G1 X99.388 Y104.699 E.01172
G1 X123.156 Y80.931 E.9108
G1 X123.144 Y81.534 E.01633
G1 X99.763 Y104.914 E.89596
G1 X100.138 Y105.129 E.01172
G1 X123.131 Y82.136 E.88111
G1 X123.119 Y82.739 E.01633
G1 X100.514 Y105.344 E.86627
G1 X100.889 Y105.559 E.01172
G1 X123.107 Y83.341 E.85143
G1 X123.095 Y83.943 E.01633
G1 X101.264 Y105.774 E.83659
G1 X101.639 Y105.99 E.01172
G1 X123.083 Y84.546 E.82175
G1 X123.071 Y85.148 E.01633
G1 X102.015 Y106.205 E.80691
G1 X102.39 Y106.42 E.01172
G1 X123.059 Y85.751 E.79206
G1 X123.047 Y86.353 E.01633
G1 X102.765 Y106.635 E.77722
G1 X103.14 Y106.85 E.01172
G1 X123.035 Y86.955 E.76238
G1 X123.023 Y87.558 E.01633
G1 X103.516 Y107.065 E.74754
G1 X103.891 Y107.28 E.01172
G1 X123.011 Y88.16 E.7327
G1 X122.999 Y88.763 E.01633
G1 X104.266 Y107.495 E.71786
G1 X104.641 Y107.711 E.01172
G1 X122.987 Y89.365 E.70301
G1 X122.975 Y89.968 E.01633
G1 X105.017 Y107.926 E.68817
G1 X105.392 Y108.141 E.01172
G1 X122.963 Y90.57 E.67333
G1 X122.951 Y91.172 E.01633
G1 X105.767 Y108.356 E.65849
G1 X106.142 Y108.571 E.01172
G1 X122.939 Y91.775 E.64365
G1 X122.927 Y92.377 E.01633
G1 X106.518 Y108.786 E.62881
G1 X106.893 Y109.001 E.01172
G1 X122.914 Y92.98 E.61397
G1 X122.902 Y93.582 E.01633
G1 X107.268 Y109.216 E.59912
G1 X107.643 Y109.432 E.01172
G1 X122.89 Y94.184 E.58428
G1 X122.878 Y94.787 E.01633
G1 X108.019 Y109.647 E.56944
G1 X108.394 Y109.862 E.01172
G1 X122.866 Y95.389 E.5546
G1 X122.854 Y95.992 E.01633
G1 X108.769 Y110.077 E.53976
G1 X109.144 Y110.292 E.01172
G1 X122.842 Y96.594 E.52492
G1 X122.83 Y97.197 E.01633
G1 X109.52 Y110.507 E.51007
G1 X109.895 Y110.722 E.01172
G1 X122.818 Y97.799 E.49523
G1 X122.806 Y98.401 E.01633
G1 X110.275 Y110.932 E.4802
G1 X110.439 Y110.932 E.00444
G1 X111.449 Y110.349 E.0316
G1 X122.794 Y99.004 E.43476
G1 X122.782 Y99.606 E.01633
G1 X112.845 Y109.543 E.38078
G1 X114.242 Y108.736 E.04371
G1 X122.77 Y100.209 E.32679
G1 X122.758 Y100.811 E.01633
G1 X115.639 Y107.93 E.2728
G1 X117.036 Y107.123 E.0437
G1 X122.746 Y101.414 E.21881
G1 X122.734 Y102.016 E.01633
M73 P68 R21
G1 X118.433 Y106.317 E.16482
G1 X119.829 Y105.51 E.04371
G1 X122.722 Y102.618 E.11083
G1 X122.71 Y103.221 E.01633
G1 X120.715 Y105.215 E.07642
; OBJECT_ID: 465
; WIPE_START
G1 X122.129 Y103.801 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 437
M625
; start printing object, unique label id: 465
M624 IAAAAAAAAAA=
M204 S10000
G1 X116.26 Y108.68 Z1.88 F30000
G1 X40.405 Y171.729 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X40.405 Y80.271 E2.47822
G1 X106.343 Y118.073 E2.05953
G1 X106.526 Y118.388 E.00987
G1 X106.526 Y133.612 E.41252
G1 X106.343 Y133.927 E.00987
G1 X40.457 Y171.699 E2.0579
M204 S10000
G1 X40.004 Y172.261 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X40.004 Y79.739 E2.32615
G1 X40.142 Y79.659 E.004
G1 X106.636 Y117.779 E1.92699
G1 X106.927 Y118.28 E.01457
G1 X106.927 Y133.72 E.38817
G1 X106.636 Y134.221 E.01457
G1 X40.142 Y172.341 E1.92699
G1 X40.056 Y172.292 E.00249
; WIPE_START
M204 S4000
G1 X40.055 Y170.292 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X40.762 Y171.33 Z1.88 F30000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X40.762 Y80.886 E2.45075
G1 X41.179 Y81.125 E.01301
G1 X41.179 Y170.875 E2.43197
G1 X41.595 Y170.636 E.01301
G1 X41.595 Y81.364 E2.41902
G1 X42.012 Y81.603 E.01301
G1 X42.012 Y170.397 E2.40608
G1 X42.428 Y170.159 E.01301
G1 X42.428 Y81.841 E2.39314
G1 X42.845 Y82.08 E.01301
G1 X42.845 Y169.92 E2.38019
G1 X43.262 Y169.681 E.01301
G1 X43.262 Y82.319 E2.36725
G1 X43.678 Y82.558 E.01301
G1 X43.678 Y169.442 E2.35431
G1 X44.095 Y169.203 E.01301
G1 X44.095 Y82.797 E2.34136
G1 X44.512 Y83.036 E.01301
G1 X44.512 Y168.964 E2.32842
G1 X44.928 Y168.726 E.01301
G1 X44.928 Y83.274 E2.31548
G1 X45.345 Y83.513 E.01301
G1 X45.345 Y168.487 E2.30253
G1 X45.761 Y168.248 E.01301
G1 X45.761 Y83.752 E2.28959
G1 X46.178 Y83.991 E.01301
G1 X46.178 Y168.009 E2.27665
G1 X46.595 Y167.77 E.01301
G1 X46.595 Y84.23 E2.2637
G1 X47.011 Y84.469 E.01301
G1 X47.011 Y167.531 E2.25076
G1 X47.428 Y167.293 E.01301
G1 X47.428 Y84.707 E2.23781
G1 X47.844 Y84.946 E.01301
G1 X47.844 Y167.054 E2.22487
G1 X48.261 Y166.815 E.01301
G1 X48.261 Y85.185 E2.21193
G1 X48.678 Y85.424 E.01301
G1 X48.678 Y166.576 E2.19898
G1 X49.094 Y166.337 E.01301
G1 X49.094 Y85.663 E2.18604
G1 X49.511 Y85.902 E.01301
G1 X49.511 Y166.098 E2.1731
G1 X49.927 Y165.86 E.01301
G1 X49.927 Y86.14 E2.16015
G1 X50.344 Y86.379 E.01301
G1 X50.344 Y165.621 E2.14721
G1 X50.761 Y165.382 E.01301
G1 X50.761 Y86.618 E2.13427
G1 X51.177 Y86.857 E.01301
G1 X51.177 Y165.143 E2.12132
G1 X51.594 Y164.904 E.01301
G1 X51.594 Y87.096 E2.10838
G1 X52.011 Y87.335 E.01301
G1 X52.011 Y164.665 E2.09544
G1 X52.427 Y164.426 E.01301
G1 X52.427 Y87.573 E2.08249
G1 X52.844 Y87.812 E.01301
G1 X52.844 Y164.188 E2.06955
M73 P69 R21
G1 X53.26 Y163.949 E.01301
G1 X53.26 Y88.051 E2.05661
G1 X53.677 Y88.29 E.01301
G1 X53.677 Y163.71 E2.04366
G1 X54.094 Y163.471 E.01301
G1 X54.094 Y88.529 E2.03072
G1 X54.51 Y88.768 E.01301
G1 X54.51 Y163.232 E2.01778
G1 X54.927 Y162.993 E.01301
G1 X54.927 Y89.006 E2.00483
G1 X55.343 Y89.245 E.01301
G1 X55.343 Y162.755 E1.99189
G1 X55.76 Y162.516 E.01301
G1 X55.76 Y89.484 E1.97894
G1 X56.177 Y89.723 E.01301
G1 X56.177 Y162.277 E1.966
G1 X56.593 Y162.038 E.01301
G1 X56.593 Y89.962 E1.95306
G1 X57.01 Y90.201 E.01301
G1 X57.01 Y161.799 E1.94011
G1 X57.426 Y161.56 E.01301
G1 X57.426 Y90.439 E1.92717
G1 X57.843 Y90.678 E.01301
G1 X57.843 Y161.322 E1.91423
G1 X58.26 Y161.083 E.01301
G1 X58.26 Y90.917 E1.90128
G1 X58.676 Y91.156 E.01301
G1 X58.676 Y160.844 E1.88834
G1 X59.093 Y160.605 E.01301
G1 X59.093 Y91.395 E1.8754
G1 X59.51 Y91.634 E.01301
G1 X59.51 Y160.366 E1.86245
G1 X59.926 Y160.127 E.01301
G1 X59.926 Y91.872 E1.84951
G1 X60.343 Y92.111 E.01301
G1 X60.343 Y159.889 E1.83657
G1 X60.759 Y159.65 E.01301
G1 X60.759 Y92.35 E1.82362
G1 X61.176 Y92.589 E.01301
G1 X61.176 Y159.411 E1.81068
G1 X61.593 Y159.172 E.01301
G1 X61.593 Y92.828 E1.79773
G1 X62.009 Y93.067 E.01301
G1 X62.009 Y158.933 E1.78479
G1 X62.426 Y158.694 E.01301
G1 X62.426 Y93.305 E1.77185
G1 X62.842 Y93.544 E.01301
G1 X62.842 Y158.456 E1.7589
G1 X63.259 Y158.217 E.01301
G1 X63.259 Y93.783 E1.74596
G1 X63.676 Y94.022 E.01301
G1 X63.676 Y157.978 E1.73302
G1 X64.092 Y157.739 E.01301
G1 X64.092 Y94.261 E1.72007
G1 X64.509 Y94.5 E.01301
G1 X64.509 Y157.5 E1.70713
G1 X64.925 Y157.261 E.01301
G1 X64.925 Y94.739 E1.69419
G1 X65.342 Y94.977 E.01301
G1 X65.342 Y157.023 E1.68124
G1 X65.759 Y156.784 E.01301
G1 X65.759 Y95.216 E1.6683
G1 X66.175 Y95.455 E.01301
G1 X66.175 Y156.545 E1.65536
G1 X66.592 Y156.306 E.01301
G1 X66.592 Y95.694 E1.64241
G1 X67.008 Y95.933 E.01301
G1 X67.008 Y156.067 E1.62947
G1 X67.425 Y155.828 E.01301
G1 X67.425 Y96.172 E1.61653
G1 X67.842 Y96.41 E.01301
G1 X67.842 Y155.59 E1.60358
G1 X68.258 Y155.351 E.01301
G1 X68.258 Y96.649 E1.59064
G1 X68.675 Y96.888 E.01301
G1 X68.675 Y155.112 E1.5777
G1 X69.092 Y154.873 E.01301
G1 X69.092 Y97.127 E1.56475
G1 X69.508 Y97.366 E.01301
G1 X69.508 Y154.634 E1.55181
G1 X69.925 Y154.395 E.01301
G1 X69.925 Y97.605 E1.53886
G1 X70.341 Y97.843 E.01301
G1 X70.341 Y154.157 E1.52592
G1 X70.758 Y153.918 E.01301
G1 X70.758 Y98.082 E1.51298
G1 X71.175 Y98.321 E.01301
G1 X71.175 Y153.679 E1.50003
G1 X71.591 Y153.44 E.01301
G1 X71.591 Y98.56 E1.48709
G1 X72.008 Y98.799 E.01301
G1 X72.008 Y153.201 E1.47415
G1 X72.424 Y152.962 E.01301
G1 X72.424 Y99.038 E1.4612
G1 X72.841 Y99.276 E.01301
G1 X72.841 Y152.724 E1.44826
G1 X73.258 Y152.485 E.01301
G1 X73.258 Y99.515 E1.43532
G1 X73.674 Y99.754 E.01301
G1 X73.674 Y152.246 E1.42237
G1 X74.091 Y152.007 E.01301
G1 X74.091 Y99.993 E1.40943
G1 X74.507 Y100.232 E.01301
G1 X74.507 Y151.768 E1.39649
G1 X74.924 Y151.529 E.01301
G1 X74.924 Y100.471 E1.38354
G1 X75.341 Y100.709 E.01301
G1 X75.341 Y151.291 E1.3706
G1 X75.757 Y151.052 E.01301
G1 X75.757 Y100.948 E1.35766
G1 X76.174 Y101.187 E.01301
G1 X76.174 Y150.813 E1.34471
G1 X76.591 Y150.574 E.01301
G1 X76.591 Y101.426 E1.33177
G1 X77.007 Y101.665 E.01301
G1 X77.007 Y150.335 E1.31882
G1 X77.424 Y150.096 E.01301
G1 X77.424 Y101.904 E1.30588
G1 X77.84 Y102.142 E.01301
G1 X77.84 Y149.858 E1.29294
G1 X78.257 Y149.619 E.01301
G1 X78.257 Y102.381 E1.27999
G1 X78.674 Y102.62 E.01301
G1 X78.674 Y149.38 E1.26705
G1 X79.09 Y149.141 E.01301
G1 X79.09 Y102.859 E1.25411
G1 X79.507 Y103.098 E.01301
G1 X79.507 Y148.902 E1.24116
G1 X79.923 Y148.663 E.01301
G1 X79.923 Y103.337 E1.22822
G1 X80.34 Y103.575 E.01301
G1 X80.34 Y148.424 E1.21528
G1 X80.757 Y148.186 E.01301
G1 X80.757 Y103.814 E1.20233
G1 X81.173 Y104.053 E.01301
G1 X81.173 Y147.947 E1.18939
G1 X81.59 Y147.708 E.01301
G1 X81.59 Y104.292 E1.17645
G1 X82.006 Y104.531 E.01301
G1 X82.006 Y147.469 E1.1635
G1 X82.423 Y147.23 E.01301
G1 X82.423 Y104.77 E1.15056
G1 X82.84 Y105.008 E.01301
G1 X82.84 Y146.991 E1.13762
G1 X83.256 Y146.753 E.01301
G1 X83.256 Y105.247 E1.12467
G1 X83.673 Y105.486 E.01301
G1 X83.673 Y146.514 E1.11173
G1 X84.089 Y146.275 E.01301
G1 X84.089 Y105.725 E1.09878
G1 X84.506 Y105.964 E.01301
G1 X84.506 Y146.036 E1.08584
G1 X84.923 Y145.797 E.01301
G1 X84.923 Y106.203 E1.0729
G1 X85.339 Y106.442 E.01301
G1 X85.339 Y145.558 E1.05995
G1 X85.756 Y145.32 E.01301
G1 X85.756 Y106.68 E1.04701
G1 X86.173 Y106.919 E.01301
G1 X86.173 Y145.081 E1.03407
G1 X86.589 Y144.842 E.01301
G1 X86.589 Y107.158 E1.02112
G1 X87.006 Y107.397 E.01301
G1 X87.006 Y144.603 E1.00818
G1 X87.422 Y144.364 E.01301
G1 X87.422 Y107.636 E.99524
G1 X87.839 Y107.875 E.01301
G1 X87.839 Y144.125 E.98229
G1 X88.256 Y143.887 E.01301
G1 X88.256 Y108.113 E.96935
G1 X88.672 Y108.352 E.01301
G1 X88.672 Y143.648 E.95641
G1 X89.089 Y143.409 E.01301
G1 X89.089 Y108.591 E.94346
G1 X89.505 Y108.83 E.01301
G1 X89.505 Y143.17 E.93052
G1 X89.922 Y142.931 E.01301
G1 X89.922 Y109.069 E.91758
G1 X90.339 Y109.308 E.01301
G1 X90.339 Y142.692 E.90463
G1 X90.755 Y142.454 E.01301
G1 X90.755 Y109.546 E.89169
G1 X91.172 Y109.785 E.01301
G1 X91.172 Y142.215 E.87874
G1 X91.588 Y141.976 E.01301
G1 X91.588 Y110.024 E.8658
G1 X92.005 Y110.263 E.01301
G1 X92.005 Y141.737 E.85286
G1 X92.422 Y141.498 E.01301
G1 X92.422 Y110.502 E.83991
G1 X92.838 Y110.741 E.01301
G1 X92.838 Y141.259 E.82697
G1 X93.255 Y141.021 E.01301
G1 X93.255 Y110.979 E.81403
G1 X93.672 Y111.218 E.01301
G1 X93.672 Y140.782 E.80108
G1 X94.088 Y140.543 E.01301
G1 X94.088 Y111.457 E.78814
G1 X94.505 Y111.696 E.01301
G1 X94.505 Y140.304 E.7752
G1 X94.921 Y140.065 E.01301
G1 X94.921 Y111.935 E.76225
G1 X95.338 Y112.174 E.01301
G1 X95.338 Y139.826 E.74931
G1 X95.755 Y139.588 E.01301
G1 X95.755 Y112.412 E.73637
G1 X96.171 Y112.651 E.01301
G1 X96.171 Y139.349 E.72342
G1 X96.588 Y139.11 E.01301
G1 X96.588 Y112.89 E.71048
G1 X97.004 Y113.129 E.01301
G1 X97.004 Y138.871 E.69754
G1 X97.421 Y138.632 E.01301
G1 X97.421 Y113.368 E.68459
G1 X97.838 Y113.607 E.01301
G1 X97.838 Y138.393 E.67165
G1 X98.254 Y138.155 E.01301
G1 X98.254 Y113.845 E.6587
G1 X98.671 Y114.084 E.01301
G1 X98.671 Y137.916 E.64576
G1 X99.087 Y137.677 E.01301
G1 X99.087 Y114.323 E.63282
G1 X99.504 Y114.562 E.01301
G1 X99.504 Y137.438 E.61987
G1 X99.921 Y137.199 E.01301
G1 X99.921 Y114.801 E.60693
G1 X100.337 Y115.04 E.01301
G1 X100.337 Y136.96 E.59399
G1 X100.754 Y136.722 E.01301
G1 X100.754 Y115.278 E.58104
M73 P70 R21
G1 X101.171 Y115.517 E.01301
G1 X101.171 Y136.483 E.5681
G1 X101.587 Y136.244 E.01301
G1 X101.587 Y115.756 E.55516
G1 X102.004 Y115.995 E.01301
G1 X102.004 Y136.005 E.54221
G1 X102.42 Y135.766 E.01301
G1 X102.42 Y116.234 E.52927
G1 X102.837 Y116.473 E.01301
G1 X102.837 Y135.527 E.51633
G1 X103.254 Y135.289 E.01301
G1 X103.254 Y116.711 E.50338
G1 X103.67 Y116.95 E.01301
G1 X103.67 Y135.05 E.49044
G1 X104.087 Y134.811 E.01301
G1 X104.087 Y117.189 E.4775
G1 X104.503 Y117.428 E.01301
G1 X104.503 Y134.572 E.46455
G1 X104.92 Y134.333 E.01301
G1 X104.92 Y117.667 E.45161
G1 X105.337 Y117.906 E.01301
G1 X105.337 Y134.094 E.43867
G1 X105.753 Y133.855 E.01301
G1 X105.753 Y118.144 E.42572
G3 X106.17 Y118.483 I-.084 J.529 E.01523
G1 X106.17 Y133.832 E.41593
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X106.17 Y131.832 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 465
M625
; layer num/total_layer_count: 10/14
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
M204 S10000
G17
G3 Z1.88 I1.217 J0 P1  F30000
; object ids of layer 10 start: 325,353,381,409,437,465
M624 PwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer10 end: 325,353,381,409,437,465
M625
; OBJECT_ID: 325
; start printing object, unique label id: 325
M624 AQAAAAAAAAA=
G1 X208.737 Y75.21
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X145.805 Y111.288 E1.96561
G1 X145.493 Y111.288 E.00845
G1 X133.124 Y104.146 E.38702
G1 X132.962 Y103.871 E.00867
G1 X132.015 Y56.567 E1.28205
G1 X208.678 Y75.196 E2.1378
; WIPE_START
G1 X206.944 Y76.192 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P70 R20
G1 X209.808 Y75.058 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X145.912 Y111.689 E1.85169
G1 X145.386 Y111.688 E.01322
G1 X132.833 Y104.441 E.36442
G1 X132.563 Y103.984 E.01333
G1 X131.608 Y56.271 E1.19981
G1 X131.815 Y56.106 E.00664
G1 X209.749 Y75.044 E2.01641
; WIPE_START
M204 S4000
G1 X208.015 Y76.04 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.764 Y75.574 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.455 Y75.265 E.01184
G1 X206.675 Y75.075 E.02174
G1 X207.252 Y75.652 E.02209
G1 X206.876 Y75.867 E.01172
G1 X205.895 Y74.886 E.0376
G1 X205.116 Y74.696 E.02174
G1 X206.501 Y76.082 E.0531
G1 X206.126 Y76.297 E.01172
G1 X204.336 Y74.507 E.0686
G1 X203.556 Y74.318 E.02174
G1 X205.751 Y76.512 E.0841
G1 X205.376 Y76.727 E.01172
G1 X202.777 Y74.128 E.09961
G1 X201.997 Y73.939 E.02174
G1 X205.001 Y76.942 E.11511
G1 X204.626 Y77.157 E.01172
G1 X201.217 Y73.749 E.13061
G1 X200.438 Y73.56 E.02174
G1 X204.25 Y77.373 E.14611
G1 X203.875 Y77.588 E.01172
G1 X199.658 Y73.37 E.16161
G1 X198.878 Y73.181 E.02174
G1 X203.5 Y77.803 E.17712
G1 X203.125 Y78.018 E.01172
G1 X198.099 Y72.991 E.19262
G1 X197.319 Y72.802 E.02174
G1 X202.75 Y78.233 E.20812
G1 X202.375 Y78.448 E.01172
G1 X196.539 Y72.612 E.22362
G1 X195.759 Y72.423 E.02174
G1 X202 Y78.663 E.23912
G1 X201.624 Y78.878 E.01172
G1 X194.98 Y72.233 E.25463
G1 X194.2 Y72.044 E.02174
G1 X201.249 Y79.093 E.27013
G1 X200.874 Y79.308 E.01172
G1 X193.42 Y71.855 E.28563
G1 X192.641 Y71.665 E.02174
G1 X200.499 Y79.523 E.30113
G1 X200.124 Y79.738 E.01172
G1 X191.861 Y71.476 E.31663
G1 X191.081 Y71.286 E.02174
G1 X199.749 Y79.953 E.33214
G1 X199.373 Y80.168 E.01172
G1 X190.302 Y71.097 E.34764
G1 X189.522 Y70.907 E.02174
G1 X198.998 Y80.384 E.36314
G1 X198.623 Y80.599 E.01172
G1 X188.742 Y70.718 E.37864
G1 X187.963 Y70.528 E.02174
G1 X198.248 Y80.814 E.39415
G1 X197.873 Y81.029 E.01172
G1 X187.183 Y70.339 E.40965
G1 X186.403 Y70.149 E.02174
G1 X197.498 Y81.244 E.42515
G1 X197.123 Y81.459 E.01172
G1 X185.624 Y69.96 E.44065
G1 X184.844 Y69.77 E.02174
G1 X196.747 Y81.674 E.45615
G1 X196.372 Y81.889 E.01172
G1 X184.064 Y69.581 E.47166
G1 X183.285 Y69.392 E.02174
G1 X195.997 Y82.104 E.48716
G1 X195.622 Y82.319 E.01172
G1 X182.505 Y69.202 E.50266
G1 X181.725 Y69.013 E.02174
G1 X195.247 Y82.534 E.51816
G1 X194.872 Y82.749 E.01172
G1 X180.945 Y68.823 E.53366
G1 X180.166 Y68.634 E.02174
G1 X194.496 Y82.964 E.54917
G1 X194.121 Y83.179 E.01172
G1 X179.386 Y68.444 E.56467
G1 X178.606 Y68.255 E.02174
G1 X193.746 Y83.394 E.58017
G1 X193.371 Y83.61 E.01172
G1 X177.827 Y68.065 E.59567
G1 X177.047 Y67.876 E.02174
G1 X192.996 Y83.825 E.61118
G1 X192.621 Y84.04 E.01172
G1 X176.267 Y67.686 E.62668
G1 X175.488 Y67.497 E.02174
G1 X192.246 Y84.255 E.64218
G1 X191.87 Y84.47 E.01172
G1 X174.708 Y67.307 E.65768
G1 X173.928 Y67.118 E.02174
G1 X191.495 Y84.685 E.67318
G1 X191.12 Y84.9 E.01172
G1 X173.149 Y66.928 E.68869
G1 X172.369 Y66.739 E.02174
G1 X190.745 Y85.115 E.70419
G1 X190.37 Y85.33 E.01172
G1 X171.589 Y66.55 E.71969
G1 X170.81 Y66.36 E.02174
G1 X189.995 Y85.545 E.73519
G1 X189.619 Y85.76 E.01172
G1 X170.03 Y66.171 E.75069
G1 X169.25 Y65.981 E.02174
G1 X189.244 Y85.975 E.7662
G1 X188.869 Y86.19 E.01172
G1 X168.47 Y65.792 E.7817
G1 X167.691 Y65.602 E.02174
G1 X188.494 Y86.405 E.7972
G1 X188.119 Y86.621 E.01172
G1 X166.911 Y65.413 E.8127
G1 X166.131 Y65.223 E.02174
G1 X187.744 Y86.836 E.8282
G1 X187.369 Y87.051 E.01172
G1 X165.352 Y65.034 E.84371
G1 X164.572 Y64.844 E.02174
G1 X186.993 Y87.266 E.85921
G1 X186.618 Y87.481 E.01172
G1 X163.792 Y64.655 E.87471
G1 X163.013 Y64.465 E.02174
G1 X186.243 Y87.696 E.89021
G1 X185.868 Y87.911 E.01172
G1 X162.233 Y64.276 E.90572
G1 X161.453 Y64.087 E.02174
G1 X185.493 Y88.126 E.92122
G1 X185.118 Y88.341 E.01172
G1 X160.674 Y63.897 E.93672
G1 X159.894 Y63.708 E.02174
G1 X184.742 Y88.556 E.95222
G1 X184.367 Y88.771 E.01172
G1 X159.114 Y63.518 E.96772
G1 X158.335 Y63.329 E.02174
G1 X183.992 Y88.986 E.98323
G1 X183.617 Y89.201 E.01172
G1 X157.555 Y63.139 E.99873
G1 X156.775 Y62.95 E.02174
G1 X183.242 Y89.416 E1.01423
G1 X182.867 Y89.631 E.01172
G1 X155.996 Y62.76 E1.02973
G1 X155.216 Y62.571 E.02174
G1 X182.492 Y89.847 E1.04523
G1 X182.116 Y90.062 E.01172
G1 X154.436 Y62.381 E1.06074
G1 X153.656 Y62.192 E.02174
G1 X181.741 Y90.277 E1.07624
G1 X181.366 Y90.492 E.01172
G1 X152.877 Y62.002 E1.09174
G1 X152.097 Y61.813 E.02174
G1 X180.991 Y90.707 E1.10724
G1 X180.616 Y90.922 E.01172
G1 X151.317 Y61.624 E1.12274
G1 X150.538 Y61.434 E.02174
G1 X180.241 Y91.137 E1.13825
G1 X179.866 Y91.352 E.01172
G1 X149.758 Y61.245 E1.15375
G1 X148.978 Y61.055 E.02174
G1 X179.49 Y91.567 E1.16925
G1 X179.115 Y91.782 E.01172
G1 X148.199 Y60.866 E1.18475
G1 X147.419 Y60.676 E.02174
G1 X178.74 Y91.997 E1.20026
G1 X178.365 Y92.212 E.01172
G1 X146.639 Y60.487 E1.21576
G1 X145.86 Y60.297 E.02174
G1 X177.99 Y92.427 E1.23126
G1 X177.615 Y92.642 E.01172
G1 X145.08 Y60.108 E1.24676
G1 X144.3 Y59.918 E.02174
G1 X177.239 Y92.858 E1.26226
G1 X176.864 Y93.073 E.01172
G1 X143.521 Y59.729 E1.27777
G1 X142.741 Y59.539 E.02174
G1 X176.489 Y93.288 E1.29327
G1 X176.114 Y93.503 E.01172
G1 X141.961 Y59.35 E1.30877
G1 X141.182 Y59.16 E.02174
G1 X175.739 Y93.718 E1.32427
G1 X175.364 Y93.933 E.01172
G1 X140.402 Y58.971 E1.33977
G1 X139.622 Y58.782 E.02174
G1 X174.989 Y94.148 E1.35528
G1 X174.613 Y94.363 E.01172
G1 X138.842 Y58.592 E1.37078
G1 X138.063 Y58.403 E.02174
G1 X174.238 Y94.578 E1.38628
G1 X173.863 Y94.793 E.01172
G1 X137.283 Y58.213 E1.40178
G1 X136.503 Y58.024 E.02174
G1 X173.488 Y95.008 E1.41729
G1 X173.113 Y95.223 E.01172
G1 X135.724 Y57.834 E1.43279
G1 X134.944 Y57.645 E.02174
G1 X172.738 Y95.438 E1.44829
G1 X172.362 Y95.653 E.01172
G1 X134.164 Y57.455 E1.46379
G1 X133.385 Y57.266 E.02174
G1 X171.987 Y95.869 E1.47929
G1 X171.612 Y96.084 E.01172
G1 X132.605 Y57.076 E1.4948
G1 X132.38 Y57.022 E.00628
G1 X132.388 Y57.45 E.01161
G1 X171.237 Y96.299 E1.48872
G1 X170.862 Y96.514 E.01172
G1 X132.4 Y58.052 E1.47388
G1 X132.413 Y58.655 E.01632
G1 X170.487 Y96.729 E1.45904
G1 X170.112 Y96.944 E.01172
G1 X132.425 Y59.257 E1.4442
G1 X132.437 Y59.859 E.01632
G1 X169.736 Y97.159 E1.42937
G1 X169.361 Y97.374 E.01172
G1 X132.449 Y60.461 E1.41453
G1 X132.461 Y61.064 E.01632
G1 X168.986 Y97.589 E1.39969
G1 X168.611 Y97.804 E.01172
G1 X132.473 Y61.666 E1.38485
G1 X132.485 Y62.268 E.01632
G1 X168.236 Y98.019 E1.37001
G1 X167.861 Y98.234 E.01172
G1 X132.497 Y62.871 E1.35517
G1 X132.509 Y63.473 E.01632
G1 X167.485 Y98.449 E1.34034
G1 X167.11 Y98.664 E.01172
G1 X132.521 Y64.075 E1.3255
G1 X132.533 Y64.677 E.01632
G1 X166.735 Y98.879 E1.31066
G1 X166.36 Y99.095 E.01172
G1 X132.545 Y65.28 E1.29582
G1 X132.557 Y65.882 E.01632
G1 X165.985 Y99.31 E1.28098
G1 X165.61 Y99.525 E.01172
G1 X132.569 Y66.484 E1.26615
G1 X132.581 Y67.086 E.01632
G1 X165.235 Y99.74 E1.25131
G1 X164.859 Y99.955 E.01172
G1 X132.593 Y67.689 E1.23647
G1 X132.605 Y68.291 E.01632
G1 X164.484 Y100.17 E1.22163
G1 X164.109 Y100.385 E.01172
G1 X132.617 Y68.893 E1.20679
G1 X132.629 Y69.496 E.01632
G1 X163.734 Y100.6 E1.19196
G1 X163.359 Y100.815 E.01172
G1 X132.642 Y70.098 E1.17712
G1 X132.654 Y70.7 E.01632
G1 X162.984 Y101.03 E1.16228
G1 X162.608 Y101.245 E.01172
G1 X132.666 Y71.302 E1.14744
G1 X132.678 Y71.905 E.01632
G1 X162.233 Y101.46 E1.1326
G1 X161.858 Y101.675 E.01172
G1 X132.69 Y72.507 E1.11777
G1 X132.702 Y73.109 E.01632
G1 X161.483 Y101.89 E1.10293
G1 X161.108 Y102.106 E.01172
G1 X132.714 Y73.711 E1.08809
G1 X132.726 Y74.314 E.01632
G1 X160.733 Y102.321 E1.07325
G1 X160.358 Y102.536 E.01172
G1 X132.738 Y74.916 E1.05841
G1 X132.75 Y75.518 E.01632
G1 X159.982 Y102.751 E1.04358
G1 X159.607 Y102.966 E.01172
G1 X132.762 Y76.121 E1.02874
G1 X132.774 Y76.723 E.01632
G1 X159.232 Y103.181 E1.0139
G1 X158.857 Y103.396 E.01172
G1 X132.786 Y77.325 E.99906
G1 X132.798 Y77.927 E.01632
G1 X158.482 Y103.611 E.98422
G1 X158.107 Y103.826 E.01172
G1 X132.81 Y78.53 E.96939
G1 X132.822 Y79.132 E.01632
G1 X157.732 Y104.041 E.95455
G1 X157.356 Y104.256 E.01172
G1 X132.834 Y79.734 E.93971
G1 X132.846 Y80.336 E.01632
G1 X156.981 Y104.471 E.92487
G1 X156.606 Y104.686 E.01172
G1 X132.858 Y80.939 E.91003
G1 X132.87 Y81.541 E.01632
G1 X156.231 Y104.901 E.8952
G1 X155.856 Y105.116 E.01172
G1 X132.883 Y82.143 E.88036
G1 X132.895 Y82.746 E.01632
G1 X155.481 Y105.332 E.86552
G1 X155.105 Y105.547 E.01172
G1 X132.907 Y83.348 E.85068
G1 X132.919 Y83.95 E.01632
G1 X154.73 Y105.762 E.83584
G1 X154.355 Y105.977 E.01172
G1 X132.931 Y84.552 E.82101
G1 X132.943 Y85.155 E.01632
G1 X153.98 Y106.192 E.80617
G1 X153.605 Y106.407 E.01172
G1 X132.955 Y85.757 E.79133
G1 X132.967 Y86.359 E.01632
G1 X153.23 Y106.622 E.77649
G1 X152.855 Y106.837 E.01172
G1 X132.979 Y86.961 E.76165
G1 X132.991 Y87.564 E.01632
G1 X152.479 Y107.052 E.74682
G1 X152.104 Y107.267 E.01172
G1 X133.003 Y88.166 E.73198
G1 X133.015 Y88.768 E.01632
G1 X151.729 Y107.482 E.71714
G1 X151.354 Y107.697 E.01172
G1 X133.027 Y89.371 E.7023
G1 X133.039 Y89.973 E.01632
G1 X150.979 Y107.912 E.68746
G1 X150.604 Y108.127 E.01172
G1 X133.051 Y90.575 E.67262
G1 X133.063 Y91.177 E.01632
G1 X150.228 Y108.343 E.65779
G1 X149.853 Y108.558 E.01172
G1 X133.075 Y91.78 E.64295
M73 P71 R20
G1 X133.087 Y92.382 E.01632
G1 X149.478 Y108.773 E.62811
G1 X149.103 Y108.988 E.01172
G1 X133.099 Y92.984 E.61327
G1 X133.111 Y93.586 E.01632
G1 X148.728 Y109.203 E.59843
G1 X148.353 Y109.418 E.01172
G1 X133.124 Y94.189 E.5836
G1 X133.136 Y94.791 E.01632
G1 X147.978 Y109.633 E.56876
G1 X147.602 Y109.848 E.01172
G1 X133.148 Y95.393 E.55392
G1 X133.16 Y95.996 E.01632
G1 X147.227 Y110.063 E.53908
G1 X146.852 Y110.278 E.01172
G1 X133.172 Y96.598 E.52424
G1 X133.184 Y97.2 E.01632
G1 X146.477 Y110.493 E.50941
G1 X146.102 Y110.708 E.01172
G1 X133.196 Y97.802 E.49457
G1 X133.208 Y98.405 E.01632
G1 X145.727 Y110.923 E.47973
G3 X145.589 Y110.932 I-.077 J-.115 E.00391
G1 X144.539 Y110.326 E.03284
G1 X133.22 Y99.007 E.43377
G1 X133.232 Y99.609 E.01632
G1 X143.143 Y109.52 E.37979
G1 X141.746 Y108.714 E.04369
G1 X133.244 Y100.211 E.32581
G1 X133.256 Y100.814 E.01632
G1 X140.35 Y107.907 E.27184
G1 X138.953 Y107.101 E.04369
G1 X133.268 Y101.416 E.21786
G1 X133.28 Y102.018 E.01632
G1 X137.557 Y106.295 E.16389
G1 X136.16 Y105.489 E.04369
G1 X133.292 Y102.621 E.10991
G1 X133.304 Y103.223 E.01632
G1 X135.275 Y105.193 E.07552
; OBJECT_ID: 353
; WIPE_START
G1 X133.861 Y103.779 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 325
M625
; start printing object, unique label id: 353
M624 AgAAAAAAAAA=
M204 S10000
G1 X139.73 Y108.658 Z2.04 F30000
G1 X215.595 Y171.713 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X149.643 Y133.903 E2.05996
G1 X149.488 Y133.636 E.00837
G1 X149.488 Y118.364 E.41382
G1 X149.643 Y118.097 E.00837
G1 X215.595 Y80.287 E2.05996
G1 X215.595 Y171.653 E2.47574
M204 S10000
G1 X215.996 Y172.261 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X215.872 Y172.333 E.0036
G1 X149.35 Y134.197 E1.92779
G1 X149.087 Y133.744 E.01318
G1 X149.087 Y118.256 E.38937
G1 X149.35 Y117.803 E.01318
G1 X215.872 Y79.667 E1.92779
G1 X215.957 Y79.716 E.00247
G1 X215.996 Y79.739 E.00113
G1 X215.996 Y172.201 E2.32464
; WIPE_START
M204 S4000
G1 X215.872 Y172.333 E-.06873
G1 X214.294 Y171.429 E-.69127
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X215.239 Y171.314 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X215.239 Y80.901 E2.44993
G1 X214.823 Y81.14 E.01301
G1 X214.823 Y170.86 E2.43115
G1 X214.406 Y170.621 E.01301
G1 X214.406 Y81.379 E2.41821
G1 X213.99 Y81.618 E.01301
G1 X213.99 Y170.382 E2.40527
G1 X213.573 Y170.144 E.01301
G1 X213.573 Y81.856 E2.39233
G1 X213.157 Y82.095 E.01301
G1 X213.157 Y169.905 E2.37939
G1 X212.74 Y169.666 E.01301
G1 X212.74 Y82.334 E2.36644
G1 X212.324 Y82.573 E.01301
G1 X212.324 Y169.427 E2.3535
G1 X211.907 Y169.188 E.01301
G1 X211.907 Y82.811 E2.34056
G1 X211.49 Y83.05 E.01301
G1 X211.49 Y168.95 E2.32762
G1 X211.074 Y168.711 E.01301
G1 X211.074 Y83.289 E2.31468
G1 X210.657 Y83.528 E.01301
G1 X210.657 Y168.472 E2.30174
G1 X210.241 Y168.233 E.01301
G1 X210.241 Y83.767 E2.2888
G1 X209.824 Y84.005 E.01301
G1 X209.824 Y167.995 E2.27586
G1 X209.408 Y167.756 E.01301
G1 X209.408 Y84.244 E2.26292
G1 X208.991 Y84.483 E.01301
G1 X208.991 Y167.517 E2.24997
G1 X208.575 Y167.278 E.01301
G1 X208.575 Y84.722 E2.23703
G1 X208.158 Y84.961 E.01301
G1 X208.158 Y167.039 E2.22409
G1 X207.742 Y166.801 E.01301
G1 X207.742 Y85.199 E2.21115
G1 X207.325 Y85.438 E.01301
G1 X207.325 Y166.562 E2.19821
G1 X206.909 Y166.323 E.01301
G1 X206.909 Y85.677 E2.18527
G1 X206.492 Y85.916 E.01301
G1 X206.492 Y166.084 E2.17233
G1 X206.076 Y165.845 E.01301
G1 X206.076 Y86.155 E2.15939
G1 X205.659 Y86.393 E.01301
G1 X205.659 Y165.607 E2.14645
G1 X205.243 Y165.368 E.01301
G1 X205.243 Y86.632 E2.13351
G1 X204.826 Y86.871 E.01301
G1 X204.826 Y165.129 E2.12056
G1 X204.409 Y164.89 E.01301
G1 X204.409 Y87.11 E2.10762
G1 X203.993 Y87.349 E.01301
G1 X203.993 Y164.651 E2.09468
G1 X203.576 Y164.413 E.01301
G1 X203.576 Y87.587 E2.08174
G1 X203.16 Y87.826 E.01301
G1 X203.16 Y164.174 E2.0688
G1 X202.743 Y163.935 E.01301
G1 X202.743 Y88.065 E2.05586
G1 X202.327 Y88.304 E.01301
G1 X202.327 Y163.696 E2.04292
G1 X201.91 Y163.457 E.01301
G1 X201.91 Y88.542 E2.02998
G1 X201.494 Y88.781 E.01301
G1 X201.494 Y163.219 E2.01704
G1 X201.077 Y162.98 E.01301
G1 X201.077 Y89.02 E2.00409
G1 X200.661 Y89.259 E.01301
G1 X200.661 Y162.741 E1.99115
G1 X200.244 Y162.502 E.01301
G1 X200.244 Y89.498 E1.97821
G1 X199.828 Y89.736 E.01301
G1 X199.828 Y162.264 E1.96527
G1 X199.411 Y162.025 E.01301
G1 X199.411 Y89.975 E1.95233
G1 X198.995 Y90.214 E.01301
G1 X198.995 Y161.786 E1.93939
M73 P71 R19
G1 X198.578 Y161.547 E.01301
G1 X198.578 Y90.453 E1.92645
G1 X198.162 Y90.692 E.01301
G1 X198.162 Y161.308 E1.91351
G1 X197.745 Y161.07 E.01301
G1 X197.745 Y90.93 E1.90057
G1 X197.328 Y91.169 E.01301
G1 X197.328 Y160.831 E1.88763
G1 X196.912 Y160.592 E.01301
G1 X196.912 Y91.408 E1.87468
G1 X196.495 Y91.647 E.01301
G1 X196.495 Y160.353 E1.86174
G1 X196.079 Y160.114 E.01301
G1 X196.079 Y91.886 E1.8488
G1 X195.662 Y92.124 E.01301
G1 X195.662 Y159.876 E1.83586
G1 X195.246 Y159.637 E.01301
G1 X195.246 Y92.363 E1.82292
G1 X194.829 Y92.602 E.01301
G1 X194.829 Y159.398 E1.80998
G1 X194.413 Y159.159 E.01301
G1 X194.413 Y92.841 E1.79704
G1 X193.996 Y93.079 E.01301
G1 X193.996 Y158.92 E1.7841
G1 X193.58 Y158.682 E.01301
G1 X193.58 Y93.318 E1.77116
G1 X193.163 Y93.557 E.01301
G1 X193.163 Y158.443 E1.75821
G1 X192.747 Y158.204 E.01301
G1 X192.747 Y93.796 E1.74527
G1 X192.33 Y94.035 E.01301
G1 X192.33 Y157.965 E1.73233
G1 X191.914 Y157.727 E.01301
G1 X191.914 Y94.273 E1.71939
G1 X191.497 Y94.512 E.01301
G1 X191.497 Y157.488 E1.70645
G1 X191.081 Y157.249 E.01301
G1 X191.081 Y94.751 E1.69351
G1 X190.664 Y94.99 E.01301
G1 X190.664 Y157.01 E1.68057
G1 X190.247 Y156.771 E.01301
G1 X190.247 Y95.229 E1.66763
G1 X189.831 Y95.467 E.01301
G1 X189.831 Y156.533 E1.65469
G1 X189.414 Y156.294 E.01301
G1 X189.414 Y95.706 E1.64175
G1 X188.998 Y95.945 E.01301
G1 X188.998 Y156.055 E1.6288
G1 X188.581 Y155.816 E.01301
G1 X188.581 Y96.184 E1.61586
G1 X188.165 Y96.423 E.01301
G1 X188.165 Y155.577 E1.60292
G1 X187.748 Y155.339 E.01301
G1 X187.748 Y96.661 E1.58998
G1 X187.332 Y96.9 E.01301
G1 X187.332 Y155.1 E1.57704
G1 X186.915 Y154.861 E.01301
G1 X186.915 Y97.139 E1.5641
G1 X186.499 Y97.378 E.01301
G1 X186.499 Y154.622 E1.55116
G1 X186.082 Y154.383 E.01301
G1 X186.082 Y97.617 E1.53822
G1 X185.666 Y97.855 E.01301
G1 X185.666 Y154.145 E1.52528
G1 X185.249 Y153.906 E.01301
G1 X185.249 Y98.094 E1.51233
G1 X184.833 Y98.333 E.01301
G1 X184.833 Y153.667 E1.49939
G1 X184.416 Y153.428 E.01301
G1 X184.416 Y98.572 E1.48645
G1 X184 Y98.81 E.01301
G1 X184 Y153.189 E1.47351
G1 X183.583 Y152.951 E.01301
G1 X183.583 Y99.049 E1.46057
G1 X183.166 Y99.288 E.01301
G1 X183.166 Y152.712 E1.44763
G1 X182.75 Y152.473 E.01301
G1 X182.75 Y99.527 E1.43469
G1 X182.333 Y99.766 E.01301
G1 X182.333 Y152.234 E1.42175
G1 X181.917 Y151.996 E.01301
G1 X181.917 Y100.004 E1.40881
G1 X181.5 Y100.243 E.01301
G1 X181.5 Y151.757 E1.39587
G1 X181.084 Y151.518 E.01301
G1 X181.084 Y100.482 E1.38292
G1 X180.667 Y100.721 E.01301
G1 X180.667 Y151.279 E1.36998
G1 X180.251 Y151.04 E.01301
G1 X180.251 Y100.96 E1.35704
G1 X179.834 Y101.198 E.01301
G1 X179.834 Y150.802 E1.3441
M73 P72 R19
G1 X179.418 Y150.563 E.01301
G1 X179.418 Y101.437 E1.33116
G1 X179.001 Y101.676 E.01301
G1 X179.001 Y150.324 E1.31822
G1 X178.585 Y150.085 E.01301
G1 X178.585 Y101.915 E1.30528
G1 X178.168 Y102.154 E.01301
G1 X178.168 Y149.846 E1.29234
G1 X177.752 Y149.608 E.01301
G1 X177.752 Y102.392 E1.2794
G1 X177.335 Y102.631 E.01301
G1 X177.335 Y149.369 E1.26645
G1 X176.918 Y149.13 E.01301
G1 X176.918 Y102.87 E1.25351
G1 X176.502 Y103.109 E.01301
G1 X176.502 Y148.891 E1.24057
G1 X176.085 Y148.652 E.01301
G1 X176.085 Y103.348 E1.22763
G1 X175.669 Y103.586 E.01301
G1 X175.669 Y148.414 E1.21469
G1 X175.252 Y148.175 E.01301
G1 X175.252 Y103.825 E1.20175
G1 X174.836 Y104.064 E.01301
G1 X174.836 Y147.936 E1.18881
G1 X174.419 Y147.697 E.01301
G1 X174.419 Y104.303 E1.17587
G1 X174.003 Y104.541 E.01301
G1 X174.003 Y147.459 E1.16293
G1 X173.586 Y147.22 E.01301
G1 X173.586 Y104.78 E1.14999
G1 X173.17 Y105.019 E.01301
G1 X173.17 Y146.981 E1.13704
G1 X172.753 Y146.742 E.01301
G1 X172.753 Y105.258 E1.1241
G1 X172.337 Y105.497 E.01301
G1 X172.337 Y146.503 E1.11116
G1 X171.92 Y146.265 E.01301
G1 X171.92 Y105.735 E1.09822
G1 X171.504 Y105.974 E.01301
G1 X171.504 Y146.026 E1.08528
G1 X171.087 Y145.787 E.01301
G1 X171.087 Y106.213 E1.07234
G1 X170.671 Y106.452 E.01301
G1 X170.671 Y145.548 E1.0594
G1 X170.254 Y145.309 E.01301
G1 X170.254 Y106.691 E1.04646
G1 X169.837 Y106.929 E.01301
G1 X169.837 Y145.071 E1.03352
G1 X169.421 Y144.832 E.01301
G1 X169.421 Y107.168 E1.02057
G1 X169.004 Y107.407 E.01301
G1 X169.004 Y144.593 E1.00763
G1 X168.588 Y144.354 E.01301
G1 X168.588 Y107.646 E.99469
G1 X168.171 Y107.885 E.01301
G1 X168.171 Y144.115 E.98175
G1 X167.755 Y143.877 E.01301
G1 X167.755 Y108.123 E.96881
G1 X167.338 Y108.362 E.01301
G1 X167.338 Y143.638 E.95587
G1 X166.922 Y143.399 E.01301
G1 X166.922 Y108.601 E.94293
G1 X166.505 Y108.84 E.01301
G1 X166.505 Y143.16 E.92999
G1 X166.089 Y142.921 E.01301
G1 X166.089 Y109.078 E.91705
G1 X165.672 Y109.317 E.01301
G1 X165.672 Y142.683 E.90411
G1 X165.256 Y142.444 E.01301
G1 X165.256 Y109.556 E.89116
G1 X164.839 Y109.795 E.01301
G1 X164.839 Y142.205 E.87822
G1 X164.423 Y141.966 E.01301
G1 X164.423 Y110.034 E.86528
G1 X164.006 Y110.272 E.01301
G1 X164.006 Y141.728 E.85234
G1 X163.59 Y141.489 E.01301
G1 X163.59 Y110.511 E.8394
G1 X163.173 Y110.75 E.01301
G1 X163.173 Y141.25 E.82646
G1 X162.756 Y141.011 E.01301
G1 X162.756 Y110.989 E.81352
G1 X162.34 Y111.228 E.01301
G1 X162.34 Y140.772 E.80058
G1 X161.923 Y140.534 E.01301
G1 X161.923 Y111.466 E.78764
G1 X161.507 Y111.705 E.01301
G1 X161.507 Y140.295 E.77469
G1 X161.09 Y140.056 E.01301
G1 X161.09 Y111.944 E.76175
G1 X160.674 Y112.183 E.01301
G1 X160.674 Y139.817 E.74881
G1 X160.257 Y139.578 E.01301
G1 X160.257 Y112.422 E.73587
G1 X159.841 Y112.66 E.01301
G1 X159.841 Y139.34 E.72293
G1 X159.424 Y139.101 E.01301
G1 X159.424 Y112.899 E.70999
G1 X159.008 Y113.138 E.01301
G1 X159.008 Y138.862 E.69705
G1 X158.591 Y138.623 E.01301
G1 X158.591 Y113.377 E.68411
G1 X158.175 Y113.616 E.01301
G1 X158.175 Y138.384 E.67117
G1 X157.758 Y138.146 E.01301
G1 X157.758 Y113.854 E.65822
G1 X157.342 Y114.093 E.01301
G1 X157.342 Y137.907 E.64528
G1 X156.925 Y137.668 E.01301
G1 X156.925 Y114.332 E.63234
G1 X156.509 Y114.571 E.01301
G1 X156.509 Y137.429 E.6194
G1 X156.092 Y137.191 E.01301
G1 X156.092 Y114.809 E.60646
G1 X155.675 Y115.048 E.01301
G1 X155.675 Y136.952 E.59352
G1 X155.259 Y136.713 E.01301
G1 X155.259 Y115.287 E.58058
G1 X154.842 Y115.526 E.01301
G1 X154.842 Y136.474 E.56764
G1 X154.426 Y136.235 E.01301
G1 X154.426 Y115.765 E.5547
G1 X154.009 Y116.003 E.01301
G1 X154.009 Y135.997 E.54176
G1 X153.593 Y135.758 E.01301
G1 X153.593 Y116.242 E.52881
G1 X153.176 Y116.481 E.01301
G1 X153.176 Y135.519 E.51587
G1 X152.76 Y135.28 E.01301
G1 X152.76 Y116.72 E.50293
G1 X152.343 Y116.959 E.01301
G1 X152.343 Y135.041 E.48999
G1 X151.927 Y134.803 E.01301
G1 X151.927 Y117.197 E.47705
G1 X151.51 Y117.436 E.01301
G1 X151.51 Y134.564 E.46411
G1 X151.094 Y134.325 E.01301
G1 X151.094 Y117.675 E.45117
G1 X150.677 Y117.914 E.01301
G1 X150.677 Y134.086 E.43823
G1 X150.261 Y133.847 E.01301
G1 X150.261 Y118.153 E.42529
G1 X149.903 Y118.358 E.01118
G1 X149.844 Y118.459 E.00317
G1 X149.844 Y133.824 E.41636
; OBJECT_ID: 381
; WIPE_START
G1 X149.844 Y131.824 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 353
M625
; start printing object, unique label id: 381
M624 BAAAAAAAAAA=
M204 S10000
G1 X155.91 Y136.456 Z2.04 F30000
G1 X208.737 Y176.79 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X132.015 Y195.433 E2.13943
G1 X132.962 Y148.129 E1.28205
G1 X133.124 Y147.854 E.00867
G1 X145.493 Y140.712 E.38701
G1 X145.805 Y140.712 E.00845
G1 X208.685 Y176.76 E1.96398
; WIPE_START
G1 X206.741 Y177.233 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.808 Y176.942 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X131.814 Y195.894 E2.01792
G1 X131.608 Y195.729 E.00664
G1 X132.563 Y148.016 E1.19981
G1 X132.833 Y147.559 E.01333
G1 X145.386 Y140.312 E.36442
G1 X145.912 Y140.311 E.01322
G1 X209.756 Y176.912 E1.85018
; WIPE_START
M204 S4000
G1 X207.812 Y177.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.201 Y176.989 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.627 Y176.563 E.01634
G1 X207.252 Y176.348 E.01172
G1 X206.675 Y176.925 E.02209
G1 X205.895 Y177.114 E.02174
G1 X206.877 Y176.133 E.0376
G1 X206.501 Y175.918 E.01172
G1 X205.116 Y177.304 E.0531
G1 X204.336 Y177.493 E.02174
G1 X206.126 Y175.703 E.0686
G1 X205.751 Y175.488 E.01172
G1 X203.556 Y177.682 E.0841
G1 X202.777 Y177.872 E.02174
G1 X205.376 Y175.273 E.09961
G1 X205.001 Y175.058 E.01172
G1 X201.997 Y178.061 E.11511
G1 X201.217 Y178.251 E.02174
G1 X204.626 Y174.843 E.13061
G1 X204.25 Y174.627 E.01172
G1 X200.438 Y178.44 E.14611
G1 X199.658 Y178.63 E.02174
G1 X203.875 Y174.412 E.16161
G1 X203.5 Y174.197 E.01172
G1 X198.878 Y178.819 E.17712
G1 X198.099 Y179.009 E.02174
G1 X203.125 Y173.982 E.19262
G1 X202.75 Y173.767 E.01172
G1 X197.319 Y179.198 E.20812
G1 X196.539 Y179.388 E.02174
G1 X202.375 Y173.552 E.22362
G1 X202 Y173.337 E.01172
G1 X195.759 Y179.577 E.23912
G1 X194.98 Y179.767 E.02174
G1 X201.624 Y173.122 E.25463
G1 X201.249 Y172.907 E.01172
G1 X194.2 Y179.956 E.27013
G1 X193.42 Y180.145 E.02174
G1 X200.874 Y172.692 E.28563
G1 X200.499 Y172.477 E.01172
G1 X192.641 Y180.335 E.30113
G1 X191.861 Y180.524 E.02174
G1 X200.124 Y172.262 E.31664
G1 X199.749 Y172.047 E.01172
G1 X191.081 Y180.714 E.33214
G1 X190.302 Y180.903 E.02174
G1 X199.373 Y171.832 E.34764
G1 X198.998 Y171.617 E.01172
G1 X189.522 Y181.093 E.36314
G1 X188.742 Y181.282 E.02174
G1 X198.623 Y171.401 E.37864
G1 X198.248 Y171.186 E.01172
G1 X187.963 Y181.472 E.39415
G1 X187.183 Y181.661 E.02174
G1 X197.873 Y170.971 E.40965
G1 X197.498 Y170.756 E.01172
G1 X186.403 Y181.851 E.42515
G1 X185.624 Y182.04 E.02174
G1 X197.123 Y170.541 E.44065
G1 X196.747 Y170.326 E.01172
G1 X184.844 Y182.23 E.45615
G1 X184.064 Y182.419 E.02174
G1 X196.372 Y170.111 E.47166
G1 X195.997 Y169.896 E.01172
G1 X183.285 Y182.609 E.48716
G1 X182.505 Y182.798 E.02174
G1 X195.622 Y169.681 E.50266
G1 X195.247 Y169.466 E.01172
G1 X181.725 Y182.987 E.51816
G1 X180.945 Y183.177 E.02174
G1 X194.872 Y169.251 E.53366
G1 X194.496 Y169.036 E.01172
G1 X180.166 Y183.366 E.54917
G1 X179.386 Y183.556 E.02174
G1 X194.121 Y168.821 E.56467
G1 X193.746 Y168.606 E.01172
G1 X178.606 Y183.745 E.58017
G1 X177.827 Y183.935 E.02174
G1 X193.371 Y168.39 E.59567
G1 X192.996 Y168.175 E.01172
G1 X177.047 Y184.124 E.61118
G1 X176.267 Y184.314 E.02174
G1 X192.621 Y167.96 E.62668
G1 X192.246 Y167.745 E.01172
G1 X175.488 Y184.503 E.64218
G1 X174.708 Y184.693 E.02174
G1 X191.87 Y167.53 E.65768
G1 X191.495 Y167.315 E.01172
G1 X173.928 Y184.882 E.67318
G1 X173.149 Y185.072 E.02174
G1 X191.12 Y167.1 E.68869
G1 X190.745 Y166.885 E.01172
G1 X172.369 Y185.261 E.70419
G1 X171.589 Y185.45 E.02174
G1 X190.37 Y166.67 E.71969
G1 X189.995 Y166.455 E.01172
G1 X170.81 Y185.64 E.73519
G1 X170.03 Y185.829 E.02174
G1 X189.62 Y166.24 E.7507
G1 X189.244 Y166.025 E.01172
G1 X169.25 Y186.019 E.7662
G1 X168.47 Y186.208 E.02174
G1 X188.869 Y165.81 E.7817
G1 X188.494 Y165.595 E.01172
G1 X167.691 Y186.398 E.7972
G1 X166.911 Y186.587 E.02174
G1 X188.119 Y165.379 E.8127
G1 X187.744 Y165.164 E.01172
G1 X166.131 Y186.777 E.82821
G1 X165.352 Y186.966 E.02174
G1 X187.369 Y164.949 E.84371
G1 X186.993 Y164.734 E.01172
G1 X164.572 Y187.156 E.85921
G1 X163.792 Y187.345 E.02174
G1 X186.618 Y164.519 E.87471
G1 X186.243 Y164.304 E.01172
G1 X163.013 Y187.535 E.89021
G1 X162.233 Y187.724 E.02174
G1 X185.868 Y164.089 E.90572
G1 X185.493 Y163.874 E.01172
G1 X161.453 Y187.914 E.92122
G1 X160.674 Y188.103 E.02174
G1 X185.118 Y163.659 E.93672
G1 X184.743 Y163.444 E.01172
G1 X159.894 Y188.292 E.95222
G1 X159.114 Y188.482 E.02174
G1 X184.367 Y163.229 E.96773
G1 X183.992 Y163.014 E.01172
G1 X158.335 Y188.671 E.98323
G1 X157.555 Y188.861 E.02174
G1 X183.617 Y162.799 E.99873
G1 X183.242 Y162.584 E.01172
G1 X156.775 Y189.05 E1.01423
G1 X155.995 Y189.24 E.02174
G1 X182.867 Y162.369 E1.02973
G1 X182.492 Y162.153 E.01172
G1 X155.216 Y189.429 E1.04524
G1 X154.436 Y189.619 E.02174
G1 X182.116 Y161.938 E1.06074
G1 X181.741 Y161.723 E.01172
G1 X153.656 Y189.808 E1.07624
G1 X152.877 Y189.998 E.02174
G1 X181.366 Y161.508 E1.09174
G1 X180.991 Y161.293 E.01172
G1 X152.097 Y190.187 E1.10724
G1 X151.317 Y190.377 E.02174
G1 X180.616 Y161.078 E1.12275
G1 X180.241 Y160.863 E.01172
G1 X150.538 Y190.566 E1.13825
G1 X149.758 Y190.755 E.02174
G1 X179.866 Y160.648 E1.15375
G1 X179.49 Y160.433 E.01172
G1 X148.978 Y190.945 E1.16925
G1 X148.199 Y191.134 E.02174
G1 X179.115 Y160.218 E1.18476
G1 X178.74 Y160.003 E.01172
G1 X147.419 Y191.324 E1.20026
G1 X146.639 Y191.513 E.02174
G1 X178.365 Y159.788 E1.21576
G1 X177.99 Y159.573 E.01172
G1 X145.86 Y191.703 E1.23126
G1 X145.08 Y191.892 E.02174
G1 X177.615 Y159.358 E1.24676
G1 X177.239 Y159.142 E.01172
G1 X144.3 Y192.082 E1.26227
G1 X143.521 Y192.271 E.02174
G1 X176.864 Y158.927 E1.27777
G1 X176.489 Y158.712 E.01172
G1 X142.741 Y192.461 E1.29327
G1 X141.961 Y192.65 E.02174
G1 X176.114 Y158.497 E1.30877
G1 X175.739 Y158.282 E.01172
G1 X141.181 Y192.84 E1.32428
G1 X140.402 Y193.029 E.02174
G1 X175.364 Y158.067 E1.33978
G1 X174.989 Y157.852 E.01172
G1 X139.622 Y193.219 E1.35528
M73 P72 R18
G1 X138.842 Y193.408 E.02174
G1 X174.613 Y157.637 E1.37078
G1 X174.238 Y157.422 E.01172
G1 X138.063 Y193.597 E1.38628
G1 X137.283 Y193.787 E.02174
G1 X173.863 Y157.207 E1.40179
G1 X173.488 Y156.992 E.01172
G1 X136.503 Y193.976 E1.41729
G1 X135.724 Y194.166 E.02174
G1 X173.113 Y156.777 E1.43279
G1 X172.738 Y156.562 E.01172
G1 X134.944 Y194.355 E1.44829
G1 X134.164 Y194.545 E.02174
G1 X172.362 Y156.347 E1.46379
G1 X171.987 Y156.131 E.01172
G1 X133.385 Y194.734 E1.4793
G1 X132.605 Y194.924 E.02174
G1 X171.612 Y155.916 E1.4948
M73 P73 R18
G1 X171.237 Y155.701 E.01172
G1 X132.388 Y194.55 E1.48872
G1 X132.4 Y193.948 E.01632
G1 X170.862 Y155.486 E1.47388
G1 X170.487 Y155.271 E.01172
G1 X132.413 Y193.345 E1.45904
G1 X132.425 Y192.743 E.01632
G1 X170.112 Y155.056 E1.4442
G1 X169.736 Y154.841 E.01172
G1 X132.437 Y192.141 E1.42937
G1 X132.449 Y191.539 E.01632
G1 X169.361 Y154.626 E1.41453
G1 X168.986 Y154.411 E.01172
G1 X132.461 Y190.936 E1.39969
G1 X132.473 Y190.334 E.01632
G1 X168.611 Y154.196 E1.38485
G1 X168.236 Y153.981 E.01172
G1 X132.485 Y189.732 E1.37001
G1 X132.497 Y189.129 E.01632
G1 X167.861 Y153.766 E1.35518
G1 X167.486 Y153.551 E.01172
G1 X132.509 Y188.527 E1.34034
G1 X132.521 Y187.925 E.01632
G1 X167.11 Y153.336 E1.3255
G1 X166.735 Y153.121 E.01172
G1 X132.533 Y187.323 E1.31066
G1 X132.545 Y186.72 E.01632
G1 X166.36 Y152.905 E1.29582
G1 X165.985 Y152.69 E.01172
G1 X132.557 Y186.118 E1.28099
G1 X132.569 Y185.516 E.01632
G1 X165.61 Y152.475 E1.26615
G1 X165.235 Y152.26 E.01172
G1 X132.581 Y184.914 E1.25131
G1 X132.593 Y184.311 E.01632
G1 X164.859 Y152.045 E1.23647
G1 X164.484 Y151.83 E.01172
G1 X132.605 Y183.709 E1.22163
G1 X132.617 Y183.107 E.01632
G1 X164.109 Y151.615 E1.2068
G1 X163.734 Y151.4 E.01172
G1 X132.629 Y182.504 E1.19196
G1 X132.642 Y181.902 E.01632
G1 X163.359 Y151.185 E1.17712
G1 X162.984 Y150.97 E.01172
G1 X132.654 Y181.3 E1.16228
G1 X132.666 Y180.698 E.01632
G1 X162.609 Y150.755 E1.14744
G1 X162.233 Y150.54 E.01172
G1 X132.678 Y180.095 E1.13261
G1 X132.69 Y179.493 E.01632
G1 X161.858 Y150.325 E1.11777
G1 X161.483 Y150.11 E.01172
G1 X132.702 Y178.891 E1.10293
G1 X132.714 Y178.289 E.01632
G1 X161.108 Y149.894 E1.08809
G1 X160.733 Y149.679 E.01172
G1 X132.726 Y177.686 E1.07325
G1 X132.738 Y177.084 E.01632
G1 X160.358 Y149.464 E1.05841
G1 X159.982 Y149.249 E.01172
G1 X132.75 Y176.482 E1.04358
G1 X132.762 Y175.879 E.01632
G1 X159.607 Y149.034 E1.02874
G1 X159.232 Y148.819 E.01172
G1 X132.774 Y175.277 E1.0139
G1 X132.786 Y174.675 E.01632
G1 X158.857 Y148.604 E.99906
G1 X158.482 Y148.389 E.01172
G1 X132.798 Y174.073 E.98422
G1 X132.81 Y173.47 E.01632
G1 X158.107 Y148.174 E.96939
G1 X157.732 Y147.959 E.01172
G1 X132.822 Y172.868 E.95455
G1 X132.834 Y172.266 E.01632
G1 X157.356 Y147.744 E.93971
G1 X156.981 Y147.529 E.01172
G1 X132.846 Y171.664 E.92487
G1 X132.858 Y171.061 E.01632
G1 X156.606 Y147.314 E.91003
G1 X156.231 Y147.099 E.01172
G1 X132.87 Y170.459 E.8952
G1 X132.883 Y169.857 E.01632
G1 X155.856 Y146.884 E.88036
G1 X155.481 Y146.668 E.01172
G1 X132.895 Y169.254 E.86552
G1 X132.907 Y168.652 E.01632
G1 X155.105 Y146.453 E.85068
G1 X154.73 Y146.238 E.01172
G1 X132.919 Y168.05 E.83584
G1 X132.931 Y167.448 E.01632
G1 X154.355 Y146.023 E.82101
G1 X153.98 Y145.808 E.01172
G1 X132.943 Y166.845 E.80617
G1 X132.955 Y166.243 E.01632
G1 X153.605 Y145.593 E.79133
G1 X153.23 Y145.378 E.01172
G1 X132.967 Y165.641 E.77649
G1 X132.979 Y165.039 E.01632
G1 X152.855 Y145.163 E.76165
G1 X152.479 Y144.948 E.01172
G1 X132.991 Y164.436 E.74682
G1 X133.003 Y163.834 E.01632
G1 X152.104 Y144.733 E.73198
G1 X151.729 Y144.518 E.01172
G1 X133.015 Y163.232 E.71714
G1 X133.027 Y162.629 E.01632
G1 X151.354 Y144.303 E.7023
G1 X150.979 Y144.088 E.01172
G1 X133.039 Y162.027 E.68746
G1 X133.051 Y161.425 E.01632
G1 X150.604 Y143.873 E.67263
G1 X150.228 Y143.657 E.01172
G1 X133.063 Y160.823 E.65779
G1 X133.075 Y160.22 E.01632
G1 X149.853 Y143.442 E.64295
G1 X149.478 Y143.227 E.01172
G1 X133.087 Y159.618 E.62811
G1 X133.099 Y159.016 E.01632
G1 X149.103 Y143.012 E.61327
G1 X148.728 Y142.797 E.01172
G1 X133.111 Y158.414 E.59844
G1 X133.124 Y157.811 E.01632
G1 X148.353 Y142.582 E.5836
G1 X147.978 Y142.367 E.01172
G1 X133.136 Y157.209 E.56876
G1 X133.148 Y156.607 E.01632
G1 X147.602 Y142.152 E.55392
G1 X147.227 Y141.937 E.01172
G1 X133.16 Y156.004 E.53908
G1 X133.172 Y155.402 E.01632
G1 X146.852 Y141.722 E.52425
G1 X146.477 Y141.507 E.01172
G1 X133.184 Y154.8 E.50941
G1 X133.196 Y154.198 E.01632
G1 X146.102 Y141.292 E.49457
G1 X145.727 Y141.077 E.01172
G1 X133.208 Y153.595 E.47973
G1 X133.22 Y152.993 E.01632
G1 X144.539 Y141.674 E.43377
G1 X143.143 Y142.48 E.04369
G1 X133.232 Y152.391 E.37979
G1 X133.244 Y151.789 E.01632
G1 X141.746 Y143.286 E.32582
G1 X140.35 Y144.093 E.04369
G1 X133.256 Y151.186 E.27184
G1 X133.268 Y150.584 E.01632
G1 X138.953 Y144.899 E.21786
G1 X137.557 Y145.705 E.04369
G1 X133.28 Y149.982 E.16389
G1 X133.292 Y149.379 E.01632
G1 X136.16 Y146.511 E.10991
G1 X134.764 Y147.318 E.04369
G1 X133.113 Y148.968 E.06325
; OBJECT_ID: 409
; WIPE_START
G1 X134.528 Y147.554 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 381
M625
; start printing object, unique label id: 409
M624 CAAAAAAAAAA=
M204 S10000
G1 X127.29 Y149.978 Z2.04 F30000
G1 X47.263 Y176.79 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X110.195 Y140.712 E1.96561
G1 X110.507 Y140.712 E.00845
G1 X122.876 Y147.854 E.38701
G1 X123.038 Y148.129 E.00867
G1 X123.985 Y195.433 E1.28205
G1 X47.322 Y176.804 E2.1378
; WIPE_START
G1 X49.056 Y175.808 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.192 Y176.942 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X110.088 Y140.311 E1.85169
G1 X110.114 Y140.311 E.00065
G1 X110.614 Y140.312 E.01257
G1 X123.167 Y147.559 E.36442
G1 X123.437 Y148.016 E.01333
G1 X124.392 Y195.729 E1.19981
G1 X124.186 Y195.894 E.00664
G1 X46.251 Y176.956 E2.01641
; WIPE_START
M204 S4000
G1 X47.985 Y175.96 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.802 Y176.99 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.375 Y176.562 E.01639
G1 X48.75 Y176.347 E.01172
G1 X49.328 Y176.925 E.02215
G1 X50.107 Y177.115 E.02174
G1 X49.125 Y176.132 E.03765
G1 X49.5 Y175.917 E.01172
G1 X50.887 Y177.304 E.05315
G1 X51.667 Y177.494 E.02174
G1 X49.875 Y175.702 E.06865
G1 X50.25 Y175.487 E.01172
G1 X52.446 Y177.683 E.08416
G1 X53.226 Y177.873 E.02174
G1 X50.625 Y175.272 E.09966
G1 X51.001 Y175.057 E.01172
G1 X54.006 Y178.062 E.11516
G1 X54.785 Y178.251 E.02174
G1 X51.376 Y174.842 E.13066
G1 X51.751 Y174.627 E.01172
G1 X55.565 Y178.441 E.14617
G1 X56.345 Y178.63 E.02174
G1 X52.126 Y174.412 E.16167
G1 X52.501 Y174.197 E.01172
G1 X57.125 Y178.82 E.17717
G1 X57.904 Y179.009 E.02174
G1 X52.876 Y173.981 E.19267
G1 X53.252 Y173.766 E.01172
G1 X58.684 Y179.199 E.20817
G1 X59.464 Y179.388 E.02174
G1 X53.627 Y173.551 E.22368
G1 X54.002 Y173.336 E.01172
G1 X60.243 Y179.578 E.23918
G1 X61.023 Y179.767 E.02174
G1 X54.377 Y173.121 E.25468
G1 X54.752 Y172.906 E.01172
G1 X61.803 Y179.957 E.27018
G1 X62.582 Y180.146 E.02174
G1 X55.127 Y172.691 E.28569
G1 X55.502 Y172.476 E.01172
G1 X63.362 Y180.336 E.30119
G1 X64.142 Y180.525 E.02174
G1 X55.878 Y172.261 E.31669
G1 X56.253 Y172.046 E.01172
G1 X64.921 Y180.715 E.33219
G1 X65.701 Y180.904 E.02174
G1 X56.628 Y171.831 E.34769
G1 X57.003 Y171.616 E.01172
G1 X66.481 Y181.093 E.3632
G1 X67.26 Y181.283 E.02174
G1 X57.378 Y171.401 E.3787
G1 X57.753 Y171.186 E.01172
G1 X68.04 Y181.472 E.3942
G1 X68.82 Y181.662 E.02174
G1 X58.128 Y170.971 E.4097
G1 X58.504 Y170.755 E.01172
G1 X69.6 Y181.851 E.42521
G1 X70.379 Y182.041 E.02174
G1 X58.879 Y170.54 E.44071
G1 X59.254 Y170.325 E.01172
G1 X71.159 Y182.23 E.45621
G1 X71.939 Y182.42 E.02174
G1 X59.629 Y170.11 E.47171
G1 X60.004 Y169.895 E.01172
G1 X72.718 Y182.609 E.48721
G1 X73.498 Y182.799 E.02174
G1 X60.379 Y169.68 E.50272
G1 X60.755 Y169.465 E.01172
G1 X74.278 Y182.988 E.51822
G1 X75.057 Y183.178 E.02174
G1 X61.13 Y169.25 E.53372
G1 X61.505 Y169.035 E.01172
G1 X75.837 Y183.367 E.54922
G1 X76.617 Y183.557 E.02174
G1 X61.88 Y168.82 E.56472
G1 X62.255 Y168.605 E.01172
G1 X77.396 Y183.746 E.58023
G1 X78.176 Y183.935 E.02174
G1 X62.63 Y168.39 E.59573
G1 X63.005 Y168.175 E.01172
G1 X78.956 Y184.125 E.61123
G1 X79.735 Y184.314 E.02174
G1 X63.381 Y167.96 E.62673
G1 X63.756 Y167.744 E.01172
G1 X80.515 Y184.504 E.64224
G1 X81.295 Y184.693 E.02174
G1 X64.131 Y167.529 E.65774
G1 X64.506 Y167.314 E.01172
G1 X82.074 Y184.883 E.67324
G1 X82.854 Y185.072 E.02174
G1 X64.881 Y167.099 E.68874
G1 X65.256 Y166.884 E.01172
G1 X83.634 Y185.262 E.70424
G1 X84.414 Y185.451 E.02174
G1 X65.632 Y166.669 E.71975
G1 X66.007 Y166.454 E.01172
G1 X85.193 Y185.641 E.73525
G1 X85.973 Y185.83 E.02174
G1 X66.382 Y166.239 E.75075
G1 X66.757 Y166.024 E.01172
G1 X86.753 Y186.02 E.76625
G1 X87.532 Y186.209 E.02174
G1 X67.132 Y165.809 E.78175
G1 X67.507 Y165.594 E.01172
G1 X88.312 Y186.398 E.79726
G1 X89.092 Y186.588 E.02174
G1 X67.882 Y165.379 E.81276
G1 X68.258 Y165.164 E.01172
G1 X89.871 Y186.777 E.82826
G1 X90.651 Y186.967 E.02174
G1 X68.633 Y164.949 E.84376
G1 X69.008 Y164.734 E.01172
G1 X91.431 Y187.156 E.85927
G1 X92.21 Y187.346 E.02174
G1 X69.383 Y164.518 E.87477
G1 X69.758 Y164.303 E.01172
G1 X92.99 Y187.535 E.89027
G1 X93.77 Y187.725 E.02174
G1 X70.133 Y164.088 E.90577
G1 X70.509 Y163.873 E.01172
G1 X94.549 Y187.914 E.92127
G1 X95.329 Y188.104 E.02174
G1 X70.884 Y163.658 E.93678
G1 X71.259 Y163.443 E.01172
G1 X96.109 Y188.293 E.95228
G1 X96.889 Y188.483 E.02174
G1 X71.634 Y163.228 E.96778
G1 X72.009 Y163.013 E.01172
G1 X97.668 Y188.672 E.98328
G1 X98.448 Y188.862 E.02174
G1 X72.384 Y162.798 E.99878
G1 X72.759 Y162.583 E.01172
G1 X99.228 Y189.051 E1.01429
G1 X100.007 Y189.24 E.02174
G1 X73.135 Y162.368 E1.02979
G1 X73.51 Y162.153 E.01172
G1 X100.787 Y189.43 E1.04529
G1 X101.567 Y189.619 E.02174
G1 X73.885 Y161.938 E1.06079
G1 X74.26 Y161.723 E.01172
G1 X102.346 Y189.809 E1.0763
G1 X103.126 Y189.998 E.02174
G1 X74.635 Y161.507 E1.0918
G1 X75.01 Y161.292 E.01172
G1 X103.906 Y190.188 E1.1073
G1 X104.685 Y190.377 E.02174
G1 X75.386 Y161.077 E1.1228
G1 X75.761 Y160.862 E.01172
G1 X105.465 Y190.567 E1.1383
G1 X106.245 Y190.756 E.02174
G1 X76.136 Y160.647 E1.15381
G1 X76.511 Y160.432 E.01172
G1 X107.024 Y190.946 E1.16931
G1 X107.804 Y191.135 E.02174
G1 X76.886 Y160.217 E1.18481
G1 X77.261 Y160.002 E.01172
G1 X108.584 Y191.325 E1.20031
G1 X109.364 Y191.514 E.02174
G1 X77.636 Y159.787 E1.21581
G1 X78.012 Y159.572 E.01172
G1 X110.143 Y191.703 E1.23132
G1 X110.923 Y191.893 E.02174
G1 X78.387 Y159.357 E1.24682
G1 X78.762 Y159.142 E.01172
G1 X111.703 Y192.082 E1.26232
G1 X112.482 Y192.272 E.02174
G1 X79.137 Y158.927 E1.27782
G1 X79.512 Y158.712 E.01172
G1 X113.262 Y192.461 E1.29333
G1 X114.042 Y192.651 E.02174
G1 X79.887 Y158.496 E1.30883
G1 X80.262 Y158.281 E.01172
G1 X114.821 Y192.84 E1.32433
G1 X115.601 Y193.03 E.02174
G1 X80.638 Y158.066 E1.33983
G1 X81.013 Y157.851 E.01172
G1 X116.381 Y193.219 E1.35533
G1 X117.16 Y193.409 E.02174
G1 X81.388 Y157.636 E1.37084
G1 X81.763 Y157.421 E.01172
G1 X117.94 Y193.598 E1.38634
G1 X118.72 Y193.788 E.02174
G1 X82.138 Y157.206 E1.40184
G1 X82.513 Y156.991 E.01172
G1 X119.499 Y193.977 E1.41734
M73 P74 R18
G1 X120.279 Y194.167 E.02174
G1 X82.889 Y156.776 E1.43285
G1 X83.264 Y156.561 E.01172
G1 X121.059 Y194.356 E1.44835
G1 X121.838 Y194.545 E.02174
G1 X83.639 Y156.346 E1.46385
G1 X84.014 Y156.131 E.01172
G1 X122.618 Y194.735 E1.47935
G1 X123.398 Y194.924 E.02174
G1 X84.389 Y155.916 E1.49485
G1 X84.764 Y155.701 E.01172
G1 X123.612 Y194.548 E1.48866
G1 X123.599 Y193.946 E.01632
G1 X85.139 Y155.486 E1.47383
G1 X85.515 Y155.27 E.01172
G1 X123.587 Y193.343 E1.45899
G1 X123.575 Y192.741 E.01632
G1 X85.89 Y155.055 E1.44415
G1 X86.265 Y154.84 E.01172
G1 X123.563 Y192.139 E1.42931
G1 X123.551 Y191.536 E.01632
G1 X86.64 Y154.625 E1.41447
G1 X87.015 Y154.41 E.01172
G1 X123.539 Y190.934 E1.39964
G1 X123.527 Y190.332 E.01632
G1 X87.39 Y154.195 E1.3848
G1 X87.766 Y153.98 E.01172
G1 X123.515 Y189.73 E1.36996
G1 X123.503 Y189.127 E.01632
G1 X88.141 Y153.765 E1.35512
G1 X88.516 Y153.55 E.01172
G1 X123.491 Y188.525 E1.34028
G1 X123.479 Y187.923 E.01632
G1 X88.891 Y153.335 E1.32545
G1 X89.266 Y153.12 E.01172
G1 X123.467 Y187.321 E1.31061
G1 X123.455 Y186.718 E.01632
G1 X89.641 Y152.905 E1.29577
G1 X90.016 Y152.69 E.01172
G1 X123.443 Y186.116 E1.28093
G1 X123.431 Y185.514 E.01632
G1 X90.392 Y152.475 E1.26609
G1 X90.767 Y152.259 E.01172
G1 X123.419 Y184.911 E1.25126
G1 X123.407 Y184.309 E.01632
G1 X91.142 Y152.044 E1.23642
G1 X91.517 Y151.829 E.01172
G1 X123.395 Y183.707 E1.22158
G1 X123.383 Y183.105 E.01632
G1 X91.892 Y151.614 E1.20674
G1 X92.267 Y151.399 E.01172
G1 X123.37 Y182.502 E1.1919
G1 X123.358 Y181.9 E.01632
G1 X92.643 Y151.184 E1.17707
G1 X93.018 Y150.969 E.01172
G1 X123.346 Y181.298 E1.16223
G1 X123.334 Y180.696 E.01632
G1 X93.393 Y150.754 E1.14739
G1 X93.768 Y150.539 E.01172
G1 X123.322 Y180.093 E1.13255
G1 X123.31 Y179.491 E.01632
G1 X94.143 Y150.324 E1.11771
G1 X94.518 Y150.109 E.01172
G1 X123.298 Y178.889 E1.10288
G1 X123.286 Y178.286 E.01632
G1 X94.893 Y149.894 E1.08804
G1 X95.269 Y149.679 E.01172
G1 X123.274 Y177.684 E1.0732
G1 X123.262 Y177.082 E.01632
G1 X95.644 Y149.464 E1.05836
G1 X96.019 Y149.249 E.01172
G1 X123.25 Y176.48 E1.04352
G1 X123.238 Y175.877 E.01632
G1 X96.394 Y149.033 E1.02869
G1 X96.769 Y148.818 E.01172
G1 X123.226 Y175.275 E1.01385
G1 X123.214 Y174.673 E.01632
G1 X97.144 Y148.603 E.99901
G1 X97.52 Y148.388 E.01172
G1 X123.202 Y174.071 E.98417
G1 X123.19 Y173.468 E.01632
G1 X97.895 Y148.173 E.96933
G1 X98.27 Y147.958 E.01172
G1 X123.178 Y172.866 E.9545
G1 X123.166 Y172.264 E.01632
G1 X98.645 Y147.743 E.93966
G1 X99.02 Y147.528 E.01172
G1 X123.154 Y171.661 E.92482
G1 X123.142 Y171.059 E.01632
G1 X99.395 Y147.313 E.90998
G1 X99.77 Y147.098 E.01172
G1 X123.129 Y170.457 E.89514
G1 X123.117 Y169.855 E.01632
G1 X100.146 Y146.883 E.8803
G1 X100.521 Y146.668 E.01172
G1 X123.105 Y169.252 E.86547
G1 X123.093 Y168.65 E.01632
G1 X100.896 Y146.453 E.85063
G1 X101.271 Y146.238 E.01172
G1 X123.081 Y168.048 E.83579
G1 X123.069 Y167.446 E.01632
G1 X101.646 Y146.022 E.82095
G1 X102.021 Y145.807 E.01172
G1 X123.057 Y166.843 E.80612
M73 P74 R17
G1 X123.045 Y166.241 E.01632
G1 X102.396 Y145.592 E.79128
G1 X102.772 Y145.377 E.01172
G1 X123.033 Y165.639 E.77644
G1 X123.021 Y165.036 E.01632
G1 X103.147 Y145.162 E.7616
G1 X103.522 Y144.947 E.01172
G1 X123.009 Y164.434 E.74676
G1 X122.997 Y163.832 E.01632
G1 X103.897 Y144.732 E.73192
G1 X104.272 Y144.517 E.01172
G1 X122.985 Y163.23 E.71709
G1 X122.973 Y162.627 E.01632
G1 X104.647 Y144.302 E.70225
G1 X105.023 Y144.087 E.01172
G1 X122.961 Y162.025 E.68741
G1 X122.949 Y161.423 E.01632
G1 X105.398 Y143.872 E.67257
G1 X105.773 Y143.657 E.01172
G1 X122.937 Y160.821 E.65773
G1 X122.925 Y160.218 E.01632
G1 X106.148 Y143.442 E.6429
G1 X106.523 Y143.227 E.01172
G1 X122.913 Y159.616 E.62806
G1 X122.901 Y159.014 E.01632
G1 X106.898 Y143.011 E.61322
G1 X107.273 Y142.796 E.01172
G1 X122.888 Y158.411 E.59838
G1 X122.876 Y157.809 E.01632
G1 X107.649 Y142.581 E.58354
G1 X108.024 Y142.366 E.01172
G1 X122.864 Y157.207 E.56871
G1 X122.852 Y156.605 E.01632
G1 X108.399 Y142.151 E.55387
G1 X108.774 Y141.936 E.01172
G1 X122.84 Y156.002 E.53903
G1 X122.828 Y155.4 E.01632
G1 X109.149 Y141.721 E.52419
G1 X109.524 Y141.506 E.01172
G1 X122.816 Y154.798 E.50935
G1 X122.804 Y154.196 E.01632
G1 X109.9 Y141.291 E.49452
G1 X110.275 Y141.076 E.01172
G1 X122.792 Y153.593 E.47968
G1 X122.78 Y152.991 E.01632
G1 X111.466 Y141.677 E.43358
G1 X112.862 Y142.483 E.04369
G1 X122.768 Y152.389 E.3796
G1 X122.756 Y151.786 E.01632
G1 X114.259 Y143.289 E.32562
G1 X115.655 Y144.095 E.04369
G1 X122.744 Y151.184 E.27165
G1 X122.732 Y150.582 E.01632
G1 X117.052 Y144.902 E.21767
G1 X118.448 Y145.708 E.04369
G1 X122.72 Y149.98 E.16369
G1 X122.708 Y149.377 E.01632
G1 X119.845 Y146.514 E.10972
G1 X121.241 Y147.32 E.04369
G1 X122.887 Y148.966 E.06306
; OBJECT_ID: 437
; WIPE_START
G1 X121.472 Y147.552 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 409
M625
; start printing object, unique label id: 437
M624 EAAAAAAAAAA=
M204 S10000
G1 X116.007 Y142.224 Z2.04 F30000
G1 X47.263 Y75.21 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X123.985 Y56.567 E2.13943
G1 X123.038 Y103.871 E1.28205
G1 X122.876 Y104.146 E.00867
G1 X110.507 Y111.288 E.38702
G1 X110.195 Y111.288 E.00845
G1 X47.315 Y75.24 E1.96398
; WIPE_START
G1 X49.259 Y74.767 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.192 Y75.058 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X124.186 Y56.106 E2.01792
G1 X124.392 Y56.271 E.00664
G1 X123.437 Y103.984 E1.19981
G1 X123.167 Y104.441 E.01333
G1 X110.614 Y111.688 E.36442
G1 X110.088 Y111.689 E.01322
G1 X46.244 Y75.088 E1.85018
; WIPE_START
M204 S4000
G1 X48.188 Y74.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.237 Y75.575 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.548 Y75.264 E.0119
G1 X49.328 Y75.075 E.02174
G1 X48.75 Y75.653 E.02215
G1 X49.125 Y75.868 E.01172
G1 X50.107 Y74.885 E.03765
G1 X50.887 Y74.696 E.02174
G1 X49.5 Y76.083 E.05315
G1 X49.875 Y76.298 E.01172
G1 X51.667 Y74.506 E.06866
G1 X52.446 Y74.317 E.02174
G1 X50.25 Y76.513 E.08416
G1 X50.625 Y76.728 E.01172
G1 X53.226 Y74.127 E.09966
G1 X54.006 Y73.938 E.02174
G1 X51.001 Y76.943 E.11516
G1 X51.376 Y77.158 E.01172
G1 X54.785 Y73.749 E.13066
G1 X55.565 Y73.559 E.02174
G1 X51.751 Y77.373 E.14617
G1 X52.126 Y77.588 E.01172
G1 X56.345 Y73.37 E.16167
G1 X57.125 Y73.18 E.02174
G1 X52.501 Y77.803 E.17717
G1 X52.876 Y78.019 E.01172
G1 X57.904 Y72.991 E.19267
G1 X58.684 Y72.801 E.02174
G1 X53.252 Y78.234 E.20817
G1 X53.627 Y78.449 E.01172
G1 X59.464 Y72.612 E.22368
G1 X60.243 Y72.422 E.02174
G1 X54.002 Y78.664 E.23918
G1 X54.377 Y78.879 E.01172
G1 X61.023 Y72.233 E.25468
G1 X61.803 Y72.043 E.02174
G1 X54.752 Y79.094 E.27018
G1 X55.127 Y79.309 E.01172
G1 X62.582 Y71.854 E.28569
G1 X63.362 Y71.664 E.02174
G1 X55.502 Y79.524 E.30119
G1 X55.878 Y79.739 E.01172
G1 X64.142 Y71.475 E.31669
G1 X64.921 Y71.285 E.02174
G1 X56.253 Y79.954 E.33219
G1 X56.628 Y80.169 E.01172
G1 X65.701 Y71.096 E.34769
G1 X66.481 Y70.907 E.02174
G1 X57.003 Y80.384 E.3632
G1 X57.378 Y80.599 E.01172
G1 X67.26 Y70.717 E.3787
G1 X68.04 Y70.528 E.02174
G1 X57.753 Y80.814 E.3942
G1 X58.129 Y81.029 E.01172
G1 X68.82 Y70.338 E.4097
G1 X69.6 Y70.149 E.02174
G1 X58.504 Y81.245 E.42521
G1 X58.879 Y81.46 E.01172
G1 X70.379 Y69.959 E.44071
G1 X71.159 Y69.77 E.02174
G1 X59.254 Y81.675 E.45621
G1 X59.629 Y81.89 E.01172
G1 X71.939 Y69.58 E.47171
G1 X72.718 Y69.391 E.02174
G1 X60.004 Y82.105 E.48721
G1 X60.379 Y82.32 E.01172
G1 X73.498 Y69.201 E.50272
G1 X74.278 Y69.012 E.02174
G1 X60.755 Y82.535 E.51822
G1 X61.13 Y82.75 E.01172
G1 X75.057 Y68.822 E.53372
G1 X75.837 Y68.633 E.02174
G1 X61.505 Y82.965 E.54922
G1 X61.88 Y83.18 E.01172
G1 X76.617 Y68.444 E.56472
G1 X77.396 Y68.254 E.02174
G1 X62.255 Y83.395 E.58023
G1 X62.63 Y83.61 E.01172
G1 X78.176 Y68.065 E.59573
G1 X78.956 Y67.875 E.02174
G1 X63.005 Y83.825 E.61123
G1 X63.381 Y84.04 E.01172
G1 X79.735 Y67.686 E.62673
G1 X80.515 Y67.496 E.02174
G1 X63.756 Y84.256 E.64224
G1 X64.131 Y84.471 E.01172
G1 X81.295 Y67.307 E.65774
G1 X82.075 Y67.117 E.02174
G1 X64.506 Y84.686 E.67324
G1 X64.881 Y84.901 E.01172
G1 X82.854 Y66.928 E.68874
G1 X83.634 Y66.738 E.02174
G1 X65.256 Y85.116 E.70424
G1 X65.632 Y85.331 E.01172
G1 X84.414 Y66.549 E.71975
G1 X85.193 Y66.359 E.02174
G1 X66.007 Y85.546 E.73525
G1 X66.382 Y85.761 E.01172
G1 X85.973 Y66.17 E.75075
G1 X86.753 Y65.98 E.02174
G1 X66.757 Y85.976 E.76625
G1 X67.132 Y86.191 E.01172
G1 X87.532 Y65.791 E.78175
G1 X88.312 Y65.602 E.02174
G1 X67.507 Y86.406 E.79726
G1 X67.882 Y86.621 E.01172
G1 X89.092 Y65.412 E.81276
G1 X89.871 Y65.223 E.02174
G1 X68.258 Y86.836 E.82826
G1 X68.633 Y87.051 E.01172
G1 X90.651 Y65.033 E.84376
G1 X91.431 Y64.844 E.02174
G1 X69.008 Y87.266 E.85927
G1 X69.383 Y87.482 E.01172
G1 X92.21 Y64.654 E.87477
G1 X92.99 Y64.465 E.02174
G1 X69.758 Y87.697 E.89027
G1 X70.133 Y87.912 E.01172
G1 X93.77 Y64.275 E.90577
G1 X94.549 Y64.086 E.02174
G1 X70.509 Y88.127 E.92127
G1 X70.884 Y88.342 E.01172
G1 X95.329 Y63.896 E.93678
G1 X96.109 Y63.707 E.02174
G1 X71.259 Y88.557 E.95228
G1 X71.634 Y88.772 E.01172
G1 X96.889 Y63.517 E.96778
G1 X97.668 Y63.328 E.02174
G1 X72.009 Y88.987 E.98328
G1 X72.384 Y89.202 E.01172
G1 X98.448 Y63.139 E.99878
G1 X99.228 Y62.949 E.02174
G1 X72.759 Y89.417 E1.01429
G1 X73.135 Y89.632 E.01172
G1 X100.007 Y62.76 E1.02979
G1 X100.787 Y62.57 E.02174
G1 X73.51 Y89.847 E1.04529
G1 X73.885 Y90.062 E.01172
G1 X101.567 Y62.381 E1.06079
G1 X102.346 Y62.191 E.02174
G1 X74.26 Y90.277 E1.0763
G1 X74.635 Y90.493 E.01172
G1 X103.126 Y62.002 E1.0918
G1 X103.906 Y61.812 E.02174
G1 X75.01 Y90.708 E1.1073
G1 X75.386 Y90.923 E.01172
G1 X104.685 Y61.623 E1.1228
G1 X105.465 Y61.433 E.02174
G1 X75.761 Y91.138 E1.1383
G1 X76.136 Y91.353 E.01172
G1 X106.245 Y61.244 E1.15381
G1 X107.024 Y61.054 E.02174
G1 X76.511 Y91.568 E1.16931
G1 X76.886 Y91.783 E.01172
G1 X107.804 Y60.865 E1.18481
G1 X108.584 Y60.675 E.02174
G1 X77.261 Y91.998 E1.20031
G1 X77.636 Y92.213 E.01172
G1 X109.364 Y60.486 E1.21581
G1 X110.143 Y60.297 E.02174
G1 X78.012 Y92.428 E1.23132
G1 X78.387 Y92.643 E.01172
G1 X110.923 Y60.107 E1.24682
G1 X111.703 Y59.918 E.02174
G1 X78.762 Y92.858 E1.26232
G1 X79.137 Y93.073 E.01172
G1 X112.482 Y59.728 E1.27782
G1 X113.262 Y59.539 E.02174
G1 X79.512 Y93.288 E1.29333
G1 X79.887 Y93.504 E.01172
G1 X114.042 Y59.349 E1.30883
G1 X114.821 Y59.16 E.02174
G1 X80.263 Y93.719 E1.32433
G1 X80.638 Y93.934 E.01172
G1 X115.601 Y58.97 E1.33983
G1 X116.381 Y58.781 E.02174
G1 X81.013 Y94.149 E1.35533
M73 P75 R17
G1 X81.388 Y94.364 E.01172
G1 X117.16 Y58.591 E1.37084
G1 X117.94 Y58.402 E.02174
G1 X81.763 Y94.579 E1.38634
G1 X82.138 Y94.794 E.01172
G1 X118.72 Y58.212 E1.40184
G1 X119.499 Y58.023 E.02174
G1 X82.513 Y95.009 E1.41734
G1 X82.889 Y95.224 E.01172
G1 X120.279 Y57.834 E1.43284
G1 X121.059 Y57.644 E.02174
G1 X83.264 Y95.439 E1.44835
G1 X83.639 Y95.654 E.01172
G1 X121.839 Y57.455 E1.46385
G1 X122.618 Y57.265 E.02174
G1 X84.014 Y95.869 E1.47935
G1 X84.389 Y96.084 E.01172
G1 X123.398 Y57.076 E1.49485
G1 X123.62 Y57.022 E.0062
G1 X123.612 Y57.452 E.01167
G1 X84.764 Y96.299 E1.48866
G1 X85.139 Y96.514 E.01172
G1 X123.599 Y58.055 E1.47383
G1 X123.587 Y58.657 E.01632
G1 X85.515 Y96.73 E1.45899
G1 X85.89 Y96.945 E.01172
G1 X123.575 Y59.259 E1.44415
G1 X123.563 Y59.861 E.01632
G1 X86.265 Y97.16 E1.42931
G1 X86.64 Y97.375 E.01172
G1 X123.551 Y60.464 E1.41447
G1 X123.539 Y61.066 E.01632
G1 X87.015 Y97.59 E1.39964
G1 X87.39 Y97.805 E.01172
G1 X123.527 Y61.668 E1.3848
G1 X123.515 Y62.27 E.01632
G1 X87.766 Y98.02 E1.36996
G1 X88.141 Y98.235 E.01172
G1 X123.503 Y62.873 E1.35512
G1 X123.491 Y63.475 E.01632
G1 X88.516 Y98.45 E1.34028
G1 X88.891 Y98.665 E.01172
G1 X123.479 Y64.077 E1.32545
G1 X123.467 Y64.68 E.01632
G1 X89.266 Y98.88 E1.31061
G1 X89.641 Y99.095 E.01172
G1 X123.455 Y65.282 E1.29577
G1 X123.443 Y65.884 E.01632
G1 X90.016 Y99.31 E1.28093
G1 X90.392 Y99.525 E.01172
G1 X123.431 Y66.486 E1.26609
G1 X123.419 Y67.089 E.01632
G1 X90.767 Y99.741 E1.25126
G1 X91.142 Y99.956 E.01172
G1 X123.407 Y67.691 E1.23642
G1 X123.395 Y68.293 E.01632
G1 X91.517 Y100.171 E1.22158
G1 X91.892 Y100.386 E.01172
G1 X123.383 Y68.895 E1.20674
G1 X123.371 Y69.498 E.01632
G1 X92.267 Y100.601 E1.1919
G1 X92.643 Y100.816 E.01172
G1 X123.358 Y70.1 E1.17707
G1 X123.346 Y70.702 E.01632
G1 X93.018 Y101.031 E1.16223
G1 X93.393 Y101.246 E.01172
G1 X123.334 Y71.305 E1.14739
G1 X123.322 Y71.907 E.01632
G1 X93.768 Y101.461 E1.13255
G1 X94.143 Y101.676 E.01172
G1 X123.31 Y72.509 E1.11771
G1 X123.298 Y73.111 E.01632
G1 X94.518 Y101.891 E1.10287
G1 X94.893 Y102.106 E.01172
G1 X123.286 Y73.714 E1.08804
G1 X123.274 Y74.316 E.01632
G1 X95.269 Y102.321 E1.0732
G1 X95.644 Y102.536 E.01172
G1 X123.262 Y74.918 E1.05836
G1 X123.25 Y75.52 E.01632
G1 X96.019 Y102.751 E1.04352
G1 X96.394 Y102.967 E.01172
G1 X123.238 Y76.123 E1.02868
G1 X123.226 Y76.725 E.01632
G1 X96.769 Y103.182 E1.01385
G1 X97.144 Y103.397 E.01172
G1 X123.214 Y77.327 E.99901
G1 X123.202 Y77.93 E.01632
G1 X97.52 Y103.612 E.98417
G1 X97.895 Y103.827 E.01172
G1 X123.19 Y78.532 E.96933
G1 X123.178 Y79.134 E.01632
G1 X98.27 Y104.042 E.95449
G1 X98.645 Y104.257 E.01172
G1 X123.166 Y79.736 E.93966
G1 X123.154 Y80.339 E.01632
G1 X99.02 Y104.472 E.92482
G1 X99.395 Y104.687 E.01172
G1 X123.142 Y80.941 E.90998
G1 X123.129 Y81.543 E.01632
G1 X99.77 Y104.902 E.89514
G1 X100.146 Y105.117 E.01172
G1 X123.117 Y82.145 E.8803
G1 X123.105 Y82.748 E.01632
G1 X100.521 Y105.332 E.86547
G1 X100.896 Y105.547 E.01172
G1 X123.093 Y83.35 E.85063
G1 X123.081 Y83.952 E.01632
G1 X101.271 Y105.762 E.83579
G1 X101.646 Y105.978 E.01172
G1 X123.069 Y84.555 E.82095
G1 X123.057 Y85.157 E.01632
G1 X102.021 Y106.193 E.80611
G1 X102.397 Y106.408 E.01172
G1 X123.045 Y85.759 E.79128
G1 X123.033 Y86.361 E.01632
G1 X102.772 Y106.623 E.77644
G1 X103.147 Y106.838 E.01172
G1 X123.021 Y86.964 E.7616
G1 X123.009 Y87.566 E.01632
G1 X103.522 Y107.053 E.74676
G1 X103.897 Y107.268 E.01172
G1 X122.997 Y88.168 E.73192
G1 X122.985 Y88.77 E.01632
G1 X104.272 Y107.483 E.71709
G1 X104.647 Y107.698 E.01172
G1 X122.973 Y89.373 E.70225
G1 X122.961 Y89.975 E.01632
G1 X105.023 Y107.913 E.68741
G1 X105.398 Y108.128 E.01172
G1 X122.949 Y90.577 E.67257
G1 X122.937 Y91.18 E.01632
G1 X105.773 Y108.343 E.65773
G1 X106.148 Y108.558 E.01172
G1 X122.925 Y91.782 E.6429
G1 X122.913 Y92.384 E.01632
G1 X106.523 Y108.773 E.62806
G1 X106.898 Y108.989 E.01172
G1 X122.901 Y92.986 E.61322
G1 X122.888 Y93.589 E.01632
G1 X107.273 Y109.204 E.59838
G1 X107.649 Y109.419 E.01172
G1 X122.876 Y94.191 E.58354
G1 X122.864 Y94.793 E.01632
G1 X108.024 Y109.634 E.56871
G1 X108.399 Y109.849 E.01172
G1 X122.852 Y95.395 E.55387
G1 X122.84 Y95.998 E.01632
G1 X108.774 Y110.064 E.53903
G1 X109.149 Y110.279 E.01172
G1 X122.828 Y96.6 E.52419
G1 X122.816 Y97.202 E.01632
G1 X109.524 Y110.494 E.50935
G1 X109.9 Y110.709 E.01172
G1 X122.804 Y97.805 E.49452
G1 X122.792 Y98.407 E.01632
G1 X110.275 Y110.924 E.47968
G2 X110.411 Y110.932 I.075 J-.115 E.00387
G1 X111.466 Y110.323 E.033
G1 X122.78 Y99.009 E.43357
G1 X122.768 Y99.611 E.01632
G1 X112.862 Y109.517 E.3796
G1 X114.259 Y108.711 E.04369
G1 X122.756 Y100.214 E.32562
G1 X122.744 Y100.816 E.01632
G1 X115.655 Y107.905 E.27165
G1 X117.052 Y107.098 E.04369
G1 X122.732 Y101.418 E.21767
G1 X122.72 Y102.02 E.01632
G1 X118.448 Y106.292 E.16369
G1 X119.845 Y105.486 E.04369
G1 X122.708 Y102.623 E.10972
G1 X122.696 Y103.225 E.01632
G1 X120.73 Y105.191 E.07532
; OBJECT_ID: 465
; WIPE_START
G1 X122.144 Y103.776 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 437
M625
; start printing object, unique label id: 465
M624 IAAAAAAAAAA=
M204 S10000
G1 X116.275 Y108.655 Z2.04 F30000
G1 X40.405 Y171.713 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X40.405 Y80.287 E2.47736
G1 X106.357 Y118.097 E2.05996
G1 X106.512 Y118.364 E.00837
G1 X106.512 Y133.636 E.41382
G1 X106.357 Y133.903 E.00837
G1 X40.457 Y171.683 E2.05834
M204 S10000
G1 X40.004 Y172.261 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X40.004 Y79.739 E2.32615
G1 X40.128 Y79.667 E.0036
G1 X106.65 Y117.803 E1.92779
G1 X106.913 Y118.256 E.01318
G1 X106.913 Y133.744 E.38937
G1 X106.65 Y134.197 E.01318
G1 X40.128 Y172.333 E1.92779
G1 X40.056 Y172.292 E.00209
; WIPE_START
M204 S4000
G1 X40.055 Y170.292 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X40.761 Y171.314 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X40.761 Y80.901 E2.44993
G1 X41.177 Y81.14 E.01301
G1 X41.177 Y170.86 E2.43115
G1 X41.594 Y170.621 E.01301
G1 X41.594 Y81.379 E2.41821
G1 X42.01 Y81.618 E.01301
G1 X42.01 Y170.382 E2.40527
G1 X42.427 Y170.144 E.01301
G1 X42.427 Y81.856 E2.39232
G1 X42.843 Y82.095 E.01301
G1 X42.843 Y169.905 E2.37938
G1 X43.26 Y169.666 E.01301
G1 X43.26 Y82.334 E2.36644
G1 X43.677 Y82.573 E.01301
G1 X43.677 Y169.427 E2.3535
G1 X44.093 Y169.188 E.01301
G1 X44.093 Y82.812 E2.34056
G1 X44.51 Y83.05 E.01301
G1 X44.51 Y168.95 E2.32762
G1 X44.926 Y168.711 E.01301
G1 X44.926 Y83.289 E2.31468
G1 X45.343 Y83.528 E.01301
G1 X45.343 Y168.472 E2.30174
G1 X45.759 Y168.233 E.01301
G1 X45.759 Y83.767 E2.2888
G1 X46.176 Y84.005 E.01301
G1 X46.176 Y167.994 E2.27586
G1 X46.592 Y167.756 E.01301
G1 X46.592 Y84.244 E2.26291
G1 X47.009 Y84.483 E.01301
G1 X47.009 Y167.517 E2.24997
G1 X47.425 Y167.278 E.01301
G1 X47.425 Y84.722 E2.23703
G1 X47.842 Y84.961 E.01301
G1 X47.842 Y167.039 E2.22409
G1 X48.258 Y166.801 E.01301
G1 X48.258 Y85.199 E2.21115
G1 X48.675 Y85.438 E.01301
G1 X48.675 Y166.562 E2.19821
G1 X49.091 Y166.323 E.01301
G1 X49.091 Y85.677 E2.18527
G1 X49.508 Y85.916 E.01301
G1 X49.508 Y166.084 E2.17233
M73 P75 R16
G1 X49.924 Y165.845 E.01301
G1 X49.924 Y86.155 E2.15939
G1 X50.341 Y86.393 E.01301
G1 X50.341 Y165.607 E2.14644
G1 X50.758 Y165.368 E.01301
G1 X50.758 Y86.632 E2.1335
G1 X51.174 Y86.871 E.01301
G1 X51.174 Y165.129 E2.12056
G1 X51.591 Y164.89 E.01301
G1 X51.591 Y87.11 E2.10762
G1 X52.007 Y87.349 E.01301
G1 X52.007 Y164.651 E2.09468
G1 X52.424 Y164.413 E.01301
G1 X52.424 Y87.587 E2.08174
G1 X52.84 Y87.826 E.01301
G1 X52.84 Y164.174 E2.0688
G1 X53.257 Y163.935 E.01301
G1 X53.257 Y88.065 E2.05586
G1 X53.673 Y88.304 E.01301
G1 X53.673 Y163.696 E2.04292
G1 X54.09 Y163.457 E.01301
G1 X54.09 Y88.543 E2.02998
G1 X54.506 Y88.781 E.01301
G1 X54.506 Y163.219 E2.01703
G1 X54.923 Y162.98 E.01301
G1 X54.923 Y89.02 E2.00409
G1 X55.339 Y89.259 E.01301
G1 X55.339 Y162.741 E1.99115
G1 X55.756 Y162.502 E.01301
G1 X55.756 Y89.498 E1.97821
G1 X56.172 Y89.736 E.01301
G1 X56.172 Y162.264 E1.96527
G1 X56.589 Y162.025 E.01301
G1 X56.589 Y89.975 E1.95233
G1 X57.005 Y90.214 E.01301
G1 X57.005 Y161.786 E1.93939
M73 P76 R16
G1 X57.422 Y161.547 E.01301
G1 X57.422 Y90.453 E1.92645
G1 X57.839 Y90.692 E.01301
G1 X57.839 Y161.308 E1.91351
G1 X58.255 Y161.07 E.01301
G1 X58.255 Y90.93 E1.90056
G1 X58.672 Y91.169 E.01301
G1 X58.672 Y160.831 E1.88762
G1 X59.088 Y160.592 E.01301
G1 X59.088 Y91.408 E1.87468
G1 X59.505 Y91.647 E.01301
G1 X59.505 Y160.353 E1.86174
G1 X59.921 Y160.114 E.01301
G1 X59.921 Y91.886 E1.8488
G1 X60.338 Y92.124 E.01301
G1 X60.338 Y159.876 E1.83586
G1 X60.754 Y159.637 E.01301
G1 X60.754 Y92.363 E1.82292
G1 X61.171 Y92.602 E.01301
G1 X61.171 Y159.398 E1.80998
G1 X61.587 Y159.159 E.01301
G1 X61.587 Y92.841 E1.79704
G1 X62.004 Y93.08 E.01301
G1 X62.004 Y158.92 E1.7841
G1 X62.42 Y158.682 E.01301
G1 X62.42 Y93.318 E1.77115
G1 X62.837 Y93.557 E.01301
G1 X62.837 Y158.443 E1.75821
G1 X63.253 Y158.204 E.01301
G1 X63.253 Y93.796 E1.74527
G1 X63.67 Y94.035 E.01301
G1 X63.67 Y157.965 E1.73233
G1 X64.086 Y157.726 E.01301
G1 X64.086 Y94.273 E1.71939
G1 X64.503 Y94.512 E.01301
G1 X64.503 Y157.488 E1.70645
G1 X64.92 Y157.249 E.01301
G1 X64.92 Y94.751 E1.69351
G1 X65.336 Y94.99 E.01301
G1 X65.336 Y157.01 E1.68057
G1 X65.753 Y156.771 E.01301
G1 X65.753 Y95.229 E1.66763
G1 X66.169 Y95.467 E.01301
G1 X66.169 Y156.533 E1.65468
G1 X66.586 Y156.294 E.01301
G1 X66.586 Y95.706 E1.64174
G1 X67.002 Y95.945 E.01301
G1 X67.002 Y156.055 E1.6288
G1 X67.419 Y155.816 E.01301
G1 X67.419 Y96.184 E1.61586
G1 X67.835 Y96.423 E.01301
G1 X67.835 Y155.577 E1.60292
G1 X68.252 Y155.339 E.01301
G1 X68.252 Y96.661 E1.58998
G1 X68.668 Y96.9 E.01301
G1 X68.668 Y155.1 E1.57704
G1 X69.085 Y154.861 E.01301
G1 X69.085 Y97.139 E1.5641
G1 X69.501 Y97.378 E.01301
G1 X69.501 Y154.622 E1.55116
G1 X69.918 Y154.383 E.01301
G1 X69.918 Y97.617 E1.53822
G1 X70.334 Y97.855 E.01301
G1 X70.334 Y154.145 E1.52527
G1 X70.751 Y153.906 E.01301
G1 X70.751 Y98.094 E1.51233
G1 X71.167 Y98.333 E.01301
G1 X71.167 Y153.667 E1.49939
G1 X71.584 Y153.428 E.01301
G1 X71.584 Y98.572 E1.48645
G1 X72.001 Y98.811 E.01301
G1 X72.001 Y153.189 E1.47351
G1 X72.417 Y152.951 E.01301
G1 X72.417 Y99.049 E1.46057
G1 X72.834 Y99.288 E.01301
G1 X72.834 Y152.712 E1.44763
G1 X73.25 Y152.473 E.01301
G1 X73.25 Y99.527 E1.43469
G1 X73.667 Y99.766 E.01301
G1 X73.667 Y152.234 E1.42175
G1 X74.083 Y151.996 E.01301
G1 X74.083 Y100.004 E1.4088
G1 X74.5 Y100.243 E.01301
G1 X74.5 Y151.757 E1.39586
G1 X74.916 Y151.518 E.01301
G1 X74.916 Y100.482 E1.38292
G1 X75.333 Y100.721 E.01301
G1 X75.333 Y151.279 E1.36998
G1 X75.749 Y151.04 E.01301
G1 X75.749 Y100.96 E1.35704
G1 X76.166 Y101.198 E.01301
G1 X76.166 Y150.802 E1.3441
G1 X76.582 Y150.563 E.01301
G1 X76.582 Y101.437 E1.33116
G1 X76.999 Y101.676 E.01301
G1 X76.999 Y150.324 E1.31822
G1 X77.415 Y150.085 E.01301
G1 X77.415 Y101.915 E1.30528
G1 X77.832 Y102.154 E.01301
G1 X77.832 Y149.846 E1.29233
G1 X78.249 Y149.608 E.01301
G1 X78.249 Y102.392 E1.27939
G1 X78.665 Y102.631 E.01301
G1 X78.665 Y149.369 E1.26645
G1 X79.082 Y149.13 E.01301
G1 X79.082 Y102.87 E1.25351
G1 X79.498 Y103.109 E.01301
G1 X79.498 Y148.891 E1.24057
G1 X79.915 Y148.652 E.01301
G1 X79.915 Y103.348 E1.22763
G1 X80.331 Y103.586 E.01301
G1 X80.331 Y148.414 E1.21469
G1 X80.748 Y148.175 E.01301
G1 X80.748 Y103.825 E1.20175
G1 X81.164 Y104.064 E.01301
G1 X81.164 Y147.936 E1.18881
G1 X81.581 Y147.697 E.01301
G1 X81.581 Y104.303 E1.17587
G1 X81.997 Y104.541 E.01301
G1 X81.997 Y147.458 E1.16292
G1 X82.414 Y147.22 E.01301
G1 X82.414 Y104.78 E1.14998
G1 X82.83 Y105.019 E.01301
G1 X82.83 Y146.981 E1.13704
G1 X83.247 Y146.742 E.01301
G1 X83.247 Y105.258 E1.1241
G1 X83.663 Y105.497 E.01301
G1 X83.663 Y146.503 E1.11116
G1 X84.08 Y146.265 E.01301
G1 X84.08 Y105.735 E1.09822
G1 X84.496 Y105.974 E.01301
G1 X84.496 Y146.026 E1.08528
G1 X84.913 Y145.787 E.01301
G1 X84.913 Y106.213 E1.07234
G1 X85.33 Y106.452 E.01301
G1 X85.33 Y145.548 E1.0594
G1 X85.746 Y145.309 E.01301
G1 X85.746 Y106.691 E1.04645
G1 X86.163 Y106.929 E.01301
G1 X86.163 Y145.071 E1.03351
G1 X86.579 Y144.832 E.01301
G1 X86.579 Y107.168 E1.02057
G1 X86.996 Y107.407 E.01301
G1 X86.996 Y144.593 E1.00763
G1 X87.412 Y144.354 E.01301
G1 X87.412 Y107.646 E.99469
G1 X87.829 Y107.885 E.01301
G1 X87.829 Y144.115 E.98175
G1 X88.245 Y143.877 E.01301
G1 X88.245 Y108.123 E.96881
G1 X88.662 Y108.362 E.01301
G1 X88.662 Y143.638 E.95587
G1 X89.078 Y143.399 E.01301
G1 X89.078 Y108.601 E.94293
G1 X89.495 Y108.84 E.01301
G1 X89.495 Y143.16 E.92999
G1 X89.911 Y142.921 E.01301
G1 X89.911 Y109.079 E.91704
G1 X90.328 Y109.317 E.01301
G1 X90.328 Y142.683 E.9041
G1 X90.744 Y142.444 E.01301
G1 X90.744 Y109.556 E.89116
G1 X91.161 Y109.795 E.01301
G1 X91.161 Y142.205 E.87822
G1 X91.577 Y141.966 E.01301
G1 X91.577 Y110.034 E.86528
G1 X91.994 Y110.272 E.01301
G1 X91.994 Y141.728 E.85234
G1 X92.411 Y141.489 E.01301
G1 X92.411 Y110.511 E.8394
G1 X92.827 Y110.75 E.01301
G1 X92.827 Y141.25 E.82646
G1 X93.244 Y141.011 E.01301
G1 X93.244 Y110.989 E.81352
G1 X93.66 Y111.228 E.01301
G1 X93.66 Y140.772 E.80058
G1 X94.077 Y140.534 E.01301
G1 X94.077 Y111.466 E.78763
G1 X94.493 Y111.705 E.01301
G1 X94.493 Y140.295 E.77469
G1 X94.91 Y140.056 E.01301
G1 X94.91 Y111.944 E.76175
G1 X95.326 Y112.183 E.01301
G1 X95.326 Y139.817 E.74881
G1 X95.743 Y139.578 E.01301
G1 X95.743 Y112.422 E.73587
G1 X96.159 Y112.66 E.01301
G1 X96.159 Y139.34 E.72293
G1 X96.576 Y139.101 E.01301
G1 X96.576 Y112.899 E.70999
G1 X96.992 Y113.138 E.01301
G1 X96.992 Y138.862 E.69705
G1 X97.409 Y138.623 E.01301
G1 X97.409 Y113.377 E.68411
G1 X97.825 Y113.616 E.01301
G1 X97.825 Y138.384 E.67116
G1 X98.242 Y138.146 E.01301
G1 X98.242 Y113.854 E.65822
G1 X98.658 Y114.093 E.01301
G1 X98.658 Y137.907 E.64528
G1 X99.075 Y137.668 E.01301
G1 X99.075 Y114.332 E.63234
G1 X99.492 Y114.571 E.01301
G1 X99.492 Y137.429 E.6194
G1 X99.908 Y137.19 E.01301
G1 X99.908 Y114.809 E.60646
G1 X100.325 Y115.048 E.01301
G1 X100.325 Y136.952 E.59352
G1 X100.741 Y136.713 E.01301
G1 X100.741 Y115.287 E.58058
G1 X101.158 Y115.526 E.01301
G1 X101.158 Y136.474 E.56764
G1 X101.574 Y136.235 E.01301
G1 X101.574 Y115.765 E.55469
G1 X101.991 Y116.003 E.01301
G1 X101.991 Y135.997 E.54175
G1 X102.407 Y135.758 E.01301
G1 X102.407 Y116.242 E.52881
G1 X102.824 Y116.481 E.01301
G1 X102.824 Y135.519 E.51587
G1 X103.24 Y135.28 E.01301
G1 X103.24 Y116.72 E.50293
G1 X103.657 Y116.959 E.01301
G1 X103.657 Y135.041 E.48999
G1 X104.073 Y134.803 E.01301
G1 X104.073 Y117.197 E.47705
G1 X104.49 Y117.436 E.01301
G1 X104.49 Y134.564 E.46411
G1 X104.906 Y134.325 E.01301
G1 X104.906 Y117.675 E.45117
G1 X105.323 Y117.914 E.01301
G1 X105.323 Y134.086 E.43823
G1 X105.739 Y133.847 E.01301
G1 X105.739 Y118.153 E.42528
G1 X106.097 Y118.358 E.01118
G1 X106.156 Y118.459 E.00317
G1 X106.156 Y133.824 E.41635
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X106.156 Y131.824 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 465
M625
; layer num/total_layer_count: 11/14
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
M204 S10000
G17
G3 Z2.04 I1.217 J0 P1  F30000
; object ids of layer 11 start: 325,353,381,409,437,465
M624 PwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer11 end: 325,353,381,409,437,465
M625
; OBJECT_ID: 325
; start printing object, unique label id: 325
M624 AQAAAAAAAAA=
G1 X208.606 Y75.179
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X145.649 Y111.271 E1.9664
G1 X133.057 Y104.001 E.39401
G1 X132.108 Y56.59 E1.28495
G1 X208.548 Y75.165 E2.13158
; WIPE_START
G1 X206.813 Y76.16 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.677 Y75.027 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X145.726 Y111.689 E1.85328
G1 X145.571 Y111.688 E.00391
G1 X132.737 Y104.279 E.37257
G1 X132.659 Y104.146 E.00388
G1 X131.699 Y56.198 E1.20571
M73 P77 R16
G1 X131.814 Y56.106 E.00371
G1 X209.619 Y75.012 E2.01303
; WIPE_START
M204 S4000
G1 X207.884 Y76.008 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.634 Y75.542 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.326 Y75.234 E.0118
G1 X206.548 Y75.045 E.0217
G1 X207.123 Y75.619 E.02202
G1 X206.748 Y75.834 E.0117
G1 X205.77 Y74.855 E.0375
G1 X204.992 Y74.666 E.0217
G1 X206.374 Y76.049 E.05297
G1 X206 Y76.263 E.0117
G1 X204.213 Y74.477 E.06844
G1 X203.435 Y74.288 E.0217
G1 X205.625 Y76.478 E.08392
G1 X205.251 Y76.693 E.0117
G1 X202.657 Y74.099 E.09939
G1 X201.879 Y73.91 E.0217
G1 X204.876 Y76.907 E.11486
G1 X204.502 Y77.122 E.0117
G1 X201.1 Y73.721 E.13034
G1 X200.322 Y73.532 E.0217
G1 X204.127 Y77.337 E.14581
G1 X203.753 Y77.551 E.0117
G1 X199.544 Y73.343 E.16129
G1 X198.766 Y73.153 E.0217
G1 X203.378 Y77.766 E.17676
G1 X203.004 Y77.981 E.0117
G1 X197.988 Y72.964 E.19223
G1 X197.209 Y72.775 E.0217
G1 X202.629 Y78.195 E.20771
G1 X202.255 Y78.41 E.0117
G1 X196.431 Y72.586 E.22318
G1 X195.653 Y72.397 E.0217
G1 X201.88 Y78.625 E.23865
G1 X201.506 Y78.839 E.0117
G1 X194.875 Y72.208 E.25413
G1 X194.096 Y72.019 E.0217
G1 X201.132 Y79.054 E.2696
G1 X200.757 Y79.269 E.0117
G1 X193.318 Y71.83 E.28507
G1 X192.54 Y71.641 E.0217
G1 X200.383 Y79.483 E.30055
G1 X200.008 Y79.698 E.0117
G1 X191.762 Y71.451 E.31602
G1 X190.983 Y71.262 E.0217
G1 X199.634 Y79.913 E.33149
G1 X199.259 Y80.127 E.0117
G1 X190.205 Y71.073 E.34697
G1 X189.427 Y70.884 E.0217
G1 X198.885 Y80.342 E.36244
G1 X198.51 Y80.557 E.0117
G1 X188.649 Y70.695 E.37791
G1 X187.87 Y70.506 E.0217
G1 X198.136 Y80.771 E.39339
G1 X197.761 Y80.986 E.0117
G1 X187.092 Y70.317 E.40886
G1 X186.314 Y70.128 E.0217
G1 X197.387 Y81.201 E.42433
G1 X197.013 Y81.415 E.0117
G1 X185.536 Y69.939 E.43981
G1 X184.757 Y69.749 E.0217
G1 X196.638 Y81.63 E.45528
G1 X196.264 Y81.845 E.0117
G1 X183.979 Y69.56 E.47076
G1 X183.201 Y69.371 E.0217
G1 X195.889 Y82.059 E.48623
G1 X195.515 Y82.274 E.0117
G1 X182.423 Y69.182 E.5017
G1 X181.644 Y68.993 E.0217
G1 X195.14 Y82.489 E.51718
G1 X194.766 Y82.703 E.0117
G1 X180.866 Y68.804 E.53265
G1 X180.088 Y68.615 E.0217
G1 X194.391 Y82.918 E.54812
G1 X194.017 Y83.133 E.0117
G1 X179.31 Y68.426 E.5636
G1 X178.531 Y68.236 E.0217
G1 X193.642 Y83.348 E.57907
G1 X193.268 Y83.562 E.0117
G1 X177.753 Y68.047 E.59454
G1 X176.975 Y67.858 E.0217
G1 X192.893 Y83.777 E.61002
G1 X192.519 Y83.992 E.0117
G1 X176.197 Y67.669 E.62549
G1 X175.418 Y67.48 E.0217
G1 X192.145 Y84.206 E.64096
M73 P77 R15
G1 X191.77 Y84.421 E.0117
G1 X174.64 Y67.291 E.65644
G1 X173.862 Y67.102 E.0217
G1 X191.396 Y84.636 E.67191
G1 X191.021 Y84.85 E.0117
G1 X173.084 Y66.913 E.68738
G1 X172.305 Y66.724 E.0217
G1 X190.647 Y85.065 E.70286
G1 X190.272 Y85.28 E.0117
G1 X171.527 Y66.534 E.71833
G1 X170.749 Y66.345 E.0217
G1 X189.898 Y85.494 E.73381
G1 X189.523 Y85.709 E.0117
G1 X169.971 Y66.156 E.74928
G1 X169.192 Y65.967 E.0217
G1 X189.149 Y85.924 E.76475
G1 X188.774 Y86.138 E.0117
G1 X168.414 Y65.778 E.78023
G1 X167.636 Y65.589 E.0217
G1 X188.4 Y86.353 E.7957
G1 X188.025 Y86.568 E.0117
G1 X166.858 Y65.4 E.81117
G1 X166.079 Y65.211 E.0217
G1 X187.651 Y86.782 E.82665
G1 X187.277 Y86.997 E.0117
G1 X165.301 Y65.022 E.84212
G1 X164.523 Y64.832 E.0217
G1 X186.902 Y87.212 E.85759
G1 X186.528 Y87.426 E.0117
G1 X163.745 Y64.643 E.87307
G1 X162.966 Y64.454 E.0217
G1 X186.153 Y87.641 E.88854
G1 X185.779 Y87.856 E.0117
G1 X162.188 Y64.265 E.90401
G1 X161.41 Y64.076 E.0217
G1 X185.404 Y88.07 E.91949
G1 X185.03 Y88.285 E.0117
G1 X160.632 Y63.887 E.93496
G1 X159.853 Y63.698 E.0217
G1 X184.655 Y88.5 E.95043
G1 X184.281 Y88.714 E.0117
G1 X159.075 Y63.509 E.96591
G1 X158.297 Y63.32 E.0217
G1 X183.906 Y88.929 E.98138
G1 X183.532 Y89.144 E.0117
G1 X157.519 Y63.13 E.99685
G1 X156.74 Y62.941 E.0217
G1 X183.157 Y89.358 E1.01233
G1 X182.783 Y89.573 E.0117
G1 X155.962 Y62.752 E1.0278
G1 X155.184 Y62.563 E.0217
G1 X182.409 Y89.788 E1.04328
G1 X182.034 Y90.002 E.0117
G1 X154.406 Y62.374 E1.05875
G1 X153.627 Y62.185 E.0217
G1 X181.66 Y90.217 E1.07422
G1 X181.285 Y90.432 E.0117
G1 X152.849 Y61.996 E1.0897
G1 X152.071 Y61.807 E.0217
G1 X180.911 Y90.646 E1.10517
G1 X180.536 Y90.861 E.0117
G1 X151.293 Y61.617 E1.12064
G1 X150.514 Y61.428 E.0217
G1 X180.162 Y91.076 E1.13612
G1 X179.787 Y91.29 E.0117
G1 X149.736 Y61.239 E1.15159
G1 X148.958 Y61.05 E.0217
G1 X179.413 Y91.505 E1.16706
G1 X179.038 Y91.72 E.0117
G1 X148.18 Y60.861 E1.18254
G1 X147.401 Y60.672 E.0217
G1 X178.664 Y91.934 E1.19801
G1 X178.289 Y92.149 E.0117
G1 X146.623 Y60.483 E1.21348
G1 X145.845 Y60.294 E.0217
G1 X177.915 Y92.364 E1.22896
G1 X177.541 Y92.578 E.0117
G1 X145.067 Y60.105 E1.24443
G1 X144.288 Y59.915 E.0217
G1 X177.166 Y92.793 E1.25991
G1 X176.792 Y93.008 E.0117
G1 X143.51 Y59.726 E1.27538
G1 X142.732 Y59.537 E.0217
G1 X176.417 Y93.222 E1.29085
G1 X176.043 Y93.437 E.0117
G1 X141.954 Y59.348 E1.30633
G1 X141.175 Y59.159 E.0217
G1 X175.668 Y93.652 E1.3218
G1 X175.294 Y93.866 E.0117
G1 X140.397 Y58.97 E1.33727
G1 X139.619 Y58.781 E.0217
G1 X174.919 Y94.081 E1.35275
G1 X174.545 Y94.296 E.0117
G1 X138.841 Y58.592 E1.36822
G1 X138.062 Y58.403 E.0217
G1 X174.17 Y94.51 E1.38369
G1 X173.796 Y94.725 E.0117
G1 X137.284 Y58.213 E1.39917
G1 X136.506 Y58.024 E.0217
G1 X173.422 Y94.94 E1.41464
G1 X173.047 Y95.155 E.0117
G1 X135.728 Y57.835 E1.43011
G1 X134.949 Y57.646 E.0217
G1 X172.673 Y95.369 E1.44559
G1 X172.298 Y95.584 E.0117
G1 X134.171 Y57.457 E1.46106
G1 X133.393 Y57.268 E.0217
G1 X171.924 Y95.799 E1.47653
G1 X171.549 Y96.013 E.0117
G1 X132.615 Y57.079 E1.49201
G1 X132.473 Y57.044 E.00396
G1 X132.483 Y57.536 E.01332
G1 X171.175 Y96.228 E1.48272
G1 X170.8 Y96.443 E.0117
G1 X132.495 Y58.137 E1.46791
G1 X132.507 Y58.738 E.01629
G1 X170.426 Y96.657 E1.4531
G1 X170.051 Y96.872 E.0117
G1 X132.519 Y59.339 E1.43829
G1 X132.531 Y59.94 E.01629
G1 X169.677 Y97.087 E1.42348
G1 X169.302 Y97.301 E.0117
G1 X132.543 Y60.541 E1.40867
G1 X132.555 Y61.143 E.01629
G1 X168.928 Y97.516 E1.39386
G1 X168.554 Y97.731 E.0117
G1 X132.567 Y61.744 E1.37905
G1 X132.579 Y62.345 E.01629
G1 X168.179 Y97.945 E1.36424
G1 X167.805 Y98.16 E.0117
G1 X132.591 Y62.946 E1.34943
G1 X132.603 Y63.547 E.01629
G1 X167.43 Y98.375 E1.33462
G1 X167.056 Y98.589 E.0117
G1 X132.615 Y64.148 E1.31981
G1 X132.627 Y64.75 E.01629
G1 X166.681 Y98.804 E1.305
G1 X166.307 Y99.019 E.0117
G1 X132.639 Y65.351 E1.29019
G1 X132.651 Y65.952 E.01629
G1 X165.932 Y99.233 E1.27538
G1 X165.558 Y99.448 E.0117
G1 X132.663 Y66.553 E1.26056
G1 X132.675 Y67.154 E.01629
G1 X165.183 Y99.663 E1.24575
G1 X164.809 Y99.877 E.0117
G1 X132.687 Y67.755 E1.23094
G1 X132.699 Y68.357 E.01629
G1 X164.434 Y100.092 E1.21613
G1 X164.06 Y100.307 E.0117
G1 X132.711 Y68.958 E1.20132
G1 X132.723 Y69.559 E.01629
G1 X163.686 Y100.521 E1.18651
G1 X163.311 Y100.736 E.0117
G1 X132.735 Y70.16 E1.1717
G1 X132.747 Y70.761 E.01629
G1 X162.937 Y100.951 E1.15689
G1 X162.562 Y101.165 E.0117
G1 X132.759 Y71.362 E1.14208
G1 X132.771 Y71.964 E.01629
G1 X162.188 Y101.38 E1.12727
G1 X161.813 Y101.595 E.0117
G1 X132.783 Y72.565 E1.11246
G1 X132.795 Y73.166 E.01629
G1 X161.439 Y101.809 E1.09765
G1 X161.064 Y102.024 E.0117
G1 X132.807 Y73.767 E1.08284
G1 X132.819 Y74.368 E.01629
G1 X160.69 Y102.239 E1.06803
G1 X160.315 Y102.453 E.0117
G1 X132.831 Y74.969 E1.05322
G1 X132.843 Y75.571 E.01629
G1 X159.941 Y102.668 E1.0384
G1 X159.566 Y102.883 E.0117
G1 X132.855 Y76.172 E1.02359
G1 X132.867 Y76.773 E.01629
G1 X159.192 Y103.097 E1.00878
G1 X158.818 Y103.312 E.0117
G1 X132.879 Y77.374 E.99397
G1 X132.892 Y77.975 E.01629
G1 X158.443 Y103.527 E.97916
G1 X158.069 Y103.741 E.0117
G1 X132.904 Y78.576 E.96435
G1 X132.916 Y79.178 E.01629
G1 X157.694 Y103.956 E.94954
G1 X157.32 Y104.171 E.0117
G1 X132.928 Y79.779 E.93473
G1 X132.94 Y80.38 E.01629
G1 X156.945 Y104.385 E.91992
G1 X156.571 Y104.6 E.0117
G1 X132.952 Y80.981 E.90511
G1 X132.964 Y81.582 E.01629
G1 X156.196 Y104.815 E.8903
G1 X155.822 Y105.029 E.0117
G1 X132.976 Y82.183 E.87549
G1 X132.988 Y82.784 E.01629
G1 X155.447 Y105.244 E.86068
G1 X155.073 Y105.459 E.0117
G1 X133 Y83.386 E.84587
G1 X133.012 Y83.987 E.01629
G1 X154.698 Y105.673 E.83106
G1 X154.324 Y105.888 E.0117
G1 X133.024 Y84.588 E.81624
G1 X133.036 Y85.189 E.01629
G1 X153.95 Y106.103 E.80143
G1 X153.575 Y106.317 E.0117
G1 X133.048 Y85.79 E.78662
G1 X133.06 Y86.391 E.01629
G1 X153.201 Y106.532 E.77181
G1 X152.826 Y106.747 E.0117
G1 X133.072 Y86.993 E.757
G1 X133.084 Y87.594 E.01629
G1 X152.452 Y106.962 E.74219
G1 X152.077 Y107.176 E.0117
G1 X133.096 Y88.195 E.72738
G1 X133.108 Y88.796 E.01629
G1 X151.703 Y107.391 E.71257
G1 X151.328 Y107.606 E.0117
G1 X133.12 Y89.397 E.69776
G1 X133.132 Y89.998 E.01629
G1 X150.954 Y107.82 E.68295
G1 X150.579 Y108.035 E.0117
G1 X133.144 Y90.6 E.66814
G1 X133.156 Y91.201 E.01629
G1 X150.205 Y108.25 E.65333
G1 X149.83 Y108.464 E.0117
G1 X133.168 Y91.802 E.63852
G1 X133.18 Y92.403 E.01629
G1 X149.456 Y108.679 E.62371
G1 X149.082 Y108.894 E.0117
G1 X133.192 Y93.004 E.6089
G1 X133.204 Y93.605 E.01629
G1 X148.707 Y109.108 E.59409
G1 X148.333 Y109.323 E.0117
G1 X133.216 Y94.207 E.57927
G1 X133.228 Y94.808 E.01629
G1 X147.958 Y109.538 E.56446
G1 X147.584 Y109.752 E.0117
G1 X133.24 Y95.409 E.54965
G1 X133.252 Y96.01 E.01629
G1 X147.209 Y109.967 E.53484
G1 X146.835 Y110.182 E.0117
G1 X133.264 Y96.611 E.52003
G1 X133.276 Y97.212 E.01629
G1 X146.46 Y110.396 E.50522
G1 X146.086 Y110.611 E.0117
G1 X133.288 Y97.814 E.49041
G1 X133.3 Y98.415 E.01629
G1 X145.711 Y110.826 E.4756
G1 X145.65 Y110.861 E.00192
G1 X144.485 Y110.188 E.03646
G1 X133.313 Y99.016 E.42813
G1 X133.325 Y99.617 E.01629
G1 X143.091 Y109.383 E.37425
G1 X141.697 Y108.579 E.04361
G1 X133.337 Y100.218 E.32038
G1 X133.349 Y100.819 E.01629
G1 X140.303 Y107.774 E.2665
G1 X138.909 Y106.969 E.04361
G1 X133.361 Y101.42 E.21262
G1 X133.373 Y102.022 E.01629
G1 X137.515 Y106.164 E.15875
G1 X136.121 Y105.359 E.04361
G1 X133.385 Y102.623 E.10487
G1 X133.397 Y103.224 E.01629
G1 X135.238 Y105.066 E.07058
; OBJECT_ID: 353
; WIPE_START
G1 X133.824 Y103.651 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 325
M625
; start printing object, unique label id: 353
M624 AgAAAAAAAAA=
M204 S10000
G1 X139.694 Y108.53 Z2.2 F30000
G1 X215.595 Y171.606 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
M73 P78 R15
G1 X149.58 Y133.761 E2.06191
G1 X149.58 Y118.239 E.42059
G1 X215.595 Y80.394 E2.06192
G1 X215.595 Y171.546 E2.46997
M204 S10000
G1 X215.996 Y172.261 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X215.964 Y172.28 E.00092
G1 X149.258 Y134.038 E1.93314
G1 X149.18 Y133.903 E.00392
G1 X149.18 Y118.097 E.39738
G1 X149.258 Y117.962 E.00392
G1 X215.964 Y79.72 E1.93314
G1 X215.996 Y79.739 E.00092
G1 X215.996 Y172.201 E2.32464
; WIPE_START
M204 S4000
G1 X215.964 Y172.28 E-.03205
G1 X214.302 Y171.327 E-.72795
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X215.24 Y171.208 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X215.24 Y81.007 E2.44417
G1 X214.824 Y81.246 E.01299
G1 X214.824 Y170.754 E2.42541
G1 X214.408 Y170.516 E.01299
G1 X214.408 Y81.484 E2.41248
G1 X213.992 Y81.723 E.01299
G1 X213.992 Y170.277 E2.39956
G1 X213.576 Y170.039 E.01299
G1 X213.576 Y81.961 E2.38664
G1 X213.16 Y82.2 E.01299
G1 X213.16 Y169.8 E2.37372
G1 X212.744 Y169.562 E.01299
G1 X212.744 Y82.438 E2.36079
G1 X212.328 Y82.677 E.01299
G1 X212.328 Y169.323 E2.34787
G1 X211.912 Y169.085 E.01299
G1 X211.912 Y82.915 E2.33495
G1 X211.496 Y83.154 E.01299
G1 X211.496 Y168.846 E2.32202
G1 X211.08 Y168.608 E.01299
G1 X211.08 Y83.392 E2.3091
G1 X210.664 Y83.63 E.01299
G1 X210.664 Y168.37 E2.29618
G1 X210.248 Y168.131 E.01299
G1 X210.248 Y83.869 E2.28326
G1 X209.832 Y84.107 E.01299
G1 X209.832 Y167.893 E2.27033
G1 X209.416 Y167.654 E.01299
G1 X209.416 Y84.346 E2.25741
G1 X209 Y84.584 E.01299
G1 X209 Y167.416 E2.24449
G1 X208.585 Y167.177 E.01299
G1 X208.585 Y84.823 E2.23157
G1 X208.169 Y85.061 E.01299
G1 X208.169 Y166.939 E2.21864
G1 X207.753 Y166.7 E.01299
G1 X207.753 Y85.3 E2.20572
G1 X207.337 Y85.538 E.01299
G1 X207.337 Y166.462 E2.1928
G1 X206.921 Y166.223 E.01299
G1 X206.921 Y85.777 E2.17988
G1 X206.505 Y86.015 E.01299
G1 X206.505 Y165.985 E2.16695
G1 X206.089 Y165.747 E.01299
G1 X206.089 Y86.253 E2.15403
G1 X205.673 Y86.492 E.01299
G1 X205.673 Y165.508 E2.14111
G1 X205.257 Y165.27 E.01299
G1 X205.257 Y86.73 E2.12818
G1 X204.841 Y86.969 E.01299
G1 X204.841 Y165.031 E2.11526
G1 X204.425 Y164.793 E.01299
G1 X204.425 Y87.207 E2.10234
G1 X204.009 Y87.446 E.01299
G1 X204.009 Y164.554 E2.08942
G1 X203.593 Y164.316 E.01299
G1 X203.593 Y87.684 E2.07649
G1 X203.177 Y87.923 E.01299
G1 X203.177 Y164.077 E2.06357
G1 X202.761 Y163.839 E.01299
G1 X202.761 Y88.161 E2.05065
G1 X202.345 Y88.4 E.01299
G1 X202.345 Y163.6 E2.03773
G1 X201.929 Y163.362 E.01299
G1 X201.929 Y88.638 E2.0248
G1 X201.514 Y88.876 E.01299
G1 X201.514 Y163.124 E2.01188
G1 X201.098 Y162.885 E.01299
G1 X201.098 Y89.115 E1.99896
G1 X200.682 Y89.353 E.01299
G1 X200.682 Y162.647 E1.98603
G1 X200.266 Y162.408 E.01299
G1 X200.266 Y89.592 E1.97311
G1 X199.85 Y89.83 E.01299
G1 X199.85 Y162.17 E1.96019
G1 X199.434 Y161.931 E.01299
G1 X199.434 Y90.069 E1.94727
G1 X199.018 Y90.307 E.01299
G1 X199.018 Y161.693 E1.93434
G1 X198.602 Y161.454 E.01299
G1 X198.602 Y90.546 E1.92142
G1 X198.186 Y90.784 E.01299
G1 X198.186 Y161.216 E1.9085
G1 X197.77 Y160.978 E.01299
G1 X197.77 Y91.022 E1.89558
G1 X197.354 Y91.261 E.01299
G1 X197.354 Y160.739 E1.88265
G1 X196.938 Y160.501 E.01299
G1 X196.938 Y91.499 E1.86973
G1 X196.522 Y91.738 E.01299
G1 X196.522 Y160.262 E1.85681
G1 X196.106 Y160.024 E.01299
G1 X196.106 Y91.976 E1.84388
G1 X195.69 Y92.215 E.01299
G1 X195.69 Y159.785 E1.83096
G1 X195.274 Y159.547 E.01299
G1 X195.274 Y92.453 E1.81804
G1 X194.858 Y92.692 E.01299
G1 X194.858 Y159.308 E1.80512
G1 X194.443 Y159.07 E.01299
G1 X194.443 Y92.93 E1.79219
G1 X194.027 Y93.169 E.01299
G1 X194.027 Y158.831 E1.77927
G1 X193.611 Y158.593 E.01299
G1 X193.611 Y93.407 E1.76635
G1 X193.195 Y93.645 E.01299
G1 X193.195 Y158.355 E1.75343
G1 X192.779 Y158.116 E.01299
G1 X192.779 Y93.884 E1.7405
G1 X192.363 Y94.122 E.01299
G1 X192.363 Y157.878 E1.72758
G1 X191.947 Y157.639 E.01299
G1 X191.947 Y94.361 E1.71466
G1 X191.531 Y94.599 E.01299
G1 X191.531 Y157.401 E1.70173
G1 X191.115 Y157.162 E.01299
G1 X191.115 Y94.838 E1.68881
G1 X190.699 Y95.076 E.01299
G1 X190.699 Y156.924 E1.67589
G1 X190.283 Y156.685 E.01299
G1 X190.283 Y95.315 E1.66297
G1 X189.867 Y95.553 E.01299
G1 X189.867 Y156.447 E1.65004
M73 P78 R14
G1 X189.451 Y156.208 E.01299
G1 X189.451 Y95.792 E1.63712
G1 X189.035 Y96.03 E.01299
G1 X189.035 Y155.97 E1.6242
G1 X188.619 Y155.732 E.01299
G1 X188.619 Y96.268 E1.61128
G1 X188.203 Y96.507 E.01299
G1 X188.203 Y155.493 E1.59835
G1 X187.788 Y155.255 E.01299
G1 X187.788 Y96.745 E1.58543
G1 X187.372 Y96.984 E.01299
G1 X187.372 Y155.016 E1.57251
G1 X186.956 Y154.778 E.01299
G1 X186.956 Y97.222 E1.55958
G1 X186.54 Y97.461 E.01299
G1 X186.54 Y154.539 E1.54666
G1 X186.124 Y154.301 E.01299
G1 X186.124 Y97.699 E1.53374
G1 X185.708 Y97.938 E.01299
G1 X185.708 Y154.062 E1.52082
G1 X185.292 Y153.824 E.01299
G1 X185.292 Y98.176 E1.50789
G1 X184.876 Y98.415 E.01299
G1 X184.876 Y153.585 E1.49497
G1 X184.46 Y153.347 E.01299
G1 X184.46 Y98.653 E1.48205
G1 X184.044 Y98.891 E.01299
G1 X184.044 Y153.109 E1.46913
G1 X183.628 Y152.87 E.01299
G1 X183.628 Y99.13 E1.4562
G1 X183.212 Y99.368 E.01299
G1 X183.212 Y152.632 E1.44328
G1 X182.796 Y152.393 E.01299
G1 X182.796 Y99.607 E1.43036
G1 X182.38 Y99.845 E.01299
G1 X182.38 Y152.155 E1.41743
G1 X181.964 Y151.916 E.01299
G1 X181.964 Y100.084 E1.40451
G1 X181.548 Y100.322 E.01299
G1 X181.548 Y151.678 E1.39159
G1 X181.132 Y151.439 E.01299
G1 X181.132 Y100.561 E1.37867
G1 X180.717 Y100.799 E.01299
G1 X180.717 Y151.201 E1.36574
G1 X180.301 Y150.963 E.01299
G1 X180.301 Y101.037 E1.35282
G1 X179.885 Y101.276 E.01299
G1 X179.885 Y150.724 E1.3399
G1 X179.469 Y150.486 E.01299
G1 X179.469 Y101.514 E1.32698
G1 X179.053 Y101.753 E.01299
G1 X179.053 Y150.247 E1.31405
G1 X178.637 Y150.009 E.01299
G1 X178.637 Y101.991 E1.30113
G1 X178.221 Y102.23 E.01299
G1 X178.221 Y149.77 E1.28821
G1 X177.805 Y149.532 E.01299
G1 X177.805 Y102.468 E1.27528
G1 X177.389 Y102.707 E.01299
G1 X177.389 Y149.293 E1.26236
G1 X176.973 Y149.055 E.01299
G1 X176.973 Y102.945 E1.24944
G1 X176.557 Y103.184 E.01299
G1 X176.557 Y148.816 E1.23652
G1 X176.141 Y148.578 E.01299
G1 X176.141 Y103.422 E1.22359
G1 X175.725 Y103.66 E.01299
G1 X175.725 Y148.34 E1.21067
G1 X175.309 Y148.101 E.01299
G1 X175.309 Y103.899 E1.19775
G1 X174.893 Y104.137 E.01299
G1 X174.893 Y147.863 E1.18483
G1 X174.477 Y147.624 E.01299
G1 X174.477 Y104.376 E1.1719
G1 X174.061 Y104.614 E.01299
G1 X174.061 Y147.386 E1.15898
G1 X173.646 Y147.147 E.01299
G1 X173.646 Y104.853 E1.14606
M73 P79 R14
G1 X173.23 Y105.091 E.01299
G1 X173.23 Y146.909 E1.13313
G1 X172.814 Y146.67 E.01299
G1 X172.814 Y105.33 E1.12021
G1 X172.398 Y105.568 E.01299
G1 X172.398 Y146.432 E1.10729
G1 X171.982 Y146.193 E.01299
G1 X171.982 Y105.807 E1.09437
G1 X171.566 Y106.045 E.01299
G1 X171.566 Y145.955 E1.08144
G1 X171.15 Y145.717 E.01299
G1 X171.15 Y106.283 E1.06852
G1 X170.734 Y106.522 E.01299
G1 X170.734 Y145.478 E1.0556
G1 X170.318 Y145.24 E.01299
G1 X170.318 Y106.76 E1.04268
G1 X169.902 Y106.999 E.01299
G1 X169.902 Y145.001 E1.02975
G1 X169.486 Y144.763 E.01299
G1 X169.486 Y107.237 E1.01683
G1 X169.07 Y107.476 E.01299
G1 X169.07 Y144.524 E1.00391
G1 X168.654 Y144.286 E.01299
G1 X168.654 Y107.714 E.99099
G1 X168.238 Y107.953 E.01299
G1 X168.238 Y144.047 E.97806
G1 X167.822 Y143.809 E.01299
G1 X167.822 Y108.191 E.96514
G1 X167.406 Y108.43 E.01299
G1 X167.406 Y143.57 E.95222
G1 X166.991 Y143.332 E.01299
G1 X166.991 Y108.668 E.93929
G1 X166.575 Y108.906 E.01299
G1 X166.575 Y143.094 E.92637
G1 X166.159 Y142.855 E.01299
G1 X166.159 Y109.145 E.91345
G1 X165.743 Y109.383 E.01299
G1 X165.743 Y142.617 E.90053
G1 X165.327 Y142.378 E.01299
G1 X165.327 Y109.622 E.8876
G1 X164.911 Y109.86 E.01299
G1 X164.911 Y142.14 E.87468
G1 X164.495 Y141.901 E.01299
G1 X164.495 Y110.099 E.86176
G1 X164.079 Y110.337 E.01299
G1 X164.079 Y141.663 E.84883
G1 X163.663 Y141.424 E.01299
G1 X163.663 Y110.576 E.83591
G1 X163.247 Y110.814 E.01299
G1 X163.247 Y141.186 E.82299
G1 X162.831 Y140.948 E.01299
G1 X162.831 Y111.052 E.81007
G1 X162.415 Y111.291 E.01299
G1 X162.415 Y140.709 E.79714
G1 X161.999 Y140.471 E.01299
G1 X161.999 Y111.529 E.78422
G1 X161.583 Y111.768 E.01299
G1 X161.583 Y140.232 E.7713
G1 X161.167 Y139.994 E.01299
G1 X161.167 Y112.006 E.75838
G1 X160.751 Y112.245 E.01299
G1 X160.751 Y139.755 E.74545
G1 X160.335 Y139.517 E.01299
G1 X160.335 Y112.483 E.73253
G1 X159.92 Y112.722 E.01299
G1 X159.92 Y139.278 E.71961
G1 X159.504 Y139.04 E.01299
G1 X159.504 Y112.96 E.70669
G1 X159.088 Y113.199 E.01299
G1 X159.088 Y138.801 E.69376
G1 X158.672 Y138.563 E.01299
G1 X158.672 Y113.437 E.68084
G1 X158.256 Y113.675 E.01299
G1 X158.256 Y138.325 E.66792
G1 X157.84 Y138.086 E.01299
G1 X157.84 Y113.914 E.65499
G1 X157.424 Y114.152 E.01299
G1 X157.424 Y137.848 E.64207
G1 X157.008 Y137.609 E.01299
G1 X157.008 Y114.391 E.62915
G1 X156.592 Y114.629 E.01299
G1 X156.592 Y137.371 E.61623
G1 X156.176 Y137.132 E.01299
G1 X156.176 Y114.868 E.6033
G1 X155.76 Y115.106 E.01299
G1 X155.76 Y136.894 E.59038
G1 X155.344 Y136.655 E.01299
G1 X155.344 Y115.345 E.57746
G1 X154.928 Y115.583 E.01299
G1 X154.928 Y136.417 E.56454
G1 X154.512 Y136.178 E.01299
G1 X154.512 Y115.822 E.55161
G1 X154.096 Y116.06 E.01299
G1 X154.096 Y135.94 E.53869
G1 X153.68 Y135.702 E.01299
G1 X153.68 Y116.298 E.52577
G1 X153.264 Y116.537 E.01299
G1 X153.264 Y135.463 E.51284
G1 X152.849 Y135.225 E.01299
G1 X152.849 Y116.775 E.49992
G1 X152.433 Y117.014 E.01299
G1 X152.433 Y134.986 E.487
G1 X152.017 Y134.748 E.01299
G1 X152.017 Y117.252 E.47408
G1 X151.601 Y117.491 E.01299
G1 X151.601 Y134.509 E.46115
G1 X151.185 Y134.271 E.01299
G1 X151.185 Y117.729 E.44823
G1 X150.769 Y117.968 E.01299
G1 X150.769 Y134.032 E.43531
G1 X150.353 Y133.794 E.01299
G1 X150.353 Y118.206 E.42239
G1 X149.937 Y118.445 E.01299
G1 X149.937 Y133.771 E.4153
; OBJECT_ID: 381
; WIPE_START
G1 X149.937 Y131.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 353
M625
; start printing object, unique label id: 381
M624 BAAAAAAAAAA=
M204 S10000
G1 X155.991 Y136.419 Z2.2 F30000
G1 X208.606 Y176.821 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X132.108 Y195.41 E2.1332
G1 X133.057 Y147.999 E1.28495
G1 X145.649 Y140.729 E.39401
G1 X208.554 Y176.791 E1.96477
; WIPE_START
G1 X206.611 Y177.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.677 Y176.973 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X131.814 Y195.894 E2.01454
G1 X131.699 Y195.802 E.00371
G1 X132.659 Y147.854 E1.20571
G1 X132.737 Y147.721 E.00388
G1 X145.571 Y140.312 E.37257
G1 X145.726 Y140.311 E.00391
G1 X145.804 Y140.356 E.00226
G1 X209.625 Y176.943 E1.84951
; WIPE_START
M204 S4000
G1 X207.682 Y177.417 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.072 Y177.021 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.497 Y176.595 E.01629
G1 X207.123 Y176.381 E.0117
G1 X206.548 Y176.955 E.02202
G1 X205.77 Y177.145 E.0217
G1 X206.748 Y176.166 E.0375
G1 X206.374 Y175.951 E.0117
G1 X204.992 Y177.334 E.05297
G1 X204.213 Y177.523 E.0217
G1 X206 Y175.737 E.06844
G1 X205.625 Y175.522 E.0117
G1 X203.435 Y177.712 E.08392
G1 X202.657 Y177.901 E.0217
G1 X205.251 Y175.307 E.09939
G1 X204.876 Y175.093 E.0117
G1 X201.879 Y178.09 E.11486
G1 X201.1 Y178.279 E.0217
G1 X204.502 Y174.878 E.13034
G1 X204.127 Y174.663 E.0117
G1 X200.322 Y178.468 E.14581
G1 X199.544 Y178.657 E.0217
G1 X203.753 Y174.449 E.16129
G1 X203.378 Y174.234 E.0117
G1 X198.766 Y178.847 E.17676
G1 X197.987 Y179.036 E.0217
G1 X203.004 Y174.019 E.19223
G1 X202.629 Y173.805 E.0117
G1 X197.209 Y179.225 E.20771
G1 X196.431 Y179.414 E.0217
G1 X202.255 Y173.59 E.22318
G1 X201.88 Y173.375 E.0117
G1 X195.653 Y179.603 E.23865
G1 X194.874 Y179.792 E.0217
G1 X201.506 Y173.161 E.25413
G1 X201.132 Y172.946 E.0117
G1 X194.096 Y179.981 E.2696
G1 X193.318 Y180.17 E.0217
G1 X200.757 Y172.731 E.28507
G1 X200.383 Y172.517 E.0117
G1 X192.54 Y180.359 E.30055
G1 X191.762 Y180.549 E.0217
G1 X200.008 Y172.302 E.31602
G1 X199.634 Y172.087 E.0117
G1 X190.983 Y180.738 E.33149
G1 X190.205 Y180.927 E.0217
G1 X199.259 Y171.873 E.34697
G1 X198.885 Y171.658 E.0117
G1 X189.427 Y181.116 E.36244
G1 X188.649 Y181.305 E.0217
G1 X198.51 Y171.443 E.37791
G1 X198.136 Y171.229 E.0117
G1 X187.87 Y181.494 E.39339
G1 X187.092 Y181.683 E.0217
G1 X197.761 Y171.014 E.40886
G1 X197.387 Y170.799 E.0117
G1 X186.314 Y181.872 E.42434
G1 X185.536 Y182.061 E.0217
G1 X197.012 Y170.585 E.43981
G1 X196.638 Y170.37 E.0117
G1 X184.757 Y182.251 E.45528
G1 X183.979 Y182.44 E.0217
G1 X196.264 Y170.155 E.47076
G1 X195.889 Y169.941 E.0117
G1 X183.201 Y182.629 E.48623
G1 X182.423 Y182.818 E.0217
G1 X195.515 Y169.726 E.5017
G1 X195.14 Y169.511 E.0117
G1 X181.644 Y183.007 E.51718
G1 X180.866 Y183.196 E.0217
G1 X194.766 Y169.297 E.53265
G1 X194.391 Y169.082 E.0117
G1 X180.088 Y183.385 E.54812
G1 X179.31 Y183.574 E.0217
G1 X194.017 Y168.867 E.5636
G1 X193.642 Y168.652 E.0117
G1 X178.531 Y183.764 E.57907
G1 X177.753 Y183.953 E.0217
G1 X193.268 Y168.438 E.59454
G1 X192.893 Y168.223 E.0117
G1 X176.975 Y184.142 E.61002
G1 X176.197 Y184.331 E.0217
G1 X192.519 Y168.008 E.62549
G1 X192.145 Y167.794 E.0117
G1 X175.418 Y184.52 E.64096
G1 X174.64 Y184.709 E.0217
G1 X191.77 Y167.579 E.65644
G1 X191.396 Y167.364 E.0117
G1 X173.862 Y184.898 E.67191
G1 X173.084 Y185.087 E.0217
G1 X191.021 Y167.15 E.68739
G1 X190.647 Y166.935 E.0117
G1 X172.305 Y185.276 E.70286
G1 X171.527 Y185.466 E.0217
G1 X190.272 Y166.72 E.71833
G1 X189.898 Y166.506 E.0117
G1 X170.749 Y185.655 E.73381
G1 X169.971 Y185.844 E.0217
G1 X189.523 Y166.291 E.74928
G1 X189.149 Y166.076 E.0117
G1 X169.192 Y186.033 E.76475
G1 X168.414 Y186.222 E.0217
G1 X188.774 Y165.862 E.78023
G1 X188.4 Y165.647 E.0117
G1 X167.636 Y186.411 E.7957
G1 X166.858 Y186.6 E.0217
G1 X188.025 Y165.432 E.81117
G1 X187.651 Y165.218 E.0117
G1 X166.079 Y186.789 E.82665
G1 X165.301 Y186.978 E.0217
G1 X187.277 Y165.003 E.84212
G1 X186.902 Y164.788 E.0117
G1 X164.523 Y187.168 E.85759
G1 X163.745 Y187.357 E.0217
G1 X186.528 Y164.574 E.87307
G1 X186.153 Y164.359 E.0117
G1 X162.966 Y187.546 E.88854
G1 X162.188 Y187.735 E.0217
G1 X185.779 Y164.144 E.90401
G1 X185.404 Y163.93 E.0117
G1 X161.41 Y187.924 E.91949
G1 X160.632 Y188.113 E.0217
G1 X185.03 Y163.715 E.93496
G1 X184.655 Y163.5 E.0117
G1 X159.853 Y188.302 E.95044
G1 X159.075 Y188.491 E.0217
G1 X184.281 Y163.286 E.96591
G1 X183.906 Y163.071 E.0117
G1 X158.297 Y188.681 E.98138
G1 X157.519 Y188.87 E.0217
G1 X183.532 Y162.856 E.99686
G1 X183.157 Y162.642 E.0117
G1 X156.74 Y189.059 E1.01233
G1 X155.962 Y189.248 E.0217
G1 X182.783 Y162.427 E1.0278
G1 X182.409 Y162.212 E.0117
G1 X155.184 Y189.437 E1.04328
G1 X154.406 Y189.626 E.0217
G1 X182.034 Y161.998 E1.05875
G1 X181.66 Y161.783 E.0117
G1 X153.627 Y189.815 E1.07422
G1 X152.849 Y190.004 E.0217
G1 X181.285 Y161.568 E1.0897
G1 X180.911 Y161.354 E.0117
G1 X152.071 Y190.193 E1.10517
G1 X151.293 Y190.383 E.0217
G1 X180.536 Y161.139 E1.12064
G1 X180.162 Y160.924 E.0117
G1 X150.514 Y190.572 E1.13612
G1 X149.736 Y190.761 E.0217
G1 X179.787 Y160.71 E1.15159
G1 X179.413 Y160.495 E.0117
G1 X148.958 Y190.95 E1.16707
G1 X148.18 Y191.139 E.0217
G1 X179.038 Y160.28 E1.18254
G1 X178.664 Y160.066 E.0117
G1 X147.401 Y191.328 E1.19801
G1 X146.623 Y191.517 E.0217
G1 X178.289 Y159.851 E1.21349
G1 X177.915 Y159.636 E.0117
G1 X145.845 Y191.706 E1.22896
G1 X145.067 Y191.895 E.0217
G1 X177.541 Y159.422 E1.24443
G1 X177.166 Y159.207 E.0117
G1 X144.288 Y192.085 E1.25991
G1 X143.51 Y192.274 E.0217
G1 X176.792 Y158.992 E1.27538
G1 X176.417 Y158.778 E.0117
G1 X142.732 Y192.463 E1.29085
G1 X141.954 Y192.652 E.0217
G1 X176.043 Y158.563 E1.30633
G1 X175.668 Y158.348 E.0117
G1 X141.175 Y192.841 E1.3218
G1 X140.397 Y193.03 E.0217
G1 X175.294 Y158.134 E1.33727
G1 X174.919 Y157.919 E.0117
G1 X139.619 Y193.219 E1.35275
G1 X138.841 Y193.408 E.0217
G1 X174.545 Y157.704 E1.36822
G1 X174.17 Y157.49 E.0117
G1 X138.062 Y193.597 E1.38369
G1 X137.284 Y193.787 E.0217
G1 X173.796 Y157.275 E1.39917
G1 X173.421 Y157.06 E.0117
G1 X136.506 Y193.976 E1.41464
G1 X135.728 Y194.165 E.0217
G1 X173.047 Y156.845 E1.43012
G1 X172.673 Y156.631 E.0117
G1 X134.949 Y194.354 E1.44559
G1 X134.171 Y194.543 E.0217
G1 X172.298 Y156.416 E1.46106
G1 X171.924 Y156.201 E.0117
G1 X133.393 Y194.732 E1.47654
G1 X132.615 Y194.921 E.0217
G1 X171.549 Y155.987 E1.49201
G1 X171.175 Y155.772 E.0117
G1 X132.483 Y194.464 E1.48272
G1 X132.495 Y193.863 E.01629
G1 X170.8 Y155.557 E1.46791
G1 X170.426 Y155.343 E.0117
G1 X132.507 Y193.262 E1.4531
G1 X132.519 Y192.661 E.01629
G1 X170.051 Y155.128 E1.43829
G1 X169.677 Y154.913 E.0117
G1 X132.531 Y192.06 E1.42348
G1 X132.543 Y191.458 E.01629
G1 X169.302 Y154.699 E1.40867
G1 X168.928 Y154.484 E.0117
G1 X132.555 Y190.857 E1.39386
G1 X132.567 Y190.256 E.01629
G1 X168.554 Y154.269 E1.37905
G1 X168.179 Y154.055 E.0117
G1 X132.579 Y189.655 E1.36424
G1 X132.591 Y189.054 E.01629
G1 X167.805 Y153.84 E1.34943
G1 X167.43 Y153.625 E.0117
G1 X132.603 Y188.453 E1.33462
G1 X132.615 Y187.852 E.01629
G1 X167.056 Y153.411 E1.31981
G1 X166.681 Y153.196 E.0117
G1 X132.627 Y187.25 E1.305
G1 X132.639 Y186.649 E.01629
G1 X166.307 Y152.981 E1.29019
G1 X165.932 Y152.767 E.0117
G1 X132.651 Y186.048 E1.27538
G1 X132.663 Y185.447 E.01629
G1 X165.558 Y152.552 E1.26056
G1 X165.183 Y152.337 E.0117
G1 X132.675 Y184.846 E1.24575
G1 X132.687 Y184.245 E.01629
G1 X164.809 Y152.123 E1.23094
M73 P80 R14
G1 X164.434 Y151.908 E.0117
G1 X132.699 Y183.643 E1.21613
G1 X132.711 Y183.042 E.01629
G1 X164.06 Y151.693 E1.20132
G1 X163.686 Y151.479 E.0117
G1 X132.723 Y182.441 E1.18651
G1 X132.735 Y181.84 E.01629
G1 X163.311 Y151.264 E1.1717
G1 X162.937 Y151.049 E.0117
G1 X132.747 Y181.239 E1.15689
G1 X132.759 Y180.638 E.01629
G1 X162.562 Y150.835 E1.14208
G1 X162.188 Y150.62 E.0117
G1 X132.771 Y180.036 E1.12727
G1 X132.783 Y179.435 E.01629
G1 X161.813 Y150.405 E1.11246
G1 X161.439 Y150.191 E.0117
G1 X132.795 Y178.834 E1.09765
M73 P80 R13
G1 X132.807 Y178.233 E.01629
G1 X161.064 Y149.976 E1.08284
G1 X160.69 Y149.761 E.0117
G1 X132.819 Y177.632 E1.06803
G1 X132.831 Y177.031 E.01629
G1 X160.315 Y149.547 E1.05321
G1 X159.941 Y149.332 E.0117
G1 X132.843 Y176.429 E1.0384
G1 X132.855 Y175.828 E.01629
G1 X159.566 Y149.117 E1.02359
G1 X159.192 Y148.903 E.0117
G1 X132.867 Y175.227 E1.00878
G1 X132.879 Y174.626 E.01629
G1 X158.818 Y148.688 E.99397
G1 X158.443 Y148.473 E.0117
G1 X132.892 Y174.025 E.97916
G1 X132.904 Y173.424 E.01629
G1 X158.069 Y148.259 E.96435
G1 X157.694 Y148.044 E.0117
G1 X132.916 Y172.822 E.94954
G1 X132.928 Y172.221 E.01629
G1 X157.32 Y147.829 E.93473
G1 X156.945 Y147.615 E.0117
G1 X132.94 Y171.62 E.91992
G1 X132.952 Y171.019 E.01629
G1 X156.571 Y147.4 E.90511
G1 X156.196 Y147.185 E.0117
G1 X132.964 Y170.418 E.8903
G1 X132.976 Y169.817 E.01629
G1 X155.822 Y146.971 E.87549
G1 X155.447 Y146.756 E.0117
G1 X132.988 Y169.215 E.86068
G1 X133 Y168.614 E.01629
G1 X155.073 Y146.541 E.84587
G1 X154.698 Y146.327 E.0117
G1 X133.012 Y168.013 E.83106
G1 X133.024 Y167.412 E.01629
G1 X154.324 Y146.112 E.81624
G1 X153.95 Y145.897 E.0117
G1 X133.036 Y166.811 E.80143
G1 X133.048 Y166.21 E.01629
G1 X153.575 Y145.682 E.78662
G1 X153.201 Y145.468 E.0117
G1 X133.06 Y165.609 E.77181
G1 X133.072 Y165.007 E.01629
G1 X152.826 Y145.253 E.757
G1 X152.452 Y145.038 E.0117
G1 X133.084 Y164.406 E.74219
G1 X133.096 Y163.805 E.01629
G1 X152.077 Y144.824 E.72738
G1 X151.703 Y144.609 E.0117
G1 X133.108 Y163.204 E.71257
G1 X133.12 Y162.603 E.01629
G1 X151.328 Y144.394 E.69776
G1 X150.954 Y144.18 E.0117
G1 X133.132 Y162.002 E.68295
G1 X133.144 Y161.4 E.01629
G1 X150.579 Y143.965 E.66814
G1 X150.205 Y143.75 E.0117
G1 X133.156 Y160.799 E.65333
G1 X133.168 Y160.198 E.01629
G1 X149.83 Y143.536 E.63852
G1 X149.456 Y143.321 E.0117
G1 X133.18 Y159.597 E.62371
G1 X133.192 Y158.996 E.01629
G1 X149.082 Y143.106 E.6089
G1 X148.707 Y142.892 E.0117
G1 X133.204 Y158.395 E.59408
G1 X133.216 Y157.793 E.01629
G1 X148.333 Y142.677 E.57927
G1 X147.958 Y142.462 E.0117
G1 X133.228 Y157.192 E.56446
G1 X133.24 Y156.591 E.01629
G1 X147.584 Y142.248 E.54965
G1 X147.209 Y142.033 E.0117
G1 X133.252 Y155.99 E.53484
G1 X133.264 Y155.389 E.01629
G1 X146.835 Y141.818 E.52003
G1 X146.46 Y141.604 E.0117
G1 X133.276 Y154.788 E.50522
G1 X133.288 Y154.186 E.01629
G1 X146.086 Y141.389 E.49041
G1 X145.711 Y141.174 E.0117
G1 X133.3 Y153.585 E.4756
G1 X133.313 Y152.984 E.01629
G1 X144.485 Y141.812 E.42813
G1 X143.091 Y142.617 E.04361
G1 X133.325 Y152.383 E.37425
G1 X133.337 Y151.782 E.01629
G1 X141.697 Y143.421 E.32038
G1 X140.303 Y144.226 E.04361
G1 X133.349 Y151.181 E.2665
G1 X133.361 Y150.579 E.01629
G1 X138.909 Y145.031 E.21262
G1 X137.515 Y145.836 E.04361
G1 X133.373 Y149.978 E.15875
G1 X133.385 Y149.377 E.01629
G1 X136.121 Y146.641 E.10487
G1 X134.727 Y147.445 E.04361
G1 X133.206 Y148.967 E.05831
; OBJECT_ID: 409
; WIPE_START
G1 X134.62 Y147.553 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 381
M625
; start printing object, unique label id: 409
M624 CAAAAAAAAAA=
M204 S10000
G1 X127.384 Y149.981 Z2.2 F30000
G1 X47.394 Y176.821 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X110.351 Y140.729 E1.9664
G1 X122.943 Y147.999 E.39401
G1 X123.892 Y195.41 E1.28496
G1 X47.452 Y176.835 E2.13158
; WIPE_START
G1 X49.187 Y175.84 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.323 Y176.973 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X110.274 Y140.311 E1.85328
G1 X110.331 Y140.311 E.00143
G1 X110.429 Y140.312 E.00248
G1 X123.263 Y147.721 E.37257
G1 X123.341 Y147.854 E.00388
G1 X124.301 Y195.802 E1.20571
G1 X124.186 Y195.894 E.00371
G1 X46.381 Y176.987 E2.01303
; WIPE_START
M204 S4000
G1 X48.116 Y175.992 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.929 Y177.021 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.503 Y176.595 E.01631
G1 X48.877 Y176.38 E.0117
G1 X49.453 Y176.956 E.02204
G1 X50.231 Y177.145 E.0217
G1 X49.252 Y176.166 E.03751
G1 X49.626 Y175.951 E.0117
G1 X51.009 Y177.334 E.05299
G1 X51.787 Y177.523 E.0217
G1 X50.001 Y175.736 E.06846
G1 X50.375 Y175.522 E.0117
G1 X52.566 Y177.712 E.08393
G1 X53.344 Y177.901 E.0217
G1 X50.75 Y175.307 E.09941
G1 X51.124 Y175.092 E.0117
G1 X54.122 Y178.09 E.11488
G1 X54.9 Y178.279 E.0217
G1 X51.499 Y174.878 E.13035
G1 X51.873 Y174.663 E.0117
G1 X55.679 Y178.469 E.14583
G1 X56.457 Y178.658 E.0217
G1 X52.248 Y174.448 E.1613
G1 X52.622 Y174.234 E.0117
G1 X57.235 Y178.847 E.17677
G1 X58.013 Y179.036 E.0217
G1 X52.997 Y174.019 E.19225
G1 X53.371 Y173.804 E.0117
G1 X58.792 Y179.225 E.20772
G1 X59.57 Y179.414 E.0217
G1 X53.745 Y173.59 E.2232
G1 X54.12 Y173.375 E.0117
G1 X60.348 Y179.603 E.23867
G1 X61.126 Y179.792 E.0217
G1 X54.494 Y173.16 E.25414
G1 X54.869 Y172.946 E.0117
G1 X61.905 Y179.981 E.26962
G1 X62.683 Y180.171 E.0217
G1 X55.243 Y172.731 E.28509
G1 X55.618 Y172.516 E.0117
G1 X63.461 Y180.36 E.30056
G1 X64.239 Y180.549 E.0217
G1 X55.992 Y172.302 E.31604
G1 X56.367 Y172.087 E.0117
G1 X65.018 Y180.738 E.33151
G1 X65.796 Y180.927 E.0217
G1 X56.741 Y171.872 E.34698
G1 X57.116 Y171.658 E.0117
G1 X66.574 Y181.116 E.36246
G1 X67.352 Y181.305 E.0217
G1 X57.49 Y171.443 E.37793
G1 X57.865 Y171.228 E.0117
G1 X68.131 Y181.494 E.3934
G1 X68.909 Y181.683 E.0217
G1 X58.239 Y171.014 E.40888
G1 X58.613 Y170.799 E.0117
G1 X69.687 Y181.873 E.42435
G1 X70.465 Y182.062 E.0217
G1 X58.988 Y170.584 E.43983
G1 X59.362 Y170.37 E.0117
G1 X71.244 Y182.251 E.4553
G1 X72.022 Y182.44 E.0217
G1 X59.737 Y170.155 E.47077
G1 X60.111 Y169.94 E.0117
G1 X72.8 Y182.629 E.48625
G1 X73.578 Y182.818 E.0217
G1 X60.486 Y169.726 E.50172
G1 X60.86 Y169.511 E.0117
G1 X74.357 Y183.007 E.51719
G1 X75.135 Y183.196 E.0217
G1 X61.235 Y169.296 E.53267
G1 X61.609 Y169.082 E.0117
G1 X75.913 Y183.386 E.54814
G1 X76.691 Y183.575 E.0217
G1 X61.984 Y168.867 E.56361
G1 X62.358 Y168.652 E.0117
G1 X77.47 Y183.764 E.57909
G1 X78.248 Y183.953 E.0217
G1 X62.733 Y168.438 E.59456
G1 X63.107 Y168.223 E.0117
G1 X79.026 Y184.142 E.61003
G1 X79.804 Y184.331 E.0217
G1 X63.481 Y168.008 E.62551
G1 X63.856 Y167.794 E.0117
G1 X80.583 Y184.52 E.64098
G1 X81.361 Y184.709 E.0217
G1 X64.23 Y167.579 E.65646
G1 X64.605 Y167.364 E.0117
G1 X82.139 Y184.898 E.67193
G1 X82.917 Y185.088 E.0217
G1 X64.979 Y167.15 E.6874
G1 X65.354 Y166.935 E.0117
G1 X83.696 Y185.277 E.70288
G1 X84.474 Y185.466 E.0217
G1 X65.728 Y166.72 E.71835
G1 X66.103 Y166.506 E.0117
G1 X85.252 Y185.655 E.73382
G1 X86.03 Y185.844 E.0217
G1 X66.477 Y166.291 E.7493
G1 X66.852 Y166.076 E.0117
G1 X86.808 Y186.033 E.76477
G1 X87.587 Y186.222 E.0217
G1 X67.226 Y165.862 E.78024
G1 X67.6 Y165.647 E.0117
G1 X88.365 Y186.411 E.79572
G1 X89.143 Y186.6 E.0217
G1 X67.975 Y165.432 E.81119
G1 X68.349 Y165.217 E.0117
G1 X89.921 Y186.79 E.82666
G1 X90.7 Y186.979 E.0217
G1 X68.724 Y165.003 E.84214
G1 X69.098 Y164.788 E.0117
G1 X91.478 Y187.168 E.85761
G1 X92.256 Y187.357 E.0217
G1 X69.473 Y164.573 E.87308
G1 X69.847 Y164.359 E.0117
G1 X93.034 Y187.546 E.88856
G1 X93.813 Y187.735 E.0217
G1 X70.222 Y164.144 E.90403
G1 X70.596 Y163.929 E.0117
G1 X94.591 Y187.924 E.91951
G1 X95.369 Y188.113 E.0217
G1 X70.971 Y163.715 E.93498
G1 X71.345 Y163.5 E.0117
G1 X96.147 Y188.302 E.95045
G1 X96.926 Y188.492 E.0217
G1 X71.72 Y163.285 E.96593
G1 X72.094 Y163.071 E.0117
G1 X97.704 Y188.681 E.9814
G1 X98.482 Y188.87 E.0217
G1 X72.468 Y162.856 E.99687
G1 X72.843 Y162.641 E.0117
G1 X99.26 Y189.059 E1.01235
G1 X100.039 Y189.248 E.0217
G1 X73.217 Y162.427 E1.02782
G1 X73.592 Y162.212 E.0117
G1 X100.817 Y189.437 E1.04329
G1 X101.595 Y189.626 E.0217
G1 X73.966 Y161.997 E1.05877
G1 X74.341 Y161.783 E.0117
G1 X102.373 Y189.815 E1.07424
G1 X103.152 Y190.005 E.0217
G1 X74.715 Y161.568 E1.08972
G1 X75.09 Y161.353 E.0117
G1 X103.93 Y190.194 E1.10519
G1 X104.708 Y190.383 E.0217
G1 X75.464 Y161.139 E1.12066
G1 X75.839 Y160.924 E.0117
G1 X105.486 Y190.572 E1.13614
G1 X106.265 Y190.761 E.0217
G1 X76.213 Y160.709 E1.15161
G1 X76.588 Y160.495 E.0117
G1 X107.043 Y190.95 E1.16708
G1 X107.821 Y191.139 E.0217
G1 X76.962 Y160.28 E1.18256
G1 X77.336 Y160.065 E.0117
G1 X108.599 Y191.328 E1.19803
G1 X109.378 Y191.517 E.0217
G1 X77.711 Y159.851 E1.2135
G1 X78.085 Y159.636 E.0117
G1 X110.156 Y191.707 E1.22898
G1 X110.934 Y191.896 E.0217
G1 X78.46 Y159.421 E1.24445
G1 X78.834 Y159.207 E.0117
G1 X111.712 Y192.085 E1.25992
G1 X112.491 Y192.274 E.0217
G1 X79.209 Y158.992 E1.2754
G1 X79.583 Y158.777 E.0117
G1 X113.269 Y192.463 E1.29087
G1 X114.047 Y192.652 E.0217
G1 X79.958 Y158.563 E1.30634
G1 X80.332 Y158.348 E.0117
G1 X114.825 Y192.841 E1.32182
G1 X115.604 Y193.03 E.0217
G1 X80.707 Y158.133 E1.33729
G1 X81.081 Y157.919 E.0117
G1 X116.382 Y193.219 E1.35277
G1 X117.16 Y193.409 E.0217
G1 X81.456 Y157.704 E1.36824
G1 X81.83 Y157.489 E.0117
G1 X117.938 Y193.598 E1.38371
G1 X118.717 Y193.787 E.0217
G1 X82.204 Y157.275 E1.39919
G1 X82.579 Y157.06 E.0117
G1 X119.495 Y193.976 E1.41466
G1 X120.273 Y194.165 E.0217
G1 X82.953 Y156.845 E1.43013
G1 X83.328 Y156.631 E.0117
G1 X121.051 Y194.354 E1.44561
G1 X121.83 Y194.543 E.0217
G1 X83.702 Y156.416 E1.46108
G1 X84.077 Y156.201 E.0117
G1 X122.608 Y194.732 E1.47655
G1 X123.386 Y194.922 E.0217
G1 X84.451 Y155.987 E1.49203
G1 X84.826 Y155.772 E.0117
G1 X123.517 Y194.464 E1.48271
G1 X123.505 Y193.863 E.01629
G1 X85.2 Y155.557 E1.4679
G1 X85.575 Y155.343 E.0117
G1 X123.493 Y193.261 E1.45309
G1 X123.481 Y192.66 E.01629
G1 X85.949 Y155.128 E1.43828
G1 X86.323 Y154.913 E.0117
G1 X123.469 Y192.059 E1.42347
G1 X123.457 Y191.458 E.01629
G1 X86.698 Y154.699 E1.40866
G1 X87.072 Y154.484 E.0117
G1 X123.445 Y190.857 E1.39385
G1 X123.433 Y190.256 E.01629
G1 X87.447 Y154.269 E1.37903
G1 X87.821 Y154.055 E.0117
G1 X123.421 Y189.654 E1.36422
G1 X123.409 Y189.053 E.01629
G1 X88.196 Y153.84 E1.34941
G1 X88.57 Y153.625 E.0117
G1 X123.397 Y188.452 E1.3346
G1 X123.385 Y187.851 E.01629
G1 X88.945 Y153.41 E1.31979
G1 X89.319 Y153.196 E.0117
G1 X123.373 Y187.25 E1.30498
G1 X123.361 Y186.649 E.01629
G1 X89.694 Y152.981 E1.29017
G1 X90.068 Y152.766 E.0117
G1 X123.349 Y186.047 E1.27536
M73 P81 R13
G1 X123.337 Y185.446 E.01629
G1 X90.443 Y152.552 E1.26055
G1 X90.817 Y152.337 E.0117
G1 X123.325 Y184.845 E1.24574
G1 X123.313 Y184.244 E.01629
G1 X91.191 Y152.122 E1.23093
G1 X91.566 Y151.908 E.0117
G1 X123.301 Y183.643 E1.21612
G1 X123.289 Y183.042 E.01629
G1 X91.94 Y151.693 E1.20131
G1 X92.315 Y151.478 E.0117
G1 X123.277 Y182.44 E1.1865
G1 X123.265 Y181.839 E.01629
G1 X92.689 Y151.264 E1.17169
G1 X93.064 Y151.049 E.0117
G1 X123.253 Y181.238 E1.15687
G1 X123.241 Y180.637 E.01629
G1 X93.438 Y150.834 E1.14206
G1 X93.813 Y150.62 E.0117
G1 X123.229 Y180.036 E1.12725
G1 X123.217 Y179.435 E.01629
G1 X94.187 Y150.405 E1.11244
G1 X94.562 Y150.19 E.0117
G1 X123.205 Y178.833 E1.09763
G1 X123.193 Y178.232 E.01629
G1 X94.936 Y149.976 E1.08282
G1 X95.311 Y149.761 E.0117
G1 X123.181 Y177.631 E1.06801
G1 X123.169 Y177.03 E.01629
G1 X95.685 Y149.546 E1.0532
G1 X96.059 Y149.332 E.0117
G1 X123.157 Y176.429 E1.03839
G1 X123.145 Y175.828 E.01629
G1 X96.434 Y149.117 E1.02358
G1 X96.808 Y148.902 E.0117
G1 X123.133 Y175.227 E1.00877
G1 X123.12 Y174.625 E.01629
G1 X97.183 Y148.688 E.99396
G1 X97.557 Y148.473 E.0117
G1 X123.108 Y174.024 E.97915
G1 X123.096 Y173.423 E.01629
G1 X97.932 Y148.258 E.96434
G1 X98.306 Y148.044 E.0117
G1 X123.084 Y172.822 E.94953
G1 X123.072 Y172.221 E.01629
G1 X98.681 Y147.829 E.93471
G1 X99.055 Y147.614 E.0117
G1 X123.06 Y171.62 E.9199
G1 X123.048 Y171.018 E.01629
G1 X99.43 Y147.4 E.90509
G1 X99.804 Y147.185 E.0117
G1 X123.036 Y170.417 E.89028
G1 X123.024 Y169.816 E.01629
G1 X100.179 Y146.97 E.87547
G1 X100.553 Y146.756 E.0117
G1 X123.012 Y169.215 E.86066
G1 X123 Y168.614 E.01629
G1 X100.927 Y146.541 E.84585
G1 X101.302 Y146.326 E.0117
G1 X122.988 Y168.013 E.83104
G1 X122.976 Y167.411 E.01629
G1 X101.676 Y146.112 E.81623
G1 X102.051 Y145.897 E.0117
G1 X122.964 Y166.81 E.80142
G1 X122.952 Y166.209 E.01629
G1 X102.425 Y145.682 E.78661
G1 X102.8 Y145.468 E.0117
G1 X122.94 Y165.608 E.7718
G1 X122.928 Y165.007 E.01629
G1 X103.174 Y145.253 E.75699
G1 X103.549 Y145.038 E.0117
G1 X122.916 Y164.406 E.74218
G1 X122.904 Y163.804 E.01629
G1 X103.923 Y144.824 E.72737
G1 X104.298 Y144.609 E.0117
G1 X122.892 Y163.203 E.71255
G1 X122.88 Y162.602 E.01629
G1 X104.672 Y144.394 E.69774
G1 X105.047 Y144.18 E.0117
G1 X122.868 Y162.001 E.68293
G1 X122.856 Y161.4 E.01629
G1 X105.421 Y143.965 E.66812
G1 X105.795 Y143.75 E.0117
G1 X122.844 Y160.799 E.65331
G1 X122.832 Y160.197 E.01629
G1 X106.17 Y143.536 E.6385
G1 X106.544 Y143.321 E.0117
G1 X122.82 Y159.596 E.62369
G1 X122.808 Y158.995 E.01629
G1 X106.919 Y143.106 E.60888
G1 X107.293 Y142.892 E.0117
G1 X122.796 Y158.394 E.59407
G1 X122.784 Y157.793 E.01629
G1 X107.668 Y142.677 E.57926
G1 X108.042 Y142.462 E.0117
G1 X122.772 Y157.192 E.56445
G1 X122.76 Y156.59 E.01629
G1 X108.417 Y142.248 E.54964
G1 X108.791 Y142.033 E.0117
G1 X122.748 Y155.989 E.53483
G1 X122.736 Y155.388 E.01629
G1 X109.166 Y141.818 E.52002
G1 X109.54 Y141.603 E.0117
G1 X122.724 Y154.787 E.50521
G1 X122.712 Y154.186 E.01629
G1 X109.914 Y141.389 E.49039
G1 X110.289 Y141.174 E.0117
G1 X122.699 Y153.585 E.47558
G1 X122.687 Y152.984 E.01629
G1 X111.517 Y141.813 E.42807
G1 X112.911 Y142.618 E.04361
G1 X122.675 Y152.382 E.3742
G1 X122.663 Y151.781 E.01629
G1 X114.305 Y143.422 E.32032
G1 X115.698 Y144.227 E.04361
G1 X122.651 Y151.18 E.26644
G1 X122.639 Y150.579 E.01629
G1 X117.092 Y145.032 E.21257
G1 X118.486 Y145.837 E.04361
G1 X122.627 Y149.978 E.15869
G1 X122.615 Y149.377 E.01629
G1 X119.88 Y146.641 E.10481
G1 X121.274 Y147.446 E.04361
G1 X122.794 Y148.966 E.05825
; OBJECT_ID: 437
; WIPE_START
G1 X121.38 Y147.552 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 409
M625
; start printing object, unique label id: 437
M624 EAAAAAAAAAA=
M204 S10000
G1 X115.924 Y142.215 Z2.2 F30000
G1 X47.394 Y75.179 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X123.892 Y56.59 E2.1332
G1 X122.943 Y104.001 E1.28495
G1 X110.351 Y111.271 E.39401
G1 X47.446 Y75.209 E1.96477
; WIPE_START
G1 X49.389 Y74.735 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.323 Y75.027 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X124.186 Y56.106 E2.01454
G1 X124.301 Y56.198 E.00371
G1 X123.341 Y104.146 E1.20571
G1 X123.263 Y104.279 E.00388
G1 X110.429 Y111.688 E.37257
G1 X110.274 Y111.689 E.00391
G1 X46.375 Y75.056 E1.85177
; WIPE_START
M204 S4000
G1 X48.318 Y74.583 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.366 Y75.542 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.674 Y75.233 E.01182
G1 X49.453 Y75.044 E.0217
G1 X48.877 Y75.62 E.02204
G1 X49.252 Y75.834 E.0117
G1 X50.231 Y74.855 E.03751
G1 X51.009 Y74.666 E.0217
G1 X49.626 Y76.049 E.05299
G1 X50.001 Y76.264 E.0117
G1 X51.787 Y74.477 E.06846
G1 X52.566 Y74.288 E.0217
G1 X50.375 Y76.478 E.08394
G1 X50.75 Y76.693 E.0117
G1 X53.344 Y74.099 E.09941
G1 X54.122 Y73.91 E.0217
M73 P81 R12
G1 X51.124 Y76.908 E.11488
G1 X51.499 Y77.122 E.0117
G1 X54.9 Y73.721 E.13036
G1 X55.679 Y73.531 E.0217
G1 X51.873 Y77.337 E.14583
G1 X52.248 Y77.552 E.0117
G1 X56.457 Y73.342 E.1613
G1 X57.235 Y73.153 E.0217
G1 X52.622 Y77.766 E.17678
G1 X52.997 Y77.981 E.0117
G1 X58.013 Y72.964 E.19225
G1 X58.792 Y72.775 E.0217
G1 X53.371 Y78.196 E.20772
G1 X53.745 Y78.41 E.0117
G1 X59.57 Y72.586 E.2232
G1 X60.348 Y72.397 E.0217
G1 X54.12 Y78.625 E.23867
G1 X54.494 Y78.84 E.0117
G1 X61.126 Y72.208 E.25414
G1 X61.905 Y72.019 E.0217
G1 X54.869 Y79.054 E.26962
G1 X55.243 Y79.269 E.0117
G1 X62.683 Y71.829 E.28509
G1 X63.461 Y71.64 E.0217
G1 X55.618 Y79.484 E.30056
G1 X55.992 Y79.698 E.0117
G1 X64.239 Y71.451 E.31604
G1 X65.018 Y71.262 E.0217
G1 X56.367 Y79.913 E.33151
G1 X56.741 Y80.128 E.0117
G1 X65.796 Y71.073 E.34698
G1 X66.574 Y70.884 E.0217
G1 X57.116 Y80.342 E.36246
G1 X57.49 Y80.557 E.0117
G1 X67.352 Y70.695 E.37793
G1 X68.131 Y70.506 E.0217
G1 X57.865 Y80.772 E.39341
G1 X58.239 Y80.986 E.0117
G1 X68.909 Y70.317 E.40888
G1 X69.687 Y70.127 E.0217
G1 X58.613 Y81.201 E.42435
G1 X58.988 Y81.416 E.0117
G1 X70.465 Y69.938 E.43983
G1 X71.244 Y69.749 E.0217
G1 X59.362 Y81.63 E.4553
G1 X59.737 Y81.845 E.0117
G1 X72.022 Y69.56 E.47077
G1 X72.8 Y69.371 E.0217
G1 X60.111 Y82.06 E.48625
G1 X60.486 Y82.274 E.0117
G1 X73.578 Y69.182 E.50172
G1 X74.357 Y68.993 E.0217
G1 X60.86 Y82.489 E.51719
G1 X61.235 Y82.704 E.0117
G1 X75.135 Y68.804 E.53267
G1 X75.913 Y68.614 E.0217
G1 X61.609 Y82.918 E.54814
G1 X61.984 Y83.133 E.0117
G1 X76.691 Y68.425 E.56361
G1 X77.47 Y68.236 E.0217
G1 X62.358 Y83.348 E.57909
G1 X62.733 Y83.562 E.0117
G1 X78.248 Y68.047 E.59456
G1 X79.026 Y67.858 E.0217
G1 X63.107 Y83.777 E.61003
G1 X63.481 Y83.992 E.0117
G1 X79.804 Y67.669 E.62551
G1 X80.583 Y67.48 E.0217
G1 X63.856 Y84.206 E.64098
G1 X64.23 Y84.421 E.0117
G1 X81.361 Y67.291 E.65646
G1 X82.139 Y67.102 E.0217
G1 X64.605 Y84.636 E.67193
G1 X64.979 Y84.85 E.0117
G1 X82.917 Y66.912 E.6874
G1 X83.696 Y66.723 E.0217
G1 X65.354 Y85.065 E.70288
G1 X65.728 Y85.28 E.0117
G1 X84.474 Y66.534 E.71835
G1 X85.252 Y66.345 E.0217
G1 X66.103 Y85.494 E.73382
G1 X66.477 Y85.709 E.0117
G1 X86.03 Y66.156 E.7493
G1 X86.809 Y65.967 E.0217
G1 X66.852 Y85.924 E.76477
G1 X67.226 Y86.138 E.0117
G1 X87.587 Y65.778 E.78024
G1 X88.365 Y65.589 E.0217
G1 X67.6 Y86.353 E.79572
G1 X67.975 Y86.568 E.0117
G1 X89.143 Y65.4 E.81119
G1 X89.921 Y65.21 E.0217
G1 X68.349 Y86.783 E.82666
G1 X68.724 Y86.997 E.0117
G1 X90.7 Y65.021 E.84214
G1 X91.478 Y64.832 E.0217
G1 X69.098 Y87.212 E.85761
G1 X69.473 Y87.427 E.0117
G1 X92.256 Y64.643 E.87308
G1 X93.034 Y64.454 E.0217
G1 X69.847 Y87.641 E.88856
G1 X70.222 Y87.856 E.0117
G1 X93.813 Y64.265 E.90403
G1 X94.591 Y64.076 E.0217
G1 X70.596 Y88.071 E.91951
G1 X70.971 Y88.285 E.0117
G1 X95.369 Y63.887 E.93498
G1 X96.147 Y63.698 E.0217
G1 X71.345 Y88.5 E.95045
G1 X71.72 Y88.715 E.0117
G1 X96.926 Y63.508 E.96593
G1 X97.704 Y63.319 E.0217
G1 X72.094 Y88.929 E.9814
G1 X72.468 Y89.144 E.0117
G1 X98.482 Y63.13 E.99687
G1 X99.26 Y62.941 E.0217
G1 X72.843 Y89.359 E1.01235
G1 X73.217 Y89.573 E.0117
G1 X100.039 Y62.752 E1.02782
G1 X100.817 Y62.563 E.0217
G1 X73.592 Y89.788 E1.04329
G1 X73.966 Y90.003 E.0117
G1 X101.595 Y62.374 E1.05877
G1 X102.373 Y62.185 E.0217
G1 X74.341 Y90.217 E1.07424
G1 X74.715 Y90.432 E.0117
G1 X103.152 Y61.996 E1.08971
G1 X103.93 Y61.806 E.0217
G1 X75.09 Y90.647 E1.10519
G1 X75.464 Y90.861 E.0117
G1 X104.708 Y61.617 E1.12066
G1 X105.486 Y61.428 E.0217
G1 X75.839 Y91.076 E1.13613
G1 X76.213 Y91.291 E.0117
G1 X106.265 Y61.239 E1.15161
G1 X107.043 Y61.05 E.0217
G1 X76.588 Y91.505 E1.16708
G1 X76.962 Y91.72 E.0117
G1 X107.821 Y60.861 E1.18255
G1 X108.599 Y60.672 E.0217
G1 X77.336 Y91.935 E1.19803
G1 X77.711 Y92.149 E.0117
G1 X109.378 Y60.483 E1.2135
G1 X110.156 Y60.293 E.0217
G1 X78.085 Y92.364 E1.22898
G1 X78.46 Y92.579 E.0117
G1 X110.934 Y60.104 E1.24445
G1 X111.712 Y59.915 E.0217
G1 X78.834 Y92.793 E1.25992
G1 X79.209 Y93.008 E.0117
G1 X112.491 Y59.726 E1.2754
G1 X113.269 Y59.537 E.0217
G1 X79.583 Y93.223 E1.29087
G1 X79.958 Y93.437 E.0117
G1 X114.047 Y59.348 E1.30634
G1 X114.825 Y59.159 E.0217
G1 X80.332 Y93.652 E1.32182
G1 X80.707 Y93.867 E.0117
G1 X115.604 Y58.97 E1.33729
G1 X116.382 Y58.781 E.0217
G1 X81.081 Y94.081 E1.35276
G1 X81.456 Y94.296 E.0117
G1 X117.16 Y58.591 E1.36824
G1 X117.938 Y58.402 E.0217
G1 X81.83 Y94.511 E1.38371
G1 X82.204 Y94.725 E.0117
G1 X118.717 Y58.213 E1.39918
G1 X119.495 Y58.024 E.0217
G1 X82.579 Y94.94 E1.41466
G1 X82.953 Y95.155 E.0117
G1 X120.273 Y57.835 E1.43013
G1 X121.051 Y57.646 E.0217
G1 X83.328 Y95.369 E1.4456
G1 X83.702 Y95.584 E.0117
G1 X121.83 Y57.457 E1.46108
G1 X122.608 Y57.268 E.0217
G1 X84.077 Y95.799 E1.47655
G1 X84.451 Y96.013 E.0117
G1 X123.386 Y57.079 E1.49202
G1 X123.527 Y57.044 E.00394
G1 X123.517 Y57.536 E.01334
G1 X84.826 Y96.228 E1.48271
G1 X85.2 Y96.443 E.0117
G1 X123.505 Y58.138 E1.4679
G1 X123.493 Y58.739 E.01629
G1 X85.575 Y96.657 E1.45309
G1 X85.949 Y96.872 E.0117
G1 X123.481 Y59.34 E1.43828
G1 X123.469 Y59.941 E.01629
G1 X86.324 Y97.087 E1.42347
G1 X86.698 Y97.301 E.0117
G1 X123.457 Y60.542 E1.40866
G1 X123.445 Y61.143 E.01629
G1 X87.072 Y97.516 E1.39384
G1 X87.447 Y97.731 E.0117
G1 X123.433 Y61.744 E1.37903
G1 X123.421 Y62.346 E.01629
G1 X87.821 Y97.945 E1.36422
G1 X88.196 Y98.16 E.0117
G1 X123.409 Y62.947 E1.34941
G1 X123.397 Y63.548 E.01629
M73 P82 R12
G1 X88.57 Y98.375 E1.3346
G1 X88.945 Y98.59 E.0117
G1 X123.385 Y64.149 E1.31979
G1 X123.373 Y64.75 E.01629
G1 X89.319 Y98.804 E1.30498
G1 X89.694 Y99.019 E.0117
G1 X123.361 Y65.351 E1.29017
G1 X123.349 Y65.953 E.01629
G1 X90.068 Y99.234 E1.27536
G1 X90.443 Y99.448 E.0117
G1 X123.337 Y66.554 E1.26055
G1 X123.325 Y67.155 E.01629
G1 X90.817 Y99.663 E1.24574
G1 X91.191 Y99.878 E.0117
G1 X123.313 Y67.756 E1.23093
G1 X123.301 Y68.357 E.01629
G1 X91.566 Y100.092 E1.21612
G1 X91.94 Y100.307 E.0117
G1 X123.289 Y68.958 E1.20131
G1 X123.277 Y69.56 E.01629
G1 X92.315 Y100.522 E1.1865
G1 X92.689 Y100.736 E.0117
G1 X123.265 Y70.161 E1.17168
G1 X123.253 Y70.762 E.01629
G1 X93.064 Y100.951 E1.15687
G1 X93.438 Y101.166 E.0117
G1 X123.241 Y71.363 E1.14206
G1 X123.229 Y71.964 E.01629
G1 X93.813 Y101.38 E1.12725
G1 X94.187 Y101.595 E.0117
G1 X123.217 Y72.565 E1.11244
G1 X123.205 Y73.167 E.01629
G1 X94.562 Y101.81 E1.09763
G1 X94.936 Y102.024 E.0117
G1 X123.193 Y73.768 E1.08282
G1 X123.181 Y74.369 E.01629
G1 X95.311 Y102.239 E1.06801
G1 X95.685 Y102.454 E.0117
G1 X123.169 Y74.97 E1.0532
G1 X123.157 Y75.571 E.01629
G1 X96.059 Y102.668 E1.03839
G1 X96.434 Y102.883 E.0117
G1 X123.145 Y76.172 E1.02358
G1 X123.133 Y76.774 E.01629
G1 X96.808 Y103.098 E1.00877
G1 X97.183 Y103.312 E.0117
G1 X123.12 Y77.375 E.99396
G1 X123.108 Y77.976 E.01629
G1 X97.557 Y103.527 E.97915
G1 X97.932 Y103.742 E.0117
G1 X123.096 Y78.577 E.96434
G1 X123.084 Y79.178 E.01629
G1 X98.306 Y103.956 E.94952
G1 X98.681 Y104.171 E.0117
G1 X123.072 Y79.779 E.93471
G1 X123.06 Y80.38 E.01629
G1 X99.055 Y104.386 E.9199
G1 X99.43 Y104.6 E.0117
G1 X123.048 Y80.982 E.90509
G1 X123.036 Y81.583 E.01629
G1 X99.804 Y104.815 E.89028
G1 X100.179 Y105.03 E.0117
G1 X123.024 Y82.184 E.87547
G1 X123.012 Y82.785 E.01629
G1 X100.553 Y105.244 E.86066
G1 X100.927 Y105.459 E.0117
G1 X123 Y83.386 E.84585
G1 X122.988 Y83.987 E.01629
G1 X101.302 Y105.674 E.83104
G1 X101.676 Y105.888 E.0117
G1 X122.976 Y84.589 E.81623
G1 X122.964 Y85.19 E.01629
G1 X102.051 Y106.103 E.80142
G1 X102.425 Y106.318 E.0117
G1 X122.952 Y85.791 E.78661
G1 X122.94 Y86.392 E.01629
G1 X102.8 Y106.532 E.7718
G1 X103.174 Y106.747 E.0117
G1 X122.928 Y86.993 E.75699
G1 X122.916 Y87.594 E.01629
G1 X103.549 Y106.962 E.74218
G1 X103.923 Y107.176 E.0117
G1 X122.904 Y88.196 E.72736
G1 X122.892 Y88.797 E.01629
G1 X104.298 Y107.391 E.71255
G1 X104.672 Y107.606 E.0117
G1 X122.88 Y89.398 E.69774
G1 X122.868 Y89.999 E.01629
G1 X105.047 Y107.82 E.68293
G1 X105.421 Y108.035 E.0117
G1 X122.856 Y90.6 E.66812
G1 X122.844 Y91.201 E.01629
G1 X105.795 Y108.25 E.65331
G1 X106.17 Y108.464 E.0117
G1 X122.832 Y91.803 E.6385
G1 X122.82 Y92.404 E.01629
G1 X106.544 Y108.679 E.62369
G1 X106.919 Y108.894 E.0117
G1 X122.808 Y93.005 E.60888
G1 X122.796 Y93.606 E.01629
G1 X107.293 Y109.108 E.59407
G1 X107.668 Y109.323 E.0117
G1 X122.784 Y94.207 E.57926
G1 X122.772 Y94.808 E.01629
G1 X108.042 Y109.538 E.56445
G1 X108.417 Y109.752 E.0117
G1 X122.76 Y95.41 E.54964
G1 X122.748 Y96.011 E.01629
G1 X108.791 Y109.967 E.53483
G1 X109.166 Y110.182 E.0117
G1 X122.736 Y96.612 E.52002
G1 X122.724 Y97.213 E.01629
G1 X109.54 Y110.397 E.50521
G1 X109.915 Y110.611 E.0117
G1 X122.712 Y97.814 E.49039
G1 X122.699 Y98.415 E.01629
G1 X110.289 Y110.826 E.47558
G1 X110.35 Y110.861 E.00191
G1 X111.517 Y110.187 E.03651
G1 X122.687 Y99.017 E.42807
G1 X122.675 Y99.618 E.01629
G1 X112.911 Y109.382 E.3742
G1 X114.305 Y108.578 E.04361
G1 X122.663 Y100.219 E.32032
G1 X122.651 Y100.82 E.01629
G1 X115.698 Y107.773 E.26644
G1 X117.092 Y106.968 E.04361
G1 X122.639 Y101.421 E.21257
G1 X122.627 Y102.022 E.01629
G1 X118.486 Y106.163 E.15869
G1 X119.88 Y105.359 E.04361
G1 X122.615 Y102.623 E.10481
G1 X122.603 Y103.225 E.01629
G1 X120.763 Y105.065 E.07052
; OBJECT_ID: 465
; WIPE_START
G1 X122.177 Y103.651 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 437
M625
; start printing object, unique label id: 465
M624 IAAAAAAAAAA=
M204 S10000
G1 X116.307 Y108.529 Z2.2 F30000
G1 X40.405 Y171.606 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X40.405 Y80.394 E2.47159
G1 X106.42 Y118.239 E2.06192
G1 X106.42 Y133.761 E.42059
G1 X40.457 Y171.576 E2.06029
M204 S10000
G1 X40.004 Y172.261 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X40.004 Y79.739 E2.32615
G1 X40.036 Y79.72 E.00092
G1 X106.742 Y117.962 E1.93314
G1 X106.82 Y118.097 E.00392
G1 X106.82 Y133.903 E.39738
G1 X106.742 Y134.038 E.00392
G1 X40.056 Y172.268 E1.93255
; WIPE_START
M204 S4000
G1 X40.055 Y170.268 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X40.761 Y171.208 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X40.761 Y81.008 E2.44414
G1 X41.177 Y81.246 E.01299
G1 X41.177 Y170.754 E2.42538
G1 X41.593 Y170.515 E.01299
G1 X41.593 Y81.485 E2.41246
G1 X42.009 Y81.723 E.01299
G1 X42.009 Y170.277 E2.39953
G1 X42.425 Y170.038 E.01299
G1 X42.425 Y81.962 E2.38661
G1 X42.841 Y82.2 E.01299
G1 X42.841 Y169.8 E2.37369
G1 X43.257 Y169.561 E.01299
G1 X43.257 Y82.439 E2.36077
G1 X43.673 Y82.677 E.01299
G1 X43.673 Y169.323 E2.34784
G1 X44.089 Y169.084 E.01299
G1 X44.089 Y82.916 E2.33492
G1 X44.505 Y83.154 E.01299
G1 X44.505 Y168.846 E2.322
G1 X44.921 Y168.607 E.01299
G1 X44.921 Y83.393 E2.30907
G1 X45.337 Y83.631 E.01299
G1 X45.337 Y168.369 E2.29615
G1 X45.753 Y168.131 E.01299
G1 X45.753 Y83.869 E2.28323
G1 X46.169 Y84.108 E.01299
G1 X46.169 Y167.892 E2.27031
G1 X46.585 Y167.654 E.01299
G1 X46.585 Y84.346 E2.25738
G1 X47 Y84.585 E.01299
G1 X47 Y167.415 E2.24446
G1 X47.416 Y167.177 E.01299
G1 X47.416 Y84.823 E2.23154
G1 X47.832 Y85.062 E.01299
G1 X47.832 Y166.938 E2.21862
G1 X48.248 Y166.7 E.01299
G1 X48.248 Y85.3 E2.20569
G1 X48.664 Y85.539 E.01299
G1 X48.664 Y166.461 E2.19277
G1 X49.08 Y166.223 E.01299
G1 X49.08 Y85.777 E2.17985
G1 X49.496 Y86.016 E.01299
G1 X49.496 Y165.984 E2.16692
G1 X49.912 Y165.746 E.01299
G1 X49.912 Y86.254 E2.154
G1 X50.328 Y86.492 E.01299
G1 X50.328 Y165.508 E2.14108
G1 X50.744 Y165.269 E.01299
G1 X50.744 Y86.731 E2.12816
G1 X51.16 Y86.969 E.01299
G1 X51.16 Y165.031 E2.11523
G1 X51.576 Y164.792 E.01299
G1 X51.576 Y87.208 E2.10231
G1 X51.992 Y87.446 E.01299
G1 X51.992 Y164.554 E2.08939
G1 X52.408 Y164.315 E.01299
G1 X52.408 Y87.685 E2.07647
G1 X52.824 Y87.923 E.01299
G1 X52.824 Y164.077 E2.06354
G1 X53.24 Y163.838 E.01299
G1 X53.24 Y88.162 E2.05062
G1 X53.655 Y88.4 E.01299
G1 X53.655 Y163.6 E2.0377
G1 X54.071 Y163.362 E.01299
G1 X54.071 Y88.638 E2.02477
G1 X54.487 Y88.877 E.01299
G1 X54.487 Y163.123 E2.01185
G1 X54.903 Y162.885 E.01299
G1 X54.903 Y89.115 E1.99893
G1 X55.319 Y89.354 E.01299
G1 X55.319 Y162.646 E1.98601
G1 X55.735 Y162.408 E.01299
G1 X55.735 Y89.592 E1.97308
G1 X56.151 Y89.831 E.01299
G1 X56.151 Y162.169 E1.96016
G1 X56.567 Y161.931 E.01299
G1 X56.567 Y90.069 E1.94724
G1 X56.983 Y90.308 E.01299
G1 X56.983 Y161.692 E1.93432
G1 X57.399 Y161.454 E.01299
G1 X57.399 Y90.546 E1.92139
G1 X57.815 Y90.785 E.01299
G1 X57.815 Y161.215 E1.90847
G1 X58.231 Y160.977 E.01299
G1 X58.231 Y91.023 E1.89555
G1 X58.647 Y91.261 E.01299
G1 X58.647 Y160.739 E1.88262
G1 X59.063 Y160.5 E.01299
G1 X59.063 Y91.5 E1.8697
M73 P82 R11
G1 X59.479 Y91.738 E.01299
G1 X59.479 Y160.262 E1.85678
G1 X59.895 Y160.023 E.01299
G1 X59.895 Y91.977 E1.84386
G1 X60.311 Y92.215 E.01299
G1 X60.311 Y159.785 E1.83093
G1 X60.726 Y159.546 E.01299
G1 X60.726 Y92.454 E1.81801
G1 X61.142 Y92.692 E.01299
G1 X61.142 Y159.308 E1.80509
G1 X61.558 Y159.069 E.01299
G1 X61.558 Y92.931 E1.79217
G1 X61.974 Y93.169 E.01299
G1 X61.974 Y158.831 E1.77924
G1 X62.39 Y158.592 E.01299
G1 X62.39 Y93.408 E1.76632
M73 P83 R11
G1 X62.806 Y93.646 E.01299
G1 X62.806 Y158.354 E1.7534
G1 X63.222 Y158.116 E.01299
G1 X63.222 Y93.884 E1.74047
G1 X63.638 Y94.123 E.01299
G1 X63.638 Y157.877 E1.72755
G1 X64.054 Y157.639 E.01299
G1 X64.054 Y94.361 E1.71463
G1 X64.47 Y94.6 E.01299
G1 X64.47 Y157.4 E1.70171
G1 X64.886 Y157.162 E.01299
G1 X64.886 Y94.838 E1.68878
G1 X65.302 Y95.077 E.01299
G1 X65.302 Y156.923 E1.67586
G1 X65.718 Y156.685 E.01299
G1 X65.718 Y95.315 E1.66294
G1 X66.134 Y95.554 E.01299
G1 X66.134 Y156.446 E1.65002
G1 X66.55 Y156.208 E.01299
G1 X66.55 Y95.792 E1.63709
G1 X66.966 Y96.031 E.01299
G1 X66.966 Y155.969 E1.62417
G1 X67.382 Y155.731 E.01299
G1 X67.382 Y96.269 E1.61125
G1 X67.797 Y96.507 E.01299
G1 X67.797 Y155.493 E1.59833
G1 X68.213 Y155.254 E.01299
G1 X68.213 Y96.746 E1.5854
G1 X68.629 Y96.984 E.01299
G1 X68.629 Y155.016 E1.57248
G1 X69.045 Y154.777 E.01299
G1 X69.045 Y97.223 E1.55956
G1 X69.461 Y97.461 E.01299
G1 X69.461 Y154.539 E1.54663
G1 X69.877 Y154.3 E.01299
G1 X69.877 Y97.7 E1.53371
G1 X70.293 Y97.938 E.01299
G1 X70.293 Y154.062 E1.52079
G1 X70.709 Y153.823 E.01299
G1 X70.709 Y98.177 E1.50787
G1 X71.125 Y98.415 E.01299
G1 X71.125 Y153.585 E1.49494
G1 X71.541 Y153.347 E.01299
G1 X71.541 Y98.653 E1.48202
G1 X71.957 Y98.892 E.01299
G1 X71.957 Y153.108 E1.4691
G1 X72.373 Y152.87 E.01299
G1 X72.373 Y99.13 E1.45618
G1 X72.789 Y99.369 E.01299
G1 X72.789 Y152.631 E1.44325
G1 X73.205 Y152.393 E.01299
G1 X73.205 Y99.607 E1.43033
G1 X73.621 Y99.846 E.01299
G1 X73.621 Y152.154 E1.41741
G1 X74.037 Y151.916 E.01299
G1 X74.037 Y100.084 E1.40448
G1 X74.452 Y100.323 E.01299
G1 X74.452 Y151.677 E1.39156
G1 X74.868 Y151.439 E.01299
G1 X74.868 Y100.561 E1.37864
G1 X75.284 Y100.8 E.01299
G1 X75.284 Y151.2 E1.36572
G1 X75.7 Y150.962 E.01299
G1 X75.7 Y101.038 E1.35279
G1 X76.116 Y101.276 E.01299
G1 X76.116 Y150.724 E1.33987
G1 X76.532 Y150.485 E.01299
G1 X76.532 Y101.515 E1.32695
G1 X76.948 Y101.753 E.01299
G1 X76.948 Y150.247 E1.31403
G1 X77.364 Y150.008 E.01299
G1 X77.364 Y101.992 E1.3011
G1 X77.78 Y102.23 E.01299
G1 X77.78 Y149.77 E1.28818
G1 X78.196 Y149.531 E.01299
G1 X78.196 Y102.469 E1.27526
G1 X78.612 Y102.707 E.01299
G1 X78.612 Y149.293 E1.26233
G1 X79.028 Y149.054 E.01299
G1 X79.028 Y102.946 E1.24941
G1 X79.444 Y103.184 E.01299
G1 X79.444 Y148.816 E1.23649
G1 X79.86 Y148.577 E.01299
G1 X79.86 Y103.423 E1.22357
G1 X80.276 Y103.661 E.01299
G1 X80.276 Y148.339 E1.21064
G1 X80.692 Y148.101 E.01299
G1 X80.692 Y103.899 E1.19772
G1 X81.108 Y104.138 E.01299
G1 X81.108 Y147.862 E1.1848
G1 X81.523 Y147.624 E.01299
G1 X81.523 Y104.376 E1.17188
G1 X81.939 Y104.615 E.01299
G1 X81.939 Y147.385 E1.15895
G1 X82.355 Y147.147 E.01299
G1 X82.355 Y104.853 E1.14603
G1 X82.771 Y105.092 E.01299
G1 X82.771 Y146.908 E1.13311
G1 X83.187 Y146.67 E.01299
G1 X83.187 Y105.33 E1.12018
G1 X83.603 Y105.569 E.01299
G1 X83.603 Y146.431 E1.10726
G1 X84.019 Y146.193 E.01299
G1 X84.019 Y105.807 E1.09434
G1 X84.435 Y106.046 E.01299
G1 X84.435 Y145.954 E1.08142
G1 X84.851 Y145.716 E.01299
G1 X84.851 Y106.284 E1.06849
G1 X85.267 Y106.522 E.01299
G1 X85.267 Y145.478 E1.05557
G1 X85.683 Y145.239 E.01299
G1 X85.683 Y106.761 E1.04265
G1 X86.099 Y106.999 E.01299
G1 X86.099 Y145.001 E1.02973
G1 X86.515 Y144.762 E.01299
G1 X86.515 Y107.238 E1.0168
G1 X86.931 Y107.476 E.01299
G1 X86.931 Y144.524 E1.00388
G1 X87.347 Y144.285 E.01299
G1 X87.347 Y107.715 E.99096
G1 X87.763 Y107.953 E.01299
G1 X87.763 Y144.047 E.97803
G1 X88.179 Y143.808 E.01299
G1 X88.179 Y108.192 E.96511
G1 X88.594 Y108.43 E.01299
G1 X88.594 Y143.57 E.95219
G1 X89.01 Y143.332 E.01299
G1 X89.01 Y108.668 E.93927
G1 X89.426 Y108.907 E.01299
G1 X89.426 Y143.093 E.92634
G1 X89.842 Y142.855 E.01299
G1 X89.842 Y109.145 E.91342
G1 X90.258 Y109.384 E.01299
G1 X90.258 Y142.616 E.9005
G1 X90.674 Y142.378 E.01299
G1 X90.674 Y109.622 E.88758
G1 X91.09 Y109.861 E.01299
G1 X91.09 Y142.139 E.87465
G1 X91.506 Y141.901 E.01299
G1 X91.506 Y110.099 E.86173
G1 X91.922 Y110.338 E.01299
G1 X91.922 Y141.662 E.84881
G1 X92.338 Y141.424 E.01299
G1 X92.338 Y110.576 E.83588
G1 X92.754 Y110.815 E.01299
G1 X92.754 Y141.185 E.82296
G1 X93.17 Y140.947 E.01299
G1 X93.17 Y111.053 E.81004
G1 X93.586 Y111.291 E.01299
G1 X93.586 Y140.709 E.79712
G1 X94.002 Y140.47 E.01299
G1 X94.002 Y111.53 E.78419
G1 X94.418 Y111.768 E.01299
G1 X94.418 Y140.232 E.77127
G1 X94.834 Y139.993 E.01299
G1 X94.834 Y112.007 E.75835
G1 X95.249 Y112.245 E.01299
G1 X95.249 Y139.755 E.74543
G1 X95.665 Y139.516 E.01299
G1 X95.665 Y112.484 E.7325
G1 X96.081 Y112.722 E.01299
G1 X96.081 Y139.278 E.71958
G1 X96.497 Y139.039 E.01299
G1 X96.497 Y112.961 E.70666
G1 X96.913 Y113.199 E.01299
G1 X96.913 Y138.801 E.69373
G1 X97.329 Y138.562 E.01299
G1 X97.329 Y113.438 E.68081
G1 X97.745 Y113.676 E.01299
G1 X97.745 Y138.324 E.66789
G1 X98.161 Y138.086 E.01299
G1 X98.161 Y113.914 E.65497
G1 X98.577 Y114.153 E.01299
G1 X98.577 Y137.847 E.64204
G1 X98.993 Y137.609 E.01299
G1 X98.993 Y114.391 E.62912
G1 X99.409 Y114.63 E.01299
G1 X99.409 Y137.37 E.6162
G1 X99.825 Y137.132 E.01299
G1 X99.825 Y114.868 E.60328
G1 X100.241 Y115.107 E.01299
G1 X100.241 Y136.893 E.59035
G1 X100.657 Y136.655 E.01299
G1 X100.657 Y115.345 E.57743
G1 X101.073 Y115.584 E.01299
G1 X101.073 Y136.416 E.56451
G1 X101.489 Y136.178 E.01299
G1 X101.489 Y115.822 E.55158
G1 X101.905 Y116.061 E.01299
G1 X101.905 Y135.939 E.53866
G1 X102.32 Y135.701 E.01299
G1 X102.32 Y116.299 E.52574
G1 X102.736 Y116.537 E.01299
G1 X102.736 Y135.463 E.51282
G1 X103.152 Y135.224 E.01299
G1 X103.152 Y116.776 E.49989
G1 X103.568 Y117.014 E.01299
G1 X103.568 Y134.986 E.48697
G1 X103.984 Y134.747 E.01299
G1 X103.984 Y117.253 E.47405
G1 X104.4 Y117.491 E.01299
G1 X104.4 Y134.509 E.46113
G1 X104.816 Y134.27 E.01299
G1 X104.816 Y117.73 E.4482
G1 X105.232 Y117.968 E.01299
G1 X105.232 Y134.032 E.43528
G1 X105.648 Y133.793 E.01299
G1 X105.648 Y118.207 E.42236
G1 X106.064 Y118.445 E.01299
G1 X106.064 Y133.771 E.41528
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X106.064 Y131.771 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 465
M625
; layer num/total_layer_count: 12/14
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F30000
; object ids of layer 12 start: 325,353,381,409,437,465
M624 PwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer12 end: 325,353,381,409,437,465
M625
; OBJECT_ID: 325
; start printing object, unique label id: 325
M624 AQAAAAAAAAA=
G1 X208.476 Y75.147
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X145.65 Y111.164 E1.96232
G1 X133.148 Y103.947 E.39116
G1 X132.201 Y56.612 E1.28288
G1 X208.418 Y75.133 E2.12535
; WIPE_START
G1 X206.683 Y76.129 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.547 Y74.995 Z2.36 F30000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X145.649 Y111.627 E1.85175
G1 X132.752 Y104.181 E.37441
G1 X131.79 Y56.125 E1.20842
G1 X131.814 Y56.106 E.00078
G1 X209.488 Y74.981 E2.00966
; WIPE_START
M204 S4000
G1 X207.754 Y75.976 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.502 Y75.511 Z2.36 F30000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.192 Y75.201 E.01188
G1 X206.411 Y75.011 E.02177
G1 X206.989 Y75.589 E.02215
G1 X206.614 Y75.805 E.01173
G1 X205.63 Y74.822 E.03768
G1 X204.85 Y74.632 E.02177
G1 X206.238 Y76.02 E.0532
G1 X205.862 Y76.236 E.01173
G1 X204.069 Y74.442 E.06873
G1 X203.288 Y74.252 E.02177
G1 X205.487 Y76.451 E.08425
G1 X205.111 Y76.666 E.01173
G1 X202.507 Y74.063 E.09978
G1 X201.726 Y73.873 E.02177
G1 X204.735 Y76.882 E.1153
G1 X204.359 Y77.097 E.01173
G1 X200.945 Y73.683 E.13083
G1 X200.165 Y73.493 E.02177
G1 X203.984 Y77.312 E.14635
G1 X203.608 Y77.528 E.01174
G1 X199.384 Y73.304 E.16188
G1 X198.603 Y73.114 E.02177
G1 X203.232 Y77.743 E.1774
G1 X202.857 Y77.959 E.01173
G1 X197.822 Y72.924 E.19293
G1 X197.041 Y72.734 E.02177
G1 X202.481 Y78.174 E.20845
G1 X202.105 Y78.389 E.01173
G1 X196.26 Y72.545 E.22398
G1 X195.479 Y72.355 E.02177
G1 X201.729 Y78.605 E.2395
G1 X201.354 Y78.82 E.01173
G1 X194.699 Y72.165 E.25503
G1 X193.918 Y71.975 E.02177
G1 X200.978 Y79.036 E.27055
G1 X200.602 Y79.251 E.01173
G1 X193.137 Y71.786 E.28608
G1 X192.356 Y71.596 E.02177
G1 X200.227 Y79.466 E.3016
G1 X199.851 Y79.682 E.01174
G1 X191.575 Y71.406 E.31713
G1 X190.794 Y71.216 E.02177
M73 P84 R11
G1 X199.475 Y79.897 E.33266
G1 X199.099 Y80.113 E.01174
G1 X190.014 Y71.027 E.34818
G1 X189.233 Y70.837 E.02177
G1 X198.724 Y80.328 E.36371
G1 X198.348 Y80.543 E.01173
G1 X188.452 Y70.647 E.37923
G1 X187.671 Y70.457 E.02177
G1 X197.972 Y80.759 E.39476
G1 X197.597 Y80.974 E.01173
G1 X186.89 Y70.268 E.41028
G1 X186.109 Y70.078 E.02177
G1 X197.221 Y81.189 E.42581
G1 X196.845 Y81.405 E.01174
G1 X185.329 Y69.888 E.44133
G1 X184.548 Y69.698 E.02177
G1 X196.469 Y81.62 E.45686
G1 X196.094 Y81.836 E.01174
G1 X183.767 Y69.509 E.47238
G1 X182.986 Y69.319 E.02177
G1 X195.718 Y82.051 E.48791
G1 X195.342 Y82.266 E.01173
G1 X182.205 Y69.129 E.50343
G1 X181.424 Y68.939 E.02177
G1 X194.967 Y82.482 E.51896
G1 X194.591 Y82.697 E.01174
G1 X180.643 Y68.75 E.53448
G1 X179.863 Y68.56 E.02177
G1 X194.215 Y82.913 E.55001
G1 X193.84 Y83.128 E.01173
G1 X179.082 Y68.37 E.56553
G1 X178.301 Y68.18 E.02177
G1 X193.464 Y83.343 E.58106
G1 X193.088 Y83.559 E.01173
G1 X177.52 Y67.991 E.59658
G1 X176.739 Y67.801 E.02177
G1 X192.712 Y83.774 E.61211
G1 X192.337 Y83.99 E.01174
G1 X175.958 Y67.611 E.62763
G1 X175.178 Y67.422 E.02177
G1 X191.961 Y84.205 E.64316
G1 X191.585 Y84.42 E.01173
G1 X174.397 Y67.232 E.65868
G1 X173.616 Y67.042 E.02177
G1 X191.21 Y84.636 E.67421
G1 X190.834 Y84.851 E.01174
G1 X172.835 Y66.852 E.68973
G1 X172.054 Y66.663 E.02177
G1 X190.458 Y85.067 E.70526
G1 X190.082 Y85.282 E.01173
G1 X171.273 Y66.473 E.72078
G1 X170.492 Y66.283 E.02177
G1 X189.707 Y85.497 E.73631
G1 X189.331 Y85.713 E.01173
G1 X169.712 Y66.093 E.75183
G1 X168.931 Y65.904 E.02177
G1 X188.955 Y85.928 E.76736
G1 X188.58 Y86.143 E.01173
G1 X168.15 Y65.714 E.78288
G1 X167.369 Y65.524 E.02177
G1 X188.204 Y86.359 E.79841
G1 X187.828 Y86.574 E.01173
G1 X166.588 Y65.334 E.81394
G1 X165.807 Y65.145 E.02177
G1 X187.452 Y86.79 E.82946
G1 X187.077 Y87.005 E.01174
G1 X165.027 Y64.955 E.84499
G1 X164.246 Y64.765 E.02177
G1 X186.701 Y87.22 E.86051
G1 X186.325 Y87.436 E.01173
G1 X163.465 Y64.575 E.87604
G1 X162.684 Y64.386 E.02177
G1 X185.95 Y87.651 E.89156
G1 X185.574 Y87.867 E.01173
G1 X161.903 Y64.196 E.90709
G1 X161.122 Y64.006 E.02177
G1 X185.198 Y88.082 E.92261
G1 X184.822 Y88.297 E.01173
G1 X160.342 Y63.816 E.93814
G1 X159.561 Y63.627 E.02177
G1 X184.447 Y88.513 E.95366
G1 X184.071 Y88.728 E.01173
G1 X158.78 Y63.437 E.96919
G1 X157.999 Y63.247 E.02177
G1 X183.695 Y88.943 E.98471
G1 X183.32 Y89.159 E.01173
G1 X157.218 Y63.057 E1.00024
G1 X156.437 Y62.868 E.02177
G1 X182.944 Y89.374 E1.01576
G1 X182.568 Y89.59 E.01173
G1 X155.656 Y62.678 E1.03129
G1 X154.876 Y62.488 E.02177
G1 X182.193 Y89.805 E1.04681
G1 X181.817 Y90.02 E.01173
G1 X154.095 Y62.298 E1.06234
G1 X153.314 Y62.109 E.02177
G1 X181.441 Y90.236 E1.07786
G1 X181.065 Y90.451 E.01173
G1 X152.533 Y61.919 E1.09339
G1 X151.752 Y61.729 E.02177
G1 X180.69 Y90.667 E1.10891
G1 X180.314 Y90.882 E.01173
G1 X150.971 Y61.539 E1.12444
G1 X150.191 Y61.35 E.02177
G1 X179.938 Y91.097 E1.13996
G1 X179.563 Y91.313 E.01174
G1 X149.41 Y61.16 E1.15549
G1 X148.629 Y60.97 E.02177
G1 X179.187 Y91.528 E1.17101
G1 X178.811 Y91.744 E.01174
G1 X147.848 Y60.78 E1.18654
G1 X147.067 Y60.591 E.02177
G1 X178.435 Y91.959 E1.20206
G1 X178.06 Y92.174 E.01173
G1 X146.286 Y60.401 E1.21759
G1 X145.505 Y60.211 E.02177
G1 X177.684 Y92.39 E1.23311
G1 X177.308 Y92.605 E.01173
G1 X144.725 Y60.021 E1.24864
G1 X143.944 Y59.832 E.02177
G1 X176.933 Y92.821 E1.26416
G1 X176.557 Y93.036 E.01173
G1 X143.163 Y59.642 E1.27969
G1 X142.382 Y59.452 E.02177
G1 X176.181 Y93.251 E1.29522
G1 X175.805 Y93.467 E.01174
G1 X141.601 Y59.262 E1.31074
G1 X140.82 Y59.073 E.02177
G1 X175.43 Y93.682 E1.32627
G1 X175.054 Y93.897 E.01173
G1 X140.04 Y58.883 E1.34179
G1 X139.259 Y58.693 E.02177
G1 X174.678 Y94.113 E1.35732
G1 X174.303 Y94.328 E.01173
G1 X138.478 Y58.503 E1.37284
G1 X137.697 Y58.314 E.02177
G1 X173.927 Y94.544 E1.38837
G1 X173.551 Y94.759 E.01173
G1 X136.916 Y58.124 E1.40389
G1 X136.135 Y57.934 E.02177
G1 X173.175 Y94.974 E1.41942
G1 X172.8 Y95.19 E.01173
G1 X135.355 Y57.745 E1.43494
G1 X134.574 Y57.555 E.02177
G1 X172.424 Y95.405 E1.45047
G1 X172.048 Y95.621 E.01173
G1 X133.793 Y57.365 E1.46599
G1 X133.012 Y57.175 E.02177
G1 X171.673 Y95.836 E1.48152
G1 X171.297 Y96.051 E.01173
G1 X132.571 Y57.325 E1.48403
G1 X132.583 Y57.928 E.01635
G1 X170.921 Y96.267 E1.46917
G1 X170.546 Y96.482 E.01173
G1 X132.595 Y58.531 E1.45431
M73 P84 R10
G1 X132.607 Y59.135 E.01635
G1 X170.17 Y96.698 E1.43945
G1 X169.794 Y96.913 E.01173
G1 X132.619 Y59.738 E1.42459
G1 X132.631 Y60.341 E.01635
G1 X169.418 Y97.128 E1.40973
G1 X169.043 Y97.344 E.01173
G1 X132.643 Y60.944 E1.39487
G1 X132.655 Y61.547 E.01635
G1 X168.667 Y97.559 E1.38001
G1 X168.291 Y97.774 E.01173
G1 X132.667 Y62.15 E1.36515
G1 X132.679 Y62.754 E.01635
G1 X167.916 Y97.99 E1.35029
G1 X167.54 Y98.205 E.01173
G1 X132.691 Y63.357 E1.33543
G1 X132.703 Y63.96 E.01635
G1 X167.164 Y98.421 E1.32057
G1 X166.788 Y98.636 E.01173
G1 X132.716 Y64.563 E1.30571
G1 X132.728 Y65.166 E.01635
G1 X166.413 Y98.851 E1.29085
G1 X166.037 Y99.067 E.01173
G1 X132.74 Y65.769 E1.27599
G1 X132.752 Y66.373 E.01635
G1 X165.661 Y99.282 E1.26113
G1 X165.286 Y99.498 E.01173
G1 X132.764 Y66.976 E1.24627
G1 X132.776 Y67.579 E.01635
G1 X164.91 Y99.713 E1.23141
G1 X164.534 Y99.928 E.01173
G1 X132.788 Y68.182 E1.21655
G1 X132.8 Y68.785 E.01635
G1 X164.158 Y100.144 E1.20169
G1 X163.783 Y100.359 E.01174
G1 X132.812 Y69.388 E1.18683
G1 X132.824 Y69.992 E.01635
G1 X163.407 Y100.575 E1.17197
G1 X163.031 Y100.79 E.01173
G1 X132.836 Y70.595 E1.15711
G1 X132.848 Y71.198 E.01635
G1 X162.656 Y101.005 E1.14225
G1 X162.28 Y101.221 E.01174
G1 X132.86 Y71.801 E1.12739
G1 X132.872 Y72.404 E.01635
G1 X161.904 Y101.436 E1.11253
G1 X161.528 Y101.651 E.01173
G1 X132.885 Y73.007 E1.09767
G1 X132.897 Y73.611 E.01635
G1 X161.153 Y101.867 E1.08281
G1 X160.777 Y102.082 E.01173
G1 X132.909 Y74.214 E1.06795
G1 X132.921 Y74.817 E.01635
G1 X160.401 Y102.298 E1.05309
G1 X160.026 Y102.513 E.01173
G1 X132.933 Y75.42 E1.03823
G1 X132.945 Y76.023 E.01635
G1 X159.65 Y102.728 E1.02337
G1 X159.274 Y102.944 E.01174
G1 X132.957 Y76.626 E1.00851
G1 X132.969 Y77.23 E.01635
G1 X158.899 Y103.159 E.99365
G1 X158.523 Y103.375 E.01174
G1 X132.981 Y77.833 E.97879
G1 X132.993 Y78.436 E.01635
G1 X158.147 Y103.59 E.96393
G1 X157.771 Y103.805 E.01173
G1 X133.005 Y79.039 E.94907
G1 X133.017 Y79.642 E.01635
G1 X157.396 Y104.021 E.93421
G1 X157.02 Y104.236 E.01173
G1 X133.029 Y80.245 E.91935
G1 X133.041 Y80.849 E.01635
G1 X156.644 Y104.452 E.90449
G1 X156.269 Y104.667 E.01173
G1 X133.053 Y81.452 E.88963
G1 X133.066 Y82.055 E.01635
G1 X155.893 Y104.882 E.87477
G1 X155.517 Y105.098 E.01173
G1 X133.078 Y82.658 E.85991
G1 X133.09 Y83.261 E.01635
G1 X155.141 Y105.313 E.84505
G1 X154.766 Y105.528 E.01174
G1 X133.102 Y83.865 E.83018
G1 X133.114 Y84.468 E.01635
G1 X154.39 Y105.744 E.81532
G1 X154.014 Y105.959 E.01173
G1 X133.126 Y85.071 E.80047
G1 X133.138 Y85.674 E.01635
G1 X153.639 Y106.175 E.7856
G1 X153.263 Y106.39 E.01173
G1 X133.15 Y86.277 E.77074
G1 X133.162 Y86.88 E.01635
G1 X152.887 Y106.605 E.75588
G1 X152.511 Y106.821 E.01173
G1 X133.174 Y87.484 E.74102
G1 X133.186 Y88.087 E.01635
G1 X152.136 Y107.036 E.72616
G1 X151.76 Y107.252 E.01173
G1 X133.198 Y88.69 E.7113
G1 X133.21 Y89.293 E.01635
G1 X151.384 Y107.467 E.69644
G1 X151.009 Y107.682 E.01174
G1 X133.222 Y89.896 E.68158
G1 X133.235 Y90.499 E.01635
G1 X150.633 Y107.898 E.66672
G1 X150.257 Y108.113 E.01173
G1 X133.247 Y91.103 E.65186
G1 X133.259 Y91.706 E.01635
G1 X149.881 Y108.329 E.637
G1 X149.506 Y108.544 E.01173
G1 X133.271 Y92.309 E.62214
G1 X133.283 Y92.912 E.01635
G1 X149.13 Y108.759 E.60728
G1 X148.754 Y108.975 E.01173
G1 X133.295 Y93.515 E.59242
G1 X133.307 Y94.118 E.01635
G1 X148.379 Y109.19 E.57756
G1 X148.003 Y109.405 E.01173
G1 X133.319 Y94.722 E.5627
G1 X133.331 Y95.325 E.01635
G1 X147.627 Y109.621 E.54784
G1 X147.252 Y109.836 E.01174
G1 X133.343 Y95.928 E.53298
G1 X133.355 Y96.531 E.01635
G1 X146.876 Y110.052 E.51812
G1 X146.5 Y110.267 E.01173
G1 X133.367 Y97.134 E.50326
G1 X133.379 Y97.737 E.01635
G1 X146.124 Y110.482 E.4884
G1 X145.749 Y110.698 E.01173
G1 X133.391 Y98.341 E.47354
G1 X133.403 Y98.944 E.01635
G1 X144.618 Y110.158 E.42976
G1 X143.22 Y109.351 E.04376
G1 X133.416 Y99.547 E.37571
G1 X133.428 Y100.15 E.01635
G1 X141.821 Y108.544 E.32165
G1 X140.423 Y107.736 E.04376
G1 X133.44 Y100.753 E.26759
G1 X133.452 Y101.356 E.01635
G1 X139.024 Y106.929 E.21354
G1 X137.625 Y106.121 E.04376
G1 X133.464 Y101.96 E.15948
G1 X133.476 Y102.563 E.01635
G1 X136.227 Y105.314 E.10542
G1 X134.828 Y104.506 E.04376
G1 X133.297 Y102.975 E.05868
; OBJECT_ID: 353
; WIPE_START
G1 X134.711 Y104.389 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 325
M625
; start printing object, unique label id: 353
M624 AgAAAAAAAAA=
M204 S10000
G1 X140.585 Y109.263 Z2.36 F30000
G1 X215.595 Y171.5 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X149.673 Y133.707 E2.05903
G1 X149.673 Y118.293 E.41769
G1 X215.595 Y80.5 E2.05903
G1 X215.595 Y171.44 E2.4642
M204 S10000
G1 X215.996 Y172.191 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X149.272 Y133.939 E1.93364
G1 X149.272 Y118.061 E.39922
G1 X215.996 Y79.809 E1.93364
G1 X215.996 Y172.131 E2.32112
; WIPE_START
M204 S4000
G1 X214.26 Y171.138 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X215.238 Y171.101 Z2.36 F30000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X215.238 Y81.115 E2.43837
G1 X214.82 Y81.354 E.01306
G1 X214.82 Y170.646 E2.41954
G1 X214.402 Y170.406 E.01306
G1 X214.402 Y81.594 E2.40655
G1 X213.984 Y81.833 E.01306
G1 X213.984 Y170.167 E2.39357
G1 X213.566 Y169.927 E.01306
G1 X213.566 Y82.073 E2.38058
G1 X213.148 Y82.313 E.01306
G1 X213.148 Y169.687 E2.36759
G1 X212.73 Y169.448 E.01306
G1 X212.73 Y82.552 E2.35461
G1 X212.312 Y82.792 E.01306
G1 X212.312 Y169.208 E2.34162
G1 X211.894 Y168.968 E.01306
G1 X211.894 Y83.032 E2.32863
G1 X211.476 Y83.271 E.01306
G1 X211.476 Y168.729 E2.31564
G1 X211.058 Y168.489 E.01306
G1 X211.058 Y83.511 E2.30266
G1 X210.64 Y83.751 E.01306
G1 X210.64 Y168.249 E2.28967
G1 X210.222 Y168.01 E.01306
G1 X210.222 Y83.99 E2.27668
G1 X209.804 Y84.23 E.01306
G1 X209.804 Y167.77 E2.2637
G1 X209.386 Y167.531 E.01306
G1 X209.386 Y84.469 E2.25071
G1 X208.968 Y84.709 E.01306
G1 X208.968 Y167.291 E2.23772
G1 X208.55 Y167.051 E.01306
G1 X208.55 Y84.949 E2.22474
G1 X208.132 Y85.188 E.01306
G1 X208.132 Y166.812 E2.21175
G1 X207.714 Y166.572 E.01306
G1 X207.714 Y85.428 E2.19876
G1 X207.296 Y85.668 E.01306
G1 X207.296 Y166.332 E2.18578
G1 X206.878 Y166.093 E.01306
G1 X206.878 Y85.907 E2.17279
M73 P85 R10
G1 X206.46 Y86.147 E.01306
G1 X206.46 Y165.853 E2.1598
G1 X206.042 Y165.613 E.01306
G1 X206.042 Y86.387 E2.14682
G1 X205.624 Y86.626 E.01306
G1 X205.624 Y165.374 E2.13383
G1 X205.206 Y165.134 E.01306
G1 X205.206 Y86.866 E2.12084
G1 X204.788 Y87.105 E.01306
G1 X204.788 Y164.895 E2.10786
G1 X204.37 Y164.655 E.01306
G1 X204.37 Y87.345 E2.09487
G1 X203.952 Y87.585 E.01306
G1 X203.952 Y164.415 E2.08188
G1 X203.534 Y164.176 E.01306
G1 X203.534 Y87.824 E2.0689
G1 X203.116 Y88.064 E.01306
G1 X203.116 Y163.936 E2.05591
G1 X202.698 Y163.696 E.01306
G1 X202.698 Y88.304 E2.04292
G1 X202.28 Y88.543 E.01306
G1 X202.28 Y163.457 E2.02994
G1 X201.862 Y163.217 E.01306
G1 X201.862 Y88.783 E2.01695
G1 X201.444 Y89.022 E.01306
G1 X201.444 Y162.978 E2.00396
G1 X201.026 Y162.738 E.01306
G1 X201.026 Y89.262 E1.99098
G1 X200.608 Y89.502 E.01306
G1 X200.608 Y162.498 E1.97799
G1 X200.19 Y162.259 E.01306
G1 X200.19 Y89.741 E1.965
G1 X199.772 Y89.981 E.01306
G1 X199.772 Y162.019 E1.95202
G1 X199.354 Y161.779 E.01306
G1 X199.354 Y90.221 E1.93903
G1 X198.936 Y90.46 E.01306
G1 X198.936 Y161.54 E1.92604
G1 X198.518 Y161.3 E.01306
G1 X198.518 Y90.7 E1.91306
G1 X198.1 Y90.94 E.01306
G1 X198.1 Y161.06 E1.90007
G1 X197.682 Y160.821 E.01306
G1 X197.682 Y91.179 E1.88708
G1 X197.264 Y91.419 E.01306
G1 X197.264 Y160.581 E1.8741
G1 X196.846 Y160.342 E.01306
G1 X196.846 Y91.658 E1.86111
G1 X196.428 Y91.898 E.01306
G1 X196.428 Y160.102 E1.84812
G1 X196.01 Y159.862 E.01306
G1 X196.01 Y92.138 E1.83514
G1 X195.592 Y92.377 E.01306
G1 X195.592 Y159.623 E1.82215
G1 X195.174 Y159.383 E.01306
G1 X195.174 Y92.617 E1.80916
G1 X194.756 Y92.857 E.01306
G1 X194.756 Y159.143 E1.79618
G1 X194.338 Y158.904 E.01306
G1 X194.338 Y93.096 E1.78319
G1 X193.92 Y93.336 E.01306
G1 X193.92 Y158.664 E1.7702
G1 X193.502 Y158.424 E.01306
G1 X193.502 Y93.576 E1.75722
G1 X193.084 Y93.815 E.01306
G1 X193.084 Y158.185 E1.74423
G1 X192.666 Y157.945 E.01306
G1 X192.666 Y94.055 E1.73124
G1 X192.248 Y94.294 E.01306
G1 X192.248 Y157.706 E1.71826
G1 X191.83 Y157.466 E.01306
G1 X191.83 Y94.534 E1.70527
G1 X191.412 Y94.774 E.01306
G1 X191.412 Y157.226 E1.69228
G1 X190.994 Y156.987 E.01306
G1 X190.994 Y95.013 E1.6793
G1 X190.576 Y95.253 E.01306
G1 X190.576 Y156.747 E1.66631
G1 X190.158 Y156.507 E.01306
G1 X190.158 Y95.493 E1.65332
G1 X189.74 Y95.732 E.01306
G1 X189.74 Y156.268 E1.64034
G1 X189.322 Y156.028 E.01306
G1 X189.322 Y95.972 E1.62735
G1 X188.904 Y96.211 E.01306
G1 X188.904 Y155.789 E1.61436
G1 X188.486 Y155.549 E.01306
G1 X188.486 Y96.451 E1.60138
G1 X188.068 Y96.691 E.01306
G1 X188.068 Y155.309 E1.58839
G1 X187.65 Y155.07 E.01306
G1 X187.65 Y96.93 E1.5754
G1 X187.232 Y97.17 E.01306
G1 X187.232 Y154.83 E1.56241
G1 X186.814 Y154.59 E.01306
G1 X186.814 Y97.41 E1.54943
G1 X186.396 Y97.649 E.01306
G1 X186.396 Y154.351 E1.53644
G1 X185.978 Y154.111 E.01306
G1 X185.978 Y97.889 E1.52345
G1 X185.56 Y98.129 E.01306
G1 X185.56 Y153.871 E1.51047
G1 X185.142 Y153.632 E.01306
G1 X185.142 Y98.368 E1.49748
G1 X184.724 Y98.608 E.01306
G1 X184.724 Y153.392 E1.48449
G1 X184.306 Y153.153 E.01306
G1 X184.306 Y98.847 E1.47151
G1 X183.888 Y99.087 E.01306
G1 X183.888 Y152.913 E1.45852
G1 X183.47 Y152.673 E.01306
G1 X183.47 Y99.327 E1.44553
G1 X183.052 Y99.566 E.01306
G1 X183.052 Y152.434 E1.43255
G1 X182.634 Y152.194 E.01306
G1 X182.634 Y99.806 E1.41956
G1 X182.216 Y100.046 E.01306
G1 X182.216 Y151.954 E1.40657
G1 X181.798 Y151.715 E.01306
G1 X181.798 Y100.285 E1.39359
G1 X181.38 Y100.525 E.01306
G1 X181.38 Y151.475 E1.3806
G1 X180.962 Y151.235 E.01306
G1 X180.962 Y100.765 E1.36761
G1 X180.544 Y101.004 E.01306
G1 X180.544 Y150.996 E1.35463
G1 X180.126 Y150.756 E.01306
G1 X180.126 Y101.244 E1.34164
G1 X179.708 Y101.483 E.01306
G1 X179.708 Y150.517 E1.32865
G1 X179.29 Y150.277 E.01306
G1 X179.29 Y101.723 E1.31567
G1 X178.872 Y101.963 E.01306
G1 X178.872 Y150.037 E1.30268
G1 X178.454 Y149.798 E.01306
G1 X178.454 Y102.202 E1.28969
G1 X178.036 Y102.442 E.01306
G1 X178.036 Y149.558 E1.27671
G1 X177.618 Y149.318 E.01306
G1 X177.618 Y102.682 E1.26372
M73 P85 R9
G1 X177.2 Y102.921 E.01306
G1 X177.2 Y149.079 E1.25073
G1 X176.782 Y148.839 E.01306
G1 X176.782 Y103.161 E1.23775
G1 X176.364 Y103.4 E.01306
G1 X176.364 Y148.599 E1.22476
G1 X175.946 Y148.36 E.01306
G1 X175.946 Y103.64 E1.21177
G1 X175.528 Y103.88 E.01306
G1 X175.528 Y148.12 E1.19879
G1 X175.11 Y147.881 E.01306
G1 X175.11 Y104.119 E1.1858
G1 X174.692 Y104.359 E.01306
G1 X174.692 Y147.641 E1.17281
G1 X174.274 Y147.401 E.01306
G1 X174.274 Y104.599 E1.15983
G1 X173.856 Y104.838 E.01306
G1 X173.856 Y147.162 E1.14684
G1 X173.438 Y146.922 E.01306
G1 X173.438 Y105.078 E1.13385
G1 X173.02 Y105.318 E.01306
G1 X173.02 Y146.682 E1.12087
G1 X172.602 Y146.443 E.01306
G1 X172.602 Y105.557 E1.10788
G1 X172.184 Y105.797 E.01306
G1 X172.184 Y146.203 E1.09489
G1 X171.766 Y145.964 E.01306
G1 X171.766 Y106.036 E1.08191
G1 X171.348 Y106.276 E.01306
G1 X171.348 Y145.724 E1.06892
G1 X170.93 Y145.484 E.01306
G1 X170.93 Y106.516 E1.05593
G1 X170.512 Y106.755 E.01306
G1 X170.512 Y145.245 E1.04295
G1 X170.094 Y145.005 E.01306
G1 X170.094 Y106.995 E1.02996
G1 X169.676 Y107.235 E.01306
G1 X169.676 Y144.765 E1.01697
G1 X169.258 Y144.526 E.01306
G1 X169.258 Y107.474 E1.00399
G1 X168.84 Y107.714 E.01306
G1 X168.84 Y144.286 E.991
G1 X168.422 Y144.046 E.01306
G1 X168.422 Y107.954 E.97801
G1 X168.004 Y108.193 E.01306
G1 X168.004 Y143.807 E.96503
G1 X167.586 Y143.567 E.01306
G1 X167.586 Y108.433 E.95204
G1 X167.168 Y108.672 E.01306
G1 X167.168 Y143.328 E.93905
G1 X166.75 Y143.088 E.01306
G1 X166.75 Y108.912 E.92607
G1 X166.332 Y109.152 E.01306
G1 X166.332 Y142.848 E.91308
G1 X165.914 Y142.609 E.01306
G1 X165.914 Y109.391 E.90009
G1 X165.496 Y109.631 E.01306
G1 X165.496 Y142.369 E.88711
G1 X165.078 Y142.129 E.01306
G1 X165.078 Y109.871 E.87412
G1 X164.66 Y110.11 E.01306
G1 X164.66 Y141.89 E.86113
M73 P86 R9
G1 X164.242 Y141.65 E.01306
G1 X164.242 Y110.35 E.84815
G1 X163.824 Y110.589 E.01306
G1 X163.824 Y141.41 E.83516
G1 X163.406 Y141.171 E.01306
G1 X163.406 Y110.829 E.82217
G1 X162.988 Y111.069 E.01306
G1 X162.988 Y140.931 E.80918
G1 X162.57 Y140.692 E.01306
G1 X162.57 Y111.308 E.7962
G1 X162.152 Y111.548 E.01306
G1 X162.152 Y140.452 E.78321
G1 X161.734 Y140.212 E.01306
G1 X161.734 Y111.788 E.77022
G1 X161.316 Y112.027 E.01306
G1 X161.316 Y139.973 E.75724
G1 X160.898 Y139.733 E.01306
G1 X160.898 Y112.267 E.74425
G1 X160.48 Y112.507 E.01306
G1 X160.48 Y139.493 E.73126
G1 X160.062 Y139.254 E.01306
G1 X160.062 Y112.746 E.71828
G1 X159.644 Y112.986 E.01306
G1 X159.644 Y139.014 E.70529
G1 X159.226 Y138.775 E.01306
G1 X159.226 Y113.225 E.6923
G1 X158.808 Y113.465 E.01306
G1 X158.808 Y138.535 E.67932
G1 X158.39 Y138.295 E.01306
G1 X158.39 Y113.705 E.66633
G1 X157.972 Y113.944 E.01306
G1 X157.972 Y138.056 E.65334
G1 X157.554 Y137.816 E.01306
G1 X157.554 Y114.184 E.64036
G1 X157.136 Y114.424 E.01306
G1 X157.136 Y137.576 E.62737
G1 X156.718 Y137.337 E.01306
G1 X156.718 Y114.663 E.61438
G1 X156.3 Y114.903 E.01306
G1 X156.3 Y137.097 E.6014
G1 X155.882 Y136.857 E.01306
G1 X155.882 Y115.143 E.58841
G1 X155.464 Y115.382 E.01306
G1 X155.464 Y136.618 E.57542
G1 X155.046 Y136.378 E.01306
G1 X155.046 Y115.622 E.56244
G1 X154.628 Y115.861 E.01306
G1 X154.628 Y136.139 E.54945
G1 X154.21 Y135.899 E.01306
G1 X154.21 Y116.101 E.53646
G1 X153.792 Y116.341 E.01306
G1 X153.792 Y135.659 E.52348
G1 X153.374 Y135.42 E.01306
G1 X153.374 Y116.58 E.51049
G1 X152.956 Y116.82 E.01306
G1 X152.956 Y135.18 E.4975
G1 X152.538 Y134.94 E.01306
G1 X152.538 Y117.06 E.48452
G1 X152.12 Y117.299 E.01306
G1 X152.12 Y134.701 E.47153
G1 X151.702 Y134.461 E.01306
G1 X151.702 Y117.539 E.45854
G1 X151.284 Y117.778 E.01306
G1 X151.284 Y134.221 E.44556
G1 X150.866 Y133.982 E.01306
G1 X150.866 Y118.018 E.43257
G1 X150.448 Y118.258 E.01306
G1 X150.448 Y133.742 E.41958
G1 X150.03 Y133.503 E.01306
G1 X150.03 Y118.282 E.41244
; OBJECT_ID: 381
; WIPE_START
G1 X150.03 Y120.282 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 353
M625
; start printing object, unique label id: 381
M624 BAAAAAAAAAA=
M204 S10000
G1 X155.515 Y125.59 Z2.36 F30000
G1 X208.476 Y176.853 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X132.201 Y195.388 E2.12698
G1 X133.148 Y148.053 E1.28288
G1 X145.65 Y140.836 E.39116
G1 X208.424 Y176.823 E1.9607
; WIPE_START
G1 X206.481 Y177.296 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.547 Y177.005 Z2.36 F30000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X131.814 Y195.894 E2.01117
G1 X131.79 Y195.875 E.00078
G1 X132.752 Y147.819 E1.20842
G1 X145.649 Y140.373 E.37441
G1 X145.729 Y140.419 E.00233
G1 X209.495 Y176.975 E1.84791
; WIPE_START
M204 S4000
G1 X207.551 Y177.448 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X206.938 Y177.053 Z2.36 F30000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.365 Y176.626 E.01637
G1 X206.989 Y176.411 E.01173
G1 X206.411 Y176.989 E.02215
G1 X205.63 Y177.178 E.02177
G1 X206.614 Y176.195 E.03768
G1 X206.238 Y175.98 E.01173
G1 X204.85 Y177.368 E.0532
G1 X204.069 Y177.558 E.02177
G1 X205.862 Y175.764 E.06873
G1 X205.487 Y175.549 E.01173
G1 X203.288 Y177.748 E.08425
G1 X202.507 Y177.937 E.02177
G1 X205.111 Y175.334 E.09978
G1 X204.735 Y175.118 E.01173
G1 X201.726 Y178.127 E.1153
G1 X200.945 Y178.317 E.02177
G1 X204.359 Y174.903 E.13083
G1 X203.984 Y174.688 E.01173
G1 X200.165 Y178.507 E.14635
G1 X199.384 Y178.696 E.02177
G1 X203.608 Y174.472 E.16188
G1 X203.232 Y174.257 E.01173
G1 X198.603 Y178.886 E.1774
G1 X197.822 Y179.076 E.02177
G1 X202.857 Y174.041 E.19293
G1 X202.481 Y173.826 E.01174
G1 X197.041 Y179.266 E.20845
G1 X196.26 Y179.455 E.02177
G1 X202.105 Y173.611 E.22398
G1 X201.729 Y173.395 E.01173
G1 X195.48 Y179.645 E.2395
G1 X194.699 Y179.835 E.02177
G1 X201.354 Y173.18 E.25503
G1 X200.978 Y172.964 E.01173
G1 X193.918 Y180.025 E.27055
G1 X193.137 Y180.214 E.02177
G1 X200.602 Y172.749 E.28608
G1 X200.227 Y172.534 E.01173
G1 X192.356 Y180.404 E.3016
G1 X191.575 Y180.594 E.02177
G1 X199.851 Y172.318 E.31713
G1 X199.475 Y172.103 E.01173
G1 X190.794 Y180.784 E.33265
G1 X190.014 Y180.973 E.02177
G1 X199.099 Y171.887 E.34818
G1 X198.724 Y171.672 E.01174
G1 X189.233 Y181.163 E.36371
G1 X188.452 Y181.353 E.02177
G1 X198.348 Y171.457 E.37923
G1 X197.972 Y171.241 E.01173
G1 X187.671 Y181.543 E.39476
G1 X186.89 Y181.732 E.02177
G1 X197.597 Y171.026 E.41028
G1 X197.221 Y170.811 E.01173
G1 X186.109 Y181.922 E.42581
G1 X185.329 Y182.112 E.02177
G1 X196.845 Y170.595 E.44133
G1 X196.47 Y170.38 E.01173
G1 X184.548 Y182.302 E.45686
G1 X183.767 Y182.491 E.02177
G1 X196.094 Y170.164 E.47238
G1 X195.718 Y169.949 E.01173
G1 X182.986 Y182.681 E.48791
G1 X182.205 Y182.871 E.02177
G1 X195.342 Y169.734 E.50343
G1 X194.967 Y169.518 E.01174
G1 X181.424 Y183.061 E.51896
G1 X180.643 Y183.25 E.02177
G1 X194.591 Y169.303 E.53448
G1 X194.215 Y169.087 E.01174
G1 X179.863 Y183.44 E.55001
G1 X179.082 Y183.63 E.02177
G1 X193.84 Y168.872 E.56553
G1 X193.464 Y168.657 E.01174
G1 X178.301 Y183.82 E.58106
G1 X177.52 Y184.009 E.02177
G1 X193.088 Y168.441 E.59658
G1 X192.712 Y168.226 E.01173
G1 X176.739 Y184.199 E.61211
G1 X175.958 Y184.389 E.02177
G1 X192.337 Y168.01 E.62763
G1 X191.961 Y167.795 E.01173
G1 X175.178 Y184.578 E.64316
G1 X174.397 Y184.768 E.02177
G1 X191.585 Y167.58 E.65868
G1 X191.21 Y167.364 E.01174
G1 X173.616 Y184.958 E.67421
G1 X172.835 Y185.148 E.02177
G1 X190.834 Y167.149 E.68973
G1 X190.458 Y166.934 E.01174
G1 X172.054 Y185.337 E.70526
G1 X171.273 Y185.527 E.02177
G1 X190.082 Y166.718 E.72078
G1 X189.707 Y166.503 E.01174
G1 X170.493 Y185.717 E.73631
G1 X169.712 Y185.907 E.02177
G1 X189.331 Y166.287 E.75183
G1 X188.955 Y166.072 E.01173
G1 X168.931 Y186.096 E.76736
G1 X168.15 Y186.286 E.02177
G1 X188.58 Y165.857 E.78288
G1 X188.204 Y165.641 E.01173
G1 X167.369 Y186.476 E.79841
G1 X166.588 Y186.666 E.02177
G1 X187.828 Y165.426 E.81393
G1 X187.452 Y165.21 E.01173
G1 X165.807 Y186.855 E.82946
G1 X165.027 Y187.045 E.02177
G1 X187.077 Y164.995 E.84498
G1 X186.701 Y164.78 E.01173
G1 X164.246 Y187.235 E.86051
G1 X163.465 Y187.425 E.02177
G1 X186.325 Y164.564 E.87603
G1 X185.95 Y164.349 E.01174
G1 X162.684 Y187.614 E.89156
G1 X161.903 Y187.804 E.02177
G1 X185.574 Y164.133 E.90709
G1 X185.198 Y163.918 E.01173
G1 X161.122 Y187.994 E.92261
G1 X160.342 Y188.184 E.02177
G1 X184.823 Y163.703 E.93814
G1 X184.447 Y163.487 E.01173
G1 X159.561 Y188.373 E.95366
G1 X158.78 Y188.563 E.02177
G1 X184.071 Y163.272 E.96919
G1 X183.695 Y163.057 E.01174
G1 X157.999 Y188.753 E.98471
G1 X157.218 Y188.943 E.02177
G1 X183.32 Y162.841 E1.00024
G1 X182.944 Y162.626 E.01173
G1 X156.437 Y189.132 E1.01576
G1 X155.656 Y189.322 E.02177
G1 X182.568 Y162.41 E1.03129
G1 X182.193 Y162.195 E.01173
G1 X154.876 Y189.512 E1.04681
G1 X154.095 Y189.702 E.02177
G1 X181.817 Y161.98 E1.06234
G1 X181.441 Y161.764 E.01173
G1 X153.314 Y189.891 E1.07786
G1 X152.533 Y190.081 E.02177
G1 X181.065 Y161.549 E1.09339
G1 X180.69 Y161.333 E.01173
G1 X151.752 Y190.271 E1.10891
G1 X150.971 Y190.461 E.02177
G1 X180.314 Y161.118 E1.12444
G1 X179.938 Y160.903 E.01173
G1 X150.191 Y190.65 E1.13996
G1 X149.41 Y190.84 E.02177
G1 X179.563 Y160.687 E1.15549
G1 X179.187 Y160.472 E.01173
G1 X148.629 Y191.03 E1.17101
G1 X147.848 Y191.22 E.02177
G1 X178.811 Y160.256 E1.18654
G1 X178.435 Y160.041 E.01173
G1 X147.067 Y191.409 E1.20206
G1 X146.286 Y191.599 E.02177
G1 X178.06 Y159.826 E1.21759
G1 X177.684 Y159.61 E.01173
G1 X145.506 Y191.789 E1.23311
G1 X144.725 Y191.979 E.02177
G1 X177.308 Y159.395 E1.24864
G1 X176.933 Y159.18 E.01173
G1 X143.944 Y192.168 E1.26416
G1 X143.163 Y192.358 E.02177
G1 X176.557 Y158.964 E1.27969
G1 X176.181 Y158.749 E.01173
G1 X142.382 Y192.548 E1.29521
G1 X141.601 Y192.738 E.02177
G1 X175.805 Y158.533 E1.31074
G1 X175.43 Y158.318 E.01173
G1 X140.82 Y192.927 E1.32626
G1 X140.04 Y193.117 E.02177
G1 X175.054 Y158.103 E1.34179
G1 X174.678 Y157.887 E.01173
G1 X139.259 Y193.307 E1.35731
G1 X138.478 Y193.496 E.02177
G1 X174.303 Y157.672 E1.37284
G1 X173.927 Y157.456 E.01173
G1 X137.697 Y193.686 E1.38836
G1 X136.916 Y193.876 E.02177
G1 X173.551 Y157.241 E1.40389
G1 X173.176 Y157.026 E.01173
G1 X136.135 Y194.066 E1.41941
G1 X135.355 Y194.255 E.02177
G1 X172.8 Y156.81 E1.43494
G1 X172.424 Y156.595 E.01174
G1 X134.574 Y194.445 E1.45047
G1 X133.793 Y194.635 E.02177
G1 X172.048 Y156.379 E1.46599
G1 X171.673 Y156.164 E.01174
G1 X133.012 Y194.825 E1.48152
G1 X132.566 Y194.933 E.01245
G1 X132.571 Y194.675 E.007
G1 X171.297 Y155.949 E1.48403
G1 X170.921 Y155.733 E.01173
G1 X132.583 Y194.072 E1.46917
G1 X132.595 Y193.469 E.01635
G1 X170.546 Y155.518 E1.45431
G1 X170.17 Y155.303 E.01173
G1 X132.607 Y192.865 E1.43945
G1 X132.619 Y192.262 E.01635
G1 X169.794 Y155.087 E1.42459
G1 X169.418 Y154.872 E.01173
G1 X132.631 Y191.659 E1.40973
G1 X132.643 Y191.056 E.01635
G1 X169.043 Y154.656 E1.39487
G1 X168.667 Y154.441 E.01174
G1 X132.655 Y190.453 E1.38001
G1 X132.667 Y189.85 E.01635
G1 X168.291 Y154.226 E1.36515
G1 X167.916 Y154.01 E.01174
G1 X132.679 Y189.246 E1.35029
G1 X132.691 Y188.643 E.01635
G1 X167.54 Y153.795 E1.33543
G1 X167.164 Y153.579 E.01173
G1 X132.703 Y188.04 E1.32057
G1 X132.716 Y187.437 E.01635
G1 X166.788 Y153.364 E1.30571
G1 X166.413 Y153.149 E.01173
G1 X132.728 Y186.834 E1.29085
G1 X132.74 Y186.231 E.01635
G1 X166.037 Y152.933 E1.27599
G1 X165.661 Y152.718 E.01173
G1 X132.752 Y185.627 E1.26113
G1 X132.764 Y185.024 E.01635
G1 X165.286 Y152.502 E1.24627
G1 X164.91 Y152.287 E.01173
G1 X132.776 Y184.421 E1.23141
G1 X132.788 Y183.818 E.01635
G1 X164.534 Y152.072 E1.21655
G1 X164.158 Y151.856 E.01173
G1 X132.8 Y183.215 E1.20169
G1 X132.812 Y182.612 E.01635
G1 X163.783 Y151.641 E1.18683
G1 X163.407 Y151.426 E.01173
G1 X132.824 Y182.008 E1.17197
G1 X132.836 Y181.405 E.01635
G1 X163.031 Y151.21 E1.15711
G1 X162.656 Y150.995 E.01174
G1 X132.848 Y180.802 E1.14225
G1 X132.86 Y180.199 E.01635
G1 X162.28 Y150.779 E1.12739
G1 X161.904 Y150.564 E.01173
G1 X132.872 Y179.596 E1.11253
G1 X132.885 Y178.993 E.01635
G1 X161.529 Y150.349 E1.09767
G1 X161.153 Y150.133 E.01173
G1 X132.897 Y178.389 E1.08281
G1 X132.909 Y177.786 E.01635
G1 X160.777 Y149.918 E1.06795
G1 X160.401 Y149.702 E.01173
G1 X132.921 Y177.183 E1.05309
G1 X132.933 Y176.58 E.01635
G1 X160.026 Y149.487 E1.03823
G1 X159.65 Y149.272 E.01173
G1 X132.945 Y175.977 E1.02337
G1 X132.957 Y175.374 E.01635
G1 X159.274 Y149.056 E1.00851
G1 X158.899 Y148.841 E.01174
G1 X132.969 Y174.77 E.99365
G1 X132.981 Y174.167 E.01635
G1 X158.523 Y148.625 E.97879
G1 X158.147 Y148.41 E.01173
G1 X132.993 Y173.564 E.96393
G1 X133.005 Y172.961 E.01635
G1 X157.771 Y148.195 E.94907
G1 X157.396 Y147.979 E.01173
G1 X133.017 Y172.358 E.93421
G1 X133.029 Y171.755 E.01635
G1 X157.02 Y147.764 E.91935
M73 P87 R9
G1 X156.644 Y147.549 E.01173
G1 X133.041 Y171.151 E.90449
G1 X133.053 Y170.548 E.01635
G1 X156.269 Y147.333 E.88963
G1 X155.893 Y147.118 E.01173
G1 X133.066 Y169.945 E.87477
G1 X133.078 Y169.342 E.01635
G1 X155.517 Y146.902 E.85991
G1 X155.141 Y146.687 E.01174
G1 X133.09 Y168.739 E.84505
G1 X133.102 Y168.136 E.01635
G1 X154.766 Y146.472 E.83019
G1 X154.39 Y146.256 E.01173
G1 X133.114 Y167.532 E.81533
G1 X133.126 Y166.929 E.01635
G1 X154.014 Y146.041 E.80047
G1 X153.639 Y145.825 E.01174
G1 X133.138 Y166.326 E.78561
G1 X133.15 Y165.723 E.01635
G1 X153.263 Y145.61 E.77075
G1 X152.887 Y145.395 E.01173
G1 X133.162 Y165.12 E.75589
G1 X133.174 Y164.517 E.01635
G1 X152.511 Y145.179 E.74103
G1 X152.136 Y144.964 E.01173
G1 X133.186 Y163.913 E.72617
G1 X133.198 Y163.31 E.01635
G1 X151.76 Y144.748 E.71131
G1 X151.384 Y144.533 E.01174
G1 X133.21 Y162.707 E.69645
G1 X133.222 Y162.104 E.01635
G1 X151.009 Y144.318 E.68158
G1 X150.633 Y144.102 E.01173
G1 X133.235 Y161.501 E.66672
G1 X133.247 Y160.898 E.01635
G1 X150.257 Y143.887 E.65187
G1 X149.881 Y143.672 E.01174
G1 X133.259 Y160.294 E.637
G1 X133.271 Y159.691 E.01635
G1 X149.506 Y143.456 E.62214
G1 X149.13 Y143.241 E.01174
G1 X133.283 Y159.088 E.60728
G1 X133.295 Y158.485 E.01635
G1 X148.754 Y143.025 E.59242
G1 X148.379 Y142.81 E.01173
G1 X133.307 Y157.882 E.57756
G1 X133.319 Y157.279 E.01635
G1 X148.003 Y142.595 E.5627
G1 X147.627 Y142.379 E.01173
G1 X133.331 Y156.675 E.54784
G1 X133.343 Y156.072 E.01635
G1 X147.252 Y142.164 E.53298
G1 X146.876 Y141.948 E.01173
G1 X133.355 Y155.469 E.51812
G1 X133.367 Y154.866 E.01635
G1 X146.5 Y141.733 E.50326
G1 X146.124 Y141.518 E.01174
G1 X133.379 Y154.263 E.4884
G1 X133.391 Y153.66 E.01635
G1 X145.749 Y141.302 E.47354
G1 X145.65 Y141.246 E.00308
G1 X144.618 Y141.841 E.03228
G1 X133.403 Y153.056 E.42977
M73 P87 R8
G1 X133.416 Y152.453 E.01635
G1 X143.22 Y142.649 E.37571
G1 X141.821 Y143.456 E.04376
G1 X133.428 Y151.85 E.32165
G1 X133.44 Y151.247 E.01635
G1 X140.423 Y144.264 E.2676
G1 X139.024 Y145.071 E.04376
G1 X133.452 Y150.644 E.21354
G1 X133.464 Y150.041 E.01635
G1 X137.626 Y145.879 E.15948
G1 X136.227 Y146.686 E.04376
G1 X133.476 Y149.437 E.10543
G1 X133.488 Y148.834 E.01635
G1 X135.339 Y146.983 E.07095
; OBJECT_ID: 409
; WIPE_START
G1 X133.925 Y148.397 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 381
M625
; start printing object, unique label id: 409
M624 CAAAAAAAAAA=
M204 S10000
G1 X126.676 Y150.784 Z2.36 F30000
G1 X47.524 Y176.853 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X110.35 Y140.836 E1.96232
G1 X122.852 Y148.053 E.39116
G1 X123.799 Y195.388 E1.28288
G1 X47.582 Y176.867 E2.12535
; WIPE_START
G1 X49.317 Y175.871 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.453 Y177.005 Z2.36 F30000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X110.351 Y140.373 E1.85175
G1 X110.432 Y140.42 E.00233
G1 X123.248 Y147.819 E.37207
G1 X124.21 Y195.875 E1.20842
G1 X124.186 Y195.894 E.00078
G1 X46.512 Y177.019 E2.00966
; WIPE_START
M204 S4000
G1 X48.246 Y176.024 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.499 Y176.488 Z2.36 F30000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.81 Y176.8 E.01192
G1 X49.591 Y176.989 E.02177
G1 X49.012 Y176.41 E.0222
G1 X49.387 Y176.195 E.01174
G1 X50.372 Y177.179 E.03772
G1 X51.153 Y177.369 E.02177
G1 X49.763 Y175.979 E.05325
G1 X50.139 Y175.764 E.01173
G1 X51.934 Y177.558 E.06877
G1 X52.714 Y177.748 E.02177
G1 X50.515 Y175.548 E.0843
G1 X50.89 Y175.333 E.01174
G1 X53.495 Y177.938 E.09982
G1 X54.276 Y178.128 E.02177
G1 X51.266 Y175.118 E.11535
G1 X51.642 Y174.902 E.01173
G1 X55.057 Y178.317 E.13087
G1 X55.838 Y178.507 E.02177
G1 X52.017 Y174.687 E.1464
G1 X52.393 Y174.471 E.01173
G1 X56.619 Y178.697 E.16192
G1 X57.399 Y178.887 E.02177
G1 X52.769 Y174.256 E.17745
G1 X53.145 Y174.041 E.01173
G1 X58.18 Y179.076 E.19298
G1 X58.961 Y179.266 E.02177
G1 X53.52 Y173.825 E.2085
G1 X53.896 Y173.61 E.01173
G1 X59.742 Y179.456 E.22403
G1 X60.523 Y179.646 E.02177
G1 X54.272 Y173.395 E.23955
G1 X54.647 Y173.179 E.01174
G1 X61.304 Y179.835 E.25508
G1 X62.085 Y180.025 E.02177
G1 X55.023 Y172.964 E.2706
G1 X55.399 Y172.748 E.01173
G1 X62.865 Y180.215 E.28613
G1 X63.646 Y180.405 E.02177
G1 X55.775 Y172.533 E.30165
G1 X56.15 Y172.318 E.01173
G1 X64.427 Y180.594 E.31718
G1 X65.208 Y180.784 E.02177
G1 X56.526 Y172.102 E.3327
G1 X56.902 Y171.887 E.01173
G1 X65.989 Y180.974 E.34823
G1 X66.77 Y181.164 E.02177
G1 X57.277 Y171.671 E.36375
G1 X57.653 Y171.456 E.01173
G1 X67.55 Y181.353 E.37928
G1 X68.331 Y181.543 E.02177
G1 X58.029 Y171.241 E.3948
G1 X58.405 Y171.025 E.01174
G1 X69.112 Y181.733 E.41033
G1 X69.893 Y181.923 E.02177
G1 X58.78 Y170.81 E.42585
G1 X59.156 Y170.594 E.01173
G1 X70.674 Y182.112 E.44138
G1 X71.455 Y182.302 E.02177
G1 X59.532 Y170.379 E.4569
G1 X59.907 Y170.164 E.01173
G1 X72.236 Y182.492 E.47243
G1 X73.016 Y182.682 E.02177
G1 X60.283 Y169.948 E.48795
G1 X60.659 Y169.733 E.01174
G1 X73.797 Y182.871 E.50348
G1 X74.578 Y183.061 E.02177
G1 X61.034 Y169.518 E.519
G1 X61.41 Y169.302 E.01173
G1 X75.359 Y183.251 E.53453
G1 X76.14 Y183.441 E.02177
G1 X61.786 Y169.087 E.55005
G1 X62.162 Y168.871 E.01174
G1 X76.921 Y183.63 E.56558
G1 X77.701 Y183.82 E.02177
G1 X62.537 Y168.656 E.5811
G1 X62.913 Y168.441 E.01173
G1 X78.482 Y184.01 E.59663
G1 X79.263 Y184.2 E.02177
G1 X63.289 Y168.225 E.61215
G1 X63.664 Y168.01 E.01173
G1 X80.044 Y184.389 E.62768
G1 X80.825 Y184.579 E.02177
G1 X64.04 Y167.794 E.64321
G1 X64.416 Y167.579 E.01173
G1 X81.606 Y184.769 E.65873
G1 X82.386 Y184.959 E.02177
G1 X64.792 Y167.364 E.67426
G1 X65.167 Y167.148 E.01173
G1 X83.167 Y185.148 E.68978
G1 X83.948 Y185.338 E.02177
G1 X65.543 Y166.933 E.70531
G1 X65.919 Y166.717 E.01174
G1 X84.729 Y185.528 E.72083
G1 X85.51 Y185.718 E.02177
G1 X66.294 Y166.502 E.73636
G1 X66.67 Y166.287 E.01173
G1 X86.291 Y185.907 E.75188
G1 X87.072 Y186.097 E.02177
G1 X67.046 Y166.071 E.76741
G1 X67.422 Y165.856 E.01174
G1 X87.852 Y186.287 E.78293
G1 X88.633 Y186.477 E.02177
G1 X67.797 Y165.641 E.79846
G1 X68.173 Y165.425 E.01173
G1 X89.414 Y186.666 E.81398
G1 X90.195 Y186.856 E.02177
G1 X68.549 Y165.21 E.82951
G1 X68.924 Y164.994 E.01173
G1 X90.976 Y187.046 E.84503
G1 X91.757 Y187.235 E.02177
G1 X69.3 Y164.779 E.86056
G1 X69.676 Y164.564 E.01173
G1 X92.537 Y187.425 E.87608
G1 X93.318 Y187.615 E.02177
G1 X70.052 Y164.348 E.89161
G1 X70.427 Y164.133 E.01173
G1 X94.099 Y187.805 E.90713
G1 X94.88 Y187.994 E.02177
G1 X70.803 Y163.917 E.92266
G1 X71.179 Y163.702 E.01174
G1 X95.661 Y188.184 E.93818
G1 X96.442 Y188.374 E.02177
G1 X71.554 Y163.487 E.95371
G1 X71.93 Y163.271 E.01173
G1 X97.223 Y188.564 E.96923
G1 X98.003 Y188.753 E.02177
G1 X72.306 Y163.056 E.98476
G1 X72.681 Y162.84 E.01173
G1 X98.784 Y188.943 E1.00028
G1 X99.565 Y189.133 E.02177
G1 X73.057 Y162.625 E1.01581
G1 X73.433 Y162.41 E.01173
G1 X100.346 Y189.323 E1.03133
G1 X101.127 Y189.512 E.02177
G1 X73.809 Y162.194 E1.04686
G1 X74.184 Y161.979 E.01173
G1 X101.908 Y189.702 E1.06238
G1 X102.688 Y189.892 E.02177
G1 X74.56 Y161.764 E1.07791
G1 X74.936 Y161.548 E.01174
G1 X103.469 Y190.082 E1.09343
G1 X104.25 Y190.271 E.02177
G1 X75.311 Y161.333 E1.10896
G1 X75.687 Y161.117 E.01173
G1 X105.031 Y190.461 E1.12449
G1 X105.812 Y190.651 E.02177
G1 X76.063 Y160.902 E1.14001
G1 X76.439 Y160.687 E.01173
G1 X106.593 Y190.841 E1.15554
G1 X107.374 Y191.03 E.02177
G1 X76.814 Y160.471 E1.17106
G1 X77.19 Y160.256 E.01173
G1 X108.154 Y191.22 E1.18659
G1 X108.935 Y191.41 E.02177
G1 X77.566 Y160.04 E1.20211
G1 X77.941 Y159.825 E.01173
G1 X109.716 Y191.6 E1.21764
G1 X110.497 Y191.789 E.02177
G1 X78.317 Y159.61 E1.23316
G1 X78.693 Y159.394 E.01173
G1 X111.278 Y191.979 E1.24869
G1 X112.059 Y192.169 E.02177
G1 X79.069 Y159.179 E1.26421
G1 X79.444 Y158.963 E.01173
G1 X112.839 Y192.359 E1.27974
G1 X113.62 Y192.548 E.02177
G1 X79.82 Y158.748 E1.29526
G1 X80.196 Y158.533 E.01173
G1 X114.401 Y192.738 E1.31079
G1 X115.182 Y192.928 E.02177
G1 X80.571 Y158.317 E1.32631
G1 X80.947 Y158.102 E.01173
G1 X115.963 Y193.118 E1.34184
G1 X116.744 Y193.307 E.02177
G1 X81.323 Y157.887 E1.35736
G1 X81.699 Y157.671 E.01173
G1 X117.524 Y193.497 E1.37289
G1 X118.305 Y193.687 E.02177
G1 X82.074 Y157.456 E1.38841
G1 X82.45 Y157.24 E.01173
G1 X119.086 Y193.877 E1.40394
G1 X119.867 Y194.066 E.02177
G1 X82.826 Y157.025 E1.41946
G1 X83.201 Y156.81 E.01173
G1 X120.648 Y194.256 E1.43499
G1 X121.429 Y194.446 E.02177
G1 X83.577 Y156.594 E1.45051
G1 X83.953 Y156.379 E.01174
G1 X122.21 Y194.636 E1.46604
G1 X122.99 Y194.825 E.02177
G1 X84.328 Y156.163 E1.48156
G1 X84.704 Y155.948 E.01173
G1 X123.429 Y194.673 E1.48398
G1 X123.417 Y194.07 E.01635
G1 X85.08 Y155.733 E1.46912
G1 X85.456 Y155.517 E.01173
G1 X123.405 Y193.467 E1.45426
G1 X123.393 Y192.864 E.01635
G1 X85.831 Y155.302 E1.4394
G1 X86.207 Y155.086 E.01173
G1 X123.381 Y192.26 E1.42454
G1 X123.369 Y191.657 E.01635
G1 X86.583 Y154.871 E1.40968
G1 X86.958 Y154.656 E.01173
G1 X123.357 Y191.054 E1.39482
G1 X123.345 Y190.451 E.01635
G1 X87.334 Y154.44 E1.37996
G1 X87.71 Y154.225 E.01174
G1 X123.333 Y189.848 E1.3651
G1 X123.321 Y189.245 E.01635
G1 X88.086 Y154.01 E1.35024
G1 X88.461 Y153.794 E.01173
G1 X123.309 Y188.641 E1.33538
G1 X123.296 Y188.038 E.01635
G1 X88.837 Y153.579 E1.32052
G1 X89.213 Y153.363 E.01173
G1 X123.284 Y187.435 E1.30566
G1 X123.272 Y186.832 E.01635
G1 X89.588 Y153.148 E1.2908
G1 X89.964 Y152.933 E.01173
G1 X123.26 Y186.229 E1.27594
G1 X123.248 Y185.626 E.01635
G1 X90.34 Y152.717 E1.26108
G1 X90.716 Y152.502 E.01173
G1 X123.236 Y185.022 E1.24622
G1 X123.224 Y184.419 E.01635
G1 X91.091 Y152.286 E1.23136
G1 X91.467 Y152.071 E.01174
G1 X123.212 Y183.816 E1.2165
G1 X123.2 Y183.213 E.01635
G1 X91.843 Y151.856 E1.20164
G1 X92.218 Y151.64 E.01173
G1 X123.188 Y182.61 E1.18678
G1 X123.176 Y182.007 E.01635
G1 X92.594 Y151.425 E1.17192
G1 X92.97 Y151.209 E.01174
G1 X123.164 Y181.403 E1.15706
G1 X123.152 Y180.8 E.01635
G1 X93.346 Y150.994 E1.1422
G1 X93.721 Y150.779 E.01173
G1 X123.14 Y180.197 E1.12734
G1 X123.128 Y179.594 E.01635
G1 X94.097 Y150.563 E1.11248
G1 X94.473 Y150.348 E.01173
G1 X123.115 Y178.991 E1.09762
G1 X123.103 Y178.388 E.01635
G1 X94.848 Y150.133 E1.08276
G1 X95.224 Y149.917 E.01173
G1 X123.091 Y177.784 E1.0679
G1 X123.079 Y177.181 E.01635
G1 X95.6 Y149.702 E1.05304
G1 X95.975 Y149.486 E.01173
G1 X123.067 Y176.578 E1.03818
G1 X123.055 Y175.975 E.01635
G1 X96.351 Y149.271 E1.02332
G1 X96.727 Y149.056 E.01174
G1 X123.043 Y175.372 E1.00846
G1 X123.031 Y174.769 E.01635
G1 X97.103 Y148.84 E.9936
G1 X97.478 Y148.625 E.01173
G1 X123.019 Y174.165 E.97874
G1 X123.007 Y173.562 E.01635
G1 X97.854 Y148.409 E.96388
G1 X98.23 Y148.194 E.01174
G1 X122.995 Y172.959 E.94902
M73 P88 R8
G1 X122.983 Y172.356 E.01635
G1 X98.605 Y147.979 E.93416
G1 X98.981 Y147.763 E.01173
G1 X122.971 Y171.753 E.9193
G1 X122.959 Y171.15 E.01635
G1 X99.357 Y147.548 E.90444
G1 X99.733 Y147.332 E.01173
G1 X122.946 Y170.546 E.88958
G1 X122.934 Y169.943 E.01635
G1 X100.108 Y147.117 E.87472
G1 X100.484 Y146.902 E.01174
G1 X122.922 Y169.34 E.85986
G1 X122.91 Y168.737 E.01635
G1 X100.86 Y146.686 E.845
G1 X101.235 Y146.471 E.01173
G1 X122.898 Y168.134 E.83014
G1 X122.886 Y167.531 E.01635
G1 X101.611 Y146.256 E.81528
G1 X101.987 Y146.04 E.01173
G1 X122.874 Y166.927 E.80042
G1 X122.862 Y166.324 E.01635
G1 X102.363 Y145.825 E.78556
G1 X102.738 Y145.609 E.01173
G1 X122.85 Y165.721 E.7707
G1 X122.838 Y165.118 E.01635
G1 X103.114 Y145.394 E.75584
G1 X103.49 Y145.179 E.01174
G1 X122.826 Y164.515 E.74098
G1 X122.814 Y163.912 E.01635
G1 X103.865 Y144.963 E.72612
G1 X104.241 Y144.748 E.01174
G1 X122.802 Y163.308 E.71126
G1 X122.79 Y162.705 E.01635
G1 X104.617 Y144.532 E.6964
G1 X104.993 Y144.317 E.01173
G1 X122.778 Y162.102 E.68154
G1 X122.765 Y161.499 E.01635
G1 X105.368 Y144.102 E.66668
G1 X105.744 Y143.886 E.01173
G1 X122.753 Y160.896 E.65182
G1 X122.741 Y160.293 E.01635
G1 X106.12 Y143.671 E.63696
G1 X106.495 Y143.455 E.01173
G1 X122.729 Y159.689 E.6221
G1 X122.717 Y159.086 E.01635
G1 X106.871 Y143.24 E.60724
G1 X107.247 Y143.025 E.01174
G1 X122.705 Y158.483 E.59238
G1 X122.693 Y157.88 E.01635
G1 X107.622 Y142.809 E.57752
G1 X107.998 Y142.594 E.01174
G1 X122.681 Y157.277 E.56266
G1 X122.669 Y156.674 E.01635
G1 X108.374 Y142.379 E.5478
G1 X108.75 Y142.163 E.01173
G1 X122.657 Y156.07 E.53294
G1 X122.645 Y155.467 E.01635
G1 X109.125 Y141.948 E.51808
G1 X109.501 Y141.732 E.01174
G1 X122.633 Y154.864 E.50322
G1 X122.621 Y154.261 E.01635
G1 X109.877 Y141.517 E.48836
G1 X110.252 Y141.302 E.01173
G1 X122.609 Y153.658 E.4735
G1 X122.596 Y153.054 E.01635
G1 X111.386 Y141.844 E.4296
G1 X112.784 Y142.651 E.04376
G1 X122.584 Y152.451 E.37554
G1 X122.572 Y151.848 E.01635
G1 X114.183 Y143.459 E.32149
G1 X115.582 Y144.266 E.04376
G1 X122.56 Y151.245 E.26743
G1 X122.548 Y150.642 E.01635
G1 X116.98 Y145.074 E.21337
G1 X118.379 Y145.881 E.04376
G1 X122.536 Y150.039 E.15932
G1 X122.524 Y149.435 E.01635
G1 X119.777 Y146.689 E.10526
G1 X121.176 Y147.496 E.04376
G1 X122.703 Y149.023 E.05852
; OBJECT_ID: 437
; WIPE_START
G1 X121.289 Y147.609 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 409
M625
; start printing object, unique label id: 437
M624 EAAAAAAAAAA=
M204 S10000
G1 X115.844 Y142.26 Z2.36 F30000
G1 X47.524 Y75.147 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X123.799 Y56.612 E2.12697
G1 X122.852 Y103.947 E1.28288
G1 X110.35 Y111.164 E.39116
G1 X47.576 Y75.177 E1.96069
; WIPE_START
G1 X49.519 Y74.704 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.453 Y74.995 Z2.36 F30000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X124.186 Y56.106 E2.01117
G1 X124.21 Y56.125 E.00078
G1 X123.248 Y104.181 E1.20842
G1 X110.351 Y111.627 E.37441
G1 X46.505 Y75.025 E1.85024
; WIPE_START
M204 S4000
G1 X48.449 Y74.552 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X49.064 Y74.946 Z2.36 F30000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.636 Y75.375 E.01642
G1 X49.012 Y75.59 E.01173
G1 X49.591 Y75.011 E.0222
G1 X50.372 Y74.821 E.02177
G1 X49.387 Y75.805 E.03772
G1 X49.763 Y76.021 E.01173
G1 X51.153 Y74.631 E.05325
G1 X51.934 Y74.442 E.02177
G1 X50.139 Y76.236 E.06877
G1 X50.515 Y76.452 E.01174
G1 X52.714 Y74.252 E.0843
G1 X53.495 Y74.062 E.02177
G1 X50.89 Y76.667 E.09982
G1 X51.266 Y76.882 E.01173
G1 X54.276 Y73.872 E.11535
G1 X55.057 Y73.683 E.02177
G1 X51.642 Y77.098 E.13087
G1 X52.017 Y77.313 E.01173
G1 X55.838 Y73.493 E.1464
G1 X56.619 Y73.303 E.02177
G1 X52.393 Y77.529 E.16192
G1 X52.769 Y77.744 E.01174
G1 X57.399 Y73.113 E.17745
G1 X58.18 Y72.924 E.02177
G1 X53.145 Y77.959 E.19298
G1 X53.52 Y78.175 E.01173
G1 X58.961 Y72.734 E.2085
G1 X59.742 Y72.544 E.02177
G1 X53.896 Y78.39 E.22403
G1 X54.272 Y78.605 E.01173
G1 X60.523 Y72.354 E.23955
G1 X61.304 Y72.165 E.02177
G1 X54.647 Y78.821 E.25508
G1 X55.023 Y79.036 E.01173
G1 X62.085 Y71.975 E.2706
G1 X62.865 Y71.785 E.02177
G1 X55.399 Y79.252 E.28613
G1 X55.775 Y79.467 E.01173
G1 X63.646 Y71.595 E.30165
G1 X64.427 Y71.406 E.02177
G1 X56.15 Y79.682 E.31718
G1 X56.526 Y79.898 E.01173
G1 X65.208 Y71.216 E.3327
G1 X65.989 Y71.026 E.02177
G1 X56.902 Y80.113 E.34823
G1 X57.277 Y80.329 E.01173
G1 X66.77 Y70.836 E.36375
G1 X67.55 Y70.647 E.02177
G1 X57.653 Y80.544 E.37928
G1 X58.029 Y80.759 E.01173
G1 X68.331 Y70.457 E.3948
G1 X69.112 Y70.267 E.02177
G1 X58.405 Y80.975 E.41033
G1 X58.78 Y81.19 E.01173
G1 X69.893 Y70.077 E.42585
G1 X70.674 Y69.888 E.02177
G1 X59.156 Y81.406 E.44138
G1 X59.532 Y81.621 E.01173
G1 X71.455 Y69.698 E.4569
G1 X72.236 Y69.508 E.02177
G1 X59.907 Y81.836 E.47243
G1 X60.283 Y82.052 E.01174
G1 X73.016 Y69.318 E.48795
G1 X73.797 Y69.129 E.02177
G1 X60.659 Y82.267 E.50348
G1 X61.034 Y82.482 E.01173
G1 X74.578 Y68.939 E.519
G1 X75.359 Y68.749 E.02177
G1 X61.41 Y82.698 E.53453
G1 X61.786 Y82.913 E.01173
G1 X76.14 Y68.559 E.55005
G1 X76.921 Y68.37 E.02177
G1 X62.162 Y83.129 E.56558
G1 X62.537 Y83.344 E.01173
G1 X77.701 Y68.18 E.5811
G1 X78.482 Y67.99 E.02177
G1 X62.913 Y83.559 E.59663
G1 X63.289 Y83.775 E.01173
G1 X79.263 Y67.8 E.61215
G1 X80.044 Y67.611 E.02177
G1 X63.664 Y83.99 E.62768
G1 X64.04 Y84.206 E.01174
G1 X80.825 Y67.421 E.6432
G1 X81.606 Y67.231 E.02177
G1 X64.416 Y84.421 E.65873
G1 X64.792 Y84.636 E.01174
G1 X82.386 Y67.041 E.67425
G1 X83.167 Y66.852 E.02177
G1 X65.167 Y84.852 E.68978
G1 X65.543 Y85.067 E.01173
G1 X83.948 Y66.662 E.70531
G1 X84.729 Y66.472 E.02177
G1 X65.919 Y85.283 E.72083
G1 X66.294 Y85.498 E.01173
G1 X85.51 Y66.282 E.73636
G1 X86.291 Y66.093 E.02177
G1 X66.67 Y85.713 E.75188
G1 X67.046 Y85.929 E.01173
G1 X87.072 Y65.903 E.76741
G1 X87.852 Y65.713 E.02177
G1 X67.422 Y86.144 E.78293
G1 X67.797 Y86.359 E.01173
G1 X88.633 Y65.523 E.79846
G1 X89.414 Y65.334 E.02177
G1 X68.173 Y86.575 E.81398
G1 X68.549 Y86.79 E.01174
G1 X90.195 Y65.144 E.82951
G1 X90.976 Y64.954 E.02177
G1 X68.924 Y87.006 E.84503
G1 X69.3 Y87.221 E.01173
G1 X91.757 Y64.765 E.86056
G1 X92.537 Y64.575 E.02177
G1 X69.676 Y87.436 E.87608
G1 X70.052 Y87.652 E.01173
G1 X93.318 Y64.385 E.89161
G1 X94.099 Y64.195 E.02177
G1 X70.427 Y87.867 E.90713
G1 X70.803 Y88.083 E.01173
G1 X94.88 Y64.006 E.92266
G1 X95.661 Y63.816 E.02177
G1 X71.179 Y88.298 E.93818
G1 X71.554 Y88.513 E.01173
G1 X96.442 Y63.626 E.95371
G1 X97.223 Y63.436 E.02177
G1 X71.93 Y88.729 E.96923
G1 X72.306 Y88.944 E.01173
G1 X98.003 Y63.247 E.98476
G1 X98.784 Y63.057 E.02177
G1 X72.681 Y89.16 E1.00028
G1 X73.057 Y89.375 E.01173
G1 X99.565 Y62.867 E1.01581
G1 X100.346 Y62.677 E.02177
G1 X73.433 Y89.59 E1.03133
G1 X73.809 Y89.806 E.01173
G1 X101.127 Y62.488 E1.04686
G1 X101.908 Y62.298 E.02177
G1 X74.184 Y90.021 E1.06238
G1 X74.56 Y90.236 E.01173
G1 X102.688 Y62.108 E1.07791
G1 X103.469 Y61.918 E.02177
G1 X74.936 Y90.452 E1.09343
G1 X75.311 Y90.667 E.01173
G1 X104.25 Y61.729 E1.10896
G1 X105.031 Y61.539 E.02177
G1 X75.687 Y90.883 E1.12449
M73 P88 R7
G1 X76.063 Y91.098 E.01173
G1 X105.812 Y61.349 E1.14001
G1 X106.593 Y61.159 E.02177
G1 X76.439 Y91.313 E1.15554
G1 X76.814 Y91.529 E.01173
G1 X107.374 Y60.97 E1.17106
G1 X108.154 Y60.78 E.02177
G1 X77.19 Y91.744 E1.18659
G1 X77.566 Y91.96 E.01173
G1 X108.935 Y60.59 E1.20211
G1 X109.716 Y60.4 E.02177
G1 X77.941 Y92.175 E1.21764
G1 X78.317 Y92.39 E.01174
G1 X110.497 Y60.211 E1.23316
G1 X111.278 Y60.021 E.02177
G1 X78.693 Y92.606 E1.24869
G1 X79.069 Y92.821 E.01173
G1 X112.059 Y59.831 E1.26421
G1 X112.839 Y59.641 E.02177
G1 X79.444 Y93.037 E1.27974
G1 X79.82 Y93.252 E.01173
G1 X113.62 Y59.452 E1.29526
G1 X114.401 Y59.262 E.02177
G1 X80.196 Y93.467 E1.31079
G1 X80.571 Y93.683 E.01173
G1 X115.182 Y59.072 E1.32631
G1 X115.963 Y58.882 E.02177
G1 X80.947 Y93.898 E1.34184
G1 X81.323 Y94.113 E.01174
G1 X116.744 Y58.693 E1.35736
G1 X117.524 Y58.503 E.02177
G1 X81.699 Y94.329 E1.37289
G1 X82.074 Y94.544 E.01174
G1 X118.305 Y58.313 E1.38841
G1 X119.086 Y58.123 E.02177
G1 X82.45 Y94.76 E1.40394
G1 X82.826 Y94.975 E.01174
G1 X119.867 Y57.934 E1.41946
G1 X120.648 Y57.744 E.02177
G1 X83.201 Y95.19 E1.43499
G1 X83.577 Y95.406 E.01173
G1 X121.429 Y57.554 E1.45051
G1 X122.21 Y57.364 E.02177
G1 X83.953 Y95.621 E1.46604
G1 X84.328 Y95.837 E.01173
G1 X122.99 Y57.175 E1.48156
G1 X123.434 Y57.067 E.01238
G1 X123.429 Y57.327 E.00705
G1 X84.704 Y96.052 E1.48398
G1 X85.08 Y96.267 E.01173
G1 X123.417 Y57.93 E1.46912
G1 X123.405 Y58.533 E.01635
G1 X85.456 Y96.483 E1.45426
G1 X85.831 Y96.698 E.01174
G1 X123.393 Y59.136 E1.4394
G1 X123.381 Y59.74 E.01635
G1 X86.207 Y96.914 E1.42454
G1 X86.583 Y97.129 E.01174
G1 X123.369 Y60.343 E1.40968
G1 X123.357 Y60.946 E.01635
G1 X86.958 Y97.344 E1.39482
G1 X87.334 Y97.56 E.01173
G1 X123.345 Y61.549 E1.37996
G1 X123.333 Y62.152 E.01635
G1 X87.71 Y97.775 E1.3651
G1 X88.086 Y97.99 E.01173
G1 X123.321 Y62.755 E1.35024
G1 X123.309 Y63.359 E.01635
G1 X88.461 Y98.206 E1.33538
G1 X88.837 Y98.421 E.01173
G1 X123.296 Y63.962 E1.32052
G1 X123.284 Y64.565 E.01635
G1 X89.213 Y98.637 E1.30566
G1 X89.588 Y98.852 E.01173
G1 X123.272 Y65.168 E1.2908
G1 X123.26 Y65.771 E.01635
G1 X89.964 Y99.067 E1.27594
G1 X90.34 Y99.283 E.01174
G1 X123.248 Y66.374 E1.26108
G1 X123.236 Y66.978 E.01635
G1 X90.716 Y99.498 E1.24622
G1 X91.091 Y99.714 E.01173
G1 X123.224 Y67.581 E1.23136
G1 X123.212 Y68.184 E.01635
G1 X91.467 Y99.929 E1.2165
G1 X91.843 Y100.144 E.01173
G1 X123.2 Y68.787 E1.20164
G1 X123.188 Y69.39 E.01635
G1 X92.218 Y100.36 E1.18678
G1 X92.594 Y100.575 E.01174
G1 X123.176 Y69.993 E1.17192
G1 X123.164 Y70.597 E.01635
G1 X92.97 Y100.791 E1.15706
G1 X93.346 Y101.006 E.01173
G1 X123.152 Y71.2 E1.1422
G1 X123.14 Y71.803 E.01635
G1 X93.721 Y101.221 E1.12734
G1 X94.097 Y101.437 E.01173
G1 X123.128 Y72.406 E1.11248
G1 X123.115 Y73.009 E.01635
G1 X94.473 Y101.652 E1.09762
G1 X94.848 Y101.867 E.01173
G1 X123.103 Y73.612 E1.08276
G1 X123.091 Y74.216 E.01635
G1 X95.224 Y102.083 E1.0679
G1 X95.6 Y102.298 E.01173
G1 X123.079 Y74.819 E1.05304
G1 X123.067 Y75.422 E.01635
G1 X95.975 Y102.514 E1.03818
G1 X96.351 Y102.729 E.01173
G1 X123.055 Y76.025 E1.02332
G1 X123.043 Y76.628 E.01635
G1 X96.727 Y102.944 E1.00846
G1 X97.103 Y103.16 E.01173
G1 X123.031 Y77.231 E.9936
G1 X123.019 Y77.835 E.01635
G1 X97.478 Y103.375 E.97874
M73 P89 R7
G1 X97.854 Y103.591 E.01173
G1 X123.007 Y78.438 E.96388
G1 X122.995 Y79.041 E.01635
G1 X98.23 Y103.806 E.94902
G1 X98.605 Y104.021 E.01173
G1 X122.983 Y79.644 E.93416
G1 X122.971 Y80.247 E.01635
G1 X98.981 Y104.237 E.9193
G1 X99.357 Y104.452 E.01173
G1 X122.959 Y80.85 E.90444
G1 X122.946 Y81.454 E.01635
G1 X99.733 Y104.668 E.88958
G1 X100.108 Y104.883 E.01174
G1 X122.934 Y82.057 E.87472
G1 X122.922 Y82.66 E.01635
G1 X100.484 Y105.098 E.85986
G1 X100.86 Y105.314 E.01173
G1 X122.91 Y83.263 E.845
G1 X122.898 Y83.866 E.01635
G1 X101.235 Y105.529 E.83014
G1 X101.611 Y105.744 E.01173
G1 X122.886 Y84.469 E.81528
G1 X122.874 Y85.073 E.01635
G1 X101.987 Y105.96 E.80042
G1 X102.363 Y106.175 E.01173
G1 X122.862 Y85.676 E.78556
G1 X122.85 Y86.279 E.01635
G1 X102.738 Y106.391 E.7707
G1 X103.114 Y106.606 E.01173
G1 X122.838 Y86.882 E.75584
G1 X122.826 Y87.485 E.01635
G1 X103.49 Y106.821 E.74098
G1 X103.865 Y107.037 E.01174
G1 X122.814 Y88.088 E.72612
G1 X122.802 Y88.692 E.01635
G1 X104.241 Y107.252 E.71126
G1 X104.617 Y107.468 E.01174
G1 X122.79 Y89.295 E.6964
G1 X122.778 Y89.898 E.01635
G1 X104.993 Y107.683 E.68154
G1 X105.368 Y107.898 E.01173
G1 X122.765 Y90.501 E.66668
G1 X122.753 Y91.104 E.01635
G1 X105.744 Y108.114 E.65182
G1 X106.12 Y108.329 E.01173
G1 X122.741 Y91.707 E.63696
G1 X122.729 Y92.311 E.01635
G1 X106.495 Y108.545 E.6221
G1 X106.871 Y108.76 E.01173
G1 X122.717 Y92.914 E.60724
G1 X122.705 Y93.517 E.01635
G1 X107.247 Y108.975 E.59238
G1 X107.622 Y109.191 E.01173
G1 X122.693 Y94.12 E.57752
G1 X122.681 Y94.723 E.01635
G1 X107.998 Y109.406 E.56266
G1 X108.374 Y109.621 E.01174
G1 X122.669 Y95.327 E.5478
G1 X122.657 Y95.93 E.01635
G1 X108.75 Y109.837 E.53294
G1 X109.125 Y110.052 E.01173
G1 X122.645 Y96.533 E.51808
G1 X122.633 Y97.136 E.01635
G1 X109.501 Y110.268 E.50322
G1 X109.877 Y110.483 E.01173
G1 X122.621 Y97.739 E.48836
G1 X122.609 Y98.342 E.01635
G1 X110.252 Y110.698 E.4735
G1 X110.35 Y110.754 E.00304
G1 X111.386 Y110.156 E.03242
G1 X122.596 Y98.946 E.4296
G1 X122.584 Y99.549 E.01635
G1 X112.784 Y109.349 E.37554
G1 X114.183 Y108.541 E.04376
G1 X122.572 Y100.152 E.32149
G1 X122.56 Y100.755 E.01635
G1 X115.582 Y107.734 E.26743
G1 X116.98 Y106.926 E.04376
G1 X122.548 Y101.358 E.21337
G1 X122.536 Y101.961 E.01635
G1 X118.379 Y106.119 E.15932
G1 X119.777 Y105.311 E.04376
G1 X122.524 Y102.565 E.10526
G1 X122.512 Y103.168 E.01635
G1 X120.665 Y105.015 E.07079
; OBJECT_ID: 465
; WIPE_START
G1 X122.079 Y103.601 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 437
M625
; start printing object, unique label id: 465
M624 IAAAAAAAAAA=
M204 S10000
G1 X116.21 Y108.48 Z2.36 F30000
G1 X40.405 Y171.5 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X40.405 Y80.5 E2.46582
G1 X106.327 Y118.293 E2.05903
G1 X106.327 Y133.707 E.41769
G1 X40.457 Y171.47 E2.0574
M204 S10000
G1 X40.004 Y172.191 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X40.004 Y79.809 E2.32263
G1 X106.728 Y118.061 E1.93364
G1 X106.728 Y133.939 E.39922
G1 X40.056 Y172.161 E1.93213
; WIPE_START
M204 S4000
G1 X40.055 Y170.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.735 Y166.468 Z2.36 F30000
G1 X105.971 Y133.718 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X105.971 Y118.498 E.41241
G1 X105.553 Y118.258 E.01306
G1 X105.553 Y133.742 E.41955
G1 X105.135 Y133.981 E.01306
G1 X105.135 Y118.019 E.43254
G1 X104.717 Y117.779 E.01306
G1 X104.717 Y134.221 E.44553
G1 X104.299 Y134.461 E.01306
G1 X104.299 Y117.539 E.45851
G1 X103.881 Y117.3 E.01306
G1 X103.881 Y134.7 E.4715
G1 X103.463 Y134.94 E.01306
G1 X103.463 Y117.06 E.48449
G1 X103.045 Y116.821 E.01306
G1 X103.045 Y135.179 E.49747
G1 X102.627 Y135.419 E.01306
G1 X102.627 Y116.581 E.51046
G1 X102.209 Y116.341 E.01306
G1 X102.209 Y135.659 E.52345
G1 X101.791 Y135.898 E.01306
G1 X101.791 Y116.102 E.53643
G1 X101.373 Y115.862 E.01306
G1 X101.373 Y136.138 E.54942
G1 X100.955 Y136.378 E.01306
G1 X100.955 Y115.622 E.56241
G1 X100.537 Y115.383 E.01306
G1 X100.537 Y136.617 E.57539
G1 X100.119 Y136.857 E.01306
G1 X100.119 Y115.143 E.58838
G1 X99.701 Y114.903 E.01306
G1 X99.701 Y137.097 E.60137
G1 X99.283 Y137.336 E.01306
G1 X99.283 Y114.664 E.61435
G1 X98.865 Y114.424 E.01306
G1 X98.865 Y137.576 E.62734
G1 X98.447 Y137.815 E.01306
G1 X98.447 Y114.185 E.64033
G1 X98.029 Y113.945 E.01306
G1 X98.029 Y138.055 E.65331
G1 X97.611 Y138.295 E.01306
G1 X97.611 Y113.705 E.6663
G1 X97.193 Y113.466 E.01306
G1 X97.193 Y138.534 E.67929
G1 X96.775 Y138.774 E.01306
G1 X96.775 Y113.226 E.69227
G1 X96.357 Y112.986 E.01306
G1 X96.357 Y139.014 E.70526
G1 X95.939 Y139.253 E.01306
G1 X95.939 Y112.747 E.71825
G1 X95.521 Y112.507 E.01306
G1 X95.521 Y139.493 E.73123
G1 X95.103 Y139.732 E.01306
G1 X95.103 Y112.267 E.74422
G1 X94.685 Y112.028 E.01306
G1 X94.685 Y139.972 E.75721
G1 X94.267 Y140.212 E.01306
G1 X94.267 Y111.788 E.77019
G1 X93.849 Y111.549 E.01306
G1 X93.849 Y140.451 E.78318
G1 X93.431 Y140.691 E.01306
G1 X93.431 Y111.309 E.79617
G1 X93.013 Y111.069 E.01306
G1 X93.013 Y140.931 E.80915
G1 X92.595 Y141.17 E.01306
G1 X92.595 Y110.83 E.82214
G1 X92.177 Y110.59 E.01306
G1 X92.177 Y141.41 E.83513
G1 X91.759 Y141.65 E.01306
G1 X91.759 Y110.35 E.84811
G1 X91.341 Y110.111 E.01306
G1 X91.341 Y141.889 E.8611
G1 X90.923 Y142.129 E.01306
G1 X90.923 Y109.871 E.87409
G1 X90.505 Y109.632 E.01306
G1 X90.505 Y142.368 E.88707
G1 X90.087 Y142.608 E.01306
G1 X90.087 Y109.392 E.90006
G1 X89.669 Y109.152 E.01306
G1 X89.669 Y142.848 E.91305
G1 X89.251 Y143.087 E.01306
G1 X89.251 Y108.913 E.92603
G1 X88.833 Y108.673 E.01306
G1 X88.833 Y143.327 E.93902
G1 X88.415 Y143.567 E.01306
G1 X88.415 Y108.433 E.95201
G1 X87.997 Y108.194 E.01306
G1 X87.997 Y143.806 E.965
G1 X87.579 Y144.046 E.01306
G1 X87.579 Y107.954 E.97798
G1 X87.161 Y107.714 E.01306
G1 X87.161 Y144.286 E.99097
G1 X86.743 Y144.525 E.01306
G1 X86.743 Y107.475 E1.00396
G1 X86.325 Y107.235 E.01306
G1 X86.325 Y144.765 E1.01694
G1 X85.907 Y145.004 E.01306
G1 X85.907 Y106.996 E1.02993
G1 X85.489 Y106.756 E.01306
G1 X85.489 Y145.244 E1.04292
G1 X85.071 Y145.484 E.01306
G1 X85.071 Y106.516 E1.0559
G1 X84.653 Y106.277 E.01306
G1 X84.653 Y145.723 E1.06889
G1 X84.235 Y145.963 E.01306
G1 X84.235 Y106.037 E1.08188
G1 X83.817 Y105.797 E.01306
G1 X83.817 Y146.203 E1.09486
G1 X83.399 Y146.442 E.01306
G1 X83.399 Y105.558 E1.10785
G1 X82.981 Y105.318 E.01306
G1 X82.981 Y146.682 E1.12084
G1 X82.563 Y146.921 E.01306
G1 X82.563 Y105.078 E1.13382
G1 X82.145 Y104.839 E.01306
G1 X82.145 Y147.161 E1.14681
G1 X81.727 Y147.401 E.01306
G1 X81.727 Y104.599 E1.1598
G1 X81.309 Y104.36 E.01306
G1 X81.309 Y147.64 E1.17278
G1 X80.891 Y147.88 E.01306
G1 X80.891 Y104.12 E1.18577
G1 X80.473 Y103.88 E.01306
G1 X80.473 Y148.12 E1.19876
G1 X80.055 Y148.359 E.01306
G1 X80.055 Y103.641 E1.21174
G1 X79.637 Y103.401 E.01306
G1 X79.637 Y148.599 E1.22473
G1 X79.219 Y148.839 E.01306
G1 X79.219 Y103.161 E1.23772
G1 X78.801 Y102.922 E.01306
G1 X78.801 Y149.078 E1.2507
G1 X78.383 Y149.318 E.01306
G1 X78.383 Y102.682 E1.26369
G1 X77.965 Y102.443 E.01306
G1 X77.965 Y149.557 E1.27668
G1 X77.547 Y149.797 E.01306
G1 X77.547 Y102.203 E1.28966
G1 X77.129 Y101.963 E.01306
G1 X77.129 Y150.037 E1.30265
G1 X76.711 Y150.276 E.01306
G1 X76.711 Y101.724 E1.31564
G1 X76.293 Y101.484 E.01306
G1 X76.293 Y150.516 E1.32862
G1 X75.875 Y150.756 E.01306
G1 X75.875 Y101.244 E1.34161
G1 X75.457 Y101.005 E.01306
G1 X75.457 Y150.995 E1.3546
G1 X75.039 Y151.235 E.01306
G1 X75.039 Y100.765 E1.36758
G1 X74.621 Y100.525 E.01306
G1 X74.621 Y151.475 E1.38057
G1 X74.203 Y151.714 E.01306
G1 X74.203 Y100.286 E1.39356
G1 X73.785 Y100.046 E.01306
G1 X73.785 Y151.954 E1.40654
G1 X73.367 Y152.193 E.01306
G1 X73.367 Y99.807 E1.41953
G1 X72.949 Y99.567 E.01306
G1 X72.949 Y152.433 E1.43252
G1 X72.531 Y152.673 E.01306
G1 X72.531 Y99.327 E1.4455
G1 X72.113 Y99.088 E.01306
G1 X72.113 Y152.912 E1.45849
G1 X71.695 Y153.152 E.01306
G1 X71.695 Y98.848 E1.47148
G1 X71.277 Y98.608 E.01306
G1 X71.277 Y153.392 E1.48446
G1 X70.859 Y153.631 E.01306
G1 X70.859 Y98.369 E1.49745
G1 X70.441 Y98.129 E.01306
G1 X70.441 Y153.871 E1.51044
G1 X70.023 Y154.11 E.01306
G1 X70.023 Y97.889 E1.52342
G1 X69.605 Y97.65 E.01306
G1 X69.605 Y154.35 E1.53641
G1 X69.187 Y154.59 E.01306
G1 X69.187 Y97.41 E1.5494
G1 X68.769 Y97.171 E.01306
G1 X68.769 Y154.829 E1.56238
G1 X68.351 Y155.069 E.01306
G1 X68.351 Y96.931 E1.57537
G1 X67.933 Y96.691 E.01306
G1 X67.933 Y155.309 E1.58836
G1 X67.515 Y155.548 E.01306
G1 X67.515 Y96.452 E1.60134
G1 X67.097 Y96.212 E.01306
G1 X67.097 Y155.788 E1.61433
G1 X66.679 Y156.028 E.01306
G1 X66.679 Y95.972 E1.62732
G1 X66.261 Y95.733 E.01306
G1 X66.261 Y156.267 E1.6403
G1 X65.843 Y156.507 E.01306
G1 X65.843 Y95.493 E1.65329
G1 X65.425 Y95.254 E.01306
G1 X65.425 Y156.746 E1.66628
G1 X65.007 Y156.986 E.01306
G1 X65.007 Y95.014 E1.67926
G1 X64.589 Y94.774 E.01306
G1 X64.589 Y157.226 E1.69225
G1 X64.171 Y157.465 E.01306
G1 X64.171 Y94.535 E1.70524
G1 X63.753 Y94.295 E.01306
G1 X63.753 Y157.705 E1.71822
G1 X63.335 Y157.945 E.01306
G1 X63.335 Y94.055 E1.73121
G1 X62.917 Y93.816 E.01306
G1 X62.917 Y158.184 E1.7442
G1 X62.499 Y158.424 E.01306
G1 X62.499 Y93.576 E1.75719
G1 X62.081 Y93.336 E.01306
G1 X62.081 Y158.664 E1.77017
G1 X61.663 Y158.903 E.01306
G1 X61.663 Y93.097 E1.78316
G1 X61.245 Y92.857 E.01306
G1 X61.245 Y159.143 E1.79615
G1 X60.827 Y159.382 E.01306
G1 X60.827 Y92.618 E1.80913
G1 X60.409 Y92.378 E.01306
G1 X60.409 Y159.622 E1.82212
G1 X59.991 Y159.862 E.01306
G1 X59.991 Y92.138 E1.83511
M73 P90 R7
G1 X59.573 Y91.899 E.01306
G1 X59.573 Y160.101 E1.84809
G1 X59.155 Y160.341 E.01306
G1 X59.155 Y91.659 E1.86108
G1 X58.737 Y91.419 E.01306
G1 X58.737 Y160.581 E1.87407
G1 X58.319 Y160.82 E.01306
G1 X58.319 Y91.18 E1.88705
G1 X57.901 Y90.94 E.01306
G1 X57.901 Y161.06 E1.90004
M73 P90 R6
G1 X57.483 Y161.3 E.01306
G1 X57.483 Y90.7 E1.91303
G1 X57.065 Y90.461 E.01306
G1 X57.065 Y161.539 E1.92601
G1 X56.647 Y161.779 E.01306
G1 X56.647 Y90.221 E1.939
G1 X56.229 Y89.982 E.01306
G1 X56.229 Y162.018 E1.95199
G1 X55.811 Y162.258 E.01306
G1 X55.811 Y89.742 E1.96497
G1 X55.393 Y89.502 E.01306
G1 X55.393 Y162.498 E1.97796
G1 X54.975 Y162.737 E.01306
G1 X54.975 Y89.263 E1.99095
G1 X54.557 Y89.023 E.01306
G1 X54.557 Y162.977 E2.00393
G1 X54.139 Y163.217 E.01306
G1 X54.139 Y88.783 E2.01692
G1 X53.721 Y88.544 E.01306
G1 X53.721 Y163.456 E2.02991
G1 X53.303 Y163.696 E.01306
G1 X53.303 Y88.304 E2.04289
G1 X52.885 Y88.065 E.01306
G1 X52.885 Y163.935 E2.05588
G1 X52.467 Y164.175 E.01306
G1 X52.467 Y87.825 E2.06887
G1 X52.049 Y87.585 E.01306
G1 X52.049 Y164.415 E2.08185
G1 X51.631 Y164.654 E.01306
G1 X51.631 Y87.346 E2.09484
G1 X51.213 Y87.106 E.01306
G1 X51.213 Y164.894 E2.10783
G1 X50.795 Y165.134 E.01306
G1 X50.795 Y86.866 E2.12081
G1 X50.377 Y86.627 E.01306
G1 X50.377 Y165.373 E2.1338
G1 X49.959 Y165.613 E.01306
G1 X49.959 Y86.387 E2.14679
G1 X49.541 Y86.147 E.01306
G1 X49.541 Y165.853 E2.15977
G1 X49.123 Y166.092 E.01306
G1 X49.123 Y85.908 E2.17276
G1 X48.705 Y85.668 E.01306
G1 X48.705 Y166.332 E2.18575
G1 X48.287 Y166.571 E.01306
G1 X48.287 Y85.429 E2.19873
G1 X47.869 Y85.189 E.01306
G1 X47.869 Y166.811 E2.21172
G1 X47.451 Y167.051 E.01306
G1 X47.451 Y84.949 E2.22471
G1 X47.033 Y84.71 E.01306
G1 X47.033 Y167.29 E2.23769
G1 X46.615 Y167.53 E.01306
G1 X46.615 Y84.47 E2.25068
G1 X46.197 Y84.23 E.01306
G1 X46.197 Y167.77 E2.26367
G1 X45.779 Y168.009 E.01306
G1 X45.779 Y83.991 E2.27665
G1 X45.361 Y83.751 E.01306
G1 X45.361 Y168.249 E2.28964
G1 X44.943 Y168.489 E.01306
G1 X44.943 Y83.511 E2.30263
G1 X44.525 Y83.272 E.01306
G1 X44.525 Y168.728 E2.31561
G1 X44.107 Y168.968 E.01306
G1 X44.107 Y83.032 E2.3286
G1 X43.689 Y82.793 E.01306
G1 X43.689 Y169.207 E2.34159
G1 X43.271 Y169.447 E.01306
G1 X43.271 Y82.553 E2.35457
G1 X42.853 Y82.313 E.01306
G1 X42.853 Y169.687 E2.36756
G1 X42.435 Y169.926 E.01306
G1 X42.435 Y82.074 E2.38055
G1 X42.017 Y81.834 E.01306
G1 X42.017 Y170.166 E2.39353
G1 X41.599 Y170.406 E.01306
G1 X41.599 Y81.594 E2.40652
G1 X41.181 Y81.355 E.01306
G1 X41.181 Y170.645 E2.41951
G1 X40.763 Y170.885 E.01306
G1 X40.763 Y80.9 E2.43834
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X40.763 Y82.9 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 465
M625
; layer num/total_layer_count: 13/14
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
M204 S10000
G17
G3 Z2.36 I1.217 J0 P1  F30000
; object ids of layer 13 start: 325,353,381,409,437,465
M624 PwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer13 end: 325,353,381,409,437,465
M625
; OBJECT_ID: 325
; start printing object, unique label id: 325
M624 AQAAAAAAAAA=
G1 X208.345 Y75.115
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X145.65 Y111.058 E1.95824
G1 X133.239 Y103.893 E.38831
G1 X132.294 Y56.635 E1.28081
G1 X208.287 Y75.101 E2.11912
; WIPE_START
G1 X206.553 Y76.097 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.416 Y74.963 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X145.649 Y111.52 E1.84796
G1 X132.843 Y104.127 E.37176
G1 X131.883 Y56.123 E1.20713
G1 X209.358 Y74.949 E2.00452
; WIPE_START
M204 S4000
G1 X207.623 Y75.945 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.373 Y75.479 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.064 Y75.17 E.01182
G1 X206.285 Y74.981 E.02172
G1 X206.861 Y75.556 E.02206
G1 X206.486 Y75.771 E.01171
G1 X205.506 Y74.791 E.03755
G1 X204.727 Y74.602 E.02172
G1 X206.111 Y75.986 E.05304
G1 X205.737 Y76.201 E.01171
G1 X203.948 Y74.413 E.06853
G1 X203.169 Y74.224 E.02172
G1 X205.362 Y76.416 E.08402
G1 X204.987 Y76.631 E.01171
G1 X202.39 Y74.034 E.0995
G1 X201.611 Y73.845 E.02172
G1 X204.612 Y76.846 E.11499
G1 X204.237 Y77.061 E.01171
G1 X200.832 Y73.656 E.13048
G1 X200.053 Y73.466 E.02172
G1 X203.862 Y77.275 E.14597
G1 X203.488 Y77.49 E.01171
G1 X199.274 Y73.277 E.16146
G1 X198.495 Y73.088 E.02172
G1 X203.113 Y77.705 E.17695
G1 X202.738 Y77.92 E.01171
G1 X197.716 Y72.898 E.19244
G1 X196.937 Y72.709 E.02172
G1 X202.363 Y78.135 E.20793
G1 X201.988 Y78.35 E.01171
G1 X196.158 Y72.52 E.22342
G1 X195.379 Y72.331 E.02172
G1 X201.614 Y78.565 E.2389
G1 X201.239 Y78.78 E.01171
G1 X194.6 Y72.141 E.25439
G1 X193.821 Y71.952 E.02172
G1 X200.864 Y78.995 E.26988
G1 X200.489 Y79.209 E.01171
G1 X193.042 Y71.763 E.28537
G1 X192.263 Y71.573 E.02172
G1 X200.114 Y79.424 E.30086
G1 X199.739 Y79.639 E.01171
G1 X191.484 Y71.384 E.31635
G1 X190.705 Y71.195 E.02172
G1 X199.365 Y79.854 E.33184
G1 X198.99 Y80.069 E.01171
G1 X189.926 Y71.005 E.34732
G1 X189.147 Y70.816 E.02172
G1 X198.615 Y80.284 E.36281
G1 X198.24 Y80.499 E.01171
G1 X188.368 Y70.627 E.3783
G1 X187.589 Y70.438 E.02172
G1 X197.865 Y80.714 E.39379
G1 X197.49 Y80.929 E.01171
G1 X186.81 Y70.248 E.40928
G1 X186.031 Y70.059 E.02172
G1 X197.116 Y81.143 E.42477
G1 X196.741 Y81.358 E.01171
G1 X185.252 Y69.87 E.44026
G1 X184.473 Y69.68 E.02172
G1 X196.366 Y81.573 E.45575
G1 X195.991 Y81.788 E.01171
G1 X183.694 Y69.491 E.47124
G1 X182.915 Y69.302 E.02172
G1 X195.616 Y82.003 E.48672
G1 X195.241 Y82.218 E.01171
G1 X182.136 Y69.112 E.50221
G1 X181.357 Y68.923 E.02172
G1 X194.867 Y82.433 E.5177
G1 X194.492 Y82.648 E.01171
G1 X180.578 Y68.734 E.53319
G1 X179.799 Y68.545 E.02172
G1 X194.117 Y82.862 E.54868
G1 X193.742 Y83.077 E.01171
G1 X179.02 Y68.355 E.56417
G1 X178.241 Y68.166 E.02172
G1 X193.367 Y83.292 E.57966
G1 X192.992 Y83.507 E.01171
G1 X177.462 Y67.977 E.59514
G1 X176.683 Y67.787 E.02172
G1 X192.618 Y83.722 E.61063
G1 X192.243 Y83.937 E.01171
G1 X175.904 Y67.598 E.62612
G1 X175.125 Y67.409 E.02172
G1 X191.868 Y84.152 E.64161
G1 X191.493 Y84.367 E.01171
G1 X174.346 Y67.219 E.6571
G1 X173.567 Y67.03 E.02172
G1 X191.118 Y84.582 E.67259
G1 X190.743 Y84.796 E.01171
G1 X172.788 Y66.841 E.68808
G1 X172.009 Y66.652 E.02172
G1 X190.369 Y85.011 E.70357
G1 X189.994 Y85.226 E.01171
G1 X171.23 Y66.462 E.71906
G1 X170.451 Y66.273 E.02172
G1 X189.619 Y85.441 E.73454
G1 X189.244 Y85.656 E.01171
G1 X169.672 Y66.084 E.75003
G1 X168.893 Y65.894 E.02172
G1 X188.869 Y85.871 E.76552
G1 X188.495 Y86.086 E.01171
G1 X168.114 Y65.705 E.78101
G1 X167.335 Y65.516 E.02172
G1 X188.12 Y86.301 E.7965
G1 X187.745 Y86.516 E.01171
G1 X166.556 Y65.326 E.81199
G1 X165.777 Y65.137 E.02172
G1 X187.37 Y86.73 E.82748
G1 X186.995 Y86.945 E.01171
G1 X164.998 Y64.948 E.84297
G1 X164.219 Y64.759 E.02172
G1 X186.62 Y87.16 E.85845
G1 X186.246 Y87.375 E.01171
G1 X163.44 Y64.569 E.87394
G1 X162.661 Y64.38 E.02172
G1 X185.871 Y87.59 E.88943
G1 X185.496 Y87.805 E.01171
G1 X161.882 Y64.191 E.90492
G1 X161.103 Y64.001 E.02172
G1 X185.121 Y88.02 E.92041
G1 X184.746 Y88.235 E.01171
G1 X160.324 Y63.812 E.9359
G1 X159.545 Y63.623 E.02172
G1 X184.371 Y88.449 E.95139
G1 X183.997 Y88.664 E.01171
G1 X158.766 Y63.433 E.96688
G1 X157.987 Y63.244 E.02172
G1 X183.622 Y88.879 E.98236
G1 X183.247 Y89.094 E.01171
G1 X157.208 Y63.055 E.99785
G1 X156.429 Y62.866 E.02172
G1 X182.872 Y89.309 E1.01334
G1 X182.497 Y89.524 E.01171
G1 X155.65 Y62.676 E1.02883
G1 X154.871 Y62.487 E.02172
G1 X182.122 Y89.739 E1.04432
G1 X181.748 Y89.954 E.01171
G1 X154.092 Y62.298 E1.05981
M73 P91 R6
G1 X153.313 Y62.108 E.02172
G1 X181.373 Y90.169 E1.0753
G1 X180.998 Y90.383 E.01171
G1 X152.534 Y61.919 E1.09079
G1 X151.754 Y61.73 E.02172
G1 X180.623 Y90.598 E1.10627
G1 X180.248 Y90.813 E.01171
G1 X150.975 Y61.54 E1.12176
G1 X150.196 Y61.351 E.02172
G1 X179.873 Y91.028 E1.13725
G1 X179.499 Y91.243 E.01171
G1 X149.417 Y61.162 E1.15274
G1 X148.638 Y60.973 E.02172
G1 X179.124 Y91.458 E1.16823
G1 X178.749 Y91.673 E.01171
G1 X147.859 Y60.783 E1.18372
G1 X147.08 Y60.594 E.02172
G1 X178.374 Y91.888 E1.19921
G1 X177.999 Y92.102 E.01171
G1 X146.301 Y60.405 E1.2147
G1 X145.522 Y60.215 E.02172
G1 X177.624 Y92.317 E1.23018
G1 X177.25 Y92.532 E.01171
G1 X144.743 Y60.026 E1.24567
G1 X143.964 Y59.837 E.02172
G1 X176.875 Y92.747 E1.26116
G1 X176.5 Y92.962 E.01171
G1 X143.185 Y59.647 E1.27665
G1 X142.406 Y59.458 E.02172
G1 X176.125 Y93.177 E1.29214
G1 X175.75 Y93.392 E.01171
G1 X141.627 Y59.269 E1.30763
G1 X140.848 Y59.08 E.02172
G1 X175.375 Y93.607 E1.32312
G1 X175.001 Y93.822 E.01171
G1 X140.069 Y58.89 E1.33861
G1 X139.29 Y58.701 E.02172
G1 X174.626 Y94.036 E1.35409
G1 X174.251 Y94.251 E.01171
G1 X138.511 Y58.512 E1.36958
G1 X137.732 Y58.322 E.02172
G1 X173.876 Y94.466 E1.38507
G1 X173.501 Y94.681 E.01171
G1 X136.953 Y58.133 E1.40056
G1 X136.174 Y57.944 E.02172
G1 X173.127 Y94.896 E1.41605
G1 X172.752 Y95.111 E.01171
G1 X135.395 Y57.754 E1.43154
G1 X134.616 Y57.565 E.02172
G1 X172.377 Y95.326 E1.44703
G1 X172.002 Y95.541 E.01171
G1 X133.837 Y57.376 E1.46252
G1 X133.058 Y57.187 E.02172
G1 X171.627 Y95.756 E1.478
G1 X171.252 Y95.97 E.01171
G1 X132.664 Y57.382 E1.47874
G1 X132.676 Y57.984 E.01631
G1 X170.878 Y96.185 E1.46391
G1 X170.503 Y96.4 E.01171
G1 X132.688 Y58.586 E1.44909
G1 X132.7 Y59.188 E.01631
G1 X170.128 Y96.615 E1.43426
G1 X169.753 Y96.83 E.01171
G1 X132.712 Y59.789 E1.41944
G1 X132.724 Y60.391 E.01631
G1 X169.378 Y97.045 E1.40461
G1 X169.003 Y97.26 E.01171
G1 X132.737 Y60.993 E1.38978
G1 X132.749 Y61.595 E.01631
G1 X168.629 Y97.475 E1.37496
G1 X168.254 Y97.689 E.01171
G1 X132.761 Y62.196 E1.36013
G1 X132.773 Y62.798 E.01631
G1 X167.879 Y97.904 E1.34531
G1 X167.504 Y98.119 E.01171
G1 X132.785 Y63.4 E1.33048
G1 X132.797 Y64.002 E.01631
G1 X167.129 Y98.334 E1.31566
G1 X166.754 Y98.549 E.01171
G1 X132.809 Y64.603 E1.30083
G1 X132.821 Y65.205 E.01631
G1 X166.38 Y98.764 E1.28601
G1 X166.005 Y98.979 E.01171
G1 X132.833 Y65.807 E1.27118
G1 X132.845 Y66.409 E.01631
G1 X165.63 Y99.194 E1.25636
G1 X165.255 Y99.409 E.01171
G1 X132.857 Y67.01 E1.24153
G1 X132.869 Y67.612 E.01631
G1 X164.88 Y99.623 E1.22671
G1 X164.505 Y99.838 E.01171
G1 X132.881 Y68.214 E1.21188
G1 X132.893 Y68.816 E.01631
G1 X164.131 Y100.053 E1.19706
G1 X163.756 Y100.268 E.01171
G1 X132.905 Y69.417 E1.18223
G1 X132.917 Y70.019 E.01631
G1 X163.381 Y100.483 E1.16741
G1 X163.006 Y100.698 E.01171
G1 X132.929 Y70.621 E1.15258
G1 X132.941 Y71.223 E.01631
G1 X162.631 Y100.913 E1.13776
G1 X162.256 Y101.128 E.01171
G1 X132.953 Y71.824 E1.12293
G1 X132.965 Y72.426 E.01631
G1 X161.882 Y101.343 E1.10811
G1 X161.507 Y101.557 E.01171
G1 X132.977 Y73.028 E1.09328
G1 X132.989 Y73.63 E.01631
G1 X161.132 Y101.772 E1.07846
G1 X160.757 Y101.987 E.01171
G1 X133.001 Y74.231 E1.06363
G1 X133.013 Y74.833 E.01631
G1 X160.382 Y102.202 E1.0488
G1 X160.008 Y102.417 E.01171
G1 X133.025 Y75.435 E1.03398
G1 X133.038 Y76.037 E.01631
G1 X159.633 Y102.632 E1.01915
G1 X159.258 Y102.847 E.01171
G1 X133.05 Y76.638 E1.00433
G1 X133.062 Y77.24 E.01631
G1 X158.883 Y103.062 E.9895
G1 X158.508 Y103.276 E.01171
G1 X133.074 Y77.842 E.97468
G1 X133.086 Y78.444 E.01631
G1 X158.133 Y103.491 E.95985
G1 X157.759 Y103.706 E.01171
G1 X133.098 Y79.045 E.94503
G1 X133.11 Y79.647 E.01631
G1 X157.384 Y103.921 E.9302
G1 X157.009 Y104.136 E.01171
G1 X133.122 Y80.249 E.91538
G1 X133.134 Y80.851 E.01631
G1 X156.634 Y104.351 E.90055
G1 X156.259 Y104.566 E.01171
G1 X133.146 Y81.452 E.88573
G1 X133.158 Y82.054 E.01631
G1 X155.884 Y104.781 E.8709
G1 X155.51 Y104.996 E.01171
G1 X133.17 Y82.656 E.85608
G1 X133.182 Y83.258 E.01631
G1 X155.135 Y105.21 E.84125
M73 P91 R5
G1 X154.76 Y105.425 E.01171
G1 X133.194 Y83.859 E.82643
G1 X133.206 Y84.461 E.01631
G1 X154.385 Y105.64 E.8116
G1 X154.01 Y105.855 E.01171
G1 X133.218 Y85.063 E.79678
G1 X133.23 Y85.665 E.01631
G1 X153.635 Y106.07 E.78195
G1 X153.261 Y106.285 E.01171
G1 X133.242 Y86.266 E.76712
G1 X133.254 Y86.868 E.01631
G1 X152.886 Y106.5 E.7523
G1 X152.511 Y106.715 E.01171
G1 X133.266 Y87.47 E.73747
G1 X133.278 Y88.072 E.01631
G1 X152.136 Y106.929 E.72265
G1 X151.761 Y107.144 E.01171
G1 X133.29 Y88.673 E.70782
G1 X133.302 Y89.275 E.01631
G1 X151.386 Y107.359 E.693
G1 X151.012 Y107.574 E.01171
G1 X133.314 Y89.877 E.67817
G1 X133.326 Y90.479 E.01631
G1 X150.637 Y107.789 E.66335
G1 X150.262 Y108.004 E.01171
G1 X133.339 Y91.08 E.64852
G1 X133.351 Y91.682 E.01631
G1 X149.887 Y108.219 E.6337
G1 X149.512 Y108.434 E.01171
G1 X133.363 Y92.284 E.61887
G1 X133.375 Y92.886 E.01631
G1 X149.137 Y108.649 E.60405
G1 X148.763 Y108.863 E.01171
G1 X133.387 Y93.488 E.58922
G1 X133.399 Y94.089 E.01631
G1 X148.388 Y109.078 E.5744
G1 X148.013 Y109.293 E.01171
G1 X133.411 Y94.691 E.55957
G1 X133.423 Y95.293 E.01631
G1 X147.638 Y109.508 E.54475
G1 X147.263 Y109.723 E.01171
G1 X133.435 Y95.895 E.52992
G1 X133.447 Y96.496 E.01631
G1 X146.889 Y109.938 E.5151
G1 X146.514 Y110.153 E.01171
G1 X133.459 Y97.098 E.50027
G1 X133.471 Y97.7 E.01631
G1 X146.139 Y110.368 E.48545
G1 X145.764 Y110.583 E.01171
G1 X133.483 Y98.302 E.47062
G1 X133.495 Y98.903 E.01631
G1 X144.678 Y110.086 E.42855
G1 X143.283 Y109.281 E.04366
G1 X133.507 Y99.505 E.37462
G1 X133.519 Y100.107 E.01631
G1 X141.888 Y108.475 E.32069
G1 X140.492 Y107.67 E.04366
G1 X133.531 Y100.709 E.26676
G1 X133.543 Y101.31 E.01631
G1 X139.097 Y106.864 E.21283
G1 X137.702 Y106.059 E.04366
G1 X133.555 Y101.912 E.1589
G1 X133.567 Y102.514 E.01631
G1 X136.307 Y105.253 E.10497
G1 X134.911 Y104.447 E.04366
G1 X133.388 Y102.925 E.05836
; OBJECT_ID: 353
; WIPE_START
G1 X134.803 Y104.339 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 325
M625
; start printing object, unique label id: 353
M624 AgAAAAAAAAA=
M204 S10000
G1 X140.676 Y109.213 Z2.52 F30000
G1 X215.595 Y171.393 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X149.765 Y133.654 E2.05614
G1 X149.765 Y118.346 E.41479
G1 X215.595 Y80.607 E2.05614
G1 X215.595 Y171.333 E2.45843
M204 S10000
G1 X215.996 Y172.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X149.364 Y133.886 E1.93097
G1 X149.364 Y118.114 E.39653
G1 X215.996 Y79.915 E1.93097
G1 X215.996 Y172.025 E2.31576
; WIPE_START
M204 S4000
G1 X214.26 Y171.031 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X215.239 Y170.995 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X215.239 Y81.221 E2.43261
G1 X214.821 Y81.46 E.01304
G1 X214.821 Y170.54 E2.4138
G1 X214.404 Y170.301 E.01304
G1 X214.404 Y81.699 E2.40083
G1 X213.987 Y81.939 E.01304
G1 X213.987 Y170.061 E2.38786
G1 X213.569 Y169.822 E.01304
G1 X213.569 Y82.178 E2.37489
G1 X213.152 Y82.417 E.01304
G1 X213.152 Y169.583 E2.36192
G1 X212.734 Y169.343 E.01304
G1 X212.734 Y82.657 E2.34895
G1 X212.317 Y82.896 E.01304
G1 X212.317 Y169.104 E2.33599
G1 X211.899 Y168.865 E.01304
G1 X211.899 Y83.135 E2.32302
G1 X211.482 Y83.375 E.01304
G1 X211.482 Y168.625 E2.31005
G1 X211.065 Y168.386 E.01304
G1 X211.065 Y83.614 E2.29708
G1 X210.647 Y83.853 E.01304
G1 X210.647 Y168.147 E2.28411
G1 X210.23 Y167.908 E.01304
G1 X210.23 Y84.092 E2.27114
G1 X209.812 Y84.332 E.01304
G1 X209.812 Y167.668 E2.25818
G1 X209.395 Y167.429 E.01304
G1 X209.395 Y84.571 E2.24521
G1 X208.978 Y84.81 E.01304
G1 X208.978 Y167.19 E2.23224
G1 X208.56 Y166.95 E.01304
G1 X208.56 Y85.05 E2.21927
G1 X208.143 Y85.289 E.01304
G1 X208.143 Y166.711 E2.2063
G1 X207.725 Y166.472 E.01304
G1 X207.725 Y85.528 E2.19333
G1 X207.308 Y85.768 E.01304
G1 X207.308 Y166.232 E2.18036
G1 X206.891 Y165.993 E.01304
G1 X206.891 Y86.007 E2.1674
G1 X206.473 Y86.246 E.01304
G1 X206.473 Y165.754 E2.15443
G1 X206.056 Y165.515 E.01304
G1 X206.056 Y86.485 E2.14146
G1 X205.638 Y86.725 E.01304
G1 X205.638 Y165.275 E2.12849
G1 X205.221 Y165.036 E.01304
G1 X205.221 Y86.964 E2.11552
G1 X204.804 Y87.203 E.01304
G1 X204.804 Y164.797 E2.10255
G1 X204.386 Y164.557 E.01304
G1 X204.386 Y87.443 E2.08959
G1 X203.969 Y87.682 E.01304
G1 X203.969 Y164.318 E2.07662
G1 X203.551 Y164.079 E.01304
G1 X203.551 Y87.921 E2.06365
G1 X203.134 Y88.16 E.01304
G1 X203.134 Y163.84 E2.05068
G1 X202.716 Y163.6 E.01304
G1 X202.716 Y88.4 E2.03771
G1 X202.299 Y88.639 E.01304
G1 X202.299 Y163.361 E2.02474
G1 X201.882 Y163.122 E.01304
G1 X201.882 Y88.878 E2.01178
M73 P92 R5
G1 X201.464 Y89.118 E.01304
G1 X201.464 Y162.882 E1.99881
G1 X201.047 Y162.643 E.01304
G1 X201.047 Y89.357 E1.98584
G1 X200.629 Y89.596 E.01304
G1 X200.629 Y162.404 E1.97287
G1 X200.212 Y162.164 E.01304
G1 X200.212 Y89.836 E1.9599
G1 X199.795 Y90.075 E.01304
G1 X199.795 Y161.925 E1.94693
G1 X199.377 Y161.686 E.01304
G1 X199.377 Y90.314 E1.93397
G1 X198.96 Y90.553 E.01304
G1 X198.96 Y161.447 E1.921
G1 X198.542 Y161.207 E.01304
G1 X198.542 Y90.793 E1.90803
G1 X198.125 Y91.032 E.01304
G1 X198.125 Y160.968 E1.89506
G1 X197.708 Y160.729 E.01304
G1 X197.708 Y91.271 E1.88209
G1 X197.29 Y91.511 E.01304
G1 X197.29 Y160.489 E1.86912
G1 X196.873 Y160.25 E.01304
G1 X196.873 Y91.75 E1.85616
G1 X196.455 Y91.989 E.01304
G1 X196.455 Y160.011 E1.84319
G1 X196.038 Y159.772 E.01304
G1 X196.038 Y92.228 E1.83022
G1 X195.621 Y92.468 E.01304
G1 X195.621 Y159.532 E1.81725
G1 X195.203 Y159.293 E.01304
G1 X195.203 Y92.707 E1.80428
G1 X194.786 Y92.946 E.01304
G1 X194.786 Y159.054 E1.79131
G1 X194.368 Y158.814 E.01304
G1 X194.368 Y93.186 E1.77834
G1 X193.951 Y93.425 E.01304
G1 X193.951 Y158.575 E1.76538
G1 X193.533 Y158.336 E.01304
G1 X193.533 Y93.664 E1.75241
G1 X193.116 Y93.904 E.01304
G1 X193.116 Y158.096 E1.73944
G1 X192.699 Y157.857 E.01304
G1 X192.699 Y94.143 E1.72647
G1 X192.281 Y94.382 E.01304
G1 X192.281 Y157.618 E1.7135
G1 X191.864 Y157.379 E.01304
G1 X191.864 Y94.621 E1.70053
G1 X191.446 Y94.861 E.01304
G1 X191.446 Y157.139 E1.68757
G1 X191.029 Y156.9 E.01304
G1 X191.029 Y95.1 E1.6746
G1 X190.612 Y95.339 E.01304
G1 X190.612 Y156.661 E1.66163
G1 X190.194 Y156.421 E.01304
G1 X190.194 Y95.579 E1.64866
G1 X189.777 Y95.818 E.01304
G1 X189.777 Y156.182 E1.63569
G1 X189.359 Y155.943 E.01304
G1 X189.359 Y96.057 E1.62272
G1 X188.942 Y96.296 E.01304
G1 X188.942 Y155.704 E1.60976
G1 X188.525 Y155.464 E.01304
G1 X188.525 Y96.536 E1.59679
G1 X188.107 Y96.775 E.01304
G1 X188.107 Y155.225 E1.58382
G1 X187.69 Y154.986 E.01304
G1 X187.69 Y97.014 E1.57085
G1 X187.272 Y97.254 E.01304
G1 X187.272 Y154.746 E1.55788
G1 X186.855 Y154.507 E.01304
G1 X186.855 Y97.493 E1.54491
G1 X186.437 Y97.732 E.01304
G1 X186.437 Y154.268 E1.53195
G1 X186.02 Y154.028 E.01304
G1 X186.02 Y97.972 E1.51898
G1 X185.603 Y98.211 E.01304
G1 X185.603 Y153.789 E1.50601
G1 X185.185 Y153.55 E.01304
G1 X185.185 Y98.45 E1.49304
G1 X184.768 Y98.689 E.01304
G1 X184.768 Y153.311 E1.48007
G1 X184.35 Y153.071 E.01304
G1 X184.35 Y98.929 E1.4671
G1 X183.933 Y99.168 E.01304
G1 X183.933 Y152.832 E1.45414
G1 X183.516 Y152.593 E.01304
G1 X183.516 Y99.407 E1.44117
G1 X183.098 Y99.647 E.01304
G1 X183.098 Y152.353 E1.4282
G1 X182.681 Y152.114 E.01304
G1 X182.681 Y99.886 E1.41523
G1 X182.263 Y100.125 E.01304
G1 X182.263 Y151.875 E1.40226
G1 X181.846 Y151.635 E.01304
G1 X181.846 Y100.365 E1.38929
G1 X181.429 Y100.604 E.01304
G1 X181.429 Y151.396 E1.37632
G1 X181.011 Y151.157 E.01304
G1 X181.011 Y100.843 E1.36336
G1 X180.594 Y101.082 E.01304
G1 X180.594 Y150.918 E1.35039
G1 X180.176 Y150.678 E.01304
G1 X180.176 Y101.322 E1.33742
G1 X179.759 Y101.561 E.01304
G1 X179.759 Y150.439 E1.32445
G1 X179.342 Y150.2 E.01304
G1 X179.342 Y101.8 E1.31148
G1 X178.924 Y102.04 E.01304
G1 X178.924 Y149.96 E1.29851
G1 X178.507 Y149.721 E.01304
G1 X178.507 Y102.279 E1.28555
G1 X178.089 Y102.518 E.01304
G1 X178.089 Y149.482 E1.27258
G1 X177.672 Y149.243 E.01304
G1 X177.672 Y102.757 E1.25961
G1 X177.254 Y102.997 E.01304
G1 X177.254 Y149.003 E1.24664
G1 X176.837 Y148.764 E.01304
G1 X176.837 Y103.236 E1.23367
G1 X176.42 Y103.475 E.01304
G1 X176.42 Y148.525 E1.2207
G1 X176.002 Y148.285 E.01304
G1 X176.002 Y103.715 E1.20774
G1 X175.585 Y103.954 E.01304
G1 X175.585 Y148.046 E1.19477
G1 X175.167 Y147.807 E.01304
G1 X175.167 Y104.193 E1.1818
G1 X174.75 Y104.433 E.01304
G1 X174.75 Y147.567 E1.16883
G1 X174.333 Y147.328 E.01304
G1 X174.333 Y104.672 E1.15586
G1 X173.915 Y104.911 E.01304
G1 X173.915 Y147.089 E1.14289
G1 X173.498 Y146.85 E.01304
G1 X173.498 Y105.15 E1.12993
G1 X173.08 Y105.39 E.01304
G1 X173.08 Y146.61 E1.11696
G1 X172.663 Y146.371 E.01304
G1 X172.663 Y105.629 E1.10399
G1 X172.246 Y105.868 E.01304
G1 X172.246 Y146.132 E1.09102
G1 X171.828 Y145.892 E.01304
G1 X171.828 Y106.108 E1.07805
G1 X171.411 Y106.347 E.01304
G1 X171.411 Y145.653 E1.06508
G1 X170.993 Y145.414 E.01304
G1 X170.993 Y106.586 E1.05211
G1 X170.576 Y106.825 E.01304
G1 X170.576 Y145.175 E1.03915
G1 X170.158 Y144.935 E.01304
G1 X170.158 Y107.065 E1.02618
G1 X169.741 Y107.304 E.01304
G1 X169.741 Y144.696 E1.01321
G1 X169.324 Y144.457 E.01304
G1 X169.324 Y107.543 E1.00024
G1 X168.906 Y107.783 E.01304
G1 X168.906 Y144.217 E.98727
G1 X168.489 Y143.978 E.01304
G1 X168.489 Y108.022 E.9743
G1 X168.071 Y108.261 E.01304
G1 X168.071 Y143.739 E.96134
G1 X167.654 Y143.499 E.01304
G1 X167.654 Y108.501 E.94837
G1 X167.237 Y108.74 E.01304
G1 X167.237 Y143.26 E.9354
G1 X166.819 Y143.021 E.01304
G1 X166.819 Y108.979 E.92243
G1 X166.402 Y109.218 E.01304
G1 X166.402 Y142.782 E.90946
G1 X165.984 Y142.542 E.01304
G1 X165.984 Y109.458 E.89649
G1 X165.567 Y109.697 E.01304
G1 X165.567 Y142.303 E.88353
G1 X165.15 Y142.064 E.01304
G1 X165.15 Y109.936 E.87056
G1 X164.732 Y110.176 E.01304
G1 X164.732 Y141.824 E.85759
G1 X164.315 Y141.585 E.01304
G1 X164.315 Y110.415 E.84462
G1 X163.897 Y110.654 E.01304
G1 X163.897 Y141.346 E.83165
G1 X163.48 Y141.106 E.01304
G1 X163.48 Y110.893 E.81868
G1 X163.063 Y111.133 E.01304
G1 X163.063 Y140.867 E.80572
G1 X162.645 Y140.628 E.01304
G1 X162.645 Y111.372 E.79275
G1 X162.228 Y111.611 E.01304
G1 X162.228 Y140.389 E.77978
G1 X161.81 Y140.149 E.01304
G1 X161.81 Y111.851 E.76681
G1 X161.393 Y112.09 E.01304
G1 X161.393 Y139.91 E.75384
G1 X160.975 Y139.671 E.01304
G1 X160.975 Y112.329 E.74087
G1 X160.558 Y112.569 E.01304
G1 X160.558 Y139.431 E.72791
G1 X160.141 Y139.192 E.01304
G1 X160.141 Y112.808 E.71494
G1 X159.723 Y113.047 E.01304
G1 X159.723 Y138.953 E.70197
M73 P92 R4
G1 X159.306 Y138.714 E.01304
G1 X159.306 Y113.286 E.689
G1 X158.888 Y113.526 E.01304
G1 X158.888 Y138.474 E.67603
G1 X158.471 Y138.235 E.01304
G1 X158.471 Y113.765 E.66306
G1 X158.054 Y114.004 E.01304
G1 X158.054 Y137.996 E.65009
G1 X157.636 Y137.756 E.01304
G1 X157.636 Y114.244 E.63713
G1 X157.219 Y114.483 E.01304
G1 X157.219 Y137.517 E.62416
G1 X156.801 Y137.278 E.01304
G1 X156.801 Y114.722 E.61119
G1 X156.384 Y114.962 E.01304
G1 X156.384 Y137.038 E.59822
G1 X155.967 Y136.799 E.01304
G1 X155.967 Y115.201 E.58525
G1 X155.549 Y115.44 E.01304
G1 X155.549 Y136.56 E.57228
G1 X155.132 Y136.321 E.01304
G1 X155.132 Y115.679 E.55932
G1 X154.714 Y115.919 E.01304
G1 X154.714 Y136.081 E.54635
G1 X154.297 Y135.842 E.01304
G1 X154.297 Y116.158 E.53338
G1 X153.88 Y116.397 E.01304
G1 X153.88 Y135.603 E.52041
G1 X153.462 Y135.363 E.01304
G1 X153.462 Y116.637 E.50744
G1 X153.045 Y116.876 E.01304
G1 X153.045 Y135.124 E.49447
G1 X152.627 Y134.885 E.01304
G1 X152.627 Y117.115 E.48151
G1 X152.21 Y117.354 E.01304
G1 X152.21 Y134.646 E.46854
G1 X151.792 Y134.406 E.01304
G1 X151.792 Y117.594 E.45557
G1 X151.375 Y117.833 E.01304
G1 X151.375 Y134.167 E.4426
M73 P93 R4
G1 X150.958 Y133.928 E.01304
G1 X150.958 Y118.072 E.42963
G1 X150.54 Y118.312 E.01304
G1 X150.54 Y133.688 E.41666
G1 X150.123 Y133.449 E.01304
G1 X150.123 Y118.335 E.40954
; OBJECT_ID: 381
; WIPE_START
G1 X150.123 Y120.335 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 353
M625
; start printing object, unique label id: 381
M624 BAAAAAAAAAA=
M204 S10000
G1 X155.598 Y125.653 Z2.52 F30000
G1 X208.345 Y176.885 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X132.294 Y195.365 E2.12075
G1 X133.239 Y148.107 E1.28081
G1 X145.65 Y140.942 E.38831
G1 X208.293 Y176.855 E1.95662
; WIPE_START
G1 X206.35 Y177.328 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.416 Y177.037 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X131.883 Y195.877 E2.00603
G1 X132.843 Y147.873 E1.20713
G1 X145.654 Y140.483 E.37184
G1 X209.364 Y177.007 E1.8463
; WIPE_START
M204 S4000
G1 X207.421 Y177.48 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X206.81 Y177.084 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X207.236 Y176.658 E.01632
G1 X206.861 Y176.444 E.01171
G1 X206.285 Y177.019 E.02206
G1 X205.506 Y177.209 E.02172
G1 X206.486 Y176.229 E.03755
G1 X206.111 Y176.014 E.01171
G1 X204.727 Y177.398 E.05304
G1 X203.948 Y177.587 E.02172
G1 X205.737 Y175.799 E.06853
G1 X205.362 Y175.584 E.01171
G1 X203.169 Y177.776 E.08402
G1 X202.39 Y177.966 E.02172
G1 X204.987 Y175.369 E.0995
G1 X204.612 Y175.154 E.01171
G1 X201.611 Y178.155 E.11499
G1 X200.832 Y178.344 E.02172
G1 X204.237 Y174.939 E.13048
G1 X203.862 Y174.725 E.01171
G1 X200.053 Y178.534 E.14597
G1 X199.274 Y178.723 E.02172
G1 X203.488 Y174.51 E.16146
G1 X203.113 Y174.295 E.01171
G1 X198.495 Y178.912 E.17695
G1 X197.716 Y179.102 E.02172
G1 X202.738 Y174.08 E.19244
G1 X202.363 Y173.865 E.01171
G1 X196.937 Y179.291 E.20793
G1 X196.158 Y179.48 E.02172
G1 X201.988 Y173.65 E.22341
G1 X201.614 Y173.435 E.01171
G1 X195.379 Y179.669 E.2389
G1 X194.6 Y179.859 E.02172
G1 X201.239 Y173.22 E.25439
G1 X200.864 Y173.005 E.01171
G1 X193.821 Y180.048 E.26988
G1 X193.042 Y180.237 E.02172
G1 X200.489 Y172.791 E.28537
G1 X200.114 Y172.576 E.01171
G1 X192.263 Y180.427 E.30086
G1 X191.484 Y180.616 E.02172
G1 X199.739 Y172.361 E.31635
G1 X199.365 Y172.146 E.01171
G1 X190.705 Y180.805 E.33184
G1 X189.926 Y180.995 E.02172
G1 X198.99 Y171.931 E.34732
G1 X198.615 Y171.716 E.01171
G1 X189.147 Y181.184 E.36281
G1 X188.368 Y181.373 E.02172
G1 X198.24 Y171.501 E.3783
G1 X197.865 Y171.286 E.01171
G1 X187.589 Y181.562 E.39379
G1 X186.81 Y181.752 E.02172
G1 X197.49 Y171.071 E.40928
G1 X197.116 Y170.857 E.01171
G1 X186.031 Y181.941 E.42477
G1 X185.252 Y182.13 E.02172
G1 X196.741 Y170.642 E.44026
G1 X196.366 Y170.427 E.01171
G1 X184.473 Y182.32 E.45575
G1 X183.694 Y182.509 E.02172
G1 X195.991 Y170.212 E.47123
G1 X195.616 Y169.997 E.01171
G1 X182.915 Y182.698 E.48672
G1 X182.136 Y182.888 E.02172
G1 X195.241 Y169.782 E.50221
G1 X194.867 Y169.567 E.01171
G1 X181.357 Y183.077 E.5177
G1 X180.578 Y183.266 E.02172
G1 X194.492 Y169.352 E.53319
G1 X194.117 Y169.138 E.01171
G1 X179.799 Y183.455 E.54868
G1 X179.02 Y183.645 E.02172
G1 X193.742 Y168.923 E.56417
G1 X193.367 Y168.708 E.01171
G1 X178.241 Y183.834 E.57966
G1 X177.462 Y184.023 E.02172
G1 X192.992 Y168.493 E.59515
G1 X192.618 Y168.278 E.01171
G1 X176.683 Y184.213 E.61063
G1 X175.904 Y184.402 E.02172
G1 X192.243 Y168.063 E.62612
G1 X191.868 Y167.848 E.01171
G1 X175.125 Y184.591 E.64161
G1 X174.346 Y184.781 E.02172
G1 X191.493 Y167.633 E.6571
G1 X191.118 Y167.418 E.01171
G1 X173.567 Y184.97 E.67259
G1 X172.788 Y185.159 E.02172
G1 X190.743 Y167.204 E.68808
G1 X190.369 Y166.989 E.01171
G1 X172.009 Y185.348 E.70357
G1 X171.23 Y185.538 E.02172
G1 X189.994 Y166.774 E.71906
G1 X189.619 Y166.559 E.01171
G1 X170.451 Y185.727 E.73454
G1 X169.672 Y185.916 E.02172
G1 X189.244 Y166.344 E.75003
G1 X188.869 Y166.129 E.01171
G1 X168.893 Y186.106 E.76552
G1 X168.114 Y186.295 E.02172
G1 X188.495 Y165.914 E.78101
G1 X188.12 Y165.699 E.01171
G1 X167.335 Y186.484 E.7965
G1 X166.556 Y186.674 E.02172
G1 X187.745 Y165.484 E.81199
G1 X187.37 Y165.27 E.01171
G1 X165.777 Y186.863 E.82748
G1 X164.998 Y187.052 E.02172
G1 X186.995 Y165.055 E.84297
G1 X186.62 Y164.84 E.01171
G1 X164.219 Y187.241 E.85845
G1 X163.44 Y187.431 E.02172
G1 X186.246 Y164.625 E.87394
G1 X185.871 Y164.41 E.01171
G1 X162.661 Y187.62 E.88943
G1 X161.882 Y187.809 E.02172
G1 X185.496 Y164.195 E.90492
G1 X185.121 Y163.98 E.01171
G1 X161.103 Y187.999 E.92041
G1 X160.324 Y188.188 E.02172
G1 X184.746 Y163.765 E.9359
G1 X184.371 Y163.551 E.01171
G1 X159.545 Y188.377 E.95139
G1 X158.766 Y188.567 E.02172
G1 X183.997 Y163.336 E.96688
G1 X183.622 Y163.121 E.01171
G1 X157.987 Y188.756 E.98236
G1 X157.208 Y188.945 E.02172
G1 X183.247 Y162.906 E.99785
G1 X182.872 Y162.691 E.01171
G1 X156.429 Y189.134 E1.01334
G1 X155.65 Y189.324 E.02172
G1 X182.497 Y162.476 E1.02883
G1 X182.122 Y162.261 E.01171
G1 X154.871 Y189.513 E1.04432
G1 X154.092 Y189.702 E.02172
G1 X181.748 Y162.046 E1.05981
G1 X181.373 Y161.831 E.01171
G1 X153.313 Y189.892 E1.0753
G1 X152.534 Y190.081 E.02172
G1 X180.998 Y161.617 E1.09079
G1 X180.623 Y161.402 E.01171
G1 X151.754 Y190.27 E1.10627
G1 X150.975 Y190.46 E.02172
G1 X180.248 Y161.187 E1.12176
G1 X179.873 Y160.972 E.01171
G1 X150.196 Y190.649 E1.13725
G1 X149.417 Y190.838 E.02172
G1 X179.499 Y160.757 E1.15274
G1 X179.124 Y160.542 E.01171
G1 X148.638 Y191.027 E1.16823
G1 X147.859 Y191.217 E.02172
G1 X178.749 Y160.327 E1.18372
G1 X178.374 Y160.112 E.01171
G1 X147.08 Y191.406 E1.19921
G1 X146.301 Y191.595 E.02172
G1 X177.999 Y159.898 E1.2147
G1 X177.624 Y159.683 E.01171
G1 X145.522 Y191.785 E1.23018
G1 X144.743 Y191.974 E.02172
G1 X177.25 Y159.468 E1.24567
G1 X176.875 Y159.253 E.01171
G1 X143.964 Y192.163 E1.26116
G1 X143.185 Y192.353 E.02172
G1 X176.5 Y159.038 E1.27665
G1 X176.125 Y158.823 E.01171
G1 X142.406 Y192.542 E1.29214
G1 X141.627 Y192.731 E.02172
G1 X175.75 Y158.608 E1.30763
G1 X175.375 Y158.393 E.01171
G1 X140.848 Y192.92 E1.32312
G1 X140.069 Y193.11 E.02172
G1 X175.001 Y158.178 E1.33861
G1 X174.626 Y157.964 E.01171
G1 X139.29 Y193.299 E1.35409
G1 X138.511 Y193.488 E.02172
G1 X174.251 Y157.749 E1.36958
G1 X173.876 Y157.534 E.01171
G1 X137.732 Y193.678 E1.38507
G1 X136.953 Y193.867 E.02172
G1 X173.501 Y157.319 E1.40056
G1 X173.127 Y157.104 E.01171
G1 X136.174 Y194.056 E1.41605
G1 X135.395 Y194.246 E.02172
G1 X172.752 Y156.889 E1.43154
G1 X172.377 Y156.674 E.01171
G1 X134.616 Y194.435 E1.44703
G1 X133.837 Y194.624 E.02172
G1 X172.002 Y156.459 E1.46252
G1 X171.627 Y156.244 E.01171
G1 X133.058 Y194.814 E1.478
G1 X132.658 Y194.911 E.01115
G1 X132.664 Y194.618 E.00794
G1 X171.252 Y156.03 E1.47874
G1 X170.878 Y155.815 E.01171
G1 X132.676 Y194.016 E1.46391
G1 X132.688 Y193.414 E.01631
G1 X170.503 Y155.6 E1.44909
G1 X170.128 Y155.385 E.01171
G1 X132.7 Y192.812 E1.43426
G1 X132.712 Y192.211 E.01631
G1 X169.753 Y155.17 E1.41943
G1 X169.378 Y154.955 E.01171
G1 X132.724 Y191.609 E1.40461
G1 X132.737 Y191.007 E.01631
G1 X169.003 Y154.74 E1.38978
G1 X168.629 Y154.525 E.01171
G1 X132.749 Y190.405 E1.37496
G1 X132.761 Y189.804 E.01631
G1 X168.254 Y154.311 E1.36013
G1 X167.879 Y154.096 E.01171
G1 X132.773 Y189.202 E1.34531
G1 X132.785 Y188.6 E.01631
G1 X167.504 Y153.881 E1.33048
G1 X167.129 Y153.666 E.01171
G1 X132.797 Y187.998 E1.31566
G1 X132.809 Y187.397 E.01631
G1 X166.754 Y153.451 E1.30083
G1 X166.38 Y153.236 E.01171
G1 X132.821 Y186.795 E1.28601
G1 X132.833 Y186.193 E.01631
G1 X166.005 Y153.021 E1.27118
G1 X165.63 Y152.806 E.01171
G1 X132.845 Y185.591 E1.25636
G1 X132.857 Y184.99 E.01631
G1 X165.255 Y152.591 E1.24153
G1 X164.88 Y152.377 E.01171
G1 X132.869 Y184.388 E1.22671
G1 X132.881 Y183.786 E.01631
G1 X164.505 Y152.162 E1.21188
G1 X164.131 Y151.947 E.01171
G1 X132.893 Y183.184 E1.19706
G1 X132.905 Y182.583 E.01631
G1 X163.756 Y151.732 E1.18223
G1 X163.381 Y151.517 E.01171
G1 X132.917 Y181.981 E1.16741
G1 X132.929 Y181.379 E.01631
G1 X163.006 Y151.302 E1.15258
G1 X162.631 Y151.087 E.01171
G1 X132.941 Y180.777 E1.13776
G1 X132.953 Y180.176 E.01631
G1 X162.256 Y150.872 E1.12293
G1 X161.882 Y150.657 E.01171
G1 X132.965 Y179.574 E1.10811
G1 X132.977 Y178.972 E.01631
G1 X161.507 Y150.443 E1.09328
G1 X161.132 Y150.228 E.01171
G1 X132.989 Y178.37 E1.07845
G1 X133.001 Y177.769 E.01631
G1 X160.757 Y150.013 E1.06363
G1 X160.382 Y149.798 E.01171
G1 X133.013 Y177.167 E1.0488
G1 X133.025 Y176.565 E.01631
G1 X160.008 Y149.583 E1.03398
G1 X159.633 Y149.368 E.01171
G1 X133.038 Y175.963 E1.01915
G1 X133.05 Y175.362 E.01631
G1 X159.258 Y149.153 E1.00433
G1 X158.883 Y148.938 E.01171
G1 X133.062 Y174.76 E.9895
G1 X133.074 Y174.158 E.01631
G1 X158.508 Y148.724 E.97468
G1 X158.133 Y148.509 E.01171
G1 X133.086 Y173.556 E.95985
G1 X133.098 Y172.955 E.01631
G1 X157.759 Y148.294 E.94503
G1 X157.384 Y148.079 E.01171
G1 X133.11 Y172.353 E.9302
G1 X133.122 Y171.751 E.01631
G1 X157.009 Y147.864 E.91538
G1 X156.634 Y147.649 E.01171
G1 X133.134 Y171.149 E.90055
G1 X133.146 Y170.548 E.01631
G1 X156.259 Y147.434 E.88573
G1 X155.884 Y147.219 E.01171
G1 X133.158 Y169.946 E.8709
G1 X133.17 Y169.344 E.01631
G1 X155.51 Y147.004 E.85608
G1 X155.135 Y146.79 E.01171
G1 X133.182 Y168.742 E.84125
G1 X133.194 Y168.141 E.01631
G1 X154.76 Y146.575 E.82643
G1 X154.385 Y146.36 E.01171
G1 X133.206 Y167.539 E.8116
G1 X133.218 Y166.937 E.01631
G1 X154.01 Y146.145 E.79678
G1 X153.635 Y145.93 E.01171
G1 X133.23 Y166.335 E.78195
G1 X133.242 Y165.734 E.01631
G1 X153.261 Y145.715 E.76712
G1 X152.886 Y145.5 E.01171
G1 X133.254 Y165.132 E.7523
G1 X133.266 Y164.53 E.01631
G1 X152.511 Y145.285 E.73747
G1 X152.136 Y145.071 E.01171
G1 X133.278 Y163.928 E.72265
G1 X133.29 Y163.327 E.01631
G1 X151.761 Y144.856 E.70782
G1 X151.386 Y144.641 E.01171
G1 X133.302 Y162.725 E.693
G1 X133.314 Y162.123 E.01631
G1 X151.012 Y144.426 E.67817
G1 X150.637 Y144.211 E.01171
G1 X133.326 Y161.521 E.66335
G1 X133.339 Y160.92 E.01631
G1 X150.262 Y143.996 E.64852
G1 X149.887 Y143.781 E.01171
G1 X133.351 Y160.318 E.6337
G1 X133.363 Y159.716 E.01631
G1 X149.512 Y143.566 E.61887
G1 X149.137 Y143.351 E.01171
G1 X133.375 Y159.114 E.60405
G1 X133.387 Y158.512 E.01631
G1 X148.763 Y143.137 E.58922
G1 X148.388 Y142.922 E.01171
G1 X133.399 Y157.911 E.5744
G1 X133.411 Y157.309 E.01631
G1 X148.013 Y142.707 E.55957
G1 X147.638 Y142.492 E.01171
G1 X133.423 Y156.707 E.54475
G1 X133.435 Y156.105 E.01631
G1 X147.263 Y142.277 E.52992
G1 X146.888 Y142.062 E.01171
G1 X133.447 Y155.504 E.5151
G1 X133.459 Y154.902 E.01631
G1 X146.514 Y141.847 E.50027
G1 X146.139 Y141.632 E.01171
G1 X133.471 Y154.3 E.48545
G1 X133.483 Y153.698 E.01631
G1 X145.764 Y141.417 E.47062
G1 X145.65 Y141.352 E.00355
G1 X144.678 Y141.914 E.03042
M73 P94 R4
G1 X133.495 Y153.097 E.42855
G1 X133.507 Y152.495 E.01631
G1 X143.283 Y142.719 E.37462
G1 X141.888 Y143.525 E.04366
G1 X133.519 Y151.893 E.32069
G1 X133.531 Y151.291 E.01631
G1 X140.492 Y144.33 E.26676
G1 X139.097 Y145.136 E.04366
G1 X133.543 Y150.69 E.21283
G1 X133.555 Y150.088 E.01631
G1 X137.702 Y145.941 E.1589
G1 X136.307 Y146.747 E.04366
G1 X133.567 Y149.486 E.10497
G1 X133.579 Y148.884 E.01631
G1 X135.422 Y147.041 E.07062
; OBJECT_ID: 409
; WIPE_START
G1 X134.008 Y148.456 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 381
M625
; start printing object, unique label id: 409
M624 CAAAAAAAAAA=
M204 S10000
G1 X126.758 Y150.842 Z2.52 F30000
G1 X47.655 Y176.885 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X110.35 Y140.942 E1.95824
G1 X122.761 Y148.107 E.38831
G1 X123.706 Y195.365 E1.28081
G1 X47.713 Y176.899 E2.11912
; WIPE_START
G1 X49.447 Y175.903 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.584 Y177.037 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X110.356 Y140.483 E1.84804
G1 X123.157 Y147.873 E.37161
G1 X124.117 Y195.877 E1.20713
G1 X46.642 Y177.051 E2.00452
; WIPE_START
M204 S4000
G1 X48.377 Y176.055 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.627 Y176.521 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.936 Y176.83 E.01183
G1 X49.715 Y177.019 E.02172
G1 X49.139 Y176.443 E.02207
G1 X49.514 Y176.229 E.01171
G1 X50.494 Y177.209 E.03756
G1 X51.273 Y177.398 E.02172
G1 X49.889 Y176.014 E.05305
G1 X50.264 Y175.799 E.01171
G1 X52.052 Y177.587 E.06854
G1 X52.831 Y177.777 E.02172
G1 X50.638 Y175.584 E.08402
G1 X51.013 Y175.369 E.01171
G1 X53.61 Y177.966 E.09951
G1 X54.389 Y178.155 E.02172
G1 X51.388 Y175.154 E.115
G1 X51.763 Y174.939 E.01171
G1 X55.168 Y178.344 E.13049
G1 X55.947 Y178.534 E.02172
G1 X52.138 Y174.724 E.14598
G1 X52.513 Y174.51 E.01171
G1 X56.726 Y178.723 E.16147
G1 X57.505 Y178.912 E.02172
G1 X52.887 Y174.295 E.17696
G1 X53.262 Y174.08 E.01171
G1 X58.284 Y179.102 E.19245
G1 X59.063 Y179.291 E.02172
G1 X53.637 Y173.865 E.20793
G1 X54.012 Y173.65 E.01171
G1 X59.842 Y179.48 E.22342
G1 X60.621 Y179.67 E.02172
G1 X54.387 Y173.435 E.23891
G1 X54.762 Y173.22 E.01171
G1 X61.4 Y179.859 E.2544
G1 X62.179 Y180.048 E.02172
G1 X55.136 Y173.005 E.26989
G1 X55.511 Y172.79 E.01171
G1 X62.958 Y180.237 E.28538
G1 X63.737 Y180.427 E.02172
G1 X55.886 Y172.576 E.30087
G1 X56.261 Y172.361 E.01171
G1 X64.516 Y180.616 E.31636
G1 X65.295 Y180.805 E.02172
G1 X56.636 Y172.146 E.33185
G1 X57.01 Y171.931 E.01171
G1 X66.074 Y180.995 E.34733
G1 X66.853 Y181.184 E.02172
G1 X57.385 Y171.716 E.36282
G1 X57.76 Y171.501 E.01171
G1 X67.632 Y181.373 E.37831
G1 X68.411 Y181.563 E.02172
G1 X58.135 Y171.286 E.3938
G1 X58.51 Y171.071 E.01171
G1 X69.19 Y181.752 E.40929
G1 X69.969 Y181.941 E.02172
G1 X58.885 Y170.856 E.42478
G1 X59.259 Y170.642 E.01171
G1 X70.748 Y182.13 E.44027
G1 X71.527 Y182.32 E.02172
G1 X59.634 Y170.427 E.45576
G1 X60.009 Y170.212 E.01171
G1 X72.306 Y182.509 E.47124
G1 X73.085 Y182.698 E.02172
G1 X60.384 Y169.997 E.48673
G1 X60.759 Y169.782 E.01171
G1 X73.864 Y182.888 E.50222
G1 X74.643 Y183.077 E.02172
G1 X61.134 Y169.567 E.51771
G1 X61.508 Y169.352 E.01171
G1 X75.422 Y183.266 E.5332
G1 X76.201 Y183.456 E.02172
G1 X61.883 Y169.137 E.54869
G1 X62.258 Y168.923 E.01171
G1 X76.98 Y183.645 E.56418
G1 X77.759 Y183.834 E.02172
G1 X62.633 Y168.708 E.57967
G1 X63.008 Y168.493 E.01171
G1 X78.538 Y184.024 E.59515
G1 X79.317 Y184.213 E.02172
G1 X63.383 Y168.278 E.61064
G1 X63.757 Y168.063 E.01171
G1 X80.097 Y184.402 E.62613
G1 X80.876 Y184.591 E.02172
G1 X64.132 Y167.848 E.64162
G1 X64.507 Y167.633 E.01171
G1 X81.655 Y184.781 E.65711
G1 X82.434 Y184.97 E.02172
G1 X64.882 Y167.418 E.6726
G1 X65.257 Y167.203 E.01171
G1 X83.213 Y185.159 E.68809
G1 X83.992 Y185.349 E.02172
G1 X65.632 Y166.989 E.70358
G1 X66.006 Y166.774 E.01171
G1 X84.771 Y185.538 E.71906
G1 X85.55 Y185.727 E.02172
G1 X66.381 Y166.559 E.73455
M73 P94 R3
G1 X66.756 Y166.344 E.01171
G1 X86.329 Y185.917 E.75004
G1 X87.108 Y186.106 E.02172
G1 X67.131 Y166.129 E.76553
G1 X67.506 Y165.914 E.01171
G1 X87.887 Y186.295 E.78102
G1 X88.666 Y186.484 E.02172
G1 X67.881 Y165.699 E.79651
G1 X68.255 Y165.484 E.01171
G1 X89.445 Y186.674 E.812
G1 X90.224 Y186.863 E.02172
G1 X68.63 Y165.269 E.82749
G1 X69.005 Y165.055 E.01171
G1 X91.003 Y187.052 E.84297
G1 X91.782 Y187.242 E.02172
G1 X69.38 Y164.84 E.85846
G1 X69.755 Y164.625 E.01171
G1 X92.561 Y187.431 E.87395
G1 X93.34 Y187.62 E.02172
G1 X70.129 Y164.41 E.88944
G1 X70.504 Y164.195 E.01171
G1 X94.119 Y187.81 E.90493
G1 X94.898 Y187.999 E.02172
G1 X70.879 Y163.98 E.92042
G1 X71.254 Y163.765 E.01171
G1 X95.677 Y188.188 E.93591
G1 X96.456 Y188.377 E.02172
G1 X71.629 Y163.55 E.9514
G1 X72.004 Y163.336 E.01171
G1 X97.235 Y188.567 E.96688
G1 X98.014 Y188.756 E.02172
G1 X72.378 Y163.121 E.98237
G1 X72.753 Y162.906 E.01171
G1 X98.793 Y188.945 E.99786
G1 X99.572 Y189.135 E.02172
G1 X73.128 Y162.691 E1.01335
G1 X73.503 Y162.476 E.01171
G1 X100.351 Y189.324 E1.02884
G1 X101.13 Y189.513 E.02172
G1 X73.878 Y162.261 E1.04433
G1 X74.253 Y162.046 E.01171
G1 X101.909 Y189.703 E1.05982
G1 X102.688 Y189.892 E.02172
G1 X74.627 Y161.831 E1.07531
G1 X75.002 Y161.616 E.01171
G1 X103.467 Y190.081 E1.0908
G1 X104.246 Y190.27 E.02172
G1 X75.377 Y161.402 E1.10628
G1 X75.752 Y161.187 E.01171
G1 X105.025 Y190.46 E1.12177
G1 X105.804 Y190.649 E.02172
G1 X76.127 Y160.972 E1.13726
G1 X76.502 Y160.757 E.01171
G1 X106.583 Y190.838 E1.15275
G1 X107.362 Y191.028 E.02172
G1 X76.876 Y160.542 E1.16824
G1 X77.251 Y160.327 E.01171
G1 X108.141 Y191.217 E1.18373
G1 X108.92 Y191.406 E.02172
G1 X77.626 Y160.112 E1.19922
G1 X78.001 Y159.897 E.01171
G1 X109.699 Y191.596 E1.21471
G1 X110.478 Y191.785 E.02172
G1 X78.376 Y159.683 E1.23019
G1 X78.751 Y159.468 E.01171
G1 X111.257 Y191.974 E1.24568
G1 X112.036 Y192.163 E.02172
G1 X79.125 Y159.253 E1.26117
G1 X79.5 Y159.038 E.01171
G1 X112.815 Y192.353 E1.27666
G1 X113.594 Y192.542 E.02172
G1 X79.875 Y158.823 E1.29215
G1 X80.25 Y158.608 E.01171
G1 X114.373 Y192.731 E1.30764
G1 X115.152 Y192.921 E.02172
G1 X80.625 Y158.393 E1.32313
G1 X81 Y158.178 E.01171
G1 X115.931 Y193.11 E1.33862
G1 X116.71 Y193.299 E.02172
G1 X81.374 Y157.963 E1.3541
G1 X81.749 Y157.749 E.01171
G1 X117.489 Y193.489 E1.36959
G1 X118.268 Y193.678 E.02172
G1 X82.124 Y157.534 E1.38508
G1 X82.499 Y157.319 E.01171
G1 X119.047 Y193.867 E1.40057
G1 X119.826 Y194.056 E.02172
G1 X82.874 Y157.104 E1.41606
G1 X83.248 Y156.889 E.01171
G1 X120.605 Y194.246 E1.43155
G1 X121.384 Y194.435 E.02172
G1 X83.623 Y156.674 E1.44704
G1 X83.998 Y156.459 E.01171
G1 X122.163 Y194.624 E1.46253
G1 X122.942 Y194.814 E.02172
G1 X84.373 Y156.244 E1.47801
G1 X84.748 Y156.029 E.01171
G1 X123.336 Y194.617 E1.47873
G1 X123.324 Y194.016 E.01631
G1 X85.123 Y155.815 E1.4639
G1 X85.497 Y155.6 E.01171
G1 X123.312 Y193.414 E1.44908
G1 X123.3 Y192.812 E.01631
G1 X85.872 Y155.385 E1.43425
G1 X86.247 Y155.17 E.01171
G1 X123.288 Y192.21 E1.41943
G1 X123.276 Y191.609 E.01631
G1 X86.622 Y154.955 E1.4046
G1 X86.997 Y154.74 E.01171
G1 X123.263 Y191.007 E1.38978
G1 X123.251 Y190.405 E.01631
G1 X87.372 Y154.525 E1.37495
G1 X87.746 Y154.31 E.01171
G1 X123.239 Y189.803 E1.36013
G1 X123.227 Y189.202 E.01631
G1 X88.121 Y154.096 E1.3453
G1 X88.496 Y153.881 E.01171
G1 X123.215 Y188.6 E1.33048
G1 X123.203 Y187.998 E.01631
G1 X88.871 Y153.666 E1.31565
G1 X89.246 Y153.451 E.01171
G1 X123.191 Y187.396 E1.30083
G1 X123.179 Y186.795 E.01631
G1 X89.621 Y153.236 E1.286
G1 X89.995 Y153.021 E.01171
G1 X123.167 Y186.193 E1.27118
G1 X123.155 Y185.591 E.01631
G1 X90.37 Y152.806 E1.25635
G1 X90.745 Y152.591 E.01171
G1 X123.143 Y184.989 E1.24152
G1 X123.131 Y184.388 E.01631
G1 X91.12 Y152.376 E1.2267
G1 X91.495 Y152.162 E.01171
G1 X123.119 Y183.786 E1.21187
G1 X123.107 Y183.184 E.01631
G1 X91.87 Y151.947 E1.19705
G1 X92.244 Y151.732 E.01171
G1 X123.095 Y182.582 E1.18222
G1 X123.083 Y181.981 E.01631
G1 X92.619 Y151.517 E1.1674
G1 X92.994 Y151.302 E.01171
G1 X123.071 Y181.379 E1.15257
G1 X123.059 Y180.777 E.01631
G1 X93.369 Y151.087 E1.13775
G1 X93.744 Y150.872 E.01171
G1 X123.047 Y180.175 E1.12292
G1 X123.035 Y179.574 E.01631
G1 X94.119 Y150.657 E1.1081
G1 X94.493 Y150.443 E.01171
G1 X123.023 Y178.972 E1.09327
G1 X123.011 Y178.37 E.01631
G1 X94.868 Y150.228 E1.07845
G1 X95.243 Y150.013 E.01171
G1 X122.999 Y177.768 E1.06362
G1 X122.987 Y177.167 E.01631
G1 X95.618 Y149.798 E1.0488
G1 X95.993 Y149.583 E.01171
G1 X122.975 Y176.565 E1.03397
G1 X122.962 Y175.963 E.01631
G1 X96.368 Y149.368 E1.01915
G1 X96.742 Y149.153 E.01171
G1 X122.95 Y175.361 E1.00432
G1 X122.938 Y174.76 E.01631
G1 X97.117 Y148.938 E.9895
G1 X97.492 Y148.723 E.01171
G1 X122.926 Y174.158 E.97467
G1 X122.914 Y173.556 E.01631
G1 X97.867 Y148.509 E.95985
G1 X98.242 Y148.294 E.01171
G1 X122.902 Y172.954 E.94502
G1 X122.89 Y172.353 E.01631
G1 X98.616 Y148.079 E.9302
G1 X98.991 Y147.864 E.01171
G1 X122.878 Y171.751 E.91537
G1 X122.866 Y171.149 E.01631
G1 X99.366 Y147.649 E.90054
G1 X99.741 Y147.434 E.01171
G1 X122.854 Y170.547 E.88572
G1 X122.842 Y169.946 E.01631
G1 X100.116 Y147.219 E.87089
G1 X100.491 Y147.004 E.01171
G1 X122.83 Y169.344 E.85607
G1 X122.818 Y168.742 E.01631
G1 X100.865 Y146.789 E.84124
G1 X101.24 Y146.575 E.01171
G1 X122.806 Y168.14 E.82642
G1 X122.794 Y167.538 E.01631
G1 X101.615 Y146.36 E.81159
G1 X101.99 Y146.145 E.01171
G1 X122.782 Y166.937 E.79677
G1 X122.77 Y166.335 E.01631
G1 X102.365 Y145.93 E.78194
G1 X102.74 Y145.715 E.01171
G1 X122.758 Y165.733 E.76712
G1 X122.746 Y165.131 E.01631
G1 X103.114 Y145.5 E.75229
G1 X103.489 Y145.285 E.01171
G1 X122.734 Y164.53 E.73747
G1 X122.722 Y163.928 E.01631
G1 X103.864 Y145.07 E.72264
G1 X104.239 Y144.856 E.01171
G1 X122.71 Y163.326 E.70782
G1 X122.698 Y162.724 E.01631
G1 X104.614 Y144.641 E.69299
G1 X104.989 Y144.426 E.01171
G1 X122.686 Y162.123 E.67817
G1 X122.674 Y161.521 E.01631
G1 X105.363 Y144.211 E.66334
G1 X105.738 Y143.996 E.01171
G1 X122.661 Y160.919 E.64852
G1 X122.649 Y160.317 E.01631
G1 X106.113 Y143.781 E.63369
G1 X106.488 Y143.566 E.01171
G1 X122.637 Y159.716 E.61887
G1 X122.625 Y159.114 E.01631
G1 X106.863 Y143.351 E.60404
G1 X107.238 Y143.136 E.01171
G1 X122.613 Y158.512 E.58921
G1 X122.601 Y157.91 E.01631
G1 X107.612 Y142.922 E.57439
G1 X107.987 Y142.707 E.01171
G1 X122.589 Y157.309 E.55956
G1 X122.577 Y156.707 E.01631
G1 X108.362 Y142.492 E.54474
G1 X108.737 Y142.277 E.01171
G1 X122.565 Y156.105 E.52991
G1 X122.553 Y155.503 E.01631
G1 X109.112 Y142.062 E.51509
G1 X109.487 Y141.847 E.01171
G1 X122.541 Y154.902 E.50026
M73 P95 R3
G1 X122.529 Y154.3 E.01631
G1 X109.861 Y141.632 E.48544
G1 X110.236 Y141.417 E.01171
G1 X122.517 Y153.698 E.47061
G1 X122.505 Y153.096 E.01631
G1 X111.322 Y141.914 E.42852
G1 X112.718 Y142.72 E.04366
G1 X122.493 Y152.495 E.37459
G1 X122.481 Y151.893 E.01631
G1 X114.113 Y143.525 E.32066
G1 X115.508 Y144.331 E.04366
G1 X122.469 Y151.291 E.26673
G1 X122.457 Y150.689 E.01631
G1 X116.904 Y145.136 E.2128
G1 X118.299 Y145.942 E.04366
G1 X122.445 Y150.088 E.15887
G1 X122.433 Y149.486 E.01631
G1 X119.694 Y146.747 E.10494
G1 X121.089 Y147.553 E.04366
G1 X122.612 Y149.075 E.05833
; OBJECT_ID: 437
; WIPE_START
G1 X121.197 Y147.661 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 409
M625
; start printing object, unique label id: 437
M624 EAAAAAAAAAA=
M204 S10000
G1 X115.764 Y142.301 Z2.52 F30000
G1 X47.655 Y75.115 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X123.706 Y56.635 E2.12075
G1 X122.761 Y103.893 E1.28081
G1 X110.35 Y111.058 E.38831
G1 X47.707 Y75.145 E1.95662
; WIPE_START
G1 X49.65 Y74.672 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.584 Y74.963 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X124.117 Y56.123 E2.00603
G1 X123.157 Y104.127 E1.20713
G1 X110.351 Y111.52 E.37176
G1 X46.636 Y74.993 E1.84645
; WIPE_START
M204 S4000
G1 X48.579 Y74.52 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X49.19 Y74.916 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X48.764 Y75.342 E.01632
G1 X49.139 Y75.557 E.01171
G1 X49.715 Y74.981 E.02207
G1 X50.494 Y74.791 E.02172
G1 X49.514 Y75.771 E.03756
G1 X49.889 Y75.986 E.01171
G1 X51.273 Y74.602 E.05305
G1 X52.052 Y74.413 E.02172
G1 X50.264 Y76.201 E.06854
G1 X50.638 Y76.416 E.01171
G1 X52.831 Y74.223 E.08402
G1 X53.61 Y74.034 E.02172
G1 X51.013 Y76.631 E.09951
G1 X51.388 Y76.846 E.01171
G1 X54.389 Y73.845 E.115
G1 X55.168 Y73.656 E.02172
G1 X51.763 Y77.061 E.13049
G1 X52.138 Y77.276 E.01171
G1 X55.947 Y73.466 E.14598
G1 X56.726 Y73.277 E.02172
G1 X52.513 Y77.49 E.16147
G1 X52.887 Y77.705 E.01171
G1 X57.505 Y73.088 E.17696
G1 X58.284 Y72.898 E.02172
G1 X53.262 Y77.92 E.19245
G1 X53.637 Y78.135 E.01171
G1 X59.063 Y72.709 E.20793
G1 X59.842 Y72.52 E.02172
G1 X54.012 Y78.35 E.22342
G1 X54.387 Y78.565 E.01171
G1 X60.621 Y72.33 E.23891
G1 X61.4 Y72.141 E.02172
G1 X54.762 Y78.78 E.2544
G1 X55.136 Y78.995 E.01171
G1 X62.179 Y71.952 E.26989
G1 X62.958 Y71.763 E.02172
G1 X55.511 Y79.21 E.28538
G1 X55.886 Y79.424 E.01171
G1 X63.737 Y71.573 E.30087
G1 X64.516 Y71.384 E.02172
G1 X56.261 Y79.639 E.31636
G1 X56.636 Y79.854 E.01171
G1 X65.295 Y71.195 E.33184
G1 X66.074 Y71.005 E.02172
G1 X57.01 Y80.069 E.34733
G1 X57.385 Y80.284 E.01171
G1 X66.853 Y70.816 E.36282
G1 X67.632 Y70.627 E.02172
G1 X57.76 Y80.499 E.37831
G1 X58.135 Y80.714 E.01171
G1 X68.411 Y70.437 E.3938
G1 X69.19 Y70.248 E.02172
G1 X58.51 Y80.929 E.40929
G1 X58.885 Y81.144 E.01171
G1 X69.969 Y70.059 E.42478
G1 X70.748 Y69.87 E.02172
G1 X59.259 Y81.358 E.44027
G1 X59.634 Y81.573 E.01171
G1 X71.527 Y69.68 E.45575
G1 X72.306 Y69.491 E.02172
G1 X60.009 Y81.788 E.47124
G1 X60.384 Y82.003 E.01171
G1 X73.085 Y69.302 E.48673
G1 X73.864 Y69.112 E.02172
G1 X60.759 Y82.218 E.50222
G1 X61.134 Y82.433 E.01171
G1 X74.643 Y68.923 E.51771
G1 X75.422 Y68.734 E.02172
G1 X61.508 Y82.648 E.5332
G1 X61.883 Y82.863 E.01171
G1 X76.201 Y68.544 E.54869
G1 X76.98 Y68.355 E.02172
G1 X62.258 Y83.077 E.56418
G1 X62.633 Y83.292 E.01171
G1 X77.759 Y68.166 E.57966
G1 X78.538 Y67.977 E.02172
G1 X63.008 Y83.507 E.59515
G1 X63.383 Y83.722 E.01171
G1 X79.317 Y67.787 E.61064
G1 X80.096 Y67.598 E.02172
G1 X63.757 Y83.937 E.62613
G1 X64.132 Y84.152 E.01171
G1 X80.876 Y67.409 E.64162
G1 X81.655 Y67.219 E.02172
G1 X64.507 Y84.367 E.65711
G1 X64.882 Y84.582 E.01171
G1 X82.434 Y67.03 E.6726
G1 X83.213 Y66.841 E.02172
G1 X65.257 Y84.797 E.68809
G1 X65.632 Y85.011 E.01171
G1 X83.992 Y66.651 E.70357
G1 X84.771 Y66.462 E.02172
G1 X66.006 Y85.226 E.71906
G1 X66.381 Y85.441 E.01171
G1 X85.55 Y66.273 E.73455
G1 X86.329 Y66.084 E.02172
G1 X66.756 Y85.656 E.75004
G1 X67.131 Y85.871 E.01171
G1 X87.108 Y65.894 E.76553
G1 X87.887 Y65.705 E.02172
G1 X67.506 Y86.086 E.78102
G1 X67.881 Y86.301 E.01171
G1 X88.666 Y65.516 E.79651
G1 X89.445 Y65.326 E.02172
G1 X68.255 Y86.516 E.812
G1 X68.63 Y86.73 E.01171
G1 X90.224 Y65.137 E.82748
G1 X91.003 Y64.948 E.02172
G1 X69.005 Y86.945 E.84297
G1 X69.38 Y87.16 E.01171
G1 X91.782 Y64.758 E.85846
G1 X92.561 Y64.569 E.02172
G1 X69.755 Y87.375 E.87395
G1 X70.129 Y87.59 E.01171
G1 X93.34 Y64.38 E.88944
G1 X94.119 Y64.191 E.02172
G1 X70.504 Y87.805 E.90493
G1 X70.879 Y88.02 E.01171
G1 X94.898 Y64.001 E.92042
G1 X95.677 Y63.812 E.02172
G1 X71.254 Y88.235 E.93591
G1 X71.629 Y88.45 E.01171
G1 X96.456 Y63.623 E.95139
G1 X97.235 Y63.433 E.02172
G1 X72.004 Y88.664 E.96688
G1 X72.378 Y88.879 E.01171
G1 X98.014 Y63.244 E.98237
G1 X98.793 Y63.055 E.02172
G1 X72.753 Y89.094 E.99786
G1 X73.128 Y89.309 E.01171
G1 X99.572 Y62.865 E1.01335
G1 X100.351 Y62.676 E.02172
G1 X73.503 Y89.524 E1.02884
G1 X73.878 Y89.739 E.01171
G1 X101.13 Y62.487 E1.04433
G1 X101.909 Y62.298 E.02172
G1 X74.253 Y89.954 E1.05982
G1 X74.627 Y90.169 E.01171
G1 X102.688 Y62.108 E1.07531
G1 X103.467 Y61.919 E.02172
G1 X75.002 Y90.384 E1.09079
G1 X75.377 Y90.598 E.01171
G1 X104.246 Y61.73 E1.10628
G1 X105.025 Y61.54 E.02172
G1 X75.752 Y90.813 E1.12177
G1 X76.127 Y91.028 E.01171
G1 X105.804 Y61.351 E1.13726
G1 X106.583 Y61.162 E.02172
G1 X76.502 Y91.243 E1.15275
G1 X76.876 Y91.458 E.01171
G1 X107.362 Y60.972 E1.16824
G1 X108.141 Y60.783 E.02172
G1 X77.251 Y91.673 E1.18373
G1 X77.626 Y91.888 E.01171
G1 X108.92 Y60.594 E1.19922
G1 X109.699 Y60.405 E.02172
G1 X78.001 Y92.103 E1.2147
G1 X78.376 Y92.317 E.01171
G1 X110.478 Y60.215 E1.23019
G1 X111.257 Y60.026 E.02172
G1 X78.751 Y92.532 E1.24568
G1 X79.125 Y92.747 E.01171
G1 X112.036 Y59.837 E1.26117
G1 X112.815 Y59.647 E.02172
G1 X79.5 Y92.962 E1.27666
G1 X79.875 Y93.177 E.01171
G1 X113.594 Y59.458 E1.29215
G1 X114.373 Y59.269 E.02172
G1 X80.25 Y93.392 E1.30764
G1 X80.625 Y93.607 E.01171
G1 X115.152 Y59.079 E1.32313
G1 X115.931 Y58.89 E.02172
G1 X81 Y93.822 E1.33861
G1 X81.374 Y94.037 E.01171
G1 X116.71 Y58.701 E1.3541
G1 X117.489 Y58.511 E.02172
G1 X81.749 Y94.251 E1.36959
G1 X82.124 Y94.466 E.01171
G1 X118.268 Y58.322 E1.38508
G1 X119.047 Y58.133 E.02172
G1 X82.499 Y94.681 E1.40057
G1 X82.874 Y94.896 E.01171
G1 X119.826 Y57.944 E1.41606
G1 X120.605 Y57.754 E.02172
G1 X83.249 Y95.111 E1.43155
G1 X83.623 Y95.326 E.01171
G1 X121.384 Y57.565 E1.44704
G1 X122.163 Y57.376 E.02172
G1 X83.998 Y95.541 E1.46252
G1 X84.373 Y95.756 E.01171
G1 X122.942 Y57.186 E1.47801
G1 X123.342 Y57.089 E.01114
G1 X123.336 Y57.383 E.00795
G1 X84.748 Y95.971 E1.47873
G1 X85.123 Y96.185 E.01171
G1 X123.324 Y57.984 E1.4639
G1 X123.312 Y58.586 E.01631
G1 X85.497 Y96.4 E1.44908
G1 X85.872 Y96.615 E.01171
G1 X123.3 Y59.188 E1.43425
G1 X123.288 Y59.79 E.01631
G1 X86.247 Y96.83 E1.41943
G1 X86.622 Y97.045 E.01171
G1 X123.276 Y60.391 E1.4046
G1 X123.263 Y60.993 E.01631
G1 X86.997 Y97.26 E1.38978
G1 X87.372 Y97.475 E.01171
G1 X123.251 Y61.595 E1.37495
G1 X123.239 Y62.197 E.01631
G1 X87.746 Y97.69 E1.36013
G1 X88.121 Y97.904 E.01171
G1 X123.227 Y62.798 E1.3453
G1 X123.215 Y63.4 E.01631
G1 X88.496 Y98.119 E1.33048
G1 X88.871 Y98.334 E.01171
G1 X123.203 Y64.002 E1.31565
G1 X123.191 Y64.604 E.01631
G1 X89.246 Y98.549 E1.30083
G1 X89.621 Y98.764 E.01171
G1 X123.179 Y65.205 E1.286
G1 X123.167 Y65.807 E.01631
G1 X89.995 Y98.979 E1.27117
G1 X90.37 Y99.194 E.01171
G1 X123.155 Y66.409 E1.25635
G1 X123.143 Y67.011 E.01631
G1 X90.745 Y99.409 E1.24152
G1 X91.12 Y99.624 E.01171
G1 X123.131 Y67.612 E1.2267
G1 X123.119 Y68.214 E.01631
G1 X91.495 Y99.838 E1.21187
G1 X91.87 Y100.053 E.01171
G1 X123.107 Y68.816 E1.19705
G1 X123.095 Y69.418 E.01631
G1 X92.244 Y100.268 E1.18222
G1 X92.619 Y100.483 E.01171
G1 X123.083 Y70.019 E1.1674
G1 X123.071 Y70.621 E.01631
G1 X92.994 Y100.698 E1.15257
G1 X93.369 Y100.913 E.01171
G1 X123.059 Y71.223 E1.13775
G1 X123.047 Y71.825 E.01631
G1 X93.744 Y101.128 E1.12292
G1 X94.119 Y101.343 E.01171
G1 X123.035 Y72.426 E1.1081
M73 P95 R2
G1 X123.023 Y73.028 E.01631
G1 X94.493 Y101.557 E1.09327
G1 X94.868 Y101.772 E.01171
G1 X123.011 Y73.63 E1.07845
G1 X122.999 Y74.232 E.01631
G1 X95.243 Y101.987 E1.06362
G1 X95.618 Y102.202 E.01171
G1 X122.987 Y74.833 E1.0488
G1 X122.975 Y75.435 E.01631
G1 X95.993 Y102.417 E1.03397
G1 X96.368 Y102.632 E.01171
G1 X122.962 Y76.037 E1.01915
G1 X122.95 Y76.639 E.01631
G1 X96.742 Y102.847 E1.00432
G1 X97.117 Y103.062 E.01171
G1 X122.938 Y77.24 E.9895
G1 X122.926 Y77.842 E.01631
G1 X97.492 Y103.277 E.97467
G1 X97.867 Y103.491 E.01171
G1 X122.914 Y78.444 E.95985
G1 X122.902 Y79.046 E.01631
G1 X98.242 Y103.706 E.94502
G1 X98.616 Y103.921 E.01171
G1 X122.89 Y79.647 E.93019
G1 X122.878 Y80.249 E.01631
G1 X98.991 Y104.136 E.91537
G1 X99.366 Y104.351 E.01171
G1 X122.866 Y80.851 E.90054
G1 X122.854 Y81.453 E.01631
G1 X99.741 Y104.566 E.88572
G1 X100.116 Y104.781 E.01171
G1 X122.842 Y82.054 E.87089
G1 X122.83 Y82.656 E.01631
G1 X100.491 Y104.996 E.85607
G1 X100.865 Y105.211 E.01171
G1 X122.818 Y83.258 E.84124
G1 X122.806 Y83.86 E.01631
G1 X101.24 Y105.425 E.82642
G1 X101.615 Y105.64 E.01171
G1 X122.794 Y84.462 E.81159
G1 X122.782 Y85.063 E.01631
G1 X101.99 Y105.855 E.79677
G1 X102.365 Y106.07 E.01171
G1 X122.77 Y85.665 E.78194
G1 X122.758 Y86.267 E.01631
G1 X102.74 Y106.285 E.76712
G1 X103.114 Y106.5 E.01171
G1 X122.746 Y86.869 E.75229
G1 X122.734 Y87.47 E.01631
G1 X103.489 Y106.715 E.73747
G1 X103.864 Y106.93 E.01171
G1 X122.722 Y88.072 E.72264
G1 X122.71 Y88.674 E.01631
G1 X104.239 Y107.144 E.70782
G1 X104.614 Y107.359 E.01171
G1 X122.698 Y89.276 E.69299
G1 X122.686 Y89.877 E.01631
G1 X104.989 Y107.574 E.67817
G1 X105.363 Y107.789 E.01171
G1 X122.674 Y90.479 E.66334
G1 X122.661 Y91.081 E.01631
G1 X105.738 Y108.004 E.64852
G1 X106.113 Y108.219 E.01171
G1 X122.649 Y91.683 E.63369
G1 X122.637 Y92.284 E.01631
G1 X106.488 Y108.434 E.61886
G1 X106.863 Y108.649 E.01171
G1 X122.625 Y92.886 E.60404
G1 X122.613 Y93.488 E.01631
G1 X107.238 Y108.864 E.58921
G1 X107.612 Y109.078 E.01171
G1 X122.601 Y94.09 E.57439
G1 X122.589 Y94.691 E.01631
G1 X107.987 Y109.293 E.55956
G1 X108.362 Y109.508 E.01171
G1 X122.577 Y95.293 E.54474
G1 X122.565 Y95.895 E.01631
G1 X108.737 Y109.723 E.52991
M73 P96 R2
G1 X109.112 Y109.938 E.01171
G1 X122.553 Y96.497 E.51509
G1 X122.541 Y97.098 E.01631
G1 X109.487 Y110.153 E.50026
G1 X109.861 Y110.368 E.01171
G1 X122.529 Y97.7 E.48544
G1 X122.517 Y98.302 E.01631
G1 X110.236 Y110.583 E.47061
G1 X110.35 Y110.648 E.00355
G1 X111.322 Y110.086 E.03044
G1 X122.505 Y98.904 E.42852
G1 X122.493 Y99.505 E.01631
G1 X112.718 Y109.28 E.37459
G1 X114.113 Y108.475 E.04366
G1 X122.481 Y100.107 E.32066
G1 X122.469 Y100.709 E.01631
G1 X115.508 Y107.669 E.26673
G1 X116.904 Y106.864 E.04366
G1 X122.457 Y101.311 E.2128
G1 X122.445 Y101.912 E.01631
G1 X118.299 Y106.058 E.15887
G1 X119.694 Y105.253 E.04366
G1 X122.433 Y102.514 E.10494
G1 X122.421 Y103.116 E.01631
G1 X120.578 Y104.958 E.0706
; OBJECT_ID: 465
; WIPE_START
G1 X121.993 Y103.544 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 437
M625
; start printing object, unique label id: 465
M624 IAAAAAAAAAA=
M204 S10000
G1 X116.124 Y108.424 Z2.52 F30000
G1 X40.405 Y171.393 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
M204 S4000
G1 X40.405 Y80.607 E2.46005
G1 X106.235 Y118.346 E2.05614
G1 X106.235 Y133.654 E.41479
G1 X40.457 Y171.363 E2.05452
M204 S10000
G1 X40.004 Y172.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X40.004 Y79.915 E2.31727
G1 X106.636 Y118.114 E1.93097
G1 X106.636 Y133.886 E.39653
G1 X40.056 Y172.055 E1.92946
; WIPE_START
M204 S4000
G1 X40.055 Y170.055 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.735 Y166.362 Z2.52 F30000
G1 X105.878 Y133.664 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X105.878 Y118.552 E.4095
G1 X105.461 Y118.312 E.01304
G1 X105.461 Y133.688 E.41662
G1 X105.044 Y133.927 E.01304
G1 X105.044 Y118.073 E.42959
G1 X104.626 Y117.834 E.01304
G1 X104.626 Y134.166 E.44256
G1 X104.209 Y134.406 E.01304
G1 X104.209 Y117.594 E.45553
G1 X103.791 Y117.355 E.01304
G1 X103.791 Y134.645 E.4685
G1 X103.374 Y134.884 E.01304
G1 X103.374 Y117.116 E.48147
G1 X102.957 Y116.877 E.01304
G1 X102.957 Y135.123 E.49443
G1 X102.539 Y135.363 E.01304
G1 X102.539 Y116.637 E.5074
G1 X102.122 Y116.398 E.01304
G1 X102.122 Y135.602 E.52037
G1 X101.704 Y135.841 E.01304
G1 X101.704 Y116.159 E.53334
G1 X101.287 Y115.919 E.01304
G1 X101.287 Y136.081 E.54631
G1 X100.87 Y136.32 E.01304
G1 X100.87 Y115.68 E.55928
G1 X100.452 Y115.441 E.01304
G1 X100.452 Y136.559 E.57224
G1 X100.035 Y136.798 E.01304
G1 X100.035 Y115.202 E.58521
G1 X99.617 Y114.962 E.01304
G1 X99.617 Y137.038 E.59818
G1 X99.2 Y137.277 E.01304
G1 X99.2 Y114.723 E.61115
G1 X98.782 Y114.484 E.01304
G1 X98.782 Y137.516 E.62412
G1 X98.365 Y137.756 E.01304
G1 X98.365 Y114.244 E.63709
G1 X97.948 Y114.005 E.01304
G1 X97.948 Y137.995 E.65006
G1 X97.53 Y138.234 E.01304
G1 X97.53 Y113.766 E.66302
G1 X97.113 Y113.526 E.01304
G1 X97.113 Y138.474 E.67599
G1 X96.695 Y138.713 E.01304
G1 X96.695 Y113.287 E.68896
G1 X96.278 Y113.048 E.01304
G1 X96.278 Y138.952 E.70193
G1 X95.861 Y139.191 E.01304
G1 X95.861 Y112.809 E.7149
G1 X95.443 Y112.569 E.01304
G1 X95.443 Y139.431 E.72787
G1 X95.026 Y139.67 E.01304
G1 X95.026 Y112.33 E.74083
G1 X94.608 Y112.091 E.01304
G1 X94.608 Y139.909 E.7538
G1 X94.191 Y140.149 E.01304
G1 X94.191 Y111.851 E.76677
G1 X93.774 Y111.612 E.01304
G1 X93.774 Y140.388 E.77974
G1 X93.356 Y140.627 E.01304
G1 X93.356 Y111.373 E.79271
G1 X92.939 Y111.134 E.01304
G1 X92.939 Y140.866 E.80568
G1 X92.521 Y141.106 E.01304
G1 X92.521 Y110.894 E.81864
G1 X92.104 Y110.655 E.01304
G1 X92.104 Y141.345 E.83161
G1 X91.687 Y141.584 E.01304
G1 X91.687 Y110.416 E.84458
G1 X91.269 Y110.176 E.01304
G1 X91.269 Y141.824 E.85755
G1 X90.852 Y142.063 E.01304
G1 X90.852 Y109.937 E.87052
G1 X90.434 Y109.698 E.01304
G1 X90.434 Y142.302 E.88349
G1 X90.017 Y142.542 E.01304
G1 X90.017 Y109.458 E.89645
G1 X89.599 Y109.219 E.01304
G1 X89.599 Y142.781 E.90942
G1 X89.182 Y143.02 E.01304
G1 X89.182 Y108.98 E.92239
G1 X88.765 Y108.741 E.01304
G1 X88.765 Y143.259 E.93536
G1 X88.347 Y143.499 E.01304
G1 X88.347 Y108.501 E.94833
G1 X87.93 Y108.262 E.01304
G1 X87.93 Y143.738 E.9613
G1 X87.512 Y143.977 E.01304
G1 X87.512 Y108.023 E.97427
G1 X87.095 Y107.783 E.01304
G1 X87.095 Y144.217 E.98723
G1 X86.678 Y144.456 E.01304
G1 X86.678 Y107.544 E1.0002
G1 X86.26 Y107.305 E.01304
G1 X86.26 Y144.695 E1.01317
G1 X85.843 Y144.934 E.01304
G1 X85.843 Y107.065 E1.02614
G1 X85.425 Y106.826 E.01304
G1 X85.425 Y145.174 E1.03911
G1 X85.008 Y145.413 E.01304
G1 X85.008 Y106.587 E1.05208
G1 X84.591 Y106.348 E.01304
G1 X84.591 Y145.652 E1.06504
G1 X84.173 Y145.892 E.01304
G1 X84.173 Y106.108 E1.07801
G1 X83.756 Y105.869 E.01304
G1 X83.756 Y146.131 E1.09098
G1 X83.338 Y146.37 E.01304
G1 X83.338 Y105.63 E1.10395
G1 X82.921 Y105.39 E.01304
G1 X82.921 Y146.61 E1.11692
G1 X82.503 Y146.849 E.01304
G1 X82.503 Y105.151 E1.12989
G1 X82.086 Y104.912 E.01304
G1 X82.086 Y147.088 E1.14285
G1 X81.669 Y147.327 E.01304
G1 X81.669 Y104.673 E1.15582
G1 X81.251 Y104.433 E.01304
G1 X81.251 Y147.567 E1.16879
G1 X80.834 Y147.806 E.01304
G1 X80.834 Y104.194 E1.18176
G1 X80.416 Y103.955 E.01304
G1 X80.416 Y148.045 E1.19473
G1 X79.999 Y148.285 E.01304
G1 X79.999 Y103.715 E1.2077
G1 X79.582 Y103.476 E.01304
G1 X79.582 Y148.524 E1.22066
G1 X79.164 Y148.763 E.01304
G1 X79.164 Y103.237 E1.23363
G1 X78.747 Y102.997 E.01304
G1 X78.747 Y149.003 E1.2466
G1 X78.329 Y149.242 E.01304
G1 X78.329 Y102.758 E1.25957
G1 X77.912 Y102.519 E.01304
G1 X77.912 Y149.481 E1.27254
G1 X77.495 Y149.72 E.01304
G1 X77.495 Y102.28 E1.28551
G1 X77.077 Y102.04 E.01304
G1 X77.077 Y149.96 E1.29847
G1 X76.66 Y150.199 E.01304
G1 X76.66 Y101.801 E1.31144
G1 X76.242 Y101.562 E.01304
G1 X76.242 Y150.438 E1.32441
G1 X75.825 Y150.678 E.01304
G1 X75.825 Y101.322 E1.33738
G1 X75.408 Y101.083 E.01304
G1 X75.408 Y150.917 E1.35035
G1 X74.99 Y151.156 E.01304
G1 X74.99 Y100.844 E1.36332
G1 X74.573 Y100.605 E.01304
G1 X74.573 Y151.395 E1.37629
G1 X74.155 Y151.635 E.01304
G1 X74.155 Y100.365 E1.38925
G1 X73.738 Y100.126 E.01304
G1 X73.738 Y151.874 E1.40222
G1 X73.32 Y152.113 E.01304
G1 X73.32 Y99.887 E1.41519
G1 X72.903 Y99.647 E.01304
G1 X72.903 Y152.353 E1.42816
G1 X72.486 Y152.592 E.01304
G1 X72.486 Y99.408 E1.44113
G1 X72.068 Y99.169 E.01304
G1 X72.068 Y152.831 E1.4541
G1 X71.651 Y153.071 E.01304
G1 X71.651 Y98.929 E1.46706
G1 X71.233 Y98.69 E.01304
G1 X71.233 Y153.31 E1.48003
G1 X70.816 Y153.549 E.01304
G1 X70.816 Y98.451 E1.493
G1 X70.399 Y98.212 E.01304
G1 X70.399 Y153.788 E1.50597
G1 X69.981 Y154.028 E.01304
G1 X69.981 Y97.972 E1.51894
G1 X69.564 Y97.733 E.01304
G1 X69.564 Y154.267 E1.53191
G1 X69.146 Y154.506 E.01304
G1 X69.146 Y97.494 E1.54487
G1 X68.729 Y97.254 E.01304
G1 X68.729 Y154.746 E1.55784
G1 X68.312 Y154.985 E.01304
G1 X68.312 Y97.015 E1.57081
G1 X67.894 Y96.776 E.01304
G1 X67.894 Y155.224 E1.58378
G1 X67.477 Y155.463 E.01304
G1 X67.477 Y96.537 E1.59675
G1 X67.059 Y96.297 E.01304
G1 X67.059 Y155.703 E1.60972
G1 X66.642 Y155.942 E.01304
G1 X66.642 Y96.058 E1.62268
G1 X66.224 Y95.819 E.01304
G1 X66.224 Y156.181 E1.63565
G1 X65.807 Y156.421 E.01304
G1 X65.807 Y95.579 E1.64862
G1 X65.39 Y95.34 E.01304
G1 X65.39 Y156.66 E1.66159
G1 X64.972 Y156.899 E.01304
G1 X64.972 Y95.101 E1.67456
G1 X64.555 Y94.861 E.01304
G1 X64.555 Y157.139 E1.68753
G1 X64.137 Y157.378 E.01304
G1 X64.137 Y94.622 E1.70049
G1 X63.72 Y94.383 E.01304
G1 X63.72 Y157.617 E1.71346
G1 X63.303 Y157.856 E.01304
G1 X63.303 Y94.144 E1.72643
G1 X62.885 Y93.904 E.01304
G1 X62.885 Y158.096 E1.7394
G1 X62.468 Y158.335 E.01304
G1 X62.468 Y93.665 E1.75237
G1 X62.05 Y93.426 E.01304
G1 X62.05 Y158.574 E1.76534
G1 X61.633 Y158.814 E.01304
G1 X61.633 Y93.186 E1.77831
G1 X61.216 Y92.947 E.01304
G1 X61.216 Y159.053 E1.79127
G1 X60.798 Y159.292 E.01304
G1 X60.798 Y92.708 E1.80424
G1 X60.381 Y92.468 E.01304
G1 X60.381 Y159.532 E1.81721
G1 X59.963 Y159.771 E.01304
G1 X59.963 Y92.229 E1.83018
G1 X59.546 Y91.99 E.01304
G1 X59.546 Y160.01 E1.84315
G1 X59.129 Y160.249 E.01304
G1 X59.129 Y91.751 E1.85612
G1 X58.711 Y91.511 E.01304
G1 X58.711 Y160.489 E1.86908
G1 X58.294 Y160.728 E.01304
G1 X58.294 Y91.272 E1.88205
G1 X57.876 Y91.033 E.01304
G1 X57.876 Y160.967 E1.89502
G1 X57.459 Y161.207 E.01304
G1 X57.459 Y90.793 E1.90799
G1 X57.041 Y90.554 E.01304
G1 X57.041 Y161.446 E1.92096
G1 X56.624 Y161.685 E.01304
G1 X56.624 Y90.315 E1.93393
G1 X56.207 Y90.076 E.01304
G1 X56.207 Y161.924 E1.94689
G1 X55.789 Y162.164 E.01304
G1 X55.789 Y89.836 E1.95986
G1 X55.372 Y89.597 E.01304
G1 X55.372 Y162.403 E1.97283
G1 X54.954 Y162.642 E.01304
G1 X54.954 Y89.358 E1.9858
G1 X54.537 Y89.118 E.01304
G1 X54.537 Y162.882 E1.99877
G1 X54.12 Y163.121 E.01304
G1 X54.12 Y88.879 E2.01174
G1 X53.702 Y88.64 E.01304
G1 X53.702 Y163.36 E2.0247
G1 X53.285 Y163.6 E.01304
G1 X53.285 Y88.4 E2.03767
G1 X52.867 Y88.161 E.01304
G1 X52.867 Y163.839 E2.05064
G1 X52.45 Y164.078 E.01304
G1 X52.45 Y87.922 E2.06361
G1 X52.033 Y87.683 E.01304
G1 X52.033 Y164.317 E2.07658
G1 X51.615 Y164.557 E.01304
G1 X51.615 Y87.443 E2.08955
G1 X51.198 Y87.204 E.01304
G1 X51.198 Y164.796 E2.10252
G1 X50.78 Y165.035 E.01304
G1 X50.78 Y86.965 E2.11548
M73 P97 R2
G1 X50.363 Y86.725 E.01304
G1 X50.363 Y165.275 E2.12845
G1 X49.946 Y165.514 E.01304
G1 X49.946 Y86.486 E2.14142
G1 X49.528 Y86.247 E.01304
G1 X49.528 Y165.753 E2.15439
G1 X49.111 Y165.992 E.01304
G1 X49.111 Y86.008 E2.16736
G1 X48.693 Y85.768 E.01304
G1 X48.693 Y166.232 E2.18033
G1 X48.276 Y166.471 E.01304
G1 X48.276 Y85.529 E2.19329
G1 X47.858 Y85.29 E.01304
G1 X47.858 Y166.71 E2.20626
G1 X47.441 Y166.95 E.01304
G1 X47.441 Y85.05 E2.21923
G1 X47.024 Y84.811 E.01304
G1 X47.024 Y167.189 E2.2322
G1 X46.606 Y167.428 E.01304
G1 X46.606 Y84.572 E2.24517
G1 X46.189 Y84.332 E.01304
G1 X46.189 Y167.668 E2.25814
G1 X45.771 Y167.907 E.01304
G1 X45.771 Y84.093 E2.2711
G1 X45.354 Y83.854 E.01304
G1 X45.354 Y168.146 E2.28407
G1 X44.937 Y168.385 E.01304
G1 X44.937 Y83.615 E2.29704
G1 X44.519 Y83.375 E.01304
G1 X44.519 Y168.625 E2.31001
G1 X44.102 Y168.864 E.01304
G1 X44.102 Y83.136 E2.32298
G1 X43.684 Y82.897 E.01304
G1 X43.684 Y169.103 E2.33595
M73 P97 R1
G1 X43.267 Y169.343 E.01304
G1 X43.267 Y82.657 E2.34891
G1 X42.85 Y82.418 E.01304
G1 X42.85 Y169.582 E2.36188
G1 X42.432 Y169.821 E.01304
G1 X42.432 Y82.179 E2.37485
G1 X42.015 Y81.94 E.01304
G1 X42.015 Y170.06 E2.38782
G1 X41.597 Y170.3 E.01304
G1 X41.597 Y81.7 E2.40079
G1 X41.18 Y81.461 E.01304
G1 X41.18 Y170.539 E2.41376
G1 X40.762 Y170.778 E.01304
G1 X40.762 Y81.006 E2.43257
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X40.762 Y83.006 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 465
M625
; layer num/total_layer_count: 14/14
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
M204 S10000
G17
G3 Z2.52 I1.217 J0 P1  F30000
; object ids of layer 14 start: 325,353,381,409,437,465
M624 PwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer14 end: 325,353,381,409,437,465
M625
; OBJECT_ID: 325
; start printing object, unique label id: 325
M624 AQAAAAAAAAA=
G1 X209.286 Y74.932
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X145.649 Y111.413 E1.84417
G1 X132.935 Y104.073 E.36911
G1 X131.976 Y56.145 E1.2052
G1 X209.227 Y74.917 E1.99873
; WIPE_START
M204 S4000
G1 X207.493 Y75.913 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X202.291 Y78.762 Z2.68 F30000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X206.456 Y74.597 E.15961
G1 X204.092 Y74.022 E.06594
G1 X195.908 Y82.205 E.31359
G1 X189.02 Y86.154 E.21514
G1 X201.727 Y73.448 E.48692
G1 X199.362 Y72.873 E.06594
G1 X182.133 Y90.103 E.66026
G1 X175.245 Y94.052 E.21514
G1 X196.998 Y72.298 E.8336
G1 X194.633 Y71.724 E.06594
G1 X168.357 Y98 E1.00694
G1 X161.469 Y101.949 E.21514
G1 X192.269 Y71.149 E1.18028
G1 X189.904 Y70.575 E.06594
G1 X154.581 Y105.898 E1.35362
G1 X147.693 Y109.847 E.21514
G1 X187.539 Y70 E1.52696
G1 X185.175 Y69.426 E.06594
G1 X144.339 Y110.261 E1.56487
G1 X142.476 Y109.185 E.0583
G1 X182.81 Y68.851 E1.54566
G1 X180.446 Y68.276 E.06594
G1 X140.612 Y108.11 E1.52645
G1 X138.749 Y107.034 E.0583
G1 X178.081 Y67.702 E1.50725
G1 X175.717 Y67.127 E.06594
G1 X136.886 Y105.958 E1.48804
G1 X135.022 Y104.882 E.0583
G1 X173.352 Y66.553 E1.46883
G1 X170.987 Y65.978 E.06594
G1 X133.27 Y103.695 E1.44537
G1 X133.212 Y100.814 E.0781
G1 X168.623 Y65.403 E1.35697
G1 X166.258 Y64.829 E.06594
G1 X133.155 Y97.932 E1.26856
G1 X133.097 Y95.051 E.0781
G1 X163.894 Y64.254 E1.18016
G1 X161.529 Y63.68 E.06594
G1 X133.039 Y92.169 E1.09176
G1 X132.982 Y89.288 E.0781
G1 X159.164 Y63.105 E1.00335
G1 X156.8 Y62.53 E.06594
G1 X132.924 Y86.406 E.91495
G1 X132.866 Y83.525 E.0781
G1 X154.435 Y61.956 E.82654
G1 X152.071 Y61.381 E.06594
G1 X132.809 Y80.643 E.73814
G1 X132.751 Y77.762 E.0781
G1 X149.706 Y60.807 E.64974
G1 X147.342 Y60.232 E.06594
G1 X132.693 Y74.88 E.56133
G1 X132.636 Y71.999 E.0781
G1 X144.977 Y59.657 E.47293
G1 X142.612 Y59.083 E.06594
G1 X132.578 Y69.117 E.38453
G1 X132.52 Y66.236 E.0781
G1 X140.248 Y58.508 E.29612
G1 X137.883 Y57.934 E.06594
G1 X132.463 Y63.354 E.20772
G1 X132.405 Y60.473 E.0781
G1 X135.519 Y57.359 E.11931
G1 X133.154 Y56.784 E.06594
G1 X132.164 Y57.775 E.03794
; OBJECT_ID: 353
; WIPE_START
G1 X133.154 Y56.784 E-.53205
G1 X133.737 Y56.926 E-.22795
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 325
M625
; start printing object, unique label id: 353
M624 AgAAAAAAAAA=
M204 S10000
G1 X138.176 Y63.135 Z2.68 F30000
G1 X215.996 Y171.978 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X149.457 Y133.832 E1.92828
G1 X149.457 Y118.168 E.39383
G1 X215.996 Y80.022 E1.92828
G1 X215.996 Y171.918 E2.3104
; WIPE_START
M204 S4000
G1 X214.26 Y170.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X212.238 Y169.645 Z2.68 F30000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X215.653 Y169.645 E.09253
G1 X215.653 Y167.566 E.05632
G1 X208.989 Y167.566 E.18057
G1 X205.364 Y165.488 E.11323
G1 X215.653 Y165.488 E.2788
G1 X215.653 Y163.41 E.05632
G1 X201.739 Y163.41 E.37704
G1 X198.113 Y161.331 E.11323
G1 X215.653 Y161.331 E.47527
G1 X215.653 Y159.253 E.05632
G1 X194.488 Y159.253 E.57351
G1 X190.863 Y157.175 E.11323
G1 X215.653 Y157.175 E.67174
G1 X215.653 Y155.096 E.05632
G1 X187.238 Y155.096 E.76997
G1 X183.612 Y153.018 E.11323
G1 X215.653 Y153.018 E.86821
G1 X215.653 Y150.94 E.05632
G1 X179.987 Y150.94 E.96644
G1 X176.362 Y148.861 E.11323
G1 X215.653 Y148.861 E1.06468
G1 X215.653 Y146.783 E.05632
G1 X172.737 Y146.783 E1.16291
G1 X169.111 Y144.705 E.11323
G1 X215.653 Y144.705 E1.26114
G1 X215.653 Y142.626 E.05632
G1 X165.486 Y142.626 E1.35938
G1 X161.861 Y140.548 E.11323
G1 X215.653 Y140.548 E1.45761
G1 X215.653 Y138.47 E.05632
G1 X158.235 Y138.47 E1.55585
G1 X154.61 Y136.392 E.11323
G1 X215.653 Y136.392 E1.65408
G1 X215.653 Y134.313 E.05632
G1 X150.985 Y134.313 E1.75231
G1 X149.8 Y133.634 E.03702
G1 X149.8 Y132.235 E.0379
G1 X215.653 Y132.235 E1.78443
G1 X215.653 Y130.157 E.05632
G1 X149.8 Y130.157 E1.78443
G1 X149.8 Y128.078 E.05632
G1 X215.653 Y128.078 E1.78443
G1 X215.653 Y126 E.05632
G1 X149.8 Y126 E1.78443
G1 X149.8 Y123.922 E.05632
G1 X215.653 Y123.922 E1.78443
G1 X215.653 Y121.843 E.05632
G1 X149.8 Y121.843 E1.78443
G1 X149.8 Y119.765 E.05632
G1 X215.653 Y119.765 E1.78443
G1 X215.653 Y117.687 E.05632
G1 X150.985 Y117.687 E1.75231
G1 X154.61 Y115.608 E.11323
G1 X215.653 Y115.608 E1.65408
G1 X215.653 Y113.53 E.05632
G1 X158.235 Y113.53 E1.55585
G1 X161.861 Y111.452 E.11323
G1 X215.653 Y111.452 E1.45761
G1 X215.653 Y109.374 E.05632
G1 X165.486 Y109.374 E1.35938
G1 X169.111 Y107.295 E.11323
G1 X215.653 Y107.295 E1.26114
G1 X215.653 Y105.217 E.05632
G1 X172.737 Y105.217 E1.16291
G1 X176.362 Y103.139 E.11323
G1 X215.653 Y103.139 E1.06468
G1 X215.653 Y101.06 E.05632
G1 X179.987 Y101.06 E.96644
G1 X183.612 Y98.982 E.11323
G1 X215.653 Y98.982 E.86821
G1 X215.653 Y96.904 E.05632
M73 P98 R1
G1 X187.238 Y96.904 E.76997
G1 X190.863 Y94.825 E.11323
G1 X215.653 Y94.825 E.67174
G1 X215.653 Y92.747 E.05632
G1 X194.488 Y92.747 E.57351
G1 X198.113 Y90.669 E.11323
G1 X215.653 Y90.669 E.47527
G1 X215.653 Y88.59 E.05632
G1 X201.739 Y88.59 E.37704
G1 X205.364 Y86.512 E.11323
G1 X215.653 Y86.512 E.2788
G1 X215.653 Y84.434 E.05632
G1 X208.989 Y84.434 E.18057
G1 X212.614 Y82.355 E.11323
G1 X215.84 Y82.355 E.08741
; OBJECT_ID: 381
; WIPE_START
G1 X213.84 Y82.355 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 353
M625
; start printing object, unique label id: 381
M624 BAAAAAAAAAA=
M204 S10000
G1 X213.473 Y89.979 Z2.68 F30000
G1 X209.286 Y177.068 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X131.976 Y195.855 E2.00024
G1 X132.935 Y147.927 E1.2052
G1 X145.649 Y140.587 E.36911
G1 X209.233 Y177.039 E1.84266
; WIPE_START
M204 S4000
G1 X207.29 Y177.512 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X206.611 Y177.558 Z2.68 F30000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X202.796 Y173.743 E.14618
G1 X195.908 Y169.795 E.21514
G1 X204.092 Y177.978 E.31359
G1 X201.727 Y178.552 E.06594
G1 X189.02 Y165.846 E.48692
G1 X182.133 Y161.897 E.21514
G1 X199.362 Y179.127 E.66026
G1 X196.998 Y179.702 E.06594
G1 X175.245 Y157.948 E.8336
G1 X168.357 Y154 E.21514
G1 X194.633 Y180.276 E1.00694
G1 X192.269 Y180.851 E.06594
G1 X161.469 Y150.051 E1.18028
G1 X154.581 Y146.102 E.21514
G1 X189.904 Y181.425 E1.35362
G1 X187.539 Y182 E.06594
G1 X147.693 Y142.153 E1.52696
G1 X145.65 Y140.982 E.06382
G1 X144.339 Y141.739 E.04101
G1 X185.175 Y182.574 E1.56487
G1 X182.81 Y183.149 E.06594
G1 X142.476 Y142.815 E1.54566
G1 X140.612 Y143.89 E.0583
G1 X180.446 Y183.724 E1.52645
G1 X178.081 Y184.298 E.06594
G1 X138.749 Y144.966 E1.50725
G1 X136.886 Y146.042 E.0583
G1 X175.717 Y184.873 E1.48804
G1 X173.352 Y185.447 E.06594
G1 X135.022 Y147.118 E1.46883
G1 X133.273 Y148.128 E.05472
G1 X133.27 Y148.305 E.0048
G1 X170.987 Y186.022 E1.44537
G1 X168.623 Y186.597 E.06594
G1 X133.212 Y151.186 E1.35697
G1 X133.155 Y154.068 E.0781
G1 X166.258 Y187.171 E1.26856
G1 X163.894 Y187.746 E.06594
G1 X133.097 Y156.949 E1.18016
G1 X133.039 Y159.831 E.0781
G1 X161.529 Y188.32 E1.09176
G1 X159.164 Y188.895 E.06594
G1 X132.982 Y162.712 E1.00335
G1 X132.924 Y165.594 E.0781
G1 X156.8 Y189.47 E.91495
G1 X154.435 Y190.044 E.06594
G1 X132.866 Y168.475 E.82654
G1 X132.809 Y171.357 E.0781
G1 X152.071 Y190.619 E.73814
G1 X149.706 Y191.193 E.06594
G1 X132.751 Y174.238 E.64974
G1 X132.693 Y177.12 E.0781
G1 X147.342 Y191.768 E.56133
G1 X144.977 Y192.343 E.06594
G1 X132.636 Y180.001 E.47293
G1 X132.578 Y182.883 E.0781
G1 X142.612 Y192.917 E.38453
G1 X140.248 Y193.492 E.06594
G1 X132.52 Y185.764 E.29612
G1 X132.463 Y188.646 E.0781
G1 X137.883 Y194.066 E.20772
G1 X135.519 Y194.641 E.06594
G1 X132.405 Y191.527 E.11931
G1 X132.347 Y194.409 E.0781
G1 X133.309 Y195.37 E.03685
; OBJECT_ID: 409
; WIPE_START
G1 X132.347 Y194.409 E-.51671
G1 X132.36 Y193.769 E-.24329
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 381
M625
; start printing object, unique label id: 409
M624 CAAAAAAAAAA=
M204 S10000
G1 X124.869 Y192.308 Z2.68 F30000
G1 X46.714 Y177.068 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X110.351 Y140.587 E1.84417
G1 X123.065 Y147.927 E.36911
G1 X124.024 Y195.855 E1.2052
G1 X46.773 Y177.083 E1.99873
; WIPE_START
M204 S4000
G1 X48.507 Y176.087 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X49.389 Y177.558 Z2.68 F30000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X53.204 Y173.743 E.14618
G1 X60.092 Y169.795 E.21514
G1 X51.908 Y177.978 E.31359
G1 X54.273 Y178.552 E.06594
G1 X66.98 Y165.846 E.48693
G1 X73.867 Y161.897 E.21514
G1 X56.638 Y179.127 E.66026
G1 X59.002 Y179.702 E.06594
G1 X80.755 Y157.948 E.8336
G1 X87.643 Y154 E.21514
G1 X61.367 Y180.276 E1.00694
G1 X63.731 Y180.851 E.06594
G1 X94.531 Y150.051 E1.18028
G1 X101.419 Y146.102 E.21514
G1 X66.096 Y181.425 E1.35362
G1 X68.461 Y182 E.06594
G1 X108.307 Y142.153 E1.52696
G1 X110.35 Y140.982 E.06382
G1 X111.661 Y141.739 E.04101
G1 X70.825 Y182.574 E1.56487
G1 X73.19 Y183.149 E.06594
G1 X113.524 Y142.815 E1.54566
G1 X115.388 Y143.89 E.0583
G1 X75.554 Y183.724 E1.52645
G1 X77.919 Y184.298 E.06594
G1 X117.251 Y144.966 E1.50725
G1 X119.114 Y146.042 E.0583
G1 X80.283 Y184.873 E1.48804
G1 X82.648 Y185.447 E.06594
G1 X120.978 Y147.118 E1.46883
G1 X122.727 Y148.128 E.05472
G1 X122.73 Y148.305 E.0048
G1 X85.013 Y186.022 E1.44537
G1 X87.377 Y186.597 E.06594
G1 X122.788 Y151.186 E1.35697
G1 X122.845 Y154.068 E.0781
G1 X89.742 Y187.171 E1.26856
G1 X92.106 Y187.746 E.06594
G1 X122.903 Y156.949 E1.18016
G1 X122.961 Y159.831 E.0781
G1 X94.471 Y188.32 E1.09176
G1 X96.836 Y188.895 E.06594
G1 X123.018 Y162.712 E1.00335
M73 P98 R0
G1 X123.076 Y165.594 E.0781
G1 X99.2 Y189.47 E.91495
G1 X101.565 Y190.044 E.06594
G1 X123.134 Y168.475 E.82654
G1 X123.191 Y171.357 E.0781
G1 X103.929 Y190.619 E.73814
G1 X106.294 Y191.193 E.06594
G1 X123.249 Y174.238 E.64974
G1 X123.307 Y177.12 E.0781
G1 X108.658 Y191.768 E.56133
G1 X111.023 Y192.343 E.06594
G1 X123.364 Y180.001 E.47293
G1 X123.422 Y182.883 E.0781
G1 X113.388 Y192.917 E.38453
G1 X115.752 Y193.492 E.06594
G1 X123.48 Y185.764 E.29612
G1 X123.537 Y188.646 E.0781
G1 X118.117 Y194.066 E.20772
G1 X120.481 Y194.641 E.06594
G1 X123.595 Y191.527 E.11931
G1 X123.653 Y194.409 E.0781
G1 X122.691 Y195.37 E.03685
; OBJECT_ID: 437
; WIPE_START
G1 X123.653 Y194.409 E-.51671
G1 X123.64 Y193.769 E-.24329
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 409
M625
; start printing object, unique label id: 437
M624 EAAAAAAAAAA=
M204 S10000
G1 X119.492 Y187.362 Z2.68 F30000
G1 X46.714 Y74.932 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X124.024 Y56.145 E2.00024
G1 X123.065 Y104.073 E1.2052
G1 X110.351 Y111.413 E.36911
G1 X46.767 Y74.961 E1.84266
; WIPE_START
M204 S4000
G1 X48.71 Y74.488 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X53.709 Y78.762 Z2.68 F30000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X49.544 Y74.597 E.15961
G1 X51.908 Y74.022 E.06594
G1 X60.092 Y82.205 E.31359
G1 X66.98 Y86.154 E.21514
G1 X54.273 Y73.448 E.48692
G1 X56.638 Y72.873 E.06594
G1 X73.867 Y90.103 E.66026
G1 X80.755 Y94.052 E.21514
G1 X59.002 Y72.298 E.8336
G1 X61.367 Y71.724 E.06594
G1 X87.643 Y98 E1.00694
G1 X94.531 Y101.949 E.21514
G1 X63.731 Y71.149 E1.18028
G1 X66.096 Y70.575 E.06594
G1 X101.419 Y105.898 E1.35362
G1 X108.307 Y109.847 E.21514
G1 X68.461 Y70 E1.52696
G1 X70.825 Y69.426 E.06594
G1 X111.661 Y110.261 E1.56487
G1 X113.524 Y109.185 E.0583
G1 X73.19 Y68.851 E1.54566
G1 X75.554 Y68.276 E.06594
G1 X115.388 Y108.11 E1.52645
G1 X117.251 Y107.034 E.0583
G1 X77.919 Y67.702 E1.50725
G1 X80.283 Y67.127 E.06594
G1 X119.114 Y105.958 E1.48804
G1 X120.978 Y104.882 E.0583
G1 X82.648 Y66.553 E1.46883
G1 X85.013 Y65.978 E.06594
G1 X122.73 Y103.695 E1.44537
G1 X122.788 Y100.814 E.0781
G1 X87.377 Y65.403 E1.35697
G1 X89.742 Y64.829 E.06594
G1 X122.845 Y97.932 E1.26856
G1 X122.903 Y95.051 E.0781
G1 X92.106 Y64.254 E1.18016
G1 X94.471 Y63.68 E.06594
G1 X122.961 Y92.169 E1.09176
G1 X123.018 Y89.288 E.0781
G1 X96.836 Y63.105 E1.00335
G1 X99.2 Y62.53 E.06594
G1 X123.076 Y86.406 E.91495
G1 X123.134 Y83.525 E.0781
G1 X101.565 Y61.956 E.82654
G1 X103.929 Y61.381 E.06594
M73 P99 R0
G1 X123.191 Y80.643 E.73814
G1 X123.249 Y77.762 E.0781
G1 X106.294 Y60.807 E.64974
G1 X108.658 Y60.232 E.06594
G1 X123.307 Y74.88 E.56133
G1 X123.364 Y71.999 E.0781
G1 X111.023 Y59.657 E.47293
G1 X113.388 Y59.083 E.06594
G1 X123.422 Y69.117 E.38453
G1 X123.48 Y66.236 E.0781
G1 X115.752 Y58.508 E.29612
G1 X118.117 Y57.934 E.06594
G1 X123.537 Y63.354 E.20772
G1 X123.595 Y60.473 E.0781
G1 X120.481 Y57.359 E.11931
G1 X122.846 Y56.784 E.06594
G1 X123.836 Y57.774 E.03794
; OBJECT_ID: 465
; WIPE_START
G1 X122.846 Y56.784 E-.53204
G1 X122.263 Y56.926 E-.22796
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 437
M625
; start printing object, unique label id: 465
M624 IAAAAAAAAAA=
M204 S10000
G1 X117.824 Y63.135 Z2.68 F30000
G1 X40.004 Y171.978 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X40.004 Y80.022 E2.31191
G1 X106.543 Y118.168 E1.92828
G1 X106.543 Y133.832 E.39383
G1 X40.056 Y171.948 E1.92677
; WIPE_START
M204 S4000
G1 X40.055 Y169.948 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X40.16 Y169.645 Z2.68 F30000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X43.386 Y169.645 E.08741
G1 X47.011 Y167.566 E.11323
G1 X40.347 Y167.566 E.18057
G1 X40.347 Y165.488 E.05632
G1 X50.636 Y165.488 E.2788
G1 X54.261 Y163.41 E.11323
G1 X40.347 Y163.41 E.37704
G1 X40.347 Y161.331 E.05632
G1 X57.887 Y161.331 E.47527
G1 X61.512 Y159.253 E.11323
G1 X40.347 Y159.253 E.57351
G1 X40.347 Y157.175 E.05632
G1 X65.137 Y157.175 E.67174
G1 X68.762 Y155.096 E.11323
G1 X40.347 Y155.096 E.76997
G1 X40.347 Y153.018 E.05632
G1 X72.388 Y153.018 E.86821
G1 X76.013 Y150.94 E.11323
G1 X40.347 Y150.94 E.96644
G1 X40.347 Y148.861 E.05632
G1 X79.638 Y148.861 E1.06468
G1 X83.263 Y146.783 E.11323
G1 X40.347 Y146.783 E1.16291
G1 X40.347 Y144.705 E.05632
G1 X86.889 Y144.705 E1.26114
G1 X90.514 Y142.626 E.11323
G1 X40.347 Y142.626 E1.35938
G1 X40.347 Y140.548 E.05632
G1 X94.139 Y140.548 E1.45761
G1 X97.765 Y138.47 E.11323
G1 X40.347 Y138.47 E1.55585
G1 X40.347 Y136.392 E.05632
G1 X101.39 Y136.392 E1.65408
G1 X105.015 Y134.313 E.11323
G1 X40.347 Y134.313 E1.75231
G1 X40.347 Y132.235 E.05632
G1 X106.2 Y132.235 E1.78443
G1 X106.2 Y130.157 E.05632
G1 X40.347 Y130.157 E1.78443
G1 X40.347 Y128.078 E.05632
G1 X106.2 Y128.078 E1.78443
G1 X106.2 Y126 E.05632
G1 X40.347 Y126 E1.78443
G1 X40.347 Y123.922 E.05632
G1 X106.2 Y123.922 E1.78443
G1 X106.2 Y121.843 E.05632
G1 X40.347 Y121.843 E1.78443
G1 X40.347 Y119.765 E.05632
G1 X106.2 Y119.765 E1.78443
G1 X106.2 Y118.366 E.0379
G1 X105.015 Y117.687 E.03702
G1 X40.347 Y117.687 E1.75231
G1 X40.347 Y115.608 E.05632
G1 X101.39 Y115.608 E1.65408
G1 X97.765 Y113.53 E.11323
G1 X40.347 Y113.53 E1.55585
G1 X40.347 Y111.452 E.05632
G1 X94.139 Y111.452 E1.45761
G1 X90.514 Y109.374 E.11323
G1 X40.347 Y109.374 E1.35938
G1 X40.347 Y107.295 E.05632
G1 X86.889 Y107.295 E1.26114
G1 X83.263 Y105.217 E.11323
G1 X40.347 Y105.217 E1.16291
G1 X40.347 Y103.139 E.05632
G1 X79.638 Y103.139 E1.06468
G1 X76.013 Y101.06 E.11323
G1 X40.347 Y101.06 E.96644
G1 X40.347 Y98.982 E.05632
G1 X72.388 Y98.982 E.86821
G1 X68.762 Y96.904 E.11323
G1 X40.347 Y96.904 E.76997
G1 X40.347 Y94.825 E.05632
G1 X65.137 Y94.825 E.67174
G1 X61.512 Y92.747 E.11323
G1 X40.347 Y92.747 E.57351
G1 X40.347 Y90.669 E.05632
G1 X57.887 Y90.669 E.47527
G1 X54.261 Y88.59 E.11323
G1 X40.347 Y88.59 E.37704
G1 X40.347 Y86.512 E.05632
G1 X50.636 Y86.512 E.27881
G1 X47.011 Y84.434 E.11323
G1 X40.347 Y84.434 E.18057
G1 X40.347 Y82.355 E.05632
G1 X43.762 Y82.355 E.09253
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F12000
G1 X41.762 Y82.355 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 465
M625
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z2.78 F900 ; lower z a little
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

    G1 Z102.28 F600
    G1 Z100.28

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END


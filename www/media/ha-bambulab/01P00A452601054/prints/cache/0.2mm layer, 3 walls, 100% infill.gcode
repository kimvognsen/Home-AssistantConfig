; HEADER_BLOCK_START
; BambuStudio 02.03.00.70
; model printing time: 3m 31s; total estimated time: 9m 46s
; total layer number: 10
; total filament length [mm] : 673.78
; total filament volume [cm^3] : 1620.62
; total filament weight [g] : 2.04
; filament_density: 1.26
; filament_diameter: 1.75
; max_z_height: 2.00
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 0
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
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = concentric
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0
; change_filament_gcode = ;=P1S 20250822=\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if nozzle_temperature[previous_extruder] > 142 && next_extruder < 255}\nM104 S{nozzle_temperature[previous_extruder]}\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == "PETG"}\nM109 S260\n{elsif filament_type[next_extruder] == "PVA"}\nM109 S210\n{else}\nM109 S{flush_temperatures[next_extruder]}\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S{nozzle_temperature[next_extruder]}\nG1 E2 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_fan_the_first_x_layers = 1
; compatible_printers_condition = 
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL X1C"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; different_settings_to_system = bottom_surface_pattern;sparse_infill_density;sparse_infill_pattern;top_surface_pattern;wall_loops;enable_prime_tower;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 0
; enable_support = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 
; extruder_clearance_dist_to_rod = 33
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 34
; extruder_clearance_max_radius = 68
; extruder_colour = #018001
; extruder_offset = 0x2
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard,Direct Drive High Flow"
; fan_cooling_layer_time = 100
; fan_direction = left
; fan_max_speed = 100
; fan_min_speed = 100
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 100
; filament_change_length = 5
; filament_colour = #FF0000FF
; filament_cost = 24.99
; filament_density = 1.26
; filament_diameter = 1.75
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.98
; filament_flush_temp = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFA00
; filament_is_support = 0
; filament_long_retractions_when_cut = 1
; filament_map = 1
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 21
; filament_minimal_purge_on_wipe_tower = 15
; filament_notes = 
; filament_pre_cooling_temperature = 0
; filament_prime_volume = 45
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_volumetric_speed = -1
; filament_retraction_distances_when_cut = 18
; filament_scarf_gap = 0%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1,1
; filament_settings_id = "Bambu PLA Basic @BBL X1C - Copy"
; filament_shrink = 97%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA
; filament_velocity_adaptation_factor = 1
; filament_vendor = "Bambu Lab"
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; host_type = octoprint
; hot_plate_temp = 60
; hot_plate_temp_initial_layer = 63
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 13.8
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = ;"Bambu PLA Basic @BBL X1C";
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 500
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
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
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
; no_slow_down_for_cooling_on_outwalls = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.2
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = stainless_steel
; nozzle_volume = 107
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
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
; prime_tower_infill_gap = 100%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 0
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; print_compatible_printers = "Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL X1C
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
; raft_first_layer_expansion = 2
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
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
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 4
; slow_down_min_speed = 20
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
; sparse_infill_density = 100%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = zig-zag
; sparse_infill_speed = 270
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
; support_bottom_z_distance = 0.2
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
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = normal(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45
; template_custom_gcode = 
; textured_plate_temp = 60
; textured_plate_temp_initial_layer = 63
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;========Date 20250206========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\nM1004 S5 P1  ; external shutter\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; SKIPPABLE_END
; timelapse_type = 0
; top_area_threshold = 100%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = zig-zag
; top_surface_speed = 200
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
; volumetric_speed_coefficients = "0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_loops = 3
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 165
; wipe_tower_y = 241
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
M73 P0 R9
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
M140 S63 ;set bed temp
M190 S63 ;wait for bed temp



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
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F523.843 T240


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P5 R9
G1 E50 F200
M400
M104 S220
G92 E0
M73 P50 R4
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P52 R4
G1 E-0.5 F300

M73 P55 R4
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
M73 P56 R4
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
M73 P57 R4
G1 Z10
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
    G29 A X112.002 Y112.11 I31.9965 J31.7798
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
M73 P58 R4
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
G0 X240 E15 F6033.27
G0 Y11 E0.700 F1508.32
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F6033.27
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S200

M142 P1 R35 S40
;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/10
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S500
G1 Z.4 F30000
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
; OBJECT_ID: 1729
G1 X114.694 Y112.241
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M73 P59 R4
G3 X117.017 Y111.424 I2.316 J2.876 E.09351
M73 P59 R3
G1 X139.166 Y111.429 E.82496
G3 X142.558 Y116.071 I-.169 J3.684 E.24554
G1 X138.119 Y132.787 E.64419
G3 X117.881 Y132.786 I-10.119 J-2.679 E1.02309
G1 X113.442 Y116.071 E.64416
M73 P60 R3
G3 X114.648 Y112.279 I3.568 J-.953 E.1565
G1 X114.408 Y111.884 F30000
G1 F3000
G3 X117.012 Y110.967 I2.602 J3.233 E.1048
G1 X139.188 Y110.972 E.82597
G3 X143.001 Y116.183 I-.191 J4.14 E.2757
G1 X138.56 Y132.908 E.64453
G3 X117.44 Y132.907 I-10.56 J-2.8 E1.06745
G1 X112.999 Y116.183 E.6445
M73 P61 R3
G3 X114.362 Y111.922 I4.012 J-1.065 E.17594
G1 X114.122 Y111.523 F30000
; FEATURE: Outer wall
G1 F3000
G1 X114.49 Y111.261 E.01684
G3 X117.006 Y110.51 I2.522 J3.857 E.09917
G1 X139.209 Y110.515 E.82698
M73 P62 R3
G3 X143.444 Y116.295 I-.213 J4.597 E.30586
G1 X139.001 Y133.028 E.64486
G3 X116.999 Y133.028 I-11.001 J-2.92 E1.11184
G1 X112.556 Y116.295 E.64484
G3 X114.08 Y111.563 I4.456 J-1.176 E.19558
; WIPE_START
G1 X114.49 Y111.261 E-.19338
G1 X115.069 Y110.935 E-.25253
G1 X115.69 Y110.701 E-.2521
G1 X115.848 Y110.662 E-.062
; WIPE_END
G1 E-.04 F1800
G1 X120.853 Y116.425 Z.6 F30000
G1 X127.999 Y124.654 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.59881
G1 F6300
G1 X128.361 Y123.293 E.06379
G1 X127.638 Y123.293 E.03274
G1 X127.983 Y124.596 E.06106
; WIPE_START
M73 P63 R3
G1 X127.638 Y123.293 E-.51224
G1 X128.29 Y123.293 E-.24776
; WIPE_END
G1 E-.04 F1800
G1 X127.998 Y126.628 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.49999
G1 F6300
G1 X129.019 Y122.787 E.14802
G1 X126.98 Y122.787 E.07597
G1 X127.983 Y126.57 E.14576
; WIPE_START
G1 X127.47 Y124.637 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.998 Y128.409 Z.6 F30000
M73 P64 R3
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X129.614 Y122.33 E.23427
G1 X126.385 Y122.33 E.12024
G1 X127.982 Y128.351 E.232
; WIPE_START
G1 X127.47 Y126.418 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.934 Y129.95 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X128.01 Y130.115 E.00678
G1 X130.208 Y121.873 E.31773
G1 X125.791 Y121.873 E.16451
G1 X127.918 Y129.892 E.309
G1 X127.494 Y130.073 F30000
G1 F6300
G1 X127.624 Y130.392 E.01282
G1 X127.827 Y130.545 E.00946
G1 X128.072 Y130.573 E.0092
G1 X128.3 Y130.47 E.00933
G1 X128.456 Y130.244 E.01019
M73 P65 R3
G1 X130.803 Y121.416 E.34025
G1 X125.197 Y121.416 E.20878
G1 X127.478 Y130.015 E.33136
G1 X127.054 Y130.197 F30000
G1 F6300
G1 X127.218 Y130.605 E.0164
G1 X127.431 Y130.839 E.01177
G1 X127.698 Y130.986 E.01135
G1 X128.034 Y131.036 E.01264
G1 X128.37 Y130.958 E.01285
G1 X128.657 Y130.761 E.01298
G1 X128.866 Y130.454 E.01383
G1 X131.397 Y120.959 E.36601
G1 X124.603 Y120.959 E.25305
G1 X127.038 Y130.139 E.35375
G1 X126.614 Y130.321 F30000
G1 F6300
G1 X126.794 Y130.789 E.01865
G1 X127.05 Y131.114 E.01541
G1 X127.361 Y131.344 E.01442
G1 X127.804 Y131.48 E.01726
G1 X128.201 Y131.479 E.0148
G1 X128.612 Y131.351 E.01602
G1 X128.982 Y131.083 E.01702
G1 X129.257 Y130.7 E.01756
G1 X129.387 Y130.3 E.01566
G1 X131.992 Y120.502 E.37763
G1 X124.009 Y120.502 E.29732
G1 X126.598 Y130.263 E.37615
G1 X126.174 Y130.446 F30000
G1 F6300
G1 X126.356 Y130.935 E.01945
G1 X126.614 Y131.32 E.01726
G1 X126.989 Y131.655 E.01874
G1 X127.4 Y131.851 E.01695
G1 X127.915 Y131.95 E.01955
G1 X128.464 Y131.894 E.02055
G1 X128.891 Y131.719 E.01716
G1 X129.245 Y131.467 E.01621
G1 X129.57 Y131.071 E.01907
G1 X129.77 Y130.638 E.01775
G1 X132.586 Y120.045 E.40828
G1 X123.415 Y120.045 E.34159
G1 X126.158 Y130.388 E.39855
G1 X125.734 Y130.57 F30000
G1 F6300
G1 X125.899 Y131.043 E.01865
G1 X126.153 Y131.485 E.01901
G1 X126.5 Y131.852 E.01882
G1 X126.926 Y132.149 E.01933
G1 X127.46 Y132.345 E.02119
G1 X127.996 Y132.407 E.02008
G1 X128.551 Y132.343 E.02081
G1 X129.017 Y132.172 E.01849
G1 X129.471 Y131.874 E.02025
G1 X129.846 Y131.481 E.02022
G1 X130.106 Y131.044 E.01893
G1 X130.27 Y130.535 E.01992
G1 X133.181 Y119.587 E.42192
G1 X122.821 Y119.588 E.38586
G1 X125.718 Y130.512 E.42094
G1 X125.294 Y130.694 F30000
G1 F6300
G1 X125.48 Y131.228 E.02108
G1 X125.748 Y131.702 E.02026
G2 X126.505 Y132.43 I2.491 J-1.831 E.03933
G1 X126.98 Y132.668 E.01979
G1 X127.481 Y132.814 E.01941
G1 X127.995 Y132.864 E.01926
G1 X128.523 Y132.814 E.01974
G1 X128.99 Y132.682 E.01805
G1 X129.448 Y132.456 E.01903
G1 X129.864 Y132.141 E.01945
G1 X130.213 Y131.754 E.01943
G1 X130.493 Y131.296 E.01999
G1 X130.667 Y130.821 E.01882
G1 X133.775 Y119.13 E.45056
G1 X122.227 Y119.13 E.43012
G1 X125.278 Y130.636 E.44334
G1 X124.854 Y130.818 F30000
G1 F6300
G1 X125.062 Y131.414 E.0235
M73 P66 R3
G1 X125.361 Y131.944 E.02268
G2 X126.549 Y132.982 I3.004 J-2.243 E.0592
G1 X127.099 Y133.192 E.0219
G1 X127.695 Y133.306 E.02262
G1 X128.285 Y133.308 E.02196
G1 X128.807 Y133.224 E.01969
G1 X129.278 Y133.055 E.01865
G1 X129.813 Y132.76 E.02277
G1 X130.28 Y132.37 E.02265
G1 X130.665 Y131.9 E.02263
G1 X130.942 Y131.415 E.0208
G1 X131.109 Y130.939 E.0188
G1 X134.369 Y118.673 E.4727
G1 X121.633 Y118.673 E.47439
G1 X124.838 Y130.76 E.46573
G1 X124.414 Y130.942 F30000
G1 F6300
G2 X125.094 Y132.359 I4.481 J-1.28 E.05884
G2 X127.48 Y133.745 I2.974 J-2.375 E.10514
G2 X130.838 Y132.434 I.496 J-3.684 E.14018
G1 X131.172 Y131.966 E.02141
G2 X131.572 Y130.974 I-3.239 J-1.885 E.03996
G1 X134.964 Y118.216 E.49169
G1 X121.038 Y118.216 E.51866
G1 X124.398 Y130.884 E.48813
G1 X123.974 Y131.066 F30000
G1 F6300
G2 X125.907 Y133.672 I4.164 J-1.069 E.12391
G1 X126.394 Y133.91 E.02019
G1 X127.03 Y134.124 E.02501
G2 X131.496 Y132.303 I.954 J-4.047 E.19161
G2 X131.96 Y131.295 I-3.2 J-2.084 E.04148
G1 X135.558 Y117.759 E.52166
G1 X120.444 Y117.759 E.56293
G1 X123.959 Y131.008 E.51052
G1 X123.534 Y131.19 F30000
G1 F6300
G2 X125.943 Y134.212 I4.615 J-1.209 E.14819
G1 X126.505 Y134.447 E.0227
G2 X130.029 Y134.224 I1.487 J-4.454 E.1348
G2 X132.479 Y131.122 I-2.147 J-4.214 E.15188
G1 X136.153 Y117.302 E.53262
G1 X119.85 Y117.302 E.6072
G1 X123.519 Y131.132 E.53292
G1 X123.094 Y131.315 F30000
G1 F6300
G2 X125.637 Y134.571 I5.09 J-1.354 E.15814
G2 X128.225 Y135.149 I2.441 J-4.84 E.09979
G2 X129.505 Y134.928 I-.401 J-6.129 E.04845
G2 X131.747 Y133.487 I-1.72 J-5.142 E.10031
G2 X132.734 Y131.862 I-4.318 J-3.734 E.07116
G1 X132.897 Y131.327 E.02084
G1 X136.747 Y116.845 E.55811
G1 X119.256 Y116.845 E.65147
G1 X123.079 Y131.257 E.55532
G1 X122.654 Y131.439 F30000
G1 F6300
G2 X124.851 Y134.625 I5.531 J-1.464 E.14704
G2 X131.104 Y134.645 I3.142 J-4.548 E.24755
G2 X133.274 Y131.689 I-3.252 J-4.661 E.13906
G1 X137.342 Y116.388 E.58969
G1 X118.662 Y116.388 E.69574
G1 X122.639 Y131.381 E.57771
G1 X122.214 Y131.563 F30000
G1 F6300
G2 X124.584 Y134.996 I5.961 J-1.581 E.15849
G2 X133.804 Y131.475 I3.408 J-4.909 E.43251
G1 X137.936 Y115.931 E.59904
G1 X118.068 Y115.931 E.74
G1 X122.199 Y131.505 E.60011
G1 X121.774 Y131.687 F30000
G1 F6300
G2 X124.993 Y135.782 I6.367 J-1.692 E.19944
G2 X130.25 Y136.122 I3.018 J-5.86 E.20187
G2 X134.201 Y131.761 I-2.278 J-6.033 E.22757
G1 X138.531 Y115.474 E.62768
G1 X117.474 Y115.474 E.78427
G1 X121.759 Y131.629 E.6225
G1 X121.334 Y131.811 F30000
G1 F6300
G2 X122.828 Y134.629 I7.122 J-1.972 E.11972
G2 X129.298 Y136.853 I5.176 J-4.531 E.26671
G2 X134.643 Y131.878 I-1.285 J-6.739 E.28677
G1 X139.057 Y115.272 E.63997
G1 X139.071 Y115.079 E.00723
M73 P67 R3
G1 X138.914 Y115.017 E.00629
G1 X117.122 Y115.017 E.81165
G1 X116.926 Y115.078 E.00761
G1 X116.946 Y115.267 E.00708
G1 X121.319 Y131.753 E.63527
G1 X120.894 Y131.935 F30000
G1 F6300
G2 X122.484 Y134.929 I7.581 J-2.107 E.12726
G2 X129.384 Y137.302 I5.52 J-4.831 E.28445
G2 X135.026 Y132.214 I-1.371 J-7.192 E.29749
G1 X139.503 Y115.374 E.64902
G1 X139.527 Y115.043 E.01238
G1 X139.453 Y114.82 E.00875
G1 X139.226 Y114.62 E.01126
G1 X138.853 Y114.56 E.01407
G1 X117.083 Y114.56 E.81084
G1 X116.715 Y114.654 E.01415
G1 X116.559 Y114.791 E.00775
G1 X116.464 Y115.071 E.01099
G1 X116.504 Y115.384 E.01177
G1 X120.879 Y131.877 E.63554
G1 X120.454 Y132.059 F30000
G1 F6300
G2 X135.532 Y132.091 I7.543 J-1.96 E.76312
G1 X139.949 Y115.476 E.64033
G1 X139.985 Y115.04 E.01627
G1 X139.918 Y114.727 E.01192
G1 X139.779 Y114.489 E.01026
G1 X139.419 Y114.203 E.01715
G1 X138.979 Y114.103 E.01681
G1 X117.045 Y114.103 E.81695
G1 X116.584 Y114.201 E.01753
G1 X116.25 Y114.439 E.01528
G1 X116.069 Y114.749 E.01339
G1 X116.001 Y115.127 E.01429
G1 X116.062 Y115.501 E.01412
G1 X120.439 Y132.001 E.6358
G1 X120.014 Y132.183 F30000
G1 F6300
G2 X135.902 Y132.477 I7.985 J-2.088 E.79713
G1 X140.395 Y115.577 E.6513
G2 X140.442 Y115.038 I-2.515 J-.489 E.0202
M73 P68 R3
G1 X140.385 Y114.653 E.01449
G1 X140.203 Y114.298 E.01484
G1 X139.832 Y113.915 E.01988
G1 X139.475 Y113.738 E.01485
G1 X139.012 Y113.645 E.01759
G1 X117.006 Y113.646 E.81961
G1 X116.469 Y113.751 E.02038
G1 X116.042 Y114.01 E.0186
G1 X115.775 Y114.314 E.01507
G1 X115.599 Y114.734 E.01695
G1 X115.542 Y115.136 E.01512
G1 X115.621 Y115.618 E.01821
G1 X119.999 Y132.125 E.63607
G1 X119.574 Y132.308 F30000
G1 F6300
G2 X136.34 Y132.608 I8.425 J-2.213 E.84098
G1 X140.841 Y115.679 E.65244
G1 X140.899 Y115.174 E.01895
G2 X140.473 Y113.886 I-1.981 J-.059 E.05155
G1 X140.106 Y113.546 E.01866
G1 X139.65 Y113.315 E.01902
G2 X138.853 Y113.188 I-.781 J2.34 E.03019
G1 X116.968 Y113.189 E.81514
G1 X116.418 Y113.282 E.02075
G1 X115.862 Y113.564 E.02322
G1 X115.5 Y113.916 E.01884
G1 X115.211 Y114.421 E.02165
G1 X115.097 Y114.966 E.02073
G1 X115.13 Y115.551 E.02185
G1 X119.559 Y132.25 E.64344
G1 X119.134 Y132.432 F30000
G1 F6300
G2 X136.778 Y132.74 I8.865 J-2.337 E.88482
G1 X141.287 Y115.781 E.65359
G2 X141.356 Y115.033 I-1.871 J-.55 E.02813
G1 X141.355 Y114.798 E.00876
G2 X140.82 Y113.584 I-2.604 J.421 E.04992
G1 X140.38 Y113.177 E.02236
G2 X139.567 Y112.802 I-1.367 J1.896 E.03353
G1 X138.901 Y112.731 E.02495
G1 X116.929 Y112.732 E.81837
G1 X116.298 Y112.839 E.02383
G1 X115.792 Y113.076 E.02082
G1 X115.332 Y113.412 E.02122
G1 X114.991 Y113.837 E.02029
G2 X114.624 Y115.154 I2.331 J1.36 E.05146
G1 X114.725 Y115.807 E.02463
G1 X119.119 Y132.374 E.63837
G1 X118.695 Y132.556 F30000
G1 F6300
G2 X137.216 Y132.871 I9.305 J-2.461 E.92867
G1 X141.733 Y115.882 E.65473
G2 X141.813 Y115.031 I-2.131 J-.63 E.03205
G1 X141.811 Y114.746 E.01061
G1 X141.693 Y114.222 E.02002
G1 X141.473 Y113.723 E.02031
G1 X141.167 Y113.283 E.01995
G1 X140.654 Y112.807 E.02607
G1 X140.191 Y112.536 E.02
G1 X139.677 Y112.356 E.02029
G1 X139.11 Y112.274 E.02133
G1 X116.891 Y112.275 E.82756
G1 X116.178 Y112.395 E.02691
G1 X115.661 Y112.623 E.02104
G1 X115.163 Y112.957 E.02233
G1 X114.838 Y113.273 E.01689
M73 P69 R3
G2 X114.353 Y114.093 I3.519 J2.633 E.03554
G1 X114.206 Y114.629 E.02071
G1 X114.165 Y115.162 E.01994
G1 X114.229 Y115.722 E.02098
G1 X118.679 Y132.498 E.64644
G1 X118.255 Y132.68 F30000
G1 F6300
G2 X137.654 Y133.002 I9.745 J-2.586 E.97251
G1 X142.179 Y115.984 E.65587
G1 X142.272 Y115.493 E.0186
G1 X142.268 Y114.694 E.02978
G1 X142.129 Y114.078 E.02352
G1 X141.874 Y113.498 E.02359
G1 X141.514 Y112.981 E.02345
G1 X140.928 Y112.438 E.02978
G1 X140.383 Y112.119 E.0235
G1 X139.786 Y111.91 E.02359
G1 X139.142 Y111.817 E.02421
G1 X116.852 Y111.817 E.83021
G1 X116.058 Y111.952 E.03
G1 X115.619 Y112.118 E.01749
G1 X115.07 Y112.439 E.02368
G1 X114.592 Y112.866 E.02389
G1 X114.208 Y113.36 E.0233
G1 X113.924 Y113.928 E.02365
G1 X113.753 Y114.55 E.02401
G1 X113.706 Y115.171 E.02321
G1 X113.779 Y115.807 E.02384
G1 X118.239 Y132.622 E.64794
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X117.726 Y130.689 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/10
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
; open powerlost recovery
M1003 S1
M140 S60 ; set bed temperature
M204 S10000
G17
M73 P69 R2
G3 Z.6 I1.217 J0 P1  F30000
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
; OBJECT_ID: 1729
G1 X114.512 Y111.996
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X117.013 Y111.119 I2.499 J3.122 E.08962
G1 X139.158 Y111.123 E.73459
G3 X142.853 Y116.146 I-.161 J3.989 E.23736
G1 X138.413 Y132.866 E.57386
G3 X117.587 Y132.868 I-10.413 J-2.758 E.93753
G1 X113.147 Y116.146 E.57392
G3 X114.466 Y112.034 I3.864 J-1.028 E.15131
G1 X114.258 Y111.679 F30000
G1 F15476.087
G3 X117.008 Y110.712 I2.754 J3.44 E.09856
G1 X139.177 Y110.717 E.73536
G3 X143.248 Y116.246 I-.179 J4.396 E.26131
G1 X138.806 Y132.974 E.57413
G3 X117.194 Y132.975 I-10.806 J-2.866 E.97275
G1 X112.752 Y116.246 E.57416
G3 X114.211 Y111.716 I4.259 J-1.128 E.16676
G1 X114.005 Y111.373 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X114.013 Y111.373 E.00025
G3 X117.004 Y110.32 I2.999 J3.746 E.09927
G1 X139.194 Y110.325 E.68185
G3 X143.628 Y116.342 I-.197 J4.787 E.26343
G1 X139.184 Y133.078 E.53206
G3 X116.816 Y133.079 I-11.184 J-2.97 E.93246
G1 X112.372 Y116.342 E.53209
G3 X113.507 Y111.842 I4.64 J-1.223 E.14884
G1 X113.961 Y111.414 E.01918
; WIPE_START
M204 S10000
G1 X114.013 Y111.373 E-.02534
G1 X114.58 Y110.977 E-.26269
G1 X114.99 Y110.763 E-.17554
G1 X115.636 Y110.519 E-.26252
G1 X115.723 Y110.497 E-.03391
; WIPE_END
G1 E-.04 F1800
G1 X115.196 Y111.747 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42044
G1 F15000
G1 X114.329 Y112.614 E.03774
G2 X113.538 Y113.939 I2.645 J2.478 E.04784
G1 X115.827 Y111.65 E.09962
G3 X116.522 Y111.489 I1.014 J2.792 E.022
G1 X113.379 Y114.632 E.13675
G2 X113.346 Y115.199 I4.737 J.561 E.01748
G1 X117.092 Y111.453 E.16299
G1 X117.626 Y111.453 E.01642
G1 X113.394 Y115.685 E.18414
G2 X113.49 Y116.122 I2.314 J-.282 E.0138
G1 X118.16 Y111.453 E.20316
G1 X118.694 Y111.453 E.01642
G1 X113.602 Y116.544 E.22151
G1 X113.714 Y116.966 E.01343
M73 P70 R2
G1 X119.228 Y111.453 E.23987
G1 X119.761 Y111.453 E.01642
G1 X113.826 Y117.388 E.25822
G1 X113.938 Y117.81 E.01343
G1 X120.295 Y111.453 E.27657
G1 X120.829 Y111.453 E.01642
G1 X114.05 Y118.232 E.29493
G1 X114.162 Y118.654 E.01343
G1 X121.363 Y111.453 E.31328
G1 X121.897 Y111.453 E.01642
G1 X114.274 Y119.076 E.33164
G1 X114.386 Y119.498 E.01343
G1 X122.43 Y111.454 E.34999
G1 X122.964 Y111.454 E.01642
G1 X114.498 Y119.92 E.36834
G1 X114.609 Y120.342 E.01343
G1 X123.498 Y111.454 E.3867
G1 X124.032 Y111.454 E.01642
G1 X114.721 Y120.764 E.40505
G1 X114.833 Y121.186 E.01343
G1 X124.566 Y111.454 E.42341
G1 X125.099 Y111.454 E.01642
G1 X114.945 Y121.608 E.44176
G1 X115.057 Y122.03 E.01343
G1 X125.633 Y111.454 E.46011
G1 X126.167 Y111.454 E.01642
G1 X115.169 Y122.452 E.47847
G1 X115.281 Y122.874 E.01343
G1 X126.701 Y111.454 E.49682
G1 X127.235 Y111.454 E.01642
G1 X115.393 Y123.296 E.51517
G1 X115.505 Y123.718 E.01343
G1 X127.768 Y111.455 E.53353
G1 X128.302 Y111.455 E.01642
G1 X115.617 Y124.14 E.55188
G1 X115.729 Y124.562 E.01343
G1 X128.836 Y111.455 E.57024
G1 X129.37 Y111.455 E.01642
G1 X115.841 Y124.984 E.58859
G1 X115.953 Y125.406 E.01343
G1 X129.903 Y111.455 E.60694
G1 X130.437 Y111.455 E.01642
G1 X116.064 Y125.828 E.6253
G1 X116.176 Y126.25 E.01343
G1 X130.971 Y111.455 E.64365
G1 X131.505 Y111.455 E.01642
G1 X116.288 Y126.672 E.66201
G1 X116.4 Y127.094 E.01343
G1 X132.039 Y111.455 E.68036
G1 X132.572 Y111.455 E.01642
G1 X116.512 Y127.516 E.69871
G1 X116.624 Y127.938 E.01343
G1 X133.106 Y111.456 E.71707
G1 X133.64 Y111.456 E.01642
G1 X116.736 Y128.36 E.73542
G1 X116.848 Y128.782 E.01343
G1 X134.174 Y111.456 E.75378
G1 X134.708 Y111.456 E.01642
G1 X116.96 Y129.204 E.77213
G1 X117.072 Y129.626 E.01343
G1 X135.241 Y111.456 E.79048
G1 X135.775 Y111.456 E.01642
G1 X117.184 Y130.048 E.80884
G1 X117.296 Y130.47 E.01343
G1 X136.309 Y111.456 E.82719
G1 X136.843 Y111.456 E.01642
G1 X117.407 Y130.892 E.84555
G1 X117.519 Y131.313 E.01343
G1 X137.377 Y111.456 E.8639
G1 X137.91 Y111.456 E.01642
G1 X117.631 Y131.735 E.88225
G1 X117.743 Y132.157 E.01343
G1 X138.444 Y111.457 E.90061
G1 X138.978 Y111.457 E.01642
G1 X117.855 Y132.579 E.91896
G2 X117.973 Y132.995 I6.63 J-1.653 E.01331
G1 X139.481 Y111.487 E.93573
G3 X139.927 Y111.575 I-.754 J4.998 E.01399
G1 X118.096 Y133.406 E.94977
G2 X118.239 Y133.797 I3.158 J-.939 E.0128
G1 X140.329 Y111.708 E.961
G3 X140.695 Y111.875 I-.683 J1.979 E.01241
G1 X118.393 Y134.177 E.97026
G1 X118.562 Y134.542 E.01237
G1 X141.03 Y112.074 E.97749
G3 X141.336 Y112.302 I-1.026 J1.696 E.01175
G1 X118.731 Y134.907 E.98345
G2 X118.925 Y135.247 I1.886 J-.855 E.01205
G1 X141.614 Y112.558 E.98709
G3 X141.864 Y112.841 I-1.341 J1.437 E.01165
G1 X119.122 Y135.584 E.98942
G2 X119.329 Y135.911 I1.825 J-.927 E.01192
G1 X142.087 Y113.153 E.9901
G3 X142.279 Y113.495 I-8.645 J5.077 E.01206
G1 X119.552 Y136.221 E.98874
G1 X119.775 Y136.532 E.01177
G1 X142.437 Y113.871 E.9859
G3 X142.557 Y114.284 I-2.08 J.831 E.01326
G1 X120.019 Y136.822 E.98054
G1 X120.268 Y137.107 E.01164
G1 X142.634 Y114.741 E.97306
G3 X142.647 Y115.262 I-2.145 J.313 E.01608
G1 X120.521 Y137.388 E.96259
G1 X120.795 Y137.647 E.01162
G1 X142.57 Y115.873 E.94731
G3 X142.392 Y116.585 I-6.801 J-1.323 E.02259
G1 X121.07 Y137.907 E.92763
G2 X121.358 Y138.153 I1.436 J-1.396 E.01167
G1 X142.199 Y117.312 E.90668
G1 X142.006 Y118.039 E.02314
G1 X121.658 Y138.387 E.88525
G1 X121.957 Y138.621 E.0117
G1 X141.813 Y118.766 E.86382
G1 X141.62 Y119.493 E.02314
G1 X122.282 Y138.83 E.84128
G1 X122.608 Y139.038 E.01189
G1 X141.427 Y120.22 E.81872
G1 X141.234 Y120.946 E.02314
G1 X122.945 Y139.235 E.79567
G1 X123.298 Y139.416 E.0122
G1 X141.041 Y121.673 E.77192
G1 X140.848 Y122.4 E.02314
G1 X123.651 Y139.597 E.74817
M73 P71 R2
G2 X124.03 Y139.752 I1.002 J-1.916 E.01262
G1 X140.655 Y123.127 E.72327
G1 X140.462 Y123.854 E.02314
G1 X124.412 Y139.904 E.69827
G2 X124.809 Y140.04 I.915 J-2.023 E.01295
G1 X140.269 Y124.581 E.67257
G1 X140.076 Y125.308 E.02314
G1 X125.222 Y140.161 E.6462
G2 X125.641 Y140.276 I.936 J-2.591 E.01338
G1 X139.883 Y126.035 E.61958
G1 X139.69 Y126.762 E.02314
G1 X126.083 Y140.368 E.59196
G2 X126.543 Y140.442 I.825 J-3.678 E.01435
G1 X139.497 Y127.489 E.56354
G1 X139.304 Y128.216 E.02314
G1 X127.019 Y140.5 E.53446
G2 X127.521 Y140.532 I.561 J-4.853 E.01548
G1 X139.111 Y128.942 E.50423
G1 X138.918 Y129.669 E.02314
G1 X128.046 Y140.54 E.47295
G1 X128.598 Y140.523 E.01697
G1 X138.725 Y130.396 E.44057
G1 X138.532 Y131.123 E.02314
G1 X129.185 Y140.47 E.40664
G1 X129.796 Y140.392 E.01896
G1 X138.339 Y131.85 E.37164
G1 X138.146 Y132.577 E.02314
G1 X130.484 Y140.239 E.33332
G2 X131.234 Y140.023 I-.762 J-4.053 E.02404
G1 X137.927 Y133.329 E.29119
G3 X137.607 Y134.183 I-12.459 J-4.183 E.02806
G1 X132.088 Y139.702 E.2401
G2 X133.144 Y139.18 I-2.219 J-5.816 E.0363
G1 X137.1 Y135.225 E.17209
G3 X135.756 Y137.096 I-9.863 J-5.662 E.07099
G3 X134.045 Y138.814 I-194.055 J-191.675 E.0746
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X135.456 Y137.397 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/10
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.8 I1.217 J0 P1  F30000
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
; OBJECT_ID: 1729
G1 X114.516 Y111.993
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X117.013 Y111.119 I2.495 J3.125 E.08945
G1 X139.136 Y111.123 E.73386
G3 X142.852 Y116.151 I-.138 J3.989 E.23825
G1 X138.413 Y132.867 E.57373
G3 X117.587 Y132.867 I-10.413 J-2.759 E.93753
G1 X113.147 Y116.146 E.5739
G3 X114.469 Y112.031 I3.864 J-1.028 E.15148
G1 X114.26 Y111.677 F30000
G1 F15476.087
G3 X117.008 Y110.712 I2.751 J3.442 E.09845
G1 X139.154 Y110.716 E.7346
G3 X143.247 Y116.249 I-.156 J4.396 E.26217
G1 X138.806 Y132.974 E.57404
G3 X117.194 Y132.975 I-10.806 J-2.866 E.97274
G1 X112.752 Y116.246 E.57417
G3 X114.214 Y111.714 I4.259 J-1.127 E.16686
G1 X114.007 Y111.372 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X114.014 Y111.372 E.00023
G3 X117.004 Y110.32 I2.998 J3.747 E.09923
G1 X139.171 Y110.324 E.68113
G3 X143.628 Y116.343 I-.173 J4.788 E.26417
G1 X139.184 Y133.078 E.53204
G3 X116.816 Y133.078 I-11.184 J-2.97 E.93246
G1 X112.372 Y116.342 E.53209
G3 X113.668 Y111.677 I4.64 J-1.223 E.15592
G1 X113.962 Y111.412 E.01218
; WIPE_START
M204 S10000
G1 X114.014 Y111.372 E-.02499
G1 X114.58 Y110.977 E-.26208
G1 X114.989 Y110.763 E-.17543
G1 X115.636 Y110.519 E-.26278
G1 X115.725 Y110.497 E-.03473
; WIPE_END
G1 E-.04 F1800
G1 X116.782 Y118.056 Z1 F30000
G1 X119.318 Y136.187 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42053
G1 F15000
G1 X120.485 Y137.354 E.05079
G2 X122.799 Y139.16 I8.289 J-8.23 E.09055
G1 X122.855 Y139.189 E.00194
G1 X118.943 Y135.278 E.1702
G1 X118.745 Y134.937 E.01213
G1 X118.407 Y134.207 E.02474
G1 X123.9 Y139.7 E.23903
G1 X124.6 Y139.979 E.02318
G1 X124.76 Y140.026 E.00512
M73 P72 R2
G1 X118.077 Y133.343 E.29079
G3 X117.858 Y132.59 I11.783 J-3.836 E.02414
G1 X125.514 Y140.246 E.33317
G1 X126.179 Y140.378 E.02086
G1 X117.665 Y131.863 E.3705
G1 X117.472 Y131.137 E.02314
G1 X126.806 Y140.47 E.40616
G1 X127.396 Y140.526 E.01824
G1 X117.28 Y130.41 E.44023
G1 X117.087 Y129.683 E.02314
G1 X127.941 Y140.537 E.47231
G1 X128.475 Y140.537 E.01643
G1 X116.894 Y128.956 E.50393
G1 X116.701 Y128.23 E.02314
G1 X128.964 Y140.492 E.53362
G1 X129.452 Y140.446 E.01507
G1 X116.509 Y127.503 E.56322
G1 X116.316 Y126.776 E.02314
G1 X129.908 Y140.368 E.59147
G2 X130.35 Y140.276 I-.508 J-3.539 E.0139
G1 X116.123 Y126.049 E.61909
G1 X115.93 Y125.322 E.02314
G1 X130.779 Y140.171 E.64615
G1 X131.182 Y140.04 E.01303
G1 X115.738 Y124.596 E.67206
G1 X115.545 Y123.869 E.02314
G1 X131.584 Y139.908 E.69796
G2 X131.966 Y139.756 I-.609 J-2.078 E.01266
G1 X115.352 Y123.142 E.72295
G1 X115.159 Y122.415 E.02314
G1 X132.338 Y139.594 E.74753
G2 X132.703 Y139.424 I-.707 J-2.005 E.01239
G1 X114.967 Y121.689 E.7718
G1 X114.774 Y120.962 E.02314
G1 X133.046 Y139.234 E.79514
G1 X133.39 Y139.044 E.01209
G1 X114.581 Y120.235 E.81849
G1 X114.388 Y119.508 E.02314
G1 X133.714 Y138.834 E.84099
G1 X134.031 Y138.617 E.01182
G1 X114.196 Y118.781 E.86317
G1 X114.003 Y118.055 E.02314
G1 X134.344 Y138.396 E.88517
G1 X134.635 Y138.153 E.01167
G1 X113.81 Y117.328 E.90623
G1 X113.617 Y116.601 E.02314
G1 X134.927 Y137.91 E.92729
G2 X135.204 Y137.654 I-1.211 J-1.586 E.01165
G1 X113.425 Y115.875 E.94773
G3 X113.35 Y115.266 I3.108 J-.689 E.01889
G1 X135.47 Y137.385 E.96253
G1 X135.735 Y137.117 E.01162
G1 X113.365 Y114.746 E.97348
G3 X113.439 Y114.286 I4.264 J.45 E.01434
G1 X135.982 Y136.829 E.98098
G2 X136.224 Y136.537 I-2.593 J-2.393 E.01168
G1 X113.562 Y113.876 E.98613
G3 X113.722 Y113.501 I2.015 J.636 E.01255
G1 X136.453 Y136.232 E.98916
G1 X136.671 Y135.916 E.01181
G1 X113.917 Y113.162 E.99016
G3 X114.133 Y112.844 I1.42 J.733 E.01186
G1 X136.879 Y135.59 E.98981
G1 X137.08 Y135.258 E.01197
G1 X114.385 Y112.562 E.9876
G1 X114.662 Y112.306 E.01163
G1 X137.265 Y134.908 E.98356
G2 X137.443 Y134.553 I-2.721 J-1.588 E.01225
G1 X114.965 Y112.075 E.97815
G3 X115.305 Y111.881 I.975 J1.313 E.01207
G1 X137.607 Y134.183 E.9705
G2 X137.759 Y133.801 I-2.944 J-1.392 E.01266
G1 X115.668 Y111.709 E.96133
G3 X116.075 Y111.583 I.727 J1.622 E.01316
G1 X137.903 Y133.41 E.94986
G1 X138.026 Y132.999 E.0132
G1 X116.516 Y111.489 E.93602
G3 X117.013 Y111.453 I.437 J2.534 E.01537
G1 X138.144 Y132.583 E.91951
G1 X138.256 Y132.161 E.01343
G1 X117.547 Y111.453 E.90116
G1 X118.081 Y111.453 E.01643
G1 X138.368 Y131.739 E.8828
G1 X138.48 Y131.317 E.01343
G1 X118.615 Y111.453 E.86443
G1 X119.149 Y111.453 E.01643
G1 X138.592 Y130.895 E.84606
G1 X138.704 Y130.473 E.01343
G1 X119.684 Y111.453 E.8277
G1 X120.218 Y111.453 E.01643
G1 X138.816 Y130.051 E.80933
G1 X138.928 Y129.629 E.01343
G1 X120.752 Y111.453 E.79096
G1 X121.286 Y111.453 E.01643
G1 X139.04 Y129.208 E.7726
G1 X139.152 Y128.786 E.01343
G1 X121.82 Y111.453 E.75423
G1 X122.354 Y111.453 E.01643
G1 X139.264 Y128.364 E.73586
G1 X139.376 Y127.942 E.01343
G1 X122.888 Y111.453 E.7175
G1 X123.422 Y111.454 E.01643
G1 X139.488 Y127.52 E.69913
G1 X139.6 Y127.098 E.01343
G1 X123.956 Y111.454 E.68076
G1 X124.491 Y111.454 E.01643
G1 X139.713 Y126.676 E.6624
G1 X139.825 Y126.254 E.01343
G1 X125.025 Y111.454 E.64403
G1 X125.559 Y111.454 E.01643
G1 X139.937 Y125.832 E.62566
M73 P73 R2
G1 X140.049 Y125.41 E.01343
G1 X126.093 Y111.454 E.6073
G1 X126.627 Y111.454 E.01643
G1 X140.161 Y124.988 E.58893
G1 X140.273 Y124.566 E.01343
G1 X127.161 Y111.454 E.57057
G1 X127.695 Y111.454 E.01643
G1 X140.385 Y124.144 E.5522
G1 X140.497 Y123.722 E.01343
G1 X128.229 Y111.454 E.53383
G1 X128.763 Y111.454 E.01643
G1 X140.609 Y123.3 E.51547
G1 X140.721 Y122.878 E.01343
G1 X129.298 Y111.454 E.4971
G1 X129.832 Y111.455 E.01643
G1 X140.833 Y122.456 E.47873
G1 X140.945 Y122.034 E.01343
G1 X130.366 Y111.455 E.46037
G1 X130.9 Y111.455 E.01643
G1 X141.057 Y121.612 E.442
G1 X141.169 Y121.19 E.01343
G1 X131.434 Y111.455 E.42363
G1 X131.968 Y111.455 E.01643
G1 X141.281 Y120.768 E.40527
G1 X141.393 Y120.346 E.01343
G1 X132.502 Y111.455 E.3869
G1 X133.036 Y111.455 E.01643
G1 X141.505 Y119.924 E.36853
G1 X141.617 Y119.502 E.01343
G1 X133.57 Y111.455 E.35017
G1 X134.105 Y111.455 E.01643
G1 X141.729 Y119.08 E.3318
G1 X141.841 Y118.658 E.01343
G1 X134.639 Y111.455 E.31344
G1 X135.173 Y111.455 E.01643
G1 X141.953 Y118.236 E.29507
G1 X142.065 Y117.814 E.01343
G1 X135.707 Y111.456 E.2767
G1 X136.241 Y111.456 E.01643
G1 X142.178 Y117.392 E.25834
G1 X142.29 Y116.97 E.01343
G1 X136.775 Y111.456 E.23997
G1 X137.309 Y111.456 E.01643
G1 X142.402 Y116.548 E.2216
G1 X142.514 Y116.126 E.01343
G1 X137.843 Y111.456 E.20324
G1 X138.377 Y111.456 E.01643
G1 X142.609 Y115.688 E.18416
G2 X142.651 Y115.195 I-2.53 J-.461 E.01523
G1 X138.911 Y111.456 E.16272
G3 X139.477 Y111.487 I.104 J3.25 E.01744
G1 X142.623 Y114.634 E.13692
G2 X142.457 Y113.934 I-2.973 J.334 E.02218
G1 X140.171 Y111.648 E.09948
G3 X141.417 Y112.367 I-1.26 J3.622 E.04451
G3 X142.378 Y113.32 I-31.615 J32.812 E.04166
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X141.417 Y112.367 E-.51444
G1 X141.142 Y112.147 E-.13365
G1 X140.896 Y111.986 E-.11191
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/10
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
G17
G3 Z1 I1.217 J0 P1  F30000
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
; OBJECT_ID: 1729
G1 X114.51 Y111.994
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X117.013 Y111.119 I2.494 J3.119 E.08966
G1 X139.131 Y111.123 E.7337
G3 X142.853 Y116.146 I-.141 J3.995 E.23811
G1 X138.413 Y132.867 E.5739
G3 X117.587 Y132.868 I-10.413 J-2.759 E.93751
G1 X113.147 Y116.146 E.57391
G3 X114.464 Y112.031 I3.857 J-1.034 E.15142
G1 X114.256 Y111.676 F30000
G1 F15476.087
G3 X117.008 Y110.712 I2.748 J3.437 E.0986
G1 X139.141 Y110.716 E.73419
G3 X143.248 Y116.246 I-.151 J4.402 E.26233
G1 X138.806 Y132.975 E.57416
G3 X117.194 Y132.975 I-10.806 J-2.867 E.97272
G1 X112.752 Y116.246 E.57417
G3 X114.209 Y111.713 I4.252 J-1.133 E.16687
G1 X114.007 Y111.372 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X114.014 Y111.373 E.0002
G3 X117.004 Y110.32 I2.999 J3.746 E.09927
G1 X139.151 Y110.324 E.68051
G3 X143.628 Y116.342 I-.161 J4.795 E.2646
G1 X139.184 Y133.078 E.53208
G3 X116.816 Y133.079 I-11.184 J-2.97 E.93245
G1 X112.372 Y116.342 E.53209
G3 X113.507 Y111.842 I4.64 J-1.223 E.14884
G1 X113.963 Y111.413 E.01926
; WIPE_START
M204 S10000
G1 X114.014 Y111.373 E-.02445
G1 X114.384 Y111.098 E-.17519
G1 X114.989 Y110.763 E-.26278
G1 X115.636 Y110.519 E-.26272
G1 X115.725 Y110.497 E-.03486
; WIPE_END
G1 E-.04 F1800
G1 X113.601 Y113.366 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.38 Y112.587 E.03657
G3 X115.903 Y111.645 I2.593 J2.49 E.06002
G1 X113.528 Y114.019 E.11139
M73 P74 R2
G2 X113.38 Y114.748 I3.767 J1.144 E.0247
G1 X116.642 Y111.486 E.15301
G3 X117.241 Y111.468 I.613 J9.989 E.0199
G1 X113.367 Y115.342 E.18176
G2 X113.437 Y115.852 I2.161 J-.039 E.01712
G1 X117.822 Y111.468 E.20568
G1 X118.402 Y111.468 E.01926
G1 X113.557 Y116.314 E.22733
G1 X113.678 Y116.772 E.01575
G1 X118.983 Y111.468 E.24885
G1 X119.563 Y111.468 E.01926
G1 X113.8 Y117.231 E.27038
G1 X113.922 Y117.69 E.01575
G1 X120.144 Y111.468 E.2919
G1 X120.724 Y111.468 E.01926
G1 X114.043 Y118.149 E.31342
G1 X114.165 Y118.608 E.01575
G1 X121.305 Y111.468 E.33495
G1 X121.885 Y111.468 E.01926
G1 X114.287 Y119.067 E.35647
G1 X114.409 Y119.526 E.01575
G1 X122.466 Y111.468 E.37799
G1 X123.047 Y111.468 E.01926
G1 X114.53 Y119.985 E.39952
G1 X114.652 Y120.444 E.01575
G1 X123.627 Y111.469 E.42104
G1 X124.208 Y111.469 E.01926
G1 X114.774 Y120.903 E.44256
G1 X114.895 Y121.361 E.01575
G1 X124.788 Y111.469 E.46409
G1 X125.369 Y111.469 E.01926
G1 X115.017 Y121.82 E.48561
G1 X115.139 Y122.279 E.01575
G1 X125.949 Y111.469 E.50713
G1 X126.53 Y111.469 E.01926
G1 X115.26 Y122.738 E.52866
G1 X115.382 Y123.197 E.01575
G1 X127.11 Y111.469 E.55018
G1 X127.691 Y111.469 E.01926
G1 X115.504 Y123.656 E.5717
G1 X115.626 Y124.115 E.01575
G1 X128.271 Y111.469 E.59323
G1 X128.852 Y111.469 E.01926
G1 X115.747 Y124.574 E.61475
G1 X115.869 Y125.033 E.01575
G1 X129.432 Y111.469 E.63627
G1 X130.013 Y111.47 E.01926
G1 X115.991 Y125.491 E.6578
G1 X116.112 Y125.95 E.01575
G1 X130.593 Y111.47 E.67932
G1 X131.174 Y111.47 E.01926
G1 X116.234 Y126.409 E.70084
G1 X116.356 Y126.868 E.01575
G1 X131.754 Y111.47 E.72237
G1 X132.335 Y111.47 E.01926
G1 X116.478 Y127.327 E.74389
G1 X116.599 Y127.786 E.01575
G1 X132.915 Y111.47 E.76541
G1 X133.496 Y111.47 E.01926
G1 X116.721 Y128.245 E.78694
G1 X116.843 Y128.704 E.01575
G1 X134.076 Y111.47 E.80846
G1 X134.657 Y111.47 E.01926
G1 X116.964 Y129.163 E.82998
G1 X117.086 Y129.622 E.01575
G1 X135.237 Y111.47 E.85151
G1 X135.818 Y111.47 E.01926
G1 X117.208 Y130.08 E.87303
G1 X117.33 Y130.539 E.01575
G1 X136.398 Y111.471 E.89455
G1 X136.979 Y111.471 E.01926
G1 X117.451 Y130.998 E.91608
G1 X117.573 Y131.457 E.01575
G1 X137.559 Y111.471 E.9376
G1 X138.14 Y111.471 E.01926
G1 X117.695 Y131.916 E.95912
G1 X117.816 Y132.375 E.01575
G1 X138.72 Y111.471 E.98065
G3 X139.286 Y111.486 I.197 J3.276 E.0188
G1 X117.94 Y132.832 E1.00141
G1 X118.074 Y133.279 E.01547
G1 X139.794 Y111.559 E1.01894
G3 X140.244 Y111.689 I-1.135 J4.754 E.01555
G1 X118.227 Y133.706 E1.03284
G1 X118.39 Y134.124 E.01488
G1 X140.647 Y111.867 E1.04414
G3 X141.013 Y112.081 I-.926 J2.006 E.0141
G1 X118.567 Y134.527 E1.05299
G1 X118.761 Y134.914 E.01435
G1 X141.346 Y112.329 E1.05949
G3 X141.646 Y112.61 I-1.303 J1.692 E.01365
G1 X118.962 Y135.294 E1.06417
G1 X119.185 Y135.651 E.01397
G1 X141.911 Y112.925 E1.0661
G3 X142.141 Y113.276 I-1.696 J1.366 E.01393
G1 X119.409 Y136.008 E1.06642
G2 X119.657 Y136.34 I1.87 J-1.137 E.01378
G1 X142.336 Y113.661 E1.06391
G3 X142.492 Y114.086 I-2.12 J1.019 E.01503
G1 X119.909 Y136.669 E1.0594
G2 X120.174 Y136.984 I1.789 J-1.237 E.01369
G1 X142.596 Y114.562 E1.05186
G3 X142.631 Y115.108 I-2.237 J.416 E.01819
G1 X120.454 Y137.285 E1.04036
G2 X120.736 Y137.584 I2.026 J-1.623 E.01364
G1 X142.586 Y115.734 E1.02503
G3 X142.398 Y116.502 I-8.18 J-1.589 E.02623
G1 X121.038 Y137.862 E1.00204
G2 X121.352 Y138.129 I1.844 J-1.85 E.01368
G1 X142.188 Y117.293 E.97747
G1 X141.979 Y118.083 E.02713
G1 X121.678 Y138.383 E.95234
G2 X122.006 Y138.636 I1.494 J-1.604 E.01376
G1 X141.769 Y118.874 E.92709
G1 X141.559 Y119.664 E.02713
G1 X122.361 Y138.862 E.90063
G1 X122.715 Y139.089 E.01394
G1 X141.349 Y120.455 E.87416
G1 X141.139 Y121.245 E.02713
G1 X123.091 Y139.293 E.84668
G1 X123.474 Y139.49 E.01431
G1 X140.929 Y122.036 E.81883
G1 X140.719 Y122.826 E.02713
G1 X123.872 Y139.673 E.79033
G1 X124.287 Y139.839 E.01483
G1 X140.509 Y123.617 E.761
G1 X140.299 Y124.407 E.02713
G1 X124.711 Y139.996 E.7313
M73 P75 R2
G1 X125.16 Y140.127 E.01553
G1 X140.089 Y125.198 E.70038
G1 X139.88 Y125.988 E.02713
G1 X125.613 Y140.255 E.66928
G1 X126.093 Y140.355 E.01628
G1 X139.67 Y126.779 E.63689
G1 X139.46 Y127.569 E.02713
G1 X126.595 Y140.434 E.6035
G2 X127.122 Y140.487 I.601 J-3.304 E.01759
G1 X139.25 Y128.36 E.56892
G1 X139.04 Y129.15 E.02713
G1 X127.668 Y140.522 E.53346
G2 X128.252 Y140.519 I.278 J-3.067 E.01938
G1 X138.83 Y129.941 E.49625
G1 X138.62 Y130.731 E.02713
G1 X128.854 Y140.497 E.45813
G1 X129.519 Y140.412 E.02224
G1 X138.41 Y131.522 E.41709
G1 X138.2 Y132.312 E.02713
G1 X130.233 Y140.28 E.37377
G2 X131.015 Y140.078 I-.668 J-4.214 E.02682
G1 X137.974 Y133.119 E.3265
G3 X137.667 Y134.007 I-7.144 J-1.977 E.03121
G1 X131.91 Y139.763 E.27004
G2 X133.026 Y139.228 I-2.255 J-6.132 E.0411
G1 X137.141 Y135.114 E.19302
G3 X136.559 Y136.059 I-6.26 J-3.199 E.03683
G3 X133.977 Y138.858 I-17.532 J-13.582 E.12651
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X135.389 Y137.442 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/10
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1.2 I1.217 J0 P1  F30000
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
; OBJECT_ID: 1729
G1 X114.511 Y111.995
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X117.013 Y111.119 I2.496 J3.12 E.08964
G1 X139.107 Y111.122 E.7329
G3 X142.853 Y116.146 I-.116 J3.995 E.2389
G1 X138.413 Y132.867 E.57389
G3 X117.587 Y132.867 I-10.413 J-2.762 E.93739
G1 X113.147 Y116.146 E.5739
G3 X114.465 Y112.033 I3.861 J-1.031 E.15136
G1 X114.257 Y111.677 F30000
G1 F15476.087
G3 X117.008 Y110.712 I2.751 J3.438 E.09858
G1 X139.117 Y110.715 E.73339
G3 X143.248 Y116.246 I-.127 J4.403 E.26313
G1 X138.806 Y132.974 E.57415
G3 X117.194 Y132.975 I-10.806 J-2.87 E.97259
G1 X112.752 Y116.246 E.57417
G3 X114.21 Y111.715 I4.256 J-1.13 E.1668
G1 X114.008 Y111.371 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X114.012 Y111.371 E.00013
G3 X117.004 Y110.32 I2.996 J3.745 E.09929
G1 X139.126 Y110.323 E.67977
G3 X143.628 Y116.342 I-.137 J4.795 E.26534
G1 X139.184 Y133.078 E.53208
G3 X117.207 Y134.278 I-11.184 J-2.972 E.89354
G3 X116.816 Y133.078 I15.417 J-5.689 E.03877
G1 X112.372 Y116.342 E.53209
G3 X113.505 Y111.841 I4.636 J-1.226 E.14888
G1 X113.964 Y111.412 E.0193
; WIPE_START
M204 S10000
G1 X114.012 Y111.371 E-.0239
G1 X114.58 Y110.977 E-.26278
G1 X114.989 Y110.763 E-.17522
G1 X115.636 Y110.519 E-.26272
G1 X115.726 Y110.497 E-.03538
; WIPE_END
G1 E-.04 F1800
G1 X114.864 Y112.544 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.651 Y112.331 E.01
G1 X114.352 Y112.613 E.01363
G1 X114.681 Y112.942 E.01544
G1 X114.681 Y113.523 E.01926
G1 X114.088 Y112.929 E.02783
G2 X113.857 Y113.279 I1.392 J1.169 E.01394
G1 X114.681 Y114.103 E.03866
G1 X114.681 Y114.684 E.01926
G1 X113.665 Y113.669 E.04764
G2 X113.507 Y114.091 I1.664 J.867 E.01499
G1 X114.681 Y115.265 E.05509
G1 X114.681 Y115.846 E.01926
G1 X113.403 Y114.568 E.05996
G2 X113.362 Y115.107 I2.773 J.483 E.01798
G1 X114.681 Y116.426 E.06189
G1 X114.681 Y117.007 E.01926
G1 X113.419 Y115.745 E.05921
G2 X113.611 Y116.518 I4.104 J-.609 E.02645
G1 X114.864 Y117.771 E.0588
G1 X115.358 Y118.846 F30000
G1 F15476.087
G1 X113.82 Y117.308 E.07213
G1 X114.03 Y118.098 E.02712
M73 P76 R2
G1 X115.403 Y119.471 E.06441
G1 X115.767 Y120.416 E.0336
G1 X114.24 Y118.889 E.07166
G1 X114.449 Y119.679 E.02712
G1 X116.132 Y121.361 E.07892
G1 X116.496 Y122.307 E.0336
G1 X114.659 Y120.469 E.08618
G1 X114.868 Y121.26 E.02712
G1 X116.86 Y123.252 E.09344
G1 X117.225 Y124.197 E.0336
G1 X115.078 Y122.05 E.1007
G1 X115.288 Y122.841 E.02712
G1 X117.908 Y125.461 E.12294
G1 X119.677 Y125.288 F30000
G1 F15476.087
G1 X118.572 Y124.183 E.05181
G1 X118.206 Y123.234 E.03374
G1 X120.26 Y125.288 E.09633
G1 X119.884 Y124.328 F30000
G1 F15476.087
G1 X120.66 Y125.104 E.0364
G1 X120.927 Y125.104 E.00888
G1 X121.015 Y124.877 E.0081
G1 X120.534 Y124.396 E.02256
G1 X120.718 Y123.997 E.01458
G1 X121.177 Y124.455 E.02152
G1 X121.339 Y124.034 E.01497
G1 X120.88 Y123.576 E.02152
G1 X121.042 Y123.154 E.01497
G1 X121.777 Y123.89 E.03448
G1 X121.837 Y123.88 E.00199
G2 X123.58 Y125.109 I2.57 J-1.795 E.07221
G1 X121.204 Y122.733 E.11146
G1 X121.366 Y122.312 E.01497
G1 X122.085 Y123.031 E.0337
G1 X122.331 Y123.527 E.01838
G1 X122.65 Y123.918 E.01674
G1 X123.056 Y124.241 E.01722
G1 X123.528 Y124.474 E.01745
G1 X124.258 Y125.204 E.03425
G2 X124.807 Y125.169 I-.038 J-5.038 E.01826
G1 X124.248 Y124.61 E.02623
G1 X124.79 Y124.569 E.01803
G1 X125.274 Y125.054 E.02274
G2 X125.683 Y124.879 I-.957 J-2.796 E.01475
G1 X125.238 Y124.434 E.02086
G1 X125.617 Y124.23 E.01428
G1 X126.042 Y124.655 E.01994
G2 X126.36 Y124.39 I-1.721 J-2.385 E.01375
G1 X125.941 Y123.971 E.01967
G1 X126.218 Y123.665 E.0137
G1 X126.771 Y124.218 E.02594
G1 X128.023 Y123.72 F30000
G1 F15476.087
G1 X126.695 Y122.392 E.06227
G1 X126.671 Y121.785 E.02016
G1 X127.337 Y122.451 E.03125
G1 X126.971 Y121.502 E.03374
G1 X126.259 Y120.79 E.0334
G1 X126.514 Y120.461 E.01379
G1 X126.925 Y120.873 E.01929
G1 X128.72 Y119.354 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.58276
G1 F11670.125
G1 X128.838 Y119.141 E.01073
G1 X121.283 Y125.341 F30000
; LINE_WIDTH: 0.485
G1 F12000
G1 X121.234 Y125.41 E.00306
; LINE_WIDTH: 0.503338
G1 X121.185 Y125.48 E.00319
G1 X121.007 Y125.522 E.00684
; LINE_WIDTH: 0.47062
G1 X118.847 Y125.522 E.07529
; LINE_WIDTH: 0.484708
G1 X118.759 Y125.501 E.00328
; LINE_WIDTH: 0.503488
G1 X118.67 Y125.48 E.00342
G1 X118.567 Y125.329 E.00684
; LINE_WIDTH: 0.4706
G1 X116.253 Y119.327 E.22421
; LINE_WIDTH: 0.45794
G1 X116.275 Y119.235 E.00319
; LINE_WIDTH: 0.420637
G1 X116.297 Y119.143 E.00291
G1 X116.461 Y118.944 E.00794
G3 X119.478 Y118.924 I1.986 J70.353 E.09286
G1 X119.666 Y119.012 E.0064
G1 X119.736 Y119.104 E.00357
G1 X119.937 Y119.545 E.0149
G1 X120.106 Y119.098 E.01469
G1 X120.293 Y118.937 E.00759
G3 X123.481 Y118.924 I1.957 J86.82 E.09814
G1 X124.317 Y118.824 E.02591
G1 X124.798 Y118.858 E.01483
G1 X125.11 Y118.619 E.01212
G3 X128.586 Y118.609 I2.148 J140.317 E.10698
G1 X128.726 Y118.672 E.00474
G1 X128.884 Y118.958 E.01007
; LINE_WIDTH: 0.472593
G1 X128.868 Y119.088 E.00459
G1 X129.054 Y118.944 E.00825
; LINE_WIDTH: 0.42047
G1 X129.565 Y118.924 E.01574
G1 X135.626 Y118.924 E.18648
G1 X135.815 Y119.012 E.0064
G1 X135.885 Y119.104 E.00356
G1 X136.086 Y119.545 E.01489
G1 X136.255 Y119.098 E.01468
G1 X136.448 Y118.935 E.00778
G3 X139.453 Y118.924 I2.077 J158.561 E.09243
G1 X139.608 Y119.006 E.0054
; LINE_WIDTH: 0.433455
G1 X139.683 Y119.148 E.00513
; LINE_WIDTH: 0.470356
G1 X139.758 Y119.291 E.00562
G1 X139.746 Y119.326 E.0013
G1 X137.437 Y125.329 E.22402
; LINE_WIDTH: 0.484695
G1 X137.385 Y125.404 E.00328
; LINE_WIDTH: 0.503514
G1 X137.334 Y125.48 E.00342
G1 X137.156 Y125.522 E.00684
; LINE_WIDTH: 0.47062
G1 X134.996 Y125.522 E.07529
; LINE_WIDTH: 0.484705
G1 X134.886 Y125.486 E.00416
; LINE_WIDTH: 0.517157
G3 X134.738 Y125.418 I.007 J-.208 E.00648
; LINE_WIDTH: 0.509132
G1 X134.722 Y125.342 E.00294
; LINE_WIDTH: 0.473475
G1 X134.706 Y125.266 E.00272
; LINE_WIDTH: 0.437366
G1 X134.46 Y124.597 E.02291
G3 X133.665 Y125.248 I-2.603 J-2.369 E.03316
G1 X133.107 Y125.434 E.01891
; LINE_WIDTH: 0.471481
G3 X132.109 Y125.519 I-1.078 J-6.787 E.035
G3 X127.645 Y125.522 I-3.267 J-1723.106 E.1559
; LINE_WIDTH: 0.484705
G1 X127.556 Y125.501 E.00328
; LINE_WIDTH: 0.503628
G1 X127.467 Y125.48 E.00342
G1 X127.364 Y125.329 E.00685
; LINE_WIDTH: 0.458285
G1 X127.251 Y125.002 E.01173
; LINE_WIDTH: 0.423364
G2 X126.968 Y124.298 I-3.829 J1.133 E.02356
G1 X126.587 Y124.697 E.01712
; LINE_WIDTH: 0.432745
G1 X126.404 Y124.869 E.00796
; LINE_WIDTH: 0.474362
G1 X126.222 Y125.04 E.00881
G1 X125.579 Y125.385 E.02563
G3 X124.635 Y125.601 I-1.347 J-3.733 E.03412
G1 X123.892 Y125.585 E.02613
G1 X123.303 Y125.449 E.02127
G1 X122.739 Y125.214 E.02146
G1 X122.379 Y125.001 E.01471
; LINE_WIDTH: 0.460565
G1 X122.177 Y124.819 E.00926
; LINE_WIDTH: 0.422768
G3 X121.654 Y124.306 I3.704 J-4.306 E.02268
G1 X121.442 Y124.859 E.01833
; LINE_WIDTH: 0.43274
G1 X121.372 Y125.071 E.00711
; LINE_WIDTH: 0.45824
G1 X121.302 Y125.284 E.00757
G1 X140.9 Y112.225 F30000
; LINE_WIDTH: 0.47437
G1 F12000
G1 X140.9 Y112.1 E.0044
; LINE_WIDTH: 0.45173
G1 X140.682 Y111.955 E.0087
; LINE_WIDTH: 0.409238
G1 X140.465 Y111.81 E.0078
G1 X139.875 Y111.632 E.01839
; LINE_WIDTH: 0.476419
G2 X139.069 Y111.547 I-1.465 J10.048 E.02863
G3 X136.982 Y111.533 I-.741 J-46.228 E.07374
; LINE_WIDTH: 0.464723
G3 X135.93 Y111.514 I-.424 J-5.48 E.03622
; LINE_WIDTH: 0.440844
G3 X134.209 Y111.534 I-4.118 J-281.713 E.05581
; LINE_WIDTH: 0.484923
G1 X131.126 Y111.547 E.11104
; LINE_WIDTH: 0.511508
G1 X130.703 Y111.571 E.01618
; LINE_WIDTH: 0.580984
G1 F11708.654
G1 X130.28 Y111.596 E.01858
G1 X130.762 Y112.646 E.05066
G1 X130.762 Y112.305 E.01496
G1 X130.895 Y112.059 E.01225
; LINE_WIDTH: 0.561003
G1 F12000
G1 X131.011 Y112.025 E.00509
; LINE_WIDTH: 0.48774
G1 X131.126 Y111.99 E.00437
G1 X133.803 Y111.99 E.09703
; LINE_WIDTH: 0.46988
G3 X134.749 Y111.968 I.56 J3.619 E.033
; LINE_WIDTH: 0.461608
G1 X134.981 Y112.041 E.0083
; LINE_WIDTH: 0.424332
G1 X135.213 Y112.115 E.00756
G1 X135.689 Y112.357 E.01661
; LINE_WIDTH: 0.43456
G1 X136.061 Y112.183 E.01313
; LINE_WIDTH: 0.473973
G1 X136.434 Y112.009 E.01445
G1 X136.944 Y111.948 E.01805
G2 X137.562 Y111.989 I1.296 J-14.88 E.02175
G3 X139.81 Y112.015 I.734 J33.998 E.07898
; LINE_WIDTH: 0.419513
G1 X140.016 Y112.037 E.00635
; LINE_WIDTH: 0.384478
G1 X140.221 Y112.059 E.00576
; LINE_WIDTH: 0.384862
G1 X140.305 Y112.128 E.00301
; LINE_WIDTH: 0.420665
G1 X140.389 Y112.196 E.00333
; LINE_WIDTH: 0.46983
G1 X140.472 Y112.265 E.00376
G1 X140.474 Y112.305 E.0014
G1 X140.474 Y117.391 E.17693
G1 X140.399 Y117.53 E.00549
; LINE_WIDTH: 0.420037
G1 X140.26 Y117.648 E.0056
G3 X137.6 Y117.672 I-1.734 J-44.1 E.08175
G1 X137.467 Y117.617 E.00443
G1 X137.333 Y117.463 E.00627
G1 X137.319 Y116.88 E.01791
G1 X137.291 Y116.853 E.00119
G3 X136.001 Y116.642 I-.23 J-2.643 E.04058
G1 X135.682 Y116.482 E.01099
G1 X135.246 Y116.7 E.01496
G3 X133.972 Y116.857 I-.981 J-2.705 E.03979
G1 X133.969 Y117.387 E.0163
G1 X133.824 Y117.578 E.00735
G1 X133.691 Y117.633 E.00443
G1 X131.126 Y117.633 E.07882
G3 X130.868 Y117.442 I.085 J-.385 E.01016
G1 X130.845 Y116.835 E.01867
G1 X130.058 Y116.815 E.02418
G1 X130.04 Y116.842 E.00098
G1 X130.159 Y117.243 E.01286
G1 X129.97 Y117.485 E.00944
G1 X129.837 Y117.541 E.00444
G3 X127.53 Y116.82 I32.169 J-107.063 E.07427
G1 X126.063 Y116.815 E.04508
G3 X125.129 Y116.846 I-.573 J-3.171 E.02882
G1 X125.118 Y117.352 E.01554
G1 X125.062 Y117.485 E.00443
G1 X124.866 Y117.631 E.00752
G3 X121.019 Y117.633 I-2.188 J-448.625 E.1182
G1 X120.886 Y117.578 E.00443
G1 X120.757 Y117.434 E.00595
G1 X120.733 Y116.829 E.0186
G3 X119.365 Y116.762 I-.506 J-3.663 E.04233
G1 X118.964 Y117.149 E.01715
G1 X118.611 Y117.365 E.01269
G1 X118.066 Y117.539 E.0176
G3 X116.546 Y117.597 I-1.093 J-8.761 E.0468
G1 X115.833 Y117.597 E.02191
G1 X115.699 Y117.542 E.00444
; LINE_WIDTH: 0.433458
G1 X115.613 Y117.448 E.00406
; LINE_WIDTH: 0.47038
G1 X115.528 Y117.353 E.00445
G1 X115.526 Y117.316 E.0013
G1 X115.526 Y112.302 E.17465
; LINE_WIDTH: 0.4539
G1 X115.569 Y112.238 E.00258
; LINE_WIDTH: 0.42046
G1 X115.612 Y112.174 E.00237
; LINE_WIDTH: 0.3872
G1 X115.771 Y112.058 E.00553
; LINE_WIDTH: 0.391608
G1 X116.061 Y112.031 E.00828
; LINE_WIDTH: 0.433503
G1 X116.351 Y112.005 E.00927
; LINE_WIDTH: 0.480207
G3 X117.788 Y111.992 I.998 J30.264 E.05119
; LINE_WIDTH: 0.499265
G1 X118.179 Y112.016 E.01459
; LINE_WIDTH: 0.487175
G1 X118.462 Y112.125 E.01096
; LINE_WIDTH: 0.433039
G3 X118.945 Y112.315 I-7.581 J20.037 E.01652
; LINE_WIDTH: 0.43517
G1 X119.227 Y112.171 E.01012
; LINE_WIDTH: 0.482339
G1 X119.509 Y112.027 E.01134
G1 X120.1 Y111.949 E.02134
G2 X120.656 Y111.988 I1.371 J-15.359 E.01996
G1 X124.97 Y111.99 E.15448
G1 X125.427 Y111.949 E.01641
G2 X126.919 Y111.99 I1.142 J-14.387 E.05348
G1 X126.711 Y111.546 E.01758
G2 X124.956 Y111.546 I-.865 J54.34 E.06284
G1 X120.656 Y111.545 E.15396
G2 X119.528 Y111.551 I-.513 J9.707 E.04041
; LINE_WIDTH: 0.478925
G1 X119.255 Y111.531 E.00974
; LINE_WIDTH: 0.439635
G1 X118.981 Y111.512 E.00887
; LINE_WIDTH: 0.442385
G1 X118.608 Y111.534 E.01216
; LINE_WIDTH: 0.496011
G1 X118.235 Y111.556 E.01379
G1 X117.039 Y111.545 E.04416
; LINE_WIDTH: 0.47121
G1 X116.332 Y111.595 E.02473
; LINE_WIDTH: 0.43778
G1 X116.072 Y111.646 E.00855
; LINE_WIDTH: 0.398945
G1 X115.811 Y111.698 E.00771
G1 X115.396 Y111.89 E.01328
; LINE_WIDTH: 0.421343
G1 X115.248 Y111.995 E.00558
; LINE_WIDTH: 0.470215
G1 X115.1 Y112.099 E.0063
G2 X115.098 Y117.316 I299.212 J2.71 E.18165
; LINE_WIDTH: 0.457963
G1 X115.086 Y117.569 E.00857
; LINE_WIDTH: 0.422081
G2 X115.096 Y118.077 I1.794 J.217 E.01572
G1 X115.3 Y118.178 E.00704
G1 X115.608 Y118.914 E.02465
; LINE_WIDTH: 0.43264
G1 X115.731 Y119.197 E.00981
; LINE_WIDTH: 0.470021
G1 X115.854 Y119.48 E.01075
G1 X118.168 Y125.483 E.2239
; LINE_WIDTH: 0.4847
G1 X118.267 Y125.702 E.00866
; LINE_WIDTH: 0.50349
G1 X118.367 Y125.921 E.00903
G1 X118.847 Y125.949 E.01806
; LINE_WIDTH: 0.47062
G1 X121.007 Y125.949 E.07529
; LINE_WIDTH: 0.484723
G1 X121.248 Y125.935 E.00867
; LINE_WIDTH: 0.503732
G1 X121.488 Y125.921 E.00904
G1 X121.683 Y125.495 E.0176
; LINE_WIDTH: 0.45824
G1 X121.82 Y125.426 E.0052
; LINE_WIDTH: 0.458671
G1 X121.957 Y125.357 E.0052
G1 X122.153 Y125.367 E.00663
G1 X122.751 Y125.696 E.02313
; LINE_WIDTH: 0.47548
G1 X123.188 Y125.868 E.01656
G1 X123.821 Y126.012 E.02289
G1 X124.645 Y126.034 E.02903
G2 X126.511 Y125.359 I-.321 J-3.808 E.07076
; LINE_WIDTH: 0.460385
G1 X126.671 Y125.382 E.00548
; LINE_WIDTH: 0.43979
G3 X126.975 Y125.508 I.03 J.358 E.01108
; LINE_WIDTH: 0.485028
G1 X127.07 Y125.715 E.00818
; LINE_WIDTH: 0.50334
G1 X127.164 Y125.921 E.00852
G1 X127.645 Y125.949 E.01806
; LINE_WIDTH: 0.472032
G1 X132.113 Y125.949 E.15625
G2 X133.601 Y125.736 I.045 J-4.998 E.05275
G1 X133.979 Y125.562 E.01457
; LINE_WIDTH: 0.459125
G1 X134.126 Y125.593 E.00507
; LINE_WIDTH: 0.433035
G1 X134.272 Y125.625 E.00475
; LINE_WIDTH: 0.437819
G1 X134.327 Y125.657 E.00206
; LINE_WIDTH: 0.473475
G1 X134.383 Y125.689 E.00225
; LINE_WIDTH: 0.522871
G1 X134.438 Y125.721 E.0025
G1 X134.516 Y125.921 E.00841
; LINE_WIDTH: 0.512875
G1 X134.756 Y125.935 E.00921
; LINE_WIDTH: 0.472032
G1 X134.996 Y125.949 E.00841
G1 X137.156 Y125.949 E.07554
; LINE_WIDTH: 0.484718
G1 X137.397 Y125.935 E.00867
; LINE_WIDTH: 0.503504
G1 X137.637 Y125.921 E.00904
G1 X137.836 Y125.483 E.01807
; LINE_WIDTH: 0.470595
G1 X140.146 Y119.48 E.22415
; LINE_WIDTH: 0.457948
G1 X140.268 Y119.197 E.01044
; LINE_WIDTH: 0.422964
G2 X140.616 Y118.327 I-10.431 J-4.681 E.02903
G1 X140.767 Y118.183 E.00643
G1 X140.927 Y118.131 E.00522
; LINE_WIDTH: 0.433455
G1 X140.914 Y117.798 E.0106
; LINE_WIDTH: 0.470031
G3 X140.902 Y117.391 I3.272 J-.299 E.01419
G1 X140.901 Y112.285 E.17771
G1 X135.744 Y111.912 F30000
; LINE_WIDTH: 0.46214
G1 F12000
G3 X135.662 Y111.873 I-.051 J.001 E.00704
G1 X130.502 Y117.158 F30000
; LINE_WIDTH: 0.35188
G1 F12000
G1 X130.5 Y117.243 E.00212
G1 X126.893 Y124.997 F30000
; LINE_WIDTH: 0.4532
G1 F12000
G3 X126.811 Y124.96 I-.049 J.001 E.00667
G1 X121.855 Y124.999 F30000
; LINE_WIDTH: 0.4433
G1 F12000
G3 X121.775 Y124.964 I-.048 J.001 E.00628
G1 X115.449 Y117.822 F30000
; LINE_WIDTH: 0.41734
G1 F12000
G1 X115.496 Y117.858 E.00181
G1 X118.96 Y111.892 F30000
; LINE_WIDTH: 0.42742
G1 F12000
G1 X118.936 Y111.934 E.00151
G1 X118.863 Y111.892 E.00261
G1 X118.884 Y111.881 E.00073
G1 X134.359 Y125.247 F30000
; LINE_WIDTH: 0.40838
G1 F12000
G1 X134.336 Y125.287 E.00136
G1 X134.267 Y125.247 E.00236
G1 X134.284 Y125.237 E.00057
G1 X140.44 Y117.966 F30000
; LINE_WIDTH: 0.39762
G1 F12000
G1 X140.51 Y117.915 E.00252
G1 X140.44 Y117.966 F30000
; LINE_WIDTH: 0.416645
G1 F12000
G1 X140.349 Y118.009 E.00307
; LINE_WIDTH: 0.454695
G1 X140.258 Y118.052 E.00338
; LINE_WIDTH: 0.484898
G1 X140.167 Y118.095 E.00363
G2 X137.6 Y118.079 I-1.641 J58.078 E.09244
; LINE_WIDTH: 0.46514
G1 X137.4 Y117.981 E.00766
; LINE_WIDTH: 0.420789
G1 X137.2 Y117.884 E.00686
G1 X136.985 Y117.606 E.01083
G1 X136.942 Y117.247 E.01113
G3 X135.702 Y116.905 I.21 J-3.176 E.03988
G1 X135.098 Y117.151 E.02009
G1 X134.564 Y117.242 E.01668
G1 X134.349 Y117.24 E.00662
G1 X134.339 Y117.458 E.00671
G1 X134.184 Y117.752 E.01025
; LINE_WIDTH: 0.441498
G1 X133.99 Y117.898 E.00788
; LINE_WIDTH: 0.49855
G1 X133.796 Y118.044 E.00901
G1 X133.691 Y118.05 E.00391
G1 X131.126 Y118.05 E.09523
; LINE_WIDTH: 0.479773
G1 X130.924 Y117.945 E.00812
; LINE_WIDTH: 0.427546
G1 X130.722 Y117.84 E.00715
G1 X130.539 Y117.622 E.00892
; LINE_WIDTH: 0.40275
G1 X130.516 Y117.487 E.00401
; LINE_WIDTH: 0.386044
G1 X130.494 Y117.352 E.00382
G1 X130.379 Y117.6 E.00764
; LINE_WIDTH: 0.438174
G1 X130.235 Y117.725 E.00615
; LINE_WIDTH: 0.48396
G1 X130.09 Y117.85 E.00686
; LINE_WIDTH: 0.529747
G1 X129.946 Y117.975 E.00757
; LINE_WIDTH: 0.559785
G1 X129.644 Y117.961 E.01273
; LINE_WIDTH: 0.582314
G1 F11679.782
G1 X129.375 Y117.899 E.01214
G1 X128.779 Y117.679 E.02791
; LINE_WIDTH: 0.5307
G1 F12000
G1 X128.672 Y117.625 E.00476
; LINE_WIDTH: 0.48851
G1 X128.109 Y117.423 E.02172
; LINE_WIDTH: 0.424587
G1 X127.547 Y117.221 E.0186
G1 X127.392 Y117.197 E.00486
G1 X126.09 Y117.193 E.04051
G1 X125.612 Y117.24 E.01492
G1 X125.495 Y117.234 E.00367
G1 X125.459 Y117.55 E.00988
; LINE_WIDTH: 0.406947
G1 X125.231 Y117.839 E.01093
G1 X125.092 Y117.929 E.00491
; LINE_WIDTH: 0.402323
G1 X124.848 Y117.979 E.0073
; LINE_WIDTH: 0.439768
G1 X124.604 Y118.029 E.00806
; LINE_WIDTH: 0.491516
G3 X121.019 Y118.05 I-2.518 J-126.244 E.13103
; LINE_WIDTH: 0.479773
G1 X120.819 Y117.947 E.008
; LINE_WIDTH: 0.42163
G1 X120.619 Y117.845 E.00694
G1 X120.417 Y117.597 E.00987
G1 X120.361 Y117.242 E.01111
G1 X119.854 Y117.234 E.01564
G1 X119.504 Y117.163 E.01102
G1 X119.165 Y117.468 E.01408
G1 X118.726 Y117.724 E.01569
; LINE_WIDTH: 0.442423
G1 X118.46 Y117.832 E.00935
; LINE_WIDTH: 0.487288
G1 X118.194 Y117.941 E.0104
; LINE_WIDTH: 0.527042
G1 X118.059 Y117.985 E.00562
G3 X116.546 Y118.023 I-1.082 J-12.997 E.05972
G1 X115.833 Y118.039 E.02813
; LINE_WIDTH: 0.527317
G1 X115.737 Y117.991 E.00425
; LINE_WIDTH: 0.48271
G1 X115.641 Y117.942 E.00386
; LINE_WIDTH: 0.438104
G1 X115.545 Y117.893 E.00347
G1 X115.622 Y117.97 E.0035
; LINE_WIDTH: 0.48271
G1 X115.699 Y118.046 E.00389
; LINE_WIDTH: 0.527317
G1 X115.776 Y118.122 E.00428
; LINE_WIDTH: 0.538589
G1 X116.026 Y118.745 E.02711
G1 X116.257 Y118.543 E.01242
G1 X116.546 Y118.498 E.01183
G2 X118.079 Y118.485 I.424 J-40.752 E.0619
; LINE_WIDTH: 0.523057
G1 X118.337 Y118.505 E.01015
; LINE_WIDTH: 0.48183
G1 X118.596 Y118.526 E.00928
; LINE_WIDTH: 0.423196
G2 X119.478 Y118.547 I.57 J-5.52 E.02736
G1 X119.731 Y118.607 E.00808
G1 X119.92 Y118.752 E.0074
G1 X120.153 Y118.587 E.00886
; LINE_WIDTH: 0.439918
G1 X120.586 Y118.547 E.01407
; LINE_WIDTH: 0.488252
G1 X121.019 Y118.507 E.01578
G1 X123.435 Y118.507 E.08766
G1 X124.277 Y118.433 E.03069
G1 X124.67 Y118.451 E.01428
; LINE_WIDTH: 0.439768
G1 X124.793 Y118.382 E.00455
; LINE_WIDTH: 0.410111
G3 X125.171 Y118.25 I.429 J.62 E.01213
G3 X127.39 Y118.232 I1.49 J46.383 E.06641
; LINE_WIDTH: 0.44283
G1 X127.988 Y118.209 E.01949
; LINE_WIDTH: 0.48851
G1 X128.586 Y118.186 E.02172
; LINE_WIDTH: 0.52737
G1 X128.775 Y118.199 E.00749
; LINE_WIDTH: 0.559908
G1 X128.927 Y118.278 E.00721
; LINE_WIDTH: 0.599915
G1 F11310.702
G3 X129.16 Y118.452 I-.102 J.381 E.01352
; LINE_WIDTH: 0.593588
G1 F11440.662
G1 X129.498 Y118.468 E.0152
; LINE_WIDTH: 0.561843
G1 F12000
G1 X129.837 Y118.484 E.01433
; LINE_WIDTH: 0.524974
G1 X130.034 Y118.505 E.00779
; LINE_WIDTH: 0.48298
G1 X130.231 Y118.526 E.00712
; LINE_WIDTH: 0.455673
G1 X130.429 Y118.547 E.00667
G1 X131.126 Y118.507 E.02349
; LINE_WIDTH: 0.4997
G1 X133.691 Y118.507 E.09547
; LINE_WIDTH: 0.479773
G1 X134.036 Y118.527 E.01232
; LINE_WIDTH: 0.422653
G1 X134.382 Y118.547 E.01071
G1 X135.626 Y118.547 E.03851
G1 X135.866 Y118.6 E.00759
G1 X136.069 Y118.752 E.00787
G1 X136.272 Y118.6 E.00785
G1 X136.511 Y118.547 E.00759
; LINE_WIDTH: 0.43504
G1 X137.056 Y118.532 E.01741
; LINE_WIDTH: 0.476774
G3 X139.453 Y118.517 I1.471 J43.35 E.08474
; LINE_WIDTH: 0.493995
G1 X139.605 Y118.542 E.00567
; LINE_WIDTH: 0.526535
G1 X139.757 Y118.568 E.00607
G1 X139.985 Y118.757 E.01169
G1 X140.222 Y118.175 E.02477
; LINE_WIDTH: 0.492745
G1 X140.28 Y118.119 E.00296
; LINE_WIDTH: 0.454695
G1 X140.338 Y118.064 E.00271
; LINE_WIDTH: 0.416645
G1 X140.397 Y118.008 E.00246
G1 X136.981 Y118.17 F30000
; LINE_WIDTH: 0.41999
G1 F12000
G1 X136.841 Y118.058 E.0055
G1 X136.636 Y117.749 E.01138
G1 X136.604 Y117.589 E.00503
G3 X135.7 Y117.335 I.327 J-2.898 E.02897
; LINE_WIDTH: 0.434818
G1 X135.467 Y117.435 E.00811
; LINE_WIDTH: 0.464473
G1 X135.233 Y117.535 E.00873
; LINE_WIDTH: 0.495185
G1 X135.146 Y117.573 E.00351
; LINE_WIDTH: 0.533075
G1 X135.059 Y117.611 E.0038
G1 X134.726 Y117.654 E.01339
G1 X134.689 Y117.77 E.00488
G1 X134.431 Y118.115 E.01721
G1 X135.096 Y118.108 E.02657
; LINE_WIDTH: 0.522365
G1 X135.273 Y118.129 E.00696
; LINE_WIDTH: 0.481415
G1 X135.45 Y118.149 E.00636
; LINE_WIDTH: 0.422431
G3 X136.025 Y118.258 I-.238 J2.833 E.01816
G1 X136.112 Y118.258 E.00269
G1 X136.388 Y118.178 E.00888
G1 X136.921 Y118.17 E.01648
G1 X135.699 Y117.768 F30000
; LINE_WIDTH: 0.47318
M73 P77 R2
G1 F12000
G1 X136.011 Y117.853 E.01136
G1 X130.485 Y118.133 F30000
; LINE_WIDTH: 0.49394
G1 F12000
G3 X130.399 Y118.087 I-.056 J0 E.00843
G1 X128.456 Y117.879 F30000
; LINE_WIDTH: 0.370832
G1 F12000
G1 X127.416 Y117.55 E.02913
G1 X126.115 Y117.547 E.03477
G1 X125.807 Y117.6 E.00834
G1 X125.647 Y117.885 E.00874
G3 X128.396 Y117.879 I1.862 J223.438 E.07345
G1 X120.279 Y118.118 F30000
; LINE_WIDTH: 0.530127
G1 F12000
G1 X120.026 Y117.785 E.01659
G1 X120 Y117.672 E.00462
G1 X119.644 Y117.639 E.01417
G1 X119.086 Y118.027 E.02697
G1 X118.896 Y118.116 E.00834
G1 X119.478 Y118.116 E.0231
G1 X119.847 Y118.183 E.01491
G1 X119.92 Y118.216 E.00317
G1 X120.221 Y118.134 E.01238
G1 X120.947 Y117.022 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X121.349 Y117.424 E.01887
G1 X120.206 Y115.702 F30000
G1 F15476.087
G1 X121.745 Y117.241 E.07219
G1 X122.324 Y117.241 E.01921
G1 X120.914 Y115.831 E.06617
G1 X121.474 Y115.812 E.01859
G1 X121.723 Y116.061 E.01169
G2 X122.31 Y116.648 I.456 J.131 E.03355
G1 X122.903 Y117.241 E.02781
G1 X123.482 Y117.241 E.01921
G1 X122.764 Y116.523 E.03367
G1 X122.881 Y116.407 E.00545
G1 X122.881 Y116.061 E.0115
G1 X124.244 Y117.424 E.06398
G1 X123.84 Y116.441 F30000
G1 F15476.087
G1 X124.64 Y117.241 E.03754
G1 X124.726 Y117.241 E.00283
G1 X124.726 Y116.747 E.01638
G1 X124.133 Y116.155 E.02781
G1 X124.133 Y115.831 E.01075
G2 X124.305 Y115.748 I.045 J-.128 E.00704
G1 X124.999 Y116.442 E.03254
G2 X125.613 Y116.477 I14.169 J-238.547 E.02043
G1 X124.9 Y115.764 E.03348
G2 X125.492 Y115.888 I.601 J-1.39 E.02022
G1 X125.6 Y115.885 E.00358
G1 X126.139 Y116.423 E.02528
G1 X126.718 Y116.423 E.01921
G1 X126.081 Y115.787 E.02988
G2 X126.427 Y115.592 I-.563 J-1.408 E.01321
G1 X127.297 Y116.423 E.03991
G3 X128.015 Y116.562 I.116 J1.325 E.02458
G1 X127.283 Y115.831 E.03433
G3 X127.916 Y115.885 I.184 J1.575 E.02122
G1 X128.862 Y116.83 E.04436
G1 X129.709 Y117.098 E.02947
G1 X128.441 Y115.831 E.05946
G1 X128.845 Y115.831 E.01341
G1 X128.95 Y115.761 E.00418
G1 X129.749 Y116.559 E.03747
G1 X129.844 Y116.423 E.00551
G1 X130.192 Y116.423 E.01154
G1 X129.172 Y115.404 E.04784
G1 X129.342 Y114.994 E.0147
G3 X129.754 Y115.7 I-.74 J.906 E.02769
G2 X130.178 Y115.831 I.314 J-.265 E.01555
G1 X131.589 Y117.241 E.06617
G1 X132.168 Y117.241 E.01921
G1 X130.681 Y115.754 E.06975
G1 X130.875 Y115.452 E.01191
G1 X130.805 Y115.299 E.00559
G1 X132.93 Y117.424 E.09971
G1 X132.55 Y116.465 F30000
G1 F15476.087
G1 X133.326 Y117.241 E.0364
G1 X133.58 Y117.241 E.00843
G1 X133.58 Y116.916 E.01077
G1 X132.987 Y116.324 E.02781
G1 X132.987 Y115.831 E.01635
G1 X133.074 Y115.831 E.00286
G1 X133.764 Y116.521 E.03237
G1 X133.879 Y116.425 E.00498
G2 X134.302 Y116.48 I.51 J-2.292 E.01414
G1 X133.318 Y115.441 E.04746
G2 X134.282 Y115.886 I1.039 J-.983 E.03608
G1 X134.828 Y116.427 E.02552
G2 X135.256 Y116.276 I-1.626 J-5.295 E.01506
G1 X134.8 Y115.82 E.02141
G2 X135.19 Y115.631 I-.401 J-1.329 E.01444
G1 X135.643 Y116.084 E.02124
G1 X135.827 Y116.084 E.00611
G2 X136.566 Y116.428 I1.244 J-1.71 E.02718
G1 X135.497 Y115.358 E.05016
G2 X135.698 Y115.044 I-1.236 J-1.014 E.0124
G1 X135.706 Y115.025 E.00072
G2 X136.444 Y115.762 I1.39 J-.653 E.03532
G1 X137.192 Y116.474 E.03424
G1 X137.44 Y116.449 E.00827
G1 X137.711 Y116.694 E.01214
G1 X137.711 Y116.994 E.00995
G1 X137.997 Y117.28 E.01343
G1 X138.576 Y117.28 E.01921
G1 X137.176 Y115.88 E.06569
G2 X137.635 Y115.76 I-.122 J-1.405 E.01581
G1 X139.339 Y117.463 E.07991
G1 X138.959 Y116.504 F30000
G1 F15476.087
G1 X139.735 Y117.28 E.0364
G1 X140.057 Y117.28 E.01069
G1 X140.057 Y117.023 E.00852
G1 X139.464 Y116.431 E.02781
G1 X139.464 Y115.852 E.01921
G1 X140.057 Y116.444 E.02781
G1 X140.057 Y115.865 E.01921
G1 X139.464 Y115.272 E.02781
G1 X139.464 Y114.693 E.01921
G1 X140.057 Y115.286 E.02781
G1 X140.057 Y114.707 E.01921
G1 X139.464 Y114.114 E.02781
G1 X139.464 Y113.535 E.01921
G1 X140.057 Y114.128 E.02781
G1 X140.057 Y113.549 E.01921
G1 X138.923 Y112.416 E.05317
G1 X139.502 Y112.416 E.01921
G1 X140.24 Y113.153 E.0346
G1 X139.12 Y113.192 F30000
G1 F15476.087
G1 X138.344 Y112.416 E.0364
G1 X137.765 Y112.416 E.01921
G1 X138.452 Y113.102 E.03219
G2 X138.304 Y113.533 I.142 J.29 E.0168
G1 X137.131 Y112.361 E.05502
G2 X136.596 Y112.404 I-.084 J2.274 E.01786
G1 X137.127 Y112.954 E.02537
G2 X136.622 Y113.009 I-.082 J1.591 E.01694
G1 X136.163 Y112.55 E.02154
G3 X135.782 Y112.749 I-1.151 J-1.739 E.01426
G1 X136.229 Y113.195 E.02093
G1 X136.132 Y113.267 E.004
G2 X135.924 Y113.469 I.954 J1.186 E.00964
G1 X134.874 Y112.419 E.04926
G2 X134.238 Y112.362 I-.522 J2.251 E.02125
G1 X134.942 Y113.067 E.03303
G1 X134.87 Y113.038 E.00256
G2 X134.252 Y112.956 I-.514 J1.512 E.02081
G1 X133.712 Y112.416 E.02535
G1 X133.133 Y112.416 E.01921
G1 X133.771 Y113.073 E.03038
G2 X133.43 Y113.292 I.62 J1.343 E.0135
G1 X132.554 Y112.416 E.04109
G1 X131.975 Y112.416 E.01921
G1 X133.287 Y113.727 E.06154
G1 X132.172 Y113.192 F30000
G1 F15476.087
G1 X131.396 Y112.416 E.0364
G1 X131.237 Y112.416 E.00527
G1 X131.237 Y112.836 E.01394
G1 X131.83 Y113.429 E.02781
G1 X131.83 Y114.008 E.01921
G1 X130.962 Y113.14 E.04071
G1 X130.418 Y112.596 F30000
G1 F15476.087
G1 X129.291 Y111.469 E.05288
G1 X128.712 Y111.469 E.01921
G1 X131.83 Y114.587 E.14626
G1 X131.83 Y114.748 E.00535
G1 X131.599 Y114.935 E.00986
G1 X129.823 Y113.159 E.08332
G1 X130.314 Y114.229 E.03905
G1 X132.013 Y115.928 E.07972
G1 X132.9 Y115.178 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.54738
G1 F12000
G1 X132.84 Y115.199 E.0026
; LINE_WIDTH: 0.607893
G1 F11150.979
G1 X132.78 Y115.22 E.00291
G1 X132.61 Y115.088 E.00992
; LINE_WIDTH: 0.588527
G1 F11546.789
G1 X132.607 Y115.031 E.00255
; LINE_WIDTH: 0.539899
G1 F12000
G1 X132.603 Y114.973 E.00232
; LINE_WIDTH: 0.491272
G1 X132.6 Y114.916 E.0021
; LINE_WIDTH: 0.419061
G1 X132.596 Y113.412 E.04611
G1 X132.221 Y113.412 E.01151
G1 X132.221 Y114.875 E.04486
; LINE_WIDTH: 0.443895
G1 X132.217 Y114.928 E.00174
; LINE_WIDTH: 0.492165
G1 X132.214 Y114.982 E.00195
; LINE_WIDTH: 0.540435
G1 X132.211 Y115.035 E.00216
; LINE_WIDTH: 0.610815
G1 F11093.613
G1 X132.207 Y115.088 E.00247
G1 X132.033 Y115.213 E.00994
G1 X132.033 Y115.365 E.00703
G1 X132.207 Y115.491 E.00994
; LINE_WIDTH: 0.588527
G1 F11546.789
G1 X132.211 Y115.636 E.00643
; LINE_WIDTH: 0.539899
G1 F12000
G1 X132.214 Y115.78 E.00586
; LINE_WIDTH: 0.491272
G1 X132.217 Y115.925 E.00529
; LINE_WIDTH: 0.421247
G2 X132.241 Y116.257 I1.985 J.025 E.01029
G1 X132.596 Y116.237 E.01096
G1 X132.596 Y115.72 E.01594
; LINE_WIDTH: 0.442644
G1 X132.6 Y115.663 E.00187
; LINE_WIDTH: 0.491272
G1 X132.603 Y115.605 E.0021
; LINE_WIDTH: 0.539899
G1 X132.607 Y115.548 E.00232
; LINE_WIDTH: 0.608516
G1 F11138.708
G1 X132.61 Y115.491 E.00264
G1 X132.78 Y115.359 E.00993
G1 X132.829 Y115.35 E.00229
; LINE_WIDTH: 0.59102
G1 F11494.253
G1 X132.853 Y115.292 E.00282
; LINE_WIDTH: 0.54738
G1 F12000
G1 X132.877 Y115.233 E.0026
G1 X139.072 Y113.42 F30000
; LINE_WIDTH: 0.41948
G1 F12000
G1 X138.707 Y113.4 E.01122
G1 X138.696 Y113.985 E.01795
; LINE_WIDTH: 0.44029
G1 X138.675 Y114.057 E.00244
; LINE_WIDTH: 0.48191
G1 X138.654 Y114.13 E.00269
; LINE_WIDTH: 0.540565
G1 X138.633 Y114.202 E.00305
G1 X138.304 Y114.285 E.01376
; LINE_WIDTH: 0.523615
G1 X138.294 Y114.265 E.00087
; LINE_WIDTH: 0.482165
G1 X138.283 Y114.246 E.00079
; LINE_WIDTH: 0.419524
G1 X138.272 Y114.226 E.00068
G1 X138.133 Y114.181 E.00449
G1 X137.829 Y113.683 E.01791
G2 X136.433 Y113.532 I-.792 J.797 E.04654
G1 X136.158 Y113.811 E.01201
G1 X135.951 Y114.221 E.01411
; LINE_WIDTH: 0.389793
G1 X135.605 Y114.255 E.00981
G1 X135.464 Y114.222 E.00411
; LINE_WIDTH: 0.41838
G1 X135.155 Y113.683 E.019
G2 X133.759 Y113.532 I-.792 J.796 E.04639
G1 X133.482 Y113.813 E.01205
G1 X133.352 Y114.078 E.00904
G1 X133.301 Y114.387 E.00959
G1 X133.357 Y114.848 E.01421
G1 X133.267 Y114.991 E.00519
G1 X133.422 Y114.977 E.00476
G1 X133.834 Y115.351 E.01702
G1 X134.104 Y115.463 E.00896
G2 X135.012 Y115.278 I.231 J-1.182 E.02908
G1 X135.229 Y115.063 E.00935
G1 X135.467 Y114.617 E.01548
; LINE_WIDTH: 0.389048
G1 X135.807 Y114.585 E.00964
G1 X135.955 Y114.62 E.00427
; LINE_WIDTH: 0.419172
G1 X136.255 Y115.148 E.01861
G1 X136.508 Y115.351 E.00994
G1 X136.778 Y115.463 E.00897
G2 X137.686 Y115.278 I.231 J-1.181 E.02917
G1 X137.899 Y115.069 E.00913
G1 X138.131 Y114.658 E.01449
G1 X138.271 Y114.614 E.00448
; LINE_WIDTH: 0.440715
G1 X138.284 Y114.595 E.00075
; LINE_WIDTH: 0.482165
G1 X138.297 Y114.576 E.00082
; LINE_WIDTH: 0.542999
G1 X138.31 Y114.557 E.00094
G1 X138.633 Y114.636 E.01354
; LINE_WIDTH: 0.52353
G1 X138.654 Y114.708 E.00295
; LINE_WIDTH: 0.48191
G1 X138.675 Y114.78 E.00269
; LINE_WIDTH: 0.419953
G1 X138.696 Y114.852 E.00231
G1 X138.696 Y116.284 E.04398
G1 X139.072 Y116.284 E.01157
G1 X139.072 Y114.852 E.04398
; LINE_WIDTH: 0.44029
G1 X139.051 Y114.708 E.00473
; LINE_WIDTH: 0.48191
G1 X139.031 Y114.563 E.00522
; LINE_WIDTH: 0.52353
G1 X139.01 Y114.419 E.00572
G1 X139.031 Y114.274 E.00572
; LINE_WIDTH: 0.48191
G1 X139.051 Y114.13 E.00522
; LINE_WIDTH: 0.424148
G1 X139.072 Y113.985 E.00454
G1 X139.072 Y113.48 E.01569
G1 X137.849 Y114.418 F30000
; LINE_WIDTH: 0.41999
G1 F12000
G1 X137.55 Y113.943 E.01726
G1 X137.308 Y113.784 E.00889
G1 X137.006 Y113.726 E.00945
G1 X136.738 Y113.799 E.00854
G1 X136.472 Y114.03 E.01081
G1 X136.273 Y114.418 E.01339
G1 X136.534 Y114.888 E.01652
G1 X136.784 Y115.058 E.0093
G1 X137.072 Y115.112 E.00898
G1 X137.383 Y115.011 E.01006
G1 X137.593 Y114.841 E.0083
G1 X137.818 Y114.469 E.01335
G1 X137.328 Y114.412 F30000
; LINE_WIDTH: 0.53582
G1 F12000
G1 X137.174 Y114.199 E.01054
G1 X136.971 Y114.175 E.0082
G2 X136.768 Y114.421 I.144 J.325 E.0133
G1 X136.886 Y114.613 E.00905
G1 X137.05 Y114.673 E.007
G1 X137.24 Y114.578 E.00854
G1 X137.3 Y114.465 E.00514
G1 X135.141 Y114.422 F30000
; LINE_WIDTH: 0.41999
G1 F12000
G1 X134.876 Y113.943 E.01683
G1 X134.634 Y113.784 E.00889
G1 X134.332 Y113.727 E.00945
G1 X134.064 Y113.799 E.00854
G1 X133.794 Y114.034 E.011
G1 X133.697 Y114.301 E.0087
G1 X133.728 Y114.745 E.01368
G1 X134.028 Y115.024 E.0126
G1 X134.303 Y115.103 E.00878
G1 X134.587 Y115.075 E.0088
G1 X134.849 Y114.909 E.00952
G2 X135.11 Y114.473 I-54.471 J-33.055 E.01561
G1 X134.645 Y114.415 F30000
; LINE_WIDTH: 0.53363
G1 F12000
G1 X134.526 Y114.219 E.00917
G1 X134.348 Y114.164 E.00742
G1 X134.214 Y114.225 E.00589
G1 X134.126 Y114.37 E.0068
G1 X134.141 Y114.557 E.0075
G1 X134.329 Y114.67 E.00876
G1 X134.506 Y114.627 E.0073
G1 X134.612 Y114.465 E.00776
G1 X138.487 Y115.454 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X138.265 Y115.232 E.01041
G1 X138.223 Y115.294 E.00248
G3 X137.992 Y115.537 I-1.258 J-.964 E.01117
G1 X138.487 Y116.033 E.02325
G1 X139.3 Y119.834 F30000
G1 F15476.087
G1 X138.781 Y119.316 E.02434
G1 X138.198 Y119.316 E.01935
G1 X138.996 Y120.114 E.03744
G1 X138.834 Y120.535 E.01497
G1 X137.615 Y119.316 E.0572
G1 X137.032 Y119.316 E.01935
G1 X137.625 Y119.909 E.02781
G1 X137.157 Y119.909 E.0155
G1 X137.089 Y119.956 E.00276
G1 X136.553 Y119.42 E.02515
G1 X136.392 Y119.843 E.015
G1 X136.852 Y120.302 E.02157
G1 X136.692 Y120.725 E.015
G1 X135.282 Y119.316 E.06613
G1 X134.699 Y119.316 E.01935
G1 X136.116 Y120.733 E.06647
G1 X135.533 Y120.733 E.01934
G1 X135.43 Y120.63 E.00483
G1 X135.201 Y120.051 E.02065
G2 X134.709 Y119.909 I-.351 J.291 E.01804
G1 X134.116 Y119.316 E.02781
G1 X133.533 Y119.316 E.01935
G1 X134.126 Y119.909 E.02781
G1 X133.993 Y120.053 E.0065
G1 X133.906 Y119.909 E.00557
G1 X133.542 Y119.909 E.01206
G1 X132.95 Y119.316 E.02781
G1 X132.366 Y119.316 E.01934
G1 X132.965 Y119.915 E.0281
G2 X132.681 Y120.213 I.106 J.386 E.01437
G1 X131.783 Y119.316 E.04211
G1 X131.2 Y119.316 E.01935
G1 X131.793 Y119.909 E.02781
G1 X131.221 Y119.92 E.01898
G1 X130.617 Y119.316 E.02833
G1 X130.034 Y119.316 E.01935
G1 X130.991 Y120.273 E.04489
G1 X130.991 Y120.856 E.01934
G1 X130.798 Y120.664 E.00902
G1 X130.636 Y121.085 E.01497
G1 X130.991 Y121.439 E.01662
G1 X130.991 Y122.022 E.01935
G1 X130.474 Y121.506 E.02422
G1 X130.312 Y121.927 E.01497
G1 X130.991 Y122.605 E.03183
G1 X130.991 Y123.189 E.01935
G1 X130.15 Y122.348 E.03943
G1 X129.988 Y122.769 E.01497
G1 X130.991 Y123.772 E.04703
G1 X130.991 Y124.271 E.01655
G1 X131.232 Y124.512 E.01131
G1 X131.73 Y124.512 E.01655
G1 X132.32 Y125.101 E.02765
G2 X132.857 Y125.055 I-.757 J-12.137 E.0179
G1 X132.31 Y124.508 E.02567
G1 X132.842 Y124.457 E.01773
G1 X133.327 Y124.942 E.02273
G2 X133.711 Y124.743 I-.746 J-1.91 E.01438
G1 X133.28 Y124.311 E.02024
G1 X133.458 Y124.194 E.00708
G2 X133.605 Y124.054 I-.667 J-.849 E.00676
G1 X134.025 Y124.473 E.01968
G3 X134.315 Y124.18 I.824 J.526 E.01378
G1 X133.836 Y123.701 E.02246
G1 X133.899 Y123.538 E.00581
G2 X133.96 Y123.242 I-1.49 J-.459 E.01003
G1 X135.822 Y125.104 E.08737
G1 X136.406 Y125.104 E.01935
G1 X133.913 Y122.612 E.11695
G2 X133.324 Y121.852 I-1.223 J.34 E.03268
G1 X133.467 Y121.583 E.01012
G1 X134.91 Y123.026 E.06769
G1 X134.544 Y122.077 E.03374
G1 X133.67 Y121.202 E.04103
G1 X133.872 Y120.822 E.0143
G1 X134.498 Y121.447 E.02935
G1 X132.614 Y120.73 F30000
G1 F15476.087
G1 X132.171 Y120.287 E.02076
G1 X130.453 Y120.345 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.509335
G1 F12000
G1 X129.952 Y120.345 E.01904
G1 X129.717 Y120.962 E.02509
; LINE_WIDTH: 0.486615
G1 X129.622 Y121.027 E.00417
; LINE_WIDTH: 0.421694
G3 X129.418 Y121.125 I-.261 J-.282 E.00706
G1 X128.04 Y121.125 E.04255
; LINE_WIDTH: 0.444323
G1 X127.898 Y121.064 E.00504
; LINE_WIDTH: 0.511334
G1 X127.756 Y121.004 E.00589
G1 X127.495 Y120.346 E.02699
G1 X126.995 Y120.346 E.01911
G1 X127.302 Y121.139 E.03246
; LINE_WIDTH: 0.490318
G1 X127.417 Y121.502 E.01388
; LINE_WIDTH: 0.421514
G1 X127.532 Y121.865 E.01174
G1 X128.398 Y124.113 E.07431
G1 X129.035 Y124.12 E.01966
G1 X129.92 Y121.855 E.07501
; LINE_WIDTH: 0.44209
G1 X130.036 Y121.493 E.01236
; LINE_WIDTH: 0.50176
G3 X130.431 Y120.401 I15.795 J5.107 E.04341
G1 X129.684 Y121.419 F30000
; LINE_WIDTH: 0.41999
G1 F12000
G1 X129.418 Y121.502 E.00854
G1 X128.04 Y121.502 E.04236
G1 X127.763 Y121.416 E.00891
G1 X128.659 Y123.743 E.07661
G1 X128.79 Y123.743 E.004
G1 X129.662 Y121.475 E.07466
G1 X129.051 Y121.915 F30000
; LINE_WIDTH: 0.49155
G1 F12000
G1 X128.724 Y122.763 E.03323
G1 X128.397 Y121.915 E.03324
G1 X128.991 Y121.915 E.0217
G1 X126.307 Y120.025 F30000
; LINE_WIDTH: 0.498841
G1 F12000
G1 X125.731 Y120.025 E.02139
G1 X125.497 Y120.326 E.01418
; LINE_WIDTH: 0.480335
G1 X125.329 Y120.349 E.00603
; LINE_WIDTH: 0.420278
G1 X125.162 Y120.372 E.0052
G1 X124.683 Y120.24 E.01526
G2 X123.435 Y120.414 I-.316 J2.296 E.03925
G1 X123.078 Y120.651 E.01317
G2 X122.35 Y121.987 I1.335 J1.594 E.04789
G1 X122.36 Y122.514 E.0162
G1 X122.464 Y122.925 E.01306
G2 X123.272 Y123.912 I2.04 J-.846 E.0398
G1 X123.724 Y124.124 E.01532
G1 X124.217 Y124.216 E.01544
G1 X124.72 Y124.182 E.01549
G1 X125.176 Y124.031 E.01477
G1 X125.587 Y123.76 E.01514
G1 X125.944 Y123.376 E.01612
G2 X126.256 Y121.711 I-1.756 J-1.191 E.05361
G1 X126.12 Y121.323 E.01263
G1 X125.868 Y120.913 E.0148
; LINE_WIDTH: 0.439685
G1 X125.866 Y120.755 E.00512
; LINE_WIDTH: 0.494841
G1 X125.864 Y120.596 E.00583
G1 X126.27 Y120.072 E.02443
G1 X125.476 Y120.718 F30000
; LINE_WIDTH: 0.41999
G1 F12000
G1 X125.138 Y120.754 E.01044
G1 X124.619 Y120.611 E.01653
G1 X124.079 Y120.597 E.01659
G1 X123.605 Y120.751 E.01532
G1 X123.195 Y121.043 E.01547
G1 X122.896 Y121.472 E.01607
G1 X122.77 Y121.838 E.01191
G2 X122.778 Y122.631 I1.833 J.377 E.02455
G1 X122.98 Y123.108 E.01591
G1 X123.327 Y123.476 E.01554
G2 X124.239 Y123.837 I1.088 J-1.416 E.03053
G1 X124.647 Y123.809 E.01254
G1 X125.01 Y123.689 E.01176
G1 X125.342 Y123.47 E.01221
G1 X125.639 Y123.151 E.01338
G1 X125.846 Y122.717 E.01479
G1 X125.918 Y122.321 E.01236
G1 X125.887 Y121.797 E.01615
G2 X125.519 Y121.056 I-3.176 J1.116 E.02546
G1 X125.483 Y120.778 E.00864
G1 X125.156 Y121.123 F30000
G1 F12000
G3 X124.434 Y120.962 I.663 J-4.671 E.02276
G1 X123.992 Y121.007 E.01365
G1 X123.671 Y121.14 E.01066
G1 X123.359 Y121.442 E.01335
G1 X123.175 Y121.757 E.01121
G1 X123.109 Y122.213 E.01416
G1 X123.144 Y122.538 E.01006
G1 X123.298 Y122.901 E.01211
G1 X123.563 Y123.181 E.01186
G1 X123.957 Y123.4 E.01383
G1 X124.262 Y123.457 E.00953
G1 X124.705 Y123.392 E.01378
G1 X124.98 Y123.257 E.00943
G1 X125.333 Y122.926 E.01484
G1 X125.491 Y122.59 E.01143
G1 X125.552 Y122.167 E.01311
G1 X125.477 Y121.768 E.01248
G1 X125.167 Y121.182 E.02038
G1 X124.884 Y121.466 F30000
G1 F12000
G1 X124.408 Y121.34 E.01515
G1 X124.011 Y121.391 E.0123
G1 X123.735 Y121.576 E.01019
G1 X123.533 Y121.884 E.01133
G1 X123.487 Y122.277 E.01216
G1 X123.53 Y122.525 E.00774
G1 X123.726 Y122.829 E.01111
G1 X124.073 Y123.038 E.01246
G1 X124.41 Y123.069 E.01038
G1 X124.678 Y123.004 E.0085
G1 X124.973 Y122.759 E.01179
G1 X125.103 Y122.568 E.00711
G1 X125.173 Y122.175 E.01226
G1 X125.094 Y121.815 E.01131
G1 X124.915 Y121.517 E.01069
G1 X124.63 Y121.784 F30000
G1 F12000
G1 X124.328 Y121.72 E.0095
G1 X124.086 Y121.775 E.00763
G1 X123.909 Y121.974 E.00818
G1 X123.864 Y122.253 E.00866
G1 X123.933 Y122.487 E.00752
G1 X124.127 Y122.647 E.00773
G1 X124.367 Y122.694 E.00749
G1 X124.565 Y122.627 E.00643
G1 X124.755 Y122.417 E.0087
G1 X124.786 Y122.112 E.00943
G2 X124.662 Y121.835 I-.939 J.252 E.00936
G1 X122.443 Y121.056 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X122.015 Y120.628 E.02012
G1 X121.853 Y121.049 E.01497
G1 X122.113 Y121.309 E.01222
G1 X121.985 Y121.764 E.01568
G1 X121.691 Y121.47 E.01381
G1 X121.529 Y121.891 E.01497
G1 X122.148 Y122.511 E.02907
M73 P78 R2
G1 X121.655 Y120.345 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.509332
G1 F12000
G1 X121.154 Y120.345 E.01904
G1 X120.92 Y120.962 E.02509
; LINE_WIDTH: 0.486608
G1 X120.824 Y121.027 E.00417
; LINE_WIDTH: 0.421694
G3 X120.621 Y121.125 I-.26 J-.282 E.00706
G1 X119.242 Y121.125 E.04255
; LINE_WIDTH: 0.444323
G1 X119.1 Y121.064 E.00504
; LINE_WIDTH: 0.511328
G1 X118.959 Y121.004 E.00589
G1 X118.698 Y120.346 E.02699
G1 X118.197 Y120.346 E.01911
G1 X118.504 Y121.139 E.03246
; LINE_WIDTH: 0.490318
G1 X118.619 Y121.502 E.01388
; LINE_WIDTH: 0.421514
G1 X118.734 Y121.865 E.01174
G1 X119.6 Y124.113 E.07431
G1 X120.238 Y124.12 E.01966
G1 X121.122 Y121.855 E.07501
; LINE_WIDTH: 0.44209
G1 X121.238 Y121.493 E.01236
; LINE_WIDTH: 0.50176
G3 X121.634 Y120.401 I15.805 J5.111 E.04341
G1 X120.886 Y121.419 F30000
; LINE_WIDTH: 0.41999
G1 F12000
G1 X120.621 Y121.502 E.00854
G1 X119.242 Y121.502 E.04236
G1 X118.965 Y121.416 E.00891
G1 X119.862 Y123.743 E.07661
G1 X119.992 Y123.743 E.004
G1 X120.865 Y121.475 E.07466
G1 X120.253 Y121.915 F30000
; LINE_WIDTH: 0.49156
G1 F12000
G1 X119.927 Y122.763 E.03324
G1 X119.6 Y121.915 E.03325
G1 X120.193 Y121.915 E.0217
G1 X119.194 Y123.639 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X117.84 Y122.285 E.06349
G1 X117.475 Y121.336 E.03374
G1 X118.508 Y122.37 E.04851
G1 X118.143 Y121.421 E.03374
G1 X117.109 Y120.387 E.04851
G1 X116.743 Y119.438 E.03374
G1 X117.777 Y120.472 E.04851
G1 X117.697 Y120.266 E.00733
G1 X117.883 Y119.995 E.01089
G1 X117.204 Y119.316 E.03187
G1 X117.787 Y119.316 E.01935
G1 X118.38 Y119.909 E.02781
G1 X118.842 Y119.909 E.01535
G1 X119.052 Y120.051 E.0084
G1 X119.322 Y120.733 E.02432
G1 X119.787 Y120.733 E.01543
G1 X118.37 Y119.316 E.06647
G1 X118.953 Y119.316 E.01935
G1 X120.37 Y120.733 E.06647
G1 X120.54 Y120.733 E.00565
G1 X120.654 Y120.433 E.01062
G1 X120.156 Y119.935 E.02337
G1 X120.209 Y119.935 E.00176
G1 X120.354 Y119.55 E.01363
G1 X120.833 Y120.029 E.02248
G3 X121.296 Y119.909 I.319 J.274 E.01686
G1 X120.703 Y119.316 E.02781
G1 X121.286 Y119.316 E.01934
G1 X122.562 Y120.592 E.05987
G1 X122.861 Y120.307 E.01368
G1 X121.869 Y119.316 E.04652
G1 X122.452 Y119.316 E.01935
G1 X123.212 Y120.075 E.03563
G1 X123.626 Y119.906 E.01483
G1 X123.035 Y119.316 E.02769
G2 X123.603 Y119.3 I.243 J-1.473 E.01895
G1 X124.12 Y119.817 E.02425
G1 X124.723 Y119.837 E.02003
G1 X124.109 Y119.223 E.02882
G3 X124.706 Y119.237 I.19 J4.539 E.01984
G1 X125.32 Y119.851 E.02879
G3 X125.646 Y119.593 I.471 J.261 E.01414
G1 X125.153 Y119.1 E.02314
G1 X125.23 Y119.001 E.00418
G1 X125.636 Y119.001 E.01348
G1 X126.229 Y119.593 E.02781
G1 X126.604 Y119.593 E.01242
G1 X126.758 Y119.909 E.01164
G1 X127.127 Y119.909 E.01225
G1 X126.219 Y119.001 E.04259
G1 X126.803 Y119.001 E.01935
G1 X128.535 Y120.733 E.08125
G1 X129.118 Y120.733 E.01934
G1 X127.386 Y119.001 E.08125
G1 X127.969 Y119.001 E.01935
G1 X128.244 Y119.275 E.01288
G1 X128.227 Y119.394 E.00398
G1 X128.442 Y119.939 E.01943
G1 X128.904 Y119.935 E.0153
G1 X129.438 Y120.469 E.02505
G1 X129.601 Y120.05 E.01494
G1 X129.138 Y119.586 E.02174
G1 X129.241 Y119.316 E.0096
G1 X129.45 Y119.316 E.00696
G1 X130.226 Y120.092 E.0364
G1 X128.631 Y124.328 F30000
G1 F15476.087
G1 X129.407 Y125.104 E.0364
G2 X129.94 Y125.053 I.177 J-.96 E.01796
G1 X129.302 Y124.416 E.0299
G1 X129.373 Y124.367 E.00287
G1 X129.502 Y124.033 E.01188
G1 X130.574 Y125.104 E.05028
G1 X131.157 Y125.104 E.01934
G1 X129.664 Y123.612 E.07003
G1 X129.826 Y123.19 E.01497
G1 X131.923 Y125.288 E.09838
G1 X134.654 Y124.52 F30000
G1 F15476.087
G1 X135.422 Y125.288 E.03602
G1 X136.213 Y124.328 F30000
G1 F15476.087
G1 X136.989 Y125.104 E.0364
G1 X137.076 Y125.104 E.0029
G1 X137.214 Y124.746 E.01272
G1 X136.755 Y124.288 E.02152
G1 X136.917 Y123.867 E.01497
G1 X137.376 Y124.325 E.02152
G1 X137.538 Y123.904 E.01497
G1 X137.079 Y123.446 E.02152
G1 X137.241 Y123.024 E.01497
G1 X137.7 Y123.483 E.02152
G1 X137.862 Y123.062 E.01497
G1 X137.403 Y122.603 E.02152
G1 X137.565 Y122.182 E.01497
G1 X138.024 Y122.641 E.02152
G1 X138.186 Y122.22 E.01497
G1 X137.727 Y121.761 E.02152
G1 X137.889 Y121.34 E.01497
G1 X138.348 Y121.798 E.02152
G1 X138.51 Y121.377 E.01497
G1 X138.052 Y120.919 E.02152
G1 X138.214 Y120.498 E.01497
G1 X138.814 Y121.098 E.02817
G1 X137.804 Y120.345 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.509335
G1 F12000
G1 X137.303 Y120.345 E.01904
G1 X137.069 Y120.962 E.02509
; LINE_WIDTH: 0.486615
G1 X136.973 Y121.027 E.00417
; LINE_WIDTH: 0.421694
G3 X136.77 Y121.125 I-.261 J-.282 E.00706
G1 X135.391 Y121.125 E.04255
; LINE_WIDTH: 0.444325
G1 X135.249 Y121.064 E.00504
; LINE_WIDTH: 0.51133
G1 X135.107 Y121.004 E.00589
G1 X134.847 Y120.346 E.02699
G1 X134.346 Y120.346 E.01911
G1 X134.653 Y121.139 E.03246
; LINE_WIDTH: 0.490318
G1 X134.768 Y121.502 E.01388
; LINE_WIDTH: 0.421514
G1 X134.883 Y121.865 E.01174
G1 X135.749 Y124.113 E.07431
G1 X136.387 Y124.12 E.01966
G1 X137.271 Y121.855 E.07501
; LINE_WIDTH: 0.44209
G1 X137.387 Y121.493 E.01236
; LINE_WIDTH: 0.50176
G3 X137.782 Y120.401 I15.795 J5.107 E.04341
G1 X137.035 Y121.419 F30000
; LINE_WIDTH: 0.41999
G1 F12000
G1 X136.77 Y121.502 E.00854
G1 X135.391 Y121.502 E.04236
G1 X135.114 Y121.416 E.00891
G1 X136.011 Y123.743 E.07661
G1 X136.141 Y123.743 E.004
G1 X137.013 Y121.475 E.07466
G1 X136.402 Y121.915 F30000
; LINE_WIDTH: 0.49156
G1 F12000
G1 X136.076 Y122.763 E.03324
G1 X135.748 Y121.915 E.03324
G1 X136.342 Y121.915 E.0217
G1 X133.632 Y120.345 F30000
; LINE_WIDTH: 0.506931
G1 F12000
G1 X133.105 Y120.345 E.01994
G1 X132.596 Y121.302 E.04099
G1 X132.504 Y121.375 E.00444
; LINE_WIDTH: 0.45911
G1 X132.425 Y121.375 E.00269
; LINE_WIDTH: 0.423162
G3 X132.106 Y121.316 I-.043 J-.659 E.01017
; LINE_WIDTH: 0.437509
G1 X132.042 Y121.269 E.00255
; LINE_WIDTH: 0.472545
G1 X131.978 Y121.222 E.00278
; LINE_WIDTH: 0.521442
G1 X131.914 Y121.175 E.0031
G3 X131.912 Y120.351 I133.618 J-.704 E.03211
G1 X131.433 Y120.351 E.01866
G1 X131.433 Y121.133 E.03048
; LINE_WIDTH: 0.504549
G1 X131.416 Y121.382 E.0094
; LINE_WIDTH: 0.470725
G1 X131.4 Y121.632 E.00871
; LINE_WIDTH: 0.420624
G1 X131.383 Y121.881 E.00769
G1 X131.383 Y124.108 E.06855
G1 X132.262 Y124.116 E.02706
G1 X132.806 Y124.065 E.01684
G1 X133.134 Y123.94 E.01078
G2 X133.489 Y123.513 I-.498 J-.776 E.01737
G1 X133.566 Y123.074 E.01373
G1 X133.525 Y122.727 E.01075
G1 X133.401 Y122.459 E.00908
G2 X133.017 Y122.124 I-1.195 J.985 E.01575
G1 X132.913 Y121.901 E.0076
; LINE_WIDTH: 0.43303
G1 X132.909 Y121.825 E.00241
; LINE_WIDTH: 0.45911
G1 X132.905 Y121.75 E.00257
; LINE_WIDTH: 0.494114
G3 X133.604 Y120.398 I45.191 J22.505 E.05595
G1 X132.564 Y121.713 F30000
; LINE_WIDTH: 0.41999
G1 F12000
G1 X132.424 Y121.757 E.00451
G1 X132.014 Y121.682 E.0128
G1 X131.76 Y121.408 E.01148
G1 X131.76 Y123.741 E.07167
G2 X132.793 Y123.666 I.249 J-3.733 E.03195
G1 X132.994 Y123.562 E.00695
G1 X133.138 Y123.365 E.00751
G1 X133.188 Y123.04 E.01008
G1 X133.134 Y122.734 E.00956
G2 X132.795 Y122.429 I-.961 J.726 E.01407
G1 X132.583 Y122.123 E.01145
G1 X132.529 Y121.855 E.00839
G1 X132.55 Y121.771 E.00266
G1 X132.199 Y122.295 F30000
; LINE_WIDTH: 0.54358
G1 F12000
G1 X132.537 Y122.784 E.02426
G1 X132.732 Y122.926 E.00981
G1 X132.744 Y123.134 E.0085
G1 X132.677 Y123.241 E.00516
G1 X132.199 Y123.301 E.01968
G1 X132.199 Y122.355 E.03856
G1 X129.007 Y125.288 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X126.61 Y122.89 E.11248
G1 X126.446 Y123.309 E.01493
G1 X128.424 Y125.288 E.09282
G1 X127.678 Y114.488 F30000
G1 F15476.087
G2 X128.18 Y114.845 I.786 J-.574 E.02079
G1 X128.306 Y114.538 E.01103
G1 X127.858 Y114.089 E.02105
G1 X127.859 Y113.511 E.01916
G1 X128.475 Y114.127 E.0289
G1 X128.644 Y113.717 E.01472
G1 X127.235 Y112.308 E.06611
G1 X127.409 Y112.035 E.01075
G1 X127.293 Y111.787 E.00907
G1 X128.522 Y113.016 E.05765
G1 X128.317 Y112.578 E.01603
G1 X128.452 Y112.367 E.00831
G1 X127.554 Y111.469 E.04212
G1 X128.133 Y111.469 E.01921
G1 X129.044 Y112.38 E.04275
G1 X127.539 Y113.192 F30000
G1 F15476.087
G1 X126.764 Y112.416 E.0364
G1 X126.185 Y112.416 E.01921
G1 X126.861 Y113.092 E.03172
G2 X126.703 Y113.464 I.107 J.265 E.0149
G1 X126.616 Y113.365 E.00439
G3 X125.549 Y112.36 I4.762 J-6.119 E.04869
G2 X125.024 Y112.413 I.272 J5.311 E.01754
G1 X125.563 Y112.953 E.02531
G1 X125.437 Y112.954 E.00417
G2 X125.052 Y113.021 I.097 J1.703 E.01299
G1 X124.447 Y112.416 E.02839
G1 X123.868 Y112.416 E.01921
G1 X124.657 Y113.213 E.03721
G2 X124.364 Y113.491 I.956 J1.299 E.01341
G1 X123.289 Y112.416 E.05044
G1 X122.71 Y112.416 E.01921
G1 X123.303 Y113.009 E.02781
G1 X123.216 Y113.009 E.00288
G1 X122.975 Y113.26 E.01155
G1 X122.131 Y112.416 E.0396
G1 X121.552 Y112.416 E.01921
G1 X122.145 Y113.009 E.02781
G2 X121.765 Y113.208 I-.09 J.29 E.0158
G1 X120.973 Y112.416 E.03715
G3 X120.347 Y112.369 I-.075 J-3.212 E.02084
G1 X120.987 Y113.009 E.02999
G2 X120.701 Y113.077 I-.082 J.289 E.01018
G3 X119.792 Y112.393 I.565 J-1.696 E.03839
G2 X119.356 Y112.536 I.363 J1.842 E.01526
G1 X119.812 Y112.996 E.02148
G2 X119.422 Y113.181 I.38 J1.31 E.01439
G1 X118.953 Y112.712 E.022
G3 X118.291 Y112.483 I.766 J-3.28 E.02326
G1 X118.109 Y112.447 E.00618
G1 X119.122 Y113.46 E.04754
G2 X118.936 Y113.758 I1.172 J.939 E.01167
G1 X118.918 Y113.712 E.00163
G2 X118.14 Y113.057 I-1.042 J.448 E.03499
G1 X117.5 Y112.418 E.03
G1 X116.92 Y112.416 E.01926
G1 X117.514 Y113.01 E.02789
G1 X116.934 Y113.009 E.01926
G1 X116.339 Y112.414 E.02789
G1 X115.943 Y112.413 E.01313
G1 X115.943 Y112.597 E.00611
G1 X116.566 Y113.22 E.0292
G1 X116.536 Y113.769 E.01825
G1 X115.943 Y113.177 E.02781
G1 X115.943 Y113.756 E.01921
G1 X116.536 Y114.348 E.02781
G1 X116.536 Y114.927 E.01921
G1 X115.943 Y114.335 E.02781
G1 X115.943 Y114.914 E.01921
G1 X116.536 Y115.506 E.02781
G1 X116.536 Y116.086 E.01921
G1 X115.943 Y115.493 E.02781
G1 X115.943 Y116.072 E.01921
G1 X117.076 Y117.204 E.05313
G2 X117.644 Y117.193 I.16 J-6.576 E.01886
G1 X117.062 Y116.611 E.02731
G1 X117.63 Y116.601 E.01886
G1 X118.15 Y117.12 E.02437
G2 X118.559 Y116.951 I-.483 J-1.748 E.01472
G1 X118.115 Y116.506 E.02086
G1 X118.214 Y116.464 E.00357
G2 X118.473 Y116.285 I-.499 J-.998 E.01048
G1 X118.892 Y116.704 E.01968
G3 X119.171 Y116.405 I10.03 J9.067 E.01359
G1 X118.714 Y115.948 E.02144
G2 X118.794 Y115.448 I-1.022 J-.419 E.01693
G1 X119.795 Y116.449 E.04696
G2 X120.388 Y116.463 I.341 J-1.861 E.01977
G1 X118.663 Y114.738 E.08093
G1 X118.797 Y114.274 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5086
G1 F12000
G1 X118.979 Y114.291 E.00695
G1 X118.797 Y114.274 F30000
; LINE_WIDTH: 0.484335
G1 F12000
G1 X118.656 Y114.184 E.00601
; LINE_WIDTH: 0.421752
G1 X118.516 Y113.792 E.01285
G2 X118.142 Y113.47 I-.64 J.364 E.01554
G1 X117.744 Y113.405 E.01247
G1 X116.939 Y113.401 E.02483
G2 X116.928 Y116.208 I101.689 J1.812 E.08666
G2 X117.887 Y116.166 I.309 J-3.918 E.02971
G1 X118.168 Y116.028 E.00967
G2 X118.388 Y115.403 I-.453 J-.511 E.02133
G1 X118.238 Y115.049 E.01188
G1 X118.311 Y114.793 E.00821
G2 X118.643 Y114.341 I-1.038 J-1.11 E.01742
; LINE_WIDTH: 0.484335
G1 X118.742 Y114.298 E.00386
G1 X121.632 Y115.258 F30000
; LINE_WIDTH: 0.494473
G1 F12000
G1 X121.495 Y115.168 E.00606
; LINE_WIDTH: 0.42206
G1 X121.357 Y115.077 E.00509
G1 X121.304 Y114.946 E.00438
G1 X121.304 Y113.412 E.04739
G1 X120.941 Y113.401 E.0112
G1 X120.813 Y113.473 E.00455
G3 X120.299 Y113.373 I-.066 J-1.031 E.01635
G1 X120.143 Y113.347 E.0049
G1 X119.829 Y113.406 E.00988
G1 X119.587 Y113.549 E.00867
G1 X119.376 Y113.777 E.00961
G1 X119.191 Y114.182 E.01376
; LINE_WIDTH: 0.464988
G1 X119.115 Y114.24 E.00328
; LINE_WIDTH: 0.510063
G1 X119.039 Y114.297 E.00363
; LINE_WIDTH: 0.513832
G1 X119.085 Y114.361 E.00304
; LINE_WIDTH: 0.476295
G1 X119.132 Y114.425 E.0028
; LINE_WIDTH: 0.420523
G1 X119.178 Y114.49 E.00244
G1 X119.332 Y115.006 E.01657
G2 X120.011 Y115.485 I.887 J-.536 E.02634
G1 X120.297 Y115.48 E.00879
G1 X120.624 Y115.373 E.01058
G1 X120.888 Y115.392 E.00817
G1 X120.972 Y115.439 E.00294
G1 X121.292 Y115.439 E.00987
; LINE_WIDTH: 0.43654
G1 X121.397 Y115.357 E.00426
; LINE_WIDTH: 0.46964
G1 X121.501 Y115.275 E.00461
; LINE_WIDTH: 0.502745
G1 X121.573 Y115.266 E.0027
G1 X124.043 Y115.181 F30000
; LINE_WIDTH: 0.54852
G1 F12000
G1 X123.984 Y115.2 E.00254
; LINE_WIDTH: 0.608067
G1 F11147.553
G1 X123.926 Y115.22 E.00284
G1 X123.755 Y115.088 E.00992
; LINE_WIDTH: 0.588528
G1 F11546.762
G1 X123.752 Y115.031 E.00255
; LINE_WIDTH: 0.539903
G1 F12000
G1 X123.749 Y114.973 E.00232
; LINE_WIDTH: 0.491278
G1 X123.745 Y114.916 E.0021
; LINE_WIDTH: 0.419068
G1 X123.742 Y113.412 E.04611
G1 X123.366 Y113.412 E.01151
G1 X123.366 Y114.875 E.04486
; LINE_WIDTH: 0.443895
G1 X123.363 Y114.928 E.00174
; LINE_WIDTH: 0.492165
G1 X123.359 Y114.982 E.00195
; LINE_WIDTH: 0.540435
G1 X123.356 Y115.035 E.00216
; LINE_WIDTH: 0.592618
G1 F11460.855
G1 X123.352 Y115.088 E.00239
G1 X123.275 Y115.14 E.0042
; LINE_WIDTH: 0.552342
G1 F12000
G1 X123.148 Y115.135 E.00524
; LINE_WIDTH: 0.503344
G1 X123.022 Y115.13 E.00474
; LINE_WIDTH: 0.454347
G1 X122.896 Y115.125 E.00423
; LINE_WIDTH: 0.405349
G1 X122.77 Y115.12 E.00373
; LINE_WIDTH: 0.403243
G1 X122.724 Y115.124 E.00135
; LINE_WIDTH: 0.448028
G1 X122.678 Y115.127 E.00151
; LINE_WIDTH: 0.492813
G1 X122.633 Y115.131 E.00168
; LINE_WIDTH: 0.537598
G1 X122.587 Y115.134 E.00185
; LINE_WIDTH: 0.566905
G1 X122.489 Y115.046 E.0056
; LINE_WIDTH: 0.554384
G1 X122.489 Y115 E.00196
; LINE_WIDTH: 0.515512
G1 X122.489 Y114.953 E.00181
; LINE_WIDTH: 0.476639
G1 X122.489 Y114.906 E.00166
; LINE_WIDTH: 0.418918
G1 X122.489 Y113.412 E.04578
G1 X122.114 Y113.412 E.0115
G1 X122.114 Y114.875 E.04484
; LINE_WIDTH: 0.443895
G1 X122.111 Y114.928 E.00174
; LINE_WIDTH: 0.492165
G1 X122.107 Y114.982 E.00195
; LINE_WIDTH: 0.540435
G1 X122.104 Y115.035 E.00216
; LINE_WIDTH: 0.585564
G1 F11609.837
G1 X122.1 Y115.088 E.00236
G1 X121.822 Y115.246 E.01414
; LINE_WIDTH: 0.53753
G1 F12000
G1 X121.68 Y115.264 E.00576
; LINE_WIDTH: 0.541575
G1 X121.858 Y115.345 E.00792
; LINE_WIDTH: 0.596235
G1 F11385.934
G3 X122.124 Y115.523 I-.075 J.4 E.01482
; LINE_WIDTH: 0.578062
G1 F11772.593
G1 X122.121 Y115.659 E.00596
; LINE_WIDTH: 0.532424
G1 F12000
G1 X122.119 Y115.796 E.00545
; LINE_WIDTH: 0.486787
G1 X122.116 Y115.933 E.00495
; LINE_WIDTH: 0.420935
G2 X122.134 Y116.257 I1.295 J.091 E.01004
G1 X122.489 Y116.237 E.01096
G1 X122.489 Y115.72 E.01593
; LINE_WIDTH: 0.442644
G1 X122.493 Y115.663 E.00187
; LINE_WIDTH: 0.491272
G1 X122.496 Y115.605 E.0021
; LINE_WIDTH: 0.539899
G1 X122.5 Y115.548 E.00232
; LINE_WIDTH: 0.574141
G1 F11859.483
G1 X122.503 Y115.491 E.00248
G1 X122.587 Y115.444 E.00414
G1 X123.275 Y115.438 E.02977
G1 X123.376 Y115.523 E.0057
; LINE_WIDTH: 0.578063
G1 F11772.566
G1 X123.373 Y115.659 E.00596
; LINE_WIDTH: 0.532428
G1 F12000
G1 X123.371 Y115.796 E.00545
; LINE_WIDTH: 0.486793
G1 X123.369 Y115.933 E.00495
; LINE_WIDTH: 0.420944
G2 X123.387 Y116.257 I1.296 J.091 E.01004
G1 X123.742 Y116.237 E.01096
G1 X123.742 Y115.72 E.01593
; LINE_WIDTH: 0.442653
G1 X123.745 Y115.663 E.00187
; LINE_WIDTH: 0.491278
G1 X123.749 Y115.605 E.0021
; LINE_WIDTH: 0.539903
G1 X123.752 Y115.548 E.00232
; LINE_WIDTH: 0.608516
G1 F11138.705
G1 X123.755 Y115.491 E.00264
G1 X123.926 Y115.359 E.00993
G1 X123.975 Y115.35 E.0023
; LINE_WIDTH: 0.5914
G1 F11486.29
G1 X123.996 Y115.292 E.00276
; LINE_WIDTH: 0.54852
G1 F12000
G1 X124.018 Y115.234 E.00255
G1 X120.942 Y115.018 F30000
; LINE_WIDTH: 0.41999
G1 F12000
G3 X120.927 Y113.823 I23.407 J-.894 E.03671
G1 X120.755 Y113.861 E.00541
G3 X120.147 Y113.73 I.572 J-4.137 E.01912
G1 X119.889 Y113.808 E.00828
G1 X119.693 Y113.99 E.00821
G1 X119.521 Y114.34 E.01198
G1 X119.664 Y114.818 E.01533
G1 X119.857 Y115.021 E.00863
G1 X120.062 Y115.107 E.00684
G2 X120.598 Y114.997 I-.222 J-2.424 E.01685
G1 X120.886 Y114.996 E.00884
G1 X120.507 Y114.589 F30000
; LINE_WIDTH: 0.50494
G1 F12000
G1 X120.507 Y114.248 E.01284
G1 X120.231 Y114.176 E.01076
G1 X120.093 Y114.175 E.00519
G1 X119.97 Y114.388 E.00924
G1 X120.046 Y114.625 E.00939
G1 X120.14 Y114.686 E.00422
G1 X120.449 Y114.604 E.01205
G1 X118.275 Y114.231 F30000
; LINE_WIDTH: 0.41999
G1 F12000
G1 X118.136 Y113.925 E.01034
G1 X118.006 Y113.827 E.005
G2 X117.305 Y113.78 I-.495 J2.138 E.02168
; LINE_WIDTH: 0.437079
G1 X117.322 Y114.122 E.011
; LINE_WIDTH: 0.471255
G1 X117.339 Y114.464 E.01195
; LINE_WIDTH: 0.505432
G1 X117.356 Y114.806 E.0129
; LINE_WIDTH: 0.546575
G3 X117.377 Y115.768 I-57.55 J1.716 E.03951
G1 X117.796 Y115.711 E.01734
G1 X117.924 Y115.624 E.00637
G1 X117.927 Y115.482 E.00585
G1 X117.823 Y115.155 E.01409
G1 X117.834 Y114.84 E.01293
; LINE_WIDTH: 0.505432
G1 X117.945 Y114.692 E.00696
; LINE_WIDTH: 0.471255
G1 X118.056 Y114.545 E.00645
; LINE_WIDTH: 0.429772
G2 X118.242 Y114.282 I-1.695 J-1.396 E.01017
G1 X117.801 Y114.217 F30000
; LINE_WIDTH: 0.53474
G1 F12000
G3 X117.71 Y114.164 I-.058 J-.005 E.00947
G1 X130.432 Y115.435 F30000
; LINE_WIDTH: 0.405053
G1 F12000
G2 X129.184 Y112.684 I-207.129 J92.296 E.08915
G1 X129.117 Y112.579 E.00365
G1 X128.761 Y112.593 E.01053
G1 X129.108 Y113.37 E.02511
G1 X129.121 Y113.583 E.00629
G3 X128.468 Y115.147 I-192.472 J-79.48 E.05003
; LINE_WIDTH: 0.388153
G1 X128.337 Y115.183 E.0038
; LINE_WIDTH: 0.346931
G1 X128.207 Y115.219 E.00335
G1 X128.014 Y115.179 E.00488
; LINE_WIDTH: 0.398818
G1 X127.808 Y115.125 E.00618
; LINE_WIDTH: 0.434653
G1 X127.602 Y115.071 E.00681
; LINE_WIDTH: 0.45981
G1 X127.531 Y114.962 E.00441
; LINE_WIDTH: 0.479226
G1 X127.423 Y114.503 E.01677
G1 X127.47 Y114.126 E.0135
; LINE_WIDTH: 0.417955
G2 X127.447 Y113.399 I-3.201 J-.265 E.02226
G1 X127.094 Y113.42 E.01082
G1 X127.094 Y114.126 E.02158
; LINE_WIDTH: 0.441414
G1 X127.072 Y114.202 E.00255
; LINE_WIDTH: 0.48768
G1 X127.05 Y114.277 E.00285
; LINE_WIDTH: 0.552357
G1 X127.028 Y114.353 E.00327
G1 X126.741 Y114.461 E.01273
; LINE_WIDTH: 0.534232
G1 X126.732 Y114.439 E.00096
; LINE_WIDTH: 0.488535
G1 X126.724 Y114.417 E.00087
; LINE_WIDTH: 0.420123
G1 X126.715 Y114.394 E.00074
G1 X126.317 Y114.287 E.01268
G1 X126.218 Y113.954 E.01066
G1 X126.23 Y113.835 E.00366
G1 X126.378 Y113.689 E.0064
G1 X126.064 Y113.459 E.01197
G1 X125.697 Y113.363 E.01165
G1 X125.243 Y113.387 E.014
G1 X124.944 Y113.509 E.00992
G1 X124.694 Y113.727 E.01019
G1 X124.541 Y113.98 E.00908
G1 X124.464 Y114.31 E.01042
G1 X124.508 Y114.814 E.01558
; LINE_WIDTH: 0.417112
G3 X124.34 Y115.041 I-.577 J-.251 E.00868
G1 X124.475 Y114.983 E.00449
G1 X124.629 Y115.042 E.00505
G1 X124.914 Y115.322 E.01218
G1 X125.17 Y115.446 E.00867
G1 X125.6 Y115.481 E.01314
G1 X125.93 Y115.412 E.0103
G2 X126.378 Y115.07 I-.358 J-.931 E.0174
G1 X126.575 Y114.808 E.00999
G1 X126.692 Y114.787 E.00365
; LINE_WIDTH: 0.442839
G1 X126.704 Y114.766 E.00078
; LINE_WIDTH: 0.488535
G1 X126.715 Y114.745 E.00087
; LINE_WIDTH: 0.551571
G1 X126.727 Y114.724 E.00099
G1 X127.034 Y114.814 E.01327
; LINE_WIDTH: 0.535508
G1 X127.084 Y114.983 E.00709
; LINE_WIDTH: 0.499433
G3 X127.133 Y115.401 I-.687 J.293 E.01585
G1 X127.4 Y115.381 E.00996
; LINE_WIDTH: 0.476797
G1 X127.566 Y115.423 E.00603
; LINE_WIDTH: 0.43823
G1 X127.731 Y115.465 E.00549
; LINE_WIDTH: 0.399664
G1 X127.896 Y115.507 E.00496
; LINE_WIDTH: 0.370435
G2 X128.743 Y115.428 I-.016 J-4.755 E.02272
; LINE_WIDTH: 0.405841
G1 X129.109 Y114.552 E.02808
G1 X129.273 Y114.433 E.006
G1 X129.48 Y114.429 E.00613
G1 X129.646 Y114.544 E.00595
G1 X130.012 Y115.344 E.02603
G1 X130.079 Y115.449 E.00366
G1 X130.372 Y115.437 E.00868
G1 X129.413 Y114.038 F30000
; LINE_WIDTH: 0.45326
M73 P79 R2
G1 F12000
G3 X129.332 Y114.001 I-.049 J.001 E.00668
G1 X126.188 Y114.663 F30000
; LINE_WIDTH: 0.41999
G1 F12000
G1 X125.977 Y114.46 E.009
G1 X125.85 Y114.036 E.01359
G1 X125.861 Y113.789 E.00761
G1 X125.691 Y113.74 E.00542
G1 X125.343 Y113.751 E.01071
G1 X125.053 Y113.887 E.00982
G1 X124.887 Y114.129 E.00904
G1 X124.83 Y114.424 E.00924
G1 X124.894 Y114.774 E.0109
G1 X125.212 Y115.048 E.01291
G1 X125.493 Y115.114 E.00885
G1 X125.847 Y115.038 E.01115
G1 X126.062 Y114.864 E.00847
G1 X126.156 Y114.713 E.00547
G1 X125.696 Y114.702 F30000
; LINE_WIDTH: 0.399497
G1 F12000
G3 X125.476 Y114.102 I1.864 J-1.026 E.01864
G1 X125.296 Y114.165 E.00553
G1 X125.21 Y114.321 E.00515
G1 X125.227 Y114.585 E.0077
G1 X125.418 Y114.73 E.00695
G1 X125.641 Y114.724 E.00648
G1 X124.298 Y114.004 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X123.95 Y113.655 E.01634
G1 X123.158 Y114.022 F30000
G1 F15476.087
G1 X122.881 Y113.744 E.01303
G1 X122.881 Y114.323 E.01921
G1 X123.158 Y114.601 E.01303
G1 X121.906 Y114.507 F30000
G1 F15476.087
G1 X121.696 Y114.297 E.00987
G1 X121.696 Y113.718 E.01921
G1 X121.906 Y113.928 E.00987
G1 X116.68 Y117.388 F30000
G1 F15476.087
G1 X115.76 Y116.468 E.04317
G1 X122.012 Y138.857 F30000
G1 F15476.087
G3 X118.874 Y135.138 I10.449 J-12 E.16205
G1 X122.965 Y139.229 E.1919
G2 X124.068 Y139.751 I3.299 J-5.54 E.04055
G1 X118.357 Y134.04 E.26789
G3 X118.03 Y133.132 I5.562 J-2.519 E.03206
G1 X124.978 Y140.081 E.32597
G2 X125.767 Y140.289 I2.037 J-6.129 E.02707
G1 X117.803 Y132.325 E.37359
G1 X117.594 Y131.535 E.02712
G1 X126.468 Y140.409 E.41631
G2 X127.127 Y140.487 I.742 J-3.425 E.02205
G1 X117.384 Y130.744 E.45706
G1 X117.174 Y129.954 E.02712
G1 X127.747 Y140.527 E.49598
G2 X128.318 Y140.517 I.235 J-3.008 E.01898
G1 X116.965 Y129.164 E.53261
G1 X116.755 Y128.373 E.02712
G1 X128.876 Y140.494 E.56862
G1 X129.391 Y140.429 E.01723
G1 X116.545 Y127.583 E.60262
G1 X116.336 Y126.792 E.02712
G1 X129.898 Y140.355 E.63624
G1 X130.372 Y140.248 E.01612
G1 X116.126 Y126.002 E.66832
G1 X115.917 Y125.212 E.02712
G1 X130.84 Y140.135 E.7001
G1 X131.278 Y139.992 E.01527
G1 X115.707 Y124.421 E.73047
G1 X115.497 Y123.631 E.02712
G1 X131.715 Y139.848 E.7608
G1 X132.119 Y139.672 E.01464
G1 X118.814 Y126.367 E.62419
G1 X119.395 Y126.367 E.01926
G1 X132.524 Y139.496 E.61592
G2 X132.904 Y139.296 I-.863 J-2.099 E.01428
G1 X119.975 Y126.367 E.60653
G1 X120.556 Y126.367 E.01926
G1 X133.278 Y139.089 E.59682
G2 X133.638 Y138.868 I-.981 J-2.004 E.01403
G1 X121.137 Y126.367 E.58646
G1 X121.686 Y126.335 E.01824
G1 X133.983 Y138.632 E.57689
G2 X134.324 Y138.393 I-1.088 J-1.918 E.01385
G1 X121.934 Y126.003 E.58125
G1 X122.021 Y125.776 E.00804
G2 X122.62 Y126.108 I2.768 J-4.296 E.02271
G1 X134.641 Y138.129 E.56394
G1 X134.958 Y137.865 E.01368
G1 X123.476 Y126.383 E.53865
G2 X124.133 Y126.459 I.904 J-4.918 E.02196
G1 X135.255 Y137.581 E.52175
G1 X135.544 Y137.289 E.01362
G1 X124.707 Y126.453 E.50836
G2 X125.209 Y126.374 I-.359 J-3.939 E.01687
G1 X135.826 Y136.99 E.49803
G1 X136.092 Y136.676 E.01367
G1 X125.663 Y126.247 E.48922
G2 X126.079 Y126.082 I-.39 J-1.585 E.01488
G1 X136.346 Y136.349 E.48166
G2 X136.588 Y136.011 I-3.889 J-3.037 E.01381
G1 X126.466 Y125.888 E.47487
G1 X126.633 Y125.782 E.00658
G1 X126.803 Y126.222 E.01565
G1 X127.013 Y126.367 E.00847
G1 X127.525 Y126.367 E.01697
G1 X136.819 Y135.66 E.43599
G1 X137.038 Y135.299 E.01403
G1 X128.106 Y126.367 E.41901
G1 X128.687 Y126.367 E.01926
G1 X137.241 Y134.921 E.40131
G2 X137.435 Y134.534 I-2.953 J-1.722 E.01436
G1 X129.267 Y126.367 E.38316
G1 X129.848 Y126.367 E.01926
G1 X137.613 Y134.132 E.36429
G2 X137.775 Y133.713 I-3.239 J-1.495 E.0149
G1 X130.429 Y126.367 E.34465
G1 X131.009 Y126.367 E.01926
G1 X137.925 Y133.283 E.32444
G1 X138.059 Y132.836 E.01548
G1 X131.59 Y126.367 E.30347
G1 X132.169 Y126.365 E.01921
G1 X138.183 Y132.378 E.2821
G1 X138.305 Y131.92 E.01575
G1 X132.725 Y126.34 E.26177
G2 X133.238 Y126.272 I-.261 J-3.962 E.01718
G1 X138.426 Y131.461 E.24341
G1 X138.548 Y131.002 E.01575
G1 X133.697 Y126.15 E.22759
G2 X134.065 Y125.997 I-2.738 J-7.111 E.01324
G1 X134.067 Y125.996 E.00007
G2 X134.494 Y126.367 I.434 J-.069 E.02037
G1 X138.67 Y130.543 E.19591
G1 X138.792 Y130.084 E.01575
G1 X135.075 Y126.367 E.17438
G1 X135.655 Y126.367 E.01926
G1 X138.914 Y129.625 E.15286
G1 X139.036 Y129.166 E.01575
G1 X136.236 Y126.367 E.13133
G1 X136.817 Y126.367 E.01926
G1 X139.158 Y128.707 E.1098
G1 X139.279 Y128.248 E.01575
G1 X137.398 Y126.367 E.08827
G1 X137.788 Y126.367 E.01295
G1 X137.901 Y126.289 E.00454
G1 X139.401 Y127.789 E.07038
G1 X139.523 Y127.331 E.01575
G1 X138.114 Y125.922 E.06609
G1 X138.276 Y125.502 E.01491
G1 X139.645 Y126.872 E.06424
M73 P79 R1
G1 X139.767 Y126.413 E.01575
G1 X138.437 Y125.083 E.06239
G1 X138.598 Y124.664 E.01491
G1 X139.889 Y125.954 E.06053
G1 X140.01 Y125.495 E.01575
G1 X138.76 Y124.244 E.05868
G1 X138.921 Y123.825 E.01491
G1 X140.132 Y125.036 E.05683
G1 X140.254 Y124.577 E.01575
G1 X139.082 Y123.405 E.05497
G1 X139.244 Y122.986 E.01491
G1 X140.376 Y124.118 E.05312
G1 X140.498 Y123.659 E.01575
G1 X139.405 Y122.567 E.05127
G1 X139.566 Y122.147 E.01491
G1 X140.62 Y123.201 E.04941
G1 X140.742 Y122.742 E.01575
G1 X139.728 Y121.728 E.04756
G1 X139.889 Y121.308 E.01491
G1 X140.863 Y122.283 E.0457
G1 X140.985 Y121.824 E.01575
G1 X140.051 Y120.889 E.04385
G1 X140.212 Y120.47 E.01491
G1 X141.107 Y121.365 E.042
G1 X141.229 Y120.906 E.01575
G1 X140.373 Y120.05 E.04014
G1 X140.535 Y119.631 E.01491
G1 X141.351 Y120.447 E.03829
G1 X141.473 Y119.988 E.01575
G1 X140.696 Y119.212 E.03644
G1 X140.857 Y118.792 E.01491
G1 X141.595 Y119.529 E.03458
G1 X141.716 Y119.07 E.01575
G1 X141.133 Y118.487 E.02736
G2 X141.319 Y118.092 I-.105 J-.29 E.01608
G1 X141.838 Y118.612 E.02436
G1 X141.96 Y118.153 E.01575
G1 X141.319 Y117.512 E.03007
G1 X141.319 Y116.931 E.01926
G1 X142.082 Y117.694 E.03579
G1 X142.204 Y117.235 E.01575
G1 X141.319 Y116.35 E.0415
G1 X141.319 Y115.769 E.01926
G1 X142.326 Y116.776 E.04722
G1 X142.447 Y116.317 E.01575
G1 X141.319 Y115.189 E.05294
G1 X141.319 Y114.608 E.01926
G1 X142.561 Y115.85 E.05825
G2 X142.633 Y115.341 I-4.936 J-.961 E.01704
G1 X141.319 Y114.027 E.06164
G1 X141.319 Y113.446 E.01926
G1 X142.62 Y114.747 E.06101
G2 X142.468 Y114.015 I-5.393 J.733 E.02481
G1 X141.319 Y112.866 E.05391
G1 X141.319 Y112.308 E.01851
G3 X142.404 Y113.37 I-8.209 J9.469 E.05039
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X141.319 Y112.308 E-.57683
G1 X141.319 Y112.79 E-.18317
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/10
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
G17
G3 Z1.4 I1.217 J0 P1  F30000
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
; OBJECT_ID: 1729
G1 X114.51 Y111.994
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X117.013 Y111.119 I2.494 J3.119 E.08966
G1 X139.083 Y111.122 E.7321
G3 X142.853 Y116.146 I-.092 J3.996 E.2397
G1 X138.413 Y132.867 E.5739
G3 X117.587 Y132.868 I-10.413 J-2.759 E.93752
G1 X113.147 Y116.146 E.57392
G3 X114.464 Y112.031 I3.857 J-1.033 E.15141
G1 X114.256 Y111.676 F30000
G1 F15476.087
G3 X117.008 Y110.712 I2.748 J3.437 E.0986
G1 X139.093 Y110.715 E.73259
G3 X143.248 Y116.246 I-.103 J4.403 E.26393
G1 X138.806 Y132.974 E.57414
G3 X117.194 Y132.975 I-10.806 J-2.866 E.97274
G1 X112.752 Y116.246 E.57417
G3 X114.209 Y111.714 I4.252 J-1.133 E.16686
G1 X114.009 Y111.37 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X114.011 Y111.369 E.00007
G3 X117.004 Y110.32 I2.993 J3.743 E.09931
G1 X139.102 Y110.323 E.67903
G3 X143.628 Y116.342 I-.113 J4.796 E.26608
G1 X139.184 Y133.078 E.53207
G3 X121.785 Y139.869 I-11.186 J-2.975 E.66777
M73 P80 R1
G3 X116.816 Y133.078 I6.22 J-9.764 E.26459
G1 X112.372 Y116.342 E.53209
G3 X113.504 Y111.839 I4.632 J-1.23 E.14893
G1 X113.965 Y111.41 E.01935
; WIPE_START
M204 S10000
G1 X114.011 Y111.369 E-.02344
G1 X114.58 Y110.977 E-.26256
G1 X114.989 Y110.763 E-.17549
G1 X115.636 Y110.519 E-.26274
G1 X115.727 Y110.496 E-.03577
; WIPE_END
G1 E-.04 F1800
G1 X115.196 Y111.747 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42055
G1 F15000
G1 X114.326 Y112.617 E.03785
G2 X113.586 Y113.803 I3.212 J2.829 E.04324
G1 X113.542 Y113.935 E.00425
G1 X115.827 Y111.65 E.09943
G3 X116.522 Y111.489 I1.014 J2.792 E.02202
G1 X113.38 Y114.631 E.13677
G2 X113.346 Y115.199 I4.639 J.56 E.01751
G1 X117.092 Y111.453 E.16304
G1 X117.626 Y111.453 E.01643
G1 X113.394 Y115.685 E.1842
G2 X113.49 Y116.123 I2.318 J-.283 E.0138
G1 X118.16 Y111.453 E.20323
G1 X118.694 Y111.453 E.01643
G1 X113.602 Y116.545 E.2216
G1 X113.714 Y116.967 E.01344
G1 X119.228 Y111.453 E.23997
G1 X119.762 Y111.453 E.01643
G1 X113.826 Y117.389 E.25833
G1 X113.938 Y117.811 E.01344
G1 X120.296 Y111.453 E.2767
G1 X120.83 Y111.453 E.01643
G1 X114.05 Y118.233 E.29507
G1 X114.162 Y118.655 E.01344
G1 X121.364 Y111.453 E.31343
G1 X121.898 Y111.453 E.01643
G1 X114.274 Y119.077 E.3318
G1 X114.386 Y119.499 E.01344
G1 X122.432 Y111.453 E.35017
G1 X122.966 Y111.453 E.01643
G1 X114.498 Y119.922 E.36853
G1 X114.61 Y120.344 E.01344
G1 X123.5 Y111.453 E.3869
G1 X124.034 Y111.453 E.01643
G1 X114.722 Y120.766 E.40527
G1 X114.834 Y121.188 E.01344
G1 X124.568 Y111.453 E.42363
G1 X125.102 Y111.453 E.01643
G1 X114.946 Y121.61 E.442
G1 X115.058 Y122.032 E.01344
G1 X125.636 Y111.453 E.46036
G1 X126.17 Y111.453 E.01643
G1 X115.17 Y122.454 E.47873
G1 X115.282 Y122.876 E.01344
G1 X126.704 Y111.454 E.4971
G1 X127.238 Y111.454 E.01643
G1 X115.394 Y123.298 E.51546
G1 X115.506 Y123.72 E.01344
G1 X127.772 Y111.454 E.53383
G1 X128.306 Y111.454 E.01643
G1 X115.617 Y124.143 E.5522
G1 X115.729 Y124.565 E.01344
G1 X128.84 Y111.454 E.57056
G1 X129.374 Y111.454 E.01643
G1 X115.841 Y124.987 E.58893
G1 X115.953 Y125.409 E.01344
G1 X129.908 Y111.454 E.6073
G1 X130.442 Y111.454 E.01643
G1 X116.065 Y125.831 E.62566
G1 X116.177 Y126.253 E.01344
G1 X130.976 Y111.454 E.64403
G1 X131.51 Y111.454 E.01643
G1 X116.289 Y126.675 E.6624
G1 X116.401 Y127.097 E.01344
G1 X132.044 Y111.454 E.68076
G1 X132.578 Y111.454 E.01643
G1 X116.513 Y127.519 E.69913
G1 X116.625 Y127.941 E.01344
G1 X133.112 Y111.454 E.7175
G1 X133.646 Y111.454 E.01643
G1 X116.737 Y128.364 E.73586
G1 X116.849 Y128.786 E.01344
G1 X134.18 Y111.454 E.75423
G1 X134.714 Y111.454 E.01643
G1 X116.961 Y129.208 E.7726
G1 X117.073 Y129.63 E.01344
G1 X135.248 Y111.454 E.79096
G1 X135.782 Y111.454 E.01643
G1 X117.185 Y130.052 E.80933
G1 X117.297 Y130.474 E.01344
G1 X136.316 Y111.455 E.8277
G1 X136.85 Y111.455 E.01643
G1 X117.409 Y130.896 E.84606
G1 X117.521 Y131.318 E.01344
G1 X137.384 Y111.455 E.86443
G1 X137.918 Y111.455 E.01643
G1 X117.633 Y131.74 E.88279
G1 X117.745 Y132.162 E.01344
G1 X138.452 Y111.455 E.90116
G1 X138.986 Y111.455 E.01643
G1 X117.857 Y132.585 E.91953
G2 X117.975 Y133.001 I6.603 J-1.648 E.01331
G1 X139.487 Y111.488 E.93617
G3 X139.932 Y111.577 I-.71 J4.749 E.01399
G1 X118.098 Y133.412 E.95021
G2 X118.246 Y133.797 I2.513 J-.75 E.01272
G1 X140.334 Y111.71 E.96119
G3 X140.7 Y111.877 I-.685 J1.978 E.01242
G1 X118.396 Y134.181 E.97063
G2 X118.562 Y134.549 I2.018 J-.69 E.01244
G1 X141.035 Y112.077 E.97797
G3 X141.34 Y112.305 I-1.028 J1.694 E.01176
G1 X118.74 Y134.905 E.98351
G2 X118.921 Y135.259 I2.319 J-.96 E.01223
G1 X141.618 Y112.562 E.98774
G3 X141.868 Y112.845 I-1.343 J1.436 E.01166
G1 X119.122 Y135.591 E.98987
G2 X119.332 Y135.915 I2.154 J-1.168 E.01189
G1 X142.09 Y113.157 E.99039
G3 X142.281 Y113.5 I-8.525 J4.977 E.01208
G1 X119.555 Y136.226 E.98899
G1 X119.779 Y136.537 E.01178
G1 X142.437 Y113.879 E.98604
G1 X142.561 Y114.289 E.01318
G1 X120.023 Y136.827 E.98082
G1 X120.272 Y137.112 E.01165
G1 X142.635 Y114.749 E.9732
G3 X142.649 Y115.268 I-2.677 J.336 E.01601
G1 X120.526 Y137.392 E.96279
G1 X120.8 Y137.652 E.01162
G1 X142.569 Y115.883 E.94735
G3 X142.389 Y116.597 I-7.616 J-1.543 E.02268
G1 X121.074 Y137.912 E.92756
G2 X121.363 Y138.157 I1.433 J-1.398 E.01168
G1 X142.196 Y117.324 E.90658
G1 X142.002 Y118.051 E.02315
G1 X121.663 Y138.391 E.88513
G1 X121.963 Y138.625 E.01171
G1 X141.809 Y118.779 E.86369
G1 X141.616 Y119.506 E.02315
G1 X122.288 Y138.834 E.84113
M73 P81 R1
G1 X122.614 Y139.042 E.0119
G1 X141.423 Y120.233 E.81855
G1 X141.23 Y120.96 E.02315
G1 X122.951 Y139.239 E.79546
G1 X123.304 Y139.42 E.01221
G1 X141.037 Y121.687 E.7717
G1 X140.844 Y122.414 E.02315
G1 X123.657 Y139.601 E.74794
G2 X124.037 Y139.755 I.998 J-1.915 E.01264
G1 X140.651 Y123.141 E.723
G1 X140.458 Y123.868 E.02315
G1 X124.419 Y139.907 E.69798
G2 X124.815 Y140.046 I1.074 J-2.428 E.01291
G1 X140.265 Y124.596 E.67237
G1 X140.072 Y125.323 E.02315
G1 X125.222 Y140.172 E.64622
G2 X125.652 Y140.276 I1.034 J-3.325 E.01362
G1 X139.879 Y126.05 E.61912
G1 X139.686 Y126.777 E.02315
G1 X126.097 Y140.365 E.59134
G1 X126.558 Y140.439 E.01435
G1 X139.493 Y127.504 E.56289
G1 X139.299 Y128.231 E.02315
G1 X127.034 Y140.497 E.53377
G1 X127.536 Y140.528 E.01549
G1 X139.106 Y128.958 E.50351
G1 X138.913 Y129.685 E.02315
G1 X128.059 Y140.54 E.47238
G1 X128.61 Y140.523 E.01698
G1 X138.72 Y130.412 E.43998
G1 X138.527 Y131.14 E.02315
G1 X129.199 Y140.468 E.40597
G1 X129.811 Y140.39 E.019
G1 X138.334 Y131.867 E.37091
G1 X138.141 Y132.594 E.02315
G1 X130.5 Y140.235 E.33253
G2 X131.252 Y140.016 I-.773 J-4.068 E.02415
G1 X137.922 Y133.347 E.29023
G3 X137.597 Y134.206 I-12.627 J-4.285 E.02826
G1 X132.111 Y139.692 E.23875
G2 X133.173 Y139.164 I-2.247 J-5.85 E.03657
G1 X137.078 Y135.259 E.16995
G3 X135.971 Y136.849 I-8.921 J-5.028 E.05972
G3 X134.086 Y138.785 I-27.714 J-25.105 E.08318
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X135.299 Y137.572 E-.65207
G1 X135.493 Y137.364 E-.10793
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/10
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
G17
G3 Z1.6 I1.217 J0 P1  F30000
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
; OBJECT_ID: 1729
G1 X114.51 Y111.994
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X117.013 Y111.119 I2.494 J3.119 E.08966
G1 X139.071 Y111.121 E.7317
G3 X142.853 Y116.146 I-.08 J3.996 E.24011
G1 X138.413 Y132.867 E.57391
G3 X117.587 Y132.867 I-10.413 J-2.765 E.93729
G1 X113.147 Y116.146 E.5739
G3 X114.463 Y112.032 I3.857 J-1.033 E.1514
G1 X114.256 Y111.676 F30000
G1 F15476.087
G3 X117.008 Y110.712 I2.748 J3.437 E.0986
G1 X139.076 Y110.714 E.73203
G3 X143.248 Y116.246 I-.086 J4.404 E.26448
G1 X138.806 Y132.975 E.57416
G3 X117.194 Y132.975 I-10.806 J-2.872 E.9725
G1 X112.752 Y116.246 E.57416
G3 X114.209 Y111.714 I4.252 J-1.133 E.16686
G1 X114.01 Y111.369 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X114.011 Y111.369 E.00004
G3 X117.004 Y110.32 I2.993 J3.743 E.09931
G1 X139.081 Y110.322 E.67837
G3 X143.628 Y116.342 I-.091 J4.796 E.26675
G1 X139.184 Y133.078 E.53207
G3 X117.234 Y134.347 I-11.184 J-2.975 E.89116
G3 X116.816 Y133.078 I14.72 J-5.552 E.04107
G1 X112.372 Y116.342 E.53208
G3 X113.503 Y111.839 I4.632 J-1.229 E.14892
G1 X113.966 Y111.41 E.0194
; WIPE_START
M204 S10000
G1 X114.011 Y111.369 E-.02292
M73 P82 R1
G1 X114.58 Y110.977 E-.26272
G1 X114.989 Y110.763 E-.17529
G1 X115.636 Y110.519 E-.26272
G1 X115.729 Y110.496 E-.03635
; WIPE_END
G1 E-.04 F1800
G1 X116.775 Y118.056 Z1.8 F30000
G1 X119.281 Y136.152 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42055
G1 F15000
G1 X120.707 Y137.578 E.06206
G2 X122.801 Y139.162 I7.687 J-7.987 E.08099
G1 X122.85 Y139.187 E.00169
G1 X118.921 Y135.258 E.17097
G1 X118.458 Y134.343 E.03155
G1 X118.406 Y134.209 E.00442
G1 X123.896 Y139.699 E.2389
G1 X124.76 Y140.029 E.02848
G1 X118.078 Y133.347 E.2908
G3 X117.859 Y132.593 I11.778 J-3.838 E.02415
G1 X125.507 Y140.241 E.33282
G2 X126.177 Y140.378 I1.199 J-4.17 E.02108
G1 X117.666 Y131.867 E.3704
G1 X117.473 Y131.14 E.02314
G1 X126.813 Y140.479 E.40643
G1 X127.386 Y140.519 E.0177
G1 X117.281 Y130.413 E.43979
G1 X117.088 Y129.686 E.02314
G1 X127.945 Y140.544 E.4725
G1 X128.463 Y140.527 E.01594
G1 X116.895 Y128.959 E.50342
G1 X116.702 Y128.233 E.02314
G1 X128.967 Y140.498 E.53376
G1 X129.441 Y140.437 E.0147
G1 X116.509 Y127.506 E.56277
G1 X116.317 Y126.779 E.02314
G1 X129.906 Y140.368 E.59139
G1 X130.342 Y140.27 E.01375
G1 X116.124 Y126.052 E.61876
G1 X115.931 Y125.325 E.02314
G1 X130.778 Y140.172 E.64611
G1 X131.186 Y140.046 E.01314
G1 X115.738 Y124.598 E.67224
G1 X115.546 Y123.872 E.02314
G1 X131.584 Y139.91 E.69795
G1 X131.971 Y139.762 E.01274
G1 X115.353 Y123.145 E.72317
G1 X115.16 Y122.418 E.02314
G1 X132.336 Y139.594 E.74745
G1 X132.698 Y139.422 E.01234
G1 X114.967 Y121.691 E.77161
G1 X114.775 Y120.964 E.02314
G1 X133.049 Y139.239 E.79527
G1 X133.384 Y139.039 E.01199
G1 X114.582 Y120.237 E.81823
G1 X114.389 Y119.511 E.02314
G1 X133.718 Y138.84 E.84118
G2 X134.03 Y138.618 I-1.014 J-1.75 E.0118
G1 X114.196 Y118.784 E.86313
G1 X114.003 Y118.057 E.02314
G1 X134.338 Y138.392 E.88494
G2 X134.639 Y138.159 I-1.076 J-1.7 E.01173
G1 X113.811 Y117.33 E.90643
G1 X113.618 Y116.603 E.02314
G1 X134.922 Y137.908 E.92712
G1 X135.205 Y137.656 E.01164
G1 X113.426 Y115.877 E.94778
G1 X113.351 Y115.268 E.01889
G1 X135.47 Y137.388 E.96262
G1 X135.728 Y137.111 E.01163
G1 X113.365 Y114.749 E.97318
G3 X113.438 Y114.288 I5.397 J.62 E.01436
G1 X135.984 Y136.833 E.98113
G1 X136.216 Y136.531 E.01172
G1 X113.562 Y113.877 E.98586
G3 X113.721 Y113.502 I2.02 J.637 E.01255
G1 X136.448 Y136.229 E.98902
G2 X136.667 Y135.915 I-1.543 J-1.314 E.01182
G1 X113.913 Y113.16 E.99025
G3 X114.138 Y112.851 I1.388 J.776 E.01179
G1 X136.873 Y135.586 E.9894
G1 X137.079 Y135.258 E.01192
G1 X114.384 Y112.563 E.98764
G1 X114.661 Y112.306 E.01163
G1 X137.264 Y134.909 E.98364
G2 X137.443 Y134.554 I-2.726 J-1.591 E.01225
G1 X114.964 Y112.075 E.97822
G3 X115.298 Y111.875 I1.205 J1.625 E.01199
G1 X137.607 Y134.184 E.97085
G2 X137.759 Y133.802 I-2.943 J-1.392 E.01266
G1 X115.67 Y111.712 E.96128
G3 X116.068 Y111.577 I.76 J1.581 E.01298
G1 X137.902 Y133.411 E.9502
G1 X138.026 Y133 E.0132
G1 X116.518 Y111.493 E.93597
G3 X117.012 Y111.453 I.411 J2.007 E.01529
G1 X138.144 Y132.584 E.9196
G1 X138.256 Y132.162 E.01344
G1 X117.546 Y111.453 E.90125
G1 X118.08 Y111.453 E.01644
G1 X138.368 Y131.74 E.88289
G1 X138.48 Y131.318 E.01344
G1 X118.614 Y111.453 E.86452
G1 X119.148 Y111.453 E.01644
G1 X138.592 Y130.896 E.84615
G1 X138.704 Y130.474 E.01344
G1 X119.682 Y111.453 E.82779
G1 X120.216 Y111.453 E.01644
G1 X138.816 Y130.052 E.80942
G1 X138.928 Y129.63 E.01344
G1 X120.75 Y111.453 E.79105
G1 X121.285 Y111.453 E.01644
G1 X139.04 Y129.208 E.77269
G1 X139.152 Y128.786 E.01344
G1 X121.819 Y111.453 E.75432
G1 X122.353 Y111.453 E.01644
G1 X139.264 Y128.364 E.73595
G1 X139.376 Y127.942 E.01344
G1 X122.887 Y111.453 E.71759
G1 X123.421 Y111.453 E.01644
G1 X139.488 Y127.52 E.69922
G1 X139.6 Y127.098 E.01344
G1 X123.955 Y111.453 E.68085
M73 P83 R1
G1 X124.489 Y111.453 E.01644
G1 X139.712 Y126.676 E.66249
G1 X139.824 Y126.254 E.01344
G1 X125.023 Y111.453 E.64412
G1 X125.557 Y111.453 E.01644
G1 X139.936 Y125.832 E.62575
G1 X140.048 Y125.41 E.01344
G1 X126.091 Y111.453 E.60738
G1 X126.626 Y111.453 E.01644
G1 X140.161 Y124.988 E.58902
G1 X140.273 Y124.566 E.01344
G1 X127.16 Y111.453 E.57065
G1 X127.694 Y111.453 E.01644
G1 X140.385 Y124.144 E.55228
G1 X140.497 Y123.722 E.01344
G1 X128.228 Y111.454 E.53392
G1 X128.762 Y111.454 E.01644
G1 X140.609 Y123.3 E.51555
G1 X140.721 Y122.878 E.01344
G1 X129.296 Y111.454 E.49718
G1 X129.83 Y111.454 E.01644
G1 X140.833 Y122.456 E.47882
G1 X140.945 Y122.034 E.01344
G1 X130.364 Y111.454 E.46045
G1 X130.898 Y111.454 E.01644
G1 X141.057 Y121.612 E.44208
G1 X141.169 Y121.19 E.01344
G1 X131.432 Y111.454 E.42372
G1 X131.967 Y111.454 E.01644
G1 X141.281 Y120.768 E.40535
G1 X141.393 Y120.346 E.01344
G1 X132.501 Y111.454 E.38698
G1 X133.035 Y111.454 E.01644
G1 X141.505 Y119.924 E.36862
G1 X141.617 Y119.502 E.01344
G1 X133.569 Y111.454 E.35025
G1 X134.103 Y111.454 E.01644
G1 X141.729 Y119.08 E.33188
G1 X141.841 Y118.658 E.01344
G1 X134.637 Y111.454 E.31352
G1 X135.171 Y111.454 E.01644
G1 X141.953 Y118.236 E.29515
G1 X142.065 Y117.814 E.01344
G1 X135.705 Y111.454 E.27678
G1 X136.239 Y111.454 E.01644
G1 X142.177 Y117.392 E.25842
G1 X142.29 Y116.97 E.01344
G1 X136.773 Y111.454 E.24005
G1 X137.308 Y111.454 E.01644
G1 X142.402 Y116.548 E.22168
G1 X142.514 Y116.126 E.01344
G1 X137.842 Y111.454 E.20332
G1 X138.376 Y111.454 E.01644
G1 X142.609 Y115.688 E.18424
G2 X142.651 Y115.195 I-2.531 J-.462 E.01523
G1 X138.91 Y111.455 E.1628
G3 X139.477 Y111.488 I.074 J3.597 E.01751
G1 X142.623 Y114.634 E.13691
G2 X142.457 Y113.934 I-2.976 J.335 E.02218
G1 X140.171 Y111.648 E.09949
G3 X141.417 Y112.367 I-1.259 J3.621 E.04452
G3 X142.378 Y113.32 I-31.595 J32.791 E.04166
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X141.417 Y112.367 E-.51443
G1 X141.142 Y112.147 E-.13367
G1 X140.896 Y111.986 E-.1119
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/10
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
G17
G3 Z1.8 I1.217 J0 P1  F30000
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
; OBJECT_ID: 1729
G1 X114.512 Y111.996
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X117.013 Y111.119 I2.499 J3.122 E.08962
G1 X139.047 Y111.121 E.7309
G3 X142.853 Y116.146 I-.056 J3.997 E.24092
G1 X138.413 Y132.867 E.57389
G3 X117.587 Y132.867 I-10.413 J-2.759 E.93753
G1 X113.147 Y116.146 E.5739
G3 X114.466 Y112.034 I3.864 J-1.028 E.1513
G1 X114.258 Y111.679 F30000
G1 F15476.087
G3 X117.008 Y110.712 I2.754 J3.44 E.09856
G1 X139.052 Y110.714 E.73123
G3 X143.248 Y116.246 I-.062 J4.404 E.26529
G1 X138.806 Y132.974 E.57414
G3 X117.194 Y132.975 I-10.806 J-2.866 E.97274
G1 X112.752 Y116.246 E.57417
G3 X114.211 Y111.717 I4.26 J-1.127 E.16675
G1 X114.013 Y111.373 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X117.004 Y110.32 I2.999 J3.746 E.09927
G1 X139.057 Y110.322 E.67763
M73 P84 R1
G3 X143.628 Y116.342 I-.068 J4.797 E.26749
G1 X139.184 Y133.078 E.53207
G3 X116.816 Y133.078 I-11.184 J-2.97 E.93246
G1 X112.372 Y116.342 E.53209
G3 X113.967 Y111.41 I4.64 J-1.223 E.16823
; WIPE_START
M204 S10000
G1 X114.58 Y110.977 E-.28529
G1 X114.989 Y110.763 E-.17546
G1 X115.636 Y110.519 E-.26272
G1 X115.729 Y110.496 E-.03654
; WIPE_END
G1 E-.04 F1800
G1 X115.197 Y111.746 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42044
G1 F15000
G1 X114.327 Y112.616 E.03786
G2 X113.538 Y113.94 I2.651 J2.478 E.04776
G1 X115.828 Y111.65 E.09963
G3 X116.523 Y111.489 I1.014 J2.794 E.022
G1 X113.376 Y114.636 E.13691
G2 X113.349 Y115.196 I4.768 J.506 E.01727
G1 X117.093 Y111.453 E.16286
G1 X117.626 Y111.453 E.01642
G1 X113.398 Y115.681 E.18395
G2 X113.49 Y116.123 I1.875 J-.16 E.01392
G1 X118.16 Y111.453 E.20317
G1 X118.694 Y111.453 E.01642
G1 X113.602 Y116.544 E.22153
G1 X113.714 Y116.966 E.01343
G1 X119.228 Y111.453 E.23988
G1 X119.762 Y111.453 E.01642
G1 X113.826 Y117.388 E.25824
G1 X113.938 Y117.81 E.01343
G1 X120.296 Y111.453 E.2766
G1 X120.83 Y111.453 E.01642
G1 X114.05 Y118.232 E.29495
G1 X114.162 Y118.654 E.01343
G1 X121.363 Y111.453 E.31331
G1 X121.897 Y111.453 E.01642
G1 X114.274 Y119.076 E.33167
G1 X114.386 Y119.498 E.01343
G1 X122.431 Y111.453 E.35002
G1 X122.965 Y111.453 E.01642
G1 X114.498 Y119.92 E.36838
G1 X114.61 Y120.342 E.01343
G1 X123.499 Y111.453 E.38674
G1 X124.033 Y111.453 E.01642
G1 X114.721 Y120.764 E.40509
G1 X114.833 Y121.186 E.01343
G1 X124.567 Y111.453 E.42345
G1 X125.1 Y111.453 E.01642
G1 X114.945 Y121.608 E.44181
G1 X115.057 Y122.03 E.01343
G1 X125.634 Y111.453 E.46016
G1 X126.168 Y111.453 E.01642
G1 X115.169 Y122.452 E.47852
G1 X115.281 Y122.874 E.01343
G1 X126.702 Y111.453 E.49688
G1 X127.236 Y111.453 E.01642
G1 X115.393 Y123.296 E.51523
G1 X115.505 Y123.718 E.01343
G1 X127.77 Y111.453 E.53359
G1 X128.304 Y111.453 E.01642
G1 X115.617 Y124.14 E.55195
G1 X115.729 Y124.562 E.01343
G1 X128.837 Y111.453 E.5703
G1 X129.371 Y111.453 E.01642
G1 X115.841 Y124.984 E.58866
G1 X115.953 Y125.406 E.01343
G1 X129.905 Y111.453 E.60702
G1 X130.439 Y111.453 E.01642
G1 X116.064 Y125.828 E.62537
G1 X116.176 Y126.25 E.01343
G1 X130.973 Y111.453 E.64373
G1 X131.507 Y111.453 E.01642
G1 X116.288 Y126.672 E.66209
G1 X116.4 Y127.094 E.01343
G1 X132.041 Y111.453 E.68044
G1 X132.574 Y111.454 E.01642
G1 X116.512 Y127.516 E.6988
G1 X116.624 Y127.938 E.01343
G1 X133.108 Y111.454 E.71716
G1 X133.642 Y111.454 E.01642
G1 X116.736 Y128.36 E.73551
G1 X116.848 Y128.782 E.01343
G1 X134.176 Y111.454 E.75387
G1 X134.71 Y111.454 E.01642
G1 X116.96 Y129.204 E.77223
G1 X117.072 Y129.626 E.01343
G1 X135.244 Y111.454 E.79058
G1 X135.778 Y111.454 E.01642
G1 X117.184 Y130.048 E.80894
G1 X117.296 Y130.47 E.01343
G1 X136.312 Y111.454 E.8273
G1 X136.845 Y111.454 E.01642
G1 X117.408 Y130.892 E.84565
G1 X117.519 Y131.314 E.01343
G1 X137.379 Y111.454 E.86401
G1 X137.913 Y111.454 E.01642
G1 X117.631 Y131.736 E.88237
G1 X117.743 Y132.158 E.01343
G1 X138.447 Y111.454 E.90073
G1 X138.981 Y111.454 E.01642
G1 X117.855 Y132.58 E.91908
G2 X117.973 Y132.996 I6.616 J-1.649 E.0133
G1 X139.48 Y111.488 E.93569
G3 X139.927 Y111.575 I-.655 J4.548 E.01401
G1 X118.096 Y133.406 E.94978
G2 X118.244 Y133.793 I2.597 J-.77 E.01274
G1 X140.329 Y111.708 E.96083
G3 X140.695 Y111.875 I-.683 J1.979 E.01241
G1 X118.392 Y134.178 E.97032
G2 X118.559 Y134.546 I2.474 J-.902 E.01242
G1 X141.03 Y112.074 E.97764
G3 X141.336 Y112.302 I-1.027 J1.697 E.01175
G1 X118.731 Y134.908 E.98347
G2 X118.925 Y135.247 I2.182 J-1.02 E.01205
G1 X141.614 Y112.558 E.98712
G3 X141.865 Y112.841 I-1.34 J1.436 E.01165
G1 X119.12 Y135.586 E.9895
G2 X119.326 Y135.913 I2.837 J-1.553 E.01192
G1 X142.087 Y113.153 E.99022
G3 X142.279 Y113.495 I-8.585 J5.044 E.01206
G1 X119.547 Y136.227 E.98898
G1 X119.774 Y136.533 E.01174
G1 X142.437 Y113.871 E.98594
G3 X142.557 Y114.284 I-2.079 J.831 E.01326
G1 X120.018 Y136.823 E.98057
G1 X120.266 Y137.109 E.01164
G1 X142.634 Y114.741 E.97313
G3 X142.647 Y115.262 I-2.143 J.313 E.01608
G1 X120.521 Y137.388 E.9626
G2 X120.789 Y137.654 I2.59 J-2.351 E.01162
G1 X142.571 Y115.872 E.94764
G3 X142.392 Y116.585 I-7.606 J-1.535 E.02264
G1 X121.068 Y137.909 E.92771
G2 X121.358 Y138.153 I1.75 J-1.787 E.01167
G1 X142.199 Y117.312 E.9067
G1 X142.006 Y118.039 E.02314
G1 X121.657 Y138.388 E.8853
M73 P85 R1
G2 X121.958 Y138.62 I2.086 J-2.4 E.01172
G1 X141.813 Y118.766 E.86377
G1 X141.62 Y119.493 E.02314
G1 X122.275 Y138.837 E.84159
G1 X122.605 Y139.041 E.01194
G1 X141.427 Y120.22 E.81883
G1 X141.234 Y120.947 E.02314
G1 X122.945 Y139.235 E.79566
G1 X123.298 Y139.416 E.0122
G1 X141.041 Y121.674 E.77191
G1 X140.848 Y122.401 E.02314
G1 X123.651 Y139.597 E.74817
G2 X124.025 Y139.757 I1.197 J-2.294 E.01254
G1 X140.655 Y123.127 E.72347
G1 X140.462 Y123.854 E.02314
G1 X124.408 Y139.908 E.69842
G1 X124.805 Y140.045 E.01292
G1 X140.269 Y124.581 E.67275
G1 X140.076 Y125.308 E.02314
G1 X125.222 Y140.161 E.6462
G1 X125.647 Y140.271 E.01348
G1 X139.883 Y126.035 E.61935
G1 X139.69 Y126.762 E.02314
G1 X126.088 Y140.364 E.59175
G1 X126.548 Y140.437 E.01435
G1 X139.497 Y127.489 E.56332
G1 X139.304 Y128.216 E.02314
G1 X127.023 Y140.496 E.53425
G1 X127.526 Y140.528 E.01548
G1 X139.111 Y128.943 E.50401
G1 X138.918 Y129.67 E.02314
G1 X128.047 Y140.54 E.47295
G1 X128.598 Y140.523 E.01697
G1 X138.725 Y130.396 E.44056
G1 X138.532 Y131.123 E.02314
G1 X129.185 Y140.47 E.40663
G1 X129.796 Y140.392 E.01897
G1 X138.339 Y131.85 E.37163
G1 X138.145 Y132.577 E.02314
G1 X130.484 Y140.238 E.33331
G2 X131.234 Y140.022 I-.76 J-4.05 E.02404
G1 X137.927 Y133.33 E.29118
G3 X137.607 Y134.184 I-12.464 J-4.186 E.02807
G1 X132.088 Y139.702 E.24008
G2 X133.145 Y139.18 I-2.218 J-5.814 E.0363
G1 X137.1 Y135.225 E.17206
G3 X135.754 Y137.098 I-9.089 J-5.108 E.0711
G3 X134.045 Y138.813 I-190.027 J-187.653 E.07448
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X135.457 Y137.397 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/10
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z2 I1.217 J0 P1  F30000
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
; OBJECT_ID: 1729
G1 X116.072 Y118.888
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X119.689 Y118.888 E.11996
G1 X119.923 Y119.48 E.02113
G1 X120.148 Y118.888 E.02101
G1 X123.487 Y118.888 E.11078
G3 X124.829 Y118.819 I.856 J3.583 E.04482
G1 X125.021 Y118.573 E.01035
G1 X129.267 Y118.573 E.14085
G1 X129.023 Y118.888 E.01322
G1 X135.838 Y118.888 E.22606
G1 X136.072 Y119.48 E.02113
G1 X136.297 Y118.888 E.02101
G1 X139.926 Y118.888 E.1204
G1 X137.37 Y125.532 E.23614
G1 X134.783 Y125.532 E.08582
G1 X134.443 Y124.651 E.03133
G3 X133.678 Y125.257 I-1.841 J-1.536 E.03262
G3 X132.111 Y125.532 I-1.396 J-3.36 E.05319
G1 X127.431 Y125.532 E.15524
G1 X126.978 Y124.356 E.04181
G3 X121.669 Y124.368 I-2.659 J-2.142 E.20173
G1 X121.221 Y125.532 E.04139
G1 X118.634 Y125.532 E.08582
G1 X116.094 Y118.944 E.23421
; WIPE_START
G1 X118.094 Y118.913 E-.76
; WIPE_END
M73 P86 R1
G1 E-.04 F1800
G1 X125.557 Y117.315 Z2.2 F30000
G1 X125.56 Y117.314 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F15476.087
G2 X126.105 Y117.258 I-.055 J-3.223 E.01819
G1 X127.447 Y117.258 E.0445
G1 X129.662 Y117.959 E.07708
G1 X129.63 Y118.166 E.00695
G1 X125.56 Y118.166 E.135
G1 X125.56 Y117.374 E.02627
; WIPE_START
G1 X125.747 Y117.308 E-.0751
G1 X126.105 Y117.258 E-.13752
G1 X127.447 Y117.258 E-.50977
G1 X127.541 Y117.288 E-.03761
; WIPE_END
G1 E-.04 F1800
G1 X129.853 Y118.481 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
G1 F15476.087
G1 X130.14 Y118.11 E.01556
G1 X130.658 Y118.274 E.01803
G1 X130.626 Y118.481 E.00695
G1 X129.913 Y118.481 E.02366
; WIPE_START
G1 X130.14 Y118.11 E-.17385
G1 X130.658 Y118.274 E-.21725
G1 X130.626 Y118.481 E-.08371
G1 X129.913 Y118.481 E-.28518
; WIPE_END
G1 E-.04 F1800
G1 X122.956 Y115.342 Z2.2 F30000
G1 X115.516 Y111.984 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F15476.087
G1 X117.793 Y111.991 E.07555
G3 X118.931 Y112.282 I-.016 J2.436 E.03936
G3 X120.665 Y111.988 I1.225 J1.969 E.05983
G1 X124.974 Y111.988 E.14292
G3 X126.123 Y111.988 I.575 J3.382 E.03831
G1 X126.915 Y111.988 E.02626
G1 X126.535 Y111.177 E.02972
G1 X130.036 Y111.177 E.11612
G1 X130.617 Y112.444 E.04624
G1 X130.809 Y112.402 E.00652
G1 X130.809 Y111.988 E.01372
G1 X133.821 Y111.988 E.0999
G3 X135.705 Y112.318 I.537 J2.473 E.06506
G3 X137.573 Y111.988 I1.334 J2.094 E.06458
G1 X140.484 Y111.988 E.09657
G1 X140.484 Y117.708 E.18973
G1 X137.284 Y117.708 E.10618
G1 X137.284 Y116.906 E.0266
G3 X135.704 Y116.515 I-.219 J-2.504 E.05498
G3 X134.008 Y116.886 I-1.383 J-2.265 E.05866
G1 X134.008 Y117.669 E.02598
G1 X130.809 Y117.669 E.1061
G1 X130.809 Y116.851 E.02712
G1 X130.081 Y116.851 E.02415
G1 X130.414 Y117.77 E.03241
G1 X127.509 Y116.851 E.10106
G1 X126.062 Y116.851 E.048
G3 X125.153 Y116.891 I-.628 J-3.892 E.03026
G1 X125.153 Y117.669 E.02579
G1 X120.702 Y117.669 E.14764
G1 X120.702 Y116.854 E.02703
G3 X119.394 Y116.788 I-.521 J-2.686 E.04388
G3 X119.062 Y117.129 I-1.613 J-1.241 E.01584
G3 X117.418 Y117.632 I-1.513 J-2.011 E.05818
G1 X115.516 Y117.633 E.06311
G1 X115.516 Y112.044 E.1854
G1 X115.596 Y111.372 F30000
G1 F15476.087
G3 X117.013 Y111.119 I1.429 J3.917 E.048
G1 X126.059 Y111.12 E.30008
G1 X126.282 Y111.597 E.01747
G2 X124.937 Y111.581 I-.714 J3.509 E.0449
G1 X120.706 Y111.581 E.14034
G2 X118.917 Y111.82 I-.536 J2.811 E.06092
G2 X117.802 Y111.584 I-1.162 J2.738 E.03805
G1 X115.628 Y111.578 E.0721
G1 X115.605 Y111.431 E.00492
; WIPE_START
G1 X116.237 Y111.193 E-.25646
G1 X116.617 Y111.138 E-.14607
G1 X117.013 Y111.119 E-.15073
G1 X117.557 Y111.119 E-.20674
; WIPE_END
G1 E-.04 F1800
G1 X114.507 Y111.99 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
G1 F15476.087
G3 X115.108 Y111.59 I2.514 J3.124 E.024
G1 X115.108 Y118.041 E.214
G1 X117.427 Y118.039 E.07692
G2 X119.318 Y117.446 I.123 J-2.92 E.06706
G1 X119.533 Y117.25 E.00964
G2 X120.295 Y117.312 I.627 J-2.977 E.02546
G1 X120.295 Y118.076 E.02534
G1 X124.892 Y118.076 E.15247
G1 X124.648 Y118.389 E.01316
G2 X123.437 Y118.481 I-.256 J4.642 E.04041
G1 X115.479 Y118.481 E.26398
G1 X118.355 Y125.939 E.26515
G1 X121.5 Y125.939 E.10436
G1 X121.823 Y125.101 E.02977
G2 X126.827 Y125.096 I2.499 J-2.861 E.18122
G1 X127.152 Y125.939 E.02997
G1 X132.115 Y125.939 E.16462
G2 X133.857 Y125.624 I.169 J-4.035 E.05921
G2 X134.282 Y125.365 I-1.387 J-2.757 E.01652
G1 X134.503 Y125.939 E.02041
G1 X137.649 Y125.939 E.10436
G1 X140.519 Y118.481 E.26508
G1 X131.105 Y118.481 E.31229
G1 X130.958 Y118.076 E.01429
G1 X134.415 Y118.076 E.11468
G1 X134.415 Y117.324 E.02494
G2 X135.702 Y116.986 I-.12 J-3.077 E.04449
G2 X136.876 Y117.312 I1.334 J-2.523 E.04075
G1 X136.876 Y118.115 E.02662
G1 X140.892 Y118.115 E.13319
G1 X140.892 Y111.59 E.21645
G3 X142.853 Y116.146 I-1.913 J3.524 E.17741
G1 X138.413 Y132.867 E.57391
G3 X117.587 Y132.867 I-10.413 J-2.76 E.93747
G1 X113.147 Y116.146 E.5739
G3 X114.461 Y112.028 I3.874 J-1.032 E.15143
; WIPE_START
G1 X114.821 Y111.768 E-.16869
G1 X115.108 Y111.59 E-.12867
G1 X115.108 Y112.807 E-.46264
; WIPE_END
G1 E-.04 F1800
G1 X122.695 Y111.973 Z2.2 F30000
G1 X130.458 Y111.12 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F15476.087
G1 X139.023 Y111.12 E.28413
G3 X140.414 Y111.375 I-.043 J4.158 E.04714
G1 X140.381 Y111.581 E.00692
G1 X137.612 Y111.581 E.09186
G2 X135.703 Y111.848 I-.579 J2.814 E.06521
G2 X133.784 Y111.581 I-1.338 J2.582 E.06553
G1 X130.669 Y111.581 E.10332
G1 X130.483 Y111.174 E.01484
; WIPE_START
G1 X132.483 Y111.162 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.853 Y111.378 Z2.2 F30000
G1 X114.259 Y111.678 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F15476.087
G1 X114.426 Y111.55 E.00698
G3 X117.008 Y110.712 I2.585 J3.568 E.09154
G1 X139.028 Y110.713 E.73044
G3 X143.248 Y116.246 I-.039 J4.405 E.26609
G1 X138.806 Y132.975 E.57417
G3 X117.194 Y132.975 I-10.806 J-2.868 E.97267
G1 X112.752 Y116.246 E.57416
G3 X114.096 Y111.814 I4.259 J-1.128 E.16174
G1 X114.213 Y111.717 E.00506
G1 X114.013 Y111.372 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X117.004 Y110.32 I2.998 J3.746 E.09927
G1 X139.033 Y110.321 E.67689
G3 X143.628 Y116.342 I-.044 J4.798 E.26823
G1 X139.184 Y133.079 E.53209
G3 X116.816 Y133.078 I-11.184 J-2.972 E.93241
G1 X112.372 Y116.342 E.53208
G3 X113.967 Y111.41 I4.639 J-1.224 E.16826
; WIPE_START
M204 S10000
G1 X114.384 Y111.098 E-.19782
G1 X114.781 Y110.865 E-.17509
G1 X115.2 Y110.671 E-.17547
G1 X115.73 Y110.5 E-.21162
; WIPE_END
G1 E-.04 F1800
G1 X115.342 Y111.259 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.124169
G1 F15000
G1 X115.362 Y111.52 E.00173
; LINE_WIDTH: 0.15695
G1 X115.382 Y111.781 E.00243
G1 X114.945 Y112.588 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42055
G1 F15000
G1 X114.663 Y112.305 E.01229
G1 X114.385 Y112.562 E.01163
G1 X114.775 Y112.952 E.01697
G1 X114.775 Y113.486 E.01643
G1 X114.133 Y112.844 E.02794
G2 X113.911 Y113.156 I1.497 J1.302 E.0118
G1 X114.775 Y114.02 E.03761
G1 X114.775 Y114.554 E.01643
G1 X113.725 Y113.504 E.04572
G2 X113.568 Y113.88 I1.217 J.73 E.01261
G1 X114.775 Y115.088 E.05256
G1 X114.775 Y115.622 E.01643
G1 X113.442 Y114.288 E.05804
G2 X113.365 Y114.746 I2.327 J.625 E.01429
G1 X114.775 Y116.156 E.06137
G1 X114.775 Y116.69 E.01643
G1 X113.353 Y115.268 E.0619
G1 X113.425 Y115.874 E.01879
G1 X114.775 Y117.224 E.05875
G1 X114.775 Y117.758 E.01643
G1 X113.617 Y116.6 E.05041
G1 X113.81 Y117.327 E.02314
G1 X115.221 Y118.739 E.06144
G1 X115.557 Y119.608 E.02866
G1 X114.002 Y118.054 E.06763
G1 X114.195 Y118.78 E.02314
G1 X115.892 Y120.477 E.07383
G1 X116.227 Y121.346 E.02866
G1 X114.388 Y119.507 E.08002
G1 X114.581 Y120.234 E.02314
G1 X116.562 Y122.215 E.08621
G1 X116.897 Y123.084 E.02866
G1 X114.773 Y120.961 E.0924
G1 X114.966 Y121.688 E.02314
G1 X117.232 Y123.953 E.09859
M73 P87 R1
G1 X117.567 Y124.822 E.02866
G1 X115.159 Y122.414 E.10479
G1 X115.352 Y123.141 E.02314
G1 X117.902 Y125.691 E.11098
G1 X118.126 Y126.272 E.01916
G1 X118.483 Y126.272 E.01099
G1 X131.965 Y139.754 E.58671
G2 X132.345 Y139.6 I-.623 J-2.077 E.01263
G1 X119.017 Y126.272 E.58
G1 X119.551 Y126.272 E.01643
G1 X132.698 Y139.419 E.57212
G1 X133.051 Y139.238 E.01221
G1 X120.085 Y126.272 E.56424
G1 X120.619 Y126.272 E.01643
G1 X133.388 Y139.041 E.55567
G1 X133.714 Y138.833 E.0119
G1 X121.153 Y126.272 E.54661
G1 X121.687 Y126.272 E.01643
G1 X134.039 Y138.624 E.53752
G1 X134.339 Y138.39 E.01171
G1 X121.866 Y125.917 E.54278
G1 X121.975 Y125.634 E.00932
G2 X122.351 Y125.868 I1.38 J-1.804 E.01363
G1 X134.638 Y138.155 E.53474
G2 X134.927 Y137.91 I-1.145 J-1.644 E.01168
G1 X123.239 Y126.222 E.50866
G2 X123.899 Y126.348 I.961 J-3.238 E.02072
G1 X135.202 Y137.65 E.49186
G1 X135.476 Y137.391 E.01162
G1 X124.451 Y126.366 E.47977
G2 X124.94 Y126.321 I.072 J-1.893 E.01515
G1 X135.73 Y137.111 E.46954
G1 X135.979 Y136.825 E.01165
G1 X125.388 Y126.235 E.46089
G1 X125.795 Y126.107 E.01312
G1 X136.224 Y136.536 E.45385
G1 X136.451 Y136.23 E.01175
G1 X126.159 Y125.938 E.44787
G2 X126.506 Y125.751 I-.655 J-1.625 E.01215
G1 X136.671 Y135.915 E.44235
G1 X136.881 Y135.592 E.01188
G1 X127.562 Y126.272 E.40557
G1 X128.096 Y126.272 E.01643
G1 X137.081 Y135.257 E.39101
G2 X137.265 Y134.908 I-3.292 J-1.959 E.01217
G1 X128.63 Y126.272 E.37579
G1 X129.164 Y126.272 E.01643
G1 X137.443 Y134.552 E.36031
G1 X137.608 Y134.182 E.01245
G1 X129.698 Y126.272 E.34422
G1 X130.232 Y126.272 E.01643
G1 X137.76 Y133.8 E.32758
G2 X137.903 Y133.409 I-2.987 J-1.321 E.01281
G1 X130.766 Y126.272 E.31059
G1 X131.3 Y126.272 E.01643
G1 X138.026 Y132.998 E.29271
G2 X138.144 Y132.582 I-6.503 J-2.068 E.01331
G1 X131.834 Y126.272 E.2746
G2 X132.36 Y126.264 I.143 J-7.318 E.01618
G1 X138.256 Y132.16 E.25661
G1 X138.368 Y131.738 E.01344
G1 X132.857 Y126.227 E.23983
G2 X133.318 Y126.154 I-.045 J-1.778 E.01441
G1 X138.48 Y131.316 E.22464
G1 X138.592 Y130.894 E.01344
G1 X133.735 Y126.037 E.21136
G2 X134.099 Y125.867 I-.399 J-1.323 E.0124
G1 X138.843 Y130.611 E.20645
G1 X134.869 Y126.103 F30000
G1 F15000
G1 X138.816 Y130.05 E.17177
G1 X138.928 Y129.628 E.01344
G1 X135.572 Y126.272 E.14602
G1 X136.107 Y126.272 E.01643
G1 X139.04 Y129.206 E.12765
G1 X139.152 Y128.783 E.01344
G1 X136.641 Y126.272 E.10928
G1 X137.175 Y126.272 E.01643
G1 X139.264 Y128.361 E.09091
G1 X139.376 Y127.939 E.01344
G1 X137.709 Y126.272 E.07254
G1 X137.878 Y126.272 E.00521
G1 X137.979 Y126.009 E.00868
G1 X139.488 Y127.517 E.06563
G1 X139.6 Y127.095 E.01344
G1 X138.128 Y125.623 E.06405
G1 X138.276 Y125.238 E.01272
G1 X139.711 Y126.673 E.06246
G1 X139.823 Y126.251 E.01344
G1 X138.425 Y124.852 E.06087
G1 X138.573 Y124.466 E.01272
G1 X139.935 Y125.829 E.05929
G1 X140.047 Y125.407 E.01344
G1 X138.721 Y124.081 E.0577
G1 X138.87 Y123.695 E.01272
G1 X140.159 Y124.985 E.05612
G1 X140.271 Y124.563 E.01344
G1 X139.018 Y123.309 E.05453
G1 X139.167 Y122.924 E.01272
G1 X140.383 Y124.14 E.05295
G1 X140.495 Y123.718 E.01344
G1 X139.315 Y122.538 E.05136
G1 X139.463 Y122.152 E.01272
G1 X140.607 Y123.296 E.04978
G1 X140.719 Y122.874 E.01344
G1 X139.612 Y121.767 E.04819
G1 X139.76 Y121.381 E.01272
G1 X140.831 Y122.452 E.0466
G1 X140.943 Y122.03 E.01344
G1 X139.908 Y120.995 E.04502
G1 X140.057 Y120.61 E.01272
G1 X141.055 Y121.608 E.04343
G1 X141.167 Y121.186 E.01344
G1 X140.205 Y120.224 E.04185
G1 X140.354 Y119.838 E.01272
G1 X141.279 Y120.764 E.04026
G1 X141.391 Y120.342 E.01344
G1 X140.502 Y119.453 E.03868
G1 X140.65 Y119.067 E.01272
G1 X141.503 Y119.919 E.03709
G1 X141.615 Y119.497 E.01344
G1 X140.799 Y118.681 E.0355
G1 X140.889 Y118.448 E.0077
G1 X141.099 Y118.448 E.00649
G1 X141.727 Y119.075 E.02729
G1 X141.839 Y118.653 E.01344
G1 X141.225 Y118.039 E.02672
G1 X141.225 Y117.505 E.01643
G1 X141.951 Y118.231 E.03159
G1 X142.062 Y117.809 E.01344
G1 X141.225 Y116.971 E.03646
G1 X141.225 Y116.437 E.01643
G1 X142.174 Y117.387 E.04133
G1 X142.286 Y116.965 E.01344
G1 X141.225 Y115.903 E.0462
G1 X141.225 Y115.369 E.01643
G1 X142.398 Y116.543 E.05108
G1 X142.51 Y116.121 E.01344
G1 X141.225 Y114.835 E.05595
G1 X141.225 Y114.301 E.01643
G1 X142.602 Y115.678 E.05995
G2 X142.651 Y115.193 I-1.981 J-.444 E.01504
G1 X141.225 Y113.767 E.06207
G1 X141.225 Y113.233 E.01643
G1 X142.615 Y114.624 E.06052
G2 X142.447 Y113.921 I-2.876 J.318 E.02228
G1 X141.225 Y112.699 E.0532
G1 X141.225 Y112.217 E.01483
G1 X141.549 Y112.489 E.01303
G1 X142.359 Y113.299 E.03524
; WIPE_START
G1 X141.549 Y112.489 E-.43521
G1 X141.225 Y112.217 E-.16087
G1 X141.225 Y112.648 E-.16392
; WIPE_END
G1 E-.04 F1800
G1 X140.321 Y112.919 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42217
G1 F12000
M204 S2000
G1 X139.724 Y112.321 E.0261
G1 X139.187 Y112.321 E.01658
G1 X140.151 Y113.285 E.04213
G1 X140.151 Y113.822 E.01658
G1 X138.651 Y112.321 E.06557
G1 X138.115 Y112.321 E.01658
G1 X140.151 Y114.358 E.08901
G1 X140.151 Y114.894 E.01657
G1 X137.578 Y112.321 E.11245
G2 X136.986 Y112.265 I-.582 J2.989 E.01842
G1 X140.151 Y115.431 E.13834
G1 X140.151 Y115.967 E.01658
G1 X136.511 Y112.326 E.15911
G2 X136.116 Y112.468 I.578 J2.227 E.01297
G1 X140.151 Y116.503 E.17635
G1 X140.151 Y117.04 E.01658
G1 X135.779 Y112.668 E.19107
G1 X135.706 Y112.716 E.00272
G2 X134.906 Y112.33 I-1.641 J2.384 E.02755
G1 X139.95 Y117.375 E.22045
G1 X139.413 Y117.375 E.01658
G1 X134.304 Y112.265 E.22331
G2 X133.824 Y112.321 I7.016 J62.042 E.01494
G1 X138.877 Y117.375 E.22085
G1 X138.341 Y117.375 E.01658
G1 X133.288 Y112.321 E.22085
G1 X132.751 Y112.321 E.01658
G1 X137.004 Y116.574 E.18586
G3 X136.361 Y116.467 I.024 J-2.134 E.02023
G1 X132.215 Y112.321 E.18119
G1 X131.679 Y112.321 E.01658
G1 X135.565 Y116.208 E.16985
G3 X135.218 Y116.397 I-1.239 J-1.852 E.01223
G1 X131.143 Y112.322 E.17812
G1 X131.143 Y112.858 E.01658
G1 X134.811 Y116.527 E.16034
G1 X134.774 Y116.534 E.00119
G3 X134.322 Y116.574 I-.419 J-2.182 E.01403
G1 X130.936 Y113.188 E.148
G1 X130.623 Y113.256 E.00989
G1 X130.3 Y112.552 E.02393
G1 X129.258 Y111.51 E.04556
G1 X129.794 Y111.51 E.01658
G1 X130.191 Y111.906 E.01732
M204 S10000
G1 X130.787 Y111.35 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0970378
G1 F15000
G1 X133.79 Y111.348 E.01324
G1 X134.933 Y111.348 F30000
; LINE_WIDTH: 0.112431
G1 F15000
G1 X135.122 Y111.366 E.00108
; LINE_WIDTH: 0.149907
G1 X135.275 Y111.388 E.00135
; LINE_WIDTH: 0.193617
G1 X135.424 Y111.41 E.00185
; LINE_WIDTH: 0.233817
G1 X135.522 Y111.428 E.00155
; LINE_WIDTH: 0.270219
G1 X135.611 Y111.446 E.00169
; LINE_WIDTH: 0.305027
G1 X135.701 Y111.463 E.00195
G1 X135.701 Y111.482 F30000
; LINE_WIDTH: 0.302935
G1 F15000
G1 X135.701 Y111.463 E.0004
M73 P88 R1
G1 X135.804 Y111.443 E.00223
; LINE_WIDTH: 0.263992
G1 X135.902 Y111.425 E.00179
; LINE_WIDTH: 0.22658
G1 X135.999 Y111.406 E.00149
; LINE_WIDTH: 0.185233
G1 X136.157 Y111.384 E.00185
; LINE_WIDTH: 0.141863
G1 X136.307 Y111.362 E.00122
; LINE_WIDTH: 0.108685
G1 X136.464 Y111.348 E.00085
G1 X135.701 Y111.482 F30000
; LINE_WIDTH: 0.27339
G1 F15000
G1 X135.702 Y111.498 E.00031
; LINE_WIDTH: 0.243615
G1 X135.703 Y111.515 E.00027
; LINE_WIDTH: 0.212287
G1 X135.705 Y111.618 E.00143
; WIPE_START
G1 X135.703 Y111.515 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.622 Y111.785 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.147963
G1 F15000
G1 X140.643 Y111.524 E.00224
; LINE_WIDTH: 0.113935
G1 X140.663 Y111.263 E.00151
; WIPE_START
G1 X140.643 Y111.524 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.447 Y117.017 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42217
G1 F12000
M204 S2000
G1 X137.974 Y117.544 E.02303
; WIPE_START
M204 S10000
G1 X137.447 Y117.017 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.445 Y119.684 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.42025
G1 F12000
M204 S2000
G1 X138.982 Y119.221 E.02012
G1 X138.448 Y119.221 E.01641
G1 X139.165 Y119.938 E.03117
G1 X139.017 Y120.323 E.0127
G1 X137.915 Y119.221 E.04792
G1 X137.381 Y119.221 E.01641
G1 X138.869 Y120.709 E.06468
G1 X138.72 Y121.094 E.0127
G1 X136.847 Y119.221 E.08144
G1 X136.527 Y119.221 E.00986
G1 X136.468 Y119.376 E.00508
G1 X138.572 Y121.48 E.09148
G1 X138.424 Y121.865 E.0127
G1 X136.19 Y119.631 E.09713
; WIPE_START
M204 S10000
G1 X137.604 Y121.045 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.826 Y118.07 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.475052
G1 F14578.889
G1 X135.118 Y118.053 E.01029
; LINE_WIDTH: 0.508955
G1 F13518.298
G1 X135.409 Y118.036 E.01109
; LINE_WIDTH: 0.542859
G1 F12601.555
G1 X135.701 Y118.019 E.0119
; LINE_WIDTH: 0.53678
G1 F12756.652
G1 X135.965 Y118.042 E.01068
; LINE_WIDTH: 0.473593
G1 F14628.296
G2 X136.461 Y118.066 I.391 J-2.962 E.01745
G1 X136.461 Y117.676 E.01368
; LINE_WIDTH: 0.489423
G1 F14109.664
G1 X136.127 Y117.597 E.01251
; LINE_WIDTH: 0.541503
G1 F12635.831
G3 X135.701 Y117.485 I.224 J-1.702 E.01793
; LINE_WIDTH: 0.539958
G1 F12675.1
G1 X135.443 Y117.56 E.01089
; LINE_WIDTH: 0.500253
G1 F13775.536
G1 X135.185 Y117.635 E.01002
; LINE_WIDTH: 0.463978
G1 F14962.331
G1 X134.826 Y117.685 E.01243
G1 X134.826 Y118.01 E.01115
; WIPE_START
G1 X134.826 Y117.685 E-.35939
G1 X135.185 Y117.635 E-.40061
; WIPE_END
G1 E-.04 F1800
G1 X133.913 Y116.701 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42217
G1 F12000
M204 S2000
G1 X128.722 Y111.51 E.22688
G1 X128.185 Y111.51 E.01658
G1 X133.675 Y116.999 E.23991
G1 X133.675 Y117.336 E.0104
G1 X133.475 Y117.336 E.00618
G1 X127.649 Y111.51 E.25462
G1 X127.113 Y111.51 E.01658
G1 X132.938 Y117.336 E.25462
G1 X132.402 Y117.336 E.01657
G1 X127.388 Y112.321 E.21915
G1 X126.852 Y112.321 E.01657
G1 X131.866 Y117.336 E.21914
G1 X131.329 Y117.336 E.01658
G1 X130.973 Y116.979 E.01558
M204 S10000
G1 X130.681 Y116.688 F30000
G1 F12000
M204 S2000
G1 X126.315 Y112.322 E.19082
G1 X126.082 Y112.322 E.00721
G2 X125.73 Y112.272 I-.579 J2.853 E.011
G1 X129.975 Y116.518 E.18556
G1 X129.606 Y116.518 E.0114
G1 X129.701 Y116.78 E.00862
G1 X125.203 Y112.285 E.19652
G3 X124.706 Y112.321 I-.348 J-1.353 E.01549
G1 X129.523 Y117.139 E.21054
G1 X128.739 Y116.89 E.02543
G1 X124.17 Y112.321 E.19969
G1 X123.633 Y112.321 E.01658
G1 X127.954 Y116.642 E.18885
G1 X127.295 Y116.433 E.02138
G1 X127.274 Y116.498 E.00211
G1 X123.097 Y112.321 E.18256
G1 X122.561 Y112.321 E.01658
G1 X126.757 Y116.518 E.18341
G1 X126.221 Y116.518 E.01658
G1 X122.024 Y112.321 E.18341
G1 X121.488 Y112.321 E.01658
G1 X125.731 Y116.565 E.18545
G1 X125.669 Y116.57 E.00193
G3 X125.182 Y116.551 I-.15 J-2.485 E.0151
G1 X120.952 Y112.321 E.18488
G3 X120.371 Y112.277 I-.082 J-2.727 E.01805
G1 X124.82 Y116.726 E.19446
G1 X124.82 Y117.262 E.01658
G1 X119.845 Y112.288 E.21741
G2 X119.423 Y112.402 I2.255 J9.184 E.01352
G1 X124.357 Y117.336 E.21563
G1 X123.821 Y117.336 E.01658
G1 X119.071 Y112.586 E.20757
G1 X118.933 Y112.669 E.00498
G2 X118.351 Y112.402 I-1.126 J1.69 E.01987
G1 X123.284 Y117.336 E.21562
G1 X122.748 Y117.336 E.01658
G1 X117.736 Y112.324 E.21904
G1 X117.198 Y112.322 E.01662
G1 X122.212 Y117.336 E.2191
G1 X121.675 Y117.336 E.01658
G1 X116.661 Y112.321 E.21917
G1 X116.123 Y112.319 E.01662
G1 X120.365 Y116.561 E.1854
G3 X119.816 Y116.549 I-.229 J-1.994 E.01702
G1 X115.849 Y112.582 E.17338
G1 X115.849 Y113.118 E.01658
G1 X119.216 Y116.485 E.14715
G3 X118.962 Y116.768 I-1.329 J-.935 E.01177
G1 X115.849 Y113.655 E.13608
G1 X115.849 Y114.191 E.01658
G1 X118.661 Y117.003 E.12289
G1 X118.541 Y117.068 E.00423
G3 X118.293 Y117.171 I-.745 J-1.448 E.0083
G1 X115.849 Y114.727 E.10681
G1 X115.849 Y115.264 E.01658
G1 X117.854 Y117.269 E.08763
G3 X117.347 Y117.298 I-.567 J-5.339 E.01569
G1 X115.849 Y115.8 E.06549
G1 X115.849 Y116.336 E.01658
G1 X116.811 Y117.299 E.04207
G1 X116.276 Y117.299 E.01656
G1 X115.679 Y116.703 E.02607
; WIPE_START
M204 S10000
G1 X116.276 Y117.299 E-.32058
G1 X116.811 Y117.299 E-.2036
G1 X116.373 Y116.86 E-.23582
; WIPE_END
G1 E-.04 F1800
G1 X117.798 Y118.252 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.117544
G1 F15000
G1 X118.161 Y118.23 E.00221
; LINE_WIDTH: 0.154021
G1 X118.306 Y118.214 E.00133
; LINE_WIDTH: 0.185683
G1 X118.448 Y118.198 E.00165
; LINE_WIDTH: 0.219383
G1 X118.56 Y118.18 E.00164
; LINE_WIDTH: 0.255086
G1 X118.665 Y118.163 E.00183
; LINE_WIDTH: 0.289415
G1 X118.769 Y118.146 E.00212
; LINE_WIDTH: 0.308711
G1 X119.214 Y118.063 E.00981
G1 X119.208 Y118.044 F30000
; LINE_WIDTH: 0.40692
G1 F15000
G3 X118.226 Y118.277 I-5.684 J-21.766 E.02993
M73 P89 R1
G1 X119.913 Y118.099 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.40033
G1 F15000
G1 X119.913 Y117.674 E.01238
G1 X119.653 Y117.652 E.00759
G1 X119.529 Y117.755 E.00471
G1 X119.617 Y118.099 E.01033
G1 X119.853 Y118.099 E.00688
; WIPE_START
G1 X119.617 Y118.099 E-.12487
G1 X119.529 Y117.755 E-.18739
G1 X119.653 Y117.652 E-.08541
G1 X119.913 Y117.674 E-.13773
G1 X119.913 Y118.099 E-.2246
; WIPE_END
G1 E-.04 F1800
G1 X120.866 Y117.063 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42217
G1 F12000
M204 S2000
G1 X121.309 Y117.505 E.01934
; WIPE_START
M204 S10000
G1 X120.866 Y117.063 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.911 Y119.895 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.42025
G1 F12000
M204 S2000
G1 X119.238 Y119.221 E.02929
G1 X118.704 Y119.221 E.01641
G1 X124.754 Y125.271 E.26305
G2 X125.194 Y125.178 I-.407 J-3.015 E.01386
G1 X120.065 Y120.048 E.22305
G1 X120.211 Y119.661 E.01273
G1 X125.583 Y125.033 E.23359
G2 X125.929 Y124.845 I-1.283 J-2.78 E.01211
G1 X120.358 Y119.274 E.24226
G1 X120.378 Y119.221 E.00173
G1 X120.839 Y119.221 E.01417
G1 X126.24 Y124.622 E.23486
G2 X126.376 Y124.506 I-3.507 J-4.234 E.00553
G1 X126.518 Y124.367 E.00609
G1 X121.372 Y119.221 E.22376
G1 X121.906 Y119.221 E.01641
G1 X126.886 Y124.202 E.21656
M204 S10000
G1 X127.224 Y124.539 F30000
G1 F12000
M204 S2000
G1 X127.883 Y125.199 E.02868
G1 X128.417 Y125.199 E.01641
G1 X122.44 Y119.221 E.25992
G1 X122.973 Y119.221 E.01641
G1 X128.951 Y125.199 E.25992
G1 X129.484 Y125.199 E.01641
G1 X123.507 Y119.221 E.25992
G3 X123.961 Y119.142 I3.975 J21.517 E.01419
G1 X130.018 Y125.199 E.26336
G1 X130.552 Y125.199 E.01641
G1 X124.477 Y119.125 E.26413
G3 X124.97 Y119.181 I-.159 J3.554 E.01526
G1 X125.013 Y119.126 E.00214
G1 X131.085 Y125.199 E.26406
G1 X131.619 Y125.199 E.01641
G1 X125.326 Y118.906 E.27363
G1 X125.86 Y118.906 E.01641
G1 X132.152 Y125.198 E.2736
G2 X132.661 Y125.174 I-.027 J-5.86 E.01568
G1 X126.393 Y118.906 E.27253
G1 X126.927 Y118.906 E.01641
G1 X133.26 Y125.24 E.2754
M204 S10000
G1 X134.5 Y124.345 F30000
G1 F12000
M204 S2000
G1 X135.524 Y125.369 E.0445
M204 S10000
G1 X138.407 Y122.382 F30000
G1 F12000
M204 S2000
G1 X135.247 Y119.221 E.13742
G1 X134.713 Y119.221 E.01641
G1 X138.127 Y122.636 E.14846
G1 X137.979 Y123.021 E.0127
G1 X134.179 Y119.221 E.16522
G1 X133.646 Y119.221 E.01641
G1 X137.831 Y123.406 E.18198
G1 X137.682 Y123.792 E.0127
G1 X133.112 Y119.221 E.19873
G1 X132.578 Y119.221 E.01641
G1 X137.534 Y124.177 E.21549
G1 X137.386 Y124.562 E.0127
G1 X132.045 Y119.221 E.23225
G1 X131.511 Y119.221 E.01641
G1 X137.238 Y124.948 E.249
G1 X137.141 Y125.199 E.00827
G1 X136.955 Y125.199 E.00572
G1 X130.978 Y119.221 E.25992
G1 X130.444 Y119.221 E.01641
G1 X136.421 Y125.199 E.25992
G1 X135.888 Y125.199 E.01641
G1 X129.91 Y119.221 E.25992
G1 X129.377 Y119.221 E.01641
G1 X134.361 Y124.205 E.21671
G3 X134.125 Y124.503 I-1.701 J-1.101 E.0117
G1 X129.084 Y119.462 E.2192
G1 X128.938 Y119.849 E.01273
G1 X133.849 Y124.76 E.21354
G3 X133.518 Y124.963 I-2.557 J-3.795 E.01193
G1 X127.461 Y118.906 E.26339
G1 X127.994 Y118.906 E.01641
G1 X128.329 Y119.24 E.01453
G1 X128.561 Y118.94 E.0117
G1 X128.358 Y118.737 E.00883
M204 S10000
G1 X128.522 Y117.889 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.171357
G1 F15000
G1 X128.686 Y117.914 E.00173
; LINE_WIDTH: 0.121732
G1 X128.85 Y117.939 E.00106
G1 X128.522 Y117.889 F30000
; LINE_WIDTH: 0.220981
G1 F15000
G1 X128.359 Y117.864 E.0024
; LINE_WIDTH: 0.270605
G1 X128.195 Y117.838 E.00307
; LINE_WIDTH: 0.32023
G1 X128.031 Y117.813 E.00374
; LINE_WIDTH: 0.369854
G1 X127.868 Y117.788 E.00441
; LINE_WIDTH: 0.419478
G1 X127.704 Y117.763 E.00508
; LINE_WIDTH: 0.469102
G1 F14782.416
G1 X127.54 Y117.737 E.00575
; LINE_WIDTH: 0.537647
G1 F12734.305
G1 X127.377 Y117.712 E.00668
G1 X126.105 Y117.717 E.05125
G3 X125.764 Y117.738 I-.614 J-7.337 E.0138
; WIPE_START
G1 X126.105 Y117.717 E-.14618
G1 X127.377 Y117.712 E-.54306
G1 X127.54 Y117.737 E-.07076
; WIPE_END
G1 E-.04 F1800
M73 P89 R0
G1 X130.492 Y117.055 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.212856
G1 F15000
G1 X130.523 Y117.228 E.00243
; LINE_WIDTH: 0.166486
G1 X130.553 Y117.401 E.00177
; LINE_WIDTH: 0.120117
G1 X130.583 Y117.574 E.00111
; WIPE_START
G1 X130.553 Y117.401 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.153 Y110.945 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.0997586
G1 F15000
M73 P90 R0
G1 X126.202 Y110.945 E.0183
; WIPE_START
G1 X128.202 Y110.945 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.945 Y111.348 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.0974059
G1 F15000
G1 X120.7 Y111.347 E.01885
G1 X119.603 Y111.347 F30000
; LINE_WIDTH: 0.109542
G1 F15000
G1 X119.476 Y111.361 E.0007
; LINE_WIDTH: 0.135371
G1 X119.343 Y111.376 E.00101
; LINE_WIDTH: 0.173379
G1 X119.194 Y111.401 E.0016
; LINE_WIDTH: 0.222206
G1 X119.046 Y111.425 E.0022
; LINE_WIDTH: 0.248675
G1 X118.639 Y111.503 E.00694
G1 X118.72 Y111.423 F30000
; LINE_WIDTH: 0.265759
G1 F15000
G1 X118.875 Y111.446 E.00284
; LINE_WIDTH: 0.298462
G3 X119.14 Y111.501 I-.824 J4.672 E.00563
G1 X118.72 Y111.423 F30000
; LINE_WIDTH: 0.218605
G1 F15000
G1 X118.558 Y111.399 E.00235
; LINE_WIDTH: 0.180331
G1 X118.409 Y111.385 E.00167
; LINE_WIDTH: 0.15094
G1 X118.257 Y111.37 E.00135
; LINE_WIDTH: 0.10332
G1 X116.944 Y111.351 E.00646
; WIPE_START
G1 X118.257 Y111.37 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.94 Y118.972 Z2.2 F30000
G1 X119.515 Y125.369 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42025
G1 F12000
M204 S2000
G1 X118.56 Y124.413 E.04155
G1 X118.225 Y123.545 E.02862
G1 X119.879 Y125.199 E.07194
G1 X120.413 Y125.199 E.01641
G1 X117.89 Y122.676 E.1097
G1 X117.555 Y121.808 E.02862
G1 X120.946 Y125.199 E.14746
G1 X120.992 Y125.199 E.00141
G1 X121.128 Y124.847 E.01161
G1 X117.22 Y120.939 E.1699
G1 X116.886 Y120.071 E.02862
G1 X121.276 Y124.461 E.19091
G1 X121.424 Y124.076 E.0127
G1 X116.57 Y119.221 E.21109
G1 X117.103 Y119.221 E.01641
G1 X122.727 Y124.845 E.24453
G2 X123.635 Y125.22 I1.721 J-2.882 E.03032
G1 X117.637 Y119.221 E.26083
G1 X118.171 Y119.221 E.01641
G1 X124.417 Y125.468 E.27163
; WIPE_START
M204 S10000
G1 X123.003 Y124.054 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.03 Y125.336 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.250803
G1 F15000
G1 X130.058 Y125.182 E.00265
; LINE_WIDTH: 0.206836
G1 X130.087 Y125.029 E.00209
; LINE_WIDTH: 0.16287
G1 X130.116 Y124.875 E.00153
; LINE_WIDTH: 0.118904
G1 X130.144 Y124.721 E.00097
; WIPE_START
G1 X130.116 Y124.875 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.916 Y132.465 Z2.2 F30000
G1 X131.714 Y140.037 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42055
G1 F15000
G1 X115.545 Y123.868 E.70365
G1 X115.737 Y124.595 E.02314
G1 X131.188 Y140.045 E.67237
G1 X130.78 Y140.172 E.01314
G1 X115.93 Y125.322 E.64624
G1 X116.123 Y126.049 E.02314
G1 X130.352 Y140.277 E.61922
G1 X129.903 Y140.363 E.01406
G1 X116.316 Y126.775 E.5913
G1 X116.508 Y127.502 E.02314
G1 X129.452 Y140.446 E.56328
G1 X128.964 Y140.492 E.01507
G1 X116.701 Y128.229 E.53367
G1 X116.894 Y128.956 E.02314
G1 X128.475 Y140.537 E.50399
G1 X127.941 Y140.537 E.01643
G1 X117.087 Y129.683 E.47236
G1 X117.28 Y130.409 E.02314
G1 X127.397 Y140.526 E.44028
G1 X126.806 Y140.47 E.01824
G1 X117.472 Y131.136 E.4062
G1 X117.665 Y131.863 E.02314
G1 X126.18 Y140.378 E.37054
G1 X125.515 Y140.247 E.02086
G1 X117.858 Y132.59 E.33321
G2 X118.077 Y133.343 I11.986 J-3.079 E.02414
G1 X124.76 Y140.026 E.29083
G1 X124.6 Y139.979 E.00514
G1 X123.9 Y139.701 E.02317
G1 X118.401 Y134.201 E.23933
G2 X118.915 Y135.249 I12.715 J-5.586 E.03593
G1 X122.85 Y139.184 E.17124
G1 X122.52 Y138.995 E.01169
G3 X120.527 Y137.396 I6.537 J-10.188 E.07877
G1 X119.293 Y136.162 E.05369
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X120.527 Y137.396 E-.66306
G1 X120.71 Y137.574 E-.09695
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/10
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z2.2 I1.217 J0 P1  F30000
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
; OBJECT_ID: 1729
G1 X136.081 Y122.568
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X135.855 Y121.987 E.01917
G1 X136.306 Y121.987 E.01385
G1 X136.151 Y122.387 E.0132
G1 X136.103 Y122.512 E.00411
; WIPE_START
M204 S10000
G1 X135.855 Y121.987 E-.27682
G1 X136.306 Y121.987 E-.21472
G1 X136.151 Y122.387 E-.2047
G1 X136.103 Y122.512 E-.06377
; WIPE_END
G1 E-.04 F1800
G1 X132.577 Y123.234 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S5000
G3 X132.263 Y123.255 I-.288 J-1.96 E.00969
G1 X132.263 Y122.858 E.01221
G1 X132.345 Y122.858 E.00251
G3 X132.702 Y122.947 I.079 J.44 E.01165
G1 X132.714 Y122.982 E.00114
G3 X132.634 Y123.213 I-.172 J.07 E.0082
; WIPE_START
M204 S10000
G1 X132.263 Y123.255 E-.18523
G1 X132.263 Y122.858 E-.19715
G1 X132.345 Y122.858 E-.04062
G1 X132.592 Y122.884 E-.1234
G1 X132.665 Y122.909 E-.03849
G1 X132.702 Y122.947 E-.02614
G1 X132.714 Y122.982 E-.01836
G1 X132.721 Y123.08 E-.04847
G1 X132.703 Y123.144 E-.03321
G1 X132.654 Y123.202 E-.03762
G1 X132.634 Y123.213 E-.0113
; WIPE_END
G1 E-.04 F1800
G1 X128.73 Y122.568 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X128.504 Y121.987 E.01917
G1 X128.954 Y121.987 E.01385
G1 X128.8 Y122.387 E.0132
G1 X128.751 Y122.512 E.00411
; WIPE_START
M204 S10000
G1 X128.504 Y121.987 E-.27682
G1 X128.954 Y121.987 E-.21472
G1 X128.8 Y122.387 E-.2047
G1 X128.751 Y122.512 E-.06377
; WIPE_END
G1 E-.04 F1800
G1 X123.703 Y122.085 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X125.142 Y122.085 E.04423
G1 X125.364 Y121.801 E.01105
G3 X124.17 Y123.346 I-1.063 J.412 E.072
G3 X123.232 Y122.048 I.164 J-1.106 E.05482
G3 X124.417 Y121.06 I1.106 J.121 E.05239
G1 X124.491 Y121.069 E.00228
G1 X123.74 Y122.037 E.03765
M204 S10000
G1 X123.553 Y121.84 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.174781
G1 F15000
G1 X123.438 Y122.055 E.00262
G1 X123.553 Y121.84 F30000
; LINE_WIDTH: 0.203909
G1 F15000
G3 X123.851 Y121.467 I1.555 J.937 E.00627
; LINE_WIDTH: 0.159232
G1 X124.008 Y121.326 E.002
G1 X124.013 Y121.333 F30000
; LINE_WIDTH: 0.104256
G1 F15000
G1 X123.568 Y121.659 E.00276
G1 X124.164 Y122.235 F30000
; FEATURE: Top surface
; LINE_WIDTH: 0.47787
G1 F12000
M204 S2000
G1 X123.691 Y122.709 E.02373
G2 X124.035 Y122.979 I.566 J-.366 E.01581
G1 X124.61 Y122.405 E.02879
G1 X125.086 Y122.405 E.0169
G3 X124.999 Y122.631 I-1.002 J-.259 E.00862
G1 X124.436 Y123.194 E.0282
; WIPE_START
M204 S10000
G1 X124.999 Y122.631 E-.30239
G1 X125.086 Y122.405 E-.09217
G1 X124.61 Y122.405 E-.18116
G1 X124.267 Y122.748 E-.18428
; WIPE_END
G1 E-.04 F1800
G1 X119.706 Y121.987 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X120.157 Y121.987 E.01385
G1 X120.002 Y122.387 E.0132
G1 X119.932 Y122.568 E.00596
G1 X119.728 Y122.043 E.01733
; WIPE_START
M204 S10000
G1 X120.157 Y121.987 E-.20293
G1 X120.002 Y122.387 E-.20156
G1 X119.932 Y122.568 E-.09094
G1 X119.728 Y122.043 E-.26456
; WIPE_END
G1 E-.04 F1800
G1 X117.713 Y115.547 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.378512
G1 F12000
M204 S5000
G3 X117.598 Y115.574 I-.082 J-.092 E.00335
G1 X117.598 Y115.327 E.00677
G1 X117.636 Y115.332 E.00104
G3 X117.747 Y115.498 I-.005 J.123 E.00637
; WIPE_START
M204 S10000
G1 X117.598 Y115.574 E-.18537
G1 X117.598 Y115.327 E-.27541
G1 X117.636 Y115.332 E-.04251
G1 X117.731 Y115.379 E-.11789
G1 X117.752 Y115.437 E-.06866
G1 X117.749 Y115.498 E-.06776
M73 P91 R0
G1 X117.747 Y115.498 E-.00239
; WIPE_END
G1 E-.04 F1800
G1 X117.737 Y114.397 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X117.619 Y114.41 E.00365
G1 X117.619 Y114.067 E.01055
G1 X117.659 Y114.067 E.00124
G3 X117.93 Y114.142 I.042 J.375 E.00885
G1 X117.941 Y114.182 E.00126
G3 X117.797 Y114.39 I-.194 J.02 E.00848
; WIPE_START
M204 S10000
G1 X117.619 Y114.41 E-.11675
G1 X117.619 Y114.067 E-.22328
G1 X117.659 Y114.067 E-.02632
G1 X117.833 Y114.088 E-.11346
G1 X117.903 Y114.113 E-.04848
G1 X117.93 Y114.142 E-.02608
G1 X117.941 Y114.182 E-.02661
G1 X117.938 Y114.255 E-.04765
G1 X117.904 Y114.322 E-.04895
G1 X117.824 Y114.374 E-.06221
G1 X117.797 Y114.39 E-.0202
; WIPE_END
G1 E-.04 F1800
G1 X120.439 Y114.815 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S5000
G3 X119.863 Y114.417 I-.182 J-.352 E.02637
G3 X120.29 Y113.975 I.407 J-.033 E.02137
G3 X120.641 Y114.56 I-.068 J.439 E.02392
G1 X120.634 Y114.586 E.00081
G3 X120.49 Y114.783 I-.377 J-.123 E.00764
; WIPE_START
M204 S10000
G1 X120.321 Y114.858 E-.07036
G1 X120.145 Y114.849 E-.06705
G1 X120.005 Y114.773 E-.06018
G1 X119.941 Y114.7 E-.03691
G1 X119.877 Y114.554 E-.06088
G1 X119.863 Y114.417 E-.05231
G1 X119.896 Y114.227 E-.07319
G1 X119.984 Y114.089 E-.06216
G1 X120.107 Y114.002 E-.05731
G1 X120.29 Y113.975 E-.07039
G1 X120.459 Y114.025 E-.06692
G1 X120.54 Y114.091 E-.03967
G1 X120.602 Y114.177 E-.04033
G1 X120.604 Y114.183 E-.00234
; WIPE_END
G1 E-.04 F1800
G1 X125.725 Y114.886 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.378512
G1 F12000
M204 S5000
G1 X125.702 Y114.896 E.00068
G3 X125.332 Y114.886 I-.171 J-.503 E.01034
G1 X125.665 Y114.886 E.0091
; WIPE_START
M204 S10000
G1 X125.702 Y114.896 E-.03925
G1 X125.521 Y114.926 E-.18663
G1 X125.332 Y114.886 E-.1959
G1 X125.665 Y114.886 E-.33822
; WIPE_END
G1 E-.04 F1800
G1 X133.257 Y114.102 Z2.4 F30000
G1 X134.399 Y113.984 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X134.739 Y114.582 I-.064 J.432 E.02435
G3 X133.978 Y114.341 I-.376 J-.135 E.03764
G3 X134.339 Y113.982 I.381 J.022 E.01713
; WIPE_START
M204 S10000
G1 X134.563 Y114.031 E-.08706
G1 X134.646 Y114.097 E-.04026
G1 X134.709 Y114.183 E-.04073
G1 X134.758 Y114.349 E-.06563
G1 X134.739 Y114.582 E-.0889
G1 X134.683 Y114.699 E-.04955
G1 X134.569 Y114.803 E-.05838
G1 X134.425 Y114.848 E-.05721
G1 X134.253 Y114.837 E-.06583
G1 X134.127 Y114.772 E-.05377
G1 X134.024 Y114.65 E-.06067
G1 X133.977 Y114.486 E-.06467
G1 X133.977 Y114.414 E-.02734
; WIPE_END
G1 E-.04 F1800
G1 X136.802 Y114.77 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S5000
G3 X136.652 Y114.341 I.235 J-.324 E.01488
G3 X137.073 Y113.984 I.381 J.022 E.01898
G3 X137.414 Y114.582 I-.064 J.432 E.02435
G3 X136.854 Y114.802 I-.376 J-.135 E.02092
; WIPE_START
M204 S10000
G1 X136.699 Y114.65 E-.08248
G1 X136.651 Y114.486 E-.06469
G1 X136.652 Y114.341 E-.05539
G1 X136.702 Y114.175 E-.06591
G1 X136.802 Y114.057 E-.05882
G1 X136.928 Y113.995 E-.05307
G1 X137.073 Y113.984 E-.05551
G1 X137.237 Y114.031 E-.06474
G1 X137.32 Y114.097 E-.04028
G1 X137.383 Y114.183 E-.04071
G1 X137.432 Y114.349 E-.06563
G1 X137.414 Y114.582 E-.08887
G1 X137.386 Y114.639 E-.0239
; WIPE_END
G1 E-.04 F1800
G1 X129.765 Y114.23 Z2.4 F30000
G1 X126.376 Y114.049 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X126.795 Y113.852 E.01422
G1 X126.795 Y114.049 E.00605
G1 X126.436 Y114.049 E.01102
M204 S10000
G1 X125.636 Y113.961 F30000
G1 F12000
M204 S5000
G3 X125.845 Y114.049 I-.083 J.491 E.00701
G1 X125.234 Y114.049 E.01877
G3 X125.577 Y113.952 I.297 J.396 E.0112
; WIPE_START
M204 S10000
G1 X125.748 Y113.994 E-.10599
G1 X125.845 Y114.049 E-.0669
G1 X125.234 Y114.049 E-.36775
G1 X125.342 Y113.984 E-.07567
G1 X125.42 Y113.962 E-.04903
G1 X125.577 Y113.952 E-.09465
; WIPE_END
G1 E-.04 F1800
G1 X130.715 Y119.596 Z2.4 F30000
G1 X131.082 Y120 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X132.263 Y120 E.03628
G1 X132.263 Y121.195 E.03673
G1 X132.898 Y120 E.04158
G1 X135.082 Y120 E.06712
G1 X135.408 Y120.824 E.02723
G1 X136.752 Y120.824 E.0413
G1 X137.065 Y120 E.02708
G1 X138.307 Y120 E.03817
G1 X136.606 Y124.42 E.14552
G1 X135.546 Y124.42 E.03258
G1 X133.995 Y120.397 E.1325
G1 X133.201 Y121.888 E.05189
G3 X133.875 Y122.938 I-.553 J1.096 E.04022
G3 X132.875 Y124.359 I-1.276 J.164 E.05863
G3 X131.082 Y124.42 I-1.283 J-11.309 E.05516
G1 X131.082 Y120.06 E.13397
M204 S10000
G1 X130.955 Y120 F30000
G1 F12000
M204 S5000
G1 X129.255 Y124.42 E.14552
G1 X128.195 Y124.42 E.03258
G1 X126.579 Y120.228 E.13804
G1 X126.143 Y120.79 E.02183
G3 X125.446 Y124.229 I-1.871 J1.411 E.12184
G3 X125.253 Y120.085 I-1.11 J-2.025 E.28741
G1 X125.565 Y119.685 E.01558
G1 X126.999 Y119.685 E.04408
G1 X126.755 Y120 E.01225
G1 X127.731 Y120 E.02997
G1 X128.057 Y120.824 E.02723
G1 X129.401 Y120.824 E.0413
G1 X129.713 Y120 E.02708
G1 X130.895 Y120 E.03633
; WIPE_START
M204 S10000
G1 X130.2 Y121.875 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.766 Y120.142 Z2.4 F30000
G1 X122.158 Y120 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X120.457 Y124.42 E.14552
G1 X119.397 Y124.42 E.03258
G1 X117.693 Y120 E.14556
G1 X118.933 Y120 E.03811
G1 X119.259 Y120.824 E.02723
G1 X120.604 Y120.824 E.0413
G1 X120.916 Y120 E.02708
G1 X122.098 Y120 E.03633
; WIPE_START
M204 S10000
G1 X121.402 Y121.875 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.067 Y115.739 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X122.789 Y115.739 E.00853
G1 X122.789 Y116.557 E.02513
G1 X121.814 Y116.557 E.02995
G1 X121.814 Y115.739 E.02513
G1 X120.63 Y115.739 E.03641
G1 X120.63 Y115.688 E.00157
G3 X120.234 Y115.793 I-.606 J-1.484 E.01262
G3 X118.889 Y114.467 I-.058 J-1.286 E.06514
G3 X118.528 Y115.003 I-.934 J-.24 E.02024
G3 X117.965 Y116.46 I-.768 J.541 E.05667
G3 X116.628 Y116.52 I-.961 J-6.425 E.04122
G1 X116.628 Y113.099 E.10513
G1 X117.841 Y113.105 E.03728
G3 X118.92 Y114.093 I-.007 J1.091 E.04928
G3 X120.63 Y113.145 I1.235 J.211 E.06891
G1 X120.63 Y113.1 E.00139
G1 X121.604 Y113.1 E.02995
G1 X121.604 Y114.84 E.05345
G1 X121.814 Y114.84 E.00646
G1 X121.814 Y113.1 E.05345
G1 X122.789 Y113.1 E.02995
G1 X122.789 Y114.84 E.05345
G1 X123.067 Y114.84 E.00853
G1 X123.067 Y113.1 E.05345
G1 X124.041 Y113.1 E.02995
G1 X124.041 Y114.84 E.05345
G1 X124.207 Y114.84 E.00509
G3 X124.346 Y113.674 I1.509 J-.411 E.03696
G3 X126.795 Y113.726 I1.208 J.815 E.0894
G1 X126.795 Y113.1 E.01923
G1 X127.768 Y113.1 E.02991
G2 X127.77 Y114.494 I27.757 J.67 E.04284
G2 X127.866 Y114.886 I.577 J.065 E.01266
G2 X128.146 Y114.773 I-.212 J-.926 E.00931
G1 X128.222 Y114.983 E.00688
G1 X128.84 Y113.481 E.04992
G1 X128.283 Y112.289 E.04044
G1 X129.323 Y112.289 E.03195
G1 X130.906 Y115.739 E.11666
G1 X129.873 Y115.739 E.03174
G1 X129.381 Y114.662 E.03639
G1 X128.934 Y115.739 E.03583
G1 X128.237 Y115.739 E.02142
G3 X127.691 Y115.739 I-.273 J-.677 E.01721
G1 X126.795 Y115.739 E.02753
G1 X126.795 Y114.949 E.02429
G3 X124.375 Y115.202 I-1.278 J-.524 E.09144
G1 X124.372 Y115.739 E.01651
G1 X124.041 Y115.739 E.01015
G1 X124.041 Y116.557 E.02513
G1 X123.067 Y116.557 E.02995
G1 X123.067 Y115.799 E.02328
; WIPE_START
M204 S10000
G1 X122.789 Y115.739 E-.10793
G1 X122.789 Y116.557 E-.31073
G1 X121.891 Y116.557 E-.34135
; WIPE_END
G1 E-.04 F1800
G1 X129.474 Y115.691 Z2.4 F30000
G1 X138.396 Y114.672 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S5000
G3 X135.708 Y114.737 I-1.351 J-.251 E.11508
G3 X133.226 Y115.185 I-1.339 J-.319 E.09794
G1 X133.226 Y115.739 E.01701
G1 X132.896 Y115.739 E.01015
G1 X132.896 Y116.557 E.02513
G1 X131.921 Y116.557 E.02995
G1 X131.921 Y115.739 E.02513
G1 X131.636 Y115.739 E.00877
G1 X131.636 Y114.84 E.02764
G1 X131.921 Y114.84 E.00877
G1 X131.921 Y113.1 E.05345
G1 X132.896 Y113.1 E.02995
G1 X132.896 Y114.84 E.05345
G1 X133.06 Y114.84 E.00505
G3 X135.707 Y114.1 I1.308 J-.425 E.13627
G3 X136.841 Y113.055 I1.344 J.321 E.05026
G3 X138.396 Y114.164 I.191 J1.377 E.06469
G1 X138.396 Y113.1 E.03269
G1 X139.372 Y113.1 E.03002
G1 X139.372 Y116.596 E.10741
G1 X138.396 Y116.596 E.03002
G1 X138.396 Y114.732 E.05727
; WIPE_START
M204 S10000
G1 X138.337 Y114.892 E-.06489
G1 X138.219 Y115.137 E-.10306
G1 X138.144 Y115.247 E-.05048
G1 X137.973 Y115.434 E-.0966
G1 X137.869 Y115.519 E-.05086
G1 X137.612 Y115.671 E-.11343
G1 X137.367 Y115.756 E-.09881
G1 X137.111 Y115.795 E-.09832
G1 X136.97 Y115.795 E-.05367
G1 X136.892 Y115.784 E-.02989
; WIPE_END
G1 E-.04 F1800
G1 X129.397 Y114.339 Z2.4 F30000
G1 X114.014 Y111.372 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S5000
G3 X117.004 Y110.32 I2.999 J3.746 E.09927
G1 X139.009 Y110.32 E.67615
G3 X143.628 Y116.342 I-.021 J4.798 E.26897
G1 X139.184 Y133.078 E.53208
G3 X116.816 Y133.078 I-11.184 J-2.97 E.93246
G1 X112.372 Y116.342 E.53209
G3 X113.967 Y111.41 I4.64 J-1.223 E.16824
M204 S10000
G1 X114.719 Y111.077 F30000
; FEATURE: Top surface
; LINE_WIDTH: 0.42179
G1 F12000
M204 S2000
G1 X113.73 Y112.066 E.04319
G2 X112.841 Y113.492 I3.153 J2.958 E.05221
G1 X115.376 Y110.957 E.11069
G1 X115.522 Y110.893 E.00494
G1 X116.144 Y110.725 E.01987
G1 X112.62 Y114.248 E.15384
G2 X112.551 Y114.853 I2.465 J.586 E.01883
G1 X116.751 Y110.653 E.18336
G3 X117.299 Y110.641 I.404 J5.702 E.01694
G1 X112.546 Y115.394 E.20753
G2 X112.602 Y115.873 I2.509 J-.053 E.01492
G1 X117.835 Y110.641 E.22846
G1 X118.371 Y110.641 E.01654
G1 X112.562 Y116.449 E.25361
; WIPE_START
M204 S10000
G1 X113.976 Y115.035 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X121.6 Y115.406 Z2.4 F30000
G1 X139.523 Y116.278 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X142.886 Y112.915 E.14684
G2 X142.68 Y112.585 I-1.81 J.899 E.01203
G1 X139.693 Y115.573 E.13045
G1 X139.693 Y115.037 E.01654
G1 X142.451 Y112.279 E.12043
G2 X142.199 Y111.995 I-1.593 J1.161 E.01174
G1 X139.693 Y114.501 E.10942
G1 X139.693 Y113.965 E.01654
G1 X141.925 Y111.734 E.09744
G1 X141.627 Y111.496 E.01177
G1 X139.693 Y113.43 E.08444
G1 X139.693 Y112.894 E.01654
G1 X141.303 Y111.283 E.07031
G2 X140.955 Y111.096 I-1.144 J1.705 E.01223
G1 X139.271 Y112.78 E.07353
G1 X138.735 Y112.78 E.01654
M73 P92 R0
G1 X140.581 Y110.934 E.08057
G2 X140.176 Y110.803 I-.882 J2.026 E.01315
G1 X137.976 Y113.003 E.09606
G2 X137.617 Y112.827 I-.633 J.834 E.01243
G1 X139.737 Y110.706 E.09259
G2 X139.248 Y110.659 I-.439 J2.011 E.0152
G1 X137.177 Y112.73 E.09043
G1 X137.13 Y112.724 E.00146
G2 X136.59 Y112.782 I-.09 J1.704 E.01685
G1 X138.731 Y110.641 E.09348
G1 X138.195 Y110.641 E.01654
G1 X135.59 Y113.246 E.11374
G2 X135.299 Y113.001 I-.948 J.834 E.01179
G1 X137.659 Y110.641 E.10307
G1 X137.124 Y110.641 E.01654
G1 X134.939 Y112.825 E.09538
G2 X134.496 Y112.733 I-.488 J1.233 E.01406
G1 X136.588 Y110.641 E.09135
G1 X136.052 Y110.641 E.01654
G1 X133.908 Y112.784 E.09359
G2 X133.384 Y113.034 I.663 J2.073 E.01799
G1 X133.264 Y112.893 E.0057
G1 X135.516 Y110.641 E.09833
G1 X134.98 Y110.641 E.01654
G1 X132.841 Y112.78 E.09339
G1 X132.306 Y112.78 E.01654
G1 X134.445 Y110.641 E.09339
G1 X133.909 Y110.641 E.01654
G1 X130.488 Y114.061 E.14934
G1 X130.32 Y113.694 E.01248
G1 X133.373 Y110.641 E.1333
G1 X132.837 Y110.641 E.01654
G1 X130.151 Y113.327 E.11727
G1 X129.983 Y112.959 E.01248
G1 X132.301 Y110.641 E.10123
G1 X131.766 Y110.641 E.01654
G1 X129.814 Y112.592 E.0852
G1 X129.646 Y112.225 E.01248
G1 X131.23 Y110.641 E.06916
G1 X130.694 Y110.641 E.01654
G1 X129.367 Y111.968 E.05796
G1 X128.831 Y111.968 E.01654
G1 X130.158 Y110.641 E.05796
G1 X129.622 Y110.641 E.01654
G1 X128.295 Y111.968 E.05796
G1 X127.779 Y111.968 E.01592
G1 X127.944 Y112.32 E.01198
G1 X127.483 Y112.78 E.02009
G1 X126.948 Y112.78 E.01654
G1 X129.087 Y110.641 E.09339
G1 X128.551 Y110.641 E.01654
G1 X126.31 Y112.882 E.09786
G2 X125.898 Y112.757 I-.525 J.993 E.01335
G1 X128.015 Y110.641 E.09242
G1 X127.479 Y110.641 E.01654
G1 X125.39 Y112.73 E.0912
G2 X124.659 Y112.948 I.126 J1.755 E.02374
G1 X124.65 Y112.934 E.00051
G1 X126.944 Y110.641 E.10015
G1 X126.408 Y110.641 E.01654
G1 X124.269 Y112.78 E.09339
G1 X123.733 Y112.78 E.01654
G1 X125.872 Y110.641 E.09339
G1 X125.336 Y110.641 E.01654
G1 X123.197 Y112.78 E.0934
G1 X122.661 Y112.78 E.01654
G1 X124.8 Y110.641 E.0934
G1 X124.265 Y110.641 E.01654
G1 X122.125 Y112.78 E.0934
G1 X121.59 Y112.78 E.01654
G1 X123.729 Y110.641 E.0934
G1 X123.193 Y110.641 E.01654
G1 X121.054 Y112.78 E.0934
G1 X120.531 Y112.767 E.01616
G1 X122.657 Y110.641 E.09285
G1 X122.121 Y110.641 E.01654
G1 X120.03 Y112.731 E.09129
G2 X118.944 Y113.316 I.127 J1.539 E.03918
G1 X118.928 Y113.298 E.00074
G1 X121.586 Y110.641 E.11605
G1 X121.05 Y110.641 E.01654
G1 X118.648 Y113.043 E.10488
G2 X118.29 Y112.865 I-.651 J.86 E.01241
G1 X120.514 Y110.641 E.09711
G1 X119.978 Y110.641 E.01654
G1 X117.834 Y112.785 E.09361
G1 X117.301 Y112.782 E.01646
G1 X119.442 Y110.641 E.0935
G1 X118.907 Y110.641 E.01654
G1 X116.768 Y112.779 E.09338
G1 X116.307 Y112.777 E.01422
G1 X116.307 Y113.24 E.01429
G1 X112.813 Y116.734 E.15255
G1 X112.925 Y117.157 E.01353
G1 X116.307 Y113.776 E.14765
G1 X116.307 Y114.312 E.01654
G1 X113.038 Y117.581 E.14275
G1 X113.15 Y118.004 E.01353
G1 X116.307 Y114.847 E.13784
G1 X116.307 Y115.383 E.01654
G1 X113.262 Y118.428 E.13294
G1 X113.375 Y118.851 E.01353
G1 X116.307 Y115.919 E.12804
G1 X116.307 Y116.455 E.01654
G1 X113.487 Y119.275 E.12313
G1 X113.599 Y119.698 E.01353
G1 X116.457 Y116.841 E.12476
G1 X116.993 Y116.84 E.01656
G1 X113.712 Y120.122 E.14328
G1 X113.824 Y120.545 E.01353
G1 X117.724 Y116.645 E.1703
; WIPE_START
M204 S10000
G1 X116.31 Y118.059 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.897 Y115.296 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.138249
G1 F15000
G1 X118.956 Y115.446 E.00125
G1 X119.004 Y115.468 E.00041
; LINE_WIDTH: 0.104135
G1 X119.059 Y115.519 E.00038
G1 X119.273 Y115.632 F30000
; FEATURE: Top surface
; LINE_WIDTH: 0.42179
G1 F12000
M204 S2000
G1 X113.936 Y120.969 E.23303
G1 X114.048 Y121.392 E.01353
G1 X119.474 Y115.967 E.23689
G1 X119.779 Y116.078 E.01002
G1 X119.885 Y116.091 E.00331
G1 X114.161 Y121.816 E.24994
M73 P93 R0
G1 X114.273 Y122.239 E.01353
G1 X120.419 Y116.094 E.26832
G1 X120.524 Y116.06 E.00344
G1 X120.989 Y116.06 E.01434
G1 X114.247 Y122.802 E.29437
; WIPE_START
M204 S10000
G1 X115.661 Y121.387 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.59 Y124.496 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X121.9 Y123.186 E.05719
G3 X121.821 Y122.926 I.732 J-.364 E.00842
G1 X121.654 Y122.895 E.00523
G1 X120.925 Y123.625 E.03185
; WIPE_START
M204 S10000
G1 X121.654 Y122.895 E-.392
G1 X121.821 Y122.926 E-.06442
G1 X121.9 Y123.186 E-.10313
G1 X121.527 Y123.559 E-.20045
; WIPE_END
G1 E-.04 F1800
G1 X121.62 Y122.563 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.355205
G1 F15000
G3 X121.702 Y122.123 I13.211 J2.247 E.0114
; LINE_WIDTH: 0.309353
G1 X121.721 Y122.03 E.00205
; LINE_WIDTH: 0.278533
G1 X121.745 Y121.927 E.00204
; LINE_WIDTH: 0.251872
G1 X121.767 Y121.837 E.00157
; LINE_WIDTH: 0.221364
G1 X121.816 Y121.658 E.0027
; LINE_WIDTH: 0.184674
G1 X121.933 Y121.307 E.00428
G1 X122.148 Y120.817 E.00618
; LINE_WIDTH: 0.241205
G1 X122.235 Y120.652 E.00302
; LINE_WIDTH: 0.278667
G1 X122.286 Y120.562 E.00198
; LINE_WIDTH: 0.30891
G1 X122.334 Y120.48 E.00206
; LINE_WIDTH: 0.342294
G1 X122.388 Y120.392 E.00252
; LINE_WIDTH: 0.378794
G1 X122.437 Y120.312 E.00256
; LINE_WIDTH: 0.410492
G1 X122.574 Y120.106 E.00741
; WIPE_START
G1 X122.437 Y120.312 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.237 Y113.373 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.144554
G1 F15000
G1 X124.326 Y113.303 E.00094
; LINE_WIDTH: 0.116329
G1 X124.454 Y113.211 E.00094
; WIPE_START
G1 X124.326 Y113.303 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.061 Y114.596 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.378579
G1 F15000
G1 X128.107 Y114.363 E.00648
; LINE_WIDTH: 0.424394
G1 X128.154 Y114.131 E.00736
; LINE_WIDTH: 0.470208
G1 F14744.164
G1 X128.2 Y113.899 E.00825
; LINE_WIDTH: 0.516022
G1 F13316.365
G1 X128.246 Y113.666 E.00913
; LINE_WIDTH: 0.561837
G1 F12140.685
G1 X128.292 Y113.434 E.01002
; LINE_WIDTH: 0.607651
G1 F11155.76
G1 X128.338 Y113.202 E.0109
; LINE_WIDTH: 0.653465
G1 F10318.649
G1 X128.385 Y112.969 E.01179
; WIPE_START
G1 X128.338 Y113.202 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X133.21 Y113.323 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.106849
G1 F15000
G1 X133.129 Y113.392 E.00055
G1 X133.11 Y113.447 E.0003
; WIPE_START
G1 X133.129 Y113.392 E-.2706
G1 X133.21 Y113.323 E-.4894
; WIPE_END
G1 E-.04 F1800
G1 X133.625 Y115.747 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42179
G1 F12000
M204 S2000
G1 X133.047 Y116.325 E.02524
; WIPE_START
M204 S10000
G1 X133.625 Y115.747 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.035 Y115.658 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X131.316 Y115.377 E.01227
G1 X131.316 Y114.841 E.01654
G1 X130.994 Y115.163 E.01404
G1 X130.826 Y114.796 E.01248
G1 X131.601 Y114.02 E.03385
G1 X131.601 Y113.484 E.01654
G1 X130.529 Y114.556 E.0468
; WIPE_START
M204 S10000
G1 X131.601 Y113.484 E-.57602
G1 X131.601 Y113.969 E-.18398
; WIPE_END
G1 E-.04 F1800
G1 X129.594 Y115.491 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X125.721 Y119.365 E.16911
G1 X126.257 Y119.365 E.01654
G1 X129.634 Y115.987 E.14746
G1 X129.667 Y116.06 E.00246
G1 X130.097 Y116.06 E.01329
G1 X126.792 Y119.365 E.1443
G1 X127.328 Y119.365 E.01654
G1 X130.633 Y116.06 E.1443
G1 X131.169 Y116.06 E.01654
G1 X127.549 Y119.68 E.15806
G1 X127.948 Y119.68 E.01233
G1 X127.987 Y119.777 E.00324
G1 X131.601 Y116.163 E.15778
G1 X131.601 Y116.699 E.01654
G1 X128.139 Y120.161 E.15115
G1 X128.275 Y120.504 E.01138
G1 X128.332 Y120.504 E.00177
G1 X131.959 Y116.877 E.15834
G1 X132.495 Y116.877 E.01654
G1 X128.698 Y120.673 E.16575
; WIPE_START
M204 S10000
G1 X130.113 Y119.259 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.019 Y122.561 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.417361
G1 F15000
G1 X126.987 Y122.341 E.00677
; LINE_WIDTH: 0.388918
G1 X126.969 Y122.241 E.00287
; LINE_WIDTH: 0.348473
G1 X126.95 Y122.131 E.00278
; LINE_WIDTH: 0.312862
G1 X126.93 Y122.039 E.00207
; LINE_WIDTH: 0.282207
G1 X126.908 Y121.94 E.00198
; LINE_WIDTH: 0.242583
G1 X126.861 Y121.752 E.00315
; LINE_WIDTH: 0.19121
G1 X126.755 Y121.406 E.00437
; LINE_WIDTH: 0.17288
G1 X126.549 Y120.908 E.00571
; LINE_WIDTH: 0.205606
G1 X126.452 Y120.712 E.0029
; WIPE_START
G1 X126.549 Y120.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.759 Y119.79 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42179
G1 F12000
M204 S2000
G1 X128.49 Y116.06 E.16289
G2 X128.123 Y116.106 I-.103 J.649 E.01157
G3 X127.901 Y116.113 I-.134 J-.734 E.0069
G1 X124.427 Y119.587 E.15167
G1 X124.336 Y119.578 E.00282
G2 X123.859 Y119.619 I-.042 J2.287 E.01482
G1 X127.418 Y116.06 E.15543
G1 X126.883 Y116.06 E.01654
G1 X123.019 Y119.923 E.16869
G1 X122.948 Y119.97 E.00264
G1 X122.641 Y119.765 E.01138
G1 X126.474 Y115.932 E.16737
G1 X126.474 Y115.838 E.00289
G3 X125.772 Y116.098 I-.843 J-1.199 E.02338
G1 X122.191 Y119.68 E.15637
G1 X121.655 Y119.68 E.01654
G1 X125.238 Y116.096 E.15645
G3 X124.82 Y115.979 I.503 J-2.595 E.01343
G1 X124.362 Y116.437 E.02001
G1 X124.362 Y116.877 E.01358
G1 X123.922 Y116.877 E.01358
G1 X121.119 Y119.68 E.12236
G1 X120.694 Y119.68 E.01312
G1 X120.435 Y120.364 E.02258
G1 X120.295 Y120.504 E.00612
G1 X119.759 Y120.504 E.01654
G1 X123.386 Y116.877 E.15834
G1 X122.85 Y116.877 E.01654
G1 X119.405 Y120.322 E.15041
G1 X119.253 Y119.938 E.01274
G1 X122.314 Y116.877 E.13365
G1 X121.779 Y116.877 E.01654
G1 X118.976 Y119.68 E.12236
G1 X118.44 Y119.68 E.01654
G1 X121.494 Y116.626 E.13333
G1 X121.494 Y116.09 E.01654
G1 X117.735 Y119.849 E.16414
M204 S10000
G1 X117.546 Y120.038 F30000
G1 F12000
M204 S2000
G1 X114.498 Y123.086 E.13309
G1 X114.61 Y123.51 E.01353
G1 X117.564 Y120.556 E.12897
G1 X117.713 Y120.943 E.0128
G1 X114.722 Y123.933 E.13058
G1 X114.835 Y124.357 E.01353
G1 X117.862 Y121.329 E.13218
G1 X118.011 Y121.716 E.0128
G1 X114.947 Y124.78 E.13379
G1 X115.059 Y125.204 E.01353
G1 X118.16 Y122.103 E.13539
G1 X118.309 Y122.49 E.0128
G1 X115.172 Y125.627 E.137
G1 X115.284 Y126.051 E.01353
G1 X118.458 Y122.876 E.13861
G1 X118.607 Y123.263 E.0128
G1 X115.396 Y126.474 E.14021
G1 X115.508 Y126.898 E.01353
G1 X118.757 Y123.65 E.14182
G1 X118.906 Y124.036 E.0128
G1 X115.621 Y127.321 E.14342
G1 X115.733 Y127.745 E.01353
G1 X119.055 Y124.423 E.14503
M73 P94 R0
G1 X119.177 Y124.741 E.0105
G1 X119.273 Y124.741 E.00297
G1 X115.845 Y128.168 E.14967
G1 X115.958 Y128.592 E.01353
G1 X119.809 Y124.741 E.16816
G1 X120.345 Y124.741 E.01654
G1 X116.07 Y129.015 E.18665
G1 X116.182 Y129.439 E.01353
G1 X122.076 Y123.545 E.25735
G1 X122.296 Y123.861 E.01189
G1 X116.295 Y129.862 E.26202
G1 X116.407 Y130.286 E.01353
G1 X122.557 Y124.136 E.26851
G2 X122.85 Y124.378 I.876 J-.762 E.0118
G1 X116.519 Y130.709 E.27642
G1 X116.631 Y131.133 E.01353
G1 X123.192 Y124.573 E.28642
G1 X123.573 Y124.727 E.01271
G1 X116.744 Y131.556 E.29819
G1 X116.856 Y131.98 E.01353
G1 X124.014 Y124.822 E.31251
G2 X124.539 Y124.833 I.319 J-2.708 E.01623
G1 X116.968 Y132.403 E.33053
G1 X117.081 Y132.827 E.01353
G1 X125.24 Y124.667 E.35626
G1 X125.446 Y124.595 E.00672
G1 X125.917 Y124.297 E.01722
G1 X126.332 Y123.893 E.01786
G1 X126.559 Y123.578 E.01198
G1 X126.765 Y123.143 E.01488
G1 X127.024 Y122.884 E.0113
G1 X127.246 Y122.852 E.00695
G1 X127.343 Y123.101 E.00825
G1 X117.2 Y133.244 E.44284
G1 X117.323 Y133.656 E.01329
G1 X127.492 Y123.488 E.44396
G1 X127.641 Y123.874 E.0128
G1 X117.472 Y134.043 E.44398
G1 X117.622 Y134.429 E.01278
G1 X127.79 Y124.261 E.44395
G1 X127.939 Y124.648 E.0128
G1 X117.78 Y134.806 E.44353
G1 X117.955 Y135.168 E.01239
G1 X128.382 Y124.741 E.45527
G1 X128.918 Y124.741 E.01654
G1 X118.019 Y135.639 E.47586
; WIPE_START
M204 S10000
G1 X119.433 Y134.225 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.588 Y137.821 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X132.701 Y124.708 E.5725
G3 X132.136 Y124.737 I-.479 J-3.763 E.01749
G1 X119.459 Y137.414 E.55348
G1 X119.209 Y137.128 E.01172
G1 X131.598 Y124.739 E.54092
G1 X131.061 Y124.741 E.01659
G1 X118.982 Y136.819 E.52736
G1 X118.758 Y136.507 E.01185
G1 X130.762 Y124.504 E.52408
G1 X130.762 Y123.968 E.01654
G1 X118.538 Y136.192 E.53371
G1 X118.34 Y135.854 E.0121
G1 X130.762 Y123.432 E.54233
G1 X130.762 Y122.896 E.01654
G1 X129.823 Y123.835 E.04098
G1 X130.158 Y122.964 E.02881
G1 X130.809 Y122.313 E.02841
M204 S10000
G1 X130.626 Y122.126 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.458568
G1 F15000
G1 X130.656 Y121.966 E.00552
; LINE_WIDTH: 0.410348
G1 X130.686 Y121.806 E.00488
; LINE_WIDTH: 0.362128
G1 X130.715 Y121.646 E.00424
; LINE_WIDTH: 0.313909
G1 X130.745 Y121.486 E.0036
; LINE_WIDTH: 0.265689
G1 X130.775 Y121.325 E.00296
; LINE_WIDTH: 0.217469
G1 X130.805 Y121.165 E.00232
; LINE_WIDTH: 0.16925
G1 X130.834 Y121.005 E.00168
; LINE_WIDTH: 0.12103
G1 X130.864 Y120.845 E.00104
; WIPE_START
G1 X130.834 Y121.005 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.058 Y119.849 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42179
G1 F12000
M204 S2000
G1 X133.868 Y116.039 E.16636
G2 X134.332 Y116.111 I.431 J-1.254 E.01457
G1 X130.764 Y119.68 E.15582
G1 X131.3 Y119.68 E.01654
G1 X134.99 Y115.99 E.16112
G2 X135.71 Y115.459 I-.548 J-1.499 E.028
G2 X135.874 Y115.641 I.563 J-.344 E.0076
G1 X131.835 Y119.68 E.17635
G1 X132.371 Y119.68 E.01654
G1 X136.178 Y115.873 E.16621
G2 X136.546 Y116.04 I.605 J-.841 E.01257
G1 X132.907 Y119.68 E.15889
G1 X133.443 Y119.68 E.01654
G1 X137.007 Y116.116 E.15561
G2 X137.668 Y115.991 I-.016 J-1.894 E.02087
G1 X133.979 Y119.68 E.16107
G1 X134.514 Y119.68 E.01654
G1 X138.075 Y116.119 E.15547
G1 X138.075 Y116.655 E.01654
G1 X135.05 Y119.68 E.13208
M73 P95 R0
G1 X135.3 Y119.68 E.00771
G1 X135.381 Y119.885 E.00681
G1 X138.349 Y116.916 E.12961
G1 X138.885 Y116.916 E.01654
G1 X135.533 Y120.269 E.14636
G1 X135.626 Y120.504 E.00781
G1 X135.833 Y120.504 E.0064
G1 X143.067 Y113.271 E.31581
G3 X143.219 Y113.654 I-1.906 J.981 E.01275
G1 X137.193 Y119.68 E.2631
G1 X137.729 Y119.68 E.01654
G1 X143.34 Y114.069 E.24499
G3 X143.424 Y114.521 I-2.295 J.659 E.01421
G1 X138.265 Y119.68 E.22525
G1 X138.773 Y119.68 E.0157
G1 X138.756 Y119.724 E.00147
G1 X143.462 Y115.018 E.20547
G3 X143.431 Y115.585 I-2.358 J.155 E.01757
G1 X138.421 Y120.595 E.21875
G1 X138.086 Y121.466 E.02881
G1 X143.325 Y116.227 E.22873
G3 X143.134 Y116.954 I-7.648 J-1.621 E.02321
G1 X137.751 Y122.337 E.23503
G1 X137.416 Y123.208 E.02881
G1 X142.94 Y117.683 E.2412
G1 X142.747 Y118.413 E.0233
G1 X136.785 Y124.374 E.26027
; WIPE_START
M204 S10000
G1 X138.2 Y122.96 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.922 Y119.951 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X136.2 Y120.673 E.03154
; WIPE_START
M204 S10000
G1 X136.922 Y119.951 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X133.417 Y121.849 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X133.99 Y121.275 E.02502
G1 X134.139 Y121.662 E.0128
G1 X133.825 Y121.977 E.01373
G1 X134.04 Y122.297 E.01192
G1 X134.288 Y122.049 E.01083
G1 X134.437 Y122.436 E.0128
G1 X134.164 Y122.709 E.01192
G3 X134.19 Y123.219 I-2.166 J.366 E.0158
G1 X134.587 Y122.822 E.0173
G1 X134.736 Y123.209 E.0128
G1 X119.966 Y137.979 E.64487
G1 X120.241 Y138.24 E.0117
G1 X134.885 Y123.596 E.63937
G1 X135.034 Y123.983 E.0128
G1 X120.516 Y138.501 E.63387
G2 X120.799 Y138.753 I2.162 J-2.147 E.01172
G1 X135.183 Y124.369 E.628
G1 X135.326 Y124.741 E.01229
M73 P96 R0
G1 X135.347 Y124.741 E.00066
G1 X121.098 Y138.989 E.62212
G1 X121.403 Y139.22 E.01181
G1 X135.883 Y124.741 E.6322
G1 X136.419 Y124.741 E.01654
G1 X121.724 Y139.436 E.64161
G1 X122.051 Y139.645 E.01198
G1 X142.553 Y119.142 E.89516
G1 X142.359 Y119.872 E.0233
G1 X122.377 Y139.854 E.87243
G2 X122.73 Y140.037 I1.135 J-1.753 E.01229
G1 X142.166 Y120.601 E.84858
G1 X141.972 Y121.331 E.0233
G1 X123.084 Y140.219 E.82466
G2 X123.446 Y140.393 I1.096 J-1.816 E.01241
G1 X141.778 Y122.06 E.8004
G1 X141.584 Y122.79 E.0233
G1 X123.829 Y140.545 E.77522
G1 X124.212 Y140.698 E.01273
G1 X141.391 Y123.519 E.75003
G1 X141.197 Y124.249 E.0233
G1 X124.613 Y140.833 E.72409
G2 X125.022 Y140.959 I1.19 J-3.134 E.01324
G1 X141.003 Y124.978 E.69775
G1 X140.81 Y125.708 E.0233
G1 X125.454 Y141.064 E.67045
G2 X125.898 Y141.155 I.799 J-2.762 E.01402
G1 X140.616 Y126.437 E.64258
G1 X140.422 Y127.167 E.0233
G1 X126.361 Y141.228 E.61394
G2 X126.829 Y141.296 I.591 J-2.427 E.01462
G1 X140.228 Y127.896 E.58506
G1 X140.035 Y128.626 E.0233
G1 X127.333 Y141.328 E.5546
G2 X127.838 Y141.359 I.413 J-2.64 E.01565
G1 X139.841 Y129.355 E.52408
G1 X139.647 Y130.085 E.0233
G1 X128.391 Y141.341 E.49146
G2 X128.951 Y141.317 I.155 J-2.957 E.01731
G1 X139.454 Y130.814 E.45857
G1 X139.26 Y131.544 E.0233
G1 X129.564 Y141.239 E.42332
G2 X130.208 Y141.132 I-.243 J-3.435 E.02016
G1 X139.066 Y132.273 E.38678
G3 X138.872 Y133.004 I-11.788 J-2.746 E.02333
G1 X130.899 Y140.977 E.34812
G1 X131.682 Y140.73 E.02535
G1 X138.633 Y133.779 E.30348
G3 X138.28 Y134.667 I-7.194 J-2.34 E.02951
G1 X132.57 Y140.377 E.24933
G2 X133.663 Y139.82 I-2.383 J-6.027 E.03792
G1 X137.727 Y135.756 E.17746
G3 X137.034 Y136.815 I-8.724 J-4.95 E.03912
G1 X136.356 Y137.644 E.03305
G3 X134.608 Y139.411 I-44.331 J-42.102 E.07675
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F12000
M204 S10000
G1 X136.014 Y137.989 E-.76
; WIPE_END
G1 E-.04 F1800
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
G1 Z2.5 F900 ; lower z a little
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

    G1 Z102 F600
    G1 Z100

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END


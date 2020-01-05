(define (problem roverprob1425) (:domain Rover)
(:objects
	general - Lander
	colour high_res low_res - Mode
	rover0 rover1 rover2 rover3 - Rover
	rover0store rover1store rover2store rover3store - Store
	waypoint0 waypoint1 waypoint2 waypoint3 waypoint4 waypoint5 waypoint6 waypoint7 waypoint8 waypoint9 - Waypoint
	camera0 camera1 camera2 camera3 camera4 - Camera
	objective0 objective1 objective2 objective3 - Objective
	)
(:init
	(visible waypoint0 waypoint3)
	(visible waypoint3 waypoint0)
	(visible waypoint0 waypoint9)
	(visible waypoint9 waypoint0)
	(visible waypoint1 waypoint8)
	(visible waypoint8 waypoint1)
	(visible waypoint2 waypoint1)
	(visible waypoint1 waypoint2)
	(visible waypoint2 waypoint3)
	(visible waypoint3 waypoint2)
	(visible waypoint2 waypoint6)
	(visible waypoint6 waypoint2)
	(visible waypoint2 waypoint9)
	(visible waypoint9 waypoint2)
	(visible waypoint3 waypoint5)
	(visible waypoint5 waypoint3)
	(visible waypoint3 waypoint6)
	(visible waypoint6 waypoint3)
	(visible waypoint3 waypoint7)
	(visible waypoint7 waypoint3)
	(visible waypoint4 waypoint0)
	(visible waypoint0 waypoint4)
	(visible waypoint4 waypoint1)
	(visible waypoint1 waypoint4)
	(visible waypoint4 waypoint2)
	(visible waypoint2 waypoint4)
	(visible waypoint4 waypoint8)
	(visible waypoint8 waypoint4)
	(visible waypoint4 waypoint9)
	(visible waypoint9 waypoint4)
	(visible waypoint5 waypoint1)
	(visible waypoint1 waypoint5)
	(visible waypoint5 waypoint2)
	(visible waypoint2 waypoint5)
	(visible waypoint5 waypoint4)
	(visible waypoint4 waypoint5)
	(visible waypoint5 waypoint6)
	(visible waypoint6 waypoint5)
	(visible waypoint6 waypoint0)
	(visible waypoint0 waypoint6)
	(visible waypoint6 waypoint1)
	(visible waypoint1 waypoint6)
	(visible waypoint6 waypoint4)
	(visible waypoint4 waypoint6)
	(visible waypoint7 waypoint1)
	(visible waypoint1 waypoint7)
	(visible waypoint7 waypoint5)
	(visible waypoint5 waypoint7)
	(visible waypoint7 waypoint8)
	(visible waypoint8 waypoint7)
	(visible waypoint8 waypoint6)
	(visible waypoint6 waypoint8)
	(visible waypoint8 waypoint9)
	(visible waypoint9 waypoint8)
	(visible waypoint9 waypoint3)
	(visible waypoint3 waypoint9)
	(visible waypoint9 waypoint6)
	(visible waypoint6 waypoint9)
	(at_rock_sample waypoint1)
	(at_soil_sample waypoint3)
	(at_rock_sample waypoint3)
	(at_soil_sample waypoint4)
	(at_rock_sample waypoint4)
	(at_rock_sample waypoint5)
	(in_sun waypoint5)
	(at_soil_sample waypoint6)
	(at_rock_sample waypoint8)
	(at_soil_sample waypoint9)
	(in_sun waypoint9)
	(at_lander general waypoint7)
	(channel_free general)
	(= (energy rover0) 50)
	(= (recharge-rate rover0) 14)
	(at rover0 waypoint1)
	(available rover0)
	(store_of rover0store rover0)
	(empty rover0store)
	(equipped_for_soil_analysis rover0)
	(equipped_for_imaging rover0)
	(can_traverse rover0 waypoint1 waypoint2)
	(can_traverse rover0 waypoint2 waypoint1)
	(can_traverse rover0 waypoint1 waypoint4)
	(can_traverse rover0 waypoint4 waypoint1)
	(can_traverse rover0 waypoint1 waypoint6)
	(can_traverse rover0 waypoint6 waypoint1)
	(can_traverse rover0 waypoint1 waypoint8)
	(can_traverse rover0 waypoint8 waypoint1)
	(can_traverse rover0 waypoint2 waypoint3)
	(can_traverse rover0 waypoint3 waypoint2)
	(can_traverse rover0 waypoint4 waypoint0)
	(can_traverse rover0 waypoint0 waypoint4)
	(can_traverse rover0 waypoint4 waypoint5)
	(can_traverse rover0 waypoint5 waypoint4)
	(can_traverse rover0 waypoint4 waypoint9)
	(can_traverse rover0 waypoint9 waypoint4)
	(can_traverse rover0 waypoint8 waypoint7)
	(can_traverse rover0 waypoint7 waypoint8)
	(= (energy rover1) 50)
	(= (recharge-rate rover1) 19)
	(at rover1 waypoint4)
	(available rover1)
	(store_of rover1store rover1)
	(empty rover1store)
	(equipped_for_soil_analysis rover1)
	(equipped_for_rock_analysis rover1)
	(equipped_for_imaging rover1)
	(can_traverse rover1 waypoint4 waypoint0)
	(can_traverse rover1 waypoint0 waypoint4)
	(can_traverse rover1 waypoint4 waypoint2)
	(can_traverse rover1 waypoint2 waypoint4)
	(can_traverse rover1 waypoint4 waypoint5)
	(can_traverse rover1 waypoint5 waypoint4)
	(can_traverse rover1 waypoint4 waypoint6)
	(can_traverse rover1 waypoint6 waypoint4)
	(can_traverse rover1 waypoint4 waypoint9)
	(can_traverse rover1 waypoint9 waypoint4)
	(can_traverse rover1 waypoint0 waypoint3)
	(can_traverse rover1 waypoint3 waypoint0)
	(can_traverse rover1 waypoint2 waypoint1)
	(can_traverse rover1 waypoint1 waypoint2)
	(can_traverse rover1 waypoint5 waypoint7)
	(can_traverse rover1 waypoint7 waypoint5)
	(can_traverse rover1 waypoint6 waypoint8)
	(can_traverse rover1 waypoint8 waypoint6)
	(= (energy rover2) 50)
	(= (recharge-rate rover2) 19)
	(at rover2 waypoint0)
	(available rover2)
	(store_of rover2store rover2)
	(empty rover2store)
	(equipped_for_imaging rover2)
	(can_traverse rover2 waypoint0 waypoint3)
	(can_traverse rover2 waypoint3 waypoint0)
	(can_traverse rover2 waypoint0 waypoint4)
	(can_traverse rover2 waypoint4 waypoint0)
	(can_traverse rover2 waypoint0 waypoint6)
	(can_traverse rover2 waypoint6 waypoint0)
	(can_traverse rover2 waypoint0 waypoint9)
	(can_traverse rover2 waypoint9 waypoint0)
	(can_traverse rover2 waypoint3 waypoint2)
	(can_traverse rover2 waypoint2 waypoint3)
	(can_traverse rover2 waypoint4 waypoint1)
	(can_traverse rover2 waypoint1 waypoint4)
	(can_traverse rover2 waypoint4 waypoint5)
	(can_traverse rover2 waypoint5 waypoint4)
	(can_traverse rover2 waypoint4 waypoint8)
	(can_traverse rover2 waypoint8 waypoint4)
	(= (energy rover3) 50)
	(= (recharge-rate rover3) 11)
	(at rover3 waypoint2)
	(available rover3)
	(store_of rover3store rover3)
	(empty rover3store)
	(equipped_for_imaging rover3)
	(can_traverse rover3 waypoint2 waypoint1)
	(can_traverse rover3 waypoint1 waypoint2)
	(can_traverse rover3 waypoint2 waypoint6)
	(can_traverse rover3 waypoint6 waypoint2)
	(can_traverse rover3 waypoint2 waypoint9)
	(can_traverse rover3 waypoint9 waypoint2)
	(can_traverse rover3 waypoint1 waypoint4)
	(can_traverse rover3 waypoint4 waypoint1)
	(can_traverse rover3 waypoint1 waypoint5)
	(can_traverse rover3 waypoint5 waypoint1)
	(can_traverse rover3 waypoint1 waypoint7)
	(can_traverse rover3 waypoint7 waypoint1)
	(can_traverse rover3 waypoint6 waypoint0)
	(can_traverse rover3 waypoint0 waypoint6)
	(can_traverse rover3 waypoint6 waypoint3)
	(can_traverse rover3 waypoint3 waypoint6)
	(can_traverse rover3 waypoint6 waypoint8)
	(can_traverse rover3 waypoint8 waypoint6)
	(on_board camera0 rover3)
	(calibration_target camera0 objective2)
	(supports camera0 colour)
	(supports camera0 low_res)
	(on_board camera1 rover2)
	(calibration_target camera1 objective3)
	(supports camera1 colour)
	(on_board camera2 rover1)
	(calibration_target camera2 objective3)
	(supports camera2 low_res)
	(on_board camera3 rover1)
	(calibration_target camera3 objective0)
	(supports camera3 colour)
	(supports camera3 low_res)
	(on_board camera4 rover0)
	(calibration_target camera4 objective3)
	(supports camera4 colour)
	(supports camera4 low_res)
	(visible_from objective0 waypoint0)
	(visible_from objective0 waypoint1)
	(visible_from objective0 waypoint2)
	(visible_from objective0 waypoint3)
	(visible_from objective0 waypoint4)
	(visible_from objective0 waypoint5)
	(visible_from objective0 waypoint6)
	(visible_from objective1 waypoint0)
	(visible_from objective1 waypoint1)
	(visible_from objective1 waypoint2)
	(visible_from objective1 waypoint3)
	(visible_from objective1 waypoint4)
	(visible_from objective1 waypoint5)
	(visible_from objective1 waypoint6)
	(visible_from objective2 waypoint0)
	(visible_from objective2 waypoint1)
	(visible_from objective2 waypoint2)
	(visible_from objective2 waypoint3)
	(visible_from objective2 waypoint4)
	(visible_from objective2 waypoint5)
	(visible_from objective2 waypoint6)
	(visible_from objective2 waypoint7)
	(visible_from objective2 waypoint8)
	(visible_from objective3 waypoint0)
	(visible_from objective3 waypoint1)
	(visible_from objective3 waypoint2)
	(visible_from objective3 waypoint3)
	(visible_from objective3 waypoint4)
	(visible_from objective3 waypoint5)
	(visible_from objective3 waypoint6)
)

(:goal (and
(communicated_soil_data waypoint3)
(communicated_soil_data waypoint6)
(communicated_rock_data waypoint5)
(communicated_rock_data waypoint4)
(communicated_rock_data waypoint8)
(communicated_image_data objective0 colour)
(communicated_image_data objective2 low_res)
(communicated_image_data objective0 low_res)
	)
)

(:metric minimize (total-time))
)

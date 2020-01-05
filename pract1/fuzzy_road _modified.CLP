

(deffunction fuzzify (?fztemplate ?value ?delta)

        (bind ?low (get-u-from ?fztemplate))
        (bind ?hi  (get-u-to   ?fztemplate))

        (if (<= ?value ?low)
          then
            (assert-string
              (format nil "(%s (%g 1.0) (%g 0.0))" ?fztemplate ?low ?delta))
          else
            (if (>= ?value ?hi)
              then
                (assert-string
                   (format nil "(%s (%g 0.0) (%g 1.0))"
                               ?fztemplate (- ?hi ?delta) ?hi))
              else
                (assert-string
                   (format nil "(%s (%g 0.0) (%g 1.0) (%g 0.0))"
                               ?fztemplate (max ?low (- ?value ?delta))
                               ?value (min ?hi (+ ?value ?delta)) ))
            )))


(deftemplate road
	(slot identifier (type SYMBOL))
	(slot cracking (type FLOAT))
	(slot max_temp (type FLOAT))
	(slot min_temp (type FLOAT))
	(slot vehicles_hour (type INTEGER))
	; (slot priority (type FLOAT))
)


(deftemplate fuzzy_cracking
	0 100 percentage
	(
		(light (10 1)(20 0))
		(medium (5 0)(25 1)(45 1)(55 0))
		(strong (50 0)(60 1))
	)
)


(deftemplate fuzzy_temp
	-10 90 celsius 
	(
		(cold (5 1)(10 0))
		(moderate (-5 0)(15 1)(40 1)(50 0))
		(hot (35 0)(45 1))
	)
)


(deftemplate fuzzy_priority
	0 100 priority
	(
		(low (z 10 25))
		(more_or_less_low more-or-less low)
		(very_low very low)
		(medium (pi 15 60))
		(somewhat_medium somewhat medium)
		(urgent (s 55 90))
		(more_or_less_urgent more-or-less urgent)
		(very_urgent very urgent)
		(extremely_urgent extremely urgent)
	)
)

(deftemplate fuzzy_traffic_density
	0 300 vehicles_hour
	(
		(low (z 20 80))
		(medium (pi 50 150))
		(high (s 120 250))
		(extremely_high extremely high)
	)
)

(deftemplate fuzzy_rain
	0 1000 liters_per_year
	(
		(low (200 1) (300 0))
		(medium (pi 250 550))
		(high (500 0)(650 1)))
)


(defrule fuzzify_road_data
	(road (identifier ?)(max_temp ?max_temp)(min_temp ?min_temp)(cracking ?cracking)(vehicles_hour ?vehicles_hour))
	=>
	(fuzzify fuzzy_cracking ?cracking 0) ;fuzzify also asserts the fact
	(fuzzify fuzzy_traffic_density ?vehicles_hour 0)
	(fuzzify fuzzy_temp ?min_temp 0)
	(fuzzify fuzzy_temp ?max_temp 0)
)


(defrule inference_priority1
	(fuzzy_cracking light)
	(fuzzy_temp cold)
	=>
	(assert (fuzzy_priority medium))
)

(defrule inference_priority2
	(fuzzy_cracking light)
	(fuzzy_temp moderate)
	=>
	(assert (fuzzy_priority very_low))
)

(defrule inference_priority3
	(fuzzy_cracking light)
	(fuzzy_temp hot)
	=>
	(assert (fuzzy_priority medium))
)

(defrule inference_priority4
	(fuzzy_cracking medium)
	(fuzzy_temp cold)
	=>
	(assert (fuzzy_priority urgent))
)

(defrule inference_priority5
	(fuzzy_cracking medium)
	(fuzzy_temp moderate)
	=>
	(assert (fuzzy_priority low))
)

(defrule inference_priority6
	(fuzzy_cracking medium)
	(fuzzy_temp hot)
	=>
	(assert (fuzzy_priority very_urgent))
)

(defrule inference_priority7
	(fuzzy_cracking strong)
	(fuzzy_temp cold)
	=>
	(assert (fuzzy_priority extremely_urgent))
)

(defrule inference_priority8
	(fuzzy_cracking strong)
	(fuzzy_temp moderate)
	=>
	(assert (fuzzy_priority somewhat_medium))
)

(defrule inference_priority9
	(fuzzy_cracking strong)
	(fuzzy_temp hot)
	=>
	(assert (fuzzy_priority extremely_urgent))
)

(defrule inference_priority_traffic_density1
	(fuzzy_traffic_density high)
	=>
	(assert (fuzzy_priority very_urgent))
)

(defrule inference_priority_traffic_density2
	(fuzzy_traffic_density low)
	=>
	(assert (fuzzy_priority more_or_less_low))
)

(defrule inference_priority_traffic_density3
	(fuzzy_traffic_density medium)
	=>
	(assert (fuzzy_priority more_or_less_urgent))
)

(defruletraffic_density_alert
	(fuzzy_traffic_density extremely_high)
	(road (identifier ?identifier)(max_temp ?max_temp)(min_temp ?min_temp)(cracking ?cracking)(vehicles_hour ?vehicles_hour))
	=>
	(printout t "ALERTA: precaución por trafico alto en carretera " ?identifier crlf)
)

(defrule inference_priority_rain1
	(fuzzy _rain high)
	=>
	(assert (fuzzy_priority extremely_urgent))
)

(defrule defuzzify_priority
	(declare (salience -1)) ;should have minimum priority
	(fuzzy_priority ?f_prio)
	=>
	(bind ?c_prio (moment-defuzzify ?f_prio))
	(printout t "The exact repair priority of the road is " ?c_prio crlf)
	(halt)
)


(deffunction main ()

	(reset)			; assert all facts contained within deffacts constructs
	
	(printout t "Introduce the road identifier (a symbol)" crlf)
	(bind ?Ridentifier (read))
	(printout t "Introduce the cracking level of the road" crlf)
	(bind ?Rcracking (read))
	(printout t "Introduce the minimum registered temperature" crlf)
	(bind ?Rmin_temp (read))
	(printout t "Introduce the maximum registered temperature" crlf)
	(bind ?Rmax_temp (read))
	(printout t "Introduce the number of vehicles per hour" crlf)
	(bind ?Rvehicles_hour (read))

	(assert (road (identifier ?Ridentifier)(cracking ?Rcracking)(max_temp ?Rmax_temp)(min_temp ?Rmin_temp)(vehicles_hour ?Rvehicles_hour)))

	(run)			; run program

)


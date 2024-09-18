extends Timer


func _on_ramp_up_timer_timeout():
	print("ramp1")
	set_wait_time(0.3)



func _on_ramp_up_timer_2_timeout():
	print("ramp2")
	set_wait_time(0.65)


func _on_health_ramp_timeout():
	print("HealthRamp1")
	set_wait_time(0.5)


func _on_un_ramp_timeout():
	print("UnRamp")
	set_wait_time(0.85)

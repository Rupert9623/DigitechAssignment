extends Timer


func _on_ramp_arena_timer_timeout():
	print("ramp1")
	set_wait_time(0.5)


func _on_ramp_arena_timer_2_timeout():
	print("ramp2")
	set_wait_time(1)

extends Timer


func _on_ramp_arena_timer_timeout():
	#This increases the number of arrows spawing
	print("ramp1")
	set_wait_time(0.8)


func _on_ramp_arena_timer_2_timeout():
	#This decreases the number of arrows spawning
	print("ramp2")
	set_wait_time(2)

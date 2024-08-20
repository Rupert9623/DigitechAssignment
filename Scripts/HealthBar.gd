extends ProgressBar


@onready var timer = $Timer
@onready var DamageBar = $DamageBar

var health = 0 : set = _set_health

func _set_health(new_health):
	var prev_health = health
	health = min(max_value, new_health)
	value = health
	if health < 0:
		queue_free()
		
	if health < prev_health:
		timer.start()
	else:
		DamageBar.value = health


func _init_health(_health):
	health = _health
	max_value = health
	value = health
	DamageBar.max_value = health
	DamageBar.value = health


func _on_timer_timeout():
	DamageBar.value = health

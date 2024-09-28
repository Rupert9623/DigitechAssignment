extends Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_arrow_ramp_up_1_timeout():
	print("ramp1")
	set_wait_time(2)



func _on_arrow_ramp_up_2_timeout():
	print("ramp1")
	set_wait_time(3)


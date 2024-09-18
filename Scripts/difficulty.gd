extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_normal_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_hard_button_pressed():
	get_tree().change_scene_to_file("res://Prefabs/bullet_hell_arena.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

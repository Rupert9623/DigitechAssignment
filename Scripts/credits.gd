extends Node2D




func _on_button_2_pressed():
	#Go back to main menu button
	get_tree().change_scene_to_file("res://Prefabs/menu.tscn")
func _process(_delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

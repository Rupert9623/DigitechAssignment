extends Node2D




func _on_button_2_pressed():
	#Go back to main menu button
	get_tree().change_scene_to_file("res://Prefabs/Levels/menu.tscn")
func _process(_delta):
	#This function means that during this time the cursor will be visible
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

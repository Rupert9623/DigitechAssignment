extends Node2D


func _on_return_to_menu_button_pressed():
	#Return to menu
	get_tree().change_scene_to_file("res://Prefabs/Levels/menu.tscn")
func _process(_delta):
	#This ensures that the cursor is visible during this time
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

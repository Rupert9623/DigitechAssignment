extends Node2D




func _on_button_2_pressed():
	#Go back to main menu button
	get_tree().change_scene_to_file("res://Prefabs/menu.tscn")

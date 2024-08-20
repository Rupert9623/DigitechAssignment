extends Node2D




func _on_return_to_menu_button_pressed():
	#Return to menu
	get_tree().change_scene_to_file("res://Prefabs/menu.tscn")


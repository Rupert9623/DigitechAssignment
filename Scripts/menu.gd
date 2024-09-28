extends Node2D

func _on_credits_button_pressed():
	#This will switch the level to the desired place
	get_tree().change_scene_to_file("res://Prefabs/credits.tscn")

func _on_help_map_button_pressed():
	#This will switch the level to the desired place
	get_tree().change_scene_to_file("res://Prefabs/help_map.tscn")

func _on_play_game_button_pressed():
	#This will switch teh level to teh desired place
	get_tree().change_scene_to_file("res://Prefabs/difficulty.tscn")
func _process(_delta):
	#This will ensure that the cursor is visible during this time
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

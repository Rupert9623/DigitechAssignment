extends Node2D

func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://Prefabs/credits.tscn")

func _on_help_map_button_pressed():
	get_tree().change_scene_to_file("res://Prefabs/help_map.tscn")

func _on_play_game_button_pressed():
	get_tree().change_scene_to_file("res://Prefabs/difficulty.tscn")

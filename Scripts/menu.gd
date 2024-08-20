extends Node2D



func _on_button_pressed():
	#Play button
	get_tree().change_scene_to_file("res://game.tscn")


func _on_button_2_pressed():
	#Credits button
	get_tree().change_scene_to_file("res://Prefabs/credits.tscn")


func _on_button_3_pressed():
	#Help Menu button
	get_tree().change_scene_to_file("res://Prefabs/help_map.tscn")

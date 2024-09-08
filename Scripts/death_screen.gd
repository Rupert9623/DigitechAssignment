extends Node2D

func _process(_delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://Prefabs/menu.tscn")


func _on_try_again_pressed():
	get_tree().change_scene_to_file("res://game.tscn")

extends Node2D

func _process(_delta):
	#This function will keep the mouse visible the whole time
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_main_menu_button_pressed():
	#switchs level
	get_tree().change_scene_to_file("res://Prefabs/menu.tscn")


func _on_try_again_pressed():
	#Switchs level
	get_tree().change_scene_to_file("res://Prefabs/game.tscn")

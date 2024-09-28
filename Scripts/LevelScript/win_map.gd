extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#This makes sure that the mouse is always visible
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_main_menu_pressed():
	#This will switch the level
	get_tree().change_scene_to_file("res://Prefabs/Levels/menu.tscn")

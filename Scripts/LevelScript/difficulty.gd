extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#This will ensure that the mouse is visible
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_normal_button_pressed():
	#Switchs level and hides cursor
	get_tree().change_scene_to_file("res://Prefabs/Levels/game.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_hard_button_pressed():
	#Switchs level and hides cursor
	get_tree().change_scene_to_file("res://Prefabs/Levels/bullet_hell_arena.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_main_menu_pressed():
	#switchs level
	get_tree().change_scene_to_file("res://Prefabs/Levels/menu.tscn")

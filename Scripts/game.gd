extends Node2D



@onready var ArrowPrefab = preload("res://Prefabs/arrow.tscn")



func _on_button_pressed():
	get_tree().change_scene_to_file("res://Prefabs/arena.tscn")



func _on_enemy_timer_timeout():
	var enemy = ArrowPrefab.instantiate()
	enemy.position = Vector2(1100,300)
	add_child(enemy)
	
	

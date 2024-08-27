extends Node2D

var score = 0

@onready var ArrowPrefab = preload("res://Prefabs/arrow.tscn")



func _on_button_pressed():
	get_tree().change_scene_to_file("res://Prefabs/arena.tscn")
func _ready():
	_update_ui()



func _on_enemy_timer_timeout():
	var enemy = ArrowPrefab.instantiate()
	var randomY = randi_range (70,700)
	enemy.position = Vector2(1680, randomY)
	add_child(enemy)
	
func _update_ui():
	$GameUi/ScoreLabel.text = "SCORE: "+ str(score)
	


func _on_score_timer_timeout():
	print("Score +1")
	score += 1
	_update_ui()
	if score == 100:
		get_tree().change_scene_to_file("res://Prefabs/arena.tscn")
		
	

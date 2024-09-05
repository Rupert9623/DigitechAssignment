extends Node2D

var score = 0

@onready var ArrowPrefab = preload("res://Prefabs/arrow.tscn")
@onready var ArrowRight  = preload("res://Prefabs/arrow_right.tscn")

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Prefabs/arena.tscn")
func _ready():
	_update_ui()

	
func _update_ui():
	$GameUi3/ScoreLabel3.text = "SCORE: "+ str(score)

func _on_arrow_timer_timeout():
	var enemy = ArrowPrefab.instantiate()
	var randomY = randi_range (70,760)
	enemy.position = Vector2(1680, randomY)
	add_child(enemy)
	var enemyR = ArrowRight.instantiate()
	var RandomY2 = randi_range (70, 760)
	enemyR.position = Vector2(-2, RandomY2)
	add_child(enemyR)


func _on_score_timer_3_timeout():
	print("Score +1")
	score += 1
	_update_ui()
	if score == 60:
		get_tree().change_scene_to_file("res://Prefabs/arena_level_2.tscn")
	

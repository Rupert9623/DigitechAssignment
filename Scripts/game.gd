extends Node2D

var score = 0

@onready var ArrowPrefab = preload("res://Prefabs/arrow.tscn")
@onready var HealItem = preload("res://Prefabs/heal_item.tscn")

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
	score += 1
	_update_ui()
	if score == 60:
		get_tree().change_scene_to_file("res://Prefabs/arena.tscn")

func _on_low_arrow_timer_timeout():
	var enemy = ArrowPrefab.instantiate()
	var randomY = randi_range (580,700)
	enemy.position = Vector2(1680, randomY)
	add_child(enemy)
func _on_heal_timer_timeout():
	var SpawnHeal = HealItem.instantiate()
	var randomY = randi_range (70,700)
	SpawnHeal.position = Vector2(1680, randomY)
	add_child(SpawnHeal)

	


func _on_dev_skip_pressed():
	get_tree().change_scene_to_file("res://Prefabs/arena_level_2.tscn")

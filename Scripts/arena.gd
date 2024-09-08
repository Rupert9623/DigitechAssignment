extends Node2D

var score = 0

@onready var ArrowPrefab = preload("res://Prefabs/arrow.tscn")
@onready var ArrowRight  = preload("res://Prefabs/arrow_right.tscn")
@onready var HealthItem = preload("res://Prefabs/heal_item.tscn")

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Prefabs/arena.tscn")
func _ready():
	_update_ui()

	
func _update_ui():
	$GameUi2/ScoreLabel2.text = "SCORE: "+ str(score)
func _process(_delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
func _on_score_timer_timeout():
	print("Score +1")
	score += 1
	_update_ui()
	if score == 60:
		get_tree().change_scene_to_file("res://Prefabs/arena_level_2.tscn")
	

func _on_enemy_timer_timeout():
	var enemy = ArrowPrefab.instantiate()
	var randomY = randi_range (70,760)
	enemy.position = Vector2(1680, randomY)
	add_child(enemy)
	var enemyR = ArrowRight.instantiate()
	var RandomY2 = randi_range (70, 760)
	enemyR.position = Vector2(-2, RandomY2)
	add_child(enemyR)
	


func _on_health_timer_timeout():
	var Hitem = HealthItem.instantiate()
	var randomy = randi_range (70,760)
	Hitem.position = Vector2(1680, randomy)
	add_child(Hitem)


func _on_arrow_low_timeout():
	var enemy = ArrowPrefab.instantiate()
	var randomY = randi_range (580,700)
	enemy.position = Vector2(1680, randomY)
	add_child(enemy)
	var enemyR = ArrowRight.instantiate()
	var RandomY2 = randi_range (580, 700)
	enemyR.position = Vector2(-2, RandomY2)
	add_child(enemyR)

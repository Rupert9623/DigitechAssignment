extends Node2D
#Sets score to zero at the start of the game
var score = 0

#All the enemys that will be used
@onready var ArrowPrefab = preload("res://Prefabs/arrow.tscn")
@onready var HealItem = preload("res://Prefabs/heal_item.tscn")

func _ready():
	_update_ui()
func _process(_delta):
	#This will hiden the cursor at all times
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _update_ui():
	#This function will increase the score by 1
	$GameUi/ScoreLabel.text = "SCORE: "+ str(score)

func _on_score_timer_timeout():
	score += 1
	_update_ui()
	#When the score gets to 60 it will put the player in th enext level
	if score == 60:
		get_tree().change_scene_to_file("res://Prefabs/arena.tscn")

#All of the functions below give me access to where each enemy has a possiblilty 
#to spawn, this control means that I can increase and decrease the ranges where 
#the enemys spawn from.

func _on_low_arrow_timer_timeout():
	var enemy = ArrowPrefab.instantiate()
	var randomY = randi_range (580,700)
	enemy.position = Vector2(1680, randomY)
	add_child(enemy)
	var enemyH = ArrowPrefab.instantiate()
	var randomYH = randi_range (0,256)
	enemyH.position = Vector2(1680, randomYH)
	add_child(enemyH)

func _on_heal_timer_timeout():
	var SpawnHeal = HealItem.instantiate()
	var randomY = randi_range (70,700)
	SpawnHeal.position = Vector2(1680, randomY)
	add_child(SpawnHeal)

func _on_enemy_timer_timeout():
	var enemy = ArrowPrefab.instantiate()
	var randomY = randi_range (70,700)
	enemy.position = Vector2(1680, randomY)
	add_child(enemy)

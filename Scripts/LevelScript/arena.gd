extends Node2D

#Sets score to zero at the start of the game
var score = 0

#All the enemy that will be spawned in
@onready var ArrowPrefab = preload("res://Prefabs/Enemys/arrow.tscn")
@onready var ArrowRight  = preload("res://Prefabs/Enemys/arrow_right.tscn")
@onready var HealthItem = preload("res://Prefabs/Player+Item/heal_item.tscn")
@onready var KnifeDown = preload("res://Prefabs/Enemys/knife_down.tscn")

func _ready():
	_update_ui()
	
#this is the function that will increase the score by 1
func _update_ui():
	$GameUi2/ScoreLabel2.text = "SCORE: "+ str(score)
func _process(_delta):
	#This is used so that the cusor is always hidden and doesn't annoy the player
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
func _on_score_timer_timeout():
	score += 1
	_update_ui()
	#When the score gets to 100 this will switch the project to the next level
	if score == 100:
		get_tree().change_scene_to_file("res://Prefabs/Levels/arena_level_2.tscn")
	
#All of the functions below give me access to where each enemy has a possiblilty 
#to spawn, this control means that I can increase and decrease the ranges where 
#the enemys spawn from by creating a variable that tells the game to create a child
#Then setting where it should by on the y axis by the randirange and setting the x axis

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
	
	var enemyRH = ArrowRight.instantiate()
	var RandomY2H = randi_range (0,256)
	enemyRH.position = Vector2(-2, RandomY2H)
	add_child(enemyRH)
	
	var enemyH = ArrowPrefab.instantiate()
	var randomYH = randi_range (0,256)
	enemyH.position = Vector2(1680, randomYH)
	add_child(enemyH)

func _on_knife_down_timer_timeout():
	var Knife = KnifeDown.instantiate()
	var randomX = randi_range (256,1284)
	Knife.position = Vector2(randomX, -70)
	add_child(Knife)

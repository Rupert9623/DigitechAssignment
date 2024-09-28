extends Node2D

#This sets the score to zero at the start of the game
var score = 0

#This are all the enemys that will be used
@onready var ArrowPrefab = preload("res://Prefabs/Enemys/arrow.tscn")
@onready var ArrowRight  = preload("res://Prefabs/Enemys/arrow_right.tscn")
@onready var RockPrefab = preload("res://Prefabs/Enemys/rock.tscn")
@onready var HealthItem = preload("res://Prefabs/Player+Item/heal_item.tscn")
@onready var SpearLeft = preload("res://Prefabs/Enemys/spear.tscn")
@onready var SpearRight = preload("res://Prefabs/Enemys/spear_r.tscn")
@onready var KnifeDown = preload("res://Prefabs/Enemys/knife_down.tscn")

func _ready():
	_update_ui()
func _process(_delta):
	#This is used so that the cusor is always hidden and doesn't annoy the player
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

#this is the function that will increase the score by 1
func _update_ui():
	$GameUi3/ScoreLabel3.text = "SCORE: "+ str(score)

func _on_score_timer_3_timeout():
	score += 1
	_update_ui()
	#This will switch the project to the next level
	if score == 100:
		get_tree().change_scene_to_file("res://Prefabs/Levels/win_map.tscn")

#All of the functions below give me access to where each enemy has a possiblilty 
#to spawn, this control means that I can increase and decrease the ranges where 
#the enemys spawn from

func _on_health_timer_timeout():
	var Hitem = HealthItem.instantiate()
	var randomy = randi_range (70,760)
	Hitem.position = Vector2(1680, randomy)
	add_child(Hitem)

func _on_down_enemy_timer_timeout():
	var rockDown = RockPrefab.instantiate()
	var randomXR = randi_range (70,1624)
	rockDown.position = Vector2(randomXR, -70)
	add_child(rockDown)
	var knife = KnifeDown.instantiate()
	var randomXK = randi_range (70,1624)
	knife.position = Vector2(randomXK, -70)
	add_child(knife)


func _on_enemy_timer_low_timeout():
	var arrowlow = ArrowPrefab.instantiate()
	var randomYAL = randi_range (640,700)
	arrowlow.position = Vector2(1680, randomYAL)
	add_child(arrowlow)
	
	var arrowlowRight = ArrowRight.instantiate()
	var RandomY2ALR = randi_range (640, 700)
	arrowlowRight.position = Vector2(-2, RandomY2ALR)
	add_child(arrowlowRight)

func _on_enemy_timer_high_timeout():
	
	var enemyRH = ArrowRight.instantiate()
	var RandomY2H = randi_range (0,200)
	enemyRH.position = Vector2(-2, RandomY2H)
	add_child(enemyRH)
	
	var enemyH = ArrowPrefab.instantiate()
	var randomYH = randi_range (10,200)
	enemyH.position = Vector2(1680, randomYH)
	add_child(enemyH)

func _on_enemy_timer_medium_timeout():
	var enemyRHM = ArrowRight.instantiate()
	var RandomY2HM = randi_range (350,600)
	enemyRHM.position = Vector2(-2, RandomY2HM)
	add_child(enemyRHM)
	
	var enemyHM = ArrowPrefab.instantiate()
	var randomYHM = randi_range (350,600)
	enemyHM.position = Vector2(1680, randomYHM)
	add_child(enemyHM)


func _on_arrow_left_timer_timeout():
	var SpearL = SpearLeft.instantiate()
	var randomY = randi_range (70,760)
	SpearL.position = Vector2(1680, randomY)
	add_child(SpearL)

func _on_arrow_right_timer_timeout():
	var SpeaRR = SpearRight.instantiate()
	var RandomY2 = randi_range (70, 760)
	SpeaRR.position = Vector2(-2, RandomY2)
	add_child(SpeaRR)

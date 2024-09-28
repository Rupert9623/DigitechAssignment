extends Node2D

#Setting the score to zero at the start of the game
var score = 0

#This is all the enemys that will be used in the gamne
@onready var FireD = preload("res://Prefabs/fire_down.tscn")
@onready var FireL = preload("res://Prefabs/fire_left.tscn")
@onready var FireR = preload("res://Prefabs/fire_right.tscn")
@onready var PlayerPos = preload("res://Prefabs/player.tscn")
@onready var LavaStreamL = preload("res://Prefabs/lava_stream.tscn")
@onready var LavaStreamU = preload("res://Prefabs/lava_stream_across.tscn")
@onready var HealthItem = preload("res://Prefabs/heal_item.tscn")

func _ready():
	_update_ui()

func _update_ui():
	#This function will cause the score to increase by one
	$HellControl/HellLabel.text = "SCORE: "+ str(score)
func _process(_delta):
	#This will keep teh cursor hidden the whole time during play
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
func _on_hell_score_timer_timeout():
	score += 1
	_update_ui()
	#This will switch the project to the next level when the score = 100
	if score == 100:
		get_tree().change_scene_to_file("res://Prefabs/bullet_hell_arena_level_2.tscn")

#All of the functions below give me access to where each enemy has a possiblilty 
#to spawn, this control means that I can increase and decrease the ranges where 
#the enemys spawn from.

func _on_fire_down_timer_timeout():
	var DownFire = FireD.instantiate()
	var randomFDX= randi_range (256,1284)
	DownFire.position = Vector2(randomFDX, -70)
	add_child(DownFire)

func _on_fire_lr_timer_timeout():
	var LeftFire = FireL.instantiate()
	var randomFL = randi_range (70, 700)
	LeftFire.position = Vector2(2000, randomFL)
	add_child(LeftFire)
	var RightFire = FireR.instantiate()
	var RandomFR = randi_range (70, 700)
	RightFire.position = Vector2(-260, RandomFR)
	add_child(RightFire)
	var Hitem = HealthItem.instantiate()
	var randomy = randi_range (70,760)
	Hitem.position = Vector2(1680, randomy)
	add_child(Hitem)

func _on_fire_low_med_high_lr_timer_timeout():
	var RightFireH = FireR.instantiate()
	var RandomY2H = randi_range (0,190)
	RightFireH.position = Vector2(-260, RandomY2H)
	add_child(RightFireH)
	
	var FireH = FireL.instantiate()
	var randomYH = randi_range (0,190)
	FireH.position = Vector2(2000, randomYH)
	add_child(FireH)
	
	var FireRM = FireR.instantiate()
	var RandomY2HM = randi_range (400, 500)
	FireRM.position = Vector2(-260, RandomY2HM)
	add_child(FireRM)
	
	var FireM = FireL.instantiate()
	var randomYHM = randi_range (400,500)
	FireM.position = Vector2(2000, randomYHM)
	add_child(FireM)

func _on_lava_stream_timer_l_timeout():
	var LavaD = LavaStreamL.instantiate()
	var XFireStream = randi_range (0,1664)
	LavaD.position = Vector2(XFireStream, -500)
	add_child(LavaD)
	var LavaU = LavaStreamU.instantiate()
	var XFireStreamU = randi_range (0,1664)
	LavaU.position = Vector2(XFireStreamU, 2000)
	add_child(LavaU)

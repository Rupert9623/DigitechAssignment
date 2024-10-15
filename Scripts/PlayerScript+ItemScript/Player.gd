extends CharacterBody2D
#This names the player for enemys to identify
class_name player
#This readys the Health bar and the animations
@onready var health_bar = $HealthBar
@onready var anim : AnimatedSprite2D = $AnimatedSprite2D
#This sets teh start position
var start_position = Vector2(840,582)
#This sets how much health that the player will spawn in with
var Health =  10
func _ready():
	#This will make sure that the value of health will equal damage inflicted to the player
	health_bar.value = Health

	
func _process(_delta):
	#This means that if health is less than or euqal to zero the game will switch to the death screen
	if Health <= 0:
		get_tree().change_scene_to_file("res://Prefabs/Levels/death_screen.tscn")
	_update_health()
#This function updates the text box with HEALTH: 00 to the value of Health
func _update_health():
	$HealthControl/HealthLabel.text = "Health: "+ str(Health)
#This sets the value of both jump and run speed
const SPEED = 800.0
const JUMP_VELOCITY = -1000.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

	
#This is the jump cut function that will stop the player moving up once they release the up key
func Jump_cut():
	if velocity.y<0:
		velocity.y *= 0.1


#This function makes all the animations works
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if abs(velocity.x) > 10:
			anim.play("Run")
		else:
			anim.play("Idle")
	#This will flip the player sprite
	if velocity.x < 0:
		anim.flip_h = true
	else:
		anim.flip_h = false
	if Input.is_action_just_released("ui_up"):
		Jump_cut()
	# Handles jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("Jump")
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	#Sets how far down the player can go and will respawn them back
	if position.y > 1500:
		respawn()
func respawn():
	position = start_position



#This function gives me complete control on how much damage each enemy does to the player
#This is why naming the enemys was important as this is how the player identifys them

func _on_area_2d_area_entered(area):
	if area is Arrow:
		$PlayerHurt.play()
		#This will decrease the value of health by one
		Health -=1
		#This will cause the visual health bar to decrease by one
		health_bar.value = Health
	if area is Arrow_Direct_right:
		$PlayerHurt.play()
		Health -=1
		health_bar.value = Health
	if area is RockDown:
		$PlayerHurt.play()
		Health -=3
		health_bar.value = Health
	if area is KnifeDown1:
		$PlayerHurt.play()
		Health -= 2
		health_bar.value = Health
	if area is Spear:
		$PlayerHurt.play()
		Health -= 1
		health_bar.value = Health
	if area is SpearR:
		$PlayerHurt.play()
		Health -= 1
		health_bar.value = Health
	if area is FireLeft:
		$PlayerHurt.play()
		Health -=1
		health_bar.value = Health
	if area is FireRight:
		$PlayerHurt.play()
		Health -= 1
		health_bar.value = Health
	if area is LavaStreamR:
		$PlayerHurt.play()
		Health -=1
		health_bar.value = Health
	if area is FireDown:
		$PlayerHurt.play()
		Health -=1
		health_bar.value = Health
	if area is LavaStream:
		$PlayerHurt.play()
		Health -=1
		health_bar.value = Health
	if area is LavaStreamUp:
		$PlayerHurt.play()
		Health -=1
		health_bar.value = Health
	if area is Heal:
		$PlayerHeal.play()
		Health = 11
		health_bar.value = Health
# Called when the node enters the scene tree for the first time.


extends CharacterBody2D
class_name player
@onready var health_bar = $HealthBar
var start_position = Vector2(840,582)
var Health =  10
@onready var anim : AnimatedSprite2D = $AnimatedSprite2D
	
	
func _ready():
	health_bar.value = Health

const SPEED = 800.0
const JUMP_VELOCITY = -1000.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if abs(velocity.x) > 10:
			anim.play("Run")
		else:
			anim.play("Idle")
	if velocity.x < 0:
		anim.flip_h = true
	else:
		anim.flip_h = false
	if Input.is_action_just_released("ui_up"):
		Jump_cut()

		

	# Handle jump.
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
	#Respawn
	if position.y > 4000:
		respawn()

func respawn():
	position = start_position


func _on_area_2d_area_entered(area):
	if area is Arrow:
		$PlayerHurt.play()
		Health -=1
		health_bar.value = Health
	if area is Arrow_Direct_right:
		$PlayerHurt.play()
		Health -=1
		health_bar.value = Health
	if area is RockDown:
		$PlayerHurt.play()
		Health -=2
		health_bar.value = Health
	if area is Heal:
		Health += 5
		health_bar.value = Health
func _process(_delta):
	if Health == 0:
		get_tree().change_scene_to_file("res://Prefabs/death_screen.tscn")
func Jump_cut():
	if velocity.y<0:
		velocity.y = 2

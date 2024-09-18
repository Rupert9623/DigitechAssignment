extends CharacterBody2D
var start_position = Vector2(840,582)
@onready var anim : AnimatedSprite2D = $AnimatedSprite2D
var lineBreak = 10
	
	
func _ready():
	print("HelpMap")
const SPEED = 800.0
const JUMP_VELOCITY = -1100
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
func Jump_cut():
	if velocity.y<0:
		velocity.y = 2

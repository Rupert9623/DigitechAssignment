extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -1000.0

var start_position = Vector2(1024,504)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim : AnimatedSprite2D = $AnimatedSprite2D

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



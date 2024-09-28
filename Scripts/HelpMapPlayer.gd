extends CharacterBody2D
#this position was very ccarfully made to spawn the player between the two bolards
var start_position = Vector2(840,582)
#Gets the animations
@onready var anim : AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	print("HelpMapPlayerSpawn")
#Sets speed value
const SPEED = 800.0
const JUMP_VELOCITY = -1100
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

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
	#this makes the sprite flip direction
	if velocity.x < 0:
		anim.flip_h = true
	else:
		anim.flip_h = false
	#This stops the player from jumping higher once they release the up button
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
	#Checks if the player is below this and will put them between the bolards
	if position.y > 4000:
		respawn()
func respawn():
	position = start_position
func Jump_cut():
	#This stops the players velocity up the y axis
	if velocity.y<0:
		velocity.y = 2

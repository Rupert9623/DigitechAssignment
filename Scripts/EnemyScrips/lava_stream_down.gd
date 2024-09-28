extends Area2D
#This names the enemy for the player to identify
class_name LavaStreamUp
#This sets the speed value
@export var speed = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#This sets how fast the enemy will move down the y axis
	position.y += speed

func _on_body_entered(body):
	#When the enemy comes in contact with the player it will disapear
	if body.name == 'Player':
		queue_free()

extends Area2D
#Names enemy for player to identify
class_name FireDown
#setsspeed of enemy
@export var speed = 15



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#sets the speed that it will move down the y axis
	position.y += speed

func _on_body_entered(body):
	#When it comes in contact with the player this will make it disapeer
	if body.name == 'Player':
		queue_free()

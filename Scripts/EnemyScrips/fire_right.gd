extends Area2D
#Names enemy for player to identify
class_name FireRight
#Sets speed value
@export var speed = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#Sets speed that enemy will move across the x axis
	position.x += speed

func _on_body_entered(body):
	#When the enemy comes in contact with the player it will cause the enemy to disapeer
	if body.name == 'Player':
		queue_free()



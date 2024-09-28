extends Area2D
#Naming the enemy so it registers with the player
class_name Arrow_Direct_right
@export var speed = 20


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#This makes it move across the x axis
	position.x += speed

func _on_body_entered(body):
	#This will make the arrow disapear when it touchs the player
	if body.name == 'Player':
		queue_free()

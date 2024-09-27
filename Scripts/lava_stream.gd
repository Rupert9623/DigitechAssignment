extends Area2D
class_name LavaStreamR
#IMPORTANT : named Rock Down because they do the same thing
@export var speed = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.y += speed
	
func _on_body_entered(body):
	if body.name == 'Player':
		queue_free()

extends Area2D
class_name FireLeft
@export var speed = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.x -= speed
	
func _on_body_entered(body):
	if body.name == 'Player':
		queue_free()

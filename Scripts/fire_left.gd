extends Area2D
#Names enemy for player to identify
class_name FireLeft
#sets speed
@export var speed = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#sets speed that the enemy will move across the x axis
	position.x -= speed
	
func _on_body_entered(body):
	#when enemy comes in contact with player this will make it disapear
	if body.name == 'Player':
		queue_free()

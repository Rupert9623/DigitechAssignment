extends Area2D
#Names item for player to identify
class_name Heal
#Sets speed value
@export var speed = 22.5



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#Sets speed that item will move across the x axis
	position.x -= speed




func _on_body_entered(body):
	#When the item comes in contact with the player it will disapear
	if body.name == 'Player':
		queue_free()

extends Area2D

@onready var health_bar = $HealthBar

var start_position = Vector2(840,582)
var Health =  10


@onready var anim : AnimatedSprite2D = $AnimatedSprite2D
	
	
func _ready():
	health_bar.value = Health


func _on_area_entered(area):
	if area is Enemy:
		Health -=1
		health_bar.value = Health


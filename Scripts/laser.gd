extends Area2D



#
#These were the first iterations of my game, they are not included in the game but they are there as a 
#reminder of first attemps
#

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.respawn()

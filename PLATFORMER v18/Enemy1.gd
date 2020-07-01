extends Area2D

func dead():
	queue_free()
func _ready():
	pass

func _on_Enemy1_body_entered(body):
	#$Enemy.direction(rand_range(-1, 1))
	pass
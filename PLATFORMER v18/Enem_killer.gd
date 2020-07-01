extends Area2D



func _ready():
	pass

func _on_Enem_killer_body_entered(body):
	if "Enemy" in body.name:
		body.dead()

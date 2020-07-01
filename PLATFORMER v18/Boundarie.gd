extends Area2D

func _ready():
	pass

func on_death_fx():
	get_tree().change_scene("res://GameOver.tscn")

func _on_Boundarie_body_entered(body):
	var bodies = get_overlapping_bodies()
	for character in bodies:
		if get_owner() != null and character.name == "Player":
			on_death_fx()
	if "Enemy1" in body.name:
		body.dead()
		

func _on_Boundarie2_body_entered(body):
	var bodies = get_overlapping_bodies()
	for character in bodies:
		if get_owner() != null and character.name == "Player":
			on_death_fx()
	if "Enemy1" in body.name:
		body.dead()


func _on_decor_body_entered(body):
	var bodies = get_overlapping_bodies()
	for character in bodies:
		if get_owner() != null and character.name == "Player":
			var killed = AudioStreamPlayer2D.new()
			self.add_child(killed)
			killed.stream = load("res://GameSounds/explosion.wav")
			killed.play()
			on_death_fx()
	if "Enemy1" in body.name:
		body.dead()

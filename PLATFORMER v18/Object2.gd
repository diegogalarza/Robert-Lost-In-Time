extends Area2D

var value = 1

func _ready():
	var check = AudioStreamPlayer2D.new()
	self.add_child(check)
	check.stream = load("res://GameSounds/collect_sound.wav")
	pass
	
func _physics_process(delta):
	if get_owner() != null:
		get_owner().sushi_total += value

func _on_Object2_body_entered(body):
	
	var bodies = get_overlapping_bodies()
	for character in bodies:
		if get_owner() != null and character.name == "Player":
			get_owner().sushi_collected += value
			get_owner().get_node("gui/Collectible_counter").set_text("Items: " + str(get_owner().sushi_collected) + "/22")
			queue_free()
	if get_owner().sushi_collected == 21:
		get_tree().change_scene("WorldPirate.tscn")


	if "Player" in body.name:
		#si imprime pero no suena
		#check.play()
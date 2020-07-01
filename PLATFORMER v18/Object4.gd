extends Area2D

var value = 1

func _ready():
	pass
	
func _physics_process(delta):
	if get_owner() != null:
		get_owner().tags_total += value

func _on_Object4_body_entered(body):
	var check = AudioStreamPlayer2D.new()
	self.add_child(check)
	check.stream = load("res://GameSounds/collect_sound.wav")
	
	
	var bodies = get_overlapping_bodies()
	for character in bodies:
		if get_owner() != null and character.name == "Player":
			get_owner().tags_collected += value
			get_owner().get_node("gui/Collectible_counter").set_text("Items: " + str(get_owner().tags_collected) + "/25")
			queue_free()
	if get_owner().tags_collected == 25:
		
		get_tree().change_scene("WorldCrazy.tscn")


	if "Player" in body.name:
		#print("funciona!!!")
		#si imprime pero no suena
		check.play()

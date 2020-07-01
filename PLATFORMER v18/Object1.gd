
extends Area2D

var value = 1


func _ready():
	pass
func dead():
	queue_free()
	
func _physics_process(delta):
	if get_owner() != null:
		get_owner().bone_total += value 
	
func _on_Object1_body_entered(body):
	var bodies = get_overlapping_bodies()
	for character in bodies:
		if get_owner() != null and character.name == "Player":
			get_owner().bone_collected += value 
			get_owner().get_node("gui/Collectible_counter").set_text("Items: " + str(get_owner().bone_collected)+"/10")
			queue_free()
			
	var root = get_tree().get_root().get_node("World")	
	if "Player" in body.name:
		root.bone_collected += value
		root.get_node("gui/Collectible_counter").set_text("Items: " + str(root.bone_collected)+"/10")
		queue_free()
		#print("funciona!!!")
		#si imprime pero no suena
		#check.play()
		
	if root.bone_collected == 10:
		get_tree().change_scene("WorldJapan.tscn")

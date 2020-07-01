extends Area2D

func on_death_fx():
	get_tree().change_scene("res://GameOver.tscn")

func _ready():
	
	pass


func _on_EmptyArea_area_entered(area):
	var is_alive = true
	var bodies = get_overlapping_bodies()
	for character in bodies:
		if character.is_in_group("Enemies") and character.name() == "Enemy":
			is_alive = false
			on_death_fx()

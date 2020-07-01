extends Node


func _ready():
	get_viewport().audio_listener_enable_2d = true
	var over = AudioStreamPlayer2D.new()
	self.add_child(over)
	over.stream = load("res://GameSounds/govermusic.wav")
	over.play()
	pass


func _on_btn_menu_pressed():
	get_tree().change_scene("res://Main_menu.tscn")


func _on_btn_restart_pressed():
	get_tree().change_scene("res://World.tscn")

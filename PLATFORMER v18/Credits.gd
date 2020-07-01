extends Control


func _ready():
	var Aplayer = AudioStreamPlayer.new()
	self.add_child(Aplayer)
	Aplayer.stream = load("res://GameSounds/menuMusic.wav")
	Aplayer.play()
	pass


func _on_Btn_back_pressed():
	get_tree().change_scene("res://Main_menu.tscn")

extends Control

func _ready():
	var Aplayer = AudioStreamPlayer.new()
	self.add_child(Aplayer)
	Aplayer.stream = load("res://GameSounds/winnermusic.wav")
	Aplayer.play()
	yield(get_tree().create_timer(6),"timeout")
	get_tree().change_scene("Credits_menu.tscn")
	pass
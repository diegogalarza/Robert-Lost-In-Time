extends Node

var alien_total = 0
var alien_collected = 0

func _ready():
	var Aplayer = AudioStreamPlayer.new()
	self.add_child(Aplayer)
	Aplayer.stream = load("res://GameSounds/level5music.wav")
	Aplayer.play()
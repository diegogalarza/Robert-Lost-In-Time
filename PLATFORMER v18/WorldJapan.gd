extends Node

var sushi_total = 0
var sushi_collected = 0

func _ready():
	var Aplayer = AudioStreamPlayer.new()
	self.add_child(Aplayer)
	Aplayer.stream = load("res://GameSounds/level2music.wav")
	Aplayer.play()

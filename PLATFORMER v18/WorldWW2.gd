extends Node

var tags_total = 0
var tags_collected = 0

func _ready():
	var Aplayer = AudioStreamPlayer.new()
	self.add_child(Aplayer)
	Aplayer.stream = load("res://GameSounds/level4music.wav")
	Aplayer.play()
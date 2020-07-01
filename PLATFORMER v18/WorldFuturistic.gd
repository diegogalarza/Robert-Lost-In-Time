extends Node

var engram_total = 0
var engram_collected = 0

func _ready():
	var Aplayer = AudioStreamPlayer.new()
	self.add_child(Aplayer)
	Aplayer.stream = load("res://GameSounds/level6music.wav")
	Aplayer.play()
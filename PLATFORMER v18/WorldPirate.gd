extends Node

var anchor_total = 0
var anchor_collected = 0

func _ready():
	var Aplayer = AudioStreamPlayer.new()
	self.add_child(Aplayer)
	Aplayer.stream = load("res://GameSounds/level3music.wav")
	Aplayer.play()
extends Node


var bone_total = 0
var bone_collected = 0

func _ready():
	var Aplayer = AudioStreamPlayer.new()
	self.add_child(Aplayer)
	Aplayer.stream = load("res://GameSounds/level1music.wav")
	Aplayer.play()

#func _input(event):
#	if event is InputEventMouseMotion:
#		print(event.position)


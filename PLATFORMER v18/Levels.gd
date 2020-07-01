extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func loading():
	get_tree().change_scene("res://Loading.tscn")


func _ready():
	var Aplayer = AudioStreamPlayer.new()
	self.add_child(Aplayer)
	Aplayer.stream = load("res://GameSounds/lvlSelect.wav")
	Aplayer.play()
	pass

func _on_Btn_lvl1_pressed():
	get_tree().change_scene("res://World.tscn")


func _on_Btn_lvl2_pressed():
	get_tree().change_scene("res://WorldJapan.tscn")


func _on_Btn_lvl3_pressed():
	get_tree().change_scene("res://WorldPirate.tscn")


func _on_Btn_lvl4_pressed():
	get_tree().change_scene("res://WorldWW2.tscn")


func _on_Btn_lvl5_pressed():
	get_tree().change_scene("res://WorldCrazy.tscn")


func _on_Btn_lvl6_pressed():
	get_tree().change_scene("res://WorldFuturistic.tscn")


func _on_Btn_atras_pressed():
	get_tree().change_scene("res://Main_menu.tscn")

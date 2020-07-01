extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var Aplayer = AudioStreamPlayer.new()
	self.add_child(Aplayer)
	Aplayer.stream = load("res://GameSounds/menuMusic.wav")
	Aplayer.play()
	
	pass

func _on_Btn_selectlvl_pressed():
	get_tree().change_scene("res://LvlSelect_menu.tscn")


func _on_Btn_options_pressed():
	get_tree().change_scene("res://Options_menu.tscn")


func _on_Btn_creditos_pressed():
	get_tree().change_scene("res://Credits_menu.tscn")

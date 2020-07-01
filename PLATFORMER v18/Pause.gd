extends Control

func _input(event):
	if event.is_action_pressed("ui_pause"):
		var pause_state = not get_tree().paused
		get_tree().paused = pause_state
		visible = pause_state

func _on_Btn_continue_pressed():
	var pause_state = not get_tree().paused
	get_tree().paused = pause_state
	visible = pause_state

func _on_Btn_menu_pressed():
	get_tree().change_scene("res://Main_menu.tscn")

func _on_Btn_exit_pressed():
	 get_tree().quit()

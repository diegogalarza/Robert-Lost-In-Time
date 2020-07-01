extends Node

const object1 = preload("res://Object1.tscn")
var bone_total = 0
var bone_collected = 0

func _ready():
	spawn_obj()
	pass
	
func yeah():
	var a = [[90, 200], [250,260], [400, 260], [530,200], [400,100], [222, 100]]

	
func spawn_obj():
	while true:
		randomize()
		var obj = object1.instance()
		var pos = Vector2()
		#250-370
		pos.x = rand_range(145, 485)
		pos.y = 260
		
		obj.translate(pos)
		get_node("Container2").add_child(obj)
		yield(get_tree().create_timer(rand_range(3,7)),"timeout")
	pass
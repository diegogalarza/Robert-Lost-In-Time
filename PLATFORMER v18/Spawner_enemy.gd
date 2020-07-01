extends Node


const enemy1 = preload("res://Enemy1.tscn")


func _ready():
	spawn()
	pass

func spawn():
	while true:
		randomize()
		var enemy = enemy1.instance()
		var pos = Vector2()
		#250-370
		pos.x = rand_range(250, 370)
		pos.y = 60
		
		enemy.translate(pos)
		get_node("Container").add_child(enemy)
		yield(get_tree().create_timer(rand_range(2,5)),"timeout")
	pass
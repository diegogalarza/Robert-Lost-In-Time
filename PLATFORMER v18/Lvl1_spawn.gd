extends World

const BONE = preload("res://Object1.tscn")

func _ready():
	

	
func spawn():
	
	while true:
		var obj_SpawnCoords = [[90,200],[250, 260],[400, 260],[530, 200],[400, 100],[222, 100]]
		randomize()
		var obj = BONE.intstance()
		for i in len(obj_SpawnCoords):
			var pos = rand_range()
		obj.setpos(pos)
		get_node("Container").add_child(obj)
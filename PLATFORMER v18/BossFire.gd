extends Area2D

var SPEED = 300
var velocity = Vector2()

func _ready():
	pass
	
func _physics_process(delta):
	get_viewport().audio_listener_enable_2d = true
	var fire = AudioStreamPlayer2D.new()
	self.add_child(fire)
	fire.stream = load("res://GameSounds/fireball.wav")
	
	velocity.x = SPEED * delta
	translate(velocity)
	fire.play()
	$AnimatedSprite.play("spin")

	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_BossFire_body_entered(body):
	
	if "Player" in body.name:
		#body.on_death_fx()
		queue_free()
	elif "TileMap" in body.name:
		queue_free()




extends KinematicBody2D

const GRAVITY = 20
const SPEED = 90
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var direction = 1
var is_dead = false

func _ready():

	pass
func dead():
	is_dead = true
	velocity = Vector2(0, 0)
	get_viewport().audio_listener_enable_2d = true
	var killed = AudioStreamPlayer2D.new()
	self.add_child(killed)
	killed.stream = load("res://GameSounds/deadfx.wav")
	killed.play()
	$AnimatedSprite.play("Dead")
	yield(get_tree().create_timer(0.5),"timeout")
	queue_free()
	
func _physics_process(delta):
	if is_dead == false:
		velocity.x = SPEED * direction
		if direction == 1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Run")
		
		velocity.y += GRAVITY
		velocity = move_and_slide(velocity, FLOOR)
		
	if is_on_wall():
		direction = direction * -1
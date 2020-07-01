extends KinematicBody2D

const GRAVITY = 20
const SPEED = 130
const FLOOR = Vector2(0, -1)
const BOSSFIRE = preload("res://BossFire.tscn")
var velocity = Vector2()
var direction = 1
var is_dead = false
var life_counter = 50

func _ready():
	pass
	
func life():
	life_counter-=1
	print(life_counter)
	if life_counter == 0:
		dead()
	pass
func bossShoot(direction):
	if Input.is_action_just_pressed("ui_fire"):
		yield(get_tree().create_timer(0.6),"timeout")
		var bossfire = BOSSFIRE.instance()
		bossfire.SPEED = direction
		get_parent().add_child(bossfire)
		bossfire.position = $Position2D.global_position
	
	
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
	var fire_speed = 500
	if is_dead == false:
		velocity.x = SPEED * direction
		if direction == 1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Run")		
		velocity.y += GRAVITY
		velocity = move_and_slide(velocity, FLOOR)
	
		#print(get_frame())
		bossShoot(fire_speed*direction)

	if is_on_wall():
		direction = direction * -1

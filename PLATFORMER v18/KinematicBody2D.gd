extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const MAX_SPEED = 200
const ACCELERATION = 50
const JUMP_HEIGHT = -500
var dir = 1

const FIREBALL = preload("res://Fireball.tscn")


var motion = Vector2()

func die():
	$Sprite.play("Dead")
	get_tree().change_scene("res://GameOver.tscn")
	
func on_death_fx():
	die()
	
func change_world():
	get_tree().change_scene("res://WorldJapan.tscn")

func shoot(direction):
	if Input.is_action_just_pressed("ui_fire"):
		$Sprite.play("Shoot")
		var fireball = FIREBALL.instance()
		fireball.SPEED = direction
		get_parent().add_child(fireball)
		fireball.position = $Position2D.global_position
		
func _physics_process(delta):
	motion.y += GRAVITY
	var direction = 500
	get_viewport().audio_listener_enable_2d = true
	var friction = false
	var is_alive = true	
	
	if get_slide_collision(get_slide_count()-1) != null:
		var colision = get_slide_collision(get_slide_count()-1).collider
		if colision.is_in_group("Enemies"):
			is_alive = false
			on_death_fx()
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")
		dir = 1
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
		dir = -1
	else:
		$Sprite.play("Idle")
		friction = true 
	shoot(direction*dir)
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			$Jump_fx.play()
		if friction:
			motion.x = lerp(motion.x, 0, 0.2)

	else:
		if motion.y <= 0:
			$Sprite.play("Jump")
		elif motion.y == 0:
			$Sprite.play("Idle")
		else:
			$Sprite.play("Fall")
		
		if friction:
			motion.x = lerp(motion.x, 0, 0.05)
		
	motion = move_and_slide(motion, UP)

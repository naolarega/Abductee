extends KinematicBody2D

var speed = 100
var jump = false
var jump_height = 150

func user_input(delta):
	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-speed * delta, 0))
		if !$AnimatedSprite.flip_h:
			$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2(speed * delta, 0))
		if $AnimatedSprite.flip_h:
			$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("jump") and !jump:
		jump = true
	elif Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right"):
		$AnimatedSprite.play("idle")

func _physics_process(delta):
	user_input(delta)
	if jump:
		jump_height = lerp(jump_height, 0, 0.1)
		move_and_collide(Vector2(0, -(jump_height * delta)))
	if jump_height as int == 0:
		jump = false
		jump_height = lerp(0, jump_height, 0.1)
	if !jump:
		move_and_collide(Vector2(0, jump_height * delta))
	print(jump_height)

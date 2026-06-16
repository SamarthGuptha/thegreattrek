extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


const WALK_SPEED = 150
const JUMP_VELOCITY = -350.0
const SPRINT_SPEED = 275


func _physics_process(delta: float) -> void:
	var current_speed = WALK_SPEED
	
	if Input.is_action_pressed("Sprint"): 
		current_speed = SPRINT_SPEED	
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite_2d.animation = "jump"

	var direction := Input.get_axis("Left", "Right")
	if direction != 0:
		if Input.is_action_pressed("Sprint"):
			animated_sprite_2d.animation = "run"
		else:
			animated_sprite_2d.animation = "walk"
	else:
		animated_sprite_2d.animation = "idle"
	if direction:
		velocity.x = direction * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)

	move_and_slide()
	
	if direction == 1: animated_sprite_2d.flip_h = false
	elif direction == -1: animated_sprite_2d.flip_h = true

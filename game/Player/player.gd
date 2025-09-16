class_name Player extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var speed := 300.0
var viewport_size: Vector2
var gravity := 15.0
var max_fall_velocity := 1000.0
var jump_velocity := -800

func _ready() -> void:
	viewport_size = get_viewport_rect().size

func _process(delta: float) -> void:
	if velocity.y > 0:
		if animation_player.current_animation != "fall":
			animation_player.play("fall")
			print("play fall animation")
	elif velocity.y < 0:
		if animation_player.current_animation != "jump":
			animation_player.play("jump")
			print("play jump animation")

func _physics_process(delta: float) -> void:
	velocity.y += gravity
	if velocity.y > max_fall_velocity:
		velocity.y = max_fall_velocity
	
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	
	var margin = 20
	if global_position.x > viewport_size.x + margin:
		global_position.x = -margin
	if global_position.x < -margin:
		global_position.x = viewport_size.x + margin

func jump() -> void:
	velocity.y = jump_velocity

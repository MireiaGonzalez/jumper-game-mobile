class_name GameCamera extends Camera2D

var viewport_size: Vector2
var player: Player = null
var limit_bottom_distance = 420

func _ready() -> void:
	viewport_size = get_viewport_rect().size
	global_position.x = get_viewport_rect().size.x / 2
	
	limit_bottom = viewport_size.y
	limit_left = 0
	limit_right = viewport_size.x

func _process(delta: float) -> void:
	if player:
		if limit_bottom > player.global_position.y + limit_bottom_distance:
			limit_bottom = player.global_position.y + limit_bottom_distance

func _physics_process(delta: float) -> void:
	if player:
		global_position.y = player.global_position.y

func setup_camera(_player: Player) -> void:
	if _player:
		player = _player

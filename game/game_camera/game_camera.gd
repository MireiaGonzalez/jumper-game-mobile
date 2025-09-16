class_name GameCamera extends Camera2D

var player: Player = null

func _ready() -> void:
	global_position.x = get_viewport_rect().size.x / 2

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if player:
		global_position.y = player.global_position.y

func setup_camera(_player: Player) -> void:
	if _player:
		player = _player

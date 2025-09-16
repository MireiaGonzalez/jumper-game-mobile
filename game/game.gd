extends Node2D

var camera_scene: PackedScene = preload("res://game/game_camera/game_camera.tscn")
var camera: GameCamera = null

func _ready() -> void:
	camera = camera_scene.instantiate() as GameCamera
	camera.setup_camera($Player)
	add_child(camera)

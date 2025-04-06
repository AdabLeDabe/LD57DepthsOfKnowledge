extends Node2D
class_name CrumbledWeed

@export var speed = 5
@export var max_rotation_speed = 10
var rotation_speed = 0
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rotation = rng.randf_range(0.0, 360.0)
	rotation_speed = rng.randi_range(-max_rotation_speed, max_rotation_speed)
	var scale_size = rng.randf_range(1.0, 1.5)
	scale = Vector2(scale_size, scale_size)

func _process(delta: float) -> void:
	rotation += rotation_speed * delta
	position += Vector2.DOWN * speed * delta
	if (position.y > 1500):
		queue_free()

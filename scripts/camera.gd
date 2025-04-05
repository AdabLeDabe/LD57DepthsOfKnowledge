extends Node2D

@export var speed = 5
var direction = Vector2.ZERO
var max_zoom = 8
var min_zoom = 2
var current_zoom = 4

func _ready() -> void:
	current_zoom = $Camera2D.zoom.x

func _process(delta) -> void:
	handle_movement(delta)
	handle_zoom(delta)

func handle_movement(delta) -> void:
	direction = Vector2.ZERO
	if (Input.is_action_pressed("up")):
		direction += Vector2.UP
	if (Input.is_action_pressed("down")):
		direction += Vector2.DOWN
	if (Input.is_action_pressed("left")):
		direction += Vector2.LEFT
	if (Input.is_action_pressed("right")):
		direction += Vector2.RIGHT
	var movement = direction * (speed * delta)
	position += movement

func handle_zoom(delta) -> void:
	if (Input.is_action_just_pressed("zoom_in") and current_zoom < max_zoom):
		current_zoom += 0.25
	if (Input.is_action_just_pressed("zoom_out") and current_zoom > min_zoom):
		current_zoom -= 0.25
	$Camera2D.zoom = Vector2(current_zoom, current_zoom)

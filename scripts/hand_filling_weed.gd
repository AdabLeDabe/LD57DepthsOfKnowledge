extends Node2D

@export var speed = 1
@export var amplitude = 1
var thumb_offset = 0
var thumb_original_pos = Vector2.ZERO
var delta_total = 0.0

func _ready() -> void:
	thumb_original_pos = $thumb.position

func _process(delta) -> void:
	delta_total += delta * speed
	delta_total = fmod(delta_total, PI * 2.0)
	position = get_global_mouse_position()
	thumb_offset = sin(delta_total)
	if (Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		$thumb.position = Vector2(thumb_original_pos.x + (thumb_offset * amplitude), thumb_original_pos.y)

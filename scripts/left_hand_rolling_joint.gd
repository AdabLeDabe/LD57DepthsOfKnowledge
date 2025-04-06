extends Node2D

var thumb_offset = 0
var amplitude = 4
var max_offset = 12
var thumb_original_pos = Vector2.ZERO

func _ready() -> void:
	thumb_original_pos = $Thumb.position

func _process(delta: float) -> void:
	position = Vector2(get_global_mouse_position().x, position.y)
	if (position.x > 12):
		position.x = 12
	if (position.x < -305):
		position.x = -305
	move_thumb()

func move_thumb() -> void:
	if (Input.is_action_just_pressed("mouse_wheel_up")):
		thumb_offset -= amplitude
	if (Input.is_action_just_pressed("mouse_wheel_down")):
		thumb_offset += amplitude
	if (thumb_offset > max_offset):
		thumb_offset = max_offset
	if (thumb_offset < -max_offset):
		thumb_offset = -max_offset
	$Thumb.position = Vector2(thumb_original_pos.x, thumb_original_pos.y + thumb_offset)

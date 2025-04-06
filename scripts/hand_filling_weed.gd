extends Node2D

@export var speed = 1
@export var amplitude = 1
@export var crumbled_weed_speed = 5
@export var crumbled_weed_max_rotation_speed = 10
var crumbled_weed_scene = preload("res://scenes/crumbled_weed.tscn")
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
		if ($weedTimer.is_stopped()):
			$weedTimer.start()
		$thumb.position = Vector2(thumb_original_pos.x + (thumb_offset * amplitude), thumb_original_pos.y)
	else:
		if (!$weedTimer.is_stopped()):
			$weedTimer.stop()

func _on_timer_timeout() -> void:
	var crumbled_weed : CrumbledWeed = crumbled_weed_scene.instantiate()
	crumbled_weed.global_position = $thumb/weedSpawnPoint.global_position
	crumbled_weed.speed = crumbled_weed_speed
	crumbled_weed.max_rotation_speed = crumbled_weed_max_rotation_speed
	get_tree().root.add_child(crumbled_weed)

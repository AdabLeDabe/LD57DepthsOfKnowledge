extends Node2D

var is_mouse_hovering = false
signal button_clicked
signal mouse_start_hovering
signal mouse_stop_hovering

func _on_mouse_entered() -> void:
	$AnimatedSprite2D.play()
	if (!is_mouse_hovering):
		is_mouse_hovering = true
		emit_signal("mouse_start_hovering")

func _on_mouse_exited() -> void:
	$AnimatedSprite2D.stop()
	if (is_mouse_hovering):
		is_mouse_hovering = false
		emit_signal("mouse_stop_hovering")

func _process(delta: float) -> void:
	if (is_mouse_hovering and Input.is_action_just_pressed("mouse_left_click")):
		emit_signal("button_clicked")

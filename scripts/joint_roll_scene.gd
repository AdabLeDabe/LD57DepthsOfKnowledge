extends Node2D

@export var joint : Joint

func _on_joint_weed_threshold_met() -> void:
	$RollButton.visible = true

func _on_roll_button_mouse_start_hovering() -> void:
	$HandFillingWeed.visible = false

func _on_roll_button_mouse_stop_hovering() -> void:
	$HandFillingWeed.visible = true

func _on_roll_button_clicked() -> void:
	joint.set_phase_one()
	$RollButton.queue_free()
	$HandFillingWeed.queue_free()

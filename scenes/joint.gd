extends Node2D
class_name Joint

var weed_stacks = []
var phase = 0
signal weed_threshold_met
var is_threshold_met = false

func _ready() -> void:
	weed_stacks.append($WeedStack)
	weed_stacks.append($WeedStack2)
	weed_stacks.append($WeedStack3)
	weed_stacks.append($WeedStack4)
	weed_stacks.append($WeedStack5)
	weed_stacks.append($WeedStack6)
	weed_stacks.append($WeedStack7)
	weed_stacks.append($WeedStack8)
	weed_stacks.append($WeedStack9)
	weed_stacks.append($WeedStack10)
	get_weed_stacks()

func _process(delta: float) -> void:
	if check_threshold_met() and !is_threshold_met and phase == 0:
		emit_signal("weed_threshold_met")
		is_threshold_met = true

func check_threshold_met() -> bool:
	for n in weed_stacks.size():
		if weed_stacks[n].stack_nb < 2:
			return false
	return true

func _on_timer_timeout() -> void:
	get_weed_stacks()

func get_weed_stacks() -> Array:
	var stacks = []
	for n in weed_stacks.size():
		stacks.append(weed_stacks[n].stack_nb)
	#print_debug(stacks)
	return stacks

func set_phase_one() -> void:
	print_debug("phase 1???")
	phase = 1
	disable_stacking()
	$JointSpritePhase0.queue_free()
	$JointSpriteBackPhase1.visible = true
	$JointRollPhase1Step1.visible = true
	$LeftHandRollingJoint.visible = true
	$RightHandRollingJoint.visible = true

func disable_stacking() -> void:
	for n in weed_stacks.size():
		weed_stacks[n].can_stack = false

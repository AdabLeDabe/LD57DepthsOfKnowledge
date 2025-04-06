extends Node2D
class_name Joint

var weed_stacks = []
var joint_roll_steps = []
var current_step = 0
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
	joint_roll_steps.append($JointRollPhase1Step1)
	joint_roll_steps.append($JointRollPhase1Step2)
	joint_roll_steps.append($JointRollPhase1Step3)
	joint_roll_steps.append($JointRollPhase1Step4)
	joint_roll_steps.append($JointRollPhase1Step5)
	joint_roll_steps.append($JointRollPhase1Step6)
	joint_roll_steps.append($JointRollPhase1Step7)
	joint_roll_steps.append($JointRollPhase1Step8)
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
	phase = 1
	disable_stacking()
	$JointSpritePhase0.queue_free()
	$JointSpriteBackPhase1.visible = true
	joint_roll_steps[current_step].visible = true
	$LeftHandRollingJoint.visible = true
	$LeftHandRollingJoint.enabled = true
	$RightHandRollingJoint.visible = true
	$RightHandRollingJoint.enabled = true

func set_phase_two() -> void:
	phase = 2
	$LeftHandRollingJoint.queue_free()
	$RightHandRollingJoint.thumb_offset = 0
	$RightHandRollingJoint.enabled = false

func disable_stacking() -> void:
	for n in weed_stacks.size():
		weed_stacks[n].can_stack = false

func _on_roll_progressed() -> void:
	if (phase == 1 and current_step < joint_roll_steps.size() - 1):
		joint_roll_steps[current_step].visible = false
		current_step += 1
		joint_roll_steps[current_step].visible = true
		if (current_step == 1):
			weed_stacks[6].visible = false
			weed_stacks[7].visible = false
			weed_stacks[8].visible = false
			weed_stacks[9].visible = false
		if (current_step == 2):
			weed_stacks[3].visible = false
			weed_stacks[4].visible = false
			weed_stacks[5].visible = false
		if (current_step == 3):
			weed_stacks[0].visible = false
			weed_stacks[1].visible = false
			weed_stacks[2].visible = false
		if (current_step > 3):
			$JointSpriteBackPhase1.visible = false
	if (current_step == 6):
		set_phase_two()

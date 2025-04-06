extends Node2D
class_name WeedStack

var weed_texture = preload("res://assets/weed.png")
var rng = RandomNumberGenerator.new()
@export var stack_nb = 0.0
@export var left_stack : WeedStack
@export var right_stack : WeedStack
@export var can_stack = true

func add_weed_stack(stack_amount) -> void:
	stack_nb += stack_amount

func add_weed_sprite(scale_base = 0.5) -> void:
	var weed_sprite : Sprite2D = Sprite2D.new()
	weed_sprite.texture = weed_texture
	weed_sprite.position = Vector2(rng.randf_range(-20.0, 20.0), rng.randf_range(-20.0, 20.0))
	weed_sprite.rotation = rng.randf_range(0, 360)
	weed_sprite.scale = Vector2(scale_base + stack_nb / 20, scale_base + stack_nb / 20)
	add_child(weed_sprite)

func _on_area_entered(area: Area2D) -> void:
	if (area.is_in_group("weed") and can_stack):
		add_weed_stack(1)
		add_weed_sprite()
		spread_stack()
		area.get_parent().queue_free()

func spread_stack():
	if (left_stack != null):
		left_stack.add_weed_stack(0.5)
		left_stack.add_weed_sprite(0.25)
		if (left_stack.left_stack != null):
			left_stack.left_stack.add_weed_stack(0.25)
	if (right_stack != null):
		right_stack.add_weed_stack(0.5)
		right_stack.add_weed_sprite(0.25)
		if (right_stack.right_stack != null):
			right_stack.right_stack.add_weed_stack(0.25)

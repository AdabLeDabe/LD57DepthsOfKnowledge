extends Node2D

var weed_texture = preload("res://assets/weed.png")
var rng = RandomNumberGenerator.new()

func add_weed_stack() -> void:
	var weed_sprite : Sprite2D = Sprite2D.new()
	weed_sprite.texture = weed_texture
	weed_sprite.position = Vector2(rng.randf_range(-20.0, 20.0), rng.randf_range(-20.0, 20.0))
	weed_sprite.rotation = rng.randf_range(0, 360)
	add_child(weed_sprite)

func _on_area_entered(area: Area2D) -> void:
	if (area.is_in_group("weed")):
		add_weed_stack()
		area.get_parent().queue_free()

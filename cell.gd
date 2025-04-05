extends Node2D

var cell_texture = preload("res://assets/cell.png")
var selected_cell_texture = preload("res://assets/selected_cell.png")
var is_selected = false

func _on_mouse_entered() -> void:
	is_selected = true

func _on_mouse_exited() -> void:
	is_selected = false

func _process(delta) -> void:
	if (is_selected):
		$Sprite2D.texture = selected_cell_texture
	else:
		$Sprite2D.texture = cell_texture

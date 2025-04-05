extends Node2D

@export var width = 10
@export var height = 10
var cell = preload("res://scenes/cell.tscn")

func _ready() -> void:
	for x in width:
		for y in height:
			var cell_instance = cell.instantiate()
			add_child(cell_instance)
			cell_instance.position = Vector2(x * 16 + 8, y * 16 + 8)
